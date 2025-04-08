@Library('roboshop') _

pipeline {
    agent {
          label 'workstation'
        }

    environment {
        component = 'catalogue'
    }

    stages {
        stage('Setup Catalogue') {
            steps {
                nodejs()
            }
        }
    }
}