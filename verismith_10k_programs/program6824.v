module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($signed((wire3 ^~ (~^(8'hbd)))) ?
                         wire2 : wire0[(4'hc):(4'h8)]) ?
                     $unsigned({$signed((wire0 * wire0))}) : wire0);
  assign wire5 = (-$signed(wire4[(3'h5):(2'h3)]));
  assign wire6 = (8'hbb);
  assign wire7 = (($unsigned($signed((~|wire6))) ?
                         wire5[(4'he):(4'hb)] : wire4[(4'hc):(3'h6)]) ?
                     (|$signed(((wire1 || wire6) | $unsigned(wire0)))) : wire0);
endmodule
