`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 11:38:18 AM
// Design Name: 
// Module Name: debouncer
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


module morsedebouncer(clk, nse, nses);
    input clk;
    input nse;
    output reg nses;
    reg cln;
    reg nse0;
    reg nse1;
    reg [19:0] cou;
    
    initial cou = 20'b00000000000000000000;
    initial nses = 0;
    initial cln = 0;
    
    always @ (posedge clk) begin
        if (nse == cln || nse == 0) begin
            cou = 20'b00000000000000000000;
            nses = 0;
            if(nse == 0) begin 
                cln = 0;
                end
            end
        else begin               
            if (cou == 20'b11111111111111111111) begin
                cou = 20'b00000000000000000000;
                nses = 1;
                cln = nses;
                end 
            else begin                    
                cou = cou + 20'b00000000000000000001;                     
                end
            end
        end       
endmodule
