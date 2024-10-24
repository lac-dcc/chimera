module top
#(parameter param16 = (~(8'hae)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire15,
                 wire14,
                 wire13,
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
  assign wire4 = (($unsigned(wire3) << $signed((!(&(8'hb2))))) ?
                     (!(-wire1)) : ($signed((^wire0[(4'he):(4'hd)])) & {((wire2 <= wire0) ?
                             (wire3 >> wire2) : wire0),
                         wire3[(3'h6):(3'h5)]}));
  assign wire5 = {$unsigned((&wire1[(4'h8):(4'h8)]))};
  assign wire6 = {((wire2 >> (~&((8'hbc) ? wire5 : wire3))) ?
                         wire5[(1'h1):(1'h0)] : wire2[(2'h2):(1'h0)])};
  assign wire7 = wire5;
  assign wire8 = wire4;
  assign wire9 = (($unsigned($unsigned((8'ha3))) ?
                     ($unsigned($signed((8'ha5))) ?
                         $signed($unsigned(wire2)) : (+wire3[(4'h9):(4'h8)])) : (^{(wire4 < wire4),
                         (|(8'hbd))})) | wire0);
  assign wire10 = $unsigned(wire4[(2'h2):(1'h0)]);
  assign wire11 = (|$signed(wire5));
  assign wire12 = wire9;
  assign wire13 = ($unsigned(wire12) ?
                      (~^(((wire2 ? wire5 : wire8) ^ wire12[(2'h3):(1'h0)]) ?
                          $signed(wire9) : $signed((wire3 ^~ wire1)))) : (~$unsigned(wire6[(4'hb):(2'h3)])));
  assign wire14 = $signed(wire10[(1'h0):(1'h0)]);
  assign wire15 = $signed((((wire2 ^ wire0) ?
                          (&$unsigned(wire6)) : (~|$unsigned(wire14))) ?
                      wire5 : wire2));
endmodule
