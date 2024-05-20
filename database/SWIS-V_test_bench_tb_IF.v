// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module tb_IF;

  // Signals
  reg clk;
  reg rst_n;
  wire [31:0] o_pc;
  wire [31:0] o_instr;
  reg [31:0] i_inst;
  reg i_imem_ack;
  wire o_imem_stb;
  wire [31:0] o_iaddr;
  reg [31:0] i_imm;
  reg [31:0] i_result;
  reg i_boj;
  reg i_jalr;

  // Instantiate the IF module
  IF dut (
    .clk(clk),
    .rst_n(rst_n),
    .o_pc(o_pc),
    .o_instr(o_instr),
    .i_inst(i_inst),
    .i_imem_ack(i_imem_ack),
    .o_imem_stb(o_imem_stb),
    .o_iaddr(o_iaddr),
    .i_imm(i_imm),
    .i_result(i_result),
    .i_boj(i_boj),
    .i_jalr(i_jalr)
  );

  // Test case
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_IF);
    // Initializing inputs
    clk  = 0;
    rst_n = 0;
    i_inst = 32'd00106293;
    i_imem_ack = 1;
    i_imm = 32'hc;
    i_result = 32'hf;
    i_boj = 0;
    i_jalr = 0;

    // Reset sequence
    #10;
    rst_n = 1;
    // Test sequence
    // Stimulus for PC change
    #10;
    i_boj = 1;
    #20;
    // De-asserting inputs
    i_boj = 0;
    i_jalr = 1;
    #20;
    i_jalr = 0;
    #100;
    // More test cases can be added similarly to cover various scenarios

    // Finishing simulation
    $finish;
  end

  // Clock generation process
  always #5 clk = ~clk;

endmodule

