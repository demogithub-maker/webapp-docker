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
		try {
			docker.image('TOMCAT_IMAGE').withRun {c ->
			  sh "curl localhost:8080/SampleWebApp"
			}
		}
		}
    }
    
