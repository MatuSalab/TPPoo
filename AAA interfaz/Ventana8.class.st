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

	| texto bloqueNumero botonBuscar tituloPath tituloImage tituloMorph listContratos|
	

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
	
	tituloPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/listadoC.png' asFileReference.
	tituloImage := PNGReadWriter formFromFileNamed: tituloPath fullName.
	tituloMorph := ImageMorph new image: tituloImage.
	self addMorph: tituloMorph.
	tituloMorph position: origen + (400@55).
	



	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].


	self addMorph: texto.
	self addMorph: listaContratos.
	self openCenteredInWorld
]
