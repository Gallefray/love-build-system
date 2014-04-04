# Disclaimer: Some of this code is blatantly nicked from @josefnpat. 
# I've mixed in some of my own code and made it all extensible and stuff:D

# Variables:
game_name=Name
love_ver=0.9.1# Yeah, yeah.
# For 0.8.0 you must give a specific distro release name, like `0.8.0natty1`


build setup:
	mkdir .build_data
	cd .build_data; mkdir win32/; mkdir win64/; mkdir linux32/; mkdir linux64/ # mkdir mac/
	mkdir builds
	cd builds; mkdir $(game_name)-win32/; mkdir $(game_name)-win64/; mkdir $(game_name)-lin32/; mkdir $(game_name)-lin64/
	
build setup-win32:
	# windows 32 bit
	wget -t 2 -c https://bitbucket.org/rude/love/downloads/love-$(love_ver)-win-x86.zip
	unzip love-0.8.0-win-x86.zip -d .build_data/win32/
		
build setup-win64:
	# windows 64 bit
	# wget -t 2 -c https://bitbucket.org/rude/love/downloads/love-$(love_ver)-win-x64.zip
	# unzip love-0.8.0-win-x64.zip -d .build_data/win64x/

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

build cleanup:
	rm -rf .build_data
	rm -rf builds
	echo Cleaned up!
