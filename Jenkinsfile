#!/usr/bin/env groovy

final String tomcat = "tomcat"																			

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
		  def ansibleimg = docker.image(tomcat)
		      ansibleimg.inside() { c->
			  docker.image('tomcat').withRun('-p 8080:8080') {c ->
			    sh "curl -i http://localhost:8080/SampleWebApp"
			      
		 
			  }
		}
	}
}	
