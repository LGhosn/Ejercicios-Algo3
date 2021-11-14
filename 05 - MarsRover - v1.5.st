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

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/13/2021 23:38:41'!
test06AfterApplyingAnInvalidCommandTheMarsRoverDoesNotRespond
	
	self
		should: [ self marsRoverDeployAt: (0 @ 0) whilePointingAt: 'N' andThenSend: 'x']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover invalidCommandRecived ].
! !

!TestMarsRover methodsFor: 'Basic Funcionalities' stamp: 'srs 11/14/2021 00:50:36'!
test07AllCommandsAreAppliyedUntilThereIsAnInvalidCommand
	
	| marsRover |

	marsRover := MarsRover deployAt: (0 @ 0) pointingAt: 'N'.
	
	self
		should: [ marsRover reciveOrder: 'flxf'.				
			]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assertThat: marsRover coordinatesAre: (0 @ 1) whiIeIsPointingAt: 'W'.
			self assert: anError messageText = MarsRover invalidCommandRecived ].! !


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


!classDefinition: #CommandRules category: '05 - MarsRover'!
Object subclass: #CommandRules
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!CommandRules methodsFor: 'as yet unclassified' stamp: 'srs 11/14/2021 01:33:14'!
executeCommandOn: aMarsRover

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

!Backward methodsFor: 'execution' stamp: 'srs 11/14/2021 01:33:53'!
executeCommandOn: aMarsRover

	(aMarsRover isPointingAt = 'N') ifTrue:[aMarsRover updateCoordinates: (0 @ -1)].
	(aMarsRover isPointingAt = 'S') ifTrue:[aMarsRover updateCoordinates: (0 @ 1)].
	(aMarsRover isPointingAt = 'E') ifTrue:[aMarsRover updateCoordinates: (-1 @ 0).].
	(aMarsRover isPointingAt = 'W') ifTrue:[aMarsRover updateCoordinates: (1 @ 0).].! !

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

!Forward methodsFor: 'execution' stamp: 'srs 11/14/2021 01:36:01'!
executeCommandOn: aMarsRover

	(aMarsRover isPointingAt = 'N') ifTrue:[aMarsRover updateCoordinates: (0 @ 1).].
	(aMarsRover isPointingAt = 'S') ifTrue:[aMarsRover updateCoordinates: (0 @ -1).].
	(aMarsRover isPointingAt = 'E') ifTrue:[aMarsRover updateCoordinates: (1 @ 0).].
	(aMarsRover isPointingAt = 'W') ifTrue:[aMarsRover updateCoordinates: (-1 @ 0).].! !

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

!InvalidCommand methodsFor: 'execution' stamp: 'srs 11/14/2021 01:35:04'!
executeCommandOn: aMarsRover

	aMarsRover executeInvalidCommand. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCommand class' category: '05 - MarsRover'!
InvalidCommand class
	instanceVariableNames: ''!

!InvalidCommand class methodsFor: 'initialization' stamp: 'srs 11/14/2021 01:53:03'!
canInstanciateWith: aCommand

	^ True ~= ({$f. $b. $l. $r} includes: aCommand).
! !


!classDefinition: #Left category: '05 - MarsRover'!
CommandRules subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '05 - MarsRover'!

!Left methodsFor: 'execution' stamp: 'srs 11/14/2021 01:38:20'!
executeCommandOn: aMarsRover

	| newPointedCardinalPoint |
	
	(aMarsRover isPointingAt = 'N') ifTrue:[newPointedCardinalPoint _ 'W'.].
	(aMarsRover isPointingAt = 'S') ifTrue:[newPointedCardinalPoint _ 'E'.].
	(aMarsRover isPointingAt = 'E') ifTrue:[newPointedCardinalPoint _ 'N'.].
	(aMarsRover isPointingAt = 'W') ifTrue:[newPointedCardinalPoint _ 'S'.].
	aMarsRover updatePointedCardinalPoint: newPointedCardinalPoint.! !

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

!Right methodsFor: 'execution' stamp: 'srs 11/14/2021 01:38:59'!
executeCommandOn: aMarsRover

	| newPointedCardinalPoint |

	(aMarsRover isPointingAt = 'N') ifTrue:[newPointedCardinalPoint _ 'E'.].
	(aMarsRover isPointingAt = 'S') ifTrue:[newPointedCardinalPoint _ 'W'.].
	(aMarsRover isPointingAt = 'E') ifTrue:[newPointedCardinalPoint _ 'S'.].
	(aMarsRover isPointingAt = 'W') ifTrue:[newPointedCardinalPoint _ 'N'.].
	aMarsRover updatePointedCardinalPoint: newPointedCardinalPoint.! !

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


!MarsRover methodsFor: 'ordering' stamp: 'srs 11/14/2021 01:58:06'!
reciveOrder: anOrderOfCommands 
	
	| index |
	
	index := 1.
	
	[index <= anOrderOfCommands size] whileTrue: [ | parsedCommand actualCommand|
		
		parsedCommand := anOrderOfCommands at: index.
		
		CommandRules subclasses do: [:subclass|(subclass canInstanciateWith: parsedCommand) ifTrue: [actualCommand := subclass new]].
		
		actualCommand executeCommandOn: self.
	
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


!MarsRover class methodsFor: 'initialization' stamp: 'LG 11/12/2021 09:52:49'!
deployAt: aCoordinates pointingAt: aCardinalPoint
	
	^self new initializeWith: aCoordinates and: aCardinalPoint.! !
