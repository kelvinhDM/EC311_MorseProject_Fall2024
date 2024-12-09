# EC311_MorseProject_Fall2024


**BU Fall 2024 EC311**

Morse Code Translator

Team 10: AJ Chiaravalloti, Maria Davey, Bryan Lam, and Kelvin Huang

# Overview of the Project

Our project takes an input of Morse code, a series of dots and dashes, and translates it into its respective letter, number, or symbol based on the International Telecommunications Union standard for Morse code. We used four buttons: dot, dash, reset, and send to allow a user to input their desired Morse code combination. Our project uses both a VGA display output and the seven segment display built into the FGPA to display the equivalent ASCII character of the code combination. VGA displays the combination's translated character upon send button press, while the seven segment display will show the current character based on the sequence of dots/dashes that the user has pressed regardless of send input. If the user makes a mistake he/she can press the reset button to clear the inputs, and start from the beginning. Note that the seven segment display only shows the letter/number, it cannot display characters such as "@" or "+". The user also has the option to turn the VGA or seven segment display off with the rightmost switches on the FPGA, and use only one of the options (or neither if not in use).

# How to Run the Project

Note: Button position is referring to a 5 button set-up in a plus sign. The lowermost button is not used. 

After downloading all v-files and the constraint files into a project, set MorseTop to the top of the hierarchy. Afterwords, generate a bitstream and push it to the FPGA. First make sure the seven segment display and VGA are on with the two rightmost switches on the FPGA. If the seven segment display is on, the rightmost decimal will appear red. If the VGA is on, the leftmost green LED will be on. Once these are on, enter your Morse code. Use the leftmost button for dot inputs, and middle button for dash inputs. You should see the seven segment display change as you enter your code, while the VGA should remain the same. Once you finish submitting your code, hit the send button (the rightmost button). If you inputed your code correctly, you should see your letter/number/symbol appear on screen via the VGA. Please note that while the letters and numbers will appear on the seven segment display, the symbols will not. Also note if you do an input that does not coincide with a letter/number/symbol from the ITU Morse code standard, an error sign will appear on the VGA, and the seven segment display will appear blank. If you make a mistake, hit the reset button (the upmost button) to clear your inputs. You should see the VGA and seven segment display go blank, and you can start your input from the beginning. You do not need to hit reset after every input is pushed to the VGA, you can begin entering the next code immediately.

Note: The 6 rightmost green LEDs correspond to the respective 6-bit binary value each letter/number/symbol was assigned (as seen in GetCode.v).

# Code Structure


