!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JEC 4/22/2018 13:42:51'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'adding' stamp: 'JEC 4/22/2018 18:24:34'!
push: anElement
	
	top := PushedObject new initializeWithPrevious: top andElement: anElement.! !


!OOStack methodsFor: 'private' stamp: 'JEC 4/22/2018 18:23:02'!
initializeWith: aStackBase
	
	top := aStackBase! !


!OOStack methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:35:36'!
size

	^top size.! !

!OOStack methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:33:55'!
top

	^top element.! !


!OOStack methodsFor: 'removing' stamp: 'JEC 4/22/2018 18:32:48'!
pop
	
	| elementToPop |
	
	elementToPop := top.
	top := elementToPop previous.

	^elementToPop element.! !


!OOStack methodsFor: 'testing' stamp: 'JEC 4/22/2018 18:23:28'!
isEmpty

	^top isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'element isEmpty'!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'JEC 4/22/2018 18:52:15'!
new

	^super new initializeWith: StackBase new! !


!classDefinition: #StackTop category: #'Stack-Exercise'!
Object subclass: #StackTop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackTop methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:41:58'!
element

	self subclassResponsibility.! !

!StackTop methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:42:11'!
previous

	self subclassResponsibility.! !

!StackTop methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:42:16'!
size

	self subclassResponsibility.! !


!StackTop methodsFor: 'testing' stamp: 'JEC 4/22/2018 18:42:05'!
isEmpty

	self subclassResponsibility.! !


!classDefinition: #PushedObject category: #'Stack-Exercise'!
StackTop subclass: #PushedObject
	instanceVariableNames: 'previous element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PushedObject methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:33:14'!
element

	^element! !

!PushedObject methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:30:04'!
previous

	^previous! !

!PushedObject methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:37:06'!
size

	^1 + previous size.! !


!PushedObject methodsFor: 'initialization' stamp: 'JEC 4/22/2018 18:26:52'!
initializeWithPrevious: aPreviousTop andElement: anElement

	previous := aPreviousTop.
	element := anElement.! !


!PushedObject methodsFor: 'testing' stamp: 'JEC 4/22/2018 18:27:06'!
isEmpty
	
	^false.! !


!classDefinition: #StackBase category: #'Stack-Exercise'!
StackTop subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:17:35'!
element

	^self error: OOStack stackEmptyErrorDescription .! !

!StackBase methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:38:58'!
previous

	self error: OOStack stackEmptyErrorDescription.! !

!StackBase methodsFor: 'accessing' stamp: 'JEC 4/22/2018 18:37:34'!
size

	^0! !


!StackBase methodsFor: 'testing' stamp: 'JEC 4/22/2018 18:15:49'!
isEmpty

	^true.! !
