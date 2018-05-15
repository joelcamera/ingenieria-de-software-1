!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:22:46'!
test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:11:42'!
test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio with: account1 with: account2.
    complexPortfolio2 := Portfolio with: account3 with: account1.

    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:30:52'!
test21_01TransferIsReachedFromTransacctions

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert:  100 = transfer value.
	self assert: fromAccount transactions first transfer equals: transfer.
	self assert: toAccount transactions first transfer equals: transfer.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:09:02'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines |

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.

	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.

	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:09:33'!
test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.

	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:09:59'!
test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |

	account := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1 / 10 on: account.

	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:10:34'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |

	account := ReceptiveAccount new.

	CertificateOfDeposit register: 100 during: 30 at: 1 / 10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15 / 100 on: account.
	
	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).

	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:11:10'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.

	CertificateOfDeposit register: 1000 during: 30 at: 1 / 10 on: fromAccount.

	lines := self accountSummaryLinesOf: fromAccount.

	self assert: 4 = lines size.
	self assert: 'Deposito por 100' = (lines at: 1).
	self assert: 'Extraccion por 50' = (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:11:37'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.

	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:11:53'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.

	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.

	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.

	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JEC 5/14/2018 18:12:09'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.

	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.

	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.

	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).! !


!PortfolioTest methodsFor: 'test support' stamp: 'JEC 5/14/2018 22:49:52'!
accountSummaryLinesOf: aReceptiveAccount
	^ (AccountSummaryQuery of: aReceptiveAccount) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'JEC 5/14/2018 22:50:49'!
accountTransferNetOf: aReceptiveAccount
	^ (TransferNetQuery of: aReceptiveAccount) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'JEC 5/14/2018 22:50:05'!
investmentEarningsOf: aReceptiveAccount
	^ (InvestmentEarningsQuery of: aReceptiveAccount) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'JEC 5/14/2018 22:50:25'!
investmentNetOf: aReceptiveAccount
	^ (InvestmentNetQuery of: aReceptiveAccount) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'JEC 5/14/2018 22:50:36'!
portofolioTreeOf: aPortfolio namingAccountWith: dictionaryNames
	^ (PortfolioTreePrinterQuery
		of: aPortfolio
		with: dictionaryNames) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'JEC 5/14/2018 22:50:36'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: dictionaryNames
	^ (PortfolioTreePrinterQuery
		of: aPortfolio
		with: dictionaryNames) reversedValue.! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'JEC 5/13/2018 14:26:52'!
modifyBalance: aValue

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'JEC 5/14/2018 22:58:22'!
sendValueTo: aQueryObject

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:46:31'!
initializeFor: aValue during: anAmountOfDays at: aPercentage on: anAccount

	value := aValue.
	numberOfDays := anAmountOfDays.
	tna := aPercentage.
	account  := anAccount.! !


!CertificateOfDeposit methodsFor: 'value' stamp: 'JEC 5/13/2018 15:41:25'!
modifyBalance: aBalanceValue

	^aBalanceValue - value! !

!CertificateOfDeposit methodsFor: 'value' stamp: 'JEC 5/14/2018 23:07:42'!
sendValueTo: aQueryObject

	aQueryObject certificateOfDepositQueryWithValue: value numberOfDays: numberOfDays andTna: tna.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'JEC 5/13/2018 14:57:05'!
register: aValue during: anAmountOfDays at: aPercentage on: anAccount 

	| certificateOfDeposit |
	
	certificateOfDeposit := self new.
	certificateOfDeposit initializeFor: aValue during: anAmountOfDays at: aPercentage on: anAccount.
	anAccount register: certificateOfDeposit .
	
	^ certificateOfDeposit ! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:12:56'!
initializeFor: aValue

	self subclassResponsibility ! !


!Deposit methodsFor: 'value' stamp: 'JEC 5/13/2018 14:16:20'!
modifyBalance: aBalanceValue
	
	self subclassResponsibility ! !

!Deposit methodsFor: 'value' stamp: 'JEC 5/14/2018 23:29:47'!
sendValueTo: aQueryObject

	self subclassResponsibility ! !

!Deposit methodsFor: 'value' stamp: 'JEC 5/13/2018 14:15:44'!
value

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'JEC 5/10/2018 20:40:08'!
for: aValue

	^ DepositSimple new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'JEC 5/13/2018 14:37:13'!
register: aValue on: account

	| deposit |
	
	deposit := self for: aValue.
	account register: deposit.
		
	^ deposit! !


!classDefinition: #DepositSimple category: #'PortfolioTreePrinter-Ejercicio'!
Deposit subclass: #DepositSimple
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!DepositSimple methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:12:36'!
initializeFor: aValue

	value := aValue ! !


!DepositSimple methodsFor: 'value' stamp: 'JEC 5/13/2018 14:16:04'!
modifyBalance: aBalanceValue
	
	^aBalanceValue + value! !

!DepositSimple methodsFor: 'value' stamp: 'JEC 5/14/2018 23:02:46'!
sendValueTo: aQueryObject

	aQueryObject depositSimpleQuery: value.! !

!DepositSimple methodsFor: 'value' stamp: 'JEC 5/13/2018 14:15:30'!
value

	^value! !


!classDefinition: #DepositTransfer category: #'PortfolioTreePrinter-Ejercicio'!
Deposit subclass: #DepositTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!DepositTransfer methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:13:36'!
initializeFor: aTransfer

	transfer := aTransfer .! !


!DepositTransfer methodsFor: 'value' stamp: 'JEC 5/10/2018 21:02:38'!
modifyBalance: aBalanceValue
 
	^aBalanceValue + transfer value! !

!DepositTransfer methodsFor: 'value' stamp: 'JEC 5/13/2018 16:26:05'!
modifyNetValue: aNetValue

	^aNetValue + transfer value! !

!DepositTransfer methodsFor: 'value' stamp: 'JEC 5/14/2018 23:04:29'!
sendValueTo: aQueryObject

	aQueryObject depositTransferQuery: transfer value.! !

!DepositTransfer methodsFor: 'value' stamp: 'JEC 5/13/2018 14:13:55'!
transfer

	^transfer! !

!DepositTransfer methodsFor: 'value' stamp: 'JEC 5/13/2018 14:13:52'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositTransfer class' category: #'PortfolioTreePrinter-Ejercicio'!
DepositTransfer class
	instanceVariableNames: ''!

!DepositTransfer class methodsFor: 'instance creation' stamp: 'JEC 5/13/2018 14:37:22'!
with: aTransfer

	| depositTransferInstance |

	depositTransferInstance _ self new.
	depositTransferInstance initializeFor: aTransfer.

	^ depositTransferInstance.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:03:43'!
initializeFor: aValue

	self subclassResponsibility ! !


!Withdraw methodsFor: 'value' stamp: 'JEC 5/13/2018 14:06:12'!
modifyBalance: aBalanceValue
 
	self subclassResponsibility ! !

!Withdraw methodsFor: 'value' stamp: 'JEC 5/14/2018 23:29:57'!
sendValueTo: aQueryObject

	self subclassResponsibility ! !

!Withdraw methodsFor: 'value' stamp: 'JEC 5/13/2018 13:35:16'!
value

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'JEC 5/10/2018 20:39:53'!
for: aValue

	^ WithdrawSimple new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'JEC 5/10/2018 18:45:34'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #WithdrawSimple category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw subclass: #WithdrawSimple
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!WithdrawSimple methodsFor: 'value' stamp: 'JEC 5/13/2018 14:05:45'!
modifyBalance: aBalanceValue
 
	^aBalanceValue - value! !

!WithdrawSimple methodsFor: 'value' stamp: 'JEC 5/14/2018 23:04:15'!
sendValueTo: aQueryObject

	aQueryObject withdrawSimpleQuery: value.! !

!WithdrawSimple methodsFor: 'value' stamp: 'JEC 5/13/2018 13:35:48'!
value

	^value! !


!WithdrawSimple methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:03:25'!
initializeFor: aValue

	value := aValue! !


!classDefinition: #WithdrawTransfer category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw subclass: #WithdrawTransfer
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!WithdrawTransfer methodsFor: 'initialization' stamp: 'JEC 5/13/2018 14:07:56'!
initializeFor: aTransfer

	transfer := aTransfer.! !


!WithdrawTransfer methodsFor: 'value' stamp: 'JEC 5/10/2018 21:01:09'!
modifyBalance: aBalanceValue
 
	^aBalanceValue - transfer value! !

!WithdrawTransfer methodsFor: 'value' stamp: 'JEC 5/13/2018 16:25:33'!
modifyNetValue: aNetValue

	^aNetValue - transfer value! !

!WithdrawTransfer methodsFor: 'value' stamp: 'JEC 5/14/2018 23:03:53'!
sendValueTo: aQueryObject

	aQueryObject withdrawTransferQuery: transfer value.! !

!WithdrawTransfer methodsFor: 'value' stamp: 'JEC 5/13/2018 13:34:19'!
transfer

	^transfer! !

!WithdrawTransfer methodsFor: 'value' stamp: 'JEC 5/13/2018 13:34:23'!
value

	^transfer value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawTransfer class' category: #'PortfolioTreePrinter-Ejercicio'!
WithdrawTransfer class
	instanceVariableNames: ''!

!WithdrawTransfer class methodsFor: 'instance creation' stamp: 'JEC 5/13/2018 14:32:36'!
with: aTransfer

	| withdrawTransferInstance |

	withdrawTransferInstance := self new.
	withdrawTransferInstance initializeFor: aTransfer.

	^ withdrawTransferInstance.! !


!classDefinition: #PortfolioTreePrinterQuery category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #PortfolioTreePrinterQuery
	instanceVariableNames: 'portfolio dictionaryNames dfoTree strSpaceHeight'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTreePrinterQuery methodsFor: 'initialization' stamp: 'JEC 5/14/2018 23:25:48'!
initializeWith: aPortfolio andNames: aDictionaryNames

	portfolio := aPortfolio.
	dictionaryNames := aDictionaryNames.
	dfoTree := OrderedCollection new.
	strSpaceHeight := ''.! !


!PortfolioTreePrinterQuery methodsFor: 'value' stamp: 'JEC 5/14/2018 20:26:03'!
reversedValue

	^self value reversed! !

!PortfolioTreePrinterQuery methodsFor: 'value' stamp: 'JEC 5/14/2018 22:56:59'!
value

	portfolio sendValueTo: self.
	
	^dfoTree ! !


!PortfolioTreePrinterQuery methodsFor: 'handlers' stamp: 'JEC 5/14/2018 23:20:25'!
accountQuery: anAccount

	dfoTree add: strSpaceHeight , (dictionaryNames at: anAccount).! !

!PortfolioTreePrinterQuery methodsFor: 'handlers' stamp: 'JEC 5/14/2018 23:21:18'!
portfolioQuery: aPortfolio

	| oldHeight |

	dfoTree add: strSpaceHeight , (dictionaryNames at: aPortfolio).
	
	oldHeight _ strSpaceHeight.
	strSpaceHeight _ strSpaceHeight , ' '.
	aPortfolio accountsDo: [ :anAccount | anAccount sendValueTo: self ].
	strSpaceHeight _ oldHeight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinterQuery class' category: #'PortfolioTreePrinter-Ejercicio'!
PortfolioTreePrinterQuery class
	instanceVariableNames: ''!

!PortfolioTreePrinterQuery class methodsFor: 'instance creation' stamp: 'JEC 5/14/2018 19:22:23'!
of: aPortfolio with: names

	^self new initializeWith: aPortfolio andNames: names.! !


!classDefinition: #Query category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Query
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Query methodsFor: 'initialization' stamp: 'JEC 5/14/2018 23:22:59'!
initializeWith: aReceptiveAccount

	self subclassResponsibility ! !


!Query methodsFor: 'value' stamp: 'JEC 5/14/2018 23:23:07'!
value

	self subclassResponsibility ! !


!Query methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:14:19'!
certificateOfDepositQueryWithValue: aValue numberOfDays: numberOfDays andTna: tna

	self subclassResponsibility ! !

!Query methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:14:42'!
depositSimpleQuery: aValue

	self subclassResponsibility ! !

!Query methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:14:46'!
depositTransferQuery: aValue

	self subclassResponsibility ! !

!Query methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:14:49'!
withdrawSimpleQuery: aValue

	self subclassResponsibility ! !

!Query methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:14:53'!
withdrawTransferQuery: aValue

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Query class' category: #'PortfolioTreePrinter-Ejercicio'!
Query class
	instanceVariableNames: ''!

!Query class methodsFor: 'instance creation' stamp: 'JEC 5/14/2018 23:12:35'!
of: aReceptiveAccount 

	^self new initializeWith: aReceptiveAccount .! !


!classDefinition: #AccountSummaryQuery category: #'PortfolioTreePrinter-Ejercicio'!
Query subclass: #AccountSummaryQuery
	instanceVariableNames: 'account lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummaryQuery methodsFor: 'initialization' stamp: 'JEC 5/14/2018 18:31:25'!
initializeWith: aReceptiveAccount

	account := aReceptiveAccount.
	lines := OrderedCollection new! !


!AccountSummaryQuery methodsFor: 'value' stamp: 'JEC 5/14/2018 22:56:27'!
value

	account transactionsDo: [ :aTransaction | aTransaction sendValueTo: self ].
	
	^lines.! !


!AccountSummaryQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:08:01'!
certificateOfDepositQueryWithValue: aValue numberOfDays: numberOfDays andTna: tna

	| tnaPercentage |
	
	tnaPercentage := tna * 100.

	lines add: 'Plazo fijo por ', aValue asString, ' durante ', numberOfDays asString, ' dias a una tna de ', tnaPercentage asString, '%'.! !

!AccountSummaryQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:03:18'!
depositSimpleQuery: aValue

	lines add: 'Deposito por ', aValue asString.! !

!AccountSummaryQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:05:04'!
depositTransferQuery: aValue

	lines add: 'Transferencia por ', aValue asString.! !

!AccountSummaryQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:03:24'!
withdrawSimpleQuery: aValue

	lines add: 'Extraccion por ', aValue asString.! !

!AccountSummaryQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:03:29'!
withdrawTransferQuery: aValue

	lines add: 'Transferencia por -', aValue asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummaryQuery class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummaryQuery class
	instanceVariableNames: ''!

!AccountSummaryQuery class methodsFor: 'instance creation' stamp: 'JEC 5/14/2018 18:15:22'!
of: aReceptiveAccount 

	^self new initializeWith: aReceptiveAccount .! !


!classDefinition: #InvestmentEarningsQuery category: #'PortfolioTreePrinter-Ejercicio'!
Query subclass: #InvestmentEarningsQuery
	instanceVariableNames: 'account netValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarningsQuery methodsFor: 'value' stamp: 'JEC 5/14/2018 22:56:42'!
value

	account transactionsDo: [ :aTransaction | aTransaction sendValueTo: self ].
	
	^netValue.! !


!InvestmentEarningsQuery methodsFor: 'initialization' stamp: 'JEC 5/14/2018 19:10:18'!
initializeWith: aReceptiveAccount

	account := aReceptiveAccount.
	netValue := 0! !


!InvestmentEarningsQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:07:29'!
certificateOfDepositQueryWithValue: aValue numberOfDays: numberOfDays andTna: tna
	
	netValue  := netValue + (aValue * (tna/360) * numberOfDays).! !

!InvestmentEarningsQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:06:35'!
depositSimpleQuery: aValue
! !

!InvestmentEarningsQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:06:49'!
depositTransferQuery: aValue! !

!InvestmentEarningsQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:06:58'!
withdrawSimpleQuery: aValue
! !

!InvestmentEarningsQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:07:19'!
withdrawTransferQuery: aValue
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentEarningsQuery class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentEarningsQuery class
	instanceVariableNames: ''!

!InvestmentEarningsQuery class methodsFor: 'instance creation' stamp: 'JEC 5/14/2018 19:10:18'!
of: aReceptiveAccount 

	^self new initializeWith: aReceptiveAccount .! !


!classDefinition: #InvestmentNetQuery category: #'PortfolioTreePrinter-Ejercicio'!
Query subclass: #InvestmentNetQuery
	instanceVariableNames: 'account netValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentNetQuery methodsFor: 'value' stamp: 'JEC 5/14/2018 22:56:49'!
value

	account transactionsDo: [ :aTransaction | aTransaction sendValueTo: self ].
	
	^netValue.! !


!InvestmentNetQuery methodsFor: 'initialization' stamp: 'JEC 5/14/2018 19:05:10'!
initializeWith: aReceptiveAccount

	account := aReceptiveAccount.
	netValue := 0! !


!InvestmentNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:26:16'!
certificateOfDepositQueryWithValue: aValue numberOfDays: numberOfDays andTna: tna

	netValue  := netValue + aValue.! !

!InvestmentNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:08:37'!
depositSimpleQuery: aValue
! !

!InvestmentNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:08:46'!
depositTransferQuery: aValue! !

!InvestmentNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:08:55'!
withdrawSimpleQuery: aValue
! !

!InvestmentNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:09:04'!
withdrawTransferQuery: aValue
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentNetQuery class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentNetQuery class
	instanceVariableNames: ''!

!InvestmentNetQuery class methodsFor: 'instance creation' stamp: 'JEC 5/14/2018 19:05:10'!
of: aReceptiveAccount 

	^self new initializeWith: aReceptiveAccount .! !


!classDefinition: #TransferNetQuery category: #'PortfolioTreePrinter-Ejercicio'!
Query subclass: #TransferNetQuery
	instanceVariableNames: 'account netValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferNetQuery methodsFor: 'value' stamp: 'JEC 5/14/2018 22:57:02'!
value

	account transactionsDo: [ :aTransaction | aTransaction sendValueTo: self ].
	
	^netValue.! !


!TransferNetQuery methodsFor: 'initialization' stamp: 'JEC 5/14/2018 18:54:34'!
initializeWith: aReceptiveAccount

	account := aReceptiveAccount.
	netValue := 0! !


!TransferNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:10:12'!
certificateOfDepositQueryWithValue: aValue numberOfDays: numberOfDays andTna: tna
! !

!TransferNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:10:21'!
depositSimpleQuery: aValue
! !

!TransferNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:10:28'!
depositTransferQuery: aValue

	netValue := netValue + aValue.! !

!TransferNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:10:37'!
withdrawSimpleQuery: aValue
! !

!TransferNetQuery methodsFor: 'queries' stamp: 'JEC 5/14/2018 23:10:45'!
withdrawTransferQuery: aValue

	netValue := netValue - aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNetQuery class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferNetQuery class
	instanceVariableNames: ''!

!TransferNetQuery class methodsFor: 'instance creation' stamp: 'JEC 5/14/2018 18:55:06'!
of: aReceptiveAccount 

	^self new initializeWith: aReceptiveAccount .! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
manages: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
registers: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:26'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount manages: anAccount) or: [ anAccount manages: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:01'!
manages: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!
registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'JEC 5/13/2018 17:02:00'!
initializeWith: aFirstAccount andWith: aSecondAccount

	accounts  add: aFirstAccount ; add: aSecondAccount.
	
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!
transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !


!Portfolio methodsFor: 'assertions' stamp: 'JEC 5/9/2018 19:57:51'!
assertAccountIsManaged: anAccount

	(self manages: anAccount)
		ifFalse: [ self error: Portfolio accountNotManagedMessageDescription ].! !

!Portfolio methodsFor: 'assertions' stamp: 'JEC 5/9/2018 19:59:46'!
assertAccountIsNotManaged: anAccount

	(self manages: anAccount)
		ifTrue: [ self error: Portfolio accountAlreadyManagedErrorMessage ].! !


!Portfolio methodsFor: 'private' stamp: 'JEC 5/13/2018 21:14:03'!
getDFOWithNames: accountNames withSpace: strSpaceToAppend in: names

	names add: (strSpaceToAppend, (accountNames at: self)).
	
	accounts do: [ :account | account getDFOWithNames: accountNames withSpace: (strSpaceToAppend, ' ') in: names ]! !

!Portfolio methodsFor: 'private' stamp: 'JEC 5/13/2018 21:20:01'!
getReverseDFOWithNames: accountNames withSpace: strSpaceToAppend in: names

	accounts reverseDo: [ :account | account getReverseDFOWithNames: accountNames withSpace: (strSpaceToAppend, ' ') in: names ].
	
	names add: (strSpaceToAppend, (accountNames at: self)).! !


!Portfolio methodsFor: 'value' stamp: 'JEC 5/14/2018 19:58:20'!
accountsDo: aBlock

	accounts do: [:anAccount | aBlock value: anAccount]! !

!Portfolio methodsFor: 'value' stamp: 'JEC 5/14/2018 23:09:31'!
sendValueTo: aQueryObject

	aQueryObject portfolioQuery: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'JEC 5/10/2018 20:58:30'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction modifyBalance: balance]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'JEC 5/14/2018 18:33:39'!
transactionsDo: aBlock

	transactions do:[:aTransaction | aBlock value: aTransaction]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
manages: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
registers: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'value' stamp: 'JEC 5/14/2018 23:09:58'!
sendValueTo: aQueryObject

	aQueryObject accountQuery: self.! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value fromAccount toAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'JEC 5/10/2018 19:07:25'!
initializeWithValue: aValue withFromAccount: aFromAccount withToAccount: aToAccount

	value := aValue.
	fromAccount := aFromAccount.
	toAccount := aToAccount.! !


!Transfer methodsFor: 'value' stamp: 'JEC 5/10/2018 19:10:31'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'JEC 5/10/2018 20:46:26'!
register: aValue from: fromAccount to: toAccount

	| transferInstance |

	transferInstance  := self new.
	transferInstance initializeWithValue: aValue withFromAccount: fromAccount  withToAccount: toAccount.
	
	fromAccount register: (WithdrawTransfer with: transferInstance) .
	toAccount register: (DepositTransfer with: transferInstance) .
	
	^transferInstance! !
