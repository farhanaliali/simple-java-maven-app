pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
    
    environment {
     dockerKill="sudo docker rm -f simple-java"
     dockerRun="sudo docker run  --name 	simple-java  farhanluckali/java-simple:lastest"
	 
	 registry = "farhanluckali/java-simple" 
     registryCredential = 'dockerhub-farhanali' 
     dockerImage = '' 
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
		stage ('Push to Docker hub') {
		
			steps {
			     script {
							docker.withRegistry('', registryCredential)   {
							dockerImage.push()
							}
				 
				 }
			}	
		}	
        stage('run docker on remote ') {
            steps {
              
             sshagent(['farhanali']) {
                sh 'ssh -o StrictHostKeyChecking=no  farhanali@192.168.70.235 ${dockerKill}'
                sh 'ssh -o StrictHostKeyChecking=no  farhanali@192.168.70.235 ${dockerRun}'
           }
           }
        }     
        }
    }

