module top
#(parameter param20 = (8'h9d), 
parameter param21 = (((~^((-param20) ? (param20 ? param20 : (8'h9f)) : (-param20))) ? (8'hbd) : {(-(param20 - (8'ha4)))}) ? {{((param20 | param20) * param20), (~^(+param20))}} : ((~^(-(^(8'had)))) == (8'hbd))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire19,
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
                 (1'h0)};
  assign wire5 = (wire2[(2'h3):(1'h1)] ?
                     {wire4[(4'hf):(2'h3)],
                         wire0[(4'hc):(1'h0)]} : (^~wire4[(4'hb):(4'ha)]));
  assign wire6 = $unsigned($signed(wire0));
  assign wire7 = $signed((((wire6[(5'h15):(5'h10)] ?
                             (^~(8'hac)) : {wire6, (8'hb4)}) ?
                         $unsigned(wire4[(1'h0):(1'h0)]) : ((wire2 ?
                                 (8'ha6) : wire0) ?
                             $unsigned(wire6) : {wire5, wire0})) ?
                     $signed({$signed(wire3),
                         (~|wire5)}) : ($unsigned({wire3}) ?
                         $unsigned((wire3 ^ wire6)) : ($signed(wire3) ?
                             wire6[(3'h6):(3'h4)] : {(7'h44), wire0}))));
  assign wire8 = $signed({wire4[(1'h1):(1'h1)]});
  assign wire9 = ($unsigned((wire8[(1'h0):(1'h0)] ~^ wire8[(1'h1):(1'h1)])) > wire4);
  assign wire10 = ($signed((wire7[(4'h8):(3'h7)] >> $unsigned((wire8 ?
                          wire1 : wire3)))) ?
                      $signed(((8'ha1) * $unsigned((wire8 ?
                          wire1 : wire6)))) : $signed($signed($signed($signed(wire3)))));
  assign wire11 = wire7[(3'h5):(3'h4)];
  assign wire12 = (!$unsigned(($unsigned(wire5[(2'h3):(2'h3)]) | ({(7'h44),
                      wire11} * (wire8 >>> wire11)))));
  assign wire13 = (wire7 | ($signed($signed((|wire1))) * ($unsigned(wire11) <= (^~(~|wire10)))));
  assign wire14 = {({wire9, wire12} ?
                          {((~|wire4) >>> $signed(wire13)),
                              (~&(wire10 & wire7))} : (~&$unsigned(wire11[(3'h5):(1'h0)]))),
                      wire13};
  assign wire15 = wire13[(1'h0):(1'h0)];
  assign wire16 = (((^$signed(wire9[(3'h4):(2'h2)])) ?
                          (wire13[(2'h3):(1'h0)] || $signed({(7'h44),
                              wire5})) : $unsigned((wire8[(3'h7):(1'h1)] ?
                              wire2 : wire13))) ?
                      $unsigned(wire14[(4'hf):(1'h1)]) : ({wire1,
                              wire2[(5'h10):(2'h3)]} ?
                          (~^{$unsigned(wire14)}) : $unsigned(((wire11 ^~ wire12) ?
                              wire11 : wire4))));
  assign wire17 = $unsigned(((($unsigned(wire14) != (^wire7)) ?
                          wire15 : $signed($unsigned(wire1))) ?
                      wire16[(2'h3):(1'h1)] : (wire6[(5'h10):(2'h3)] ?
                          (&{wire10, wire12}) : ((wire13 ? wire0 : wire1) ?
                              $signed(wire2) : (wire6 ? wire10 : wire1)))));
  assign wire18 = $unsigned((-(8'hab)));
  assign wire19 = $unsigned($unsigned((~^((wire1 >= wire11) ?
                      $signed(wire7) : $unsigned(wire15)))));
endmodule
