!/bin/sh

# apt
apt-get clean && apt-get autoclean
apt-get remove --purge -y software-properties-common
apt-get autoremove -y
deborphan | xargs sudo apt-get -y remove --purge
apt-get clean

# Clean all logs
logs=`find /var/log -type f`
for i in $logs
do
> $i
done

# trash
rm -rf /root/.local/share/Trash/*/**
rm -rf /home/*/.local/share/Trash/*/**

#Careful delete gz files 
#find /var/log -type f -regex ".*\.gz$" | xargs rm -Rf
#find /var/log -type f -regex ".*\.[0-9]$" | xargs rm -Rf

echo "End"