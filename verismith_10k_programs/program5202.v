module top
#(parameter param10 = (^~((-(((8'hb5) ? (8'ha3) : (7'h42)) ? ((7'h42) ? (8'hba) : (8'hba)) : {(8'ha0), (8'hb6)})) >= ((((8'had) ^ (7'h44)) >> ((8'hbb) ? (8'ha2) : (7'h44))) ? (((8'haf) ? (8'haf) : (7'h42)) ? ((8'hbd) ? (8'h9f) : (8'hb9)) : (^~(8'hba))) : {((8'h9c) ? (8'h9e) : (8'h9c)), ((8'ha1) >> (8'ha1))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0[(2'h2):(1'h0)];
  assign wire5 = $unsigned(wire4);
  assign wire6 = {($unsigned({wire5[(3'h5):(1'h0)]}) & (!wire5))};
  assign wire7 = $unsigned(wire3);
  assign wire8 = wire7[(2'h2):(1'h1)];
  assign wire9 = $unsigned(($unsigned($unsigned($unsigned((8'hbc)))) ?
                     $signed($signed($unsigned(wire6))) : {(((8'hb6) ?
                             wire4 : wire5) ^ wire3[(3'h6):(3'h5)]),
                         wire3[(3'h6):(3'h5)]}));
endmodule
