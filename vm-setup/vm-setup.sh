#!/bin/bash

apt update
apt install curl screen vim

mkdir .ssh

echo "Putting the ssh keys in the authorized_keys - file..."
sleep 3

#### SSH KEYS WILL BE PUT INTO THE FILE IN THIS SECTION ####

# SSH Key Erik

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAsg6C47+O8XFbyPEeLL3Dc2m+5ba/KDvZGA9wRj+WshxaEjHlyyzDI1wnfysLoZN80RIfHaV04NQ604e1cyVUtTThKbIYyOsveqasbaY9yPzInsLBRcTWVn/OXqrcJ6fJPKgVzw+R2G7UgXznDbOrHZr9fKe0WPvr7YJzJPxwLgCApvGdbwSSan5lTsfhdBsIROI0afNSABcBe6ZF8qdiOwb4APk9/S6VYrR9h/WdXvhsigLkBAghIZjm9CInwtwI2InKgBQuHyZQ5J0wPABA007Jf8Wea/XkFenuQY5AhdLw4rGaFN0BDjXMvu3KWP699PGm8ml1/5OCHkyb6GsIzatI971VQjvCNxnRf3lPXhTAzUIQMN3zliNshpGG8VRSJycfpvHuav2iZTSNBlLma/edxqJmMWbHJibGV5AGegBVPUKHdzxZMRrvR869ckBUOU5oDKAEPP4Ugw0Lxpl06SfxNfJ3W+pO69pRvTqlTrYA8/QA+7iYevsBdOS60+M9qL2LoMYoKHytrUVIm/+ZYHUZKLPVVqHWCaGyMF4q1lmzNtWJKAmDz7QWZu/zitqzHy1gZAXLcNEHj5ERR67Phmn7RLSsj3zkrKbeeBN0Dmnc5sDu7wKekYlVkzw050GrmTwFHa2gpmLLHix2aOiIGT1u4JSU2UgMnoF3IDVsPQ== erik@61.students.os3.nl" >> .ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDtzS2g7tO4oGJVn27qlPHeR3zr0ERHT0wyeLrnxjnFo53XI61lUD86BYP+a5EZkcOe0uuV0PteO5PCejkcm0ATvIQ2i4HW95c2HEsQS22izF+turQgAIpoxM1lhTCz+6sfikXyOaogidJ/HJSGKf0V56zEuodFM78+GHt/3/Z+NlutUTDwzzteKje/L5KdPWmdPTgCV6JGvUcpsXOC3cq8U49pRVXaU6BxU+YyrEuBEgQ3ayr7nnxgLDvDXEayHHm3jEpR9lmiaaWuUWPJjFCx5taGZEuH75gIBSXeiHr9Ww160qBImDEJHz8X/rfYnu0/6NUT4SX7oyZBgaIxNAEdRvBpGtKALUP1mZcWI/ueQW+nv5SO8LNksJBSbcwUdCtNHMlYUk+zbKgiTNf0B0KuI3lmV59WOmOWDP/hShGMGpMc/Di1nqDA/NbeLzBDZFzyeTQLUFdPcirAb2RSUui0lW14oB6V3l/Zokcom6izpV9ulRAD7jvnro4DRprofhHCh7b4p3w/hszHTgpKgfGjFn02Xx8f6NxwpvWY1Z3j1Ge9U4ZKnQMmnu0AkA1CRwqxeIMry5r3apnUGlWMgqZbR8w2ex2VHZp43CQ6hpZSG17M0WjZYhlIDmfoXRdwWwtjRPmTEb1C0+fySotX61OT9qeQzfniVmT59IXjm+KxPQ== erik-reims-2018" >> .ssh/authorized_keys

# SSH Key Ronald

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEA3vwwIh6bShfEQbhDwhJavV0/D/VZBKMSrcc+hNbZjTar5y5GvQAr6KHBIPtL9aipAGcVgBYiFB81RAg9czuyS6TyW5XZ5iOCp9Dn6Bhwn1QSCao6155IcUF7rAKYnyUxr76nRF08M9mB6hbHe4gML0B+w5zPzGjcsVzzaG17nrqS7UgPJP9HjPw6/wjqCZf9hpvnrXzq1uX9iE1eqFJsdTNthPd4ODgVGaprYYrFy4/XjOIj9tboPpQH7o1ZCPT/p3+bcrRYvcqKRjfPc+woKmL0VLdCCNXlmtrgXGugrNAXADpoos9nfSxhHlAiMYBIiMoOZoLQZXSh5DNG5AocDw==" >> .ssh/authorized_keys

############################################################

echo "Creating the filebench screen"
sleep 5

screen -m -d -S filebench

echo "Putting in the one-liner into the screen command.."
sleep 3
screen -S filebench -p 0 -X stuff "curl -sSL https://raw.githubusercontent.com/Erik-Lamers1/OS3-LS/master/filebench-scripts/install-script.sh  | bash"

screen -r filebench

echo "Done, you won't see this line probably"
