import AirDrone
import Geometry
import Data.Char

-- String formatter which takes in the string and ignore any numbers,
-- punctuation and symbols. It will also convert any capital letters to small
-- case so it avoids errors when being tested for cases.

formatInput :: [Char] -> [Char]
formatInput ns = [toLower(n) | n <- ns , isAlpha(n)]

-- Recursive function that iterates through the string character by character, applying command and then
-- returning the new position of drone.
-- Once it reaches the end of the string it will return the final Position of the drone

stringIterator :: Int -> Drone -> [Char] -> Drone
stringIterator num drone route = do
  if num <= length route
  then stringIterator (num+1) (applyCommand drone (take 1 (drop (num-1) route))) route
  else drone

-- Takes in current position of drone and applies the corresponding command to the given character and return the
-- position of the drone

applyCommand :: Drone -> [Char] -> Drone
applyCommand r s = case s of
  "w" -> action r Move
  "a" -> action r TurnLeft
  "d" -> action r TurnRight
  "k" -> action r FlyUp
  "l" -> action r FlyDown

-- Uses replicate function to create partial movements represented by characters for the route

createString :: Int -> Char -> [Char]
createString r s = replicate r s

-- Take in a drone position, find a possible route and then produce a string representation of the set route.

produceRoute :: Drone -> Point -> String
produceRoute drone (Point x y z) = do
  concat [ if z >= 0 then "" else "dd", createString (abs z) 'w', if z>= 0 then "" else "dd", if x>= 0 then "d" else "a", createString (abs x) 'w', if y>= 0 then createString (abs y) 'k' else createString (abs y) 'l' ]

-- Follow Instructions Function. If this is run, the drone will follow set instructions and return its
-- final destination

followRoute :: IO ()
followRoute = do
  input <- readFile "instructions.txt"

  -- Printing starting location of drone

  putStrLn ("Starting Position:")
  print startDrone
  putStrLn ("\n")

  print(length input)

  -- Printing instructions set from text file

  putStrLn("Instruction route is: " ++ formatInput(input))
  putStrLn ("\n")

  -- Following instructions and then returning final position

  print(stringIterator 1 startDrone (formatInput(input)))

calculateRoute :: Point -> IO ()
calculateRoute target = do
  putStrLn ("Target position: ")
  print target
  putStrLn ("\n")

  putStrLn ("Drone Starting position: ")
  print startDrone
  putStrLn ("\n")

  putStrLn ("Route: ")
  putStrLn (produceRoute startDrone (minusPoint target (location(startDrone))))
