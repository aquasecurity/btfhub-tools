gather:
	cp -R btfhub-repo/archive .

update:
	for distro in fedora29 fedora30 fedora31 fedora32 fedora33 fedora34 centos7 centos8 bionic focal; do \
  		./tools/update.sh $$distro; \
	done
	rsync -av ./archive btfhub-repo