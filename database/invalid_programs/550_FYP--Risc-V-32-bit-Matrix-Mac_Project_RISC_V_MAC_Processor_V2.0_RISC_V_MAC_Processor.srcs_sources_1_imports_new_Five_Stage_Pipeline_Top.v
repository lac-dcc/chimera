// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

// Copyright 2023 MERL-DSU

//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at

//        http://www.apache.org/licenses/LICENSE-2.0

//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

`include "Fetch_Cycle.v"
`include "Decode_Cycle.v"
`include "Execute_Cycle.v"
`include "Memory_Cycle.v"
`include "Writeback_Cycle.v"    
`include "Slow_Clock.v"

`include "Hazard_unit.v"



module Pipeline_top(button,clk_100mhz, rst, clk_light_display, anode, SSD);

    // Declaration of I/O
    input button;
    input clk_100mhz, rst;
    output  /*[31:0]*/ /*reg*/ clk_light_display;
    output [7:0] anode;
    output [7:0] SSD;

//--------------------------------------------------------    
//    wire temp;
    wire clk_debounce;   
    
//   ------------------------------------------------------------

    // Declaration of Interim Wires
    wire PCSrcE, RegWriteW, RegWriteE, ALUSrcE, MemWriteE, ResultSrcE, BranchE, RegWriteM, MemWriteM, ResultSrcM, ResultSrcW;
    wire [5:0]  ALUControlE;
    wire [4:0]  RD_E, RD_M, RDW;
    wire [31:0] PCTargetE, InstrD, PCD, PCPlus4D, ResultW, RD1_E, RD2_E, Imm_Ext_E, PCE, PCPlus4E, PCPlus4M, WriteDataM, ALU_ResultM;
    wire [31:0] PCPlus4W, ALU_ResultW, ReadDataW;
    wire [4:0]  RS1_E, RS2_E, RS1_D, RS2_D;
    wire [3:0]  MACControlE ;
    wire [3:0]  MACControlM ;
    wire [1:0]  MACDME ;
    wire [1:0]  MACDMM ;
    wire [1:0]  MACDMW ;
    wire [1:0]  ForwardBE, ForwardAE;
    wire StallF, StallD, FlushE, FlushD;
//    wire MAC_OP_E;
//    wire MAC_OP_D;
//    wire MAC_OP_M;
//    wire MAC_OP_W;
    wire clk, clk_1msec;

 debouncer_clock debouncer_clock (
        .i_Clk(clk_100mhz),
        .i_Switch(button),
        .o_Switch(clk)
 );
    
    /*Clock_slowed clk_slow_inst(
        .clk_100mhz(clk_100mhz), 
        .rst(rst),
        //.clk_1sec(clk),
        .clk_1msec(clk_1msec)
    );*/
    
    Multplex_Reg_Disp displaying_ALU(
        .clk(clk_100mhz), 
        .rst(rst),
//        .MAC(MAC_OP_W),
        .inp_reg(ALU_ResultM),
        .Anode(anode),
        .SSD_out(SSD)
    );

    assign   clk_light_display   =  (clk == 1 | rst == 0)? 1'b1:1'b0;
        
//     Module Initiation
//     Fetch Stage
//    assign clk = clk_100mhz;

    fetch_cycle Fetch (
                        .clk(clk), 
                        .rst(rst),
                        .CLR(FlushD), 
                        .EN(~StallF),
                        .PCSrcE(PCSrcE), 
                        .PCTargetE(PCTargetE), 

                        .InstrD(InstrD), 
                        .PCD(PCD), 
                        .PCPlus4D(PCPlus4D),
//                        .temp(temp)
                    );

    // Decode Stage
    decode_cycle Decode (
                        .clk(clk), 
                        .rst(rst), 
                        .EN(~StallD),
                        .CLR(FlushE),
                        
                        .InstrD(InstrD), 
                        .PCD(PCD), 
                        .PCPlus4D(PCPlus4D), 
                        .RegWriteW(RegWriteW), 
                        .RDW(RDW), 
                        .ResultW(ResultW), 
                        
                        
                        .RegWriteE(RegWriteE), 
                        .ALUSrcE(ALUSrcE), 
                        .MemWriteE(MemWriteE), 
                        .ResultSrcE(ResultSrcE),
                        .BranchE(BranchE),  
                        .ALUControlE(ALUControlE), 
                        .RD1_E(RD1_E), 
                        .RD2_E(RD2_E),
                        .Imm_Ext_E(Imm_Ext_E), 
                        .RD_E(RD_E), 
                        .PCE(PCE), 
                        .PCPlus4E(PCPlus4E),
                        .RS1_D(RS1_D),
                        .RS2_D(RS2_D),
                        .RS1_E(RS1_E),
                        .RS2_E(RS2_E),
                        
                        .MACControl_E(MACControlE),
                        .MACDM_E(MACDME)
//                        .MAC_OP_D(MAC_OP_D)
                    );

    // Execute Stage
    execute_cycle Execute (
                        .clk(clk), 
                        .rst(rst), 
                        .CLR(/*FlushE*/1'b0),
                        .RegWriteE(RegWriteE), 
                        .ALUSrcE(ALUSrcE), 
                        .MemWriteE(MemWriteE), 
                        .ResultSrcE(ResultSrcE), 
                        .BranchE(BranchE), 
                        .ALUControlE(ALUControlE), 
                        .RD1_E(RD1_E), 
                        .RD2_E(RD2_E), 
                        .Imm_Ext_E(Imm_Ext_E), 
                        .RD_E(RD_E), 
                        .PCE(PCE), 
                        .PCPlus4E(PCPlus4E), 
                        .PCSrcE(PCSrcE), 
                        .PCTargetE(PCTargetE), 
                        .RegWriteM(RegWriteM), 
                        .MemWriteM(MemWriteM), 
                        .ResultSrcM(ResultSrcM),
                        
//                        .MAC_OP_D(MAC_OP_D),
                        
                        .MACControl_E(MACControlE),
                        .MACDM_E(MACDME),

                        //outputs 
                        .RD_M(RD_M), 
                        .PCPlus4M(PCPlus4M), 
                        .WriteDataM(WriteDataM), 
                        .ALU_ResultM(ALU_ResultM),
                        .ResultW(ResultW),
                        .ForwardA_E(ForwardAE),
                        .ForwardB_E(ForwardBE),
                        
                        .MACControl_M(MACControlM),
                        .MACDM_M(MACDMM)             
//                        .MAC_OP_E(MAC_OP_E)
                                                
                    );

    // Memory Stage
    memory_cycle Memory (
                        .clk(clk), 
                        .rst(rst), 
                        .RegWriteM(RegWriteM), 
                        .MemWriteM(MemWriteM), 
                        .ResultSrcM(ResultSrcM), 
                        .RD_M(RD_M), 
                        .PCPlus4M(PCPlus4M), 
                        .WriteDataM(WriteDataM), 
                        .ALU_ResultM(ALU_ResultM), 
                        
//                        .MAC_OP_E(MAC_OP_E),
                        
                        .MACControl_M(MACControlM),
                           
                        .MACDM_M(MACDMM),   
                        
                        //outputs
                        .RegWriteW(RegWriteW), 
                        .ResultSrcW(ResultSrcW), 
                        .RD_W(RDW), 
                        .PCPlus4W(PCPlus4W), 
                        .ALU_ResultW(ALU_ResultW), 
                        .ReadDataW(ReadDataW),
                        
                        .MACDM_W(MACDMW)
//                        .MAC_OP_W(MAC_OP_W)
                    );

    // Write Back Stage
    writeback_cycle WriteBack (
                        .clk(clk), 
                        .rst(rst), 
                        .ResultSrcW(ResultSrcW), 
                        .PCPlus4W(PCPlus4W), 
                        .ALU_ResultW(ALU_ResultW), 
                        .ReadDataW(ReadDataW), 
                        .ResultW(ResultW)
                    );

    // Hazard Unit
    hazard_unit hazard_unit(
//                        .rst(rst), 
//                        .clk(clk),
                        .RegWriteE(RegWriteE),
                        .RegWriteM(RegWriteM), 
                        .RegWriteW(RegWriteW), 
                        .RdE(RD_E),
                        .RD_M(RD_M), 
                        .RD_W(RDW), 
                        .RS1_D(RS1_D),
                        .RS2_D(RS2_D),
                        .Rs1_E(RS1_E), 
                        .Rs2_E(RS2_E),
                        .ResultSrcE(ResultSrcE),
                        .ResultSrcM(ResultSrcM),
                        .PCSrcE(PCSrcE),
                        .BranchE(BranchE),
                         
                        .ForwardAE(ForwardAE), 
                        .ForwardBE(ForwardBE),
                        .StallF(StallF),
                        .StallD(StallD),
                        .FlushD(FlushD),
                        .FlushE(FlushE)

                        );
              
endmodule










