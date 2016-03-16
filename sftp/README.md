profideo_sftp
==========================

Build a server sftp.

#### Installation ####

```bash
git clone git@github.com:Profideo/docker-images.git
cd docker-images
docker build -t profideo_sftp .
docker run -p {{ FTP_PORT }}:22 -h sftp --name=profideo_sftp -d profideo_sftp
```

For stop and remove container : 
```bash
docker stop profideo_sftp && docker rm profideo_sftp
```

To connect in ssh : 
```bash
ssh -p {{ FTP_PORT }} profideo@localhost
```

> The profideo's password is itself.


