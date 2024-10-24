module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned({(($signed(wire2) << (~|wire2)) || $unsigned((wire1 ?
                         wire1 : wire0))),
                     (wire2[(4'h8):(1'h1)] * $signed((&(8'hb3))))});
  assign wire5 = (~|(($signed($signed((7'h40))) >>> ({(7'h42)} * wire2)) ?
                     ((wire0[(3'h7):(3'h5)] && (~^wire1)) ?
                         $unsigned($signed(wire3)) : {((8'haf) + wire3),
                             $unsigned((7'h44))}) : wire1));
  assign wire6 = ((|wire4) ? wire5 : wire5[(1'h0):(1'h0)]);
  assign wire7 = (~^$signed((($signed(wire2) ?
                     (!wire2) : $unsigned(wire3)) ^~ ((~&wire0) == wire3))));
  assign wire8 = {wire3, (~$signed($signed(wire5[(1'h0):(1'h0)])))};
  assign wire9 = (wire1 ? (~^wire3[(3'h4):(2'h2)]) : {(8'ha5)});
  assign wire10 = wire7;
  assign wire11 = wire1;
endmodule
