"
Code generator for CORMAS 

"
Class {
	#name : #CGStCormas,
	#superclass : #CGStTemplate,
	#instVars : [
		'cormasModel'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #'instance creation' }
CGStCormas class >> for: aCMProjectModel [
	" Answer a new instance of the recever "
	
	^ self new 
		cormasModel: aCMProjectModel;
		yourself
]

{ #category : #'code-generation' }
CGStCormas >> addNewClassType: aType inheritingFrom: aSuperclass name: aName initProtocol: createInit stepProtocol: createStep [

	| selector |
	
	[ self 
		generateClass: aName asValidCormasClassName 
		superclass: aSuperclass ]
	on: CircularHierarchyError
	do: [ : ex | ^ self inform: 'Trying to build a circular hierarchy' ].
	selector := (aType asLowercase , 'Classes') asSymbol.
	(self cormasModelClass perform: selector) add: self targetClass.
	(self targetClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [ self cormasModelClass cellClass: self targetClass ].
	self createModelAccessors.
	self addProtocolNamed: #control.
	createInit
		ifTrue: [ self createInit ].
	createStep
		ifTrue: [ self createStep ].	"self modifyEntityClassType: aType."
	^ self targetClass
]

{ #category : #'mustache-templates' }
CGStCormas >> buildContext [
	" Private - Build Mustache context "

	^ Dictionary new
		at: 'povAttribute' put: self buildPovAttribute;
		yourself.
]

{ #category : #accessing }
CGStCormas >> confirmIsAbstractClass: aClass [

	^ self confirm: (String streamContents: [ : stream | 
		stream 
			<< 'Is ';
			<< aClass name asText;
			<< ' an Abstract class?';
			cr; cr;
			<< ' (an abstract class does not have instance and must have subclasses, while';
			cr;
			<< ' a concret class will have instances and ';
			<< self cormasModelClass name;
			<< ' will define an attribut called ';
			<< aClass asGetterForEntityClass;
			<< ').' ]).
]

{ #category : #accessing }
CGStCormas >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CGStCormas >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #accessing }
CGStCormas >> cormasModelClass [

	^ self cormasModel cormasModelClass

	
]

{ #category : #'code-generation' }
CGStCormas >> createInit [
	
	self targetClass
		compile: 'init\	"to be completed"\' withCRs
		classified: 'init'
		notifying: nil
]

{ #category : #'code-generation' }
CGStCormas >> createInstancesAccessorsForClass: aClass [
	| pop |
	
	pop := aClass asGetterForEntityClass.
	aClass isAbstract
		ifTrue: [ self targetClass compile:
					(pop
						,
							'\	"Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel.\'
						, Cormas automaticCommentString
						, ' "\\   ^self allTheEntities: ' , aClass name asString)
						withCRs
				classified: 'accessing'
				notifying: nil ]
		ifFalse: [ (self targetClass hasInstVarNamed: pop)
				ifFalse: [ self targetClass addInstVarNamed: pop ].
			self createReaderAccessor: aClass.
			self createSetterAccessor: aClass ]
]

{ #category : #'code-generation' }
CGStCormas >> createModelAccessors [
	"ask if newClass is Abstract, 
	no, then creates the attribut 'theNewClasss' and the accesors at the level of cormasModel,
	yes, then creates an accessing methods 'theNewClasss' that will returns a collection of all entities of newClass and its subclasses"
	
	(self targetClass inheritsFrom: CMSpatialEntityElement)
		ifTrue: [ self installConcreteMethod ]
		ifFalse: [
			(self confirmIsAbstractClass: self targetClass) 
				ifTrue: [ self installAbstractMethod ] ].
	self createInstancesAccessorsForClass: self targetClass.
]

{ #category : #'mustache-templates' }
CGStCormas >> createPovOnAttribute [
	" Generate code String for #initializeWidgets "

	^ (MustacheTemplate on: self templateForPovOnAttribute) value: self buildContext.
]

{ #category : #'code-generation' }
CGStCormas >> createReaderAccessor: aClass [
	"creates a reader accessor that returns a Collection. 
aClassName = <String> or <Symbol>.

Ex: #theXXXs 
	''Returns a collection of all the instances of the classe collected by cormasModel.
	!! This method was automatically generated by Cormas !!''
^ theXXXifNil:[theXXX := OrderedCollection new]."

	| pop |
	
	pop := aClass asGetterForEntityClass.
	self targetClass compile:
			(pop
				,
					'\	"Returns a collection of all the instances of the sub classes collected by cormasModel.\'
				, Cormas automaticCommentString , '"	^' , pop , ' ifNil: [ ' , pop
				, ' := OrderedCollection new ]') withCRs
		classified: 'accessing'
		notifying: nil
]

{ #category : #'code-generation' }
CGStCormas >> createSetterAccessor: aClass [
	"creates a setter accessor such as :
theXXXs: aNewCollection 
	theXXXs := aNewCollection.
aClassName = <String> or <Symbol>.
(aClassName ('XXX') is completed as theXXXs)"
	
	| pop |
	pop := aClass asGetterForEntityClass.
	self targetClass compile:
			(pop , ': aNewCollection\	" Set a new collection for theXXXs attribute.\'
				, Cormas automaticCommentString , ' "\\	' , pop , ' := aNewCollection.')
				withCRs
		classified: 'accessing'
		notifying: nil
]

{ #category : #'code-generation' }
CGStCormas >> createStep [
	
	self targetClass
		compile: 'step\	"to be completed"' withCRs
		classified: 'control'
		notifying: nil
]

{ #category : #'code-generation' }
CGStCormas >> generateMethodHeader [
	" Add the selector and comments if configured "
	
	self resetCodeStream.	
	self buildMethodHeader.


]

{ #category : #'code-generation' }
CGStCormas >> installAbstractMethod [
	
	self targetClass class
		compile: 'isAbstract \	^ true' withCRs
		classified: 'testing'
		notifying: nil
]

{ #category : #'code-generation' }
CGStCormas >> installConcreteMethod [
	
	self targetClass class
		compile: 'isAbstract \	^ false' withCRs
		classified: 'testing'
		notifying: nil
]

{ #category : #accessing }
CGStCormas >> renameClass: oldClassname to: newClassname [ 

	^ self codeTransformer 
		renameClass: oldClassname 
		to: newClassname.
]

{ #category : #'code-templates' }
CGStCormas >> templateForInit [

	^ 'init
	" To be completed "
	
'
]

{ #category : #'code-templates' }
CGStCormas >> templateForInitAgents [

	^ 'initAgents
	" To be completed "
	
'
]

{ #category : #'code-templates' }
CGStCormas >> templateForPovOnAttribute [

	^ 'pov
	" To be completed "
	
'
]

{ #category : #'mustache-templates' }
CGStCormas >> templateForPovOnAttribute: attribute [

	^ 'pov' , attribute capitalized ,
					'\"return the value of the attribute\if the value is a string, converts it to a symbol\if the value is a number, converts it to a symbol, precede by the word {1} "
	self {1} isString ifTrue:[ ^ self {1} asSymbol ].
	self {1}	isLiteral ifTrue:[ ^ (''{1}'' , self {1} printString) asSymbol ].
	^ self {1}' format: { attribute }
]

{ #category : #'code-templates' }
CGStCormas >> templateForStep [

	^ 'step: anObject
	" To be completed "
	
'
]
