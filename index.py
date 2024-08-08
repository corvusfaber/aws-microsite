import json
import boto3

s3 = boto3.client('s3')

def handler(event, context):
    for record in event['Records']:

        # Parse the body of the SQS message
        body = json.loads(record['body'])
        print(body)
        # for item in body['Records']:
        #     bucket = item['s3']['bucket']
        #     object = item['s3']['object']
        #     print(bucket)
        #     print(object)

    return {
        'statusCode': 200,
        'body': json.dumps('File processed successfully!')
    }
