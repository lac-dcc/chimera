// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module tb_imm_gen;

  reg [31:0] i_instr;
  wire [31:0] o_imm_data;

  // Instantiate the imm_gen module
  imm_gen uut (
    .i_instr(i_instr),
    .o_imm_data(o_imm_data)
  );

  // Clock generation
  reg clk;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_imm_gen);
    // Initialize inputs
    #10
    i_instr = 32'h11200113; // Set your initial instruction here
    #10
    i_instr = 32'h00C02183; // Example instruction
    #10; // Wait for some time to observe the outpu
    i_instr = 32'h00302823; // Another example instruction
    #10; 
    i_instr = 32'h00A01213; // Another example instruction
    #10; 
    i_instr = 32'h800FF537; // Another example instruction
    #10; 
    i_instr = 32'h003E8497; // Another example instruction
    #10; 
    i_instr = 32'h014002E7; // Another example instruction
    #10; 
    i_instr = 32'hFE5202E3; // Another example instruction
    #10; 
    i_instr = 32'hFE1FF36F; // Another example instruction
    #10; 

    
    // Add more test vectors as needed

    // Finish simulation
    $finish;
  end

endmodule

