// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License


`timescale 1ns / 1ps
 
module decode_tb;

// Parameters
parameter data_width = 32;

// Inputs
reg clk = 1;
reg rst = 0;
reg [data_width-1:0] instr_reg_fetch;
reg [data_width-1:0] pc_fetch;
reg [data_width-1:0] npc_fetch;
reg [31:0] cntrl_sig_decode;
reg [3:0] alu_control_decode;
reg [31:0] imm_data_decodel;
reg [31:0] operand_a;
reg [31:0] operand_b;

// Outputs
wire [data_width-1:0] instr_reg_decode;
wire [data_width-1:0] pc_decode;
wire [data_width-1:0] npc_decode;
wire [31:0] cntrl_sig_decode_out;
wire [3:0] alu_control_decode_out;
wire [31:0] imm_data_decode_out;
wire [31:0] operand_A;
wire [31:0] operand_B;

// Instantiate the module under test
decode1#(data_width) d1(clk,rst,instr_reg_fetch,pc_fetch,npc_fetch,cntrl_sig_decode,alu_control_decode,imm_data_decodel,operand_a,operand_b,instr_reg_decode,pc_decode,npc_decode,cntrl_sig_decode_out,alu_control_decode_out,imm_data_decode_out,operand_A,operand_B);
// Clock generation
always #5 clk = ~clk;

// Reset generation
initial begin
    rst = 1;
    #10
    rst = 0;
end

always @(posedge clk)
begin
    #10
    instr_reg_fetch =  $random;
    pc_fetch =  $random;
    npc_fetch =  $random;
    cntrl_sig_decode =  $random;
    alu_control_decode =  $random;
    imm_data_decodel =  $random;
    operand_a =  $random;
    operand_b =  $random;
end

initial
begin
    #100
    $finish;
   end

endmodule

