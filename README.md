CentOS6 Quick Installer Bash scripts:
==========================

To install any of the following, just copy and paste the text in the box on a fresh copy of CentOS6.x (x86_64)

Install OpenVZ on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installOpenVZ.sh)


Install NodeJS on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNodeJS.sh)


Install LAMP stack on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installLAMP.sh)


Install MongoDB on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installMongoDB.sh)


To install them All:
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installMongoDB.sh) && \
    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNodeJS.sh) && \
    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installLAMP.sh) && \
    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installMongoDB.sh)
