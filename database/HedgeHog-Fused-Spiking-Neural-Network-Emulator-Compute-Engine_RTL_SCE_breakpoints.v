// SCE_breakpoints.v
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

module SCE_breakpoints (
    CLK,
    RESET,
    Instruction_q0,
    Instruction_q0_del,
    break_q0,
    break_q1,
    break_q2,
    ind_mon_read_q0,
    ind_mon_write_q2,
    mon_write_addrs_q2,
    mon_read_addrs,
    mon_writeData_q1,
    rden_q0,
    wren_q0,
    rdSize_q0,
    wrSize_q0,
    frc_brk,
    broke,
    sstep,
    skip_cmplt,
    swbreakDetect,
    wrdata_q0,          
    rdaddrs_q0,
    wraddrs_q0       
    );

input CLK;
input RESET;
input  [63:0] Instruction_q0;
output [63:0] Instruction_q0_del;

output break_q0;
output break_q1;
output break_q2;
output ind_mon_read_q0;
output ind_mon_write_q2;
output [31:0] mon_write_addrs_q2;
output [31:0] mon_read_addrs;
output [63:0] mon_writeData_q1; 
input rden_q0;
input wren_q0; 
input [2:0] rdSize_q0;   
input [2:0] wrSize_q0;   
input frc_brk;
input sstep;
output broke;
output skip_cmplt;
output swbreakDetect;
input [63:0] wrdata_q0;  //might be able to get away with just 32 bits
input [31:0] wraddrs_q0;        
input [31:0] rdaddrs_q0;        

parameter MON_ADDRS = 32'h00007FEB;
parameter SWBREAK   = 64'h127FF30000000000;

reg break_q0;
reg break_q1;
reg break_q2;

reg [1:0] break_state;

reg broke;

reg skip;

reg skip_cmplt;

reg ind_mon_wr_q1;
reg ind_mon_wr_q2;
reg [63:0] mon_writeData_q1;
reg [31:0] mon_write_addrs_q1;
reg [31:0] mon_write_addrs_q2;

reg  swbreakDetect_q1;
reg  swbreakDetect_q2;

wire swbreakDetect;

wire [2:0] mon_write_size;
wire [2:0] mon_read_size;

wire mon_SigA;
wire [31:0] mon_read_addrs;
wire [31:0] mon_write_addrs;

wire any_break_det;

wire [63:0] Instruction_q0_del;
wire [63:0] monitor_instruction;

wire ind_mon_read;
wire ind_mon_write;
wire ind_mon_read_q0;
wire ind_mon_write_q2;


wire MREQ_q0; 

wire weightWren;
wire rateWren;
wire thresholdWren;
assign weightWren = wren_q0  && (wraddrs_q0[31:18]==14'b0000_0000_0000_01); 
assign rateWren = wren_q0  && (wraddrs_q0[31:18]==14'b0000_0000_0000_10);
assign thresholdWren = wren_q0  && (wraddrs_q0[31:15]==17'b0000_0000_0000_0001_1);
 

assign MREQ_q0 = rden_q0 || wren_q0;
assign mon_SigA = 0;

assign swbreakDetect = (Instruction_q0_del==SWBREAK) || swbreakDetect_q1 || swbreakDetect_q2;

always @(posedge CLK) begin
    swbreakDetect_q1 <= (Instruction_q0_del==SWBREAK);
    swbreakDetect_q2 <= swbreakDetect_q1;
end    

assign ind_mon_read  = rden_q0 && |rdaddrs_q0[31:15];                                                                                       
assign ind_mon_write = wren_q0 && |wraddrs_q0[31:15];
assign ind_mon_read_q0  = ind_mon_read  && break_q0;
assign ind_mon_write_q2 = ind_mon_wr_q2 && break_q2;

assign mon_write_size = wren_q0 ? wrSize_q0 : rden_q0 ? rdSize_q0 : 3'b011;
assign mon_read_size = rden_q0 ? rdSize_q0 : wren_q0 ? wrSize_q0 : 3'b011;
assign mon_read_addrs = rden_q0 ? rdaddrs_q0[31:0] : wren_q0 ? MON_ADDRS : 32'b0;  
assign mon_write_addrs = wren_q0 ? wraddrs_q0[31:0] : rden_q0 ? MON_ADDRS : 32'b0;  
                                                                                              
assign any_break_det = frc_brk || broke;
                       
assign monitor_instruction = {5'b0000_0, mon_write_size, ind_mon_write, mon_write_addrs[14:0], mon_SigA, mon_read_size, ind_mon_read, mon_read_addrs[14:0], 5'b00110, 15'b0};    
assign Instruction_q0_del = break_q0 ?  monitor_instruction : Instruction_q0;  


always @(posedge CLK) begin
    ind_mon_wr_q1 <= ind_mon_write;
    ind_mon_wr_q2 <= ind_mon_wr_q1;
    mon_write_addrs_q1 <= mon_write_addrs;
    mon_write_addrs_q2 <= mon_write_addrs_q1;
    if (~(weightWren || rateWren || thresholdWren)) mon_writeData_q1 <= wrdata_q0;
    else case(wrSize_q0)
        3'b010 : mon_writeData_q1 <= {32'b0, ((wrdata_q0[31:0]>>15) - 32'h00004000) | {16'b0, wrdata_q0[31], 15'b0}};  //binary32 to 1|7|8
        3'b011 : mon_writeData_q1 <= ((wrdata_q0[63:0]>>44) - 64'h000000000003C000)  | {48'b0, wrdata_q0[31], 15'b0};  //binary64 to 1|7|8
       default : mon_writeData_q1 <= wrdata_q0;
    endcase    
end    
                                                                                                                  
always @(posedge CLK) begin
    if (RESET) begin                                                                                               
        break_q0 <= 1'b0;                                                                                          
        break_q1 <= 1'b0;                                                                                          
        break_q2 <= 1'b0;                                                                                          
    end
    else begin                                                                                                     
        break_q0 <= (any_break_det && ~skip) || MREQ_q0; 
        break_q1 <= break_q0;
        break_q2 <= break_q1;
    end                 
end   

always @(posedge CLK) begin
    if (RESET) begin
        broke <= 1'b0;
        break_state <=2'b00;
        skip <= 1'b0;
        skip_cmplt <= 1'b0;
    end
    else begin
        case(break_state) 
            2'b00 : begin
                        skip_cmplt <= 1'b0;
                        if (frc_brk) begin 
                            broke <= 1'b1;
                            break_state <= 2'b01;
                        end
                    end    
            2'b01 : begin
                        skip_cmplt <= 1'b0;
                        if (sstep) begin
                            skip <= 1'b1;
                            break_state <= 2'b10;
                        end
                    end    
            2'b10 : begin
                        skip <= 1'b0;
                        skip_cmplt <= 1'b1;
                        if (~sstep) begin
                            if (~frc_brk) begin
                                broke <= 1'b0;
                                break_state <= 2'b00;
                            end
                            else break_state <= 2'b01; 
                        end    
                    end
          default : begin
                        broke <= 1'b0;
                        break_state <=2'b00;
                        skip <= 1'b0;
                        skip_cmplt <= 1'b0;
                    end    
                                    
        endcase
    end
end   


endmodule
