module issue_000(a, y);
  // http://forums.xilinx.com/t5/Synthesis/XST-14-7-sign-handling-bug-in-N-Verilog-operator/td-p/401399
  input signed [1:0] a;
  wire [4:0] y0;
  wire [4:0] y1;
  output [9:0] y;
  assign y = {y0,y1};
  // concatenate and replicate operators do not preserve signedness.
  // the MSB of of y0 and y1 must be constant zero.
  assign y0 = {a,a};
  assign y1 = {2{a}};
endmodule
