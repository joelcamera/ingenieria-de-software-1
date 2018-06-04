!classDefinition: #TicTacToeObserverTest category: #TicTacToe!
TestCase subclass: #TicTacToeObserverTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:27:41'!
test01WhenHavingANewTicTacToeGameAndCreatingATicTacToeConsoleAttachedToItTheLogMustBeEmpty

	| aConsole expectedLog |

	game _ TicTacToe new.
	aConsole _ TicTacToeConsole for: game.

	expectedLog _ OrderedCollection new.
	
	self assert: aConsole print = expectedLog.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:27:45'!
test02WhenPlayerXMarksAPositionTheConsoleLogsThatThatPlayerMarkedThatPositionAndIsTheTurnOfPlayerO

	| aConsole expectedLog |

	game _ TicTacToe new.
	aConsole _ TicTacToeConsole for: game.
	game markAll: {1 @ 1}.

	expectedLog _ OrderedCollection with: 'X marcó en 1@1' with: 'Estado: Jugando O'.
	
	self assert: aConsole print = expectedLog.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:27:49'!
test03WhenPlayerOMarksAPositionTheConsoleLogsThatThatPlayerMarkedThatPositionAndIsTheTurnOfPlayerX

	| aConsole expectedLog |

	game _ TicTacToe new.
	aConsole _ TicTacToeConsole for: game.
	game markAll: {1 @ 1. 2 @ 3}.

	expectedLog _ OrderedCollection new.
	expectedLog add: 'X marcó en 1@1'; add: 'Estado: Jugando O'; add: 'O marcó en 2@3'; add: 'Estado: Jugando X'.

	self assert: aConsole print = expectedLog.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:27:55'!
test04WhenPlayerXWinsTheGameTheConsoleLogsAllGameAndAtTheEndShowsThatTheGameIsFinishedAndTheWinner

	| aConsole expectedLog |

	game _ TicTacToe new.
	aConsole _ TicTacToeConsole for: game.

	game markAll: {1 @ 1. 2 @ 1. 1 @ 2. 3 @ 1. 1 @ 3}.

	expectedLog _ OrderedCollection new.
	expectedLog
		add: 'X marcó en 1@1';
		add: 'Estado: Jugando O';
		add: 'O marcó en 2@1';
		add: 'Estado: Jugando X';
		add: 'X marcó en 1@2';
		add: 'Estado: Jugando O';
		add: 'O marcó en 3@1';
		add: 'Estado: Jugando X';
		add: 'X marcó en 1@3';
		add: 'Estado: Juego terminado - Ganó X!!'.

	self assert: aConsole print = expectedLog.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:28:02'!
test05WhenPlayerOWinsTheGameTheConsoleLogsAllGameAndAtTheEndShowsThatTheGameIsFinishedAndTheWinner

	| aConsole expectedLog |

	game _ TicTacToe new.
	aConsole _ TicTacToeConsole for: game.
	game markAll: {2 @ 3. 1 @ 1. 2 @ 1. 1 @ 2. 3 @ 1. 1 @ 3}.

	expectedLog _ OrderedCollection new.
	expectedLog
		add: 'X marcó en 2@3';
		add: 'Estado: Jugando O';
		add: 'O marcó en 1@1';
		add: 'Estado: Jugando X';
		add: 'X marcó en 2@1';
		add: 'Estado: Jugando O';
		add: 'O marcó en 1@2';
		add: 'Estado: Jugando X';
		add: 'X marcó en 3@1';
		add: 'Estado: Jugando O';
		add: 'O marcó en 1@3';
		add: 'Estado: Juego terminado - Ganó O!!'.

	self assert: aConsole print = expectedLog.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:28:07'!
test06WhenTheGameIsTiedTheConsoleLogsAllGameAndAtTheEndShowsThatTheGameIsFinishedAndTied

	| aConsole expectedLog |

	game _ TicTacToe new.
	aConsole _ TicTacToeConsole for: game.
	game markAll: {2 @ 2. 1 @ 1. 1 @ 3. 3 @ 1. 2 @ 1. 2 @ 3. 1 @ 2. 3 @ 2. 3 @ 3}.

	expectedLog _ OrderedCollection new.
	expectedLog
		add: 'X marcó en 2@2';
		add: 'Estado: Jugando O';
		add: 'O marcó en 1@1';
		add: 'Estado: Jugando X';
		add: 'X marcó en 1@3';
		add: 'Estado: Jugando O';
		add: 'O marcó en 3@1';
		add: 'Estado: Jugando X';
		add: 'X marcó en 2@1';
		add: 'Estado: Jugando O';
		add: 'O marcó en 2@3';
		add: 'Estado: Jugando X';
		add: 'X marcó en 1@2';
		add: 'Estado: Jugando O';
		add: 'O marcó en 3@2';
		add: 'Estado: Jugando X';
		add: 'X marcó en 3@3';
		add: 'Estado: Juego terminado - Empate'.

	self assert: aConsole print = expectedLog.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 22:28:11'!
test07WhenHavingANewTicTacToeGameTheConsoleViewMustBeAnEmptyGrid

	| aView expectedView |

	game _ TicTacToe new.
	aView := TicTacToeView for: game.

	expectedView := ' | | 
-----
 | | 
-----
 | | '.

	self assert: aView print = expectedView.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/4/2018 02:06:22'!
test08WhenPlayerXPlaysTheGridShowsItsLastPositionMarkedAsX

	| aView expectedView |

	game _ TicTacToe new.
	aView := TicTacToeView for: game.
	
	game markAll: {2 @ 2}.

	expectedView := ' | | 
-----
 |X| 
-----
 | | 
Playing O'.

	self assert: aView print = expectedView.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/4/2018 02:06:49'!
test09WhenPlayerOPlaysTheGridShowsItsLastPositionMarkedAsOAndPlayerXLastPositionMarkedAsX

	| aView expectedView |

	game _ TicTacToe new.
	aView := TicTacToeView for: game.
	
	game markAll: {2 @ 2. 1@1}.

	expectedView := 'O| | 
-----
 |X| 
-----
 | | 
Playing X'.

	self assert: aView print = expectedView.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/4/2018 01:19:57'!
test10WhenPlayerXWinsTheViewShowsThatThePlayerXWon

	| aView expectedView |

	game _ TicTacToe new.
	aView := TicTacToeView for: game.
	
	game markAll: {1@2. 1@1. 2@2. 1@3. 3@2}.

	expectedView := 'O|X|O
-----
 |X| 
-----
 |X| 
X Won!!'.

	self assert: aView print = expectedView.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/4/2018 01:22:40'!
test11WhenPlayerOWinsTheViewShowsThatThePlayerOWon

	| aView expectedView |

	game _ TicTacToe new.
	aView := TicTacToeView for: game.
	
	game markAll: {1@2. 1@1. 2@3. 2@1. 3@3. 3@1}.

	expectedView := 'O|X| 
-----
O| |X
-----
O| |X
O Won!!'.

	self assert: aView print = expectedView.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/4/2018 01:24:50'!
test12WhenGameIsTiedTheViewShowsIt

	| aView expectedView |

	game _ TicTacToe new.
	aView := TicTacToeView for: game.
	
	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	expectedView := 'O|X|X
-----
X|X|O
-----
O|O|X
Game Tied'.

	self assert: aView print = expectedView.! !

!TicTacToeObserverTest methodsFor: 'testing' stamp: 'JEC 6/4/2018 02:07:38'!
test13CanHaveConsolesAndViewsObservingTheGame

	| firstView secondView firstConsole secondConsole expectedView expectedLog |

	game _ TicTacToe new.
	firstConsole _ TicTacToeConsole for: game.
	secondConsole _ TicTacToeConsole for: game.
	firstView := TicTacToeView for: game.
	secondView := TicTacToeView for: game.
	
	game markAll: {1 @ 1. 2 @ 3}.

	expectedLog _ OrderedCollection new.
	expectedLog add: 'X marcó en 1@1'; add: 'Estado: Jugando O'; add: 'O marcó en 2@3'; add: 'Estado: Jugando X'.
	expectedView := 'X| | 
-----
 | |O
-----
 | | 
Playing X'.

	self assert: firstConsole print = expectedLog.
	self assert: secondConsole print = expectedLog.
	self assert: firstView print = expectedView.
	self assert: secondView print = expectedView.	! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 21:48:37'!
test27WhenNonPlayerHasPlayedLastPlayMethodThrowsException

	game _ TicTacToe new.
	
	self
		should: [ game lastPlay ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe noPlayerPlayedErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JEC 6/3/2018 21:49:43'!
test28WhenAPlayerHasPlayedLastPlayMethodReturnsAnObjectThatCanRespondWhoWasTheLastPlayerAndTheLastPositionPlayed

	| lastPlay |

	game _ TicTacToe new.
	game markAll: { 2@2 }.

	lastPlay := game lastPlay.
	
	self assert: lastPlay lastPlayer = 'X'.
	self assert: lastPlay lastPositionPlayed = (2@2).! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions observers lastPlayInfo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'JEC 6/2/2018 23:30:54'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.
	observers := OrderedCollection new.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:30:17'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:24:49'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'JEC 6/3/2018 21:51:05'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	| newState |

	positions add: aPosition.

	newState := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self.

	lastPlayInfo := TicTacToeLastPlayInfo withLastState: state withLastPositionPlayed: aPosition andNewState: newState.

	state := newState.
	
	self update.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'JEC 6/4/2018 02:12:06'!
markWithOWhenPlayingOAt: aPosition

	self assertIsFree: aPosition.
	
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'JEC 6/4/2018 02:12:11'!
markWithXWhenPlayingXAt: aPosition

	self assertIsFree: aPosition.

	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TicTacToe methodsFor: 'private' stamp: 'JEC 6/2/2018 23:32:48'!
attach: aNewObserver

	observers add: aNewObserver! !

!TicTacToe methodsFor: 'private' stamp: 'JEC 6/3/2018 21:55:37'!
update
	
	observers do: [ :observer | observer notify: lastPlayInfo ]! !


!TicTacToe methodsFor: 'playing turn info' stamp: 'JEC 6/4/2018 02:11:26'!
lastPlay

	self assertIsNewGame.
	
	^lastPlayInfo
	! !


!TicTacToe methodsFor: 'playing turn info - private' stamp: 'JEC 6/4/2018 01:32:45'!
assertIsNewGame

	playerXPositions isEmpty ifTrue: [ self error: self class noPlayerPlayedErrorMessage ].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'JEC 6/3/2018 17:51:37'!
noPlayerPlayedErrorMessage
	
	^'No player has played'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'error messages' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeLastPlayInfo category: #TicTacToe!
Object subclass: #TicTacToeLastPlayInfo
	instanceVariableNames: 'lastPositionPlayed actualState lastState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeLastPlayInfo methodsFor: 'last play status' stamp: 'JEC 6/4/2018 02:12:59'!
actualState

	^'Estado: ', actualState printState.! !

!TicTacToeLastPlayInfo methodsFor: 'last play status' stamp: 'JEC 6/3/2018 21:44:28'!
lastPlayer
	
	^lastState printPlayer! !

!TicTacToeLastPlayInfo methodsFor: 'last play status' stamp: 'JEC 6/3/2018 21:45:09'!
lastPositionPlayed

	^lastPositionPlayed! !

!TicTacToeLastPlayInfo methodsFor: 'last play status' stamp: 'JEC 6/4/2018 01:10:13'!
shortState

	^ actualState printShortState! !


!TicTacToeLastPlayInfo methodsFor: 'initialization' stamp: 'JEC 6/3/2018 21:45:16'!
initializeForLastState: aLastState lastPositionPlayed: aPosition andActualState: newState.

	lastState := aLastState.
	lastPositionPlayed := aPosition.
	actualState := newState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeLastPlayInfo class' category: #TicTacToe!
TicTacToeLastPlayInfo class
	instanceVariableNames: ''!

!TicTacToeLastPlayInfo class methodsFor: 'instance creation' stamp: 'JEC 6/3/2018 21:38:24'!
withLastState: aLastState withLastPositionPlayed: aPosition andNewState: newState

	^self new initializeForLastState: aLastState lastPositionPlayed: aPosition andActualState: newState.
	! !


!classDefinition: #TicTacToeObserver category: #TicTacToe!
Object subclass: #TicTacToeObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserver methodsFor: 'print' stamp: 'JEC 6/4/2018 02:23:10'!
print

	self subclassResponsibility ! !


!TicTacToeObserver methodsFor: 'private' stamp: 'JEC 6/4/2018 02:23:49'!
notify: aLastPlayInfo

	self subclassResponsibility ! !


!TicTacToeObserver methodsFor: 'initialization' stamp: 'JEC 6/4/2018 02:24:15'!
intializeFor: aTicTacToe

	self subclassResponsibility ! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeConsole
	instanceVariableNames: 'game log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'print' stamp: 'JEC 6/3/2018 22:27:25'!
print

	^log! !


!TicTacToeConsole methodsFor: 'initialization' stamp: 'JEC 6/2/2018 23:35:55'!
intializeFor: aTicTacToe

	game := aTicTacToe.
	log := OrderedCollection new.! !


!TicTacToeConsole methodsFor: 'private' stamp: 'JEC 6/3/2018 21:54:54'!
notify: aLastPlayInfo

	log add: aLastPlayInfo lastPlayer, ' marcó en ', aLastPlayInfo lastPositionPlayed asString;
		add: aLastPlayInfo actualState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeConsole class' category: #TicTacToe!
TicTacToeConsole class
	instanceVariableNames: ''!

!TicTacToeConsole class methodsFor: 'instance creation' stamp: 'JEC 6/2/2018 23:29:08'!
for: aTicTacToe

	| aNewTicTacToeConsole |
	
	aNewTicTacToeConsole := self new intializeFor: aTicTacToe.
	aTicTacToe attach: aNewTicTacToeConsole.

	^ aNewTicTacToeConsole! !


!classDefinition: #TicTacToeView category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeView
	instanceVariableNames: 'game lastPlayInfoCollection grid positionsDictionary nextState'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeView methodsFor: 'initialization' stamp: 'JEC 6/4/2018 02:05:16'!
intializeFor: aTicTacToe

	game := aTicTacToe.
	lastPlayInfoCollection := OrderedCollection new.
	
	grid := ' | | 
-----
 | | 
-----
 | | ' asOrderedCollection.

	positionsDictionary := Dictionary new.
	positionsDictionary 
				add: 1@1 -> 1; 
				add: 1@2 -> 3; 
				add: 1@3 -> 5;
				add: 2@1 -> 13; 
				add: 2@2 -> 15; 
				add: 2@3 -> 17;
				add: 3@1 -> 25; 
				add: 3@2 -> 27; 
				add: 3@3 -> 29.
	
	nextState := ''.! !


!TicTacToeView methodsFor: 'print' stamp: 'JEC 6/4/2018 02:13:39'!
print

	| aStrGrid |
	
	aStrGrid := String new: 29.
	
	(1 to: 29) do: [ :index | aStrGrid at: index put: (grid at: index) ].

	^aStrGrid append: nextState.! !


!TicTacToeView methodsFor: 'private' stamp: 'JEC 6/4/2018 02:05:01'!
notify: aLastPlayInfo

	lastPlayInfoCollection add: aLastPlayInfo.
	
	grid at: (positionsDictionary at: aLastPlayInfo lastPositionPlayed) put: aLastPlayInfo lastPlayer asCharacter.
	
	nextState := '
' append: aLastPlayInfo shortState.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeView class' category: #TicTacToe!
TicTacToeView class
	instanceVariableNames: 'grid'!

!TicTacToeView class methodsFor: 'instance creation' stamp: 'JEC 6/3/2018 23:24:53'!
for: aTicTacToe

	| aNewTicTacToeView |
	
	aNewTicTacToeView := self new intializeFor: aTicTacToe.
	aTicTacToe attach: aNewTicTacToeView.

	^ aNewTicTacToeView! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'instance creation' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!GameTied methodsFor: 'print' stamp: 'JEC 6/4/2018 02:08:17'!
printShortState

	^'Game Tied'! !

!GameTied methodsFor: 'print' stamp: 'JEC 6/4/2018 02:08:11'!
printState

	^'Juego terminado - Empate'! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!PlayerOWon methodsFor: 'print' stamp: 'JEC 6/4/2018 02:08:54'!
printShortState

	^'O Won!!'! !

!PlayerOWon methodsFor: 'print' stamp: 'JEC 6/4/2018 02:08:48'!
printState

	^'Juego terminado - Ganó O!!'! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!PlayerXWon methodsFor: 'print' stamp: 'JEC 6/4/2018 02:09:11'!
printShortState

	^'X Won!!'! !

!PlayerXWon methodsFor: 'print' stamp: 'JEC 6/4/2018 02:09:04'!
printState

	^'Juego terminado - Ganó X!!'! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!PlayingO methodsFor: 'print' stamp: 'JEC 6/3/2018 00:17:39'!
printPlayer

	^ 'O'! !

!PlayingO methodsFor: 'print' stamp: 'JEC 6/4/2018 02:09:38'!
printShortState

	^'Playing O'! !

!PlayingO methodsFor: 'print' stamp: 'JEC 6/4/2018 02:09:30'!
printState

	^'Jugando O'! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !


!PlayingX methodsFor: 'print' stamp: 'JEC 6/3/2018 00:17:20'!
printPlayer

	^ 'X'! !

!PlayingX methodsFor: 'print' stamp: 'JEC 6/4/2018 02:10:01'!
printShortState

	^'Playing X'! !

!PlayingX methodsFor: 'print' stamp: 'JEC 6/4/2018 02:09:54'!
printState

	^'Jugando X'! !
