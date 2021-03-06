pipeline {
	agent any
	tools {
		maven 'Maven-3.3.1'
		jdk 'JDK1.8.0'
	}
    
	environment {
		CDA_SPARK_ROOM = "e54d06a0-223d-11e8-925b-e97814520571"
		DOCKER_REGISTRY_URL = "containers.cisco.com"
		DOCKER_REPOSITORY = "codeplayground"
	}
	
    stages {
		
        stage ('Build') {
        	// Clean, build, and run tests
            steps {
				
				notifyBuildStart()
                sh 'mvn clean org.jacoco:jacoco-maven-plugin:prepare-agent package'
				tagDocker()
				
            }
            // Make test results visible in Jenkins UI if the install step completed successfully
            post {
                success {
                    junit testResults: 'target/surefire-reports/**/*.xml', allowEmptyResults: true 
                }
            }
        }

        stage ('Quality Assurance') {
        
        	// Run these stages in parallel
        	parallel {
				
				// Run sonar scanner, and report to CDA
		        stage ('SonarQube Quality Scan') {
		        	steps {
						// Automatically detect maven project, no further config necessary
						sonarScan('Sonar')
		        	}
		        }
		        
		        // Upload the artifacts to artifactory
				stage ('Deploy Docker Image to Container Hub') {
					steps {
						pushDocker "", "docker-registry"
					}
				}
	        }
        }
		
    }
	post {
		always {
			notifyBuildEnd()
		}
	}
}
