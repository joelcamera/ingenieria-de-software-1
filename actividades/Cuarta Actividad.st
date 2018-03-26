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

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
previous
	
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!III class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:51'!
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

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
* unNumeroDePeano
	unNumeroDePeano = I
		ifTrue: [^self] 
		ifFalse: [^ self + (self * unNumeroDePeano previous)]! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
- unNumeroDePeano
	unNumeroDePeano = I
		ifTrue:[^self previous]
		ifFalse:[^self previous - unNumeroDePeano previous.]
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
next
	
	next ifNil:
	[
		next := self cloneNamed:(self name,'I').
		next previous:self
	]. 
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
previous
	
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
previous: unNumeroDePeano
	
	previous := unNumeroDePeano ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'JEC 3/22/2018 21:54:59'!
removeAllNext
	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

IIII instVarNamed: 'next' put: nil!
IIII instVarNamed: 'previous' put: III!