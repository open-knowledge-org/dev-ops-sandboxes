SNAPSHOOT=$(date +"%Y-%m-%d_%H%M%S")
cd /opt/ci/
sudo zip -r jenkins-config-$SNAPSHOOT.zip ./configs/*
sudo ls -nat ./configs | head -n 1
aws s3 cp jenkins-config-$SNAPSHOOT.zip s3://<your-bucket>/ci/jenkins/full/ --profile <your-profile>
mkdir -p /opt/backup/
sudo mv jenkins-config-$SNAPSHOOT.zip /opt/backup/
