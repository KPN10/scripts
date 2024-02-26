#!/bin/bash

# Short path
sed -i '/sPS1=\'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \'/\
	PS1=\'${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ \''\
	~/.bashrc

# Hide password
echo 'Defaults !pwfeedback' | sudo tee /etc/sudoers.d/9_no_pwfeedback
