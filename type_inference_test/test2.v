module mod2 (
  in1,
  in2,
  ino1,
  out1
);
  input in1;
  input in2;
  inout [15:0] ino1;
  output out1;

  always @(in1) begin
    if (in2)
      ino1 = 16'b0; 
  end
  
endmodule
