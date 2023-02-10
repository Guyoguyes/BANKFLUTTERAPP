# Bank Account Management Flutter App
## Introduction
### This project is a Flutter app that provides 4 REST API endpoints to manage a bank account: Authentication, Balance, Deposit, and Withdrawal. These endpoints allow users to access and manage their bank accounts through the app.

## Endpoints
#### Authentication: This endpoint is used to authenticate a user and provide them with access to their bank account. The authentication process can involve verifying the user's credentials and returning a token that can be used for subsequent requests.

#### Balance: This endpoint returns the outstanding balance for the user's bank account.

#### Deposit: This endpoint allows users to deposit money into their bank account. The maximum deposit for the day is 150K Kenyan shillings, and the maximum deposit per transaction is 40K Kenyan shillings. The maximum deposit frequency is 4 transactions per day.

#### Withdrawal: This endpoint allows users to withdraw money from their bank account. The maximum withdrawal for the day is 50K Kenyan shillings, and the maximum withdrawal per transaction is 20K Kenyan shillings. The maximum withdrawal frequency is 3 transactions per day. Withdrawals are not allowed if the balance is less than the withdrawal amount.

## Installation Steps
#### Clone the repository to your local machine using git clone https://github.com/Guyoguyes/BANKFLUTTERAPP.git.
#### Install the Flutter SDK and set up an Android development environment.
#### Open the project in your preferred IDE and run flutter pub get to install the required dependencies.
#### Connect an Android device or launch an emulator.
#### Run the app on the device or emulator using flutter run.