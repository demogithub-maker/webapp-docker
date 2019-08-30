#!/usr/bin/env groovy

final String tomcat = "webapp-using-tomcat"																			

node('master') {
	
	stage('Prepare') {
		deleteDir()
		checkout scm
	}
	
	stage('Build Docker Image') {
		try {
			docker.build(tomcat)
		}
		catch (Exception e) {
			currentBuild.result = 'FAILURE'
			notifyBitbucket()
			throw e
		}
	}
	
	stage("Install webapp") {
		docker.image(tomcat).withRun('-p 8081:8081') {c ->
		sh "curl -i http://localhost:8080/SampleWebApp"
							}
				}
    }
	
