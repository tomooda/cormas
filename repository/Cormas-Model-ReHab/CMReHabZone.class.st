Class {
	#name : #CMReHabZone,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'access',
		'noHarvestPeriod',
		'biomass'
	],
	#classInstVars : [
		'maxBiomass',
		'minBiomass'
	],
	#category : #'Cormas-Model-ReHab'
}

{ #category : #'pov symbols' }
CMReHabZone class >> SpatialEntityPOV_biomass0 [
"Returns an array containing the settings of a Spatial entity pov symbol in the following order:
(color red) (color green) (color blue)
(Automatically defined by Cormas)."
^Array with: 1.0 with: 1.0 with: 1.0
]

{ #category : #'pov symbols' }
CMReHabZone class >> SpatialEntityPOV_biomass1 [
"Returns an array containing the settings of a Spatial entity pov symbol in the following order:
(color red) (color green) (color blue)
(Automatically defined by Cormas)."
^Array with: 0.0 with: 1.0 with: 0.0
]

{ #category : #'pov symbols' }
CMReHabZone class >> SpatialEntityPOV_biomass2 [
"Returns an array containing the settings of a Spatial entity pov symbol in the following order:
(color red) (color green) (color blue)
(Automatically defined by Cormas)."
^Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMReHabZone class >> SpatialEntityPOV_biomass3 [
"Returns an array containing the settings of a Spatial entity pov symbol in the following order:
(color red) (color green) (color blue)
(Automatically defined by Cormas)."
^Array with: 0.0 with: 0.380051 with: 0.0
]

{ #category : #'- default value' }
CMReHabZone class >> access_default [
	"Return the default value of attribute #access : true.
	!! This method was automatically generated by Cormas !!"

	^true
]

{ #category : #'- default value' }
CMReHabZone class >> access_type [
	"Return the type of attribute #access.
	!! This method was automatically generated by Cormas !!"

	^Boolean
]

{ #category : #'- default value' }
CMReHabZone class >> biomass_default [
	"Return the default value of attribute #biomass : 0.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^0
]

{ #category : #'+ parameter unit' }
CMReHabZone class >> biomass_type [
	"Return the type of attribute #biomass.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^SmallInteger
]

{ #category : #'+ parameter unit' }
CMReHabZone class >> biomass_unit [
	"Return the unit of attribute #biomass.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!"

	^ ''
]

{ #category : #'- default value' }
CMReHabZone class >> initialPlantBiomass_default [
	"Return the default value of attribute #initialPlantBiomass : 0.
	!! This method was automatically generated by Cormas !!"

	^0
]

{ #category : #'- default value' }
CMReHabZone class >> initialPlantBiomass_type [
	"Return the type of attribute #initialPlantBiomass.
	!! This method was automatically generated by Cormas !!"

	^SmallInteger
]

{ #category : #testing }
CMReHabZone class >> isAbstract [
^false
]

{ #category : #accessing }
CMReHabZone class >> maxBiomass [
	"Getter accessor with initial value = 3.
	!! This method was automatically generated by Cormas !! "
	^maxBiomass ifNil:[maxBiomass := 3]
]

{ #category : #accessing }
CMReHabZone class >> maxBiomass: anObject [
	"Setter accessor of attribute maxNiomass.
	!! This method was automatically generated by Cormas !!  "
	maxBiomass := anObject
]

{ #category : #'- default value' }
CMReHabZone class >> maxBiomass_default [
	"Return the default value of attribute #maxBiomass : 3.
	!! This method was automatically generated by Cormas !!"

	^3
]

{ #category : #'- default value' }
CMReHabZone class >> maxNiomass_default [
	"Return the default value of attribute #maxNiomass : 3.
	!! This method was automatically generated by Cormas !!"

	^3
]

{ #category : #'- default value' }
CMReHabZone class >> maxNiomass_type [
	"Return the type of attribute #maxNiomass.
	!! This method was automatically generated by Cormas !!"

	^SmallInteger
]

{ #category : #accessing }
CMReHabZone class >> minBiomass [
	"Getter accessor with initial value = 0.
	!! This method was automatically generated by Cormas !! "
	^minBiomass ifNil:[minBiomass := 0]
]

{ #category : #accessing }
CMReHabZone class >> minBiomass: anObject [
	"Setter accessor of attribute minBiomass.
	!! This method was automatically generated by Cormas !!  "
	minBiomass := anObject
]

{ #category : #'- default value' }
CMReHabZone class >> minBiomass_default [
	"Return the default value of attribute #minBiomass : 0.
	!! This method was automatically generated by Cormas !!"

	^0
]

{ #category : #'- default value' }
CMReHabZone class >> minBiomass_type [
	"Return the type of attribute #minBiomass.
	!! This method was automatically generated by Cormas !!"

	^SmallInteger
]

{ #category : #'- default value' }
CMReHabZone class >> noHarvestPeriod_default [
	"Return the default value of attribute #noHarvestPeriod : 0.
	!! This method was automatically generated by Cormas !!"

	^0
]

{ #category : #'- default value' }
CMReHabZone class >> noHarvestPeriod_type [
	"Return the type of attribute #noHarvestPeriod.
	!! This method was automatically generated by Cormas !!"

	^SmallInteger
]

{ #category : #accessing }
CMReHabZone >> access [
	"Getter accessor with initial value = true.
	!! This method was automatically generated by Cormas !! "
	^access ifNil:[access := true]
]

{ #category : #accessing }
CMReHabZone >> access: anObject [
	"Setter accessor of attribute access.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	access = anObject ifTrue:[^nil].   "for optimization"
	access := anObject.
	self changed
]

{ #category : #control }
CMReHabZone >> allocateHarvests [
| harvesters |
	self updateNoHarvestPeriod.
	self noHarvester
		ifFalse:
			[harvesters := self randomizedHarvesters.
			self biomass < self class maxBiomass
				ifTrue: [harvesters first harvest: self biomass]
				ifFalse:
					[harvesters first harvest: CMReHabPlantHarvester maxHarvest.
					harvesters size > 1
						ifTrue: [(harvesters at: 2) harvest: self class maxBiomass - CMReHabPlantHarvester maxHarvest]]]
]

{ #category : #accessing }
CMReHabZone >> biomass [
	"Getter accessor with initial value = 0.
	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !! "
	^biomass ifNil:[biomass := 0]
]

{ #category : #accessing }
CMReHabZone >> biomass: aSmallInteger [
	"Setter accessor of attribute biomass	This method was automatically generated by Cormas.
	!! BECAREFUL, You should not modify this method as it can be generated again when changing the value (Sensitivity Analysis for ex) !!  "
	biomass = aSmallInteger ifTrue:[^nil].   "for optimization"
	biomass := aSmallInteger.
	self changed
]

{ #category : #dynamics }
CMReHabZone >> decreaseBiomassBy: x [
	self biomass - x < self class minBiomass
		ifTrue: [self biomass: self class minBiomass]
		ifFalse: [self biomass: self biomass - x]
]

{ #category : #'accessing - occupants' }
CMReHabZone >> harvesters [

	^self occupantsType: CMReHabPlantHarvester
]

{ #category : #dynamics }
CMReHabZone >> increaseBiomassBy: x [
	self biomass + x > self class maxBiomass
		ifTrue: [self biomass: self class maxBiomass]
		ifFalse: [self biomass: self biomass + x]
]

{ #category : #'accessing - occupants' }
CMReHabZone >> nbHarvesters [

	^self harvesters size
]

{ #category : #accessing }
CMReHabZone >> noHarvestPeriod [
	"Getter accessor with initial value = 0.
	!! This method was automatically generated by Cormas !! "
	^noHarvestPeriod ifNil:[noHarvestPeriod := 0]
]

{ #category : #accessing }
CMReHabZone >> noHarvestPeriod: anObject [
	"Setter accessor of attribute noHarvestPeriod.
	!! This method was automatically generated by Cormas !!  "
	noHarvestPeriod := anObject
]

{ #category : #'accessing - occupants' }
CMReHabZone >> noHarvester [
	^self nbHarvesters isZero
]

{ #category : #'accessing - occupants' }
CMReHabZone >> randomizedHarvesters [

	^Cormas mix: self harvesters
]

{ #category : #dynamics }
CMReHabZone >> renewBiomass [
	self noHarvester
		ifTrue:
			[self noHarvestPeriod = 1 ifTrue: [self increaseBiomassBy: 1].
			self noHarvestPeriod > 2 ifTrue: [self decreaseBiomassBy: 1]].
	self nbHarvesters > 1 ifTrue: [self decreaseBiomassBy: self nbHarvesters].
]

{ #category : #control }
CMReHabZone >> updateNoHarvestPeriod [
	self noHarvester
		ifTrue: [self noHarvestPeriod: self noHarvestPeriod + 1]
		ifFalse: [self noHarvestPeriod: 0]
]
