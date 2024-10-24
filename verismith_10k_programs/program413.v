module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed((8'hb1));
  assign wire6 = wire5;
  assign wire7 = wire2[(3'h4):(3'h4)];
  assign wire8 = ((wire1[(1'h1):(1'h1)] << $signed((8'hb5))) + (8'ha4));
  assign wire9 = wire0;
  assign wire10 = (~^(wire7[(4'h8):(1'h1)] >> $signed(((wire5 ?
                      (8'hac) : wire1) >>> {wire7, wire7}))));
  assign wire11 = $signed($signed((^~(wire6[(3'h7):(2'h2)] <<< {(8'hb2)}))));
  assign wire12 = $signed($signed((wire9[(4'hc):(3'h7)] ?
                      wire5 : (wire5[(4'hc):(3'h5)] + $signed(wire11)))));
  assign wire13 = (wire8[(4'hc):(1'h1)] ^ $unsigned(((wire6[(4'h8):(3'h5)] & wire7[(5'h14):(5'h14)]) ^ wire1)));
  assign wire14 = (8'h9e);
endmodule
