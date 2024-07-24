# crossplane-edinburgh
Examples from CNCF meetup talk

Provides 3 examples of Crossplane usage

1. Simple deployment of sqs queue - naked-sqs.yaml
2. Complex deployment using standard Composite Resource Definitions - XRDS
3. Complex deployment using go template functions - golangtemplate
4. Complex deployment using KCL template function - kcl-xrds

## Setting up

1 run the terraform

2 Create an access key for the user `crossplane-demo`

3 create a file called `creds.txt` in the `init` folder with the following structure with the access key details filled in

```
[default]
aws_access_key_id=
aws_secret_access_key=
```

4 cd to the init directory
  run the init.sh script

  ```
  ./init.sh
  ```

## Deploying

Deploy each resource individually and delete resources before applying another

### Simple

```
kubectl apply naked-sqs.yaml
```

### XRDS

```
cd xrds
kubectl apply -f xrd-api.yaml -f xrd-composition.yaml
kubectl apply -f basic-claim.yaml
```

### Go templates

```
cd golangtemplate
kubectl apply -f gt-function -f gt-api.yaml -f gt-composition.yaml
kubectl apply -f gt-claim.yaml
```

### KCL templates

```
cd kcl-xrds
kubectl apply -f kcl-function -f kcl-api.yaml -f xrd-composition.yaml
kubectl apply -f kcl-claim.yaml
```