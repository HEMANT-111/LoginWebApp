pipeline {
    agent {
        label{
            label "built-in"
            customWorkspace "/mnt/docker"
            
        }
    }
    environment {
        maven_home = "/mnt/maven/apache-maven-3.9.6"
        PATH = "$PATH:$maven_home/bin"
    }
   
	stages {
           /* stage ("clone") {
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
         stage ("ssh") {
		 steps {
			 dir ("/mnt/docker/loginwebapp/target") {
        sh "scp -i '/mnt/linuxkp1.pem' *.war ec2-user@172.31.2.242:/mnt"
			 }
		 }
	 }
		stage ("deploy") {
			steps {
				dir ("/mnt/docker/loginwebapp") {
	sh "scp -i '/mnt/linuxkp1.pem' Dockerfile ec2-user@172.31.2.242:/mnt"
				}
        			 
		 }
		 }*/
		stage ("image-container") {
			steps {
			agent {
				node {
					label "dev"
					customWorkspace "/mnt"
				}
			}
			}
		}
			stage ("img-contair") {
				steps {
					sh "sudo  docker build -t mytomcat ."
					sh "sudo docker run --name container333 -itdp 8484:8080 mytomcat"
				}
			}
	
	 

          
    }
}
}
