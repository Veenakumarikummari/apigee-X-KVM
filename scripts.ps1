# write-output Apigee Artifacts
$token = $env:TOKEN
$org = $env:ORG
$baseURL = "https://apigee.googleapis.com/v1/organizations/"
$headers = @{Authorization = "Bearer $token"}

# Set your GitHub repository information
$repositoryOwner = "veenakumari.kummari@easystepin.com"
$repositoryName = "apigee-X-KVM"
$branchName = "main"

# Clone the repository
git clone https://github.com/Veenakumarikummari/apigee-X-KVM.git
cd apigee-X-KVM

 

# Read JSON files
$jsonFiles = apiconfig/env/eval/kvms.json -Recurse
$jsonContent = Get-Content -Path$jsonFiles -Raw
$apiUrl = "https://apigee.googleapis.com/v1/organizations/esi-apigee-x-394004/environments/eval/keyvaluemaps"
$headers = @{
	"Authorization" = "Bearer $token"
	"Content-Type" = "application/json"
}



response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $jsonContent



Write-Host "uploded"


