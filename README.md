# icemaker
A small collection of CLI utilities for archiving data in AWS S3 Glacier

## installation

Run the installation script if you'd like to execute this program in `/usr/local/bin`. 

## usage

You'll want to check that you have awscli setup and configured. Zip is required as well to package the folder. Given a folder such as:

```
scott.king/
  Photography/
    2023 - landscapes/
      ...
```

Here's how to archive this to s3 (Glacier):

```shell
$  icm '2023 - landscapes/' <s3 bucket name>
```

This will complete the zip and transfer. 
