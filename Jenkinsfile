pipeline {
    agent any
    
    parameters {
        string(name: 'env', defaultValue: 'test', description: 'Workspace/environment file to use for deployment')
        string(name: 'region', defaultValue: 'us-gov-west-1', description: 'AWS region to deploy resources to')
        string(name: 'project', defaultValue: 'smst', description: 'Name of project')
        choice(name: 'Action', description: 'Please review the plan', choices: ['apply', 'destroy'])
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')

    }
    /// checking out repo  from github
    stages {
        stage('Git') {
            steps {
                step([$class: 'WsCleanup'])
                checkout scm
            }
        }
   /* // running the terraform  plan to output what will be created 
        stage('Plan') {
            steps {
                script {
                    currentBuild.displayName = params.version
                }/*
                
                sh "pwd"
                sh 'terraform init -input=false'
                sh "terraform plan -input=false -out tfplan -var 'region=${params.region}' -var 'env=${params.env}' -var 'project=${params.project}' "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
    /* // stage for approval  to create  resources 
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }/*

            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        } */

 /* // this is where the magic happens ( where resources are created)
        stage('Apply') {
            steps {
                sh "terraform ${params.Action} -var 'region=${params.region}'  -var 'env=${params.env}' -var 'project=${params.project}' -auto-approve"
                //-input=false tfplan"
            }
        }/*
  // execute Ansible
        stage('execute'){
            steps{
                ansiblePlaybook credentialsId: 'b9c00e6d-3fe8-4911-9780-b01c58ab7ac6', installation: 'ansible2', inventory: 'inv.dev', playbook: 'qlik_replicate.yml'
            }
        }

    }

    post {
        always {
            archiveArtifacts artifacts: 'tfplan.txt'
        }
    }
}
