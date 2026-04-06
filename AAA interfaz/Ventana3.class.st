Class {
	#name : 'Ventana3',
	#superclass : 'Ventana',
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana3 >> crearCliente: miEmpresa yDni: nroDni [

	| botonConfirmacion bloqueNombre bloqueTelefono bloqueApellido bloqueCalle bloqueNumero bloquePiso bloqueDpto bloqueBarrio cuadroDatos tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	bloqueNombre := RubTextFieldMorph new.
	bloqueApellido := RubTextFieldMorph new.
	bloqueTelefono := RubTextFieldMorph new.
	bloqueCalle := RubTextFieldMorph new.
	bloqueNumero := RubTextFieldMorph new.
	bloquePiso := RubTextFieldMorph new.
	bloqueDpto := RubTextFieldMorph new.
	bloqueBarrio := RubTextFieldMorph new.
	cuadroDatos := TextMorph new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Crear Cliente'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (475 @ 55).
	
	"-------------------------------------Nombre-------------------------------------"
	
	bloqueNombre ghostText: 'Ingrese el nombre'.
	bloqueNombre position: origen + (175 @ 175).
	bloqueNombre extent: 200 @ 50.
	
	"-------------------------------------Apellido-------------------------------------"
	
	bloqueApellido ghostText: 'Ingrese el apellido'.
	bloqueApellido position: bloqueNombre position + (0 @ 75).
	bloqueApellido extent: 200 @ 50.

	"-------------------------------------Telefono-------------------------------------"
	
	bloqueTelefono ghostText: 'Ingrese el telefono'.
	bloqueTelefono position: bloqueApellido position + (0 @ 75).
	bloqueTelefono extent: 200 @ 50.

	"-------------------------------------Calle-------------------------------------"
	
	bloqueCalle ghostText: 'Ingrese la calle'.
	bloqueCalle position: bloqueTelefono position + (0 @ 75).
	bloqueCalle extent: 200 @ 50.
	
	"-------------------------------------Num calle-------------------------------------"
	
	bloqueNumero ghostText: 'Ingrese el Nro de calle'.
	bloqueNumero position: origen + (450 @ 175).
	bloqueNumero extent: 200 @ 50.

	"-------------------------------------Num piso-------------------------------------"
	
	bloquePiso ghostText: 'Ingrese el Nro de Piso'.
	bloquePiso position: bloqueNumero position + (0 @ 75).
	bloquePiso extent: 200 @ 50.

	"-------------------------------------Depto-------------------------------------"
	
	bloqueDpto ghostText: 'Ingrese el Nro de departamento'.
	bloqueDpto position: bloquePiso position + (0 @ 75).
	bloqueDpto extent: 200 @ 50.

	"-------------------------------------Barrio-------------------------------------"
	
	bloqueBarrio ghostText: 'Ingrese el barrio'.
	bloqueBarrio position: bloqueDpto position + (0 @ 75).
	bloqueBarrio extent: 200 @ 50.

	"-------------------------------------Datos-------------------------------------"
	
	cuadroDatos position: origen + (800 @ 200).
	cuadroDatos extent: 300 @ 400.
	cuadroDatos contents: ''.
	cuadroDatos color: Color white.

	"-------------------------------------Boton-------------------------------------"

	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570@500).

	botonConfirmacion mouseAction: [
		| datosCliente unaDireccion unCliente |
		((self tieneNumero: bloqueCalle) or: [
			 (self tieneLetra: bloqueNumero) or: [
				 (self tieneLetra: bloquePiso) or: [
					 (self tieneLetra: bloqueDpto) or: [
						 (self tieneNumero: bloqueBarrio) or: [
							 (self tieneNumero: bloqueNombre) or: [
								 (self tieneNumero: bloqueApellido) or: [
									 self tieneLetra: bloqueTelefono ] ] ] ] ] ] ])
			ifTrue: [
				UIManager default inform:
					'ERROR EN LOS DATOS O FALTAN DATOS EN LOS CAMPOS.' ]
			ifFalse: [
				unaDireccion := Direccion
					                crear: bloqueCalle text
					                numero: bloqueNumero text
					                piso: bloquePiso text
					                dpto: bloqueDpto text
					                barrio: bloqueBarrio text.
				unCliente := Cliente
					             iniciar: nroDni
					             nombre: bloqueNombre text
					             apellido: bloqueApellido text
					             telefono: bloqueTelefono text
					             direccion: unaDireccion.

				miEmpresa agregarCliente: unCliente.
				datosCliente := unCliente mostrarCliente.
				cuadroDatos contents:
					'Nombre: ' , bloqueNombre text asString , String cr
					, 'Apellido: ' , bloqueApellido text asString , String cr
					, 'Telefono: ' , bloqueTelefono text asString , String cr
					, 'Calle: ' , bloqueCalle text asString , String cr
					, 'Numero de Calle: ' , bloqueCalle text asString , String cr
					, 'Numero de Piso: ' , bloquePiso text asString , String cr
					, 'Numero de Departamento: ' , bloqueNumero text asString
					, String cr , 'Barrio: ' , bloqueBarrio text asString , String cr.

			] ].

	botonVolver mouseAction: [
		self cerrar.
		self verificarCliente: miEmpresa ].

	self addMorph: bloqueNombre.
	self addMorph: bloqueApellido.
	self addMorph: bloqueTelefono.
	self addMorph: bloqueCalle.
	self addMorph: botonConfirmacion.
	self addMorph: bloqueNumero.
	self addMorph: bloquePiso.
	self addMorph: cuadroDatos.
	self addMorph: bloqueDpto.
	self addMorph: bloqueBarrio.
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana3 >> tieneLetra: unaCadena [
    "si es vacia o tiene un letra devuelve true, si solo tiene numeros devuelve false"
    | valor |
    valor := (unaCadena text asString isEmpty or: [
                  unaCadena text asString isAllDigits not ])
                 ifTrue: [ true ]
                 ifFalse: [ false ].
    ^ valor
]

{ #category : 'as yet unclassified' }
Ventana3 >> tieneNumero: unaCadena [
    "si es vacia o tiene un numero devuelve true, si solo tiene digitos devuelve false"
    | valor |
    valor := (unaCadena text asString isEmpty or: [
                  unaCadena text asString anySatisfy: [ :char |
                      char isDigit ] ])
                 ifTrue: [ true ]
                 ifFalse: [ false ].
    ^ valor
]

{ #category : 'as yet unclassified' }
Ventana3 >> verificarCliente: miEmpresa [

	| bloqueDni botonConfirmacion unCliente tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	bloqueDni := RubTextFieldMorph new.
	
	"-------------------------------------Título-------------------------------------"
titulo := StringMorph contents: 'Verificar Cliente'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (475 @ 55).
	
	"-------------------------------------Dni-------------------------------------"

	bloqueDni ghostText: 'Ingrese el DNI'.
	bloqueDni position: titulo position + (-50 @ 250).
	bloqueDni extent: 300 @ 100.
	
	"-------------------------------------Boton-------------------------------------"

	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/buscar.png'.
	botonConfirmacion position: bloqueDni position + (320@0).

	botonConfirmacion mouseAction: [
		(bloqueDni text asString isEmpty or: [
			 bloqueDni text asString isAllDigits not ])
			ifTrue: [
			UIManager default inform: 'Ingrese un numero de DNI valido' ]
			ifFalse: [
				unCliente := miEmpresa buscarCliente: bloqueDni text asString.
				unCliente ifNotNil: [ UIManager inform: 'YA EXISTE UN CLIENTE CON ESTE NUMERO DE DNI: ' , bloqueDni text asString ] ifNil: [
					self crearCliente: miEmpresa yDni: bloqueDni text asString.
					self update: miEmpresa ] ] ].

	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].

	self addMorph: bloqueDni.
	self addMorph: botonConfirmacion.
	self openCenteredInWorld
]
