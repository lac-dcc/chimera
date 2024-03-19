module reset_gen(
  input clk,
  output reset
);

  reg [3:0] t = 0;

  always @(posedge clk)
    t <= {t[2:0],1'b1};

  assign reset = !t[3];

endmodule
