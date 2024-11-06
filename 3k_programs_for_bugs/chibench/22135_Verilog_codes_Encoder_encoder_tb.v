// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg in0, in1, in2, in3;
  wire out0, out1;

  encoder_4to2 dut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out0(out0),
    .out1(out1)
  );

  initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(1);
    in0 = 0;
    in1 = 0;
    in2 = 0;
    in3 = 0;
    #10;
    $display("Inputs: %b %b %b %b, Outputs: %b %b", in3, in2, in1, in0, out1, out0);

    in0 = 0;
    in1 = 0;
    in2 = 1;
    in3 = 0;
    #10;
    $display("Inputs: %b %b %b %b, Outputs: %b %b", in3, in2, in1, in0, out1, out0);

    in0 = 0;
    in1 = 1;
    in2 = 0;
    in3 = 0;
    #10;
    $display("Inputs: %b %b %b %b, Outputs: %b %b", in3, in2, in1, in0, out1, out0);

    in0 = 0;
    in1 = 1;
    in2 = 1;
    in3 = 0;
    #10;
    $display("Inputs: %b %b %b %b, Outputs: %b %b", in3, in2, in1, in0, out1, out0);

    $finish;
  end

endmodule