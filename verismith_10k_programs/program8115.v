module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0[(4'hb):(4'ha)];
  assign wire6 = {(~|$unsigned({$signed(wire1)}))};
  assign wire7 = {$unsigned($unsigned((wire2 ? {wire6, wire0} : (~&wire4)))),
                     wire6[(1'h0):(1'h0)]};
  assign wire8 = ((~&wire0) >> wire1[(4'h8):(1'h0)]);
endmodule
