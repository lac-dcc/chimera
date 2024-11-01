module top
#(parameter param35 = ((8'h9f) + (((|(8'h9c)) ? (((7'h42) ~^ (8'ha5)) ? {(7'h42), (8'ha0)} : ((8'hbe) ^ (7'h42))) : (8'hb1)) >= ((((8'had) << (8'hac)) | ((8'hb2) | (8'h9f))) ? (~|((8'hba) ? (8'hbb) : (8'ha8))) : {((7'h44) == (8'hbf))}))), 
parameter param36 = (!(8'hbd)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire34, wire33, wire32, wire31, wire29, wire4, (1'h0)};
  assign wire4 = ({wire0[(5'h13):(5'h12)]} ? ((8'hbd) && {wire1}) : (8'h9c));
  module5 #() modinst30 (wire29, clk, wire4, wire3, wire0, wire1);
  assign wire31 = $unsigned((($signed({wire4, wire4}) ?
                          wire1[(1'h1):(1'h1)] : (!$signed(wire1))) ?
                      $signed($unsigned(wire3)) : (wire4[(4'hb):(3'h7)] == ((|wire2) > (8'ha8)))));
  assign wire32 = ($signed({{wire1}}) ^ wire4[(4'h8):(2'h2)]);
  assign wire33 = ($unsigned((&wire0[(5'h11):(4'he)])) & (wire32 ?
                      (&wire32) : {{$signed((8'hbc)), wire31[(1'h0):(1'h0)]}}));
  assign wire34 = (8'had);
endmodule

module module5
#(parameter param27 = (((&(((8'h9f) + (8'hbe)) ? {(8'ha8), (8'ha9)} : (~|(8'hba)))) <<< ((((8'ha7) ? (8'hbf) : (8'hbe)) ? ((8'hab) ~^ (8'hbd)) : (^(8'hba))) ~^ {{(8'h9d)}, ((8'hb8) ^~ (8'h9f))})) != ({(&{(8'h9d)}), ((~(8'hbb)) > (8'ha0))} * (((|(8'haf)) ? (+(8'ha4)) : ((8'hb3) ? (8'hb2) : (8'hac))) <= (((8'hb1) ^~ (8'had)) ^ ((8'ha7) ? (8'haf) : (8'hab)))))), 
parameter param28 = param27)
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 (1'h0)};
  assign wire10 = ($unsigned($unsigned($signed($unsigned(wire8)))) || wire6);
  assign wire11 = (~|(wire7[(3'h5):(3'h5)] > wire8));
  assign wire12 = {$unsigned(($signed((^wire8)) ? wire8 : (-(~^wire11))))};
  assign wire13 = (8'ha8);
  assign wire14 = ({{$unsigned((|(8'hb0))), $unsigned((~&wire6))}, wire7} ?
                      (|{wire8,
                          wire12[(4'hf):(4'h8)]}) : wire13[(2'h2):(1'h1)]);
  assign wire15 = (((wire12 - (((8'h9c) != wire9) != wire11)) ?
                          ({(-wire9), (wire6 - (8'hb4))} >>> ((wire12 ?
                                  (8'had) : wire9) ?
                              (wire12 & (8'hb5)) : $unsigned(wire14))) : (($signed(wire7) != (wire10 >>> wire13)) ^ (^(wire10 <<< wire11)))) ?
                      (8'h9d) : (8'hbb));
  assign wire16 = (-wire9);
  assign wire17 = wire7;
  assign wire18 = $signed($signed((wire17[(2'h2):(2'h2)] > wire14)));
  assign wire19 = $signed({((!$unsigned(wire18)) >>> (wire13 ?
                          (wire10 == wire18) : wire15)),
                      wire13[(4'hd):(4'hc)]});
  assign wire20 = {$signed(((((8'ha1) ? wire6 : wire10) == (wire15 * wire10)) ?
                          wire17[(3'h5):(2'h2)] : (((8'hbe) >>> (8'hb8)) ?
                              $unsigned(wire15) : (wire10 <<< wire9)))),
                      (~$unsigned((wire9[(3'h4):(3'h4)] << (wire7 <<< wire9))))};
  assign wire21 = (wire18 ?
                      ({$signed($signed(wire13))} ?
                          {((wire13 ? (8'ha9) : (7'h44)) & (~|wire8)),
                              (^~$signed(wire12))} : $signed({(wire8 <<< (8'hb0))})) : ($signed(wire12) ?
                          wire8[(4'h8):(2'h2)] : (~^wire10)));
  assign wire22 = $unsigned(($signed(((8'ha1) != (~wire19))) ?
                      (wire17 && (^$signed(wire21))) : (wire17 ?
                          (-{wire7}) : (wire17 != (+wire16)))));
  assign wire23 = (wire19 ?
                      wire10[(1'h0):(1'h0)] : $signed((~&$signed(wire13[(4'hb):(1'h0)]))));
  assign wire24 = ((((~|(~^wire20)) ?
                      (^wire9[(3'h7):(3'h6)]) : (8'had)) >> ((|(~|(8'hb8))) ?
                      (8'hae) : (^{wire10, wire20}))) && wire18[(4'hb):(2'h2)]);
  assign wire25 = (~|$unsigned({wire9, (~|wire21)}));
  assign wire26 = wire10;
endmodule
