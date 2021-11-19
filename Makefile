clone:
	git clone git@github.com:simar7/btfhub.git btfhub-repo

gather:
	cp -R btfhub-repo/archive .

update:
	for distro in fedora29 fedora30 fedora31 fedora32 fedora33 fedora34 centos7 centos8 bionic focal; do \
  		./tools/update.sh $$distro; \
	done
	rsync -av ./archive btfhub-repo

push:
	cd btfhub-repo
	git config --local user.email "action@github.com"
	git config --local user.name "GitHub Action"
	git add -A
	git commit -m "Update BTF Archives"
	git push
