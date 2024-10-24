module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
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
  assign wire4 = (!((~((wire1 ? wire2 : wire2) ?
                         (wire2 ? wire2 : (8'ha9)) : wire0[(5'h11):(4'hf)])) ?
                     {{$unsigned(wire3)}} : (((wire0 ?
                             wire2 : wire2) << $unsigned(wire2)) ?
                         wire1 : (wire0 <<< {wire0}))));
  assign wire5 = (($unsigned((8'ha1)) && (~$signed($signed(wire0)))) ?
                     $signed(($unsigned($signed(wire4)) ?
                         (~^((8'ha0) >>> (8'ha9))) : $signed((wire2 ?
                             wire1 : wire3)))) : wire1[(2'h2):(2'h2)]);
  assign wire6 = $unsigned($unsigned({$unsigned((wire1 ? (8'ha4) : wire3))}));
  assign wire7 = $unsigned((~|$signed($signed($unsigned(wire5)))));
  assign wire8 = ((-$signed(($unsigned(wire0) <<< $signed((7'h43))))) == $unsigned((|wire5)));
  assign wire9 = (8'hbe);
  assign wire10 = $signed({wire9, (~&($unsigned(wire9) || (wire4 + wire2)))});
  assign wire11 = $signed($signed({(^wire8)}));
  assign wire12 = wire0[(4'h8):(2'h3)];
  assign wire13 = $unsigned($unsigned((^~wire3)));
  assign wire14 = wire12[(3'h5):(2'h2)];
  assign wire15 = $signed($signed({($signed(wire9) ?
                          wire5 : $unsigned(wire4))}));
  assign wire16 = ((~|$signed(wire12)) >> ($signed($signed($unsigned(wire0))) & (8'hae)));
  assign wire17 = (+(wire14[(3'h7):(3'h6)] ?
                      $unsigned($unsigned($signed((8'h9e)))) : $signed($signed((wire10 ?
                          wire4 : wire1)))));
  assign wire18 = wire0[(4'hf):(2'h3)];
  assign wire19 = {(~$unsigned(((wire3 & (8'hb7)) ?
                          (wire2 > wire16) : (wire2 | wire8))))};
  assign wire20 = wire14[(3'h6):(1'h0)];
  assign wire21 = $signed($unsigned((wire13[(2'h2):(1'h1)] >>> $unsigned($signed(wire13)))));
endmodule
