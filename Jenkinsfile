pipeline {
	agent {
		node {
			label "built-in"
			customWorkspace "/mnt/kkk"
		}
	}
	
	stages {
		stage ('clone repo') {
			steps {
			    sh "rm -rf game-of-life*"
				sh "git clone https://github.com/HEMANT-111/loginwebapp.git"
			}
		}
		
		stage ('create build') {
			steps {
			dir ('/mnt/kkk/loginwebapp') {
			    
			    sh "mvn clean install"
			    	
			
			}
			}
		}
		stage ("chmod") {
			steps {
				dir ("/mnt/kkk/loginwebapp//target") {
					sh "chmod -R 777 LoginWebApp.war"
				}
			}
		}
		
		
		stage ('copy app slave-1'){
			
			steps {
				dir ("/mnt/compose")
				sh "mkdir file1"
				sh "cp /mnt/kkk/loginwebapp/target/LoginWenApp.war /mnt/compose/file-1"
				sh "cp /mnt/kkk/loginwebapp/Dockerfile /mnt/compose/file-1"
				sh "cp /mnt/kkk/loginwebapp/Docker-compose.yml /mnt/compose/file-1"
				
			
			}
		}
		
		stage ('deploy app using docker compose slave-1'){
			steps {
				dir ("/mnt/compose") {
				sh "sudo docker-compose up -d"	
				}
			}
		}
	}
}
