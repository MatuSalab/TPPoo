Class {
	#name : 'VentanaEmergente',
	#superclass : 'BorderedMorph',
	#instVars : [
		'window'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
VentanaEmergente class >> crear [

	| instance |
	instance := self new.
]

{ #category : 'as yet unclassified' }
VentanaEmergente class >> crear: texto [

	| instance |
	instance := self new.
	instance initialize: texto
]

{ #category : 'initialization' }
VentanaEmergente >> iniciar: unTexto [

	super initialize.
	window := SystemWindow new model: self.
	window setLabel: unTexto .
	^ window
]

{ #category : 'initialization' }
VentanaEmergente >> initialize [

	super initialize.
	window := SystemWindow labelled: 'nueva ventana'.
	^ window
]

{ #category : 'initialization' }
VentanaEmergente >> initialize: unTexto [

		super initialize.
	window := SystemWindow labelled: 'a'.
	window openInWorld.
	^ window
]
