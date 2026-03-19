Class {
	#name : 'Ventana2',
	#superclass : 'Ventana',
	#instVars : [
		'duracion',
		'elementoSeleccionado'
	],
	#category : 'AAA interfaz',
	#package : 'AAA interfaz'
}

{ #category : 'as yet unclassified' }
Ventana2 >> crearServGuardamueble: miEmpresa [

| descripcion  cuadroCliente  botonConfirmacion  conLlave tieneAisl tamanio textLlave textAislamiento desc nomb tam llave ais valB unServicio textoError puedeCrear tituloPath tituloImage tituloMorph valorBase titulo|


	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	textoError:= StringMorph new.
	textoError contents: ''.
	descripcion := RubTextFieldMorph new.
	valorBase := RubTextFieldMorph new.
	conLlave := RubTextFieldMorph new.
	tieneAisl := RubTextFieldMorph new.
	cuadroCliente := RubTextFieldMorph new.
	tamanio := RubTextFieldMorph new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Crear Servicio'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (475 @ 55).

	"-------------------------------------Nombre-------------------------------------"
	
	cuadroCliente ghostText: 'nombre del servicio'.
	cuadroCliente position: origen + (250 @ 200).
	cuadroCliente extent: 200 @ 50.
	
	"-------------------------------------Descripcion-------------------------------------"
	
	descripcion ghostText: 'descripcion del servicio'.
	descripcion position: cuadroCliente position + (0 @ 100).
	descripcion extent: 200 @ 50.
	
	"-------------------------------------Valor-------------------------------------"
	
	valorBase ghostText: 'valor base del servicio'.
	valorBase position: descripcion position + (0 @ 100).
	valorBase extent: 200 @ 50.
	
	"-------------------------------------Llave-------------------------------------"
	
	conLlave ghostText: 'contiene llave para el particular'.
	conLlave position: origen + (720 @ 200).
	conLlave extent: 200 @ 50.
	
	textLlave := StringMorph contents: 'indique SI/NO'.
	textLlave  position: conLlave position + (220 @ 0).
	textLlave  color: Color white.
	
	"-------------------------------------Aislamiento-------------------------------------"
	
	tieneAisl  ghostText: 'contiene aislamiento'.
	tieneAisl  position: conLlave  position + (0 @ 100).
	tieneAisl  extent: 200 @ 50.
	
	textAislamiento := StringMorph contents: 'indique SI/NO'.
	textAislamiento  position: tieneAisl position + (220 @ 0).
	textAislamiento  color: Color white.
	
	"-------------------------------------Tamaño-------------------------------------"
	
	tamanio  ghostText: 'tamanio del guardamuebles'.
	tamanio  position: tieneAisl  position + (0 @ 100).
	tamanio  extent: 200 @ 50.
	
	"-------------------------------------Boton-------------------------------------"
	
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570@500).
		
	botonConfirmacion mouseAction: [
		desc:= descripcion text asString.
		ais := tieneAisl text asString.
		llave := conLlave text asString.
		tam := tamanio text asString.
		valB := valorBase text asString.
		nomb := cuadroCliente text asString.
				
				puedeCrear := (self tieneNumero: desc) 
    or: [ (self tieneNumero: ais) 
    or: [ (self tieneNumero: llave) 
    or: [ (self tieneLetra: tam) 
    or: [ (self tieneLetra: valB) 
    or: [ (self tieneNumero: nomb) ]]]]].
				(puedeCrear)
					 ifFalse:[
			
					"llamo a los metodos que crearan el servicio y luego lo agregaran a la lista de servicios existentes"
				unServicio := Guardamuebles descripcion: desc  nombre: nomb  valorBase: valB tamaño: tam aislamiento: ais guardaLLave: llave. 
				miEmpresa agregarServicio: unServicio .
				self update: miEmpresa.
				ventanaPrincipal iniciar: miEmpresa.
				self cerrar ]
			ifTrue:[
					textoError contents: 'FALTA RELLENAR CASILLA/S O ALGUN DATO ES INCORRECTO'.
					textoError position: tamanio position + (0 @ 30).
					textoError color: Color black.
				] ].
			  
	
	botonVolver mouseAction: [
		self cerrar.
		self registrarServicio: miEmpresa.
		 ].

	
	self addMorph: descripcion.
	self addMorph: cuadroCliente.
	self addMorph: valorBase.
	self addMorph: botonConfirmacion.
	self addMorph: conLlave .
	self addMorph: tieneAisl.
	self addMorph: tamanio.
	self addMorph: textLlave.
	self addMorph: textAislamiento.
	self addMorph: textoError.

	self openCenteredInWorld  
]

{ #category : 'as yet unclassified' }
Ventana2 >> crearServMudInt: miEmpresa [
| descripcion  cuadroCliente  botonConfirmacion  textPrincipal textoSeguro desc valB nomb unServMud adicAdu adicTipTrans incluySeg AAdu ATrans TSeg puedeCrear textoError valorBase tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	botonConfirmacion := BotonAccion2 new.
	textoError := StringMorph new.
	textoError contents: ''.
	
	descripcion := RubTextFieldMorph new.
	valorBase := RubTextFieldMorph new.
	cuadroCliente := RubTextFieldMorph new.
	 adicAdu := RubTextFieldMorph new .
	 adicTipTrans:= RubTextFieldMorph new.
	incluySeg := RubTextFieldMorph new.  
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Crear Servicio'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (475 @ 55).

	"-------------------------------------Nombre-------------------------------------"
	
	cuadroCliente ghostText: 'nombre del servicio'.
	cuadroCliente position: origen + (250 @ 200).
	cuadroCliente extent: 200 @ 50.
	
	"-------------------------------------Descripcion-------------------------------------"
	
	descripcion ghostText: 'descripcion del servicio'.
	descripcion position: cuadroCliente position + (0 @ 100).
	descripcion extent: 200 @ 50.
	
	"-------------------------------------Valor-------------------------------------"
	
	valorBase ghostText: 'valor base del servicio'.
	valorBase position: descripcion position + (0 @ 100).
	valorBase extent: 200 @ 50.
		
	"-------------------------------------Tramite-------------------------------------"
	
	adicAdu  ghostText: 'adicional por tramite aduanero'.
	adicAdu   position: origen + (720 @ 200).
	adicAdu   extent: 200 @ 50.
	
	"-------------------------------------Transporte-------------------------------------"
	
	adicTipTrans  ghostText: 'adicional por tipo de transporte'.
	adicTipTrans   position: adicAdu  position + (0 @ 100).
	adicTipTrans   extent: 200 @ 50.
	
	"-------------------------------------Seguro-------------------------------------"
	
	incluySeg   ghostText: 'incluye seguro internacional'.
	incluySeg   position: adicTipTrans position + (0 @ 100).
	incluySeg   extent: 200 @ 50.
	
	textoSeguro := StringMorph contents: 'Si/No'.
	textoSeguro  position: incluySeg position + (220 @ 0).
	textoSeguro  color: Color white.
	
	"-------------------------------------Boton-------------------------------------"
		
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570@500).
	
	botonConfirmacion mouseAction: [
		desc := descripcion text asString.
		valB := valorBase text asString .
		nomb := cuadroCliente text asString.		
		AAdu:= adicAdu   text asString.
		ATrans := adicTipTrans  text asString.
		TSeg:= incluySeg  text asString.
		
		
		puedeCrear := (self tieneNumero: desc) 
    or: [ (self tieneLetra: AAdu) 
    or: [ (self tieneLetra: ATrans) 
    or: [ (self tieneLetra: TSeg) 
    or: [ (self tieneLetra: valB) 
    or: [ (self tieneNumero: nomb) ]]]]].
				(puedeCrear) 
			ifFalse: [
					
				unServMud:= 	MudanzaInternacional crear: desc conNombre: nomb conValorBase: valB conValorAdicional: 0  conDistanciaMax: 0 conSeguro: TSeg  conValorDelTramite: adicAdu  conValorDelTransporte: ATrans   conTipoTransporte: 0. 
				miEmpresa agregarServicio: unServMud.
				self update: miEmpresa.
				ventanaPrincipal iniciar: miEmpresa.
				self cerrar ]
			ifTrue: [ 
						textoError contents: 'FALTA RELLENAR CASILLA/S O ALGUN DATO ES INCORRECTO'.
					textoError position: adicTipTrans  position + (0 @ 25).
					textoError color: Color black.
				 ] ].

	botonVolver mouseAction: [
		self cerrar.
		self registrarServicio: miEmpresa.
		 ].
	
	self addMorph: descripcion.
	self addMorph: cuadroCliente.
	self addMorph: valorBase.
	self addMorph: botonConfirmacion.
	self addMorph: adicAdu  .
	self addMorph: adicTipTrans  .
	self addMorph: incluySeg .
	self addMorph: textoSeguro.
	self addMorph: textoError.
	
	

	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana2 >> crearServMudLoc: miEmpresa [
| cuadroCliente  botonConfirmacion textoCarga  adicEmb  adicAlt  carga descarga distMax  desc valB nomb  dMax adEmb adAlt unServMud rCar rDesc textoDescarga puedeCrear textoError tituloPath tituloImage tituloMorph descripcion valorBase titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	botonConfirmacion := BotonAccion2 new.
	textoError := StringMorph new.
	textoError contents: ''.
	descripcion := RubTextFieldMorph new.
	valorBase := RubTextFieldMorph new.
	cuadroCliente := RubTextFieldMorph new.
	 adicEmb := RubTextFieldMorph new .
	adicAlt := RubTextFieldMorph new.
	descarga := RubTextFieldMorph new.  
	carga := RubTextFieldMorph new .
	 distMax := RubTextFieldMorph new.
	
	"-------------------------------------Título-------------------------------------"
	
titulo := StringMorph contents: 'Crear Servicio'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (475 @ 55).
	
	"-------------------------------------Nombre-------------------------------------"
	
	cuadroCliente ghostText: 'nombre del servicio'.
	cuadroCliente position: origen + (250 @ 175).
	cuadroCliente extent: 200 @ 50.
	
	"-------------------------------------Descripcion-------------------------------------"
	
	descripcion ghostText: 'descripcion del servicio'.
	descripcion position: cuadroCliente position + (0 @ 75).
	descripcion extent: 200 @ 50.
	
	"-------------------------------------Valor-------------------------------------"
	
	valorBase ghostText: 'valor base del servicio'.
	valorBase position: descripcion position + (0 @ 75).
	valorBase extent: 200 @ 50.
	
	"-------------------------------------Adicional Embalaje-------------------------------------"
	
	adicEmb  ghostText: 'adicional por embalaje'.
	adicEmb   position: valorBase position + (0 @ 75).
	adicEmb   extent: 200 @ 50.
	
	"-------------------------------------Adicional Altura-------------------------------------"
	
	adicAlt  ghostText: 'adicional por altura'.
	adicAlt   position: origen + (720 @ 175).
	adicAlt   extent: 200 @ 50.
	
	"-------------------------------------Adicional Carga-------------------------------------"
	
	carga   ghostText: 'se debe realizar la carga'.
	carga   position: adicAlt position + (0 @ 75).
	carga   extent: 200 @ 50.
	
	textoCarga := StringMorph contents: 'Si/No'.
	textoCarga position: carga position + (220 @ 0).
	textoCarga color: Color white.
	
	"-------------------------------------Adicional Descarga-------------------------------------"
	
	descarga   ghostText: 'se debe realizar la descarga'.
	descarga position: carga position + (0 @ 75).
	descarga extent: 200 @ 50.
	
	textoDescarga := StringMorph contents: 'Si/No'.
	textoDescarga position: descarga position + (220 @ 0).
	textoDescarga color: Color white.
	
	"-------------------------------------Distancia max-------------------------------------"
	
	distMax   ghostText: 'distancia maxima del transporte'.																	  	distMax	position: descarga  position + (0 @ 75).
	distMax  extent: 200 @ 50.
	
	"-------------------------------------Boton-------------------------------------"
		
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570@500).
	
	botonConfirmacion mouseAction: [
		desc := descripcion asString.
		valB := valorBase text asString .
		nomb := cuadroCliente text asString.		
		rCar:= carga  text asString.
		 dMax := distMax text asString.
		adEmb:= adicEmb text asString.
		adAlt := adicAlt text asString.
		rDesc:= descarga text asString.
		
		puedeCrear := (self tieneNumero: desc) 
    or: [ (self tieneNumero: rCar ) 
    or: [ (self tieneLetra: dMax) 
    or: [ (self tieneLetra: adEmb) 
    or: [ (self tieneLetra: valB) 
    or: [ (self tieneNumero: nomb)
	  or: [ (self tieneLetra:  adAlt )
		 or: [ (self tieneNumero: rDesc )
	 ]]]]]]].
				(puedeCrear)
			ifFalse: [
					"los valores con 0 es porque en la creacion del objeto esos parametros son     					innecesarios"
				unServMud:= 	MudanzaLocal crear: desc conNombre: nomb conValorBase: valB 				conValorAdicional: adEmb  conDistanciaMax: dMax conDistancia: 0  realizarCarga: rCar  				realizarDescarga: rDesc.
				miEmpresa agregarServicio: unServMud.
				self update: miEmpresa.
				ventanaPrincipal iniciar: miEmpresa.
				self cerrar ]
			ifTrue: [ 
						textoError contents: 'FALTA RELLENAR CASILLA/S O ALGUN DATO ES INCORRECTO'.
					textoError position: adicAlt  position + (0 @ 30).
					textoError color: Color black.
				 ] ].

	botonVolver mouseAction: [
		self cerrar.
		self registrarServicio: miEmpresa.
		 ].
	
	self addMorph: descripcion .
	self addMorph: cuadroCliente.
	self addMorph: valorBase.
	self addMorph: botonConfirmacion.
	self addMorph: adicEmb .
	self addMorph: adicAlt .
	self addMorph: carga.
	self addMorph: descarga.
	self addMorph: distMax.
	self addMorph: textoCarga.
	self addMorph: textoDescarga.
	self addMorph: textoError.
	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana2 >> crearServMudNac: miEmpresa [
| descripcion  cuadroCliente  botonConfirmacion textLlave  adicEmb  adicAlt capacidad  intOExt  adicMercFrag adic50kmPasad distMax  desc valB nomb tam intoEx aMerFr ad50km dMax adEmb adAlt unServMud puedeCrear textoError valorBase tituloPath tituloImage tituloMorph titulo|
	
	"-------------------------------------Inicializar-------------------------------------"
	
	self initialize.
	ventanaPrincipal := VentanaPrincipal new.
	botonConfirmacion := BotonAccion2 new.
	
	textoError:= StringMorph new.
	textoError contents: ''.
	descripcion := RubTextFieldMorph new.
	valorBase := RubTextFieldMorph new.
	cuadroCliente := RubTextFieldMorph new.
	 adicEmb := RubTextFieldMorph new .
	adicAlt := RubTextFieldMorph new.
	capacidad := RubTextFieldMorph new.  
	intOExt := RubTextFieldMorph new .
	adicMercFrag := RubTextFieldMorph new. 
	adic50kmPasad := RubTextFieldMorph new.
	 distMax := RubTextFieldMorph new.
	
	"-------------------------------------Título-------------------------------------"
titulo := StringMorph contents: 'Crear Servicio'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (475 @ 55).
	
	"-------------------------------------Nombre-------------------------------------"
	
	cuadroCliente ghostText: 'nombre del servicio'.
	cuadroCliente position: origen + (250 @ 175).
	cuadroCliente extent: 200 @ 50.
	
	"-------------------------------------Descripcion-------------------------------------"
	
	descripcion ghostText: 'descripcion del servicio'.
	descripcion position: cuadroCliente position + (0 @ 60).
	descripcion extent: 200 @ 50.
	
	"-------------------------------------Valor-------------------------------------"
	
	valorBase ghostText: 'valor base del servicio'.
	valorBase position: descripcion position + (0 @ 60).
	valorBase extent: 200 @ 50.
	
	"-------------------------------------Adicional Embalaje-------------------------------------"
	
	adicEmb  ghostText: 'adicional por embalaje'.
	adicEmb   position: valorBase position + (0 @ 60).
	adicEmb   extent: 200 @ 50.
	
	"-------------------------------------Adicional Altura-------------------------------------"
	
	adicAlt  ghostText: 'adicional por altura'.
	adicAlt   position: adicEmb position + (0 @ 60).
	adicAlt   extent: 200 @ 50.
	
	"-------------------------------------Interior/exterior-------------------------------------"
		
	intOExt   ghostText: 'interior o exterior de CABA'.
	intOExt   position: origen  + (720 @ 175).
	intOExt   extent: 200 @ 50.
	
	textLlave := StringMorph contents: 'coloque "interior"/"exterior"'.
	textLlave  position: intOExt position + (220 @ 0).
	textLlave  color: Color white.
	
	"-------------------------------------Adicional Fragil-------------------------------------"
	
	adicMercFrag   ghostText: 'adicional por mercaderia fragil'.
	adicMercFrag   position: intOExt position + (0 @ 60).
	adicMercFrag   extent: 200 @ 50.
	
	"-------------------------------------Distancia max-------------------------------------"
	
	distMax   ghostText: 'distancia maxima del transporte'.																	  	distMax	position: adicMercFrag position + (0 @ 60).
	distMax  extent: 200 @ 50.
	
	"-------------------------------------Capacidad-------------------------------------"
	
	capacidad   ghostText: 'capacidad del transporte'.
	capacidad   position: distMax position + (0 @ 60).
	capacidad   extent: 200 @ 50.
	
	"-------------------------------------Adicional Pasado-------------------------------------"
	
	adic50kmPasad   ghostText: 'adicional por cada 50km pasado de lo arcodado'.
	adic50kmPasad   position: capacidad position + (0 @ 60).
	adic50kmPasad   extent: 200 @ 50.
	
	"-------------------------------------Boton-------------------------------------"
		
	botonConfirmacion := BotonAccion2 new.
	botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	botonConfirmacion position: origen + (570@500).
	
	botonConfirmacion mouseAction: [
		desc := descripcion text asString.
		valB := valorBase text asString .
		nomb := cuadroCliente text asString.		
		intoEx:= intOExt text asString.
		aMerFr := adicMercFrag text asString . 
		ad50km:= adic50kmPasad text asString.
		 dMax := distMax text asString.
		adEmb:= adicEmb text asString.
		adAlt := adicAlt text asString.
		tam:= 0.
			
			puedeCrear := (self tieneNumero: desc) 
    or: [ (self tieneNumero: intoEx  ) 
    or: [ (self tieneLetra: dMax) 
    or: [ (self tieneLetra: adEmb) 
    or: [ (self tieneLetra: valB) 
    or: [ (self tieneNumero: nomb)
	  or: [ (self tieneLetra:  adAlt )
		 or: [ (self tieneLetra: aMerFr  )
			or: [ (self tieneLetra: ad50km   )
	 ]]]]]]]].
				(puedeCrear)
		
			ifFalse: [
					
				unServMud:= 	MudanzaNacional crear: desc conNombre: nomb conValorBase: valB 				conValorAdicional: adEmb conDistanciaMax: ad50km   salida: intoEx  valorMercaderiaFragil: 				aMerFr   valorDistancia: dMax.
				miEmpresa agregarServicio: unServMud.
				self update: miEmpresa.
				ventanaPrincipal iniciar: miEmpresa.
				self cerrar ]
			ifTrue: [
						textoError contents: 'FALTA RELLENAR CASILLA/S O ALGUN DATO ES INCORRECTO'.
					textoError position: adicAlt  position + (0 @ 30).
					textoError color: Color black.
				  ] ].

	botonVolver mouseAction: [
		self cerrar.
		self registrarServicio: miEmpresa.
		 ].
	
	self addMorph: descripcion.
	self addMorph: cuadroCliente.
	self addMorph: valorBase.
	self addMorph: botonConfirmacion.
	self addMorph: adicEmb .
	self addMorph: adicAlt .
	self addMorph: adicMercFrag .
	self addMorph: adic50kmPasad.
	self addMorph: intOExt.
	self addMorph: distMax.
	self addMorph: textLlave.
	self addMorph: capacidad.
	self addMorph: textoError.

	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana2 >> registrarServicio: miEmpresa [

	| contratos items botonConfirmacion  textoError tituloPath tituloImage tituloMorph tituloPath2 tituloImage2 tituloMorph2 titulo titulo2|
	self initialize.
	
	textoError := StringMorph new.
	textoError contents: ''.
	ventanaPrincipal := VentanaPrincipal new.
	
titulo := StringMorph contents: 'Crear Servicio'.
titulo color: Color white.
titulo font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 28).
titulo emphasis: 1.

self addMorph: titulo.
titulo position: origen + (470 @ 55).


titulo2 := StringMorph contents: 'Seleccion de tipo de contrato'.
titulo2 color: Color white.
titulo2 font: (LogicalFont familyName: 'Bitmap DejaVu Sans' pointSize: 22).
titulo2 emphasis: 1.

self addMorph: titulo2.
titulo2 position: origen + (420 @ 250).
	contratos := DropListMorph new.
	items := #( 'guardaMueble' 'mudanzaLocal' 'mudanzaNacional'
	            'mudanzaInternacional' ).
	contratos list: items.
	botonConfirmacion := BotonAccion2 new.
	
	botonConfirmacion label: 'confirmar servicio'. botonConfirmacion ponerIcono: 'pharo-local/iceberg/MatuSalab/TPPoo/recursos/confirmar_servicio.png'.
	
	contratos extent: 300 @ 30.
	contratos position: origen + (450 @ 300).
	
	botonConfirmacion position: origen + (550 @ 450).


	botonConfirmacion mouseAction: [
		elementoSeleccionado := contratos selectedItem.
		elementoSeleccionado
			ifNil: [
				textoError contents: 'USTED NO SELECCIONO NINGUN TIPO DE SERVICIO'.
				textoError position: contratos position + (-50 @ 40).
				textoError color: Color black ]
			ifNotNil: [
				self cerrar.
				elementoSeleccionado = 'guardaMueble' ifTrue: [
					self crearServGuardamueble: miEmpresa.
					self update: miEmpresa ].

				elementoSeleccionado = 'mudanzaLocal' ifTrue: [
					self crearServMudLoc: miEmpresa.
					self update: miEmpresa ].


				elementoSeleccionado = 'mudanzaNacional' ifTrue: [
					self crearServMudNac: miEmpresa.
					self update: miEmpresa ].

				elementoSeleccionado = 'mudanzaInternacional' ifTrue: [
					self crearServMudInt: miEmpresa.
					self update: miEmpresa ] ] ].


	botonVolver mouseAction: [
		ventanaPrincipal iniciar: miEmpresa.
		self cerrar ].

	self addMorph: contratos.

	self addMorph: botonConfirmacion.
	self addMorph: textoError.

	self openCenteredInWorld
]

{ #category : 'as yet unclassified' }
Ventana2 >> tieneLetra: unaCadena [
	"si es vacia o tiene un letra devuelve true, si solo tiene numeros devuelve false"
	| valor |
	valor := (unaCadena  isEmpty or: [
		          unaCadena  isAllDigits not ])
		         ifTrue: [ true ]
		         ifFalse: [ false ].
	^ valor
]

{ #category : 'as yet unclassified' }
Ventana2 >> tieneNumero: unaCadena [
	"si es vacia o tiene un numero devuelve true, si solo tiene digitos devuelve false"
	| valor |
	valor := (unaCadena  isEmpty or: [
		          unaCadena  anySatisfy: [ :char |
			          char isDigit ] ])
		         ifTrue: [ true ]
		         ifFalse: [ false ].
	^ valor
]
