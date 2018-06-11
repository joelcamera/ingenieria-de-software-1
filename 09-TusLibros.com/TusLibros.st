!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'aBook aBookQuantity anotherBook anotherBookQuantity aCatalogue aCart'
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

!CartTest methodsFor: 'testing' stamp: 'JEC 6/6/2018 22:29:17'!
test03CanAddMoreThanOneBookToTheCart

	aCart add: aBook with: aBookQuantity.
	aCart add: anotherBook with: anotherBookQuantity.

	self assert: (aCart books includes: aBook).
	self assert: (aCart books includes: anotherBook).! !

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


!CartTest methodsFor: 'setUp' stamp: 'JEC 6/6/2018 22:32:55'!
setUp

	aBook := 'a book'.
	aBookQuantity := 2.
	anotherBook := 'another book'.
	anotherBookQuantity := 3.
	aCatalogue := OrderedCollection with: aBook with: anotherBook.
	aCart := Cart with: aCatalogue.
	! !


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


!Cart methodsFor: 'private' stamp: 'JEC 6/6/2018 19:46:30'!
assertBookInCart: aBook

	(catalogue includes: aBook)
		ifFalse: [ self error: self class cannotAddABookThatIsNotInTheCatalogueErrorMessage ].! !

!Cart methodsFor: 'private' stamp: 'JEC 6/6/2018 19:46:05'!
assertQuantityIsMoreOrEqualThanOne: aQuantity
	
	(aQuantity < 1)
		ifTrue: [self error: self class cannotAddABookWithQuantityLessThanOneErrorMessage ].! !


!Cart methodsFor: 'adding' stamp: 'JEC 6/6/2018 20:07:48'!
add: aBook with: aQuantity

	self assertBookInCart: aBook.
	self assertQuantityIsMoreOrEqualThanOne: aQuantity.

	(1 to: aQuantity) do: [ :index | books add: aBook ].! !


!Cart methodsFor: 'accessing' stamp: 'JEC 6/6/2018 20:23:51'!
size

	^books size! !

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