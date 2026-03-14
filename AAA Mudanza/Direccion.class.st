Class {
	#name : 'Direccion',
	#superclass : 'Object',
	#instVars : [
		'calle',
		'numero',
		'piso',
		'dpto',
		'barrio'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'class' }
Direccion class >> crear: unaDire numero: unNum piso: unPi dpto: unDepto barrio: unBa [
| direccion |

direccion := self new.
direccion inicializar: unaDire conNumero: unNum conPiso: unPi conDpto: unDepto conBarrio: unBa .
^direccion 
]

{ #category : 'constructor' }
Direccion class >> crearDireccionConBarrio: unBarrio calle: unaCalle dpto: unDepartamento nro: unNumero piso: unPiso [

	| direccion |
	direccion := self new.
	direccion
		inicializarDireccionConBarrio: unBarrio
		calle: unaCalle
		dpto: unDepartamento
		nro: unNumero
		piso: unPiso.
	^ direccion
]

{ #category : 'initialization' }
Direccion >> inicializar: unaCalle conNumero: unNum conPiso: unPi conDpto: unDpto conBarrio: unBa [
calle := unaCalle .
numero := unNum .
piso := unPi .
dpto := unDpto .
barrio := unBa .
]

{ #category : 'as yet unclassified' }
Direccion >> mostrarDireccion [

	^ calle asString , ', ' asString , numero asString , ', ' asString
	  , piso asString , ', ' asString, dpto asString , ', ' asString, barrio asString 
]
