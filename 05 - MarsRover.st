!classDefinition: #TestMarsRover category: '05 - MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!TestMarsRover methodsFor: 'setUp/tearDown' stamp: 'LG 11/12/2021 11:57:42'!
marsRoverDeployAt: someCoordinates whilePointingAt: aCardinalPoint andThenSend: anOrder

	| marsRover |
	marsRover := MarsRover deployAt: someCoordinates pointingAt: aCardinalPoint.
	marsRover reciveOrder: anOrder.
	^marsRover
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LG 11/12/2021 11:50:01'!
assertThat: aMarsRover coordinatesAre: someCoordinates whieIsPointingAt: aCardianlPoint
	
	self assert: (aMarsRover isPointingAt = aCardianlPoint).
	self assert: (aMarsRover coordinates = someCoordinates).! !


!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:00:08'!
test01AfterBeingDeployedTheCardinalPointIsCorrect
	
	| marsRover |
	
	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: 'N'.
	
	self assert: (marsRover isPointingAt = 'N').! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:00:11'!
test02AfterBeingDeployedTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: 'N'.
	
	self assert: (marsRover coordinates = (0 @ 0)).! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:28:20'!
test03AfterRotating360DegreesHasTheSameCardianalPoint
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'llll'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'N'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:30:44'!
test04CanBeDeployedAnywhere
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (12 @ 30) whilePointingAt: 'N' andThenSend: 'llll'.
	
	self assertThat: marsRover coordinatesAre: (12 @ 30) whieIsPointingAt: 'N'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:00:04'!
test05AfterApplyingACommandSecuenseTheCardinalPointAndTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'fl'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whieIsPointingAt: 'O'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:00:01'!
test06AfterApplyingAnInvalidCommandTheMarsRoverDoesNotRespond
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'x'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'N'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/12/2021 12:00:28'!
test07AllCommandsAreAppliyedUntilThereIsAnInvalidCommand
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'flxf'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whieIsPointingAt: 'O'.
! !


!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'LG 11/12/2021 12:00:50'!
test08MovingForwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whieIsPointingAt: 'N'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/12/2021 13:13:10'!
test09MovingBackwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |

	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whieIsPointingAt: 'N'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/12/2021 13:13:29'!
test10RotatingLeftWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'O'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/12/2021 13:13:44'!
test11RotatingRightWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'E'.! !


!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/12/2021 13:14:13'!
test12MovingForwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whieIsPointingAt: 'S'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/12/2021 13:14:30'!
test13MovingBackwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whieIsPointingAt: 'S'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/12/2021 13:14:47'!
test14RotatingLeftWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'E'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/12/2021 13:14:59'!
test15RotatingRightWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'O'.! !


!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/12/2021 13:15:18'!
test16MovingForwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whieIsPointingAt: 'E'.! !

!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/12/2021 13:19:00'!
test17MovingBackwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whieIsPointingAt: 'E'.! !

!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/12/2021 13:19:16'!
test18RotatingLeftWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'N'.! !

!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/12/2021 13:19:37'!
test19RotatingRightWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'S'.! !


!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/12/2021 13:21:18'!
test20MovingForwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'O' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whieIsPointingAt: 'O'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/12/2021 13:21:38'!
test21MovingBackwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'O' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whieIsPointingAt: 'O'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/12/2021 13:21:54'!
test22RotatingLeftWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'O' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'S'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/12/2021 13:22:13'!
test23RotatingRightWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'O' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whieIsPointingAt: 'N'.! !


!classDefinition: #MarsRover category: '05 - MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'pointedCardinalPoint actualCoordinates'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!MarsRover methodsFor: 'control' stamp: 'LG 11/12/2021 11:33:52'!
coordinates

	^actualCoordinates.! !

!MarsRover methodsFor: 'control' stamp: 'LG 11/12/2021 09:14:29'!
isPointingAt 

	^pointedCardinalPoint.! !

!MarsRover methodsFor: 'control' stamp: 'LG 11/12/2021 12:23:37'!
reciveOrder: aString 
	
	| indice comandosValidos|
	indice := 1.
	comandosValidos := Set new.
	comandosValidos add: $f; add: $b; add: $l; add: $r.
	
	[indice <= aString size] whileTrue: [ | newPointedCardinalPoint |
		
		(comandosValidos includes: (aString at: indice) ) ifFalse: [	^self].
		
		((aString at: indice) = $f) ifTrue: [
			(self isPointingAt = 'N') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ 1).].
			(self isPointingAt = 'S') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ -1).].
			(self isPointingAt = 'E') ifTrue:[actualCoordinates _ actualCoordinates + (1 @ 0).].
			(self isPointingAt = 'O') ifTrue:[actualCoordinates _ actualCoordinates + (-1 @ 0).].
		].
		((aString at: indice) = $b) ifTrue: [
				(self isPointingAt = 'N') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ -1)].
				(self isPointingAt = 'S') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ 1)].
				(self isPointingAt = 'E') ifTrue:[actualCoordinates _ actualCoordinates + (-1 @ 0).].
				(self isPointingAt = 'O') ifTrue:[actualCoordinates _ actualCoordinates + (1 @ 0).].
			]. 
		((aString at: indice) = $l) ifTrue: [
			(self isPointingAt = 'N') ifTrue:[newPointedCardinalPoint _ 'O'.].
			(self isPointingAt = 'S') ifTrue:[newPointedCardinalPoint _ 'E'.].
			(self isPointingAt = 'E') ifTrue:[newPointedCardinalPoint _ 'N'.].
			(self isPointingAt = 'O') ifTrue:[newPointedCardinalPoint _ 'S'.].
			pointedCardinalPoint  _ newPointedCardinalPoint.
		].
		((aString at: indice) = $r) ifTrue: [
			(self isPointingAt = 'N') ifTrue:[newPointedCardinalPoint _ 'E'.].
			(self isPointingAt = 'S') ifTrue:[newPointedCardinalPoint _ 'O'.].
			(self isPointingAt = 'E') ifTrue:[newPointedCardinalPoint _ 'S'.].
			(self isPointingAt = 'O') ifTrue:[newPointedCardinalPoint _ 'N'.].
			pointedCardinalPoint  _ newPointedCardinalPoint.
		].
		indice _ indice + 1.	
	] .

! !


!MarsRover methodsFor: 'initialization' stamp: 'LG 11/12/2021 10:53:40'!
initializeWith: aCoordinate and: aCardinalPoint

	pointedCardinalPoint := aCardinalPoint. 
	actualCoordinates := aCoordinate.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: '05 - MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'LG 11/12/2021 09:52:49'!
deployAt: aCoordinates pointingAt: aCardinalPoint
	
	^self new initializeWith: aCoordinates and: aCardinalPoint.! !
