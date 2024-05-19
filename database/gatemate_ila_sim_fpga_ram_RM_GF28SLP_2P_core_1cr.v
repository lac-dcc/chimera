// This program was cloned from: https://github.com/colognechip/gatemate_ila
// License: GNU General Public License v3.0

// Company           :   racyics
// Author            :   pilz
// E-Mail            :   <email>
//
// Filename          :   RM_2P_GF28SLP_512x20_1cr.v
// Project Name      :   p_cc
// Subproject Name   :   s_fpga
// Description       :   behavioral of synchronous 2-port-SRAM (512 x 20 bit)
//
// Create Date       :   Wed Dec 18 09:26:47 2013
// Last Change       :   $Date: 2015-03-26 17:04:00 +0100 (Thu, 26 Mar 2015) $
// by                :   $Author: winter $
//------------------------------------------------------------
`timescale 1ns/10fs
module RM_GF28SLP_2P_core_1cr (//inputs port
                               A_CLK_I,
                               A_CS_I,
                               A_ADDR_I,
                               A_DW_I,
                               A_BM_I,
                               A_WE_I,
                               A_RE_I,

                               //output port a
                               A_DR_O,

                               //inputs port b
                               B_CLK_I,
                               B_CS_I,
                               B_ADDR_I,
                               B_DW_I,
                               B_BM_I,
                               B_WE_I,
                               B_RE_I,

                               //output port b
                               B_DR_O,

                               A_DLYL_I,
                               A_DLYH_I,
                               A_DLYCLK_I,
                               B_DLYL_I,
                               B_DLYH_I,
                               B_DLYCLK_I,
                               notifier);



   parameter P_DATA_WIDTH =  20;
   parameter P_ADDR_WIDTH =  9;
   parameter P_COUNT =      2**P_ADDR_WIDTH;


   //inputs port a
   input A_CLK_I;
   input A_CS_I;
   input [P_ADDR_WIDTH-1:0] A_ADDR_I;
   input [P_DATA_WIDTH-1:0] A_DW_I;
   input [P_DATA_WIDTH-1:0] A_BM_I;
   input                    A_WE_I;
   input                    A_RE_I;

   //output port a
   output [P_DATA_WIDTH-1:0] A_DR_O;

   //inputs port b
   input                     B_CLK_I;
   input                     B_CS_I;
   input [P_ADDR_WIDTH-1:0]  B_ADDR_I;
   input [P_DATA_WIDTH-1:0]  B_DW_I;
   input [P_DATA_WIDTH-1:0]  B_BM_I;
   input                     B_WE_I;
   input                     B_RE_I;

   //output port b
   output [P_DATA_WIDTH-1:0] B_DR_O;


   input wire [1:0]          A_DLYL_I;
   input wire [1:0]          A_DLYH_I;
   input wire [1:0]          A_DLYCLK_I;

   input wire [1:0]          B_DLYL_I;
   input wire [1:0]          B_DLYH_I;
   input wire [1:0]          B_DLYCLK_I;

   input                     notifier;



    SRAM_2P_behavioral
      #(.P_DATA_WIDTH(P_DATA_WIDTH),
        .P_ADDR_WIDTH(P_ADDR_WIDTH)/*,
        .COLLISION_TIME_DIFFERENCE(1.0) //in ns
                                    */
        )
    SRAM_2P_behavioral_i
      //inputs port A
      (.A_CLK(A_CLK_I),
       .A_MEN(A_CS_I),
       .A_ADDR(A_ADDR_I),
       .A_DIN(A_DW_I),
       .A_BM(A_BM_I),
       .A_WEN(A_WE_I),
       .A_REN(A_RE_I),

       //output port A
       .A_DOUT(A_DR_O),

       //inputs port B
       .B_CLK(B_CLK_I),
       .B_MEN(B_CS_I),
       .B_ADDR(B_ADDR_I),
       .B_DIN(B_DW_I),
       .B_BM(B_BM_I),
       .B_WEN(B_WE_I),
       .B_REN(B_RE_I),

       //output port B
       .B_DOUT(B_DR_O),

       .A_DLY(A_DLYL_I[0]),
       .B_DLY(A_DLYH_I[0])
       );

endmodule
