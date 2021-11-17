!classDefinition: #TestMarsRover category: '05 - MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!TestMarsRover methodsFor: 'setUp' stamp: 'srs 11/15/2021 15:06:26'!
deployAtOriginPointingAtEastAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: EastPoint andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'srs 11/15/2021 15:06:35'!
deployAtOriginPointingAtNorthAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: NorthPoint andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'srs 11/15/2021 15:06:44'!
deployAtOriginPointingAtSouthAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: SouthPoint andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'srs 11/15/2021 15:06:53'!
deployAtOriginPointingAtWestAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: WestPoint andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'srs 11/13/2021 22:16:08'!
marsRoverDeployAt: someCoordinates whilePointingAt: aCardinalPoint andThenSend: anOrderOfCommands

	| marsRover |
	marsRover := MarsRover deployAt: someCoordinates pointingAt: aCardinalPoint.
	marsRover reciveOrder: anOrderOfCommands.
	^marsRover
	! !


!TestMarsRover methodsFor: 'assertions' stamp: 'LG 11/14/2021 19:30:51'!
assertThat: aMarsRover coordinatesAre: someCoordinates whiIeIsPointingAt: aCardianlPoint
	
	self assert: (aMarsRover isPointingAt isKindOf: aCardianlPoint).
	self assert: (aMarsRover coordinates = someCoordinates).! !

!TestMarsRover methodsFor: 'assertions' stamp: 'srs 11/15/2021 15:06:35'!
assertThatAMarsRoverIsPointingNorthAfterBeingDeployed
	
	| marsRover |
	
	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: NorthPoint.
	self assert: (marsRover isPointingAt isKindOf: NorthPoint).! !

!TestMarsRover methodsFor: 'assertions' stamp: 'srs 11/15/2021 15:06:35'!
assertThatAMarsRoverWasDeployedAtOrigin
	
	| marsRover |
	
	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: NorthPoint.

	self assert: (marsRover coordinates = (0 @ 0)).! !


!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'srs 11/15/2021 15:03:02'!
test01AfterBeingDeployedTheCardinalPointIsCorrect
	
	self assertThatAMarsRoverIsPointingNorthAfterBeingDeployed.! !

!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'srs 11/15/2021 15:04:19'!
test02AfterBeingDeployedTheCoordinatesAreCorrect
	
	self assertThatAMarsRoverWasDeployedAtOrigin.! !

!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'srs 11/15/2021 15:06:35'!
test03AfterRotating360DegreesHasTheSameCardianalPoint
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'llll'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: NorthPoint.
! !

!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'srs 11/15/2021 15:06:35'!
test04CanBeDeployedAnywhere
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (12 @ 30) whilePointingAt: NorthPoint andThenSend: 'llll'.
	
	self deny: ((0 @ 0) = marsRover coordinates).
! !

!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'srs 11/15/2021 15:06:53'!
test05AfterApplyingACommandSecuenseTheCardinalPointAndTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'fl'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: WestPoint.
! !

!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'LG 11/14/2021 20:24:18'!
test06AfterApplyingAnUniqueInvalidCommandTheMarsRoverDoesNotRespondAndRaiseAnError
	
	self
		should: [ self deployAtOriginPointingAtNorthAndThenSend: 'x'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandRecived ].
! !

!TestMarsRover methodsFor: 'Test-Basic Funcionalities' stamp: 'srs 11/15/2021 15:06:53'!
test07AllCommandsAreAppliyedUntilThereIsAnInvalidCommand
	
	| marsRover |

	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: NorthPoint.
	
	self
		should: [ marsRover reciveOrder: 'flxf'.				
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: WestPoint.
			self assert: anError messageText = MarsRover invalidCommandRecived ].! !


!TestMarsRover methodsFor: 'Test-When The Cardinal Point is North' stamp: 'srs 11/15/2021 15:06:35'!
test08MovingForwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: NorthPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is North' stamp: 'srs 11/15/2021 15:06:35'!
test09MovingBackwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |

	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whiIeIsPointingAt: NorthPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is North' stamp: 'srs 11/15/2021 15:06:53'!
test10RotatingLeftWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: WestPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is North' stamp: 'srs 11/15/2021 15:06:26'!
test11RotatingRightWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: EastPoint.! !


!TestMarsRover methodsFor: 'Test-When The Cardinal Point is South' stamp: 'srs 11/15/2021 15:06:44'!
test12MovingForwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whiIeIsPointingAt: SouthPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is South' stamp: 'srs 11/15/2021 15:06:44'!
test13MovingBackwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: SouthPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is South' stamp: 'srs 11/15/2021 15:06:26'!
test14RotatingLeftWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: EastPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is South' stamp: 'srs 11/15/2021 15:06:53'!
test15RotatingRightWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: WestPoint.! !


!TestMarsRover methodsFor: 'Test-When The Cardinal Point is East' stamp: 'srs 11/15/2021 15:06:26'!
test16MovingForwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whiIeIsPointingAt: EastPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is East' stamp: 'srs 11/15/2021 15:06:26'!
test17MovingBackwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whiIeIsPointingAt: EastPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is East' stamp: 'srs 11/15/2021 15:06:35'!
test18RotatingLeftWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: NorthPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point is East' stamp: 'srs 11/15/2021 15:06:44'!
test19RotatingRightWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: SouthPoint.! !


!TestMarsRover methodsFor: 'Test-When The Cardinal Point Is West' stamp: 'srs 11/15/2021 15:06:53'!
test20MovingForwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whiIeIsPointingAt: WestPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point Is West' stamp: 'srs 11/15/2021 15:06:53'!
test21MovingBackwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whiIeIsPointingAt: WestPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point Is West' stamp: 'srs 11/15/2021 15:06:44'!
test22RotatingLeftWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: SouthPoint.! !

!TestMarsRover methodsFor: 'Test-When The Cardinal Point Is West' stamp: 'srs 11/15/2021 15:06:35'!
test23RotatingRightWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: NorthPoint.! !


!classDefinition: #CommandRules category: '05 - MarsRover'!
Object subclass: #CommandRules
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!CommandRules methodsFor: 'execution' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandRules class' category: '05 - MarsRover'!
CommandRules class
	instanceVariableNames: ''!

!CommandRules class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:49:45'!
canInstanciateWith: aCommand

	self subclassResponsibility.! !


!CommandRules class methodsFor: 'private' stamp: 'srs 11/17/2021 00:02:05'!
identifyParsedCommand: parsedCommand

	CommandRules subclasses do: [:subclass| (subclass canInstanciateWith: parsedCommand) ifTrue: [ ^subclass new]].
	self error: MarsRover invalidCommandRecived. ! !


!classDefinition: #Backward category: '05 - MarsRover'!
CommandRules subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Backward methodsFor: 'execution' stamp: 'srs 11/17/2021 00:25:04'!
executeOn: aMarsRover

	aMarsRover moveBackward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: '05 - MarsRover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:50:20'!
canInstanciateWith: aCommand

	^ $b = aCommand. ! !


!classDefinition: #Forward category: '05 - MarsRover'!
CommandRules subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Forward methodsFor: 'execution' stamp: 'srs 11/17/2021 00:20:36'!
executeOn: aMarsRover
	
	aMarsRover moveForward. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: '05 - MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:50:53'!
canInstanciateWith: aCommand

	^ $f = aCommand. 
! !


!classDefinition: #Left category: '05 - MarsRover'!
CommandRules subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Left methodsFor: 'execution' stamp: 'srs 11/17/2021 00:23:28'!
executeOn: aMarsRover
	
	aMarsRover rotateLeft. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Left class' category: '05 - MarsRover'!
Left class
	instanceVariableNames: ''!

!Left class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:51:33'!
canInstanciateWith: aCommand

	^ $l = aCommand. ! !


!classDefinition: #Right category: '05 - MarsRover'!
CommandRules subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Right methodsFor: 'execution' stamp: 'srs 11/17/2021 00:24:42'!
executeOn: aMarsRover

	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Right class' category: '05 - MarsRover'!
Right class
	instanceVariableNames: ''!

!Right class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:51:48'!
canInstanciateWith: aCommand

	^ $r = aCommand. ! !


!classDefinition: #MarsRover category: '05 - MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'pointedCardinalPoint actualCoordinates'
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!MarsRover methodsFor: 'updating' stamp: 'srs 11/17/2021 00:34:48'!
addMarsRoverCoordinatesWith: someCoordinates

	actualCoordinates := actualCoordinates + someCoordinates. ! !

!MarsRover methodsFor: 'updating' stamp: 'srs 11/14/2021 01:37:01'!
updatePointedCardinalPoint: aCardinalPoint

	pointedCardinalPoint := aCardinalPoint. ! !


!MarsRover methodsFor: 'movement - rotate' stamp: 'srs 11/17/2021 00:16:59'!
moveBackward

	pointedCardinalPoint conditionatesMoveBackwardOn: self.  ! !

!MarsRover methodsFor: 'movement - rotate' stamp: 'srs 11/17/2021 00:19:24'!
moveForward

	pointedCardinalPoint conditionatesMoveForwardOn: self.  ! !

!MarsRover methodsFor: 'movement - rotate' stamp: 'srs 11/17/2021 00:22:53'!
rotateLeft

	pointedCardinalPoint conditionatesRotateLeftOn: self.  ! !

!MarsRover methodsFor: 'movement - rotate' stamp: 'srs 11/17/2021 00:24:12'!
rotateRight

	pointedCardinalPoint conditionatesRotateRightOn: self.  ! !


!MarsRover methodsFor: 'ordering' stamp: 'srs 11/16/2021 23:23:40'!
reciveOrder: anOrderOfCommands 
	
	anOrderOfCommands do: [ :aCommand | | actualCommand |
		
		actualCommand := CommandRules identifyParsedCommand: aCommand.
		
		actualCommand executeOn: self.
		].
! !


!MarsRover methodsFor: 'initialization' stamp: 'srs 11/15/2021 14:14:21'!
initializeWith: initialCoordinates and: aCardinalPoint

	pointedCardinalPoint := aCardinalPoint. 
	actualCoordinates := initialCoordinates.
! !


!MarsRover methodsFor: 'accessing' stamp: 'LG 11/12/2021 11:33:52'!
coordinates

	^actualCoordinates.! !

!MarsRover methodsFor: 'accessing' stamp: 'LG 11/12/2021 09:14:29'!
isPointingAt 

	^pointedCardinalPoint.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: '05 - MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'recived command errors' stamp: 'srs 11/13/2021 23:43:24'!
invalidCommandRecived	

	^'There is a character in the recived command that is not valid for the Rover.'! !


!MarsRover class methodsFor: 'initialization' stamp: 'LG 11/14/2021 19:28:15'!
deployAt: aCoordinates pointingAt: aCardinalPoint
	
	^self new initializeWith: aCoordinates and: aCardinalPoint new.! !


!classDefinition: #MarsRoverPointedCardinalPoints category: '05 - MarsRover'!
Object subclass: #MarsRoverPointedCardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!MarsRoverPointedCardinalPoints methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:15:43'!
conditionatesMoveBackwardOn: aMarsRover 	

	self subclassResponsibility. ! !

!MarsRoverPointedCardinalPoints methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:18:33'!
conditionatesMoveForwardOn: aMarsRover 	

	self subclassResponsibility. ! !

!MarsRoverPointedCardinalPoints methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:22:07'!
conditionatesRotateLeftOn: aMarsRover

	self subclassResponsibility. ! !

!MarsRoverPointedCardinalPoints methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:23:53'!
conditionatesRotateRightOn: aMarsRover

	self subclassResponsibility. ! !


!classDefinition: #EastPoint category: '05 - MarsRover'!
MarsRoverPointedCardinalPoints subclass: #EastPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!EastPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveBackwardOn: aMarsRover 	
	
	aMarsRover addMarsRoverCoordinatesWith: (-1 @ 0)! !

!EastPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveForwardOn: aMarsRover
	
	aMarsRover addMarsRoverCoordinatesWith: (1 @ 0)! !

!EastPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:22:07'!
conditionatesRotateLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: NorthPoint new.! !

!EastPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:23:53'!
conditionatesRotateRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: SouthPoint new.! !


!classDefinition: #NorthPoint category: '05 - MarsRover'!
MarsRoverPointedCardinalPoints subclass: #NorthPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!NorthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveBackwardOn: aMarsRover
	
	aMarsRover addMarsRoverCoordinatesWith: (0 @ -1)! !

!NorthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveForwardOn: aMarsRover
	
	aMarsRover addMarsRoverCoordinatesWith: (0 @ 1)! !

!NorthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:22:07'!
conditionatesRotateLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: WestPoint new.! !

!NorthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:23:53'!
conditionatesRotateRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: EastPoint new.! !


!classDefinition: #SouthPoint category: '05 - MarsRover'!
MarsRoverPointedCardinalPoints subclass: #SouthPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!SouthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveBackwardOn: aMarsRover 	
	
	aMarsRover addMarsRoverCoordinatesWith: (0 @ 1)! !

!SouthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveForwardOn: aMarsRover
	
	aMarsRover addMarsRoverCoordinatesWith: (0 @ -1)! !

!SouthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:22:07'!
conditionatesRotateLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: EastPoint new.! !

!SouthPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:23:53'!
conditionatesRotateRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: WestPoint new.! !


!classDefinition: #WestPoint category: '05 - MarsRover'!
MarsRoverPointedCardinalPoints subclass: #WestPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!WestPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveBackwardOn: aMarsRover 	
	
	aMarsRover addMarsRoverCoordinatesWith: (1 @ 0)! !

!WestPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:34:48'!
conditionatesMoveForwardOn: aMarsRover
	
	aMarsRover addMarsRoverCoordinatesWith: (-1 @ 0)! !

!WestPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:22:07'!
conditionatesRotateLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: SouthPoint new.! !

!WestPoint methodsFor: 'movement conditions' stamp: 'srs 11/17/2021 00:23:53'!
conditionatesRotateRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: NorthPoint new.! !
