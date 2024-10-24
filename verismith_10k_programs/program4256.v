module top
#(parameter param15 = ((((((7'h40) ? (7'h42) : (8'h9c)) ? (^(8'ha8)) : ((8'h9c) ? (8'ha1) : (8'hb4))) ? ({(8'hae), (8'haf)} ? (8'hae) : (^~(8'hb1))) : {{(8'ha0)}}) ? (^~{((8'hb8) == (8'hbb))}) : (^(8'ha6))) ? (((((7'h40) ^ (8'ha9)) && ((7'h40) < (7'h41))) ? ({(8'hb4)} ? {(7'h41)} : (~(8'had))) : (((8'h9c) >> (8'ha2)) ? (8'ha3) : (~&(8'h9d)))) ? (((!(8'ha4)) ? (~(7'h40)) : ((8'hbb) > (8'ha3))) ? (((8'ha0) || (8'hbe)) ? (!(8'ha9)) : ((8'hb3) || (8'ha6))) : ({(8'h9e)} ? (+(8'ha8)) : (~|(8'hb5)))) : (((^(8'h9d)) ? ((8'hbf) ? (8'h9f) : (8'haf)) : ((8'hae) ? (8'h9d) : (8'ha8))) ? ((^(8'hab)) || ((8'haf) ? (8'hb0) : (8'ha8))) : (((8'hab) ? (8'h9c) : (8'ha0)) - (~^(8'hbc))))) : (~((8'h9c) ? {((8'hab) ^ (8'hae))} : (-(|(8'hb3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 (1'h0)};
  assign wire4 = $unsigned((8'ha9));
  assign wire5 = $unsigned(($signed((|(wire2 == (8'ha6)))) != (wire4[(1'h0):(1'h0)] ?
                     wire1 : $signed(((8'hae) ? wire1 : (8'hb9))))));
  assign wire6 = ($unsigned(wire4) - $unsigned(({(wire1 * wire3),
                     $signed((8'ha4))} || ((|wire2) & wire4))));
  assign wire7 = wire6[(1'h0):(1'h0)];
  assign wire8 = wire0;
  assign wire9 = (wire5 ^ $signed((8'hb7)));
  assign wire10 = (~^$unsigned(($unsigned(((8'hb1) ?
                      wire6 : wire4)) && wire0)));
  assign wire11 = wire1[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire9);
    end
  assign wire13 = $signed(wire9[(4'hc):(4'h9)]);
  assign wire14 = {((($signed((8'hb2)) ^~ {wire2, wire8}) ?
                          $unsigned((reg12 - wire5)) : (wire9 - wire11[(4'hb):(3'h6)])) | $signed(wire0)),
                      (~|(((wire2 ? wire6 : wire6) >>> wire6[(2'h2):(2'h2)]) ?
                          (((8'hb0) <<< wire13) >= wire7[(4'h8):(1'h0)]) : reg12))};
endmodule
