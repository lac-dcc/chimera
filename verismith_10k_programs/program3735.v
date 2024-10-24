module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(2'h3):(2'h2)];
  assign wire5 = (+(~$signed($signed($signed(wire2)))));
  assign wire6 = wire2;
  assign wire7 = $unsigned(($unsigned(wire3) || wire2[(2'h3):(1'h0)]));
  assign wire8 = $signed(wire3);
  assign wire9 = $signed(((($unsigned(wire0) ? (8'ha5) : $signed(wire5)) ?
                     $signed((wire0 ?
                         wire1 : wire0)) : (~&(wire2 & wire8))) < (wire6[(5'h12):(3'h6)] ?
                     {wire6[(1'h0):(1'h0)]} : (wire3[(3'h5):(2'h3)] ?
                         wire2[(1'h1):(1'h0)] : wire2))));
endmodule
