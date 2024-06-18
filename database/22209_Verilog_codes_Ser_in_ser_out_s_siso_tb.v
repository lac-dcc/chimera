// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module siso_shift_register_tb;

  reg clk;
  reg reset;
  reg serial_in;
  wire serial_out;

  siso_shift_register dut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  initial begin
    clk = 0;
    reset = 1;
    serial_in = 0;

    #10 reset = 0;

    // Testcase 1: Shift in 1010
    serial_in = 1;
    #10;
    serial_in = 0;
    #10;
    serial_in = 1;
    #10;
    serial_in = 0;
    #10;

    // Testcase 2: Shift in 0011
    serial_in = 0;
    #10;
    serial_in = 0;
    #10;
    serial_in = 1;
    #10;
    serial_in = 1;
    #10;

    $finish;
  end

  always begin
    #5 clk = ~clk;
  end

  initial begin
    $dumpfile("siso_shift_register_tb.vcd");
    $dumpvars(0, siso_shift_register_tb);
    $monitor("Time=%0t: clk=%b, reset=%b, serial_in=%b, serial_out=%b",
      $time, clk, reset, serial_in, serial_out);
  end

endmodule
