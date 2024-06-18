// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg en, in0, in1;
  wire out0, out1, out2, out3;

  decoder_2to4 de_inst (
    .en(en),
    .in0(in0),
    .in1(in1),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
  );

  initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(1);
    $display("Testing 2:4 Decoder with Enable");

    en = 1;
    in0 = 0;
    in1 = 0;
    #10;
    $display("Enable: %b, Input: %b %b, Outputs: %b %b %b %b", en, in1, in0, out3, out2, out1, out0);

    en = 1;
    in0 = 0;
    in1 = 1;
    #10;
    $display("Enable: %b, Input: %b %b, Outputs: %b %b %b %b", en, in1, in0, out3, out2, out1, out0);

    en = 0;
    in0 = 1;
    in1 = 0;
    #10;
    $display("Enable: %b, Input: %b %b, Outputs: %b %b %b %b", en, in1, in0, out3, out2, out1, out0);

    en = 1;
    in0 = 1;
    in1 = 1;
    #10;
    $display("Enable: %b, Input: %b %b, Outputs: %b %b %b %b", en, in1, in0, out3, out2, out1, out0);

    $finish;
  end

endmodule
