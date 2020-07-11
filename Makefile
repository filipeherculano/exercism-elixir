# install dependencies (hub, git, exercism, elixir/erlang)
  
download:
	exercism download --exercise=$(EXERCISE) --track=$(TRACK)
	mkdir $(EXERCISE)
	mv -v ~/snap/exercism/5/exercism/$(TRACK)/$(EXERCISE)/* ./$(EXERCISE)
	git checkout -b feat/$(EXERCISE)_$(TRACK)

upload:
	git add .
	git commit -m "feat: Solved $(EXERCISE) on $(TRACK) track"
	git push origin feat/$(EXERCISE)_$(TRACK) 
	hub pull-request -m "feat: Solved $(EXERCISE) on $(TRACK) track"
	git checkout master
	git branch -D feat/$(EXERCISE)_$(TRACK)

submit:
	cp -a $(EXERCISE) ~/snap/exercism/5/exercism/$(TRACK)/
	exercism submit ~/snap/exercism/5/exercism/$(TRACK)/$(EXERCISE)/lib/$(shell ls ~/snap/exercism/5/exercism/$(TRACK)/$(EXERCISE)/lib/)
