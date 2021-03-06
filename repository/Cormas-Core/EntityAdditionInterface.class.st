Class {
	#name : #EntityAdditionInterface,
	#superclass : #UIApplicationModel,
	#instVars : [
		'newClassName',
		'cbLocation',
		'cbComm',
		'cbGroup',
		'spatialEntitySuperclass',
		'cormas',
		'passiveEntitySuperclass',
		'cellOrCA',
		'entityName',
		'entityElementType',
		'toolbar'
	],
	#category : #'Cormas-Core-Tools'
}

{ #category : #actions }
EntityAdditionInterface >> addNewPassivelEntityGUI [
	
	| superClass newName |
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	self passiveEntitySuperclass value isNil
		ifTrue: [^self cormas warn: 'Please tick a super class!'].
	superClass := self passiveEntitySuperclass value class.
	self cormas addNewClassType: 'Passive' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #actions }
EntityAdditionInterface >> addNewSpatialEntityGUI [
	
	| superClass newName aClass |
	
	self flag: #toDelete.
	newName := self getNewClassNameFromGUI.
	newName isNil
		ifTrue: [^self cormas warn: 'Please enter a name for the new class!'].
	self spatialEntitySuperclass value isNil
		ifTrue: [^self cormas warn: 'Please tick a super class!'].
	aClass := self spatialEntitySuperclass value = #CMSpatialEntityCell
		ifTrue: [self cellOrCA value]
		ifFalse: [self spatialEntitySuperclass value].
	superClass := aClass class.
	self cormas addNewClassType: 'Spatial' inheritingFrom: superClass name:
			newName initProtocol: false stepProtocol: false.
	self closeRequest
]

{ #category : #aspects }
EntityAdditionInterface >> cbComm [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cbComm isNil
		ifTrue: [cbComm := false asValue]
		ifFalse: [cbComm]
]

{ #category : #aspects }
EntityAdditionInterface >> cbGroup [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cbGroup isNil
		ifTrue: [cbGroup := false asValue]
		ifFalse: [cbGroup]
]

{ #category : #aspects }
EntityAdditionInterface >> cbLocation [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cbLocation isNil
		ifTrue: [cbLocation := false asValue]
		ifFalse: [cbLocation]
]

{ #category : #changed }
EntityAdditionInterface >> cbSuperclassChanged [
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of ' , self getAgentSuperclassFromGUI name asString]
]

{ #category : #aspects }
EntityAdditionInterface >> cellOrCA [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cellOrCA isNil
		ifTrue: [cellOrCA := nil asValue]
		ifFalse: [cellOrCA]
]

{ #category : #accessing }
EntityAdditionInterface >> cormas [
	
	^cormas
]

{ #category : #accessing }
EntityAdditionInterface >> cormas: anObject [
	
	cormas := anObject
]

{ #category : #changed }
EntityAdditionInterface >> crPassiveSuperclassChanged [
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of ' , self passiveEntitySuperclass value asString]
]

{ #category : #changed }
EntityAdditionInterface >> crSpatialSuperclassChanged [
	
	(self builder notNil and: [self builder window isActive])
		ifTrue:
			[self builder window
				label:
					'Create a kind of '
						,
							(self spatialEntitySuperclass value asString
								copyFrom: 14
								to: self spatialEntitySuperclass value asString size)]
]

{ #category : #accessing }
EntityAdditionInterface >> entityName [
	" Answer the entityName of this EntityAdditionInterface "

	^ entityName
]

{ #category : #accessing }
EntityAdditionInterface >> entityName: anObject [
	" Sets the entityName of this EntityAdditionInterface "

	entityName := anObject
]

{ #category : #accessing }
EntityAdditionInterface >> getAgentSuperclassFromGUI [
	self cbComm value not & self cbLocation value not
		& self cbGroup value not
		ifTrue: [ ^ CMAgent ].
	self cbComm value & self cbLocation value not
		& self cbGroup value not
		ifTrue: [ ^ CMAgentComm ].
	self cbComm value not & self cbLocation value
		& self cbGroup value not
		ifTrue: [ ^ CMAgentLocation ].
	self cbComm value & self cbLocation value & self cbGroup value not
		ifTrue: [ ^ CMAgentCommLocation ].
	self cbComm value not & self cbLocation value not
		& self cbGroup value
		ifTrue: [ ^ CMGroup ].
	self cbComm value & self cbLocation value not & self cbGroup value
		ifTrue: [ ^ CMGroupComm ].
	self cbComm value not & self cbLocation value & self cbGroup value
		ifTrue: [ ^ CMGroupLocation ].
	self cbComm value & self cbLocation value & self cbGroup value
		ifTrue: [ ^ CMGroupCommLocation ]
]

{ #category : #accessing }
EntityAdditionInterface >> getNewClassNameFromGUI [
	
	| aName |
	aName := self newClassName value.
	aName isEmpty
		ifFalse:
			[aName beMutable.
			aName first isAlphabetic ifFalse: [aName := 'X_' , aName].
			aName
				at: 1
				put: aName first asUppercase.
			(self cormas verifyClassExist: aName)
				ifTrue:
					[self cormas alert_NameAlreadyExist.
					^nil]]
		ifTrue: [^nil].
	^aName
]

{ #category : #initialization }
EntityAdditionInterface >> initialExtent [
	^ 600 @ 400
]

{ #category : #'initialize-release' }
EntityAdditionInterface >> initialize [
	
	super initialize.
	self cbComm onChangeSend: #cbSuperclassChanged to: self.
	self cbGroup onChangeSend: #cbSuperclassChanged to: self.
	self cbLocation onChangeSend: #cbSuperclassChanged to: self.
	self spatialEntitySuperclass onChangeSend: #crSpatialSuperclassChanged to:
			self.
	self passiveEntitySuperclass onChangeSend: #crPassiveSuperclassChanged to:
			self
]

{ #category : #initialization }
EntityAdditionInterface >> initializePresenter [
	
]

{ #category : #initialization }
EntityAdditionInterface >> initializeWidgets [
	| tmp2 |
	self instantiateModels: #().
	tmp2 := self focusOrder.
	tmp2
		add: nil;
		add: nil
]

{ #category : #aspects }
EntityAdditionInterface >> newClassName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^newClassName isNil
		ifTrue: [newClassName := String new asValue]
		ifFalse: [newClassName]
]

{ #category : #aspects }
EntityAdditionInterface >> passiveEntitySuperclass [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^passiveEntitySuperclass isNil
		ifTrue: [passiveEntitySuperclass := nil asValue]
		ifFalse: [passiveEntitySuperclass]
]

{ #category : #'interface opening' }
EntityAdditionInterface >> postBuildWith: aBuilder [
	('*Spatial*' match: aBuilder window label)
		ifTrue: [ self cormas currentModel cellClass isNil
				ifFalse: [ self spatialEntitySuperclass value: #CMSpatialEntityAggregate.
					(aBuilder componentAt: #CMSpatialEntityCell) disable.
					(aBuilder componentAt: #simpleCell) disable.
					(aBuilder componentAt: #cellAutomaton) disable.
					(aBuilder componentAt: #LabelSpecialize) enable.
					(aBuilder componentAt: #CMSpatialEntityAggregate) enable.
					(aBuilder componentAt: #CMSpatialEntityNotConnex) enable ]
				ifTrue: [ self spatialEntitySuperclass value: #CMSpatialEntityCell.
					self cellOrCA value: #CMSpatialEntityElement.
					(aBuilder componentAt: #CMSpatialEntityCell) enable.
					(aBuilder componentAt: #simpleCell) enable.
					(aBuilder componentAt: #cellAutomaton) enable.
					(aBuilder componentAt: #LabelSpecialize) disable.
					(aBuilder componentAt: #CMSpatialEntityAggregate) disable.
					(aBuilder componentAt: #CMSpatialEntityNotConnex) disable ] ].
	('*Passive*' match: aBuilder window label)
		ifTrue: [ self cormas currentModel commClasses isEmpty
				ifFalse: [ (aBuilder componentAt: #CMMsg) enable ]
				ifTrue: [ (aBuilder componentAt: #CMMsg) disable ] ]
]

{ #category : #accessing }
EntityAdditionInterface >> rbEntityElementType [
	" Answer the entityElementType of this EntityAdditionInterface "

	^ entityElementType
]

{ #category : #accessing }
EntityAdditionInterface >> rbEntityElementType: anObject [
	" Sets the entityElementType of this EntityAdditionInterface "

	entityElementType := anObject
]

{ #category : #aspects }
EntityAdditionInterface >> spatialEntitySuperclass [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^spatialEntitySuperclass isNil
		ifTrue: [spatialEntitySuperclass := nil asValue]
		ifFalse: [spatialEntitySuperclass]
]

{ #category : #initialization }
EntityAdditionInterface >> title [
	^ 'Create a kind of Entity'
]

{ #category : #accessing }
EntityAdditionInterface >> toolbar [
	" Answer the toolbar of this EntityAdditionInterface "

	^ toolbar
]

{ #category : #accessing }
EntityAdditionInterface >> toolbar: anObject [
	" Sets the toolbar of this EntityAdditionInterface "

	toolbar := anObject
]
