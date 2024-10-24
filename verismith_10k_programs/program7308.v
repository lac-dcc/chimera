module top
#(parameter param126 = ({{{((8'hbb) ^ (8'hbc))}}, ((^~((8'ha4) ^~ (8'hb5))) >> (8'hba))} ? (((((8'hb0) << (8'haa)) ? (~^(7'h43)) : ((8'hbd) >= (8'ha0))) ? (7'h41) : (((8'hb9) || (8'hb3)) ~^ (&(8'hb7)))) ? (~&(7'h40)) : ((((7'h44) ? (8'hbc) : (8'hb4)) < {(8'hb1), (8'hb9)}) >>> ((^~(7'h40)) != (^~(8'hba))))) : {(8'h9f), ((^~(8'ha1)) + ((^(8'ha9)) + (-(8'hab))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire115;
  wire [(5'h15):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire89;
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire101,
                 wire5,
                 wire21,
                 wire89,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
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
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed(wire1);
  always
    @(posedge clk) begin
      reg6 <= wire5;
      reg7 <= $unsigned(wire5[(5'h11):(4'hf)]);
      reg8 <= {$signed($signed((((8'h9e) >> (8'h9f)) >>> $signed(wire3))))};
      if (({(({reg6, reg7} ? (~|wire1) : {wire0, wire5}) ?
              (~^reg6[(3'h7):(1'h0)]) : wire4[(2'h3):(2'h2)]),
          (~^wire5)} <<< (|(wire2[(5'h13):(5'h13)] * ($unsigned(reg7) ?
          {wire0} : (~&wire2))))))
        begin
          if (wire1[(2'h2):(1'h1)])
            begin
              reg9 <= $signed((((((8'h9f) ? wire0 : reg7) ?
                          $unsigned(wire3) : (8'ha9)) ?
                      wire5 : wire0[(1'h1):(1'h0)]) ?
                  $signed((^~$signed(reg6))) : $signed((reg6 << {reg8,
                      wire3}))));
              reg10 <= ((&$signed((((8'ha6) ?
                  wire5 : wire4) <= (reg8 || (8'hb8))))) || $unsigned(wire2[(3'h5):(1'h0)]));
              reg11 <= ((&((~|$unsigned(wire0)) ?
                      (wire3 | $signed(wire1)) : (&$signed((8'ha7))))) ?
                  wire5 : reg8[(2'h2):(1'h1)]);
              reg12 <= reg7[(3'h4):(2'h3)];
              reg13 <= ((reg8[(3'h5):(1'h0)] + reg6) ?
                  $signed(wire5[(3'h6):(1'h1)]) : ((~|reg9[(1'h0):(1'h0)]) < (~|$unsigned($signed((8'h9e))))));
            end
          else
            begin
              reg9 <= $unsigned((($signed(((7'h44) < reg12)) <<< reg12[(2'h2):(2'h2)]) < $unsigned((+reg11[(4'h8):(2'h2)]))));
              reg10 <= $signed(reg13[(3'h4):(1'h1)]);
              reg11 <= wire2[(3'h5):(3'h4)];
            end
          reg14 <= (wire3[(5'h10):(4'ha)] | $signed({($unsigned(wire4) > wire2[(5'h10):(4'hc)]),
              $unsigned($signed((8'hb7)))}));
          reg15 <= reg11[(4'h9):(1'h1)];
        end
      else
        begin
          reg9 <= (~&($unsigned(reg10[(4'h8):(2'h2)]) == (8'ha2)));
          reg10 <= (!({(wire3 ? {wire4} : $signed(reg10))} ? reg6 : wire3));
          if ($unsigned(($unsigned(wire4) ?
              (~|$unsigned((reg15 ? reg6 : reg7))) : (-((-reg12) <<< (reg12 ?
                  (8'hbc) : wire5))))))
            begin
              reg11 <= reg13[(4'hf):(4'ha)];
              reg12 <= {reg12[(3'h4):(2'h2)],
                  (($signed((wire2 ^~ (8'hb4))) ?
                          reg15[(2'h3):(2'h2)] : reg14[(1'h1):(1'h1)]) ?
                      ($unsigned((~&wire2)) > ((~&reg7) ~^ $signed(wire0))) : reg10)};
              reg13 <= $signed(reg8);
            end
          else
            begin
              reg11 <= ($signed((($signed(wire0) | (reg13 ? reg6 : (8'h9d))) ?
                      (wire5[(5'h11):(2'h2)] ?
                          $signed(reg13) : $signed(wire3)) : (~(~|wire2)))) ?
                  reg9 : reg8);
              reg12 <= wire1[(1'h0):(1'h0)];
              reg13 <= reg13[(1'h0):(1'h0)];
              reg14 <= (wire3 ? wire4 : reg15[(3'h4):(2'h3)]);
              reg15 <= {($signed(reg6) ?
                      (^{$signed(reg12),
                          $signed(wire5)}) : wire2[(5'h10):(1'h0)]),
                  $unsigned((^$unsigned($signed((8'h9d)))))};
            end
          if ($signed({(reg15 ? (!(~^reg8)) : $signed(wire1[(2'h3):(2'h3)])),
              reg10[(4'he):(4'h8)]}))
            begin
              reg16 <= reg9;
              reg17 <= reg11;
              reg18 <= (-$signed({($unsigned(reg16) ? reg9 : (^~reg13))}));
              reg19 <= $signed(wire2);
            end
          else
            begin
              reg16 <= reg7[(3'h5):(1'h1)];
              reg17 <= (($signed({(&reg12)}) >>> ($signed(wire2[(4'h8):(4'h8)]) ?
                      $signed($unsigned(reg13)) : (wire5[(4'hf):(2'h3)] ?
                          $unsigned(reg18) : (reg6 * wire1)))) ?
                  reg7[(1'h0):(1'h0)] : reg13[(3'h6):(3'h4)]);
              reg18 <= {{reg13[(1'h1):(1'h1)], wire0[(1'h1):(1'h1)]}};
              reg19 <= $unsigned({reg9[(4'ha):(4'h9)], reg18[(3'h6):(3'h4)]});
            end
          reg20 <= (wire5[(3'h4):(2'h3)] >= ((($unsigned(wire1) ?
                  (reg7 ? wire3 : reg16) : {wire0, reg8}) & $unsigned({reg17,
                  reg19})) ?
              {(!(8'ha0)), $signed({wire5, reg10})} : reg14[(4'hb):(3'h7)]));
        end
    end
  assign wire21 = wire4[(4'he):(4'he)];
  module22 #() modinst90 (wire89, clk, reg14, reg12, wire0, reg8, reg18);
  module91 #() modinst102 (.wire94(wire4), .clk(clk), .wire95(reg13), .y(wire101), .wire93(wire2), .wire92(reg8));
  always
    @(posedge clk) begin
      if ($unsigned(((((reg11 ? reg13 : (7'h43)) < $signed(reg19)) ?
          {(+reg16),
              (reg10 - reg9)} : reg18[(4'hc):(4'ha)]) & (|$unsigned(wire4)))))
        begin
          if ($signed((~|({$signed(reg7)} < $unsigned((reg8 ? wire1 : reg7))))))
            begin
              reg103 <= ((~|(-((wire5 ? reg20 : wire89) | (&reg7)))) ?
                  $signed($unsigned(reg11)) : $signed((~^wire5[(3'h6):(3'h4)])));
            end
          else
            begin
              reg103 <= wire5;
              reg104 <= {$signed($signed(((wire21 ? reg15 : reg103) ?
                      $signed(wire89) : (reg13 == reg14))))};
              reg105 <= {$unsigned((~^(wire2[(1'h0):(1'h0)] && {(8'hbc),
                      reg17}))),
                  reg7};
              reg106 <= $signed((^~$signed(((reg9 >>> reg17) ?
                  reg9 : (reg9 ? reg104 : reg103)))));
              reg107 <= reg13;
            end
        end
      else
        begin
          reg103 <= (reg9 ? (~|reg6) : reg17[(4'he):(4'hd)]);
          if ($unsigned($unsigned((~^$unsigned(((8'h9f) * wire21))))))
            begin
              reg104 <= reg19;
              reg105 <= {(8'hb4), (8'ha0)};
              reg106 <= $unsigned(reg105[(3'h7):(3'h4)]);
            end
          else
            begin
              reg104 <= ($unsigned(reg18[(2'h2):(1'h0)]) ?
                  $unsigned((8'ha6)) : (reg7 == $signed(({wire101} ~^ reg19))));
              reg105 <= ((((((8'hba) ^~ reg105) ?
                          reg105 : reg19) >> ((wire89 == wire101) & {wire21,
                          wire2})) ?
                      ($signed((-(8'hb4))) <<< $unsigned({(8'hbd),
                          reg17})) : $signed((^(reg17 ? reg17 : reg10)))) ?
                  $signed((wire0 <= ((reg11 ? reg11 : reg8) ?
                      reg6 : (reg107 ? reg6 : wire1)))) : (~|wire0));
              reg106 <= ($unsigned(wire4) >>> (~^wire2));
            end
          reg107 <= $signed((reg15 == (^reg107)));
          reg108 <= $signed(reg15[(1'h0):(1'h0)]);
        end
      reg109 <= reg20[(2'h3):(1'h0)];
    end
  assign wire110 = reg16[(3'h6):(3'h4)];
  assign wire111 = {{(wire1 & reg12[(3'h5):(1'h0)]),
                           $unsigned($signed(reg109))}};
  assign wire112 = ((wire89[(2'h3):(2'h3)] << (~&reg19)) ?
                       $unsigned(($signed((wire110 ?
                           (8'hb3) : reg6)) >= (-(reg7 && wire1)))) : (^~(reg109[(2'h3):(2'h3)] == (wire1[(2'h3):(1'h1)] > (8'hae)))));
  assign wire113 = {$unsigned(wire89[(4'h9):(3'h6)]), (8'hbb)};
  assign wire114 = wire1[(1'h0):(1'h0)];
  assign wire115 = wire1;
  always
    @(posedge clk) begin
      reg116 <= (+(8'hb4));
      reg117 <= $unsigned($signed({($signed((8'ha7)) ?
              (reg13 ? reg108 : reg116) : $signed((8'hb6))),
          wire114}));
      if (($signed(reg10) & $unsigned($unsigned($unsigned($signed(wire0))))))
        begin
          reg118 <= (-{(reg109[(1'h0):(1'h0)] >= $unsigned(reg7))});
          reg119 <= (($unsigned(reg12[(3'h6):(1'h1)]) <<< ((((8'ha0) ?
                      reg105 : wire5) ?
                  $signed(reg20) : (reg19 < (8'ha4))) ?
              (~^(8'hae)) : $unsigned((wire111 ? reg105 : reg9)))) * reg109);
          reg120 <= ($signed(reg13) > ($signed($signed($unsigned(reg14))) >= $signed((~$unsigned(reg18)))));
          reg121 <= ($unsigned($unsigned({{reg105, reg118},
              $signed(reg18)})) <<< ({((reg105 ? reg10 : reg12) ?
                      (wire114 >>> wire115) : $signed(wire89)),
                  (wire101 ~^ ((8'ha3) >> (8'hb0)))} ?
              (~|reg7[(2'h3):(2'h2)]) : (&(^(wire110 ? wire113 : (8'hb3))))));
          reg122 <= $unsigned(reg103[(3'h7):(2'h2)]);
        end
      else
        begin
          reg118 <= $unsigned($unsigned(wire101[(3'h5):(2'h3)]));
        end
      reg123 <= $signed({reg104[(3'h5):(1'h0)]});
    end
  assign wire124 = $unsigned({($unsigned((|reg9)) + {(wire114 * wire3),
                           ((8'hbc) ? reg10 : reg9)})});
  assign wire125 = (~|$signed(reg7));
endmodule

module module91
#(parameter param100 = ({(~|(^~((8'h9e) ? (8'ha6) : (8'ha3)))), (((^~(7'h44)) ? {(8'hb3), (8'hb1)} : ((8'hb7) >= (8'hab))) >= {((8'hab) ? (8'hb0) : (8'haf))})} + ((({(8'hb8)} <= (+(7'h42))) && (((8'hb8) ^ (7'h41)) ? {(8'hb1)} : ((8'hab) ? (8'hb6) : (8'hb3)))) ? ((~{(8'hb7), (8'ha0)}) || ({(8'hbb), (8'hba)} ~^ (~^(8'hb8)))) : {(^~(^~(8'haa)))})))
(y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire95;
  input wire [(5'h13):(1'h0)] wire94;
  input wire signed [(2'h2):(1'h0)] wire93;
  input wire [(4'hf):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire96;
  assign y = {wire99, wire98, wire97, wire96, (1'h0)};
  assign wire96 = wire94[(4'h9):(3'h5)];
  assign wire97 = wire95;
  assign wire98 = {$unsigned({($unsigned((7'h43)) ?
                              wire92[(4'ha):(2'h2)] : (~&wire93)),
                          $unsigned((^wire95))})};
  assign wire99 = {{wire94[(4'he):(3'h4)], $signed({$signed(wire93)})},
                      (!{$signed($unsigned(wire96))})};
endmodule

module module22
#(parameter param88 = ((((~&((8'hb0) ? (8'ha5) : (8'h9c))) <= (((8'ha8) ? (8'hb8) : (8'ha2)) ? (^~(8'hbe)) : (^~(8'hb0)))) ? ((~|{(8'h9e)}) ? (((8'h9c) ? (8'ha4) : (8'h9d)) != {(8'ha5), (8'h9e)}) : {((8'h9d) + (7'h43)), (^~(8'hbe))}) : (+(((8'hae) ? (8'ha1) : (8'hb3)) ~^ (~(8'ha5))))) ? (((~|{(8'ha0), (8'hb3)}) << (((8'ha5) + (8'had)) >= ((8'hac) ? (8'hb9) : (8'haa)))) ? (({(8'ha5)} ? (!(7'h42)) : (-(8'hb9))) ? (((8'ha0) ? (7'h41) : (8'h9c)) == ((8'h9e) >> (8'hbe))) : (~&((8'hb4) ? (8'hbf) : (8'hba)))) : (-(^~(8'hbd)))) : {{(((8'hb2) ? (8'hb0) : (8'hb5)) + (-(8'hb1)))}}))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  assign y = {wire86,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire28 = ((^~$signed($unsigned($unsigned(wire25)))) | (wire25 >> $unsigned((wire23[(2'h2):(1'h1)] << wire23))));
  assign wire29 = $signed({(-(^~$signed(wire25)))});
  assign wire30 = (!$signed($signed((^~$unsigned(wire26)))));
  assign wire31 = wire23[(1'h1):(1'h1)];
  assign wire32 = wire30[(3'h6):(3'h4)];
  assign wire33 = (!wire29[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg34 <= wire33[(1'h1):(1'h1)];
      reg35 <= {$unsigned((wire24 ?
              $signed({wire25, wire32}) : $unsigned({wire33, (8'hb9)})))};
      reg36 <= (wire26 ? reg34[(5'h10):(3'h7)] : $signed(wire24));
    end
  assign wire37 = ($unsigned($unsigned(($unsigned(wire31) ?
                          $unsigned(wire28) : $unsigned(wire24)))) ?
                      reg34 : wire25[(1'h0):(1'h0)]);
  assign wire38 = ($unsigned(wire25[(1'h1):(1'h1)]) ?
                      wire25 : {$unsigned(wire24)});
  assign wire39 = wire38[(4'h9):(3'h6)];
  assign wire40 = (!wire29[(3'h6):(3'h5)]);
  assign wire41 = $unsigned((($signed($unsigned(wire24)) && $unsigned($unsigned(wire28))) < $signed($signed((wire25 ?
                      wire24 : wire24)))));
  module42 #() modinst87 (.wire47(wire23), .wire44(wire30), .wire46(wire29), .clk(clk), .y(wire86), .wire43(reg35), .wire45(wire39));
endmodule

module module42
#(parameter param85 = (8'hac))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire signed [(2'h3):(1'h0)] wire45;
  input wire [(3'h7):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire68,
                 wire67,
                 wire66,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire48 = $unsigned(wire46[(1'h1):(1'h1)]);
  assign wire49 = {wire47[(1'h0):(1'h0)]};
  assign wire50 = $unsigned($signed((-wire47)));
  assign wire51 = wire46;
  assign wire52 = wire44[(3'h6):(1'h1)];
  assign wire53 = $signed((wire45[(2'h2):(1'h0)] == (wire52[(1'h1):(1'h1)] ?
                      ($unsigned(wire50) ?
                          (wire48 ? wire47 : wire44) : (!wire48)) : wire49)));
  assign wire54 = ((wire43[(4'hb):(2'h2)] > $signed(wire50[(2'h2):(2'h2)])) ?
                      $unsigned($unsigned(((8'ha7) <<< wire48[(3'h7):(2'h3)]))) : (~&((^{(8'hbe)}) ?
                          ((wire43 || wire45) ?
                              wire44[(3'h4):(1'h1)] : (^wire48)) : (!$signed(wire44)))));
  assign wire55 = $unsigned(((~|(|wire52)) != (+((wire49 ? (8'haf) : wire49) ?
                      $unsigned(wire44) : (wire49 ? wire50 : wire51)))));
  assign wire56 = ($unsigned(wire44) ?
                      wire54 : ($unsigned((wire45 <= (|wire54))) ?
                          (~^wire55) : (($signed(wire52) ^ wire54) & (8'hb0))));
  always
    @(posedge clk) begin
      reg57 <= $signed(wire50);
      reg58 <= $unsigned(wire46[(1'h1):(1'h0)]);
      reg59 <= ((-(wire44 <<< (^~(-wire44)))) ?
          (($signed((~^wire43)) ?
                  ($unsigned(wire56) ? $signed((8'hb4)) : (-wire47)) : wire54) ?
              wire44[(2'h3):(1'h0)] : {(8'h9e),
                  ($signed(wire47) & $unsigned(wire55))}) : wire45[(2'h3):(2'h2)]);
      if ((8'hba))
        begin
          reg60 <= $signed($signed((wire49[(1'h0):(1'h0)] ?
              $unsigned((+wire55)) : reg59[(4'hc):(3'h6)])));
          if ((($unsigned(((8'ha3) || $unsigned(reg60))) > {(reg60[(3'h5):(2'h3)] > wire54[(2'h3):(2'h3)])}) >> (8'hb5)))
            begin
              reg61 <= $unsigned(wire54[(1'h0):(1'h0)]);
              reg62 <= $signed(reg61[(3'h4):(1'h0)]);
              reg63 <= (|$signed(((wire44 | (&wire55)) ?
                  reg59[(3'h5):(1'h0)] : wire54)));
              reg64 <= (!(~wire43[(3'h4):(2'h2)]));
            end
          else
            begin
              reg61 <= wire51;
              reg62 <= (~&$signed(($signed((wire54 << reg59)) ?
                  (~(reg62 ? wire53 : wire44)) : wire53[(4'hc):(4'hc)])));
            end
          reg65 <= {$unsigned($unsigned((wire54 ?
                  $unsigned(wire45) : (!wire45)))),
              {$unsigned(($unsigned((8'ha3)) ? $unsigned(reg64) : reg62))}};
        end
      else
        begin
          reg60 <= reg64[(3'h7):(3'h4)];
          reg61 <= (!(reg60 ?
              ($unsigned($unsigned(wire43)) & $signed((wire48 << reg60))) : reg60[(5'h13):(4'he)]));
          reg62 <= {(wire43 || ((wire49 ^ wire44) ?
                  ((~&reg63) ?
                      (!reg62) : wire52[(4'ha):(3'h4)]) : reg59[(1'h0):(1'h0)])),
              (reg61 ?
                  (($unsigned(wire45) || {reg62}) ?
                      ($signed(wire49) ?
                          $signed((8'hbd)) : (7'h42)) : ((~wire43) ?
                          wire56 : $unsigned(wire48))) : (wire50[(1'h1):(1'h0)] ?
                      (wire49[(1'h0):(1'h0)] ?
                          (-wire56) : (!wire56)) : wire56))};
        end
    end
  assign wire66 = (~^reg65);
  assign wire67 = (((!reg57[(3'h4):(1'h1)]) && $signed({$signed(reg62),
                          $signed((8'ha4))})) ?
                      (~|wire56) : wire51[(3'h4):(2'h3)]);
  assign wire68 = wire67;
  always
    @(posedge clk) begin
      reg69 <= $signed(wire49);
      reg70 <= {reg65};
      if (wire68)
        begin
          if ($unsigned(($unsigned($signed(reg69)) ?
              (wire51 ?
                  (reg58[(4'h9):(1'h0)] ?
                      wire47 : (reg58 > reg58)) : $signed((wire67 ?
                      wire51 : wire46))) : {{(wire49 <<< wire51), wire67}})))
            begin
              reg71 <= reg63;
              reg72 <= wire66;
            end
          else
            begin
              reg71 <= reg70;
              reg72 <= wire43[(3'h5):(3'h5)];
              reg73 <= $unsigned((wire45 ?
                  $unsigned($signed((7'h42))) : $unsigned(wire55)));
              reg74 <= ((~^wire54[(1'h0):(1'h0)]) ?
                  $signed($signed($unsigned(((8'h9c) ?
                      wire56 : (8'ha6))))) : $signed($signed($unsigned((^~wire47)))));
              reg75 <= $signed(($signed((~|$signed((8'hbc)))) >= (((wire47 >>> (8'ha5)) ?
                  {(8'hb6), wire51} : (wire46 ?
                      (8'ha8) : wire68)) || (~^$signed(reg64)))));
            end
          reg76 <= $unsigned((reg65[(4'hf):(3'h7)] ^ $signed($unsigned(reg65))));
          reg77 <= ($unsigned(reg57[(3'h5):(1'h0)]) ?
              (($signed((^reg69)) ?
                      ((reg62 >= reg64) + $unsigned(reg73)) : $unsigned(wire52[(1'h0):(1'h0)])) ?
                  $signed(wire45) : $unsigned((reg62[(3'h5):(3'h5)] ^ $unsigned((8'hb3))))) : (8'ha0));
        end
      else
        begin
          reg71 <= (-(reg64 != (-reg59)));
          reg72 <= $signed($signed($signed((+{(8'hab)}))));
        end
      reg78 <= (-$signed((~&reg65)));
    end
  assign wire79 = $signed($unsigned($unsigned(reg57)));
  assign wire80 = $signed($unsigned(({$unsigned((8'hb3)),
                      (reg77 >> wire44)} - $unsigned((^wire44)))));
  assign wire81 = ((({wire49[(2'h2):(2'h2)],
                          $unsigned((8'hac))} <= (reg58[(2'h3):(2'h3)] ?
                          wire43[(3'h6):(2'h3)] : {reg74, (8'hb5)})) ?
                      {((~^(7'h40)) ?
                              (wire43 ?
                                  wire53 : (7'h40)) : (!reg64))} : reg69) ~^ (wire52[(4'ha):(4'h9)] * reg58[(5'h10):(4'hc)]));
  assign wire82 = $unsigned(($signed($unsigned($signed(reg65))) >>> (+$signed(reg70))));
  assign wire83 = {{((8'hbb) <<< reg73),
                          {$unsigned(((8'h9d) < wire81)),
                              (-(wire79 >> wire53))}}};
  assign wire84 = (^(wire50 ? wire46 : $signed($unsigned((^reg59)))));
endmodule
