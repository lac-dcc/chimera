module top
#(parameter param212 = (&(^~(((~^(8'ha1)) <= ((8'hbe) ? (8'haa) : (7'h41))) & {{(8'hb9)}}))), 
parameter param213 = (param212 ? ({{(8'hba), (^~param212)}, (param212 ? param212 : (param212 != param212))} ? (+(-{param212, param212})) : (({param212, (8'haa)} ? ((8'ha6) ? param212 : param212) : (&param212)) ? ({param212} == (param212 ? param212 : param212)) : param212)) : (^{((~param212) ? (param212 ? param212 : (8'hb4)) : (param212 || param212)), ((param212 ? param212 : param212) ? (param212 * param212) : (+param212))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire211;
  wire [(5'h14):(1'h0)] wire209;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire91;
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire211,
                 wire209,
                 wire94,
                 wire93,
                 wire4,
                 wire5,
                 wire19,
                 wire20,
                 wire91,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (~|$signed($unsigned(({wire3, wire1} > (wire2 ^~ wire0)))));
  assign wire5 = wire2[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((~|wire3))
        begin
          reg6 <= (((~|$signed(wire2[(2'h2):(1'h1)])) >>> {((8'hbd) == (|wire0))}) <<< ($unsigned($signed($unsigned((8'hb2)))) ?
              ((^((8'ha9) ? (8'ha0) : wire0)) ?
                  ((wire4 ? (8'ha1) : (8'hb5)) ?
                      (wire0 ?
                          wire2 : wire1) : $unsigned(wire5)) : wire1) : ((wire3 ?
                      $unsigned(wire2) : $unsigned(wire5)) ?
                  (~&(wire4 >>> wire5)) : wire0[(3'h6):(1'h1)])));
          reg7 <= wire1[(4'h8):(4'h8)];
          reg8 <= $signed(wire3[(1'h1):(1'h0)]);
          if ((({$unsigned(reg7[(3'h4):(2'h2)])} ^~ reg8[(1'h0):(1'h0)]) ?
              $unsigned($unsigned($unsigned(wire3))) : wire2[(1'h1):(1'h1)]))
            begin
              reg9 <= $unsigned((~^(+$signed((wire1 ? wire0 : wire0)))));
              reg10 <= $unsigned(((($unsigned(wire4) > $unsigned(reg7)) << $unsigned((!wire1))) + (wire1 << (wire3[(3'h6):(2'h3)] ?
                  $unsigned(wire2) : ((8'ha9) ? wire4 : wire1)))));
              reg11 <= (~^$signed((~$signed((8'ha6)))));
            end
          else
            begin
              reg9 <= ((^~{($signed(wire1) - wire0),
                      ($unsigned(reg9) && ((8'hb0) ? (8'hb5) : reg11))}) ?
                  reg6 : ((((~|reg8) < wire0) ?
                          $signed($unsigned(wire0)) : reg9) ?
                      wire4 : {(wire0 ? (wire3 - wire0) : wire5)}));
              reg10 <= $unsigned($signed(reg9));
              reg11 <= reg10[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg6 <= (((((reg8 ?
              wire2 : wire0) < $signed(wire1)) ~^ ($signed(wire3) ?
              {wire4} : $unsigned(reg6))) ^~ reg11) || ((reg6[(3'h5):(3'h4)] <= reg9) ?
              ($unsigned($unsigned(wire2)) ? wire2 : wire5) : wire4));
        end
      if (wire0[(3'h4):(2'h3)])
        begin
          reg12 <= ((~|$signed(((+reg9) > (~reg10)))) ?
              (($signed($unsigned(reg10)) ?
                  $signed(reg8[(2'h2):(1'h0)]) : (+$unsigned(wire0))) ~^ $signed((((8'h9e) != wire1) && $unsigned(wire0)))) : $unsigned($unsigned(($unsigned(wire2) ?
                  wire1 : {reg9}))));
          reg13 <= reg12[(3'h7):(3'h5)];
        end
      else
        begin
          reg12 <= ($signed(reg13[(5'h10):(3'h6)]) * {(wire2 & (wire1 || (!wire0)))});
          reg13 <= {$signed((8'hbd))};
          reg14 <= reg9[(3'h5):(2'h3)];
          reg15 <= wire4;
        end
      reg16 <= ($signed($signed({{wire2, reg15},
          $signed((8'hab))})) == $unsigned((((wire1 ? wire4 : reg11) ?
              $unsigned(wire5) : $signed(reg7)) ?
          {$signed(wire4)} : ($unsigned(reg11) ^~ $unsigned(wire1)))));
      reg17 <= (($signed(((~|reg7) ?
              (wire2 ? reg8 : wire0) : reg6[(4'h8):(4'h8)])) ?
          ($signed((8'hb3)) - (8'ha7)) : (~|(^(reg14 ^~ reg14)))) < (reg14[(3'h5):(1'h0)] ?
          reg14 : (|$unsigned(reg16))));
    end
  always
    @(posedge clk) begin
      if ($signed(($unsigned($signed($signed((8'hab)))) ^ $unsigned(((reg6 << (8'ha5)) >> (reg11 ?
          wire5 : reg17))))))
        begin
          reg18 <= (reg11[(2'h2):(2'h2)] ?
              {(($unsigned(reg7) | {reg15, reg8}) ?
                      {$signed(reg10)} : (((8'hb5) << (8'h9d)) & reg8[(1'h1):(1'h0)])),
                  reg6} : ((reg15[(3'h6):(3'h5)] ?
                      ((|wire1) ?
                          wire5[(2'h2):(1'h0)] : ((8'hbd) ?
                              reg9 : reg11)) : {(reg14 - reg14),
                          $signed(wire5)}) ?
                  (~&$unsigned($unsigned(reg14))) : ($signed($signed((8'ha7))) ?
                      ((reg12 ? reg9 : reg11) ?
                          $unsigned(wire0) : reg12[(2'h3):(2'h2)]) : $signed((wire0 ?
                          reg13 : reg17)))));
        end
      else
        begin
          reg18 <= (wire5 ?
              $signed(((^$unsigned(wire5)) ?
                  reg10[(3'h5):(3'h4)] : $signed($unsigned(reg17)))) : (wire4[(5'h12):(4'hf)] ?
                  wire2 : (reg8[(1'h0):(1'h0)] | wire2[(1'h1):(1'h1)])));
        end
    end
  assign wire19 = $unsigned(((~^(reg15[(4'he):(3'h4)] && wire3)) ?
                      ((~^$unsigned((7'h40))) ?
                          wire3[(1'h0):(1'h0)] : {(^~(8'hbd))}) : $unsigned(((reg18 ?
                              reg17 : wire1) ?
                          (reg8 ? reg6 : wire2) : reg13))));
  assign wire20 = (~($signed({(wire2 ? (8'ha5) : reg10), (8'haa)}) ?
                      $unsigned($signed((^reg11))) : {{$unsigned((8'hbc)),
                              ((8'ha2) ? reg10 : wire2)}}));
  module21 #() modinst92 (wire91, clk, reg12, reg8, wire19, reg15);
  assign wire93 = ($unsigned(reg9) ?
                      (~(wire91 ?
                          ((wire5 ? reg11 : reg14) ?
                              ((8'ha0) ~^ reg6) : $unsigned(reg14)) : reg18)) : $unsigned(reg9[(3'h6):(2'h3)]));
  assign wire94 = $unsigned($unsigned({($signed(wire3) | wire2),
                      (~&(reg13 ? reg6 : (8'ha4)))}));
  module95 #() modinst210 (wire209, clk, wire2, reg6, reg7, wire93, reg8);
  assign wire211 = $unsigned(($unsigned(reg10[(3'h4):(3'h4)]) + {$signed((wire209 ?
                           wire94 : reg6))}));
endmodule

module module95
#(parameter param207 = (({(((8'h9c) || (8'hbf)) > {(8'h9f)}), (~&((8'ha9) ? (8'had) : (8'h9f)))} ? (~^(-(~&(8'hb0)))) : ((^~((8'h9f) ? (8'hb4) : (8'h9f))) ? (^~((8'hbc) ? (8'ha1) : (8'ha5))) : (((7'h43) << (8'ha2)) ~^ ((8'hb7) + (8'haa))))) ~^ ((8'hba) >>> (~&((~|(8'hb3)) ? (~&(8'hbd)) : (8'haa))))), 
parameter param208 = (^((param207 ? (&(param207 ^~ param207)) : (param207 ? ((8'hb1) ? (8'hb2) : param207) : (^param207))) ? ((|(~param207)) ? (param207 < param207) : (~&((7'h40) ? (7'h40) : param207))) : {{(param207 ? param207 : param207)}, ({param207} <= (param207 ? param207 : param207))})))
(y, clk, wire96, wire97, wire98, wire99, wire100);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire96;
  input wire signed [(4'hb):(1'h0)] wire97;
  input wire signed [(5'h13):(1'h0)] wire98;
  input wire signed [(2'h2):(1'h0)] wire99;
  input wire [(5'h11):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire205;
  wire [(5'h12):(1'h0)] wire204;
  wire signed [(4'h8):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire115;
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire202,
                 wire171,
                 wire101,
                 wire102,
                 wire115,
                 (1'h0)};
  assign wire101 = ((^~((8'h9c) || (wire98[(1'h0):(1'h0)] ?
                       wire100[(1'h1):(1'h0)] : ((8'hae) ?
                           wire96 : wire97)))) ^~ wire97);
  assign wire102 = $unsigned($unsigned(((8'hac) > ($unsigned(wire97) ?
                       $signed(wire100) : $signed(wire97)))));
  module103 #() modinst116 (.wire105(wire96), .clk(clk), .wire104(wire102), .wire107(wire100), .wire106(wire101), .y(wire115), .wire108(wire98));
  module117 #() modinst172 (wire171, clk, wire115, wire97, wire100, wire102);
  module173 #() modinst203 (.wire174(wire100), .y(wire202), .wire177(wire115), .wire175(wire171), .clk(clk), .wire176(wire101));
  assign wire204 = (wire98[(4'h8):(3'h4)] && wire171);
  assign wire205 = (((^~$unsigned($signed((8'ha7)))) == wire102[(3'h6):(2'h2)]) ^~ $unsigned((!wire96)));
  assign wire206 = wire204;
endmodule

module module21
#(parameter param89 = (~|((((~(8'ha3)) ? ((8'hae) ~^ (8'haf)) : (8'hb3)) ? {{(8'haf), (8'hb5)}} : (^~((7'h41) ? (8'hb8) : (8'hb5)))) && (8'had))), 
parameter param90 = param89)
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  assign y = {wire88,
                 wire86,
                 wire52,
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
  assign wire26 = (((({wire22, (8'ha0)} == (wire23 <= wire23)) ?
                              wire22[(1'h1):(1'h0)] : wire25) ?
                          (&wire22) : {{(wire25 ? wire25 : wire24), (-wire25)},
                              $unsigned((wire25 ? wire22 : wire25))}) ?
                      ($unsigned(wire25) || $unsigned((8'ha0))) : (~^(((8'hb5) < (wire25 ?
                          wire24 : (8'hbc))) <= $signed(wire24))));
  assign wire27 = wire25;
  assign wire28 = wire22[(1'h0):(1'h0)];
  assign wire29 = {(wire23 + (+$unsigned($unsigned(wire25)))), (&(8'ha8))};
  assign wire30 = ((wire29 << wire25[(2'h2):(1'h0)]) ?
                      wire22[(1'h0):(1'h0)] : wire28[(4'h8):(3'h5)]);
  assign wire31 = ((wire27[(2'h3):(1'h1)] != wire28) == (((wire24[(1'h1):(1'h1)] ?
                          wire26 : $signed(wire22)) - wire22[(2'h2):(1'h1)]) ?
                      $signed((!(wire24 > wire29))) : wire28[(3'h5):(3'h4)]));
  assign wire32 = wire27[(4'hf):(3'h7)];
  assign wire33 = {$unsigned((+((^~wire32) <= (^~wire26)))), $signed((8'ha9))};
  assign wire34 = (&(wire31[(3'h5):(2'h2)] ~^ $signed({(wire24 ?
                          wire27 : wire30)})));
  assign wire35 = $signed($unsigned((wire26[(4'h9):(4'h8)] ?
                      wire30 : (-$unsigned(wire31)))));
  assign wire36 = wire29[(3'h4):(1'h1)];
  module37 #() modinst53 (.wire38(wire23), .y(wire52), .wire39(wire36), .wire41(wire33), .wire40(wire22), .clk(clk));
  module54 #() modinst87 (wire86, clk, wire30, wire36, wire34, wire26);
  assign wire88 = wire32[(1'h0):(1'h0)];
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire58;
  input wire [(5'h13):(1'h0)] wire57;
  input wire [(3'h5):(1'h0)] wire56;
  input wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire59;
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire59 = wire56;
  assign wire60 = $signed($unsigned(wire57));
  assign wire61 = $signed($unsigned(wire57[(5'h13):(4'hc)]));
  assign wire62 = $unsigned($signed(wire58));
  assign wire63 = (^(8'hba));
  assign wire64 = $unsigned($signed($unsigned(((wire60 <<< wire57) + $unsigned(wire57)))));
  assign wire65 = $unsigned(wire63[(4'h8):(2'h2)]);
  assign wire66 = wire57;
  assign wire67 = $unsigned((($signed((wire65 ? wire56 : wire57)) | wire58) ?
                      wire57 : $unsigned($unsigned(wire62[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg68 <= ((^~{wire66}) ? (8'ha3) : (~(~^(^$unsigned(wire56)))));
      reg69 <= ($unsigned((wire67[(3'h5):(2'h3)] ?
              wire63 : (wire60[(1'h0):(1'h0)] ?
                  (wire64 ? (8'hbb) : wire65) : (~&(8'hb6))))) ?
          (&$unsigned(((|wire57) ?
              (&wire64) : (wire59 | (8'hb2))))) : (^~wire67));
      reg70 <= ((wire58 ?
              (~$signed((wire66 <<< reg69))) : (&({(8'hb6)} ?
                  (|wire55) : (^wire55)))) ?
          reg68 : $signed(wire67));
      if (($signed($signed(reg68[(4'hc):(2'h3)])) || wire65))
        begin
          if (($unsigned((reg69[(1'h0):(1'h0)] | $signed(reg69[(3'h5):(2'h3)]))) ?
              reg68 : $unsigned(({(wire60 >> wire65), reg68[(4'hb):(3'h4)]} ?
                  $signed((reg69 ? wire65 : reg70)) : (^((8'ha3) > wire62))))))
            begin
              reg71 <= reg68;
              reg72 <= ($signed($signed($unsigned(reg68[(4'h9):(3'h4)]))) ?
                  ($unsigned($unsigned($signed(wire59))) ?
                      {reg69} : $unsigned(wire55)) : $signed(reg68));
              reg73 <= $unsigned($unsigned(wire56));
              reg74 <= $unsigned($signed((((~^reg73) ? wire55 : (-wire62)) ?
                  reg69 : ((wire58 >= reg71) > reg72))));
              reg75 <= (|wire64[(1'h1):(1'h0)]);
            end
          else
            begin
              reg71 <= $signed((reg68[(4'h9):(4'h8)] << $unsigned($unsigned(wire62))));
              reg72 <= (^~{(wire61[(3'h7):(3'h6)] <<< ((wire60 ?
                      wire56 : (8'h9d)) + $signed(wire65))),
                  wire59});
            end
          reg76 <= (wire67[(4'hb):(1'h1)] ?
              (~|wire57[(2'h2):(2'h2)]) : $signed((8'had)));
          if ($unsigned(reg75))
            begin
              reg77 <= reg73[(3'h5):(1'h0)];
            end
          else
            begin
              reg77 <= $signed($signed(wire62[(5'h12):(4'h9)]));
              reg78 <= wire65;
              reg79 <= (reg73 ?
                  $unsigned((wire61[(4'hf):(3'h6)] == ((reg76 || reg78) ~^ (wire66 | reg71)))) : (~&({wire59[(3'h4):(1'h0)],
                      (~wire66)} <= $unsigned(wire55))));
              reg80 <= $signed((wire63 ?
                  ((reg71 ^~ wire59) >>> $unsigned($signed(reg78))) : (-$unsigned($unsigned(wire55)))));
            end
          reg81 <= $unsigned({(~^reg80)});
          reg82 <= {$signed($signed($signed((reg68 ? reg77 : wire67))))};
        end
      else
        begin
          reg71 <= wire55;
          reg72 <= wire60[(3'h4):(2'h3)];
        end
    end
  assign wire83 = reg73[(4'hf):(1'h1)];
  assign wire84 = reg70;
  assign wire85 = (~|(+(wire64 > (~|reg76))));
endmodule

module module37
#(parameter param51 = ((((((8'hb8) && (8'ha0)) >> {(8'hac), (8'hbf)}) ^~ (8'hbc)) + ((((8'ha4) || (8'ha2)) ~^ {(8'hac)}) * ({(8'hbb), (8'hbe)} ? ((8'h9c) * (8'h9c)) : ((8'h9f) ? (8'hb0) : (8'hb8))))) ~^ ((((-(8'hbb)) & ((8'ha0) || (8'ha1))) ? ({(8'hbf)} - ((8'hab) ? (8'hb2) : (8'hbb))) : (!{(8'hae)})) ? (((~|(8'hb5)) ? ((8'hb0) == (8'hae)) : (|(8'ha1))) <= (^~(&(8'had)))) : (((~&(8'ha2)) ? ((8'ha6) >> (8'ha1)) : (-(8'h9f))) != (((8'hae) ? (8'haf) : (8'hbc)) ? ((7'h43) ? (8'had) : (8'h9e)) : ((7'h42) >> (8'hba)))))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire41;
  input wire [(4'hf):(1'h0)] wire40;
  input wire [(3'h5):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire42;
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire43,
                 wire42,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = $unsigned((~|wire39));
  assign wire43 = $signed($signed((|((wire41 ? wire40 : wire38) <<< (wire39 ?
                      wire41 : (8'ha0))))));
  always
    @(posedge clk) begin
      reg44 <= (~^({wire43[(3'h7):(2'h2)],
          wire38[(3'h7):(1'h1)]} < $unsigned($signed((wire40 >> wire42)))));
      reg45 <= (wire40 <= $unsigned((&$signed((&wire39)))));
    end
  assign wire46 = wire39;
  assign wire47 = (|(8'haa));
  assign wire48 = wire41;
  assign wire49 = reg45;
  assign wire50 = ($unsigned(wire48) ?
                      $signed($unsigned(wire41)) : $signed((~($unsigned(wire43) & (wire43 ?
                          wire42 : wire47)))));
endmodule

module module173  (y, clk, wire177, wire176, wire175, wire174);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire177;
  input wire signed [(5'h14):(1'h0)] wire176;
  input wire signed [(5'h14):(1'h0)] wire175;
  input wire [(4'h8):(1'h0)] wire174;
  wire [(4'hb):(1'h0)] wire201;
  wire [(5'h13):(1'h0)] wire200;
  wire signed [(4'he):(1'h0)] wire199;
  wire [(2'h2):(1'h0)] wire198;
  wire signed [(2'h2):(1'h0)] wire197;
  wire [(5'h13):(1'h0)] wire196;
  wire signed [(4'h8):(1'h0)] wire195;
  wire [(3'h6):(1'h0)] wire194;
  wire signed [(3'h5):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire192;
  wire [(4'h8):(1'h0)] wire191;
  wire [(4'h8):(1'h0)] wire190;
  wire signed [(4'he):(1'h0)] wire178;
  reg signed [(4'hd):(1'h0)] reg189 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg179 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire178,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire178 = wire177;
  always
    @(posedge clk) begin
      reg179 <= (-$signed((8'hab)));
      if (reg179)
        begin
          reg180 <= $signed((wire176 ^~ (wire178[(1'h1):(1'h1)] ?
              $unsigned($signed(wire176)) : (^wire178[(2'h2):(2'h2)]))));
          reg181 <= (((((wire178 ? wire176 : reg180) ?
                  wire176 : (wire177 << wire175)) >= reg180[(1'h0):(1'h0)]) ?
              $unsigned(reg180[(1'h1):(1'h0)]) : (wire177 * ((8'hb7) ?
                  (&(8'hb7)) : wire176))) ^~ reg179[(3'h6):(1'h0)]);
        end
      else
        begin
          reg180 <= reg179;
          reg181 <= (~&$signed(wire176[(1'h0):(1'h0)]));
          reg182 <= wire175;
        end
      if ((({reg180, reg179} ?
          ((wire178 - wire175[(4'hf):(4'h8)]) <= $signed($unsigned(wire176))) : (^~($unsigned(wire177) ^ (reg182 != (8'h9e))))) * $unsigned(({(reg182 ?
                  wire176 : reg180),
              (&reg180)} ?
          $signed((8'hb3)) : (reg182 ^ $signed(wire174))))))
        begin
          reg183 <= {($signed($signed(((7'h44) | (8'hb0)))) >= $unsigned(wire177[(2'h2):(2'h2)])),
              (~&reg182[(1'h1):(1'h1)])};
          reg184 <= (-wire176[(5'h12):(4'h9)]);
          if ((((|(~|$unsigned(reg181))) > ((reg182 == $unsigned(reg184)) ?
                  ({reg182, wire178} ?
                      (8'hab) : {wire174, reg180}) : (~(^~reg180)))) ?
              $signed(reg184[(3'h6):(2'h2)]) : $unsigned(($signed((|reg184)) > (8'ha0)))))
            begin
              reg185 <= $unsigned(((wire176[(4'hd):(4'hd)] ?
                  (reg183[(2'h3):(1'h1)] || $unsigned(reg184)) : $signed(reg181[(3'h7):(3'h7)])) - {{(wire178 ?
                          (8'hac) : wire174)},
                  (wire177 ? (reg179 - wire178) : (+wire178))}));
              reg186 <= wire174;
              reg187 <= $signed(wire178);
            end
          else
            begin
              reg185 <= {((!$unsigned(((8'hab) ?
                      wire178 : wire174))) > (reg183[(4'hb):(3'h7)] ?
                      ((-reg187) ? wire175 : reg180) : $unsigned(wire177)))};
              reg186 <= wire178[(4'hd):(2'h3)];
            end
          reg188 <= $signed(wire174[(4'h8):(3'h6)]);
        end
      else
        begin
          reg183 <= $unsigned(reg188);
        end
      reg189 <= (({reg186[(2'h2):(1'h1)]} ~^ (~|$signed(reg183))) ?
          reg181[(2'h3):(2'h2)] : reg182[(4'h8):(2'h3)]);
    end
  assign wire190 = (((|(^~reg184[(4'hc):(2'h3)])) ?
                       (reg179[(4'h8):(4'h8)] <<< $unsigned(reg180)) : reg189) - $signed((~&(8'hb9))));
  assign wire191 = (^~reg180);
  assign wire192 = (~|(!$signed((|$unsigned(wire178)))));
  assign wire193 = reg183;
  assign wire194 = reg186[(1'h1):(1'h1)];
  assign wire195 = (~|(($unsigned(reg187[(2'h3):(1'h1)]) ?
                           $unsigned((reg184 || wire193)) : (-$unsigned(wire193))) ?
                       $signed(wire175) : reg185));
  assign wire196 = ((-$signed((~&reg181[(2'h3):(2'h3)]))) <= $unsigned(({wire190} ?
                       (((8'ha6) & (8'hac)) ?
                           (|wire175) : (reg182 ?
                               wire195 : reg185)) : ((~&reg180) ^ (reg181 - reg186)))));
  assign wire197 = reg188;
  assign wire198 = reg187[(3'h5):(2'h2)];
  assign wire199 = wire196[(5'h11):(4'hb)];
  assign wire200 = (~&wire190[(3'h6):(2'h3)]);
  assign wire201 = wire190[(3'h5):(1'h1)];
endmodule

module module117
#(parameter param170 = (((((-(8'h9e)) ? {(8'ha7), (8'hbc)} : (^~(8'ha5))) ? {(~(8'hbc))} : (~|((8'ha8) == (8'haa)))) ? ((&((8'hb2) ? (7'h43) : (8'hab))) ? ({(8'hae)} | ((8'hbd) * (8'hab))) : (&(^(8'ha3)))) : ((|((8'haa) + (7'h44))) ? ((~&(8'hbc)) << (~|(8'hb3))) : (((8'h9e) ? (8'ha1) : (8'hbd)) ? ((8'hae) ? (8'ha0) : (8'hab)) : ((7'h44) <= (8'ha8))))) || (8'ha6)))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire121;
  input wire [(3'h4):(1'h0)] wire120;
  input wire [(5'h11):(1'h0)] wire119;
  input wire [(4'hf):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire155;
  wire [(5'h11):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(5'h14):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(2'h3):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire [(4'hb):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(2'h2):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire147,
                 wire144,
                 wire143,
                 wire142,
                 wire137,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg146,
                 reg145,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire122 = $signed((wire120 ?
                       (^~$signed({wire119,
                           wire120})) : ((7'h43) | (-$signed(wire118)))));
  assign wire123 = wire119[(3'h7):(1'h1)];
  assign wire124 = (wire122 != {(~(|$signed(wire120))),
                       {{(wire121 || wire119)}}});
  assign wire125 = wire119;
  always
    @(posedge clk) begin
      if ((8'hbd))
        begin
          reg126 <= ($unsigned((wire123 ?
              $unsigned({wire120}) : {((8'hb6) != wire125),
                  (~wire124)})) & wire118[(1'h0):(1'h0)]);
          reg127 <= wire119;
          if ({((((^~(8'haa)) < (reg126 ? (8'ha0) : wire118)) ?
                  $unsigned((reg126 * wire119)) : (((8'hb1) ?
                          wire123 : wire121) ?
                      (wire120 - wire122) : wire125)) != (-$unsigned(wire123[(4'ha):(4'h8)]))),
              (&$unsigned((wire123[(3'h4):(1'h0)] ?
                  wire121[(2'h2):(1'h0)] : reg127[(3'h4):(2'h2)])))})
            begin
              reg128 <= ((8'hbc) ?
                  $unsigned({$unsigned(wire118[(4'hc):(3'h6)])}) : wire123[(3'h4):(1'h1)]);
              reg129 <= (-(($unsigned((!reg127)) ?
                  (&wire121) : $unsigned($signed(wire123))) || ($unsigned($signed(reg127)) ?
                  reg128 : wire122[(3'h5):(2'h2)])));
              reg130 <= $unsigned(($signed(($signed(wire121) ?
                      (wire119 * reg129) : (reg129 == reg127))) ?
                  ((wire122[(2'h2):(1'h1)] > $unsigned(wire123)) ?
                      wire118[(2'h3):(2'h3)] : $signed($signed(wire122))) : ((wire121[(4'h8):(3'h7)] ?
                      (reg129 ?
                          reg126 : wire122) : reg126[(3'h4):(2'h2)]) > ((wire121 > reg128) ?
                      $unsigned(wire125) : wire124))));
              reg131 <= ((^~(-reg128)) ?
                  $signed((8'hac)) : reg130[(3'h5):(2'h2)]);
              reg132 <= $signed(((&((wire121 ? wire119 : (8'hb4)) ?
                      $signed(wire122) : (~|(8'hac)))) ?
                  $unsigned((-$unsigned(reg131))) : $signed(reg131[(4'hb):(4'h9)])));
            end
          else
            begin
              reg128 <= (!({((wire119 & reg131) ?
                          (reg129 ^~ reg130) : (wire125 ^ wire125)),
                      wire120} ?
                  ((~&(~wire123)) < (~&(wire122 ?
                      reg130 : reg128))) : ($signed((8'hbe)) + reg132[(4'h9):(2'h2)])));
              reg129 <= ({$signed(reg127)} | $signed((!(wire119 ?
                  {(8'hb5)} : $unsigned(reg130)))));
              reg130 <= ($unsigned((reg131[(4'h8):(3'h6)] ?
                      ($signed(wire120) <<< (&wire124)) : {wire119[(1'h1):(1'h0)],
                          $signed((8'ha9))})) ?
                  $signed($signed(reg132[(4'hf):(1'h0)])) : $signed(wire120));
              reg131 <= (wire119[(3'h4):(2'h2)] ?
                  $signed(reg129[(4'h9):(2'h2)]) : reg132);
              reg132 <= $signed((~|{$unsigned(wire120[(2'h2):(1'h0)]),
                  wire124[(3'h6):(1'h1)]}));
            end
        end
      else
        begin
          if (wire123[(3'h7):(3'h7)])
            begin
              reg126 <= $signed((reg129[(2'h3):(2'h2)] <<< {wire122[(2'h3):(2'h2)],
                  (reg131 ? ((8'hb5) ~^ (8'ha6)) : (wire125 + reg132))}));
            end
          else
            begin
              reg126 <= $signed(wire124[(3'h6):(3'h4)]);
            end
          reg127 <= $signed((({(^~reg130)} > $signed($unsigned(reg130))) ?
              reg130[(2'h3):(1'h0)] : reg128));
          reg128 <= $signed(reg132[(3'h6):(1'h1)]);
          reg129 <= (wire124 * ({(wire124[(4'hb):(3'h7)] ?
                      $signed(reg132) : (reg127 <= reg127)),
                  $unsigned((~^reg132))} ?
              {((reg131 ? reg130 : wire123) ?
                      $unsigned(wire123) : $unsigned(wire118))} : wire120));
        end
      reg133 <= (wire124[(3'h6):(1'h0)] ?
          $unsigned((($unsigned(wire125) || ((8'hab) | wire124)) >= {wire123,
              $unsigned(wire121)})) : {{{wire124[(4'ha):(3'h5)], wire120},
                  (reg132[(2'h3):(1'h1)] >> (wire124 ? wire119 : wire123))},
              wire125[(2'h3):(1'h1)]});
      if (wire124[(4'hc):(2'h3)])
        begin
          reg134 <= $unsigned($unsigned((8'hb5)));
        end
      else
        begin
          reg134 <= ($signed($signed($unsigned((wire123 && (8'hae))))) ?
              $unsigned(($signed((wire125 ^ (7'h41))) - $signed($unsigned(wire122)))) : reg134);
        end
      reg135 <= (reg127[(1'h0):(1'h0)] * $unsigned($unsigned(($signed(reg129) ?
          $unsigned(wire121) : (reg131 < reg126)))));
      reg136 <= (&{{reg130}});
    end
  assign wire137 = ({(reg132 ?
                               ((^~wire120) ?
                                   reg130[(4'h9):(3'h7)] : $unsigned(reg136)) : $signed($signed(wire121)))} ?
                       (^$signed(wire124)) : $unsigned(wire121));
  always
    @(posedge clk) begin
      reg138 <= $unsigned(reg129);
      reg139 <= ((reg138[(1'h1):(1'h0)] >> $unsigned({((8'hbc) >= reg134),
          wire120})) >= $signed(((8'hb0) << reg134)));
      reg140 <= $signed(reg136[(2'h2):(1'h1)]);
      reg141 <= ($signed(reg131[(3'h5):(2'h2)]) ?
          $unsigned({((~^wire125) < $signed(reg136))}) : reg139[(3'h6):(2'h3)]);
    end
  assign wire142 = reg129;
  assign wire143 = {((wire124 <<< ($unsigned(reg127) + wire125)) ?
                           ({(reg131 != (8'hb5)),
                               ((8'hb3) | (7'h43))} << ((reg126 >>> wire125) <= (reg140 >= reg134))) : $signed(reg133))};
  assign wire144 = ($unsigned(((wire123 ?
                           (reg131 ^~ wire124) : $unsigned(wire142)) ?
                       reg134 : (+{wire123}))) > ((!((wire123 ?
                       reg136 : wire123) >> $signed(wire119))) ^~ wire125));
  always
    @(posedge clk) begin
      reg145 <= ($unsigned(reg127) ?
          (8'haf) : (~{(&((7'h44) ? reg136 : wire122))}));
      reg146 <= $unsigned((&reg133));
    end
  assign wire147 = (8'hbb);
  always
    @(posedge clk) begin
      reg148 <= wire124[(5'h10):(4'hc)];
      if ({$signed((((8'ha7) ?
              $unsigned(wire119) : $unsigned(reg129)) > ($signed(reg132) * wire119))),
          (-(({wire122} ?
              wire137[(1'h1):(1'h0)] : $unsigned(reg126)) ~^ $unsigned((wire147 < reg136))))})
        begin
          reg149 <= (((((reg148 == reg128) + $signed(reg145)) ?
                  {wire144,
                      wire120[(1'h1):(1'h0)]} : (reg138[(1'h0):(1'h0)] >>> {reg133})) ?
              (reg129[(4'h9):(3'h7)] ?
                  (^$signed(wire137)) : $signed((~|reg141))) : {reg133}) | {reg140});
          reg150 <= $signed(((-(reg131[(4'hb):(2'h3)] * (!reg129))) ?
              ($signed($signed(wire125)) ^~ wire144[(3'h7):(1'h0)]) : ((wire122 + (8'h9c)) ^~ reg138[(1'h0):(1'h0)])));
          reg151 <= $signed((^~(!(8'hab))));
        end
      else
        begin
          reg149 <= wire137[(1'h0):(1'h0)];
          reg150 <= $unsigned((($signed((reg126 + (8'hbc))) ?
                  reg126 : $signed($signed(reg141))) ?
              $signed(({reg128} ? reg135 : (~reg127))) : $unsigned(wire125)));
        end
      reg152 <= reg132[(3'h6):(2'h2)];
    end
  assign wire153 = {{(!$unsigned($signed(reg134))),
                           $signed((~&$signed(wire142)))},
                       $unsigned($signed($signed(wire137)))};
  assign wire154 = $signed(wire119[(1'h0):(1'h0)]);
  assign wire155 = $unsigned(((({reg136, wire119} ?
                           (wire137 ^ wire120) : reg126) ?
                       ((wire120 ? reg140 : (8'h9c)) ?
                           (wire123 ?
                               wire122 : reg133) : reg134[(2'h2):(1'h0)]) : reg150) < ($unsigned($unsigned(wire121)) ?
                       ($signed(reg128) ?
                           $unsigned(reg133) : $signed(wire153)) : $signed(reg151))));
  always
    @(posedge clk) begin
      reg156 <= $unsigned((-$signed((reg138[(2'h2):(2'h2)] == {reg141}))));
    end
  always
    @(posedge clk) begin
      reg157 <= ($signed($signed((|(wire121 < (8'hb4))))) && (~|reg126[(4'h8):(4'h8)]));
      reg158 <= $signed(((|reg138) ? wire154 : $signed(reg146[(1'h0):(1'h0)])));
      if (reg146[(2'h2):(1'h0)])
        begin
          reg159 <= ($signed((^~reg152)) ?
              $unsigned($unsigned((-(wire118 >>> (8'haa))))) : wire118);
          reg160 <= reg129;
          reg161 <= wire154;
          reg162 <= ($unsigned(reg159[(3'h4):(1'h1)]) ?
              reg132 : $signed((^(8'h9c))));
          if ((-{{($unsigned((7'h41)) ? (~|reg156) : reg138[(1'h1):(1'h1)]),
                  (~&(wire154 ? reg132 : wire123))},
              (((8'ha1) < {reg136, (8'hb7)}) ?
                  $signed((reg127 != (7'h43))) : $unsigned($signed((8'h9e))))}))
            begin
              reg163 <= ({$signed(($signed(reg148) << wire122[(1'h1):(1'h1)])),
                      wire122} ?
                  reg148[(5'h11):(4'he)] : reg127[(2'h3):(1'h1)]);
              reg164 <= $signed((wire120[(2'h3):(2'h2)] ?
                  $signed($signed((reg131 ?
                      reg161 : (8'hab)))) : (~$signed((+wire153)))));
              reg165 <= wire155;
              reg166 <= reg151;
            end
          else
            begin
              reg163 <= $signed((~&wire143[(2'h2):(1'h1)]));
              reg164 <= $signed(reg133);
            end
        end
      else
        begin
          reg159 <= ($signed(reg164) << ({(~|(7'h43))} <= (-(&$unsigned(reg151)))));
          reg160 <= (~wire119);
          reg161 <= (reg166 ?
              $signed(reg156[(5'h11):(5'h11)]) : $signed((((reg151 ?
                          reg131 : reg163) ?
                      ((8'ha1) & wire144) : $unsigned(reg136)) ?
                  $unsigned(wire144) : {(reg162 ? (8'hbe) : wire120),
                      reg165[(5'h15):(4'h8)]})));
          reg162 <= $signed($signed({(-$unsigned((8'haa))),
              (|(wire155 ? reg127 : wire153))}));
          reg163 <= $unsigned((|((~$signed((8'hbb))) ?
              ((wire124 ?
                  reg129 : reg158) >= $unsigned(reg157)) : wire154[(4'h9):(1'h1)])));
        end
      if ($signed(({(&$signed((8'ha0)))} ?
          (&(|$signed(wire155))) : {((reg160 && wire142) ^ reg133[(2'h2):(2'h2)]),
              wire137[(1'h0):(1'h0)]})))
        begin
          reg167 <= $unsigned($signed(reg133[(3'h4):(3'h4)]));
          reg168 <= reg130;
          reg169 <= {($unsigned((~&(8'ha6))) && (~|reg128))};
        end
      else
        begin
          reg167 <= {(({$signed(reg134)} ?
                      wire121[(3'h6):(2'h2)] : {(reg166 ? reg136 : wire125),
                          (^~wire120)}) ?
                  reg157[(4'h8):(3'h6)] : ((^~{wire154}) ?
                      ((~&reg139) ?
                          reg130[(1'h1):(1'h0)] : (wire122 ?
                              reg167 : reg127)) : ((-reg128) * (reg146 ~^ reg126)))),
              $unsigned((!({reg157, wire143} * (reg132 ? reg157 : reg129))))};
          reg168 <= ((!(({reg156} >>> $unsigned((8'hb7))) & $signed($signed(reg136)))) ?
              $unsigned((&reg150)) : reg139);
        end
    end
endmodule

module module103  (y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire108;
  input wire [(4'ha):(1'h0)] wire107;
  input wire [(3'h5):(1'h0)] wire106;
  input wire [(3'h4):(1'h0)] wire105;
  input wire [(2'h3):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  assign y = {wire114, wire113, wire112, wire111, reg110, reg109, (1'h0)};
  always
    @(posedge clk) begin
      reg109 <= $unsigned(wire104[(1'h1):(1'h1)]);
      reg110 <= $signed((!(+$signed(wire106[(1'h0):(1'h0)]))));
    end
  assign wire111 = (^reg109);
  assign wire112 = (wire107[(2'h3):(1'h0)] > ((((~^reg109) ?
                           (+wire111) : wire106) ?
                       {{wire106,
                               (8'hbe)}} : (7'h42)) == wire108[(3'h5):(3'h4)]));
  assign wire113 = $signed($signed(wire105[(2'h3):(1'h1)]));
  assign wire114 = (~&($unsigned(wire104) ? $signed(wire111) : wire105));
endmodule
