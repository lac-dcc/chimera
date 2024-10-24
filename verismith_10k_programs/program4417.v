module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = {((~|wire2[(3'h4):(1'h0)]) ?
                         wire3 : (({wire0, wire3} ?
                                 wire3 : (wire1 ? wire2 : (8'ha6))) ?
                             wire1[(4'h8):(2'h2)] : wire3)),
                     $signed(wire0)};
  assign wire5 = {(wire4 * $signed({$unsigned(wire2)}))};
  assign wire6 = $signed($signed(({(wire4 ?
                         wire1 : wire1)} && $signed((wire1 - wire5)))));
  assign wire7 = ((8'ha1) ?
                     (wire6 - (^($signed(wire0) - ((8'ha0) * (8'hab))))) : $unsigned((((wire1 ?
                             wire5 : wire6) <= wire0[(2'h3):(1'h1)]) ?
                         $signed($unsigned(wire4)) : $signed(((8'ha3) <<< wire5)))));
  assign wire8 = wire2;
  module9 #() modinst41 (wire40, clk, wire3, wire7, wire8, wire0);
  assign wire42 = $signed(wire8[(4'h9):(4'h9)]);
  assign wire43 = (($signed($unsigned((wire42 ? wire42 : wire40))) ?
                          wire2 : ({(wire40 ? wire42 : wire1), (-wire40)} ?
                              wire1[(4'hc):(4'hc)] : $signed($unsigned(wire2)))) ?
                      (wire6[(4'h9):(1'h1)] ?
                          (8'h9f) : (8'hb8)) : $unsigned((~|(wire7[(4'h8):(3'h6)] < (wire42 ?
                          wire3 : (8'hba))))));
  assign wire44 = (!wire6[(1'h1):(1'h1)]);
  assign wire45 = $signed($unsigned(wire7));
  assign wire46 = {(8'hb7),
                      (($unsigned((wire6 ? wire3 : wire42)) ?
                              wire4[(1'h1):(1'h0)] : $unsigned((8'hb7))) ?
                          $unsigned(wire40) : (!wire42[(4'hf):(4'hf)]))};
  assign wire47 = (8'hae);
  assign wire48 = (~|{(wire6 || ((-wire2) ? (^wire0) : (wire45 >= wire0)))});
  assign wire49 = ($signed({wire0}) ? wire4 : (^wire5[(2'h2):(2'h2)]));
  assign wire50 = (|wire2[(3'h7):(3'h6)]);
  assign wire51 = ((|(^(~&{wire7}))) != (~|$signed(((wire50 ? wire0 : wire42) ?
                      (^~wire1) : (!wire44)))));
  assign wire52 = (({(^$unsigned(wire48))} ?
                      wire42[(4'h8):(4'h8)] : {wire2[(3'h7):(3'h7)],
                          (wire49[(3'h5):(1'h0)] + {(7'h40)})}) >= $signed(wire44[(1'h1):(1'h0)]));
  assign wire53 = ($signed((^((^~(8'hbd)) ?
                      wire45[(2'h2):(1'h0)] : wire46[(1'h1):(1'h1)]))) | $signed((($signed(wire44) ~^ $unsigned(wire50)) | wire3)));
endmodule

module module9
#(parameter param39 = (|((&({(8'ha2)} * (8'hac))) << (~&((+(8'hbd)) ~^ ((8'hb6) ? (8'hb8) : (8'had)))))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  assign y = {wire38, wire37, wire36, wire34, wire15, wire14, (1'h0)};
  assign wire14 = wire12;
  assign wire15 = $signed(wire12);
  module16 #() modinst35 (.clk(clk), .wire17(wire12), .wire19(wire11), .wire20(wire13), .wire18(wire14), .y(wire34));
  assign wire36 = wire13[(4'h8):(3'h7)];
  assign wire37 = (((~((wire11 ?
                      wire36 : wire11) >= $unsigned(wire13))) - (((wire12 <= wire12) ?
                          (wire10 ^ wire12) : (wire34 ? wire12 : wire10)) ?
                      $unsigned(wire34[(2'h2):(2'h2)]) : wire13[(4'he):(4'h8)])) >> ($signed({(wire34 ^~ wire36),
                          wire15[(1'h1):(1'h1)]}) ?
                      {wire12[(4'h8):(2'h2)],
                          wire13[(5'h10):(4'h8)]} : wire11[(3'h5):(1'h1)]));
  assign wire38 = ($unsigned({($signed(wire37) > (wire37 ~^ wire15))}) ?
                      $signed(wire13) : {$signed(((^wire14) ? wire34 : wire36)),
                          $signed((wire12 ?
                              (wire13 < wire36) : $signed(wire14)))});
endmodule

module module16
#(parameter param32 = ((8'hb8) ? (((^((7'h40) >> (8'hbc))) ? ((~(8'h9f)) ^~ ((7'h43) <<< (7'h40))) : (((8'hbc) ? (8'h9e) : (8'hba)) ? (8'ha0) : {(8'h9c), (8'hbb)})) ? ((((8'hbc) + (8'h9c)) ? (~&(8'ha8)) : ((8'h9c) ? (8'ha4) : (8'ha1))) ? (((8'ha4) >= (8'hab)) ? {(7'h40)} : ((8'haa) << (8'hac))) : (+((7'h43) ^ (7'h40)))) : ({((8'h9e) | (8'hab))} ? ({(8'ha6), (8'hab)} ? ((8'ha5) >= (8'haf)) : ((8'hba) & (8'hb7))) : (-(~^(8'ha4))))) : (((((8'hba) && (8'ha8)) > (^(8'hb4))) - (^((8'hb4) < (8'hb0)))) ? (~^(|((8'ha4) ? (8'hb3) : (7'h40)))) : ({((8'hae) ? (8'hb3) : (8'ha4))} ? ((8'hb5) ? ((8'ha2) << (8'hbd)) : ((8'hbb) - (7'h41))) : (((7'h42) ? (8'hbd) : (8'hbb)) == {(8'haf), (8'hbb)})))), 
parameter param33 = (~|(param32 ? ((8'hbc) ? (8'ha6) : (8'h9c)) : (param32 ? ((param32 - param32) ? (param32 ? param32 : param32) : (param32 ? param32 : param32)) : param32))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire21 = wire20[(3'h5):(1'h0)];
  assign wire22 = {wire20};
  assign wire23 = ((~&$signed(($unsigned(wire21) ?
                          (wire19 ? wire19 : wire19) : $signed(wire21)))) ?
                      ((~|wire18) & ({wire17[(3'h5):(1'h0)],
                          $unsigned(wire19)} << wire19)) : wire21);
  assign wire24 = wire23[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= wire24;
      reg26 <= {(!$signed($unsigned((-wire22)))),
          $unsigned($signed($signed((reg25 ? reg25 : wire17))))};
      reg27 <= wire23[(2'h3):(2'h2)];
      reg28 <= {(((!(wire17 <<< wire19)) << (~^$signed(wire21))) ?
              $signed(($signed(wire23) ?
                  {wire22, wire19} : (|wire18))) : $signed({$signed(wire21),
                  $signed(wire22)}))};
    end
  assign wire29 = (wire19 ?
                      (&{(|$unsigned((8'hbf))),
                          (8'had)}) : $signed(($unsigned((wire20 ?
                          wire20 : wire20)) > $unsigned((wire24 * wire20)))));
  assign wire30 = (((~|{(-reg28)}) >> (8'hb5)) - (wire17[(3'h7):(1'h0)] ^~ $unsigned($unsigned((+(7'h44))))));
  assign wire31 = (-wire29);
endmodule
