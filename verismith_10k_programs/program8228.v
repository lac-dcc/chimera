module top
#(parameter param42 = (((+(^((8'hb4) - (7'h44)))) ? {((^(8'ha7)) + (~|(8'ha1)))} : (~^(((8'hb5) & (8'ha5)) ? {(8'hbb)} : (~^(8'ha2))))) ^~ (({((8'ha1) ? (8'h9c) : (8'hbe))} ? ({(7'h42), (8'ha8)} ~^ ((8'ha7) <= (8'ha3))) : (|((8'ha7) ? (8'h9f) : (8'haa)))) ? (((~(8'ha0)) ^ ((8'hb2) && (8'hb1))) >> (((8'ha6) ? (8'hb4) : (8'ha8)) && (~&(8'hba)))) : ((!((8'ha7) > (8'hbf))) ? {((8'ha0) ^~ (8'h9f))} : (((8'ha4) == (8'hac)) ? {(8'hbc)} : ((8'ha6) < (8'h9e)))))), 
parameter param43 = ((param42 ? (-(~{(8'hb1)})) : (((8'hb3) ^~ param42) * param42)) ? param42 : (({param42, {param42}} | (~|(8'hbf))) <= (^~(((8'h9f) == param42) << (param42 ? (8'hbf) : param42))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  assign y = {wire41, wire39, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~&$unsigned($unsigned((!wire0[(3'h6):(2'h3)]))));
  assign wire5 = (wire2[(3'h7):(3'h7)] - $signed(((wire3 - wire3[(5'h12):(1'h0)]) ?
                     wire3 : ((!(7'h42)) ?
                         (wire2 | wire0) : $signed((8'hb5))))));
  assign wire6 = (((wire5[(3'h7):(3'h4)] ?
                         (&wire1) : $unsigned(wire0)) || $signed(($unsigned(wire0) != ((8'ha0) || wire1)))) ?
                     ({{{wire0, wire3}, {wire3, (8'ha5)}}, wire2} ?
                         wire5 : wire0) : $unsigned($signed(((wire3 != wire2) + {wire4}))));
  assign wire7 = $signed((!wire4[(4'h9):(3'h6)]));
  module8 #() modinst40 (wire39, clk, wire6, wire1, wire3, wire0);
  assign wire41 = wire39;
endmodule

module module8
#(parameter param38 = (((8'hb4) ? ((((8'hb2) ~^ (8'had)) ? ((8'ha2) ? (8'hb3) : (8'hb7)) : (+(8'h9d))) <= ((^~(8'ha8)) ? (8'hbd) : ((8'ha9) ? (7'h43) : (8'hb5)))) : (8'ha8)) ? (~{({(8'hb5), (8'haf)} ^~ (^~(8'ha4)))}) : (((((7'h44) + (8'hab)) ? ((7'h44) ? (8'hb4) : (8'hba)) : (~&(8'h9d))) ? (+((8'hbb) || (8'hb0))) : {((8'ha9) - (8'ha7)), ((8'hb3) ? (8'hac) : (7'h42))}) | (~|({(7'h42)} ? ((7'h44) <<< (8'hbd)) : ((8'hb2) != (8'h9e)))))))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire34;
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire18,
                 wire19,
                 wire20,
                 wire34,
                 reg17,
                 (1'h0)};
  assign wire13 = wire11[(1'h1):(1'h1)];
  assign wire14 = (-((({wire13, wire11} * $unsigned(wire11)) >>> {(&wire12),
                          $unsigned(wire10)}) ?
                      $unsigned({{wire10, wire10}}) : (wire11 ?
                          $unsigned($signed((8'hb8))) : $signed((wire11 ?
                              wire12 : wire13)))));
  assign wire15 = wire10[(5'h10):(3'h5)];
  assign wire16 = $unsigned($unsigned((wire9 <<< wire9[(4'h9):(3'h7)])));
  always
    @(posedge clk) begin
      reg17 <= wire12[(3'h5):(3'h5)];
    end
  assign wire18 = $unsigned(((8'ha9) ?
                      $unsigned(((wire13 <<< wire15) != reg17)) : wire15[(1'h1):(1'h0)]));
  assign wire19 = ((~^($unsigned((wire9 ? (8'ha3) : wire14)) ?
                          $signed(wire14) : wire14[(4'he):(3'h7)])) ?
                      $unsigned(wire9) : ((wire16[(2'h2):(2'h2)] < $unsigned({wire13})) ?
                          ((wire15[(2'h3):(2'h3)] ?
                              (wire11 ? wire10 : wire12) : (wire10 ?
                                  (8'hb4) : wire10)) == (~^$signed((7'h41)))) : (-$unsigned((^wire10)))));
  assign wire20 = ((8'h9c) > (^~(wire14 ?
                      (!$unsigned(wire16)) : wire12[(3'h6):(3'h5)])));
  module21 #() modinst35 (wire34, clk, wire16, wire15, wire18, wire9, wire13);
  assign wire36 = $signed({wire20[(1'h1):(1'h0)],
                      ($signed(wire11) ^ $signed(wire34))});
  assign wire37 = (reg17 > (((wire36[(4'h9):(3'h5)] ?
                              wire10[(4'he):(2'h3)] : $unsigned(wire16)) ?
                          (^$signed(reg17)) : $signed(reg17)) ?
                      wire9[(3'h5):(2'h3)] : (($signed((8'hac)) ^ wire34[(2'h3):(1'h0)]) ?
                          (wire9[(4'ha):(3'h6)] ?
                              $unsigned(wire36) : (^wire9)) : wire11)));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = $signed((~wire26[(3'h5):(2'h2)]));
  assign wire28 = ($unsigned({wire26}) <<< {(|({wire27,
                          (8'hb8)} | $unsigned(wire27))),
                      $signed({$signed(wire27)})});
  assign wire29 = (-$signed($unsigned(($signed(wire25) ?
                      (wire24 ? (8'ha4) : wire24) : (wire22 <<< (8'h9d))))));
  assign wire30 = ((~&(($signed((8'h9c)) >= (wire24 - wire24)) != wire27[(4'he):(4'hd)])) ^~ ((+wire23[(4'hb):(4'h8)]) ?
                      (((8'hb4) ^~ (wire24 && (8'ha5))) << $signed(wire29)) : $unsigned($signed((^~(8'ha1))))));
  assign wire31 = wire25;
  assign wire32 = wire29[(3'h7):(3'h5)];
  assign wire33 = wire27[(4'ha):(3'h6)];
endmodule
