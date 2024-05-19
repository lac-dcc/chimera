// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench_pc;
  reg [7:0] data_in;
  reg parity_in;
  reg clk;
  wire error;

  even_parity_checker dut(data_in, parity_in, error);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    data_in = 8'b00000000;
    parity_in = 1;
    #10;
    data_in = 8'b00000001;
    parity_in = 0;
    #10;
    data_in = 8'b00000011;
    parity_in = 1;
    #10;
    data_in = 8'b10000000;
    parity_in = 0;
    #10;
    data_in = 8'b11011111;
    parity_in = 1;
    #10;
    data_in = 8'b01010101;
    parity_in = 0;
    #10;
    data_in = 8'b10101010;
    parity_in = 1;
    #10;
    $finish;
  end

  always @(posedge clk) begin
    $display("Data: %b, Parity: %b, Error: %b", data_in, parity_in, error);
  end
endmodule
