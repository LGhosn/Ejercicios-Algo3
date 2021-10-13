!classDefinition: #TestingErrors category: 'CodigoRepetido-Ejercicio'!
Error subclass: #TestingErrors
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
TestingErrors subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
TestingErrors subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'Testing Messages' stamp: 'srs 10/10/2021 00:29:48'!
AssertThatIn: aCustomerBook theNumberOfSuspendedAndTotalCustomersAre: aNumber
	
	self assert: 0 equals: aCustomerBook numberOfActiveCustomers.
	self assert: aNumber equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: aNumber equals: aCustomerBook numberOfCustomers.

! !

!CustomerBookTest methodsFor: 'Testing Messages' stamp: 'LG 10/13/2021 18:22:26'!
DoThis: firstClosure ThenFailWith: anError AndFinallyDo: secondClosure

	[firstClosure value.
	self fail]
		on: anError
		do: secondClosure.! !

!CustomerBookTest methodsFor: 'Testing Messages' stamp: 'LG 10/13/2021 17:39:58'!
TimeOf: anAction for: aCostumerBook named: aPerson
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	anAction sendTo: aCostumerBook with: aPerson.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ millisecondsAfterRunning-millisecondsBeforeRunning.! !


!CustomerBookTest methodsFor: 'Tests' stamp: 'srs 10/9/2021 02:05:10'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook millisecondsToAddCustomer|
	customerBook  := CustomerBook new.	
	millisecondsToAddCustomer := self TimeOf: #addCustomerNamed: for: customerBook named: 'John Lennon'. 
	
	self assert: (millisecondsToAddCustomer) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'srs 10/9/2021 16:15:46'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| millisecondsToRemoveCustomer customerBook PaulMcCartney|
	
	customerBook := CustomerBook new.	
	PaulMcCartney := 'PaulMcCartney'.
	customerBook addCustomerNamed: PaulMcCartney.
	millisecondsToRemoveCustomer := self TimeOf: #removeCustomerNamed: for: customerBook named: PaulMcCartney. 
	self assert: (millisecondsToRemoveCustomer) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'LG 10/13/2021 18:21:44'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self DoThis: 	[ customerBook addCustomerNamed: ''.
	 ] ThenFailWith: Error AndFinallyDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'LG 10/13/2021 18:21:44'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.	
	customerBook addCustomerNamed: johnLennon.
	
	self DoThis: [ customerBook removeCustomerNamed: 'Paul McCartney'.
	 ] ThenFailWith:  NotFound AndFinallyDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'srs 10/10/2021 00:29:48'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook PaulMcCartney|
	
	customerBook := CustomerBook new.
	PaulMcCartney := 'PaulMcCartney'.
	customerBook addCustomerNamed: PaulMcCartney.
	customerBook suspendCustomerNamed: PaulMcCartney.
	self AssertThatIn: customerBook theNumberOfSuspendedAndTotalCustomersAre: 1.
	self assert: (customerBook includesCustomerNamed: PaulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'srs 10/10/2021 00:29:48'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Paul McCartney'.
	customerBook suspendCustomerNamed: 'Paul McCartney'.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	self AssertThatIn: customerBook theNumberOfSuspendedAndTotalCustomersAre: 0.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'LG 10/13/2021 18:21:44'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook JohnLennon  RingoStarr|
			
	customerBook := CustomerBook new.
	JohnLennon := 'John Lennon'.
	RingoStarr := 'Ringo Starr'.
	customerBook addCustomerNamed: JohnLennon.
	
	self DoThis: [ customerBook suspendCustomerNamed: RingoStarr .
	 ] ThenFailWith: CantSuspend AndFinallyDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: JohnLennon) ]
! !

!CustomerBookTest methodsFor: 'Tests' stamp: 'LG 10/13/2021 18:21:44'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self DoThis: [ customerBook suspendCustomerNamed: johnLennon.] 
		ThenFailWith: CantSuspend AndFinallyDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'srs 10/9/2021 17:36:39'!
LookForAndRemove: aName

    | aux contador |
    aux := OrderedCollection new.
    aux add: active.
    aux add: suspended.
    contador := 1.
    
    2 timesRepeat: [ |action |
        action := (aux at: contador).
        1 to: action size do: 
        [ :index |
            aName = (action at: index)
                ifTrue: [
                    action removeAt: index.
                    ^ aName. 
                ]
        ].
        contador := contador + 1.
    ].
    
    ^ NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'srs 10/9/2021 17:36:39'!
removeCustomerNamed: aName 
	^self LookForAndRemove: aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
