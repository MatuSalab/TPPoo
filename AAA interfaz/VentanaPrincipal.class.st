Class {
	#name : 'VentanaPrincipal',
	#superclass : 'Ventana',
	#instVars : [
		'boton1',
		'boton2',
		'boton3',
		'boton4',
		'boton5',
		'boton6',
		'boton7',
		'boton8',
		'boton9',
		'mensaje',
		'listaContratos',
		'listaServicios'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
VentanaPrincipal >> actualizarMensaje: unMensaje [
mensaje := unMensaje .
]

{ #category : 'as yet unclassified' }
VentanaPrincipal >> añadir: aString [

	self addMorph: aString
]

{ #category : 'as yet unclassified' }
VentanaPrincipal >> iniciar: miEmpresa [

	| listContratos listServicios |
	self initialize.

	listContratos := miEmpresa devolverDatosContratos.
	listServicios := miEmpresa devolverDatosServicios.
	listaContratos := PluggableListMorph
		                  on: listContratos
		                  list: #yourself
		                  selected: nil
		                  changeSelected: nil.
	listaServicios := PluggableListMorph
		                  on: listServicios
		                  list: #yourself
		                  selected: nil
		                  changeSelected: nil.
	listaContratos extent: 300 @ 150.
	listaContratos position: origen + (820 @ 120).
	listaServicios extent: 300 @ 150.
	listaServicios position: origen + (820 @ 320).

	"Aqui se indica cual será la acción que se ejecutará cuando haya alguna acción del mouse sobre
cada botón"
	boton1 mouseAction: [
		ventana1 registrarContrato: miEmpresa.
		ventana1 position: self position.
		self cerrar ].
	
	boton2 mouseAction: [
		ventana2 registrarServicio: miEmpresa.
		ventana2 position: self position.
		self cerrar ].
	
		boton3  mouseAction: [
		ventana3  verificarCliente: miEmpresa.
		ventana3  position: self position.
		self cerrar ].
	
	boton4 mouseAction: [
		ventana4 buscarContrato: miEmpresa.
		ventana4 position: self position.
		self cerrar ].
	
	boton5 mouseAction: [
		ventana5 buscarContratoMudanza: miEmpresa.
		ventana5 position: self position.
		self cerrar ].

		boton6  mouseAction: [
		ventana6  cancelarContrato: miEmpresa.
		ventana6  position: self position.
		self cerrar ].
	
	boton7 mouseAction: [
		ventana7 mostrarContrato: miEmpresa.
		ventana7 position: self position.
		self cerrar ].
	
	boton8 mouseAction: [
		ventana8 mostrarListadoDeContratoSemanal: miEmpresa.
		ventana8 position: self position.
		self cerrar ].
	botonVolver delete.
	
	boton9 mouseAction: [
		ventana9 buscarContratoMudanza: miEmpresa .
		ventana9 position: self position.
		self cerrar ].
	botonVolver delete.
	
	
	botonCerrar mouseAction: [ self cerrar ].
	min mouseAction: [ self minimizar ].
	miEmpresa addDependent: self.
	self update: miEmpresa.
	self addMorph: listaContratos.
	self addMorph: listaServicios.
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
VentanaPrincipal >> initialize [
	"este método se ejecuta despues de iniciar"

	| tamañoBoton tituloPath tituloImage tituloMorph|
	
	super initialize.
	tituloPath := 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/cartel.png' asFileReference.
	tituloImage := PNGReadWriter formFromFileNamed: tituloPath fullName.
	tituloMorph := ImageMorph new image: tituloImage.
	self addMorph: tituloMorph. tituloMorph position: origen + (350@20).
	
	
	
	"Se crean los elementos gráficos (morphs) que se utilizarán para visualizar de distinta forma la
fecha contenida en la variable miFecha que referencia al modelo"
	boton1 := BotonAccion2 new. boton1 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton1.png'.
	boton2 := BotonAccion2 new. boton2 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton2.png'.
	boton3 := BotonAccion2 new. boton3 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton3.png'.
	boton4 := BotonAccion2 new. boton4 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton4.png'.
	boton5 := BotonAccion2 new. boton5 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton5.png'.
	boton6 := BotonAccion2 new. boton6 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton6.png'.
	boton7 := BotonAccion2 new. boton7 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton7.png'.
	boton8 := BotonAccion2 new. boton8 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton9.png'.
	boton9 := BotonAccion2 new.
boton9 ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/boton10.png'.
	
	
	botonCerrar := BotonAccion2 new. botonCerrar ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/salir.png'.
	min := BotonAccion2 new. min ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/min.png'.
	
	self addMorph: boton1.
	self addMorph: boton2.
	self addMorph: boton3.
	self addMorph: boton4.
	self addMorph: boton5.
	self addMorph: boton6.
	self addMorph: boton7.
	self addMorph: boton8.
	self addMorph: boton9.
	
	"Se posicionan los elementos gráficos dentro del área de VentanaPrincipal"
	origen := self innerBounds origin.
	
	boton1 position: origen + (150 @ 150).
	boton2 position: origen + (400 @ 150).
	boton3 position: origen + (650 @ 150).
	boton4 position: origen + (150 @ 300).
	boton5 position: origen + (400 @ 300).
	boton6 position: origen + (650 @ 300).
	boton7 position: origen + (150 @ 450).
	boton8 position: origen + (400 @ 450).
	boton9 position: origen + (650 @ 450).

	ventana1 := Ventana1 new.
	ventana2 := Ventana2 new.
	ventana3 := Ventana3 new.
	ventana4 := Ventana4 new.
	ventana5 := Ventana5 new.
	ventana6 := Ventana6 new.
	ventana7 := Ventana7 new.
	ventana8 := Ventana8 new.
	ventana9 := Ventana9 new.
	
]
