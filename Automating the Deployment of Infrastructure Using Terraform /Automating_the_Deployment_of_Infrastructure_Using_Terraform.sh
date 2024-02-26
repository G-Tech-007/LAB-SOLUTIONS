

gcloud auth list

mkdir tfinfra

cd tfinfra


wget https://raw.githubusercontent.com/G-Tech-007/LAB-SOLUTIONS/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform%20/mynetwork.tf

wget https://raw.githubusercontent.com/G-Tech-007/LAB-SOLUTIONS/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform%20/provider.tf

wget https://raw.githubusercontent.com/G-Tech-007/LAB-SOLUTIONS/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform%20/terraform.tfstate

wget https://raw.githubusercontent.com/G-Tech-007/LAB-SOLUTIONS/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform%20/variables.tf


mkdir instance

cd instance

wget https://raw.githubusercontent.com/G-Tech-007/LAB-SOLUTIONS/main/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform%20/instance/main.tf

cd ..

terraform init

terraform fmt

terraform init

echo -e "mynet-us-vm\nmynetwork\n$ZONE" | terraform plan -var="instance_name=$(</dev/stdin)" -var="instance_network=$(</dev/stdin)" -var="instance_zone=$(</dev/stdin)"

echo -e "mynet-us-vm\nmynetwork\n$ZONE" | terraform apply -var="instance_name=$(</dev/stdin)" -var="instance_network=$(</dev/stdin)" -var="instance_zone=$(</dev/stdin)" --auto-approve
