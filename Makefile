# install dependencies (hub, git, exercism, elixir/erlang)

submit:
	# NOT FINISHED
	cp -a $(EXERCISE) ~/snap/exercism/5/exercism/elixir/
	exercism submit ~/snap/exercism/5/exercism/elixir/$(EXERCISE)/lib/rotational_cipher.ex
  
download:
	exercism download --exercise=$(EXERCISE) --track=$(TRACK)
	mkdir $(EXERCISE)
	mv -v ~/snap/exercism/5/exercism/$(TRACK)/$(EXERCISE)/* ./$(EXERCISE)
	git checkout -b feat/$(EXERCISE)_$(TRACK)

include:
	git add .
	git commit -m "feat: Solved $(EXERCISE) on $(TRACK) track"
	git push origin feat/$(EXERCISE)_$(TRACK) 
	hub pull-request -m "feat: Solved $(EXERCISE) on $(TRACK) track"
	git checkout master
	git branch -D feat/$(EXERCISE)_$(TRACK)
  git pull origin master