Class {
	#name : 'Ventana5',
	#superclass : 'Ventana',
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana5 >> buscarContratoMudanza: miEmpresa [

| botonConfirmacion unServ bloqueNumero unContrato botonBuscar texto tituloPath tituloImage tituloMorph textoContrato titulo |

	"-------------------------------------Inicializar-------------------------------------"

	self initialize.
	texto := StringMorph new.
	texto contents: ''.
	textoContrato:= StringMorph new.
	textoContrato contents: ''.
	ventanaPrincipal := VentanaPrincipal new.
	
	"-------------------------------------Título-------------------------------------"
	

titulo := StringMorph contents: 'Reprogramar Mudanza'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (390 @ 55).
	
	"-------------------------------------Num contrato-------------------------------------"
	
	bloqueNumero := RubTextFieldMorph new.
	bloqueNumero ghostText: 'numero'.
	bloqueNumero position: titulo position + (20 @ 200).
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
		
		unContrato
			ifNotNil: [
				unServ := unContrato obtenerServicio.
				unServ esMudanza 		
				ifTrue:[ 
						textoContrato contents: 'datos del contrato:'.
						texto contents: unContrato mostrarDatos.
						texto position: bloqueNumero position + (-200 @ 130) ]
																			
				ifFalse:[
					texto contents: 'EL CONTRATO BUSCADO NO EXISTE O NO ES DE MUDANZA'.
					texto position: bloqueNumero position + (0 @ 130) ].]
		  
			ifNil: [ texto contents: 'el numero del contrato no existe'.
				texto position: bloqueNumero position + (0 @ 130) ]].
		
	"-------------------------------------Boton Confirmar-------------------------------------"
	
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570 @ 450).
	
	botonConfirmacion mouseAction: [
		unContrato := miEmpresa buscarContrato: bloqueNumero text asString.
		unContrato
			ifNotNil: [
				unServ := unContrato obtenerServicio.
				unServ esMudanza
					ifTrue: [
						self cerrar.	
						self intentarRepContratoMud: miEmpresa elNum: bloqueNumero elCont: unContrato.  ]
					ifFalse: [  ] ]
			ifNil: [  ] ].
	
		

	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar.
		 ].
	
	self addMorph: bloqueNumero.
	self addMorph: botonBuscar.
	self addMorph: botonConfirmacion.
	self addMorph: texto.
	self addMorph: textoContrato.
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana5 >> intentarRepContratoMud: miEmpresa elNum: bloqueNumero elCont: contrato [

	| bloqueOpcion tipoRepro texto1 texto2 dniCliente nroContr fecha hora esPosible elTipo textoNega textoNega2 calendario unaFecha tipoServ tituloPath tituloImage tituloMorph botonConfirmacion titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.

	textoNega := StringMorph new.
	textoNega contents: ''.
	textoNega2 := StringMorph new.
	textoNega2 contents: ''.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Reprogramar Mudanza'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (380 @ 55).

	"-------------------------------------Tipo renovacion-------------------------------------"
	"pepe"
	
	texto1 := StringMorph new.
	texto1 contents: 'ingrese el tipo de reprogramacion'.
	texto1 position: origen + (230 @ 150).
	texto1 color: Color white.
	
	bloqueOpcion := RubTextFieldMorph new.
	bloqueOpcion ghostText: 'COMUN/URGENCIA'.
	bloqueOpcion position: texto1 position + (0 @ 20).
	bloqueOpcion extent: 200 @ 50.
	
	"-------------------------------------Fecha-------------------------------------"
	
	texto2 := StringMorph new.
	texto2 contents: 'ingrese la nueva fecha de la mudanza'.
	texto2 position: bloqueOpcion position + (0 @ 50).
	texto2 color: Color white.
	
	calendario := CalendarMorph new.
	calendario date: Date today.
	calendario left: self left + 10.
	calendario position: texto2 position + (0 @ 20).
	
	"-------------------------------------Datos-------------------------------------"

	dniCliente := StringMorph new.
	dniCliente contents: 'DNI CLIENTE: ' , contrato getDniCliente asString.
	dniCliente position: origen + (750 @ 230).
	dniCliente color: Color white.

	nroContr := StringMorph new.
	nroContr contents: 'NUMERO CONTRATO: ' , contrato getNroContrato asString.
	nroContr position: dniCliente position + (0 @ 20).
	nroContr color: Color white.
	
	tipoServ := StringMorph new.
	tipoServ contents: 'TIPO DE SERVICIO: ' , contrato obtenerServicio asString.
	tipoServ position: nroContr position + (0 @ 20).
	tipoServ color: Color white.

	fecha := StringMorph new.
	fecha contents: 'FECHA CONTRATO: ' , contrato obtenerFecha asString.
	fecha position: tipoServ position + (0 @ 20).
	fecha color: Color white.

	hora := StringMorph new.
	hora contents: 'HORA CONTRATO: ' , contrato getHora asString.
	hora position: fecha position + (0 @ 20).
	hora color: Color white.
	
	"-------------------------------------Boton confirmacion-------------------------------------"
	
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_reprogramacion.png'.
	botonConfirmacion position: origen + (570 @ 470).

	botonConfirmacion mouseAction: [
		unaFecha := calendario date.
		tipoRepro := bloqueOpcion text asString.
		tipoRepro
			ifEmpty: [
				textoNega contents: 'FALTA INGRESAR TIPO DE REPROGRAMACION '.
				textoNega position: hora position + (0 @ 60).
				textoNega color: Color white ]
			ifNotEmpty: [
				elTipo := tipoRepro asString = 'comun'.
				elTipo
					ifTrue: [
						esPosible := miEmpresa
							             reprogramarContrato: bloqueNumero text asString
							             conFecha: unaFecha.
						esPosible
							ifTrue: [ fecha contents: 'REPROGRAMADO: ' , unaFecha asString ]
							ifFalse: [
								textoNega contents: '"NO FUE POSIBLE REPROGRAMAR EL CONTRATO'.
								textoNega position: hora position + (0 @ 60).
								textoNega color: Color white.

								textoNega2 contents:
									'NO CUMPLE CON EL REQUSITO DE DIAS PREVIOS"'.
								textoNega2 position: textoNega position + (0 @ 15).
								textoNega2 color: Color white ] ]
					ifFalse: [
						esPosible := miEmpresa
							             reprogramarUrgencia: bloqueNumero text asString
							             conFecha: unaFecha.
						esPosible > 0
							ifTrue: [
								textoNega contents:
									'SE REALIZO LA REPROGRAMACION DE URGENCIA '.
								textoNega position: hora position + (0 @ 60).
								textoNega color: Color white.
								textoNega2 contents:
									'EL MONTO A PAGAR ES DE: ' , esPosible asString ]
							ifFalse: [
								textoNega contents:
									'NO SE PUDO HACER LA REPROGRAMACION DE URGENCIA'.
								textoNega position: hora position + (0 @ 60).
								textoNega color: Color white.
								textoNega2 contents:
									'EL CONTRATO YA FUE REALIZADO U HOY ES EL DIA DE 	REALIZACION' ].
						textoNega2 position: textoNega position + (0 @ 15).
						textoNega2 color: Color white.
						self update: miEmpresa ] ] ].

	botonVolver mouseAction: [
		self cerrar.
		self buscarContratoMudanza: miEmpresa ].

	self addMorph: texto1.
	self addMorph: texto2.
	self addMorph: bloqueOpcion.
	self addMorph: botonConfirmacion.
	self addMorph: dniCliente.
	self addMorph: nroContr.
	self addMorph: fecha.
	self addMorph: calendario.
	self addMorph: hora.
	self addMorph: textoNega.
	self addMorph: textoNega2.
	self addMorph:tipoServ.
	self openCenteredInWorld
]
