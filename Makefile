# Disclaimer: Some of this code is blatantly nicked from @josefnpat. 
# I've mixed in some of my own code and made it all extensible and stuff:D

# Variables:
game_name=Name
love_ver=0.9.1# Yeah, yeah.
# For love2D distributions <=0.8.0 you have to change a few things:
# Linux: You must give a specific distro release name, like `0.8.0natty1`
# Windows: Add a `-x` between `win` and the architecture number. So `win64` becomes win-x64. 
# Windows: Also please note that for <=0.8.0 releases, you have to replace 32 with 86. I don't know why they changed that. 


build setup:
	mkdir .build_data
	cd .build_data; mkdir win32/; mkdir win64/; mkdir linux32/; mkdir linux64/ # mkdir mac/
	mkdir builds
	cd builds; mkdir $(game_name)-win32/; mkdir $(game_name)-win64/; mkdir $(game_name)-lin32/; mkdir $(game_name)-lin64/
	
build setup-win32:
	# windows 32 bit
	cd .build_data; cd win32; wget -t 2 -c https://bitbucket.org/rude/love/downloads/love-$(love_ver)-win32.zip
	cd .build_data; cd win32; unzip love-$(love_ver)-win32.zip; mv love_$(love_ver)-win32/* ./; rmdir love_$(love_ver)-win32/
	
build setup-win64:
	# windows 64 bit
	cd .build_data; cd win64; wget -t 2 -c https://bitbucket.org/rude/love/downloads/love-$(love_ver)-win64.zip
	cd .build_data; cd win64; unzip love-$(love_ver)-win64.zip; mv love_$(love_ver)-win64/* ./; rmdir love_$(love_ver)-win64/

build setup-mac:
	# os x universal - not done yet D:
	# wget -t 2 -c https://bitbucket.org/rude/love/downloads/love-0.8.0-macosx-ub.zip
	# unzip love-0.8.0-macosx-ub.zip -d .build_data/mac/

build setup-lin32:
	# linux 32 bit
	cd .build_data; cd linux32; wget -t 2 -c https://bitbucket.org/rude/love/downloads/love_$(love_ver)_i386.deb
	cd .build_data; cd linux32; ar x love_$(love_ver)_i386.deb; rm debian-binary; rm control*; rm love_$(love_ver)_i386.deb
	cd .build_data; cd linux32; gunzip data.tar.gz; tar -xf data.tar; rm data.tar; mv ./usr/bin/love ./love; rm -r usr/
	
	cd .build_data; cd linux32; wget -t 2 -c https://bitbucket.org/rude/love/downloads/liblove_$(love_ver)_i386.deb
	cd .build_data; cd linux32; ar x liblove_$(love_ver)_i386.deb; rm debian-binary; rm control*; rm liblove_$(love_ver)_i386.deb
	cd .build_data; cd linux32; gunzip data.tar.gz; tar -xf data.tar; rm data.tar; mv ./usr/lib/i386-linux-gnu/* ./; rm -r usr/

build setup-lin64:
	# linux 32 bit

	cd .build_data; cd linux64; wget -t 2 -c https://bitbucket.org/rude/love/downloads/love_$(love_ver)_amd64.deb
	cd .build_data; cd linux64; ar x love_$(love_ver)_amd64.deb; rm debian-binary; rm control*; rm love_$(love_ver)_amd64.deb
	cd .build_data; cd linux64; gunzip data.tar.gz; tar -xf data.tar; rm data.tar; mv ./usr/bin/love ./love; rm -r usr/

	cd .build_data; cd linux64; wget -t 2 -c https://bitbucket.org/rude/love/downloads/liblove_$(love_ver)_amd64.deb
	cd .build_data; cd linux64; ar x liblove_$(love_ver)_amd64.deb; rm debian-binary; rm control*; rm liblove_$(love_ver)_amd64.deb
	cd .build_data; cd linux64; gunzip data.tar.gz; tar -xf data.tar; rm data.tar; mv ./usr/lib/amd64-linux-gnu/* ./; rm -r usr/

build cleanup:
	rm -rf .build_data
	rm -rf builds
	echo Cleaned up!
