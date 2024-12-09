`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 06:05:16 PM
// Design Name: 
// Module Name: MorseCode
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


module GetCode(
    input dot,
    input dash,
    input send,
    input reset,
    input clk,
    output reg [5:0] code,
    output reg [5:0] temp_letter
    );
   
   parameter _ = 6'b111111, A = 6'b000000, B = 6'b000001, C = 6'b000010, D = 6'b000011, E = 6'b000100, F = 6'b000101, G = 6'b000110, H = 6'b000111, I = 6'b001000, J = 6'b001001, K = 6'b001010, L = 6'b001011, M = 6'b001100, N = 6'b001101, O = 6'b001110, P = 6'b001111, Q = 6'b010000, R = 6'b010001, S = 6'b010010, T = 6'b010011, U = 6'b010100, V = 6'b010101, W = 6'b010110, X = 6'b010111, Y = 6'b011000, Z = 6'b011001, one = 6'b011010, two = 6'b011011, thr = 6'b011100, fou = 6'b011101, fiv = 6'b011110, six = 6'b011111, sev = 6'b100000, eig = 6'b100001, nin = 6'b100010, zer = 6'b100011, plu = 6'b100100, equ = 6'b100101, sla = 6'b100110, opa = 6'b100111, que = 6'b101000, quo = 6'b101001, per = 6'b101010, ats = 6'b101011, apa = 6'b101100, das = 6'b101101, cpa = 6'b101110, com = 6'b101111, col = 6'b110000, aE = 6'b110001, Er = 6'b110010;
   reg [5:0] current_letter, letter;
   parameter temp2 = 6'b111110, temp8 = 6'b111101, temp0 = 6'b111100, tempplu = 6'b111011, tempque = 6'b111010, tempquo = 6'b111001, tempcom = 6'b111000, tempats = 6'b110111;

   always @ (posedge clk) begin
        temp_letter <= current_letter;
        
        if (dot) begin
            case(letter)
                _:current_letter=E;
                    E:current_letter=I;
                        I:current_letter=S;
                            S:current_letter=H;
                                H:current_letter=fiv;
                
                            U:current_letter=F;
                                F:current_letter=aE;
                
                                temp2:current_letter=tempque;
                                    tempque:current_letter=que;
                
                        A:current_letter=R;
                            R:current_letter=L;
                
                                    tempquo:current_letter=quo;
                
                                tempplu:current_letter=plu;
                
                            W:current_letter=P;
                
                                    tempats:current_letter=ats;
                
                
                                    one:current_letter=apa;
                
                    T:current_letter=N;
                        N:current_letter=D;
                            D:current_letter=B;
                                B:current_letter=six;
                
                                X:current_letter=sla;
                
                            K:current_letter=C;
                
                                Y:current_letter=opa;
                
                        M:current_letter=G;
                            G:current_letter=Z;
                                Z:current_letter=sev;
                
                            O:current_letter=temp8;
                                temp8:current_letter=eig;
                                    eig:current_letter=col;
                
                                    temp0:current_letter=nin;
                
                default:current_letter=Er;
            endcase            
            letter = current_letter;                     
        end    
        
        else if (dash) begin
            case(letter)
                _:current_letter=T;
                    T:current_letter=M;
                        M:current_letter=O;
                            O:current_letter=temp0;
                                temp0:current_letter=zer;
                
                            G:current_letter=Q;
                
                                Z:current_letter=tempcom;
                                    tempcom:current_letter=com;
                
                        N:current_letter=K;
                            K:current_letter=Y;
                
                                opa:current_letter=cpa;
                
                            D:current_letter=X;
                
                                B:current_letter=equ;
                
                                    six:current_letter=das;
                
                    E:current_letter=A;
                        A:current_letter=W;
                            W:current_letter=J;
                                J:current_letter=one;
                
                                P:current_letter=tempats;
                
                            R:current_letter=tempplu;
                
                                        plu:current_letter=per;
                
                                L:current_letter=tempquo;
                
                        I:current_letter=U;
                            U:current_letter=temp2;
                                temp2:current_letter=two;
                                
                            S:current_letter=V;
                                V:current_letter=thr;
                
                                H:current_letter=fou;
                
                default:current_letter=Er;                
            endcase            
            letter = current_letter;          
        end
        else if (send) begin            
            code <= letter;
            letter = _;
        end
        
        else if (reset) begin
            code <= 6'b111111;
            current_letter = _;   
            letter = current_letter;
        end               
    end
        
endmodule