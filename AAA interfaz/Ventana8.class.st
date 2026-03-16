Class {
	#name : 'Ventana8',
	#superclass : 'Ventana',
	#instVars : [
		'listaContratos',
		'listaServicios'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana8 >> mostrarListadoDeContratoSemanal: miEmpresa [

	| texto bloqueNumero botonBuscar tituloPath tituloImage tituloMorph listContratos titulo|
	

	self initialize.

	listContratos := miEmpresa generarListadoContratosSemanal .
	
	listaContratos := PluggableListMorph
		                  on: listContratos
		                  list: #yourself
		                  selected: nil
		                  changeSelected: nil.

	listaContratos extent: 700 @ 300.
	listaContratos position: origen + (250 @ 120).
	
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	texto := StringMorph contents: ''.
	ventanaPrincipal := VentanaPrincipal new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Listado de Contratos Semanales'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.
self addMorph: titulo.
titulo position: origen + (260 @ 55).
	



	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].


	self addMorph: texto.
	self addMorph: listaContratos.
	self openCenteredInWorld
]
