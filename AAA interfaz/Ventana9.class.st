Class {
	#name : 'Ventana9',
	#superclass : 'Ventana',
	#instVars : [
		'listaContratos',
		'listaServicios'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana9 >> buscarContratoMudanza: miEmpresa [

	| botonConfirmacion unServ unTipoSer bloqueNumero unContrato botonBuscar texto tituloPath tituloImage tituloMorph textoContrato titulo |

	"-------------------------------------Inicializar-------------------------------------"
	self initialize.
	texto := StringMorph new.
	texto contents: ''.
	textoContrato := StringMorph new.
	textoContrato contents: ''.
	ventanaPrincipal := VentanaPrincipal new.

	"-------------------------------------Título-------------------------------------"
	titulo := StringMorph contents: 'Busca contrato mudanza'.
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
	botonBuscar position: bloqueNumero position + (320 @ 0).

	texto color: Color white.
	textoContrato color: Color white.
	textoContrato position: botonBuscar position + (-190 @ 80).

	botonBuscar mouseAction: [
		unContrato := miEmpresa buscarContrato: bloqueNumero text asString.

		unContrato
			ifNotNil: [
				unServ := unContrato obtenerServicio.
				unTipoSer := unContrato verificaEsInternacional.

				((unServ esMudanza) and: [ unTipoSer ])
					ifTrue: [
						textoContrato contents: 'datos del contrato:'.
						texto contents: unContrato mostrarDatos.
						texto position: bloqueNumero position + (-200 @ 130)
					]
					ifFalse: [
						texto contents: 'EL CONTRATO BUSCADO NO EXISTE O NO ES DE MUDANZA INTERNACIONAL'.
						texto position: bloqueNumero position + (0 @ 130)
					]
			]
			ifNil: [
				texto contents: 'el numero del contrato no existe'.
				texto position: bloqueNumero position + (0 @ 130)
			].
	].

	"-------------------------------------Boton Confirmar-------------------------------------"
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570 @ 450).

	botonConfirmacion mouseAction: [
		unContrato := miEmpresa buscarContrato: bloqueNumero text asString.

		unContrato
			ifNotNil: [
				unServ := unContrato obtenerServicio.

				((unServ esMudanza) and: [ unContrato verificaEsInternacional ])
					ifTrue: [
						self cerrar.
						self seleccionarTransporte: unContrato unaEmpresa: miEmpresa 
					]
					ifFalse: [ ]
			]
			ifNil: [ ].
	].

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
Ventana9 >> seleccionarTransporte: contrato unaEmpresa: miEmpresa [

	| textoTitulo textoTransporte listaTransporte items textoEstado botonConfirmar servicio panel |

	self initialize.

	"-------------------------------------Título-------------------------------------"

	textoTitulo := StringMorph contents: 'Seleccionar Transporte'.
	textoTitulo color: Color white.
	textoTitulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
	textoTitulo emphasis: 1.
	self addMorph: textoTitulo.
	textoTitulo position: origen + (420 @ 90).

	"-------------------------------------Panel visual central-------------------------------------"

	panel := Morph new.
	panel color: (Color r: 0.16 g: 0.20 b: 0.30).
	panel extent: 420 @ 220.
	panel position: origen + (400 @ 180).
	self addMorph: panel.

	"-------------------------------------Texto-------------------------------------"

	textoTransporte := StringMorph new.
	textoTransporte contents: 'Seleccione transporte'.
	textoTransporte color: Color white.
	textoTransporte font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 16).
	panel addMorph: textoTransporte.
	textoTransporte position: panel innerBounds origin + (105 @ 30).

	"-------------------------------------Lista-------------------------------------"

	listaTransporte := DropListMorph new.
	items := #('maritimo' 'aereo').
	listaTransporte list: items.
	listaTransporte extent: 220 @ 35.
	panel addMorph: listaTransporte.
	listaTransporte position: panel innerBounds origin + (100 @ 70).

	"-------------------------------------Botón confirmar-------------------------------------"

	botonConfirmar := BotonAccion2 new.
	botonConfirmar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	panel addMorph: botonConfirmar.
	botonConfirmar position: panel innerBounds origin + (160 @ 130).

	"-------------------------------------Estado-------------------------------------"

	textoEstado := StringMorph new.
	textoEstado contents: ''.
	textoEstado color: Color white.
	textoEstado font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 13).
	panel addMorph: textoEstado.
	textoEstado position: panel innerBounds origin + (50 @ 180).		botonVolver mouseAction: [
		self cerrar .
		self buscarContratoMudanza: miEmpresa 
		 ].


	"-------------------------------------Lógica-------------------------------------"

	botonConfirmar mouseAction: [
		| seleccion |

		servicio := contrato obtenerServicio.

		(servicio verificarTipoTransporte)
			ifTrue: [
				textoEstado contents: 'EL TRANSPORTE YA FUE RESUELTO'
			]
			ifFalse: [
				seleccion := listaTransporte selectedItem.

				seleccion isNil
					ifTrue: [
						textoEstado contents: 'DEBE SELECCIONAR MARITIMO O AEREO'
					]
					ifFalse: [
						servicio tipoTransporte: seleccion.
						textoEstado contents: 'TRANSPORTE SELECCIONADO: ', seleccion
					]
			].
	].

	self openCenteredInWorld
]
