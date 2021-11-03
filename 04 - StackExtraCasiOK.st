!classDefinition: #OOStackTest category: '04 - StackSegundaParteOK'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:18:53'!
test11LimitedStackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOLimitedStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:19:11'!
test12PushAddElementsToTheLimitedStack

	| stack |
	
	stack := OOLimitedStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:20:06'!
test13PopRemovesElementsFromTheLimitedStack

	| stack |
	
	stack := OOLimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:20:14'!
test14PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOLimitedStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:20:35'!
test15LimitedStacksBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOLimitedStack new initializeWithSize: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty.! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:20:50'!
test16TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOLimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:21:04'!
test17TopDoesNotRemoveObjectFromLimitedStack

	| stack pushedObject |
	
	stack := OOLimitedStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:21:48'!
test18CanNotPopWhenThereAreNoObjectsInTheLimitedStack

	| stack  |
	
	stack := OOLimitedStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:21:57'!
test19CanNotPopWhenThereAreNoObjectsInTheLimitedStackAndItHadObjects

	| stack  |
	
	stack := OOLimitedStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:32:47'!
test20CanNotTopWhenThereAreNoObjectsInTheLimitedStack

	| stack  |
	
	stack := OOLimitedStack new.
	
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackEmptyErrorDescription ]
! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:32:53'!
test21CanNotPushIfLimitHasBeenReached

	| stack  |
	
	stack := OOLimitedStack new initializeWithSize: 3.
	stack push: 'hola'.
	stack push: 'hola'.
	stack push: 'hola'.	
	
	self
		should: [stack push: 'chau']
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackLimitReached].! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:22:40'!
test22CanNotInitializeLimitedStackWithSizeEqualToZero

	self
		should: [OOLimitedStack new initializeWithSize: 0]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackSizeIsNotValid ].! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:33:02'!
test23CanNotInitializeLimitedStackWithNegativeSize

	self
		should: [OOLimitedStack new initializeWithSize: -1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackSizeIsNotValid ].! !

!OOStackTest methodsFor: 'test - OOLimitedStack' stamp: 'srs 11/3/2021 17:33:07'!
test24CanNotInitializeLimitedStackWithFloatSize

	self
		should: [OOLimitedStack new initializeWithSize: 3.14]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackSizeIsNotValid ].! !


!OOStackTest methodsFor: 'test - OOStack' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test - OOStack' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: '04 - StackSegundaParteOK'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LG 11/2/2021 23:04:44'!
setUp
	
	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.
	
	stack push: 'winter is coming'. 
	stack push: 'winning is everything'. 
	stack push: 'The winds of Winter'. 
	stack push: 'Winter is here'.
	stack push: 'WINTER IS COMING'. 
	stack push: 'WINNING IS EVERYTHING'. 
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:06:43'!
shouldDo: aClosure andThenFailWith: anErrorMessage

	self
		should: [aClosure value]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = (anErrorMessage sendTo: SentenceFinderByPrefix ) ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 09:59:31'!
test01SentenceFinderExpectedResultIsCaseSensitive
	
	|sentencesFoundByPrefix expectedCollection|
	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'Wint' at: stack.
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'Winter is here'.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 09:59:51'!
test02SentenceFinderExpectedResultIsEmpty

	| sentencesFoundByPrefix expectedCollection |
	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'Sum' at: stack.
	expectedCollection := OrderedCollection new.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:00:03'!
test03SentenceFinderExpectedResultIsLowerCase

	| expectedCollection sentencesFoundByPrefix |	
	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'wint' at: stack.
	expectedCollection := OrderedCollection new.	
	expectedCollection add: 'winter is coming'.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:00:24'!
test04SentenceFinderExpectedResultIsUpperCase

	| sentencesFoundByPrefix expectedCollection |
	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'WINT' at: stack.
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'WINTER IS COMING'.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:07:31'!
test05CanNotFindSentencesWhenPrefixHasSpaces

	self shouldDo: [sentenceFinder findWithPrefix: ' is ' at: stack] andThenFailWith: #prefixHasSpaces.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:07:37'!
test06CanNotFindSentencesWhenPrefixIsEmpty

	self shouldDo: [sentenceFinder findWithPrefix: '' at: stack]  andThenFailWith: #prefixIsEmpty.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:10:26'!
test07StackHasTheSameSizeAsBeforeUsingSentenceFinderByPrefix

	| stackSizeAtTheBeggining stackSizeAtTheEnd |
	
	stackSizeAtTheBeggining := stack size.	
	sentenceFinder findWithPrefix: 'Wint' at: stack. 
	stackSizeAtTheEnd := stack size.
	
	self assert: stackSizeAtTheBeggining equals: stackSizeAtTheEnd.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/3/2021 10:13:22'!
test08StackHasTheSameStringsAtTheSameOrderBeforeAndAfterUsingSentenceFinderByPrefix

	| resultantStackOrder expectedStackOrder |
	
	resultantStackOrder := OrderedCollection new.
	expectedStackOrder := OrderedCollection new.
	
	expectedStackOrder addFirst: 	'winter is coming'.
	expectedStackOrder addFirst: 'winning is everything'.
	expectedStackOrder addFirst: 'The winds of Winter'. 
	expectedStackOrder addFirst: 'Winter is here'.
	expectedStackOrder addFirst: 'WINTER IS COMING'. 
	expectedStackOrder addFirst: 'WINNING IS EVERYTHING'. 
	
	sentenceFinder findWithPrefix: 'Wint' at: stack. 
	
	sentenceFinder whileThisStackIsNotEmpty: stack do: [
		resultantStackOrder add: (stack pop).
		].
	
	self assert: resultantStackOrder equals: expectedStackOrder .! !


!classDefinition: #OOElement category: '04 - StackSegundaParteOK'!
Object subclass: #OOElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOElement methodsFor: 'initialization' stamp: 'srs 11/3/2021 17:31:36'!
initializeWith: aValue

	self subclassResponsibility.! !


!OOElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:27'!
removeFrom: aStack

	self subclassResponsibility. ! !

!OOElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:31'!
value

	self subclassResponsibility.! !


!classDefinition: #OOEmptyElement category: '04 - StackSegundaParteOK'!
OOElement subclass: #OOEmptyElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:41'!
initializeWith: aValue

	value := aValue.! !

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:45'!
removeFrom: aStack

	^self error: OOStack stackEmptyErrorDescription.! !

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:48'!
value

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OONormalElement category: '04 - StackSegundaParteOK'!
OOElement subclass: #OONormalElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:55'!
initializeWith: aValue

	value := aValue.! !

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:58'!
removeFrom: aStack

	^ aStack removeFirst value.
	
	
	! !

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:32:03'!
value

	^ value.
	
	
	! !


!classDefinition: #OOStack category: '04 - StackSegundaParteOK'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:07'!
isEmpty

	^stack size = 1.! !

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:10'!
pop

	|topElement|
	topElement := stack first.
	^topElement removeFrom: stack
	! !

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:31:15'!
push: Something

	|newElement|
	newElement := OONormalElement new initializeWith: Something. 
	stack addFirst: newElement .! !

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:46:04'!
size

	^stack size - 1.! !

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:14:35'!
top
	|topElement|
	topElement := stack first.
	^topElement value.! !


!OOStack methodsFor: 'initialization' stamp: 'srs 11/3/2021 17:31:02'!
initialize

	stack := OrderedCollection new.
	stack addFirst: (OOEmptyElement new initializeWith: nil).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: '04 - StackSegundaParteOK'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOLimitedStack category: '04 - StackSegundaParteOK'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOLimitedStack methodsFor: 'validation messages' stamp: 'srs 11/3/2021 17:30:44'!
validateLimit

	(limit = stack size) ifTrue: [self error: OOLimitedStack stackLimitReached].! !

!OOLimitedStack methodsFor: 'validation messages' stamp: 'srs 11/3/2021 17:30:48'!
validateSize: aSize

	(aSize > 0 and: aSize isInteger ) ifFalse: [self error: OOLimitedStack stackSizeIsNotValid].! !


!OOLimitedStack methodsFor: 'standard messages' stamp: 'srs 11/3/2021 17:28:52'!
push: something
	
	|newElement|
	
	self validateLimit.
	newElement := OONormalElement new initializeWith: something. 
	stack addFirst: newElement .! !


!OOLimitedStack methodsFor: 'initialization' stamp: 'srs 11/3/2021 17:30:15'!
initializeWithSize: aSize
	
	self validateSize: aSize.
	stack := OrderedCollection new.
	stack addFirst: (OOEmptyElement new initializeWith: nil).
	limit := aSize + 1.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: '04 - StackSegundaParteOK'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'LG 11/3/2021 01:13:58'!
stackLimitReached
	^'limite de stack alcanzado'.! !

!OOLimitedStack class methodsFor: 'error descriptions' stamp: 'srs 11/3/2021 11:42:12'!
stackSizeIsNotValid
	^'tamaño invalido, debe ser un entero mayor a cero'.! !


!classDefinition: #SentenceFinderByPrefix category: '04 - StackSegundaParteOK'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'srs 11/3/2021 17:33:54'!
findWithPrefix: aPrefix at: aStack
	
	|tempOOStack tempString sentencesFoundByPrefix|
	
	self validatePrefix: aPrefix.
	
	tempOOStack := OOStack new.
	sentencesFoundByPrefix := OrderedCollection new.
	
	self whileThisStackIsNotEmpty: aStack do: [
		tempString := aStack pop.
		(tempString beginsWith: aPrefix) ifTrue: [
			sentencesFoundByPrefix add: tempString. 
			]. 
		tempOOStack push: tempString. 
	].
	self whileThisStackIsNotEmpty: tempOOStack do: [
		tempString := tempOOStack pop.
		aStack push: tempString. 
	].
	
	^sentencesFoundByPrefix. 
	! !

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'srs 11/3/2021 17:33:54'!
validatePrefix: aPrefix
	
	(aPrefix includesSubString: ' ') ifTrue: [self error: SentenceFinderByPrefix prefixHasSpaces].
	(aPrefix size = 0) ifTrue: [self error: SentenceFinderByPrefix prefixIsEmpty].! !

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'LG 11/3/2021 00:29:22'!
whileThisStackIsNotEmpty: aStack do: aClosure
	
	[aStack isEmpty] whileFalse: 		aClosure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: '04 - StackSegundaParteOK'!
SentenceFinderByPrefix class
	instanceVariableNames: 'aStack'!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'srs 11/2/2021 15:12:53'!
prefixHasSpaces
	^'Prefix must not have any spaces.'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'srs 11/2/2021 15:13:20'!
prefixIsEmpty
	^'Prefix must not be empty.'! !
