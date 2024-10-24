module top
#(parameter param194 = (({(((8'hab) ? (8'hba) : (8'h9c)) >= ((8'hb5) ? (7'h41) : (8'hbf))), (((8'ha3) ~^ (8'ha6)) ? ((8'hbf) ^ (8'hb0)) : ((8'ha4) ? (8'ha8) : (8'hb2)))} || ({((8'hb6) ? (8'h9c) : (8'haf))} ? (((8'haa) ? (8'ha1) : (8'ha5)) && (~|(8'ha5))) : ((|(8'ha9)) ? ((7'h44) > (8'hb0)) : (!(8'hae))))) ^ (+({{(8'hb6), (8'hb8)}, {(8'hbb)}} <= ((7'h42) ^ (&(8'hbd)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h290):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire192;
  wire signed [(5'h13):(1'h0)] wire191;
  wire [(5'h13):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire172;
  wire [(4'hf):(1'h0)] wire171;
  wire signed [(5'h11):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire163;
  wire signed [(3'h5):(1'h0)] wire165;
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire174,
                 wire172,
                 wire171,
                 wire170,
                 wire167,
                 wire71,
                 wire7,
                 wire6,
                 wire5,
                 wire73,
                 wire163,
                 wire165,
                 reg190,
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
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg173,
                 reg169,
                 reg168,
                 reg21,
                 reg20,
                 reg19,
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
                 (1'h0)};
  assign wire5 = (wire3[(4'ha):(1'h0)] >= ((+((~(8'ha7)) ?
                         (wire3 != (8'hb7)) : (8'hb3))) ?
                     wire3[(3'h7):(3'h4)] : (~(+wire1[(3'h6):(3'h6)]))));
  assign wire6 = ((wire2[(1'h1):(1'h0)] ?
                     (wire0[(2'h3):(2'h2)] <<< wire0[(5'h10):(4'hd)]) : wire1) >= $unsigned(wire5));
  assign wire7 = $unsigned((^wire2));
  always
    @(posedge clk) begin
      reg8 <= $signed(((wire3[(4'ha):(1'h1)] - {$signed((8'hb0)),
          wire5[(4'h9):(3'h6)]}) & (8'ha1)));
      reg9 <= (!wire7[(3'h7):(1'h0)]);
      if (($unsigned(wire5) ?
          $signed((wire1[(4'ha):(3'h6)] ?
              $signed(wire0) : (wire3 ?
                  wire2 : $unsigned(wire3)))) : (^(+{$unsigned(wire2),
              (^reg8)}))))
        begin
          reg10 <= (wire0[(4'h8):(2'h3)] ?
              {wire5[(2'h3):(1'h1)]} : $signed(wire2));
          if (($unsigned(((!(reg9 - (8'h9d))) >>> $signed(wire7[(3'h7):(3'h4)]))) < ((^~($signed(wire7) ?
              $signed(wire3) : (wire1 * (8'ha6)))) ~^ (((-wire3) != wire3[(1'h0):(1'h0)]) ?
              (|$unsigned(reg8)) : $signed(wire6[(3'h6):(2'h3)])))))
            begin
              reg11 <= $unsigned((&wire7));
              reg12 <= {$unsigned((8'hb9)), $unsigned($signed({(^wire4)}))};
              reg13 <= $unsigned({({(wire3 ? (8'had) : wire1),
                          $unsigned(wire3)} ?
                      {$unsigned(wire4)} : ((reg11 & wire1) ?
                          ((8'hb2) >= wire5) : {wire2, reg8})),
                  wire4[(3'h6):(3'h5)]});
            end
          else
            begin
              reg11 <= (wire5[(3'h7):(1'h0)] ?
                  $unsigned({$unsigned((wire0 > reg13)),
                      ((wire3 ?
                          reg11 : wire2) <<< $signed(wire2))}) : $signed((((8'hb8) > (reg13 + wire5)) << $unsigned({wire3,
                      wire7}))));
              reg12 <= reg10;
            end
        end
      else
        begin
          reg10 <= $signed($unsigned($unsigned($unsigned({(8'hb7)}))));
        end
      reg14 <= wire1[(3'h4):(2'h3)];
      if (($signed($signed(((~wire2) ?
              (wire6 ? (8'hbd) : wire7) : $signed(reg11)))) ?
          (reg14 * (wire3 - (8'ha7))) : reg14[(2'h3):(1'h1)]))
        begin
          reg15 <= (~|$signed((|$unsigned({wire5}))));
          reg16 <= (wire7[(2'h3):(1'h0)] ?
              (+(wire2 ?
                  (wire7[(1'h1):(1'h0)] ?
                      wire5 : (wire4 ?
                          wire2 : reg14)) : (!$signed(wire3)))) : reg10);
          reg17 <= (~|reg15[(2'h2):(1'h0)]);
          if (wire7[(1'h1):(1'h1)])
            begin
              reg18 <= reg9[(3'h6):(1'h1)];
              reg19 <= reg14;
              reg20 <= ((~|reg18[(3'h7):(3'h4)]) ?
                  $unsigned({(8'hb0),
                      wire0[(2'h3):(2'h2)]}) : {{{(wire7 >>> wire1)}, reg13}});
            end
          else
            begin
              reg18 <= {($signed(reg10) ?
                      (~^(!{reg17})) : $unsigned({((8'hb5) && wire5),
                          (reg17 ? wire4 : reg18)})),
                  $signed(($unsigned((!reg14)) ?
                      reg14[(5'h10):(2'h3)] : {$signed(reg14)}))};
            end
          reg21 <= (wire2[(4'ha):(3'h4)] && (!reg15[(1'h1):(1'h1)]));
        end
      else
        begin
          reg15 <= $signed({((|$signed(wire0)) ?
                  $unsigned((wire0 < wire0)) : (-(&(8'ha6))))});
          reg16 <= wire4;
        end
    end
  module22 #() modinst72 (wire71, clk, wire3, wire6, wire5, reg10);
  assign wire73 = (^~(wire4 << reg18[(2'h2):(2'h2)]));
  module74 #() modinst164 (.wire76(wire0), .wire77(reg14), .wire78(wire7), .clk(clk), .wire75(reg21), .y(wire163));
  module126 #() modinst166 (.wire129(wire3), .y(wire165), .clk(clk), .wire127(wire4), .wire128(wire7), .wire130(reg8));
  assign wire167 = ((wire7 ^~ {$signed(wire71), reg15}) ?
                       wire7 : $unsigned({{wire7[(4'he):(4'he)],
                               $unsigned(reg13)},
                           {$signed(reg19), reg10}}));
  always
    @(posedge clk) begin
      reg168 <= wire167;
      reg169 <= (&wire7[(4'hc):(3'h6)]);
    end
  assign wire170 = (~&wire165);
  assign wire171 = reg168[(1'h1):(1'h0)];
  assign wire172 = wire163;
  always
    @(posedge clk) begin
      reg173 <= $signed(((!((wire165 && reg11) ?
              (wire0 ? wire7 : reg20) : reg19[(5'h11):(4'he)])) ?
          wire6 : (reg13[(3'h7):(3'h5)] ?
              wire3[(2'h2):(2'h2)] : ((wire73 < wire1) + $signed(reg168)))));
    end
  assign wire174 = $signed(wire1[(4'ha):(3'h6)]);
  always
    @(posedge clk) begin
      if (reg8)
        begin
          reg175 <= {(|reg13[(1'h1):(1'h0)]), wire71};
          if (($signed($signed(((-reg16) ?
              $unsigned(wire165) : $signed(reg19)))) == wire165[(1'h1):(1'h0)]))
            begin
              reg176 <= ((^~wire3) ?
                  (|(^$unsigned(wire71))) : (((!reg19) ^ wire71[(2'h2):(1'h0)]) << (($unsigned(reg11) ?
                      reg21[(4'hb):(2'h3)] : $signed(reg169)) != $unsigned($unsigned(reg17)))));
              reg177 <= reg176[(4'he):(2'h3)];
              reg178 <= ((((8'hb1) ~^ (!$signed(reg19))) ?
                  ($signed((reg169 || reg21)) > wire171[(4'h8):(3'h4)]) : {wire167}) <<< (($unsigned(reg17) >= reg8) ?
                  $signed($unsigned($signed(reg17))) : reg10));
              reg179 <= reg21[(2'h3):(2'h3)];
            end
          else
            begin
              reg176 <= $signed(reg17);
              reg177 <= (~(~|wire1));
              reg178 <= $signed((({(~wire2), $unsigned(reg20)} ?
                      $unsigned(reg177[(1'h1):(1'h0)]) : (~&$signed(wire167))) ?
                  $signed($unsigned((reg179 ? wire5 : reg21))) : reg8));
              reg179 <= $unsigned((~$signed(wire174)));
            end
          if (wire165[(2'h2):(1'h0)])
            begin
              reg180 <= ((^~wire2) || reg168);
              reg181 <= ({{((wire1 ? reg14 : wire2) ?
                              $unsigned(wire2) : (reg19 ? wire1 : wire171))},
                      (((wire5 ?
                          reg15 : reg177) << (wire5 | reg8)) && reg18[(3'h4):(3'h4)])} ?
                  $unsigned((reg9[(3'h5):(3'h4)] < ($signed(wire6) ?
                      $signed(reg13) : (wire171 * reg17)))) : wire172);
              reg182 <= ((reg11[(2'h2):(1'h0)] ~^ (+reg16[(4'h8):(3'h7)])) >>> $signed(((wire174[(4'he):(4'he)] << reg8[(2'h2):(2'h2)]) - wire1[(3'h6):(3'h5)])));
              reg183 <= reg173[(3'h6):(3'h4)];
            end
          else
            begin
              reg180 <= reg8;
              reg181 <= ({reg17[(1'h0):(1'h0)]} <= reg175);
              reg182 <= {((((~&wire4) << reg19) >>> (^~{reg15, reg19})) ?
                      reg177[(1'h0):(1'h0)] : (~($signed(reg178) + reg182[(2'h3):(2'h3)]))),
                  $signed(((reg168 - reg178) ?
                      reg12[(3'h5):(1'h0)] : (^$unsigned(reg175))))};
              reg183 <= (reg10[(3'h6):(3'h6)] ?
                  $signed(wire171) : $unsigned({wire5}));
              reg184 <= wire73;
            end
          reg185 <= (reg179 ?
              (&$signed(($signed(reg14) ?
                  $unsigned(wire4) : (~wire2)))) : (~|$signed(reg169)));
          reg186 <= (($signed(reg179) ?
                  {wire174, (^$unsigned(wire170))} : reg168[(3'h6):(1'h0)]) ?
              (8'hbf) : $unsigned((($signed(wire1) ?
                  (^reg175) : $unsigned(reg176)) << {{wire2, reg176},
                  (reg20 <= reg181)})));
        end
      else
        begin
          reg175 <= ($unsigned((((reg8 ~^ (8'haf)) >= $signed(reg168)) ?
              wire163 : ({reg19} ?
                  {wire170,
                      wire3} : reg9[(4'h9):(2'h2)]))) ~^ (~($signed((reg186 & reg173)) ?
              {$signed((8'ha8))} : $signed($unsigned(wire0)))));
          if (($signed((~$signed($unsigned((8'hb2))))) ?
              ($signed((7'h41)) + {(!$unsigned(wire165)),
                  wire73[(1'h0):(1'h0)]}) : wire73))
            begin
              reg176 <= reg178[(3'h4):(1'h0)];
              reg177 <= (reg185 ? (8'hb0) : (reg175 ^ wire71[(1'h0):(1'h0)]));
            end
          else
            begin
              reg176 <= $signed(wire172);
              reg177 <= {(reg20 && reg184), reg21[(4'hb):(2'h3)]};
            end
          reg178 <= reg11[(1'h0):(1'h0)];
          if ((wire3[(3'h5):(2'h2)] ?
              $signed($signed(((reg19 + reg14) ?
                  (reg9 ? reg13 : wire5) : $signed(reg181)))) : (~&wire174)))
            begin
              reg179 <= (({wire170[(4'hb):(2'h2)]} > ({(reg181 ?
                          reg10 : reg19)} ?
                  $signed($unsigned((7'h43))) : (-(wire170 << (8'hbd))))) * (reg15[(1'h0):(1'h0)] ?
                  $signed($unsigned((reg18 ? reg186 : reg185))) : (8'hbf)));
            end
          else
            begin
              reg179 <= (!reg173);
              reg180 <= {reg19, wire163};
            end
        end
      reg187 <= $unsigned($signed((($unsigned(reg10) ?
          {wire167} : $unsigned((8'ha4))) >> ((reg185 || wire0) | {wire171,
          reg18}))));
      reg188 <= {{(+reg173[(3'h5):(1'h0)])},
          (((^(wire1 != reg10)) ?
                  reg10[(3'h7):(3'h4)] : (wire3[(3'h4):(1'h1)] ?
                      $signed((8'ha5)) : wire5)) ?
              reg187 : ((-reg20[(1'h1):(1'h1)]) ?
                  (((8'hb8) == reg21) ?
                      (~wire167) : ((8'hb5) ?
                          reg178 : (8'hb8))) : wire171[(4'he):(4'he)]))};
      reg189 <= wire4[(2'h2):(2'h2)];
      reg190 <= $unsigned((reg15[(2'h3):(1'h0)] >>> wire4));
    end
  assign wire191 = $unsigned((reg173[(1'h1):(1'h0)] && $signed((&wire71[(4'hc):(2'h2)]))));
  module79 #() modinst193 (wire192, clk, wire1, reg19, reg18, wire172);
endmodule

module module74  (y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire78;
  input wire signed [(5'h15):(1'h0)] wire77;
  input wire signed [(4'hc):(1'h0)] wire76;
  input wire signed [(5'h13):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire156;
  wire [(2'h2):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire119;
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire154,
                 wire125,
                 wire124,
                 wire123,
                 wire121,
                 wire119,
                 reg122,
                 (1'h0)};
  module79 #() modinst120 (wire119, clk, wire75, wire78, wire76, wire77);
  assign wire121 = wire76;
  always
    @(posedge clk) begin
      reg122 <= $signed($signed(wire76[(4'h9):(3'h5)]));
    end
  assign wire123 = $unsigned((~|((-(~wire76)) ?
                       ((reg122 ^ wire119) <<< $unsigned(wire77)) : wire121[(1'h1):(1'h0)])));
  assign wire124 = wire75;
  assign wire125 = wire123[(4'h8):(4'h8)];
  module126 #() modinst155 (.clk(clk), .wire130(wire123), .wire129(wire124), .wire127(wire119), .wire128(wire125), .y(wire154));
  assign wire156 = wire154;
  assign wire157 = (^$signed((!wire78)));
  assign wire158 = $unsigned($signed(((!$unsigned(wire76)) <<< {$unsigned(wire125),
                       (wire78 ? wire154 : wire154)})));
  assign wire159 = wire157[(2'h2):(1'h0)];
  assign wire160 = wire77[(5'h10):(2'h2)];
  assign wire161 = wire156[(4'ha):(2'h2)];
  assign wire162 = wire75;
endmodule

module module22
#(parameter param70 = {({(((8'ha3) >> (7'h44)) << (~&(8'hbd))), (&(^(8'hbb)))} | ((((8'hac) ? (7'h41) : (8'h9c)) >>> ((8'hbb) ? (8'had) : (8'ha4))) ^ {((8'hac) ? (8'ha6) : (8'ha5)), {(8'hb7)}})), (((((8'hb0) ? (8'hba) : (7'h43)) ? ((8'hba) ^~ (8'hbd)) : ((8'hba) ? (7'h42) : (8'hae))) ? (^~((8'ha8) || (8'haf))) : {(&(8'hba)), (~|(8'ha0))}) ? (((^(7'h42)) ^~ ((8'hba) ? (8'hbb) : (8'ha6))) <<< (~&(8'ha1))) : (+(-((8'hb6) ? (8'hbf) : (8'ha7)))))})
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire27;
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire65,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire40,
                 wire27,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire27 = ((+wire24) <= (wire25[(2'h2):(1'h1)] < $unsigned(((wire26 ?
                          wire25 : wire26) ?
                      $signed((8'hbc)) : (wire25 > wire25)))));
  module28 #() modinst41 (.clk(clk), .wire32(wire26), .wire30(wire25), .y(wire40), .wire31(wire23), .wire29(wire24));
  always
    @(posedge clk) begin
      reg42 <= $signed({($unsigned({wire24, wire26}) <= (((7'h40) & wire27) ?
              $unsigned(wire40) : (wire24 & wire25)))});
      reg43 <= wire26;
    end
  assign wire44 = $unsigned(reg42[(4'h8):(3'h5)]);
  assign wire45 = (!((+(wire27[(2'h2):(1'h0)] ?
                      $unsigned(reg42) : $unsigned(reg42))) == wire24));
  assign wire46 = $unsigned((wire24[(3'h4):(3'h4)] ?
                      {wire45[(1'h0):(1'h0)]} : wire23[(4'h9):(1'h1)]));
  assign wire47 = ($signed((~(~|wire26[(1'h0):(1'h0)]))) >>> (~&(~|((wire46 > wire40) << $unsigned(wire45)))));
  assign wire48 = $signed($signed((8'ha4)));
  assign wire49 = wire46;
  assign wire50 = $unsigned(reg43);
  always
    @(posedge clk) begin
      if ($unsigned((wire49 ?
          (+$unsigned({wire44, wire44})) : $unsigned({reg42}))))
        begin
          reg51 <= wire44[(1'h0):(1'h0)];
          reg52 <= ($unsigned(reg51) < wire23[(3'h7):(1'h0)]);
        end
      else
        begin
          reg51 <= wire40[(1'h1):(1'h1)];
          if (((($unsigned($signed(wire27)) || {$signed(wire24),
                      $signed(wire40)}) ?
                  wire49[(5'h12):(3'h4)] : $unsigned($unsigned($unsigned((8'hab))))) ?
              $signed($unsigned({$signed(wire27),
                  wire44[(3'h5):(2'h3)]})) : reg43))
            begin
              reg52 <= reg43;
              reg53 <= $unsigned((wire40[(2'h2):(1'h0)] ?
                  $signed(($unsigned((8'hb4)) ?
                      $signed(wire40) : (wire44 <<< wire23))) : wire26));
              reg54 <= {(^~(((wire24 ? (8'ha1) : wire44) | reg52) ?
                      $unsigned((reg43 ?
                          wire23 : reg52)) : (~&$signed(reg43))))};
            end
          else
            begin
              reg52 <= reg42;
              reg53 <= wire50[(4'hb):(4'ha)];
              reg54 <= reg52;
              reg55 <= ($signed(wire49) ?
                  (((~$signed((8'hba))) ?
                          $signed(wire45[(2'h3):(1'h1)]) : $signed(reg54[(5'h10):(4'h8)])) ?
                      $unsigned((|wire44[(1'h0):(1'h0)])) : {({wire40} >= wire49[(4'hc):(4'h8)])}) : (-((wire46 ^~ {(7'h41),
                      wire44}) ^~ $signed({wire25, (7'h41)}))));
            end
          if (($signed(wire44) ?
              $signed($unsigned(wire50)) : (^~(-$unsigned({reg54})))))
            begin
              reg56 <= wire26[(2'h2):(2'h2)];
              reg57 <= (wire50[(4'h9):(3'h4)] ?
                  wire46[(3'h5):(2'h3)] : wire44[(3'h6):(1'h0)]);
              reg58 <= $unsigned({$unsigned(wire49[(4'hd):(2'h2)]), wire50});
            end
          else
            begin
              reg56 <= $signed(wire46);
            end
        end
      reg59 <= $unsigned(reg53[(1'h1):(1'h1)]);
      if (wire27)
        begin
          reg60 <= $unsigned(wire48[(3'h7):(3'h7)]);
          reg61 <= reg52;
          reg62 <= reg60[(4'ha):(2'h3)];
          reg63 <= (wire40 & $unsigned({(!wire46)}));
          reg64 <= ($unsigned(wire24[(2'h3):(2'h3)]) ?
              (reg63 > wire47) : wire45);
        end
      else
        begin
          reg60 <= ($unsigned((8'hb0)) * reg54);
          reg61 <= wire50;
          reg62 <= $signed({reg61[(3'h5):(3'h4)]});
        end
    end
  assign wire65 = $signed($signed({(~^(reg60 == reg51)),
                      ($signed(reg43) | (wire27 - (8'ha9)))}));
  always
    @(posedge clk) begin
      reg66 <= (reg54 == $signed(wire49));
      reg67 <= {$unsigned((reg58[(3'h5):(3'h4)] * $unsigned($unsigned(reg58))))};
      reg68 <= (((8'hb1) <= wire50) >> (wire45 + {reg61,
          wire48[(4'ha):(4'ha)]}));
      reg69 <= ($unsigned((((wire45 ?
              reg42 : wire65) ~^ wire26[(3'h4):(2'h3)]) * wire26)) ?
          reg63 : ({((reg59 | wire23) ?
                      $signed((8'hab)) : reg59[(1'h1):(1'h1)])} ?
              wire47 : {($signed((8'h9c)) * $unsigned(reg61))}));
    end
endmodule

module module28
#(parameter param39 = (|{(+((8'ha7) ? ((8'ha8) ? (8'hab) : (8'hb5)) : ((7'h44) ? (8'hbe) : (8'hab)))), {(((8'ha0) ? (8'ha0) : (8'hbd)) * (+(8'hab))), ((~(8'hbe)) ~^ (8'hbf))}}))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire32;
  input wire signed [(3'h4):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  assign y = {wire38, wire37, wire36, wire35, wire34, wire33, (1'h0)};
  assign wire33 = (!(+(8'hbf)));
  assign wire34 = {(8'haf), $signed(wire30)};
  assign wire35 = wire30;
  assign wire36 = ((wire33[(1'h1):(1'h1)] + $signed($unsigned($unsigned(wire32)))) ?
                      wire29 : $unsigned(wire32[(1'h0):(1'h0)]));
  assign wire37 = (~^(~^{wire33, wire34}));
  assign wire38 = ($unsigned($signed(({(8'hac), wire34} - (wire37 ?
                          wire36 : (8'ha0))))) ?
                      {$unsigned(((wire30 ~^ wire33) >> (wire30 ?
                              wire29 : wire34)))} : $unsigned($unsigned($signed($signed(wire29)))));
endmodule

module module126
#(parameter param153 = ((((&((8'ha0) ? (7'h40) : (8'hb2))) >>> {(&(8'hbe)), ((8'hbe) ? (8'hb0) : (8'hb4))}) ? (((~&(8'haa)) & {(8'hb1), (8'hba)}) ? (((8'hb5) != (8'ha1)) ? (+(8'had)) : (&(8'ha5))) : ({(8'h9c)} + {(8'hb2)})) : (|(((8'hbb) ? (8'ha7) : (8'hb4)) ? (^(8'ha5)) : ((8'had) <<< (8'hb0))))) | (8'ha1)))
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire130;
  input wire [(2'h2):(1'h0)] wire129;
  input wire signed [(4'he):(1'h0)] wire128;
  input wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(5'h13):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire133,
                 wire132,
                 wire131,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire131 = wire130[(5'h10):(4'he)];
  assign wire132 = wire131;
  assign wire133 = wire128[(4'ha):(2'h2)];
  always
    @(posedge clk) begin
      reg134 <= (wire129[(1'h1):(1'h1)] ^ (((^~wire129[(2'h2):(2'h2)]) ?
              {$unsigned(wire129), wire130} : (wire131[(2'h3):(1'h1)] ?
                  (wire132 >>> wire129) : $signed(wire133))) ?
          {((wire133 | wire128) ?
                  (-wire130) : (wire128 >>> wire129))} : (((~&wire131) << (~|wire127)) ?
              (~|$unsigned(wire132)) : (((8'ha9) ? (8'hb2) : wire133) ?
                  wire130[(2'h2):(1'h1)] : {(8'hb3)}))));
      reg135 <= (wire127 | wire129);
      if ((wire130[(3'h6):(2'h2)] ?
          (wire131 ?
              ($unsigned((wire127 << (8'ha2))) ?
                  wire129 : wire130) : wire130) : (|(&(~$unsigned(wire127))))))
        begin
          reg136 <= (^$signed(($unsigned((wire127 ? wire127 : wire129)) ?
              wire132[(2'h2):(1'h0)] : $unsigned((wire129 >> reg135)))));
          reg137 <= (~&wire130[(5'h12):(1'h1)]);
          if (($unsigned(wire129[(2'h2):(1'h1)]) ?
              wire133 : (~^((|(wire132 << wire130)) || ({wire128} && ((8'hb3) ?
                  wire127 : wire130))))))
            begin
              reg138 <= wire127[(5'h10):(4'h9)];
              reg139 <= $signed({reg135,
                  (^(wire131 ? reg137[(3'h4):(2'h2)] : (wire128 >= (8'h9c))))});
              reg140 <= (((((~^wire132) & {wire127}) ?
                  reg139[(4'he):(3'h5)] : $unsigned(wire130[(4'he):(1'h0)])) > ((reg137[(3'h5):(1'h1)] ?
                      $unsigned(reg139) : $unsigned(wire131)) ?
                  reg135[(1'h1):(1'h1)] : (8'ha6))) < ($signed(((+wire128) ?
                  $unsigned(wire129) : reg135)) * (~|$unsigned(reg139[(3'h4):(1'h1)]))));
              reg141 <= (reg134 << (wire130 ?
                  $signed($signed((wire130 | reg136))) : (reg135 ^ $unsigned(wire128))));
              reg142 <= ($unsigned({$signed($signed(wire133))}) ?
                  reg136[(4'ha):(3'h5)] : reg135);
            end
          else
            begin
              reg138 <= ($signed((~&(&(8'hbc)))) ?
                  wire132 : (|{$unsigned($signed((8'h9c))), wire130}));
              reg139 <= ($unsigned(((8'ha1) ^ $signed(wire132[(3'h4):(2'h3)]))) ?
                  (^~(-($unsigned((8'hb7)) ?
                      (reg142 ?
                          (8'hb8) : (8'ha0)) : $signed(reg135)))) : $signed((($unsigned(reg141) ^ $signed(reg141)) ?
                      wire132[(3'h4):(1'h0)] : (~&{reg141}))));
            end
          reg143 <= ($unsigned((|reg136[(2'h3):(1'h0)])) ?
              $unsigned((&$unsigned(reg142))) : ($signed((|{wire133,
                  wire133})) ^ (($unsigned(reg141) ?
                  reg139[(3'h7):(1'h0)] : wire133[(5'h12):(3'h5)]) ~^ ((wire127 - reg139) >> (&wire127)))));
          reg144 <= (reg141 < reg142[(4'hf):(1'h0)]);
        end
      else
        begin
          reg136 <= $signed($unsigned(wire132[(3'h7):(1'h1)]));
          reg137 <= {{reg134[(2'h3):(1'h0)]}, (~&wire131)};
          reg138 <= (($signed(((~(8'hae)) ~^ (reg140 ?
                  wire127 : wire131))) < $unsigned(((8'hab) ?
                  $unsigned(wire133) : (^wire127)))) ?
              $unsigned(reg144[(4'h8):(2'h2)]) : reg137[(3'h5):(1'h1)]);
          reg139 <= $unsigned(reg142);
          reg140 <= $signed((wire130 ? $unsigned({{wire128}}) : reg136));
        end
      reg145 <= $signed($signed(reg139[(5'h10):(3'h4)]));
    end
  assign wire146 = (wire132[(1'h1):(1'h1)] ?
                       (wire128 ?
                           $signed($unsigned((reg139 ?
                               wire127 : wire130))) : (((reg144 + reg141) << (&reg142)) ?
                               reg135 : wire131[(1'h0):(1'h0)])) : reg137[(3'h6):(3'h4)]);
  assign wire147 = ((reg135[(2'h3):(1'h0)] ~^ $signed((wire131[(3'h4):(2'h2)] == wire127[(5'h10):(4'hf)]))) == $signed(($signed((~reg141)) | reg145)));
  assign wire148 = wire132[(4'h9):(3'h6)];
  assign wire149 = reg137;
  assign wire150 = (!$signed(wire127[(4'ha):(2'h3)]));
  assign wire151 = (8'ha0);
  assign wire152 = reg144[(4'h8):(1'h1)];
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire83;
  input wire [(5'h11):(1'h0)] wire82;
  input wire signed [(3'h5):(1'h0)] wire81;
  input wire [(2'h3):(1'h0)] wire80;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
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
                 (1'h0)};
  assign wire84 = wire83[(3'h4):(1'h1)];
  assign wire85 = ((((!$signed(wire83)) ?
                      (wire84 ? (wire80 || wire83) : (!(8'ha1))) : {(wire82 ?
                              wire82 : (7'h43)),
                          $signed((8'hb0))}) - wire82) ^ ($signed(wire82[(4'h9):(3'h4)]) ?
                      ($unsigned(wire83[(4'hb):(1'h0)]) & $signed((wire83 ?
                          wire83 : wire80))) : (&$unsigned(wire80[(2'h2):(2'h2)]))));
  assign wire86 = wire81[(1'h1):(1'h0)];
  assign wire87 = (~^wire81[(2'h3):(2'h2)]);
  assign wire88 = wire86;
  assign wire89 = wire82[(4'hc):(4'ha)];
  assign wire90 = $signed((^~(~^(~|wire85[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg91 <= {wire87,
          ((+$signed(wire87[(3'h5):(3'h5)])) ?
              wire87 : (($signed(wire90) ?
                  $unsigned(wire80) : $signed(wire81)) & ((wire80 ?
                  wire83 : wire89) != $unsigned(wire88))))};
      if (((wire89 < (8'hbf)) >= wire82))
        begin
          reg92 <= $signed(($signed(wire86) >> wire85));
          reg93 <= (wire82[(1'h1):(1'h1)] ?
              (!$unsigned(wire89)) : wire80[(2'h3):(1'h0)]);
          if ((wire80[(1'h1):(1'h0)] * (reg91[(2'h3):(2'h3)] << (+($signed(wire84) * $signed(wire80))))))
            begin
              reg94 <= ((~&(8'had)) ?
                  $signed($signed(wire82)) : ({reg93,
                      (~(wire81 <= reg93))} * wire86[(1'h0):(1'h0)]));
              reg95 <= (reg94[(4'hc):(4'h9)] ?
                  (!($signed(reg91) ?
                      $signed((~|(8'ha3))) : (~(wire81 ?
                          (8'ha9) : reg91)))) : (wire87[(1'h0):(1'h0)] ^~ ($unsigned((reg93 ?
                          wire84 : (8'ha7))) ?
                      (^~(wire88 ?
                          reg94 : reg94)) : $signed((wire89 ^ reg94)))));
            end
          else
            begin
              reg94 <= (wire87[(1'h1):(1'h1)] ?
                  {reg91[(4'ha):(4'h9)]} : (&(((wire89 | wire82) ?
                      {wire80, wire90} : reg92) == (^$unsigned(wire88)))));
              reg95 <= $signed(reg91[(3'h6):(2'h2)]);
              reg96 <= (~|reg92);
              reg97 <= (8'ha0);
            end
          if ((7'h43))
            begin
              reg98 <= (reg94[(4'ha):(1'h0)] ?
                  wire86 : $unsigned((((~&(8'hb1)) ?
                      (~reg94) : wire85) < $unsigned(reg91[(3'h7):(3'h7)]))));
              reg99 <= (^~$unsigned((!($unsigned(wire88) < reg95[(4'hb):(4'ha)]))));
              reg100 <= reg98;
            end
          else
            begin
              reg98 <= $signed(({($signed(reg93) + wire81[(2'h2):(1'h0)]),
                  (7'h40)} * $unsigned(((~wire86) ?
                  $signed((8'hbb)) : reg98))));
            end
          if (wire90[(4'hd):(4'ha)])
            begin
              reg101 <= $unsigned(reg97);
              reg102 <= {{$signed(reg94[(4'h8):(3'h5)])}};
              reg103 <= ((($signed((!reg97)) ?
                      ({reg93, wire87} == $signed(wire88)) : ((reg100 ?
                              wire80 : wire87) ?
                          (~|reg91) : $unsigned((8'hbe)))) ?
                  reg101[(1'h0):(1'h0)] : {reg99[(5'h12):(4'hf)]}) >>> $unsigned({{reg100[(4'hf):(2'h2)]},
                  $signed($unsigned(wire88))}));
              reg104 <= $unsigned(reg102);
              reg105 <= ($signed(((~&(reg99 ?
                  wire80 : wire83)) == wire87[(3'h4):(1'h0)])) ^ (8'ha7));
            end
          else
            begin
              reg101 <= ($unsigned(wire89) == {((~&$signed(reg96)) ?
                      {reg92[(4'h9):(3'h4)]} : ((reg105 <<< (8'hbd)) != (wire81 ?
                          reg97 : (8'ha5)))),
                  (^~((wire87 <= reg96) ? reg104 : (reg98 * reg91)))});
              reg102 <= (|($unsigned({$signed(reg97), wire89[(5'h10):(4'hb)]}) ?
                  wire90 : reg105[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          if ($signed(((wire84 == wire90) ?
              {(~^$unsigned(reg104)),
                  $unsigned($signed(wire84))} : reg99[(5'h14):(4'he)])))
            begin
              reg92 <= reg100[(4'h9):(1'h0)];
              reg93 <= reg99;
              reg94 <= $unsigned((+$signed((reg101 | (wire85 ~^ wire81)))));
              reg95 <= (^~reg95);
            end
          else
            begin
              reg92 <= $unsigned({($unsigned(wire88[(3'h4):(2'h2)]) & ({reg100} ?
                      (reg104 | (8'hb0)) : (wire87 ? wire80 : reg95))),
                  ($unsigned($signed(reg92)) ?
                      $signed({reg92, (8'hb2)}) : $signed((reg93 ?
                          wire80 : wire88)))});
              reg93 <= (wire80 <= ($signed((reg97[(1'h0):(1'h0)] | wire84[(4'h9):(2'h3)])) | ($unsigned(wire86[(1'h1):(1'h0)]) | $unsigned({wire90}))));
            end
          reg96 <= ((~^($unsigned($signed(reg93)) ?
              (wire82 >>> (reg95 + reg92)) : $signed(reg94))) - $unsigned((~($unsigned(reg93) <<< $unsigned(wire84)))));
          reg97 <= $signed($signed(reg95));
          reg98 <= reg99[(3'h7):(3'h5)];
          if ($signed(reg105[(3'h5):(3'h5)]))
            begin
              reg99 <= $signed($signed($unsigned($unsigned({(8'h9d)}))));
              reg100 <= ($unsigned(((8'h9d) & ($unsigned(reg98) ?
                      (~(8'ha1)) : wire88))) ?
                  $unsigned($signed(($signed(reg93) ?
                      $signed(reg97) : {wire84,
                          wire90}))) : reg91[(4'h9):(2'h3)]);
              reg101 <= (^~(~&((&(wire90 >> (8'hbb))) && (+((7'h41) ?
                  (8'hb0) : reg100)))));
              reg102 <= (~&wire90);
              reg103 <= $unsigned({(8'hb4)});
            end
          else
            begin
              reg99 <= $signed(reg98[(4'h9):(1'h0)]);
              reg100 <= reg99;
            end
        end
    end
  assign wire106 = $signed((&({$signed(reg103)} ?
                       (reg101 ?
                           wire83 : $unsigned((8'h9f))) : reg95[(1'h0):(1'h0)])));
  assign wire107 = $signed((~|wire88[(1'h1):(1'h1)]));
  assign wire108 = {wire82[(3'h4):(3'h4)]};
  assign wire109 = $signed((wire88[(2'h3):(2'h2)] ?
                       (^~((wire83 ?
                           wire81 : wire107) < (wire108 > wire80))) : ($signed($signed(wire89)) ?
                           wire80[(1'h0):(1'h0)] : wire106)));
  assign wire110 = reg99;
  assign wire111 = $signed($signed((reg92[(2'h3):(1'h0)] | $unsigned((!(8'hb5))))));
  assign wire112 = (($signed($unsigned((~|reg94))) ~^ ((~|{wire111, (8'ha5)}) ?
                       wire89 : (!{reg97}))) < $signed(reg92));
  assign wire113 = $unsigned(reg105);
  assign wire114 = (~|{wire81, $unsigned(reg98[(3'h5):(2'h3)])});
  assign wire115 = (~^$signed(wire80));
  assign wire116 = (wire90 ?
                       reg98[(3'h5):(1'h0)] : $unsigned(wire90[(1'h1):(1'h0)]));
  assign wire117 = $unsigned($signed({reg91[(2'h2):(1'h1)]}));
  assign wire118 = reg91[(1'h0):(1'h0)];
endmodule
