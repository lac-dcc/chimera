module top
#(parameter param135 = ({((|((8'ha1) ? (8'hba) : (8'ha8))) || ((|(8'h9d)) << {(8'haf)}))} != {(+(!((8'ha2) & (8'hb4)))), {({(7'h44), (8'hb3)} ? ((8'ha2) ? (8'h9e) : (7'h44)) : ((8'hb5) > (8'hbc)))}}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire131;
  assign y = {wire134,
                 wire133,
                 wire116,
                 wire4,
                 wire46,
                 wire118,
                 wire131,
                 (1'h0)};
  assign wire4 = (~|(-wire3));
  module5 #() modinst47 (wire46, clk, wire1, wire3, wire2, wire0, wire4);
  module48 #() modinst117 (wire116, clk, wire4, wire3, wire1, wire0, wire2);
  assign wire118 = wire0[(4'hc):(3'h7)];
  module119 #() modinst132 (.wire123(wire0), .y(wire131), .wire120(wire118), .wire124(wire1), .wire122(wire3), .wire121(wire116), .clk(clk));
  assign wire133 = ((~wire46) ^~ wire46);
  assign wire134 = (wire116 ?
                       $signed(((~&{wire2, (8'hb9)}) ?
                           (&{wire0,
                               wire1}) : wire133)) : ($signed((wire0[(3'h4):(1'h1)] <= $signed(wire0))) ?
                           wire1[(3'h7):(3'h4)] : ($signed(wire131) ?
                               wire46[(5'h10):(3'h4)] : wire131[(4'ha):(1'h0)])));
endmodule

module module119
#(parameter param129 = {(-(~^(~&{(8'had)})))}, 
parameter param130 = (~^(param129 < param129)))
(y, clk, wire124, wire123, wire122, wire121, wire120);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire124;
  input wire [(4'ha):(1'h0)] wire123;
  input wire [(4'hd):(1'h0)] wire122;
  input wire signed [(5'h15):(1'h0)] wire121;
  input wire [(4'hb):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  assign y = {wire128, wire127, wire126, wire125, (1'h0)};
  assign wire125 = wire121[(3'h6):(1'h1)];
  assign wire126 = wire122[(4'hb):(3'h6)];
  assign wire127 = (({wire125[(3'h5):(2'h2)]} & (8'h9c)) ?
                       (|((wire124 ?
                               (wire125 ?
                                   wire126 : wire122) : wire120[(1'h0):(1'h0)]) ?
                           wire125 : ($signed(wire124) >= ((8'h9f) == wire124)))) : (^~(wire123[(3'h6):(1'h1)] ?
                           wire126[(3'h5):(1'h0)] : wire125)));
  assign wire128 = $unsigned($signed(($unsigned(((8'ha2) >> wire124)) ?
                       wire126[(4'hd):(3'h6)] : $signed($unsigned(wire125)))));
endmodule

module module48  (y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire51;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire signed [(4'he):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire114;
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  assign y = {wire70,
                 wire72,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire114,
                 reg73,
                 reg74,
                 (1'h0)};
  module54 #() modinst71 (.wire59(wire53), .y(wire70), .clk(clk), .wire57(wire50), .wire58(wire52), .wire55(wire51), .wire56(wire49));
  assign wire72 = wire53;
  always
    @(posedge clk) begin
      reg73 <= $unsigned((~|wire53));
      reg74 <= $unsigned({{wire51[(5'h10):(5'h10)]}, (8'hbb)});
    end
  assign wire75 = (((-({wire51, wire50} ?
                              $unsigned(reg73) : reg73[(3'h6):(2'h2)])) ?
                          (~($unsigned(wire53) ?
                              {reg74} : {wire72,
                                  wire51})) : (reg74 <= (^~reg74[(3'h5):(1'h0)]))) ?
                      wire51[(5'h14):(4'ha)] : (~^($unsigned((8'hb1)) < $signed(wire72[(3'h7):(1'h0)]))));
  assign wire76 = (wire70[(3'h5):(2'h2)] ?
                      {(wire50 * ((wire50 ?
                              reg73 : (7'h40)) & (wire72 ^~ wire75))),
                          (^~(-$signed(wire53)))} : $unsigned(($unsigned(wire49) > wire70)));
  assign wire77 = wire75;
  assign wire78 = ($signed((wire77[(4'h8):(3'h4)] ?
                      reg73 : wire50[(3'h5):(3'h4)])) & $signed((~|wire51)));
  assign wire79 = (wire52 <= wire50);
  assign wire80 = $unsigned({(wire70[(3'h6):(1'h1)] ?
                          $signed((wire76 ?
                              wire76 : wire77)) : (-$unsigned(wire49))),
                      $signed({wire77, (wire75 > wire79)})});
  assign wire81 = (-$signed((8'hb2)));
  assign wire82 = (wire77[(4'h8):(3'h6)] > (~{($unsigned(wire70) < (-wire53))}));
  module83 #() modinst115 (.wire84(wire80), .clk(clk), .wire85(wire49), .wire86(wire82), .wire87(reg74), .y(wire114));
endmodule

module module5
#(parameter param45 = (+{(^~(((8'ha5) ? (7'h43) : (8'hbf)) != ((8'hae) || (8'had)))), (((8'hb4) ? ((8'ha0) ? (8'hab) : (8'hbf)) : ((7'h40) ? (8'ha6) : (7'h41))) ? (((8'ha5) ? (7'h40) : (8'ha7)) - ((8'h9e) + (8'ha2))) : (((8'hb1) ? (8'hb5) : (7'h42)) ^~ ((8'hab) ? (8'ha4) : (8'hae))))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire13,
                 wire12,
                 wire11,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = wire7[(4'he):(4'h9)];
  assign wire12 = ((~&($unsigned(((8'haf) ? wire7 : wire7)) ?
                          (wire9[(2'h3):(1'h0)] + (wire11 <= wire6)) : wire8)) ?
                      (~|(^($unsigned(wire8) >= {wire6}))) : {$unsigned($unsigned((~^wire9)))});
  assign wire13 = ({$signed((8'ha9))} && $signed((wire6[(1'h1):(1'h1)] ?
                      $signed({wire11, wire11}) : wire6)));
  always
    @(posedge clk) begin
      reg14 <= (^~($signed(((wire8 ^ wire13) ?
          $unsigned(wire12) : wire12)) - (($unsigned(wire13) ?
          wire12 : $unsigned((7'h43))) != ((wire8 ?
          wire7 : wire8) >= $signed(wire12)))));
      if (wire10)
        begin
          if ($signed(((wire13 ^ (&(wire8 ? wire9 : (8'ha8)))) ?
              wire12[(4'hd):(1'h1)] : $signed($unsigned({wire9})))))
            begin
              reg15 <= $signed({$signed({(wire7 << reg14)}),
                  wire10[(1'h0):(1'h0)]});
              reg16 <= $unsigned((wire8 ?
                  wire6[(3'h5):(3'h5)] : (wire9[(2'h3):(1'h0)] ?
                      $signed(((8'h9f) <= wire6)) : $unsigned(wire8))));
              reg17 <= $unsigned($unsigned($signed(reg15[(1'h1):(1'h0)])));
              reg18 <= ($unsigned((^((reg16 ? reg14 : wire13) ?
                      (wire13 >= wire10) : (wire8 ? wire6 : wire6)))) ?
                  reg14 : {wire12, (wire8 >> $signed(reg15))});
              reg19 <= $unsigned($signed(wire10[(4'h9):(3'h4)]));
            end
          else
            begin
              reg15 <= (^$unsigned((~^(wire10 >>> (wire7 ? (8'hba) : wire7)))));
              reg16 <= (~|{reg18[(2'h3):(1'h0)], $signed((-{reg15, (8'ha7)}))});
              reg17 <= {((($unsigned(reg19) >= {wire8}) ?
                      wire9[(4'h9):(4'h9)] : $signed((reg15 ?
                          wire9 : reg14))) & ({$signed(wire10)} ^~ ({reg17,
                      (8'ha5)} | $signed(wire9))))};
            end
        end
      else
        begin
          reg15 <= wire11;
        end
      reg20 <= ({$signed(wire6[(3'h6):(2'h3)])} ?
          ((wire7[(5'h10):(5'h10)] ?
              $unsigned((wire12 || reg17)) : ((wire13 ? reg15 : wire9) ?
                  (8'hb3) : (+reg18))) > $signed($signed((^reg19)))) : reg14);
      reg21 <= reg17[(3'h7):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg22 <= (reg21[(1'h0):(1'h0)] ? wire9[(3'h6):(1'h1)] : wire12);
      if ($signed($unsigned(reg22[(3'h5):(3'h4)])))
        begin
          reg23 <= $signed({$unsigned(wire6), reg16[(3'h6):(3'h4)]});
          reg24 <= {($signed(wire10[(2'h3):(2'h2)]) - ($signed(reg15[(4'hb):(1'h0)]) ?
                  reg21 : $unsigned((wire7 ? wire8 : reg20)))),
              ((reg21[(4'hb):(2'h3)] ?
                  reg18[(3'h7):(3'h7)] : $signed({wire12})) >> (~&(^$unsigned(wire12))))};
          reg25 <= (!(-($signed(wire6[(3'h6):(1'h1)]) && {wire6[(1'h1):(1'h1)]})));
          reg26 <= (wire10[(2'h2):(1'h0)] ?
              reg15[(3'h5):(2'h2)] : (wire8[(1'h0):(1'h0)] ?
                  (~&{(7'h41)}) : ({$unsigned(wire10),
                      $unsigned(wire6)} && wire7)));
        end
      else
        begin
          reg23 <= (!(&((~wire7) <<< $unsigned($unsigned(wire13)))));
          if ($unsigned($signed((^((wire8 ? reg19 : wire10) + wire12)))))
            begin
              reg24 <= $unsigned((((|reg21[(2'h2):(1'h1)]) ?
                  reg19[(1'h1):(1'h1)] : {reg24}) >= (wire9 ?
                  {(wire13 ? reg24 : wire11),
                      reg20[(1'h0):(1'h0)]} : (8'hb6))));
              reg25 <= $signed((|$signed((wire11[(2'h2):(2'h2)] ^~ (reg16 ~^ reg22)))));
              reg26 <= $unsigned($signed($signed((~|(reg15 >= (8'hbe))))));
              reg27 <= (~((reg19[(1'h0):(1'h0)] ?
                      $unsigned((wire6 == reg26)) : wire11[(1'h0):(1'h0)]) ?
                  wire11 : reg20[(2'h3):(2'h2)]));
            end
          else
            begin
              reg24 <= wire11[(1'h0):(1'h0)];
              reg25 <= wire7[(4'hd):(2'h3)];
              reg26 <= $unsigned({$signed($signed(reg18[(3'h5):(1'h0)])),
                  {wire6[(3'h4):(1'h0)]}});
              reg27 <= $unsigned($signed($unsigned($unsigned((~&reg17)))));
              reg28 <= (~^{($signed((wire6 ? reg21 : reg14)) ?
                      reg15 : $signed((reg23 ? reg21 : wire12))),
                  ($unsigned((8'h9e)) ^~ $unsigned((^wire7)))});
            end
          if ($signed($unsigned($unsigned((^{reg25, (7'h42)})))))
            begin
              reg29 <= $signed(((8'hb9) | ({$signed(reg16)} & wire12)));
              reg30 <= $signed((({wire10[(3'h7):(1'h1)]} ^~ ((wire10 ?
                      reg21 : reg16) <= $unsigned(wire11))) ?
                  $signed($unsigned((|reg26))) : $signed(wire11[(1'h1):(1'h0)])));
              reg31 <= $signed($unsigned(({(reg20 ?
                      reg27 : reg28)} || (!(+reg23)))));
              reg32 <= ($signed($signed({$signed(wire6),
                  (reg20 ? reg21 : reg19)})) <<< (&(&(reg28[(4'he):(4'h9)] ?
                  reg31[(2'h3):(1'h1)] : reg22))));
            end
          else
            begin
              reg29 <= $unsigned($signed(((!reg14[(5'h12):(4'h8)]) ?
                  reg18 : (reg14 ? (&wire12) : (wire8 ? wire12 : reg19)))));
              reg30 <= ($signed(($unsigned({reg19, wire12}) ?
                      (&(reg28 * reg19)) : (wire12[(4'ha):(1'h0)] < (reg20 != reg28)))) ?
                  reg31[(4'h9):(3'h6)] : wire11[(2'h2):(2'h2)]);
              reg31 <= wire9[(4'ha):(3'h6)];
            end
          reg33 <= (($signed($signed($signed((7'h42)))) ?
              reg17 : reg15) * $unsigned(reg14));
        end
      reg34 <= $signed($unsigned((!reg24)));
    end
  assign wire35 = $signed($signed((&$unsigned((reg18 ? reg33 : wire7)))));
  assign wire36 = {(~^(($unsigned(wire6) ?
                          (wire12 ?
                              wire9 : reg22) : reg18[(3'h4):(2'h3)]) == (reg21 << (-reg17))))};
  assign wire37 = reg23;
  assign wire38 = reg17[(4'he):(3'h6)];
  assign wire39 = (+(((reg26 - (wire36 && wire13)) - {(8'ha5)}) ^ $signed(((-(8'had)) != (reg15 ?
                      wire9 : reg25)))));
  assign wire40 = $signed(reg16[(1'h0):(1'h0)]);
  assign wire41 = $signed($signed($signed($signed($unsigned(reg19)))));
  assign wire42 = reg25;
  assign wire43 = $signed((reg30 >= $unsigned($unsigned(((8'hae) ?
                      wire40 : wire11)))));
  assign wire44 = $unsigned((reg34[(1'h0):(1'h0)] < $unsigned((~&$signed(wire11)))));
endmodule

module module83
#(parameter param112 = ((((((7'h41) >>> (8'hba)) ? ((8'ha5) == (8'hb2)) : ((8'ha9) & (8'hb0))) ? (((8'hb7) <<< (8'hb0)) ? ((8'ha9) > (8'hb1)) : (8'hbc)) : (|((8'hbb) ? (8'ha2) : (8'hbb)))) ? (^~(&((8'hab) ^~ (8'hb8)))) : (-((8'hbe) > ((8'hb5) ? (8'hb6) : (8'hb8))))) ? ((8'hac) ? ((&{(8'h9d), (8'hb2)}) == (~^((8'hbc) == (8'hba)))) : (~&({(8'hb8)} ^ (8'ha1)))) : {((((8'h9d) ? (8'haf) : (8'hb6)) ? {(8'ha0), (8'h9c)} : {(8'hb7), (8'ha4)}) ? (!((8'hbb) & (8'hb7))) : {{(8'had), (8'ha2)}}), ((((8'ha6) ? (8'hb9) : (8'ha1)) ? (~^(8'ha3)) : {(7'h44)}) | (|((8'hb2) != (8'hb9))))}), 
parameter param113 = {({(~^(+(8'hb8)))} << {((-param112) ? (param112 ^ param112) : ((8'ha7) + (8'hba)))})})
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire87;
  input wire signed [(3'h7):(1'h0)] wire86;
  input wire signed [(4'hc):(1'h0)] wire85;
  input wire [(5'h10):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  assign y = {wire100,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire88 = wire84[(3'h7):(1'h1)];
  assign wire89 = $signed(($signed(((wire87 <= wire85) + (^wire85))) ?
                      (({wire84} ? $unsigned(wire84) : (-wire87)) ?
                          (&wire85[(4'hb):(4'h8)]) : $unsigned($unsigned((7'h40)))) : wire87[(3'h6):(3'h5)]));
  assign wire90 = (($signed($signed((^wire85))) <= wire84) >= wire89[(2'h2):(2'h2)]);
  assign wire91 = (7'h41);
  always
    @(posedge clk) begin
      reg92 <= $unsigned(wire90[(3'h6):(3'h6)]);
      reg93 <= $unsigned({$signed(wire89), wire91});
      reg94 <= ($signed(wire85) ?
          (|($signed(wire87[(4'h8):(3'h7)]) != {(wire87 ?
                  (8'ha4) : wire87)})) : $unsigned(wire85[(4'h9):(2'h3)]));
      reg95 <= $unsigned((~&(wire84 ?
          ($unsigned(wire89) ?
              (wire91 ? (8'hba) : wire91) : $unsigned(wire91)) : (+wire88))));
      if ({$signed(reg93[(4'he):(3'h4)]), wire89})
        begin
          reg96 <= $unsigned({wire87[(1'h1):(1'h1)]});
          reg97 <= wire90;
        end
      else
        begin
          reg96 <= reg97;
          reg97 <= (~$unsigned({$signed((reg93 <<< reg95))}));
          reg98 <= $signed((reg95[(2'h2):(1'h1)] <<< (reg94 ?
              ((7'h41) != {wire84, (8'hbe)}) : (&$unsigned(wire86)))));
          reg99 <= wire91[(3'h5):(3'h4)];
        end
    end
  assign wire100 = wire90[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg101 <= {{$signed((wire85[(4'hc):(4'h9)] <= (wire84 ?
                  (7'h43) : reg94))),
              (8'hb8)},
          wire88};
      reg102 <= $signed($signed(($signed({reg97}) - ($unsigned(wire89) >> reg95[(1'h1):(1'h0)]))));
      if ($signed(wire90[(2'h2):(2'h2)]))
        begin
          reg103 <= (wire88[(1'h0):(1'h0)] > $unsigned((((wire100 + reg99) ?
                  (&wire84) : (-(8'h9f))) ?
              {reg97[(4'hb):(3'h6)],
                  reg93[(3'h5):(3'h4)]} : reg102[(1'h1):(1'h1)])));
          if (reg96[(2'h2):(1'h0)])
            begin
              reg104 <= ((~{wire88}) >= $unsigned((({reg97, wire88} ?
                      $signed(wire84) : (reg103 ? reg103 : reg96)) ?
                  $unsigned((reg94 ? wire86 : reg92)) : {(wire91 ?
                          wire91 : reg95)})));
            end
          else
            begin
              reg104 <= $signed((wire87 ?
                  $unsigned((wire90[(4'h8):(3'h6)] ~^ (reg96 >>> wire91))) : $signed(reg104[(1'h1):(1'h1)])));
              reg105 <= (reg96 ?
                  $unsigned(($unsigned(wire89[(2'h2):(1'h1)]) ?
                      wire84 : (wire86[(3'h7):(2'h3)] > (-wire85)))) : $unsigned(wire87[(4'h9):(4'h9)]));
              reg106 <= $unsigned((8'ha4));
              reg107 <= $signed($unsigned($unsigned((reg106[(3'h7):(1'h0)] ?
                  (^wire86) : (wire85 >> wire86)))));
              reg108 <= (wire85[(1'h1):(1'h0)] ?
                  (!(reg93 | (~(reg96 == reg102)))) : (((^$unsigned(reg97)) ?
                      (reg102 | (8'hb1)) : $signed($unsigned(reg94))) < ((wire100[(3'h5):(3'h5)] ?
                          reg94[(2'h2):(1'h0)] : wire84) ?
                      $unsigned((|reg95)) : (~^(reg98 ? reg104 : reg103)))));
            end
          reg109 <= (reg98[(3'h6):(3'h4)] || $unsigned({(|(!wire87)),
              $unsigned((wire85 ? reg104 : wire90))}));
          reg110 <= ($signed({{{reg101, wire85}},
                  $unsigned((wire85 ? reg98 : reg96))}) ?
              ($unsigned($signed($unsigned(reg102))) ?
                  $signed(reg93[(4'h8):(2'h2)]) : $signed($unsigned($unsigned(wire88)))) : reg98[(2'h3):(1'h0)]);
          reg111 <= (8'hbd);
        end
      else
        begin
          reg103 <= ((~^(+($signed(wire88) ? $signed(reg104) : reg102))) ?
              (wire87[(2'h3):(1'h1)] ?
                  (reg109[(1'h0):(1'h0)] ?
                      {{reg98}} : ({wire87,
                          (8'ha0)} ^~ reg93)) : $unsigned((-((8'hbd) <= wire88)))) : (wire86[(2'h2):(2'h2)] >> (reg95 ?
                  $unsigned((reg108 ? reg97 : (8'hb8))) : {(reg93 ?
                          wire87 : (8'ha3))})));
          reg104 <= $unsigned({($signed(wire89[(1'h0):(1'h0)]) ?
                  ($unsigned(reg99) + (|reg98)) : (^wire85[(1'h1):(1'h0)]))});
          reg105 <= (^$signed($signed($signed($unsigned(reg97)))));
        end
    end
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire59;
  input wire [(5'h10):(1'h0)] wire58;
  input wire signed [(3'h5):(1'h0)] wire57;
  input wire signed [(4'he):(1'h0)] wire56;
  input wire signed [(5'h15):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg60 <= $unsigned((~|wire56[(1'h1):(1'h1)]));
      if ($unsigned($unsigned(wire55[(2'h3):(1'h0)])))
        begin
          reg61 <= (~|(~(^(reg60[(3'h4):(1'h1)] ?
              (wire57 ? wire59 : wire55) : $unsigned(wire56)))));
          reg62 <= wire59;
          reg63 <= $signed(((($unsigned(wire55) ?
                  reg62 : (reg62 ? (8'h9c) : wire59)) ?
              $unsigned(wire56[(4'ha):(2'h2)]) : ((reg61 | wire57) ^~ (|wire58))) || wire57[(1'h0):(1'h0)]));
        end
      else
        begin
          reg61 <= (reg63[(3'h5):(2'h2)] && $signed($unsigned($signed(wire57))));
          reg62 <= $unsigned((~&reg60[(1'h1):(1'h1)]));
        end
      reg64 <= ((7'h41) >> (~|$signed($signed($signed(reg60)))));
      reg65 <= $signed(((~^(reg61[(4'hc):(3'h5)] ?
              (wire56 & reg60) : (8'haa))) ?
          wire59[(2'h2):(1'h0)] : ((~&(wire57 ? wire56 : reg61)) ?
              reg63 : ((+reg62) ?
                  (wire57 ? wire57 : (8'hb1)) : wire56[(3'h6):(1'h0)]))));
      reg66 <= $unsigned($unsigned((wire59[(2'h2):(1'h0)] < {(^reg63)})));
    end
  assign wire67 = reg66;
  assign wire68 = wire56[(3'h5):(3'h4)];
  assign wire69 = (~|(8'h9f));
endmodule
