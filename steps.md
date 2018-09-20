# Steps to Create

## GCP Kubernetes App

### Create Github Repo - `using hub`

```bash
git init
git add .
git commit -m 'init'
git create -d 'Multi-Kubernetes app sample'
```

### Link to Travis

- open https://travis-ci.org
- Sync Account
- Search for Multi-K8s
- Profile > Repositories > Multi-K8s - click `+`
- refresh page

### Create Google Cloud Project

- Project > New Project --> Create

### Set up Billing for Project

### Kubernetes Engine init

### Create Cluster

- Name it whatever you want ie. multi-cluster

### Create a Service Account

- GCP Nav Menu > IAM & Admin > Service Accounts > Create Service Account
- Service account name: travis-deployer
- Role: Kubernetes > Kubernetes Engine Admin
- Furnish a new private key > JSON
- SAVE & NEVER EXPOSE SAVED FILE!!!

### Download & Install the Travis CLI

- We're using a Docker container simply to make sure that you can use Ruby without installing it onto your system in case you don't have it already - ie. Windows

```bash
docker run -it -v $(pwd):/app ruby:2.3 sh

ls
cd app
ls
gem install travis --no-rdoc --no-ri
travis
travis login

Copy and rename json key to current directory volume - ie. ~/Downloads to multi-k8s/service-account.json
```

```bash
ls
travis encrypt-file service-account.json -r michael4reynolds/multi-k8s
```

Copy given `openssl` command and paste it into .travis.yml's before-install section

Remove service-account.json

```bash
rm -f service-account.json
ls

exit
```

Get Project Id from GCP > Nav > settings : Project ID

Get Default Data Zone from GCP > Nav > Kubenetes Engine > Clusters : Location
Get Cluster Name from GCP > Nav > Kubenetes Engine > Clusters : Name

Add Docker username and password to environment variables on Travis CI > My Repos > multi-k8s > Settings > Environment variables
