module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((!$signed($signed((~&wire2)))));
  assign wire5 = $unsigned((~(~$unsigned({wire3}))));
  assign wire6 = $unsigned($unsigned(((wire1[(3'h5):(1'h0)] <= $unsigned(wire0)) ?
                     ($unsigned(wire4) > (wire5 ?
                         wire1 : wire4)) : (+wire4[(1'h1):(1'h0)]))));
  assign wire7 = $signed(wire0[(1'h0):(1'h0)]);
endmodule
