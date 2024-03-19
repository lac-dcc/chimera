// aux_regs.v
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

module DATA_ADDRS(
    CLK,
    RESET,
    q2_sel,
    wrcycl,
    wrsrcAdata,
    Dam_q0,                  
    Ind_Dest_q0,
    Ind_SrcA_q0,
    Ind_SrcB_q0,
    Imod_Dest_q2,
    Imod_SrcA_q0,
    Imod_SrcB_q0,
    OPdest_q0,
    OPdest_q2,
    OPsrcA_q0,
    OPsrcB_q0,
    OPsrc32_q0,            
    Ind_Dest_q2,
    Dest_addrs_q2,
    Dest_addrs_q0,
    SrcA_addrs_q0,
    SrcB_addrs_q0,
    AR0,
    AR1,
    AR2,
    AR3,
    AR4,
    AR5,
    AR6,
    SP,
    discont,
    ind_mon_read_q0, 
    ind_mon_write_q2,
    ready_q0
    );

input         CLK;
input         RESET;
input         q2_sel;
input         wrcycl;
input [31:0]  wrsrcAdata;
input [1:0]   Dam_q0;      
input         Ind_Dest_q0;
input         Ind_SrcA_q0;
input         Ind_SrcB_q0;
input         Imod_Dest_q2;
input         Imod_SrcA_q0;
input         Imod_SrcB_q0;
input [14:0]  OPdest_q0;
input [14:0]  OPdest_q2;
input [14:0]  OPsrcA_q0;
input [14:0]  OPsrcB_q0;
input [31:0]  OPsrc32_q0;
input         Ind_Dest_q2;
output [31:0] Dest_addrs_q2;
output [31:0] Dest_addrs_q0;
output [31:0] SrcA_addrs_q0;
output [31:0] SrcB_addrs_q0;
output [31:0] AR0;
output [31:0] AR1;
output [31:0] AR2;
output [31:0] AR3;
output [31:0] AR4;
output [31:0] AR5;
output [31:0] AR6;
output [31:0] SP;
input         discont;
input ind_mon_read_q0; 
input ind_mon_write_q2;
input ready_q0;

parameter    SP_ADDRS = 'h7FFE;
parameter   AR6_ADDRS = 'h7FFD;
parameter   AR5_ADDRS = 'h7FFC;
parameter   AR4_ADDRS = 'h7FFB;
parameter   AR3_ADDRS = 'h7FFA;
parameter   AR2_ADDRS = 'h7FF9;
parameter   AR1_ADDRS = 'h7FF8;
parameter   AR0_ADDRS = 'h7FF7;

reg [31:0] DEST_ind_q0; 
reg [31:0] DEST_ind_q2; 
reg [31:0] SRC_A_ind; 
reg [31:0] SRC_B_ind;

reg [31:0] AR0;
reg [31:0] AR1;
reg [31:0] AR2;
reg [31:0] AR3;
reg [31:0] AR4;
reg [31:0] AR5;
reg [31:0] AR6;
reg [31:0]  SP;

wire [2:0] DEST_ARn_sel_q2;
wire [2:0] DEST_ARn_sel_q0;
wire [2:0] SRC_A_sel; 	
wire [2:0] SRC_B_sel; 

wire [31:0] Dest_addrs_q2;
wire [31:0] Dest_addrs_q0;
wire [31:0] SrcA_addrs_q0;
wire [31:0] SrcB_addrs_q0;

	
assign DEST_ARn_sel_q2[2:0] = OPdest_q2[2:0];
assign DEST_ARn_sel_q0[2:0] = OPdest_q0[2:0];
assign SRC_A_sel[2:0] 	 = OPsrcA_q0[2:0];
assign SRC_B_sel[2:0] 	 = OPsrcB_q0[2:0];
assign Dest_addrs_q2 = Ind_Dest_q2 ?  DEST_ind_q2 : {17'b0, OPdest_q2[14:0]};
assign Dest_addrs_q0 = Ind_Dest_q0 ?  DEST_ind_q0 : {17'b0, OPdest_q0[14:0]};
assign SrcA_addrs_q0 = Ind_SrcA_q0 ?  SRC_A_ind   : {17'b0, OPsrcA_q0[14:0]};
assign SrcB_addrs_q0 = Ind_SrcB_q0 ?  SRC_B_ind   : {17'b0, OPsrcB_q0[14:0]};

always @(*) begin
     case (DEST_ARn_sel_q2) 
     	3'b000 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR0[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR0[31:0]; 
     	3'b001 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR1[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR1[31:0]; 
     	3'b010 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR2[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR2[31:0]; 
     	3'b011 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR3[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR3[31:0];
     	3'b100 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR4[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR4[31:0]; 
     	3'b101 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR5[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR5[31:0]; 
     	3'b110 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? (AR6[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : AR6[31:0]; 
     	3'b111 : DEST_ind_q2 = (Imod_Dest_q2 && Ind_Dest_q2) ? ( SP[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]}) : SP[31:0]; 
     endcase
end

always @(*) begin //for use by pushXCU operator only -- no offset permitted
     case (DEST_ARn_sel_q0) 
     	3'b000 : DEST_ind_q0 =  AR0[31:0]; 
     	3'b001 : DEST_ind_q0 =  AR1[31:0]; 
     	3'b010 : DEST_ind_q0 =  AR2[31:0]; 
     	3'b011 : DEST_ind_q0 =  AR3[31:0];
     	3'b100 : DEST_ind_q0 =  AR4[31:0]; 
     	3'b101 : DEST_ind_q0 =  AR5[31:0]; 
     	3'b110 : DEST_ind_q0 =  AR6[31:0]; 
     	3'b111 : DEST_ind_q0 =   SP[31:0]; 
     endcase
end

always @(*) begin
   case (SRC_A_sel) 
   	   3'b000 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR0[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR0[31:0]; 
   	   3'b001 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR1[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR1[31:0]; 
   	   3'b010 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR2[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR2[31:0]; 
   	   3'b011 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR3[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR3[31:0];
   	   3'b100 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR4[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR4[31:0]; 
   	   3'b101 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR5[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR5[31:0]; 
   	   3'b110 : SRC_A_ind = (Imod_SrcA_q0 && Ind_SrcA_q0) ? (AR6[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]}) : AR6[31:0]; 
   	   3'b111 : SRC_A_ind = SP[31:0] + {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]};
       
   endcase
end

always @(*) begin
   case (SRC_B_sel) 
   	   3'b000 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR0[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR0[31:0]; 
   	   3'b001 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR1[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR1[31:0]; 
   	   3'b010 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR2[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR2[31:0]; 
   	   3'b011 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR3[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR3[31:0];
   	   3'b100 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR4[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR4[31:0]; 
   	   3'b101 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR5[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR5[31:0]; 
   	   3'b110 : SRC_B_ind = (Imod_SrcB_q0 && Ind_SrcB_q0) ? (AR6[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]}) : AR6[31:0]; 
   	   3'b111 : SRC_B_ind =  SP[31:0] + {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]};
   endcase
end        

always @(posedge CLK or posedge RESET) begin
    if (RESET) begin
       AR0 <= 0;  
       AR1 <= 0; 
       AR2 <= 0; 
       AR3 <= 0;
       AR4 <= 0; 
       AR5 <= 0; 
       AR6 <= 0; 
//       SP  <= 'h3FF8;             //initialize to middle of direct RAM
       SP  <= 'h0FF8;             //initialize to middle of direct RAM
    end
    else begin
    
        //immediate loads of ARn occur during instruction fetch (state0) -- dest must be direct
        //direct write to ARn during newthreadq has priority over any update
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR0_ADDRS[14:0]) AR0[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR0_ADDRS[14:0]) AR0[31:0] <= wrsrcAdata[31:0];                                                  
        
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR1_ADDRS[14:0]) AR1[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR1_ADDRS[14:0]) AR1[31:0] <= wrsrcAdata[31:0];                                                  
    
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR2_ADDRS[14:0]) AR2[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR2_ADDRS[14:0]) AR2[31:0] <= wrsrcAdata[31:0];                                                  
    
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR3_ADDRS[14:0]) AR3[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR3_ADDRS[14:0]) AR3[31:0] <= wrsrcAdata[31:0];                                                  
    
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR4_ADDRS[14:0]) AR4[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR4_ADDRS[14:0]) AR4[31:0] <= wrsrcAdata[31:0];                                                  
    
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR5_ADDRS[14:0]) AR5[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR5_ADDRS[14:0]) AR5[31:0] <= wrsrcAdata[31:0];                                                  
    
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==AR6_ADDRS[14:0]) AR6[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==AR6_ADDRS[14:0]) AR6[31:0] <= wrsrcAdata[31:0];                                                  
    
        if (~discont && ready_q0 && Dam_q0[1] && Dam_q0[0] && ~Ind_Dest_q0 && OPdest_q0==SP_ADDRS[14:0])   SP[31:0] <= OPsrc32_q0[31:0];     //immediate (up to 32 bits with Dam = 11) loads of ARn occur during instruction fetch (state0)
        //direct or table-read loads of ARn occur during usual write (state2)
        if (wrcycl && ~Ind_Dest_q2 && q2_sel && OPdest_q2[14:0]==SP_ADDRS[14:0] )  SP[31:0] <= wrsrcAdata[31:0];
                                                          
//auto-post-modification section 
        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b000) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR0[31:0] <= AR0[31:0] +  {{21{OPsrcA_q0[13]}}, OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b000) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR0[31:0] <= AR0[31:0] +  {{21{OPsrcB_q0[13]}}, OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b000) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR0[31:0] <= AR0[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b001) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR1[31:0] <= AR1[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b001) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR1[31:0] <= AR1[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b001) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR1[31:0] <= AR1[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b010) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR2[31:0] <= AR2[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b010) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR2[31:0] <= AR2[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b010) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR2[31:0] <= AR2[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b011) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR3[31:0] <= AR3[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b011) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR3[31:0] <= AR3[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b011) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR3[31:0] <= AR3[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b100) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR4[31:0] <= AR4[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b100) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR4[31:0] <= AR4[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b100) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR4[31:0] <= AR4[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b101) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR5[31:0] <= AR5[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b101) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR5[31:0] <= AR5[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b101) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR5[31:0] <= AR5[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b110) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0) AR6[31:0] <= AR6[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b110) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0) AR6[31:0] <= AR6[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b110) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2) AR6[31:0] <= AR6[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};

        //auto post modification of ARs and SP for read cycle occur after state 1
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcA_q0[2:0]==3'b111) && Ind_SrcA_q0 && ~&Dam_q0[1:0] && ~Imod_SrcA_q0)  SP[31:0] <=  SP[31:0] +  {{21{OPsrcA_q0[13]}},  OPsrcA_q0[13:3]};
        if (~discont && ready_q0 && ~ind_mon_read_q0 && (OPsrcB_q0[2:0]==3'b111) && Ind_SrcB_q0 && ~Dam_q0[0] && ~Imod_SrcB_q0)  SP[31:0] <=  SP[31:0] +  {{21{OPsrcB_q0[13]}},  OPsrcB_q0[13:3]};
        //auto post modification of ARs and SP for write cycle occur after state 2
        if (~ind_mon_write_q2 && (wrcycl && OPdest_q2[2:0]==3'b111) && q2_sel && Ind_Dest_q2 && ~Imod_Dest_q2)  SP[31:0] <=  SP[31:0] + {{21{OPdest_q2[13]}}, OPdest_q2[13:3]};
       
    end
end 
   
endmodule   
