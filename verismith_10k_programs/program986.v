module top
#(parameter param21 = (~^{((~&((8'hba) ? (8'hb2) : (8'h9c))) <= (((8'hb2) ? (8'hb5) : (8'hbb)) ~^ (-(8'ha8)))), ((((8'haf) ? (8'hb7) : (8'hb5)) ? ((8'hba) ? (8'hb0) : (8'h9e)) : ((8'hba) ? (7'h43) : (8'ha9))) + (~^(|(8'ha0))))}), 
parameter param22 = param21)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire20,
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
  assign wire4 = $signed(wire1);
  assign wire5 = wire3[(2'h3):(1'h1)];
  assign wire6 = $unsigned(($signed((-wire1)) ?
                     ((+$unsigned(wire4)) ?
                         wire1[(4'ha):(3'h4)] : (|(wire3 ?
                             wire5 : (8'ha2)))) : (wire4 ?
                         {$unsigned(wire4)} : (8'h9c))));
  assign wire7 = $unsigned((wire4[(2'h2):(2'h2)] ?
                     wire6 : $unsigned(($unsigned(wire4) + (wire6 >> wire3)))));
  assign wire8 = (wire3[(2'h3):(2'h3)] < wire0[(1'h0):(1'h0)]);
  assign wire9 = {(wire0[(1'h1):(1'h0)] ?
                         wire6 : $signed(wire0[(1'h0):(1'h0)])),
                     ((&$signed($unsigned(wire8))) + wire7[(1'h0):(1'h0)])};
  assign wire10 = (wire1 ?
                      $signed((wire3[(1'h0):(1'h0)] | (+(wire0 ?
                          wire6 : wire5)))) : $unsigned(wire0[(2'h2):(1'h1)]));
  assign wire11 = wire2[(3'h4):(3'h4)];
  assign wire12 = wire8[(3'h7):(2'h3)];
  assign wire13 = $signed((+wire7[(2'h3):(1'h1)]));
  assign wire14 = wire5;
  assign wire15 = $signed((wire13[(3'h7):(3'h5)] == ($signed(wire9[(4'he):(4'h9)]) ?
                      ((wire3 ?
                          wire12 : wire4) - wire5[(2'h3):(2'h2)]) : {{wire3,
                              wire9},
                          $signed(wire1)})));
  assign wire16 = wire13[(4'hd):(1'h1)];
  assign wire17 = wire1[(4'hf):(3'h7)];
  assign wire18 = $unsigned((wire6[(1'h0):(1'h0)] ^ $signed($unsigned(wire16))));
  assign wire19 = {{{($unsigned(wire14) < (&wire4)), wire11[(3'h7):(3'h5)]},
                          $unsigned((^~wire6[(3'h6):(3'h4)]))}};
  assign wire20 = ((((wire3 ^ (wire13 ~^ wire7)) ?
                              (^~$signed(wire9)) : (^~{wire1, (8'hbd)})) ?
                          $unsigned($unsigned(wire19[(3'h4):(2'h2)])) : ($signed((wire17 && wire16)) - (+(wire12 ^ wire10)))) ?
                      {(wire9 <<< $signed(wire9[(3'h6):(1'h1)])),
                          wire8} : $signed($unsigned($signed($signed(wire10)))));
endmodule
