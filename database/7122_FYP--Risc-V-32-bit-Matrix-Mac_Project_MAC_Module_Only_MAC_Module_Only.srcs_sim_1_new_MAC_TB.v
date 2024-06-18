// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2024 02:27:08 PM
// Design Name: 
// Module Name: MAC_TB
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


module MAC_TB();

    parameter CLK_PERIOD = 10;
    reg clk;
    reg rst;
    reg [5:0] Instruction_Type;
    
    reg [12:0] MAC_A_11, MAC_A_12, MAC_A_13, MAC_A_14, MAC_A_15;
    reg [12:0] MAC_A_21, MAC_A_22, MAC_A_23, MAC_A_24, MAC_A_25;
    reg [12:0] MAC_A_31, MAC_A_32, MAC_A_33, MAC_A_34, MAC_A_35;
    reg [12:0] MAC_A_41, MAC_A_42, MAC_A_43, MAC_A_44, MAC_A_45;
    reg [12:0] MAC_A_51, MAC_A_52, MAC_A_53, MAC_A_54, MAC_A_55;
    
    reg [12:0] MAC_B_11, MAC_B_12, MAC_B_13, MAC_B_14, MAC_B_15;
    reg [12:0] MAC_B_21, MAC_B_22, MAC_B_23, MAC_B_24, MAC_B_25;
    reg [12:0] MAC_B_31, MAC_B_32, MAC_B_33, MAC_B_34, MAC_B_35;
    reg [12:0] MAC_B_41, MAC_B_42, MAC_B_43, MAC_B_44, MAC_B_45;
    reg [12:0] MAC_B_51, MAC_B_52, MAC_B_53, MAC_B_54, MAC_B_55;
    
    wire [31:0] MAC_R_11, MAC_R_12, MAC_R_13, MAC_R_14, MAC_R_15;
    wire [31:0] MAC_R_21, MAC_R_22, MAC_R_23, MAC_R_24, MAC_R_25;
    wire [31:0] MAC_R_31, MAC_R_32, MAC_R_33, MAC_R_34, MAC_R_35;
    wire [31:0] MAC_R_41, MAC_R_42, MAC_R_43, MAC_R_44, MAC_R_45;
    wire [31:0] MAC_R_51, MAC_R_52, MAC_R_53, MAC_R_54, MAC_R_55;

     Matric_MAC uut (
        .clk(clk),
        .rst(rst),
        .Instruction_Type(Instruction_Type),
        
        .MAC_A_11(MAC_A_11), .MAC_A_12(MAC_A_12), .MAC_A_13(MAC_A_13), .MAC_A_14(MAC_A_14), .MAC_A_15(MAC_A_15),
        .MAC_A_21(MAC_A_21), .MAC_A_22(MAC_A_22), .MAC_A_23(MAC_A_23), .MAC_A_24(MAC_A_24), .MAC_A_25(MAC_A_25),
        .MAC_A_31(MAC_A_31), .MAC_A_32(MAC_A_32), .MAC_A_33(MAC_A_33), .MAC_A_34(MAC_A_34), .MAC_A_35(MAC_A_35),
        .MAC_A_41(MAC_A_41), .MAC_A_42(MAC_A_42), .MAC_A_43(MAC_A_43), .MAC_A_44(MAC_A_44), .MAC_A_45(MAC_A_45),
        .MAC_A_51(MAC_A_51), .MAC_A_52(MAC_A_52), .MAC_A_53(MAC_A_53), .MAC_A_54(MAC_A_54), .MAC_A_55(MAC_A_55),
        
        .MAC_B_11(MAC_B_11), .MAC_B_12(MAC_B_12), .MAC_B_13(MAC_B_13), .MAC_B_14(MAC_B_14), .MAC_B_15(MAC_B_15),
        .MAC_B_21(MAC_B_21), .MAC_B_22(MAC_B_22), .MAC_B_23(MAC_B_23), .MAC_B_24(MAC_B_24), .MAC_B_25(MAC_B_25),
        .MAC_B_31(MAC_B_31), .MAC_B_32(MAC_B_32), .MAC_B_33(MAC_B_33), .MAC_B_34(MAC_B_34), .MAC_B_35(MAC_B_35),
        .MAC_B_41(MAC_B_41), .MAC_B_42(MAC_B_42), .MAC_B_43(MAC_B_43), .MAC_B_44(MAC_B_44), .MAC_B_45(MAC_B_45),
        .MAC_B_51(MAC_B_51), .MAC_B_52(MAC_B_52), .MAC_B_53(MAC_B_53), .MAC_B_54(MAC_B_54), .MAC_B_55(MAC_B_55),
        
        .MAC_R_11(MAC_R_11), .MAC_R_12(MAC_R_12), .MAC_R_13(MAC_R_13), .MAC_R_14(MAC_R_14), .MAC_R_15(MAC_R_15),
        .MAC_R_21(MAC_R_21), .MAC_R_22(MAC_R_22), .MAC_R_23(MAC_R_23), .MAC_R_24(MAC_R_24), .MAC_R_25(MAC_R_25),
        .MAC_R_31(MAC_R_31), .MAC_R_32(MAC_R_32), .MAC_R_33(MAC_R_33), .MAC_R_34(MAC_R_34), .MAC_R_35(MAC_R_35),
        .MAC_R_41(MAC_R_41), .MAC_R_42(MAC_R_42), .MAC_R_43(MAC_R_43), .MAC_R_44(MAC_R_44), .MAC_R_45(MAC_R_45),
        .MAC_R_51(MAC_R_51), .MAC_R_52(MAC_R_52), .MAC_R_53(MAC_R_53), .MAC_R_54(MAC_R_54), .MAC_R_55(MAC_R_55)
    );
    
    always #10 clk = ~clk;
    initial begin
        clk = 0;
        rst = 0;
        #20;
        rst = 1;
    end
    initial begin
        #30;
        MAC_A_11 = 1; MAC_A_12 = 2; MAC_A_13 = 3; MAC_A_14 = 4; MAC_A_15 = 5;
        MAC_A_21 = 6; MAC_A_22 = 7; MAC_A_23 = 8; MAC_A_24 = 9; MAC_A_25 = 10;
        MAC_A_31 = 11; MAC_A_32 = 12; MAC_A_33 = 13; MAC_A_34 = 14; MAC_A_35 = 15;
        MAC_A_41 = 16; MAC_A_42 = 17; MAC_A_43 = 18; MAC_A_44 = 19; MAC_A_45 = 20;
        MAC_A_51 = 21; MAC_A_52 = 22; MAC_A_53 = 23; MAC_A_54 = 24; MAC_A_55 = 25;
        
        MAC_B_11 = 26; MAC_B_12 = 27; MAC_B_13 = 28; MAC_B_14 = 29; MAC_B_15 = 30;
        MAC_B_21 = 31; MAC_B_22 = 32; MAC_B_23 = 33; MAC_B_24 = 34; MAC_B_25 = 35;
        MAC_B_31 = 36; MAC_B_32 = 37; MAC_B_33 = 38; MAC_B_34 = 39; MAC_B_35 = 40;
        MAC_B_41 = 41; MAC_B_42 = 42; MAC_B_43 = 43; MAC_B_44 = 44; MAC_B_45 = 45;
        MAC_B_51 = 46; MAC_B_52 = 47; MAC_B_53 = 48; MAC_B_54 = 49; MAC_B_55 = 50;
        
        
        
        Instruction_Type = 0;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 1;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 6;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 7;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 8;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 9;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 10;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 2;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 3;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 4;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        Instruction_Type = 5;
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_A_11,MAC_A_12,MAC_A_13,MAC_A_14,MAC_A_15,MAC_A_21,MAC_A_22,MAC_A_23,MAC_A_24,MAC_A_25,MAC_A_31,MAC_A_32,MAC_A_33,MAC_A_34,MAC_A_35,MAC_A_41,MAC_A_42,MAC_A_43,MAC_A_44,MAC_A_45,MAC_A_51,MAC_A_52,MAC_A_53,MAC_A_54,MAC_A_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_B_11,MAC_B_12,MAC_B_13,MAC_B_14,MAC_B_15,MAC_B_21,MAC_B_22,MAC_B_23,MAC_B_24,MAC_B_25,MAC_B_31,MAC_B_32,MAC_B_33,MAC_B_34,MAC_B_35,MAC_B_41,MAC_B_42,MAC_B_43,MAC_B_44,MAC_B_45,MAC_B_51,MAC_B_52,MAC_B_53,MAC_B_54,MAC_B_55);
        $display("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n",MAC_R_11,MAC_R_12,MAC_R_13,MAC_R_14,MAC_R_15,MAC_R_21,MAC_R_22,MAC_R_23,MAC_R_24,MAC_R_25,MAC_R_31,MAC_R_32,MAC_R_33,MAC_R_34,MAC_R_35,MAC_R_41,MAC_R_42,MAC_R_43,MAC_R_44,MAC_R_45,MAC_R_51,MAC_R_52,MAC_R_53,MAC_R_54,MAC_R_55);
        #20;
        
        $finish; // End simulation
    end
    
    
    
    
    
endmodule



























