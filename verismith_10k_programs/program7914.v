module top
#(parameter param125 = (+{(((8'hae) ? ((8'ha8) ? (7'h40) : (8'h9f)) : ((8'ha8) < (8'h9f))) ^~ ((^~(8'ha3)) ? ((8'hb2) ^ (8'hbe)) : ((8'hae) ~^ (8'ha6))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire117;
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  assign y = {wire124,
                 wire119,
                 wire117,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  module4 #() modinst118 (wire117, clk, wire1, wire2, wire0, wire3);
  assign wire119 = wire3[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg120 <= (~&$unsigned(((wire2[(4'h9):(4'h9)] <<< $signed(wire119)) + {$signed(wire3)})));
      reg121 <= ((~&reg120[(2'h3):(2'h2)]) ?
          ((-(~(|wire1))) ?
              wire117[(4'ha):(3'h4)] : $signed($unsigned({wire2,
                  wire1}))) : reg120[(1'h1):(1'h1)]);
      reg122 <= reg121;
      reg123 <= ((8'h9f) ?
          $unsigned($unsigned($unsigned($unsigned(wire1)))) : wire3[(5'h10):(1'h0)]);
    end
  assign wire124 = ($unsigned((reg122 | {$signed((7'h41)),
                           wire1[(4'hc):(2'h3)]})) ?
                       reg121[(4'h9):(1'h1)] : $unsigned(($signed($unsigned(wire1)) && (wire0 ^ (reg121 ?
                           wire117 : wire3)))));
endmodule

module module4
#(parameter param115 = (((-((~&(8'ha2)) != (~^(8'ha7)))) ^~ (~((|(8'hba)) <<< ((8'hb6) ? (7'h44) : (8'ha5))))) ? ((-(((8'hae) << (8'h9c)) ? ((7'h44) && (8'ha7)) : ((8'hb4) ? (8'had) : (8'hb3)))) ? ((~^((8'had) & (8'ha5))) ? (((8'ha3) >>> (8'hb6)) ? ((8'hb2) <<< (7'h43)) : ((8'hb0) <<< (8'ha2))) : ((~^(8'haf)) ? ((8'h9e) ? (8'hb0) : (8'hb2)) : ((8'hb7) == (7'h40)))) : ((|((8'hbb) ? (8'hb0) : (8'hbf))) ? ((~^(8'hb6)) == ((8'haa) + (8'hb7))) : (~&((8'hae) == (8'hb0))))) : (~^{(((8'hbd) ^ (8'haf)) >= ((7'h43) ? (8'hbd) : (8'ha3)))})), 
parameter param116 = (&(8'ha6)))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire5;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(2'h2):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire61;
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire111,
                 wire9,
                 wire10,
                 wire20,
                 wire46,
                 wire48,
                 wire49,
                 wire61,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire9 = (~&((^(~&(wire6 - wire7))) | wire5[(4'hf):(2'h3)]));
  assign wire10 = $unsigned(((^$signed($signed(wire5))) ?
                      (($unsigned(wire6) << (8'h9c)) * {(wire9 <= wire6)}) : $unsigned($signed((wire6 + wire8)))));
  always
    @(posedge clk) begin
      if (($signed((-wire8)) ?
          $signed((((~|wire10) ?
              $signed(wire5) : wire7) >>> (&(~^(8'h9e))))) : ((((wire5 ?
              wire9 : (8'ha2)) >= wire5[(4'hb):(1'h1)]) > wire9[(3'h5):(2'h3)]) ~^ $signed(($signed(wire9) <= (^wire10))))))
        begin
          if (((wire9 ? wire5 : wire7) ?
              $signed($signed($signed({wire5, wire10}))) : (wire8 ?
                  wire10[(4'hf):(4'h9)] : $unsigned({wire8}))))
            begin
              reg11 <= $signed((($signed(wire5) ?
                  ({wire5} ?
                      $unsigned(wire9) : {wire7,
                          wire8}) : wire9[(1'h0):(1'h0)]) << wire6[(2'h2):(1'h0)]));
              reg12 <= {(!{(((8'hae) <<< (8'hbc)) ?
                          (~^wire8) : (reg11 ? wire6 : wire5))}),
                  {(8'hbb), (8'hbc)}};
              reg13 <= {(^wire6),
                  (((^{wire7, wire10}) ? wire5 : reg11[(2'h2):(2'h2)]) ?
                      $signed(wire9) : wire5[(4'ha):(3'h4)])};
              reg14 <= (~|((~$signed(wire8[(4'h8):(2'h2)])) ?
                  (wire8[(4'hb):(1'h1)] ^ $unsigned((wire7 != wire7))) : wire8));
              reg15 <= ((8'hb3) - {$signed((&(reg12 ? wire5 : reg14)))});
            end
          else
            begin
              reg11 <= $unsigned(({reg14[(3'h4):(2'h3)],
                  $unsigned((wire7 ?
                      wire9 : (7'h40)))} >> ($unsigned(wire7[(2'h2):(1'h1)]) < ((wire10 ?
                      reg11 : reg11) ?
                  $unsigned(wire10) : reg14[(2'h2):(1'h1)]))));
              reg12 <= (8'ha4);
              reg13 <= ((~&$signed($signed($unsigned((8'hb7))))) ?
                  (~|reg12) : (~^($unsigned(wire7[(4'hf):(4'ha)]) ?
                      ((reg15 <= (8'hbf)) - $unsigned(reg12)) : $signed($signed((8'ha1))))));
              reg14 <= $signed(wire10[(3'h7):(3'h5)]);
              reg15 <= $signed((~reg15[(4'hf):(3'h5)]));
            end
        end
      else
        begin
          reg11 <= (wire6[(1'h1):(1'h0)] ? (~^reg11) : wire8);
          reg12 <= reg12[(5'h11):(4'hc)];
          reg13 <= ($unsigned(wire10[(4'hd):(3'h7)]) >= ($unsigned((wire10 | reg12)) ?
              reg14 : reg13[(3'h7):(3'h7)]));
          if ({wire9[(3'h4):(3'h4)], (+(~|reg12))})
            begin
              reg14 <= ({($unsigned((^~wire5)) >= (^(reg15 ~^ wire6))), reg14} ?
                  reg12[(3'h4):(1'h1)] : (^$signed((~^{reg15, reg14}))));
              reg15 <= $signed(reg14);
              reg16 <= reg15[(4'he):(3'h4)];
              reg17 <= ((!(((wire7 ? wire10 : wire8) ?
                      $unsigned(reg16) : $unsigned(reg12)) ?
                  {((8'hac) ? wire9 : wire6),
                      reg11} : reg13[(4'h9):(4'h9)])) && ($signed((!$signed((8'ha3)))) > $signed($signed((wire9 == wire7)))));
            end
          else
            begin
              reg14 <= $signed({wire8[(3'h6):(2'h2)],
                  (((reg12 * reg11) || (^~wire7)) ~^ ($signed(reg15) ?
                      (reg12 ? wire5 : wire10) : $unsigned(wire7)))});
              reg15 <= reg12[(4'ha):(1'h0)];
              reg16 <= ($unsigned((wire9 & $signed((reg17 ?
                  (8'hb8) : (8'ha2))))) && (8'hb2));
              reg17 <= {$signed(($unsigned(reg17[(3'h6):(2'h2)]) <<< $unsigned((reg17 ?
                      reg13 : wire7))))};
            end
        end
      reg18 <= reg12[(4'hd):(4'hc)];
      reg19 <= $unsigned(($signed($unsigned(((8'ha4) ?
          reg11 : reg12))) <= {(~&(~&reg18))}));
    end
  assign wire20 = $signed(reg16[(3'h7):(1'h1)]);
  module21 #() modinst47 (.wire25(reg18), .clk(clk), .wire22(reg11), .y(wire46), .wire24(reg17), .wire23(reg16));
  assign wire48 = (^~{(reg16 ?
                          $unsigned((reg16 ?
                              wire7 : reg18)) : (wire8[(1'h1):(1'h1)] + wire20))});
  assign wire49 = ({$signed((-(wire48 & wire5)))} <<< {$signed(wire48), reg13});
  module50 #() modinst62 (wire61, clk, reg13, wire48, wire10, wire46);
  always
    @(posedge clk) begin
      if ((~^wire48))
        begin
          reg63 <= {wire8[(4'h9):(2'h2)], wire48};
          reg64 <= wire48[(4'ha):(3'h7)];
          reg65 <= $unsigned({$unsigned($signed($signed((8'ha7)))),
              (($unsigned(wire8) * $unsigned(wire6)) ?
                  $unsigned({reg16}) : $signed((!reg17)))});
          reg66 <= wire20;
        end
      else
        begin
          reg63 <= $signed({((&$unsigned(reg65)) ~^ {wire48[(3'h6):(1'h1)]}),
              (wire9 ?
                  $unsigned($unsigned(reg14)) : ((reg12 + wire8) ?
                      $unsigned(wire20) : reg18[(2'h2):(2'h2)]))});
          reg64 <= wire5;
          if (wire8)
            begin
              reg65 <= $signed(reg63[(3'h7):(3'h4)]);
              reg66 <= $signed({reg16});
              reg67 <= $signed($unsigned($signed(($unsigned(reg66) - reg11))));
              reg68 <= wire46;
              reg69 <= ($signed((^reg64)) ? $signed(reg64) : $signed(reg11));
            end
          else
            begin
              reg65 <= wire20[(5'h10):(2'h2)];
              reg66 <= $signed((($unsigned($signed(reg16)) ?
                      wire6 : {(8'hbf)}) ?
                  (8'hb0) : reg66));
              reg67 <= ($unsigned(($unsigned((-wire6)) ?
                      ((reg13 ?
                          wire5 : wire61) < $unsigned(reg16)) : ($signed(wire7) << reg63))) ?
                  reg15[(4'hb):(2'h2)] : $signed($unsigned({reg65[(2'h2):(2'h2)],
                      $signed(reg11)})));
            end
        end
      if ((|(reg18 ? ({reg12} << wire8[(2'h2):(2'h2)]) : (^~(-(~&reg14))))))
        begin
          reg70 <= ((reg17[(2'h3):(1'h0)] >> ({$signed(reg17)} ?
                  ((reg11 ?
                      wire49 : (8'hb7)) != reg65[(3'h4):(2'h2)]) : (|reg68[(1'h1):(1'h0)]))) ?
              (8'ha2) : wire6[(4'h9):(2'h2)]);
        end
      else
        begin
          reg70 <= ((($unsigned((~&wire6)) ? {reg15} : $signed((~reg14))) ?
              reg63[(2'h3):(1'h1)] : (~|$signed($unsigned((8'ha5))))) >> ((reg19[(2'h2):(1'h0)] ?
                  $unsigned({wire20}) : {$signed(wire46),
                      (wire7 ? wire48 : reg70)}) ?
              wire20 : $unsigned(reg66[(3'h5):(2'h3)])));
          reg71 <= $signed((reg65 ?
              reg69[(3'h4):(2'h2)] : (((|(8'hb6)) ?
                      $signed(reg15) : ((8'ha0) ? wire49 : reg64)) ?
                  {(wire20 ? reg13 : reg17)} : ((reg13 ? wire6 : reg17) ?
                      (-wire46) : ((8'ha8) ? reg69 : wire5)))));
        end
      reg72 <= ((reg14[(2'h2):(1'h1)] - (wire8[(4'ha):(1'h1)] ?
              $signed($signed(wire5)) : (((8'hae) != reg69) ?
                  $unsigned(reg65) : reg18[(3'h5):(1'h1)]))) ?
          wire7[(4'ha):(4'ha)] : (8'hb8));
    end
  module73 #() modinst112 (.y(wire111), .wire77(reg69), .wire76(reg65), .clk(clk), .wire74(reg71), .wire75(reg72));
  assign wire113 = (8'ha0);
  assign wire114 = reg17;
endmodule

module module73
#(parameter param110 = (!(8'hb2)))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire77;
  input wire [(3'h7):(1'h0)] wire76;
  input wire signed [(3'h5):(1'h0)] wire75;
  input wire [(5'h14):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg78 <= $unsigned(wire74);
      reg79 <= wire74;
      reg80 <= (-$unsigned($signed((~&(8'ha8)))));
      if (reg78[(4'h9):(3'h4)])
        begin
          reg81 <= $signed(((((8'hae) ?
                  (wire77 ^~ wire76) : (wire75 << (8'h9f))) * $unsigned((reg80 ?
                  wire77 : wire76))) ?
              {$signed(((8'ha8) ? (8'h9c) : wire77)),
                  {$unsigned((8'ha1))}} : wire75));
          reg82 <= (reg79 ?
              {($unsigned({reg81}) ?
                      (+$signed(wire75)) : ($unsigned(reg80) ~^ $unsigned(wire76)))} : $unsigned((^~$unsigned((8'ha8)))));
          reg83 <= wire77;
          reg84 <= reg78;
          reg85 <= $unsigned($signed((~^reg80)));
        end
      else
        begin
          reg81 <= wire76[(2'h3):(2'h3)];
          reg82 <= reg79;
        end
      reg86 <= (reg84[(3'h5):(3'h5)] ?
          (8'hb7) : (wire75[(3'h5):(3'h5)] ?
              (|reg78[(3'h5):(3'h5)]) : ((8'had) ?
                  reg82[(4'h8):(3'h7)] : (^~(reg83 ? reg81 : reg78)))));
    end
  assign wire87 = ({$unsigned(wire74),
                          ((-$signed(wire74)) ?
                              $unsigned($unsigned((8'h9f))) : ((wire76 ?
                                  wire75 : reg84) ^~ reg81[(3'h4):(3'h4)]))} ?
                      reg80[(2'h3):(1'h1)] : ({reg83,
                          ((^~reg85) ?
                              ((8'hba) - reg86) : {wire77,
                                  wire77})} >> ((wire74[(5'h11):(3'h6)] != $unsigned(wire76)) ?
                          $signed($signed(reg83)) : ({reg78} & reg85))));
  assign wire88 = $unsigned(reg86);
  assign wire89 = (8'ha0);
  assign wire90 = (&(~^(8'ha8)));
  assign wire91 = {$unsigned(wire76[(3'h4):(2'h3)])};
  always
    @(posedge clk) begin
      reg92 <= $signed((!($signed(reg82) ? reg78 : wire90)));
      reg93 <= ((reg84 ?
              $signed($unsigned((wire77 << reg84))) : (!reg82[(4'he):(4'h8)])) ?
          $unsigned((^((reg82 ~^ wire75) ? wire77 : reg82))) : reg86);
      reg94 <= {(8'ha4), ({{$signed(reg82)}} | (~&{wire77, wire77}))};
      reg95 <= {$signed($signed(reg82[(3'h5):(2'h3)]))};
    end
  always
    @(posedge clk) begin
      reg96 <= ($unsigned($unsigned(wire87[(1'h0):(1'h0)])) ?
          (({(~|wire90)} <= reg93) ?
              (8'h9d) : (wire76 <<< $unsigned($signed(reg93)))) : ((~&wire91) == (|((wire74 ?
              wire76 : wire88) != {wire87}))));
      reg97 <= $signed($unsigned($unsigned(reg79)));
      reg98 <= $signed({$unsigned((wire75 <<< $signed(wire76))),
          $signed(reg94)});
      if (reg84)
        begin
          reg99 <= reg93[(5'h10):(4'hf)];
        end
      else
        begin
          reg99 <= (+(^~reg93));
          if ($unsigned($signed((((wire89 ? (8'hb5) : reg94) ?
                  $signed(reg99) : (wire91 ? reg85 : reg96)) ?
              ((wire88 - wire88) ?
                  (wire74 >= reg82) : wire76) : ($signed(reg86) ?
                  (wire91 ? (8'hb5) : reg86) : $unsigned((8'h9f)))))))
            begin
              reg100 <= ({{(reg78[(5'h12):(4'hd)] ?
                              (8'hb5) : wire87[(4'h8):(1'h0)])},
                      reg83} ?
                  $signed((!$signed({(8'hb6), (8'hab)}))) : {(reg98 & wire89)});
              reg101 <= reg98;
              reg102 <= wire87;
            end
          else
            begin
              reg100 <= $signed(($unsigned(($unsigned(reg83) > (wire75 ~^ reg98))) - (8'ha9)));
              reg101 <= reg81;
              reg102 <= wire89;
              reg103 <= $signed(reg83);
              reg104 <= reg81;
            end
          if ($signed(reg81[(2'h2):(1'h0)]))
            begin
              reg105 <= wire90[(4'hb):(4'h8)];
              reg106 <= $unsigned(reg78[(3'h5):(1'h1)]);
              reg107 <= ($signed(wire74) ?
                  ($unsigned((|((8'hb1) ? (8'h9f) : reg98))) ?
                      wire89[(4'hf):(3'h6)] : $unsigned(((wire77 ?
                              reg99 : wire87) ?
                          reg81[(3'h5):(3'h5)] : reg106))) : (8'hbf));
            end
          else
            begin
              reg105 <= {{reg79},
                  $signed(((^~$signed(reg81)) ^~ $unsigned((~|reg92))))};
            end
        end
      if (($signed((reg97 & $signed((reg80 ?
          (8'haf) : reg92)))) + ({{(~|reg84)},
          ((&reg102) - $unsigned(reg93))} <<< reg97[(4'h8):(3'h5)])))
        begin
          reg108 <= ((8'hb3) ?
              $signed((^$unsigned((reg85 + reg104)))) : (-(&$unsigned($unsigned(reg105)))));
          reg109 <= (($unsigned(($unsigned(reg103) || $unsigned(wire74))) & wire87) ?
              $unsigned((8'hbc)) : ((reg78 ?
                      (wire74[(4'h9):(1'h0)] * ((8'hba) ?
                          (8'h9d) : reg86)) : $unsigned(reg82[(3'h6):(3'h6)])) ?
                  (!wire87) : (&(8'ha8))));
        end
      else
        begin
          reg108 <= $signed(reg103);
          reg109 <= $signed((reg92 >>> ($signed((-(8'hb1))) + (|(wire87 ?
              reg84 : wire75)))));
        end
    end
endmodule

module module50
#(parameter param60 = ((((~^((8'hb0) * (8'hae))) > (((8'h9c) ? (8'h9f) : (8'hb1)) ? (^~(8'h9f)) : ((8'ha2) ? (8'hb2) : (8'hb7)))) != ({((8'ha4) || (8'h9c)), ((8'hb6) ? (8'hb7) : (8'ha9))} ^~ ((7'h42) ? ((7'h42) ^~ (8'hb4)) : ((8'ha7) <<< (8'ha9))))) > (((((8'hbc) ? (8'hb8) : (8'hbb)) <= (|(8'hbd))) ? ({(8'h9f), (8'hb1)} ? ((8'ha8) - (8'hae)) : ((8'had) || (8'hae))) : (8'h9c)) ? {((~^(7'h40)) >= ((8'hb6) && (8'ha7)))} : ((((8'hb5) << (8'haa)) ^~ ((8'hac) ~^ (7'h40))) ? (((8'hb5) ? (8'hb4) : (7'h40)) || (~(8'hb4))) : (8'hb0)))))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire signed [(4'he):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire [(4'hc):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  assign y = {wire59, wire58, wire56, wire55, reg57, (1'h0)};
  assign wire55 = (wire54[(2'h3):(2'h2)] >= (wire53 ?
                      $signed(wire54[(1'h1):(1'h0)]) : wire51[(3'h7):(3'h7)]));
  assign wire56 = $unsigned($unsigned(wire53));
  always
    @(posedge clk) begin
      reg57 <= wire53[(4'h9):(3'h7)];
    end
  assign wire58 = wire52;
  assign wire59 = $signed($signed({$unsigned(((7'h43) - wire55))}));
endmodule

module module21
#(parameter param44 = ((((((8'hb8) * (8'ha9)) ? {(8'hba)} : (^(8'hb1))) ? ((!(8'hb6)) ? (&(8'had)) : ((8'h9d) ? (7'h43) : (8'ha4))) : ({(8'hb6), (8'hb1)} >= ((8'ha7) ? (8'ha5) : (8'hb2)))) ? ((+(8'hb5)) ? (((7'h44) ? (8'ha2) : (8'haf)) < (^~(8'ha9))) : ((~^(8'ha3)) ? ((8'ha4) && (8'hb4)) : (~(8'hbb)))) : ((~&(~^(8'hba))) ^ ({(8'hae), (8'hac)} ? {(7'h42), (8'ha0)} : ((8'hb2) || (8'h9e))))) ? ((!(!((8'h9c) ? (8'hbb) : (8'hb2)))) <<< (~&((+(8'h9e)) - (~|(8'h9e))))) : {((^~(&(8'ha7))) ? (((8'hb7) << (8'h9e)) ^ {(8'hab)}) : (~(^~(8'hac))))}), 
parameter param45 = ((+((~&{param44, param44}) ? (^(param44 < param44)) : (param44 <= (param44 ? param44 : param44)))) & {((~|(param44 ? param44 : param44)) ^~ (8'hb5))}))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire26 = (((8'hb8) ^ (wire22[(2'h2):(1'h1)] ?
                          (wire25[(4'ha):(2'h2)] ?
                              (wire24 ?
                                  wire22 : wire23) : wire25[(1'h1):(1'h1)]) : (8'ha6))) ?
                      $signed(wire23[(3'h5):(2'h2)]) : {(wire23 >> (~(wire25 ?
                              wire22 : wire24)))});
  assign wire27 = (8'h9d);
  assign wire28 = (+((!wire24[(1'h1):(1'h1)]) * (~&(~|(wire27 ?
                      wire22 : (8'h9c))))));
  assign wire29 = $unsigned(({{wire27, wire27},
                      (wire24[(3'h5):(1'h1)] + (wire26 >>> (8'hb9)))} ~^ {(8'hbb),
                      wire28[(4'h8):(2'h3)]}));
  assign wire30 = (wire24[(1'h1):(1'h1)] ?
                      {$unsigned(wire29[(4'hf):(3'h6)]),
                          $unsigned($signed((wire25 <<< wire22)))} : ((({wire24,
                              wire24} | (wire25 ? wire23 : (8'hbe))) ?
                          (((7'h40) >>> (8'hb3)) ?
                              wire22 : (wire29 | wire25)) : (-(-wire27))) ^ wire28[(1'h1):(1'h0)]));
  assign wire31 = $signed((!$signed(wire24)));
  assign wire32 = (wire22 <= wire25[(4'h8):(2'h3)]);
  assign wire33 = {$signed(($signed((wire32 - wire24)) ?
                          $signed($signed(wire29)) : wire25[(3'h7):(1'h0)]))};
  assign wire34 = wire28[(5'h12):(4'hc)];
  assign wire35 = wire31;
  assign wire36 = {(8'hac)};
  always
    @(posedge clk) begin
      reg37 <= wire27[(2'h3):(2'h2)];
      reg38 <= $signed((8'hbe));
    end
  always
    @(posedge clk) begin
      reg39 <= reg38[(3'h4):(2'h2)];
      reg40 <= (~(wire26[(2'h2):(1'h0)] ^~ ($unsigned($unsigned((8'hac))) || {{wire22}})));
      reg41 <= ($unsigned((wire25[(3'h5):(3'h5)] >> {(reg37 << wire29),
              ((8'haa) ? wire26 : reg38)})) ?
          (((~^$signed(reg38)) ? $signed({(8'hbe)}) : wire27[(2'h2):(1'h0)]) ?
              ($unsigned($signed(reg40)) ?
                  $unsigned($signed(wire28)) : (reg39[(2'h3):(1'h1)] >>> $signed(reg40))) : reg40[(1'h0):(1'h0)]) : ((&(wire31[(1'h1):(1'h0)] <<< (~(8'hb4)))) * ({(wire33 ?
                  wire25 : wire22)} >> $unsigned({(8'h9f)}))));
      reg42 <= {($signed({wire26[(1'h0):(1'h0)]}) ?
              (~|wire23[(3'h5):(1'h1)]) : $unsigned(wire30[(3'h4):(1'h1)]))};
      reg43 <= $signed($unsigned((8'hb0)));
    end
endmodule
