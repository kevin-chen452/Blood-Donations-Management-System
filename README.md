# CPSC304Project_BloodDonationsManagementSystem

This project was built using React, NodeJS, and PostgreSQL. In order to run the project, both NodeJS (https://nodejs.org/en/download/) and Postgre (https://www.postgresql.org/download/) must be downloaded and installed. To run the project, you need to first download the dependencies by opening both the client and server folders and running ```npm install``` and then ```npm run start``` on both of them in the command line. We recommend using two different command line windows to do this. 

Postgre must be downloaded and installed in order to use this database. In regards to Postgre, a database should be created using 
```CREATE database cpsc;```
The password is set to ```1```, and the PostgreSQL credentials information linked to the frontend is as follows: \
```user: "postgres" ```\
```host: "localhost" ```\
```database: "cpsc"``` \
```password: "1" ```\
```port: 5432 ```

If these set-up credentials aren't working for you, you can change them by going to ```db/database.js``` and modifying the parameters passed through Client. 

Then, the SQL script containing ```CREATE``` table and ```INSERT``` statements should be run. The script can be found in the repository at ```script.sql``` 

All of the SQL queries can be found in the ```server/index/js``` file! Since this file contains a large amount of JavaScript code, you may find it easier to parse through the file quickly by searching (control-f or command-f) ```const query```: this will directly show you where all of the SQL queries have been used, and what they are. 
