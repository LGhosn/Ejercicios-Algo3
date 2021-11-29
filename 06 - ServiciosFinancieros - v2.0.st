!classDefinition: #Tests category: #'06 - ServiciosFinancieros'!
TestCase subclass: #Tests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!


!classDefinition: #PortfolioWithoutRulesTest category: #'06 - ServiciosFinancieros'!
Tests subclass: #PortfolioWithoutRulesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!PortfolioWithoutRulesTest methodsFor: 'setUp' stamp: 'srs 11/25/2021 20:20:06'!
initalizeAReceptiveAccountWith: anAmountOfMoney

	| account |
	
	account := ReceptiveAccount new.
	AccountDeposit register: anAmountOfMoney on: account.
	
	^account.! !


!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/25/2021 10:27:12'!
test00AnEmptyPortfolioBalanceEqualsToZeroPesos

	| portfolio |
	
	portfolio := PortfolioWithoutRules with: {}.
	self assert: portfolio balance equals: 0 * peso.
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/25/2021 10:41:51'!
test01BalanceEqualsToTheUniqueAccountBalance

	| account1  portfolio |
	
	account1 := self initalizeAReceptiveAccountWith: 100 * peso.
	
	portfolio := PortfolioWithoutRules with: {account1.}.
	self assert: portfolio balance equals: 100 * peso.
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/25/2021 10:42:19'!
test02BalanceEqualsToAllTheLinkedAccountsBalance

	| account1 account2 portfolio |
	
	account1 := self initalizeAReceptiveAccountWith: 100 * peso.
	
	account2 := self initalizeAReceptiveAccountWith: 200 * peso.
	
	portfolio := PortfolioWithoutRules with: {account1. account2}.
	self assert: portfolio balance equals: 300 * peso.
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/26/2021 00:20:22'!
test03LinkedAccountMadeATransaction

	| account portfolio deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account.
	withdraw := AccountWithdraw register: 50 * peso on: account.
	
	portfolio := PortfolioWithoutRules with: {account}.

	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/25/2021 21:07:46'!
test04NoLinkedAccountMadeATransaction

	| portfolio deposit |
	
	portfolio := PortfolioWithoutRules with: {}. 
	deposit := AccountDeposit for: 100 * peso.
		
	self deny: (portfolio hasRegistered: deposit).
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/25/2021 21:09:28'!
test05AllTransactionsOfAnAccountAreKnownByThePortfolio

	| account1 portfolio transactions firstTransaction secondTransaction |
	
	account1 := ReceptiveAccount new.
	firstTransaction := AccountDeposit register: 100 * peso on: account1.
	secondTransaction := AccountWithdraw register: 25 * peso on: account1.
	
	portfolio := PortfolioWithoutRules with: {account1}. 
		
	transactions := portfolio transactions.
	
	self assert: (transactions at: 1) equals: firstTransaction.
	self assert: (transactions at: 2) equals: secondTransaction.
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:20:14'!
test06BalanceEqualsToAllLinkedAccountsAndPortfoliosBalance

	| account1 account2 mainPortfolio secondaryPortfolio |
	
	account1 := self initalizeAReceptiveAccountWith: 100 * peso.
	AccountWithdraw register: 25 * peso on: account1.
	
	account2 := self initalizeAReceptiveAccountWith: 150 * peso.
	AccountWithdraw register: 25 * peso on: account2.
	
	secondaryPortfolio := PortfolioWithoutRules with: {account1}. 
	
	mainPortfolio := PortfolioWithoutRules with: {secondaryPortfolio. account2}.
		
	self assert: mainPortfolio balance equals: 200 * peso.
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/26/2021 00:21:02'!
test07LinkedAccountInLinkedPortfolioMadeATransaction

	| account1 deposit mainPortfolio secondaryPortfolio |
	
	account1 := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account1. 
	
	secondaryPortfolio := PortfolioWithoutRules with: {account1}.
	
	mainPortfolio := PortfolioWithoutRules with: {secondaryPortfolio}.
		
	self assert: (mainPortfolio hasRegistered: deposit).
	 ! !

!PortfolioWithoutRulesTest methodsFor: 'tests' stamp: 'srs 11/26/2021 00:23:35'!
test08AllTransactionsOfAnAccountAreKnownByThePortfolio

	| account1 transactions firstTransaction secondTransaction mainPortfolio secondaryPortfolio |
	
	account1 := ReceptiveAccount new.
	firstTransaction := AccountDeposit register: 100 * peso on: account1.
	secondTransaction := AccountWithdraw register: 25 * peso on: account1.
	
	secondaryPortfolio := PortfolioWithoutRules with: {account1}. 
	
	mainPortfolio := PortfolioWithoutRules with: {secondaryPortfolio}.
	
	transactions := mainPortfolio transactions .
	
	self assert: (transactions at: 1) equals: firstTransaction.
	self assert: (transactions at: 2) equals: secondTransaction.
	 ! !


!classDefinition: #ReceptiveAccountTest category: #'06 - ServiciosFinancieros'!
Tests subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LG 11/24/2021 15:06:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assertFinalBalanceIn: account is: 0 * peso. 
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LG 11/24/2021 15:08:39'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account :=	self initalizeAReceptiveAccountWith: 100 * peso.
		
	self assertFinalBalanceIn: account is: 100 * peso. 
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:20:14'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := self initalizeAReceptiveAccountWith: 100 * peso.
	AccountWithdraw register: 50 * peso on: account.
		
	self assertFinalBalanceIn: account is: 50 * peso.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:20:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (AccountWithdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:20:14'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account.
	withdraw := AccountWithdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:20:15'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  AccountDeposit for: 100 * peso.
	withdraw := AccountWithdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:20:06'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := AccountDeposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'assertions' stamp: 'LG 11/24/2021 15:06:35'!
assertFinalBalanceIn: anAccount is: anAmountOfMoney
		
	self assert: anAmountOfMoney equals: anAccount balance
! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'srs 11/25/2021 20:20:06'!
initalizeAReceptiveAccountWith: anAmountOfMoney

	| account |
	
	account := ReceptiveAccount new.
	AccountDeposit register: anAmountOfMoney on: account.
	
	^account.
! !


!classDefinition: #TransfersBetwenAccountsTest category: #'06 - ServiciosFinancieros'!
Tests subclass: #TransfersBetwenAccountsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!TransfersBetwenAccountsTest methodsFor: 'assertions' stamp: 'LG 11/24/2021 15:17:21'!
assert: anOriginAccount balanceIs: anOriginAccountBalance and: aDestinationAccount balanceIs: aDestinationAccountBalance
	
	self assert: anOriginAccount balance equals: anOriginAccountBalance.
	self assert: aDestinationAccount balance equals: aDestinationAccountBalance.! !


!TransfersBetwenAccountsTest methodsFor: 'tests' stamp: 'LG 11/24/2021 15:17:58'!
test01AfterATransferTheOriginAccountHasNegativeBalanceAndTheDestinationAccountHasPositiveBalance

	| originAccount destinationAcccount |
	
	originAccount := ReceptiveAccount new. 
	destinationAcccount := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAcccount for: 100 * peso.

	self assert: originAccount balanceIs: (-100 * peso)  and: destinationAcccount  balanceIs: (100 * peso).! !

!TransfersBetwenAccountsTest methodsFor: 'tests' stamp: 'LG 11/24/2021 15:18:20'!
test02AfterATransferOfZeroMoneyBothAccountsHaveTheSameBalanceAsBefore

	| originAccount destinationAcccount destinationAccountInitialBalance originAccountInitialBalance |
	
	originAccount := ReceptiveAccount new. 
	destinationAcccount := ReceptiveAccount new.
	
	originAccountInitialBalance := originAccount balance.
	destinationAccountInitialBalance := destinationAcccount balance.

	Transfer from: originAccount to: destinationAcccount for: 0 * peso.
	
	self assert: originAccount balanceIs: originAccountInitialBalance  and: destinationAcccount  balanceIs: destinationAccountInitialBalance ! !

!TransfersBetwenAccountsTest methodsFor: 'tests' stamp: 'srs 11/23/2021 10:57:50'!
test03TheTransferValueIsCorrect

	| originAccount destinationAcccount firstTransfer secondTransfer |
	
	originAccount := ReceptiveAccount new. 
	destinationAcccount := ReceptiveAccount new.
	
	firstTransfer := Transfer from: originAccount to: destinationAcccount for: 50 * peso.
	secondTransfer := Transfer from: originAccount to: destinationAcccount for: 100 * peso. 
		
	self assert: (firstTransfer value) equals: 50 * peso.
	self assert: (secondTransfer value) equals: 100 * peso.! !

!TransfersBetwenAccountsTest methodsFor: 'tests' stamp: 'srs 11/25/2021 20:52:18'!
test04EachPartOfTheTransferKnowItsCounterPart

	| originAccount destinationAcccount transferMovement |
	
	originAccount := ReceptiveAccount new. 
	destinationAcccount := ReceptiveAccount new.
	
	transferMovement := Transfer from: originAccount to: destinationAcccount for: 50 * peso.
		
	self assert: (transferMovement depositLeg) equals: (transferMovement withdrawLeg counterpart).
	self assert: (transferMovement withdrawLeg) equals: (transferMovement depositLeg counterpart).! !

!TransfersBetwenAccountsTest methodsFor: 'tests' stamp: 'srs 11/23/2021 10:50:04'!
test05CanNotTransferANegativeAmountOfMoney

	| originAccount destinationAcccount |
	
	originAccount := ReceptiveAccount new. 
	destinationAcccount := ReceptiveAccount new.
	
	self
		should: [Transfer from: originAccount to: destinationAcccount for: -50 * peso] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo:[ :anError | self assert: anError messageText = Transfer InvalidTranferError].	! !


!classDefinition: #ValidPortfolioTest category: #'06 - ServiciosFinancieros'!
Tests subclass: #ValidPortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/26/2021 00:30:32'!
test00InAValidPortfolioWhereAccountsHaveZeroBalanceHasZeroBalance

	| portfolio account1 account2 |
	
	account1 := ReceptiveAccount new.
	
	account2 := ReceptiveAccount new.

	portfolio := ValidPortfolio with: {account1. account2}.
	
	self assert: portfolio balance equals: 0 * peso.
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/25/2021 09:39:33'!
test01APortfolioCanNotAddTheSameAccountTwice

	| account portfolio |
	
	account := ReceptiveAccount new.

	portfolio := ValidPortfolio with: {account.}.
	
	self 
		should: [portfolio add: 	account]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = ValidPortfolio canNotAddAnAccountTwiceError].	
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/26/2021 00:30:03'!
test02APortfolioCanNotBeInitializeWithTheSameAccountTwice

	| account |
	
	account := ReceptiveAccount new.

	self 
		should: [ValidPortfolio with: {account. account}]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = ValidPortfolio canNotAddAnAccountTwiceError].	
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/26/2021 00:30:53'!
test03APortfolioCanNotIncludeItself

	| portfolio |

	portfolio := ValidPortfolio with: {}.

	self 
		should: [portfolio add: portfolio]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = ValidPortfolio canNotAddItself].	
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/26/2021 00:32:29'!
test04APortfolioCanNotAddAnAccountAlreadyIncludedInAPreviouslyAddedPortfolio

	| account mainPortfolio secondaryPortfolio |
	
	account := ReceptiveAccount new.

	secondaryPortfolio := ValidPortfolio with: {account}.
	
	mainPortfolio := ValidPortfolio with: {secondaryPortfolio}.
	
	self 
		should: [mainPortfolio add: 	account]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = ValidPortfolio canNotAddAnAccountTwiceError].	
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/26/2021 00:33:15'!
test05CanNotAddAPortfolioToAnotherPortfolioWhenBothHaveAnAccountInCommon

	| account mainPortfolio secondaryPortfolio |
	
	account := ReceptiveAccount new.

	mainPortfolio := ValidPortfolio with: {account}.
	
	secondaryPortfolio := ValidPortfolio with: {account}.
	
	self 
		should: [mainPortfolio add: 	secondaryPortfolio]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = ValidPortfolio canNotAddAnAccountTwiceError].	
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'srs 11/26/2021 00:33:28'!
test06TheBalanceOfAValidPortfolioIsCorrect

	| account account2 mainPortfolio secondaryPortfolio |
	
	account := ReceptiveAccount new.
	AccountDeposit register: 100 * peso on: account.
	
	account2 := ReceptiveAccount new.
	AccountDeposit register: 200 * peso on: account2. 

	secondaryPortfolio := ValidPortfolio with: {account}.
	
	mainPortfolio := ValidPortfolio with: {secondaryPortfolio. account2}.
	
	self assert: mainPortfolio balance equals: 300 * peso.
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'LG 11/29/2021 11:34:32'!
test07CanNotAddAPortfolioThatHasALinkedAccountInCommonWithAnotherPortfolioAlreadyAdded

	| portfolio1 portfolio2 portfolio3 account|
	
	account := ReceptiveAccount new.
	
	portfolio1 := ValidPortfolio with: {}.
	
	portfolio2 := ValidPortfolio with: {}.
	
	portfolio3 := ValidPortfolio with: {}.	
	
	portfolio1 add: account.
	portfolio2 add: account.
	portfolio3 add: portfolio1.
		
	self 
		should: [portfolio3 add: portfolio2]
		raise: Error - MessageNotUnderstood
		withExceptionDo:[ :anError | self assert: anError messageText = ValidPortfolio canNotAddAnAccountTwiceError].	
	 	
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'LG 11/29/2021 18:34:07'!
test08LinkedAccountMadeATransaction

	| account portfolio deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account.
	withdraw := AccountWithdraw register: 50 * peso on: account.
	
	portfolio := ValidPortfolio with: {account}.

	self assert: (portfolio hasRegistered: deposit).
	self assert: (portfolio hasRegistered: withdraw).
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'LG 11/29/2021 18:38:15'!
test09NoLinkedAccountMadeATransaction

	| account portfolio deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account.
	withdraw := AccountWithdraw register: 50 * peso on: account.
	
	portfolio := ValidPortfolio with: {}.

	self deny: (portfolio hasRegistered: deposit).
	self deny: (portfolio hasRegistered: withdraw).
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'LG 11/29/2021 18:40:34'!
test10LinkedPortfolioMadeATransaction

	| account portfolio deposit withdraw mainPortfolio |
	
	account := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account.
	withdraw := AccountWithdraw register: 50 * peso on: account.
	
	portfolio := ValidPortfolio with: {account }.
	
	mainPortfolio := ValidPortfolio with: {portfolio}.

	self assert: (mainPortfolio hasRegistered: deposit).
	self assert: (mainPortfolio hasRegistered: withdraw).
! !

!ValidPortfolioTest methodsFor: 'test' stamp: 'LG 11/29/2021 18:41:17'!
test11NoLinkedPortfolioMadeATransaction

	| account portfolio deposit withdraw mainPortfolio |
	
	account := ReceptiveAccount new.
	deposit := AccountDeposit register: 100 * peso on: account.
	withdraw := AccountWithdraw register: 50 * peso on: account.
	
	portfolio := ValidPortfolio with: {}.
	
	mainPortfolio := ValidPortfolio with: {portfolio}.

	self deny: (mainPortfolio hasRegistered: deposit).
	self deny: (mainPortfolio hasRegistered: withdraw).
! !


!classDefinition: #AccountTransaction category: #'06 - ServiciosFinancieros'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'main protocol' stamp: 'srs 11/25/2021 10:58:37'!
sumValueToAccountBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'06 - ServiciosFinancieros'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'srs 11/18/2021 21:42:39'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'srs 11/25/2021 20:38:39'!
register: aValue on: anAccount through: aTransaction

	| transaction |
	
	transaction := self for: aValue in: aTransaction.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #AccountDeposit category: #'06 - ServiciosFinancieros'!
AccountTransaction subclass: #AccountDeposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!AccountDeposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!AccountDeposit methodsFor: 'main protocol' stamp: 'LG 11/29/2021 11:04:25'!
sumValueToAccountBalance

	^self value! !

!AccountDeposit methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountDeposit class' category: #'06 - ServiciosFinancieros'!
AccountDeposit class
	instanceVariableNames: ''!

!AccountDeposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountWithdraw category: #'06 - ServiciosFinancieros'!
AccountTransaction subclass: #AccountWithdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!AccountWithdraw methodsFor: 'initialization' stamp: 'srs 11/18/2021 21:37:01'!
initializeFor: aValue

	value := aValue.! !


!AccountWithdraw methodsFor: 'main protocol' stamp: 'srs 11/25/2021 20:18:42'!
sumValueToAccountBalance

	^ value negated.! !

!AccountWithdraw methodsFor: 'main protocol' stamp: 'srs 11/18/2021 21:41:37'!
value

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountWithdraw class' category: #'06 - ServiciosFinancieros'!
AccountWithdraw class
	instanceVariableNames: ''!

!AccountWithdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: #'06 - ServiciosFinancieros'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value origin'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!TransferDeposit methodsFor: 'initialization' stamp: 'srs 11/25/2021 20:43:46'!
initializeFor: aValue in: aTransaction

	value := aValue.
	origin := aTransaction. ! !


!TransferDeposit methodsFor: 'main protocol' stamp: 'srs 11/25/2021 20:43:46'!
counterpart

	^ origin withdrawLeg. 	! !

!TransferDeposit methodsFor: 'main protocol' stamp: 'srs 11/25/2021 20:47:30'!
sumValueToAccountBalance

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'06 - ServiciosFinancieros'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'srs 11/25/2021 20:41:52'!
for: aValue in: aTransaction

	^ self new initializeFor: aValue in: aTransaction. ! !


!classDefinition: #TransferWithdraw category: #'06 - ServiciosFinancieros'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value origin'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'srs 11/25/2021 20:44:00'!
initializeFor: aValue in: aTransaction

	value := aValue.
	origin := aTransaction. ! !


!TransferWithdraw methodsFor: 'main protocol' stamp: 'srs 11/25/2021 20:44:16'!
counterpart

	^ origin depositLeg. 	! !

!TransferWithdraw methodsFor: 'main protocol' stamp: 'srs 11/25/2021 20:47:39'!
sumValueToAccountBalance

	^value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'06 - ServiciosFinancieros'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'srs 11/25/2021 20:42:01'!
for: aValue in: aTransaction

	^ self new initializeFor: aValue in: aTransaction. ! !


!classDefinition: #BankAccount category: #'06 - ServiciosFinancieros'!
Object subclass: #BankAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!BankAccount methodsFor: 'main protocol' stamp: 'LG 11/29/2021 18:23:23'!
balance
	
	self subclassResponsibility.! !

!BankAccount methodsFor: 'main protocol' stamp: 'LG 11/29/2021 18:41:57'!
hasRegistered: aTransaction

	self subclassResponsibility.! !

!BankAccount methodsFor: 'main protocol' stamp: 'LG 11/29/2021 18:43:05'!
transactions
	
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: #'06 - ServiciosFinancieros'!
BankAccount subclass: #Portfolio
	instanceVariableNames: 'linkedAccountsAndPortfolios registeredTransactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!Portfolio methodsFor: 'initialization' stamp: 'LG 11/25/2021 12:06:49'!
initialeWith: anAccountsGrouping
	
	self subclassResponsibility.! !


!Portfolio methodsFor: 'main protocol' stamp: 'LG 11/25/2021 12:01:24'!
balance
	
	^ linkedAccountsAndPortfolios sum:[ :actualAccount | actualAccount balance] ifEmpty: [ 0 * peso].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'06 - ServiciosFinancieros'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'LG 11/29/2021 11:14:47'!
with: anAccountsGrouping

	^self new initializeWith: anAccountsGrouping. ! !


!classDefinition: #PortfolioWithoutRules category: #'06 - ServiciosFinancieros'!
Portfolio subclass: #PortfolioWithoutRules
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!PortfolioWithoutRules methodsFor: 'private' stamp: 'LG 11/29/2021 11:18:38'!
linkAccountsAndRegisterTransactionsOf: anAccountsGrouping

	^ anAccountsGrouping do: [:actualAccount | linkedAccountsAndPortfolios add: actualAccount. 
									self registerTransactionsOnPortfolioOf: actualAccount.]! !

!PortfolioWithoutRules methodsFor: 'private' stamp: 'LG 11/29/2021 11:18:22'!
registerTransactionsOnPortfolioOf: actualAccount

	^ (actualAccount transactions) do: [				:aTransaction | registeredTransactions add: aTransaction.	]! !


!PortfolioWithoutRules methodsFor: 'initialization' stamp: 'srs 11/26/2021 00:27:45'!
initializeWith: anAccountsGrouping

	linkedAccountsAndPortfolios := Set new.
	registeredTransactions := OrderedCollection new.
	
	self linkAccountsAndRegisterTransactionsOf: anAccountsGrouping.	! !


!PortfolioWithoutRules methodsFor: 'main protocol' stamp: 'srs 11/25/2021 21:03:50'!
hasRegistered: aTransaction

	^ registeredTransactions includes: aTransaction .! !

!PortfolioWithoutRules methodsFor: 'main protocol' stamp: 'srs 11/25/2021 21:08:48'!
transactions

	^ registeredTransactions copy.! !


!classDefinition: #ValidPortfolio category: #'06 - ServiciosFinancieros'!
Portfolio subclass: #ValidPortfolio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!ValidPortfolio methodsFor: 'main protocol' stamp: 'LG 11/29/2021 12:30:03'!
accountsAndPortfolios

	^ linkedAccountsAndPortfolios copy.! !

!ValidPortfolio methodsFor: 'main protocol' stamp: 'LG 11/29/2021 18:36:25'!
add: anAccountOrAPortfolio 
	
	self verifyAPortfolioIsNotAddingItself: anAccountOrAPortfolio.
	
	self verify: linkedAccountsAndPortfolios notIncludes: anAccountOrAPortfolio.
	
	linkedAccountsAndPortfolios do: [:anAccount |  
		(anAccount isKindOf: ValidPortfolio) ifTrue: [ anAccountOrAPortfolio doesNotHaveAccountsInCommonWith: anAccount .		].
	].

	(anAccountOrAPortfolio transactions) do: [				:aTransaction | registeredTransactions add: aTransaction.	].
	
	anAccountOrAPortfolio doesNotHaveAccountsInCommonWith: self.
	
	linkedAccountsAndPortfolios add: anAccountOrAPortfolio.
! !

!ValidPortfolio methodsFor: 'main protocol' stamp: 'LG 11/29/2021 18:35:22'!
hasRegistered: aTransaction
	
	^ registeredTransactions includes: aTransaction.! !

!ValidPortfolio methodsFor: 'main protocol' stamp: 'LG 11/29/2021 18:37:04'!
transactions
	
	^ registeredTransactions copy! !


!ValidPortfolio methodsFor: 'private' stamp: 'LG 11/29/2021 12:30:03'!
doesNotHaveAccountsInCommonWith: aValidPortfolio
	
	self accountsAndPortfolios do: [:anotherAccount | self verify: (aValidPortfolio accountsAndPortfolios) notIncludes: anotherAccount.]! !

!ValidPortfolio methodsFor: 'private' stamp: 'LG 11/29/2021 11:54:46'!
verify: linkedAccountAndPortfolio notIncludes: anAccount

	 (linkedAccountAndPortfolio includes: anAccount) ifTrue: [self error: ValidPortfolio canNotAddAnAccountTwiceError]. ! !

!ValidPortfolio methodsFor: 'private' stamp: 'LG 11/29/2021 12:26:19'!
verifyAPortfolioIsNotAddingItself: anAccountOrAPortfolio

	(anAccountOrAPortfolio isEqualTo: self) ifTrue: [self error: ValidPortfolio canNotAddItself]! !


!ValidPortfolio methodsFor: 'initialization' stamp: 'LG 11/29/2021 18:35:54'!
initializeWith: anAccountsGrouping

	linkedAccountsAndPortfolios := Set new.
	registeredTransactions := OrderedCollection new.
	
	anAccountsGrouping do:[:anAccount | self add: anAccount ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ValidPortfolio class' category: #'06 - ServiciosFinancieros'!
ValidPortfolio class
	instanceVariableNames: ''!

!ValidPortfolio class methodsFor: 'errors' stamp: 'LG 11/25/2021 12:07:57'!
canNotAddAnAccountTwiceError

	^'A portfolio cannot add the same account twice.'! !

!ValidPortfolio class methodsFor: 'errors' stamp: 'LG 11/25/2021 12:08:00'!
canNotAddItself

	^'A portfolio cannot add itself.'! !


!classDefinition: #ReceptiveAccount category: #'06 - ServiciosFinancieros'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LG 11/24/2021 14:48:45'!
balance

	^transactions sum: [ :aTransaction | aTransaction sumValueToAccountBalance] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LG 11/29/2021 12:30:18'!
doesNotHaveAccountsInCommonWith: aValidPortfolio

	aValidPortfolio verify: (aValidPortfolio accountsAndPortfolios) notIncludes: self. ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: #'06 - ServiciosFinancieros'!
Object subclass: #Transfer
	instanceVariableNames: 'transferValue transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: '06 - ServiciosFinancieros'!

!Transfer methodsFor: 'public' stamp: 'srs 11/25/2021 20:33:28'!
depositLeg
	
	^ transferDeposit. ! !

!Transfer methodsFor: 'public' stamp: 'srs 11/23/2021 10:56:03'!
value

	^ transferValue.! !

!Transfer methodsFor: 'public' stamp: 'srs 11/25/2021 20:33:20'!
withdrawLeg
	
	^ transferWithdraw . ! !


!Transfer methodsFor: 'initialization' stamp: 'srs 11/25/2021 20:25:24'!
initializeWith: anAmountToTransfer with: aDepositLeg and: aWithdrawLeg.

	transferValue := anAmountToTransfer.
	transferDeposit := aDepositLeg.
	transferWithdraw := aWithdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'06 - ServiciosFinancieros'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'srs 11/23/2021 10:37:28'!
InvalidTranferError
	
	^'Transfering a negative amount of money betwen accounts is invalid.'! !


!Transfer class methodsFor: 'account transfering' stamp: 'srs 11/25/2021 20:52:05'!
from: anOriginAccount to: anDestinationAccount for: anAmountToTransfer
	
	| transfer depositLeg withdrawLeg|

	(anAmountToTransfer < 0) ifTrue: [self error: self InvalidTranferError].
	
	transfer := self new.
		
	depositLeg := TransferDeposit register: anAmountToTransfer on: anDestinationAccount through: transfer.
	withdrawLeg := TransferWithdraw register: anAmountToTransfer on: anOriginAccount through: transfer.
	
	transfer := transfer initializeWith: anAmountToTransfer with: depositLeg and: withdrawLeg .
	
	^transfer! !
