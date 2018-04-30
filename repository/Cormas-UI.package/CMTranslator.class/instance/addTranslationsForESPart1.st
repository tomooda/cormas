accessing
addTranslationsForESPart1
	" See superimplementor's comment "

	^ (self translatorClass forLanguage: #ES) translationMap 
		at: #tVersionName 						put: 'Versión';
		at: #tCreationDate 					put: 'Fecha de creación';
		at: #tModelComments 					put: 'Comentarios';	
		at: #tModelRename 						put: 'El modelo fue renombrado como {1}.
Una nueva categoría de clase fue creada y todas las clases del modelo anterior fueron copiadas.

Le recomendamos que:
- Guarde y recargue este modelo, y luego
- Copie los directorios requeridos (Mapas, Datos, ...) de {2} a {1}
';								
		at: #tCreateNewModel 					put: 'Cree un nuevo modelo!!';
		at: #tCreateEntityKind 				put: 'Crear un nuevo tipo de Entidad';
		at: #tCreateAgent 						put: 'Crear un tipo de Agente';
		at: #tCommunication 					put: 'Comunicación';
		at: #tGroup 								put: 'Grupo';
		at: #tLocation 							put: 'Ubicación';												
		at: #tElement 							put: 'Elemento';
		at: #tSimpleCell 						put: 'Célula Simple';
		at: #tCellularAutomaton 				put: 'Autómata Celular';
		at: #tAggregate 						put: 'Agrupado';
		at: #tSetNotConnex 					put: 'No connex';
		at: #tName 								put: 'Nombre';
		at: #tDefineEntities 					put: 'Definir las entidades';
		at: #tAbstract 							put: 'Abstracta / No abstracta';
		at: #tSpatial 							put: 'Espacial';
		at: #tSocial 							put: 'Social';
		at: #tPassive 							put: 'Pasiva';
		at: #tProgrammingEntityClass		put: 'la clase de cada Entidad...';
		at: #tSimOrganization 				put: 'la Organización de la simulación...';	
		at: #tObserver 							put: 'el Observador...';
		at: #tMessages 							put: 'Mensajes';
		at: #tProbes 							put: 'Probes';
		at: #tInitInstantiation 				put: 'la instanciación inicial';
		at: #tScheduler 						put: 'el planificador';
		at: #tSpaceEntities 					put: 'Espacio y Entidades';
		at: #tEdit 								put: 'Editar';
		at: #tSpecialize						put: 'Especializar';
		at: #tAttributes 						put: 'Atributos';
		at: #tMethods 							put: 'Métodos';
		at: #tActivityDiagrams 				put: 'Diagramas de actividad';
		at: #tPoVSetter 						put: 'Configuración PoV';
		at: #tObject  							put: 'Object';
		at: #tObjectHelp 						put: 'Una entidad pasiva';									
		at: #tLocatedObject 					put: 'Objeto Situado';
		at: #tLocatedObjectHelp 				put: 'Una entidad pasiva situada en una celda/célula';							
		at: #tNetworkNode 						put: 'Nodo de Red';
		at: #tNetworkNodeHelp 				put: 'Un Nodo de una Red situado en una Célula';								
		at: #tNetworkArc 						put: 'Arco de Red';
		at: #tNetworkArcHelp 					put: 'Un Arco de una Red situado en 2 Células';
		at: #tFullNetwork 						put: 'Red Completa';
		at: #tFullNetworkHelp 				put: 'Una Red compuesta de un Conjunto de Arcos y Nodos';
		at: #tMessage 							put: 'Mensaje';
		at: #tMessageHelp 						put: 'Mensaje para un AgentCommunication (con mailbox)';
		at: #tRemove 							put: 'Eliminar';	
		at: #tEditActivityDiagrams 			put: 'editar diagramas de actividad';
		at: #tEditAttributes 					put: 'editar atributos';
		at: #tEditInit 							put: 'editar inicialización';
		at: #tEditSteps 						put: 'editar pasos';
		at: #tMissingClassName 				put: 'Por favor ingrese un nombre para la nueva clase!!';
		at: #tAlreadyUsed 						put: 'Ya está en uso!!';
		at: #tWhichModel 						put: '¿Qué Modelo?';
		at: #tVisualization 					put: 'Visualización';
		at: #tProgramming 						put: 'Programación';
		at: #tSimulation 						put: 'Simulación';
		at: #tEnterClassName 					put: 'Por favor ingrese un nombres para la nueva clase!';
		at: #tSpatialEntityCellHelp 		put: 'SpatialEntityCell: la célula es la entidad básica del espacio (como Autómata Celular)';
		at: #tSimpleCellHelp 					put: 'SpatialEntityElement es la entidad Célula básica';
		at: #tSpatialEntityHelp 				put: 'SpatialEntityAggregate está compuesto de células conectadas';
		at: #tSetNotConnexHelp 				put: 'SpatialEntityNotConnex está compuesto de agreggates o células desconectadas';
		at: #tCellAutomatonHelp 				put: 'El autómata celular es útil para dinámicas entre células';
		at: #tOATPredefValues 				put: 'Predefinido por lista de valores';
		at: #tOATSeqValues 					put: 'Valores secuenciales';						
		at: #tCrossedPredefValues 			put: 'Predefinido por lista de valores';						
		at: #tCrossSeqValues 					put: 'Valores secuenciales';
		at: #tCrossSensAnalysis 				put: 'Análisis de Sensitividad Cruzado';
		at: #tDisplayParams 					put: 'Visualizar parámetros';
		at: #tOATSensAnalysis 				put: 'Análisis de Sensitividad OAT';
		at: #tSimpleStochAnalysis 			put: 'Análisis Estocástico Simple';
		at: #tMonteCarlo 						put: 'Monte Carlo';
		at: #tClassifyByParams 				put: 'Classify by parameters';
		at: #tSimInformation 					put: 'Información de Simulación';
		at: #tSimInterface 					put: 'Interface de Simulación';
		at: #tStartRWebService 				put: 'Arrancar Servicio Web para R';
		at: #tStopRWebService 				put: 'Detener Servicio Web para R';
		at: #tAnalysis 							put: 'Análisis';
		at: #tCreateInstances 				put: 'Crear Instancias';
		at: #tOpenPharoMenu 					put: 'Abrir Menú de Pharo';
		at: #tManipulateInstances 			put: 'Manipular Instancias';
		at: #tModelGlossary 					put: 'Glosario de Modelo';
		at: #tModelListing 					put: 'Listado de Modelo como archivo de texto';
		at: #tPackageClient 					put: 'Empaquetar cliente';
		at: #tSpace 								put: 'Espacio';
		at: #tDisplayModelVersions 			put: 'Visualizar versiones de modelo';
		at: #tSnapshot 							put: 'Guardar estado actual';
		at: #tModifiedModelName 				put: 'El nombre ha sido renombrado como ';
		at: #tDisplayLegends 					put: 'Mostrar Leyendas';
		at: #tPhoto 								put: 'Foto';
		at: #tVideo 								put: 'Video';
		at: #tClickTo 							put: 'Clickear...';
		at: #tHabitus 							put: 'Habitus';
		at: #tUnmoveableZoom 					put: 'Zoom no movible';
		at: #tMoveableZoom						put: 'Zoom movible';
		at: #tSetTrackLength					put: 'Configurar pista';
		at: #tEnableUndoRedo					put: 'Habilitar hacer/deshacer...';
		at: #tTouchpad 							put: 'Modo de manipulación touchpad';
		at: #tEnvironment 						put: 'Ambiente';
		at: #tGridSize 							put: 'Tamaño de grilla';
		at: #tLoad 								put: 'Cargar';
		at: #tModify 							put: 'Modificar';
		at: #tReOpen 							put: 'Recargar';
		at: #tPoV 								put: 'PoV';
		at: #tAttribute 						put: 'Atributo';
		at: #tClassVariable 					put: 'Variable de clase';
		at: #tAttributesSuperLabel 			put: 'Atributos y Variables de clase de las superclases';
		at: #tAttributesTargetLabel 		put: 'Atributos y Variables de clase de la clase destino';
		at: #tReset 								put: 'Resetear';
		at: #tApply 								put: 'Aplicar';	
		at: #tEnterAttName 					put: 'Ingrese el nombre del atributo (sin espacios, números o símbolos)';
		at: #tAppTitle 							put: 'CORMAS';
		at: #tInvalidName 						put: ' no es un nombre válido. Por favor, ingrese un nombre válido';
		at: #tHelpAddInstAtt 					put: 'Agregar un nuevo atributo a la clase destino';
		at: #tHelpRemoveInstAtt 				put: 'Eliminar un atributo de la clase destino';
		at: #tHelpAddClassAttr				put: 'Agregar un nuevo atributo de clase a la clase destino';
		at: #tHelpRemoveClassAtt 			put: 'Eliminar un atributo de clase de la clase destino';
		at: #tClassEditor 						put: 'UML - Editor de Clases';																																				
		yourself