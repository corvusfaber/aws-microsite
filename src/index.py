import json
import boto3

s3 = boto3.client('s3')

def handler(event, context):
    for record in event['Records']:

        print (record)
       

    return {
        'statusCode': 200,
        'body': json.dumps('File processed successfully!')
    }
