!classDefinition: #OOStackTest category: '04 - StackSegundaParteOK'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'LG 11/3/2021 01:17:02'!
test11

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

!OOStackTest methodsFor: 'test' stamp: 'LG 11/3/2021 01:18:23'!
test12

	| stack  |
	
	stack := OOLimitedStack new initializeWithSize: 3.
	stack push: 'hola'.
	stack push: 'hola'.
	stack push: 'hola'.	
	stack pop.
	stack push: 'hola'.
	self assert: 3 equals: stack size.! !

!OOStackTest methodsFor: 'test' stamp: 'LG 11/3/2021 01:25:30'!
test13

	self
		should: [OOLimitedStack new initializeWithSize: 0]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackSizeIsInvalid ].! !

!OOStackTest methodsFor: 'test' stamp: 'LG 11/3/2021 01:25:43'!
test14
	self
		should: [OOLimitedStack new initializeWithSize: -1]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOLimitedStack stackSizeIsInvalid ].! !


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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LG 11/2/2021 23:58:30'!
should: aClosure andThenFailWith: anErrorMessage

	self
		should: [aClosure value]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = (anErrorMessage sendTo: SentenceFinderByPrefix ) ].! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:28:11'!
test01SentenceFinderExpectedResultIsCaseSensitive
	
	|sentencesFoundByPrefix expectedCollection|
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'Wint' at: stack.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'Winter is here'.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:28:29'!
test02SentenceFinderExpectedResultIsEmpty

	| sentencesFoundByPrefix expectedCollection |
	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'Sum' at: stack.
	
	expectedCollection := OrderedCollection new.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:15:14'!
test03SentenceFinderExpectedResultIsLowerCase

	| expectedCollection sentencesFoundByPrefix |	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'wint' at: stack.

	expectedCollection := OrderedCollection new.	
	expectedCollection add: 'winter is coming'.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:19:12'!
test04SentenceFinderExpectedResultIsUpperCase

	| sentencesFoundByPrefix expectedCollection |
	
	sentencesFoundByPrefix := sentenceFinder findWithPrefix: 'WINT' at: stack.
	
	expectedCollection := OrderedCollection new.
	expectedCollection add: 'WINTER IS COMING'.
	
	self assert: expectedCollection equals: sentencesFoundByPrefix.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LG 11/2/2021 23:58:30'!
test05CanNotFindSentencesWhenPrefixHasSpaces

	self should: [sentenceFinder findWithPrefix: ' is ' at: stack] andThenFailWith: #prefixHasSpaces
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LG 11/2/2021 23:58:30'!
test06CanNotFindSentencesWhenPrefixIsEmpty

	self should: [sentenceFinder findWithPrefix: '' at: stack]  andThenFailWith: #prefixIsEmpty
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:21:06'!
test07StackHasTheSameSizeAsBeforeRunningSentenceFinderByPrefix

	| stackSizeAtTheBeggining stackSizeAtTheEnd |
	
	stackSizeAtTheBeggining := stack size.
		
	sentenceFinder findWithPrefix: 'Wint' at: stack. 
	
	stackSizeAtTheEnd := stack size.
	
	self assert: stackSizeAtTheBeggining equals: stackSizeAtTheEnd.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'LG 11/3/2021 00:44:27'!
test08StackHasTheSameStringsAtTheSameOrderBeforeRunningSentenceFinderByPrefix

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

!OOElement methodsFor: 'standard messages' stamp: 'LG 11/3/2021 00:37:36'!
initializeWith: aValue
	self subclassResponsibility.! !

!OOElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:53:39'!
removeFrom: aStack
	self subclassResponsibility. ! !

!OOElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:13:37'!
value
	self subclassResponsibility.! !


!classDefinition: #OOEmptyElement category: '04 - StackSegundaParteOK'!
OOElement subclass: #OOEmptyElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOEmptyElement methodsFor: 'standard messages' stamp: 'LG 11/3/2021 00:37:25'!
initializeWith: aValue
	value := aValue.! !

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:29:31'!
removeFrom: aStack
	^self error: OOStack stackEmptyErrorDescription.! !

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:23:56'!
value
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OONormalElement category: '04 - StackSegundaParteOK'!
OOElement subclass: #OONormalElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OONormalElement methodsFor: 'standard messages' stamp: 'LG 11/3/2021 00:37:29'!
initializeWith: aValue
	value := aValue.! !

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:54:40'!
removeFrom: aStack
	^ aStack removeFirst value.
	
	
	! !

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:14:21'!
value
	^ value.
	
	
	! !


!classDefinition: #OOStack category: '04 - StackSegundaParteOK'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!OOStack methodsFor: 'initialization' stamp: 'LG 11/3/2021 01:04:21'!
initialize
	stack := OrderedCollection new.
	stack addFirst: (OOEmptyElement new initializeWith: nil).
	! !


!OOStack methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:45:41'!
isEmpty
	^stack size = 1.! !

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:08:12'!
pop
	|topElement|
	topElement := stack first.
	^topElement removeFrom: stack
	! !

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:47:07'!
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

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'LG 11/3/2021 01:21:04'!
checkLimit
	(limit = stack size) ifTrue: [self error: OOLimitedStack stackLimitReached].! !

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'LG 11/3/2021 01:22:55'!
checkSize: aSize
	(aSize > 0) ifFalse: [self error: OOLimitedStack stackSizeIsInvalid].! !

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'LG 11/3/2021 01:22:15'!
initializeWithSize: aSize
	self checkSize: aSize.
	stack := OrderedCollection new.
	stack addFirst: (OOEmptyElement new initializeWith: nil).
	limit := aSize + 1.
	! !

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'LG 11/3/2021 01:23:50'!
push: something
	|newElement|
	self checkLimit.
	newElement := OONormalElement new initializeWith: something. 
	stack addFirst: newElement .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: '04 - StackSegundaParteOK'!
OOLimitedStack class
	instanceVariableNames: ''!

!OOLimitedStack class methodsFor: 'as yet unclassified' stamp: 'LG 11/3/2021 01:13:58'!
stackLimitReached
	^'limite de stack alcanzado'.! !

!OOLimitedStack class methodsFor: 'as yet unclassified' stamp: 'LG 11/3/2021 01:23:26'!
stackSizeIsInvalid
	^'tamaño invalido'.! !


!classDefinition: #SentenceFinderByPrefix category: '04 - StackSegundaParteOK'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackSegundaParteOK'!

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'LG 11/3/2021 01:01:23'!
checkIfThePrefixIsNotValid: aPrefix
	
	(aPrefix includesSubString: ' ') ifTrue: [self error: SentenceFinderByPrefix prefixHasSpaces].
	(aPrefix size = 0) ifTrue: [self error: SentenceFinderByPrefix prefixIsEmpty].! !

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'LG 11/3/2021 00:48:06'!
findWithPrefix: aPrefix at: aStack
	
	|tempOOStack tempString sentencesFoundByPrefix|
	
	self checkIfThePrefixIsNotValid: aPrefix.
	
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
