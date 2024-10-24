module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned($signed($unsigned($signed(wire1)))));
  assign wire5 = (-$signed(((~|((8'h9c) ? wire1 : wire1)) && $signed((wire4 ?
                     wire3 : wire1)))));
  assign wire6 = (wire4 < $unsigned(($signed((~&wire4)) ?
                     (wire3[(2'h3):(2'h3)] ?
                         (wire3 ? wire4 : wire0) : $unsigned(wire0)) : ({wire0,
                             wire3} ?
                         (wire5 != wire5) : {wire0, wire4}))));
  assign wire7 = wire1;
  assign wire8 = (+wire5[(1'h1):(1'h0)]);
endmodule
