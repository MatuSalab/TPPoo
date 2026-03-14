Class {
	#name : 'Ventana',
	#superclass : 'BorderedMorph',
	#instVars : [
		'origen',
		'botonCerrar',
		'min',
		'botonVolver',
		'ventana1',
		'ventana2',
		'ventana3',
		'ventana4',
		'ventana5',
		'ventana6',
		'ventana7',
		'ventanaPrincipal'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana class >> crearInterfaz [


	| ventana |
	ventana := self new.
	ventana initialize.
	^ ventana
]

{ #category : 'as yet unclassified' }
Ventana class >> crearVentana [
| ventana |
ventana := self new.
ventana initialize.
^ ventana 
]

{ #category : 'as yet unclassified' }
Ventana >> alerta [
]

{ #category : 'as yet unclassified' }
Ventana >> cerrar [ 
self delete
]

{ #category : 'as yet unclassified' }
Ventana >> esNumero: unaCadena [


]

{ #category : 'as yet unclassified' }
Ventana >> initialize [

	super initialize.
	self color: (Color r: 0.06 g: 0.10 b: 0.17).
	self bounds: (self position extent: 1200 @ 600).

	min := BotonAccion2 new.
	botonCerrar := BotonAccion2 new.
	botonVolver := BotonAccion2 new.

	origen := self innerBounds origin.

	min position: origen + (1100 @ 20).
	min ponerIcono: 'C:\Users\Matu\Documents\Pharo\images\cosa-01\recursos\min.png'.

	botonCerrar position: origen + (1150 @ 20).
	botonCerrar ponerIcono: 'C:\Users\Matu\Documents\Pharo\images\cosa-01\recursos\salir.png'.

	botonVolver ponerIcono: 'C:\Users\Matu\Documents\Pharo\images\cosa-01\recursos\back.png'.
	botonVolver position: origen + (10 @ 20).

	self addMorph: botonCerrar.
	self addMorph: min.
	self addMorph: botonVolver.
	self changed.
	botonCerrar mouseAction: [ self cerrar ].
	min mouseAction: [ self minimizar ]
]

{ #category : 'as yet unclassified' }
Ventana >> minimizar [

	self collapse
]
