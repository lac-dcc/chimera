module top
#(parameter param129 = (~&((((~(8'hbd)) <= {(8'hae)}) >= (^~{(8'haa)})) ? (-(~^(~&(8'h9e)))) : ({((8'hb3) ? (8'hb7) : (8'hac))} ? (8'had) : {{(8'h9d), (7'h44)}, ((8'hb8) ? (8'hba) : (8'ha0))}))), 
parameter param130 = param129)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  assign y = {wire127, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3[(3'h7):(3'h4)] ?
                     $signed((~^$signed((~wire3)))) : ($unsigned((wire1[(2'h2):(2'h2)] == (8'hb1))) ?
                         ($signed(((8'ha8) ^~ (8'ha4))) ?
                             $unsigned({wire1, (7'h41)}) : {(-wire3),
                                 (wire2 ? (8'hb4) : wire3)}) : (~wire3)));
  assign wire5 = wire3;
  assign wire6 = (($unsigned(((wire0 ?
                         (8'hae) : (8'hb3)) + ((8'ha3) & wire3))) ?
                     (^wire1) : wire2[(3'h7):(1'h1)]) > ((^~wire0[(5'h14):(5'h14)]) ?
                     (({wire5} ?
                         (~^wire4) : {wire3}) & (&$signed(wire4))) : (((wire0 ?
                             wire0 : (8'ha1)) || wire5) ?
                         ((wire2 != wire4) || $signed(wire5)) : (((8'h9c) ?
                                 wire3 : (8'ha1)) ?
                             wire1[(2'h2):(2'h2)] : (|wire5)))));
  module7 #() modinst128 (wire127, clk, wire2, wire6, wire5, wire3);
endmodule

module module7
#(parameter param125 = {((~|(&(~^(8'hb4)))) <= (^(+((8'hb1) <= (8'hbe)))))}, 
parameter param126 = ((-({param125} ? ((param125 ? param125 : param125) ? (param125 ~^ (7'h40)) : (param125 | param125)) : param125)) & {((((8'hbe) > param125) ? param125 : (|param125)) ? param125 : (~&(param125 + param125)))}))
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire124;
  wire signed [(3'h5):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire117;
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire13,
                 wire15,
                 wire16,
                 wire21,
                 wire22,
                 wire73,
                 wire75,
                 wire117,
                 reg12,
                 reg14,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (|(&({wire8, (wire9 | wire9)} ^ (8'h9f))));
    end
  assign wire13 = $signed((wire10[(3'h6):(1'h1)] ?
                      wire9 : ({{wire11, (8'hba)}} ?
                          (&reg12[(3'h5):(3'h4)]) : $unsigned((+(8'ha1))))));
  always
    @(posedge clk) begin
      reg14 <= {reg12, (8'hb5)};
    end
  assign wire15 = wire10;
  assign wire16 = $unsigned(((~^({(8'ha9), reg14} | (8'h9e))) == (^~wire9)));
  always
    @(posedge clk) begin
      reg17 <= (^~wire11);
      reg18 <= reg17;
      reg19 <= wire16[(2'h3):(1'h1)];
      reg20 <= ($signed((reg12 - (!(~&reg19)))) ?
          reg19 : $unsigned((wire9[(5'h11):(3'h7)] >>> (|wire16[(1'h1):(1'h1)]))));
    end
  assign wire21 = (reg20[(3'h4):(3'h4)] ?
                      $unsigned(({wire11} <= ((!reg19) ?
                          (~wire8) : wire11))) : $unsigned((((reg17 ?
                              reg12 : wire11) <= $unsigned(reg17)) ?
                          ($signed(wire8) == $unsigned(wire16)) : wire15[(4'hb):(3'h6)])));
  assign wire22 = (!$signed(reg19));
  always
    @(posedge clk) begin
      reg23 <= (wire8 ?
          $unsigned($unsigned(reg14)) : $signed(($unsigned($signed(wire9)) - (reg18[(3'h4):(1'h1)] >> $signed(wire21)))));
      reg24 <= reg18;
      if (wire8[(3'h5):(3'h4)])
        begin
          reg25 <= (~|$signed((^~$signed({reg20, reg12}))));
          reg26 <= ($signed((~|wire15[(3'h4):(2'h3)])) >>> $unsigned({wire21}));
          if (reg24)
            begin
              reg27 <= (|($signed(((reg23 - reg17) ?
                      (wire15 ? reg20 : wire13) : wire13)) ?
                  {$signed($signed(reg19)),
                      $signed($unsigned(reg26))} : (&(^~wire9[(3'h4):(1'h1)]))));
              reg28 <= $signed(({(8'hbd)} - reg23[(4'hb):(2'h3)]));
            end
          else
            begin
              reg27 <= {reg23};
              reg28 <= ((!(((&wire15) + ((8'ha3) ?
                      (8'hbe) : wire11)) < (reg12 >> $signed((8'hae))))) ?
                  {(~{$unsigned(reg23), $unsigned(wire11)}),
                      $unsigned({reg27[(4'ha):(4'h8)],
                          (-wire10)})} : (!$unsigned((8'hbd))));
            end
          if ($unsigned(((reg20[(1'h1):(1'h1)] == reg25) ?
              $unsigned(reg12[(1'h1):(1'h1)]) : $unsigned(reg17))))
            begin
              reg29 <= (^($signed({$unsigned(wire15),
                  (~reg12)}) * $signed({wire13[(4'hc):(4'h9)]})));
              reg30 <= {$unsigned(reg29), wire11[(4'hc):(2'h3)]};
            end
          else
            begin
              reg29 <= reg28;
              reg30 <= wire11[(2'h2):(1'h1)];
              reg31 <= (8'hb8);
              reg32 <= reg29;
              reg33 <= ($signed((wire9 << $unsigned(reg32))) ?
                  $unsigned(reg25[(1'h1):(1'h0)]) : $signed(wire16[(1'h1):(1'h1)]));
            end
          reg34 <= $unsigned(reg24[(3'h4):(1'h0)]);
        end
      else
        begin
          reg25 <= ((~^(&$signed({reg29, reg24}))) ?
              (($signed((~^wire15)) ? wire11 : $unsigned(reg12)) ?
                  $unsigned($signed($unsigned(reg29))) : (^~(~^(wire22 <= (8'h9d))))) : {(8'had)});
          if ((reg27 * (~$signed((wire16 ? (^wire21) : wire16)))))
            begin
              reg26 <= (^(reg12 ? {(~&{wire21, reg17})} : $signed(reg31)));
            end
          else
            begin
              reg26 <= reg31;
              reg27 <= (8'haf);
              reg28 <= (^$unsigned((~^$signed((!wire13)))));
            end
          if (($unsigned((reg32[(1'h0):(1'h0)] ?
              wire16[(2'h2):(2'h2)] : $signed(wire22))) + reg19))
            begin
              reg29 <= (~reg17[(4'hb):(4'h8)]);
            end
          else
            begin
              reg29 <= $unsigned((&{$signed((reg26 ? (8'ha6) : reg14)),
                  {((8'ha4) ? reg17 : wire8)}}));
            end
        end
    end
  module35 #() modinst74 (wire73, clk, wire22, reg24, wire10, reg33);
  assign wire75 = wire9[(4'he):(2'h3)];
  module76 #() modinst118 (.clk(clk), .y(wire117), .wire79(wire21), .wire80(reg12), .wire78(wire75), .wire77(wire13));
  assign wire119 = (+(!(($signed((8'h9c)) && reg14) & wire8)));
  assign wire120 = $signed(reg23[(4'hf):(4'hf)]);
  assign wire121 = {reg14[(3'h7):(3'h6)]};
  assign wire122 = ({reg12[(3'h6):(1'h1)]} ?
                       reg23[(3'h4):(3'h4)] : ({$signed((~wire119))} ?
                           (~($signed(wire22) ?
                               $signed(wire13) : (^wire22))) : reg32[(1'h1):(1'h0)]));
  assign wire123 = $signed(($unsigned($unsigned(wire15[(4'hd):(3'h5)])) ?
                       (~^(reg30 ? (8'hae) : {wire120})) : {$signed((~&wire75)),
                           (&(reg31 ? reg26 : reg29))}));
  assign wire124 = $signed((-$unsigned((+{wire119}))));
endmodule

module module76
#(parameter param115 = ((^~(8'ha7)) << ({(!(8'hb9))} && ({((8'hb7) & (8'hbc))} ? (((8'hb7) ? (8'hae) : (8'hae)) + {(8'h9c), (8'had)}) : ((&(8'h9e)) ? ((8'hb8) ? (8'hbb) : (8'hae)) : ((8'haf) ? (7'h43) : (8'hb3)))))), 
parameter param116 = param115)
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire80;
  input wire [(4'ha):(1'h0)] wire79;
  input wire [(5'h15):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
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
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire81 = wire79[(3'h5):(3'h5)];
  assign wire82 = wire81;
  assign wire83 = $signed(wire78);
  assign wire84 = $signed((~^{(8'haf), (8'ha4)}));
  assign wire85 = wire82[(3'h7):(3'h7)];
  assign wire86 = (wire82 ?
                      (-wire79) : (({wire79[(4'h8):(2'h3)]} ?
                          (&$unsigned(wire81)) : $signed({wire84,
                              wire78})) ~^ $signed(($unsigned((8'haa)) ?
                          wire77 : $unsigned((8'hb5))))));
  assign wire87 = $signed(wire83[(3'h7):(3'h6)]);
  assign wire88 = (&wire78);
  assign wire89 = {wire79[(2'h3):(2'h2)],
                      {(($signed(wire83) <= (wire82 <<< wire85)) ~^ (wire80 ?
                              $signed(wire77) : wire78)),
                          ((wire85 ? $signed((8'hb5)) : (wire82 * wire81)) ?
                              (wire88 ?
                                  wire86[(1'h1):(1'h0)] : {wire83,
                                      (8'h9e)}) : ((wire85 ? wire77 : wire84) ?
                                  (wire83 ? wire81 : wire88) : wire85))}};
  always
    @(posedge clk) begin
      reg90 <= wire86[(1'h1):(1'h1)];
      reg91 <= (~&(&wire78));
      reg92 <= wire79[(3'h6):(1'h1)];
      reg93 <= ((!($signed((wire89 ^~ wire80)) ^ $signed($unsigned(wire77)))) ?
          (wire78 ?
              (!wire80[(1'h0):(1'h0)]) : (7'h42)) : (^wire89[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      if (wire82[(3'h5):(1'h1)])
        begin
          reg94 <= (wire81 ? $unsigned({wire77[(3'h5):(2'h2)]}) : (~|wire79));
          reg95 <= ((wire87 - (reg90 ?
              wire78 : ($unsigned(wire78) | wire81))) >= $unsigned($unsigned(wire82[(3'h7):(2'h2)])));
          reg96 <= (reg93 ?
              (~|(~{{(8'haa), reg95},
                  (wire87 << (8'hab))})) : (-$signed({$signed(wire85),
                  $signed(reg90)})));
        end
      else
        begin
          if ((wire80[(2'h3):(1'h1)] >= ((~^({(8'hbc),
              reg93} | $signed(wire81))) << wire87[(2'h3):(1'h1)])))
            begin
              reg94 <= (8'h9f);
            end
          else
            begin
              reg94 <= ((($unsigned($unsigned(wire80)) ?
                  $unsigned($unsigned(reg93)) : $signed((&reg93))) - (-(-(reg96 < (8'ha4))))) & wire84[(1'h1):(1'h0)]);
              reg95 <= wire78[(2'h2):(1'h0)];
              reg96 <= wire79;
            end
          reg97 <= ($unsigned(wire88[(3'h6):(1'h1)]) && $signed({reg91[(2'h2):(2'h2)]}));
          reg98 <= {(((reg91[(1'h1):(1'h1)] ?
                      wire79[(4'ha):(4'ha)] : (reg90 ?
                          (7'h43) : reg93)) | $unsigned((^~reg97))) ?
                  $unsigned(((wire79 ?
                      reg90 : wire81) != wire83[(4'hd):(3'h4)])) : (wire82 ?
                      ((wire79 ? wire79 : reg93) ?
                          (reg96 != wire77) : (~&wire89)) : wire89[(1'h0):(1'h0)])),
              $signed(((8'ha1) >= wire83[(5'h10):(4'h8)]))};
        end
      reg99 <= ($signed((~^(reg92[(2'h2):(2'h2)] & $unsigned(reg90)))) >= reg90[(2'h2):(1'h1)]);
      reg100 <= (reg95 ?
          (!$signed(wire87[(1'h1):(1'h1)])) : ($signed($unsigned((reg90 ?
                  wire81 : wire85))) ?
              ($signed((&wire82)) ?
                  reg97 : reg95[(4'h9):(3'h5)]) : reg90[(1'h0):(1'h0)]));
      if ((+reg93[(1'h0):(1'h0)]))
        begin
          reg101 <= reg96;
          reg102 <= $signed((~^$signed($unsigned((reg93 > reg101)))));
          if ({$signed(wire87[(2'h3):(2'h2)])})
            begin
              reg103 <= (wire88[(3'h4):(3'h4)] ?
                  ((~wire82[(1'h1):(1'h1)]) ?
                      reg101 : (~^((reg91 == wire83) >>> wire85[(1'h1):(1'h1)]))) : $unsigned(($unsigned(reg96) << $unsigned($signed(wire89)))));
              reg104 <= ((wire78 << ({(|wire77)} ?
                      reg103 : $unsigned(reg100[(1'h1):(1'h0)]))) ?
                  reg91 : $unsigned(((~^reg94[(1'h1):(1'h0)]) ?
                      ({(8'had), reg93} ?
                          {wire85, (8'h9c)} : (~|wire80)) : {{reg100,
                              reg90}})));
              reg105 <= reg91;
              reg106 <= reg100;
              reg107 <= (8'ha4);
            end
          else
            begin
              reg103 <= $signed($unsigned({reg102[(5'h11):(3'h6)]}));
              reg104 <= ($signed((wire81 ?
                      (7'h43) : ((reg93 & wire80) ? reg96 : reg91))) ?
                  reg90 : wire84[(2'h2):(1'h0)]);
              reg105 <= {$signed({{(reg90 ? reg97 : wire89)}}), reg103};
              reg106 <= $signed(wire85);
            end
        end
      else
        begin
          reg101 <= reg92[(2'h2):(2'h2)];
          reg102 <= ((reg103[(5'h12):(1'h0)] ?
                  $signed($unsigned((!(8'haa)))) : wire87) ?
              (~$unsigned(((~^reg100) < wire83[(2'h3):(1'h0)]))) : (reg95 & (reg92 << (~^$unsigned(wire85)))));
        end
    end
  assign wire108 = $signed({wire77, wire86[(1'h1):(1'h0)]});
  assign wire109 = $signed((reg104 <= (wire82 ?
                       ({reg93, reg90} ?
                           (reg94 ?
                               wire87 : wire84) : $signed(reg101)) : $signed((^wire82)))));
  assign wire110 = ((^$signed(wire78[(4'hc):(2'h2)])) ?
                       ((wire81[(3'h4):(1'h1)] > $unsigned(wire108)) ^~ ((^~reg107[(2'h3):(2'h3)]) ?
                           ($signed(reg104) ?
                               wire78[(5'h10):(4'hd)] : (~wire82)) : (~{(8'ha9)}))) : reg106[(3'h5):(2'h2)]);
  assign wire111 = {({(8'h9c)} ^ reg97[(1'h1):(1'h1)]),
                       $signed({reg100, $signed($unsigned(wire89))})};
  assign wire112 = reg96[(3'h4):(2'h2)];
  assign wire113 = (reg98 >= $signed(wire108));
  assign wire114 = (({wire81, (~$signed(wire112))} ?
                       (wire88[(2'h2):(2'h2)] ?
                           (-$signed(reg93)) : (~|(reg107 ~^ reg106))) : reg95[(4'hb):(3'h4)]) >> wire83);
endmodule

module module35
#(parameter param71 = (((~(((8'ha4) > (8'hae)) >> ((8'hba) ? (8'hb3) : (8'hb8)))) ? (^((^~(8'hb8)) ? (~&(8'h9f)) : ((8'hae) ? (8'h9e) : (8'ha8)))) : ((~|{(8'hbf)}) ? ({(8'hb8), (8'haa)} & ((7'h42) & (8'h9c))) : (~{(8'ha8)}))) ? {((~&((8'ha5) ? (8'hbd) : (8'ha5))) != (((8'hab) != (8'ha9)) == (~&(8'h9d)))), ((((8'hae) ? (8'hba) : (7'h40)) ? ((8'hbc) > (8'ha8)) : {(8'haa), (8'hb3)}) ? {((8'ha0) + (8'haf)), ((8'ha5) < (8'ha7))} : ({(7'h43)} ? {(8'ha3), (8'h9d)} : (-(8'haa))))} : ((({(8'h9d)} ? ((8'hb9) <<< (8'ha9)) : {(8'hb0), (8'hb5)}) || (-((8'h9f) ? (8'ha7) : (7'h40)))) ? (|(((8'ha9) ? (8'h9d) : (8'hbb)) ^~ ((8'hbb) || (8'hba)))) : ((((8'hbe) * (8'hbe)) ? (8'ha9) : ((7'h40) ? (7'h41) : (8'hb0))) ^~ (8'hbe)))), 
parameter param72 = (~(~&(8'hbd))))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire39;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire [(5'h15):(1'h0)] wire37;
  input wire [(5'h10):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= $signed($signed({wire39[(4'hb):(3'h4)]}));
      reg41 <= $unsigned((((wire39[(3'h7):(1'h0)] < {wire37}) ?
          $unsigned((~|(8'hbb))) : ((|(8'hbd)) && $signed(wire39))) < ((8'hb5) <<< $signed(wire37[(4'hd):(1'h1)]))));
      if ((8'hb4))
        begin
          reg42 <= (^~(wire37 ?
              $unsigned($signed(wire36[(1'h0):(1'h0)])) : wire36));
          reg43 <= wire39;
          reg44 <= ((reg42 + ((&reg41) ?
                  ((wire39 ? wire39 : reg41) - (+reg43)) : wire39)) ?
              $signed((|(wire39[(4'h9):(3'h5)] ?
                  reg40 : (reg41 ^~ wire36)))) : ($signed(wire37) ?
                  reg41[(1'h0):(1'h0)] : ($unsigned((^reg42)) ?
                      $signed($signed(reg40)) : ((reg41 ? wire39 : wire39) ?
                          (reg42 ? reg41 : wire37) : $signed(wire37)))));
          reg45 <= wire38;
        end
      else
        begin
          reg42 <= $signed($signed($signed(((reg40 ? wire36 : wire38) ?
              $unsigned(reg42) : (reg42 ? reg42 : wire36)))));
        end
      reg46 <= ((+$signed({(reg44 ? reg43 : wire39), wire36[(5'h10):(4'h9)]})) ?
          $unsigned((reg44 ^ reg45)) : (~^$signed({reg40[(2'h2):(2'h2)],
              wire36})));
      if ((reg46[(4'hb):(2'h2)] ?
          ((wire37[(4'he):(3'h7)] ?
              ($unsigned(reg44) ?
                  $unsigned(reg44) : (-reg42)) : (8'hbc)) >>> reg41[(1'h1):(1'h1)]) : ((reg45 == (wire36[(4'hf):(3'h6)] ?
              $signed(reg40) : (~^wire38))) <= $signed(((~|reg43) <= {wire36})))))
        begin
          reg47 <= ((8'hb9) & ((wire36[(3'h4):(1'h1)] && (~^$signed(reg46))) ?
              (reg43[(2'h2):(1'h0)] >= ((-(8'hb9)) != reg42[(5'h11):(4'h8)])) : $signed(($signed(reg44) ?
                  $unsigned(wire39) : (reg42 + reg44)))));
          reg48 <= $unsigned(reg41);
          reg49 <= (((({(7'h44), reg40} ?
                  $unsigned(reg46) : (^(8'ha4))) > $unsigned($unsigned(reg43))) ?
              ($unsigned(reg47) ?
                  wire39 : $signed((wire37 ? reg40 : reg40))) : (reg43 ?
                  $unsigned({reg44,
                      (8'hb8)}) : reg47)) - $unsigned($unsigned(reg41)));
        end
      else
        begin
          reg47 <= $unsigned(reg49);
          reg48 <= wire36;
          reg49 <= (^~wire39[(4'h8):(1'h0)]);
        end
    end
  assign wire50 = reg42[(4'ha):(3'h7)];
  assign wire51 = (!(~|$signed($signed($signed(reg47)))));
  assign wire52 = $signed($signed($unsigned($signed($unsigned(reg46)))));
  assign wire53 = wire52[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      if ((!reg42[(4'h8):(2'h3)]))
        begin
          if ({$unsigned(reg42),
              (reg44[(4'h8):(3'h5)] - (reg46[(4'hb):(3'h7)] ?
                  (wire36 ?
                      $signed(reg45) : $signed(reg47)) : (reg42 & {wire37})))})
            begin
              reg54 <= (~(~&wire50));
              reg55 <= ($signed((~|($signed(reg48) << reg46[(4'hb):(4'ha)]))) ?
                  $signed(reg54[(1'h0):(1'h0)]) : {wire51[(1'h1):(1'h0)],
                      (~|((+wire37) ? $signed(reg49) : {wire50, reg40}))});
              reg56 <= (~((~&(-wire53[(1'h0):(1'h0)])) ?
                  wire52[(4'hd):(4'hb)] : (($unsigned(reg55) >= {reg45,
                          reg41}) ?
                      ($signed(reg54) ?
                          $unsigned(reg46) : (reg47 & wire38)) : reg47[(2'h3):(1'h0)])));
            end
          else
            begin
              reg54 <= ($unsigned((^$signed((8'ha9)))) ?
                  (reg42 && (reg46[(3'h4):(1'h1)] ?
                      wire36[(4'h9):(4'h8)] : {(|wire38),
                          {wire53}})) : (8'hbc));
            end
          reg57 <= $signed($signed($unsigned((^reg42[(3'h7):(3'h7)]))));
        end
      else
        begin
          if ($signed({(!$unsigned({(8'hae), reg47})), wire53[(5'h12):(4'h8)]}))
            begin
              reg54 <= $signed(($signed(wire51) - (~&reg57)));
              reg55 <= $signed((+wire50));
              reg56 <= reg45[(4'ha):(3'h7)];
              reg57 <= (wire38[(4'h8):(1'h0)] & {wire37[(1'h1):(1'h1)],
                  wire51[(1'h1):(1'h0)]});
              reg58 <= reg43[(2'h3):(2'h2)];
            end
          else
            begin
              reg54 <= {(8'hb7),
                  ((8'h9c) ?
                      ($signed(reg54) ?
                          ((reg49 ?
                              reg49 : (8'ha1)) <<< reg55) : reg54) : wire39)};
            end
        end
      reg59 <= wire39;
      reg60 <= ((reg59 <= ($signed({reg45, wire36}) ?
              ($unsigned(wire37) ? reg56 : (~^wire36)) : $signed(wire39))) ?
          ($signed($signed(reg40)) < (~|{reg41})) : (reg57[(2'h2):(2'h2)] <= (8'ha4)));
    end
  assign wire61 = $unsigned(wire37);
  assign wire62 = $unsigned(reg48[(1'h1):(1'h1)]);
  assign wire63 = reg49[(1'h0):(1'h0)];
  assign wire64 = $unsigned(reg46[(3'h5):(3'h4)]);
  assign wire65 = $unsigned((~&reg41));
  assign wire66 = $signed((wire50 ?
                      $unsigned(reg46) : $signed((+wire62[(4'hd):(2'h3)]))));
  assign wire67 = (reg56 ?
                      ($unsigned(((wire63 ? (7'h41) : reg45) << {(8'ha7),
                          wire61})) >= $unsigned($unsigned(wire65))) : {$signed($unsigned(wire38[(4'h9):(1'h1)]))});
  assign wire68 = $signed(wire66);
  assign wire69 = {$unsigned(reg41[(1'h1):(1'h0)])};
  assign wire70 = (~&($signed(reg48[(2'h2):(2'h2)]) ?
                      ($unsigned(((8'hb0) == wire64)) != {reg56[(5'h10):(4'h9)],
                          reg59[(2'h2):(2'h2)]}) : $unsigned((!(^reg41)))));
endmodule
