# demo-opa

1. Install jenkins locally with docker:
```
docker pull jenkins/jenkins:2.180
```

2. Exec jenkins locally in the same folder. Use the same command to re-run jenkins server
```
docker run --name jenkins2.18 -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:2.180
```

3. Start jenkins locally
```
localhost:8080
```

4. To recover the jenkins password
```
docker exec -it jenkins2.18 bash
```

5. Inside the container
```
cat /var/jenkins_home/secrets/initialAdminPassword
```

7. To re-run the server:
```
docker run --name jenkins2.18 -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 jenkins/jenkins:2.180
```

## Creating docker worker-nodes for jenkins

Notes:

Do not forget to copy to docker container (jenkins worker node) the pem file to access into EC2
