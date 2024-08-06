#####################################################################
###################### bucket infrastructure ########################
#####################################################################
resource "aws_s3_bucket" "web-repository" {
  bucket = var.bucket_name

  tags = {
    Name        = "mf-webcontent"
    Environment = "test-account"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  depends_on = [aws_s3_bucket.web-repository]

  bucket = aws_s3_bucket.web-repository.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {

  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.s3_distribution.iam_arn] 
    }

    actions = [
      "s3:GetObject"
    ]

    sid = "PublicReadGetObject"

    resources = [aws_s3_bucket.web-repository.arn,
      "${aws_s3_bucket.web-repository.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_public_access_block" "web-repository" {
  bucket = aws_s3_bucket.web-repository.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#####################################################################
######################### website content ###########################
#####################################################################
# Configure 
resource "aws_s3_bucket_website_configuration" "mf_s3_website_configuration" {
  bucket = aws_s3_bucket.web-repository.id

  index_document {
    suffix = var.start_page
  }

  error_document {
    key = var.error_page
  }
}

resource "aws_s3_object" "webindex" {
  bucket = aws_s3_bucket.web-repository.id
  key    = var.start_page
  source = var.start_page_dir

  content_type = "text/html"
  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5(var.start_page_dir)
}

resource "aws_s3_bucket_notification" "file_bucket_notification" {
  bucket = aws_s3_bucket.web-repository.id

  queue {
    events = ["s3:ObjectCreated:*"]
    filter_prefix = "uploads/"
    queue_arn = aws_sqs_queue.file_processing_queue.arn
  }

  depends_on = [aws_sqs_queue_policy.file_processing_queue_policy]
}

resource "aws_sqs_queue" "file_processing_queue" {
  name = "file-processing-queue"
}

resource "aws_sqs_queue_policy" "file_processing_queue_policy" {
  queue_url = aws_sqs_queue.file_processing_queue.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "SQS:SendMessage",
        Resource = aws_s3_bucket.web-repository.arn
        Condition = {
          ArnLike = {
            "aws:SourceArn" = aws_s3_bucket.web-repository.arn
          }
        }
      }
    ]
  })
}
