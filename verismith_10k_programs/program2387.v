module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = $unsigned((!$unsigned($signed((wire4 >>> (8'hbf))))));
  always
    @(posedge clk) begin
      reg6 <= {wire2[(4'h9):(2'h3)], wire4};
    end
  assign wire7 = reg6[(2'h3):(1'h0)];
  assign wire8 = (!(8'hbe));
endmodule
