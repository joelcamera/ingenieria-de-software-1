!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'JEC 4/21/2018 12:33:30'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !


!NumeroTest methodsFor: 'setup' stamp: 'HernanWilkinson 5/7/2016 20:56'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	four := Entero with: 4.
	five := Entero with: 5.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'JEC 4/21/2018 13:17:34'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JEC 4/21/2018 12:38:16'!
initializeWith: aValue

	value _ aValue.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:44:19'!
* aMultiplier

	^ aMultiplier multiplyByInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:55:41'!
+ anAdder

	^ anAdder addInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:37:31'!
/ aDivisor 
	
	^aDivisor divideInteger: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/21/2018 13:12:18'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:56:18'!
addFraction: aFraction

	^ Fraccion
		with: aFraction numerator + (self * aFraction denominator)
		over: aFraction denominator.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/21/2018 12:30:48'!
addInteger: anInteger

	^ Entero with: value + anInteger integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:50:28'!
divideFraction: aFraction
	
	^ Fraccion
		with: aFraction numerator
		over: self * aFraction denominator.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:51:02'!
divideInteger: anInteger 
	
	^Fraccion 
		with: anInteger
		over: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/21/2018 12:36:04'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEC 4/21/2018 12:38:36'!
multiplyByInteger: anInteger

	^ Entero with: value * anInteger integerValue.! !


!Entero methodsFor: 'accessing' stamp: 'JEC 4/18/2018 23:00:23'!
multiplyByFraction: aFraction

	^ Fraccion
		with: self * aFraction numerator
		over: aFraction denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'JEC 4/21/2018 13:59:10'!
with: aValue
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [ self error: 'aValue debe ser anInteger' ].
	
	^ (self subclasses detect: [ :subclass | subclass canHandleEntero: aValue ]) new initializeWith: aValue.! !


!classDefinition: #Cero category: #'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'value' stamp: 'JEC 4/21/2018 13:01:42'!
asDenominator

	self error: self class canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'value' stamp: 'JEC 4/21/2018 12:47:19'!
asNumerator
	
	self error: 'una fraccion no puede ser cero'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: #'Numero-Exercise'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'handler' stamp: 'JEC 4/21/2018 15:54:55'!
canHandleEntero: aValue

	^ aValue = 0.! !

!Cero class methodsFor: 'handler' stamp: 'JEC 4/21/2018 14:24:30'!
canHandleFractionWith: aNumerator over: aDenominator

	^aNumerator class = self! !


!Cero class methodsFor: 'instance creation' stamp: 'JEC 4/21/2018 12:27:19'!
with: aValue

	^self new initializeWith: aValue! !


!Cero class methodsFor: 'private' stamp: 'JEC 4/21/2018 15:55:10'!
initializeFractionWith: aNumerator over: aDenominator
 
	^aNumerator! !


!classDefinition: #NiUnoNiCero category: #'Numero-Exercise'!
Entero subclass: #NiUnoNiCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NiUnoNiCero methodsFor: 'value' stamp: 'JEC 4/21/2018 12:50:19'!
asDenominator

	^self! !

!NiUnoNiCero methodsFor: 'value' stamp: 'JEC 4/21/2018 12:47:11'!
asNumerator

	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NiUnoNiCero class' category: #'Numero-Exercise'!
NiUnoNiCero class
	instanceVariableNames: ''!

!NiUnoNiCero class methodsFor: 'handler' stamp: 'JEC 4/21/2018 16:00:54'!
canHandleEntero: aValue

	^ aValue ~= 0 and: [aValue ~= 1].! !


!NiUnoNiCero class methodsFor: 'instance creation' stamp: 'JEC 4/21/2018 12:27:39'!
with: aValue

	^self new initializeWith: aValue! !


!classDefinition: #Uno category: #'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'value' stamp: 'JEC 4/21/2018 12:48:06'!
asDenominator

	self error: 'una fraccion no puede tener denominador 1 porque sino es un entero'! !

!Uno methodsFor: 'value' stamp: 'JEC 4/21/2018 12:49:54'!
asNumerator
	
	^self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Exercise'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'handler' stamp: 'JEC 4/21/2018 16:01:40'!
canHandleEntero: aValue

	^ aValue = 1.! !

!Uno class methodsFor: 'handler' stamp: 'JEC 4/21/2018 15:35:43'!
canHandleFractionWith: aNumerator over: aDenominator 

	^aDenominator class = self! !


!Uno class methodsFor: 'instance creation' stamp: 'JEC 4/21/2018 12:27:49'!
with: aValue

	^self new initializeWith: aValue! !


!Uno class methodsFor: 'private' stamp: 'JEC 4/21/2018 15:36:23'!
initializeFractionWith: aNumerator over: aDenominator
 
	^aNumerator.! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'initialization' stamp: 'JEC 4/21/2018 12:51:39'!
initializeWith: aNumerator over: aDenominator
	
	numerator := aNumerator asNumerator.
	denominator := aDenominator asDenominator.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:57:12'!
* aMultiplier

	^ aMultiplier multiplyByFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:57:18'!
+ anAdder

	^ anAdder addFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:57:20'!
/ aDivisor

	^ aDivisor divideFraction: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/21/2018 13:09:21'!
addFraction: aFraction

	| newNumerator newDenominator |
	
	newNumerator _ (numerator * aFraction denominator) + (denominator * aFraction numerator).
	newDenominator _ denominator * aFraction denominator.
	
	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:53:00'!
addInteger: anInteger

	^ Fraccion
		with: numerator + (anInteger * denominator)
		over: denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:58:11'!
divideFraction: aFraction

	^ (aFraction numerator * denominator) / (aFraction denominator * numerator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:54:39'!
divideInteger: anInteger 
	
	^Fraccion 
		with: (anInteger * denominator) 
		over: numerator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:58:36'!
multiplyByFraction: aFraction

	^ (numerator * aFraction numerator) / (denominator * aFraction denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEC 4/18/2018 22:55:24'!
multiplyByInteger: anInteger
	
	^Fraccion 
		with: (numerator * anInteger)
		over: denominator.! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'JEC 4/21/2018 15:58:45'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator classes classToInstantiate |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.

	classes := OrderedCollection with: Cero with: Uno with: Fraccion.
	classToInstantiate := classes detect: [:aClass | aClass canHandleFractionWith: numerator over: denominator].
	
	 ^classToInstantiate initializeFractionWith: numerator over: denominator.
! !


!Fraccion class methodsFor: 'handler' stamp: 'JEC 4/21/2018 15:42:55'!
canHandleFractionWith: aNumerator over: aDenominator
 
	^(aNumerator class ~= Cero) and: [aDenominator class ~= Uno]! !


!Fraccion class methodsFor: 'private' stamp: 'JEC 4/21/2018 15:43:57'!
initializeFractionWith: aNumerator over: aDenominator

	^self new initializeWith: aNumerator over: aDenominator.! !
