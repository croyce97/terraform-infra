## Terraform AWS demo repo

Repo này dùng để demo Terraform trên AWS với:
- modules chung trong `modules/` (EC2, S3)
- môi trường trong `environments/dev` và `environments/prod`
- remote state riêng cho từng môi trường (S3 + DynamoDB lock), tạo bằng script `script/remote-state.sh`.

### Cấu trúc

- `modules/ec2`: module tạo EC2 instance đơn giản
- `modules/s3`: module tạo S3 bucket demo
- `environments/dev`: cấu hình Terraform cho môi trường dev
- `environments/prod`: cấu hình Terraform cho môi trường prod

### Chuẩn bị remote state

1. Chỉnh biến trong `script/remote-state.sh`:
   - `REGION`
   - `PROJECT`
   - `ENV` (`dev` hoặc `prod`)
2. Chạy:

```bash
cd script
./remote-state.sh
```

3. Script sẽ in ra `bucket`, `dynamodb_table`, `region`. Copy các giá trị đó và cập nhật lại trong file `backend.tf` tương ứng trong:
   - `environments/dev/backend.tf`
   - `environments/prod/backend.tf`

### Cách chạy

Ví dụ với môi trường dev:

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

Tương tự cho prod:

```bash
cd environments/prod
terraform init
terraform plan
terraform apply
```

