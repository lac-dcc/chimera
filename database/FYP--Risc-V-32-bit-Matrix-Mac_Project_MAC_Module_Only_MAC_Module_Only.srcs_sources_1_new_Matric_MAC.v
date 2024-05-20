// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2024 07:12:36 PM
// Design Name: 
// Module Name: Matric_MAC
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


module Matric_MAC(
    input clk, rst,
    input [5:0] Instruction_Type,
    input [12:0] MAC_A_11, MAC_A_12, MAC_A_13, MAC_A_14, MAC_A_15,
    input [12:0] MAC_A_21, MAC_A_22, MAC_A_23, MAC_A_24, MAC_A_25,
    input [12:0] MAC_A_31, MAC_A_32, MAC_A_33, MAC_A_34, MAC_A_35,
    input [12:0] MAC_A_41, MAC_A_42, MAC_A_43, MAC_A_44, MAC_A_45,
    input [12:0] MAC_A_51, MAC_A_52, MAC_A_53, MAC_A_54, MAC_A_55,
    
    input [12:0] MAC_B_11, MAC_B_12, MAC_B_13, MAC_B_14, MAC_B_15,
    input [12:0] MAC_B_21, MAC_B_22, MAC_B_23, MAC_B_24, MAC_B_25,
    input [12:0] MAC_B_31, MAC_B_32, MAC_B_33, MAC_B_34, MAC_B_35,
    input [12:0] MAC_B_41, MAC_B_42, MAC_B_43, MAC_B_44, MAC_B_45,
    input [12:0] MAC_B_51, MAC_B_52, MAC_B_53, MAC_B_54, MAC_B_55,
    
    output [31:0] MAC_R_11, MAC_R_12, MAC_R_13, MAC_R_14, MAC_R_15, 
    output [31:0] MAC_R_21, MAC_R_22, MAC_R_23, MAC_R_24, MAC_R_25, 
    output [31:0] MAC_R_31, MAC_R_32, MAC_R_33, MAC_R_34, MAC_R_35, 
    output [31:0] MAC_R_41, MAC_R_42, MAC_R_43, MAC_R_44, MAC_R_45, 
    output [31:0] MAC_R_51, MAC_R_52, MAC_R_53, MAC_R_54, MAC_R_55
     
    );
    reg [31:0] MAC_R_11_r, MAC_R_12_r, MAC_R_13_r, MAC_R_14_r, MAC_R_15_r; 
    reg [31:0] MAC_R_21_r, MAC_R_22_r, MAC_R_23_r, MAC_R_24_r, MAC_R_25_r; 
    reg [31:0] MAC_R_31_r, MAC_R_32_r, MAC_R_33_r, MAC_R_34_r, MAC_R_35_r;
    reg [31:0] MAC_R_41_r, MAC_R_42_r, MAC_R_43_r, MAC_R_44_r, MAC_R_45_r;
    reg [31:0] MAC_R_51_r, MAC_R_52_r, MAC_R_53_r, MAC_R_54_r, MAC_R_55_r;
         
    reg [12:0] MAC_A_11_r, MAC_A_12_r, MAC_A_13_r, MAC_A_14_r, MAC_A_15_r;
    reg [12:0] MAC_A_21_r, MAC_A_22_r, MAC_A_23_r, MAC_A_24_r, MAC_A_25_r;
    reg [12:0] MAC_A_31_r, MAC_A_32_r, MAC_A_33_r, MAC_A_34_r, MAC_A_35_r;
    reg [12:0] MAC_A_41_r, MAC_A_42_r, MAC_A_43_r, MAC_A_44_r, MAC_A_45_r;
    reg [12:0] MAC_A_51_r, MAC_A_52_r, MAC_A_53_r, MAC_A_54_r, MAC_A_55_r;
    
    reg [12:0] MAC_B_11_r, MAC_B_12_r, MAC_B_13_r, MAC_B_14_r, MAC_B_15_r;
    reg [12:0] MAC_B_21_r, MAC_B_22_r, MAC_B_23_r, MAC_B_24_r, MAC_B_25_r;
    reg [12:0] MAC_B_31_r, MAC_B_32_r, MAC_B_33_r, MAC_B_34_r, MAC_B_35_r;
    reg [12:0] MAC_B_41_r, MAC_B_42_r, MAC_B_43_r, MAC_B_44_r, MAC_B_45_r;
    reg [12:0] MAC_B_51_r, MAC_B_52_r, MAC_B_53_r, MAC_B_54_r, MAC_B_55_r;
    
    always@(posedge clk)
    begin
        if(rst == 0)
        begin
            MAC_R_11_r <= 0; MAC_R_12_r <= 0; MAC_R_13_r <= 0; MAC_R_14_r <= 0; MAC_R_15_r <= 0;
            MAC_R_21_r <= 0; MAC_R_22_r <= 0; MAC_R_23_r <= 0; MAC_R_24_r <= 0; MAC_R_25_r <= 0;
            MAC_R_31_r <= 0; MAC_R_32_r <= 0; MAC_R_33_r <= 0; MAC_R_34_r <= 0; MAC_R_35_r <= 0;
            MAC_R_41_r <= 0; MAC_R_42_r <= 0; MAC_R_43_r <= 0; MAC_R_44_r <= 0; MAC_R_45_r <= 0;
            MAC_R_51_r <= 0; MAC_R_52_r <= 0; MAC_R_53_r <= 0; MAC_R_54_r <= 0; MAC_R_55_r <= 0;
        end
        else
        begin
            case(Instruction_Type)
            0:begin//LOAD MATRIX A
                MAC_A_11_r <= MAC_A_11; MAC_A_12_r <= MAC_A_12; MAC_A_13_r <= MAC_A_13; MAC_A_14_r <= MAC_A_14; MAC_A_15_r <= MAC_A_15; 
                MAC_A_21_r <= MAC_A_21; MAC_A_22_r <= MAC_A_22; MAC_A_23_r <= MAC_A_23; MAC_A_24_r <= MAC_A_24; MAC_A_25_r <= MAC_A_25; 
                MAC_A_31_r <= MAC_A_31; MAC_A_32_r <= MAC_A_32; MAC_A_33_r <= MAC_A_33; MAC_A_34_r <= MAC_A_34; MAC_A_35_r <= MAC_A_35; 
                MAC_A_41_r <= MAC_A_41; MAC_A_42_r <= MAC_A_42; MAC_A_43_r <= MAC_A_43; MAC_A_44_r <= MAC_A_44; MAC_A_45_r <= MAC_A_45; 
                MAC_A_51_r <= MAC_A_51; MAC_A_52_r <= MAC_A_52; MAC_A_53_r <= MAC_A_53; MAC_A_54_r <= MAC_A_54; MAC_A_55_r <= MAC_A_55;
            end
            1:begin//LOAD MATRIX B
                MAC_B_11_r <= MAC_B_11; MAC_B_12_r <= MAC_B_12; MAC_B_13_r <= MAC_B_13; MAC_B_14_r <= MAC_B_14; MAC_B_15_r <= MAC_B_15; 
                MAC_B_21_r <= MAC_B_21; MAC_B_22_r <= MAC_B_22; MAC_B_23_r <= MAC_B_23; MAC_B_24_r <= MAC_B_24; MAC_B_25_r <= MAC_B_25; 
                MAC_B_31_r <= MAC_B_31; MAC_B_32_r <= MAC_B_32; MAC_B_33_r <= MAC_B_33; MAC_B_34_r <= MAC_B_34; MAC_B_35_r <= MAC_B_35; 
                MAC_B_41_r <= MAC_B_41; MAC_B_42_r <= MAC_B_42; MAC_B_43_r <= MAC_B_43; MAC_B_44_r <= MAC_B_44; MAC_B_45_r <= MAC_B_45; 
                MAC_B_51_r <= MAC_B_51; MAC_B_52_r <= MAC_B_52; MAC_B_53_r <= MAC_B_53; MAC_B_54_r <= MAC_B_54; MAC_B_55_r <= MAC_B_55;
            end
            2:begin//CLEAR MATRIX A
                MAC_A_11_r <= 0; MAC_A_12_r <= 0; MAC_A_13_r <= 0; MAC_A_14_r <= 0; MAC_A_15_r <= 0; 
                MAC_A_21_r <= 0; MAC_A_22_r <= 0; MAC_A_23_r <= 0; MAC_A_24_r <= 0; MAC_A_25_r <= 0;
                MAC_A_31_r <= 0; MAC_A_32_r <= 0; MAC_A_33_r <= 0; MAC_A_34_r <= 0; MAC_A_35_r <= 0;
                MAC_A_41_r <= 0; MAC_A_42_r <= 0; MAC_A_43_r <= 0; MAC_A_44_r <= 0; MAC_A_45_r <= 0;
                MAC_A_51_r <= 0; MAC_A_52_r <= 0; MAC_A_53_r <= 0; MAC_A_54_r <= 0; MAC_A_55_r <= 0;
            end
            3:begin//CLEAR MATRIX B
                MAC_B_11_r <= 0; MAC_B_12_r <= 0; MAC_B_13_r <= 0; MAC_B_14_r <= 0; MAC_B_15_r <= 0; 
                MAC_B_21_r <= 0; MAC_B_22_r <= 0; MAC_B_23_r <= 0; MAC_B_24_r <= 0; MAC_B_25_r <= 0;
                MAC_B_31_r <= 0; MAC_B_32_r <= 0; MAC_B_33_r <= 0; MAC_B_34_r <= 0; MAC_B_35_r <= 0;
                MAC_B_41_r <= 0; MAC_B_42_r <= 0; MAC_B_43_r <= 0; MAC_B_44_r <= 0; MAC_B_45_r <= 0;
                MAC_B_51_r <= 0; MAC_B_52_r <= 0; MAC_B_53_r <= 0; MAC_B_54_r <= 0; MAC_B_55_r <= 0;
            end
            4:begin//CLEAR MATRIX R
                MAC_R_11_r <= 0; MAC_R_12_r <= 0; MAC_R_13_r <= 0; MAC_R_14_r <= 0; MAC_R_15_r <= 0;
                MAC_R_21_r <= 0; MAC_R_22_r <= 0; MAC_R_23_r <= 0; MAC_R_24_r <= 0; MAC_R_25_r <= 0;
                MAC_R_31_r <= 0; MAC_R_32_r <= 0; MAC_R_33_r <= 0; MAC_R_34_r <= 0; MAC_R_35_r <= 0;
                MAC_R_41_r <= 0; MAC_R_42_r <= 0; MAC_R_43_r <= 0; MAC_R_44_r <= 0; MAC_R_45_r <= 0;
                MAC_R_51_r <= 0; MAC_R_52_r <= 0; MAC_R_53_r <= 0; MAC_R_54_r <= 0; MAC_R_55_r <= 0;
            end
            5:begin//CLEAR ALL
                MAC_R_11_r <= 0; MAC_R_12_r <= 0; MAC_R_13_r <= 0; MAC_R_14_r <= 0; MAC_R_15_r <= 0;
                MAC_R_21_r <= 0; MAC_R_22_r <= 0; MAC_R_23_r <= 0; MAC_R_24_r <= 0; MAC_R_25_r <= 0;
                MAC_R_31_r <= 0; MAC_R_32_r <= 0; MAC_R_33_r <= 0; MAC_R_34_r <= 0; MAC_R_35_r <= 0;
                MAC_R_41_r <= 0; MAC_R_42_r <= 0; MAC_R_43_r <= 0; MAC_R_44_r <= 0; MAC_R_45_r <= 0;
                MAC_R_51_r <= 0; MAC_R_52_r <= 0; MAC_R_53_r <= 0; MAC_R_54_r <= 0; MAC_R_55_r <= 0;
                        
                MAC_A_11_r <= 0; MAC_A_12_r <= 0; MAC_A_13_r <= 0; MAC_A_14_r <= 0; MAC_A_15_r <= 0; 
                MAC_A_21_r <= 0; MAC_A_22_r <= 0; MAC_A_23_r <= 0; MAC_A_24_r <= 0; MAC_A_25_r <= 0;
                MAC_A_31_r <= 0; MAC_A_32_r <= 0; MAC_A_33_r <= 0; MAC_A_34_r <= 0; MAC_A_35_r <= 0;
                MAC_A_41_r <= 0; MAC_A_42_r <= 0; MAC_A_43_r <= 0; MAC_A_44_r <= 0; MAC_A_45_r <= 0;
                MAC_A_51_r <= 0; MAC_A_52_r <= 0; MAC_A_53_r <= 0; MAC_A_54_r <= 0; MAC_A_55_r <= 0;
                
                MAC_B_11_r <= 0; MAC_B_12_r <= 0; MAC_B_13_r <= 0; MAC_B_14_r <= 0; MAC_B_15_r <= 0; 
                MAC_B_21_r <= 0; MAC_B_22_r <= 0; MAC_B_23_r <= 0; MAC_B_24_r <= 0; MAC_B_25_r <= 0;
                MAC_B_31_r <= 0; MAC_B_32_r <= 0; MAC_B_33_r <= 0; MAC_B_34_r <= 0; MAC_B_35_r <= 0;
                MAC_B_41_r <= 0; MAC_B_42_r <= 0; MAC_B_43_r <= 0; MAC_B_44_r <= 0; MAC_B_45_r <= 0;
                MAC_B_51_r <= 0; MAC_B_52_r <= 0; MAC_B_53_r <= 0; MAC_B_54_r <= 0; MAC_B_55_r <= 0;
            end
            6:begin//MATRIX MULTIPLY
                MAC_R_11_r <= (MAC_A_11_r * MAC_B_11_r) + (MAC_A_12_r * MAC_B_21_r) + (MAC_A_13_r * MAC_B_31_r) + (MAC_A_14_r * MAC_B_41_r) + (MAC_A_15_r * MAC_B_51_r);
                MAC_R_12_r <= (MAC_A_11_r * MAC_B_12_r) + (MAC_A_12_r * MAC_B_22_r) + (MAC_A_13_r * MAC_B_32_r) + (MAC_A_14_r * MAC_B_42_r) + (MAC_A_15_r * MAC_B_52_r);
                MAC_R_13_r <= (MAC_A_11_r * MAC_B_13_r) + (MAC_A_12_r * MAC_B_23_r) + (MAC_A_13_r * MAC_B_33_r) + (MAC_A_14_r * MAC_B_43_r) + (MAC_A_15_r * MAC_B_53_r);
                MAC_R_14_r <= (MAC_A_11_r * MAC_B_14_r) + (MAC_A_12_r * MAC_B_24_r) + (MAC_A_13_r * MAC_B_34_r) + (MAC_A_14_r * MAC_B_44_r) + (MAC_A_15_r * MAC_B_54_r);
                MAC_R_15_r <= (MAC_A_11_r * MAC_B_15_r) + (MAC_A_12_r * MAC_B_25_r) + (MAC_A_13_r * MAC_B_35_r) + (MAC_A_14_r * MAC_B_45_r) + (MAC_A_15_r * MAC_B_55_r);

                MAC_R_21_r <= (MAC_A_21_r * MAC_B_11_r) + (MAC_A_22_r * MAC_B_21_r) + (MAC_A_23_r * MAC_B_31_r) + (MAC_A_24_r * MAC_B_41_r) + (MAC_A_25_r * MAC_B_51_r);
                MAC_R_22_r <= (MAC_A_21_r * MAC_B_12_r) + (MAC_A_22_r * MAC_B_22_r) + (MAC_A_23_r * MAC_B_32_r) + (MAC_A_24_r * MAC_B_42_r) + (MAC_A_25_r * MAC_B_52_r);
                MAC_R_23_r <= (MAC_A_21_r * MAC_B_13_r) + (MAC_A_22_r * MAC_B_23_r) + (MAC_A_23_r * MAC_B_33_r) + (MAC_A_24_r * MAC_B_43_r) + (MAC_A_25_r * MAC_B_53_r);
                MAC_R_24_r <= (MAC_A_21_r * MAC_B_14_r) + (MAC_A_22_r * MAC_B_24_r) + (MAC_A_23_r * MAC_B_34_r) + (MAC_A_24_r * MAC_B_44_r) + (MAC_A_25_r * MAC_B_54_r);
                MAC_R_25_r <= (MAC_A_21_r * MAC_B_15_r) + (MAC_A_22_r * MAC_B_25_r) + (MAC_A_23_r * MAC_B_35_r) + (MAC_A_24_r * MAC_B_45_r) + (MAC_A_25_r * MAC_B_55_r);
                
                MAC_R_31_r <= (MAC_A_31_r * MAC_B_11_r) + (MAC_A_32_r * MAC_B_21_r) + (MAC_A_33_r * MAC_B_31_r) + (MAC_A_34_r * MAC_B_41_r) + (MAC_A_35_r * MAC_B_51_r);
                MAC_R_32_r <= (MAC_A_31_r * MAC_B_12_r) + (MAC_A_32_r * MAC_B_22_r) + (MAC_A_33_r * MAC_B_32_r) + (MAC_A_34_r * MAC_B_42_r) + (MAC_A_35_r * MAC_B_52_r);
                MAC_R_33_r <= (MAC_A_31_r * MAC_B_13_r) + (MAC_A_32_r * MAC_B_23_r) + (MAC_A_33_r * MAC_B_33_r) + (MAC_A_34_r * MAC_B_43_r) + (MAC_A_35_r * MAC_B_53_r);
                MAC_R_34_r <= (MAC_A_31_r * MAC_B_14_r) + (MAC_A_32_r * MAC_B_24_r) + (MAC_A_33_r * MAC_B_34_r) + (MAC_A_34_r * MAC_B_44_r) + (MAC_A_35_r * MAC_B_54_r);
                MAC_R_35_r <= (MAC_A_31_r * MAC_B_15_r) + (MAC_A_32_r * MAC_B_25_r) + (MAC_A_33_r * MAC_B_35_r) + (MAC_A_34_r * MAC_B_45_r) + (MAC_A_35_r * MAC_B_55_r);
                
                MAC_R_41_r <= (MAC_A_41_r * MAC_B_11_r) + (MAC_A_42_r * MAC_B_21_r) + (MAC_A_43_r * MAC_B_31_r) + (MAC_A_44_r * MAC_B_41_r) + (MAC_A_45_r * MAC_B_51_r);
                MAC_R_42_r <= (MAC_A_41_r * MAC_B_12_r) + (MAC_A_42_r * MAC_B_22_r) + (MAC_A_43_r * MAC_B_32_r) + (MAC_A_44_r * MAC_B_42_r) + (MAC_A_45_r * MAC_B_52_r);
                MAC_R_43_r <= (MAC_A_41_r * MAC_B_13_r) + (MAC_A_42_r * MAC_B_23_r) + (MAC_A_43_r * MAC_B_33_r) + (MAC_A_44_r * MAC_B_43_r) + (MAC_A_45_r * MAC_B_53_r);
                MAC_R_44_r <= (MAC_A_41_r * MAC_B_14_r) + (MAC_A_42_r * MAC_B_24_r) + (MAC_A_43_r * MAC_B_34_r) + (MAC_A_44_r * MAC_B_44_r) + (MAC_A_45_r * MAC_B_54_r);
                MAC_R_45_r <= (MAC_A_41_r * MAC_B_15_r) + (MAC_A_42_r * MAC_B_25_r) + (MAC_A_43_r * MAC_B_35_r) + (MAC_A_44_r * MAC_B_45_r) + (MAC_A_45_r * MAC_B_55_r);
                
                MAC_R_51_r <= (MAC_A_51_r * MAC_B_11_r) + (MAC_A_52_r * MAC_B_21_r) + (MAC_A_53_r * MAC_B_31_r) + (MAC_A_54_r * MAC_B_41_r) + (MAC_A_55_r * MAC_B_51_r);
                MAC_R_52_r <= (MAC_A_51_r * MAC_B_12_r) + (MAC_A_52_r * MAC_B_22_r) + (MAC_A_53_r * MAC_B_32_r) + (MAC_A_54_r * MAC_B_42_r) + (MAC_A_55_r * MAC_B_52_r);
                MAC_R_53_r <= (MAC_A_51_r * MAC_B_13_r) + (MAC_A_52_r * MAC_B_23_r) + (MAC_A_53_r * MAC_B_33_r) + (MAC_A_54_r * MAC_B_43_r) + (MAC_A_55_r * MAC_B_53_r);
                MAC_R_54_r <= (MAC_A_51_r * MAC_B_14_r) + (MAC_A_52_r * MAC_B_24_r) + (MAC_A_53_r * MAC_B_34_r) + (MAC_A_54_r * MAC_B_44_r) + (MAC_A_55_r * MAC_B_54_r);
                MAC_R_55_r <= (MAC_A_51_r * MAC_B_15_r) + (MAC_A_52_r * MAC_B_25_r) + (MAC_A_53_r * MAC_B_35_r) + (MAC_A_54_r * MAC_B_45_r) + (MAC_A_55_r * MAC_B_55_r);
                
            end
            7:begin//MATRIX ADD, A + B
                MAC_R_11_r  <= MAC_A_11_r + MAC_B_11_r; 
                MAC_R_12_r  <= MAC_A_12_r + MAC_B_12_r; 
                MAC_R_13_r  <= MAC_A_13_r + MAC_B_13_r; 
                MAC_R_14_r  <= MAC_A_14_r + MAC_B_14_r; 
                MAC_R_15_r  <= MAC_A_15_r + MAC_B_15_r; 
                
                MAC_R_21_r  <= MAC_A_21_r + MAC_B_21_r; 
                MAC_R_22_r  <= MAC_A_22_r + MAC_B_22_r; 
                MAC_R_23_r  <= MAC_A_23_r + MAC_B_23_r; 
                MAC_R_24_r  <= MAC_A_24_r + MAC_B_24_r; 
                MAC_R_25_r  <= MAC_A_25_r + MAC_B_25_r; 
                
                MAC_R_31_r  <= MAC_A_31_r + MAC_B_31_r; 
                MAC_R_32_r  <= MAC_A_32_r + MAC_B_32_r; 
                MAC_R_33_r  <= MAC_A_33_r + MAC_B_33_r; 
                MAC_R_34_r  <= MAC_A_34_r + MAC_B_34_r; 
                MAC_R_35_r  <= MAC_A_35_r + MAC_B_35_r; 
                
                MAC_R_41_r  <= MAC_A_41_r + MAC_B_41_r; 
                MAC_R_42_r  <= MAC_A_42_r + MAC_B_42_r; 
                MAC_R_43_r  <= MAC_A_43_r + MAC_B_43_r; 
                MAC_R_44_r  <= MAC_A_44_r + MAC_B_44_r; 
                MAC_R_45_r  <= MAC_A_45_r + MAC_B_45_r; 
                
                MAC_R_51_r  <= MAC_A_51_r + MAC_B_51_r; 
                MAC_R_52_r  <= MAC_A_52_r + MAC_B_52_r; 
                MAC_R_53_r  <= MAC_A_53_r + MAC_B_53_r; 
                MAC_R_54_r  <= MAC_A_54_r + MAC_B_54_r; 
                MAC_R_55_r  <= MAC_A_55_r + MAC_B_55_r;                 
            end
            8:begin//MATRIX SUBTRACT, A - B
                MAC_R_11_r  <= MAC_A_11_r - MAC_B_11_r; 
                MAC_R_12_r  <= MAC_A_12_r - MAC_B_12_r; 
                MAC_R_13_r  <= MAC_A_13_r - MAC_B_13_r; 
                MAC_R_14_r  <= MAC_A_14_r - MAC_B_14_r; 
                MAC_R_15_r  <= MAC_A_15_r - MAC_B_15_r; 
                
                MAC_R_21_r  <= MAC_A_21_r - MAC_B_21_r; 
                MAC_R_22_r  <= MAC_A_22_r - MAC_B_22_r; 
                MAC_R_23_r  <= MAC_A_23_r - MAC_B_23_r; 
                MAC_R_24_r  <= MAC_A_24_r - MAC_B_24_r; 
                MAC_R_25_r  <= MAC_A_25_r - MAC_B_25_r; 
                
                MAC_R_31_r  <= MAC_A_31_r - MAC_B_31_r; 
                MAC_R_32_r  <= MAC_A_32_r - MAC_B_32_r; 
                MAC_R_33_r  <= MAC_A_33_r - MAC_B_33_r; 
                MAC_R_34_r  <= MAC_A_34_r - MAC_B_34_r; 
                MAC_R_35_r  <= MAC_A_35_r - MAC_B_35_r; 
                
                MAC_R_41_r  <= MAC_A_41_r - MAC_B_41_r; 
                MAC_R_42_r  <= MAC_A_42_r - MAC_B_42_r; 
                MAC_R_43_r  <= MAC_A_43_r - MAC_B_43_r; 
                MAC_R_44_r  <= MAC_A_44_r - MAC_B_44_r; 
                MAC_R_45_r  <= MAC_A_45_r - MAC_B_45_r; 
                
                MAC_R_51_r  <= MAC_A_51_r - MAC_B_51_r; 
                MAC_R_52_r  <= MAC_A_52_r - MAC_B_52_r; 
                MAC_R_53_r  <= MAC_A_53_r - MAC_B_53_r; 
                MAC_R_54_r  <= MAC_A_54_r - MAC_B_54_r; 
                MAC_R_55_r  <= MAC_A_55_r - MAC_B_55_r; 
            end
            9:begin//Matrix SUBTRACT, B - A
                MAC_R_11_r  <= MAC_B_11_r - MAC_A_11_r; 
                MAC_R_12_r  <= MAC_B_12_r - MAC_A_12_r; 
                MAC_R_13_r  <= MAC_B_13_r - MAC_A_13_r; 
                MAC_R_14_r  <= MAC_B_14_r - MAC_A_14_r; 
                MAC_R_15_r  <= MAC_B_15_r - MAC_A_15_r; 
                
                MAC_R_21_r  <= MAC_B_21_r - MAC_A_21_r; 
                MAC_R_22_r  <= MAC_B_22_r - MAC_A_22_r; 
                MAC_R_23_r  <= MAC_B_23_r - MAC_A_23_r; 
                MAC_R_24_r  <= MAC_B_24_r - MAC_A_24_r; 
                MAC_R_25_r  <= MAC_B_25_r - MAC_A_25_r; 
                
                MAC_R_31_r  <= MAC_B_31_r - MAC_A_31_r; 
                MAC_R_32_r  <= MAC_B_32_r - MAC_A_32_r; 
                MAC_R_33_r  <= MAC_B_33_r - MAC_A_33_r; 
                MAC_R_34_r  <= MAC_B_34_r - MAC_A_34_r; 
                MAC_R_35_r  <= MAC_B_35_r - MAC_A_35_r; 
                
                MAC_R_41_r  <= MAC_B_41_r - MAC_A_41_r; 
                MAC_R_42_r  <= MAC_B_42_r - MAC_A_42_r; 
                MAC_R_43_r  <= MAC_B_43_r - MAC_A_43_r; 
                MAC_R_44_r  <= MAC_B_44_r - MAC_A_44_r; 
                MAC_R_45_r  <= MAC_B_45_r - MAC_A_45_r; 
                
                MAC_R_51_r  <= MAC_B_51_r - MAC_A_51_r; 
                MAC_R_52_r  <= MAC_B_52_r - MAC_A_52_r; 
                MAC_R_53_r  <= MAC_B_53_r - MAC_A_53_r; 
                MAC_R_54_r  <= MAC_B_54_r - MAC_A_54_r; 
                MAC_R_55_r  <= MAC_B_55_r - MAC_A_55_r; 
            end
            default begin
                
            end
            
            endcase
        end
    end
    
    assign MAC_R_11 = (rst != 0 && Instruction_Type == 10) ? MAC_R_11_r : 0;
    assign MAC_R_12 = (rst != 0 && Instruction_Type == 10) ? MAC_R_12_r : 0;
    assign MAC_R_13 = (rst != 0 && Instruction_Type == 10) ? MAC_R_13_r : 0;
    assign MAC_R_14 = (rst != 0 && Instruction_Type == 10) ? MAC_R_14_r : 0;
    assign MAC_R_15 = (rst != 0 && Instruction_Type == 10) ? MAC_R_15_r : 0;

    assign MAC_R_21 = (rst != 0 && Instruction_Type == 10) ? MAC_R_21_r : 0;
    assign MAC_R_22 = (rst != 0 && Instruction_Type == 10) ? MAC_R_22_r : 0;
    assign MAC_R_23 = (rst != 0 && Instruction_Type == 10) ? MAC_R_23_r : 0;
    assign MAC_R_24 = (rst != 0 && Instruction_Type == 10) ? MAC_R_24_r : 0;
    assign MAC_R_25 = (rst != 0 && Instruction_Type == 10) ? MAC_R_25_r : 0;
    
    assign MAC_R_31 = (rst != 0 && Instruction_Type == 10) ? MAC_R_31_r : 0;
    assign MAC_R_32 = (rst != 0 && Instruction_Type == 10) ? MAC_R_32_r : 0;
    assign MAC_R_33 = (rst != 0 && Instruction_Type == 10) ? MAC_R_33_r : 0;
    assign MAC_R_34 = (rst != 0 && Instruction_Type == 10) ? MAC_R_34_r : 0;
    assign MAC_R_35 = (rst != 0 && Instruction_Type == 10) ? MAC_R_35_r : 0;
    
    assign MAC_R_41 = (rst != 0 && Instruction_Type == 10) ? MAC_R_41_r : 0;
    assign MAC_R_42 = (rst != 0 && Instruction_Type == 10) ? MAC_R_42_r : 0;
    assign MAC_R_43 = (rst != 0 && Instruction_Type == 10) ? MAC_R_43_r : 0;
    assign MAC_R_44 = (rst != 0 && Instruction_Type == 10) ? MAC_R_44_r : 0;
    assign MAC_R_45 = (rst != 0 && Instruction_Type == 10) ? MAC_R_45_r : 0;
    
    assign MAC_R_51 = (rst != 0 && Instruction_Type == 10) ? MAC_R_51_r : 0;
    assign MAC_R_52 = (rst != 0 && Instruction_Type == 10) ? MAC_R_52_r : 0;
    assign MAC_R_53 = (rst != 0 && Instruction_Type == 10) ? MAC_R_53_r : 0;
    assign MAC_R_54 = (rst != 0 && Instruction_Type == 10) ? MAC_R_54_r : 0;
    assign MAC_R_55 = (rst != 0 && Instruction_Type == 10) ? MAC_R_55_r : 0;
    
endmodule



















