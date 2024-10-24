module top
#(parameter param13 = ((+((^~(~(8'hae))) != (&(^~(8'haa))))) <= ((((~&(8'ha8)) + ((8'ha8) ? (8'hbd) : (8'ha4))) != (&((8'h9d) ~^ (8'hb4)))) ? (((8'hbf) ? ((8'ha3) ? (8'hb1) : (7'h41)) : ((8'hbb) << (8'ha1))) ? (~&((8'hab) < (8'hac))) : {((8'hb7) << (8'ha0))}) : (!(~&(~|(8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed($signed({(~|wire3[(2'h2):(2'h2)])}));
  assign wire5 = (|(^~($signed($unsigned(wire1)) <<< $signed({wire1, wire1}))));
  assign wire6 = $unsigned(((!wire0) ^~ $unsigned($unsigned(wire5[(2'h2):(1'h0)]))));
  assign wire7 = $signed(($signed(wire5[(2'h2):(2'h2)]) ?
                     (^wire0) : $signed($signed((~|wire2)))));
  assign wire8 = ($signed(((wire5 - wire4[(3'h6):(3'h4)]) <= wire7)) >>> (-$unsigned($unsigned($signed(wire3)))));
  assign wire9 = (wire3[(3'h6):(3'h5)] == {wire0[(4'h9):(4'h8)], wire6});
  assign wire10 = ((~|$signed($signed(((8'ha1) & wire0)))) | (+(8'ha6)));
  assign wire11 = ((|$unsigned($signed((8'hac)))) ?
                      (~^wire2) : $signed((wire4 || {((8'h9d) || wire5)})));
  assign wire12 = $unsigned(wire4);
endmodule
