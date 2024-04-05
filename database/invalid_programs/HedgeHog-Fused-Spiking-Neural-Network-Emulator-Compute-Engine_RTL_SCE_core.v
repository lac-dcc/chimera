// SCE_core.v
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

module SCE_core (
    CLK,           
    RESET,  
    q1_sel,
    q2_sel,
    wrsrcAdata,
    wrsrcBdata,
    rdSrcAdata,    
    rdSrcBdata,
    priv_RAM_rddataA,                      
    priv_RAM_rddataB,                      
    glob_RAM_rddataA,                      
    glob_RAM_rddataB,                      
    pre_PC,       
    PC,            
    pc_q1,
    pc_q2,
    rewind_PC,
    wrcycl,        
    discont_out,    
    OPsrcA_q0,
    OPsrcA_q1,        
    OPsrcA_q2,
    OPsrcB_q0,
    OPsrcB_q1,        
    OPsrcB_q2,     
    OPdest_q0,      
    OPdest_q1,      
    OPdest_q2, 
    immediate16_q0,
    RPT_not_z, 
    Dam_q0, 
    Dam_q1,        
    Dam_q2,      
    Ind_Dest_q2, 
    Ind_Dest_q1, 
    Ind_SrcA_q0,
    Ind_SrcA_q2,    
    Ind_SrcB_q0, 
    Imod_Dest_q0,   
    Imod_Dest_q2,
    Imod_SrcA_q0,   
    Imod_SrcB_q0,
    Ind_SrcB_q2,
    Size_SrcA_q1,
    Size_SrcB_q1,    
    Size_SrcA_q2,
    Size_SrcB_q2,
    Size_Dest_q2,
    SigA_q1,
    SigA_q2,   
    SigB_q2,
    SigD_q2,    
    OPsrc32_q0, 
    Ind_Dest_q0,
    Dest_addrs_q2,
    Dest_addrs_q0,
    SrcA_addrs_q0,
    SrcB_addrs_q0,
    SrcA_addrs_q1,
    SrcB_addrs_q1,
    V,          
    N,          
    C,          
    Z,          
    done,          
    break_q0,
    mon_write_reg, // data to be written by monitor R/W instruction
    mon_read_reg, //data captured by monitor R/W instruction
    ind_mon_read_q0, 
    ind_mon_write_q2,                            
    statusRWcollision,
    write_disable,
    PRNG_ready,
    ready_q0,
    frc_brk,      
    broke,        
    sstep,        
    skip_cmplt,   
    swbreakDetect    
    );

input  CLK;           
input  RESET; 
input  q1_sel;
input  q2_sel; 
input  [63:0] wrsrcAdata;      
input  [63:0] wrsrcBdata;      
input  rewind_PC;
input  wrcycl; 
output discont_out;

input  [14:0] OPsrcA_q0;
input  [14:0] OPsrcA_q1;        
input  [14:0] OPsrcA_q2;
input  [14:0] OPsrcB_q0;        
input  [14:0] OPsrcB_q1;        
input  [14:0] OPsrcB_q2;     
input  [14:0] OPdest_q0;      
input  [14:0] OPdest_q1;      
input  [14:0] OPdest_q2;
input  [15:0] immediate16_q0;
   
output RPT_not_z; 
output  [`PCWIDTH-1:0] pre_PC;       
input  [1:0]  Dam_q0;
input  [1:0]  Dam_q1;         
input  [1:0]  Dam_q2;      
input  Ind_Dest_q2; 
input  Ind_Dest_q1; 
input  Ind_SrcA_q0;    
input  Ind_SrcA_q2;
input  Ind_SrcB_q0; 
input  Imod_Dest_q0;   
input  Imod_Dest_q2;
input  Imod_SrcA_q0;   
input  Imod_SrcB_q0; 
input  Ind_SrcB_q2;
input [1:0] Size_SrcA_q1;
input [1:0] Size_SrcB_q1;
input [1:0] Size_SrcA_q2;
input [2:0] Size_SrcB_q2;
input [1:0] Size_Dest_q2;
input  SigA_q1;
input  SigA_q2;
input  SigB_q2;
input  SigD_q2;
input  [31:0] OPsrc32_q0; 
input  Ind_Dest_q0;   
output [31:0] Dest_addrs_q2; 
output [31:0] Dest_addrs_q0;       
output [31:0] SrcA_addrs_q0;        
output [31:0] SrcB_addrs_q0; 
input  [31:0] SrcA_addrs_q1;
input  [31:0] SrcB_addrs_q1;
output [`PCWIDTH-1:0] PC;                                                                                                         
output V;
output N;
output C;
output Z;
output done;                                                           
output [63:0] rdSrcAdata;
output [63:0] rdSrcBdata;
input  [63:0] priv_RAM_rddataA;
input  [63:0] priv_RAM_rddataB;
input  [63:0] glob_RAM_rddataA;
input  [63:0] glob_RAM_rddataB;
input  break_q0;  
input  [63:0] mon_write_reg;         //from monitor/break/debug block 
output [63:0] mon_read_reg;
input  ind_mon_read_q0; 
input  ind_mon_write_q2;                            
input [`PCWIDTH-1:0] pc_q1;
input [`PCWIDTH-1:0] pc_q2;
output statusRWcollision;
output write_disable; //from PC block
output PRNG_ready;
input ready_q0;

output frc_brk;      
input  broke;        
output sstep;        
input  skip_cmplt;   
input  swbreakDetect;

       
parameter     BRAL_ =  15'h7FF6;   // branch relative long
parameter     JMPA_ =  15'h7FF5;   // jump absolute long
parameter     BTBS_ =  15'h7FF4;   // bit test and branch if set
parameter     BTBC_ =  15'h7FF3;   // bit test and branch if clear

parameter               BRAL_ADDRS = 32'h00007FF6;   // branch relative long
parameter               JMPA_ADDRS = 32'h00007FF5;   // jump absolute long
parameter               BTBS_ADDRS = 32'h00007FF4;   // bit test and branch if set
parameter               BTBC_ADDRS = 32'h00007FF3;   // bit test and branch if clear

parameter           GLOB_RAM_ADDRS = 32'b0000_0000_0000_0001_0xxx_xxxx_xxxx_xxxx; //globabl RAM address (in bytes)
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
parameter                MON_ADDRS = 32'h00007FEB;

parameter  PRIV_RAM_ADDRS = 32'b0000_0000_0000_0000_00xx_xxxx_xxxx_xxxx;    //first 16k bytes 

reg  [`PCWIDTH-1:0] pre_PC; 

reg [63:0] rdSrcAdata;
reg [63:0] rdSrcBdata;


reg [`LPCNTRSIZE-1:0] LPCNT1;
reg [`LPCNTRSIZE-1:0] LPCNT0;

reg [63:0] mon_read_reg;    //write-only and not qualified with wrcycl

wire frc_brk;      
wire sstep;        

wire write_disable;

wire statusRWcollision;

wire [`LPCNTRSIZE-1:0] LPCNT1_dec;
wire [`LPCNTRSIZE-1:0] LPCNT0_dec;

wire LPCNT1_nz; 
wire LPCNT0_nz;

wire [`RPTSIZE-1:0] REPEAT; 

wire RPT_not_z;
wire discont_out;

wire [`PCWIDTH-1:0] PC;    
wire [`PCWIDTH-1:0] PC_COPY;
wire        done;  
wire [15:0] STATUS;

wire [31:0] SP;
wire [31:0] AR6;
wire [31:0] AR5;
wire [31:0] AR4;
wire [31:0] AR3;
wire [31:0] AR2;
wire [31:0] AR1;
wire [31:0] AR0;

wire [31:0] Dest_addrs_q0;

wire V;
wire N;
wire C;
wire Z;

wire rdStatus_q1;
assign rdStatus_q1 = (OPsrcA_q1==ST_ADDRS[14:0]) || (OPsrcB_q1==ST_ADDRS[14:0]);
 
assign LPCNT1_dec = LPCNT1 - 1'b1;
assign LPCNT0_dec = LPCNT0 - 1'b1;

assign LPCNT1_nz = |LPCNT1_dec;
assign LPCNT0_nz = |LPCNT0_dec;


wire [63:0] PRNG_rddataA;
wire PRNG_ready;
wire PRNG_rden;
assign PRNG_rden = (OPsrcA_q0[14:0]==PRNG_ADDRS[14:0]);
`ifdef SCE_HAS_PRNG
PRNG_H7 PRNG(
    .CLK(CLK),
    .RESET(RESET),
    .rden(PRNG_rden),
    .wren((Dest_addrs_q2==PRNG_ADDRS) && wrcycl),
    .wrdata(wrsrcAdata[7:0]),
    .rddata(PRNG_rddataA[63:0]),
    .SigA(SigA_q1),
    .SizeA(Size_SrcA_q1[1:0]),
    .ready(PRNG_ready)
    );
`else
assign PRNG_ready = 1'b1;
assign PRNG_rddataA = 0;
`endif


PROG_ADDRS 
  prog_addrs (
    .CLK           (CLK         ),
    .RESET         (RESET       ),
    .q2_sel        (q2_sel      ),
    .Ind_Dest_q0   (Ind_Dest_q0 ),
    .Ind_Dest_q2   (Ind_Dest_q2 ),
    .Ind_SrcB_q2   (Ind_SrcB_q2 ),
    .Size_SrcB_q2  (Size_SrcB_q2),
    .SigB_q2       (SigB_q2),
    .OPdest_q0     (OPdest_q0   ),
    .OPdest_q2     (OPdest_q2   ),
    .wrsrcAdata    (wrsrcAdata  ),
    .rewind_PC     (rewind_PC   ),
    .wrcycl        (wrcycl      ),
    .discont_out   (discont_out ),
    .OPsrcB_q2     (OPsrcB_q2   ),
    .RPT_not_z     (RPT_not_z   ),
    .pre_PC        (pre_PC      ),
    .PC            (PC          ),
    .PC_COPY       (PC_COPY     ),
    .pc_q1         (pc_q1       ),
    .pc_q2         (pc_q2       ),
    .break_q0      (break_q0    ),
    .write_disable (write_disable)
    );

DATA_ADDRS data_addrs(
    .CLK           (CLK             ),          
    .RESET         (RESET           ),          
    .q2_sel        (q2_sel          ),          
    .wrcycl        (wrcycl          ),          
    .wrsrcAdata    (wrsrcAdata[31:0]),
    .Dam_q0        (Dam_q0[1:0]     ),          
    .Ind_Dest_q0   (Ind_Dest_q0     ),          
    .Ind_SrcA_q0   (Ind_SrcA_q0     ),                                                  
    .Ind_SrcB_q0   (Ind_SrcB_q0     ),                                                  
    .Imod_Dest_q2  (Imod_Dest_q2    ),                                                  
    .Imod_SrcA_q0  (Imod_SrcA_q0    ),                                                   
    .Imod_SrcB_q0  (Imod_SrcB_q0    ),                                                   
    .OPdest_q0     (OPdest_q0       ),                                                   
    .OPdest_q2     (OPdest_q2       ),          
    .OPsrcA_q0     (OPsrcA_q0       ),          
    .OPsrcB_q0     (OPsrcB_q0       ),          
    .OPsrc32_q0    (OPsrc32_q0      ), 
    .Ind_Dest_q2   (Ind_Dest_q2     ),        
    .Dest_addrs_q2 (Dest_addrs_q2   ), 
    .Dest_addrs_q0 (Dest_addrs_q0   ),         
    .SrcA_addrs_q0 (SrcA_addrs_q0   ),          
    .SrcB_addrs_q0 (SrcB_addrs_q0   ),           
    . AR0          ( AR0            ),
    . AR1          ( AR1            ),
    . AR2          ( AR2            ),
    . AR3          ( AR3            ),
    . AR4          ( AR4            ),
    . AR5          ( AR5            ),
    . AR6          ( AR6            ),
    . SP           ( SP             ),
    .discont       (discont_out     ),
    .ind_mon_read_q0 (ind_mon_read_q0 ),
    .ind_mon_write_q2(ind_mon_write_q2),
    .ready_q0      (ready_q0        )
    );                            

                                  
STATUS_REG status(
     .CLK              (CLK              ),
     .RESET            (RESET            ),
     .wrcycl           (wrcycl           ),
     .q2_sel           (q2_sel           ),
     .OPdest_q2        (OPdest_q2        ),
     .rdStatus_q1      (rdStatus_q1      ),
     .statusRWcollision(statusRWcollision),
     .Ind_Dest_q2      (Ind_Dest_q2      ),
     .SigA_q2          (SigA_q2     ),
     .SigB_q2          (SigB_q2     ),     
     .Size_SrcA_q2     (Size_SrcA_q2     ),
     .wrsrcAdata       (wrsrcAdata       ),
     .wrsrcBdata       (wrsrcBdata       ),
     .V                (V                ),
     .N                (N                ),
     .C                (C                ),
     .Z                (Z                ),
     .done             (done             ),
     .STATUS           (STATUS           ),
     
     .frc_brk           (frc_brk          ),
     .broke             (broke            ),
     .sstep             (sstep            ),
     .skip_cmplt        (skip_cmplt       ),
     .swbreakDetect     (swbreakDetect    )
     );                

REPEAT_reg repeat_reg(
    .CLK           (CLK          ),
    .RESET         (RESET        ),
    .Ind_Dest_q0   (Ind_Dest_q0  ),
    .Ind_SrcA_q0   (Ind_SrcA_q0  ),
    .Imod_Dest_q0  (Imod_Dest_q0 ),
    .OPdest_q0     (OPdest_q0    ),
    .OPsrcA_q0     (OPsrcA_q0    ),
    .immediate16_q0(immediate16_q0),
    .RPT_not_z     (RPT_not_z    ),
    .break_q0      (break_q0     ),
    .Dam_q0        (Dam_q0[1:0]  ),
    .AR0           (AR0[`RPTSIZE-1:0]),
    .AR1           (AR1[`RPTSIZE-1:0]),
    .AR2           (AR2[`RPTSIZE-1:0]),
    .AR3           (AR3[`RPTSIZE-1:0]),
    .AR4           (AR4[`RPTSIZE-1:0]),
    .AR5           (AR5[`RPTSIZE-1:0]),
    .AR6           (AR6[`RPTSIZE-1:0]),
    .discont       (discont_out  ),
    .REPEAT        (REPEAT       ),
    .ready_q0      (ready_q0 && ~discont_out)
);

wire BTB_;
wire [5:0] bit_number;
wire bitmatch;

assign bit_number = {SigB_q2, Size_SrcB_q2[2:0], Ind_SrcB_q2, OPsrcB_q2[14]};
assign BTB_  = ((OPdest_q2==BTBS_) || (OPdest_q2==BTBC_)) && ~Ind_Dest_q2 && wrcycl && q1_sel;
assign bitmatch = ((OPdest_q2==BTBC_) ? ~wrsrcAdata[bit_number] : wrsrcAdata[bit_number]) && BTB_;

always @(*) begin
   if (RESET) pre_PC = 'h100;
   else if (rewind_PC && ~break_q0) pre_PC = pc_q1;
   else if (bitmatch) pre_PC = pc_q2 + {{`PCWIDTH-13{OPsrcB_q2[12]}}, OPsrcB_q2[12:0]};
   else if ((OPdest_q2==PC_ADDRS) && wrcycl && ~Ind_Dest_q2) pre_PC = wrsrcAdata[`PCWIDTH-1:0];  //absolute jump
   else pre_PC = PC + ((RPT_not_z  || break_q0) ? 1'b0 : 1'b1);
end    

//A-side reads
always @(*) begin  
           casex (SrcA_addrs_q1)
           32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx 
                        : rdSrcAdata = glob_RAM_rddataA[63:0]; //addresses are in bytes
               SP_ADDRS : rdSrcAdata = {32'b0, SP };                      
              AR6_ADDRS : rdSrcAdata = {32'b0, AR6};                      
              AR5_ADDRS : rdSrcAdata = {32'b0, AR5};
              AR4_ADDRS : rdSrcAdata = {32'b0, AR4};
              AR3_ADDRS : rdSrcAdata = {32'b0, AR3};                      
              AR2_ADDRS : rdSrcAdata = {32'b0, AR2};                      
              AR1_ADDRS : rdSrcAdata = {32'b0, AR1};
              AR0_ADDRS : rdSrcAdata = {32'b0, AR0};
               PC_ADDRS : rdSrcAdata = {{64-`PCWIDTH{1'b0}}, PC};
          PC_COPY_ADDRS : rdSrcAdata = {{64-`PCWIDTH{1'b0}}, PC_COPY};
               ST_ADDRS : rdSrcAdata = {48'b0, STATUS};
             PRNG_ADDRS : rdSrcAdata = PRNG_rddataA;
           REPEAT_ADDRS : rdSrcAdata = {{64-`RPTSIZE{1'b0}}, REPEAT};  
           LPCNT1_ADDRS : rdSrcAdata = {{63-`LPCNTRSIZE{1'b0}}, LPCNT1_nz, LPCNT1};
           LPCNT0_ADDRS : rdSrcAdata = {{63-`LPCNTRSIZE{1'b0}}, LPCNT0_nz, LPCNT0};
              MON_ADDRS : rdSrcAdata = mon_write_reg;
           
           
         PRIV_RAM_ADDRS : rdSrcAdata =  priv_RAM_rddataA[63:0];        //lowest 16k bytes of memory is RAM space               
               default  : rdSrcAdata = mon_read_reg;  
           endcase
end                                                                          

//B-side reads
always @(*) begin    //addresses are in bytes
           casex (SrcB_addrs_q1)
           32'b01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_01xx_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_001x_xxxx_xxxx_xxxx_xxxx_xxxx,
           32'b0000_0000_0001_xxxx_xxxx_xxxx_xxxx_xxxx
                        : rdSrcBdata = glob_RAM_rddataB[63:0];
               SP_ADDRS : rdSrcBdata = {32'b0, SP };                      
              AR6_ADDRS : rdSrcBdata = {32'b0, AR6};                      
              AR5_ADDRS : rdSrcBdata = {32'b0, AR5};
              AR4_ADDRS : rdSrcBdata = {32'b0, AR4};
              AR3_ADDRS : rdSrcBdata = {32'b0, AR3};                      
              AR2_ADDRS : rdSrcBdata = {32'b0, AR2};                      
              AR1_ADDRS : rdSrcBdata = {32'b0, AR1};
              AR0_ADDRS : rdSrcBdata = {32'b0, AR0};
               PC_ADDRS : rdSrcBdata = {{64-`PCWIDTH{1'b0}}, PC};
          PC_COPY_ADDRS : rdSrcBdata = {{64-`PCWIDTH{1'b0}}, PC_COPY};
               ST_ADDRS : rdSrcBdata = {48'b0, STATUS};
           REPEAT_ADDRS : rdSrcBdata = {{64-`RPTSIZE{1'b0}}, REPEAT};  
           LPCNT1_ADDRS : rdSrcBdata = {{63-`LPCNTRSIZE{1'b0}}, LPCNT1_nz, LPCNT1};
           LPCNT0_ADDRS : rdSrcBdata = {{63-`LPCNTRSIZE{1'b0}}, LPCNT0_nz, LPCNT0};
         PRIV_RAM_ADDRS : rdSrcBdata = priv_RAM_rddataB[63:0];        //lowest 16k bytes of memory is private RAM space               
               default  : rdSrcBdata = 64'b0;            
           endcase
end


always @(posedge CLK or posedge RESET) begin
    if (RESET) mon_read_reg <= 64'b0;
    else if (Dest_addrs_q2==MON_ADDRS && ~|Dam_q2[1:0] && ~Ind_Dest_q2 && q2_sel) mon_read_reg <= wrsrcAdata;
end    


//loop counters
always @(posedge CLK) begin
    if (RESET) begin
        LPCNT1 <= 0;
        LPCNT0 <= 0;
    end
    else begin
        if ((OPdest_q2==LPCNT0_ADDRS[15:0]) && wrcycl && ~Ind_Dest_q2 && q2_sel) LPCNT0 <= wrsrcAdata[`LPCNTRSIZE-1:0];
        else if ((OPdest_q2==BTBS_) && wrcycl && ~Ind_Dest_q2 && (OPsrcA_q2==LPCNT0_ADDRS[15:0]) && q2_sel && LPCNT0_nz) LPCNT0 <= LPCNT0_dec;
        
        if ((OPdest_q2==LPCNT1_ADDRS[15:0]) && wrcycl && ~Ind_Dest_q2 && q2_sel) LPCNT1 <= wrsrcAdata[`LPCNTRSIZE-1:0];
        else if ((OPdest_q2==BTBS_) && wrcycl && ~Ind_Dest_q2 && (OPsrcA_q2==LPCNT1_ADDRS[15:0]) && q2_sel && LPCNT1_nz) LPCNT1 <= LPCNT1_dec;
   end     
end

   
endmodule
