!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'aGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'setup' stamp: 'JEC 5/30/2018 21:48:28'!
setUp

	aGame := TicTacToe new! !


!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:04:15'!
test01WhenGameStartsNonPlayerHavePlayed

	self deny: aGame hasPlayerXPlayed.
	self deny: aGame hasPlayerOPlayed.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:15:25'!
test02WhenXPlaysAddsAPositionToHis

	aGame putXAt: 1 @ 1.

	self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
	self assert: (aGame hasPlayerXPlayed: 1 @ 1).
	self deny: aGame hasPlayerOPlayed.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:14:14'!
test03WhenOPlaysAddsAPositionToHis

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.

	self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerO.
	self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
	self assert: (aGame hasPlayerOPlayed: 1 @ 2).
	self assert: (aGame hasPlayerXPlayed: 1 @ 1).! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:15:38'!
test04PlayerXCannotPlayTwiceInARow

	aGame putXAt: 1 @ 1.

	self 
		should: [ aGame putXAt: 2 @ 2 ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: (aGame hasPlayerXPlayed: 1 @ 1).
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:14:21'!
test05PlayerOCannotPlayWhenIsXTurn

	self
		should: [ aGame putOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assert: 0 equals: aGame quantityOfPositionsPlayedByPlayerO.
			self deny: aGame hasPlayerXPlayed.
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:15:44'!
test06WhenPlayerXPlaysCannotUseAPositionThatHasBeenUsedByHim

	aGame putXAt: 1 @ 1.
	aGame putOAt: 2 @ 2.

	self
		should: [ aGame putXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: (aGame hasPlayerXPlayed: 1 @ 1).
			self assert: (aGame hasPlayerOPlayed: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:15:49'!
test07WhenPlayerXPlaysCannotUseAPositionThatHasBeenUsedTheOtherPlayer

	aGame putXAt: 1 @ 1.
	aGame putOAt: 2 @ 2.

	self
		should: [ aGame putXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: (aGame hasPlayerXPlayed: 1 @ 1).
			self assert: (aGame hasPlayerOPlayed: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:16:55'!
test08WhenPlayerOPlaysCannotUseAPositionThatHasBeenUsedByTheOtherPlayer

	aGame putXAt: 1 @ 1.

	self
		should: [ aGame putOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: (aGame hasPlayerXPlayed: 1 @ 1).
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:14:35'!
test09WhenPlayerOPlaysCannotUseAPositionThatHasBeenUsedByHim

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 2 @ 2.

	self
		should: [ aGame putOAt: 1 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assert: 2 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerO.
			self assert: ((aGame hasPlayerXPlayed: 1 @ 1) and: [ aGame hasPlayerXPlayed: 2 @ 2 ]).
			self assert: (aGame hasPlayerOPlayed: 1 @ 2) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:49:38'!
test10WhenBothPlayersHavePlayedTwiceOrLessNonHasOne

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 1 @ 3.
	aGame putOAt: 2 @ 1.

	self deny: aGame hasPlayerOWon.
	self deny: aGame hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:49:43'!
test11PlayerXHasWonWhenCompletedTheFirstRow

	aGame putXAt: 1 @ 1.
	aGame putOAt: 2 @ 1.
	aGame putXAt: 1 @ 2.
	aGame putOAt: 2 @ 2.
	aGame putXAt: 1 @ 3.

	self assert: aGame hasPlayerXWon.
	self deny: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:49:47'!
test12PlayerXHasWonWhenCompletedTheSecondRow

	aGame putXAt: 2 @ 1.
	aGame putOAt: 1 @ 1.
	aGame putXAt: 2 @ 2.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 2 @ 3.

	self assert: aGame hasPlayerXWon.
	self deny: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:49:52'!
test13PlayerXHasWonWhenCompletedTheThirdRow

	aGame putXAt: 3 @ 1.
	aGame putOAt: 1 @ 1.
	aGame putXAt: 3 @ 2.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 3 @ 3.

	self assert: aGame hasPlayerXWon.
	self deny: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:49:57'!
test14PlayerXHasWonWhenCompletedTheFirstColumn

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 2 @ 1.
	aGame putOAt: 1 @ 3.
	aGame putXAt: 3 @ 1.

	self assert: aGame hasPlayerXWon.
	self deny: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:50:01'!
test15PlayerXHasWonWhenCompletedThePrincipalDiagonal

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 2 @ 2.
	aGame putOAt: 1 @ 3.
	aGame putXAt: 3 @ 3.

	self assert: aGame hasPlayerXWon.
	self deny: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:50:06'!
test16PlayerXHasWonWhenCompletedTheNonPrincipalDiagonal

	aGame putXAt: 3 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 2 @ 2.
	aGame putOAt: 1 @ 1.
	aGame putXAt: 1 @ 3.

	self assert: aGame hasPlayerXWon.
	self deny: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:50:10'!
test17PlayerOHasWonWhenCompletedTheFirstColumn

	aGame putXAt: 3 @ 2.
	aGame putOAt: 1 @ 1.
	aGame putXAt: 2 @ 2.
	aGame putOAt: 2 @ 1.
	aGame putXAt: 1 @ 3.
	aGame putOAt: 3 @ 1.

	self deny: aGame hasPlayerXWon.
	self assert: aGame hasPlayerOWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:14:49'!
test18PlayerOCannotPlayWhenPlayerXWon

	aGame putXAt: 1 @ 1.
	aGame putOAt: 2 @ 1.
	aGame putXAt: 1 @ 2.
	aGame putOAt: 3 @ 1.
	aGame putXAt: 1 @ 3.

	self
		should: [ aGame putOAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe cannotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: aGame quantityOfPositionsPlayedByPlayerO.
			self assert: (aGame hasPlayerOPlayed: 2 @ 1).
			self assert: (aGame hasPlayerOPlayed: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:16:23'!
test19PlayerXCannotPlayWhenPlayerOWon

	aGame putXAt: 3 @ 3.
	aGame putOAt: 2 @ 1.
	aGame putXAt: 2 @ 2.
	aGame putOAt: 3 @ 1.
	aGame putXAt: 1 @ 3.
	aGame putOAt: 1 @ 1.

	self
		should: [ aGame putXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe cannotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: (aGame hasPlayerXPlayed: 3 @ 3).
			self assert: (aGame hasPlayerXPlayed: 2 @ 2).
			self assert: (aGame hasPlayerXPlayed: 1 @ 3) ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:50:29'!
test20WhenTheGridIsCompletedAndNonPlayerHasWonTheGameIsTiedAndOver

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 1 @ 3.
	aGame putOAt: 2 @ 2.
	aGame putXAt: 2 @ 1.
	aGame putOAt: 2 @ 3.
	aGame putXAt: 3 @ 2.
	aGame putOAt: 3 @ 1.
	aGame putXAt: 3 @ 3.

	self assert: aGame isTied.
	self deny: aGame hasPlayerXWon .
	self deny: aGame hasPlayerOWon .
	self assert: aGame isGameOver.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 21:50:33'!
test21WhenPlayerXHasTheLastTurnAndWonTheGameIsNotTied

	aGame putXAt: 1 @ 1.
	aGame putOAt: 1 @ 2.
	aGame putXAt: 1 @ 3.
	aGame putOAt: 2 @ 2.
	aGame putXAt: 2 @ 1.
	aGame putOAt: 2 @ 3.
	aGame putXAt: 3 @ 2.
	aGame putOAt: 3 @ 3.
	aGame putXAt: 3 @ 1.

	self deny: aGame isTied.
	self assert: aGame hasPlayerXWon.! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:07:31'!
test22WhenPlaysPlayerXThePositionXCannotBeMoreThanThree

	self
		should: [ aGame putXAt: 4 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self deny: aGame hasPlayerXPlayed.
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:07:47'!
test23WhenPlaysPlayerXThePositionYCannotBeMoreThanThree

	self
		should: [ aGame putXAt: 2 @ 4 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self deny: aGame hasPlayerXPlayed.
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:07:51'!
test24WhenPlaysPlayerXThePositionXCannotBeLessThanOne

	self
		should: [ aGame putXAt: 0 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self deny: aGame hasPlayerXPlayed.
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:07:57'!
test25WhenPlaysPlayerXThePositionYCannotBeLessThanOne

	self
		should: [ aGame putXAt: 1 @ 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self deny: aGame hasPlayerXPlayed.
			self deny: aGame hasPlayerOPlayed ].! !

!TicTacToeTest methodsFor: 'tests' stamp: 'JEC 5/30/2018 22:16:40'!
test26WhenPlaysPlayerOAssertIfThePositionIsInRange

	aGame putXAt: 1 @ 1.

	self
		should: [ aGame putOAt: 1 @ 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe outOfGridErrorMessage equals: anError messageText.
			self assert: 1 equals: aGame quantityOfPositionsPlayedByPlayerX.
			self assert: (aGame hasPlayerXPlayed: 1 @ 1).
			self deny: aGame hasPlayerOPlayed ].! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'adding' stamp: 'JEC 5/28/2018 23:38:16'!
putOAt: aPosition

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.
	
	ticTacToeState putOAt: aPosition for: self! !

!TicTacToe methodsFor: 'adding' stamp: 'JEC 5/28/2018 23:45:07'!
putXAt: aPosition

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.
	
	ticTacToeState putXAt: aPosition for: self! !


!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 20:15:13'!
assertPositionInRange: aPosition

	((aPosition x between: 1 and: 3) not or: [ (aPosition y between: 1 and: 3) not ])
		ifTrue: [ self error: self class outOfGridErrorMessage ].! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/28/2018 19:36:47'!
assertPositionNotTaken: aPosition

	((xs includes: aPosition) or: [ os includes: aPosition ])
		ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 21:55:24'!
checkIfGameIsOver

	^(self checkIfPlayerXHasWon ) or: 
		[ (self checkIfPlayerOHasWon ) or: 
			[ self checkIfGameIsTied ] ]! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 20:26:04'!
checkIfGameIsTied

	^ (xs size = 5) and: 
		[ (self checkIfPlayerXHasWon not) and: 
			[ self checkIfPlayerOHasWon not ] ] .! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 19:52:29'!
checkIfPlayerOHasWon

	^self hasWon: os! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 19:52:20'!
checkIfPlayerXHasWon

	^self hasWon: xs! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/24/2018 21:04:20'!
hasCompletedColumnPositions: positions

	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/24/2018 21:12:54'!
hasCompletedNonPrincipalDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :number | positions includes: number@(4-number) ].! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/24/2018 21:09:03'!
hasCompletedPrincipalDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :number | positions includes: number@number ].! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/24/2018 21:00:31'!
hasCompletedRowPositions: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :position | position x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 19:49:48'!
hasPlayerWonWhenHasNotWon

	^ false.! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 19:49:52'!
hasPlayerWonWhenHasWon

	^ true.! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 19:04:34'!
hasWon: playerPositions

	^ (self hasCompletedRowPositions: playerPositions) or: 
		[ (self hasCompletedColumnPositions: playerPositions) or: 
			[ (self hasCompletedPrincipalDiagonal: playerPositions) or: 
				[ self hasCompletedNonPrincipalDiagonal: playerPositions ] ] ]! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 20:22:23'!
isGameOverWhenGameIsNotOver

	^false! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 20:22:15'!
isGameOverWhenGameIsOver

	^true! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 20:29:06'!
isTiedWhenGameIsNotTied

	^false! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 20:28:59'!
isTiedWhenGameIsTied

	^true! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/28/2018 23:23:50'!
playerOPlays

	^turn = #o! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/28/2018 23:23:57'!
playerXPlays

	^turn = #x! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 18:59:38'!
putOWhenPlayerOPlaysAt: aPosition

	self assertPositionInRange: aPosition.
	self assertPositionNotTaken: aPosition.
	
	os add: aPosition.
	turn := #x.! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/28/2018 23:34:31'!
putOWhenPlayerXPlaysAt: aPosition

	self error: self class notOTurnErrorMessage! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/28/2018 23:44:06'!
putWhenGameIsFinished
	
	self error: self class cannotPlayWhenGameIsOverErrorMessage! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/28/2018 23:34:49'!
putXWhenPlayerOPlaysAt: aPosition

	self error: self class notXTurnErrorMessage! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 5/30/2018 18:59:52'!
putXWhenPlayerXPlaysAt: aPosition

	self assertPositionInRange: aPosition.
	self assertPositionNotTaken: aPosition.
	
	xs add: aPosition.
	turn := #o.! !


!TicTacToe methodsFor: 'initialization' stamp: 'JEC 5/24/2018 19:28:42'!
initialize

	os := Set new.
	xs := Set new.
	turn := #x.! !


!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 22:03:44'!
hasPlayerOPlayed

	^os isEmpty not! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 22:09:28'!
hasPlayerOPlayed: aPosition

	^os includes: aPosition! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 19:43:59'!
hasPlayerOWon

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.

	^ticTacToeState hasPlayerOWonFor: self.! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 22:03:51'!
hasPlayerXPlayed

	^xs isEmpty not! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 22:09:41'!
hasPlayerXPlayed: aPosition

	^xs includes: aPosition! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 19:44:04'!
hasPlayerXWon

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.

	^ticTacToeState hasPlayerXWonFor: self.! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 20:25:07'!
isGameOver

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.
	
	^ticTacToeState isGameOverFor: self.! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 20:26:57'!
isTied

	| ticTacToeState |
	
	ticTacToeState := TicTacToeState stateFor: self.
	
	^ticTacToeState isTiedFor: self.! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 22:13:35'!
quantityOfPositionsPlayedByPlayerO

	^os size! !

!TicTacToe methodsFor: 'testing' stamp: 'JEC 5/30/2018 22:13:41'!
quantityOfPositionsPlayedByPlayerX

	^xs size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'error messages' stamp: 'JEC 5/30/2018 22:20:13'!
cannotPlayWhenGameIsOverErrorMessage

	^'Cannot play when game is over'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'JEC 5/30/2018 22:20:18'!
notOTurnErrorMessage

	^'Is not the O turn'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'JEC 5/30/2018 22:20:21'!
notXTurnErrorMessage
	
	^'Is not the X turn'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'JEC 5/30/2018 22:20:24'!
outOfGridErrorMessage

	^'Position out of grid'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'JEC 5/30/2018 22:20:27'!
positionTakenErrorMessage
	
	^'The position is taken'! !


!TicTacToe class methodsFor: 'instance creation' stamp: 'JEC 5/24/2018 19:18:41'!
new

	| newInstance |
	
	newInstance := super new.
	newInstance initialize.
	
	^newInstance ! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:32:37'!
hasPlayerOWonFor: aTicTacToe

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:32:45'!
hasPlayerXWonFor: aTicTacToe

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:33:20'!
isGameOverFor: aTicTacToe

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:33:27'!
isTiedFor: aTicTacToe

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:33:04'!
putOAt: aPosition for: aTicTacToe

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:33:07'!
putXAt: aPosition for: aTicTacToe

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'instance creation' stamp: 'JEC 5/28/2018 23:18:57'!
stateFor: aTicTacToe

	^ (self subclasses detect: [:state | state canHandleTicTacToe: aTicTacToe]) new.! !


!TicTacToeState class methodsFor: 'handler' stamp: 'JEC 5/30/2018 20:38:00'!
canHandleTicTacToe: aTicTacToe

	self subclassResponsibility ! !


!classDefinition: #TicTacToeStatePlayerOPlays category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerOPlays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerOPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:19'!
hasPlayerOWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStatePlayerOPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:23'!
hasPlayerXWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStatePlayerOPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:21:00'!
isGameOverFor: aTicTacToe

	^aTicTacToe isGameOverWhenGameIsNotOver! !

!TicTacToeStatePlayerOPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:27:29'!
isTiedFor: aTicTacToe

	^aTicTacToe isTiedWhenGameIsNotTied! !

!TicTacToeStatePlayerOPlays methodsFor: 'dispatch' stamp: 'JEC 5/28/2018 23:30:42'!
putOAt: aPosition for: aTicTacToe

	aTicTacToe putOWhenPlayerOPlaysAt: aPosition! !

!TicTacToeStatePlayerOPlays methodsFor: 'dispatch' stamp: 'JEC 5/28/2018 23:35:15'!
putXAt: aPosition for: aTicTacToe

	aTicTacToe putXWhenPlayerOPlaysAt: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerOPlays class' category: #TicTacToe!
TicTacToeStatePlayerOPlays class
	instanceVariableNames: ''!

!TicTacToeStatePlayerOPlays class methodsFor: 'handler' stamp: 'JEC 5/30/2018 20:23:18'!
canHandleTicTacToe: aTicTacToe

	^ aTicTacToe playerOPlays and: [ aTicTacToe checkIfGameIsOver not]! !


!classDefinition: #TicTacToeStatePlayerOWon category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerOWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:45:50'!
hasPlayerOWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasWon! !

!TicTacToeStatePlayerOWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:13'!
hasPlayerXWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStatePlayerOWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:21:22'!
isGameOverFor: aTicTacToe

	^aTicTacToe isGameOverWhenGameIsOver! !

!TicTacToeStatePlayerOWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:27:40'!
isTiedFor: aTicTacToe

	^aTicTacToe isTiedWhenGameIsNotTied! !

!TicTacToeStatePlayerOWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:05:32'!
putOAt: aPosition for: aTicTacToe

	aTicTacToe putWhenGameIsFinished ! !

!TicTacToeStatePlayerOWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:05:41'!
putXAt: aPosition for: aTicTacToe

	aTicTacToe putWhenGameIsFinished! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerOWon class' category: #TicTacToe!
TicTacToeStatePlayerOWon class
	instanceVariableNames: ''!

!TicTacToeStatePlayerOWon class methodsFor: 'handler' stamp: 'JEC 5/30/2018 19:52:42'!
canHandleTicTacToe: aTicTacToe

	^ aTicTacToe checkIfPlayerOHasWon ! !


!classDefinition: #TicTacToeStatePlayerXPlays category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerXPlays
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerXPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:29'!
hasPlayerOWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStatePlayerXPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:33'!
hasPlayerXWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStatePlayerXPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:21:34'!
isGameOverFor: aTicTacToe

	^aTicTacToe isGameOverWhenGameIsNotOver! !

!TicTacToeStatePlayerXPlays methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:27:47'!
isTiedFor: aTicTacToe

	^aTicTacToe isTiedWhenGameIsNotTied! !

!TicTacToeStatePlayerXPlays methodsFor: 'dispatch' stamp: 'JEC 5/28/2018 23:35:27'!
putOAt: aPosition for: aTicTacToe

	aTicTacToe putOWhenPlayerXPlaysAt: aPosition! !

!TicTacToeStatePlayerXPlays methodsFor: 'dispatch' stamp: 'JEC 5/28/2018 23:33:24'!
putXAt: aPosition for: aTicTacToe

	aTicTacToe putXWhenPlayerXPlaysAt: aPosition! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerXPlays class' category: #TicTacToe!
TicTacToeStatePlayerXPlays class
	instanceVariableNames: ''!

!TicTacToeStatePlayerXPlays class methodsFor: 'handler' stamp: 'JEC 5/30/2018 20:23:36'!
canHandleTicTacToe: aTicTacToe

	^ aTicTacToe playerXPlays and: [ aTicTacToe checkIfGameIsOver not]! !


!classDefinition: #TicTacToeStatePlayerXWon category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStatePlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStatePlayerXWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:39'!
hasPlayerOWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStatePlayerXWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:47:15'!
hasPlayerXWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasWon! !

!TicTacToeStatePlayerXWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:21:42'!
isGameOverFor: aTicTacToe

	^aTicTacToe isGameOverWhenGameIsOver! !

!TicTacToeStatePlayerXWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:27:51'!
isTiedFor: aTicTacToe

	^aTicTacToe isTiedWhenGameIsNotTied! !

!TicTacToeStatePlayerXWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:05:16'!
putOAt: aPosition for: aTicTacToe

	aTicTacToe putWhenGameIsFinished ! !

!TicTacToeStatePlayerXWon methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:05:22'!
putXAt: aPosition for: aTicTacToe

	aTicTacToe putWhenGameIsFinished ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStatePlayerXWon class' category: #TicTacToe!
TicTacToeStatePlayerXWon class
	instanceVariableNames: ''!

!TicTacToeStatePlayerXWon class methodsFor: 'handler' stamp: 'JEC 5/30/2018 19:51:37'!
canHandleTicTacToe: aTicTacToe

	^ aTicTacToe checkIfPlayerXHasWon! !


!classDefinition: #TicTacToeStateTiedGame category: #TicTacToe!
TicTacToeState subclass: #TicTacToeStateTiedGame
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeStateTiedGame methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:46'!
hasPlayerOWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStateTiedGame methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 19:50:51'!
hasPlayerXWonFor: aTicTacToe

	^ aTicTacToe hasPlayerWonWhenHasNotWon! !

!TicTacToeStateTiedGame methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:21:52'!
isGameOverFor: aTicTacToe

	^aTicTacToe isGameOverWhenGameIsOver! !

!TicTacToeStateTiedGame methodsFor: 'dispatch' stamp: 'JEC 5/30/2018 20:28:00'!
isTiedFor: aTicTacToe

	^aTicTacToe isTiedWhenGameIsTied! !

!TicTacToeStateTiedGame methodsFor: 'dispatch' stamp: 'JEC 5/28/2018 23:43:33'!
putOAt: aPosition for: aTicTacToe 

	aTicTacToe putWhenGameIsFinished! !

!TicTacToeStateTiedGame methodsFor: 'dispatch' stamp: 'JEC 5/28/2018 23:44:27'!
putXAt: aPosition for: aTicTacToe 

	aTicTacToe putWhenGameIsFinished! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeStateTiedGame class' category: #TicTacToe!
TicTacToeStateTiedGame class
	instanceVariableNames: ''!

!TicTacToeStateTiedGame class methodsFor: 'handler' stamp: 'JEC 5/30/2018 20:26:31'!
canHandleTicTacToe: aTicTacToe

	^aTicTacToe checkIfGameIsTied! !
