Class {
	#name : 'MudanzaInternacional',
	#superclass : 'Mudanza',
	#instVars : [
		'seguroInternacional',
		'valorTramite',
		'valorTransporte',
		'tipoTransporte'
	],
	#category : 'AAA Mudanza',
	#package : 'AAA Mudanza'
}

{ #category : 'as yet unclassified' }
MudanzaInternacional class >> crear: desc conNombre: nombre conValorBase: valorBase conValorAdicional: valorAdicional conDistanciaMax: distanciaMax conSeguro: unSeguro conValorDelTramite: unValor conValorDelTransporte: elValor conTipoTransporte: unTipo [
| mudanzaInternacional |

mudanzaInternacional := self new.
mudanzaInternacional iniciar: desc conNombre: nombre conValorBase: valorBase conValorAdicional: valorAdicional conDistanciaMax: distanciaMax conSeguro: unSeguro conValorDelTramite: unValor conValorDelTransporte: elValor conTipoTransporte: unTipo.

^ mudanzaInternacional 
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> calcularMonto [
^(valorTramite + valorTransporte )
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> devolverListaDatos [
| listado textoSeguro textoValorTramite textoValorTransporte textoTipo|
listado := super devolverListaDatos .
textoSeguro := 'seguro internacional:' asString , seguroInternacional asString.
textoValorTramite := 'valor del tramite: ' asString , valorTramite asString.
textoValorTransporte := 'valor del transporte:' asString , valorTransporte  asString.
textoTipo := 'tipo de transporte: ' asString , tipoTransporte asString.
listado add: textoSeguro  .
listado add: textoValorTramite  .
listado add: textoValorTransporte  .
listado add: textoTipo  .
^ listado
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> esInternacional [
^true
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> esLocal [
^false 
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> esNacional [
^false
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> iniciar: desc conNombre: unNombre conValorBase: unvalorBase conValorAdicional: unvalorAdicional conDistanciaMax: unadistanciaMax conSeguro: unSeguro conValorDelTramite: unValor conValorDelTransporte: elValor conTipoTransporte: unTipo [
self iniciar: desc conNombre: unNombre conValorBase: unvalorBase conValorAdicional: unvalorAdicional  yDistanciaMax: unadistanciaMax .
seguroInternacional := unSeguro .
valorTramite := unValor .
valorTransporte := elValor .
tipoTransporte := unTipo .
]

{ #category : 'initialization' }
MudanzaInternacional >> mostrarDatos [

	^ super mostrarDatos , ', seguro internacional:' asString
	  , seguroInternacional asString , ', valor del tramite:' asString
	  , valorTramite asString , ', valor del transporte: ' asString
	  , valorTransporte asString , ', tipo de transporte: ' asString
	  , tipoTransporte asString
	  , ', tipo: mudanza internacional |' asString
]

{ #category : 'accessing' }
MudanzaInternacional >> tipoTransporte: unTipo [
	tipoTransporte := unTipo
]

{ #category : 'as yet unclassified' }
MudanzaInternacional >> vefCancelacion: unaFecha [
|fecha|
fecha:= Date today.
^ unaFecha>fecha.
]

{ #category : 'initialization' }
MudanzaInternacional >> verificarTipoTransporte [

	^ tipoTransporte isNotNil.
]
