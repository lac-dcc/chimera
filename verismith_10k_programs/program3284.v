module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire223;
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  assign y = {wire5,
                 wire55,
                 wire223,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire5 = wire0[(4'he):(1'h1)];
  module6 #() modinst56 (.wire7(wire1), .clk(clk), .wire9(wire5), .wire8(wire3), .y(wire55), .wire10(wire0));
  always
    @(posedge clk) begin
      if ((wire0[(4'hf):(4'hc)] || (($unsigned((8'ha3)) ^~ ((wire3 >= wire1) ?
              wire3[(2'h2):(2'h2)] : wire4[(4'ha):(3'h4)])) ?
          $unsigned(({(8'hb4)} ?
              $unsigned(wire1) : wire4[(2'h2):(1'h0)])) : ((((7'h42) >= (8'hbb)) ?
              wire4[(4'h8):(3'h6)] : $unsigned(wire0)) <= wire2[(1'h0):(1'h0)]))))
        begin
          reg57 <= (~$unsigned(wire5));
          reg58 <= wire55;
          reg59 <= (~^wire5);
          reg60 <= wire1[(4'h9):(3'h4)];
          if (($unsigned(wire3[(5'h10):(4'he)]) >> {(8'h9d),
              $signed(({reg59} ? reg60 : (~^wire0)))}))
            begin
              reg61 <= reg58[(4'ha):(4'ha)];
              reg62 <= (~($signed($signed($unsigned(reg58))) ?
                  ((~|(wire0 != wire2)) || wire0) : (($unsigned(wire3) ^~ {wire55}) * ((reg60 || wire0) & reg59))));
              reg63 <= ((reg57 || $signed(wire5)) || $signed((((reg61 >>> wire4) ?
                      $signed(reg61) : (wire4 ? reg58 : (7'h44))) ?
                  $signed((reg58 & wire2)) : (8'ha0))));
            end
          else
            begin
              reg61 <= $signed(reg61[(5'h13):(3'h7)]);
              reg62 <= {wire3,
                  ($unsigned({{wire3, reg63}, {wire1}}) ?
                      $unsigned((7'h40)) : $signed((((8'haf) ?
                          wire0 : wire3) << (reg59 ? (8'ha7) : wire4))))};
              reg63 <= (~|(!wire55));
              reg64 <= (~&(!(reg61 ?
                  $unsigned($unsigned(reg59)) : (wire2[(3'h4):(1'h1)] ^ (wire4 <= reg63)))));
              reg65 <= wire2[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg57 <= {$unsigned({$signed((reg61 + reg60)), $unsigned((8'hb2))})};
          reg58 <= $unsigned((-$unsigned((7'h44))));
        end
      reg66 <= ((-reg65[(4'ha):(2'h2)]) ?
          (reg64[(1'h0):(1'h0)] ?
              {(|reg60)} : (((~&wire55) ? (reg60 - wire0) : {(8'hb7), wire2}) ?
                  (reg63 >> (~reg57)) : ($signed((8'ha0)) ?
                      (~|reg65) : (wire55 - wire5)))) : wire55[(4'h8):(4'h8)]);
    end
  module67 #() modinst224 (wire223, clk, reg61, wire55, reg57, reg59);
endmodule

module module67
#(parameter param222 = (&{(7'h40)}))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire71;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire signed [(5'h13):(1'h0)] wire69;
  input wire [(2'h3):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire221;
  wire signed [(3'h6):(1'h0)] wire220;
  wire [(3'h6):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire106;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire149;
  wire signed [(4'hf):(1'h0)] wire150;
  wire [(3'h6):(1'h0)] wire151;
  wire [(4'hd):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire218;
  assign y = {wire221,
                 wire220,
                 wire103,
                 wire73,
                 wire72,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire147,
                 wire149,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 wire218,
                 (1'h0)};
  assign wire72 = wire70[(1'h1):(1'h0)];
  assign wire73 = $signed((~^{wire69}));
  module74 #() modinst104 (wire103, clk, wire73, wire69, wire72, wire70, wire71);
  assign wire105 = (&{$signed($signed(wire69))});
  assign wire106 = $signed(wire69);
  assign wire107 = (~&($unsigned((((8'hbc) ? (8'hbe) : wire68) ?
                       ((8'h9d) ?
                           wire72 : (8'hbe)) : (wire69 && wire72))) << (&{{wire73,
                           wire70}})));
  assign wire108 = $unsigned($signed($unsigned($unsigned($unsigned((7'h42))))));
  assign wire109 = wire73[(3'h4):(1'h1)];
  assign wire110 = (wire109[(3'h7):(2'h2)] ? wire106 : wire71);
  module111 #() modinst148 (wire147, clk, wire73, wire108, wire70, wire106);
  assign wire149 = (wire147 - wire69);
  assign wire150 = $unsigned(wire73[(1'h1):(1'h1)]);
  assign wire151 = wire150[(1'h1):(1'h1)];
  assign wire152 = (~wire147[(3'h6):(2'h2)]);
  assign wire153 = $signed({$unsigned((!(~wire72))),
                       {(!(wire110 ? wire68 : wire103))}});
  module154 #() modinst219 (wire218, clk, wire106, wire147, wire69, wire107, wire72);
  assign wire220 = ({{($signed(wire105) != $unsigned(wire71))}} && ($unsigned(((~|wire150) >= $signed(wire218))) ?
                       wire68 : $signed((8'ha6))));
  assign wire221 = wire68[(2'h3):(1'h1)];
endmodule

module module6
#(parameter param54 = {{{(~&((8'h9d) * (8'ha4)))}}})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire11;
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire14,
                 wire11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire11 = (wire10[(1'h0):(1'h0)] ?
                      wire8[(5'h10):(3'h6)] : {($signed(wire7[(3'h5):(1'h1)]) ?
                              (wire10 ? (!(8'hb5)) : wire9) : wire10),
                          ($unsigned((~wire7)) ?
                              wire10[(2'h2):(1'h0)] : wire7[(3'h4):(3'h4)])});
  always
    @(posedge clk) begin
      reg12 <= ($unsigned(wire10[(1'h1):(1'h0)]) ?
          (wire11[(3'h7):(2'h3)] ?
              $signed($signed((wire7 ~^ wire8))) : wire9) : (($unsigned((~&wire11)) ?
              $unsigned($signed(wire7)) : wire11) + wire9));
      reg13 <= (wire8 ?
          ((~($unsigned(wire10) ?
              $unsigned((8'ha6)) : (^~wire11))) & {wire9}) : ($signed(wire11) + ($unsigned($signed(wire11)) >> ($unsigned((8'ha4)) ?
              {(7'h43), wire8} : (~^wire8)))));
    end
  assign wire14 = ((($unsigned(wire8) ?
                          (!(wire8 ? (8'ha1) : wire9)) : $unsigned(wire7)) ?
                      wire9[(1'h1):(1'h0)] : (8'hbd)) << {($signed(reg12[(1'h1):(1'h0)]) && $unsigned($unsigned(wire11))),
                      reg12[(2'h2):(1'h1)]});
  module15 #() modinst45 (.wire20(reg13), .wire19(wire7), .wire18(wire10), .clk(clk), .y(wire44), .wire16(wire8), .wire17(wire11));
  assign wire46 = (reg12 ?
                      (~$unsigned(($unsigned(wire9) & (reg12 ?
                          wire14 : wire11)))) : wire8[(3'h5):(2'h3)]);
  assign wire47 = {(8'ha5)};
  assign wire48 = (!reg12[(3'h4):(2'h2)]);
  assign wire49 = wire11;
  assign wire50 = $unsigned((~wire10));
  assign wire51 = {$unsigned(wire48)};
  assign wire52 = (~^{($signed($signed(wire10)) <<< (((8'hb7) ?
                          wire48 : wire7) ~^ $signed(wire46))),
                      wire11});
  assign wire53 = (wire8[(4'he):(4'h8)] ?
                      ($unsigned(reg13) ^ (((^(8'hbc)) ?
                              wire11 : (wire51 ? wire46 : wire9)) ?
                          wire14 : wire50[(3'h7):(3'h4)])) : (8'ha7));
endmodule

module module15
#(parameter param43 = (~|{{(((8'haa) < (8'ha3)) | ((7'h41) ? (8'ha4) : (8'hba))), ((&(8'ha4)) - {(7'h44), (8'hb8)})}}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire23,
                 wire22,
                 wire21,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = ({(&(+(wire20 >> wire19)))} ?
                      $unsigned(((^(wire20 == (8'ha1))) ?
                          wire20 : wire19)) : (wire20 & $signed($signed($unsigned(wire18)))));
  assign wire22 = (wire16[(1'h0):(1'h0)] ?
                      (+$signed(wire21[(1'h0):(1'h0)])) : wire16);
  assign wire23 = (~($signed(wire20[(3'h4):(1'h1)]) ?
                      $unsigned(wire21) : $unsigned((~&(~wire16)))));
  always
    @(posedge clk) begin
      reg24 <= wire20[(3'h5):(2'h2)];
      if (wire16)
        begin
          reg25 <= wire22[(2'h3):(2'h2)];
          reg26 <= wire16;
          if (((8'ha4) ? wire22 : wire16))
            begin
              reg27 <= (((-$signed($unsigned(wire22))) ?
                  $unsigned(wire18[(4'h9):(3'h7)]) : ((wire16[(3'h7):(3'h6)] ?
                          wire19 : {reg26}) ?
                      (+(wire16 <<< wire18)) : $unsigned(wire22[(3'h5):(2'h3)]))) || $unsigned(wire17));
              reg28 <= wire20[(2'h3):(1'h1)];
              reg29 <= (^~wire22);
            end
          else
            begin
              reg27 <= (reg24 ?
                  ($unsigned($unsigned(wire18[(4'hb):(4'hb)])) ?
                      $unsigned({(-reg29)}) : wire17[(3'h6):(1'h1)]) : wire19);
            end
        end
      else
        begin
          reg25 <= ((((~^reg24[(4'h9):(3'h5)]) ?
              ((|wire21) > $unsigned((8'ha1))) : (wire17 << {wire23})) >>> $unsigned(wire22[(3'h6):(3'h4)])) >>> {(^~{wire18[(4'hb):(3'h5)]})});
          if ((~|((reg25 ~^ (((8'hb7) ? wire22 : reg25) ?
                  (reg28 <= (8'hbf)) : {wire23, wire22})) ?
              (+((reg28 >= reg24) ?
                  wire18 : $signed(wire19))) : ($signed(wire18) ~^ wire18))))
            begin
              reg26 <= ((-(7'h41)) & reg25[(2'h3):(1'h1)]);
              reg27 <= (((wire17[(3'h6):(2'h3)] || wire16) != reg25[(2'h3):(2'h3)]) ?
                  (^~{(wire22 ?
                          wire19[(3'h4):(1'h1)] : reg24[(3'h6):(3'h4)])}) : $signed(reg28[(5'h10):(3'h7)]));
              reg28 <= wire16[(3'h5):(1'h1)];
              reg29 <= ((~{$unsigned((wire16 ~^ reg26)),
                  wire22}) <= $signed((~{$unsigned(reg24),
                  (wire20 || reg24)})));
            end
          else
            begin
              reg26 <= $unsigned((wire16 ?
                  (wire22 <<< $signed((wire22 >> wire23))) : $signed(((~^reg24) == {reg28}))));
              reg27 <= $signed({reg29[(2'h3):(1'h0)]});
              reg28 <= $unsigned({reg27});
              reg29 <= reg29;
              reg30 <= (^$signed(((|(reg24 ^~ wire20)) * wire23)));
            end
        end
      reg31 <= $signed($signed(((wire16 ?
          wire22 : (wire22 ? reg27 : wire22)) <= ((reg25 || wire17) ?
          (~wire17) : (wire19 <<< (8'had))))));
      reg32 <= (|(~^$signed(((reg24 >>> reg28) ?
          wire17 : reg24[(3'h4):(3'h4)]))));
    end
  assign wire33 = reg28;
  assign wire34 = (~reg24[(3'h7):(2'h2)]);
  assign wire35 = reg32;
  assign wire36 = $unsigned((~$signed((^(|reg30)))));
  assign wire37 = $unsigned(wire20[(1'h1):(1'h1)]);
  assign wire38 = (($unsigned(wire17[(1'h0):(1'h0)]) ? wire19 : wire35) ?
                      (($signed($signed(wire17)) ?
                          (&(~&reg24)) : ((~&reg28) & (~^(8'h9c)))) + (8'hb6)) : $unsigned($unsigned($unsigned($unsigned(reg30)))));
  assign wire39 = reg27[(1'h0):(1'h0)];
  assign wire40 = (&$signed($signed((~^$signed(wire37)))));
  assign wire41 = reg26[(2'h2):(2'h2)];
  assign wire42 = $unsigned($unsigned((!wire16[(4'hc):(1'h0)])));
endmodule

module module154
#(parameter param217 = (((((^(8'hb3)) ? (~&(8'hb4)) : ((8'h9e) ? (8'hb0) : (8'hae))) == ((!(8'hb8)) ? ((8'ha4) >>> (8'hab)) : (8'ha4))) ? (((8'ha9) ? (-(8'hae)) : ((8'hb6) ? (8'hb0) : (8'hb1))) ? ((~|(8'hb5)) <<< ((8'h9c) <<< (8'hb2))) : (((8'hab) != (8'ha6)) ^ ((7'h40) ? (7'h42) : (8'h9f)))) : (~^((^~(7'h42)) ^ ((8'hb3) >> (7'h42))))) ? ((-(~|(~^(8'hb9)))) | (((8'hbe) ? {(8'haf)} : ((8'ha9) + (8'ha0))) ^ ((+(8'h9d)) ? ((8'hbb) ? (8'haf) : (8'hac)) : (~^(7'h43))))) : ({(&(&(8'ha4))), ({(7'h41), (8'hb3)} != (-(8'h9e)))} ? (+(((8'hb7) >> (7'h43)) >>> {(8'hbc), (7'h43)})) : (8'hb4))))
(y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h2b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire159;
  input wire signed [(4'hc):(1'h0)] wire158;
  input wire [(4'hc):(1'h0)] wire157;
  input wire [(4'ha):(1'h0)] wire156;
  input wire [(4'hf):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire216;
  wire [(4'h9):(1'h0)] wire215;
  wire [(2'h2):(1'h0)] wire214;
  wire [(5'h15):(1'h0)] wire213;
  wire [(4'ha):(1'h0)] wire212;
  wire [(4'h8):(1'h0)] wire211;
  wire signed [(4'hc):(1'h0)] wire210;
  wire [(2'h3):(1'h0)] wire209;
  wire [(4'hd):(1'h0)] wire184;
  wire signed [(5'h10):(1'h0)] wire183;
  wire signed [(3'h7):(1'h0)] wire182;
  wire [(2'h3):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire180;
  wire [(5'h14):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire178;
  reg [(3'h4):(1'h0)] reg208 = (1'h0);
  reg [(4'hf):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg206 = (1'h0);
  reg [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg204 = (1'h0);
  reg [(3'h6):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg [(3'h7):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg198 = (1'h0);
  reg [(5'h12):(1'h0)] reg197 = (1'h0);
  reg [(3'h7):(1'h0)] reg196 = (1'h0);
  reg [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(4'hf):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(4'he):(1'h0)] reg187 = (1'h0);
  reg [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg171 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  assign y = {wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'ha6))
        begin
          if (wire156)
            begin
              reg160 <= (~&(|(($unsigned(wire159) ?
                      $unsigned(wire158) : $signed(wire159)) ?
                  {$signed((8'hb1)),
                      wire156} : (wire157[(4'h8):(3'h5)] >= $unsigned(wire156)))));
              reg161 <= reg160[(4'h9):(4'h8)];
              reg162 <= (((((reg160 > reg160) ?
                      (wire157 ? reg161 : wire157) : {wire155,
                          wire159}) - $unsigned(reg161[(4'ha):(3'h7)])) || ({(wire159 ?
                              reg160 : (8'hbe))} ?
                      $signed((wire155 != reg160)) : $unsigned(wire157))) ?
                  (wire156 >= wire157[(4'h8):(1'h0)]) : (reg161 || (wire155 ?
                      (|wire156[(4'ha):(3'h6)]) : (wire158 ?
                          (reg160 * wire158) : reg160))));
            end
          else
            begin
              reg160 <= wire158;
            end
          reg163 <= {($unsigned((&(~^reg161))) <= (+((wire158 ?
                  reg161 : wire158) ~^ (wire155 == wire155))))};
          if ((-wire157))
            begin
              reg164 <= (((($signed((8'ha8)) ?
                      (~wire156) : $signed(wire156)) - $signed(reg162)) ?
                  $signed(wire158[(2'h3):(2'h2)]) : (!reg163)) == $signed($signed($unsigned(reg160))));
              reg165 <= (((((reg164 ? reg160 : reg162) ?
                      reg163[(2'h2):(1'h1)] : ((8'ha1) ?
                          reg161 : reg162)) >= ((reg163 + reg163) | $signed(reg161))) ?
                  ((8'hbe) & (~&(reg163 ?
                      reg164 : reg161))) : reg164[(3'h5):(2'h2)]) >>> (reg161 ?
                  wire158[(4'ha):(4'ha)] : (-$signed((^~reg162)))));
            end
          else
            begin
              reg164 <= (~(^reg162[(5'h11):(3'h7)]));
              reg165 <= (&reg162);
              reg166 <= ($signed($signed(wire155[(4'hd):(2'h2)])) - reg165[(2'h3):(2'h2)]);
              reg167 <= (-reg163);
              reg168 <= {reg164};
            end
          reg169 <= wire156;
        end
      else
        begin
          reg160 <= reg168[(1'h1):(1'h1)];
        end
      reg170 <= $signed(reg164);
      reg171 <= {(wire156 ?
              (!(wire157 ?
                  reg162[(3'h6):(3'h4)] : ((8'ha2) <<< reg167))) : ($signed(wire156[(2'h2):(1'h0)]) > $unsigned($unsigned((8'ha6)))))};
    end
  always
    @(posedge clk) begin
      if (($unsigned(($signed((~(8'hbf))) <<< ((reg168 ?
          wire158 : reg163) && reg171[(4'hb):(3'h4)]))) >>> reg162[(4'hb):(4'h8)]))
        begin
          reg172 <= reg165[(3'h6):(2'h2)];
        end
      else
        begin
          if ((reg169 + (((reg161[(4'h8):(2'h2)] <= (reg162 <<< reg161)) ?
              reg166 : reg170[(3'h5):(1'h1)]) == reg162[(4'hf):(1'h0)])))
            begin
              reg172 <= (reg168 <<< $signed({(reg163[(2'h2):(2'h2)] < (reg170 ?
                      reg162 : wire157)),
                  $unsigned(wire158[(4'h9):(1'h1)])}));
              reg173 <= {(8'hbd)};
              reg174 <= reg161;
              reg175 <= (-((~^$signed($signed(reg161))) ?
                  $signed($signed((^reg174))) : (+($unsigned(reg168) ?
                      reg169 : reg173))));
            end
          else
            begin
              reg172 <= reg172[(3'h4):(2'h2)];
            end
          reg176 <= (|$signed($signed(((reg169 ? wire156 : reg172) ?
              (reg173 ? reg168 : reg169) : (reg174 ? reg175 : wire158)))));
          reg177 <= reg176[(1'h1):(1'h1)];
        end
    end
  assign wire178 = reg172[(2'h3):(1'h0)];
  assign wire179 = $unsigned(reg172);
  assign wire180 = reg170;
  assign wire181 = (reg175[(3'h7):(3'h7)] ?
                       ({(|(reg167 ?
                               reg171 : reg174))} & (((-reg167) || reg166) >>> (!$unsigned(wire159)))) : $unsigned(reg171));
  assign wire182 = reg177[(3'h4):(2'h3)];
  assign wire183 = (8'hab);
  assign wire184 = ($signed(wire155) << $unsigned($signed((~(reg174 ?
                       wire178 : (8'hb5))))));
  always
    @(posedge clk) begin
      if (reg166)
        begin
          reg185 <= wire179[(3'h5):(2'h3)];
          reg186 <= $unsigned($unsigned($unsigned(((+wire184) & $signed(reg176)))));
          reg187 <= (8'haf);
          reg188 <= $signed(reg166[(4'hb):(3'h6)]);
          reg189 <= ($unsigned($signed(($signed(wire159) ?
                  reg164 : $unsigned(wire158)))) ?
              (&(^reg186[(2'h2):(2'h2)])) : ((wire182 >= ((reg176 <<< wire180) <= $signed(wire155))) ?
                  reg175[(4'h9):(2'h3)] : reg187));
        end
      else
        begin
          if ({((^~$signed($signed(wire180))) ?
                  {$unsigned((reg185 ^~ wire184)),
                      {{wire181, reg176}}} : (^~wire180[(3'h6):(1'h0)]))})
            begin
              reg185 <= reg165[(4'he):(1'h0)];
              reg186 <= reg162[(4'hc):(4'h9)];
              reg187 <= ($unsigned(reg187) && reg169[(4'h8):(1'h0)]);
              reg188 <= $unsigned({($unsigned($signed(reg175)) <= reg166),
                  reg189});
              reg189 <= (^$unsigned(reg177[(4'hd):(3'h4)]));
            end
          else
            begin
              reg185 <= $signed(({{{reg185, wire156}},
                  ($signed(reg188) ?
                      (reg161 > wire183) : $unsigned(reg167))} + $signed(reg165[(4'hf):(3'h7)])));
              reg186 <= reg168[(4'ha):(3'h4)];
              reg187 <= $unsigned($unsigned(($signed((^wire183)) ?
                  $unsigned(wire157[(4'hc):(4'hb)]) : (wire158[(3'h7):(3'h6)] || reg162))));
              reg188 <= reg189[(1'h0):(1'h0)];
            end
          reg190 <= {(~|{wire155, (|$unsigned(reg167))}), reg189};
          reg191 <= reg187[(3'h6):(2'h2)];
          reg192 <= reg173;
          if ({{$signed($signed(((8'hba) ? reg168 : (7'h41))))}})
            begin
              reg193 <= reg172[(5'h10):(3'h4)];
              reg194 <= $unsigned({(reg169[(4'hb):(4'ha)] >>> (~^(^~(8'ha8))))});
              reg195 <= (~^((-wire181) != $unsigned((-reg172))));
              reg196 <= reg176[(2'h3):(2'h2)];
            end
          else
            begin
              reg193 <= reg164[(2'h2):(2'h2)];
            end
        end
      reg197 <= (-reg195[(4'ha):(4'h8)]);
      if (reg187)
        begin
          reg198 <= (wire181[(2'h3):(2'h2)] - $signed((-((wire181 ?
                  wire179 : reg186) ?
              $unsigned(reg172) : reg186[(1'h0):(1'h0)]))));
          reg199 <= reg185;
          if ($signed(wire155))
            begin
              reg200 <= {(~|reg176[(1'h0):(1'h0)])};
              reg201 <= ($unsigned(($signed((~reg188)) ?
                      reg174[(1'h1):(1'h0)] : $unsigned(reg164))) ?
                  ((reg194 ?
                      $unsigned(reg176) : $unsigned({reg193,
                          wire155})) || $unsigned((^(reg160 ?
                      reg161 : reg161)))) : reg168);
              reg202 <= wire180;
              reg203 <= $unsigned(({((~|reg172) >>> $unsigned(reg170))} ?
                  ((8'haa) >>> reg167) : reg192));
              reg204 <= (wire159[(1'h1):(1'h1)] ?
                  ($unsigned(reg176[(2'h2):(1'h1)]) | $unsigned(reg188[(1'h0):(1'h0)])) : (($unsigned($signed(reg167)) || (~$unsigned(wire180))) ?
                      ($signed((reg174 ? wire159 : (8'ha0))) != {(~|reg174),
                          $unsigned(reg175)}) : (8'h9e)));
            end
          else
            begin
              reg200 <= (((!({wire156, wire181} ?
                      $signed(wire183) : reg196[(3'h5):(3'h5)])) && {wire182[(3'h4):(1'h1)],
                      ((reg185 ~^ reg162) ?
                          $signed(wire155) : (reg170 <<< (8'ha7)))}) ?
                  $unsigned(reg174[(1'h0):(1'h0)]) : (~|$signed($signed(reg161[(1'h1):(1'h1)]))));
              reg201 <= (8'hb5);
              reg202 <= {(((reg163[(1'h0):(1'h0)] || ((8'ha4) ?
                      reg200 : (8'hb5))) <= reg186[(2'h2):(1'h0)]) ^ $unsigned($unsigned((reg201 >= reg161))))};
            end
          reg205 <= wire180;
          reg206 <= reg162[(1'h0):(1'h0)];
        end
      else
        begin
          reg198 <= reg199[(3'h6):(1'h0)];
          reg199 <= $unsigned((reg198[(2'h3):(2'h2)] ^~ reg200[(2'h3):(1'h0)]));
        end
      reg207 <= ({(reg202 ?
                  reg204[(3'h5):(3'h4)] : $signed((reg168 ? reg166 : reg205))),
              {(|reg174)}} ?
          $signed(reg192) : reg203);
      reg208 <= ($signed((~^((reg161 ?
              reg163 : reg205) >= ((8'hac) <= reg188)))) ?
          (-wire180[(3'h7):(1'h1)]) : (-(({reg201, reg204} ?
              reg172 : $signed(reg166)) & reg204[(3'h6):(2'h2)])));
    end
  assign wire209 = (wire157[(4'h8):(1'h0)] && (|wire182));
  assign wire210 = $signed((((~|wire183[(4'hf):(2'h2)]) >> (reg169 ?
                       (wire183 ?
                           reg162 : reg193) : $signed(reg186))) >> (((reg186 ?
                       reg198 : reg195) < $signed(reg171)) ~^ {(~^reg165)})));
  assign wire211 = ((reg207 ~^ (~|((-reg171) ?
                       (reg191 ?
                           wire178 : wire183) : reg170))) | reg197[(3'h5):(2'h3)]);
  assign wire212 = ($signed((&reg167)) ~^ ($unsigned(reg196[(1'h0):(1'h0)]) ?
                       reg188 : reg207[(4'hd):(4'h8)]));
  assign wire213 = (($unsigned(((reg170 ^~ reg170) != $signed(wire155))) | reg177[(1'h0):(1'h0)]) ?
                       reg167 : reg206[(4'ha):(4'ha)]);
  assign wire214 = (^wire180[(4'hb):(4'h9)]);
  assign wire215 = $unsigned((wire212 >>> (+(~&(wire180 && reg188)))));
  assign wire216 = reg202[(2'h2):(1'h0)];
endmodule

module module111
#(parameter param146 = (~|(~&(~|(!((8'ha6) ? (8'h9e) : (8'hb3)))))))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire115;
  input wire [(4'ha):(1'h0)] wire114;
  input wire signed [(3'h4):(1'h0)] wire113;
  input wire signed [(3'h4):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire [(3'h6):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire116;
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  assign y = {wire145,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire123,
                 wire122,
                 wire121,
                 wire116,
                 reg144,
                 reg143,
                 reg142,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire116 = ((wire112 == $signed(((&wire114) <= wire112))) ?
                       wire114[(3'h5):(1'h0)] : $signed(wire113[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      if ((wire112 ?
          $signed((8'ha0)) : $signed(((~^$signed((8'hbf))) ?
              (wire116[(2'h3):(1'h0)] + wire115[(1'h1):(1'h0)]) : wire116[(1'h1):(1'h0)]))))
        begin
          reg117 <= (8'ha7);
          reg118 <= wire114[(1'h1):(1'h0)];
          reg119 <= (~wire114);
        end
      else
        begin
          reg117 <= $signed({((wire114[(4'ha):(3'h6)] ?
                  (wire116 ?
                      wire114 : wire114) : (wire115 <<< wire113)) ^~ reg119),
              (($unsigned(reg117) ?
                  (wire116 ?
                      (8'hbf) : wire112) : wire113[(1'h1):(1'h0)]) || $unsigned($signed(wire113)))});
          reg118 <= ($signed(wire113[(3'h4):(2'h2)]) ?
              (wire116 <<< $signed(reg117)) : $unsigned($signed((reg119 ?
                  $signed(wire114) : $signed(wire116)))));
        end
      reg120 <= $signed({(+($signed(reg117) ?
              (wire114 ? wire113 : (8'hae)) : (wire112 ? wire115 : wire113)))});
    end
  assign wire121 = $signed(((reg119[(4'ha):(2'h3)] & (~^$signed((8'had)))) ?
                       $signed(((wire112 ? reg120 : (8'hb4)) ?
                           (~&(8'hbc)) : $unsigned(reg117))) : $unsigned(wire114)));
  assign wire122 = $signed(wire115);
  assign wire123 = {$unsigned((((~wire112) ?
                           (8'ha7) : (&(8'hb1))) + {(~&(8'hb8))})),
                       {$signed((~|$signed(wire113))), wire114}};
  always
    @(posedge clk) begin
      reg124 <= ($signed({$unsigned((wire115 ? wire121 : wire123)),
          {wire121,
              (reg117 ?
                  wire114 : wire116)}}) || $unsigned($unsigned(reg118[(3'h6):(3'h6)])));
      reg125 <= wire121[(1'h0):(1'h0)];
      reg126 <= ($unsigned(((~&(reg117 ? wire122 : wire113)) ?
              ($unsigned(wire122) ?
                  reg117[(4'hc):(2'h2)] : (reg117 ?
                      reg117 : (8'hbc))) : $signed((|wire116)))) ?
          (reg118[(3'h7):(1'h1)] >> ((8'h9e) >>> {wire116,
              (!reg125)})) : ((reg118[(1'h1):(1'h1)] > $signed((reg120 ?
                  reg118 : (8'hab)))) ?
              $signed({$signed(wire112)}) : reg118));
      if (wire123[(3'h6):(3'h6)])
        begin
          if (reg125)
            begin
              reg127 <= ($signed(((|(wire123 == (8'hb1))) ?
                      (|(reg118 * reg119)) : ($signed(reg124) * (^wire116)))) ?
                  ($unsigned((wire116[(4'h9):(3'h6)] ?
                          (wire114 || reg126) : (wire123 ? reg120 : reg124))) ?
                      $signed($signed(wire121[(3'h5):(2'h3)])) : $signed((wire112[(2'h2):(2'h2)] != (wire114 || wire122)))) : $signed(({(reg125 < wire123),
                          {reg120, (8'h9e)}} ?
                      (&(wire114 ?
                          wire116 : (8'haa))) : $signed((reg118 >> wire115)))));
              reg128 <= {(reg119 >> (wire121[(3'h4):(2'h2)] | {reg127})),
                  wire112};
              reg129 <= wire112[(2'h2):(1'h0)];
              reg130 <= ({wire114[(3'h5):(2'h3)],
                  ($unsigned((!reg119)) ?
                      {$signed(wire112)} : reg127[(4'h9):(4'h8)])} + wire121[(1'h1):(1'h0)]);
              reg131 <= (8'h9f);
            end
          else
            begin
              reg127 <= (8'had);
              reg128 <= {{({reg131[(2'h2):(1'h0)],
                          ((8'hb8) ?
                              reg127 : wire115)} ^ reg131[(1'h1):(1'h1)])}};
              reg129 <= $unsigned(wire116[(3'h4):(2'h3)]);
            end
          if ($unsigned(reg131))
            begin
              reg132 <= (+$unsigned((reg120[(2'h2):(1'h0)] << $unsigned(reg117))));
              reg133 <= $signed(((|reg124) >>> ($signed((&wire116)) ?
                  (reg128[(4'h9):(3'h7)] ?
                      reg119[(4'h9):(2'h3)] : reg118[(2'h2):(1'h0)]) : ({(8'hac)} | (~&reg130)))));
            end
          else
            begin
              reg132 <= {$unsigned($signed($unsigned($unsigned(wire112))))};
            end
          reg134 <= reg133;
        end
      else
        begin
          reg127 <= (~&(8'hb7));
          if (((wire121[(1'h0):(1'h0)] ?
              ((7'h44) ?
                  wire114[(3'h4):(2'h3)] : $signed(reg127)) : reg127) == ($signed(reg133[(4'hc):(3'h4)]) * ((^wire116) ?
              (-{wire122, reg126}) : reg118[(3'h5):(3'h4)]))))
            begin
              reg128 <= (~$unsigned({wire121}));
              reg129 <= (reg130 ?
                  (~&(^~{$unsigned(wire121), reg132})) : $unsigned(reg131));
              reg130 <= ((($signed((+(7'h40))) ~^ (~(wire123 ?
                  reg118 : reg130))) >> reg131) * $unsigned(reg126[(5'h11):(1'h1)]));
              reg131 <= $unsigned(($signed((~^reg126)) ?
                  reg117 : $signed($unsigned(reg125[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg128 <= $signed((8'hba));
              reg129 <= $signed(reg124[(3'h6):(1'h1)]);
              reg130 <= $unsigned($unsigned(($signed($signed((8'ha9))) ?
                  ($unsigned(wire116) ^~ $signed(reg127)) : reg125)));
              reg131 <= wire114[(3'h4):(3'h4)];
              reg132 <= $unsigned(((({reg119} ?
                  $unsigned((8'ha3)) : $signed(reg117)) | {(reg118 != (8'ha9)),
                  $unsigned(wire122)}) ~^ reg133));
            end
          reg133 <= (^$unsigned(reg131[(3'h4):(1'h1)]));
        end
    end
  assign wire135 = $signed(($unsigned($unsigned((reg130 > reg125))) ?
                       $unsigned($unsigned(reg126[(2'h3):(1'h0)])) : $signed($unsigned((8'ha1)))));
  assign wire136 = reg131[(2'h2):(2'h2)];
  assign wire137 = ($unsigned(wire116) ?
                       $unsigned($unsigned(((^wire114) ?
                           $signed(wire115) : reg124[(4'h8):(1'h1)]))) : (reg128 >>> $unsigned(reg120)));
  assign wire138 = wire123[(3'h4):(2'h2)];
  assign wire139 = $signed(wire138);
  assign wire140 = $signed((~^(8'hbe)));
  assign wire141 = {((($unsigned(reg124) ? (~&(8'hbe)) : (7'h44)) ?
                           reg120[(4'hc):(1'h0)] : (wire121 <= wire140)) ^ reg120),
                       (8'had)};
  always
    @(posedge clk) begin
      reg142 <= ((8'haf) | (~^(reg134 & reg132[(4'h8):(4'h8)])));
    end
  always
    @(posedge clk) begin
      reg143 <= $signed($unsigned($signed(((reg134 ?
          wire121 : (8'h9d)) && wire116[(1'h0):(1'h0)]))));
      reg144 <= (wire121[(2'h2):(2'h2)] > (reg130 ?
          {((+wire115) ?
                  (~wire121) : (wire122 ?
                      reg132 : wire115))} : $signed(({wire141} || (wire114 * wire113)))));
    end
  assign wire145 = ((~^($unsigned($unsigned(wire141)) & (reg128[(3'h7):(2'h2)] ?
                       (&wire112) : (^reg131)))) > reg127);
endmodule

module module74
#(parameter param101 = (-{(((8'hb7) - ((8'hb1) == (8'ha0))) <= (8'hbe)), {((~(7'h41)) && {(8'hb6)})}}), 
parameter param102 = ((8'hbc) > param101))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  input wire [(4'hf):(1'h0)] wire77;
  input wire [(3'h7):(1'h0)] wire76;
  input wire signed [(3'h4):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire82,
                 wire81,
                 wire80,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire80 = (~^$signed((~&(&$unsigned(wire78)))));
  assign wire81 = wire75[(1'h0):(1'h0)];
  assign wire82 = $unsigned({(($unsigned(wire76) ?
                          $signed(wire81) : {wire75,
                              (8'ha7)}) ^~ (~&wire78[(4'he):(2'h3)])),
                      $unsigned((wire81 ? $signed(wire79) : (~^wire79)))});
  always
    @(posedge clk) begin
      reg83 <= (^~$signed((wire82 ? wire80 : wire80)));
    end
  always
    @(posedge clk) begin
      reg84 <= $signed($signed(((&wire76) ? {wire75} : $signed((~|wire77)))));
      reg85 <= (wire76 ? reg83[(4'hb):(4'h8)] : $signed(wire82[(3'h5):(1'h1)]));
      reg86 <= (wire75[(2'h3):(2'h2)] >= {((!(!(8'haf))) ?
              (|$signed((8'ha8))) : ((!wire75) & (wire77 ? wire76 : wire79)))});
      if (wire77[(4'hb):(1'h1)])
        begin
          if ((|$unsigned($signed(reg84[(4'h8):(2'h3)]))))
            begin
              reg87 <= wire81;
              reg88 <= $unsigned((~^{$unsigned($signed(reg86)), reg87}));
              reg89 <= wire80[(2'h2):(2'h2)];
              reg90 <= reg83;
              reg91 <= (8'ha1);
            end
          else
            begin
              reg87 <= $unsigned((8'hb4));
              reg88 <= reg89[(4'h9):(4'h9)];
              reg89 <= (~(reg85 ~^ {reg89[(4'h8):(3'h7)],
                  reg85[(1'h1):(1'h0)]}));
              reg90 <= $unsigned(((reg84[(4'hb):(1'h0)] != ($unsigned(wire75) ?
                      (reg86 ? wire79 : wire77) : reg85[(4'hc):(3'h7)])) ?
                  reg91 : ($unsigned((reg86 ?
                      reg89 : reg83)) != $unsigned((wire78 ~^ reg84)))));
              reg91 <= reg87[(3'h6):(3'h6)];
            end
          reg92 <= (reg85 ?
              (((~^(reg87 < reg85)) ?
                  (8'ha3) : (wire82[(3'h6):(1'h0)] >>> (!wire77))) ^ ((^~$signed(reg86)) ^~ $unsigned($unsigned(wire79)))) : reg89[(3'h6):(1'h1)]);
          if (($signed($unsigned($unsigned(wire75[(1'h0):(1'h0)]))) >>> ({$signed((wire76 ^ reg86))} ?
              $unsigned(((wire75 ? (8'h9f) : wire78) ?
                  (wire82 ?
                      reg89 : reg86) : $unsigned(reg91))) : $unsigned(wire80[(1'h0):(1'h0)]))))
            begin
              reg93 <= reg83[(1'h1):(1'h0)];
              reg94 <= (+((+(~&{(7'h41)})) ?
                  $signed((reg92 ?
                      (reg89 ?
                          (7'h43) : reg88) : $signed(reg83))) : (($signed((8'ha6)) ?
                      wire75[(1'h0):(1'h0)] : $unsigned((7'h43))) != $signed({(7'h44),
                      (8'hb4)}))));
              reg95 <= ($signed({{(reg88 ? reg84 : reg84)}}) ?
                  (({wire82} ?
                      (~^((8'hb3) ?
                          reg86 : wire82)) : wire82) <<< (&reg88[(4'he):(4'h9)])) : (+({$signed(reg89),
                          (reg86 ? reg89 : (8'hb1))} ?
                      $unsigned(reg94) : (8'haf))));
            end
          else
            begin
              reg93 <= wire79[(3'h6):(2'h2)];
              reg94 <= $signed($signed($unsigned((((8'ha2) < (8'ha9)) ?
                  $signed((8'hb2)) : {reg88, wire82}))));
              reg95 <= (((!wire75) || wire75[(1'h0):(1'h0)]) ?
                  (^~reg95[(4'he):(2'h3)]) : $signed(reg93[(1'h1):(1'h0)]));
              reg96 <= $unsigned($unsigned($signed($signed({reg90}))));
              reg97 <= $unsigned({wire81});
            end
        end
      else
        begin
          reg87 <= ($unsigned(($unsigned(reg87) * ($unsigned(reg90) ?
              (-wire76) : $signed(wire80)))) >> $unsigned(reg91[(3'h7):(3'h7)]));
          reg88 <= reg86[(3'h4):(1'h0)];
          reg89 <= $unsigned($signed(((~|(reg91 ? reg91 : (8'hb5))) ?
              wire78 : ($unsigned(wire82) ?
                  $unsigned(reg96) : $signed(reg93)))));
        end
    end
  assign wire98 = $unsigned(wire77);
  assign wire99 = $signed(reg91[(4'h8):(2'h3)]);
  assign wire100 = $unsigned($signed($signed(wire79)));
endmodule
