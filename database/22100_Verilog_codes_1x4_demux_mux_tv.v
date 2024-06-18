// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module testbench;

  reg in;
  reg sel0;
  reg sel1;
  wire out0, out1, out2, out3;

  demux_1x4 dut (
    .in(in),
    .sel0(sel0),
    .sel1(sel1),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
  );

  initial begin
    $dumpfile("demux.vcd");
    $dumpvars(1);
    in = 1;
    sel0 = 0;
    sel1 = 0;
    #10;
    $display("Input: %b, Sel: %b %b, Outputs: %b %b %b %b", in, sel1, sel0, out3, out2, out1, out0);

    in = 1;
    sel0 = 0;
    sel1 = 1;
    #10;
    $display("Input: %b, Sel: %b %b, Outputs: %b %b %b %b", in, sel1, sel0, out3, out2, out1, out0);

    in = 1;
    sel0 = 1;
    sel1 = 0;
    #10;
    $display("Input: %b, Sel: %b %b, Outputs: %b %b %b %b", in, sel1, sel0, out3, out2, out1, out0);

    in = 1;
    sel0 = 1;
    sel1 = 1;
    #10;
    $display("Input: %b, Sel: %b %b, Outputs: %b %b %b %b", in, sel1, sel0, out3, out2, out1, out0);
    $finish;
  end

endmodule