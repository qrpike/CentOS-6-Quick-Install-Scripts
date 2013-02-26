CentOS6 Quick Installer Bash scripts:
==========================

To install any of the following, just copy and paste the text in the box on a fresh copy of CentOS6.x (x86_64)

Install OpenVZ on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installOpenVZ.sh --insecure)


Install NTP on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNTP.sh --insecure)


Install GlusterFS on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installGlusterFS.sh --insecure)


Install NodeJS on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNodeJS.sh --insecure)


Install LAMP stack on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installLAMP.sh --insecure)


Install MongoDB on CentOS 6.x
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installMongoDB.sh --insecure)


To install them All:
-----

    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installOpenVZ.sh --insecure) && \
    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installNodeJS.sh --insecure) && \
    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installLAMP.sh --insecure) && \
    source <(curl -s https://raw.github.com/qrpike/CentOS-6-Quick-Install-Scripts/master/installMongoDB.sh --insecure)
