# Account Statements

#### Problem Statement
Allow user to view transactions by month and to view a pdf statement

##### UI
#### AccountStatementsCard
### Responsibilities
-  Display card with balance and account numbe
-  Handles click on collect to navigate to account statements screen

#### API Components

## Account API

The Account API Service will be utilized during the setup process of the Hub Card.

### AccountServiceRequestModel

This request model is to make request to Account service

- API Endpoint: “/test/version/1/accountInfo/”

### AccountServiceResponseModel

This response model is to handle the response from Account service

- API Endpoint: “/test/version/1/accountInfo/”

### AccountServiceAdapter

This service adapter is to hit the following endpoint

- API Endpoint: “/test/version/1/accountInfo/”

## Transactions API

The Transactions API Service will be utilized to read the list of transactions displayed by the Statements List screen.

### TransactionsServiceRequestModel

This request model is to make request to Transactions service

- API Endpoint: “/test/version/1/transactions/”

### TransactionsServiceResponseModel

This response model is to handle the response from Transactions service

- API Endpoint: “/test/version/1/transactions/”

### TransactionsServiceAdapter

This service adapter is to hit the following endpoint

- API Endpoint: “/test/version/1/transactions/”

# Bloc Components
-	The SuchAndSuchBloc will interact with SuchAndSuchViewModel, SuchAndSuchPresenter, SuchAndSuchStrings , and SuchAndSuchUseCase

## SuchAndSuchBloc
-	This is to handle the logic associate with determining x, y, and z. - 	This interacts with the Use Case XYZ.

## SuchAndSuchUseCase
-	This Use Case handles all the zoom, span, max, min, etc. logic.

## Models
-	SuchAndSuchViewModel will interact with SuchAndSuchBloc, SuchAndSuchPresenter, and SuchAndSuchScreen

## SuchAndSuchViewModel

-	Contains the following fields: Account, Bank, WireNumber, etc.

## SuchAndSuchEntity

-	Contains the following fields: Account, Bank, WireNumber, etc.

# UI Components

## Hub Card

### HubCardPresenter

-	The middle layer between the Bloc and the Screen

-	Contains the navigation interface

### HubCardNavigationInterface

-	Controls the back, forward, and action item navigation for HubCardScreen

### HubCardScreen

-	This screen will show the such and such items

![Hub Card](screenshots/hub_card.png)

## Statements List

### StatementsListPresenter

-	The middle layer between the Bloc and the Screen

-	Contains the navigation interface

### StatementsListNavigationInterface

-	Controls the back, forward, and action item navigation for StatementsListScreen

### StatementsListScreen

-	This screen will show the such and such items

![Statements List Screen](screenshots/statements_list.png)

## PDF Statements

### PDFStatementsPresenter

-	The middle layer between the Bloc and the Screen

-	Contains the navigation interface

### PDFStatementsNavigationInterface

-	Controls the back, forward, and action item navigation for PDFStatementsScreen

### PDFStatementsScreen

-	This screen will show the such and such items

![PDF Statements Screen](screenshots/pdf_statements.png)

## Utils/Strings Classes

## SuchAndSuchStrings
-	Contains the strings for the SuchAndSuchFeature

## JSON Responses

### /accountInfo

``` json
{
	"accountInfo": {
		"accountCategory": "LOANACCOUNT",
		"accountNumber": "1234567890126917",
		"availableBalance": 481.84,
		"accountNickname": "HNB Credit Card (6917)"
	}
}
```

### /transactions
``` json
{
	"postedTransactions": [
		{
			"transactionDate": "04/13/2021 00: 00: 00",
			"description": "LYFT RIDE",
			"debitAmount": 18.0,
			"category": "Ground Transportation",
			"cardNumber": "xxxxxxxxxxxx6917"
		},
		{
			"transactionDate": "04/14/2021 00: 00: 00",
			"description": "UBER TRIP",
			"debitAmount": 28.0,
			"category": "Ground Transportation",
			"cardNumber": "xxxxxxxxxxxx6917"
		}
	]
}
```
