# crossplane-edinburgh
Examples from CNCF meetup talk

1 run the terraform

2 create a user in your aws account and create an access key for it

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