Class {
	#name : 'Ventana1',
	#superclass : 'Ventana',
	#instVars : [
		'listaElementos',
		'cliente',
		'fechaInicio',
		'duracion',
		'horaAcordada',
		'servicios',
		'elementoSeleccionado',
		'tamaño',
		'direccionOrigen',
		'direccionDestino'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana1 >> actualizarTamaño [

	tamaño := tamaño - 1
]

{ #category : 'as yet unclassified' }
Ventana1 >> agregarElemento: unElem [
	listaElementos add: unElem asString 
]

{ #category : 'as yet unclassified' }
Ventana1 >> alerta [
]

{ #category : 'as yet unclassified' }
Ventana1 >> crearGuardamueble: miEmpresa [

	| botonElemento elemento lista botonCliente cuadroCliente unaFecha listado botonConfirmacion unContrato elServicio textoElementos textoTamaño botonServicio textoDatosCliente textoCliente listaDatosServicios documento listaDatos posicionServicio fechaInicioActual fechaSeleccionada calculoFecha datosServicio tituloPath tituloImage tituloMorph elementosPath elementosImage elementosMorph 
	serviciosPath serviciosImage serviciosMorph textoDatosServicio titulo |
	self initialize.
	self iniciarListado.
	ventanaPrincipal := VentanaPrincipal new.
	fechaInicioActual := Date today.
	
	listado := miEmpresa buscarServicios: elementoSeleccionado.
	listaDatos := listado collect: [ :con | con vistazoDatos ].
	
	"-------------------------------------Título-------------------------------------"
	titulo := StringMorph contents: 'Registrar Guardamueble'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (450 @ 55).
	
	"-------------------------------------Botones-------------------------------------"
	
	botonElemento := BotonAccion2 new. botonElemento ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/agregar.png'.
	botonCliente := BotonAccion2 new. botonCliente ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/buscar.png'.
	botonConfirmacion := BotonAccion2 new. botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar.png'.
	botonServicio := BotonAccion2 new. botonServicio ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	elemento := RubTextFieldMorph new.
	duracion := RubTextFieldMorph new.
	
	"-------------------------------------Listas-------------------------------------"
	
	lista := PluggableListMorph
		         on: listaElementos
		         list: #yourself
		         selected: nil
		         changeSelected: nil.
	
	elemento ghostText: 'agregue un elemento'.
	elemento position: origen + (800 @ 200).
	elemento extent: 200 @ 50.
	botonElemento position: elemento position + (250 @ 0).
	lista extent: 200 @ 50.
	lista color: Color darkGray.
	lista position: elemento position + (0 @ 100).
	elementosPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/lista_elementos.png' asFileReference.
	elementosImage := PNGReadWriter formFromFileNamed: elementosPath fullName.
	elementosMorph := ImageMorph new image: elementosImage.
	self addMorph: elementosMorph.
	elementosMorph position: lista position + (0 @ -30).
	
	tamaño := 0.
	textoElementos := StringMorph contents: 'capacidad actual:'.
	textoTamaño := StringMorph contents: tamaño asString.
	textoDatosCliente := StringMorph contents: ''.
	textoCliente := StringMorph contents: ''.
	
	textoElementos color: Color white.
	textoElementos position: lista position + (0 @ 60).
	textoTamaño color: Color white.
	textoTamaño position: textoElementos position + (100 @ 0).
	
	textoCliente color: Color white.
	textoCliente position: textoElementos position + (0 @ 20).
	textoDatosCliente color: Color white.
	textoDatosCliente position: textoCliente position + (0 @ 20).
	
	"-------------------------------------Seleccion de servicios-------------------------------------"

	servicios := DropListMorph new.
	servicios list: listaDatos.
	servicios position: origen + (150 @ 200).
	textoDatosServicio := StringMorph contents: ''.
	
	serviciosPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/lista_servicios.png' asFileReference.
	serviciosImage := PNGReadWriter formFromFileNamed: serviciosPath fullName.
	serviciosMorph := ImageMorph new image: serviciosImage.
	self addMorph: serviciosMorph.
	serviciosMorph position: servicios position + (0 @ -30).
	
	botonServicio position: servicios position + (62 @ 50).
	textoDatosServicio color: Color white.
	textoDatosServicio position: botonServicio position + (0 @ 80).
	listaDatosServicios := DropListMorph  new.
	listaDatosServicios extent: 200 @ 50.
	listaDatosServicios  position: botonServicio position + (-62 @ 100).
	
	
	
	"-------------------------------------DNI-------------------------------------"
	
	cuadroCliente := RubTextFieldMorph new.
	cuadroCliente ghostText: 'DNI del cliente'.
	cuadroCliente position: origen + (450 @ 200).
	cuadroCliente extent: 200 @ 50.
	botonCliente position: cuadroCliente position + (250 @ 0).
	
	
	
	
	"-------------------------------------Fecha-------------------------------------"
	
	
	fechaInicio := CalendarMorph new.
	fechaInicio date: Date today.
	fechaInicio left: self left + 10.
	unaFecha := fechaInicio date.
	fechaInicio position: cuadroCliente position + (0 @ 130).
	duracion ghostText: 'duracion del servicio'.
	duracion position: cuadroCliente position + (0 @ 80).
	duracion extent: 200 @ 50.
	
	"-------------------------------------Botones-------------------------------------"
	
	botonConfirmacion position: origen + (1000 @ 500).
	
	botonServicio mouseAction: [
		posicionServicio := servicios listSelectionIndex.
		posicionServicio > 0 ifTrue: [
			elServicio := listado at: posicionServicio.
			datosServicio := elServicio devolverListaDatos .
			listaDatosServicios list: datosServicio .
			elServicio ifNotNil: [
				listaElementos ifNotNil: [ listaElementos removeAll. lista updateList  ].
				tamaño := elServicio obtenerTamaño.
				tamaño := tamaño asInteger.
				textoTamaño contents: tamaño asString.
				textoDatosServicio contents: 'datos del servicio:' ] ] ].
	
	botonElemento mouseAction: [
		elServicio
			ifNotNil: [
				tamaño > 0
					ifTrue: [
						self agregarElemento: elemento text.
						lista updateList.
						self actualizarTamaño.
						textoTamaño contents: tamaño asString ]
					ifFalse: [ self alerta ] ]
			ifNil: [ self alerta ] ].
	botonCliente mouseAction: [
		documento := cuadroCliente text.
		cliente := miEmpresa buscarCliente: documento asString.
		cliente
			ifNotNil: [
				textoDatosCliente contents: cliente mostrarCliente.
				textoCliente contents: 'datos del cliente:' ]
			ifNil: [ self alerta ] ].
	botonConfirmacion mouseAction: [
		fechaSeleccionada := fechaInicio date.
		calculoFecha := fechaSeleccionada subtractDate: fechaInicioActual.
		calculoFecha > 0
			&
				unaFecha isNotNil & duracion isNotNil & cliente isNotNil
				& elServicio isNotNil & listaElementos isNotNil  ifTrue: [
					unContrato := ContratoGuardaMuebles
						              crear: unaFecha
						              conDuracion: duracion text asString
						              conLista: listaElementos
						              conServicio: elServicio
						              conCliente: cliente.
					miEmpresa agregarContrato: unContrato.
					self update: miEmpresa.
					ventanaPrincipal iniciar: miEmpresa.
					self cerrar ]
			ifFalse: [  ] ].
	botonVolver mouseAction: [
		self cerrar.
		self registrarContrato: miEmpresa ].
	
	"-------------------------------------Adds-------------------------------------"

	self addMorph: botonElemento.
	self addMorph: elemento.
	self addMorph: lista.
	self addMorph: elementosMorph.
	self addMorph: cuadroCliente.
	self addMorph: botonCliente.
	self addMorph: fechaInicio.
	self addMorph: duracion.
	self addMorph: servicios.
	self addMorph: botonConfirmacion.
	self addMorph: textoElementos.
	self addMorph: textoTamaño.
	self addMorph: botonServicio.
	self addMorph: textoDatosServicio.
	self addMorph: textoCliente.
	self addMorph: textoDatosCliente.
	self addMorph: listaDatosServicios .
	
	"-------------------------------------Open-------------------------------------"
	
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana1 >> crearMudanza: contratoSeleccionado conEmpresa: miEmpresa [

	| botonElemento elemento lista botonCliente cuadroCliente unaFecha listado botonConfirmacion unContrato elServicio textoElementos textoTamaño botonServicio textoDatosCliente textoCliente listaDatosServicios documento listaDatos posicionServicio fechaInicioActual fechaSeleccionada calculoFecha datosServicio tituloPath tituloImage tituloMorph elementosPath elementosImage elementosMorph serviciosPath serviciosImage serviciosMorph textoDatosServicio horarios horariosPath horariosImage horariosMorph textoDirecciones hora titulo|
	self initialize.
	self iniciarListado.
	ventanaPrincipal := VentanaPrincipal new.
	fechaInicioActual := Date today.
	
	listado := miEmpresa buscarServicios: elementoSeleccionado.
	listaDatos := listado collect: [ :con | con vistazoDatos ].

	"-------------------------------------Título-------------------------------------"
titulo := StringMorph contents: 'Registrar Mudanza'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (450 @ 55).
	
	"-------------------------------------Botones-------------------------------------"
	
	botonElemento := BotonAccion2 new. botonElemento ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/agregar.png'.
	botonCliente := BotonAccion2 new. botonCliente ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/buscar.png'.
	botonConfirmacion := BotonAccion2 new. botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar.png'.
	botonServicio := BotonAccion2 new. botonServicio ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	elemento := RubTextFieldMorph new.
	
	"-------------------------------------Listas-------------------------------------"
	
	lista := PluggableListMorph
		         on: listaElementos
		         list: #yourself
		         selected: nil
		         changeSelected: nil.
	
	elemento ghostText: 'agregue un elemento'.
	elemento position: origen + (800 @ 200).
	elemento extent: 200 @ 50.
	botonElemento position: elemento position + (250 @ 0).
	lista extent: 200 @ 50.
	lista color: Color darkGray.
	lista position: elemento position + (0 @ 100).
	elementosPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/lista_elementos.png' asFileReference.
	elementosImage := PNGReadWriter formFromFileNamed: elementosPath fullName.
	elementosMorph := ImageMorph new image: elementosImage.
	self addMorph: elementosMorph.
	elementosMorph position: lista position + (0 @ -30).
	
	tamaño := 0.
	textoElementos := StringMorph contents: 'capacidad actual:'.
	textoTamaño := StringMorph contents: tamaño asString.
	textoDatosCliente := StringMorph contents: ''.
	textoCliente := StringMorph contents: ''.
	
	textoElementos color: Color white.
	textoElementos position: lista position + (0 @ 60).
	textoTamaño color: Color white.
	textoTamaño position: textoElementos position + (100 @ 0).
	
	textoCliente color: Color white.
	textoCliente position: textoElementos position + (0 @ 20).
	textoDatosCliente color: Color white.
	textoDatosCliente position: textoCliente position + (0 @ 20).
	
	"-------------------------------------Seleccion de servicios-------------------------------------"

	servicios := DropListMorph new.
	servicios list: listaDatos.
	servicios position: origen + (150 @ 200).
	textoDatosServicio := StringMorph contents: ''.
	
	serviciosPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/lista_servicios.png' asFileReference.
	serviciosImage := PNGReadWriter formFromFileNamed: serviciosPath fullName.
	serviciosMorph := ImageMorph new image: serviciosImage.
	self addMorph: serviciosMorph.
	serviciosMorph position: servicios position + (0 @ -30).
	
	botonServicio position: servicios position + (62 @ 50).
	textoDatosServicio color: Color white.
	textoDatosServicio position: botonServicio position + (0 @ 80).
	listaDatosServicios := DropListMorph  new.
	listaDatosServicios extent: 200 @ 50.
	listaDatosServicios  position: botonServicio position + (-62 @ 100).
	
	
	
	"-------------------------------------DNI-------------------------------------"
	
	cuadroCliente := RubTextFieldMorph new.
	cuadroCliente ghostText: 'DNI del cliente'.
	cuadroCliente position: origen + (450 @ 200).
	cuadroCliente extent: 200 @ 50.
	botonCliente position: cuadroCliente position + (250 @ 0).
	
	
	
	
	"-------------------------------------Fecha-------------------------------------"
	
	textoDirecciones:= StringMorph contents:''.
	fechaInicio := CalendarMorph new.
	fechaInicio date: Date today.
	fechaInicio left: self left + 10.
	unaFecha := fechaInicio date.
	fechaInicio position: cuadroCliente position + (0 @ 130).
	horarios := Array new.
	horarios := #( '9:00' '10:00' '11:00' '12:00' '13:00' '14:00' '15:00'
	               '16:00' '17:00' '18:00' ).
	
	horaAcordada := DropListMorph new.
	
	
	
	horaAcordada list: horarios.
	
	elServicio := servicios selectedItem.
	horaAcordada extent: 200 @ 30.
	horaAcordada position: cuadroCliente position + (0 @ 80).
	
	horariosPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/seleccion_horario.png' asFileReference.
	horariosImage := PNGReadWriter formFromFileNamed: horariosPath fullName.
	horariosMorph := ImageMorph new image: horariosImage.
	self addMorph: horariosMorph.
	horariosMorph position: horaAcordada position + (0 @ -20).
	
	textoDirecciones color: Color black.
	textoDirecciones position: servicios position + (50 @ 60).
	
	"-------------------------------------Botones-------------------------------------"
	
	botonConfirmacion position: origen + (1000 @ 500).
	
	botonServicio mouseAction: [
		posicionServicio := servicios listSelectionIndex.
		posicionServicio > 0 ifTrue: [
			elServicio := listado at: posicionServicio.
			elServicio ifNotNil: [
				listaElementos ifNotNil: [
					listaElementos removeAll.
					lista updateList.
					tamaño := 100.
					textoTamaño contents: tamaño asString ].
				datosServicio := elServicio devolverListaDatos.
				listaDatosServicios list: datosServicio.] ] ].
	botonElemento mouseAction: [
		self agregarElemento: elemento text.
		lista updateList.
		self actualizarTamaño.
		textoTamaño contents: tamaño asString ].
	botonCliente mouseAction: [
		documento := cuadroCliente text.
		cliente := miEmpresa buscarCliente: documento asString.
		cliente
			ifNotNil: [
				textoCliente contents: 'datos del cliente:'.
				textoDatosCliente contents: cliente mostrarCliente ]
			ifNil: [ self alerta ] ].
	botonConfirmacion mouseAction: [
		hora := horaAcordada selectedItem.
		unaFecha := fechaInicio date.
		fechaSeleccionada := fechaInicio date.
		calculoFecha := fechaSeleccionada subtractDate: fechaInicioActual.
		calculoFecha > 0 & unaFecha isNotNil & hora isNotNil
		& cliente isNotNil & elServicio isNotNil & listaElementos isNotNil
			ifTrue: [
				unContrato := ContratoMudanza
					              crear: nil
					              conDestino: nil
					              conFecha: unaFecha
					              conHora: hora
					              conCliente: cliente
					              conServicio: elServicio
					              conLista: listaElementos.
				self cerrar.
				self generarDireccionOrigen: unContrato para: miEmpresa ]
			ifFalse: [  ] ].
	botonVolver mouseAction: [
		self cerrar.
		self registrarContrato: miEmpresa ].

	
	"-------------------------------------Adds-------------------------------------"

	self addMorph: botonElemento.
	self addMorph: elemento.
	self addMorph: lista.
	self addMorph: elementosMorph.
	self addMorph: cuadroCliente.
	self addMorph: botonCliente.
	self addMorph: fechaInicio.
	self addMorph: servicios.
	self addMorph: horaAcordada.
	self addMorph: botonConfirmacion.
	self addMorph: textoElementos.
	self addMorph: textoTamaño.
	self addMorph: botonServicio.
	self addMorph: textoDatosServicio.
	self addMorph: textoCliente.
	self addMorph: textoDatosCliente.
	self addMorph: listaDatosServicios .
	
	"-------------------------------------Open-------------------------------------"
	
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana1 >> generarDireccionDestino: unContrato para: miEmpresa [

	| direccion numero piso depto barrio botonConfirmar tituloPath tituloImage tituloMorph direccionPath direccionImage direccionMorph titulo|
	self initialize.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Direccion Destino'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (450 @ 55).
	"-------------------------------------Direccion-------------------------------------"
	
	direccionPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/direccion_destino.png' asFileReference.
	direccionImage := PNGReadWriter formFromFileNamed: direccionPath fullName.
	direccionMorph := ImageMorph new image: direccionImage.
	self addMorph: direccionMorph.
	direccionMorph position: origen + (510@150).
	
	"-------------------------------------Texto-------------------------------------"
	
	direccion := RubTextFieldMorph new.
	numero := RubTextFieldMorph new.
	piso := RubTextFieldMorph new.
	depto := RubTextFieldMorph new.
	barrio := RubTextFieldMorph new.

	direccion ghostText: 'ingrese direccion'.
	direccion extent: 300 @ 100.
	direccion position: origen + (450 @ 200).
	numero ghostText: 'ingrese numero'.
	numero extent: 300 @ 100.
	numero position: direccion position + (0 @ 50).
	piso ghostText: 'ingrese piso'.
	piso extent: 300 @ 100.
	piso position: numero position + (0 @ 50).
	depto ghostText: 'ingrese departamento'.
	depto extent: 300 @ 100.
	depto position: piso position + (0 @ 50).
	barrio ghostText: 'ingrese barrio'.
	barrio extent: 300 @ 100.
	barrio position: depto position + (0 @ 50).
	
	
	botonConfirmar := BotonAccion2 new. botonConfirmar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_direccion.png'.
	botonConfirmar position: origen + (590 @ 500).
	
	botonConfirmar mouseAction: [
		direccion isNotNil & numero isNotNil & piso isNotNil
		& depto isNotNil & barrio isNotNil
			ifTrue: [
				direccionDestino := Direccion
					                   crear: direccion text asString
					                   numero: numero text asString
					                   piso: piso text asString
					                   dpto: depto text asString
					                   barrio: barrio text asString.
				unContrato cambiarDireccionDestino: direccionDestino.
				miEmpresa agregarContrato: unContrato.
				self update: miEmpresa.
				ventanaPrincipal iniciar: miEmpresa.
				self cerrar. ]
			ifFalse: [  ] ].

	botonVolver mouseAction: [ self cerrar. self crearMudanza: elementoSeleccionado  conEmpresa: miEmpresa  ].

	self addMorph: direccion.
	self addMorph: numero.
	self addMorph: piso.
	self addMorph: depto.
	self addMorph: barrio.
	self addMorph: botonConfirmar.

	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana1 >> generarDireccionOrigen: unContrato para: miEmpresa [

	| direccion numero piso depto barrio botonConfirmar tituloPath tituloImage tituloMorph direccionPath direccionImage direccionMorph titulo|
	self initialize.
	
titulo := StringMorph contents: 'Direccion Origen'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (450 @ 55).

	"-------------------------------------Direccion-------------------------------------"
	
	direccionPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/direccion_origen.png' asFileReference.
	direccionImage := PNGReadWriter formFromFileNamed: direccionPath fullName.
	direccionMorph := ImageMorph new image: direccionImage.
	self addMorph: direccionMorph.
	direccionMorph position: origen + (510@150).
	
	"-------------------------------------Texto-------------------------------------"
	
	direccion := RubTextFieldMorph new.
	numero := RubTextFieldMorph new.
	piso := RubTextFieldMorph new.
	depto := RubTextFieldMorph new.
	barrio := RubTextFieldMorph new.

	direccion ghostText: 'ingrese direccion'.
	direccion extent: 300 @ 100.
	direccion position: origen + (450 @ 200).
	numero ghostText: 'ingrese numero'.
	numero extent: 300 @ 100.
	numero position: direccion position + (0 @ 50).
	piso ghostText: 'ingrese piso'.
	piso extent: 300 @ 100.
	piso position: numero position + (0 @ 50).
	depto ghostText: 'ingrese departamento'.
	depto extent: 300 @ 100.
	depto position: piso position + (0 @ 50).
	barrio ghostText: 'ingrese barrio'.
	barrio extent: 300 @ 100.
	barrio position: depto position + (0 @ 50).
	
	
	botonConfirmar := BotonAccion2 new. botonConfirmar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_direccion.png'.
	botonConfirmar position: origen + (590 @ 500).
	
	botonConfirmar mouseAction: [
		direccion isNotNil & numero isNotNil & piso isNotNil
		& depto isNotNil & barrio isNotNil
			ifTrue: [
				direccionOrigen := Direccion
					                   crear: direccion text asString
					                   numero: numero text asString
					                   piso: piso text asString
					                   dpto: depto text asString
					                   barrio: barrio text asString.
				unContrato cambiarDireccionOrigen: direccionOrigen.
				self cerrar.
				self generarDireccionDestino: unContrato para: miEmpresa ]
			ifFalse: [  ] ].

	botonVolver mouseAction: [ self cerrar. self crearMudanza: elementoSeleccionado  conEmpresa: miEmpresa  ].

	self addMorph: direccion.
	self addMorph: numero.
	self addMorph: piso.
	self addMorph: depto.
	self addMorph: barrio.
	self addMorph: botonConfirmar.

	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana1 >> iniciarListado [

	listaElementos := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Ventana1 >> registrarContrato: miEmpresa [

	| contratos items botonConfirmacion texto tituloPath tituloImage tituloMorph tituloPath2 tituloImage2 tituloMorph2 titulo titulo2|
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	
titulo := StringMorph contents: 'Registrar Contrato'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.
self addMorph: titulo.
titulo position: origen + (450 @ 55).

titulo2 := StringMorph contents: 'Seleccione tipo de contrato'.
titulo2 color: Color white.
titulo2 font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 22).
titulo2 emphasis: 1.
self addMorph: titulo2.
titulo2 position: origen + (440@ 250).

	contratos := DropListMorph new.
	items := #( 'guardaMueble' 'mudanzaLocal' 'mudanzaNacional'
	            'mudanzaInternacional' ).
	contratos list: items.
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion label: 'confirmar servicio'. botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	
	contratos extent: 300 @ 30.
	contratos position: origen + (450 @ 300).
	
	botonConfirmacion position: origen + (550 @ 450).

	self addMorph: contratos.
	self addMorph: botonConfirmacion.

	botonConfirmacion mouseAction: [
		elementoSeleccionado := contratos selectedItem .
		elementoSeleccionado
			ifNotNil: [
				self cerrar.
				elementoSeleccionado = 'guardaMueble'
					ifTrue: [ self crearGuardamueble: miEmpresa ]
					ifFalse: [
					self crearMudanza: elementoSeleccionado conEmpresa: miEmpresa ].
				 ]
			ifNil: [ self alerta ] ].

	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].
	self openCenteredInWorld
]
