module mod1 (
  input in1,
  input in2,
  inout [15:0] ino1,
  output out1
);
  string s = "hello";

  initial begin
    if (in1 ^ in2)
      ino1 <= s;
  end
endmodule
