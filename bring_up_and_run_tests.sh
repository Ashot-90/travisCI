flask run &
npm start &
echo "Waiting 10s"
sleep 10
./node_modules/cypress/bin/cypress run
