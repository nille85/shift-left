# shift-left
A demo using [Trivy](https://trivy.dev/) that includes SAST and SCA.

## Static Analysis Security Testing

### Source Code Scan

```bash
# Vulnerability Scanning
trivy filesystem --scanners vuln . --exit-code 1 --severity HIGH
# Secret Scanning
trivy filesystem --scanners secret . --exit-code 1 --severity HIGH
# Misconfiguration Scanning
trivy filesystem --scanners misconfig . --exit-code 1 --severity HIGH
```

### Create Docker Binary


```bash
# Build the Docker image
docker build -t nille85/nodejs-security-demo .

# Run the application
docker run -p 3000:3000 nille85/nodejs-security-demo

# Push the application to Docker Hub
docker push nille85/nodejs-security-demo
```

###  Binary Image Scan
```bash


# Pushed Image Scan
trivy image --format table --severity HIGH,CRITICAL nille85/nodejs-security-demo:latest

# Local Image Scan
docker run  -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.28.0 image --format table --severity HIGH,CRITICAL nodejs-security-demo:latest
```

## Create SBOM
```bash
# CycloneDX format
 trivy image --format cyclonedx --output sbom-result-cyclonedx.json nille85/nodejs-security-demo:latest

# SPDX format
 trivy image --format spdx --output sbom-result-spdx.json nille85/nodejs-security-demo:latest
 ```



## Pre-commit Hooks
* Make sure the pre-commit is executable: `chmod ug+x .git/hooks/pre-commit`

