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
	instanceVariableNames: 'aCart aSalesRegister aCashier aBookQuantity anObjectFactory aValidBook aMerchantProcessor aCreditCard aTransactionId'
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

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 19:48:42'!
test04CheckingOutANonEmptyCartRegistersASaleInTheSalesRegister

	| aSale expectedSalesRegister |

	aMerchantProcessor defineBehaviour: [ aMerchantProcessor ok ].
	
	aCart add: aValidBook with: aBookQuantity.

	aCashier checkout: aCart with: aCreditCard.

	aSale _ Sale with: aCart booksWithQuantity and: aCart totalPrice.
	expectedSalesRegister _ OrderedCollection with: aSale.

	self assert: aSalesRegister = expectedSalesRegister.! !

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 21:20:01'!
test05CheckingOutSomeNonEmptyCartRegistersAllSalesInTheSalesRegister

	| anotherCart aSale anotherSale anotherCashier expectedSalesRegister |

	aMerchantProcessor defineBehaviour: [ aMerchantProcessor ok ].

	aCart add: aValidBook with: aBookQuantity.
	anotherCart _ anObjectFactory cart.
	anotherCart add: anObjectFactory anotherValidBook with: aBookQuantity.
	anotherCashier _ Cashier 
							withSalesRegister: aSalesRegister 
							calendar: anObjectFactory calendarMock 
							merchantProcessor: aMerchantProcessor
							andTransactionId: aTransactionId.

	aCashier checkout: aCart with: aCreditCard.
	anotherCashier checkout: anotherCart with: aCreditCard.

	aSale _ Sale with: aCart booksWithQuantity and: aCart totalPrice.
	anotherSale _ Sale with: anotherCart booksWithQuantity and: anotherCart totalPrice.
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

!CashierTest methodsFor: 'testing' stamp: 'JEC 6/13/2018 21:05:20'!
test07CheckingOutWithIncorrectMonthOfYearIntervalCreditCardMustRaiseException

	self
		assertThrowableWithoutRequestMerchantProcessorWithMerchantProcessorBehaviour: [ aMerchantProcessor invalidCreditCard ]
		testSetup: [ aCart add: aValidBook with: aBookQuantity ]
		testExcercise: [  aCashier checkout: aCart with: anObjectFactory incorrectMonthOfYearIntervalCreditCard ]
		andTestAssert: [ :anErrorMessageText | 
			self assert: CreditCard cannotExistWithAnIncorrectMonthOfYearIntervalCreditCardErrorMessage equals: anErrorMessageText.
		]! !

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


!CashierTest methodsFor: 'setUp' stamp: 'JEC 6/13/2018 21:20:46'!
setUp

	anObjectFactory := ObjectFactory new.
	aCart _ anObjectFactory cart.
	aMerchantProcessor := MerchantProcessorSimulator new.
	aSalesRegister _ OrderedCollection new.
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


!classDefinition: #XxxTest category: #TusLibros!
TestCase subclass: #XxxTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/14/2018 20:14:38'!
test01CanCreateACartWhenPassingAValidClientAndPassword

	| xxx aClientId aPassword aCartId |

	xxx := Xxx new.
	aClientId := 0.
	aPassword := 'a password'.

	aCartId := 1.

	self assert: (xxx createCartFor: aClientId withPassword: aPassword) = aCartId.	! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/14/2018 20:16:27'!
test02WhenPassingAnInvalidClientThrowsException

	| xxx aClientId aPassword |

	xxx := Xxx new.
	aClientId := 1.
	aPassword := 'a password'.

	self
		should: [ xxx createCartFor: aClientId withPassword: aPassword ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Xxx invalidClientErrorMessage = anError messageText ].! !

!XxxTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/14/2018 20:16:48'!
test03WhenPassingAnInvalidPasswordThrowsException

	| xxx aClientId aPassword |

	xxx := Xxx new.
	aClientId := 0.
	aPassword := 'invalid password'.

	self
		should: [ xxx createCartFor: aClientId withPassword: aPassword ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Xxx invalidClientErrorMessage = anError messageText ].! !


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

!Cashier methodsFor: 'private' stamp: 'GAC 6/11/2018 16:00:46'!
assertThatTheCreditCardIsNotExpired: aCreditCard 
	
	(aCreditCard isExpiredOnDate: clock)
		ifTrue: [ self error: self class cannotCheckoutWithAnExpiredCreditCardErrorMessage ].! !

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 17:23:49'!
nextTransactionId

	transactionId := transactionId + 1.

	^transactionId! !


!Cashier methodsFor: 'check out' stamp: 'JEC 6/11/2018 19:59:41'!
checkout: aCart with: aCreditCard 

	| aSale |

	self assertThatTheCartIsNotEmpty: aCart .
	self assertThatTheCreditCardIsNotExpired: aCreditCard.

	merchantProcessor debit: aCart totalPrice to: aCreditCard.

	aSale := Sale with: aCart booksWithQuantity and: aCart totalPrice.
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
	instanceVariableNames: 'person creditCardNumber from to'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'accessing' stamp: 'JEC 6/10/2018 22:49:57'!
fromMonthOfYear

	^from copy.! !

!CreditCard methodsFor: 'accessing' stamp: 'GAC 6/11/2018 16:00:18'!
isExpiredOnDate: aDate 

	| aTimeSpan |

	aTimeSpan := self fromMonthOfYear start to: self toMonthOfYear end.
	
	^ (aTimeSpan includes: aDate now) not
! !

!CreditCard methodsFor: 'accessing' stamp: 'JEC 6/10/2018 22:50:21'!
toMonthOfYear

	^ to copy.! !


!CreditCard methodsFor: 'initialization' stamp: 'GAC 6/11/2018 16:29:53'!
initializeWithName: aPersonName creditCardNumber: aCreditCardNumber from: aFromDate to: aToDate

	person := aPersonName.
	creditCardNumber := aCreditCardNumber.
	from := aFromDate.
	to := aToDate.
	
	
	(from start <= to end)
		ifFalse: [ self error: self class cannotExistWithAnIncorrectMonthOfYearIntervalCreditCardErrorMessage ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'GAC 6/11/2018 16:28:04'!
cannotExistWithAnIncorrectMonthOfYearIntervalCreditCardErrorMessage

	^'Cannot exist a credit card with incorrect month of year interval'.! !

!CreditCard class methodsFor: 'instance creation' stamp: 'JEC 6/10/2018 19:41:26'!
of: aPersonName with: aCreditCardNumber from: aFromDate to: aToDate

	^self new initializeWithName: aPersonName creditCardNumber: aCreditCardNumber from: aFromDate to: aToDate.! !


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

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:26'!
calendarMock

	^CalendarMock with: (Date year: 2018 month: 06 day: 10).! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:34'!
cart

	^Cart with: self catalogue.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:43'!
catalogue

	| aPrice anotherPrice aCatalogue |

	aCatalogue := Dictionary new.
	aPrice := 1.
	anotherPrice := 2.
	aCatalogue add: self validBook -> aPrice.
	aCatalogue add: self anotherValidBook -> anotherPrice.

	^aCatalogue.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:50:54'!
expiredCreditCard

	| aPersonName aCreditCardNumber aFromMonthOfYear aToMonthOfYear |

	aPersonName _ 'a person name'.
	aCreditCardNumber _ '0000000000000000'.
	aFromMonthOfYear _ Month month: 01 year: 2010.
	aToMonthOfYear _ Month month: 01 year: 2015.

	^ CreditCard of: aPersonName with: aCreditCardNumber from: aFromMonthOfYear to: aToMonthOfYear.
! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:51:10'!
incorrectMonthOfYearIntervalCreditCard

	| aPersonName aCreditCardNumber aFromMonthOfYear aToMonthOfYear |

	aPersonName _ 'a person name'.
	aCreditCardNumber _ '0000000000000000'.
	aFromMonthOfYear _ Month month: 01 year: 2020.
	aToMonthOfYear _ Month month: 01 year: 2018.

	^ CreditCard of: aPersonName with: aCreditCardNumber from: aFromMonthOfYear to: aToMonthOfYear.
! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:51:19'!
invalidBook

	^'an invalid book'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:51:24'!
validBook

	^'a valid book'.! !

!ObjectFactory methodsFor: 'object creation' stamp: 'JEC 6/11/2018 18:51:32'!
validCreditCard

	| aPersonName aCreditCardNumber aFromMonthOfYear aToMonthOfYear |

	aPersonName _ 'a person name'.
	aCreditCardNumber _ '0000000000000000'.
	aFromMonthOfYear _ Month month: 01 year: 2018.
	aToMonthOfYear _ Month month: 01 year: 2020.

	^ CreditCard of: aPersonName with: aCreditCardNumber from: aFromMonthOfYear to: aToMonthOfYear.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'booksWithQuantities totalPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'accessing' stamp: 'JEC 6/10/2018 18:40:21'!
booksWithQuantities

	^booksWithQuantities copy.! !

!Sale methodsFor: 'accessing' stamp: 'JEC 6/10/2018 18:40:32'!
totalPrice

	^totalPrice copy.! !


!Sale methodsFor: 'initialization' stamp: 'JEC 6/10/2018 18:14:37'!
initializeWithBooks: someBooksWithTheirQuantities andPrice: aTotalPrice

	booksWithQuantities := someBooksWithTheirQuantities.
	totalPrice := aTotalPrice.! !


!Sale methodsFor: 'private' stamp: 'JEC 6/10/2018 18:39:45'!
= aSale

	^self booksWithQuantities = aSale booksWithQuantities and: [ self totalPrice = aSale totalPrice ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'JEC 6/10/2018 18:13:47'!
with: someBooksWithTheirQuantities and: aTotalPrice

	^self new initializeWithBooks: someBooksWithTheirQuantities andPrice: aTotalPrice.! !


!classDefinition: #Xxx category: #TusLibros!
Object subclass: #Xxx
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Xxx methodsFor: 'as yet unclassified' stamp: 'JEC 6/14/2018 20:09:27'!
createCartFor: aClientId withPassword: aPassword 

	(aClientId ~= 0 or: [ aPassword ~= 'a password' ])
		ifTrue: [self error: self class invalidClientErrorMessage ].

	^1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Xxx class' category: #TusLibros!
Xxx class
	instanceVariableNames: ''!

!Xxx class methodsFor: 'as yet unclassified' stamp: 'JEC 6/14/2018 20:07:04'!
invalidClientErrorMessage
	
	^'Invalid client'.! !
