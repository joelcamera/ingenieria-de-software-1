!classDefinition: #Amalia category: #'Tercera Actividad'!
DenotativeObject subclass: #Amalia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tercera Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Amalia class' category: #'Tercera Actividad'!
Amalia class
	instanceVariableNames: 'energia'!

!Amalia class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 20:49:16'!
comer: unaCantidadDeGramosDeComida

	energia _ energia + (unaCantidadDeGramosDeComida * 4).! !

!Amalia class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 20:49:16'!
energia

	^energia! !

!Amalia class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 20:49:16'!
volar: unaCantidadDeKilometros
	|gasto|
	gasto := energia - unaCantidadDeKilometros - 10.
	(gasto <= 0) 
		ifTrue: [self error:'No puede volar tanto!!']
		ifFalse: [energia := gasto].! !

Amalia instVarNamed: 'energia' put: 10!