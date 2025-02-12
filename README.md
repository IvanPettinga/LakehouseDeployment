# Data platform deployment IaC
The following code deploys a data platform on Microsoft Azure, with the corresponding required resources. The template deploys a synapse workspace, a storage account, a key vault and spark pools to run in the synapse workspace. It also contains powershell scripts to deploy triggers.

# Layout
Azure-pipelines.yml triggers the following pipelines
  - storage.yml > bicep module > bicep resource
  - kv.yml  > bicep module > bicep resource
  - synapseworkspace.yml  > bicep module > bicep resource
  - vm.yml  > bicep module > bicep resource
  - sparkpools.yml  > bicep module > bicep resource

 
