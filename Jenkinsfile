pipeline {
    agent {
        label{
            label "built-in"
            customWorkspace "/mnt/compose"
            
        }
    }
    environment {
        maven_home = "/mnt/maven/apache-maven-3.9.6"
        PATH = "$PATH:$maven_home/bin"
    }
   
	stages {
           stage ("clone") {
                steps {
	       sh "sudo rm -rf /mnt/compose/*"
               sh "git clone https://github.com/HEMANT-111/loginwebapp.git"
            }
           }
           stage ("build") {
               steps {
		dir ("/mnt/compose/loginwebapp"){
		
                  sh "mvn clean install"
	          	}
            } 
           }
        stage ("war-file") {
		 steps {
			 dir ("/mnt/docker/loginwebapp/target") {
              sh "cp *.war /mnt/compose/loginwebapp"
			 }
		 }
	 }
		stage ("compose") {
			steps {
				sh "sudo docker-compose up -d"
			}
		}
			
	}
}		
