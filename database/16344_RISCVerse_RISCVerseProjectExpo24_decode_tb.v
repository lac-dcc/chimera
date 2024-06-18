// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
`timescale 1ns / 1ps

module decode_tb;

// Parameters
parameter data_width = 32;

// Inputs
reg clk = 0;
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
wire [31:0] imm_data_decodel_out;
wire [31:0] operand_a_out;
wire [31:0] operand_b_out;

// Instantiate the module under test
decode #(data_width) uut (
    .clk(clk),
    .rst(rst),
    .instr_reg_fetch(instr_reg_fetch),
    .pc_fetch(pc_fetch),
    .npc_fetch(npc_fetch),
    .cntrl_sig_decode(cntrl_sig_decode_out),
    .alu_control_decode(alu_control_decode_out),
    .imm_data_decodel(imm_data_decodel_out),
    .operand_a(operand_a_out),
    .operand_b(operand_b_out),
    .instr_reg_decode(instr_reg_decode),
    .pc_decode(pc_decode),
    .npc_decode(npc_decode),
    .cntrl_sig_decode(cntrl_sig_decode),
    .alu_control_decode(alu_control_decode),
    .imm_data_decodel(imm_data_decodel),
    .operand_a(operand_a),
    .operand_b(operand_b)
);

// Clock generation
always #5 clk = ~clk;

// Reset generation
initial begin
    rst = 1;
    #10;
    rst = 0;
end

// Stimulus
initial begin
    // Provide some stimulus here
    // Example: Set values for instr_reg_fetch, pc_fetch, npc_fetch, etc.
    instr_reg_fetch = 32'h12345678;
    pc_fetch = 32'hABCDEF01;
    npc_fetch = 32'hABCDEF05;
    cntrl_sig_decode = 32'hABCDEFAB;
    alu_control_decode = 4'b1100;
    imm_data_decodel = 32'h1234ABCD;
    operand_a = 32'h11111111;
    operand_b = 32'h22222222;

    // Wait for 100 clock cycles
    #100;

    // Finish simulation
    $finish;
end

endmodule

