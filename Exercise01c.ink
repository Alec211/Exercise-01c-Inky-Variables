/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 * Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 - Variable checking
 
 In the assignment:
 * Add four more knots
 * Assign at least TWO new variables through player choices
 * Print at least one of the variables to the player in a passage
 * Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR throwingknives = 10
VAR lockpicks = 3

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
    ~ pet_name = "Charlie"
    -> cave_mouth
* [Scout]
    ~pet_name = "Scout"
    -> cave_mouth
* [Spot]
    ~pet_name = "Spot"
    -> cave_mouth
    
== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torches, {throwingknives} throwing knives and a small pouch of lockpicks

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west

{ pet_name == "Spot": Spot would love it here in the west }

+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room. As you wave the torch around the room to get a better view you notice a small stone chest. Far too heavy to move.
* {lockpicks > 0} [Open Chest] -> open_chest
* [Go Back] -> cave_mouth
-> END

== open_chest ==
~ lockpicks = lockpicks - 1
~ throwingknives = throwingknives -1
You utilize one of your throwing knives and a lockpick you were carrying to begin unlocking the chest. After a heafty struggle and breaking one of your lockpicks and throwing knives you pop open the chest. The item inside is emitting a dull red glow. You move closer to see the item more clearly. It is a dark red liquid inside a diamond shaped glass with gold encrusted edges.
* {throwingknives > 0}[Swap the potion out for another item] -> safe_potion
* [Pocket the potion] -> dangerous_potion
* [Drink it immediately] -> unknown_outcome
* [Go Back] -> cave_mouth
-> END

== safe_potion ==
You safely deactivated the trap underneath the bottle. You live to see another day this time one potion richer.
-> END

== dangerous_potion ==
You hastily grab the potion unknowingly triggering the trap underneath the potion bottle a trap door opens beneath you.
-> END

== unknown_outcome ==
"Hasty one aren't we?" You hear an unknown voice almost shaming you for drinking the potion. Not a second later a entity that has the appearance of a demon phases into existance directly in front of you. You have become cursed by a demon.
->END