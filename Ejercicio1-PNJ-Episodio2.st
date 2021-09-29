!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frasesConDesconocidos frasesConPrometedores interaccionesDeCarolina'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'srs 9/29/2021 01:17:32'!
hacerPrometedorA: UnPersonaje
	self olvidarInteraccionesCon: UnPersonaje. 
	TreborElGuardiaDeSkyrim olvidarInteraccionesCon: UnPersonaje.
	Riverwood hacerPrometedorA: UnPersonaje.
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LG 9/29/2021 10:02:20'!
obtenerCantidadDeInteraccionesCon: UnPersonaje
	^ interaccionesDeCarolina at: UnPersonaje.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'LG 9/29/2021 10:03:00'!
recordarInteraccionCon: unPersonaje
	| interaccionesActuales | 
	interaccionesActuales := self obtenerCantidadDeInteraccionesCon: unPersonaje.
	interaccionesActuales := interaccionesActuales + 1.
	interaccionesDeCarolina at: unPersonaje put: interaccionesActuales .
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'srs 9/29/2021 01:19:52'!
responderSegunCantidadDeInteraccionesCon: unPersonaje
	|cantidadDeInteracciones opinionDeRiverwood |
	
	cantidadDeInteracciones := interaccionesDeCarolina at: unPersonaje.

	opinionDeRiverwood := Riverwood obtenerOpinionDe: unPersonaje.
	
	opinionDeRiverwood = 'prometedor' 
	ifTrue:	[
		^ frasesConPrometedores at: (cantidadDeInteracciones min: frasesConPrometedores size).		
		]
	ifFalse:[
		cantidadDeInteracciones = frasesConDesconocidos size 
		ifTrue: [self hacerPrometedorA: unPersonaje].
			^ frasesConDesconocidos at: (cantidadDeInteracciones min: frasesConDesconocidos size).
		].
	! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'LG 9/29/2021 10:04:28'!
establecerInteraccionesInicialesDeHamiltonYTirion
	interaccionesDeCarolina := Dictionary new.
	interaccionesDeCarolina at: 'Hamilton' put: 0.
	interaccionesDeCarolina at: 'Tirion' put: 0.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'LG 9/28/2021 15:38:49'!
interactuarCon: unPersonaje
	self recordarInteraccionCon: unPersonaje.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonaje.! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'LG 9/28/2021 19:07:18'!
olvidarInteraccionesCon: unPersonaje
	interaccionesDeCarolina at: unPersonaje put: 0.! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'srs 9/29/2021 10:14:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesConDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesConPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	interaccionesDeCarolina := ((Dictionary new) add: ('Hamilton'->1); add: ('Tirion'->0); yourself).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'Santiago Ruiz 9/28/2021 09:35:00'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'Santiago Ruiz 9/28/2021 09:27:43'!
hamilton
	^'Hamilton'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'Santiago Ruiz 9/28/2021 09:27:57'!
tirion
	^'Tirion'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'srs 9/29/2021 00:34:28'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^Riverwood esPrometedor: unPersonaje.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LG 9/28/2021 18:29:19'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeRiverwood olvidarInteraccionesCon: self hamilton.
	CarolinaLaCuranderaDeRiverwood olvidarInteraccionesCon: self tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LG 9/28/2021 18:35:00'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood establecerOpinionesInicialesDeHamiltonYTirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'LG 9/28/2021 15:07:52'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood hacerPrometedorA: self hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'Santiago Ruiz 9/28/2021 08:54:14'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarInteraccionesCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'Santiago Ruiz 9/27/2021 21:32:57'!
hamilton
	^'Hamilton'! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'Santiago Ruiz 9/27/2021 21:33:22'!
tirion
	^'Tirion'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LG 9/29/2021 10:04:28'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim establecerInteraccionesInicialesDeHamiltonYTirion .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LG 9/28/2021 19:01:20'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood establecerOpinionesInicialesDeHamiltonYTirion .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'LG 9/28/2021 15:06:29'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood hacerPrometedorA: self hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: 'opinionesSobrePersonaje'!

!Riverwood class methodsFor: 'opiniones' stamp: 'srs 9/29/2021 01:20:38'!
esPrometedor: unPersonaje
	^ (opinionesSobrePersonaje at: unPersonaje) = 'prometedor'.! !

!Riverwood class methodsFor: 'opiniones' stamp: 'LG 9/28/2021 18:34:52'!
establecerOpinionesInicialesDeHamiltonYTirion
	opinionesSobrePersonaje at: 'Hamilton' put: 'desconocido'.
	opinionesSobrePersonaje at: 'Tirion' put: 'desconocido'.! !

!Riverwood class methodsFor: 'opiniones' stamp: 'LG 9/28/2021 15:50:37'!
hacerPrometedorA: unPersonaje
	opinionesSobrePersonaje at: unPersonaje put: 'prometedor'.! !

!Riverwood class methodsFor: 'opiniones' stamp: 'LG 9/28/2021 15:50:45'!
obtenerOpinionDe: unPersonaje
	^opinionesSobrePersonaje at: unPersonaje.! !


!Riverwood class methodsFor: 'as yet unclassified' stamp: 'srs 9/29/2021 10:14:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesSobrePersonaje := ((Dictionary new) add: ('Hamilton'->'prometedor'); add: ('Tirion'->'desconocido'); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesConDesconocidos frasesConPrometedores interaccionesDeTrebor'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LG 9/29/2021 10:04:28'!
establecerInteraccionesInicialesDeHamiltonYTirion
	interaccionesDeTrebor := Dictionary new.
	interaccionesDeTrebor at: 'Hamilton' put: 0.
	interaccionesDeTrebor at: 'Tirion' put: 0.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LG 9/29/2021 10:00:37'!
interactuarCon: UnPersonaje
	self recordarInteraccionCon: UnPersonaje.
	^ self responderSegunCantidadDeInteraccionesCon: UnPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'LG 9/29/2021 10:00:29'!
olvidarInteraccionesCon: UnPersonaje
	interaccionesDeTrebor at: UnPersonaje put: 0.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'LG 9/29/2021 10:02:20'!
obtenerCantidadDeInteraccionesCon: UnPersonaje
	^ interaccionesDeTrebor at: UnPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'LG 9/29/2021 10:02:20'!
recordarInteraccionCon: unPersonaje
	| interaccionesActuales | 
	interaccionesActuales := self obtenerCantidadDeInteraccionesCon: unPersonaje.
	interaccionesActuales := (interaccionesActuales  + 1).
	interaccionesDeTrebor at: unPersonaje put: interaccionesActuales.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'LG 9/29/2021 10:00:45'!
responderSegunCantidadDeInteraccionesCon: UnPersonaje
	|cantidadDeInteracciones opinionDelPersonaje|
	cantidadDeInteracciones := interaccionesDeTrebor at: UnPersonaje.
	opinionDelPersonaje := Riverwood obtenerOpinionDe: UnPersonaje.
	
	opinionDelPersonaje = 'desconocido'
	ifTrue:  [
		^ frasesConDesconocidos at: (cantidadDeInteracciones min: frasesConDesconocidos size)
		]
	ifFalse: [
		^ frasesConPrometedores at: (cantidadDeInteracciones min: frasesConPrometedores size)
		]! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'srs 9/29/2021 10:14:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesConDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesConPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	interaccionesDeTrebor := ((Dictionary new) add: ('Hamilton'->2); add: ('Tirion'->0); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
Riverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!