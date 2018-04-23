# Install X Windows client and server and openbox window manager.

package 'xauth'
package 'xorg'
package 'openbox'
package 'gnome-terminal'

bash 'copy openbox configuration files to user dev' do 
  code <<-EOF
    mkdir -p /home/dev/.config/openbox
    cp -r /root/bootstrap-ubuntu-server-16.04-dev-base/openbox/* /home/dev/.config/openbox/.
    chown -R dev /home/dev/.config/openbox
    chgrp -R dev /home/dev/.config/openbox
  EOF
end 
