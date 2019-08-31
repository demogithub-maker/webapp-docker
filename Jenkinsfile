#!/usr/bin/env groovy

final String TOMCAT_IMAGE = "webapp-using-tomcat"																			

node('master') {
	
	stage('Prepare') {
		deleteDir()
		checkout scm
	}
	
	stage('Build Docker Image') {
		try {
			docker.build(TOMCAT_IMAGE)
		}
		catch (Exception e) {
			currentBuild.result = 'FAILURE'
			notifyBitbucket()
			throw e
		}
	}
	
	stage("Install webapp") {
		docker.image(TOMCAT_IMAGE).withRun('-p 8080:8080') {c ->
			docker.image(TOMCAT_IMAGE).inside {
				sh "curl -i http://${hostIp(c)}:8080/SampleWebApp"
						
					}
		}
    }
}
