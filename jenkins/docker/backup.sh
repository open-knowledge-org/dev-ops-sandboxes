SNAPSHOOT=$(date +"%Y-%m-%d_%H%M%S")
mkdir -p /opt/backup/temp
cd /opt/ci/configs/jenkins
for d in */ ; do
    if [ "$d" == "war/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "plugins/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "cache/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "caches/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "init.groovy.d/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "org.jenkinsci.plugins.github_branch_source.GitHubSCMProbe.cache/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "org.jenkinsci.plugins.github.GitHubPlugin.cache/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "updates/" ]; then
      echo "$d was skipped"
      continue
    elif [ "$d" == "tools/" ]; then
      echo "$d was skipped"
      continue
    elif [ -z "$(ls -A $d)" ]; then
      echo "$d is an empty directory, so it will be skipped"
      continue
    fi

    echo "$d will be backed up"   
    DIR_NAME=$(echo "$d" | sed -r 's/[/]+/_/g' )
    FILE_NAME=jenkins_${DIR_NAME}${SNAPSHOOT}.zip
    echo "Zip File: $FILE_NAME"
    sudo mkdir -p /opt/backup/${SNAPSHOOT}/

    if [ "$d" == "jobs/" ]; then
       sudo zip -r /opt/backup/${SNAPSHOOT}/${FILE_NAME} $d -x jobs/**/builds\* jobs/**/branches\* --exclude *.git* jobs/ci.zip
       echo 'jobs'
    else
       sudo zip -r /opt/backup/${SNAPSHOOT}/${FILE_NAME} $d* --exclude *.git*
    fi

done
sudo ls -nat /opt/backup/${SNAPSHOOT}
aws s3 sync /opt/backup/${SNAPSHOOT} s3://<your-bucket>/ci/jenkins/${SNAPSHOOT} --profile <your-profile>
sudo rm -R /opt/backup/${SNAPSHOOT}
