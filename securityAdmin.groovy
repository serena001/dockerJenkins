#!groovy

import jenkins.model.*
import hudson.security.*

def jenkinsInstance=Jenkins.getInstance()

//Create administrator account with username and password
def hudsonPrivateSecurityRealm = new HudsonPrivateSecurityRealm(false)
hudsonPrivateSecurityRealm.createAccount("admin","admin")
jenkinsInstance.setSecurityRealm(hudsonPrivateSecurityRealm)

//Provide full control to the admininstrator account
def strategyFullControl = new FullControlOnceLoggedInAuthorizationStrategy()
jenkinsInstance.setAuthorizationStrategy(strategyFullControl)
jenkinsInstance.save()