!classDefinition: #OOStackTest category: '04 - StackPrimeraParteOK'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

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


!classDefinition: #SentenceFinderByPrefixTest category: '04 - StackPrimeraParteOK'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:18:32'!
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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:32:46'!
shouldDo: aClosure andFailWith: anErrorMessage

	self
		should: [aClosure value]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [anErrorMessage value].! !

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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:35:21'!
test05CanNotFindSentencesWhenPrefixHasSpaces

	self
		should: [ sentenceFinder findWithPrefix: ' is ' at: stack]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpaces ].
	"self shouldDo: [ sentenceFinder findWithPrefix: ' is ' at: stack] andFailWith: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixHasSpaces ]."! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:34:26'!
test06CanNotFindSentencesWhenPrefixIsEmpty

	self
		should: [sentenceFinder findWithPrefix: '' at: stack]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixIsEmpty].
	"self shouldDo: [sentenceFinder findWithPrefix: '' at: stack] andFailWith: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixIsEmpty]." ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:21:06'!
test07StackHasTheSameSizeAsBeforeRunningSentenceFinderByPrefix

	| stackSizeAtTheBeggining stackSizeAtTheEnd |
	
	stackSizeAtTheBeggining := stack size.
		
	sentenceFinder findWithPrefix: 'Wint' at: stack. 
	
	stackSizeAtTheEnd := stack size.
	
	self assert: stackSizeAtTheBeggining equals: stackSizeAtTheEnd.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'srs 11/2/2021 16:22:39'!
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
	
	[stack isEmpty] whileFalse: [
		resultantStackOrder add: (stack pop).
		]. 
	
	self assert: resultantStackOrder equals: expectedStackOrder .! !


!classDefinition: #OOElement category: '04 - StackPrimeraParteOK'!
Object subclass: #OOElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

!OOElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:28:53'!
initializeWith: aValue
	self subclassResponsibility. ! !

!OOElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:53:39'!
removeFrom: aStack
	self subclassResponsibility. ! !

!OOElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:13:37'!
value
	self subclassResponsibility.! !


!classDefinition: #OOEmptyElement category: '04 - StackPrimeraParteOK'!
OOElement subclass: #OOEmptyElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:29:31'!
removeFrom: aStack
	^self error: OOStack stackEmptyErrorDescription.! !

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:23:56'!
value
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OONormalElement category: '04 - StackPrimeraParteOK'!
OOElement subclass: #OONormalElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:26:52'!
initializeWith: aValue
	value := aValue. 
	! !

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:54:40'!
removeFrom: aStack
	^ aStack removeFirst value.
	
	
	! !

!OONormalElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 21:14:21'!
value
	^ value.
	
	
	! !


!classDefinition: #OOStack category: '04 - StackPrimeraParteOK'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/2/2021 08:29:43'!
initialize
	stack := OrderedCollection new.
	stack addFirst: OOEmptyElement new.
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

!classDefinition: 'OOStack class' category: '04 - StackPrimeraParteOK'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: '04 - StackPrimeraParteOK'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'srs 11/2/2021 15:22:11'!
findWithPrefix: aPrefix at: aStack
	
	|tempOOStack tempString sentencesFoundByPrefix|
	
	self prefixIsValid: aPrefix.
	
	tempOOStack := OOStack new.
	sentencesFoundByPrefix := OrderedCollection new.
	
	[aStack isEmpty] whileFalse: [
		tempString := aStack pop.
		(tempString beginsWith: aPrefix) ifTrue: [
			sentencesFoundByPrefix add: tempString. 
			]. 
		tempOOStack push: tempString. 
	].

	[tempOOStack isEmpty] whileFalse: [
		tempString := tempOOStack pop.
		aStack push: tempString. 
	].	

	^sentencesFoundByPrefix. 
	! !

!SentenceFinderByPrefix methodsFor: 'find messages' stamp: 'srs 11/2/2021 15:21:36'!
prefixIsValid: aPrefix
	
	(aPrefix includesSubString: ' ') ifTrue: [self error: SentenceFinderByPrefix prefixHasSpaces ].
	(aPrefix size = 0) ifTrue: [self error: SentenceFinderByPrefix prefixIsEmpty ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: '04 - StackPrimeraParteOK'!
SentenceFinderByPrefix class
	instanceVariableNames: 'aStack'!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'srs 11/2/2021 15:12:53'!
prefixHasSpaces
	^'Prefix must not have any spaces.'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'srs 11/2/2021 15:13:20'!
prefixIsEmpty
	^'Prefix must not be empty.'! !
