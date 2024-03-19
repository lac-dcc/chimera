// STATUS_REG.v
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

module STATUS_REG (
    CLK,
    RESET,
    wrcycl,           
    q2_sel,
    OPdest_q2,
    rdStatus_q1,
    statusRWcollision,
    Ind_Dest_q2,
    SigA_q2,
    SigB_q2,
    Size_SrcA_q2,
    wrsrcAdata, 
    wrsrcBdata, 
    V,
    N,
    C,
    Z,
    done,
    STATUS,
    
    frc_brk,      
    broke,        
    sstep,        
    skip_cmplt,   
    swbreakDetect
);

input  CLK;
input  RESET;
input  wrcycl;           
input  q2_sel;
input  [14:0] OPdest_q2;
input rdStatus_q1;
input Ind_Dest_q2;
input SigA_q2;
input SigB_q2;
input [1:0] Size_SrcA_q2; 
input  [63:0] wrsrcAdata; 
input  [63:0] wrsrcBdata; 
output V;
output N;
output C;
output Z;
output done;
output [15:0] STATUS;
  
output statusRWcollision; 

output frc_brk;      
input broke;        
output sstep;        
input skip_cmplt;   
input swbreakDetect;

parameter ST_ADDRS        = 15'h7FF1;

parameter compare_ADDRS   = 15'h7FCF;     //integer compare address
parameter setDVNCZ_ADDRS  = 15'h7CDD;     
parameter clrDVNCZ_ADDRS  = 15'h7CDC;     


wire A_GTE_B;                //  bit 8   ;1 = (A>=B)  notV_or_Z           read-only
wire A_LTE_B;                //  bit 7   ;1 = (A<=B)  ZorV                read-only
wire A_GT_B;                 //  bit 6   ;1 = (A>B)   notV_and_notZ       read-only
                             //  bit 5 not used
reg done;                    //  bit 4
reg V;                       //  bit 3
reg N;                       //  bit 2
reg C;                       //  bit 1
reg Z;                       //  bit 0

reg  frc_brk;      
reg  sstep;  
wire broke;        
wire skip_cmplt;   
wire swbreakDetect;

wire statusRWcollision;
                                                                

wire Status_wren;     
assign Status_wren = ((OPdest_q2[14:0]==ST_ADDRS[14:0]) && ~Ind_Dest_q2 && wrcycl && q2_sel);

wire [15:0] STATUS;

assign statusRWcollision = rdStatus_q1 && &OPdest_q2[14:8] && (~|OPdest_q2[7:5] || (OPdest_q2[7:3]==5'b10001));

wire signed [64:0] compareAdata;
wire signed [64:0] compareBdata;  

assign compareAdata = {(SigA_q2 && wrsrcAdata[63]), wrsrcAdata};            
assign compareBdata = {(SigB_q2 && wrsrcBdata[63]), wrsrcBdata};            


assign  STATUS = {2'b0,
                  frc_brk       , //bit 13 setting this bit = 1 forces a hardware break on the processor
                                      //once set, the processor may be single-stepped
                                      //to exit h/w break mode, clear this bit and then issue a sstep to step out of h/w break mode
                                      //always remember to clear the sstep bit after setting it     
                  sstep         , //bit 12 setting this bit = 1 while in h/w break state causes the processor to single-step
                                  //  this bit must be explicitly cleared before another sstep   this bit is readable and writeable
                  broke         , //bit 11 1 = a hardware breakpoint has been encountered and processor is now in break state read-only       
                  skip_cmplt    , //bit 10 1 = an issued single-step command has been completed read-only  
                  swbreakDetect , //bit 9  1 = a software breakpoint has been encountered  read-only

                  A_GTE_B       , //bit 8   1 = (A>=B)  notV_or_Z           read-only
                  A_LTE_B       , //bit 7   1 = (A<=B)  ZorV                read-only
                  A_GT_B        , //bit 6   1 = (A>B)   notV_and_notZ       read-only
                  1'b0,
                  done          , //bit 4
                  V             , //bit 3   1 = (A<B)
                  N             , //bit 2
                  C             , //bit 1
                  Z               //bit 0   1 = (A==B)
                  }; 
                             
assign A_GTE_B = ~V ||  Z;
assign A_LTE_B =  V ||  Z;
assign A_GT_B  = ~V && ~Z;


always@(posedge CLK) begin
    if (RESET) begin
        frc_brk <= 1'b1;     //bit 13
        sstep   <= 1'b0;     //bit 12
        done    <= 1'b1;     //bit 4                                                                                  
        V       <= 1'b0;     //bit 3                                                                                  
        N       <= 1'b0;     //bit 2                                                                                  
        C       <= 1'b0;     //bit 1                                                                                  
        Z       <= 1'b1;     //bit 0                                                                                  
                                                                                                                                    
    end                                                                                            
    else begin                                                                                     
       
//integer & logical status bits
       if (Status_wren && ~|Size_SrcA_q2) { done, V, N, C, Z} <=  wrsrcAdata[4:0];  //size of source A must be 1 byte (code 3'b000)
       else if (Status_wren && (Size_SrcA_q2==3'b001)) {frc_brk, sstep} <= wrsrcAdata[1:0]; //size of source A must be 16-bits (code 3'b001)
       else if (wrcycl && q2_sel && (OPdest_q2[14:0]==compare_ADDRS) && ~Ind_Dest_q2) begin  //compare presently only affects Z and V flags
          Z <= (compareAdata==compareBdata);
          V <= (compareAdata < compareBdata);
       end
       else if (wrcycl && q2_sel && (OPdest_q2[14:0]==setDVNCZ_ADDRS) && ~Ind_Dest_q2)
           {done, 
           V,       
           N,       
           C,       
           Z} <= {(wrsrcAdata[4] ? 1'b1 : done),
                  (wrsrcAdata[3] ? 1'b1 : V),
                  (wrsrcAdata[2] ? 1'b1 : N),
                  (wrsrcAdata[1] ? 1'b1 : C),
                  (wrsrcAdata[0] ? 1'b1 : Z)};
       else if (wrcycl && q2_sel && (OPdest_q2[14:0]==clrDVNCZ_ADDRS) && ~Ind_Dest_q2)
           {done, 
           V,       
           N,       
           C,       
           Z} <= {(wrsrcAdata[4] ? 1'b0 : done),
                  (wrsrcAdata[3] ? 1'b0 : V),
                  (wrsrcAdata[2] ? 1'b0 : N),
                  (wrsrcAdata[1] ? 1'b0 : C),
                  (wrsrcAdata[0] ? 1'b0 : Z)};
              
    end  
 end  
    
  endmodule

