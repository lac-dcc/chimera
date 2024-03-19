module clock(
  input wire enable,
  output reg clk = 0,
  output wire clk_inv
);

  always begin
    #5 clk = ~clk & enable;
  end

  assign clk_inv = ~clk;

endmodule
