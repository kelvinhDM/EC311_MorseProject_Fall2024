`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2024 12:49:15 PM
// Design Name: 
// Module Name: morsecode_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module morsecode_tb(

    );
    reg dot, dash, send, reset, clk;
    wire [4:0] code;
    wire [4:0] temp;
    
    GetCode tfb(dot, dash, send, reset, clk, code, temp);
    
         
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end
    
    
    initial begin
        dot = 0;
        dash = 0;
        send = 0;
        reset = 1;
    
        #10 reset = 0;
        #10 dot = 1;
        #10 dot = 0;
        #10 send =1;
        #10 send = 0;
        
        #10  dash = 1;
        #10 dash = 0;
        #10 send = 1;
        #10 send = 0;
        
        #10 dot = 1;
        #10 dot = 0;
        #10 dot = 1;
        #10 dot = 0;
        #10 send = 1;
        #10 send = 0;
        
        #10 dot = 1;
        #10 dot = 0;
        #10 dot = 1;
        #10 dot = 0;
        #10 dot = 1;
        #10 dot = 0;
        #10 send = 1;
        #10 send = 0;
        
        #10 dot = 1;
        #10 dot = 0;
        #10 dot = 1;
        #10 dot = 0;
        #10 dot = 1;
        #10 dot = 0;
        #10  dash = 1;
        #10 dash = 0;
        #10 send = 1;    
        #10 send = 0;
                 
        #10 dash = 1;
        #10 dash = 0;      
        #10 dash = 1;
        #10 dash = 0;  
        #10 dot = 1;
        #10 dot = 0;
        #10 dash = 1;
        #10 dash = 0;
        #10 send = 1;  

        #15 $finish;

     end
    
endmodule
