# Spartie Saves Senior Week, a text-based adventure game in MIPS

 .text
	.globl  main
main:   


# STARTING SCENE, IN THE VILLAGE SUITE LIVING ROOM

	la		$a0, DormIntro
	la		$a1, optionsYesNo
	jal		Scene

	addi	$a0, $v0, 0
	la		$a1, almostLose1
	la		$a2, dormContinue1
	jal		yesContinueNoLose
	j		$v0
		
	almostLose1:	
		# Ask them again.
		la		$a0, KnockAgain
		la		$a1, optionsYesNo
		jal		Scene
		
		# They either said yes or they lose.
		addi	$a0, $v0, 0
		la		$a1, lose1
		la		$a2, dormContinue1
		jal		yesContinueNoLose
		j		$v0
		
	dormContinue1:
		li		$v0, 4
		la		$a0, meetSpartie
		syscall	
		
		la		$a0, spartie
		la		$a1, spartieIntro1
		jal		dialouge
		
		jal		pause
		
		la		$a0, spartie
		la		$a1, spartieIntro2
		jal		dialouge
		
		la		$a0, spartieOffer
		la		$a1, optionsYesNo
		jal		Scene
		
		addi	$a0, $v0, 0
		la		$a1, lose2
		la		$a2, dormContinue2
		jal		yesContinueNoLose
		j		$v0
		
	dormContinue2:
		li		$v0, 4
		la		$a0, SpartieHappy
		syscall
		
		jal		pause
		
		la		$a0, spartie
		la		$a1, spartieQuestion
		jal		dialouge
		
		jal		travelActivityOrFood
		j		$v0
		

# END VILLAGE DORM SCENE

	win1:
		li		$v0, 4
		la		$a0, winMsg1
		syscall
		
		j 		end
	
	win2:
		li		$v0, 4	
		la		$a0, winMsg2
		syscall
		
		j 		end
		
	win3:
		li		$v0, 4
		la		$a0, winMsg3
		syscall	

		j 		end	
		
	win4:
		li		$v0, 4
		la		$a0, winMsg4
		syscall
		
		j 		end


# CEDAR POINT SCENE

cedarPoint:
	la		$a0, CedarPointIntro
	la		$a1, optionsRides
	jal		Scene
	
	addi	$a0, $v0, 0	
	addi	$a1, $zero, 1
	la		$a2, AETalk	
	la		$a3, AESearch
	jal		handleoptionsTalkSearchInv
	jr		$v0
	
	AETalk:
	
	AESearch:
	
	j		win1


# GUARDIANS GAME SCENE

guardiansGame:
	la		$a0, guardiansGameIntro
	li		$v0, 4
	syscall
	j		end


# KICKOFF BBQ SCENE

kickoffBBQ:
	la		$a0, bbq1.1	
	la		$a1, Nothing
	jal		Scene
	
	la		$a0, bbq1.2	
	la		$a1, Nothing
	jal		Scene
	
	la		$a0, bbq1.3
	la		$a1, optionsYesNo
	jal		Scene
	
	addi	$a0, $v0, 0	
	la		$a1, lose3
	la		$a2, PAContinue1
	jal		yesContinueNoLose
	j		$v0
	
	PAContinue1:
		la		$a0, bbq1.4
		la		$a1, Nothing
		jal		Scene
		
		la		$a0, bbq1.5
		la		$a1, optionsQuest
		jal		Scene
		
		addi	$t2, $zero, 2
		beq		$v0, $t2, lose4
		addi	$t3, $zero, 3
		beq		$v0, $t3, morePATalk
		j		PAContinue2
		
		morePATalk:
			la		$a0, bbq1.5.1		
			la		$a1, Nothing
			jal		Scene	
			
			la		$a0, bbq1.5.2	
			la		$a1, Nothing
			jal		Scene	

	PAContinue2:
		la		$a0, bbq1.6		
		la		$a1, Nothing		
		jal		Scene			
		
		la		$a0, bbq1.7		
		la		$a1, optionsYesNo	
		jal		Scene
		
		addi	$a0, $v0, 0	
		la		$a1, PAContinue3	
		la		$a2, PAContinue3
		jal		yesContinueNoLose
		j		$v0
			
	PAContinue3:
		la		$a0, bbq1.8		
		la		$a1, Nothing
		jal		Scene
		
		la		$a0, bbq1.9
		la		$a1, optionsYesNo
		jal		Scene
		
		addi	$a0, $v0, 0	
		la		$a1, BBQBranch2	
		la		$a2, BBQBranch1
		jal		yesContinueNoLose
		j		$v0
		
	BBQBranch1:
		la		$a0, bbq1.10
		la		$a1, Nothing
		jal		Scene
		
		la		$a0, bbq1.10.1
		la		$a1, optionsTalkSearchInv
		jal		Scene	
		
		li		$t3, 3
		bne		$v0, $t3, lose5

		la		$a0, bbq1.10.2	
		la		$a1, Nothing	
		jal		Scene	
		
		j		win2
		
	BBQBranch2:
		la		$a0, bbq1.11
		la		$a1, Nothing
		jal		Scene
		
		la		$a0, bbq1.11.1
		la		$a1, optionsTalkSearchInv
		jal		Scene
		
		li		$t3, 3
		bne		$v0, $t3, lose7
		# else do this stuff		
		j		lose6


# WINE TOURS SCENE

wineTours:
	la		$a0, wineTours1
	la		$a1, optionsYesNo
	jal		Scene
	
	li		$t2, 2
	beq		$t2, $v0, WineTourCont1
	j		lose8
	
	WineTourCont1:
		la		$a0, wineTours2
		la		$a1, optionsYesNo
		jal		Scene
		
		li		$t1, 1
		beq		$t1, $v0, WineTourCont2
		j		lose9
	
	WineTourCont2:
		la		$a0, wineTours3
		la		$a1, optionsQuest
		jal		Scene
		
		# Handle response
		addi	$t2, $zero, 2
		beq		$v0, $t2, lose10
		addi	$t3, $zero, 3
		beq		$v0, $t3, FATalk
		j		WineTourCont3
		
		FATalk:
			la		$a0, wineTours3.1
			la		$a1, Nothing
			jal		Scene
			
			la		$a0, wineTours3.2
			la		$a1, Nothing
			jal		Scene
			
	WineTourCont3:
		la		$a0, wineTours4
		la		$a1, Nothing
		jal		Scene
		
		la		$a0, wineTours5
		la		$a1, optionsTalkSearchInv
		jal		Scene
		
		li		$t1, 1
		beq		$t1, $v0, WineTourCont4
		j		lose11
		
	WineTourCont4:
		la		$a0, wineTours6
		la		$a1, Nothing
		jal		Scene

		la		$a0, wineTours7
		la		$a1, Nothing
		jal		Scene
		
		la		$a0, wineTours8
		la		$a1, optionsYesNo
		jal		Scene
		
		li		$t1, 1
		beq		$t1, $v0, win3
		j		lose12


# PRINTING LOSE MESSAGES

	lose1:
		li		$v0, 4
		la		$a0, loseMsg1
		syscall
		j		end
	
	lose2:
		li		$v0, 4
		la		$a0, loseMsg2
		syscall	
		j		end
		
	lose3:
		li		$v0, 4
		la		$a0, loseMsg3
		syscall	
		j		end
		
	lose4:
		# system call to print lose message 
		li		$v0, 4
		la		$a0, loseMsg4
		syscall	
		j		end	
	
	lose5:
		# system call to print lose message 
		li		$v0, 4
		la		$a0, bbq1.10.3
		syscall	
		# system call to print lose message 
		li		$v0, 4
		la		$a0, loseMsg5
		syscall	
		j		end
	
	lose6:
		# system call to print lose message 
		li		$v0, 4
		la		$a0, loseMsg6
		syscall	
		j		end	
	
	lose7:
		li		$v0, 4
		la		$a0, loseMsg7
		syscall	
		j		end
	
	lose8:
		li		$v0, 4
		la		$a0, loseMsg8
		syscall
		j		end
	
	lose9:
		li		$v0, 4
		la		$a0, loseMsg9
		syscall	
		j		end
	
	lose10:
		li		$v0, 4
		la		$a0, loseMsg10
		syscall
		j		end
		
	lose11:
		li		$v0, 4
		la		$a0, loseMsg11
		syscall
		j		end
		
	lose12:
		li		$v0, 4
		la		$a0, loseMsg12
		syscall	
		j		end
	
	lose13:
		li		$v0, 4
		la		$a0, loseMsg13
		syscall	
		j		end	


# PRINTS SCENE MESSAGE AND ASKS FOR USER INPUT

Scene:
		li		$v0, 4
		syscall
		
		li		$v0, 4
		addi	$a0, $a1, 0
		syscall
		
		li		$v0, 4
		la		$a0, Prompt
		syscall	
		
		li		$v0, 5
		syscall 
	
		jr $ra


# LETS THE USER PRESS ENTER TO CONTINUE (WHEN NO OPTION IS PRESENT BUT THEY HAVE THE "CHOOSE" PROMPT AT THE BOTTOM)	

pause:
	li		$v0, 5
	syscall	
	
	jr $ra


# JUMPS/LABLES

yesContinueNoLose:

	addi	$t1, $zero, 1
	beq		$a0, $t1, setYesLabelOut

	setNoLabelOut:
		addi 	$v0, $a1, 0
		j		endYesContinueNoLose#
		
	setYesLabelOut:
		addi 	$v0, $a2, 0
		j		endYesContinueNoLose
		
	endYesContinueNoLose:
		jr 		$ra


# PRINTS DIALOGUE TEXT

dialouge:

	li      $v0, 4
	syscall
	
	li		$v0, 4
	addi	$a0, $a1, 0	
	syscall
	
	jr 		$ra


# HANDLES DECISIONS IN OPTIONS 2 - TALK SEARCH INVENTORY

handleoptionsTalkSearchInv:
	# Push $ra onto stack.
	addi	$sp, $sp, -4
	sw		$ra, 0($sp)	

	addi	$t1, $zero, 1	# $t1 = 1
	addi	$t2, $zero, 2	# $t2 = 2
	
	beq		$a0, $t1, handleTalk
	beq		$a0, $t2, handleSearch
	
	handleTalk:
		addi	$a0, $a1, 0	
		jal		getSceneTalk
		
		j		endHandleoptionsTalkSearchInv
		
	handleSearch:
		addi	$a0, $a1, 0	
		jal		getSceneSearch
		
		j		endHandleoptionsTalkSearchInv
		
	endHandleoptionsTalkSearchInv:	
		# Function is complete, pop $ra and return.
		lw		$ra, 0($sp)
		addi	$sp, $sp, 4
		jr		$ra

getSceneTalk:
	addi	$sp, $sp, -4
	sw		$ra, 0($sp)
	
	addi	$v0, $a2, 0
	
	endGetSceneTalk:	
		lw		$ra, 0($sp)
		addi	$sp, $sp, 4
		jr		$ra

getSceneSearch:
	addi	$sp, $sp, -4
	sw		$ra, 0($sp)
	
	addi	$v0, $a3, 0
	
	endGetSceneSearch:	
		lw		$ra, 0($sp)
		addi	$sp, $sp, 4
		jr		$ra


# SWITCHING SCENES BASED ON CHOICES

travelActivityOrFood:
	# Push $ra onto stack.
	addi	$sp, $sp, -4
	sw		$ra, 0($sp)

	la		$a0, travel1
	la		$a1, optionsEventType
	jal		Scene
	
	addi	$sp, $sp, -4
	sw		$v0, 0($sp)
	
	la		$a0, travel2
	la		$a1, optionsSecrets
	jal		Scene
	
	lw		$t0, 0($sp)
	addi	$sp, $sp, 4
	
	addi	$t1, $zero, 1
	beq		$t0, $t1, activityChoice
	j		foodDrinksChoice

	foodDrinksChoice:
		beq		$v0, $t1, kickoffBBQTravel
		j		wineToursTravel

	activityChoice:	
		beq		$v0, $t1, cedarPointTravel
		j		guardiansGameTravel		

	kickoffBBQTravel:
		la		$v0, kickoffBBQ
		j		endTravelActivityOrFood
	
	wineToursTravel:
		la		$v0, wineTours
		j		endTravelActivityOrFood

	cedarPointTravel:
		la		$v0, cedarPoint
		j		endTravelActivityOrFood
	
	guardiansGameTravel:
		la		$v0, guardiansGame
		j		endTravelActivityOrFood
	
	endTravelActivityOrFood:
		# Function is complete, pop $ra and return.
		lw		$ra, 0($sp)
		addi	$sp, $sp, 4	
		jr		$ra


# PLAY AGAIN

end:
	la		$a0, Again
	la		$a1, optionsYesNo
	jal		Scene
	
	addi	$t1, $zero, 1
	beq		$v0, $t1, main

	li      $v0, 10
	syscall


# DIALOGUE SECTION

        .data
Nothing:	.asciiz ""
DormIntro:		.asciiz "You are sitting in your living room in the upperclassman village, happy to finally be done with finals. You are reviewing the exciting senior week schedule when there is suddenly, a knock at the door. Answer it?\n"
KnockAgain:	.asciiz "\nYou ignore it, it's probably nothing important. You try to focus back on the schedule but the person outside knocks a lot louder. Answer it?\n"

CedarPointIntro:	.asciiz "\nYou arrive at Cedar Point and your senses are flooded with many smells and the loud shrieking of coasters on their tracks. \nWhat ride would you like to go on first?\n"

# The text for the Ancient America section of the game
BBQIntro:	.asciiz "\n You walk across campus to KSL Oval to get to the BBQ!!!\n... \n It's pretty cool. \n You arrive to find a crowd of students already in line. \n...\n Another student approaches. \nWhat do you do? \n"

bbq1.1:	.asciiz "\n The afternoon sun is very bright in the sky. It blinds you and you close your eyes briefly. \n"
bbq1.2:	.asciiz "\nYou open your eyes, squinting at the bright sunlight. You are by a table with filled with chicken wings and beer. You look around and see several other slightly drunk students standing nearby. One of the students notices you and approaches you. \n"
bbq1.3:	.asciiz "\n ?: \"Whoa, I've never met you before - Are you a senior?\"\nYou see the student take another swig of his beer. \n"
bbq1.4:	.asciiz "\nYou: \"Yep! I just woke up from a nap, and now I'm looking to eat some chicken for the senior week barbeque!\"\n"
bbq1.5:	.asciiz "\n Charlie: \"Well, nice to meet you! My name is Charlie, president of Theta Chi. Some of my frat brothers saw you wandering around this event. They thought you might be one of the underclassmen stealing food from the seniors. We're about to go look for them now. This group of seniors is prepared to confront them about taking our food! You should join us.\"\n"
bbq1.5.1:	.asciiz "\nYou: \"What can you tell me about these underclassmen?\"\n"
bbq1.5.2:	.asciiz "\nCharlie: \"They will take free food wherever they can get it. They just beat the seniors in the Hudson Relay and now they're taking from our senior week events! I roundeded up some of my friends, but we still need one more person to help us stop them from taking our food. I believe that you can help us stop them.\"\n"
bbq1.6:	.asciiz "\nYou: \"I will join you, but I will need a flier for the event that states that underclassmen are not allowed.\"\n"
bbq1.7:	.asciiz "\n Charlie: \"Here is a flier.\" Charlie presents a blue flier. It says clearly on it that this event is for seniors only. Take the flier? \n"
bbq1.8:	.asciiz "\n You follow the group of frat guys, past groups of seniors waiting for their food. You pass several tables that were meant to hold food but now sit barren. Ahead you see a group of freshman, standing in front of Tink. \n"
bbq1.9:	.asciiz "\n As you approach the freshman, Charlie tells all the frat guys to stop and wait for a second. He starts coming over to you. \nCharlie: \"Let us talk to the freshman and provide a distraction - I don't think they have our food. You need to get past them to Thwing so you can find the real culprits.\"\nHead to Thwing?\n"
bbq1.10:	.asciiz "\n The guys go confront the group of freshman, while you sneak around and make your way towards Thwing. The freshman seem to be getting in a heated debate with your group of seniors. You reach Thwing and head inside. \n"
bbq1.10.1:	.asciiz "\n You enter Thwing and see trays full of chicken - the food for the barbeque! As you approach, you feel like someone is watching you, from behind. What do you do?\n"
bbq1.10.2:	.asciiz "\n You turn around to find a junior, the one who has taken the food! You pull out the flier and show them where it clearly says this food is for seniors! They apologize; they thought it was for a different event, and they leave.\n"
bbq1.10.3:	.asciiz "\n You turn around to find a junior right behind you. Before you can say anything, they ask you what you are doing interrupting their event. \nYou: \"Is this not the food for the Senior Week Kickoff Barbeque?\"\nJunior: \"No, this is for the Thwing Study Over.\"\nThey gesture towards the food. \nJunior: \"This food isn't avaiable until 8:00, though, so you'll have to wait.\"\n"
bbq1.11:	.asciiz "\n The group of seniors heads towards the group of freshman, ready for possible confrontation. They block your way to Thwing. You ask a few if they have seen the food intended for the barbeque. They point you in the right direction, towards Thwing again. \n"
bbq1.11.1:	.asciiz "\nYou head into Thwing and begin looking around for the missing food. You find a group of juniors standing around, who look hungry, like they are waiting for something to eat. \n What do you do?.\n"

# The text for the Future Egypt section of the game
guardiansGameIntro:	.asciiz "\n You take a bus to the Guardian's game. The game goes poorly - the Guardians lose really badly, you spill your popcorn before you can eat it, and it begins to rain as you leave. \n YOU LOSE! \n"

# The text for the Wine Tours section of the game
wineTours1:	.asciiz "\nAfter a significant bus ride into downtown Cleveland, you arrive at the main area for the wine tours. The main group is heading inside one of the wine tour stops when you notice a bit of a commotion coming from the neighboring establishment. \nDo you ignore it?\n"
wineTours2:	.asciiz "\nYou head over to the commotion and notice an upset woman with wine spilt on her dress, next to a very angry man and a concerned server. \nDo you enter the conversation?\n"
wineTours3:	.asciiz "\n You tune into the conversation and overhear that the man was angry with the women for having an alleged affair! \nYou go to turn away as this is not your business but the woman sees you before you have the chance and she calls you over. \nDo you go? \n"
wineTours3.1:	.asciiz "\n You: \"I could probably use a bit more context here if you'd really like me to get involved.\"\n"
wineTours3.2:	.asciiz "\n Woman: \"I have been engaged to this man for three years after ten years of dating and five years living together. You would think after all this time he would know that I am not keeping a secret relationship from him with his BROTHER.\"\n"
wineTours4:	.asciiz "\n You: \"So what can I do?\"\n"
wineTours5:	.asciiz "\n Woman: \"I need an OBJECTIVE opinion, does this conversation make it look like I'm having an affair?\"\nThe woman holds out her phone to you, which is displaying a text conversation.\nDo you just keep talking or search in her text conversation?\n"
wineTours6:	.asciiz "\n You: \"I really don't think I should be putting my opinion into this, I have no idea who you two are\"\n"
wineTours7:	.asciiz "\n The woman hesitates for a moment.\n Woman: \"I guess you are right, I'm not sure what I was thinking. My own fiance doesn't listen to me so why would some random person.\"\n"
wineTours8:	.asciiz "\n You start to feel some pity for the woman who seems to be in a terrible situation. Do you go along with it and look at her phone?\n"

loseMsg1:	.asciiz "\nYou continue sitting in your living room, ignoring whoever is outside. Eventually, the knocking stops and you are able to focus again. Unfortunately, you are unable to come to a final decision on what senior week events you want to attend and end up doing none.\nYOU LOSE!\n"
loseMsg2:	.asciiz "\nSpartie looks upset and leaves. You close the door behind him and return to your seat, where you stare at the senior week schedule for another few hours.\nYOU LOSE!\n"
loseMsg3:	.asciiz "\n He gets angry at you for saying you are not a senior, muttering about underclassmen crashing senior week events. He reports you as an underclassman who is trying to take the senior's food, and you leave the barbeque with no food. \nYOU LOSE!\n"
loseMsg4:	.asciiz "\nCharlie seems disappointed you don't want to help, but goes to look for the food without you. The group is unsuccessful and the seniors don't get to eat any barbeque. \nYOU LOSE!\n"
loseMsg5:	.asciiz "\n The junior angrily kicks you out of Thwing and you do not get a chance to figure out where the food went. The seniors are all disappointed and leave the barbeque. \nYOU LOSE!\n"
loseMsg6:	.asciiz "\nYou attempt to argue with the junior about what the food is for, but since you don't have the flier, they don't believe you. Then, a group of other juniors shows up and you have to accept that they won't give the food back. You leave sadly and go hungry with no barbeque food. \nYOU LOSE!\n"
loseMsg7:	.asciiz "\n You open your mouth but no words come out. Charlie comes charing in to Thwing and attempts to talk with the junior, however, they are very stubborn and stick by the food being for their own event. You and Charlie leave dejectedly. \nYOU LOSE!\n"
loseMsg8:	.asciiz "\nYou decide to ignore the commotion next door. You just blindly follow around your fellow students on a wine tour until it's time to go home. Nothing eventful happens and it was a waste of twenty dollars. \nYOU LOSE!\n"
loseMsg9:	.asciiz "\n You decide that you should mind your own business and return to the wine tours, only to find that you have somehow lost the group. You end up sitting alone, sipping on wine before finding some way back to campus. \nYOU LOSE! \n"
loseMsg10:	.asciiz "\nYThe woman gets angry at you for ignoring her plea and throws her wine glass at you. You spend the rest of the evening in the hospital and miss the wine tours.\nYOU LOSE!\n"
loseMsg11:	.asciiz "\nYou take the woman's phone but before you can read anything over, the fiance takes it from you and hits you over the head with it. You wake up hours later in the hospital with a splitting headache. \nYOU LOSE!\n"
loseMsg12:	.asciiz "\nYou politely decline and say you've already interfered enough and wish the couple a good night. You return to the wine tours, only to find that you have somehow lost the group. You end up sitting alone, sipping on wine before finding some way back to campus. \nYOU LOSE!\n"
loseMsg13:	.asciiz "\nYou refuse and try to tell the man that you are not a god, nor a king. The crowd erupts in panic and anger, and soldiers come over and cut off your head.\nYOU LOSE!\n"

meetSpartie:	.asciiz "\nYou open your suite door to find Spartie standing there.\n"
spartie:		.asciiz "Spartie: "
spartieIntro1:	.asciiz "\"Hello, my name is Spartie!\"\n"
spartieIntro2:	.asciiz "\"I've heard that you are having some trouble deciding on senior week events and would hate for you to miss out.\"\n"
spartieQuestion:.asciiz "\"Great! First off, what type of senior week event are you interested in?\"\n"
spartieOffer:	.asciiz "Spartie offers you help. Accept it?\n"

# cedar point options both lead here
winMsg1:	.asciiz "\nYou go on to have grand adventures.\nYOU WIN!\n"
winMsg2:	.asciiz "\n The junior agrees that the food is yours, and lets you take it. Charlie and the other frat boys help you move it out to the Oval so the barbeque can take place. Charlie thanks you for all of your help and you all enjoy a delicious barbeque! \nYOU WIN!\n"
winMsg3:	.asciiz "\nWith your incredible insight skills developed in SAGES, you look over her conversation and see nothing of note. You help to diffuse the situation and say goodbye to the couple, heading back to the rest of the seniors on the wine tour. You are content with how you handled the situation and enjoy some wine.\nYOU WIN!\n"
winMsg4:	.asciiz "\nThe magistrate places the crown on your head and you become the leader of these people. Your knowledge allows you to build the greatest empire the world has ever seen.\nYOU WIN!\n"

SpartieHappy:		.asciiz "You made Spartie happy!
           :D\n"

travel1:	.asciiz "Where do you want to go?\n"
travel2:	.asciiz "Pick a secret option!\n"

optionsYesNo:	.asciiz "[yes = 1, no = 2]\n"									# Basic yes/no
optionsTalkSearchInv:	.asciiz "[talk = 1, search = 2, open inventory = 3]\n"			# General scene options
optionsEventType:	.asciiz "[Activity = 1, Food/Drinks = 2]"						# Type of senior week activity options
optionsSecrets:	.asciiz "[Option 1 = 1, Option 2 = 2]"							# Food/Drink Options
optionsQuest:	.asciiz "[join quest = 1, don't join = 2, talk more = 3]"		# General quest one
optionsRides:	.asciiz "[Millennium Force = 1, Top Thrill Dragster = 2]\n"		# Cedar Point ride options
Prompt:   	.asciiz "\nChoose => "
Again:		.asciiz "\n\n--------------------------------------------------------------------------------\nPlay Again?\n"

# a word boundary alignment
        .align 2
