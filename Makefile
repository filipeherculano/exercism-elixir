# install dependencies
# submit to exercism

download:
	exercism download --exercise=$(EXERCISE) --track=$(TRACK)
	mv -v ~/snap/exercism/5/exercism/$(TRACK)/* .
	git checkout -b feat/$(EXERCISE)_$(TRACK)

include:
	git add .
	git commit -m "feat: Solved $(EXERCISE) on $(TRACK) track"
	git push origin feat/$(EXERCISE)_$(TRACK) 
	hub pull-request
	git checkout master
	git branch -D feat/$(EXERCISE)_$(TRACK)
