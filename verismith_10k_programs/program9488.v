module top
#(parameter param13 = (((8'hb5) == ((((8'ha1) - (8'ha9)) & (8'hac)) < {((8'hbd) >> (8'hbc))})) ? ((((~&(7'h40)) ? ((8'hba) << (8'hae)) : ((8'hb3) <= (8'h9d))) >> (+(-(8'hb1)))) ^ ((+{(8'hbd), (8'hbc)}) ? {(|(8'haa))} : ((+(8'ha8)) ~^ ((8'ha9) ? (8'hb2) : (8'hb0))))) : {((~^(-(8'h9e))) ? (~&(!(8'haa))) : (+(^~(8'ha9))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
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
  assign wire4 = $signed(wire0);
  assign wire5 = {(~^(|((wire0 ? wire2 : (8'haa)) <<< $unsigned(wire3)))),
                     wire4};
  assign wire6 = wire0[(5'h13):(4'h8)];
  assign wire7 = wire2;
  assign wire8 = {wire3, $unsigned($signed((&wire1[(4'hc):(1'h1)])))};
  assign wire9 = $unsigned(wire0[(5'h13):(3'h6)]);
  assign wire10 = ($unsigned({wire3}) ?
                      (wire5 >>> $unsigned(({wire9,
                          wire0} || $unsigned(wire4)))) : (8'hba));
  assign wire11 = ((~(^~($unsigned(wire6) <<< wire2))) * $signed(wire6[(3'h4):(1'h0)]));
  assign wire12 = $unsigned(($unsigned($unsigned((wire7 ? wire1 : wire4))) ?
                      (|((wire10 ? (8'hba) : wire10) ?
                          wire3[(4'ha):(2'h2)] : wire10)) : ((~&(wire2 >> wire9)) > wire2[(3'h5):(1'h1)])));
endmodule
