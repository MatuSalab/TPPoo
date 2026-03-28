Class {
	#name : 'ContratoGuardaMuebles',
	#superclass : 'Contrato',
	#instVars : [
		'fechaInicio',
		'duracion',
		'servGuardamueble'
	],
	#classVars : [
		'fechasFirmas',
		'fechasRenovaciones'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'class' }
ContratoGuardaMuebles class >> crear:fecha conDuracion: unaDur conLista: unaLista conServicio: unServ conCliente: unCliente [
| guardaMueble fechaHoy |

guardaMueble := self new.
guardaMueble iniciar: unaLista conCliente: unCliente conFecha: fecha conDuracion: unaDur conServ: unServ .
fechasFirmas := OrderedCollection new.
fechasRenovaciones := OrderedCollection new.
fechaHoy := Date today.
fechasFirmas add: fechaHoy.
fechasRenovaciones add: fecha .

^guardaMueble 
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles class >> guardarFecha: unaFecha [
| fechaHoy |
fechaHoy := Date today .
fechasFirmas add: fechaHoy .
fechasRenovaciones add: unaFecha .
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles class >> mostrarListaFirmas [
^ fechasFirmas 
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles class >> mostrarListaRenovaciones [
^ fechasRenovaciones 
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> actualizarContrato: lista conFecha: unaFecha [
	
fechaFirma := Date today .
fechaInicio := unaFecha .
listaElementos addAll: lista.
self class guardarFecha: unaFecha 
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> calcularMontoCancelacion [

	| monto fechaHoy |
	fechaHoy := Date today.
	monto := 0.

	monto := servGuardamueble obtenerValorBase * (0.1).
		          
		         
	^ monto
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> getFechaAcordada [
^ fechaInicio.
]

{ #category : 'initialization' }
ContratoGuardaMuebles >> getNombreServicio [
^ servGuardamueble getNombre .
]

{ #category : 'initialization' }
ContratoGuardaMuebles >> iniciar: unaLista conCliente: unCliente conFecha: unafecha conDuracion: unaDur conServ: unServ [

	self iniciar: unaLista conCliente: unCliente.
	duracion := unaDur.
	servGuardamueble := unServ.
	fechaInicio := unafecha.
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> mostrarDatoContrato [

	^ super mostrarDatoContrato , self class mostrarListaRenovaciones asString , ',' asString
	  , duracion asString , ', ' asString , servGuardamueble asString
]

{ #category : 'initialization' }
ContratoGuardaMuebles >> mostrarDatos [
	| nombreServicio |

	nombreServicio := servGuardamueble getNombre.

	^ super mostrarDatos , String cr ,
		'Fecha de inicio: ', self getFechaAcordada asString , String cr ,
		'Fecha de firma: ', self obtenerFechaFirma asString , String cr ,
		'Nombre de servicio: ', nombreServicio asString , String cr ,
		'Tipo: Guardamueble'
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> obtenerFechaFirma [
^fechaFirma 
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> obtenerFechaIncio [

^fechaInicio 


]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> obtenerServicio [

	^ servGuardamueble 
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> reprogramar: nuFecha [
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> revisarContrato [

	| fechaHoy calc |
	fechaHoy := Date today.
	calc := fechaFirma subtractDate: fechaHoy.
	^ calc < 10
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> sePuedeCancelar [

	| rta fechaHoy calculoFecha |
	fechaHoy := Date today.
	calculoFecha := fechaInicio subtractDate: fechaHoy .
	rta := calculoFecha > 3.
	^ rta
]

{ #category : 'as yet unclassified' }
ContratoGuardaMuebles >> verificarContrato [ 
]
