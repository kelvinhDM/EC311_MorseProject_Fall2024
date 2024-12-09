# EC311 MorseProject Fall2024


**BU Fall 2024 EC311**

<img width="1212" alt="Screenshot 2024-12-09 at 8 44 30 AM" src="https://github.com/user-attachments/assets/e5d48d65-68db-4845-bb12-7f9a2468af85">

# Overview of the Project

Our project takes an input of Morse code, a series of dots and dashes, and translates it into its respective letter, number, or symbol based on the International Telecommunications Union standard for Morse code. We used four buttons: dot, dash, reset, and send to allow a user to input their desired Morse code combination. Our project uses both a VGA display output and the seven-segment display built into the FGPA to display the equivalent ASCII character of the code combination. VGA displays the combination's translated character upon the send button press, while the seven-segment display will show the current character based on the sequence of dots/dashes that the user has pressed regardless of the send input. If the user makes a mistake he/she can press the reset button to clear the inputs and start from the beginning. Note that the seven-segment display only shows the letter/number, it cannot display characters such as "@" or "+". The user also has the option to turn the VGA or seven-segment display off with the rightmost switches on the FPGA and use only one of the options (or neither if not in use).

# How to Run the Project

*Note:* Button position is referring to a 5 button set-up in a plus sign. The lowermost button is not used. 

After downloading all v-files and the constraint files into a project, set MorseTop to the top of the hierarchy. Afterward, generate a bitstream and push it to the FPGA. First, make sure the seven-segment display and VGA are on with the two rightmost switches on the FPGA. If the seven-segment display is on, the rightmost decimal will appear red. If the VGA is on, the leftmost green LED will be on. Once these are on, enter your Morse code. Use the leftmost button for dot inputs, and the middle button for dash inputs. You should see the seven-segment display change as you enter your code, while the VGA should remain the same. Once you finish submitting your code, hit the send button (the rightmost button). If you input your code correctly, you should see your letter/number/symbol appear on the screen via the VGA. Please note that while the letters and numbers will appear on the seven-segment display, the symbols will not. Also note if you do an input that does not coincide with a letter/number/symbol from the ITU Morse code standard, an error sign will appear on the VGA, and the seven-segment display will appear blank. If you make a mistake, hit the reset button (the upmost button) to clear your inputs. You should see the VGA and seven-segment display go blank, and you can start your input from the beginning. You do not need to hit reset after every input is pushed to the VGA, you can begin entering the next code immediately.

*Note:* The 6 rightmost green LEDs correspond to the respective 6-bit binary value each letter/number/symbol was assigned (as seen in GetCode.v).

# Code Structure

**MorseTop.v -** takes the four button inputs and puts them into a debouncer, along with the input of the two power switches. It also accepted a clock input.

**GetCode.v -** accepts the clean button inputs and the clock input. At the positive edge of the    clock, it checks the input. If a dot or dash is inputted, it will check the current input (blank, E, T, etc.) and iterate to the next letter/number/etc. value based on the current value. If send is pressed, it will assign the temporary letter value to a current letter (code) value, which will be outputted. Note that the temporary letter value (temp_letter) is also outputted. If reset is pressed, all output variables will be set back to "blank".

**converter.v -** accepts the temp_letter (NOT the code) value mentioned in GetCode, along with the clock and on-off power switch. At the positive edge of the lock, if the power switch is on the temp_letter will be put into a case statement. Each letter and number corresponds to a seven-segment letter or number display. Therefore, as the user enters the code, the case statement will be called and the proper seven-segment letter/number outputed (without needing to be sent).

**vgatop.v -** accepts the VGA power switch, the clock, the reset button, and the code from GetCode (NOT the temp_letter). The clock is divided, and at the positive edge of this new clock, if the vga power switch is on, certain LEDs will be turned on (with color white). Which LEDs should be turned on is determined by the VGA controller. Note the vgatop also outputs and h_sync and v_sync value (needed for the VGA), which comes from the vga controller.

**vgacontroller.v -** accepts the code, new clock, and reset button from before. At the positive edge of the new clock, the code will be ran through a case statement. Depending on the code, six boxes will be assigned to six registers. Each box is assigned an inequality, which sets the upper and lower width and height. Each part of the case statement corresponds to different letter/number/symbol dimensions. These registers are assigned to wires, and these wires' dimensions set which LEDs should be on. This led_on value is outputted, along with the h_sync and v_sync values needed for setting up the VGA.

**morsedebouncer.v -** standard debouncer for our buttons.

**clkdivider.v -** standard clock divider for the FPGA clock.

**constraints_b -** used to generate the bitstream. Assigns the clock, switches, buttons, LEDs, seven-segment display, and VGA values to respective parts of the FPGA.

***ADD MARIA'S TESTBENCH INFO***

***NEED TO ADD VIDEO "LINK" (THEY MAY WANT US TO PUT THE VIDEO IN THE README SOMEHOW???***

***MAYBE MENTION WE GOT THE VGA FILES FROM ABIN AND WHERE WE GOT THE SEVEN SEGMENT DISPLAY STUFF***
