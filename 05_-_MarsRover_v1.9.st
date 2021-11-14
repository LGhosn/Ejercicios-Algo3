!classDefinition: #TestMarsRover category: '05 - MarsRover'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!TestMarsRover methodsFor: 'setUp' stamp: 'LG 11/14/2021 20:18:28'!
deployAtOriginPointingAtEastAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: East andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'LG 11/14/2021 20:17:50'!
deployAtOriginPointingAtNorthAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: North andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'LG 11/14/2021 20:18:18'!
deployAtOriginPointingAtSouthAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: South andThenSend: anOrder.! !

!TestMarsRover methodsFor: 'setUp' stamp: 'LG 11/14/2021 20:18:42'!
deployAtOriginPointingAtWestAndThenSend: anOrder

	^self marsRoverDeployAt: (0 @ 0) whilePointingAt: West andThenSend: anOrder.! !

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


!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 19:30:32'!
test01AfterBeingDeployedTheCardinalPointIsCorrect
	
	| marsRover |
	
	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: North.
	
	self assert: (marsRover isPointingAt isKindOf: North).! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 19:23:07'!
test02AfterBeingDeployedTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: North.
	
	self assert: (marsRover coordinates = (0 @ 0)).! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 20:23:23'!
test03AfterRotating360DegreesHasTheSameCardianalPoint
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'llll'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: North.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 20:27:40'!
test04CanBeDeployedAnywhere
	
	| marsRover |
	
	marsRover := self marsRoverDeployAt: (12 @ 30) whilePointingAt: North andThenSend: 'llll'.
	
	self deny: ((0 @ 0) = marsRover coordinates).
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 20:23:44'!
test05AfterApplyingACommandSecuenseTheCardinalPointAndTheCoordinatesAreCorrect
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'fl'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: West.
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 20:24:18'!
test06AfterApplyingAnUniqueInvalidCommandTheMarsRoverDoesNotRespondAndRaiseAnError
	
	self
		should: [ self deployAtOriginPointingAtNorthAndThenSend: 'x'.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandRecived ].
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'LG 11/14/2021 19:25:07'!
test07AllCommandsAreAppliyedUntilThereIsAnInvalidCommand
	
	| marsRover |

	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: North.
	
	self
		should: [ marsRover reciveOrder: 'flxf'.				
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: West.
			self assert: anError messageText = MarsRover invalidCommandRecived ].! !


!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'LG 11/14/2021 20:19:39'!
test08MovingForwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: North.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'LG 11/14/2021 20:19:51'!
test09MovingBackwardWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |

	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whiIeIsPointingAt: North.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'LG 11/14/2021 20:20:00'!
test10RotatingLeftWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: West.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is North' stamp: 'LG 11/14/2021 20:20:06'!
test11RotatingRightWhileIsPointingAtNorthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtNorthAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: East.! !


!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'LG 11/14/2021 20:20:20'!
test12MovingForwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (0 @ -1) whiIeIsPointingAt: South.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'LG 11/14/2021 20:20:32'!
test13MovingBackwardWhileTheCardinalPointAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: South.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'LG 11/14/2021 20:20:37'!
test14RotatingLeftWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: East.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is South' stamp: 'LG 11/14/2021 20:20:43'!
test15RotatingRightWhileIsPointingAtSouthHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtSouthAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: West.! !


!TestMarsRover methodsFor: 'When The Cardinal Point is East' stamp: 'LG 11/14/2021 20:21:01'!
test16MovingForwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whiIeIsPointingAt: East.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is East' stamp: 'LG 11/14/2021 20:21:15'!
test17MovingBackwardWhileTheCardinalPointAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whiIeIsPointingAt: East.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is East' stamp: 'LG 11/14/2021 20:21:22'!
test18RotatingLeftWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: North.! !

!TestMarsRover methodsFor: 'When The Cardinal Point is East' stamp: 'LG 11/14/2021 20:21:29'!
test19RotatingRightWhileIsPointingAtEastHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtEastAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: South.! !


!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'LG 11/14/2021 20:21:44'!
test20MovingForwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'f'.
	
	self assertThat: marsRover coordinatesAre: (-1 @ 0) whiIeIsPointingAt: West.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'LG 11/14/2021 20:21:53'!
test21MovingBackwardWhileTheCardinalPointAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'b'.
	
	self assertThat: marsRover coordinatesAre: (1 @ 0) whiIeIsPointingAt: West.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'LG 11/14/2021 20:22:03'!
test22RotatingLeftWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'l'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: South.! !

!TestMarsRover methodsFor: 'When The Cardinal Point Is West' stamp: 'LG 11/14/2021 20:22:15'!
test23RotatingRightWhileIsPointingAtWestHasTheCorrectBehaviour
	
	| marsRover |
	
	marsRover := self deployAtOriginPointingAtWestAndThenSend: 'r'.
	
	self assertThat: marsRover coordinatesAre: (0 @ 0) whiIeIsPointingAt: North.! !


!classDefinition: #CardinalPoints category: '05 - MarsRover'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:51:43'!
isBeingPointedWhileGoingBackwardOn: aMarsRover
	
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:54:02'!
isBeingPointedWhileGoingForwardOn: aMarsRover
	
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:13'!
isBeingPointedWhileTurnignLeftOn: aMarsRover
	
	self subclassResponsibility.! !

!CardinalPoints methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:32'!
isBeingPointedWhileTurningRightOn: aMarsRover
	
	self subclassResponsibility.! !


!classDefinition: #East category: '05 - MarsRover'!
CardinalPoints subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:51:43'!
isBeingPointedWhileGoingBackwardOn: aMarsRover 	
	
	aMarsRover updateCoordinates: (-1 @ 0)! !

!East methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:54:02'!
isBeingPointedWhileGoingForwardOn: aMarsRover
	
	aMarsRover updateCoordinates: (1 @ 0)! !

!East methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:13'!
isBeingPointedWhileTurnignLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:32'!
isBeingPointedWhileTurningRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: South new.! !


!classDefinition: #North category: '05 - MarsRover'!
CardinalPoints subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:51:43'!
isBeingPointedWhileGoingBackwardOn: aMarsRover
	
	aMarsRover updateCoordinates: (0 @ -1)! !

!North methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:54:02'!
isBeingPointedWhileGoingForwardOn: aMarsRover
	
	aMarsRover updateCoordinates: (0 @ 1)! !

!North methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:13'!
isBeingPointedWhileTurnignLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:32'!
isBeingPointedWhileTurningRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: East new.! !


!classDefinition: #South category: '05 - MarsRover'!
CardinalPoints subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:51:43'!
isBeingPointedWhileGoingBackwardOn: aMarsRover 	
	
	aMarsRover updateCoordinates: (0 @ 1)! !

!South methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:54:02'!
isBeingPointedWhileGoingForwardOn: aMarsRover
	
	aMarsRover updateCoordinates: (0 @ -1)! !

!South methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:13'!
isBeingPointedWhileTurnignLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:32'!
isBeingPointedWhileTurningRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: West new.! !


!classDefinition: #West category: '05 - MarsRover'!
CardinalPoints subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:51:43'!
isBeingPointedWhileGoingBackwardOn: aMarsRover 	
	
	aMarsRover updateCoordinates: (1 @ 0)! !

!West methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:54:02'!
isBeingPointedWhileGoingForwardOn: aMarsRover
	
	aMarsRover updateCoordinates: (-1 @ 0)! !

!West methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:13'!
isBeingPointedWhileTurnignLeftOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:55:32'!
isBeingPointedWhileTurningRightOn: aMarsRover
	
	aMarsRover updatePointedCardinalPoint: North new.! !


!classDefinition: #CommandRules category: '05 - MarsRover'!
Object subclass: #CommandRules
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!CommandRules methodsFor: 'as yet unclassified' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandRules class' category: '05 - MarsRover'!
CommandRules class
	instanceVariableNames: ''!

!CommandRules class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:49:45'!
canInstanciateWith: aCommand

	self subclassResponsibility.! !


!classDefinition: #Backward category: '05 - MarsRover'!
CommandRules subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Backward methodsFor: 'execution' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover

	(aMarsRover isPointingAt) isBeingPointedWhileGoingBackwardOn: aMarsRover.! !

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

!Forward methodsFor: 'execution' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover

	(aMarsRover isPointingAt) isBeingPointedWhileGoingForwardOn: aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: '05 - MarsRover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:50:53'!
canInstanciateWith: aCommand

	^ $f = aCommand. 
! !


!classDefinition: #InvalidCommand category: '05 - MarsRover'!
CommandRules subclass: #InvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!InvalidCommand methodsFor: 'execution' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover

	aMarsRover executeInvalidCommand. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCommand class' category: '05 - MarsRover'!
InvalidCommand class
	instanceVariableNames: ''!

!InvalidCommand class methodsFor: 'initialization' stamp: 'LG 11/14/2021 18:38:46'!
canInstanciateWith: aCommand

	^ true ~= ({$f. $b. $l. $r} includes: aCommand).
! !


!classDefinition: #Left category: '05 - MarsRover'!
CommandRules subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Left methodsFor: 'execution' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover

	(aMarsRover isPointingAt) isBeingPointedWhileTurnignLeftOn: aMarsRover.! !

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

!Right methodsFor: 'execution' stamp: 'LG 11/14/2021 19:58:57'!
executeOn: aMarsRover


	(aMarsRover isPointingAt) isBeingPointedWhileTurningRightOn: aMarsRover.! !

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

!MarsRover methodsFor: 'updating' stamp: 'srs 11/14/2021 01:30:11'!
updateCoordinates: someCoordinates

	actualCoordinates := actualCoordinates + someCoordinates. ! !

!MarsRover methodsFor: 'updating' stamp: 'srs 11/14/2021 01:37:01'!
updatePointedCardinalPoint: aCardinalPoint

	pointedCardinalPoint := aCardinalPoint. ! !


!MarsRover methodsFor: 'ordering' stamp: 'LG 11/14/2021 19:57:31'!
identifyParsedCommand: parsedCommand

	CommandRules subclasses do: [:subclass| (subclass canInstanciateWith: parsedCommand) ifTrue: [ ^subclass new]].

! !

!MarsRover methodsFor: 'ordering' stamp: 'LG 11/14/2021 19:58:57'!
reciveOrder: anOrderOfCommands 
	
	| index |
	
	index := 1.
	
	[index <= anOrderOfCommands size] whileTrue: [ | parsedCommand actualCommand|
		
		parsedCommand := anOrderOfCommands at: index.

		actualCommand := self identifyParsedCommand: parsedCommand.
		
		actualCommand executeOn: self.
	
		index := index + 1.		
	] .
! !


!MarsRover methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:59:44'!
initializeWith: someCoordinates and: aCardinalPoint

	pointedCardinalPoint := aCardinalPoint. 
	actualCoordinates := someCoordinates.
! !


!MarsRover methodsFor: 'executing commands' stamp: 'srs 11/14/2021 00:16:04'!
executeInvalidCommand
	
	self error: MarsRover invalidCommandRecived. ! !


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
