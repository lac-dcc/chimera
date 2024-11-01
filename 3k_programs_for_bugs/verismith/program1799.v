module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire2[(1'h1):(1'h0)];
  assign wire5 = (((|$unsigned({wire0})) ?
                     wire1[(2'h3):(1'h0)] : wire1[(4'hb):(3'h6)]) != wire2[(3'h5):(1'h1)]);
  assign wire6 = (7'h41);
  assign wire7 = (($unsigned((8'hbc)) >= ($unsigned(wire0) ?
                     wire2 : wire2[(3'h5):(3'h5)])) - wire4);
  assign wire8 = $signed((wire1[(5'h10):(5'h10)] ?
                     $unsigned((8'hba)) : (((wire0 ? wire7 : (8'hb2)) ?
                         (8'hb1) : $unsigned(wire3)) >>> (^~wire6))));
  assign wire9 = ($unsigned(($signed((wire8 ?
                     wire7 : wire6)) ^~ wire2)) ~^ (wire8[(3'h5):(3'h4)] || wire1));
  assign wire10 = wire5;
  assign wire11 = (7'h44);
  assign wire12 = wire6;
  assign wire13 = $signed((wire7 ?
                      $unsigned(((wire12 ?
                          wire10 : (8'h9f)) - (wire9 >> wire0))) : (({(8'ha4)} << (!wire8)) ?
                          ((wire7 << wire9) >= (wire3 && wire2)) : ((8'h9f) ?
                              {wire12, wire8} : wire7[(4'hd):(4'h8)]))));
endmodule
