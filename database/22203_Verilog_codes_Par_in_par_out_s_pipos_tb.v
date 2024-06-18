// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg clk;
  reg reset;
  reg [7:0] parallel_in;
  reg enable;
  wire [7:0] parallel_out;

  piporegister dut (
    .clk(clk),
    .reset(reset),
    .parallel_in(parallel_in),
    .enable(enable),
    .parallel_out(parallel_out)
  );

  initial begin
    clk = 0;
    reset = 1;
    parallel_in = 8'b00000000;
    enable = 0;

    #10 reset = 0;

    // Shift 1 to the left
    parallel_in = 8'b00000001;
    enable = 1;
    #10;
    enable = 0;
    #10;

    // Shift 1010 to the left
    parallel_in = 8'b00001010;
    enable = 1;
    #10;
    enable = 0;
    #10;

    // Shift 11111111 to the left
    parallel_in = 8'b11111111;
    enable = 1;
    #10;
    enable = 0;
    #10;

    // Shift 1100 to the right
    parallel_in = 8'b00001100;
    enable = 1;
    #10;
    enable = 0;
    #10;

    // Shift 10101010 to the right
    parallel_in = 8'b10101010;
    enable = 1;
    #10;
    enable = 0;
    #10;

    $finish;
  end

  always begin
    #5 clk = ~clk;
  end
  always @(clk or parallel_in or enable or parallel_out) begin
    $display("Time=%0t: clk=%b, parallel_in=%b, enable=%b, parallel_out=%b", $time, clk, parallel_in, enable, parallel_out);
  end


endmodule