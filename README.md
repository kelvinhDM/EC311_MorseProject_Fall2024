# EC311_MorseProject_Fall2024


**BU Fall 2024 EC311**

Morse Code Translator
Team 10: AJ Chiaravalloti, Maria Davey, Bryan Lam, and Kelvin Huang

# Overview of the Project

Our project takes an input of Morse code, a series of dots and dashes, and translated them into their respective letter, number, or symbol based on International Telecommunications Union standards. We used four buttons: dot, dash, reset, and send

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
