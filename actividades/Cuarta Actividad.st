!classDefinition: #I category: #'Cuarta Actividad'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Cuarta Actividad'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:53:23'!
* unNumeroDePeano
	^ unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:07:58'!
+ unNumeroDePeano
	^ unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:32:41'!
- unNumeroDePeano
	self error: 'frula'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:16:45'!
/ unNumeroDePeano
	(unNumeroDePeano = self) 
	ifTrue: [^self]
	ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]! !

!I class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:09:16'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 20:59:17'!
next
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:06:46'!
previous
	self error:' No tiene previo'.! !


!classDefinition: #II category: #'Cuarta Actividad'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Cuarta Actividad'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:52:41'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:09:42'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:41:25'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:36:46'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:45:03'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:21:51'!
previous
	
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:22:47'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!II class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:48:41'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #'Cuarta Actividad'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Cuarta Actividad'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
previous
	
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!III class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #'Cuarta Actividad'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Cuarta Actividad'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
previous
	
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:37:49'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIII instVarNamed: 'next' put: IIIII!
IIII instVarNamed: 'previous' put: III!

!classDefinition: #IIIII category: #'Cuarta Actividad'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Cuarta Actividad'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:05'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:05'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:05'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous
	
	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIIII instVarNamed: 'next' put: IIIIII!
IIIII instVarNamed: 'previous' put: IIII!

!classDefinition: #IIIIII category: #'Cuarta Actividad'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Cuarta Actividad'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous
	
	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIIIII instVarNamed: 'next' put: IIIIIII!
IIIIII instVarNamed: 'previous' put: IIIII!

!classDefinition: #IIIIIII category: #'Cuarta Actividad'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #'Cuarta Actividad'!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous
	
	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIIIIII instVarNamed: 'next' put: IIIIIIII!
IIIIIII instVarNamed: 'previous' put: IIIIII!

!classDefinition: #IIIIIIII category: #'Cuarta Actividad'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #'Cuarta Actividad'!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous
	
	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIIIIIII instVarNamed: 'next' put: IIIIIIIII!
IIIIIIII instVarNamed: 'previous' put: IIIIIII!

!classDefinition: #IIIIIIIII category: #'Cuarta Actividad'!
DenotativeObject subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Cuarta Actividad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIIII class' category: #'Cuarta Actividad'!
IIIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
/ unNumeroDePeano
	(self = unNumeroDePeano )
	ifFalse: [^I + ((self - unNumeroDePeano ) / unNumeroDePeano)]
	ifTrue:[^I]! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous
	
	^previous! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIIIIIIII class methodsFor: 'as yet unclassified' stamp: 'jec 3/26/2018 21:38:06'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIIIIIIII instVarNamed: 'next' put: nil!
IIIIIIIII instVarNamed: 'previous' put: IIIIIIII!