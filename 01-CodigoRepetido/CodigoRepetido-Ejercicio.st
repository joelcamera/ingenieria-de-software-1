!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: 'anEmptyCustomerBook aCustomer anEmptyNamedCustomer aCustomerBookWithOneCustomer notACustomer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'Running' stamp: 'JEC 4/15/2018 15:24:46'!
setUp

	aCustomer := 'a customer'.
	notACustomer := 'not a customer'.
	anEmptyNamedCustomer := ''.
	
	anEmptyCustomerBook := CustomerBook new.
	aCustomerBookWithOneCustomer := CustomerBook new.
	aCustomerBookWithOneCustomer addCustomerNamed: aCustomer.! !


!IdiomTest methodsFor: 'testing' stamp: 'JEC 4/15/2018 15:24:31'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self
		assertMillisecondsToRunBlock: [ anEmptyCustomerBook addCustomerNamed: notACustomer ]
		areMinorThan: 50.! !

!IdiomTest methodsFor: 'testing' stamp: 'JEC 4/15/2018 15:24:24'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	self
		assertMillisecondsToRunBlock: [ aCustomerBookWithOneCustomer removeCustomerNamed: aCustomer ]
		areMinorThan: 100.! !

!IdiomTest methodsFor: 'testing' stamp: 'JEC 4/15/2018 14:33:47'!
test03CanNotAddACustomerWithEmptyName

	self
		should: [ anEmptyCustomerBook addCustomerNamed: anEmptyNamedCustomer ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: anEmptyCustomerBook isEmpty ].! !

!IdiomTest methodsFor: 'testing' stamp: 'JEC 4/15/2018 14:43:51'!
test04CanNotRemoveAnInvalidCustomer
	
	self
		should: [ aCustomerBookWithOneCustomer removeCustomerNamed: notACustomer ]
		raise: NotFound
		withExceptionDo: [ :anError |
			self assert: aCustomerBookWithOneCustomer numberOfCustomers = 1.
			self assert: (aCustomerBookWithOneCustomer includesCustomerNamed: aCustomer) ].! !


!IdiomTest methodsFor: 'Accessing' stamp: 'JEC 4/15/2018 15:29:11'!
assertMillisecondsToRunBlock: aBlock areMinorThan: aMillisecondsValue

	^ self assert: (Time millisecondsToRun: aBlock) < aMillisecondsValue.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
