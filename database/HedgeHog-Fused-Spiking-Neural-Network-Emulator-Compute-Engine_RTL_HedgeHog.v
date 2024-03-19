// HedgeHog.v
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


`define PCWIDTH 20    //program counter width in bits
`define PSIZE 13      // (minimum of 13 = 64k bytes) program memory size in dwords 17-bit address = 128k x 64bit = 1M bytes of program memory
`define DSIZE 13      // indirect data memory size 15-bit address = 32k x 64bit = 256k bytes of byte-addressable triport data RAM 
`define RPTSIZE 16    // repeat counter size in bits
`define LPCNTRSIZE 16 // loop counter size in bits
`define DESIGN_ID 32'h0000_0020   //this number can be scanned out using JTAG

`define HedgeHog_HAS_DENDRITE_TRACE
`define HedgeHog_HAS_ERROR_TRACE
`define HedgeHog_HAS_SLOPE_TRACE
`define HedgeHog_HAS_TIME_EXP

//`define SOB_HAS_PRNG               //H=7 human-readable floating-point pseudo-random number generator

`timescale 1ns/100ps


module HedgeHog (
   CLK,
   RESET,
   wren   ,
   wrSize ,
   wrdata ,
   wraddrs, 
   rden   ,
   rdSize ,
   rdaddrs,
   rddata,
   done
   );
      
input CLK;
input RESET;
input wren;   
input [2:0] wrSize; 
input [63:0] wrdata; 
input [31:0] wraddrs;
input rden;   
input [2:0] rdSize; 
input [31:0] rdaddrs;
output [63:0] rddata;
output done;

parameter     BRAL_ =  15'h7FF6;   // branch relative long
parameter     JMPA_ =  15'h7FF5;   // jump absolute long
parameter     BTBS_ =  15'h7FF4;   // bit test and branch if set
parameter     BTBC_ =  15'h7FF3;   // bit test and branch if clear

parameter               BRAL_ADDRS = 32'h00007FF6;   // branch relative long
parameter               JMPA_ADDRS = 32'h00007FF5;   // jump absolute long
parameter               BTBS_ADDRS = 32'h00007FF4;   // bit test and branch if set
parameter               BTBC_ADDRS = 32'h00007FF3;   // bit test and branch if clear

parameter             SP_TOS_ADDRS = 32'h00007FFF;
parameter                 SP_ADDRS = 32'h00007FFE;
parameter                AR6_ADDRS = 32'h00007FFD;
parameter                AR5_ADDRS = 32'h00007FFC;
parameter                AR4_ADDRS = 32'h00007FFB;
parameter                AR3_ADDRS = 32'h00007FFA;
parameter                AR2_ADDRS = 32'h00007FF9;
parameter                AR1_ADDRS = 32'h00007FF8;
parameter                AR0_ADDRS = 32'h00007FF7;
parameter                 PC_ADDRS = 32'h00007FF5;
parameter            PC_COPY_ADDRS = 32'h00007FF2;
parameter                 ST_ADDRS = 32'h00007FF1;
parameter               PRNG_ADDRS = 32'h00007FF0;
parameter             REPEAT_ADDRS = 32'h00007FEF;
parameter             LPCNT1_ADDRS = 32'h00007FEE;
parameter             LPCNT0_ADDRS = 32'h00007FED;
parameter              TIMER_ADDRS = 32'h00007FEC;
parameter                MON_ADDRS = 32'h00007FEB;
parameter        INTEGER_CMP_ADDRS = 15'h7FCF;
parameter  PRIV_RAM_ADDRS = 32'b0000_0000_0000_0000_0xxx_xxxx_xxxx_xxxx;    //first 32k bytes (since data memory is byte-addressable and smallest RAM for this in Kintex 7 is 2k x 64 bits using two blocks next to each other

                            
reg [`PCWIDTH-1:0] pc_q1;
reg [`PCWIDTH-1:0] pc_q2;

reg [63:0] wrsrcAdataSext;
reg [63:0] wrsrcBdataSext;
reg [63:0] wrsrcAdata;
reg [63:0] wrsrcBdata;

reg [3:0]  STATE;
                                                                                           
//reg [1:0]  RM_q1; 
reg [1:0]  NN_Mode_q1;
reg [1:0]  Dam_q1; 
reg        SigD_q1;
reg [2:0]  Size_Dest_q1;  
reg        Ind_Dest_q1;
reg        Imod_Dest_q1; 
reg [14:0] OPdest_q1;
reg        SigA_q1;
reg [2:0]  Size_SrcA_q1;  
reg        Ind_SrcA_q1; 
reg [14:0] OPsrcA_q1; 
reg        SigB_q1;
reg  [2:0] Size_SrcB_q1;  
reg        Ind_SrcB_q1; 
reg [14:0] OPsrcB_q1; 
reg [31:0] OPsrc32_q1; 

//reg [1:0]   RM_q2; 
reg [1:0]  NN_Mode_q2;
reg [1:0]  Dam_q2; 
reg        SigD_q2;
reg [2:0]  Size_Dest_q2;  
reg        Ind_Dest_q2;
reg        Imod_Dest_q2; 
reg [14:0] OPdest_q2;
//reg        Sext_SrcA_q2; 
reg        SigA_q2;
reg [2:0]  Size_SrcA_q2;  
reg        Ind_SrcA_q2; 
reg [14:0] OPsrcA_q2; 
reg        SigB_q2;
reg  [2:0] Size_SrcB_q2;  
reg        Ind_SrcB_q2; 
reg [14:0] OPsrcB_q2; 
reg [31:0] OPsrc32_q2;

reg [31:0] SrcA_addrs_q1;
reg [31:0] SrcB_addrs_q1;
//reg [31:0] SrcA_addrs_q2;
//reg [31:0] SrcB_addrs_q2;

reg [15:0] immediate16_q1;
reg [31:0] Dest_addrs_q1;

reg write_collision_os;
reg write_collision_os_q1;
reg tableRead_q1;

//reg [63:0] rddata;
wire [63:0] rddata;

wire [15:0] wrdata_q2;
wire [15:0] spineRddata;
wire break_q0;
wire break_q1;
wire break_q2;

wire [`PCWIDTH-1:0] pre_PC;


wire [1:0] Dam_q0;
wire Ind_SrcA_q0;
wire Ind_SrcB_q0;
wire Ind_Dest_q0;
wire Imod_SrcA_q0;
wire Imod_SrcB_q0;
wire Imod_Dest_q0;
wire [2:0] Size_SrcA_q0;
wire [2:0] Size_SrcB_q0;
wire [2:0] Size_Dest_q0;
wire        SigA_q0;
wire        SigB_q0; 
wire        SigD_q0; 
wire [31:0] OPsrc32_q0;
wire [14:0] OPsrcA_q0;
wire [14:0] OPsrcB_q0;
wire [14:0] OPdest_q0;

wire [15:0] immediate16_q0;

wire [5:0] sextA_sel;
wire [5:0] sextB_sel;

wire C_q1;
wire V_q1;
wire N_q1;
wire Z_q1;

wire [63:0] Instruction_q0;
wire [63:0] Instruction_q0_del;
wire [63:0] priv_RAM_rddataA;
wire [63:0] priv_RAM_rddataB;
wire [63:0] glob_RAM_rddataA;
wire [63:0] glob_RAM_rddataB;

assign glob_RAM_rddataA = 0;
assign glob_RAM_rddataB = 0;

wire rdcycl;
wire wrcycl;


wire write_collision;

//wire [63:0] rdSrcAdata;
reg [63:0] rdSrcAdata;
wire [63:0] core_rdSrcAdata;
wire [63:0] rdSrcBdata;
wire [63:0] core_rdSrcBdata;
wire [31:0] Dest_addrs_q2;
wire [31:0] Dest_addrs_q0;
wire [31:0] coreDest_addrs_q2;
wire [31:0] SrcA_addrs_q0;
wire [31:0] coreSrcA_addrs_q0;
wire [31:0] SrcB_addrs_q0;
wire [63:0] mon_read_reg;    
wire [`PCWIDTH-1:0] PC;
wire C;
wire V;
wire N;
wire Z;
wire done;
wire RPT_not_z;
wire rewind_PC;
wire discont;
//wire [1:0] RM;
wire [1:0] NN_Mode_q0;

wire statusRWcollision;
wire write_disable;      //from PC block

wire [31:0] mon_read_addrs; 
wire [31:0] mon_write_addrs_q2;

wire ind_mon_read_q0; 
wire ind_mon_write_q2;

wire tableRead_q0;
assign tableRead_q0 = SrcA_addrs_q0[31] || (Dam_q0[1:0]==2'b10);
wire tableWrite_q2;
assign tableWrite_q2 = wrcycl && Dest_addrs_q2[31];      
wire [63:0] tableReadData_q1;  


assign NN_Mode_q0[1:0] = Instruction_q0_del[63:62];
assign wrdata_q2 = wrsrcAdata[15:0];

wire PRNG_ready_q0;
reg PRNG_ready_q1;

wire spineRdSrcA_q0;
wire spineRdSrcA_q1;
wire spineRdSrcB_q1;
wire [63:0] mon_writeData_q1;

assign spineRdSrcA_q0 = ~tableRead_q0 && |SrcA_addrs_q0[30:15];
assign spineRdSrcA_q1 = ~tableRead_q1 && |SrcA_addrs_q1[30:15];

//assign pushSpikesIn = wren && (wraddrs[31:12]==20'b0000_0000_0000_0000_0100);
assign spineRdSrcB_q1 = (Dest_addrs_q1[31:12]==20'b0000_0000_0000_0000_0100);

assign rddata = rdSrcAdata;
always @(*)
    case(Size_SrcA_q1)
        3'b010 : rdSrcAdata = spineRdSrcA_q1 ? {32'b0, spineRddata[15], {1'b0, spineRddata[14:8]}+64, spineRddata[7:0], 15'b0} : tableRead_q1 ? tableReadData_q1  : core_rdSrcAdata; 
        3'b011 : rdSrcAdata = spineRdSrcA_q1 ? {spineRddata[15], {4'b0, spineRddata[14:8]}+960, spineRddata[7:0], 44'b0} : tableRead_q1 ? tableReadData_q1  : core_rdSrcAdata; 
       default : rdSrcAdata = spineRdSrcA_q1 ? {48'b0, spineRddata} : tableRead_q1 ? tableReadData_q1  : core_rdSrcAdata;
    endcase   

//assign rdSrcAdata = tableRead_q1 ? tableReadData_q1 : (spineRdSrcA_q1 ? {48'b0, spineRddata} : core_rdSrcAdata);
//assign rdSrcAdata = tableRead_q1 ? tableReadData_q1  : core_rdSrcAdata;

assign rdSrcBdata = core_rdSrcBdata;
                                                               

assign Dest_addrs_q2 = ind_mon_write_q2 ? mon_write_addrs_q2 : coreDest_addrs_q2;
assign SrcA_addrs_q0 = ind_mon_read_q0 ? mon_read_addrs : coreSrcA_addrs_q0;

assign sextA_sel = {Size_Dest_q2[2:0], Size_SrcA_q2[2:0]};       
assign sextB_sel = {Size_Dest_q2[2:0], Size_SrcB_q2[2:0]};

assign Dam_q0[1:0]       = Instruction_q0_del[61:60]; 
assign SigD_q0           = Instruction_q0_del[59];   
assign Size_Dest_q0[2:0] = Instruction_q0_del[58:56]; 
assign Ind_Dest_q0       = Instruction_q0_del[55]; 
assign Imod_Dest_q0      = Instruction_q0_del[54];   //borrows msb of destination operand
assign OPdest_q0[14:0]   = Instruction_q0_del[54:40]; 
assign SigA_q0           = Instruction_q0_del[39]; 
assign Size_SrcA_q0[2:0] = &Dam_q0[1:0] ? 3'b010 : Instruction_q0_del[38:36]; 
assign Ind_SrcA_q0       = Instruction_q0_del[35] && ~&Dam_q0[1:0]; 
assign Imod_SrcA_q0      = Instruction_q0_del[34] && ~&Dam_q0[1:0];   //borrows msb of SrcA operand
assign OPsrcA_q0[14:0]   = Instruction_q0_del[34:20];
assign SigB_q0           = Instruction_q0_del[19]; 
assign Size_SrcB_q0[2:0] = &Dam_q0[1:0] ? 3'b010 : Instruction_q0_del[18:16]; 
//assign Ind_SrcB_q0       = Instruction_q0_del[15];   
assign Ind_SrcB_q0       = Instruction_q0_del[15] && ~&Dam_q0[1:0];   //do not show Ind_SrcB when immediate mode
assign Imod_SrcB_q0      = Instruction_q0_del[14] && ~&Dam_q0[1:0];   //do not show Ind_SrcB when immediate mode   //borrows msb of SrcB operand
assign OPsrcB_q0[14:0]   = Instruction_q0_del[14:0]; 
assign OPsrc32_q0[31:0]  = Instruction_q0_del[31:0]; 

assign immediate16_q0[15:0] = Instruction_q0_del[15:0];

wire ready_q0;

assign write_collision = ((SrcA_addrs_q1[31:0]==Dest_addrs_q2[31:0]) || (SrcB_addrs_q1[31:1]==Dest_addrs_q2[31:1]) || statusRWcollision) && ~write_collision_os && ~write_collision_os_q1 && ~break_q0 && ~break_q1 && wrcycl  && ~(Dam_q1[1:0]==2'b10) && ~SrcB_addrs_q1[31] && |Dest_addrs_q2[31:0];

assign rewind_PC =  write_collision || ~PRNG_ready_q1;
assign ready_q0 = PRNG_ready_q0;    
assign rdcycl = 1'b1;
assign wrcycl = (STATE[2] && ~write_disable) || break_q2;

wire frc_brk;      
wire broke;        
wire sstep;        
wire skip_cmplt;   
wire swbreakDetect;


SCE_breakpoints breakpoints(
    .CLK               (CLK               ),
    .RESET             (RESET             ),
    .Instruction_q0    (Instruction_q0    ),
    .Instruction_q0_del(Instruction_q0_del),
    .break_q0          (break_q0          ),
    .break_q1          (break_q1          ),
    .break_q2          (break_q2          ),
    .ind_mon_read_q0   (ind_mon_read_q0   ),
    .ind_mon_write_q2  (ind_mon_write_q2  ),
    .mon_write_addrs_q2(mon_write_addrs_q2),
    .mon_read_addrs    (mon_read_addrs    ),
    .mon_writeData_q1  (mon_writeData_q1  ),
    .frc_brk           (frc_brk           ),
    .broke             (broke             ),
    .sstep             (sstep             ),
    .skip_cmplt        (skip_cmplt        ),
    .swbreakDetect     (swbreakDetect     ),
    .rden_q0           (rden              ),
    .wren_q0           (wren              ),
    .rdSize_q0         (rdSize            ),
    .wrSize_q0         (wrSize            ),
    .wrdata_q0         (wrdata            ),
    .rdaddrs_q0        (rdaddrs           ),
    .wraddrs_q0        (wraddrs           )
    );                 

wire ldRepeatReg;
assign ldRepeatReg = (Dam_q0[0] || (~Dam_q0[1] && ~Ind_SrcA_q0)) && (OPdest_q0==REPEAT_ADDRS) && ~Ind_Dest_q0  && ~discont;
SpiNNe SpiNNe(
    .CLK     (CLK     ),
    .RESET   (RESET   ),
    .DONE    (done    ),
    .ldRepeatReg(ldRepeatReg),
    .act     (NN_Mode_q2[1]), 
    .accum   (NN_Mode_q2[0]), 
    .rdenA   (spineRdSrcA_q0  ),
    .rdaddrsA(SrcA_addrs_q0),
    .rddataA (spineRddata),
    .rdenB   (spineRdSrcB_q1  ),
    .rdaddrsB(SrcB_addrs_q1[11:0]),
    .wren    (wrcycl    ),   
    .wraddrs (Dest_addrs_q2 ),   
    .wrdata  (wrdata_q2  )
    );       

//assign spineRddata = 64'b0;

SCE_core SCE_core(                                         
   .CLK            (CLK             ),                       
   .RESET          (RESET           ),                       
   .q1_sel         (STATE[1]        ),              
   .q2_sel         (STATE[2]        ),              
   .wrsrcAdata     (wrsrcAdata[63:0]),                       
   .wrsrcBdata     (wrsrcBdata[63:0]),                       
   .rdSrcAdata     (core_rdSrcAdata ),                       
   .rdSrcBdata     (core_rdSrcBdata ),                       
   .priv_RAM_rddataA (priv_RAM_rddataA[63:0]),                      
   .priv_RAM_rddataB (priv_RAM_rddataB[63:0]),                      
   .glob_RAM_rddataA (glob_RAM_rddataA[63:0]),                      
   .glob_RAM_rddataB (glob_RAM_rddataB[63:0]),                      
   .pre_PC         (pre_PC          ),                       
   .PC             (PC              ),                      
   .pc_q1          (pc_q1           ), 
   .pc_q2          (pc_q2           ), 
   .rewind_PC      (rewind_PC       ),                       
   .wrcycl         (wrcycl          ),                       
   .discont_out    (discont         ),                       
   .OPsrcA_q0      (OPsrcA_q0[14:0] ),
   .OPsrcA_q1      (OPsrcA_q1[14:0] ),
   .OPsrcA_q2      (OPsrcA_q2[14:0] ),                       
   .OPsrcB_q0      (OPsrcB_q0[14:0] ),                       
   .OPsrcB_q1      (OPsrcB_q1[14:0] ),                       
   .OPsrcB_q2      (OPsrcB_q2[14:0] ),                       
   .OPdest_q0      (OPdest_q0[14:0] ),                       
   .OPdest_q1      (OPdest_q1[14:0] ),                       
   .OPdest_q2      (OPdest_q2[14:0] ), 
   .immediate16_q0 (immediate16_q0  ),                      
   .RPT_not_z      (RPT_not_z       ),                       
   .Dam_q0         (Dam_q0[1:0]     ),                       
   .Dam_q1         (Dam_q1[1:0]     ),                          
   .Dam_q2         (Dam_q2[1:0]     ),                       
   .Ind_Dest_q2    (Ind_Dest_q2     ),                       
   .Ind_Dest_q1    (Ind_Dest_q1     ),                       
   .Ind_SrcA_q0    (Ind_SrcA_q0     ),                       
   .Ind_SrcA_q2    (Ind_SrcA_q2     ),                       
   .Ind_SrcB_q0    (Ind_SrcB_q0     ),
   .Imod_Dest_q0   (Imod_Dest_q0    ),                       
   .Imod_Dest_q2   (Imod_Dest_q2    ),                       
   .Imod_SrcA_q0   (Imod_SrcA_q0    ),                       
   .Imod_SrcB_q0   (Imod_SrcB_q0    ),                       
   .Ind_SrcB_q2    (Ind_SrcB_q2     ),
   .Size_SrcA_q1   (Size_SrcA_q1[1:0]),
   .Size_SrcB_q1   (Size_SrcB_q1[1:0]),
   .Size_SrcA_q2   (Size_SrcA_q2[1:0]),
   .Size_SrcB_q2   (Size_SrcB_q2[2:0]),  // need this for btbc/s
   .Size_Dest_q2   (Size_Dest_q2[1:0]),
   .SigA_q1        (SigA_q1          ),
   .SigA_q2        (SigA_q2          ),                      
   .SigB_q2        (SigB_q2          ),                      
   .SigD_q2        (SigD_q2          ),                      
   .OPsrc32_q0     (OPsrc32_q0[31:0]),                      
   .Ind_Dest_q0    (Ind_Dest_q0      ),                      
   .Dest_addrs_q2  (coreDest_addrs_q2),
   .Dest_addrs_q0  (Dest_addrs_q0   ),                
   .SrcA_addrs_q0  (coreSrcA_addrs_q0),                
   .SrcB_addrs_q0  (SrcB_addrs_q0   ),                
   .SrcA_addrs_q1  (SrcA_addrs_q1   ),                    
   .SrcB_addrs_q1  (SrcB_addrs_q1   ),                    
   .V              (V               ),                      
   .N              (N               ),                      
   .C              (C               ),                      
   .Z              (Z               ),                      
   .done           (done            ),                      
   .break_q0       (break_q0        ),                       
   .mon_write_reg  (mon_writeData_q1),    //this is the data to be written during monitor write operation
   .mon_read_reg   (mon_read_reg    ),    //don't care if it writes to read_reg or not
   .ind_mon_read_q0 (ind_mon_read_q0),
   .ind_mon_write_q2(ind_mon_write_q2),                            
   .statusRWcollision(statusRWcollision),
   .write_disable  (write_disable   ),
   .PRNG_ready     (PRNG_ready_q0   ),
   .ready_q0       (ready_q0        ),
   .frc_brk        (frc_brk         ),
   .broke          (broke           ),
   .sstep          (sstep           ),
   .skip_cmplt     (skip_cmplt      ),
   .swbreakDetect  (swbreakDetect   )
   );   
   
    
always @(posedge CLK) tableRead_q1 = tableRead_q0; 

SCEultraProgRAM #(.ADDRS_WIDTH(`PSIZE))       //dword addressable for program and table/constant storage
   PRAM0(      //program memory 
   .CLK       (CLK ),
   .wren      (tableWrite_q2 ),  
   .wraddrs   (Dest_addrs_q2[`PSIZE-1:0]),             //writes to program ram are dword in address increments of one
   .wrdata    (wrsrcAdataSext[63:0]),
   .rdenA     (tableRead_q0),
   .rdaddrsA  (SrcA_addrs_q0[`PSIZE-1:0]),
   .rddataA   (tableReadData_q1[63:0]),
   .rdenB     (rdcycl ),
   .rdaddrsB  (pre_PC[`PSIZE-1:0]),
   .rddataB   (Instruction_q0)
   ); 
    
    
triPortBlockRAM_ZeroPage  #(.ADDRS_WIDTH(11)) //reduced to 16K bytes  
    ram0(            //(first 16k bytes) of directly or indirectly addressable memory
   .CLK       (CLK   ),
   .wren      (wrcycl && (Dest_addrs_q2[31:14]==18'b0)),
   .wrsize    (Size_Dest_q2[1:0]),
   .wraddrs   (Dest_addrs_q2[13:0]),
   .wrdata    (wrsrcAdataSext[63:0]),
   .rdenA     (SrcA_addrs_q0[31:14]==18'b0),
   .rdAsize   (Size_SrcA_q0[1:0]),
   .rdaddrsA  (SrcA_addrs_q0[13:0]),
   .rddataA   (priv_RAM_rddataA[63:0]),
   .rdenB     (SrcB_addrs_q0[31:14]==18'b0),                                                       
   .rdBsize   (Size_SrcB_q0[1:0]),
   .rdaddrsB  (SrcB_addrs_q0[13:0]),
   .rddataB   (priv_RAM_rddataB[63:0])
   );  

    
always @(*) begin                    
   if (SigA_q2) 
       case (Size_SrcA_q2)
           3'b000 : if (wrsrcAdata[7]) wrsrcAdataSext[63:0] = {{14{4'hF}}, wrsrcAdata[7:0]};
                    else wrsrcAdataSext[63:0] = wrsrcAdata[63:0];
                    
           3'b001 : if (wrsrcAdata[15]) wrsrcAdataSext[63:0] = {{12{4'hF}}, wrsrcAdata[15:0]};
                    else wrsrcAdataSext[63:0] = wrsrcAdata[63:0];
                   
           3'b010 : if (wrsrcAdata[31]) wrsrcAdataSext[63:0] = {{8{4'hF}}, wrsrcAdata[31:0]};
                    else wrsrcAdataSext[63:0] = wrsrcAdata[63:0];
                                        
           default: wrsrcAdataSext[63:0] = wrsrcAdata[63:0]; 
       endcase
    else  wrsrcAdataSext[63:0] = wrsrcAdata[63:0];
end                           

always @(*) begin                    
   if (SigB_q2) 
       case (Size_SrcB_q2)
           3'b000 : if (wrsrcBdata[7]) wrsrcBdataSext[63:0] = {{14{4'hF}}, wrsrcBdata[7:0]};
                    else wrsrcBdataSext[63:0] = wrsrcBdata[63:0];
                    
           3'b001 : if (wrsrcBdata[15]) wrsrcBdataSext[63:0] = {{12{4'hF}}, wrsrcBdata[15:0]};
                    else wrsrcBdataSext[63:0] = wrsrcBdata[63:0];
                   
           3'b010 : if (wrsrcBdata[31]) wrsrcBdataSext[63:0] = {{8{4'hF}}, wrsrcBdata[31:0]};
                    else wrsrcBdataSext[63:0] = wrsrcBdata[63:0];
                                        
           default: wrsrcBdataSext[63:0] = wrsrcBdata[63:0]; 
       endcase
    else  wrsrcBdataSext[63:0] = wrsrcBdata[63:0];
end                           

always @(posedge CLK)
    if (RESET) PRNG_ready_q1 <= 0;
    else PRNG_ready_q1 <= PRNG_ready_q0;

always @(posedge CLK ) begin                                                                     
   if (RESET) begin                                                                                             
       // state 1 fetch                                                                                         
       pc_q1               <= `PCWIDTH'h100;                                                                               
       Dam_q1[1:0]         <= 2'b00;                         
       SrcA_addrs_q1       <= 32'b0;                                                                                
       SrcB_addrs_q1       <= 32'b0;                                                              
       OPdest_q1           <= 0;                                                                        
       OPsrcA_q1           <= 0;                                                                        
       OPsrcB_q1           <= 0;                                                                        
//       RM_q1[1:0]          <= 0; 
       NN_Mode_q1[1:0]     <= 0; 
       SigD_q1             <= 1'b0;
       Size_Dest_q1[2:0]   <= 0;
       Ind_Dest_q1         <= 1'b0;
       Imod_Dest_q1        <= 1'b0;
       SigA_q1             <= 1'b0;
       Size_SrcA_q1[2:0]   <= 0;
       Ind_SrcA_q1         <= 1'b0; 
       SigB_q1             <= 1'b0;
       Size_SrcB_q1[2:0]   <= 0;
       Ind_SrcB_q1         <= 1'b0; 
       OPsrc32_q1          <= 32'b0; 
       immediate16_q1      <= 0;                                                                                                             
                                                                                                                 
       // state2 read                                                                                             
       pc_q2               <= `PCWIDTH'h100;                                                                 
       Dam_q2[1:0]         <= 2'b00;           
//       SrcA_addrs_q2       <= 32'b0;                                                                         
//       SrcB_addrs_q2       <= 32'b0;                                                       
       OPdest_q2           <= 0;                                                              
       OPsrcA_q2           <= 0;                                                              
       OPsrcB_q2           <= 0;                                                              
//       RM_q2[1:0]          <= 0;  
       NN_Mode_q2[1:0]     <= 0; 
       SigD_q2             <= 1'b0;
       Size_Dest_q2[2:0]   <= 0;
       Ind_Dest_q2         <= 1'b0;
       Imod_Dest_q2        <= 1'b0;
       SigA_q2             <= 1'b0;
       Size_SrcA_q2[2:0]   <= 0;
       Ind_SrcA_q2         <= 1'b0; 
       SigB_q2             <= 1'b0;
       Size_SrcB_q2[2:0]   <= 0;
       Ind_SrcB_q2         <= 1'b0; 
                                                                                                     
       STATE <= 4'b0000;                                                                               
                                                                                                       
       wrsrcAdata <= 0;
       wrsrcBdata <= 0;         
                           
       write_collision_os <= 1'b0;
       write_collision_os_q1 <= 1'b0;
       
       Dest_addrs_q1 <= 0;

   end                                                                                                          
   else begin                                                                                                   
       STATE <= {1'b1, STATE[3:1]};    //rotate right 1 into msb  (shift right)
       write_collision_os <= write_collision ;
       write_collision_os_q1 <= write_collision_os;
       Dest_addrs_q1 <= Dest_addrs_q0;

          NN_Mode_q1[1:0]     <= NN_Mode_q0[1:0]     ;
          pc_q1               <= PC                  ; 
          Dam_q1[1:0]         <= Dam_q0[1:0]         ;                 
          SrcA_addrs_q1       <= SrcA_addrs_q0       ; 
          SrcB_addrs_q1       <= SrcB_addrs_q0       ; 
          OPdest_q1           <= OPdest_q0           ;
          OPsrcA_q1           <= OPsrcA_q0           ;
          OPsrcB_q1           <= OPsrcB_q0           ;
          OPsrc32_q1          <= OPsrc32_q0          ;
          immediate16_q1      <= immediate16_q0      ;
                    
          NN_Mode_q2          <= NN_Mode_q1          ;
          pc_q2               <= pc_q1               ;  
          OPdest_q2           <= OPdest_q1           ;
          OPsrcA_q2           <= OPsrcA_q1           ;
          OPsrcB_q2           <= OPsrcB_q1           ;
          
          SigD_q1             <= SigD_q0             ;
          Size_Dest_q1        <= Size_Dest_q0        ;
          Ind_Dest_q1         <= Ind_Dest_q0         ;
          Imod_Dest_q1        <= Imod_Dest_q0        ;
          SigA_q1             <= SigA_q0             ;
          Size_SrcA_q1        <= Size_SrcA_q0        ;
          Ind_SrcA_q1         <= Ind_SrcA_q0         ;
          SigB_q1             <= SigB_q0             ;
          Size_SrcB_q1        <= Size_SrcB_q0        ;
          Ind_SrcB_q1         <= Ind_SrcB_q0         ;
                                                     
          SigD_q2             <= SigD_q1             ;
          Size_Dest_q2        <= Size_Dest_q1        ;
          Ind_Dest_q2         <= Ind_Dest_q1         ;
          Imod_Dest_q2        <= Imod_Dest_q1        ;
          SigA_q2             <= SigA_q1             ;
          Size_SrcA_q2        <= Size_SrcA_q1        ;
          Ind_SrcA_q2         <= Ind_SrcA_q1         ;
          SigB_q2             <= SigB_q1             ;
          Size_SrcB_q2        <= Size_SrcB_q1        ;
          Ind_SrcB_q2         <= Ind_SrcB_q1         ;


          case(Dam_q1)     //MOV
              2'b00 : begin    // both srcA and srcB are either direct or indirect
                         wrsrcAdata <=  rdSrcAdata;  //rdSrcA expects data here to be zero-extended to 64 bits           
                         wrsrcBdata <=  rdSrcAdata;  //rdSrcB expects data here to be zero-extended to 64 bits
                      end
              2'b01 : begin   //srcA is direct or indirect and srcB is 8 or 16-bit immediate
                         wrsrcAdata <= rdSrcAdata;     //direct or indirect srcA
                         wrsrcBdata <= {48'b0, immediate16_q1};    //rdSrcB expects data here to be zero-extended to 64 bits
                      end
              2'b10 : begin  //srcA is table-read and srcB is direct or indirect 
                         wrsrcAdata <= rdSrcAdata;     //rdSrcA expects data here to be zero-extended to 64 bits        
                         wrsrcBdata <= rdSrcBdata;     //rdSrcB expects data here to be zero-extended to 64 bits
                      end
              2'b11 : begin //32-bit immediate       
                         wrsrcAdata <= {32'h0000_0000, OPsrc32_q1[31:0]};   //rdSrcA expects data here to be zero-extended to 64 bits
                         wrsrcBdata <= 64'b0;     
                      end
          endcase  
         
  end             
end

endmodule
