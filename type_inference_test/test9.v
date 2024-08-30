module mod(input reg b, input clk);
  wire a;

  always @(posedge clk) begin
    a <= b;
  end
endmodule
