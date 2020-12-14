# TravisCI and CircleCI integration repo

This repository has been integrated with Travis CI and Circle CI, so every commit here will trigger a job under mentioned CI tools.

## Content

Couple of points about the content of the repo and what has been added/updated:
1. 'ta_assigment' folder has been copied from https://github.com/busy-fox/ta_assignment repo.
2. The only change which has been done under 'ta_assigment', was test-case regolden. Updated expecting message to make all tests passed.
3. Added Dockerfile and 'bring_up_and_run_tests.sh' script which used by the same Dockerfile and of course .travis.yml and .circleci/config.yml files to integrate with CI tools.
4. Latest available cypress docker image which used under Dockerfile, has been taken from https://github.com/cypress-io/cypress-docker-images


CircleCI specific:
  - Docker image will be built and pushed to docker hub if changes are done under 'docker_image_update' branch and run tests based on newly built image.
  - Otherwise, it will pull image from docker hub and run tests on that image.
  
  
TravisCI specific:
  - Docker image will be built and tests will run on that image.
