Class {
	#name : 'ContratoMudanza',
	#superclass : 'Contrato',
	#instVars : [
		'dirOrigen',
		'dirDestino',
		'fechaAcordada',
		'horaAcordada',
		'servMudanza',
		'reprogramado'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'class' }
ContratoMudanza class >> crear: unaDire conDestino: elDe conFecha: unaFe conHora: unaHora conCliente: unCli conServicio: unServ conLista: unaLis [

| mudanza |

mudanza := self new.
mudanza iniciar: unaLis conCliente: unCli conFecha: unaFe conOrigen: unaDire conDestino: elDe conHora: unaHora conServicio: unServ.

^mudanza 
]

{ #category : 'constructor' }
ContratoMudanza class >> crearContratoMudanzaConServicio: unServicio inicio: unInicio colElems: unColElementos cliente: unCliente destino: unDestino origen: unOrigen [

	| contrato |
	contrato := self new.
	contrato
		inicializarContratoMudanzaConServicio: unServicio
		inicio: unInicio
		colElems: unColElementos
		cliente: unCliente
		destino: unDestino
		origen: unOrigen.
	^ contrato
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> actualizarContrato: lista conFecha:unaFecha [
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> actualizarReprogramacion [

reprogramado := true.
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> calcularMontoAPagar [ 
 ^servMudanza calcularMontoAPagar.
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> calcularMontoCancelacion [
^ servMudanza calcularMonto 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> cambiarDireccionDestino: unaDire [

    dirDestino  := unaDire
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> cambiarDireccionOrigen: unaDire [

    dirOrigen := unaDire
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> getFecha [
^ fechaAcordada 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> getFechaAcordada [ 
^ fechaAcordada 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> getHora [
^ horaAcordada.
]

{ #category : 'initialization' }
ContratoMudanza >> getNombreServicio [
^ servMudanza getNombre 
]

{ #category : 'initialization' }
ContratoMudanza >> iniciar: unaLis conCliente: unCli conFecha: unaFe conOrigen: unaDire conDestino: elDe conHora: unaHora conServicio: unServ [

	self iniciar: unaLis conCliente: unCli.
	dirOrigen := unaDire.
	dirDestino := elDe.
	fechaAcordada :=unaFe.
	horaAcordada := unaHora.
	servMudanza := unServ.
	reprogramado := false.
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> mostrarDatoContrato [

	^ super mostrarDatoContrato , ',' asString , dirOrigen asString
	  , ',' asString , dirDestino asString , ', ' asString
	  , fechaAcordada asString , ',' asString , horaAcordada asString
	  , ',' asString , servMudanza asString
]

{ #category : 'initialization' }
ContratoMudanza >> mostrarDatos [
	| nombreServicio tipoMudanza datos |
	
	nombreServicio := servMudanza getNombre.
	tipoMudanza := 'Desconocido'.

	servMudanza esLocal ifTrue: [ tipoMudanza := 'Mudanza Local' ].
	servMudanza esNacional ifTrue: [ tipoMudanza := 'Mudanza Nacional' ].
	servMudanza esInternacional ifTrue: [ tipoMudanza := 'Mudanza Internacional' ].

	datos := super mostrarDatos , String cr ,
		'Fecha de inicio: ', self getFecha asString , String cr ,
		'Fecha de firma: ', self obtenerFechaFirma asString , String cr ,
		'Nombre de servicio: ', nombreServicio asString , String cr ,
		'Tipo de mudanza: ', tipoMudanza.

	^ datos
]

{ #category : 'initialization' }
ContratoMudanza >> obtenerFecha [
^ fechaAcordada 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> obtenerFechaFirma [
^fechaFirma 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> obtenerFechaIncio [

^fechaAcordada 


]

{ #category : 'as yet unclassified' }
ContratoMudanza >> obtenerServicio [

	^ servMudanza 
	
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> reprogramar: nuFecha [
fechaAcordada := nuFecha .
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> reprogramarUrgencia: nuFecha [
|valorAPagar|
self reprogramar: nuFecha .
valorAPagar := servMudanza calcularMontoAPagar.
^ valorAPagar
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> revisarCondiciones: tipo [
| debePagar |
(tipo = 'local') ifTrue: [ debePagar := self revisarLocal ].
(tipo = 'nacional') ifTrue: [debePagar := self revisarNacional ].
(tipo = 'internacional') ifTrue: [ debePagar := self revisarInternacional ].

^ debePagar 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> revisarContrato [  
| tipo debePagar |
tipo := self tipoServicio .
debePagar := self revisarCondiciones: tipo.
^ debePagar 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> revisarInternacional [
^ true
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> revisarLocal [
| fechaHoy calc |
fechaHoy := Date today.
calc := fechaAcordada subtractDate: fechaHoy .
^ (calc > 1)
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> revisarNacional [
| fechaHoy calc |
fechaHoy := Date today.
calc := fechaAcordada subtractDate: fechaHoy .
^ (calc > 7)
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> sePuedeCancelar [ 
|rta |
rta:= servMudanza  vefCancelacion: fechaAcordada .
^ rta.
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> tipoServicio [
| tipo |
(servMudanza esLocal) ifTrue: [ tipo := 'local' ].
(servMudanza esNacional) ifTrue: [ tipo := 'nacional' ].
(servMudanza esInternacional) ifTrue: [ tipo := 'internacional' ].

^tipo 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> verifContratoUrgencia [

	| rta fechaHoy  |
	fechaHoy := Date today.
	rta := reprogramado
		               ifTrue: [ false ]
		               ifFalse: [ (fechaAcordada subtractDate: fechaHoy) >= 0 ].
	^ rta
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> verificarCondicion: tipo [
| esPosible |
(tipo = 'local') ifTrue: [ esPosible := self verificarLocal ].
(tipo = 'nacional') ifTrue: [ esPosible := self verificarNacional ].
(tipo = 'internacional') ifTrue: [ esPosible := self verificarInternacional ].

^ esPosible 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> verificarContrato [
| tipo rta |
(reprogramado) ifTrue: [ rta := false] ifFalse: [ tipo := self tipoServicio.
rta := self verificarCondicion: tipo].
^ rta
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> verificarInternacional [
^ servMudanza verificarTipoTransporte 
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> verificarLocal [
| fechaHoy calc |
fechaHoy := Date today.
calc := fechaAcordada subtractDate: fechaHoy .
^ (calc > 2)
]

{ #category : 'as yet unclassified' }
ContratoMudanza >> verificarNacional [
| fechaHoy calc |
fechaHoy := Date today.
calc := fechaAcordada subtractDate: fechaHoy .
^ (calc > 5)
]
