// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 05:14:26 PM
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk, rst,
    input [31:0] A,//address in memory
    input [31:0] WD,//data to store in memory or read it from memory
    input WE,//write enable
    
    input [31:0] R_11, R_12, R_13, R_14, R_15,
    input [31:0] R_21, R_22, R_23, R_24, R_25,
    input [31:0] R_31, R_32, R_33, R_34, R_35,
    input [31:0] R_41, R_42, R_43, R_44, R_45,
    input [31:0] R_51, R_52, R_53, R_54, R_55,
    
    input [1:0]MACDM,

    output [31:0] RD,//read the address A data onto RD, read wxisting data basically
    output reg [12:0] A_11, A_12, A_13, A_14, A_15,
    output reg [12:0] A_21, A_22, A_23, A_24, A_25,
    output reg [12:0] A_31, A_32, A_33, A_34, A_35,
    output reg [12:0] A_41, A_42, A_43, A_44, A_45,
    output reg [12:0] A_51, A_52, A_53, A_54, A_55
    );
    
    wire [9:0] start_adr, offset;
    assign start_adr    =  MACDM != 2'b00 ? A[9:0] : 10'b0000000000;
    assign offset       =  MACDM != 2'b00 ? A[19:10] : 10'b0000000000;

    parameter total_mem_reg = 512;
    
    reg [31:0] Data_Memory_Registers [total_mem_reg:0];
   
    
    always@(*)
    begin
        if( (MACDM == 2'b10 ) || (MACDM == 2'b01 ) )
        begin
            case(offset)
            5:begin
                A_11 <= Data_Memory_Registers[start_adr];    A_12 <= Data_Memory_Registers[start_adr+1];  A_13 <= Data_Memory_Registers[start_adr+2];  A_14 <= Data_Memory_Registers[start_adr+3];  A_15 <= Data_Memory_Registers[start_adr+4] ; 
                A_21 <= Data_Memory_Registers[start_adr+5];  A_22 <= Data_Memory_Registers[start_adr+6];  A_23 <= Data_Memory_Registers[start_adr+7];  A_24 <= Data_Memory_Registers[start_adr+8];  A_25 <= Data_Memory_Registers[start_adr+9] ; 
                A_31 <= Data_Memory_Registers[start_adr+10]; A_32 <= Data_Memory_Registers[start_adr+11]; A_33 <= Data_Memory_Registers[start_adr+12]; A_34 <= Data_Memory_Registers[start_adr+13]; A_35 <= Data_Memory_Registers[start_adr+14]; 
                A_41 <= Data_Memory_Registers[start_adr+15]; A_42 <= Data_Memory_Registers[start_adr+16]; A_43 <= Data_Memory_Registers[start_adr+17]; A_44 <= Data_Memory_Registers[start_adr+18]; A_45 <= Data_Memory_Registers[start_adr+19]; 
                A_51 <= Data_Memory_Registers[start_adr+20]; A_52 <= Data_Memory_Registers[start_adr+21]; A_53 <= Data_Memory_Registers[start_adr+22]; A_54 <= Data_Memory_Registers[start_adr+23]; A_55 <= Data_Memory_Registers[start_adr+24]; 
            end
            4:begin
                A_11 <= Data_Memory_Registers[start_adr];    A_12 <= Data_Memory_Registers[start_adr+1];  A_13 <= Data_Memory_Registers[start_adr+2];  A_14 <= Data_Memory_Registers[start_adr+3];  A_15 <= 0; 
                A_21 <= Data_Memory_Registers[start_adr+5];  A_22 <= Data_Memory_Registers[start_adr+6];  A_23 <= Data_Memory_Registers[start_adr+7];  A_24 <= Data_Memory_Registers[start_adr+8];  A_25 <= 0 ; 
                A_31 <= Data_Memory_Registers[start_adr+10]; A_32 <= Data_Memory_Registers[start_adr+11]; A_33 <= Data_Memory_Registers[start_adr+12]; A_34 <= Data_Memory_Registers[start_adr+13]; A_35 <= 0; 
                A_41 <= Data_Memory_Registers[start_adr+15]; A_42 <= Data_Memory_Registers[start_adr+16]; A_43 <= Data_Memory_Registers[start_adr+17]; A_44 <= Data_Memory_Registers[start_adr+18]; A_45 <= 0; 
                A_51 <= 0; A_52 <= 0; A_53 <= 0; A_54 <= 0; A_55 <= 0; 
            end
            3:begin
                A_11 <= Data_Memory_Registers[start_adr];    A_12 <= Data_Memory_Registers[start_adr+1];  A_13 <= Data_Memory_Registers[start_adr+2];  A_14 <= 0;  A_15 <= 0; 
                A_21 <= Data_Memory_Registers[start_adr+5];  A_22 <= Data_Memory_Registers[start_adr+6];  A_23 <= Data_Memory_Registers[start_adr+7];  A_24 <= 0;  A_25 <= 0 ; 
                A_31 <= Data_Memory_Registers[start_adr+10]; A_32 <= Data_Memory_Registers[start_adr+11]; A_33 <= Data_Memory_Registers[start_adr+12]; A_34 <= 0; A_35 <= 0; 
                A_41 <= 0; A_42 <= 0; A_43 <= 0; A_44 <= 0; A_45 <= 0; 
                A_51 <= 0; A_52 <= 0; A_53 <= 0; A_54 <= 0; A_55 <= 0; 
            end
            2:begin
                A_11 <= Data_Memory_Registers[start_adr];    A_12 <= Data_Memory_Registers[start_adr+1];  A_13 <= 0;  A_14 <= 0;  A_15 <= 0; 
                A_21 <= Data_Memory_Registers[start_adr+5];  A_22 <= Data_Memory_Registers[start_adr+6];  A_23 <= 0;  A_24 <= 0;  A_25 <= 0 ; 
                A_31 <= 0; A_32 <= 0; A_33 <= 0; A_34 <= 0; A_35 <= 0; 
                A_41 <= 0; A_42 <= 0; A_43 <= 0; A_44 <= 0; A_45 <= 0; 
                A_51 <= 0; A_52 <= 0; A_53 <= 0; A_54 <= 0; A_55 <= 0; 
            end
            default:
            begin

            end
            endcase
       end   
       else if(MACDM == 2'b11)
       begin
            Data_Memory_Registers[total_mem_reg]    <= R_11; Data_Memory_Registers[total_mem_reg-1]   <= R_12; Data_Memory_Registers[total_mem_reg-2]   <= R_13; Data_Memory_Registers[total_mem_reg-3]  <= R_14; Data_Memory_Registers[total_mem_reg-4]  <= R_15; 
            Data_Memory_Registers[total_mem_reg-5]  <= R_21; Data_Memory_Registers[total_mem_reg-6]   <= R_22; Data_Memory_Registers[total_mem_reg-7]   <= R_23; Data_Memory_Registers[total_mem_reg-8]  <= R_24; Data_Memory_Registers[total_mem_reg-9]  <= R_25; 
            Data_Memory_Registers[total_mem_reg-10] <= R_31; Data_Memory_Registers[total_mem_reg-11]  <= R_32; Data_Memory_Registers[total_mem_reg-12]  <= R_33; Data_Memory_Registers[total_mem_reg-13] <= R_34; Data_Memory_Registers[total_mem_reg-14] <= R_35; 
            Data_Memory_Registers[total_mem_reg-15] <= R_41; Data_Memory_Registers[total_mem_reg-16]  <= R_42; Data_Memory_Registers[total_mem_reg-17]  <= R_43; Data_Memory_Registers[total_mem_reg-18] <= R_44; Data_Memory_Registers[total_mem_reg-19] <= R_45; 
            Data_Memory_Registers[total_mem_reg-20] <= R_51; Data_Memory_Registers[total_mem_reg-21]  <= R_52; Data_Memory_Registers[total_mem_reg-22]  <= R_53; Data_Memory_Registers[total_mem_reg-23] <= R_54; Data_Memory_Registers[total_mem_reg-24] <= R_55; 
       end
       else if(MACDM == 2'b00)
       begin
            if (WE)
                begin
                      Data_Memory_Registers[A] <= WD;
                 end
       end
       
       else 
       begin     
       end
    end
    
//    always @(posedge clk)
//    begin
//        if (WE)
//            begin
//                Data_Memory_Registers[A] <= WD;
//            end
//    end
    //read
//    assign RD = ( WE == 1'b0 ) ? Data_Memory_Registers[A] : 32'h00000000;//read data at address A if we is low
//    assign RD = (rst) ? 32'd0 : Data_Memory_Registers[A];




endmodule
