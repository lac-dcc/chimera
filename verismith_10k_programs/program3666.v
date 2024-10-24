module top
#(parameter param13 = ((+(+{(8'haf)})) ? (^~((~^(~|(8'ha2))) <<< ({(8'hb0), (7'h44)} ? ((8'hba) >> (7'h41)) : ((8'hbe) > (8'haa))))) : (({((8'h9d) ? (8'ha6) : (8'ha8)), (+(7'h42))} << {(&(8'hac))}) ~^ ((8'hb7) ? ((^(8'hab)) ? (^~(8'hae)) : (^(8'h9d))) : (-((8'hab) - (8'hba)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed($signed((~^wire4[(4'hd):(3'h6)])));
  assign wire6 = wire5;
  assign wire7 = $unsigned($signed(((7'h41) ?
                     wire3[(1'h0):(1'h0)] : wire3[(2'h2):(2'h2)])));
  assign wire8 = $unsigned($signed($unsigned(wire6[(2'h2):(1'h0)])));
  assign wire9 = $signed($signed(wire6));
  assign wire10 = $unsigned({wire4});
  assign wire11 = ((wire3[(1'h1):(1'h0)] ?
                      $signed($signed((wire8 | wire1))) : ($signed((wire0 ?
                              wire3 : (8'hae))) ?
                          wire5 : ((|wire10) ~^ {wire7}))) != (((|$unsigned(wire3)) ?
                      wire0 : wire8[(2'h2):(2'h2)]) == wire1));
  assign wire12 = wire0[(4'h8):(1'h1)];
endmodule
