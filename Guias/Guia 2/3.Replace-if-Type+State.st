!classDefinition: #Motor category: #'3.Replace-if-Type+State'!
Object subclass: #Motor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motor methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:29:48'!
getAccelerationValue
	self subclassResponsibility! !

!Motor methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:53:01'!
turnOff
	self subclassResponsibility ! !

!Motor methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:53:12'!
turnOn
	self subclassResponsibility ! !


!classDefinition: #UnMotorDeHeliApagado category: #'3.Replace-if-Type+State'!
Motor subclass: #UnMotorDeHeliApagado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!UnMotorDeHeliApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:50:19'!
canNotAccelerateErrorMessage
	^'Can not fly when turned off'! !

!UnMotorDeHeliApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:51:12'!
getAccelerationValue
	self error: self canNotAccelerateErrorMessage.! !

!UnMotorDeHeliApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:54:01'!
getAltitudeValue
	self error: self canNotAccelerateErrorMessage.! !

!UnMotorDeHeliApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:54:53'!
turnOff
	^self! !

!UnMotorDeHeliApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:53:39'!
turnOn
	^UnMotorDeHeliPrendido new.! !


!classDefinition: #UnMotorDeHeliPrendido category: #'3.Replace-if-Type+State'!
Motor subclass: #UnMotorDeHeliPrendido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!UnMotorDeHeliPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:54:23'!
getAccelerationValue
	^10! !

!UnMotorDeHeliPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:54:33'!
getAltitudeValue
	^5! !

!UnMotorDeHeliPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:55:40'!
turnOff
	^UnMotorDeHeliApagado new.! !

!UnMotorDeHeliPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:55:07'!
turnOn
	^self! !


!classDefinition: #UnMotorDeMotoApagado category: #'3.Replace-if-Type+State'!
Motor subclass: #UnMotorDeMotoApagado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!UnMotorDeMotoApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:50:32'!
canNotAccelerateErrorMessage
	^'Can not run when turned off'! !

!UnMotorDeMotoApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:51:25'!
getAccelerationValue
	self error: self canNotAccelerateErrorMessage.! !

!UnMotorDeMotoApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:56:36'!
turnOff
	^self.! !

!UnMotorDeMotoApagado methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:56:30'!
turnOn
	^UnMotorDeMotoPrendido new.! !


!classDefinition: #UnMotorDeMotoPrendido category: #'3.Replace-if-Type+State'!
Motor subclass: #UnMotorDeMotoPrendido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!UnMotorDeMotoPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:58:02'!
getAccelerationValue
	^20! !

!UnMotorDeMotoPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:57:32'!
turnOff
	^UnMotorDeMotoApagado new.! !

!UnMotorDeMotoPrendido methodsFor: 'as yet unclassified' stamp: 'SNM 4/4/2025 23:57:42'!
turnOn
	^self.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'speed motor'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!


!Vehicle methodsFor: 'move' stamp: 'SNM 4/5/2025 00:09:59'!
accelerate	speed := speed + motor getAccelerationValue.! !

!Vehicle methodsFor: 'move' stamp: 'SNM 4/5/2025 00:41:27'!
getSpeed.
	^speed.! !


!Vehicle methodsFor: 'on/off' stamp: 'SNM 4/5/2025 00:06:09'!
turnOff
	speed := 0.
	motor := motor turnOff.! !

!Vehicle methodsFor: 'on/off' stamp: 'SNM 4/5/2025 00:32:36'!
turnOn	motor := motor turnOn.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
motorcycle

	^self new initializeWithType: #Motorcycle! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'nil' stamp: 'SNM 4/5/2025 00:04:20'!
initialize 
	motor := UnMotorDeHeliApagado new.
	speed := 0.
	altitude := 0.! !

!Helicopter methodsFor: 'nil' stamp: 'SNM 4/5/2025 00:32:08'!
turnOn
	super turnOn.
	! !


!Helicopter methodsFor: 'as yet unclassified' stamp: 'SNM 4/5/2025 00:43:12'!
accelerate
	super accelerate.
	altitude := altitude + motor getAltitudeValue.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'SNM 4/5/2025 00:41:49'!
getAltitude.
	^altitude ! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'SNM 4/5/2025 00:31:27'!
turnOff
	super turnOff.
	altitude := 0.! !


!classDefinition: #Motorcycle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcycle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcycle methodsFor: 'as yet unclassified' stamp: 'SNM 4/5/2025 00:03:30'!
initialize 
	motor := UnMotorDeMotoApagado new.
	speed := 0.! !

