// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns/1ps
module tb_reg_file;

  reg clk;
  reg rst_n;
  reg i_re;
  reg i_wr;
  reg [4:0] i_rs1;
  reg [4:0] i_rs2;
  reg [4:0] i_rd;
  reg [31:0] i_write_data;
  wire [31:0] o_read_data1;
  wire [31:0] o_read_data2;

  // Instantiate the reg_file module
  reg_file regfile_inst(
    .clk(clk),
    .rst_n(rst_n),
    .i_re(i_re),
    .i_wr(i_wr),
    .i_rs1(i_rs1),
    .i_rs2(i_rs2),
    .i_rd(i_rd),
    .i_write_data(i_write_data),
    .o_read_data1(o_read_data1),
    .o_read_data2(o_read_data2)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_reg_file);
  end

  // Reset generation
  initial begin
    rst_n = 0;
    #10;
    rst_n = 1;
    
    // Example: Write to register 5
    i_re = 0;
    i_wr = 1;
    i_rs1 = 0;
    i_rs2 = 0;
    i_rd = 5;
    i_write_data = 32'hABCDEFFF;
    #10; // Wait for a few clock cycles
    // Example: Write to register 7
    i_re = 0;
    i_wr = 1;
    i_rs1 = 0;
    i_rs2 = 0;
    i_rd = 7;
    i_write_data = 32'hABCDADFF;
    #10; // Wait for a few clock cycles
    // Read from register 5 (rs1) 7 (rs2)
    i_re = 1;
    i_wr = 0;
    i_rs1 = 5;
    i_rs2 = 7;
    i_rd = 0;
    i_write_data = 0;
    #10; // Observe read data from rs1
    // Simultaneous read and write from register 3
    i_re = 1;
    i_wr = 1;
    i_rs1 = 5;
    i_rs2 = 0;
    i_rd = 5;
    i_write_data = 32'h12345678;
    #30; // Wait for a few clock cycles
    
    $finish; // Stop simulation
  end

endmodule

