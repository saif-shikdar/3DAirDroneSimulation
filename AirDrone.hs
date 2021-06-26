module AirDrone where

import Geometry

-- state of a drone
data Drone = Drone Point Direction
    deriving Show

-- start at the origin, facing North, with a unit height 2
startDrone :: Drone
startDrone = Drone origin North

currentDrone :: Drone
currentDrone = startDrone

-- location of the drone
location :: Drone -> Point
location (Drone pos dir) = pos

-- a command for a drone
data Command = TurnLeft | TurnRight | Move | FlyUp | FlyDown
    deriving Show

-- action of a drone command
action :: Drone -> Command -> Drone
action (Drone pos dir) TurnLeft = Drone pos (turnLeft dir)
action (Drone pos dir) TurnRight = Drone pos (turnRight dir)
action (Drone pos dir) Move = Drone (plusPoint pos (oneStep dir)) dir
action (Drone pos dir) FlyUp = Drone (plusPoint pos (Point 0 1 0)) dir
action (Drone pos dir) FlyDown = Drone (plusPoint pos (Point 0 (-1) 0)) dir
