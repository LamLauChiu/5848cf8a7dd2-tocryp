import boto3
import os
import sys


#improve parameters

print("Entered value for regions is {}".format(sys.argv[1]))
print("Entered value for key pem is {}".format(sys.argv[2]))
print("Entered value for login user{}".format(sys.argv[3]))
print("Entered value of tag {}".format(sys.argv[4]))
region = sys.argv[1]
config_pem = sys.argv[2]
login_user = sys.argv[3]
tag_val = sys.argv[4]
#tag:Name - {Name} is key under Tags


def get_host(ec2, fv):
    
    f = {'Name': 'tag:Name', 'Values': [fv]}
    #hosts = []
    for host in ec2.instances.filter(Filters=[f]):
        #hosts.append(host.public_ip_address)
        print(host.public_ip_address)
    return host.public_ip_address


def main():
    print("Main:: function")
    ec2 = boto3.resource('ec2', region)
    app_group = get_host(ec2, tag_val)
    if len(app_group) == 0:
        print("Host is not present")
    else:
        ec2_public_ip = app_group
        print("in main {}".format(ec2_public_ip))
        ssh_command = "ssh -i {} {}@{}".format(config_pem, login_user, ec2_public_ip)
        print("command statement {}".format(ssh_command))
        os.system(ssh_command)
        print("executed ssh command")



if __name__ == '__main__':
    main()
