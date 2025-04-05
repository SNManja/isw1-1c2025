!classDefinition: #AMotor category: #'2.Replace-if-State'!
Object subclass: #AMotor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!


!classDefinition: #OffState category: #'2.Replace-if-State'!
AMotor subclass: #OffState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!OffState methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 22:05:33'!
getAccelerationQuantity
	^self error: 'Can not accelerate when turned off'! !

!OffState methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 21:15:18'!
initialize
	speed := 0 * kilometer / hour! !

!OffState methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 22:03:18'!
turnOn
       |res|
	res := OnState new.
	^res.! !


!classDefinition: #OnState category: #'2.Replace-if-State'!
AMotor subclass: #OnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!OnState methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 22:05:33'!
getAccelerationQuantity
    ^10 * kilometer! !

!OnState methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 21:58:28'!
initialize
	! !

!OnState methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 21:57:50'!
turnOn
	^self! !


!classDefinition: #Automobile category: #'2.Replace-if-State'!
Object subclass: #Automobile
	instanceVariableNames: 'motorState speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobile methodsFor: 'initialization' stamp: 'SNM 4/4/2025 22:02:56'!
initialize	motorState := OffState new.! !


!Automobile methodsFor: 'move' stamp: 'SNM 4/4/2025 22:05:33'!
getAccelerationQuantity
	speed := speed + motorState getAccelerationQuantity.! !

!Automobile methodsFor: 'move' stamp: 'SNM 4/4/2025 21:57:29'!
turnOn	motorState := motorState turnOn.
	! !
