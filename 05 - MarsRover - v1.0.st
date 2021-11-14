!classDefinition: #TestMarsRover category: '05 - MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!TestMarsRover methodsFor: 'setUp/tearDown' stamp: 'srs 11/13/2021 22:16:08'!
marsRoverDeployAt: someCoordinates whilePointingAt: aCardinalPoint andThenSend: anOrderOfCommands

	| marsRover |
	marsRover := MarsRover deployAt: someCoordinates pointingAt: aCardinalPoint.
	marsRover reciveOrder: anOrderOfCommands.
	^marsRover
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'srs 11/13/2021 21:21:37'!
assertThat: aMarsRover coordinatesAre: someCoordinates whiIeIsPointingAt: aCardianlPoint
	
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

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/13/2021 21:21:38'!
test03AfterRotating360DegreesHasTheSameCardianalPoint
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'llll'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'N'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/13/2021 21:21:38'!
test04CanBeDeployedAnywhere
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (12 @ 30) whilePointingAt: 'N' andThenSend: 'llll'.
	
	self assertThat: marsRover coordinatesAre: (12 @ 30) whiIeIsPointingAt: 'N'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/13/2021 21:25:12'!
test05AfterApplyingACommandSecuenseTheCardinalPointAndTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'fl'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: 'W'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/13/2021 21:21:38'!
test06AfterApplyingAnInvalidCommandTheMarsRoverDoesNotRespond
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'x'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'N'.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/13/2021 21:22:32'!
test07AllCommandsAreAppliyedUntilThereIsAnInvalidCommand
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'flxf'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: 'W'.
! !


!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/13/2021 21:21:38'!
test08MovingForwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: 'N'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/13/2021 21:21:37'!
test09MovingBackwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |

	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whiIeIsPointingAt: 'N'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/13/2021 21:25:19'!
test10RotatingLeftWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'W'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'srs 11/13/2021 21:21:38'!
test11RotatingRightWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'E'.! !


!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/13/2021 21:21:38'!
test12MovingForwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whiIeIsPointingAt: 'S'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/13/2021 21:21:37'!
test13MovingBackwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: 'S'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/13/2021 21:21:38'!
test14RotatingLeftWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'E'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'srs 11/13/2021 21:25:29'!
test15RotatingRightWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'S' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'W'.! !


!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/13/2021 21:21:38'!
test16MovingForwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whiIeIsPointingAt: 'E'.! !

!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/13/2021 21:21:38'!
test17MovingBackwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whiIeIsPointingAt: 'E'.! !

!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/13/2021 21:21:38'!
test18RotatingLeftWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'N'.! !

!TestMarsRover methodsFor: 'When The Cardinal Poin is East' stamp: 'srs 11/13/2021 21:21:38'!
test19RotatingRightWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'E' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'S'.! !


!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/13/2021 21:25:44'!
test20MovingForwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'W' andThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whiIeIsPointingAt: 'W'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/13/2021 21:26:00'!
test21MovingBackwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'W' andThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whiIeIsPointingAt: 'W'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/13/2021 21:26:09'!
test22RotatingLeftWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'W' andThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'S'.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'srs 11/13/2021 21:26:35'!
test23RotatingRightWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'W' andThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: 'N'.! !


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

!MarsRover methodsFor: 'control' stamp: 'srs 11/13/2021 21:24:49'!
reciveOrder: anOrderOfCommands 
	
	| index validCommands|
	index := 1.
	validCommands := Set new.
	validCommands add: $f; add: $b; add: $l; add: $r.
	
	[index <= anOrderOfCommands size] whileTrue: [ | newPointedCardinalPoint |
		
		(validCommands includes: (anOrderOfCommands at: index) ) ifFalse: [	^self].
		
		((anOrderOfCommands at: index) = $f) ifTrue: [
			(self isPointingAt = 'N') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ 1).].
			(self isPointingAt = 'S') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ -1).].
			(self isPointingAt = 'E') ifTrue:[actualCoordinates _ actualCoordinates + (1 @ 0).].
			(self isPointingAt = 'W') ifTrue:[actualCoordinates _ actualCoordinates + (-1 @ 0).].
		].
		((anOrderOfCommands at: index) = $b) ifTrue: [
				(self isPointingAt = 'N') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ -1)].
				(self isPointingAt = 'S') ifTrue:[actualCoordinates _ actualCoordinates + (0 @ 1)].
				(self isPointingAt = 'E') ifTrue:[actualCoordinates _ actualCoordinates + (-1 @ 0).].
				(self isPointingAt = 'W') ifTrue:[actualCoordinates _ actualCoordinates + (1 @ 0).].
			]. 
		((anOrderOfCommands at: index) = $l) ifTrue: [
			(self isPointingAt = 'N') ifTrue:[newPointedCardinalPoint _ 'W'.].
			(self isPointingAt = 'S') ifTrue:[newPointedCardinalPoint _ 'E'.].
			(self isPointingAt = 'E') ifTrue:[newPointedCardinalPoint _ 'N'.].
			(self isPointingAt = 'W') ifTrue:[newPointedCardinalPoint _ 'S'.].
			pointedCardinalPoint  _ newPointedCardinalPoint.
		].
		((anOrderOfCommands at: index) = $r) ifTrue: [
			(self isPointingAt = 'N') ifTrue:[newPointedCardinalPoint _ 'E'.].
			(self isPointingAt = 'S') ifTrue:[newPointedCardinalPoint _ 'W'.].
			(self isPointingAt = 'E') ifTrue:[newPointedCardinalPoint _ 'S'.].
			(self isPointingAt = 'W') ifTrue:[newPointedCardinalPoint _ 'N'.].
			pointedCardinalPoint  _ newPointedCardinalPoint.
		].
		index _ index + 1.	
	] .

! !


!MarsRover methodsFor: 'initialization' stamp: 'srs 11/13/2021 21:16:55'!
initializeWith: someCoordinates and: aCardinalPoint

	pointedCardinalPoint := aCardinalPoint. 
	actualCoordinates := someCoordinates.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: '05 - MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'LG 11/12/2021 09:52:49'!
deployAt: aCoordinates pointingAt: aCardinalPoint
	
	^self new initializeWith: aCoordinates and: aCardinalPoint.! !
