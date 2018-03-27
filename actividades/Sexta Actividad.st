!classDefinition: #BooleanosTest category: #'Sexta Actividad'!
DenotativeObject subclass: #BooleanosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Sexta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BooleanosTest class' category: #'Sexta Actividad'!
BooleanosTest class
	instanceVariableNames: ''!

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 19:39:21'!
test01NegacionDeVerdaderoEsFalso

	Assert that: Verdadero no isEqualTo: Falso! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 19:49:39'!
test02NegacionDeFalsoEsVerdadero
	
	Assert that: Falso no	isEqualTo: Verdadero.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:00:13'!
test03VerdaderoYFalsoEsFalso
	
	Assert that: (Verdadero y: Falso) isEqualTo: Falso.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:03:37'!
test04VerdaderoYVerdaderoEsVerdadero
	
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:06:33'!
test05FalsoYVerdaderoEsFalso
	
	Assert that: (Falso y: Verdadero) isEqualTo: Falso.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:14:29'!
test06FalsoOVerdaderoEsVerdadero
	
	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:21:31'!
test07VerdaderoOFalsoEsVerdadero
	
	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:41:16'!
test08VerdaderoSiVerdaderoEvaluaClosure
	| resultado |
	resultado _ #NoEvalúa.
	Verdadero siVerdadero: [ resultado _ #Evalúa ].
	Assert
		that: resultado
		isEqualTo: #Evalúa.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:37:57'!
test09VerdaderoSiFalsoNoEvaluaClosure
	
	| resultado |
	
	resultado := #NoEvalúa.
	
	Verdadero siFalso: [resultado := #Evalúa].
	
	Assert that: resultado isEqualTo: #NoEvalúa.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:44:27'!
test10FalsoSiFalsoEvaluaClosure
	| resultado |
	resultado _ #NoEvalúa.
	Falso siFalso: [ resultado _ #Evalúa ].
	Assert
		that: resultado
		isEqualTo: #Evalúa.! !

!BooleanosTest class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 20:47:24'!
test11FalsoSiVerdaderoNoEvaluaClosure
	| resultado |
	resultado _ #NoEvalúa.
	Falso siVerdadero: [ resultado _ #Evalúa ].
	Assert
		that: resultado
		isEqualTo: #NoEvalúa.! !


!classDefinition: #Falso category: #'Sexta Actividad'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Sexta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #'Sexta Actividad'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'operación' stamp: 'jec 3/26/2018 19:50:06'!
no
	
	^Verdadero! !

!Falso class methodsFor: 'operación' stamp: 'jec 3/26/2018 20:20:51'!
o: unBooleano
	
	^unBooleano.! !

!Falso class methodsFor: 'operación' stamp: 'jec 3/26/2018 20:11:31'!
y: unBooleano 
	^self.! !


!Falso class methodsFor: 'condición' stamp: 'jec 3/26/2018 20:45:48'!
siFalso: unClosure 
	unClosure value! !

!Falso class methodsFor: 'condición' stamp: 'jec 3/26/2018 20:47:56'!
siVerdadero: unClosure 
! !


!classDefinition: #Verdadero category: #'Sexta Actividad'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Sexta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #'Sexta Actividad'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'operación' stamp: 'jec 3/26/2018 19:46:21'!
no
	
	^Falso! !

!Verdadero class methodsFor: 'operación' stamp: 'jec 3/26/2018 20:21:57'!
o: unBooleano

	^self! !

!Verdadero class methodsFor: 'operación' stamp: 'jec 3/26/2018 20:04:56'!
y: unBooleano 
	^unBooleano.! !


!Verdadero class methodsFor: 'condición' stamp: 'jec 3/26/2018 20:39:56'!
siFalso: unClosure 
	! !

!Verdadero class methodsFor: 'condición' stamp: 'jec 3/26/2018 20:34:28'!
siVerdadero: unClosure

	unClosure value! !
