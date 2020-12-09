cd /tmp/ta_assignment
npm install
npm audit fix
nohup bash -c "npm run -s start-api &"
nohup bash -c "npm start &"
sleep 10
./node_modules/cypress/bin/cypress run
