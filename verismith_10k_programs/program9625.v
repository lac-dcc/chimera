module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (($unsigned((((8'hb4) ?
                         wire0 : wire2) >>> (wire4 <<< (8'hac)))) ?
                     wire3 : (-wire5[(4'ha):(3'h5)])) > wire3[(1'h0):(1'h0)]);
  assign wire7 = (^$unsigned(wire1[(4'hb):(4'ha)]));
  assign wire8 = (|(wire2[(4'hf):(3'h7)] ?
                     $unsigned($signed((wire2 ?
                         wire1 : wire2))) : wire7[(3'h6):(3'h6)]));
  assign wire9 = ((wire0 >> (((wire7 ? wire4 : wire2) ?
                             (7'h41) : $unsigned(wire8)) ?
                         $signed(((8'ha5) ?
                             wire1 : wire5)) : wire4[(2'h3):(1'h1)])) ?
                     $signed((^~((wire4 ? wire8 : wire2) ?
                         (wire0 - wire8) : ((7'h41) & wire5)))) : ($unsigned(wire3[(3'h5):(3'h4)]) ?
                         (!$unsigned((wire2 ?
                             (8'h9f) : wire1))) : {(wire7[(3'h6):(3'h4)] ?
                                 wire1[(3'h4):(2'h2)] : $unsigned(wire6))}));
  assign wire10 = wire6;
  assign wire11 = wire8;
  assign wire12 = (((wire6[(1'h0):(1'h0)] ?
                          $unsigned((8'h9e)) : wire6) && wire11[(4'hb):(2'h2)]) ?
                      ($signed($signed(wire0[(3'h6):(3'h4)])) ?
                          (8'hb7) : wire0) : $signed($unsigned((((8'hac) - wire3) ?
                          (wire3 ? wire1 : wire7) : (wire1 ?
                              (8'hb7) : wire2)))));
endmodule
