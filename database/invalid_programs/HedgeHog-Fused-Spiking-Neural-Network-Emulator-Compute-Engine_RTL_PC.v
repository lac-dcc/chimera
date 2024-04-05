// PC.v
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

module PROG_ADDRS (
    CLK,
    RESET,
    q2_sel,
    Ind_Dest_q0,
    Ind_Dest_q2,
    Ind_SrcB_q2,
    Size_SrcB_q2,
    SigB_q2,
    OPdest_q0,
    OPdest_q2,
    wrsrcAdata,
    rewind_PC,
    wrcycl,        
    discont_out,
    OPsrcB_q2,
    RPT_not_z,
    pre_PC,
    PC,
    PC_COPY,
    pc_q1,
    pc_q2,
    break_q0,
    write_disable
    );
 input         CLK;
 input         RESET;
 input         q2_sel; 
 input         Ind_Dest_q0;      
 input         Ind_Dest_q2;   //    __
 input         Ind_SrcB_q2;   // --|
 input  [2:0]  Size_SrcB_q2;  // --| these 7 bits (can) form part of the bit# for bitsel function
 input         SigB_q2;       // --|
 input  [14:0] OPdest_q2;     // --|___OPdest_q2[14:13]
 input  [14:0] OPdest_q0;     

 input  [63:0] wrsrcAdata;
 input         rewind_PC;
 input         wrcycl; 
 output        discont_out;       
 input  [14:0] OPsrcB_q2;
 input         RPT_not_z;
 input  [`PCWIDTH-1:0] pre_PC;
 output [`PCWIDTH-1:0] PC;
 output [`PCWIDTH-1:0] PC_COPY;
 input  [`PCWIDTH-1:0] pc_q1;
 input  [`PCWIDTH-1:0] pc_q2;
 input         break_q0;
 output        write_disable;

parameter     BRAL_ =  15'h7FF6;   // branch relative long
parameter     JMPA_ =  15'h7FF5;   // jump absolute long
parameter     BTBS_ =  15'h7FF4;   // bit test and branch if set
parameter     BTBC_ =  15'h7FF3;   // bit test and branch if clear

parameter PC_COPY_ADDRS = 15'h7FF2;

reg [`PCWIDTH-1:0] PC;
reg [`PCWIDTH-1:0] PC_COPY;

reg discont_out;
reg branchJustTaken;
reg branchJustTaken_del_0;
reg discont_out_q2;
reg discont_out_q3;

wire BTB_; 
wire bitmatch;
wire [5:0] bit_number;
wire Binstr_q0;

assign Binstr_q0 = ((OPdest_q0==BTBC_) || (OPdest_q0==BTBS_) || (OPdest_q0==BRAL_) || (OPdest_q0==JMPA_)) && ~Ind_Dest_q0;

wire write_disable;

assign write_disable = (branchJustTaken || branchJustTaken_del_0 || discont_out_q2 || discont_out_q3);
assign bit_number = {SigB_q2, Size_SrcB_q2[2:0], Ind_SrcB_q2, OPsrcB_q2[14]};
assign BTB_  = ((OPdest_q2==BTBS_) || (OPdest_q2==BTBC_)) && ~Ind_Dest_q2 && wrcycl && q2_sel;

assign bitmatch = ((OPdest_q2==BTBC_) ? ~wrsrcAdata[bit_number] : wrsrcAdata[bit_number]) && BTB_;

always @(*) begin
    if (~Ind_Dest_q2 && wrcycl && ((OPdest_q2==JMPA_) || (OPdest_q2==BRAL_)) && q2_sel) discont_out = 1'b1;
    else if(bitmatch) discont_out = 1'b1;
    else discont_out = 1'b0;         
end            

always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
        PC <= 'h100;
        PC_COPY <= 'h100;
        branchJustTaken <= 1'b0;
        branchJustTaken_del_0 <= 1'b0;
        discont_out_q2 <= 1'b0;
        discont_out_q3 <= 1'b0;
    end
    else begin
        branchJustTaken_del_0 <= branchJustTaken;
        discont_out_q2 <= discont_out;
        discont_out_q3 <= discont_out_q2;
               
        if (rewind_PC && ~break_q0) begin
            PC <= pc_q1;
            PC_COPY <= pc_q2 + 1'b1;
            branchJustTaken <= 1'b0; 
        end
        else if (bitmatch) begin            
            PC <= pc_q2 + {{`PCWIDTH-13{OPsrcB_q2[12]}}, OPsrcB_q2[12:0]};             
            PC_COPY <= pc_q2 + 1'b1; 
            branchJustTaken <= 1'b1;             
        end         
        else if ((OPdest_q2==JMPA_) && q2_sel && wrcycl && ~Ind_Dest_q2) begin
            PC <= wrsrcAdata[`PCWIDTH-1:0];                       
            PC_COPY <= pc_q2 + 1'b1;  
            branchJustTaken <= 1'b1; 
        end      
        else begin
            PC <= (RPT_not_z || break_q0) ? PC : pre_PC;
            branchJustTaken <= 1'b0; 
        end    
    end
end    

endmodule   
