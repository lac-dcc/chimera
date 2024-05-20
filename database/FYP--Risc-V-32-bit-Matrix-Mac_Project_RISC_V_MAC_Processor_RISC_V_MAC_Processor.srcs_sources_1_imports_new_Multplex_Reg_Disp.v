// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 10:58:53 PM
// Design Name: 
// Module Name: Multplex_Reg_Disp
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


module Multplex_Reg_Disp(
    input               clk, rst,
    input       [31:0]  inp_reg,
    output      [7:0]   Anode,
    output      [7:0]   SSD_out
    );
    
    reg [31:0] hex_digit;
    reg [3:0] BCD;
    
    reg [7:0]anode; 
    reg [7:0]SSD;
       
    reg [17:0]count;
    always @ (posedge clk or posedge rst)
    begin
         if (rst == 0)
           count <= 0;
         else
           count <= count + 1;
    end
    
    always@(*)
    begin
        case(count[17:15])
        3'b000 : 
        begin
            BCD = inp_reg[3:0];
            anode = 8'b11111110;
        end
        3'b001:
        begin
            BCD = inp_reg[7:4];
            anode = 8'b11111101;
        end
        3'b010:
        begin
            BCD = inp_reg[11:8]; 
            anode = 8'b11111011;
        end    
        3'b011:
        begin
            BCD = inp_reg[15:12]; 
            anode = 8'b11110111;
        end    
        3'b100:
        begin
            BCD = inp_reg[19:16]; 
            anode = 8'b11101111;
        end
        3'b101:
        begin
            BCD = /*1;*/inp_reg[23:20];
            anode = 8'b11011111;
        end
        3'b110:
        begin
            BCD = /*2;//*/inp_reg[27:24]; 
            anode = 8'b10111111;
        end
        3'b111:
        begin
            BCD = /*3;//*/inp_reg[31:28]; 
            anode = 8'b01111111;
        end
        default:
        begin
            BCD = 6'ha; 
            anode = 8'b01111111;
        end            
        endcase
    
    end
            
    always @ (*)
    begin
          case(BCD)
           4'd0 : SSD = 8'b11000000; //0
           4'd1 : SSD = 8'b11111001; //1
           4'd2 : SSD = 8'b10100100; //2
           4'd3 : SSD = 8'b10110000; //3
           4'd4 : SSD = 8'b10011001; //4
           4'd5 : SSD = 8'b10010010; //5
           4'd6 : SSD = 8'b10000010; //6
           4'd7 : SSD = 8'b11111000; //7
           4'd8 : SSD = 8'b10000000; //8
           4'd9 : SSD = 8'b10010000; //9
           4'd10 : SSD = 8'b0001000; //A
           4'd11 : SSD = 8'b0000011; //B
           4'd12 : SSD = 8'b1000110; //C
           4'd13 : SSD = 8'b0100001; //D
           4'd14 : SSD = 8'b0000110; //E
           4'd15 : SSD = 8'b0001110; //F
           
           default : SSD = 8'b10111111; //dash
          endcase
     end
    
    assign SSD_out = SSD;
    assign Anode = anode;
    
endmodule
    



















