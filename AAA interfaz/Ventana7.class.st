Class {
	#name : 'Ventana7',
	#superclass : 'Ventana',
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana7 >> mostrarContrato: miEmpresa [

	| texto bloqueNumero unContrato botonBuscar tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	texto := StringMorph contents: ''.
	ventanaPrincipal := VentanaPrincipal new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Mostrar Contrato'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.
self addMorph: titulo.
titulo position: origen + (430 @ 55).
	
	"-------------------------------------Num contrato-------------------------------------"
	
	bloqueNumero := RubTextFieldMorph new.
	bloqueNumero ghostText: 'ingrese numero del contrato'.
	bloqueNumero position: titulo position + (-70 @ 250).
	bloqueNumero extent: 300 @ 100.
	
	"-------------------------------------Boton Buscar-------------------------------------"

	botonBuscar := BotonAccion2 new.
	botonBuscar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/buscar.png'.
	botonBuscar position: bloqueNumero position + (320@0).
	
	texto position: bloqueNumero position + (-200 @ 100).
	texto color: Color white.

	botonBuscar mouseAction: [
		unContrato := miEmpresa buscarContrato: bloqueNumero text asString.
		unContrato ifNotNil: [ texto contents: unContrato mostrarDatos ] ].


	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].

	self addMorph: bloqueNumero.
	self addMorph: botonBuscar.
	self addMorph: texto.
	
	self openCenteredInWorld
]
