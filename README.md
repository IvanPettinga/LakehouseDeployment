# Microsoft Azure Synapse Deployment
The following code deploys a data platform on Microsoft Azure, with the corresponding required resources. The template deploys a synapse workspace, a storage account, a key vault and spark pools to run in the synapse workspace. It also contains powershell scripts to deploy triggers.

> [!NOTE]  
> The deployment assumes a vnet and subnet have already been deployed.

# Layout
Azure-pipelines.yml triggers the following pipelines
  - storage.yml
  - kv.yml 
  - synapseworkspace.yml 
  - vm.yml 
  - sparkpools.yml

For each pipeline there is a corresponding bicep template and a parameter file. The bicep template runs a module which deploys the actual resource.
For example: storage.yml runs the code storage.bicep. storage.bicep has a parameter file storage.json. The storage.bicep file runs a nested bicep file which deploys the resource. 

Illustration of layout

![Github IaC drawio](https://github.com/user-attachments/assets/e90b07ce-cda3-46cc-97c0-e244801b2180)
