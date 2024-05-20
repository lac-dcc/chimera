// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2700185 Thu Oct 24 18:46:05 MDT 2019
//Date        : Fri Mar 15 15:25:55 2024
//Host        : TEN14B31F0D48DB running 64-bit major release  (build 9200)
//Command     : generate_target final_design.bd
//Design      : final_design
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "final_design,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=final_design,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=12,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "final_design.hwdef" *) 
module final_design
   (A0_0,
    A1_0,
    A2_0,
    A3_0,
    B0_0,
    B1_0,
    B2_0,
    B3_0,
    Register_Output_0,
    clk_0);
  input A0_0;
  input A1_0;
  input A2_0;
  input A3_0;
  input B0_0;
  input B1_0;
  input B2_0;
  input B3_0;
  output [7:0]Register_Output_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, CLK_DOMAIN final_design_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk_0;

  wire A0_0_1;
  wire A1_0_1;
  wire A2_0_1;
  wire A3_0_1;
  wire [7:0]ALU_0_regO;
  wire [7:0]Accumulator_0_acc;
  wire B0_0_1;
  wire B1_0_1;
  wire B2_0_1;
  wire B3_0_1;
  wire [3:0]Instruction_Decoder_0_ALU_Sel;
  wire Instruction_Decoder_0_MUX_0;
  wire Instruction_Decoder_0_MUX_1;
  wire Instruction_Decoder_0_acc_reset;
  wire Instruction_Decoder_0_loadA;
  wire Instruction_Decoder_0_loadB;
  wire Instruction_Decoder_0_loadO;
  wire Instruction_Decoder_0_load_shifter;
  wire Instruction_Decoder_0_shift_direction;
  wire Instruction_Decoder_0_shifter_en;
  wire Instruction_Decoder_0_update_PC;
  wire [3:0]Instruction_Register_0_instructionOut;
  wire [7:0]MUX_0_MUX_Reg;
  wire MUX_1_ALU_update_out;
  wire [7:0]MUX_1_MUX_Reg;
  wire [4:0]Program_counter_0_currentPC;
  wire [3:0]ROM_0_data;
  wire ROM_0_update;
  wire [7:0]Register_A_0_regA;
  wire [7:0]Register_B_0_regB;
  wire [7:0]Register_O_0_Register_Output;
  wire [7:0]Shifter_0_data_out;
  wire Shifter_0_shifter_flag;
  wire clk_0_1;

  assign A0_0_1 = A0_0;
  assign A1_0_1 = A1_0;
  assign A2_0_1 = A2_0;
  assign A3_0_1 = A3_0;
  assign B0_0_1 = B0_0;
  assign B1_0_1 = B1_0;
  assign B2_0_1 = B2_0;
  assign B3_0_1 = B3_0;
  assign Register_Output_0[7:0] = Register_O_0_Register_Output;
  assign clk_0_1 = clk_0;
  final_design_ALU_0_0 ALU_0
       (.ALU_Sel(Instruction_Decoder_0_ALU_Sel),
        .ALU_update(MUX_1_ALU_update_out),
        .regA(Accumulator_0_acc),
        .regB(MUX_1_MUX_Reg),
        .regO(ALU_0_regO));
  final_design_Accumulator_0_0 Accumulator_0
       (.acc(Accumulator_0_acc),
        .alu_result(ALU_0_regO),
        .reset(Instruction_Decoder_0_acc_reset));
  final_design_Instruction_Decoder_0_0 Instruction_Decoder_0
       (.ALU_Sel(Instruction_Decoder_0_ALU_Sel),
        .ALU_update(MUX_1_ALU_update_out),
        .MUX_0(Instruction_Decoder_0_MUX_0),
        .MUX_1(Instruction_Decoder_0_MUX_1),
        .acc_reset(Instruction_Decoder_0_acc_reset),
        .clk(clk_0_1),
        .instruction(Instruction_Register_0_instructionOut),
        .loadA(Instruction_Decoder_0_loadA),
        .loadB(Instruction_Decoder_0_loadB),
        .loadO(Instruction_Decoder_0_loadO),
        .load_shifter(Instruction_Decoder_0_load_shifter),
        .shift_direction(Instruction_Decoder_0_shift_direction),
        .shifter_en(Instruction_Decoder_0_shifter_en),
        .shifter_flag(Shifter_0_shifter_flag),
        .update_PC(Instruction_Decoder_0_update_PC));
  final_design_Instruction_Register_0_0 Instruction_Register_0
       (.instructionIn(ROM_0_data),
        .instructionOut(Instruction_Register_0_instructionOut),
        .update(ROM_0_update));
  final_design_MUX_0_0 MUX_0
       (.A(Register_A_0_regA),
        .B(Register_B_0_regB),
        .MUX_Reg(MUX_0_MUX_Reg),
        .MUX_Sel(Instruction_Decoder_0_MUX_0));
  final_design_MUX_1_0 MUX_1
       (.A(MUX_0_MUX_Reg),
        .B(Shifter_0_data_out),
        .MUX_Reg(MUX_1_MUX_Reg),
        .MUX_Sel(Instruction_Decoder_0_MUX_1));
  final_design_Program_counter_0_0 Program_counter_0
       (.currentPC(Program_counter_0_currentPC),
        .update_PC(Instruction_Decoder_0_update_PC));
  final_design_ROM_0_0 ROM_0
       (.address(Program_counter_0_currentPC),
        .data(ROM_0_data),
        .update(ROM_0_update));
  final_design_Register_A_0_0 Register_A_0
       (.A0(A0_0_1),
        .A1(A1_0_1),
        .A2(A2_0_1),
        .A3(A3_0_1),
        .loadA(Instruction_Decoder_0_loadA),
        .regA(Register_A_0_regA));
  final_design_Register_B_0_0 Register_B_0
       (.B0(B0_0_1),
        .B1(B1_0_1),
        .B2(B2_0_1),
        .B3(B3_0_1),
        .loadB(Instruction_Decoder_0_loadB),
        .regB(Register_B_0_regB));
  final_design_Register_O_0_0 Register_O_0
       (.Register_Output(Register_O_0_Register_Output),
        .loadO(Instruction_Decoder_0_loadO),
        .output_data(Accumulator_0_acc));
  final_design_Shifter_0_0 Shifter_0
       (.data_in(MUX_0_MUX_Reg),
        .data_out(Shifter_0_data_out),
        .load_shifter(Instruction_Decoder_0_load_shifter),
        .shift_direction(Instruction_Decoder_0_shift_direction),
        .shifter_en(Instruction_Decoder_0_shifter_en),
        .shifter_flag(Shifter_0_shifter_flag));
endmodule
