#Replaces pulseaudio with pipewire 

sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
sudo apt-get updatesudo apt install pipewire pipewire-pulse \
       	pipewire-tests pipewire-locales gstreamer1.0-pipewire \
	libspa-0.2-bluetooth libspa-0.2-jack \
      	pipewire-audio-client-librariessudo
 
systemctl disable --global pulseaudiosudo 
systemctl enable --global pipewire-pulse
