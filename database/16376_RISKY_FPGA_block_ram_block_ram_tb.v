// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`timescale 1 ns / 10ps

// define our testbench
 module memory_tb();
 //internal signals
 wire [7:0] r_data;
 reg clk = 0;
 reg w_en = 0;
 reg r_en = 0;
 reg [3:0] w_addr;
 reg [3:0] r_addr;
 reg [7:0] w_data;
 integer i;

localparam DURATION = 10000;
// generate clock signal = ~12 MHz
always begin
  #41.67
  clk = ~clk;
end

// instantiate the unit under test
memory #(.INIT_FILE("mem_init.txt")) uut (
  .clk(clk),
  .w_en(w_en),
  .r_en(r_en),
  .w_addr(w_addr),
  .r_addr(r_addr),
  .w_data(w_data),
  .r_data(r_data)
);

// Run test: write to location and read value back
initial begin
  for (i = 0; i < 16; i = i+1) begin
    #(2*41.67)
    r_addr = i;
    r_en = 1;
    #(2*41.67)
    r_addr = 0;
    r_en = 0;
  end

  // Test 1: read from address 0x0f 
  #(2 * 41.67)
  r_addr = 'h0f;
  r_en = 1;
  #(2*41.67)
  r_addr = 0;
  r_en = 0;

  // Test 2: Write to address 0x0f and read it back
  #(2*41.67)
  w_addr = 'h0f;
  w_data = 'hA5;
  w_en = 1;
  #(2*41.67)
  w_addr = 0;
  w_data = 0;
  w_en = 0;
  r_addr = 'h0f;
  r_en = 1;
  #(2 * 41.67) 
  r_addr = 0;
  r_en = 0;
end

// run sim
initial begin
  // create simulation output file
  $dumpfile("block_ram_tb.vcd");
  $dumpvars(0, memory_tb);

  // wait for a given amount of time for simulation to complete
  #(DURATION)

  // Notify and end simulation
  $display("Finished!");
  $finish;
end
endmodule
