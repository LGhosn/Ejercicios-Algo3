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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '04 - StackPrimeraParteOK'!


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

!OOEmptyElement methodsFor: 'standard messages' stamp: 'srs 11/1/2021 20:29:16'!
initializeWith: aValue
	value := nil.! !

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

!OOStack methodsFor: 'standard messages' stamp: 'srs 11/1/2021 23:02:27'!
initialize
	stack := OrderedCollection new.
	stack addFirst: (OOEmptyElement new).
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
