!classDefinition: #AplicationInterfaceTest category: #TusLibros!
TestCase subclass: #AplicationInterfaceTest
	instanceVariableNames: 'anApplicationInterface aValidClientId aValidPassword anotherValidClientId anotherValidPassword clients anObjectFactory aSalesRegister aValidBook anInvalidBook aCreditCardNumber anExpirationDate anotherValidBook aValidQuantity anInvalidCartId aCalendarMock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:44:06'!
test01CreateACartWithValidUserAndPasswordReturnsACartId

	| aCartId |

	aCartId _ 1.

	self assert: (anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword) = aCartId.! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:44:22'!
test02CreateACartForInvalidClientIdThrowsException

	| anInvalidClientId |

	anInvalidClientId _ 'invalid client'.

	self
		should: [ anApplicationInterface createCartFor: anInvalidClientId withPassword: aValidPassword ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: ApplicationInterface invalidClientErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/16/2018 15:27:08'!
test03CreateACartForUserWithInvalidPasswordThrowsException

	| anInvalidPassword |

	anInvalidPassword _ 'invalid password'.

	self
		should: [ anApplicationInterface createCartFor: aValidClientId withPassword: anInvalidPassword ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: ApplicationInterface invalidClientErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/16/2018 15:27:58'!
test04CanCreateMoreThanOneCartForAValidUser

	| firstCartId secondCartId |

	firstCartId _ 1.
	secondCartId _ 2.

	self assert: (anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword) = firstCartId.
	self assert: (anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword) = secondCartId.! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/17/2018 00:42:29'!
test05CanHaveCartsForMoreThanOneValidClient

	| firstCartId secondCartId |

	firstCartId _ 1.
	secondCartId _ 2.

	self assert: (anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword) = firstCartId.
	self assert: (anApplicationInterface createCartFor: anotherValidClientId withPassword: anotherValidPassword ) = secondCartId.! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:45:32'!
test06AddABookToCartThrowsExceptionWhenTheCartIdIsInvalid

	| aValidQuantity anInvalidCartId |

	aValidQuantity := 1.
	anInvalidCartId := 0.

	self
		should: [ anApplicationInterface add: aValidBook to: anInvalidCartId quantity: aValidQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface invalidCartIdErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:46:22'!
test07AddABookToCartThrowsExceptionWhenTheBookIsNotInTheCatalogue

	| aValidQuantity aCartId |

	aValidQuantity := 1.
	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.

	self
		should: [ anApplicationInterface add: anInvalidBook to: aCartId quantity: aValidQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface invalidBookErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:46:40'!
test08AddABookToCartThrowsExceptionWhenTheQuantityOfBookIsLessThanOne

	| anInvalidQuantity aCartId |

	anInvalidQuantity := 0.
	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.

	self
		should: [ anApplicationInterface add: aValidBook to: aCartId quantity: anInvalidQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface invalidBookQuantityErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:47:09'!
test09CanAddABookToClientsCart

	| aQuantity aCartId aListCart |

	aQuantity := 1.
	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.

	anApplicationInterface add: aValidBook to: aCartId quantity: aQuantity.

	aListCart := anApplicationInterface listCart: aCartId.
	self assert: (aListCart includesKey: aValidBook).
	self assert: (aListCart at: aValidBook) = aQuantity.! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/17/2018 21:27:36'!
test10GetCartWithInvalidCartIdThrowsException

	| anInvalidCartId |

	anInvalidCartId := 0.

	self 
		should: [ anApplicationInterface listCart: anInvalidCartId]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface invalidCartIdErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:50:27'!
test11CheckOutCartWithInvalidCartIdThrowsException

	| anInvalidCartId |

	anInvalidCartId := 0.

	self 
		should: [ anApplicationInterface 
						checkOutCart: anInvalidCartId 
						withCreditCardNumber: aCreditCardNumber 
						expirationDate: anExpirationDate 
						andName: aValidClientId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface invalidCartIdErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:51:12'!
test12CheckOutCartWithExpiredCreditCardThrowsException

	| aCartId anExpiredExpirationDate |

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.
	anExpiredExpirationDate := Month month: 01 year: 2015.

	self 
		should: [ anApplicationInterface 
						checkOutCart: aCartId 
						withCreditCardNumber: aCreditCardNumber 
						expirationDate: anExpiredExpirationDate 
						andName: aValidClientId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface expiredCreditCardErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:51:39'!
test13CheckOutEmptyCartThrowsException

	| aCartId |

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.

	self 
		should: [ anApplicationInterface 
						checkOutCart: aCartId 
						withCreditCardNumber: aCreditCardNumber 
						expirationDate: anExpirationDate 
						andName: aValidClientId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface checkingOutEmptyCartErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:53:21'!
test14CanCheckOutNotEmptyCartWithValidCreditCard

	| aCartId aQuantity expectedSale expectedTransactionId expectedBooksWithQuantity expectedTotalAmount |

	aQuantity := 1.

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.
	anApplicationInterface add: aValidBook to: aCartId quantity: aQuantity.

	expectedTransactionId := 1.
	expectedBooksWithQuantity := Dictionary new.
	expectedBooksWithQuantity add: (aValidBook -> aQuantity).
	expectedTotalAmount := anObjectFactory catalogue at: aValidBook.
	expectedSale := Sale for: aValidClientId with: expectedBooksWithQuantity and: expectedTotalAmount.
	
	self assert: (anApplicationInterface 
							checkOutCart: aCartId 
							withCreditCardNumber: aCreditCardNumber 
							expirationDate: anExpirationDate 
							andName: aValidClientId) = expectedTransactionId.
	
	self assert: (aSalesRegister includes: expectedSale).
	! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 00:33:38'!
test15ListPurchasesWithInvalidClientIdThrowsException

	| anInvalidClientId |

	anInvalidClientId := -1.
	
	self
		should: [ anApplicationInterface listPurchasesFor: anInvalidClientId withPassword: aValidPassword ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: ApplicationInterface invalidClientErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:54:14'!
test16CanGetListPurchasesOfAValidClientWithOneBook

	| aCartId aQuantity expectedSale expectedBooksWithQuantity expectedTotalAmount |

	aQuantity := 1.

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.
	anApplicationInterface add: aValidBook to: aCartId quantity: aQuantity.

	anApplicationInterface 
		checkOutCart: aCartId 
		withCreditCardNumber: aCreditCardNumber 
		expirationDate: anExpirationDate 
		andName: aValidClientId .

	expectedBooksWithQuantity := Dictionary new.
	expectedBooksWithQuantity add: (aValidBook -> aQuantity).
	expectedTotalAmount := anObjectFactory catalogue at: aValidBook.
	expectedSale := Sale for: aValidClientId with: expectedBooksWithQuantity and: expectedTotalAmount.
	self assert: (anApplicationInterface listPurchasesFor: aValidClientId withPassword: aValidPassword) =  expectedSale.! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 01:55:58'!
test17CanGetListPurchasesOfAValidClientWithMultipleBooks

	| aCartId aQuantity expectedSale expectedBooksWithQuantity expectedTotalAmount |

	anotherValidBook := anObjectFactory anotherValidBook.
	aQuantity := 5.

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.
	anApplicationInterface add: aValidBook to: aCartId quantity: aQuantity.
	anApplicationInterface add: anotherValidBook to: aCartId quantity: aQuantity.

	anApplicationInterface 
		checkOutCart: aCartId 
		withCreditCardNumber: aCreditCardNumber 
		expirationDate: anExpirationDate 
		andName: aValidClientId .

	expectedBooksWithQuantity := Dictionary new.
	expectedBooksWithQuantity add: (aValidBook -> aQuantity); add: (anotherValidBook -> aQuantity).
	expectedTotalAmount := ((anObjectFactory catalogue at: aValidBook) * aQuantity) + ((anObjectFactory catalogue at: anotherValidBook) * aQuantity).
	expectedSale := Sale for: aValidClientId with: expectedBooksWithQuantity and: expectedTotalAmount.
	self assert: (anApplicationInterface listPurchasesFor: aValidClientId withPassword: aValidPassword) =  expectedSale.! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 03:18:23'!
test18AddABookToCartThrowsExceptionWhenTheTimeHasExpired

	| aCartId |

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.	

	aCalendarMock addMinutes: 31.

	self
		should: [ anApplicationInterface add: aValidBook to: aCartId quantity: aValidQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface expiredCartErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 13:33:46'!
test19CheckOutNotEmptyCartWithValidCreditCardThrowsExceptionWhenTheTimeHasExpired

	| aCartId aQuantity |

	aQuantity := 1.

	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.
	anApplicationInterface add: aValidBook to: aCartId quantity: aQuantity.

	aCalendarMock addMinutes: 31.

	self
		should: [ anApplicationInterface 
						checkOutCart: aCartId 
						withCreditCardNumber: aCreditCardNumber 
						expirationDate: anExpirationDate 
						andName: aValidClientId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface expiredCartErrorMessage = anError messageText ].! !

!AplicationInterfaceTest methodsFor: 'tests' stamp: 'JEC 6/18/2018 13:33:39'!
test20ListCartWithExpiredCartThrowsException

	| aQuantity aCartId |

	aQuantity := 1.
	aCartId := anApplicationInterface createCartFor: aValidClientId withPassword: aValidPassword.

	anApplicationInterface add: aValidBook to: aCartId quantity: aQuantity.

	aCalendarMock addMinutes: 31.

	self
		should: [ anApplicationInterface listCart: aCartId ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: ApplicationInterface expiredCartErrorMessage = anError messageText ].! !


!AplicationInterfaceTest methodsFor: 'setUp' stamp: 'JEC 6/18/2018 03:10:18'!
setUp

	anObjectFactory := ObjectFactory new.
	aValidClientId := anObjectFactory validClientId.
	aValidPassword := anObjectFactory validPassword.
	anotherValidClientId := anObjectFactory anotherValidClientId.
	anotherValidPassword := anObjectFactory anotherValidPassword.
	aValidBook := anObjectFactory validBook.
	anotherValidBook := anObjectFactory anotherValidBook.
	anInvalidBook := anObjectFactory invalidBook.
	aValidQuantity := 1.
	anInvalidCartId := 0.
	aCreditCardNumber := '0000 0000 0000 0000'.
	anExpirationDate := Month month: 01 year: 2020.
	clients := Dictionary new.
	clients add: aValidClientId -> aValidPassword; add: anotherValidClientId -> anotherValidPassword.
	aSalesRegister _ OrderedCollection new.
	aCalendarMock := anObjectFactory calendarMock.
	anApplicationInterface := ApplicationInterface clients: clients 
									catalogue: anObjectFactory catalogue 
									clock: aCalendarMock
									salesRegister: aSalesRegister
									merchantProcessor: MerchantProcessorSimulator new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AplicationInterfaceTest class' category: #TusLibros!
AplicationInterfaceTest class
	instanceVariableNames: 'aCalendarMock'!


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'anObjectFactory aCart aValidBook aBookQuantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 18:54:27'!
test01WhenCreatingANewCartCreatesAnEmptyCart

	self assert: aCart isEmpty.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:07:21'!
test02AfterAddingSomeBooksTheCartItIsNotEmptyAndItsSizeIsTheQuantityOfAllBooks

	aCart add: aValidBook with: aBookQuantity.

	self deny: aCart isEmpty.
	self assert: aCart size = aBookQuantity.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:07:40'!
test03CanAddMoreThanOneBookToTheCart

	| anotherBookQuantity |

	anotherBookQuantity _ 2.

	aCart add: aValidBook with: aBookQuantity.
	aCart add: anObjectFactory anotherValidBook with: anotherBookQuantity.

	self assert: (aCart includes: aValidBook).
	self assert: (aCart includes: anObjectFactory anotherValidBook).! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:07:56'!
test06CanGetAllTheBookWithTheirQuantity

	| anotherBookQuantity expectedDictionary |

	anotherBookQuantity _ 2.
	aCart add: aValidBook with: aBookQuantity.
	aCart add: anObjectFactory anotherValidBook with: anotherBookQuantity.
	expectedDictionary _ Dictionary new.
	expectedDictionary add: anObjectFactory validBook -> aBookQuantity; add: anObjectFactory anotherValidBook -> anotherBookQuantity.

	self assert: aCart booksWithQuantity = expectedDictionary.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:08:15'!
test07CannotAddABookToACartThatIsNotInItsCatalogue

	| aNonCataloguedBook |

	aNonCataloguedBook _ anObjectFactory invalidBook.

	self
		should: [ aCart add: aNonCataloguedBook with: aBookQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookThatIsNotInTheCatalogueErrorMessage equals: anError messageText ].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:06:37'!
test08CannotAddABookWithQuantityLessThanOne

	| aNonPositiveQuantity |

	aNonPositiveQuantity _ 0.

	self
		should: [ aCart add: aValidBook with: aNonPositiveQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookWithQuantityLessThanOneErrorMessage equals: anError messageText.
			self assert: aCart isEmpty ].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:06:45'!
test09CannotAddABookWithQuantityNonInteger

	| aNonIntegerQuantity |

	aNonIntegerQuantity _ 1.1.

	self 
		should: [ aCart add: aValidBook with: aNonIntegerQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookWithANonIntegerQuantityErrorMessage equals: anError messageText.
			self assert: aCart isEmpty ].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/11/2018 19:08:27'!
test10ACartCanReturnItsTotalPrice

	| expectedPrice |

	aCart add: aValidBook with: aBookQuantity.

	expectedPrice _ (anObjectFactory catalogue at: anObjectFactory validBook ) * aBookQuantity.
	self assert: aCart totalPrice equals: expectedPrice.! !


!CartTest methodsFor: 'setUp' stamp: 'JEC 6/11/2018 19:07:10'!
setUp

	anObjectFactory := ObjectFactory new.
	aCart := anObjectFactory cart.
	aValidBook := anObjectFactory validBook.
	aBookQuantity := 2.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'aCart aSalesRegister aCashier aBookQuantity anObjectFactory aValidBook aMerchantProcessor aCreditCard aTransactionId anotherCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 20:07:24'!
test01CannotCheckoutAnEmptyCart

	self 
		assertThrowableWithMerchantProcessorBehaviour: [ aMerchantProcessor ok ] 
		testSetup: [ ] 
		testExcercise: [ aCashier checkout: aCart with: aCreditCard ] 
		andTestAssert: [ :anErrorMessageText | 
			self assert: Cashier cannotCheckoutAnEmptyCartErrorMessage equals: anErrorMessageText ]! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 19:48:34'!
test03CheckingOutANonEmptyCartAndAValidCreditCardReturnTheTransactionId

	| expectedTransactionId |
	
	aMerchantProcessor defineBehaviour: [ aMerchantProcessor ok ].
	aBookQuantity _ 1.

	aCart add: aValidBook with: aBookQuantity.
	expectedTransactionId _ 1.

	self assert: (aCashier checkout: aCart with: aCreditCard) = expectedTransactionId.! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/18/2018 00:56:14'!
test04CheckingOutANonEmptyCartRegistersASaleInTheSalesRegister

	| aSale expectedSalesRegister |

	aMerchantProcessor defineBehaviour: [ aMerchantProcessor ok ].
	
	aCart add: aValidBook with: aBookQuantity.

	aCashier checkout: aCart with: aCreditCard.

	aSale _ Sale for: aCreditCard name with: aCart booksWithQuantity and: aCart totalPrice.
	expectedSalesRegister _ OrderedCollection with: aSale.

	self assert: aSalesRegister = expectedSalesRegister.! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/18/2018 01:36:19'!
test05CheckingOutSomeNonEmptyCartRegistersAllSalesInTheSalesRegister

	| aSale anotherSale anotherCashier expectedSalesRegister |

	aMerchantProcessor defineBehaviour: [ aMerchantProcessor ok ].

	aCart add: aValidBook with: aBookQuantity.
	anotherCart add: anObjectFactory anotherValidBook with: aBookQuantity.
	anotherCashier _ Cashier 
							withSalesRegister: aSalesRegister 
							calendar: anObjectFactory calendarMock 
							merchantProcessor: aMerchantProcessor
							andTransactionId: aTransactionId.

	aCashier checkout: aCart with: aCreditCard.
	anotherCashier checkout: anotherCart with: aCreditCard.

	aSale _ Sale for: aCreditCard name with: aCart booksWithQuantity and: aCart totalPrice.
	anotherSale _ Sale for: aCreditCard name with: anotherCart booksWithQuantity and: anotherCart totalPrice.
	expectedSalesRegister _ OrderedCollection with: aSale with: anotherSale.
	self assert: aSalesRegister = expectedSalesRegister.! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 21:03:01'!
test06CheckingOutWithExpiredCreditCardMustRaiseException

	self 
		assertThrowableWithoutRequestMerchantProcessorWithMerchantProcessorBehaviour: [ aMerchantProcessor expiredCreditCard ]
		testSetup: [ aCart add: aValidBook with: aBookQuantity ]
		testExcercise: [ aCashier checkout: aCart with: anObjectFactory expiredCreditCard ]
		andTestAssert: [ :anErrorMessageText | 
			self assert: Cashier cannotCheckoutWithAnExpiredCreditCardErrorMessage equals: anErrorMessageText.
		]
! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 20:11:34'!
test08CheckingOutWithStolenCreditCardMustRaiseException

	self 
		assertThrowableWithMerchantProcessorBehaviour: [ aMerchantProcessor stolenCreditCard ] 
		testSetup: [ aCart add: aValidBook with: aBookQuantity ] 
		testExcercise: [ aCashier checkout: aCart with: aCreditCard ] 
		andTestAssert: [ :anErrorMessageText | 
			self assert: MerchantProcessorSimulator stolenCreditCardErrorMessage equals: anErrorMessageText ]! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 20:13:54'!
test09CheckingOutWithInvalidCreditCardMustRaiseException

	self 
		assertThrowableWithMerchantProcessorBehaviour: [ aMerchantProcessor invalidCreditCard ] 
		testSetup: [ aCart add: aValidBook with: aBookQuantity ] 
		testExcercise: [ aCashier checkout: aCart with: aCreditCard ] 
		andTestAssert: [ :anErrorMessageText | 
			self assert: MerchantProcessorSimulator invalidCreditCardErrorMessage equals: anErrorMessageText ]! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 20:15:03'!
test10CheckingOutWhenTheMerchantProcessorIsOutOfService

	self 
		assertThrowableWithMerchantProcessorBehaviour: [ aMerchantProcessor outOfService ] 
		testSetup: [ aCart add: aValidBook with: aBookQuantity ] 
		testExcercise: [ aCashier checkout: aCart with: aCreditCard ] 
		andTestAssert: [ :anErrorMessageText | 
			self assert: MerchantProcessorSimulator outOfServiceErrorMessage equals: anErrorMessageText ]! !


!CashierTest methodsFor: 'setUp' stamp: 'JEC 6/18/2018 01:35:56'!
setUp

	anObjectFactory := ObjectFactory new.
	aCart _ anObjectFactory cart.
	anotherCart := anObjectFactory cart.
	aMerchantProcessor := anObjectFactory merchantProcessorSimulator.
	aSalesRegister _ anObjectFactory salesRegister.
	aTransactionId := 0.
	aCashier _ Cashier 
					withSalesRegister: aSalesRegister 
					calendar: anObjectFactory calendarMock 
					merchantProcessor: aMerchantProcessor 
					andTransactionId: aTransactionId.
	aCreditCard _ anObjectFactory validCreditCard.
	aBookQuantity _ 2.
	aValidBook := anObjectFactory validBook.! !


!CashierTest methodsFor: 'assertion' stamp: 'JEC 6/13/2018 20:08:11'!
assertThrowableWithMerchantProcessorBehaviour: aBehaviourClosure testSetup: aSetupClosure testExcercise: anExcerciseClosure andTestAssert: anAssertClosure

	aMerchantProcessor defineBehaviour: aBehaviourClosure.
	
	aSetupClosure value.

	self
		should: anExcerciseClosure
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: aSalesRegister isEmpty.
			anAssertClosure value: anError messageText.
		].! !

!CashierTest methodsFor: 'assertion' stamp: 'JEC 6/13/2018 21:00:21'!
assertThrowableWithoutRequestMerchantProcessorWithMerchantProcessorBehaviour: aBehaviourClosure testSetup: aSetupClosure testExcercise: anExcerciseClosure andTestAssert: anAssertClosure

	| hasRequestToMerchantProcessor |
	
	hasRequestToMerchantProcessor := false.

	self 
		assertThrowableWithMerchantProcessorBehaviour: [ aBehaviourClosure value.
			hasRequestToMerchantProcessor := true. ] 
		testSetup: aSetupClosure 
		testExcercise: anExcerciseClosure 
		andTestAssert: [ :anErrorMessageText | 
			anAssertClosure value: anErrorMessageText .
			self deny: hasRequestToMerchantProcessor
		].! !


!classDefinition: #ApplicationInterface category: #TusLibros!
Object subclass: #ApplicationInterface
	instanceVariableNames: 'clients catalogue cartId clock salesRegister transactionId merchantProcessor sessions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/17/2018 21:04:06'!
assertBookInCatalogue: aBook

	(catalogue includesKey: aBook)
		ifFalse: [ self error: self class invalidBookErrorMessage ].! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/18/2018 02:25:35'!
assertCartIsNotEmpty: aCart

	aCart isEmpty
		ifTrue: [ self error: self class checkingOutEmptyCartErrorMessage ].! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/17/2018 22:13:25'!
assertCreditCardIsNotExpired: aCreditCard

	(aCreditCard isExpiredOnDate: clock now)
		ifTrue: [ self error: self class expiredCreditCardErrorMessage ]! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/18/2018 03:05:07'!
assertNotExpiredCart: aCartId

	| aCartIdSession |

	aCartIdSession := self sessionFrom: aCartId.
	
	(aCartIdSession isExpiredOnDate: clock now)
		ifTrue: [ self error: self class expiredCartErrorMessage ].! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/17/2018 21:04:53'!
assertValidBookQuantity: aQuantity

	aQuantity <= 0
		ifTrue: [ self error: self class invalidBookQuantityErrorMessage ].! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/18/2018 02:46:46'!
assertValidCartId: aCartId

	sessions detect: [ :aSession | aSession cartId = aCartId ] ifNone: [ self error: self class invalidCartIdErrorMessage ].! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/17/2018 00:33:37'!
assertValidClient: aClientId andValidPassword: aPassword.

	((clients includesKey: aClientId) and: [ (clients at: aClientId) = aPassword ])
		ifFalse:[ self error: self class invalidClientErrorMessage ].! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/17/2018 20:11:23'!
nextCartId

	cartId := cartId + 1.
	
	^cartId.! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/18/2018 03:02:32'!
returnCartFromSessions: aCartId

	^ ( self sessionFrom: aCartId ) cart.! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/18/2018 03:02:53'!
sessionFrom: aCartId

	^ sessions detect: [ :aSession | aSession cartId = aCartId] ifNone: [ self error: self class invalidCartIdErrorMessage ]! !

!ApplicationInterface methodsFor: 'private' stamp: 'JEC 6/18/2018 13:34:49'!
updateExpirationTimeOf: aCartId

	| aCartIdSession |

	aCartIdSession := self sessionFrom: aCartId.

	aCartIdSession updateExpirationTimeWithDate: clock now.! !


!ApplicationInterface methodsFor: 'adding' stamp: 'JEC 6/18/2018 03:35:27'!
add: aBook to: aCartId quantity: aQuantity

	| cart |

	self assertValidCartId: aCartId.
	self assertNotExpiredCart: aCartId.
	self assertBookInCatalogue: aBook.
	self assertValidBookQuantity: aQuantity.

	cart := self returnCartFromSessions: aCartId.

	cart add: aBook with: aQuantity.
	
	self updateExpirationTimeOf: aCartId.! !


!ApplicationInterface methodsFor: 'checking out' stamp: 'JEC 6/18/2018 03:00:15'!
checkOutCart: aCartId withCreditCardNumber: aCreditCardNumber expirationDate: anExpirationDate andName: aClientName

	| aCreditCard aCart aCashier |

	aCreditCard := CreditCard of: aClientName with: aCreditCardNumber expirationDate: anExpirationDate.
	self assertCreditCardIsNotExpired: aCreditCard.

	self assertValidCartId: aCartId.
	self assertNotExpiredCart: aCartId.
	aCart := self returnCartFromSessions: aCartId.

	self assertCartIsNotEmpty: aCart.

	aCashier := Cashier withSalesRegister: salesRegister calendar: clock merchantProcessor: merchantProcessor andTransactionId: transactionId.
	^aCashier checkout: aCart with: aCreditCard.! !


!ApplicationInterface methodsFor: 'creation' stamp: 'JEC 6/18/2018 03:17:59'!
createCartFor: aClientId withPassword: aPassword 

	| aCartId aCart expirationDateAndTime |

	self assertValidClient: aClientId andValidPassword: aPassword.

	aCartId := self nextCartId.
	aCart := Cart with: catalogue.
	expirationDateAndTime := (DateAndTime date: clock now date time: clock now time) + (Duration minutes: 30).
	sessions add: (Session clientId: aClientId cartId: aCartId cart: aCart expirationDateAndTime: expirationDateAndTime).

	^ aCartId.! !


!ApplicationInterface methodsFor: 'listing' stamp: 'JEC 6/18/2018 03:35:40'!
listCart: aCartId

	self assertNotExpiredCart: aCartId.
	self updateExpirationTimeOf: aCartId.

	^ (self returnCartFromSessions: aCartId ) booksWithQuantity copy! !

!ApplicationInterface methodsFor: 'listing' stamp: 'JEC 6/18/2018 01:14:14'!
listPurchasesFor: aClientId withPassword: aPassword

	| salesFromClient aBookWithQuantities aTotalAmount quantity |

	self assertValidClient: aClientId andValidPassword: aPassword.

	salesFromClient := salesRegister select: [ :aSale | aSale client = aClientId ].

	aTotalAmount := salesFromClient inject: 0 into: [ :sum :aSale | sum + aSale totalPrice ].
	aBookWithQuantities := Dictionary new.
	catalogue keys do: [ :aBook  |
		quantity := salesFromClient inject: 0 into: [ :sum :aSale | sum + (aSale booksWithQuantities at: aBook ifAbsent: [0] ) ].
		quantity = 0
			ifFalse: [ aBookWithQuantities add: aBook -> quantity ].
	].

	^Sale for: aClientId with: aBookWithQuantities and: aTotalAmount.! !


!ApplicationInterface methodsFor: 'initialization' stamp: 'JEC 6/18/2018 02:43:13'!
initializeWithClients: aClientsDictionary catalogue: aCatalogue clock: aCalendarClock salesRegister: aSalesRegister merchantProcessor: aMerchantProcessor.

	cartId := 0.
	transactionId := 0.
	clients := aClientsDictionary.
	catalogue := aCatalogue.
	clock := aCalendarClock.
	salesRegister := aSalesRegister.
	merchantProcessor := aMerchantProcessor.
	sessions := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ApplicationInterface class' category: #TusLibros!
ApplicationInterface class
	instanceVariableNames: ''!

!ApplicationInterface class methodsFor: 'error messages' stamp: 'JEC 6/17/2018 23:47:20'!
checkingOutEmptyCartErrorMessage

	^'Cannot check out empty cart'.! !

!ApplicationInterface class methodsFor: 'error messages' stamp: 'JEC 6/17/2018 22:13:57'!
expiredCreditCardErrorMessage
	
	^'Expired credit card'.! !

!ApplicationInterface class methodsFor: 'error messages' stamp: 'JEC 6/17/2018 19:20:17'!
invalidBookErrorMessage

	^'Invalid book'! !

!ApplicationInterface class methodsFor: 'error messages' stamp: 'JEC 6/17/2018 19:32:42'!
invalidBookQuantityErrorMessage

	^'Invalid Book Quantity. Must be more or equal than one.'! !

!ApplicationInterface class methodsFor: 'error messages' stamp: 'JEC 6/17/2018 19:04:12'!
invalidCartIdErrorMessage
	
	^'Invalid cart id'.! !

!ApplicationInterface class methodsFor: 'error messages' stamp: 'JEC 6/14/2018 20:07:04'!
invalidClientErrorMessage
	
	^'Invalid client'.! !


!ApplicationInterface class methodsFor: 'instance creation' stamp: 'JEC 6/18/2018 00:21:10'!
clients: aClientsDictionary catalogue: aCatalogue clock: aCalendarClock salesRegister: aSalesRegister merchantProcessor: aMerchantProcessor

	^self new initializeWithClients: aClientsDictionary 
				catalogue: aCatalogue 
				clock: aCalendarClock 
				salesRegister: aSalesRegister 
				merchantProcessor: aMerchantProcessor.! !


!ApplicationInterface class methodsFor: 'as yet unclassified' stamp: 'JEC 6/18/2018 03:18:56'!
expiredCartErrorMessage

	^'Expired cart'! !


!classDefinition: #CalendarMock category: #TusLibros!
Object subclass: #CalendarMock
	instanceVariableNames: 'presentDateTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CalendarMock methodsFor: 'present date and time' stamp: 'JEC 6/10/2018 22:50:49'!
now

	^ presentDateTime copy.! !


!CalendarMock methodsFor: 'initialization' stamp: 'JEC 6/10/2018 21:07:50'!
initializeWith: aPresentDateTime

	presentDateTime := aPresentDateTime.! !


!CalendarMock methodsFor: 'as yet unclassified' stamp: 'JEC 6/18/2018 02:36:33'!
addMinutes: aMinutesQuantity

	presentDateTime := presentDateTime + (Duration minutes: aMinutesQuantity).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalendarMock class' category: #TusLibros!
CalendarMock class
	instanceVariableNames: 'presentDateTime'!

!CalendarMock class methodsFor: 'instance creation' stamp: 'JEC 6/10/2018 21:53:50'!
with: aPresentDateTime

	^self new initializeWith: aPresentDateTime.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'books catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'books' stamp: 'JEC 6/6/2018 21:10:43'!
booksWithQuantity

	| booksSet |
	
	booksSet := books asSet.

	^ booksSet inject: Dictionary new into: [ :aDictionary :aBook | aDictionary add: aBook -> (books occurrencesOf: aBook); yourself ]! !


!Cart methodsFor: 'initialization' stamp: 'JEC 6/6/2018 20:06:23'!
initializeWith: aCatalogue

	books := OrderedCollection new.
	catalogue := aCatalogue.! !


!Cart methodsFor: 'testing' stamp: 'JEC 6/7/2018 19:26:51'!
includes: aBook

	^books includes: aBook.! !

!Cart methodsFor: 'testing' stamp: 'JEC 6/4/2018 21:21:28'!
isEmpty
	
	^books isEmpty.! !


!Cart methodsFor: 'private' stamp: 'JEC 6/7/2018 19:21:18'!
assertBookInCart: aBook

	(catalogue includesKey: aBook)
		ifFalse: [ self error: self class cannotAddABookThatIsNotInTheCatalogueErrorMessage ].! !

!Cart methodsFor: 'private' stamp: 'JEC 6/7/2018 19:01:32'!
assertQuantityIsAnInteger: aQuantity

	aQuantity isInteger 
		ifFalse: [ self error: self class cannotAddABookWithANonIntegerQuantityErrorMessage ].! !

!Cart methodsFor: 'private' stamp: 'JEC 6/6/2018 19:46:05'!
assertQuantityIsMoreOrEqualThanOne: aQuantity
	
	(aQuantity < 1)
		ifTrue: [self error: self class cannotAddABookWithQuantityLessThanOneErrorMessage ].! !


!Cart methodsFor: 'adding' stamp: 'JEC 6/7/2018 19:01:13'!
add: aBook with: aQuantity

	self assertBookInCart: aBook.
	self assertQuantityIsMoreOrEqualThanOne: aQuantity.
	self assertQuantityIsAnInteger: aQuantity.

	(1 to: aQuantity) do: [ :index | books add: aBook ].! !


!Cart methodsFor: 'accessing' stamp: 'JEC 6/6/2018 20:23:51'!
size

	^books size! !


!Cart methodsFor: 'total price' stamp: 'JEC 6/10/2018 16:22:30'!
totalPrice

	| booksWithQuantity |

	booksWithQuantity := self booksWithQuantity.

	^ booksWithQuantity keys inject: 0 into: [ :priceSum :aBook | priceSum + ((booksWithQuantity at: aBook) * (catalogue at: aBook)) ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'JEC 6/4/2018 21:26:50'!
with: aCatalogue

	^self new initializeWith: aCatalogue.! !


!Cart class methodsFor: 'error messages' stamp: 'JEC 6/4/2018 21:30:45'!
cannotAddABookThatIsNotInTheCatalogueErrorMessage

	^'Cannot add a book that is not in the catalogue'! !

!Cart class methodsFor: 'error messages' stamp: 'JEC 6/7/2018 18:53:17'!
cannotAddABookWithANonIntegerQuantityErrorMessage
	
	^'Cannot add a Book with a non integer quantity'! !

!Cart class methodsFor: 'error messages' stamp: 'JEC 6/6/2018 19:43:39'!
cannotAddABookWithQuantityLessThanOneErrorMessage
	
	^'Cannot add a book with quantity less than one'.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'transactionId salesRegister clock merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 21:30:31'!
assertThatTheCartIsNotEmpty: aCart

	aCart booksWithQuantity isEmpty 
		ifTrue: [self error: self class cannotCheckoutAnEmptyCartErrorMessage ].
! !

!Cashier methodsFor: 'private' stamp: 'JEC 6/17/2018 22:52:52'!
assertThatTheCreditCardIsNotExpired: aCreditCard 
	
	(aCreditCard isExpiredOnDate: clock now)
		ifTrue: [ self error: self class cannotCheckoutWithAnExpiredCreditCardErrorMessage ].! !

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 17:23:49'!
nextTransactionId

	transactionId := transactionId + 1.

	^transactionId! !


!Cashier methodsFor: 'check out' stamp: 'JEC 6/18/2018 00:54:40'!
checkout: aCart with: aCreditCard 

	| aSale |

	self assertThatTheCartIsNotEmpty: aCart .
	self assertThatTheCreditCardIsNotExpired: aCreditCard.

	merchantProcessor debit: aCart totalPrice to: aCreditCard.

	aSale := Sale for: aCreditCard name with: aCart booksWithQuantity and: aCart totalPrice.
	salesRegister add: aSale.

	^self nextTransactionId.! !


!Cashier methodsFor: 'initialization' stamp: 'JEC 6/13/2018 21:17:27'!
initializeWithSalesRegister: aSalesRegister calendar: aCalendarClock merchantProcessor: aMerchantProcessor andTransactionId: aTransactionId

	transactionId _ aTransactionId.
	salesRegister _ aSalesRegister.
	clock _ aCalendarClock.
	merchantProcessor _ aMerchantProcessor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'JEC 6/10/2018 21:29:54'!
cannotCheckoutAnEmptyCartErrorMessage

	^'Cannot checkout an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'JEC 6/10/2018 23:09:56'!
cannotCheckoutWithAnExpiredCreditCardErrorMessage

	^'Cannot checkout with an expired credit card'.! !

!Cashier class methodsFor: 'error messages' stamp: 'JEC 6/10/2018 23:09:52'!
cannotCheckoutWithAnIncorrectMonthOfYearIntervalCreditCardErrorMessage

	^'Cannot checkout with a credit card with incorrect month of year interval'.! !


!Cashier class methodsFor: 'instance creation' stamp: 'JEC 6/13/2018 21:15:56'!
withSalesRegister: aSalesRegister calendar: aClock merchantProcessor: aMerchantProcessor andTransactionId: aTransactionId

	^ self new
		initializeWithSalesRegister: aSalesRegister
		calendar: aClock
		merchantProcessor: aMerchantProcessor
		andTransactionId: aTransactionId.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'personName creditCardNumber expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'JEC 6/17/2018 23:35:42'!
isExpiredOnDate: aDateAndTime

	^ (aDateAndTime yearNumber < expirationDate yearNumber or:
		[ aDateAndTime yearNumber < expirationDate yearNumber and: 
			[ aDateAndTime monthIndex <= expirationDate monthIndex ] ] ) not.! !


!CreditCard methodsFor: 'initialization' stamp: 'JEC 6/18/2018 00:55:18'!
initializeWithName: aPersonName creditCardNumber: aCreditCardNumber expirationDate: anExpirationDate

	personName := aPersonName.
	creditCardNumber := aCreditCardNumber.
	expirationDate := anExpirationDate.! !


!CreditCard methodsFor: 'accessing' stamp: 'JEC 6/18/2018 00:55:26'!
name

	^personName copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'GAC 6/11/2018 16:28:04'!
cannotExistWithAnIncorrectMonthOfYearIntervalCreditCardErrorMessage

	^'Cannot exist a credit card with incorrect month of year interval'.! !

!CreditCard class methodsFor: 'instance creation' stamp: 'JEC 6/17/2018 22:42:13'!
of: aPersonName with: aCreditCardNumber expirationDate: anExpirationDate

	^self new initializeWithName: aPersonName creditCardNumber: aCreditCardNumber expirationDate: anExpirationDate .! !


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'behaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'behaviours' stamp: 'JEC 6/13/2018 21:08:13'!
expiredCreditCard

	self error: 'Merchant Processor expired credit card'.! !

!MerchantProcessorSimulator methodsFor: 'behaviours' stamp: 'JEC 6/11/2018 20:33:05'!
invalidCreditCard

	self error: self class invalidCreditCardErrorMessage.! !

!MerchantProcessorSimulator methodsFor: 'behaviours' stamp: 'JEC 6/11/2018 20:05:33'!
ok
! !

!MerchantProcessorSimulator methodsFor: 'behaviours' stamp: 'JEC 6/13/2018 21:08:00'!
outOfService

	self error: self class outOfServiceErrorMessage.! !

!MerchantProcessorSimulator methodsFor: 'behaviours' stamp: 'JEC 6/11/2018 20:31:49'!
stolenCreditCard

	self error: self class stolenCreditCardErrorMessage.! !


!MerchantProcessorSimulator methodsFor: 'debit' stamp: 'JEC 6/13/2018 21:08:26'!
debit: aValue to: aCreditCard 

	behaviour value.! !


!MerchantProcessorSimulator methodsFor: 'defining behaviour' stamp: 'JEC 6/13/2018 21:08:20'!
defineBehaviour: aBlockClosure

	behaviour := aBlockClosure.! !


!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'JEC 6/18/2018 00:29:37'!
initialize

	behaviour := [ self ok ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'error messages' stamp: 'JEC 6/11/2018 20:33:32'!
invalidCreditCardErrorMessage

	^'Merchant Processor - Invalid credit card'! !

!MerchantProcessorSimulator class methodsFor: 'error messages' stamp: 'JEC 6/13/2018 21:09:59'!
outOfServiceErrorMessage

	^'Merchant Processor - Out of service'.! !

!MerchantProcessorSimulator class methodsFor: 'error messages' stamp: 'JEC 6/11/2018 20:30:56'!
stolenCreditCardErrorMessage

	^'Merchant Processor - Stolen credit card'! !


!classDefinition: #ObjectFactory category: #TusLibros!
Object subclass: #ObjectFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:18'!
anotherValidBook

	^'another valid book'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:42:17'!
anotherValidClientId

	^'another valid client'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:42:31'!
anotherValidPassword

	^'another valid password'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/17/2018 22:50:23'!
calendarMock

	| aDate aTime |

	aDate := Date year: 2018 month: 06 day: 17.
	aTime := Time hour: 0 minute: 0 second: 0.

	^CalendarMock with: (DateAndTime date: aDate time: aTime).! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:34'!
cart

	^Cart with: self catalogue.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:38:33'!
cashier

	| startingTransactionId |

	startingTransactionId := 0.

	^Cashier
		withSalesRegister: self salesRegister 
		calendar: self calendarMock
		merchantProcessor: self merchantProcessorSimulator 
		andTransactionId: startingTransactionId.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:43'!
catalogue

	| aPrice anotherPrice aCatalogue |

	aCatalogue := Dictionary new.
	aPrice := 1.
	anotherPrice := 2.
	aCatalogue add: self validBook -> aPrice.
	aCatalogue add: self anotherValidBook -> anotherPrice.

	^aCatalogue.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:43:15'!
expiredCreditCard

	"Expired in respect to the Calendar Mock"

	| aPersonName aCreditCardNumber anExpiredExpirationDate |

	aPersonName _ self validClientId .
	aCreditCardNumber _ '0000000000000000'.
	anExpiredExpirationDate _ Month month: 01 year: 2015.

	^ CreditCard of: aPersonName with: aCreditCardNumber expirationDate: anExpiredExpirationDate.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:51:19'!
invalidBook

	^'an invalid book'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 00:27:32'!
merchantProcessorSimulator

	^MerchantProcessorSimulator new.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:34:27'!
salesRegister

	^OrderedCollection new.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:51:24'!
validBook

	^'a valid book'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:41:17'!
validClientId

	^'a client name'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 13:45:33'!
validCreditCard

	"Valid in respect of the Calendar Mock"

	| aPersonName aCreditCardNumber anExpirationDate |

	aPersonName _ self validClientId.
	aCreditCardNumber _ '0000000000000000'.
	anExpirationDate _ Month month: 01 year: 2020.

	^ CreditCard of: aPersonName with: aCreditCardNumber expirationDate: anExpirationDate.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/18/2018 01:41:49'!
validPassword

	^'a password'! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'booksWithQuantities totalPrice client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'accessing' stamp: 'JEC 6/10/2018 18:40:21'!
booksWithQuantities

	^booksWithQuantities copy.! !

!Sale methodsFor: 'accessing' stamp: 'JEC 6/18/2018 00:53:08'!
client

	^client copy.! !

!Sale methodsFor: 'accessing' stamp: 'JEC 6/10/2018 18:40:32'!
totalPrice

	^totalPrice copy.! !


!Sale methodsFor: 'initialization' stamp: 'JEC 6/18/2018 00:52:11'!
initializeFor: aClientId withBooks: someBooksWithTheirQuantities andPrice: aTotalPrice

	client := aClientId.
	booksWithQuantities := someBooksWithTheirQuantities.
	totalPrice := aTotalPrice.! !


!Sale methodsFor: 'private' stamp: 'JEC 6/18/2018 00:52:50'!
= aSale

	^self booksWithQuantities = aSale booksWithQuantities and: 
		[ self totalPrice = aSale totalPrice and: [ self client = aSale client ] ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'JEC 6/18/2018 00:51:27'!
for: aClientId with: someBooksWithTheirQuantities and: aTotalPrice

	^self new initializeFor: aClientId withBooks: someBooksWithTheirQuantities andPrice: aTotalPrice.! !


!classDefinition: #Session category: #TusLibros!
Object subclass: #Session
	instanceVariableNames: 'clientId cartId cart expirationDateAndTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Session methodsFor: 'initialization' stamp: 'JEC 6/18/2018 02:40:22'!
initializeWithClientId: aClientId cartId: aCartId cart: aCart expirationDateAndTime: anExpirationDateAndTime

	clientId := aClientId.
	cartId := aCartId.
	cart := aCart.
	expirationDateAndTime := anExpirationDateAndTime.! !


!Session methodsFor: 'accessing' stamp: 'JEC 6/18/2018 02:52:20'!
cart

	^cart.! !

!Session methodsFor: 'accessing' stamp: 'JEC 6/18/2018 02:45:06'!
cartId

	^cartId copy! !


!Session methodsFor: 'testing' stamp: 'JEC 6/18/2018 02:57:19'!
isExpiredOnDate: aDateAndTime

	^expirationDateAndTime < aDateAndTime.! !


!Session methodsFor: 'private' stamp: 'JEC 6/18/2018 13:35:44'!
updateExpirationTimeWithDate: aDateAndTime

	| aDate aTime |

	aDate := aDateAndTime date.
	aTime := aDateAndTime time.

	expirationDateAndTime := (DateAndTime date: aDate time: aTime) + (Duration minutes: 30)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Session class' category: #TusLibros!
Session class
	instanceVariableNames: ''!

!Session class methodsFor: 'instance creation' stamp: 'JEC 6/18/2018 02:41:35'!
clientId: aClientId cartId: aCartId cart: aCart expirationDateAndTime: anExpirationDateAndTime

	^self new initializeWithClientId: aClientId cartId: aCartId cart: aCart expirationDateAndTime: anExpirationDateAndTime.! !
