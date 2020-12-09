cd /tmp/ta_assignment
npm install
npm audit fix
npm run -s start-api &
npm start &
sleep 10
./node_modules/cypress/bin/cypress run
