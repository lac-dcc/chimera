module mod7 ();
  wire [0:0] l1;
  wire [2:0] l2;
  reg  [1:0] r1;
  reg  [1:0] r2;

  assign {l1,l2} = {r1,r2};
endmodule
