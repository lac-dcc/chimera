// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps

module tb_instr_mem;

  // Parameters
  parameter INSTR_MEM_SIZE = 1024; // Example size of the instruction memory

  // Signals
  reg clk;
  reg rst_n;
  reg [31:0] i_addr;
  reg i_stb;
  wire o_ack;
  wire [31:0] o_data;

  // Instantiate the module under test
  instr_mem dut (
    .clk(clk),
    .rst_n(rst_n),
    .i_addr(i_addr),
    .i_stb(i_stb),
    .o_ack(o_ack),
    .o_data(o_data)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test case
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_instr_mem);

    // Initialize inputs
    clk = 0;
    rst_n = 0;
    i_addr = 0;
    i_stb = 0;

    // Reset
    #10 rst_n = 1;

    // Request for instruction at address 0x04 (4 bytes aligned)
    i_addr = 0;
    i_stb = 1;

    #20
    i_addr = 4;
    
    #20
    i_addr = 8;
    
    #20
    i_addr = 9;

    // Finish simulation
    #10 $finish;
  end

endmodule
