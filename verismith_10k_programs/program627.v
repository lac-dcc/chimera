module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(4'h8):(1'h0)];
  assign wire5 = ((|wire4[(2'h2):(1'h0)]) ?
                     wire3[(4'hb):(1'h0)] : ((((wire4 ? wire0 : wire2) ?
                             (~&wire0) : $unsigned(wire0)) - {(wire2 ~^ wire3)}) ?
                         (($signed(wire1) & wire1) ?
                             (wire0[(1'h0):(1'h0)] ?
                                 $signed(wire1) : (wire2 > wire4)) : ((wire3 < wire0) ^ $signed(wire3))) : (~&(wire4 ?
                             (~^wire1) : {wire1, wire0}))));
  assign wire6 = wire5;
  assign wire7 = ((^($signed($signed(wire4)) == wire5)) - ((^wire0[(4'h9):(2'h2)]) ?
                     $signed(wire4) : (!$signed((wire1 || wire1)))));
  assign wire8 = (wire1 != (8'h9e));
endmodule
