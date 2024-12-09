`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 05:31:36 PM
// Design Name: 
// Module Name: converter
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


module converter(
    input onoff,
    input [5:0]temp_letter,
    input clk,
    output reg [6:0] seven_bit 
    );
    
    parameter _ = 6'b111111, A = 6'b000000, B = 6'b000001, C = 6'b000010, D = 6'b000011, E = 6'b000100, F = 6'b000101, G = 6'b000110, H = 6'b000111, I = 6'b001000, J = 6'b001001, K = 6'b001010, L = 6'b001011, M = 6'b001100, N = 6'b001101, O = 6'b001110, P = 6'b001111, Q = 6'b010000, R = 6'b010001, S = 6'b010010, T = 6'b010011, U = 6'b010100, V = 6'b010101, W = 6'b010110, X = 6'b010111, Y = 6'b011000, Z = 6'b011001, one = 6'b011010, two = 6'b011011, thr = 6'b011100, fou = 6'b011101, fiv = 6'b011110, six = 6'b011111, sev = 6'b100000, eig = 6'b100001, nin = 6'b100010, zer = 6'b100011, plu = 6'b100100, equ = 6'b100101, sla = 6'b100110, opa = 6'b100111, que = 6'b101000, quo = 6'b101001, per = 6'b101010, ats = 6'b101011, apa = 6'b101100, das = 6'b101101, cpa = 6'b101110, com = 6'b101111, col = 6'b110000, aE = 6'b110001, Er = 6'b110010;
    parameter temp2 = 6'b111110, temp8 = 6'b111101, temp0 = 6'b111100, tempplu = 6'b111011, tempque = 6'b111010, tempquo = 6'b111001, tempcom = 6'b111000, tempats = 6'b110111;
    
    always @ (posedge clk) begin
    if (onoff) begin
       case (temp_letter)
       
            A:seven_bit=7'b0100000;
            B:seven_bit=7'b0000011;
            C:seven_bit=7'b0100111;
            D:seven_bit=7'b0100001;
            E:seven_bit=7'b0000110;
            F:seven_bit=7'b0001110;
            G:seven_bit=7'b1000010;
            H:seven_bit=7'b0001011;
            I:seven_bit=7'b1101110;
            J:seven_bit=7'b1110010;
            K:seven_bit=7'b0001010;
            L:seven_bit=7'b1000111;
            M:seven_bit=7'b0101010;
            N:seven_bit=7'b0101011;
            O:seven_bit=7'b0100011;
            P:seven_bit=7'b0001100;
            Q:seven_bit=7'b0011000;
            R:seven_bit=7'b0101111;
            S:seven_bit=7'b1010010;
            T:seven_bit=7'b0000111;
            U:seven_bit=7'b1100011;
            V:seven_bit=7'b1010101;
            W:seven_bit=7'b0010101;
            X:seven_bit=7'b1101011;
            Y:seven_bit=7'b0010001;
            Z:seven_bit=7'b1100100;
            
            one:seven_bit=7'b1111001;
            two:seven_bit=7'b0100100;
            thr:seven_bit=7'b0110000;
            fou:seven_bit=7'b0011001;
            fiv:seven_bit=7'b0010010;
            six:seven_bit=7'b0000010;
            sev:seven_bit=7'b1111000;
            eig:seven_bit=7'b0000000;
            nin:seven_bit=7'b0010000;
            zer:seven_bit=7'b1000000;
            
            default:seven_bit=7'b1111111;
                        
        endcase
        end
        else
        begin
            seven_bit=7'b1111111;
        end
    end
    
    
endmodule
