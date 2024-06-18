// This program was cloned from: https://github.com/RVECE-A-RISC-V-Community/SWIS-V
// License: MIT License

`timescale 1ns / 1ps

module tb_data_mem;

  // Signals
  reg clk;
  reg rst_n;
  reg i_stb;
  reg i_wr_en;
  reg [31:0] i_addr;
  reg [31:0] i_write_data;
  wire o_rd_ack;
  wire [31:0] o_read_data;

  // Instantiate the module under test
  data_mem dut (
    .clk(clk),
    .rst_n(rst_n),
    .i_stb(i_stb),
    .i_wr_en(i_wr_en),
    .i_addr(i_addr),
    .i_write_data(i_write_data),
    .o_rd_ack(o_rd_ack),
    .o_read_data(o_read_data)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test case
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_data_mem);

    // Initialize inputs
    clk = 0;
    rst_n = 1;
    i_stb = 0;
    i_wr_en = 0;
    i_addr = 0;
    i_write_data = 0;

    // Reset the memory
    #10;
    rst_n = 0;

    // Perform a write operation
    #10;
    i_wr_en = 1;
    i_addr = 32; // Test address, change as needed
    i_write_data = 1234; // Test data, change as needed
    #10;
    i_wr_en = 0;
    
    #10;
    i_wr_en = 1;
    i_addr = 16; // Test address, change as needed
    i_write_data = 5678; // Test data, change as needed
    #10;
    i_wr_en = 0;
    
    // Perform a read operation
    #10;
    i_stb = 1;
    i_addr = 16; // Test address, change as needed
    #10;
    i_stb = 0;


    // Perform read and write to the same address
    #10;
    i_stb = 1;
    i_addr = 32; // Test address, change as needed
    i_wr_en = 1;
    i_write_data = 5678; // Test data, change as needed
    #10;
    i_wr_en = 0;
    i_stb = 0;
    
    #10
    i_stb = 1;
    i_addr = 32;
    
    #10
    i_stb = 0;

    // Finish simulation
    #10 $finish;
  end

endmodule

