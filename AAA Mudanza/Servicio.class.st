Class {
	#name : 'Servicio',
	#superclass : 'Object',
	#instVars : [
		'descripcion',
		'nombre',
		'valorBase'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'as yet unclassified' }
Servicio >> compararNombre:unNombre [
^nombre=unNombre.
]

{ #category : 'metodos' }
Servicio >> condicionesMulta: inicio [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
Servicio >> devolverListaDatos [
| listado textodesc textonombre textovalorBase|
listado := OrderedCollection new.
textodesc := 'descripcion del servicio: ' asString , descripcion asString.
textonombre := 'nombre:' asString , nombre asString.
textovalorBase := 'valorBase: ' asString , valorBase asString.
listado add: textodesc .
listado add: textonombre .
listado add: textovalorBase .
^ listado
]

{ #category : 'as yet unclassified' }
Servicio >> esGuardamueble [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Servicio >> esIgual: unNom [
^ nombre = unNom 
]

{ #category : 'as yet unclassified' }
Servicio >> esInternacional [ 
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Servicio >> esLocal [

	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Servicio >> esMudanza [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Servicio >> esNacional [ 
^ self subclassResponsibility 
]

{ #category : 'observadores' }
Servicio >> getNombre [ 
^nombre 
]

{ #category : 'initialization' }
Servicio >> inicializar: unaDesc conNombre: unNom conValor: unVa [
descripcion := unaDesc .
nombre := unNom .
valorBase := unVa .
]

{ #category : 'initialization' }
Servicio >> mostrarDatos [

	^ '| descripcion del servicio: ' asString , descripcion asString
	  , ', nombre:' asString , nombre asString
	  , ', valorBase: ' asString , valorBase asString
]

{ #category : 'as yet unclassified' }
Servicio >> obtenerTamaño [
]

{ #category : 'as yet unclassified' }
Servicio >> obtenerValorBase [
^ valorBase 
]

{ #category : 'as yet unclassified' }
Servicio >> vistazoDatos [

	^ nombre asString , ', ' asString , valorBase asString
]
