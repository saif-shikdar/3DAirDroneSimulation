COURSEWORK FOR IN3043 FUNCTIONAL PROGRAMMING

The concept of my idea for the CW will be building a flying drone simulator. Similar to turtle but with more complex commands. I will be building upon the Geometry and Turtle classes.

It will take in a text file with commands. These commands are a set of characters composing of {w,a,d,k,l}. ad will allow the drone to turn left and right accordingly. w will move the drone forwards 1 unit in the direction its facing. k will move adjust the height 1 unit up and l will adjust the height 1 unit down.

The instructions will be laid out in this format:

wwwdwwa

These instructions can include number and other symbols. However they will be ignored and only the text will be interpreted. If the instructions contain any capital letter these will be converted to small case before being read.

These instructions for example would move the drone 3 units North, then rotate to East, then moved 2 units East. It will then return a position of the drone after following the set instructions.

If origin was {0,2,0}. The result would be {2,2,3} facing North.

RUNNING THE PROGRAM :

Run followRoute function to follow the route from instructions.txt. It will then return the final position of the drone after following the route.

Example GHCI Command: followRoute

Run calculateRoute function to return a set route from origin to the given target position provided in the argument.

Example GHCI Command: calculateRoute (Point 2 2 3)

Complex Functions :

stringIterator was quite difficult for me as it required a good understanding of recursion. I structured the function in a way that a for loop would work. The function iterates through a string character by character. Interprets the character and runs the movement command. It then returns a new position of the drone. The function would keep looping until the end of the string has been reached and then in that case it would return the final position of the drone.

produceRoute was another difficult function to come up with as I wasn't sure how to implement this. The idea of the function is to take in a drone and the difference between the target position and the drone starting position. It would then interpret the difference into commands represented as characters. Originally I was using if condition, replicate function and a bunch of deep recursive loops. However it became very complex as I was running many recursive loops inside another loop. In the end, I managed to do it by using the concat function, a few if conditions and a createString function which basically just uses the replicate function.
