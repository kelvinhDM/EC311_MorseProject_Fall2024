`timescale 1ns / 1ps

module vgatop(vgaon, lett, clk, reset, vga_r, vga_g, vga_b, h_sync, v_sync);
    
    input vgaon;
    input [5:0] lett;
    input clk, reset;
    
    output reg [3:0] vga_r, vga_g, vga_b;
    output h_sync, v_sync;
    wire newClk, ledOn;
    
    clkdivider clkDiv (clk, reset, newClk);
    
    vgacontroller control (lett, newClk, reset, h_sync, v_sync, ledOn);
    
    always@(posedge newClk)
    if (vgaon)
    begin
      if(ledOn) begin
            vga_r <= 4'b1111;
            vga_g <= 4'b1111;
            vga_b <= 4'b1111;     
      end
      else begin
            vga_r <= 0;  
            vga_g <= 4'b0;
            vga_b <= 4'b0;
      end      
    end
    
endmodule
