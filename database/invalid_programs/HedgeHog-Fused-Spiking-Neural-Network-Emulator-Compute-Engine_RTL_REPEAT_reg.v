// REPEAT_reg.v
//
// Author:  Jerry D. Harthcock
// Version:  1.22  May 3, 2020
// Copyright (C) 2020.  All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                 SYMPL Open-Source                                                  //
//                          HedgeHog Fused Spiking Neural Network Emulator/Compute Engine                             //
//                                    Evaluation and Product Development License                                      //
//                                                                                                                    //
//                                                                                                                    //
// Open-source means:  this source code and this instruction set ("this IP") may be freely downloaded, copied,        //
// modified, distributed and used in accordance with the terms and conditons of the licenses provided herein.         //
//                                                                                                                    //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),      //
// the original author and exclusive copyright owner of this HedgeHog Fused Spiking Neural Network Emulator/Compute   //
// Engine, including related development software ("this IP"), hereby grants recipient of this IP ("licensee"),       //
// a world-wide, paid-up, non-exclusive license to implement this IP within the programmable fabric of Xilinx Kintex  //
// Ultra Plus brand FPGAs--only--and used only for the purposes of evaluation, education, and development of end      //
// products and related development tools.                                                                            //
//                                                                                                                    //
// Furthermore, limited to the purposes of prototyping, evaluation, characterization and testing of implementations   //
// in a hard, custom or semi-custom ASIC, any university or institution of higher education may have their            //
// implementation of this IP produced for said limited purposes at any foundary of their choosing provided that such  //
// prototypes do not ever wind up in commercial circulation, with this license extending to such foundary and is in   //
// connection with said academic pursuit under the supervision of said university or institution of higher education. //
//                                                                                                                    //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy   //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,    //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed   //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to      //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product         //
// Development License.                                                                                               //
//                                                                                                                    //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR          //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM        //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                     //
//                                                                                                                    //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms     //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.    //
// By using this IP for any purpose, licensee agrees to all the terms and conditions set forth in this Evaluation     //
// and Product Development License.                                                                                   //
//                                                                                                                    //
// This Evaluation and Product Development License does not include the right to sell products that incorporate       //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.       //
//                                                                                                                    //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com or Jerry.Harthcock@gmail.com                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 `timescale 1ns/100ps

module REPEAT_reg (
    CLK,
    RESET,
    Ind_Dest_q0, 
    Ind_SrcA_q0, 
    Imod_Dest_q0,
    OPdest_q0,
    OPsrcA_q0,
    immediate16_q0,
    RPT_not_z,
    break_q0,
    Dam_q0,
    AR0,
    AR1,
    AR2,
    AR3,
    AR4,
    AR5,
    AR6,
    discont,
    REPEAT,
    ready_q0
);

input CLK;
input RESET;
input Ind_Dest_q0; 
input Ind_SrcA_q0; 
input Imod_Dest_q0;
input  [14:0] OPdest_q0;
input  [14:0] OPsrcA_q0;
input [15:0] immediate16_q0;
output RPT_not_z;
input break_q0;
input  [1:0]  Dam_q0;
input  [`RPTSIZE-1:0] AR0;
input  [`RPTSIZE-1:0] AR1;
input  [`RPTSIZE-1:0] AR2;
input  [`RPTSIZE-1:0] AR3;
input  [`RPTSIZE-1:0] AR4;
input  [`RPTSIZE-1:0] AR5;
input  [`RPTSIZE-1:0] AR6;
input discont;
output [`RPTSIZE-1:0] REPEAT;
input ready_q0;

parameter REPEAT_addrs = 15'h7FEF;
parameter AR6_ADDRS    = 15'h7FFD;
parameter AR5_ADDRS    = 15'h7FFC;
parameter AR4_ADDRS    = 15'h7FFB;
parameter AR3_ADDRS    = 15'h7FFA;
parameter AR2_ADDRS    = 15'h7FF9;
parameter AR1_ADDRS    = 15'h7FF8;
parameter AR0_ADDRS    = 15'h7FF7;

reg [`RPTSIZE-1:0] REPEAT_a;


wire RPT_not_z_a;
assign RPT_not_z_a = |REPEAT_a; 

wire auto_post_modify_instr_a;

assign auto_post_modify_instr_a = RPT_not_z_a && Ind_Dest_q0 && ~Imod_Dest_q0 && ready_q0;

wire [`RPTSIZE-1:0] REPEAT;
assign REPEAT =  REPEAT_a;                                                                                      
                                                                                                       
wire RPT_not_z;
assign RPT_not_z = RPT_not_z_a; 


//for use outside interrupt service routine
always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
        REPEAT_a <= 0;
    end
    else begin
        if ( (Dam_q0[0] && (OPdest_q0==REPEAT_addrs)) && ~Ind_Dest_q0  && ~discont) REPEAT_a <= immediate16_q0[`RPTSIZE-1:0]; //load REPEAT reg with 11-bit immediate during q0
        else if ((~Dam_q0[1] && (OPdest_q0==REPEAT_addrs)) && ~Ind_SrcA_q0 && ~Ind_Dest_q0  && ~discont) begin
            casex(OPsrcA_q0)
                AR0_ADDRS : REPEAT_a <= AR0[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                AR1_ADDRS : REPEAT_a <= AR1[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                AR2_ADDRS : REPEAT_a <= AR2[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                AR3_ADDRS : REPEAT_a <= AR3[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                AR4_ADDRS : REPEAT_a <= AR4[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                AR5_ADDRS : REPEAT_a <= AR5[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                AR6_ADDRS : REPEAT_a <= AR6[`RPTSIZE-1:0];  //load REPEAT reg with contents of specified ARn
                  default : REPEAT_a <= 0;
            endcase
        end
        else if (auto_post_modify_instr_a && ~break_q0) REPEAT_a <= REPEAT_a - 1'b1;  
    end
end        

endmodule    
    
    
