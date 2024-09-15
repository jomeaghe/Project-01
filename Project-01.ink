/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR holocron=0
VAR temple_visits = 0
VAR village_visits = 0
Once upon a time in a galaxy far far away..->begin

== begin==
You are a Jedi knight, your mission is to investigate strange reports of Sith activity on the far away planet of Velora. The Jedi Council assigned you this mission but what you find here and uncover will depend upon your choices. 

*[Check your lightsaber]->sabercheck
*[Use the Force to meditate]->meditate

==sabercheck==
As you check your saber, making sure its fully working and ready for any possibilites ahead. 
->landing

==meditate==
You focus and clear your mind allowing the Force to flow through you. Calm an dready you feel ready for anythig thrown your way. 
->landing

==landing==
As your ship lands on the surface, you exit sensing a disturbance in the Force. Your map indicated there were old temple ruins nearby alongside a village.

*[Explore the ancient temple]->temple


==temple==
The temple seems well abondonded as its ancient walls are chipped away, the stones telling stories of a bygone era. As you explore the temple investigating the ruins the feeling of a presence of something dark and evil keeps overcoming you. Making your way into a chamber you see on a pillar a Sith Holocron glowing.

~ temple_visits = temple_visits + 1
- {temple_visits == 1}: You find a strange artifact, glowing faintly with dark energy. It is a Holocron, a repository of Sith knowledge.
    * [Take the Holocron] -> take_holo
    * [Leave the Holocron] -> leave_holo
    * [Go to the village for more information] -> village

==leave_holo==
You make the choice to leave the Holocon aware of the dark power it might have.
~holocron=holocron+0
~ temple_visits = temple_visits + 0
- {temple_visits == 1}: You feel you need more information before confronting the darkness here. Perhaps the village holds answers.
->leave_the_temple

==take_holo==
As you pick up the Holocron the weight seems almost umbearable with the burden of dark knowledge. Holding it sends chills through you, you pack it away in your sack for safe keeping.
~holocron=holocron+1
~ temple_visits = temple_visits + 0
- {temple_visits == 1}: You feel you need more information before confronting the darkness here. Perhaps the village holds answers.
->leave_the_temple

==leave_the_temple==
Leaving the temple the sense of darkness has lifted leaving you only one more choice.
*[head towards the village for information]->village

==village==

The village is earilly quiet, the locals cant seem to stop staring at you as you make your way through the town. Stopping to talk to a villager who seems nervous about your presence. 

        *[Ask about anything strange perhaps sith activity?]->ask
        *[Force read their mind]->read

==ask==
The villager looking empty shakes their head telling you "none of us have seen any sith or anything strange, but there are the old tales of dark figures in the temple it is why no one goes there no longer."
->village_think

==read==
you reach into the mind of the villager with the Force reading his emotions. Clearly trying to hide his memory as you see visions of a dark figure near the temple..the sith has been here.
->village_think

==village_think==
Hearing about these new rumors it may be worth checking to see if there is indeed any truth to these superstitions.
*[Travel to the temple]->temple_return

==temple_return==
~ temple_visits=temple_visits+1
-{temple_visits==2}: Returning to the temple you know the darkness is immense. The sith is here. 
*[Go to the main entrance]->sith_choice



==sith_choice==
With enough information to confront the figure back in the temple you try to decide how you should approach the situation.
*[prepare your saber and set forth to find the figure for combat..the sith will not leave here no matter what.]->combat
*[conjure up a plan to possibly negotiate with the sith]->diplomacy

==combat==
approaching the temple, upon entrance to the temple your met with the dark figure.

A sith dawning rusty black armor with his saber glimming in the faint light wrapped tightly around his hand blade already ignited. 

Igniting your own saber you prepare for a duel

*[Fight aggressively]->offense
*[Fight defensively]->defense

==offense==
As you take the initiative striking hard pushing the sith back with each strike. The sith puts up a hard fight but you seem to have the upper hand.
-{holocron==1}: Using the dark power of the Holocron as it powers you harder giving you the strenght to overcome the sith. 
->victory
-{holocron==0}: Relying on your training you persist and defeat the sith. 
->victory

==defense==
Using your defensive training to wear down the sith motioning to tire them out after a long and gruesome duel you find an opening striking them down.

- {holocron == 1}: The Holocron’s dark power tempts you to kill the Sith, but you resist, capturing them instead.
-> victory

- {holocron == 0}: Your discipline keeps you focused, and you capture the Sith without falling to the dark side.
-> victory

==victory==
With the fight being over and defeating the sith What you do next will shape your path as a jedi. 

*[Report back to the Jedi Council]->council
*[investigate the sith]->investigate_sith

==diplomacy==
Choosing to speak with the sith instead of fighting them. They watch you angrily but allow you to speak. 

*[Use the force to persuade them]->persuade
*[Try and reason with them]->reason

==reason==
You try and reason with the sith and their honor, reminding them of how fragile the galaxy is and that their differences are not worth more death. Hesitating they consider your offer.

- {holocron == 1}: The Sith senses the Holocron's dark power on you, and they respect your strength. They agree to leave the planet in peace.
-> Diplomacy_Success

- {holocron == 0}: Without the Holocron’s influence, you must rely solely on your words. The Sith listens but remains cautious.
-> Diplomacy_Success

==persuade==
you reach out trying to influence them with the Force making them lower their weapon and go their own way. 
->Diplomacy_Success

==Diplomacy_Success==
You have successfully negotiated peace with the sith. Able to return with new information to the jedi council.

*[report to the jedi council]->council 

==council==
making your way back to the jedi on coruscant. Depending on your choices, they either praise your combat skills or you diplomatic skills. The future of the unstable galaxy remains uncertain, for now there is a little bit more peace in the galaxy. 
->END

==investigate_sith== 
Instead of returning straight to the council, you choose to look into the siths activity furthur. This path may lead you deeper into the dark sides powers uncovering hidden truths about the sith and their plans. 

- {holocron == 1}: The Holocron you carry glows ominously, tempting you to use its dark knowledge.

- {holocron == 0}: Without the Holocron, your path forward is less clear, but your determination remains strong.

-> END













































