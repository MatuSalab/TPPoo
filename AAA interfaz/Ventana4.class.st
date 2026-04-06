Class {
	#name : 'Ventana4',
	#superclass : 'Ventana',
	#instVars : [
		'fechaInicio',
		'nuevaLista',
		'tamaño'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana4 >> actualizarTamaño [
tamaño := tamaño -1
	
]

{ #category : 'as yet unclassified' }
Ventana4 >> agregarElemento: unElem [

	nuevaLista add: unElem asString
]

{ #category : 'as yet unclassified' }
Ventana4 >> buscarContrato: miEmpresa [

	| botonConfirmacion texto unServ bloqueNumero unContrato botonBuscar textoContrato tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	texto := StringMorph contents: ''.
	textoContrato := StringMorph contents: ''.
	ventanaPrincipal := VentanaPrincipal new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Renovar Contrato'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (420 @ 55).
	
	"-------------------------------------Num contrato-------------------------------------"
	
	bloqueNumero := RubTextFieldMorph new.
	bloqueNumero ghostText: 'ingrese numero del contrato'.
	bloqueNumero position: titulo position + (-10 @ 200).
	bloqueNumero extent: 300 @ 100.
	
	"-------------------------------------Boton Buscar-------------------------------------"

	botonBuscar := BotonAccion2 new.
	botonBuscar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/buscar.png'.
	botonBuscar position: bloqueNumero position + (320@0).
	
	texto color: Color white.
	textoContrato color: Color white.
	textoContrato position: botonBuscar position + (-190 @ 80).
	
	botonBuscar mouseAction: [
		unContrato := miEmpresa buscarContrato: bloqueNumero text asString.
		textoContrato contents: 'datos del contrato:'.
		unContrato
			ifNotNil: [
				unServ := unContrato obtenerServicio.
				unServ esGuardamueble
					ifTrue: [
						texto contents: unContrato mostrarDatos.
						texto position: bloqueNumero position + (-200 @ 130) ]
					ifFalse: [
						texto contents: 'el contrato no es de guardaMueble'.
						texto position: bloqueNumero position + (-200 @ 130) ] ]
			ifNil: [
				texto contents: 'el numero del contrato no existe'.
				texto position: bloqueNumero position + (-200 @ 130) ] ].
	
	"-------------------------------------Boton Fecha-------------------------------------"
	
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570 @ 450).
	
	botonConfirmacion mouseAction: [
		unContrato := miEmpresa buscarContrato: bloqueNumero text asString.
		unContrato
			ifNotNil: [
				unServ := unContrato obtenerServicio.
				unServ esGuardamueble
					ifTrue: [
						self cerrar.
						self ingresarFechaYElementos: unContrato para: miEmpresa ]
					ifFalse: [  ] ]
			ifNil: [  ] ].

	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].

	self addMorph: botonConfirmacion.
	self addMorph: bloqueNumero.
	self addMorph: botonBuscar.
	self addMorph: texto.
	self addMorph: textoContrato.

	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana4 >> ingresarFechaYElementos: unContrato para: miEmpresa [

	| botonConfirmacion texto unServ botonLista lista textoElementos textoTamaño elemento textoListado textoFecha fechaSeleccionada fechaInicioActual calculoFecha tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	nuevaLista := unContrato obtenerLista.
	unServ := unContrato obtenerServicio.
	tamaño := unServ obtenerTamaño - nuevaLista size.
	tamaño := tamaño asInteger.
	fechaInicioActual := unContrato getFechaAcordada.
	texto := StringMorph new.
	elemento := RubTextFieldMorph new.
	fechaInicio := CalendarMorph new.
	lista := PluggableListMorph
		         on: nuevaLista
		         list: #yourself
		         selected: nil
		         changeSelected: nil.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Renovar Contrato'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (450 @ 55).
	
	"-------------------------------------Fecha-------------------------------------"

	textoFecha := StringMorph contents: 'Ingrese la nueva fecha'.
	textoFecha color: Color white.
	textoFecha position: origen + (280 @ 200).
	fechaInicio date: Date today.
	fechaInicio position: textoFecha position + (-30 @ 50).
	
	"-------------------------------------Elementos-------------------------------------"
	
	elemento ghostText: 'agregue un elemento'.
	elemento position: origen + (700 @ 220).
	elemento extent: 200 @ 50.
	
	"-------------------------------------Listado-------------------------------------"
	
	textoListado := StringMorph contents: 'listado de elementos'.
	textoListado color: Color white.
	textoListado position: elemento position + (0 @ 70).
	
	lista extent: 200 @ 50.
	lista color: Color white.
	lista position: textoListado position + (0 @ 30).
	
	textoElementos := StringMorph contents: 'capacidad actual:'.
	textoElementos color: Color white.
	textoElementos position: lista position + (0 @ 50).
	
	textoTamaño := StringMorph contents: tamaño asString.
	textoTamaño color: Color white.
	textoTamaño position: lista position + (100 @ 50).
	
	"-------------------------------------Boton elemento-------------------------------------"
	
	botonLista := BotonAccion2 new.
	botonLista ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/agregar.png'.
	botonLista position: elemento position + (250@0).
	
	botonLista mouseAction: [
		tamaño > 0
			ifTrue: [
				self agregarElemento: elemento text.
				lista updateList.
				self actualizarTamaño.
				textoTamaño contents: tamaño asString ]
			ifFalse: [ self alerta ] ].
	
	"-------------------------------------Boton confirmacion-------------------------------------"
	
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/\confirmar_renovacion.png'.
	botonConfirmacion position: origen + (570 @ 470).

	botonConfirmacion mouseAction: [
		fechaSeleccionada := fechaInicio date.
		calculoFecha := fechaSeleccionada subtractDate: fechaInicioActual.
		calculoFecha > 0 ifTrue: [ nuevaLista
			ifNotNil: [
				unContrato
					actualizarContrato: nuevaLista
					conFecha: fechaSeleccionada ]
			ifNil: [
			unContrato actualizarContrato: nil conFecha: fechaSeleccionada ].
	
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ] ifFalse: [  ].
		 ].

	

	botonVolver mouseAction: [
		self cerrar.
		self buscarContrato: miEmpresa ].

	self addMorph: botonConfirmacion.
	self addMorph: lista.
	self addMorph: textoElementos.
	self addMorph: textoTamaño.
	self addMorph: botonLista.
	self addMorph: fechaInicio.
	self addMorph: elemento.
	self addMorph: textoListado.
	self addMorph: textoFecha.
	self openCenteredInWorld
]
