!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'aCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:27:39'!
test01WhenCreatingANewCartCreatesAnEmptyCart

	self assert: aCart isEmpty.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:05:36'!
test02AfterAddingSomeBooksTheCartItIsNotEmptyAndItsSizeIsTheQuantityOfAllBooks

	| aBookQuantity |

	aBookQuantity _ 2.
	aCart add: ObjectFactory validBook with: aBookQuantity.

	self deny: aCart isEmpty.
	self assert: aCart size = aBookQuantity.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:10:41'!
test03CanAddMoreThanOneBookToTheCart

	| aBookQuantity anotherBookQuantity |

	aBookQuantity _ 1.
	anotherBookQuantity _ 2.

	aCart add: ObjectFactory validBook with: aBookQuantity.
	aCart add: ObjectFactory anotherValidBook with: anotherBookQuantity.

	self assert: (aCart includes: ObjectFactory validBook).
	self assert: (aCart includes: ObjectFactory anotherValidBook).! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:07:45'!
test06CanGetAllTheBookWithTheirQuantity

	| aBookQuantity anotherBookQuantity expectedDictionary |

	aBookQuantity _ 1.
	anotherBookQuantity _ 2.
	aCart add: ObjectFactory validBook with: aBookQuantity.
	aCart add: ObjectFactory anotherValidBook with: anotherBookQuantity.
	expectedDictionary _ Dictionary new.
	expectedDictionary add: ObjectFactory validBook -> aBookQuantity; add: ObjectFactory anotherValidBook -> anotherBookQuantity.

	self assert: aCart booksWithQuantity = expectedDictionary.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:07:18'!
test07CannotAddABookToACartThatIsNotInItsCatalogue

	| aNonCataloguedBook aQuantity |

	aNonCataloguedBook _ ObjectFactory invalidBook.
	aQuantity _ 1.

	self
		should: [ aCart add: aNonCataloguedBook with: aQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookThatIsNotInTheCatalogueErrorMessage equals: anError messageText ].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:10:16'!
test08CannotAddABookWithQuantityLessThanOne

	| aNonPositiveQuantity |

	aNonPositiveQuantity _ 0.

	self
		should: [ aCart add: ObjectFactory validBook with: aNonPositiveQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookWithQuantityLessThanOneErrorMessage equals: anError messageText.
			self assert: aCart isEmpty ].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:06:16'!
test09CannotAddABookWithQuantityNonInteger

	| aNonIntegerQuantity |

	aNonIntegerQuantity _ 1.1.

	self 
		should: [ aCart add: ObjectFactory validBook with: aNonIntegerQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookWithANonIntegerQuantityErrorMessage equals: anError messageText.
			self assert: aCart isEmpty ].! !


!CartTest methodsFor: 'setUp' stamp: 'JEC 6/10/2018 20:09:46'!
setUp

	aCart _ ObjectFactory cart.! !


!classDefinition: #CheckOutTest category: #TusLibros!
TestCase subclass: #CheckOutTest
	instanceVariableNames: 'aCart aSalesRegister aCashier aValidCreditCard aBookQuantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 22:51:25'!
test01CannotCheckoutAnEmptyCart

	self
		should: [ aCashier checkout: aCart with: aValidCreditCard ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Cashier cannotCheckoutAnEmptyCartErrorMessage equals: anError messageText ].! !

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:09:41'!
test02ACartCanReturnItsTotalPrice

	| expectedPrice |

	aCart add: ObjectFactory validBook with: aBookQuantity.

	expectedPrice _ (ObjectFactory catalogue at: ObjectFactory validBook) * aBookQuantity.
	self assert: aCart totalPrice equals: expectedPrice.! !

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:06:46'!
test03CheckingOutANonEmptyCartAndAValidCreditCardReturnTheTransactionId

	| expectedTransactionId |

	aBookQuantity _ 1.

	aCart add: ObjectFactory validBook with: aBookQuantity.
	expectedTransactionId _ 1.

	self assert: (aCashier checkout: aCart with: aValidCreditCard) = expectedTransactionId.! !

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 20:08:22'!
test04CheckingOutANonEmptyCartRegistersASaleInTheSalesRegister

	| aSale expectedSalesRegister |

	aCart add: ObjectFactory validBook with: aBookQuantity.

	aCashier checkout: aCart with: aValidCreditCard.

	aSale _ Sale with: aCart booksWithQuantity and: aCart totalPrice.
	expectedSalesRegister _ OrderedCollection with: aSale.

	self assert: aSalesRegister = expectedSalesRegister.! !

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 22:56:00'!
test05CheckingOutSomeNonEmptyCartRegistersAllSalesInTheSalesRegister

	| anotherCart aSale anotherSale anotherCashier expectedSalesRegister |

	aCart add: ObjectFactory validBook with: aBookQuantity.
	anotherCart _ ObjectFactory cart.
	anotherCart add: ObjectFactory anotherValidBook with: aBookQuantity.
	anotherCashier _ Cashier with: aSalesRegister and: ObjectFactory calendarMock.

	aCashier checkout: aCart with: aValidCreditCard.
	anotherCashier checkout: anotherCart with: aValidCreditCard.

	aSale _ Sale with: aCart booksWithQuantity and: aCart totalPrice.
	anotherSale _ Sale with: anotherCart booksWithQuantity and: anotherCart totalPrice.
	expectedSalesRegister _ OrderedCollection with: aSale with: anotherSale.

	self assert: aSalesRegister = expectedSalesRegister.! !

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 22:58:08'!
test06CheckingOutWithExpiredCreditCardMustRaiseException

	aCart add: ObjectFactory validBook with: aBookQuantity.

	self
		should: [ aCashier checkout: aCart with: ObjectFactory expiredCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cashier cannotCheckoutWithAnExpiredCreditCardErrorMessage equals: anError messageText.
			self assert: aSalesRegister isEmpty ].
! !

!CheckOutTest methodsFor: 'testing' stamp: 'JEC 6/10/2018 23:03:20'!
test07CheckingOutWithIncorrectMonthOfYearIntervalCreditCardMustRaiseException

	aCart add: ObjectFactory validBook with: aBookQuantity.

	self
		should: [ aCashier checkout: aCart with: ObjectFactory incorrectMonthOfYearIntervalCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cashier cannotCheckoutWithAnExpiredCreditCardErrorMessage equals: anError messageText.
			self assert: aSalesRegister isEmpty ].
! !


!CheckOutTest methodsFor: 'setUp' stamp: 'JEC 6/10/2018 22:55:25'!
setUp

	aCart _ ObjectFactory cart.
	aSalesRegister _ OrderedCollection new.
	aCashier _ Cashier with: aSalesRegister and: ObjectFactory calendarMock.
	aValidCreditCard _ ObjectFactory validCreditCard.
	aBookQuantity _ 2.! !


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
	instanceVariableNames: 'transactionId salesRegister clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 21:30:31'!
assertThatTheCartIsNotEmpty: aCart

	aCart booksWithQuantity isEmpty 
		ifTrue: [self error: self class cannotCheckoutAnEmptyCartErrorMessage ].
! !

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 23:09:17'!
assertThatTheCreditCardHasACorrectInterval: aCreditCard
	
	(aCreditCard fromMonthOfYear start <= aCreditCard toMonthOfYear end)
		ifFalse: [ self error: self class cannotCheckoutWithAnIncorrectMonthOfYearIntervalCreditCardErrorMessage ].! !

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 23:05:24'!
assertThatTheCreditCardIsNotExpired: aCreditCard 

	| aTimeSpan |

	aTimeSpan := aCreditCard fromMonthOfYear start to: aCreditCard toMonthOfYear end.
	
	(aTimeSpan includes: clock now)
		ifFalse: [ self error: self class cannotCheckoutWithAnExpiredCreditCardErrorMessage ].! !

!Cashier methodsFor: 'private' stamp: 'JEC 6/10/2018 17:23:49'!
nextTransactionId

	transactionId := transactionId + 1.

	^transactionId! !


!Cashier methodsFor: 'initialization' stamp: 'JEC 6/10/2018 22:54:10'!
initializeWith: aSalesRegister and: aCalendarClock

	transactionId := 0.
	salesRegister := aSalesRegister.
	clock := aCalendarClock.! !


!Cashier methodsFor: 'check out' stamp: 'JEC 6/10/2018 23:07:02'!
checkout: aCart with: aCreditCard 

	| aSale |

	self assertThatTheCartIsNotEmpty: aCart .
	self assertThatTheCreditCardIsNotExpired: aCreditCard.
	self assertThatTheCreditCardHasACorrectInterval: aCreditCard.

	aSale := Sale with: aCart booksWithQuantity and: aCart totalPrice.
	salesRegister add: aSale.

	^self nextTransactionId.! !

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


!Cashier class methodsFor: 'instance creation' stamp: 'JEC 6/10/2018 21:28:25'!
with: aSalesRegister and: aClock 

	^self new initializeWith: aSalesRegister and: aClock.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'person creditCardNumber from to'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'accessing' stamp: 'JEC 6/10/2018 22:49:57'!
fromMonthOfYear

	^from copy.! !

!CreditCard methodsFor: 'accessing' stamp: 'JEC 6/10/2018 22:50:21'!
toMonthOfYear

	^ to copy.! !


!CreditCard methodsFor: 'initialization' stamp: 'JEC 6/10/2018 19:41:07'!
initializeWithName: aPersonName creditCardNumber: aCreditCardNumber from: aFromDate to: aToDate

	person := aPersonName.
	creditCardNumber := aCreditCardNumber.
	from := aFromDate.
	to := aToDate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'JEC 6/10/2018 19:41:26'!
of: aPersonName with: aCreditCardNumber from: aFromDate to: aToDate

	^self new initializeWithName: aPersonName creditCardNumber: aCreditCardNumber from: aFromDate to: aToDate.! !


!classDefinition: #ObjectFactory category: #TusLibros!
Object subclass: #ObjectFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ObjectFactory class' category: #TusLibros!
ObjectFactory class
	instanceVariableNames: ''!

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 16:44:36'!
anotherValidBook

	^'another valid book'.! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 21:40:45'!
calendarMock

	^CalendarMock with: (Date year: 2018 month: 06 day: 10).! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 16:42:24'!
cart

	^Cart with: self catalogue.! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 16:45:13'!
catalogue

	| aPrice anotherPrice aCatalogue |

	aCatalogue := Dictionary new.
	aPrice := 1.
	anotherPrice := 2.
	aCatalogue add: self validBook -> aPrice.
	aCatalogue add: self anotherValidBook -> anotherPrice.

	^aCatalogue.! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 23:23:05'!
expiredCreditCard

	| aPersonName aCreditCardNumber aFromMonthOfYear aToMonthOfYear |

	aPersonName _ 'a person name'.
	aCreditCardNumber _ '0000000000000000'.
	aFromMonthOfYear _ Month month: 01 year: 2010.
	aToMonthOfYear _ Month month: 01 year: 2015.

	^ CreditCard of: aPersonName with: aCreditCardNumber from: aFromMonthOfYear to: aToMonthOfYear.
! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 23:23:01'!
incorrectMonthOfYearIntervalCreditCard

	| aPersonName aCreditCardNumber aFromMonthOfYear aToMonthOfYear |

	aPersonName _ 'a person name'.
	aCreditCardNumber _ '0000000000000000'.
	aFromMonthOfYear _ Month month: 01 year: 2020.
	aToMonthOfYear _ Month month: 01 year: 2018.

	^ CreditCard of: aPersonName with: aCreditCardNumber from: aFromMonthOfYear to: aToMonthOfYear.
! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 16:35:38'!
invalidBook

	^'an invalid book'.! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 16:35:28'!
validBook

	^'a valid book'.! !

!ObjectFactory class methodsFor: 'object creation' stamp: 'JEC 6/10/2018 21:50:11'!
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
