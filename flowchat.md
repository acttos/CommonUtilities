```flow

idle=>start: birdStatus.idle
walk=>operation: birdStatus.walk
falling=>operation: birdStatus.falling
launched=>operation: birdStatus.launched
missed=>operation: birdStatus.missed
punchedStopped=>operation: birdStatus.punchedStopped
slideStopped=>operation: birdStatus.slideStopped
fallStopped=>operation: birdStatus.fallStopped
ended=>end: birdStatus.ended

PowerButtonPressed=>condition: Power button
pressed?
PositionReached=>condition: Position
reached?
HitButtonPressed=>condition: Hit button
pressed?
HitPenguinInRange=>condition: Hit penguin
in range?
AngleTooLarge=>condition: Angel too
large?
GroundReachedA=>condition: Ground
reached?
GroundReachedB=>condition: Ground
reached?
SpeedIsLow=>condition: Speed
is low?


idle->PowerButtonPressed
PowerButtonPressed(yes)->walk->PositionReached
PositionReached(yes)->falling->HitButtonPressed
PositionReached(no)->walk
HitButtonPressed(yes)->HitPenguinInRange
HitButtonPressed(no)->GroundReachedA
HitPenguinInRange(yes)->launched->AngleTooLarge
HitPenguinInRange(no)->missed->GroundReachedB
GroundReachedA(yes)->fallStopped->ended
GroundReachedB(yes)->fallStopped->ended
AngleTooLarge(yes)->punchedStopped->ended
AngleTooLarge(no)->SpeedIsLow
SpeedIsLow(yes)->slideStopped->ended

```