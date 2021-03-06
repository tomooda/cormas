"
This class is the base  Agent class of the FireAutomata model, it is a model of a firefighter trying to extinghish fire in a forest
"
Class {
	#name : #CMFireAutomataFireman,
	#superclass : #CMAgentCommLocation,
	#instVars : [
		'agsize'
	],
	#category : #'Cormas-Model-FireAutomata'
}

{ #category : #accessing }
CMFireAutomataFireman >> agsize [
	agsize ifNil: [self agsize: 20].
	^ agsize
]

{ #category : #accessing }
CMFireAutomataFireman >> agsize: anObject [
	agsize := anObject
]

{ #category : #'as yet unclassified' }
CMFireAutomataFireman >> extinctFire [

		self patch state = #fire ifTrue: [self patch state: #empty. self patch bufferState: #empty. ]
]

{ #category : #'as yet unclassified' }
CMFireAutomataFireman >> move [

	| firedNeighbours |
	firedNeighbours := self nearestLocationsVerifying: [:cell | cell state = #fire] withinRadius: 4.
	firedNeighbours isEmpty
		ifTrue: [self randomWalk]
		ifFalse: [
			"self leave."
			self moveTo: (Cormas selectRandomlyFrom: firedNeighbours)
		]
]

{ #category : #'as yet unclassified' }
CMFireAutomataFireman >> pov [
	"^#empty ^#tree ^#fire ^#ash"

	^ Color blue
]

{ #category : #'+ accessing' }
CMFireAutomataFireman >> sizeOfPOV [
^ self agsize
]

{ #category : #'as yet unclassified' }
CMFireAutomataFireman >> step [

	self move.
	self extinctFire.
]
