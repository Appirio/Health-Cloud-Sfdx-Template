#!/bin/bash

#!/bin/bash

# Create the scratch org
sfdx force:org:create -f config/healthcloud-scratch-def.json -a HCADK -s -d 30

# Install the package
sfdx force:package:install --package 04t1C000000pQWg -w 50
# 216: --package 04t1C000000AoPO
# 218: --package 04t1C000000ApHp
# 220: --package 04t1C000000Apj5
# 222: --package 04t1C000000Y1Qe

#Install the unmanaged package extension
sfdx force:package:install --package 04t5w0000048cTh -w 30

# Deploy the metadata packages
#sfdx force:mdapi:deploy --deploydir mdapi-source/app-config -w 20
#sfdx force:mdapi:deploy --deploydir mdapi-source/org-config -w 20

# Deploy the source code (will only work in scratch orgs)
sfdx force:source:push -f -w 20

# Assign the permissions
sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin
sfdx force:user:permset:assign -n HealthCloudApi
sfdx force:user:permset:assign -n HealthCloudFoundation
sfdx force:user:permset:assign -n HealthCloudLimited
sfdx force:user:permset:assign -n HealthCloudMemberServices
sfdx force:user:permset:assign -n HealthCloudSocialDeterminants
sfdx force:user:permset:assign -n HealthCloudStandard
sfdx force:user:permset:assign -n HealthCloudUtilizationManagement
sfdx force:user:permset:assign -n MilestoneStatus
#load users
#sfdx force:user:create --definitionfile config/user1-def.json
#sfdx force:user:create --definitionfile config/user2-def.json
#sfdx force:user:create --definitionfile config/user3-def.json
#sfdx force:user:create --definitionfile config/user4-def.json



#SFDX DMU plugin: https://github.com/forcedotcom/SFDX-Data-Move-Utility/wiki
#Data Extract from existing org; if needed
#sfdx sfdmu:run --sourceusername HCTrialOrg --targetusername csvfile -p data/sfdmu/
#sfdx force:data:soql:query -u HCADK -q "Select Id,AccountId,ContactId from AccountContactRelation"

#data load
#May get a prompt while loading: Say "y"
#"yes" command can be used to reply to those prompts; https://www.computerhope.com/unix/yes.htm
#yes | sfdx sfdmu:run --sourceusername csvfile --targetusername HCADK -p data/sfdmu/
#Send user password reset email
sfdx force:apex:execute -f config/setup.apex



sfdx force:org:open


#delete [select id from Case];
#delete [select id from Contact];
#delete [select id from Account];
#delete [select id from HealthCloudGA__ContactContactRelation__c];
#delete [select id from AccountContactRelation];

