!classDefinition: #I category: #Peano!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #Peano!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 14:35:50'!
* unNumeroDePeano
	
	^ unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 14:35:45'!
+ unNumeroDePeano
	
	^ unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:15:37'!
- unNumeroDePeano
	
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 11:50:57'!
/ unNumeroDePeano
	
	unNumeroDePeano = self 
		ifTrue: [ ^self ]
		ifFalse: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 14:35:25'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:27:22'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'Numeros menores o iguales a cero no soportados.'! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:48:18'!
multiplicameA: unNumeroDePeano

	^unNumeroDePeano.! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 14:35:32'!
next
	
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 16:04:08'!
previous
	
	self error: [ self descripcionDeErrorDeNumerosNegativosNoSoportados ].! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:23:48'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous.! !


!classDefinition: #II category: #Peano!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #Peano!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:59:28'!
* unNumeroDePeano
	
	^ unNumeroDePeano multiplicameA: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 14:37:25'!
+ unNumeroDePeano
	
	^ self previous + unNumeroDePeano next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:23:15'!
- unNumeroDePeano

	^ unNumeroDePeano restameA: self.
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:29:55'!
/ unNumeroDePeano

	[ 
		self = unNumeroDePeano
		ifTrue: [ ^I ]
		ifFalse: [ ^I + ((self - unNumeroDePeano ) / unNumeroDePeano) ].
	]
		on: Error
		do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 14:01:26'!
cleanNext

	next := nil.! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 15:32:12'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor'.! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:27:43'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'Numeros menores o iguales a cero no soportados.'! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 14:00:41'!
multiplicameA: unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano).! !

!II class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:39:28'!
next

	next ifNil: 
	[
		next := self cloneNamed:(self name,'I').
		next previous: self. 	
	].
	^next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:21:51'!
previous
	
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:41:11'!
previous: unNumeroDePeano	
	previous := unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/29/2018 14:38:36'!
removeAllNext
	
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/30/2018 13:25:30'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #Peano!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #Peano!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
* unNumeroDePeano
	
	^ unNumeroDePeano multiplicameA: self.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
+ unNumeroDePeano
	
	^ self previous + unNumeroDePeano next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
- unNumeroDePeano

	^ unNumeroDePeano restameA: self.
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
/ unNumeroDePeano

	[ 
		self = unNumeroDePeano
		ifTrue: [ ^I ]
		ifFalse: [ ^I + ((self - unNumeroDePeano ) / unNumeroDePeano) ].
	]
		on: Error
		do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
cleanNext

	next := nil.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'Numeros menores o iguales a cero no soportados.'! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
multiplicameA: unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano).! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
next

	next ifNil: 
	[
		next := self cloneNamed:(self name,'I').
		next previous: self. 	
	].
	^next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
previous
	
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
previous: unNumeroDePeano	
	previous := unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
removeAllNext
	
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!III class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #Peano!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #Peano!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
* unNumeroDePeano
	
	^ unNumeroDePeano multiplicameA: self.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
+ unNumeroDePeano
	
	^ self previous + unNumeroDePeano next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
- unNumeroDePeano

	^ unNumeroDePeano restameA: self.
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
/ unNumeroDePeano

	[ 
		self = unNumeroDePeano
		ifTrue: [ ^I ]
		ifFalse: [ ^I + ((self - unNumeroDePeano ) / unNumeroDePeano) ].
	]
		on: Error
		do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
cleanNext

	next := nil.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir por un numero mayor'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'Numeros menores o iguales a cero no soportados.'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
multiplicameA: unNumeroDePeano

	^unNumeroDePeano + (self previous * unNumeroDePeano).! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
next

	next ifNil: 
	[
		next := self cloneNamed:(self name,'I').
		next previous: self. 	
	].
	^next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
previous
	
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
previous: unNumeroDePeano	
	previous := unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
removeAllNext
	
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'GAC 4/1/2018 08:43:04'!
restameA: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'previous' put: III!