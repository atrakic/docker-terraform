node("master") {

    stage("Prep") {
        deleteDir() // Clean up the workspace
        checkout scm
        withCredentials([file(credentialsId: 'tfvars', variable: 'tfvars')]) {
            sh "cp $tfvars terraform.tfvars"
        }
        sh "terraform init --get=true"
    }

    stage("Plan") {
        sh "terraform plan -out=plan.${BUILD_NUMBER} -no-color"
    }

    if (env.BRANCH_NAME == "master") {
        stage("Apply") {
            input 'Do you want to apply this plan?'
            sh "terraform apply -no-color plan.${BUILD_NUMBER}"
        }
    }
}
