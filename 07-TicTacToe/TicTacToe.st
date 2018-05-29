!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:12:10'!
test01

	| aGame |
	
	aGame := TicTacToe new.
	
	self assert: aGame Xs isEmpty.
	self assert: aGame Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:21:22'!
test02

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	
	self assert: 1 equals: aGame Xs size.
	self assert: (aGame Xs includes: 1@1).
	self assert: aGame Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:37:44'!
test03

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	
	self assert: 1 equals: aGame Os size.
	self assert: 1 equals: aGame Xs size.
	self assert: (aGame Os includes: 1@2).
	self assert: (aGame Xs includes: 1@1).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:37:15'!
test04

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.

	self
		should: [ aGame putXAt: 2@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame Xs size.
			self assert: (aGame Xs includes: 1@1).
			self assert: aGame Os isEmpty.] .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:39:37'!
test05

	| aGame |
	
	aGame := TicTacToe new.

	self
		should: [ aGame putOAt: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assert: 0 equals: aGame Os size.
			self assert: aGame Xs isEmpty.
			self assert: aGame Os isEmpty.] .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:55:02'!
test06

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 2@2.

	self
		should: [ aGame putXAt: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame Xs size.
			self assert: (aGame Xs includes: 1@1).
			self assert: (aGame Os includes: 2@2).] .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:55:59'!
test07

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 2@2.

	self
		should: [ aGame putXAt: 2@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame Xs size.
			self assert: (aGame Xs includes: 1@1).
			self assert: (aGame Os includes: 2@2).] .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:57:54'!
test08

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.

	self
		should: [ aGame putOAt: 1@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame Xs size.
			self assert: (aGame Xs includes: 1@1).
			self assert: aGame Os isEmpty.] .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:02:55'!
test09

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 2@2.

	self
		should: [ aGame putOAt: 1@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 2 equals: aGame Xs size.
			self assert: 1 equals: aGame Os size.
			self assert: ((aGame Xs includes: 1@1) and: [ aGame Xs includes: 2@2 ]).
			self assert: (aGame Os includes: 1@2).] .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:24:39'!
test10

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 1@3.
	aGame putOAt: 2@1.
	
	self deny: aGame OHasWon.
	self deny: aGame XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:38:48'!
test11

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 2@1.
	aGame putXAt: 1@2.
	aGame putOAt: 2@2.
	aGame putXAt: 1@3.
	
	self assert: aGame XHasWon.
	self deny: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:39:21'!
test12

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 2@1.
	aGame putOAt: 1@1.
	aGame putXAt: 2@2.
	aGame putOAt: 1@2.
	aGame putXAt: 2@3.
	
	self assert: aGame XHasWon.
	self deny: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:40:38'!
test13

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 3@1.
	aGame putOAt: 1@1.
	aGame putXAt: 3@2.
	aGame putOAt: 1@2.
	aGame putXAt: 3@3.
	
	self assert: aGame XHasWon.
	self deny: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:02:14'!
test14

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 2@1.
	aGame putOAt: 1@3.
	aGame putXAt: 3@1.
	
	self assert: aGame XHasWon.
	self deny: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:04:45'!
test15

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 2@2.
	aGame putOAt: 1@3.
	aGame putXAt: 3@3.
	
	self assert: aGame XHasWon.
	self deny: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:10:11'!
test16

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 3@1.
	aGame putOAt: 1@2.
	aGame putXAt: 2@2.
	aGame putOAt: 1@1.
	aGame putXAt: 1@3.
	
	self assert: aGame XHasWon.
	self deny: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:19:35'!
test17

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 3@2.
	aGame putOAt: 1@1.
	aGame putXAt: 2@2.
	aGame putOAt: 2@1.
	aGame putXAt: 1@3.
	aGame putOAt: 3@1.
	
	self deny: aGame XHasWon.
	self assert: aGame OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:33:47'!
test18

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 2@1.
	aGame putXAt: 1@2.
	aGame putOAt: 3@1.
	aGame putXAt: 1@3.

	self
		should: [aGame putOAt: 3@2]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: TicTacToe cannotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: aGame Os size.
			self assert: (aGame Os includes: 2@1).
			self assert: (aGame Os includes: 3@1)].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:39:39'!
test19

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 3@3.
	aGame putOAt: 2@1.
	aGame putXAt: 2@2.
	aGame putOAt: 3@1.
	aGame putXAt: 1@3.
	aGame putOAt: 1@1.

	self
		should: [aGame putXAt: 3@2]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: TicTacToe cannotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: aGame Xs size.
			self assert: (aGame Xs includes: 3@3).
			self assert: (aGame Xs includes: 2@2).
			self assert: (aGame Xs includes: 1@3).].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:44:34'!
test20

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 1@3.
	aGame putOAt: 2@2.
	aGame putXAt: 2@1.
	aGame putOAt: 2@3.
	aGame putXAt: 3@2.
	aGame putOAt: 3@1.
	aGame putXAt: 3@3.

	self assert: aGame isTied.
	self deny: aGame XHasWon .
	self deny: aGame OHasWon .
	self assert: aGame isGameOver .! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 18:42:23'!
test21

	| aGame |
	
	aGame := TicTacToe new.
	
	aGame putXAt: 1@1.
	aGame putOAt: 1@2.
	aGame putXAt: 1@3.
	aGame putOAt: 2@2.
	aGame putXAt: 2@1.
	aGame putOAt: 2@3.
	aGame putXAt: 3@2.
	aGame putOAt: 3@3.
	aGame putXAt: 3@1.

	self deny: aGame isTied.
	self assert: aGame XHasWon .
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 18:46:54'!
test22

	| aGame |
	
	aGame := TicTacToe new.
	
	self should: [ aGame putXAt: 4@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self assert: aGame Xs isEmpty.
			self assert: aGame Os isEmpty.] .
	
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 18:52:00'!
test23

	| aGame |
	
	aGame := TicTacToe new.
	
	self should: [ aGame putXAt: 2@4 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self assert: aGame Xs isEmpty.
			self assert: aGame Os isEmpty.] .
	
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 18:54:43'!
test24

	| aGame |
	
	aGame := TicTacToe new.
	
	self should: [ aGame putXAt: 0@3 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self assert: aGame Xs isEmpty.
			self assert: aGame Os isEmpty.] .
	
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 18:56:15'!
test25

	| aGame |
	
	aGame := TicTacToe new.
	
	self should: [ aGame putXAt: 1@0 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self assert: aGame Xs isEmpty.
			self assert: aGame Os isEmpty.] .
	
	
	! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 19:21:27'!
test26WhenOPlaysAssertIfThePositionIsInRange
	| aGame |
	aGame _ TicTacToe new.
	aGame putXAt: 1 @ 1.
	self
		should: [ aGame putOAt: 1 @ 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe outOfGridErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: aGame Xs size.
			self assert: (aGame Xs includes: 1 @ 1).
			self assert: aGame Os isEmpty ].! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:32:25'!
OHasWon
	
	^winner = #o.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:19:38'!
Os
	
	^ os copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 20:32:37'!
XHasWon
	
	^winner = #x! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:19:33'!
Xs
	
	^ xs copy.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 19:38:19'!
assertGameIsNotOver
	self isGameOver 
		ifTrue: [ self error: self class cannotPlayWhenGameIsOverErrorMessage ].
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 19:54:11'!
assertPositionInRange: aPosition

	((aPosition x between: 1 and: 3) not or: [(aPosition y between: 1 and: 3) not])
		ifTrue: [ self error: self class outOfGridErrorMessage ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 19:36:47'!
assertPositionNotTaken: aPosition

	((xs includes: aPosition) or: [ os includes: aPosition ])
		ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:04:20'!
hasCompletedColumnPositions: positions

	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:12:54'!
hasCompletedNonPrincipalDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :number | positions includes: number@(4-number) ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:09:03'!
hasCompletedPrincipalDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :number | positions includes: number@number ].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:00:31'!
hasCompletedRowPositions: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :position | position x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:11:46'!
hasWon: positions

	^(((self hasCompletedRowPositions: positions) or: [self hasCompletedColumnPositions: positions]) or: [ self hasCompletedPrincipalDiagonal: positions ]) or: [ self hasCompletedNonPrincipalDiagonal: positions ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:28:42'!
initialize

	os := Set new.
	xs := Set new.
	turn := #x.! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:48:24'!
isGameOver

	^(winner = #x or: [winner = #o]) or: [self isTied ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:46:55'!
isTied
	
	^((xs size = 5) and: [self XHasWon not]) and: [ self OHasWon not]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:23:50'!
playerOPlays

	^turn = #o! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:23:57'!
playerXPlays

	^turn = #x! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:38:16'!
putOAt: aPosition

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.
	
	ticTacToeState putOAt: aPosition for: self! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:32:10'!
putOWhenPlayerOPlaysAt: aPosition

	self assertPositionInRange: aPosition.
	self assertPositionNotTaken: aPosition.
	
	os add: aPosition.
	turn := #x.
	
	(self hasWon: os)
		ifTrue: [winner := #o].! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:34:31'!
putOWhenPlayerXPlaysAt: aPosition

	self error: self class notOTurnErrorMessage! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:44:06'!
putWhenGameIsFinished
	
	self error: self class cannotPlayWhenGameIsOverErrorMessage! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:45:07'!
putXAt: aPosition

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.
	
	ticTacToeState putXAt: aPosition for: self! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:34:49'!
putXWhenPlayerOPlaysAt: aPosition

	self error: self class notXTurnErrorMessage! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:32:37'!
putXWhenPlayerXPlaysAt: aPosition

	self assertPositionInRange: aPosition.
	self assertPositionNotTaken: aPosition.
	
	xs add: aPosition.
	turn := #o.
	
	(self hasWon: xs)
		ifTrue: [winner := #x].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 21:26:24'!
cannotPlayWhenGameIsOverErrorMessage

	^'Cannot play when game is over.'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:18:41'!
new

	| newInstance |
	
	newInstance := super new.
	newInstance initialize.
	
	^newInstance ! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:41:03'!
notOTurnErrorMessage

	^'Is not the O turn'.! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:36:36'!
notXTurnErrorMessage
	
	^'Is not the X turn'.! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 18:51:06'!
outOfGridErrorMessage
	^'Posicion fuera de grilla'.! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JEC 5/24/2018 19:54:34'!
positionTakenErrorMessage
	
	^'The position is taken'.! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:18:57'!
stateFor: aTicTacToe

	^ (self subclasses detect: [:state | state canHandleTicTacToe: aTicTacToe]) new.! !


!classDefinition: #TicTacToeStatePlayerGameOver category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerGameOver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerGameOver methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:43:33'!
putOAt: aPosition for: aTicTacToe 

	aTicTacToe putWhenGameIsFinished! !

!TicTacToeStatePlayerGameOver methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:44:27'!
putXAt: aPosition for: aTicTacToe 

	aTicTacToe putWhenGameIsFinished! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerGameOver class' category: #TicTacToe!
TicTacToeStatePlayerGameOver class
	instanceVariableNames: ''!

!TicTacToeStatePlayerGameOver class methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:22:06'!
canHandleTicTacToe: aTicTacToe

	^aTicTacToe isGameOver! !


!classDefinition: #TicTacToeStatePlayerOPlays category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerOPlays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerOPlays methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:30:42'!
putOAt: aPosition for: aTicTacToe

	aTicTacToe putOWhenPlayerOPlaysAt: aPosition! !

!TicTacToeStatePlayerOPlays methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:35:15'!
putXAt: aPosition for: aTicTacToe

	aTicTacToe putXWhenPlayerOPlaysAt: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerOPlays class' category: #TicTacToe!
TicTacToeStatePlayerOPlays class
	instanceVariableNames: ''!

!TicTacToeStatePlayerOPlays class methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:41:07'!
canHandleTicTacToe: aTicTacToe

	^ aTicTacToe playerOPlays and: [ aTicTacToe isGameOver not]! !


!classDefinition: #TicTacToeStatePlayerXPlays category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerXPlays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerXPlays methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:35:27'!
putOAt: aPosition for: aTicTacToe

	aTicTacToe putOWhenPlayerXPlaysAt: aPosition! !

!TicTacToeStatePlayerXPlays methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:33:24'!
putXAt: aPosition for: aTicTacToe

	aTicTacToe putXWhenPlayerXPlaysAt: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerXPlays class' category: #TicTacToe!
TicTacToeStatePlayerXPlays class
	instanceVariableNames: ''!

!TicTacToeStatePlayerXPlays class methodsFor: 'as yet unclassified' stamp: 'JEC 5/28/2018 23:41:17'!
canHandleTicTacToe: aTicTacToe

	^ aTicTacToe playerXPlays and: [ aTicTacToe isGameOver not]! !
