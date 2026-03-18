Class {
	#name : 'Contrato',
	#superclass : 'Object',
	#instVars : [
		'activo',
		'nroContrato',
		'fechaFirma',
		'listaElementos',
		'cliente',
		'valorPorCancelar'
	],
	#classVars : [
		'Codigo'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'as yet unclassified' }
Contrato class >> incrementarNum [
Codigo := Codigo + 1.
]

{ #category : 'as yet unclassified' }
Contrato class >> iniciarID [

	Codigo := 0.
]

{ #category : 'as yet unclassified' }
Contrato class >> obtenerCodigo [

	^ Codigo asString 
]

{ #category : 'as yet unclassified' }
Contrato >> actualizarContrato: lista conFecha:unaFecha [
^self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> agregarValor: unValor [
valorPorCancelar := unValor 
]

{ #category : 'as yet unclassified' }
Contrato >> calcularMontoCancelacion [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> cancelar [
activo := false
]

{ #category : 'as yet unclassified' }
Contrato >> esIgual: unCodigo [

	^( nroContrato = unCodigo)
]

{ #category : 'as yet unclassified' }
Contrato >> getApellidoCliente [
^ cliente getApellido
]

{ #category : 'as yet unclassified' }
Contrato >> getDniCliente [
^ cliente getDni.
]

{ #category : 'as yet unclassified' }
Contrato >> getFechaAcordada [
^ self subclassResponsibility.
]

{ #category : 'initialization' }
Contrato >> getNombreCliente [
^ cliente getNombre .
]

{ #category : 'initialization' }
Contrato >> getNombreServicio [

]

{ #category : 'as yet unclassified' }
Contrato >> getNroContrato [
^ nroContrato.
]

{ #category : 'initialization' }
Contrato >> getTelefonoCliente [
^ cliente getTelefono 
]

{ #category : 'initialization' }
Contrato >> iniciar: unaLista conCliente: unCliente [

	listaElementos := OrderedCollection new.
	listaElementos addAll: unaLista.
	cliente := unCliente.
	fechaFirma := Date today .
	self class incrementarNum.
	nroContrato := self class obtenerCodigo.
	activo := true
]

{ #category : 'as yet unclassified' }
Contrato >> mostrarDatoContrato [
 ^ nroContrato asString, ',' asString , fechaFirma asString , ',' asString , listaElementos asString , ',' asString , cliente asString , ',' asString 
]

{ #category : 'initialization' }
Contrato >> mostrarDatos [
	| nombreCliente telefono |

	nombreCliente := cliente getNombre.
	telefono := cliente getTelefono.

	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'Numero de contrato: '; nextPutAll: nroContrato asString; cr;
			nextPutAll: 'Nombre del cliente: '; nextPutAll: nombreCliente asString; cr;
			nextPutAll: 'Telefono: '; nextPutAll: telefono asString
	]
]

{ #category : 'initialization' }
Contrato >> obtenerFecha [

	^ fechaFirma
]

{ #category : 'as yet unclassified' }
Contrato >> obtenerFechaFirma [
^fechaFirma 
]

{ #category : 'as yet unclassified' }
Contrato >> obtenerLista [
^ listaElementos 
]

{ #category : 'as yet unclassified' }
Contrato >> obtenerServicio [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> reprogramar: nuFecha [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> revisarContrato [ 
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> sePuedeCancelar [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> verifContratoUrgencia [
^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
Contrato >> verificarContrato [ 
^ self subclassResponsibility 
]

{ #category : 'initialization' }
Contrato >> verificarFecha [

	| fechaHoy calculoFecha rta |
	fechaHoy := Date today.
	calculoFecha := fechaFirma  subtractDate: fechaHoy.

	rta := calculoFecha > -7.

	^ rta
]
