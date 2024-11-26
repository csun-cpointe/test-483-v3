#!/bin/bash

echo "Enter repo url: "

read repoUrl

argocd app get test-483-v3 &> /dev/null

if [ $? -eq 0 ]
then
  echo "test-483-v3 is deployed"
else
  argocd app create test-483-v3 --dest-namespace test-483-v3 --dest-server https://kubernetes.default.svc --repo $repoUrl --path test-483-v3-deploy/src/main/resources --revision main --values values.yaml --values values-ci.yaml --sync-policy automated
fi

