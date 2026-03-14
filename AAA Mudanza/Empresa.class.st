Class {
	#name : 'Empresa',
	#superclass : 'Object',
	#instVars : [
		'razonSocial',
		'direccion',
		'paginaWeb',
		'telefono',
		'servicios',
		'contratos',
		'cancelados',
		'clientes'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'class' }
Empresa class >> crear: unaRa direccion: unaDire pagina: unaPa telefono: unTe [

	| empresa |
	empresa := self new.

	empresa
		inicializar: unaRa
		conDireccion: unaDire
		conPagina: unaPa
		conTelefono: unTe.
	empresa setServicios.
	empresa setContratos.
	empresa setCancelados .
	empresa setClientes .

	^ empresa
]

{ #category : 'constructor' }
Empresa class >> crearEmpresaConServicios: unaColServicios contratos: unaColContratos contratosCancelados: cancelado direccion: unaDireccion pagina: unaPagina razon: unaRazon telefono: unTelefono [

	| empresa |
	empresa := self new.
	empresa
		inicializarEmpresaConServicios: unaColServicios contratos: unaColContratos contratosCancelados: cancelado direccion: unaDireccion pagina: unaPagina razon: unaRazon telefono: unTelefono.
	^ empresa
]

{ #category : 'constructor' }
Empresa class >> crearEmpresaConServicios: unaColServicios contratos: unaColContratos direccion: unaDirecion pagina: unaPagina razon: unaRazon telefono: unTelefono [

	| empresa |
	empresa := self new.
	empresa
		inicializarEmpresaConServicios: unaColServicios
		contratos: unaColContratos
		direccion: unaDirecion
		pagina: unaPagina
		razon: unaRazon
		telefono: unTelefono.
	^ empresa
]

{ #category : 'as yet unclassified' }
Empresa >> agregarCliente: unCli [
clientes add: unCli 
]

{ #category : 'as yet unclassified' }
Empresa >> agregarClientes: losClientes [
clientes := losClientes 
]

{ #category : 'initialization' }
Empresa >> agregarContrato: unCo [
contratos add: unCo  
]

{ #category : 'as yet unclassified' }
Empresa >> agregarContratoCancelado: unContrato [
cancelados add: unContrato .
contratos remove: unContrato .
]

{ #category : 'initialization' }
Empresa >> agregarContratos: unCo [
contratos := unCo 
]

{ #category : 'initialization' }
Empresa >> agregarServicio: unSe [

	servicios add: unSe
]

{ #category : 'initialization' }
Empresa >> agregarServicios: unSe [

	servicios := unSe
]

{ #category : 'as yet unclassified' }
Empresa >> buscarCliente: unNum [

	^ clientes detect: [ :cli | cli esIgual:  unNum ] ifNone: [ nil ]
]

{ #category : 'as yet unclassified' }
Empresa >> buscarContrato: unCon [

	^ contratos detect: [ :con | con esIgual: unCon ] ifNone: [ nil ]
]

{ #category : 'as yet unclassified' }
Empresa >> buscarServicios: elementoSeleccionado [

	| listado |
	elementoSeleccionado = 'guardaMueble' ifTrue: [
		listado := servicios select: [ :serv | serv esGuardamueble ] ].
	elementoSeleccionado = 'mudanzaLocal' ifTrue: [
		listado := servicios select: [ :serv | serv esLocal ] ].
	elementoSeleccionado = 'mudanzaNacional' ifTrue: [
		listado := servicios select: [ :serv | serv esNacional ] ].
	elementoSeleccionado = 'mudanzaInternacional' ifTrue: [
		listado := servicios select: [ :serv | serv esInternacional  ] ].

	^ listado
]

{ #category : 'as yet unclassified' }
Empresa >> cancelarContrato [
]

{ #category : 'as yet unclassified' }
Empresa >> cancelarContrato: unCod [
	"EN EL CASO DE QUE VALORPORCANCELAR SERA NULO, SIGINIFICARA QUE NO SE PUDO CANCELAR EL CONTRATO"

	| unCont rta valorPorCancelar |
	unCont := contratos
		          detect: [ :unContr | unContr esIgual: unCod ]
		          ifNone: nil.
	unCont
		ifNotNil: [ rta := unCont sePuedeCancelar ]
		ifNil: [ rta := false ].
	rta ifTrue: [ valorPorCancelar := unCont calcularMontoCancelacion ].
	rta ifTrue: [
		unCont cancelar.
		unCont agregarValor: valorPorCancelar ].
	^ rta
]

{ #category : 'as yet unclassified' }
Empresa >> devolverContratos [
^ contratos 
]

{ #category : 'as yet unclassified' }
Empresa >> devolverDatosContratos [

	| listado |
	listado := contratos collect: [ :con | con mostrarDatos ].

	^ listado
]

{ #category : 'as yet unclassified' }
Empresa >> devolverDatosLista: unNom [
| listado unServ|
unServ := servicios detect: [ :serv | serv esIgual: unNom  ] ifNone: [ nil ].
unServ ifNotNil: [ listado := unServ devolverListaDatos  ] ifNil: [ listado := 'no existe' ].
	^ listado
]

{ #category : 'as yet unclassified' }
Empresa >> devolverDatosServicios [

	| listado |
	listado := servicios collect: [ :serv | serv mostrarDatos ].
	
	^ listado
]

{ #category : 'as yet unclassified' }
Empresa >> devolverServicios [

	^ servicios 
]

{ #category : 'initialization' }
Empresa >> generarListadoContratosSemanal [
| listadoContratos rta|

listadoContratos := OrderedCollection new.
contratos do: [ :unContrato | rta := unContrato verificarFecha. (rta) ifTrue: [ listadoContratos add: unContrato mostrarDatos ] ] .

^listadoContratos
]

{ #category : 'initialization' }
Empresa >> inicializar: unaRa conDireccion: unaDire conPagina: unaPa conTelefono: unTe [
razonSocial := unaRa .
direccion := unaDire .
paginaWeb := unaPa .
telefono := unTe .
]

{ #category : 'as yet unclassified' }
Empresa >> renovarContrato: numContrato conLista: lista conFecha: unaNuevaFecha [

	| unContrato existe |
	unContrato := contratos detect: [ :contrato |
		              contrato esIgual: numContrato ] ifNone: [nil].
	unContrato
		ifNotNil: [
			existe := true.
			unContrato actualizarContrato: lista conFecha: unaNuevaFecha ]
		ifNil: [ existe := false ].

	^ existe
]

{ #category : 'as yet unclassified' }
Empresa >> reprogramarContrato: numContrato conFecha: nuFecha [

	| esPosible unContrato |
	unContrato := contratos detect: [ :contrato |
		              contrato esIgual: numContrato ].
	unContrato
		ifNotNil: [
			esPosible := unContrato verificarContrato.
			esPosible ifTrue: [ unContrato reprogramar: nuFecha ] ]
		ifNil: [ esPosible := false ].

	^ esPosible
]

{ #category : 'as yet unclassified' }
Empresa >> reprogramarUrgencia: numContrato conFecha: nuFecha [

	| esPosible unContrato monto |
	monto:=0.
	unContrato := contratos detect: [ :contrato |
		              contrato esIgual: numContrato ].
	unContrato
		ifNotNil: [
			esPosible := unContrato verifContratoUrgencia .
			esPosible ifTrue: [ monto := unContrato calcularMontoAPagar ] ]
		ifNil: [ esPosible := false ].

	^ monto
]

{ #category : 'initialization' }
Empresa >> setCancelados [
cancelados := OrderedCollection new.
]

{ #category : 'initialization' }
Empresa >> setClientes [
clientes := OrderedCollection new.
]

{ #category : 'initialization' }
Empresa >> setContratos [
contratos := OrderedCollection 
]

{ #category : 'initialization' }
Empresa >> setServicios [
servicios := OrderedCollection 
]
