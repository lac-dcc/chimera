module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed({$unsigned(((wire4 & wire0) ?
                         (wire0 ? wire0 : wire2) : $signed((8'ha1))))});
  assign wire6 = wire5[(3'h5):(1'h0)];
  assign wire7 = $signed(wire3[(2'h2):(1'h0)]);
  assign wire8 = $unsigned((|$signed(wire0[(2'h3):(2'h2)])));
endmodule
