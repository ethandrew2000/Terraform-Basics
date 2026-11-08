# Running the class API

This configuration uses the class Docker Hub image `bubbaj/it4200-fall-2026:latest`.
It maps the API's container port 8000 to http://localhost:8000 on the host.

## Prerequisites

Install Terraform and start Docker Engine (or Docker Desktop with Linux containers).

## Commands

```sh
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
curl http://localhost:8000/
curl http://localhost:8000/random-fact
terraform destroy
```

The root endpoint returns the IT4200 welcome message. The random-fact endpoint
returns JSON containing a fact.

The repository's **Verify Terraform and API** GitHub Actions workflow runs
formatting, initialization, validation, planning, apply, HTTP checks of both
endpoints, and destroy on an Ubuntu runner. Its logs provide the verification
results. The API runs on that runner during the test; it is not a permanent
public deployment.

Terraform state, downloaded providers, and saved plans should not be committed.
