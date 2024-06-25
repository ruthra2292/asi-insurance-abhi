pipeline {
    environment {
    registry = "selvam2292/asi_insurance_java:1.0"
    registryCredential = 'selvam2292'
    dockerImage = ''
    }
    agent any

    stages {             

         stage('Step1:Maven build'){
	    steps{
		sh "mvn clean install -DskipTests"
	    	}
	    }	
         stage('Step2:Building Docker Image') {
            steps {
                sh 'docker build -t selvam2292/asi_insurance_java:${BUILD_NUMBER} .'
                }
            }        
        stage('Step3:Push image to docker hub ') {
            steps {
                script {
                    docker.withRegistry( '', 'Dockerhub_id' ) {
                        sh 'docker push selvam2292/asi_insurance_java:${BUILD_NUMBER}'
                    }
                }

            }

        }

        stage('Step4:Deploy our application') {
            steps{
                sh 'docker run -d --name docker_project${BUILD_NUMBER} -p 8000:80 selvam2292/asi_insurance_java:${BUILD_NUMBER}'
		echo "Application started on port:8080 {http}"
                    }
                }
    }
}
