Class {
	#name : 'Mudanza',
	#superclass : 'Servicio',
	#instVars : [
		'valorAdicional',
		'distanciaMax'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'metodos' }
Mudanza >> adicionalReprogramacion [
|costoExtra|
costoExtra:=self costoFinal*1,2.
^costoExtra.
]

{ #category : 'as yet unclassified' }
Mudanza >> calcularMonto [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Mudanza >> calcularMontoAPagar [
| valor |
valor := valorBase * (0.2).
^ valor
]

{ #category : 'metodos' }
Mudanza >> condicionesMulta:inicio [
	self subclassResponsibility.
]

{ #category : 'metodos' }
Mudanza >> costoFinal [
|precioFinal|
precioFinal:=costo.
colExtras do:[:unExtra|precioFinal:=precioFinal+unExtra].
^precioFinal.

]

{ #category : 'as yet unclassified' }
Mudanza >> devolverListaDatos [
| listado textoValor textoDistancia |
listado := super devolverListaDatos .
textoValor := 'valor adicional:' asString , valorAdicional asString.
textoDistancia := 'distancia maxima: ' asString , distanciaMax asString.
listado add: textoValor .
listado add: textoDistancia .
^ listado
]

{ #category : 'as yet unclassified' }
Mudanza >> esGuardamueble [
^false
]

{ #category : 'as yet unclassified' }
Mudanza >> esInternacional [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Mudanza >> esLocal [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Mudanza >> esMudanza [
^true
]

{ #category : 'as yet unclassified' }
Mudanza >> esNacional [
^ self subclassResponsibility 
]

{ #category : 'observadores' }
Mudanza >> getNombre [ 
^ super getNombre
]

{ #category : 'intialization' }
Mudanza >> inicializarMudanzaConNombre: unNombre costo: unCosto descripcion: unaDescripcion capacidad: unaCapacidad colExtras: unaCol [
	self inicializarServicioConNombre: unNombre	 costo: unCosto descripcion: unaDescripcion.
	capacidad := unaCapacidad.
	colExtras := unaCol.
	reprogramada := false
]

{ #category : 'initialization' }
Mudanza >> iniciar: desc conNombre: unNo conValorBase: unVa conValorAdicional: unValor yDistanciaMax: dista [
self inicializar: desc conNombre: unNo conValor: unVa.
valorAdicional := unValor .
distanciaMax := dista .
]

{ #category : 'initialization' }
Mudanza >> mostrarDatos [

	^ super mostrarDatos , ', valor adicional: ' asString
	  , valorAdicional asString , ', distancia maxima: ' asString
	  , distanciaMax asString
]

{ #category : 'as yet unclassified' }
Mudanza >> vefCancelacion: fechaAcordada [
^ self subclassResponsibility 
]

{ #category : 'metodos' }
Mudanza >> verificarReprogramacion: inicio [
	^reprogramada not.
]

{ #category : 'initialization' }
Mudanza >> verificarTipoTransporte [
^ self subclassResponsibility 
]
