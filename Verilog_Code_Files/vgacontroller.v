`timescale 1ns / 1ps

module vgacontroller(lett, clk, reset, h_sync, v_sync, led_on);
    
    input [5:0] lett;
    input clk, reset;
    output reg h_sync, v_sync, led_on;
        
    localparam TOTAL_WIDTH = 800;
    localparam TOTAL_HEIGHT = 525;
    localparam H_SYNC_COLUMN = 704;
    localparam V_SYNC_LINE = 523;
    
    reg [11:0] widthPos = 0;
    reg [11:0] heightPos = 0;   
     
    reg inBoundsa; // Lowermost Horizontal Line
    reg inBoundsb; // Leftmost Vertical Line
    reg inBoundsc; // Rightmost (Lower) Vertical Line
    reg inBoundsd; // Uppermost Horizontal Line
    reg inBoundse; // Rightmost (Upper) Vertical Line
    reg inBoundsf; // Middle Horizontal Line    
    // Note, don't actually follow the above descriptions for them often.  
        
    always @ (posedge clk) begin
    case(lett)
    
        6'b111111:begin
            // Blank screen
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
    
        6'b000000:begin
            // Letter "A"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (290)) & (heightPos > (240))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (150)) & (heightPos > (100))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b000001:begin
            // Letter "B"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (265))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (235)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (275)) & (heightPos > (225))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b0000010:begin
            // Letter "C"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (365))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (210)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b000011:begin
            // Letter "D"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (460)) & (heightPos > (410))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (115))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b000100:begin
            // Letter "E"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (310)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b000101:begin
            // Letter "F"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (310)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b000110:begin
            // Letter "G"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (295))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (210)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (375)) & (widthPos < (475)) & (heightPos < (315)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b000111:begin
            // Letter "H"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (310)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b001000:begin
            // Letter "I"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (355)) & (widthPos < (395)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b001001:begin
            // Letter "J"
            inBoundsa = ((widthPos > (315)) & (widthPos < (415)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (395)) & (widthPos < (435)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (300)) & (widthPos < (340)) & (heightPos < (425)) & (heightPos > (370))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line (Bottom Left in this Case)
            inBoundsd = ((widthPos > (300)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b001010:begin
            // Letter "K"
            inBoundsa = ((widthPos > (365)) & (widthPos < (415)) & (heightPos < (375)) & (heightPos > (310))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (405)) & (widthPos < (455)) & (heightPos < (450)) & (heightPos > (360))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (365)) & (widthPos < (415)) & (heightPos < (260)) & (heightPos > (190))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (405)) & (widthPos < (455)) & (heightPos < (215)) & (heightPos > (125))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (375)) & (heightPos < (315)) & (heightPos > (255))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b001011:begin
            // Letter "L"
            inBoundsa = ((widthPos > (250)) & (widthPos < (500)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (100))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b001100:begin
            // Letter "M"
            inBoundsa = ((widthPos > (290)) & (widthPos < (350)) & (heightPos < (245)) & (heightPos > (170))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (400)) & (widthPos < (460)) & (heightPos < (245)) & (heightPos > (170))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (360)) & (widthPos < (390)) & (heightPos < (305)) & (heightPos > (275))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (340)) & (widthPos < (410)) & (heightPos < (285)) & (heightPos > (235))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b001101:begin
            // Letter "N"
            inBoundsa = ((widthPos > (290)) & (widthPos < (350)) & (heightPos < (245)) & (heightPos > (170))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (400)) & (widthPos < (460)) & (heightPos < (405)) & (heightPos > (330))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (370)) & (widthPos < (410)) & (heightPos < (340)) & (heightPos > (285))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (340)) & (widthPos < (380)) & (heightPos < (295)) & (heightPos > (240))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b001110:begin
            // Letter "O"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b001111:begin
            // Letter "P"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;          // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (400)) & (widthPos < (450)) & (heightPos < (260)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (300)) & (heightPos > (250))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b010000:begin
            // Letter "Q"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (375))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (465)) & (widthPos < (515)) & (heightPos < (465)) & (heightPos > (415))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
           
        6'b010001:begin
            // Letter "R"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;          // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (400)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (290))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (400)) & (widthPos < (450)) & (heightPos < (260)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (300)) & (heightPos > (250))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b010010:begin
            // Letter "S"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (285)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (285))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b010011:begin
            // Letter "T"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;       // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (355)) & (widthPos < (395)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (250)) & (widthPos < (500)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b010100:begin
            // Letter "U"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (100))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (100))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b010101:begin
            // Letter "V"
            inBoundsa = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (270)) & (widthPos < (320)) & (heightPos < (300)) & (heightPos > (145))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (430)) & (widthPos < (480)) & (heightPos < (300)) & (heightPos > (145))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (310)) & (widthPos < (360)) & (heightPos < (405)) & (heightPos > (295))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (390)) & (widthPos < (440)) & (heightPos < (405)) & (heightPos > (295))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b010110:begin
            // Letter "W"
            inBoundsa = ((widthPos > (290)) & (widthPos < (350)) & (heightPos < (405)) & (heightPos > (330))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (400)) & (widthPos < (460)) & (heightPos < (405)) & (heightPos > (330))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (360)) & (widthPos < (390)) & (heightPos < (325)) & (heightPos > (295))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (340)) & (widthPos < (410)) & (heightPos < (365)) & (heightPos > (315))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b010111:begin
            // Letter "X"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (300)) & (widthPos < (350)) & (heightPos < (460)) & (heightPos > (305))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (400)) & (widthPos < (450)) & (heightPos < (460)) & (heightPos > (305))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (350)) & (heightPos < (265)) & (heightPos > (110))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (400)) & (widthPos < (450)) & (heightPos < (265)) & (heightPos > (110))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (345)) & (widthPos < (405)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b011000:begin
            // Letter "Y"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (270)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (270)) & (heightPos > (115))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (460)) & (heightPos > (300))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b011001:begin
            // Letter "Z"
            inBoundsa = ((widthPos > (280)) & (widthPos < (340)) & (heightPos < (405)) & (heightPos > (330))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (500)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (250)) & (widthPos < (500)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (410)) & (widthPos < (470)) & (heightPos < (245)) & (heightPos > (170))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (365)) & (widthPos < (425)) & (heightPos < (300)) & (heightPos > (235))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (325)) & (widthPos < (385)) & (heightPos < (345)) & (heightPos > (280))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b011010:begin
            // Number "1"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (355)) & (widthPos < (395)) & (heightPos < (425)) & (heightPos > (100))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (375)) & (heightPos < (225)) & (heightPos > (175))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
                
        6'b011011:begin
            // Number "2"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (425)) & (heightPos > (285))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (285)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (200)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b011100:begin
            // Number "3"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (280)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (290))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (330)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b011101:begin
            // Number "4"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (290)) & (heightPos > (115))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (460)) & (heightPos > (115))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (475)) & (heightPos < (310)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b011110:begin
            // Number "5"
            inBoundsa = ((widthPos > (275)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (310)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (285))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b011111:begin
            // Number "6"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (200)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (290))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b100000:begin
            // Number "7"
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (450)) & (heightPos > (300))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (385)) & (widthPos < (435)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (270)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b100001:begin
            // Number "8"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b100010:begin
            // Number "9"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (280)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (425)) & (heightPos > (375))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        6'b100011:begin
            // Number "0"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b100100:begin
            // Punctuation "+"
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (325)) & (heightPos > (275))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (385)) & (heightPos > (215))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b100101:begin
            // Punctuation "="
            inBoundsa = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (350)) & (heightPos > (300))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (250)) & (heightPos > (200))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b100110:begin
            // Punctuation "/"
            inBoundsa = ((widthPos > (425)) & (widthPos < (485)) & (heightPos < (235)) & (heightPos > (175))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (385)) & (widthPos < (445)) & (heightPos < (280)) & (heightPos > (220))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (345)) & (widthPos < (405)) & (heightPos < (325)) & (heightPos > (265))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (305)) & (widthPos < (365)) & (heightPos < (370)) & (heightPos > (310))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (265)) & (widthPos < (325)) & (heightPos < (415)) & (heightPos > (355))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (225)) & (widthPos < (285)) & (heightPos < (460)) & (heightPos > (400))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b100111:begin
            // Punctuation "("
            inBoundsa = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (425)) & (heightPos > (365))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (400)) & (heightPos > (175))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (300)) & (widthPos < (350)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (210)) & (heightPos > (150))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (300)) & (widthPos < (350)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b101000:begin
            // Punctuation "?"
            inBoundsa = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (260)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (425)) & (widthPos < (475)) & (heightPos < (280)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (300)) & (widthPos < (450)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (375)) & (heightPos > (285))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (375)) & (widthPos < (450)) & (heightPos < (310)) & (heightPos > (260))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b101001:begin
            // Punctuation """
            inBoundsa = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (220)) & (heightPos > (150))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (275)) & (widthPos < (325)) & (heightPos < (220)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (365)) & (widthPos < (385)) & (heightPos < (250)) & (heightPos > (210))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (290)) & (widthPos < (310)) & (heightPos < (250)) & (heightPos > (210))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b101010:begin
            // Punctuation "."
            inBoundsa = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b101011:begin
            // Punctuation "@"
            inBoundsa = ((widthPos > (375)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (375)) & (widthPos < (425)) & (heightPos < (425)) & (heightPos > (325))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (325)) & (widthPos < (425)) & (heightPos < (350)) & (heightPos > (225))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b101100:begin
            // Punctuation "'"
            inBoundsa = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (220)) & (heightPos > (150))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Leftmost Vertical Line
            inBoundsc = ((widthPos > (365)) & (widthPos < (385)) & (heightPos < (250)) & (heightPos > (210))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b101101:begin
            // Punctuation "-"
            inBoundsa = ((widthPos > (310)) & (widthPos < (440)) & (heightPos < (300)) & (heightPos > (250))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
                
        6'b101110:begin
            // Punctuation ")"
            inBoundsa = ((widthPos > (375)) & (widthPos < (425)) & (heightPos < (425)) & (heightPos > (365))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (400)) & (widthPos < (450)) & (heightPos < (400)) & (heightPos > (175))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (375)) & (widthPos < (425)) & (heightPos < (210)) & (heightPos > (150))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b101111:begin
            // Punctuation ","
            inBoundsa = ((widthPos > (325)) & (widthPos < (375)) & (heightPos < (365)) & (heightPos > (300))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (350)) & (widthPos < (375)) & (heightPos < (410)) & (heightPos > (355))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (340)) & (widthPos < (360)) & (heightPos < (420)) & (heightPos > (390))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
            
        6'b110000:begin
            // Punctuation ":"
            inBoundsa = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (350)) & (heightPos > (300))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (250)) & (heightPos > (200))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end
        
        6'b110001:begin
            // Letter "�"
            inBoundsa = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (450)) & (heightPos > (125))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (110)) & (heightPos > (60))) ? 1'b1:1'b0;  // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (275)) & (widthPos < (475)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (375)) & (widthPos < (425)) & (heightPos < (85)) & (heightPos > (35))) ? 1'b1:1'b0;   // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (275)) & (widthPos < (425)) & (heightPos < (310)) & (heightPos > (265))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
        
        6'b110010, 6'b111110, 6'b111101, 6'b111100, 6'b111011, 6'b111010, 6'b111001, 6'b111000, 6'b110111:begin
            // Error
            inBoundsa = ((widthPos > (250)) & (widthPos < (500)) & (heightPos < (450)) & (heightPos > (400))) ? 1'b1:1'b0; // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (250)) & (widthPos < (300)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Leftmost Vertical Line
            inBoundsc = ((widthPos > (450)) & (widthPos < (500)) & (heightPos < (425)) & (heightPos > (150))) ? 1'b1:1'b0; // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (250)) & (widthPos < (500)) & (heightPos < (175)) & (heightPos > (125))) ? 1'b1:1'b0; // Uppermost Horizontal Line
            inBoundse = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (300)) & (heightPos > (200))) ? 1'b1:1'b0; // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (350)) & (widthPos < (400)) & (heightPos < (375)) & (heightPos > (325))) ? 1'b1:1'b0; // Middle Horizontal Line
            end
            
        default:begin
            // Blank Space - So when it first starts up it shows blank.
            inBoundsa = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Lowermost Horizontal Line
            inBoundsb = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Leftmost Vertical Line
            inBoundsc = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Lower) Vertical Line
            inBoundsd = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Uppermost Horizontal Line
            inBoundse = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Rightmost (Upper) Vertical Line
            inBoundsf = ((widthPos > (0)) & (widthPos < (0)) & (heightPos < (0)) & (heightPos > (0))) ? 1'b1:1'b0;         // Middle Horizontal Line
            end                
            
        endcase

    end
    
    
    wire a = inBoundsa;
    wire b = inBoundsb;
    wire c = inBoundsc;
    wire d = inBoundsd;
    wire e = inBoundse;
    wire f = inBoundsf;
    
    
    // Following always block ensures that 
    // you go through all pixel coordinates
    always@(posedge clk)
    begin
        // check if end of the width 
        if(widthPos < TOTAL_WIDTH -1)
        begin 
            widthPos <= widthPos + 1;
        end
        else
        begin
            // move back to the first column
            widthPos <=0;
            // check if end of the height
            if(heightPos < TOTAL_HEIGHT -1)
            begin
                heightPos <= heightPos + 1;
            end
            else
            begin
                 heightPos <= 0;
            end       
        end
    end
    
    
    always@(posedge clk)
    begin
        if (widthPos < H_SYNC_COLUMN)
        begin
            h_sync <= 1'b1;
        end
        else
        begin
            h_sync <= 1'b0;
        end
   end


   always@(posedge clk)
   begin
        if (heightPos < V_SYNC_LINE)
        begin
            v_sync <= 1'b1;
        end
        else
        begin
            v_sync <= 1'b0;
        end
   end
   
   
   always@(posedge clk)
    begin
        if((a | b | c | d | e | f))
        begin
            led_on <= 1'b1;
        end
        else
        begin
            led_on <= 1'b0;
        end 
   end   
   
      
endmodule