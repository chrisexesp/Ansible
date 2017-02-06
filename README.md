# Ansible

#Ansible Installation ( CentOS )

sudo yum install epel-release

sudo yum install ansible

#Edit Ansible Hosts Group

/etc/ansible/hosts

[myservers]

node1.ansible.com

node2.ansible.com

#Edit hosts table

/etc/hosts

# Generate Key and copy Key

ssh-keygen

ssh-copy-id –i node1  or ssh-copy-id -i user@node1

ssh-copy-id –i node2  or ssh-copy-id -i user@node2

#Test Connection

ansible all -m ping

ansible node2 -m ping

ansible all -a "/bin/echo hello"

#Install IBMIM

./installc -acceptLicense

# start semaphore

./semaphore -config /etc/ansible/semaphore_config.json

# Ansible Tower - Import Inventory

tower-manage inventory_import --source=/etc/ansible/Inventory --inventory-name="WAS Inventory"

# Ansible Tower - basic settings (/etc/tower/seeting.py)

User: awx

Project Root: /var/lib/awx/projects

Log (Job Status) /var/lib/awx/job_status

Tower server errors /var/log/tower

Supervisors logs /var/log/supervisor/

# Ansible Tower - changes ports of admin console

/etc/httpd/conf/httpd.conf

/etc/httpd/conf.d/ssl.conf

/etc/httpd/awx-httpd-80.conf

/etc/httpd/awx-httpd-443.conf

/etc/tower/setting.py

/var/lib/awx/venv/tower/lib/python2.7/site-packages/awx/plugins/inventory/awxrest.py

Allow port for SElinux
