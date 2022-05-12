A script to install [Allure](https://github.com/allure-framework/allure2) on Linux in /opt

### Preconditions
Make sure you have Java intalled
<pre>
java --version

Output:
    openjdk 17.0.3 2022-04-19
    OpenJDK Runtime Environment (build 17.0.3+7-Ubuntu-0ubuntu0.20.04.1)
    OpenJDK 64-Bit Server VM (build 17.0.3+7-Ubuntu-0ubuntu0.20.04.1, mixed mode, sharing)
</pre>
### Usage
<pre>
wget https://raw.githubusercontent.com/kazantsev033/allure-linux-install/master/install-allure.sh && chmod +x install-allure.sh
sudo ./install-allure.sh
</pre>

### Options
<pre>
Options:
  -v
    Specify allure version  
    Default: latest
  -h
    Print help
</pre>
