module Geometry where

-- compass points
data Direction = North | South | East | West
    deriving Show

-- the direction immediately to the left
turnLeft :: Direction -> Direction
turnLeft North = West
turnLeft South = East
turnLeft East = North
turnLeft West = South

-- the direction immediately to the right
turnRight :: Direction -> Direction
turnRight North = East
turnRight South = West
turnRight East = South
turnRight West = North

-- x and y coordinates in two-dimensional space
data Point = Point Int Int Int
    deriving (Eq, Ord, Show)

-- the origin of the two-dimensional space
origin :: Point
origin = Point 0 2 0

-- add two points
plusPoint :: Point -> Point -> Point
plusPoint (Point x1 y1 z1) (Point x2 y2 z2) = Point (x1+x2) (y1+y2) (z1+z2)

-- subtract two points
minusPoint :: Point -> Point -> Point
minusPoint (Point x1 y1 z1) (Point x2 y2 z2) = Point (x1-x2) (y1-y2) (z1-z2)

-- multiply both components of a point by a given number
timesPoint :: Int -> Point -> Point
timesPoint n (Point x y z) = Point (n*x) (n*y) (n*z)

-- Manhattan metric of the point
normPoint :: Point -> Int
normPoint (Point x y z) = abs x + abs y + abs z

-- distance between two points using the Manhattan metric
distance :: Point -> Point -> Int
distance p1 p2 = normPoint (minusPoint p1 p2)

-- the point one unit from the origin in the given direction
oneStep :: Direction -> Point
oneStep North = Point 0 0 1
oneStep South = Point 0 0 (-1)
oneStep East = Point 1 0 0
oneStep West = Point (-1) 0 0
