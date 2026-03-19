Class {
	#name : 'BotonAccion2',
	#superclass : 'SimpleButtonMorph',
	#instVars : [
		'bloque',
		'contenedor'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
BotonAccion2 >> mouseAction: unBloque [
"Se guarda en la variable bloque el bloque que se recibe como parámetro, que indica que acción se ejecutará cuando haya una acción sobre el mouse. Al utilizarlo en conjunto con
FechaVisual las acciones posibles son incrementar y decrementar aplicados sobre una instancia de FechaModelo, y como se indica en el método initialize de FechaVisual, unBloque se instancia con [miFecha incrementar:10] y [miFecha decrementar:2]"
^bloque := unBloque.

]

{ #category : 'as yet unclassified' }
BotonAccion2 >> mouseUp: unEvento [
	"Este método se ejecuta cuando se produce un evento, como un click sobre el mouse y su
liberación. Como mouseAction mantiene un bloque, se le envia el mensaje value para que se
ejecuten las acciones indicadas en el bloque."

	super mouseUp: unEvento.
	bloque value
]

{ #category : 'as yet unclassified' }
BotonAccion2 >> ponerIcono: unaRuta [
  | form icon |
  form := PNGReadWriter formFromFileNamed: unaRuta.
  icon := ImageMorph new image: form.
  icon lock.  "para que no se pueda agarrar"
  self addMorphCentered: icon.
  "self extent: icon extent + (10@10).  "
]
