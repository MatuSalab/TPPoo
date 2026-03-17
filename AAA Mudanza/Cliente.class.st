Class {
	#name : 'Cliente',
	#superclass : 'Object',
	#instVars : [
		'DNI',
		'nombre',
		'apellido',
		'telefono',
		'direccion'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'constructor' }
Cliente class >> crearClienteConNombre: unNombre apellido: unApellido direccion: unaDireccion telefono: unTelefono [

	| cliente |
	cliente := self new.
	cliente
		inicializarClienteConNombre: unNombre
		apellido: unApellido
		direccion: unaDireccion
		telefono: unTelefono.
	^ cliente
]

{ #category : 'class' }
Cliente class >> iniciar: unDni nombre: elNombre apellido: elApellido telefono: elTelefono direccion: unaDire [

	| cliente |
	cliente := self new.
	cliente
		iniciar: unDni conNombre:elNombre
		conApellido: elApellido
		conTelefono: elTelefono
		conDireccion: unaDire.
	^ cliente
]

{ #category : 'class' }
Cliente class >> nombre: elNombre apellido: elApellido telefono: elTelefono direccion: unaDire [
|cliente|

cliente  := self new.
cliente inicializar: elNombre conApellido: elApellido conTelefono: elTelefono conDireccion: unaDire .
^cliente.
]

{ #category : 'comparing' }
Cliente >> equals: unNum [

	^ DNI = unNum
]

{ #category : 'as yet unclassified' }
Cliente >> esIgual: unNum [
^ DNI = unNum 
]

{ #category : 'observadores' }
Cliente >> getApellido [
^apellido 
]

{ #category : 'as yet unclassified' }
Cliente >> getDni [
^ DNI.
]

{ #category : 'observadores' }
Cliente >> getNombre [ 
^nombre 
]

{ #category : 'observadores' }
Cliente >> getTelefono [
^telefono 
]

{ #category : 'initialization' }
Cliente >> inicializar: unNombre conApellido: unApellido conTelefono: unTel conDireccion: unaDire [
nombre := unNombre .
apellido := unApellido .
telefono := unTel .
direccion  := unaDire .
]

{ #category : 'inicializar' }
Cliente >> inicializarClienteConNombre: unNombre apellido: unApellido direccion: unaDireccion telefono: unTelefono [

	nombre := unNombre.
	apellido := unApellido.
	direccion := unaDireccion.
	telefono := unTelefono
]

{ #category : 'as yet unclassified' }
Cliente >> iniciar: unDni conNombre: elNombre conApellido: elApellido conTelefono: elTelefono conDireccion: unaDire [

	DNI := unDni .
	nombre := elNombre.
	apellido := elApellido.
	telefono := elTelefono.
	direccion := unaDire
]

{ #category : 'as yet unclassified' }
Cliente >> mostrarCliente [

	^ DNI asString , ', ' asString , nombre asString , ', ' asString
	  , apellido asString , ', ' asString , telefono asString
	  , ', ' asString , direccion mostrarDireccion
]
