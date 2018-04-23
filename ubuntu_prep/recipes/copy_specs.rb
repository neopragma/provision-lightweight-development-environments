# Copy specs from bootstrap directory to chefspec directory

bash 'copy specs from bootstrap dir to chefspec dir' do 
  code <<-EOF
    mkdir -p /root/chef-repo/cookbooks/ubuntu_prep/spec/unit/recipes
    cp -r /root/bootstrap-ubuntu-server-16.04-dev-base/ubuntu_prep/spec/* /root/chef-repo/cookbooks/ubuntu_prep/spec/.
  EOF
end 
