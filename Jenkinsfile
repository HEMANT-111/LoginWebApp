pipeline {
    agent {
        label{
            label "dev-H"
            customWorkspace "/mnt/docker"
            
        }
    }
    environment {
        maven_home = "/mnt/maven/apache-maven-3.9.6"
        PATH = "$PATH:$maven_home/bin"
    }
   
	stages {
            stage ("clone") {
                steps {
	       sh "sudo rm -rf /mnt/docker/*"
               sh "git clone https://github.com/HEMANT-111/loginwebapp.git"
            }
           }
           stage ("build") {
               steps {
		dir ("/mnt/docker/loginwebapp"){
		
                  sh "mvn clean install"
	          	}
            } 
           }
         stage ("containr-create") {
		 steps {
        /*sh "sudo docker kill container333"
        sh "sudo docker rm container333"*/
        sh "sudo docker run --name container333 -itdp 8888:8080 tomcat:latest"
		 }
	 }

           stage ("deploy") {
               steps {
                   dir ("/mnt/docker/loginwebapp")
                   sh "sudo docker cp LoginWebApp.war container333:/usr/local/tomcat/webapps"
               }
           }
    }
}
