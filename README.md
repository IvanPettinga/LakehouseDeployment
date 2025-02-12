# Data platform deployment IaC
The following code deploys a data platform on Microsoft Azure, with the corresponding required resources. The template deploys a synapse workspace, a storage account, a key vault and spark pools to run in the synapse workspace. It also contains powershell scripts to deploy triggers.

!**The code assumes an existing vnet with a subnet.**

# Layout
Azure-pipelines.yml triggers the following pipelines
  - storage.yml
  - kv.yml 
  - synapseworkspace.yml 
  - vm.yml 
  - sparkpools.yml

For each pipeline there is a corresponding bicep template and a parameter file. The bicep template runs a module which deploys the actual resource.
For example: storage.yml runs the code storage.bicep. storage.bicep has a parameter file storage.json. The storage.bicep file runs a nested bicep file which deploys the resource. 

 
