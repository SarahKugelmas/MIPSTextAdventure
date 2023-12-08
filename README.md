# MIPSTextAdventure
Text Adventure game created using MIPS Assembly Language in the environment QtSpim, with the game taking place in its console.

## README Sections
1. How to Run using QtSpim<br />
2. How to Play<br />
3. Code Overview<br />

# How to Run using QtSpim
<img width="292" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/9b0d9390-1f47-4d12-ba0e-4a222688e106"><br />
^ Load .asm code file<br />

<img width="323" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/6507c143-f465-4b8b-ae90-52b23f8749c4"><br />
^ Make sure the Console window is enabled<br />

<img width="293" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/08360875-82db-4d6f-a862-e9c9922642b4">
<br />
^ Run/Continue should cause the game to begin in the console<br />

<img width="404" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/d00d166f-ceb4-4204-9b3e-b7f9c8120fc5"><br />
^ The game is properly loaded and running if the console appears like this, with the opening dialogue displayed.<br />

# How to Play
<img width="398" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/915add94-b7c4-4734-b7c9-c1051b3e4350"><br />
^ When given "Choose =>" at the bottom of the current dialogue, input the numbers of the the option you want to go with and hit enter. You cannot backspace in QtSpim console, so make sure you don't type a number before being fully decided.<br />

<img width="395" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/93e142a2-40e2-48d9-9cd6-28ccb760c3c0"><br />
^ If you give more than one input number or try to backspace, it will take the first thing you typed as the selected option. In this above example, it took option 2 as the user inputted answer.

<img width="383" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/4b8fd998-de5a-480b-b086-898da86059d1"><br />
^ If dialogue is displayed without showing "Choose =>" at the bottom, it means there is more dialogue to read in this section. Just hit enter until the dialogue is finished (aka until you get the "Choose =>" option showing up at the bottom.

# Code Overview
## Scenes
<img width="242" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/8d502b54-3acd-4dec-aec5-7deeab99ae2a"><br />
^ Example of a coded scene

First section displays introductory dialogue and prompts the user to choose an option. Based on the option chosen, jumps to certain scenes.<br />
Second section handles user choice by jumping to the proper point (scene) and displays the associated response dialogue.<br />
In this example, either user choice leasds to the same win condition, shown in the bottom line of code.<br />

## Win/Loss Conditions
<img width="197" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/a4d2371a-0204-4522-8efe-6935594a32ab"><br />
^ Example of win condition code

<img width="196" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/48f3557b-3e24-4e54-9bdb-c766d42af85d"><br />
^ Example of lose condition code

Loads the address of the appropriate win or loss message and syscall prints the string at the indicated address of the message. Then, jumps to the ending since the user has finished. In this case, asks the user if they want to play again through the end function described later in this document.

## Scene Messages/User Response
<img width="210" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/c75339e8-48d3-4a7c-8440-ef00ae22acb4"><br />
^ Example of a scene's dialogue generation code

Functions similarly to the win/loss conditions code. Loads a system call to the proper address of the dialogue string and prints the string at that address. Also shows the reading of user input after being given options via dialogue.

## Pause Function
<img width="130" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/17f854ca-4582-47e7-90ee-60bbd4875c2e"><br />
^ Pause function code

Asks for user input; the user has to hit enter to continue playing

## Handle User Options
<img width="192" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/77badd3d-a05c-45e3-b360-90cbe0fa7711"><br />
^ Example of handling user input with two potential paths

Each potential user response has a path for the proper dialogue/response.

## End Function
<img width="189" alt="image" src="https://github.com/SarahKugelmas/MIPSTextAdventure/assets/79024622/0795010d-3cac-4cad-9152-78ed488166d9"><br />
^ End function code

Asks player if they want to play again and waits for a response. If yes, game restarts by calling the main function. If not, game quits.
