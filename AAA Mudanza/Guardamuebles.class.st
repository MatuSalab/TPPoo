Class {
	#name : 'Guardamuebles',
	#superclass : 'Servicio',
	#instVars : [
		'tamaño',
		'aislamiento',
		'guardaLlave'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'instance creation' }
Guardamuebles class >> crearGuardamueblesConNombre: unNombre costo: unCosto descripcion: unaDescripcion aislamiento: unA guardaLlave: gl tamaño: unTamanio [

	| servicio |
	servicio := self new.
	servicio
		inicializarGuardamueblesConNombre: unNombre
		costo: unCosto
		descripcion: unaDescripcion
		aislamiento: unA
		guardaLlave: gl
		tamaño: unTamanio.
	^ servicio
]

{ #category : 'class' }
Guardamuebles class >> descripcion: unaDesc nombre: unNo valorBase: unVa distanciaMax: unaDi tamaño: unTa aislamiento: unA guardaLLave: unG [

| guardamuebles |

guardamuebles := self new.
guardamuebles inicializar: unaDesc conNombre: unNo conValor: unVa conTamaño: unTa conAislamiento: unA  guardarLlave: unG  .

^guardamuebles 
]

{ #category : 'class' }
Guardamuebles class >> descripcion: unaDesc nombre: unNo valorBase: unVa  tamaño: unTa aislamiento: unA guardaLLave: unG [

| guardamuebles |

guardamuebles := self new.
guardamuebles inicializar: unaDesc conNombre: unNo conValor: unVa conTamaño: unTa conAislamiento: unA  guardarLlave: unG  .

^guardamuebles 
]

{ #category : 'as yet unclassified' }
Guardamuebles >> devolverListaDatos [
| listado textotamaño textoaislamiento textoguardaLlave|
listado := super devolverListaDatos .
textotamaño := 'tamaño: ' asString , descripcion asString.
textoaislamiento := 'aislamiento:' asString , aislamiento asString.
textoguardaLlave := 'guarda llave: ' asString , guardaLlave asString.
listado add: textotamaño .
listado add: textoaislamiento .
listado add: textoguardaLlave .
^ listado
]

{ #category : 'as yet unclassified' }
Guardamuebles >> esGuardamueble [
^true
]

{ #category : 'as yet unclassified' }
Guardamuebles >> esInternacional [

	^ false
]

{ #category : 'as yet unclassified' }
Guardamuebles >> esLocal [

	^ false
]

{ #category : 'as yet unclassified' }
Guardamuebles >> esMudanza [
^false
]

{ #category : 'as yet unclassified' }
Guardamuebles >> esNacional [

	^ false
]

{ #category : 'observadores' }
Guardamuebles >> getNombre [ 
^ super getNombre 
]

{ #category : 'initialization' }
Guardamuebles >> inicializar: unaDesc conNombre: unNo conValor: unVa conTamaño: unTa conAislamiento: unA  guardarLlave: unG [
self inicializar: unaDesc conNombre: unNo conValor: unVa . 
tamaño := unTa.
aislamiento := unA .
guardaLlave := unG .
]

{ #category : 'initialization' }
Guardamuebles >> inicializarGuardamueblesConNombre: unNombre costo: unCosto descripcion: unaDescripcion aislamiento: unA guardaLlave: gl tamaño: tamanio [

	self
		inicializarServicioConNombre: unNombre
		costo: unCosto
		descripcion: unaDescripcion.
	aislamiento := unA.
	guardaLlave := gl.
	tamaño := tamanio
]

{ #category : 'initialization' }
Guardamuebles >> mostrarDatos [

	^ super mostrarDatos , ', tamaño: ' asString
	  , tamaño asString , ', con aislamiento: ' asString
	  , aislamiento asString , ', guarda la llave: ' asString
	  , guardaLlave asString , ', tipo: guardaMueble |' asString
]

{ #category : 'as yet unclassified' }
Guardamuebles >> obtenerTamaño [ 
^ tamaño 
]
