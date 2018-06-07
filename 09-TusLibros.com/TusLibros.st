!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'aBook aBookQuantity anotherBook anotherBookQuantity aCatalogue aCart aBookPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:27:39'!
test01WhenCreatingANewCartCreatesAnEmptyCart

	self assert: aCart isEmpty.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:32:57'!
test02AfterAddingSomeBooksTheCartItIsNotEmptyAndItsSizeIsTheQuantityOfAllBooks

	aCart add: aBook with: aBookQuantity.

	self deny: aCart isEmpty.
	self assert: aCart size = aBookQuantity.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/7/2018 19:26:13'!
test03CanAddMoreThanOneBookToTheCart

	aCart add: aBook with: aBookQuantity.
	aCart add: anotherBook with: anotherBookQuantity.

	self assert: (aCart includes: aBook).
	self assert: (aCart includes: anotherBook).! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:33:54'!
test05CanGetAllTheBookFromTheCart
	
	aCart add: aBook with: aBookQuantity.
	aCart add: anotherBook with: anotherBookQuantity.
	
	self assert: aCart books = (Set with: aBook with: anotherBook).! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:34:36'!
test06CanGetAllTheBookWithTheirQuantity

	| expectedDictionary |

	aCart add: aBook with: aBookQuantity.
	aCart add: anotherBook with: anotherBookQuantity.
	
	expectedDictionary := Dictionary new.
	expectedDictionary add: aBook -> aBookQuantity; add: anotherBook -> anotherBookQuantity.
	
	self assert: aCart booksWithQuantity = expectedDictionary.! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:38:26'!
test07CannotAddABookToACartThatIsNotInItsCatalogue

	| aNonCataloguedBook aQuantity |
	
	aNonCataloguedBook := 'a non catalogued book'.
	aQuantity := 1.

	self
		should: [ aCart add: aNonCataloguedBook with: aQuantity ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookThatIsNotInTheCatalogueErrorMessage equals: anError messageText ].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:37:32'!
test08CannotAddABookWithQuantityLessThanOne

	| aNonPositiveQuantity |

	aNonPositiveQuantity := 0.

	self
		should: [ aCart add: aBook with: aNonPositiveQuantity ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
			self assert: Cart cannotAddABookWithQuantityLessThanOneErrorMessage equals: anError messageText.
			self assert: aCart isEmpty.
].! !

!CartTest methodsFor: 'testing' stamp: 'JEC 6/7/2018 18:50:12'!
test09CannotAddABookWithQuantityNonInteger

	| aNonIntegerQuantity |

	aNonIntegerQuantity := 1.1.

	self
		should: [ aCart add: aBook with: aNonIntegerQuantity ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
			self assert: Cart cannotAddABookWithANonIntegerQuantityErrorMessage equals: anError messageText.
			self assert: aCart isEmpty.
].! !


!CartTest methodsFor: 'setUp' stamp: 'JEC 6/7/2018 19:25:45'!
setUp

	aBook := 'a book'.
	aBookQuantity := 2.
	anotherBook := 'another book'.
	anotherBookQuantity := 3.
	aBookPrice := 1.
	aCatalogue := Dictionary new.
	aCatalogue add: aBook -> aBookPrice; add: anotherBook -> aBookPrice.
	aCart := Cart with: aCatalogue.
	! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:39:56'!
test01CannotCheckoutAnEmptyCart

	| aCashier anEmptyCart aCatalogue |

	aCatalogue := Dictionary new.
	anEmptyCart := Cart with: aCatalogue.
	aCashier := Cashier with: aCatalogue.

	self
		should: [ aCashier checkout: anEmptyCart ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
			self assert: Cashier cannotCheckoutAnEmptyCart equals: anError messageText ].! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:54:16'!
test02CheckingoutACartWithOneBookAndACreditCardReturnThePriceToPay

	| aCashier aNonEmptyCart aCatalogue aCreditCard expectedPriceToPay aBook aPrice aQuantity |

	aBook := 'a book'.
	aQuantity := 1.
	aPrice := 2.
	aCatalogue := Dictionary new.
	aCatalogue add: aBook -> aPrice.
	aNonEmptyCart := Cart with: aCatalogue.
	aNonEmptyCart add: aBook with: aQuantity.
	aCashier := Cashier with: aCatalogue.
	
	expectedPriceToPay := 2.

	self assert: (aCashier checkout: aNonEmptyCart) = expectedPriceToPay.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:40:55'!
test02CheckingoutACartWithOneBookReturnThePriceToPay

	| aCashier aNonEmptyCart aCatalogue expectedPriceToPay aBook aPrice aQuantity |

	aBook := 'a book'.
	aQuantity := 1.
	aPrice := 2.
	aCatalogue := Dictionary new.
	aCatalogue add: aBook -> aPrice.
	aNonEmptyCart := Cart with: aCatalogue.
	aNonEmptyCart add: aBook with: aQuantity.
	aCashier := Cashier with: aCatalogue.
	
	expectedPriceToPay := 2.

	self assert: (aCashier checkout: aNonEmptyCart) = expectedPriceToPay.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'books catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'books' stamp: 'JEC 6/6/2018 22:44:30'!
books

	^books asSet.! !

!Cart methodsFor: 'books' stamp: 'JEC 6/6/2018 21:10:43'!
booksWithQuantity

	| booksSet |
	
	booksSet := books asSet.

	^ booksSet inject: Dictionary new into: [ :aDictionary :aBook | aDictionary add: aBook -> (books occurrencesOf: aBook); yourself ]! !


!Cart methodsFor: 'initialization' stamp: 'JEC 6/6/2018 20:06:23'!
initializeWith: aCatalogue

	books := OrderedCollection new.
	catalogue := aCatalogue.! !


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


!Cart methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:26:51'!
includes: aBook

	^books includes: aBook.! !

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

!Cart class methodsFor: 'error messages' stamp: 'JEC 6/6/2018 19:43:39'!
cannotAddABookWithQuantityLessThanOneErrorMessage
	
	^'Cannot add a book with quantity less than one'.! !


!Cart class methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 18:53:17'!
cannotAddABookWithANonIntegerQuantityErrorMessage
	
	^'Cannot add a Book with a non integer quantity'! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:45:56'!
assertCartIsNotEmpty: aCart

	aCart isEmpty
		ifTrue: [ self error: self class cannotCheckoutAnEmptyCart ].! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:45:36'!
checkout: aCart 

	| booksWithQuantity totalPrice |

	self assertCartIsNotEmpty: aCart.

	booksWithQuantity := aCart booksWithQuantity.

	totalPrice := 0.
	booksWithQuantity keysAndValuesDo: [ :aKey :aValue | totalPrice := totalPrice + ((catalogue at: aKey) * aValue) ].
	
	^totalPrice.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:35:18'!
initializeWith: aCatalogue

	catalogue := aCatalogue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:00:40'!
cannotCheckoutAnEmptyCart

	^'Cannot checkout an empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JEC 6/7/2018 19:34:49'!
with: aCatalogue

	^self new initializeWith: aCatalogue.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!
