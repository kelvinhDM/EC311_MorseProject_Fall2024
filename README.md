# EC311_MorseProject_Fall2024


**BU Fall 2024 EC311**

Group 10: AJ Chiaravalloti, Maria Davey, Bryan Lam, and Kelvin Huang


# Project Requirements

## Official:

Examples	of	translators	could	be	Morse	Code	(i.e., push	a sequence	of	buttons	
on	the	board for	various	durations and	watch	the	ASCII	text	appear	on	the	host	computer	
screen),	Spell	Checker	(i.e.	,send	in	a	word	and	have	the	FPGA	determine	if	it	is	spelled	
correctly	or	not	based	on	a	pre-computed	dictionary)	or	English	to	X	(i.e., pre-computed	
dictionaries	provide	the	correspondence	between	English	and	X	words)

## Our Requirements
- Push a sequence of buttons for various durations
- ASCII text displays on host computer screen

Our implementation as of December 2nd:
- Four buttons: Dot, Dash, Reset, and Send
- The 26 English alphabet partially implemented
- Text is not typed out. Message currently displays letters one by one on screen.
- For our display option, we have chosen to utilize VGA
