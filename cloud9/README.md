Configuring Cloud 9
===================

Create a personal access token on your github account: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token

In the environment folder create a folder config, clone the configuration repo and execute the configure_cloud9.sh script with your github username and personal access token

```

mkdir config
cd config
git clone https://github.com/ddvlamin/config.git .
cd cloud9
chmod u+x ./configure_cloud9.sh
./configure_cloud9.sh username personal_access_token
```
