!classDefinition: #NumeroTest category: '03 - NumeroParte1'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - NumeroParte1'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:25'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'srs 10/19/2021 20:22:40'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'srs 10/19/2021 20:22:20'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:26:23'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'srs 10/19/2021 20:22:56'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Fraccion with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'srs 10/19/2021 20:23:03'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'srs 10/19/2021 20:23:08'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'srs 10/19/2021 20:20:51'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := Fraccion with: one over: two.
	oneFifth := Fraccion with: one over: five.
	twoFifth := Fraccion with: two over: five.
	twoTwentyfifth := Fraccion with: two over: (Entero with: 25).
	fiveHalfs := Fraccion with: five over: two.
	! !


!classDefinition: #Numero category: '03 - NumeroParte1'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - NumeroParte1'!

!Numero methodsFor: 'arithmetic operations' stamp: 'srs 10/19/2021 20:28:46'!
* aMultiplier 
	self subclassResponsibility.
	self error: 'Tipo de n�mero no soportado'
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'srs 10/19/2021 20:28:50'!
+ anAdder 
	self subclassResponsibility.	
	self error: 'Tipo de n�mero no soportado'.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'srs 10/19/2021 20:49:02'!
negated
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'srs 10/19/2021 20:49:14'!
isNegative
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'srs 10/19/2021 20:49:17'!
isOne
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'srs 10/19/2021 20:49:21'!
isZero
	self subclassResponsibility.! !


!Numero methodsFor: 'initialization' stamp: 'srs 10/19/2021 20:49:42'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue.! !

!Numero methodsFor: 'initialization' stamp: 'srs 10/19/2021 20:49:38'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:= #Fraccion.
	numerator := aNumerator.
	denominator := aDenominator. ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'NR 9/8/2019 21:59:58'!
printOn: aStream
	
	type = #Entero ifTrue:
		[ aStream print: value ].
	
	type = #Fraccion ifTrue:
		[ aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ].! !


!Numero methodsFor: 'comparing' stamp: 'LL 9/15/2020 11:00:17'!
= anObject

	((anObject isKindOf: self class) and: [ type = anObject type ]) ifTrue: [
		type = #Entero ifTrue: [ ^value = anObject integerValue ].
		type = #Fraccion ifTrue: [ ^(numerator * anObject denominator) = (denominator * anObject numerator) ].
		^false
	].

	^false
! !

!Numero methodsFor: 'comparing' stamp: 'NR 9/8/2019 22:00:49'!
hash
	type = #Entero ifTrue:
		[ ^value hash ].
	type = #Fraccion ifTrue:
		[ ^(numerator hash / denominator hash) hash ].! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'NR 9/9/2019 16:21:07'!
// aDivisor 
	
	type = #Entero ifTrue:
		[ ^self class with: value // aDivisor integerValue ].
		
	self error: 'Tipo de n�mero no soportado'! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'LL 9/13/2020 16:50:25'!
greatestCommonDivisorWith: anEntero 
	
	type = #Entero ifTrue:
		[ ^self class with: (value gcd: anEntero integerValue) ].
		
	self error: 'Tipo de n�mero no soportado'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: '03 - NumeroParte1'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'NR 9/8/2019 20:46:40'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'NR 9/8/2019 23:20:40'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: '03 - NumeroParte1'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - NumeroParte1'!

!Entero methodsFor: 'testing' stamp: 'srs 10/19/2021 20:28:05'!
* aMultiplier 
	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'testing' stamp: 'srs 10/19/2021 20:26:55'!
+ anAdder 
	^self class with: value + anAdder integerValue.! !

!Entero methodsFor: 'testing' stamp: 'srs 10/19/2021 19:44:19'!
isNegative
	^value < 0.! !

!Entero methodsFor: 'testing' stamp: 'srs 10/19/2021 19:55:45'!
isOne
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'srs 10/19/2021 19:56:25'!
isZero
	^value = 0! !

!Entero methodsFor: 'testing' stamp: 'srs 10/19/2021 20:15:10'!
negated
	 ^self * (self class with: -1).! !


!classDefinition: #Fraccion category: '03 - NumeroParte1'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '03 - NumeroParte1'!

!Fraccion methodsFor: 'testing' stamp: 'srs 10/19/2021 20:28:27'!
* aMultiplier 
	^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator).
! !

!Fraccion methodsFor: 'testing' stamp: 'srs 10/19/2021 20:46:15'!
+ anAdder 
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^ self class with: newNumerator over: newDenominator.
! !

!Fraccion methodsFor: 'testing' stamp: 'srs 10/19/2021 19:55:33'!
isNegative
	^denominator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'srs 10/19/2021 18:38:11'!
isOne
	^false.! !

!Fraccion methodsFor: 'testing' stamp: 'srs 10/19/2021 18:45:44'!
isZero
	^false.! !

!Fraccion methodsFor: 'testing' stamp: 'srs 10/19/2021 20:15:44'!
negated
	^self class with: numerator * (self class with: -1) over: denominator.! !
