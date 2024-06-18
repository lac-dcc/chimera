// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 11:22:03 AM
// Design Name: 
// Module Name: dualPortBRAM
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


module dualPortBRAM #(addrWIDTH= 4, WIDTH= 9, DEPTH = 16 )(clk,rst,ena,enb,wea,addra,addrb,dia,dob);
input clk,ena,enb,wea,rst;
input [addrWIDTH-1:0] addra,addrb;
input [WIDTH-1:0] dia;
output [WIDTH-1:0] dob;
reg [WIDTH-1:0] ram [DEPTH-1:0];
reg [WIDTH-1:0] dob;
    always @(posedge clk) begin
        if (ena) begin
            if (wea)
            ram[addra] <= dia;
            end
    end
    

        
    always @(posedge clk or negedge rst) begin
     if (!rst) begin
        ram[0]  = 9'hff;
        ram[1]  = 9'hab;
        ram[2]  = 9'hf0;
        ram[3]  = 9'h11;
        ram[4]  = 9'h11;
        ram[5]  = 9'h00;
        ram[6]  = 9'h01;
        ram[7]  = 9'haa;
        ram[8]  = 9'hbb;
        ram[9]  = 9'hcc;
        ram[10] = 9'hdd;
        ram[11] = 9'hef;
        ram[12] = 9'hee;
        ram[13] = 9'hff;
        ram[14] = 9'h00;
        ram[15] = 9'hff;
    end    
        else if (enb)
        dob <= ram[addrb];
        end
                
    
    
endmodule