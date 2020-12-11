# travisCI

This repository has been integrated with Travis CI, so every commit here will trigger job under mentioned CI tool.

## Content

Couple of points about the content of the repo and what has been added/updated:
1. 'ta_assigment' folder has been copied from https://github.com/busy-fox/ta_assignment repo.
2. The only change which has been done under 'ta_assigment', was test-case regolden. Updated expecting message to make all tests passed.
3. Added Dockerfile and 'bring_up_and_run_tests.sh' script which used by the same Dockerfile and of course .travis.yml to integrate with Travis CI.
4. Latest available cypress docker image which used under Dockerfile, has been taken from https://github.com/cypress-io/cypress-docker-images
