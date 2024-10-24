module top
#(parameter param180 = (+(~^(({(8'haf), (8'ha7)} ? (!(8'h9d)) : ((8'hb7) ? (8'ha8) : (8'hb5))) - (8'ha5)))), 
parameter param181 = param180)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire176;
  wire signed [(4'he):(1'h0)] wire175;
  wire signed [(3'h5):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire173;
  wire signed [(4'he):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire171;
  wire signed [(3'h6):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire166;
  wire signed [(5'h10):(1'h0)] wire167;
  wire signed [(5'h13):(1'h0)] wire168;
  reg signed [(5'h10):(1'h0)] reg177 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire5,
                 wire80,
                 wire82,
                 wire83,
                 wire162,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 reg177,
                 (1'h0)};
  assign wire5 = ((wire2[(3'h5):(2'h3)] >> (|wire2)) + wire4[(3'h6):(1'h1)]);
  module6 #() modinst81 (wire80, clk, wire3, wire2, wire0, wire5);
  assign wire82 = $signed(((($unsigned(wire0) >>> (~wire2)) ?
                          (wire5 ?
                              (wire80 ?
                                  wire2 : wire4) : wire5) : ((~|wire0) <<< (~wire1))) ?
                      $signed(wire3) : wire5[(1'h0):(1'h0)]));
  assign wire83 = (((7'h41) ~^ $signed($signed(wire2[(4'hf):(3'h6)]))) & $unsigned((wire0 << (&(wire82 ?
                      wire82 : wire0)))));
  module84 #() modinst163 (.wire88(wire82), .y(wire162), .wire85(wire5), .wire86(wire4), .wire87(wire2), .clk(clk));
  assign wire164 = ($signed((wire83[(3'h5):(3'h4)] != (wire1 ?
                           (wire5 <= wire3) : (wire83 ? wire83 : wire4)))) ?
                       (~&wire80) : wire82);
  assign wire165 = wire164;
  assign wire166 = $signed(((wire2 ?
                       (~wire83) : $signed((wire162 ?
                           wire0 : wire80))) == $signed($signed(wire162))));
  assign wire167 = (wire4 ?
                       {(((8'ha2) << wire1) & {(~^wire1)}),
                           $unsigned($unsigned($unsigned((8'ha3))))} : wire5);
  module112 #() modinst169 (.wire113(wire1), .y(wire168), .wire114(wire0), .wire116(wire162), .clk(clk), .wire117(wire2), .wire115(wire166));
  assign wire170 = $signed($unsigned(($unsigned($unsigned(wire2)) ?
                       $signed($signed(wire4)) : wire0[(4'ha):(4'ha)])));
  assign wire171 = ((wire83 > wire4[(1'h0):(1'h0)]) ?
                       $unsigned(wire167[(4'hd):(1'h0)]) : $unsigned($signed((wire166[(3'h4):(2'h2)] & (wire80 ?
                           (7'h43) : wire166)))));
  assign wire172 = {{wire167, $signed($unsigned((^~wire162)))}, (~|(8'haf))};
  assign wire173 = (!wire3[(3'h4):(2'h2)]);
  assign wire174 = $signed((wire171[(2'h3):(1'h1)] && ((^(wire1 <= wire2)) < wire83)));
  assign wire175 = $unsigned(wire83[(4'ha):(2'h3)]);
  assign wire176 = {((wire82[(4'ha):(3'h7)] ?
                           wire3 : $signed($signed(wire82))) <= wire3),
                       (8'hac)};
  always
    @(posedge clk) begin
      reg177 <= wire162;
    end
  assign wire178 = {(({(~|wire172),
                               $signed(wire167)} << $unsigned($signed(wire4))) ?
                           (($signed(wire83) << (wire171 ?
                               wire83 : wire80)) <= wire83[(5'h10):(1'h0)]) : $signed(($unsigned(wire172) <= $signed(wire83))))};
  assign wire179 = ({$signed({(wire173 + wire4), {(8'h9f), wire162}}),
                           ($signed($unsigned((8'hb8))) ?
                               wire4[(4'hd):(4'hb)] : ($unsigned((8'hb1)) ^~ ((7'h41) || wire2)))} ?
                       ($unsigned(wire174) > (|wire166[(2'h3):(2'h3)])) : ((~&(~^wire172[(4'hc):(1'h1)])) >>> wire2));
endmodule

module module84
#(parameter param160 = (~({(((8'hb0) ? (8'hbd) : (8'hbc)) | {(8'ha4)}), ((~|(8'hb6)) < (!(8'hac)))} ? {({(8'ha9)} ^ {(8'hb3), (7'h44)}), (8'ha9)} : (8'hba))), 
parameter param161 = ((!(((param160 ? (8'h9f) : param160) && param160) ? ((!(7'h40)) ? param160 : (param160 == param160)) : {param160, (param160 <<< param160)})) <<< (^~param160)))
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire88;
  input wire [(4'hc):(1'h0)] wire87;
  input wire signed [(3'h4):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  assign y = {wire158,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 (1'h0)};
  assign wire89 = (wire85[(5'h13):(2'h2)] == wire86);
  assign wire90 = ((~&$unsigned({wire86[(2'h3):(1'h1)],
                      (wire87 ? wire85 : wire88)})) >= (+(-(8'ha3))));
  assign wire91 = (!wire88[(1'h1):(1'h1)]);
  assign wire92 = $signed(({wire87[(2'h2):(1'h1)], (~^{wire89, (8'ha4)})} ?
                      wire86[(2'h3):(2'h3)] : (wire90 ?
                          $signed(wire91[(1'h1):(1'h0)]) : wire88[(3'h4):(3'h4)])));
  assign wire93 = (|$unsigned($unsigned($unsigned((~|wire92)))));
  assign wire94 = ($unsigned({$signed((^wire90))}) ?
                      ($unsigned(($unsigned(wire85) != (wire93 ?
                          wire90 : wire91))) ^ {{wire92[(3'h6):(1'h1)]}}) : ({wire85[(4'h9):(2'h2)]} ?
                          $unsigned(wire88) : ((wire93 == (|wire89)) & (wire92[(1'h0):(1'h0)] ?
                              (wire91 << wire91) : (8'hb8)))));
  assign wire95 = (!wire90[(4'hd):(3'h6)]);
  assign wire96 = $unsigned($signed(($unsigned((wire93 ?
                      wire93 : wire91)) > $signed(wire88[(3'h6):(2'h2)]))));
  assign wire97 = $signed((({$unsigned(wire93),
                      wire90} >>> $unsigned(wire96[(2'h3):(2'h3)])) >> ($unsigned($signed(wire87)) ?
                      ((wire90 ? (8'hba) : (8'h9f)) << (~&wire86)) : wire86)));
  assign wire98 = ($unsigned((wire90[(3'h5):(1'h0)] || $signed((wire90 >= wire96)))) ?
                      wire97[(3'h6):(2'h2)] : $unsigned(wire85[(5'h13):(4'hf)]));
  always
    @(posedge clk) begin
      reg99 <= wire88;
      if ($unsigned($unsigned(wire86)))
        begin
          reg100 <= (^~(^wire88));
          reg101 <= $unsigned((+(wire93[(1'h1):(1'h0)] ?
              (~^(!reg99)) : wire87[(4'ha):(3'h6)])));
          reg102 <= (^reg100);
          reg103 <= wire94;
          reg104 <= (~^wire97[(3'h6):(1'h1)]);
        end
      else
        begin
          if ((!wire91))
            begin
              reg100 <= ($signed(wire91[(3'h6):(3'h6)]) ?
                  (wire97[(3'h6):(1'h1)] | wire90) : (&wire97[(2'h2):(2'h2)]));
              reg101 <= (+((~^{wire96, ((8'hbf) ? (8'hb4) : reg104)}) ?
                  ((&reg101[(3'h6):(1'h1)]) << ((~|(8'hb0)) ?
                      wire93 : (wire92 ~^ wire87))) : (wire92 ?
                      reg101[(1'h0):(1'h0)] : $signed((reg99 > reg103)))));
              reg102 <= ($signed($unsigned($unsigned($unsigned(reg99)))) ?
                  wire91[(1'h0):(1'h0)] : $unsigned({{{(8'had)}}}));
              reg103 <= wire88;
            end
          else
            begin
              reg100 <= ((reg100[(1'h0):(1'h0)] ?
                      (&((reg100 ?
                          reg103 : wire87) ^~ wire91[(2'h2):(2'h2)])) : $unsigned($unsigned((-(8'ha9))))) ?
                  wire85[(4'h9):(3'h6)] : $signed($unsigned($signed({wire86}))));
              reg101 <= reg104[(2'h2):(1'h0)];
              reg102 <= (+$unsigned(reg102[(3'h5):(1'h0)]));
            end
        end
      reg105 <= {$signed(($unsigned((~^(8'ha6))) + $signed($unsigned((8'hbd))))),
          (($signed((reg100 ?
              wire96 : reg102)) == wire86[(1'h0):(1'h0)]) <= ((((8'haa) ?
                  wire94 : wire88) ?
              reg104 : (wire87 <= reg99)) < ((reg103 == reg102) ?
              reg99 : (wire90 ^ wire96))))};
      reg106 <= (7'h40);
      reg107 <= $signed((reg99[(1'h0):(1'h0)] ?
          (|($signed(wire95) ?
              $signed(reg105) : (-wire87))) : $unsigned(reg103[(4'h8):(3'h5)])));
    end
  assign wire108 = wire89[(1'h0):(1'h0)];
  assign wire109 = (+(^wire97[(4'h9):(1'h1)]));
  assign wire110 = $unsigned(((8'haa) > $signed({wire94,
                       wire91[(1'h0):(1'h0)]})));
  assign wire111 = $signed((~(8'hac)));
  module112 #() modinst159 (.wire116(reg106), .wire117(reg99), .clk(clk), .wire113(reg103), .wire115(wire93), .y(wire158), .wire114(wire95));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire74;
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire11,
                 wire12,
                 wire13,
                 wire18,
                 wire19,
                 wire20,
                 wire40,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire49,
                 wire50,
                 wire61,
                 wire74,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg46,
                 reg47,
                 reg48,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  assign wire11 = ($unsigned($signed((-(wire9 ?
                      (7'h43) : (8'hb4))))) == wire7[(5'h15):(4'h8)]);
  assign wire12 = wire7[(4'hf):(2'h2)];
  assign wire13 = ($signed({{(wire8 && wire11)}}) | $signed((~(^~(wire12 >>> wire7)))));
  always
    @(posedge clk) begin
      if (wire8)
        begin
          reg14 <= (($unsigned((&(wire7 ? wire8 : wire13))) ?
              wire11 : $unsigned($signed($signed(wire9)))) <<< (wire10[(5'h11):(4'hb)] ?
              ((wire9 ? wire11 : wire9) << ({wire7, wire11} ?
                  wire12 : (wire8 ? wire10 : wire8))) : {$signed((wire13 ?
                      wire12 : wire13))}));
          reg15 <= wire9[(2'h2):(1'h0)];
          reg16 <= wire12[(4'h8):(1'h1)];
        end
      else
        begin
          reg14 <= $unsigned($signed($unsigned((wire7 & (+reg15)))));
        end
      reg17 <= $signed((!(&$signed((wire12 ? (8'ha2) : wire10)))));
    end
  assign wire18 = $signed((~&wire13));
  assign wire19 = $signed($unsigned(wire8));
  assign wire20 = (-{$signed($signed((reg14 ? (8'had) : reg14)))});
  module21 #() modinst41 (wire40, clk, wire13, wire18, reg17, reg14);
  assign wire42 = wire10;
  assign wire43 = wire19[(2'h3):(2'h2)];
  assign wire44 = wire13[(4'hb):(2'h2)];
  assign wire45 = (|wire40[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg46 <= $signed($signed(reg16));
      reg47 <= (((|wire8) ?
              ((~&(wire43 + (8'hbb))) ?
                  ($signed(reg14) ?
                      $signed(wire43) : $signed(reg46)) : wire19) : $unsigned($unsigned(wire20))) ?
          ($signed((wire10 ? ((8'hb1) ? wire42 : wire43) : {wire42, wire18})) ?
              $signed({reg14[(4'h8):(2'h3)], (^~reg16)}) : (reg14 ?
                  wire11 : wire20[(1'h1):(1'h0)])) : (wire40 * $signed(reg16[(2'h3):(1'h1)])));
      reg48 <= ((wire9 & (|($unsigned((8'haa)) + (wire11 ? wire9 : wire44)))) ?
          {$unsigned($signed((-wire44))),
              ($unsigned($signed((8'ha1))) ?
                  (7'h41) : ((~reg15) & {reg46}))} : $signed((&((wire10 ?
              wire10 : reg16) <= wire43[(2'h2):(2'h2)]))));
    end
  assign wire49 = $unsigned(reg15[(3'h5):(2'h3)]);
  assign wire50 = wire18;
  always
    @(posedge clk) begin
      reg51 <= {wire20[(4'he):(4'he)]};
      reg52 <= $unsigned(wire13);
      if (wire44[(4'h8):(1'h0)])
        begin
          reg53 <= (&$unsigned(($unsigned(wire42) ? wire13 : (~wire50))));
          reg54 <= {(+({(8'hb9),
                  ((8'hbb) ? reg53 : wire19)} > (wire40 - (reg47 ?
                  wire45 : reg53)))),
              reg47[(4'hb):(4'ha)]};
          if ($signed(((reg53[(4'ha):(3'h4)] << $unsigned(wire18[(2'h2):(1'h0)])) >= (reg52[(5'h11):(4'h8)] ?
              {wire12, (reg16 ? reg15 : wire20)} : ($unsigned(wire50) ?
                  $signed(reg48) : {wire10, wire50})))))
            begin
              reg55 <= (($unsigned(reg48) >= {reg15[(5'h12):(4'h9)],
                      $unsigned(wire20[(3'h5):(3'h4)])}) ?
                  $signed(wire11) : (8'hbe));
              reg56 <= ((wire49[(3'h6):(1'h1)] ? (~&wire43) : (8'hb5)) ?
                  ((((wire11 < wire9) >>> wire9[(1'h0):(1'h0)]) + wire8[(2'h3):(2'h3)]) ?
                      (((reg53 ^ wire8) ?
                          $unsigned(wire49) : $signed((8'hab))) != ((reg54 | wire11) ?
                          wire50 : {reg17, wire10})) : (($unsigned(wire42) ?
                              reg55 : (reg53 ? wire42 : reg16)) ?
                          (~|wire9) : (reg15[(5'h10):(4'h9)] >= (!reg55)))) : (~$unsigned($signed((reg53 * wire12)))));
              reg57 <= $signed($signed({$signed((reg56 <<< wire45))}));
              reg58 <= (wire45 ?
                  wire7 : $unsigned((~^{(wire45 ? reg55 : (8'hb2))})));
              reg59 <= wire44[(3'h6):(3'h6)];
            end
          else
            begin
              reg55 <= ($signed(($signed((~^(8'h9d))) ?
                  $signed(reg52[(5'h13):(3'h6)]) : $signed($unsigned(wire40)))) | ((~&reg51[(4'hc):(3'h5)]) ~^ wire20));
              reg56 <= wire13;
              reg57 <= wire9[(2'h2):(1'h1)];
              reg58 <= $signed({reg52});
              reg59 <= $signed((8'hb5));
            end
          reg60 <= $signed(reg15[(2'h3):(2'h3)]);
        end
      else
        begin
          reg53 <= (reg48 ?
              $signed($signed(wire43[(3'h5):(2'h2)])) : ((~^$unsigned($signed(reg53))) * $unsigned(((reg48 ?
                  reg16 : (8'ha8)) >> $signed(wire42)))));
          reg54 <= $signed((reg48[(1'h1):(1'h0)] || {(wire43 >>> reg51),
              $unsigned($signed(reg14))}));
          if ({$unsigned((~((reg48 ? reg52 : reg53) >> $signed(reg14)))),
              reg55[(5'h13):(4'hc)]})
            begin
              reg55 <= reg54;
              reg56 <= reg48[(2'h2):(2'h2)];
              reg57 <= ((~^(reg55 == wire7[(4'h9):(2'h3)])) < reg54[(1'h1):(1'h1)]);
            end
          else
            begin
              reg55 <= $signed(reg15);
            end
        end
    end
  assign wire61 = (($signed(reg14[(5'h10):(4'he)]) != $signed({$signed((7'h43)),
                      $signed(wire45)})) + ($signed(wire43[(3'h5):(1'h1)]) ^~ $signed($unsigned(reg47))));
  module62 #() modinst75 (wire74, clk, wire42, reg53, reg58, reg60);
  assign wire76 = (({($signed(wire45) ?
                              (wire19 && wire12) : wire13)} >= $signed(($unsigned(reg60) ?
                          (~&reg15) : ((8'hac) - reg58)))) ?
                      (($unsigned((wire44 * reg47)) >>> ((wire61 ?
                                  wire42 : reg15) ?
                              $unsigned(wire45) : (reg60 ? wire10 : (8'hb9)))) ?
                          $signed($signed($unsigned(reg16))) : $unsigned($unsigned($signed((8'hb9))))) : $signed($unsigned(wire13)));
  assign wire77 = $signed($unsigned($signed(((^wire43) > wire43[(1'h0):(1'h0)]))));
  assign wire78 = wire44[(3'h7):(3'h4)];
  assign wire79 = (|(+$signed(((reg52 ?
                      wire10 : reg47) <= $unsigned(wire11)))));
endmodule

module module62
#(parameter param73 = (((((&(8'hb5)) < ((8'hac) > (8'h9f))) ? ({(8'ha5)} & (+(7'h40))) : ((8'ha9) + ((7'h44) ? (7'h43) : (8'haf)))) & ((((8'h9c) << (8'hb3)) ? (~(8'hba)) : {(8'hab), (8'hbb)}) ? (((8'h9e) ? (8'hb2) : (8'ha1)) != (~^(8'hb6))) : {(~&(7'h40))})) <= (&{(((8'hb3) <<< (8'ha8)) >> ((8'ha2) ? (8'ha9) : (7'h42))), ({(7'h42), (8'hb1)} * ((8'ha4) & (8'hb5)))})))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire66;
  input wire signed [(5'h12):(1'h0)] wire65;
  input wire signed [(2'h3):(1'h0)] wire64;
  input wire signed [(2'h2):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  assign y = {wire72, wire71, wire70, wire69, wire68, wire67, (1'h0)};
  assign wire67 = (({$unsigned((^~wire65)),
                      wire64} + wire65) <<< $unsigned(wire65));
  assign wire68 = wire66[(1'h0):(1'h0)];
  assign wire69 = wire66[(3'h4):(2'h3)];
  assign wire70 = wire64;
  assign wire71 = $signed((wire63 << wire68));
  assign wire72 = wire71;
endmodule

module module21
#(parameter param38 = (((~^(-(~(8'haa)))) + {(((8'haa) | (8'ha6)) ? ((8'hb8) ? (8'hbf) : (8'hb1)) : ((8'haa) ? (8'hbd) : (8'hb9))), (~((8'ha3) ^ (8'hb1)))}) ? ((((^~(8'hba)) * {(8'hb3)}) <<< {(&(8'hb0)), ((8'ha0) & (8'hb4))}) ? ((~^((8'hab) ? (8'hb1) : (7'h41))) ? (^(|(8'ha8))) : (((8'had) == (8'hbd)) ^~ ((7'h41) ? (8'hbb) : (8'h9c)))) : (~|(((8'hb6) != (8'hbb)) >= {(8'ha1), (7'h42)}))) : (~|((^~((8'h9c) - (8'hb6))) ? (!{(8'ha4), (8'had)}) : ({(8'ha6)} != {(8'ha2), (7'h41)})))), 
parameter param39 = (((param38 ? (param38 >>> (param38 ? param38 : param38)) : ((param38 <<< (8'hb7)) >= (8'hb6))) ? (param38 >> ((param38 ? param38 : param38) > {param38})) : ((8'hb6) ? param38 : ((param38 <= param38) ? (~param38) : param38))) && (((+(param38 ? param38 : param38)) ? (|(|param38)) : {(-param38)}) ? ((param38 ? {param38, (8'hbb)} : (param38 ? (8'haf) : param38)) ? (!(&param38)) : ((&param38) >>> {param38, param38})) : (+{(param38 || param38), param38}))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire [(5'h15):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  assign y = {wire37,
                 wire36,
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
                 (1'h0)};
  assign wire26 = wire25;
  assign wire27 = ({wire25, wire26[(3'h5):(2'h3)]} ?
                      ((({wire22} ? wire24 : wire24[(1'h1):(1'h1)]) ?
                          (wire25 ?
                              (|wire25) : $signed(wire22)) : $unsigned(wire24)) & $signed(({wire24} ?
                          wire23 : $signed(wire22)))) : $signed(wire24));
  assign wire28 = (|(wire26 ?
                      {{(wire24 ? wire22 : wire23)}} : {$signed((wire26 ?
                              wire25 : wire27)),
                          wire24}));
  assign wire29 = wire27;
  assign wire30 = wire27;
  assign wire31 = wire29;
  assign wire32 = ((~|(-$unsigned((wire23 ? wire31 : wire26)))) ?
                      (wire25[(4'h8):(1'h0)] || $signed((!(wire31 ?
                          wire25 : wire25)))) : wire27);
  assign wire33 = wire32;
  assign wire34 = (|wire25[(3'h6):(1'h0)]);
  assign wire35 = $unsigned((^~wire22));
  assign wire36 = wire31;
  assign wire37 = (wire36 >>> (+wire25[(3'h7):(1'h0)]));
endmodule

module module112
#(parameter param157 = (!(((((8'ha7) ? (8'ha0) : (8'hb6)) && ((8'h9c) == (8'ha6))) >> {((8'hac) ? (8'hab) : (8'ha8))}) != (!{((8'ha8) ? (8'hbd) : (8'hb2))}))))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire117;
  input wire signed [(4'ha):(1'h0)] wire116;
  input wire [(4'h9):(1'h0)] wire115;
  input wire [(2'h3):(1'h0)] wire114;
  input wire signed [(4'h9):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire135,
                 wire134,
                 wire133,
                 wire120,
                 wire119,
                 wire118,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire118 = {(^~{wire117, (~^$signed(wire115))})};
  assign wire119 = $signed(wire117[(1'h1):(1'h1)]);
  assign wire120 = ($signed((($signed(wire116) ?
                       (^(8'had)) : $signed(wire115)) > (wire117[(5'h11):(3'h6)] ?
                       (wire117 > wire113) : (wire115 << wire117)))) >>> {$unsigned((wire119 && (wire118 ?
                           wire119 : wire114))),
                       ($unsigned($signed(wire114)) != $signed((|wire118)))});
  always
    @(posedge clk) begin
      if ((wire115[(4'h8):(3'h5)] ? wire118[(4'h8):(1'h0)] : {(~^(~&wire117))}))
        begin
          reg121 <= ($signed($signed($unsigned(wire120[(3'h5):(1'h0)]))) << ($unsigned((+(!wire118))) ~^ $signed(((wire116 & wire120) != (wire115 ?
              wire114 : wire114)))));
          if ($signed(wire114[(2'h2):(1'h0)]))
            begin
              reg122 <= reg121;
              reg123 <= $signed(wire118[(2'h2):(1'h1)]);
              reg124 <= wire113;
            end
          else
            begin
              reg122 <= wire114;
            end
          reg125 <= $unsigned(wire116[(3'h7):(3'h6)]);
          if (wire113)
            begin
              reg126 <= reg122;
              reg127 <= reg123[(4'ha):(1'h0)];
              reg128 <= $signed($unsigned($signed($unsigned($unsigned(wire118)))));
            end
          else
            begin
              reg126 <= $unsigned($signed(({(reg121 * wire113)} ?
                  ((~(8'h9c)) ? wire114 : reg126) : $unsigned((wire120 ?
                      wire116 : wire118)))));
              reg127 <= wire118;
            end
          if (($unsigned((~^(~|wire119))) && ($signed($unsigned((~reg124))) ?
              (^~(wire118[(3'h6):(1'h0)] ?
                  {(8'h9d)} : (reg122 ?
                      reg123 : reg122))) : (reg127[(2'h3):(1'h0)] ?
                  (7'h41) : (wire116 ?
                      (reg127 ? wire116 : (8'ha5)) : ((8'hbb) ?
                          reg122 : wire118))))))
            begin
              reg129 <= (^(8'hb5));
            end
          else
            begin
              reg129 <= (~&$unsigned((~^reg124[(1'h0):(1'h0)])));
              reg130 <= wire117;
              reg131 <= $signed(((8'ha0) ?
                  ((-(reg129 ?
                      wire114 : reg123)) ~^ $unsigned($unsigned(wire114))) : $signed({(~wire119),
                      reg122[(4'ha):(4'h9)]})));
              reg132 <= (^$unsigned({((reg131 && reg124) || reg129[(1'h0):(1'h0)]),
                  (8'h9e)}));
            end
        end
      else
        begin
          if ((~^$signed(({(reg126 ? reg127 : reg122)} && (~^wire114)))))
            begin
              reg121 <= $unsigned((~|(&(reg123[(4'ha):(2'h3)] < (~^wire119)))));
              reg122 <= {(reg127 ?
                      {(((8'had) ? reg132 : wire120) ?
                              wire119 : $signed(reg126)),
                          (~^wire119[(5'h10):(4'hf)])} : wire120),
                  $unsigned((-(~|((8'hbb) ? reg125 : reg121))))};
              reg123 <= wire115;
              reg124 <= reg122[(4'ha):(4'ha)];
              reg125 <= ((reg129[(3'h4):(3'h4)] | ($unsigned($signed(reg129)) ?
                  ((reg121 * wire118) ?
                      $signed(wire116) : (&wire115)) : reg125[(4'h9):(1'h0)])) >= (((wire116[(2'h3):(2'h3)] ?
                      reg121[(3'h7):(3'h6)] : $unsigned(wire119)) + wire119[(4'h9):(1'h0)]) ?
                  wire117[(5'h13):(5'h12)] : ((~^reg128[(1'h1):(1'h0)]) ~^ $unsigned((reg123 ?
                      wire117 : (8'hbb))))));
            end
          else
            begin
              reg121 <= $signed((^~((+(reg126 ? (8'ha6) : reg130)) && reg125)));
              reg122 <= wire113;
            end
          reg126 <= {$signed($signed($unsigned({reg131, reg122}))), {reg126}};
        end
    end
  assign wire133 = ((reg127 & wire116[(1'h1):(1'h0)]) ?
                       (((((8'hac) != (8'hbe)) ?
                               (!(8'hb6)) : (wire119 ?
                                   wire117 : reg123)) ^ (8'hbb)) ?
                           (wire116[(4'h8):(3'h7)] && wire117[(3'h6):(3'h5)]) : reg123[(2'h3):(2'h3)]) : {(~^reg125),
                           ((reg130 >= {wire117}) ?
                               $signed($unsigned((8'ha3))) : (~^wire113))});
  assign wire134 = reg130;
  assign wire135 = (8'h9c);
  always
    @(posedge clk) begin
      reg136 <= (wire135 >>> (($unsigned($unsigned(reg124)) == wire118) ?
          (((reg121 <= wire115) < (wire114 ? wire117 : reg132)) ?
              $unsigned((8'ha3)) : $unsigned($unsigned(reg129))) : {{(reg125 < wire119),
                  (~&wire118)},
              (!$unsigned(wire117))}));
      reg137 <= (-reg132[(4'he):(4'h9)]);
      reg138 <= reg123;
      reg139 <= (~&reg130);
      if ((reg128 ? reg126 : $unsigned($signed(reg130[(1'h0):(1'h0)]))))
        begin
          reg140 <= reg132[(4'hf):(4'ha)];
        end
      else
        begin
          reg140 <= (wire116 ?
              reg128[(4'h8):(1'h0)] : ((!$unsigned($signed((7'h42)))) ?
                  $signed($unsigned((^reg124))) : (~&(reg127 ?
                      (wire135 + reg127) : $signed(wire133)))));
        end
    end
  assign wire141 = ((+reg139) ?
                       {((~^reg122) ? reg130 : $unsigned(reg128))} : wire119);
  assign wire142 = ({$unsigned((~(8'hb4)))} ?
                       wire133 : (~|(reg138[(4'h9):(4'h9)] == {$unsigned(reg129),
                           (reg123 || reg129)})));
  assign wire143 = (^$unsigned({(~^(reg124 ? reg125 : (8'ha5))),
                       $signed((~|reg136))}));
  always
    @(posedge clk) begin
      if (reg129[(1'h1):(1'h0)])
        begin
          reg144 <= reg137;
        end
      else
        begin
          reg144 <= $signed(wire134[(2'h3):(2'h2)]);
          reg145 <= (+(((^~{wire143}) ?
              (^~(reg129 ?
                  reg144 : (7'h41))) : reg127[(5'h11):(1'h1)]) + reg124[(3'h7):(1'h1)]));
          reg146 <= {(($unsigned((~(8'hbc))) >>> reg130[(2'h2):(2'h2)]) << {$unsigned({wire143,
                      reg124})}),
              reg137};
          reg147 <= $signed(wire119[(4'hf):(4'hd)]);
        end
      reg148 <= (($signed(wire143) ?
              ($signed((reg137 ?
                  reg137 : wire141)) > reg131) : ($signed(wire116) ?
                  reg132[(4'h8):(2'h3)] : (|reg127[(2'h3):(2'h2)]))) ?
          reg122[(4'ha):(2'h3)] : wire143[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg149 <= ({wire141} >= {{{(~reg128)}, wire116},
          (wire117[(5'h14):(2'h3)] ? wire115[(3'h6):(2'h2)] : {(~reg147)})});
      if (wire141[(2'h3):(2'h3)])
        begin
          if ($unsigned(reg137[(4'hb):(2'h3)]))
            begin
              reg150 <= $signed($signed(((+{wire118, reg145}) ?
                  (8'hb7) : $unsigned({reg145}))));
              reg151 <= $signed(reg144[(1'h0):(1'h0)]);
              reg152 <= ($unsigned(({(~reg129), $signed(reg127)} ?
                  wire133[(3'h4):(2'h3)] : (^$unsigned(reg148)))) || $signed((wire134 + ((-reg127) << (wire119 ?
                  reg139 : reg130)))));
              reg153 <= $unsigned(reg124);
            end
          else
            begin
              reg150 <= wire142;
              reg151 <= $unsigned($unsigned($signed($unsigned($signed(reg147)))));
              reg152 <= ($signed($signed($unsigned({(8'haf)}))) ?
                  ((reg123[(4'h8):(2'h2)] ?
                          (!$unsigned(reg148)) : (~$signed(reg131))) ?
                      (wire120[(3'h6):(3'h6)] <= {reg121}) : {((wire119 ?
                                  reg131 : reg130) ?
                              wire134 : (8'hb1)),
                          reg123[(1'h0):(1'h0)]}) : (~reg151[(2'h3):(2'h2)]));
              reg153 <= $unsigned((^((reg140 ? (wire119 ^ reg146) : (!reg121)) ?
                  reg132[(2'h2):(1'h1)] : ((|reg140) ~^ wire142[(3'h6):(3'h4)]))));
              reg154 <= (^~$unsigned(((reg130[(3'h4):(1'h1)] >>> reg138) >= {(+(8'hba)),
                  $unsigned(reg128)})));
            end
        end
      else
        begin
          reg150 <= reg149[(1'h0):(1'h0)];
          reg151 <= reg126[(1'h1):(1'h0)];
          reg152 <= (wire113 ?
              (reg139 + (8'hbc)) : (-($unsigned({(8'hbd)}) ?
                  reg154 : (~&reg146))));
          if (reg140[(1'h0):(1'h0)])
            begin
              reg153 <= $signed((reg123 ?
                  {reg148} : $signed($signed((!wire117)))));
              reg154 <= reg131;
            end
          else
            begin
              reg153 <= $signed((|reg138));
              reg154 <= {reg146};
              reg155 <= $unsigned(reg139[(3'h5):(2'h3)]);
              reg156 <= $unsigned((~(|$unsigned((reg136 ^~ reg149)))));
            end
        end
    end
endmodule
