`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2024 01:22:29 PM
// Design Name: 
// Module Name: Combined_Morse
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


module MorseTop(
    input clk,
    input dot,
    input dash,
    input send,
    input reset,
    input sevenon,
    input vgaon,
    output [3:0] vga_r,
    output [3:0] vga_g,
    output [3:0] vga_b,
    output [5:0] code,
    output h_sync,
    output v_sync,
    output [6:0] seven_bit,
    output sevenon2,
    output vgaonLED,
    output [7:0] digit
    );
    
    assign digit = 8'b11111110;
    
    wire clean_dot_wire;
    wire clean_dash_wire;
    wire clean_send_wire;
    wire clean_reset_wire;
    wire [5:0] temp_letter;
    
    assign sevenon2 = !sevenon;
    assign vgaonLED = vgaon;
    
    morsedebouncer dbdot(clk, dot, clean_dot_wire);
    morsedebouncer dbdash(clk, dash, clean_dash_wire);
    morsedebouncer dbsend(clk, send, clean_send_wire);
    morsedebouncer dbreset(clk, reset, clean_reset_wire);
    
    GetCode getcode(clean_dot_wire, clean_dash_wire, clean_send_wire, clean_reset_wire, clk, code, temp_letter);
    
    converter Letter_converter(sevenon, temp_letter, clk, seven_bit);
    
    vgatop display(vgaon, code, clk, clean_reset_wire, vga_r, vga_g, vga_b, h_sync, v_sync);
    
endmodule