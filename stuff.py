
from boto.s3.connection import S3Connection
 
AWS_KEY = 'AKIAJS54DZQ6VHQE4MGA'
AWS_SECRET = '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'
aws_connection = S3Connection(AWS_KEY, AWS_SECRET)
bucket = aws_connection.get_bucket('friedbananasalbx2015swingsongs')
for file_key in bucket.list():
    print file_key.name
