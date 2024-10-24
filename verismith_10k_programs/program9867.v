module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire8, wire7, wire4, reg6, reg5, (1'h0)};
  assign wire4 = (8'hac);
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= $signed($signed(($unsigned((+(8'hbe))) ^~ (wire0[(2'h3):(1'h0)] | $unsigned(wire2)))));
    end
  assign wire7 = wire0[(4'hc):(1'h0)];
  assign wire8 = ((^~{{(|wire2), {reg6}},
                         ({wire7} ? wire2[(2'h2):(1'h0)] : $signed((8'hab)))}) ?
                     reg5[(4'hc):(3'h7)] : reg5[(4'ha):(1'h0)]);
endmodule
