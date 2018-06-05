!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:37:04'!
test01WhenCreatingANewCartCreatesAnEmptyCart

	| aCart aCatalogue |

	aCatalogue := OrderedCollection new.
	aCart := Cart with: aCatalogue.

	self assert: aCart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:31:45'!
test02WhenAddingABookToTheCartItIsNotEmpty

	| aCart aCatalogue aBook |
	
	aBook := 'a book'.
	aCatalogue := OrderedCollection with: aBook.
	aCart := Cart with: aCatalogue.

	aCart add: aBook.

	self deny: aCart isEmpty.! !

!CartTest methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:26:09'!
test03CannotAddABookToACartThatIsNotInItsCatalogue

	| aCart aCatalogue aBook |

	aCatalogue := OrderedCollection new.
	aCart := Cart with: aCatalogue.
	aBook := 'a book'.

	self
		should: [ aCart add: aBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart cannotAddABookThatIsNotInTheCatalogueErrorMessage equals: anError messageText ].! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'books catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:30:02'!
add: aBook

	(catalogue includes: aBook) ifFalse: [ self error: self class cannotAddABookThatIsNotInTheCatalogueErrorMessage ].

	books add: aBook.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:27:30'!
initializeWith: aCatalogue

	books := OrderedCollection new.
	catalogue := aCatalogue.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:21:28'!
isEmpty
	
	^books isEmpty.! !


!Cart methodsFor: 'initialize' stamp: 'JEC 6/4/2018 21:19:48'!
initialize

	books := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'JEC 6/4/2018 21:26:50'!
with: aCatalogue

	^self new initializeWith: aCatalogue.! !


!Cart class methodsFor: 'error messages' stamp: 'JEC 6/4/2018 21:30:45'!
cannotAddABookThatIsNotInTheCatalogueErrorMessage

	^'Cannot add a book that is not in the catalogue'! !
