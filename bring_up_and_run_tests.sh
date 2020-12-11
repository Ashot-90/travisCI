cd /tmp/ta_assignment
npm install
npm audit fix
npm run -s start-api &
npm start &
sleep 5
$(npm bin)/cypress run
