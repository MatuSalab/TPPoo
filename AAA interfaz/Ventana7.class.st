Class {
	#name : 'Ventana7',
	#superclass : 'Ventana',
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana7 >> mostrarContrato: miEmpresa [

	| texto bloqueNumero unContrato botonBuscar tituloPath tituloImage tituloMorph|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	texto := StringMorph contents: ''.
	ventanaPrincipal := VentanaPrincipal new.
	
	"-------------------------------------Título-------------------------------------"
	
	tituloPath := 'C:\Users\Matu\Documents\Pharo\images\cosa-01\recursos\mostrar_contrato.png' asFileReference.
	tituloImage := PNGReadWriter formFromFileNamed: tituloPath fullName.
	tituloMorph := ImageMorph new image: tituloImage.
	self addMorph: tituloMorph.
	tituloMorph position: origen + (475@55).
	
	"-------------------------------------Num contrato-------------------------------------"
	
	bloqueNumero := RubTextFieldMorph new.
	bloqueNumero ghostText: 'ingrese numero del contrato'.
	bloqueNumero position: tituloMorph position + (-50 @ 250).
	bloqueNumero extent: 300 @ 100.
	
	"-------------------------------------Boton Buscar-------------------------------------"

	botonBuscar := BotonAccion2 new.
	botonBuscar ponerIcono: 'C:\Users\Matu\Documents\Pharo\images\cosa-01\recursos\buscar.png'.
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
