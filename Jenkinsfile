pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                
                git 'https://github.com/farhanaliali/simple-java-maven-app.git'

                // Run Maven on a Unix agent.
                sh "mvn -B -DskipTests clean package"
            }
        }
        stage('Build docker image') {
            steps {
         sh 'pwd'   
         sh' sudo docker build -t java-simple .'
            }
        }
        stage('run docker on remote ') {
            steps {
                 script {
            def dockerRun="sudo docker run  --name 	hellow  hello-world"
             }
             sshagent(['farhanali']) {
                sh 'ssh -o StrictHostKeyChecking=no  farhanali@192.168.70.235 ${dockerRun} '
           }
           }
        }     
        }
    }
