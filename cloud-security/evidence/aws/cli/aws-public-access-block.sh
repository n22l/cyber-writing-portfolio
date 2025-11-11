# Enforce S3 Block Public Access at the account level
aws s3control put-public-access-block \
  --account-id <account_id> \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

# Verify account-level status
aws s3control get-public-access-block --account-id <account_id>
