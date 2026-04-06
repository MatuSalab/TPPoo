Class {
	#name : 'Ventana6',
	#superclass : 'Ventana',
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana6 >> cancelarContrato: miEmpresa [

	| bloqueNumero unContrato botonBuscar  titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	bloqueNumero := RubTextFieldMorph new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Cancelar Contrato'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.
self addMorph: titulo.
titulo position: origen + (430 @ 55).
	"-------------------------------------Num contrato-------------------------------------"
	
	bloqueNumero := RubTextFieldMorph new.
	bloqueNumero ghostText: 'ingrese numero del contrato'.
	bloqueNumero position: titulo position + (0 @ 250).
	bloqueNumero extent: 300 @ 100.
	
	"-------------------------------------Boton Buscar-------------------------------------"
	
	botonBuscar := BotonAccion2 new.
	botonBuscar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/buscar.png'.
	botonBuscar position: bloqueNumero position + (320@0).
	

	botonBuscar mouseAction: [
		(self tieneLetra: bloqueNumero)
			ifTrue: [
			UIManager inform: 'Ingrese un numero de contrato valido.' ]
			ifFalse: [
				unContrato := miEmpresa buscarContrato: bloqueNumero text asString.
				unContrato
					ifNotNil: [
						self mostrarContrato: unContrato id: bloqueNumero text asString yEmpresa: miEmpresa.
						]
					ifNil: [ UIManager inform: 'Contrato no encontrado.' ] ] ].

	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].

	self addMorph: bloqueNumero.
	self addMorph: botonBuscar.
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana6 >> mostrarContrato: unContrato id: nroContrato yEmpresa: miEmpresa [

	| tipoContrato nombreServicio textoNombreContrato textoFechaInicio textoMulta botonCancelar textoApellido telefonoCliente textoDatosCliente textoDatosContrato textoNroContrato textoNombreCliente textoTelefono textoDni calculoMulta textoMonto textoMontoTotal montoTotal valorBase textoAviso  titulo textoFechaFirma|
	
		"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	tipoContrato := unContrato obtenerServicio.
	nombreServicio := tipoContrato getNombre.
	telefonoCliente := unContrato getTelefonoCliente.
	montoTotal := 0.
	textoDatosContrato := StringMorph new.
	textoDatosCliente := StringMorph new.
	textoMonto := StringMorph new.
	textoMulta := StringMorph new.
	textoNombreContrato := StringMorph new.
	textoNroContrato := StringMorph new.
	textoFechaInicio := StringMorph new.
	textoNombreCliente := StringMorph new.
	textoApellido := StringMorph new.
	textoDni := StringMorph new.
	textoTelefono := StringMorph new.
	textoAviso := StringMorph new.
	textoFechaFirma:=StringMorph new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Cancelar Contrato'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (430 @ 55).
	
	"-------------------------------------Datos contrato-------------------------------------"

	textoDatosContrato contents: 'Datos Contrato'.
	textoDatosContrato position: origen + (300 @ 200).
	textoDatosContrato color: Color white.
	
	textoNombreContrato contents: 'Contrato: ' , nombreServicio asString.
	textoNombreContrato color: Color white.
	textoNombreContrato position: textoDatosContrato position + (-30 @ 50).
	
	textoNroContrato contents: 'Id Contrato: ' , nroContrato asString.
	textoNroContrato color: Color white.
	textoNroContrato position: textoNombreContrato position + (0 @ 30).
	
	textoFechaInicio contents: 'Fecha inicio: ' , unContrato obtenerFechaIncio asString.
	textoFechaInicio color: Color white.
	textoFechaInicio position: textoNroContrato position + (0 @ 30).
	
	textoFechaFirma contents: 'Fecha firma: ' , unContrato obtenerFechaFirma asString.
	textoFechaFirma color: Color white.
	textoFechaFirma position: textoNroContrato position + (0 @ 120).
	

	
	textoMonto contents: 'Valor Base: ' , tipoContrato obtenerValorBase asString.
	textoMonto color: Color white.
	textoMonto position: textoFechaInicio position + (0 @ 30).
	valorBase := tipoContrato obtenerValorBase.

	textoMulta color: Color white.
	textoMulta contents: ''.
	textoMulta position: textoMonto position + (0 @ 30).



	"-------------------------------------Datos cliente-------------------------------------"
	
	textoDatosCliente contents: 'Datos Cliente'.
	textoDatosCliente position: textoDatosContrato position + (500 @ 0).
	textoDatosCliente color: Color white.

	textoNombreCliente contents: 'Nombre: ' , unContrato getNombreCliente asString.
	textoNombreCliente color: Color white.
	textoNombreCliente position: textoDatosCliente position + (-30 @ 50).

	textoApellido contents: 'Apellido: ' , unContrato getApellidoCliente asString.
	textoApellido color: Color white.
	textoApellido position: textoNombreCliente position + (0 @ 30).

	textoDni contents: 'DNI: ' , unContrato getDniCliente asString.
	textoDni color: Color white.
	textoDni position: textoApellido position + (0 @ 30).
	
	textoTelefono contents: 'Telefono: ' , unContrato getTelefonoCliente asString.
	textoTelefono color: Color white.
	textoTelefono position: textoDni position + (0 @ 30).


	"-------------------------------------Boton-------------------------------------"
	
	botonCancelar := BotonAccion2 new.
	botonCancelar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar.png'.
	botonCancelar position: titulo position + (100@450).
	
	botonCancelar mouseAction: [
		(miEmpresa cancelarContrato: nroContrato)
			ifTrue: [
				miEmpresa agregarContratoCancelado: unContrato.
				UIManager inform: 'Contrato cancelado correctamente'.
				textoAviso contents:
					'El Contrato: ' , nroContrato , '. Se cancelo de manera exitosa' ]
			ifFalse: [
				UIManager inform:
					'El Contrato: ' , nroContrato , '. No pudo ser cancelado' ] ].

	"-------------------------------------Tipos contrato-------------------------------------"
	
	textoAviso := StringMorph new.
	textoAviso color: Color white.
	textoAviso contents: ''.
	textoAviso position: botonCancelar position + (-100 @ -30).
	
	tipoContrato esGuardamueble ifTrue: [
		unContrato revisarContrato
			ifFalse: [ textoMulta contents: 'Multa: 0' ]
			ifTrue: [
				calculoMulta := unContrato calcularMontoCancelacion.
				textoMulta contents: 'Multa: ' , calculoMulta asString.
				montoTotal := valorBase + calculoMulta ] ].

	tipoContrato esMudanza ifTrue: [
		| fecha monto |
		calculoMulta := unContrato calcularMontoCancelacion.
		fecha := unContrato getFechaAcordada.
		tipoContrato esLocal ifTrue: [
			(tipoContrato vefCancelacion: fecha)
				ifTrue: [ textoMulta contents: 'Multa: 0' ]
				ifFalse: [
					monto := tipoContrato calcularMontoAPagar.
					textoMulta contents: 'Monto: ' , monto asString ].
			montoTotal := valorBase + calculoMulta ].

		tipoContrato esNacional ifTrue: [
			(tipoContrato vefCancelacion: fecha)
				ifTrue: [ textoMulta contents: 'Multa: 0' ]
				ifFalse: [
					monto := tipoContrato calcularMonto.
					textoMulta contents: 'Monto: ' , monto asString ].
			montoTotal := valorBase + calculoMulta ].

		tipoContrato esInternacional ifTrue: [
			(tipoContrato vefCancelacion: fecha) ifTrue: [
				monto := tipoContrato calcularMonto.
				textoMulta contents: 'Monto: ' , monto asString ] ].
		montoTotal := valorBase + calculoMulta ].
		textoMontoTotal := StringMorph new.

	"--------------------------------------------------------------------------"

	botonVolver mouseAction: [
		self cerrar.
		self cancelarContrato: miEmpresa ].


	self addMorph: textoNombreContrato.
	self addMorph: botonCancelar.
	self addMorph: textoDatosContrato.
	self addMorph: textoDatosCliente.
	self addMorph: textoNroContrato.
	self addMorph: textoFechaInicio.
	self addMorph: textoNombreCliente.
	self addMorph: textoApellido.
	self addMorph: textoDni.
	self addMorph: textoTelefono.
	self addMorph: textoMonto.
	self addMorph: textoMulta.
	self addMorph: textoMontoTotal.
	self addMorph: textoAviso.
	self addMorph: textoFechaFirma.
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana6 >> tieneLetra: unaCadena [
	"si es vacia o tiene un letra devuelve true, si solo tiene numeros devuelve false"

	| valor |
	valor := (unaCadena text asString isEmpty or: [
		          unaCadena text asString isAllDigits not ])
		         ifTrue: [ true ]
		         ifFalse: [ false ].
	^ valor
]
