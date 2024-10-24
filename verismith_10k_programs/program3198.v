module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire230;
  wire signed [(5'h13):(1'h0)] wire229;
  wire signed [(4'ha):(1'h0)] wire228;
  wire [(5'h13):(1'h0)] wire227;
  wire signed [(3'h6):(1'h0)] wire226;
  wire signed [(5'h12):(1'h0)] wire225;
  wire signed [(5'h10):(1'h0)] wire217;
  wire [(4'hc):(1'h0)] wire216;
  wire [(4'h9):(1'h0)] wire215;
  wire signed [(5'h15):(1'h0)] wire214;
  wire [(5'h15):(1'h0)] wire213;
  wire signed [(5'h10):(1'h0)] wire212;
  wire [(5'h15):(1'h0)] wire211;
  wire [(4'hc):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire206;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire208;
  wire [(4'ha):(1'h0)] wire219;
  wire signed [(4'ha):(1'h0)] wire220;
  wire signed [(4'hf):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire222;
  wire signed [(5'h15):(1'h0)] wire223;
  assign y = {wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire206,
                 wire4,
                 wire208,
                 wire219,
                 wire220,
                 wire221,
                 wire222,
                 wire223,
                 (1'h0)};
  assign wire4 = $signed((($signed($unsigned(wire2)) ?
                     wire2[(2'h3):(1'h0)] : (~^wire2[(4'h9):(2'h2)])) <<< $unsigned(wire2[(4'h8):(3'h7)])));
  module5 #() modinst207 (wire206, clk, wire0, wire3, wire4, wire1, wire2);
  module138 #() modinst209 (wire208, clk, wire1, wire2, wire206, wire3, wire0);
  assign wire210 = $unsigned($unsigned(wire208));
  assign wire211 = $unsigned((($unsigned(wire210[(2'h2):(2'h2)]) ?
                           (~^{(8'h9e),
                               wire210}) : ((wire2 ~^ wire0) | $signed(wire0))) ?
                       (~(+wire0)) : wire1));
  assign wire212 = {(8'hb4), (-$signed((8'ha3)))};
  assign wire213 = (8'ha9);
  assign wire214 = (~&(^~(+(^(8'ha2)))));
  assign wire215 = ({wire210[(2'h3):(2'h2)],
                       $signed((8'hb0))} << wire214[(2'h2):(1'h0)]);
  assign wire216 = $unsigned(((((~wire211) << $signed(wire4)) && {{(7'h44),
                           (8'hbf)},
                       ((8'hac) && wire3)}) >> wire206));
  module109 #() modinst218 (.wire110(wire206), .clk(clk), .wire113(wire2), .wire114(wire216), .wire112(wire215), .wire111(wire210), .y(wire217));
  assign wire219 = (wire206 & $unsigned(wire215));
  assign wire220 = wire206;
  assign wire221 = wire214[(2'h2):(2'h2)];
  assign wire222 = wire213[(1'h1):(1'h0)];
  module138 #() modinst224 (wire223, clk, wire208, wire214, wire0, wire216, wire217);
  assign wire225 = (!wire220[(3'h4):(1'h1)]);
  assign wire226 = $unsigned((!(8'ha8)));
  assign wire227 = ($unsigned({wire206[(4'h9):(3'h6)], wire215}) - (8'hab));
  assign wire228 = wire216[(1'h1):(1'h1)];
  assign wire229 = wire227[(2'h3):(2'h3)];
  assign wire230 = {wire215[(1'h1):(1'h1)]};
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire205;
  wire [(2'h2):(1'h0)] wire204;
  wire [(5'h13):(1'h0)] wire203;
  wire signed [(4'h8):(1'h0)] wire202;
  wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(2'h3):(1'h0)] wire175;
  wire [(3'h5):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire194;
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg [(3'h4):(1'h0)] reg200 = (1'h0);
  reg [(4'ha):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg [(4'he):(1'h0)] reg196 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire71,
                 wire42,
                 wire41,
                 wire40,
                 wire73,
                 wire74,
                 wire75,
                 wire81,
                 wire82,
                 wire83,
                 wire136,
                 wire173,
                 wire175,
                 wire176,
                 wire194,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
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
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({$signed((^{wire6}))} >>> ($signed($unsigned((wire10 ?
          wire6 : wire7))) >> $unsigned($unsigned(wire6)))))
        begin
          reg11 <= ({(~{wire9, (wire6 | wire9)})} ?
              wire7[(4'h9):(3'h6)] : wire6);
        end
      else
        begin
          if ($unsigned($signed({($unsigned(reg11) >= $unsigned(reg11))})))
            begin
              reg11 <= {reg11[(4'h9):(1'h0)]};
              reg12 <= wire9;
            end
          else
            begin
              reg11 <= ($signed((~&reg12[(3'h7):(3'h6)])) ?
                  wire7[(2'h2):(1'h1)] : wire9[(4'hc):(3'h7)]);
              reg12 <= $unsigned(reg11[(2'h2):(1'h1)]);
              reg13 <= $signed(wire8);
              reg14 <= (8'ha4);
              reg15 <= wire10;
            end
          reg16 <= ((~&{($unsigned(reg14) >= (wire8 ? wire6 : wire7)),
              wire10}) != {reg12[(3'h7):(1'h1)], (8'ha3)});
          reg17 <= ((|(~^(|reg14[(3'h4):(2'h3)]))) ?
              $signed(wire7[(5'h10):(5'h10)]) : {$unsigned(wire7[(3'h4):(1'h1)])});
          reg18 <= (^$unsigned(reg13[(4'hb):(3'h4)]));
          reg19 <= (($signed($signed((reg11 ^~ reg14))) <= wire8[(4'hd):(2'h2)]) - (reg18 >>> $signed(wire7[(4'he):(1'h0)])));
        end
      reg20 <= (8'ha7);
      if ((($unsigned({(reg14 ? reg11 : reg20)}) ?
          wire8 : $signed(((wire7 < reg12) ?
              reg14 : $unsigned(reg14)))) ~^ reg12))
        begin
          reg21 <= (($unsigned(wire6[(3'h7):(2'h3)]) >= (|reg14[(3'h6):(2'h3)])) ?
              $unsigned((reg18[(4'hd):(4'h8)] ? reg19 : reg15)) : (({(^(8'hb0)),
                      reg11} ?
                  ({wire9, (8'haf)} <= {(8'had),
                      wire9}) : (reg11 ^ {wire9})) - reg16));
        end
      else
        begin
          reg21 <= reg15[(1'h0):(1'h0)];
        end
      if (((~{reg19, ((^reg14) ? $signed(reg11) : {wire9})}) ?
          wire9[(1'h1):(1'h1)] : (wire8 ~^ $unsigned(reg11[(4'h8):(3'h5)]))))
        begin
          if ((~&{(($signed(wire9) ?
                  $unsigned(wire9) : reg12[(4'h8):(2'h2)]) & (&$unsigned(reg16))),
              $unsigned(wire7[(5'h10):(3'h7)])}))
            begin
              reg22 <= wire10[(1'h1):(1'h1)];
              reg23 <= {$signed((~|(reg15 ^ $signed(reg22)))),
                  $unsigned({reg14})};
              reg24 <= wire10[(3'h4):(1'h0)];
            end
          else
            begin
              reg22 <= reg14[(1'h1):(1'h1)];
              reg23 <= (8'ha8);
              reg24 <= (reg13[(5'h11):(4'hf)] ? wire7 : reg12);
              reg25 <= (^(reg11[(3'h4):(3'h4)] + $signed({$signed(reg16),
                  $unsigned(reg20)})));
              reg26 <= wire7[(2'h2):(1'h1)];
            end
          reg27 <= (($unsigned(reg16[(3'h6):(1'h1)]) ?
                  (^$unsigned($signed((8'hb0)))) : $signed({(reg18 ^ reg21),
                      $signed(wire8)})) ?
              reg19 : $signed(($signed(reg15[(2'h2):(1'h1)]) ?
                  wire8[(4'h8):(3'h4)] : reg15[(2'h2):(2'h2)])));
          reg28 <= reg18;
          reg29 <= (~$unsigned($unsigned(reg15[(2'h2):(1'h0)])));
          if ((^~(({$signed(reg12)} && reg29[(2'h3):(2'h3)]) ?
              (8'ha3) : ({$unsigned(wire9)} ?
                  (reg15 ? $signed(reg27) : $signed(wire6)) : {{wire10},
                      (reg29 ? wire8 : reg13)}))))
            begin
              reg30 <= $unsigned($signed((reg18 ?
                  ($signed(reg27) ?
                      (reg25 || reg28) : $signed(wire10)) : $signed((8'hb0)))));
              reg31 <= wire9[(3'h5):(1'h1)];
              reg32 <= $signed(reg16[(2'h2):(1'h1)]);
              reg33 <= $signed($unsigned(reg26));
            end
          else
            begin
              reg30 <= (!wire9[(4'hb):(3'h6)]);
              reg31 <= $signed($unsigned($unsigned(wire8)));
              reg32 <= wire10[(1'h0):(1'h0)];
              reg33 <= ((reg16 & $signed((~&(reg28 ?
                  wire6 : reg30)))) ^~ ($unsigned(reg16[(3'h6):(2'h3)]) ?
                  (^$signed($signed(wire7))) : (reg25[(1'h0):(1'h0)] ?
                      reg31 : (|((8'ha8) <= reg15)))));
              reg34 <= (((((7'h41) + ((8'ha9) ?
                      (8'hbf) : reg13)) || $unsigned((reg20 >>> (8'ha4)))) ?
                  (~^{{reg17, reg19},
                      $unsigned((8'ha1))}) : (^(-(8'hae)))) >> reg15[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          if ($unsigned(reg25[(4'hc):(4'h9)]))
            begin
              reg22 <= ($signed($signed((^$unsigned(reg18)))) ?
                  reg34[(4'hb):(3'h7)] : reg31);
              reg23 <= (^$unsigned($unsigned(wire8)));
              reg24 <= ({reg29} ? {$signed((~&$signed((8'ha4))))} : reg17);
              reg25 <= ((|$signed(((&wire9) ?
                      reg24[(4'h9):(2'h2)] : $signed(reg24)))) ?
                  reg22 : wire6);
              reg26 <= ($signed((-{(^(8'haa))})) ?
                  reg34 : $signed(($unsigned($unsigned(reg12)) || $unsigned(reg25))));
            end
          else
            begin
              reg22 <= $signed(((8'h9e) ?
                  ((~|{reg13}) + ((~reg21) < $unsigned(reg31))) : wire6));
              reg23 <= reg12[(1'h0):(1'h0)];
              reg24 <= (|(|$signed($unsigned((reg29 ? reg29 : reg12)))));
              reg25 <= ((&(~((reg11 ? reg20 : wire7) < $signed(reg31)))) ?
                  ((reg31[(2'h3):(1'h0)] ?
                          ((reg15 ?
                              reg29 : reg30) >>> (~|reg12)) : wire8[(3'h4):(1'h1)]) ?
                      ($signed((!(7'h41))) ?
                          ($signed(reg15) ?
                              ((8'h9d) * reg34) : $signed(reg17)) : reg18[(3'h5):(3'h4)]) : (reg17 != $signed((~|reg24)))) : $unsigned((~^((~^reg24) ^ $unsigned(reg21)))));
            end
          reg27 <= {wire6[(4'hd):(4'ha)]};
          if ($unsigned((~|(^(reg24[(4'ha):(3'h5)] ?
              ((8'ha6) & reg31) : (reg21 ? reg29 : (8'h9e)))))))
            begin
              reg28 <= ((~|(~&$signed((&reg21)))) | reg14);
              reg29 <= ((^~(~|wire7[(4'hb):(3'h4)])) - reg31);
              reg30 <= (|$unsigned((($signed(reg31) * $signed(wire8)) << (reg19 ?
                  reg24 : $unsigned((8'hbd))))));
            end
          else
            begin
              reg28 <= $unsigned((reg25[(3'h6):(3'h4)] ?
                  $signed(((reg20 ? reg23 : reg18) ?
                      reg31[(2'h2):(1'h1)] : $unsigned(reg26))) : reg29[(4'h9):(1'h1)]));
              reg29 <= (~^(reg29 ?
                  (wire10 ?
                      ($unsigned(reg16) == (reg20 >>> (8'hb4))) : ((+reg18) ?
                          (reg27 ?
                              (8'hb0) : reg26) : {reg18})) : (((reg22 * wire8) * (8'ha8)) ?
                      $unsigned((~reg15)) : {(~^wire8)})));
              reg30 <= $unsigned(reg22);
              reg31 <= (-(~|reg34));
              reg32 <= reg21;
            end
          if (reg17)
            begin
              reg33 <= (((!(8'hbf)) ?
                      reg31[(1'h0):(1'h0)] : $signed(((~reg19) >> reg24[(4'ha):(1'h1)]))) ?
                  $signed($unsigned(wire10[(1'h0):(1'h0)])) : ((~&$unsigned(reg33[(3'h4):(2'h2)])) ^~ ($unsigned(reg29[(3'h6):(1'h1)]) ?
                      $unsigned(reg17[(3'h7):(1'h1)]) : (~&(reg26 ?
                          reg23 : (8'ha0))))));
              reg34 <= $signed($unsigned(($signed((^(7'h41))) ?
                  reg13 : (reg13[(4'ha):(3'h6)] ?
                      (+reg27) : (wire9 ? reg30 : reg34)))));
              reg35 <= (reg16 ?
                  (+reg31) : ((wire10[(2'h2):(2'h2)] ?
                          $unsigned(reg13[(3'h7):(3'h4)]) : reg30) ?
                      reg22 : ($signed({reg13, (8'hb9)}) ?
                          {(wire7 ? reg33 : reg23)} : reg19)));
              reg36 <= ((^~((reg14[(3'h5):(1'h0)] >> {reg27,
                  reg26}) & ($signed(reg20) ^ reg26[(1'h1):(1'h0)]))) <<< $unsigned((|(+$unsigned((8'hb9))))));
              reg37 <= $signed($unsigned(reg36[(5'h12):(3'h4)]));
            end
          else
            begin
              reg33 <= $signed({reg26[(1'h1):(1'h1)],
                  (reg14[(2'h2):(1'h0)] ?
                      $signed($unsigned(reg15)) : $unsigned($signed(wire7)))});
              reg34 <= $signed(reg31);
              reg35 <= (~^reg22[(2'h2):(1'h1)]);
              reg36 <= reg18;
              reg37 <= (reg22[(2'h2):(2'h2)] <<< $signed(reg20));
            end
          reg38 <= wire8[(3'h4):(3'h4)];
        end
      reg39 <= ((reg21 || $signed(reg13[(3'h6):(2'h2)])) >> wire7);
    end
  assign wire40 = $unsigned($signed(($signed(reg27) ?
                      ((reg16 | reg18) <= {reg38,
                          wire6}) : reg29[(2'h3):(2'h3)])));
  assign wire41 = (~((~$signed(wire7[(4'he):(4'ha)])) ?
                      $unsigned((^(reg16 && reg24))) : (^((|wire10) ?
                          (|reg21) : $unsigned(reg35)))));
  assign wire42 = reg37[(4'he):(4'h9)];
  module43 #() modinst72 (wire71, clk, wire8, reg24, reg36, reg13);
  assign wire73 = reg37;
  assign wire74 = $signed(({$unsigned((reg24 < (8'ha5))),
                      reg29[(1'h1):(1'h0)]} + ($signed({reg22, reg22}) ?
                      ($unsigned(reg30) ?
                          (reg23 ~^ reg21) : reg18[(4'hc):(4'ha)]) : reg31)));
  assign wire75 = (+(((-{reg27, reg13}) ~^ reg24[(4'hf):(3'h5)]) + (((reg35 ?
                              reg15 : (8'ha6)) ?
                          $unsigned(reg11) : (~reg13)) ?
                      ($signed(reg38) ?
                          (-reg12) : (wire42 ?
                              wire73 : wire7)) : reg17[(3'h6):(2'h3)])));
  always
    @(posedge clk) begin
      if (wire7)
        begin
          reg76 <= (~^(((reg12 ?
              (reg12 == reg37) : $signed(reg39)) >> reg22[(4'h9):(3'h5)]) * $unsigned((&$unsigned(reg11)))));
          if ($signed(reg33[(3'h7):(2'h2)]))
            begin
              reg77 <= $unsigned(reg35[(3'h4):(3'h4)]);
              reg78 <= $unsigned(reg34);
              reg79 <= ($unsigned((wire8 ?
                  wire7[(1'h1):(1'h0)] : $unsigned((reg12 ~^ (7'h42))))) >> $unsigned(reg20));
            end
          else
            begin
              reg77 <= (wire6 > ($unsigned({(~&reg36)}) ?
                  (($signed(reg36) ? (!reg37) : $signed(reg14)) ?
                      wire6[(3'h6):(2'h2)] : ((|reg15) ~^ {reg35,
                          wire42})) : reg14[(1'h1):(1'h0)]));
              reg78 <= wire41[(2'h2):(2'h2)];
              reg79 <= $unsigned(reg18);
            end
        end
      else
        begin
          reg76 <= reg28;
          reg77 <= (reg32 >= ({(+$signed(wire6)), reg14[(2'h3):(1'h1)]} ?
              reg33 : (reg29[(2'h2):(1'h1)] ^~ reg37)));
        end
      reg80 <= $signed(reg13);
    end
  assign wire81 = reg27;
  assign wire82 = $signed($unsigned(reg36));
  assign wire83 = (+reg77[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg84 <= ((((^reg26) <<< reg19[(4'hb):(3'h7)]) ?
              wire75 : $signed((~|(^(8'hb7))))) ?
          reg27 : ($unsigned($signed((reg11 ?
              (8'hb7) : wire41))) < (((reg25 || reg25) && (+reg30)) - reg17[(4'h9):(3'h7)])));
      if (reg12[(2'h2):(1'h1)])
        begin
          reg85 <= (&(!{(reg37[(2'h2):(2'h2)] > (~|wire8))}));
          if ((reg30 ~^ (((((8'hb5) || reg84) ?
                      {reg30, wire73} : $unsigned(wire73)) ?
                  $unsigned($unsigned(reg28)) : $unsigned($signed(reg28))) ?
              reg25 : (^(reg76[(1'h0):(1'h0)] ?
                  (reg26 ? wire75 : wire8) : $unsigned(reg15))))))
            begin
              reg86 <= $unsigned({(~&reg38[(2'h3):(1'h0)]), reg78});
              reg87 <= reg26;
              reg88 <= (~^wire6);
            end
          else
            begin
              reg86 <= wire73[(5'h11):(3'h5)];
              reg87 <= reg85;
              reg88 <= ($signed(((reg84 ?
                      ((8'ha2) ? reg21 : reg21) : reg30[(4'ha):(4'h8)]) ?
                  ((8'hb5) > (wire9 != reg11)) : (!reg27))) << ({($signed(reg36) ?
                          (|reg25) : wire71[(4'h8):(3'h7)])} ?
                  (reg29 && wire71) : (^$signed($signed(reg34)))));
              reg89 <= (wire82 ?
                  reg76 : $unsigned($unsigned(reg29[(3'h7):(3'h4)])));
            end
          if (($unsigned((~((reg28 ? reg16 : reg32) ?
              reg37 : {wire74}))) > reg89[(3'h4):(2'h3)]))
            begin
              reg90 <= $unsigned(reg34[(4'hf):(3'h5)]);
              reg91 <= $unsigned({wire8});
              reg92 <= (reg28[(2'h3):(2'h3)] ?
                  $signed({reg25}) : $unsigned(reg13));
              reg93 <= (!reg31);
            end
          else
            begin
              reg90 <= reg31[(1'h1):(1'h0)];
              reg91 <= (($signed((wire71 != (~^reg13))) ?
                      (~^(-(~|reg15))) : (!$unsigned(((8'hba) & reg21)))) ?
                  wire8[(3'h6):(2'h2)] : {(wire40[(3'h4):(1'h0)] ?
                          (wire6[(3'h5):(1'h0)] ?
                              $unsigned(wire71) : (reg19 ?
                                  wire40 : reg90)) : $unsigned((reg31 ?
                              wire73 : (8'hbd)))),
                      $signed((((8'hbb) ? reg76 : reg36) ?
                          $unsigned(reg24) : $signed(wire75)))});
              reg92 <= (^~reg26[(3'h7):(1'h1)]);
              reg93 <= $unsigned(reg79);
              reg94 <= (~^(wire6 ? reg22 : reg85));
            end
          if ((((reg39[(2'h2):(1'h0)] ?
              $signed(wire81[(1'h1):(1'h0)]) : ((8'h9f) ^ $signed(wire71))) ^ (8'hb9)) & ($unsigned(wire41[(2'h3):(2'h3)]) + ($unsigned(reg32) ?
              $signed((reg13 ^~ (8'hb8))) : ((!reg18) ?
                  {reg90} : reg18[(4'hc):(2'h3)])))))
            begin
              reg95 <= reg77[(3'h7):(3'h6)];
              reg96 <= reg13;
              reg97 <= ((reg93 ^~ (&($unsigned(reg17) ?
                  $signed(reg16) : (reg88 ?
                      reg18 : wire7)))) >>> (($signed((reg88 - reg86)) ?
                  (reg86 ~^ (wire40 ^ reg96)) : (8'hbb)) * $unsigned(((~&reg35) ?
                  (8'hba) : (wire75 + wire81)))));
              reg98 <= (|({reg78[(4'h8):(1'h1)]} > $signed((|((8'h9c) ^ reg91)))));
              reg99 <= reg92[(2'h2):(1'h0)];
            end
          else
            begin
              reg95 <= {{$unsigned({(reg87 * reg36)})}};
            end
        end
      else
        begin
          if ($unsigned(wire73[(4'hb):(4'h9)]))
            begin
              reg85 <= reg34[(4'hc):(4'h8)];
              reg86 <= reg11;
              reg87 <= (8'hac);
            end
          else
            begin
              reg85 <= $signed((reg34 < ((~|((7'h43) | reg88)) ?
                  {reg79[(5'h13):(5'h10)]} : {$signed(reg11),
                      {(8'hb4), (7'h42)}})));
              reg86 <= reg32;
              reg87 <= $signed((-(reg15 << (8'ha5))));
              reg88 <= (&reg25);
            end
          reg89 <= $unsigned({(({reg24} ? wire82 : (~|reg91)) ?
                  ((+reg99) << (reg13 ? (8'ha2) : wire83)) : reg38)});
          reg90 <= reg39;
          reg91 <= reg80[(4'hf):(3'h7)];
        end
      reg100 <= (($signed(($signed(reg23) < ((8'h9c) ^ (8'haf)))) ~^ ({(-reg15),
                  $unsigned(reg29)} ?
              reg91[(4'h9):(3'h6)] : (+(reg35 && wire74)))) ?
          $signed((~&reg14)) : reg87[(3'h4):(3'h4)]);
      reg101 <= ((!(~&(+(reg88 ? reg22 : reg23)))) ~^ {{(&{reg14})},
          {$unsigned((wire81 ? reg89 : reg24))}});
      if ($unsigned((!reg101[(4'ha):(3'h4)])))
        begin
          if ($signed($unsigned(((~|wire81[(2'h3):(2'h2)]) * ($signed((8'ha4)) & $signed(wire41))))))
            begin
              reg102 <= ((wire74[(4'h8):(1'h0)] ?
                  {reg38} : (((8'hb5) ? wire74 : ((7'h43) - reg96)) ?
                      (reg35[(2'h2):(1'h0)] ?
                          $signed(reg21) : {wire9,
                              reg37}) : (reg76[(1'h0):(1'h0)] ?
                          {reg31,
                              wire73} : (wire74 <<< reg24)))) ~^ $unsigned(reg93));
              reg103 <= {reg39,
                  (&({reg77[(4'he):(1'h0)]} ? reg16 : $signed(reg11)))};
              reg104 <= $signed($unsigned((8'haf)));
              reg105 <= $unsigned($signed($unsigned(reg36[(4'h9):(2'h2)])));
            end
          else
            begin
              reg102 <= ($signed($unsigned($unsigned((reg11 ~^ wire74)))) > (^$unsigned((reg86[(2'h2):(2'h2)] ?
                  (reg32 < reg39) : $unsigned(wire83)))));
              reg103 <= {((reg18[(3'h4):(2'h3)] ?
                          ((+reg12) ?
                              ((7'h42) > (8'hae)) : $signed((7'h44))) : {(reg16 ?
                                  wire42 : reg79),
                              $signed(wire9)}) ?
                      wire42 : $unsigned(((reg93 ? wire41 : reg36) ?
                          $signed(reg34) : {reg104, wire83})))};
              reg104 <= (~|((reg99 <<< (((8'hbf) ? wire8 : reg88) ?
                  (reg24 >= reg95) : reg78)) > reg92));
            end
          reg106 <= (!({((wire74 < wire82) ? {(8'ha0), reg20} : $signed(reg23)),
              wire75[(4'h9):(1'h0)]} >>> reg99[(2'h2):(2'h2)]));
          reg107 <= $signed((~&(!$unsigned(reg105))));
          reg108 <= (reg92 ?
              $signed(reg18) : (reg105 ~^ (^wire75[(5'h12):(3'h4)])));
        end
      else
        begin
          reg102 <= reg14[(2'h2):(1'h1)];
          reg103 <= reg88[(3'h4):(1'h1)];
          reg104 <= ($unsigned(wire8) ^ ((($unsigned((8'ha5)) & {(8'hb7)}) + reg78) ?
              (|$signed(reg106)) : {$unsigned(reg94[(5'h12):(4'hc)]),
                  (^~(wire8 ? reg29 : reg89))}));
          reg105 <= reg20[(3'h4):(2'h3)];
          reg106 <= {reg76[(1'h1):(1'h1)], wire9[(4'ha):(2'h2)]};
        end
    end
  module109 #() modinst137 (wire136, clk, reg90, reg37, reg99, reg80, reg85);
  module138 #() modinst174 (wire173, clk, reg39, reg27, reg95, reg34, reg104);
  assign wire175 = reg104;
  assign wire176 = (~^$signed(((^~(^(8'h9d))) && (8'ha1))));
  module177 #() modinst195 (wire194, clk, reg28, reg80, wire75, reg93, reg89);
  always
    @(posedge clk) begin
      reg196 <= (wire8[(1'h1):(1'h0)] ?
          reg105 : ($signed(($signed(reg13) ? reg21 : (^(8'ha2)))) ?
              ((((8'ha3) ^~ (8'hac)) || $unsigned(reg23)) ?
                  $signed({(8'haf), reg87}) : (reg104[(2'h2):(1'h1)] ?
                      (reg88 * reg77) : (reg92 && reg103))) : (!reg23[(3'h6):(3'h6)])));
      reg197 <= (reg102[(4'hb):(3'h4)] ? reg27 : reg80[(3'h4):(1'h1)]);
      if ((7'h41))
        begin
          if (reg16)
            begin
              reg198 <= (((8'hab) >> reg80) ?
                  (($unsigned(reg25[(4'h9):(1'h0)]) ?
                      wire8[(4'h9):(3'h6)] : $signed((reg28 <= reg22))) < (!(reg89 ?
                      (reg78 ?
                          reg101 : wire7) : reg39[(1'h0):(1'h0)]))) : (($unsigned(reg79) >= $signed($unsigned((8'hb8)))) == $unsigned(($unsigned(reg86) ?
                      wire9[(4'hc):(1'h1)] : $signed(reg36)))));
            end
          else
            begin
              reg198 <= $unsigned($unsigned($signed(wire173)));
              reg199 <= reg87[(3'h4):(1'h1)];
              reg200 <= (wire6[(4'h9):(1'h0)] ?
                  {(&((reg88 ? reg197 : wire71) ?
                          (+reg87) : $unsigned(wire73)))} : reg33[(3'h7):(2'h3)]);
              reg201 <= (~^wire6[(3'h5):(3'h5)]);
            end
        end
      else
        begin
          reg198 <= (~reg87);
        end
    end
  assign wire202 = (8'h9e);
  assign wire203 = $unsigned((&(($unsigned((8'hb6)) <<< $unsigned(reg31)) <= (~^{reg38}))));
  assign wire204 = (&((((reg11 ? reg92 : reg92) ?
                           $unsigned(reg90) : $unsigned(reg38)) ?
                       (&$signed(wire202)) : reg29[(4'h8):(3'h6)]) >> {reg77[(2'h3):(2'h3)]}));
  assign wire205 = $signed(reg199[(2'h3):(1'h0)]);
endmodule

module module177
#(parameter param192 = (!(((((8'h9e) ? (7'h42) : (7'h41)) ~^ ((8'ha3) << (7'h42))) ? (8'hb5) : (((8'h9f) ? (8'hb5) : (8'ha8)) ? {(8'hb3)} : ((8'ha0) && (8'hbf)))) <= (((~(8'h9e)) ? ((8'hb5) ^ (8'hb1)) : ((8'ha8) != (7'h43))) - (8'hb0)))), 
parameter param193 = param192)
(y, clk, wire182, wire181, wire180, wire179, wire178);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire182;
  input wire signed [(2'h2):(1'h0)] wire181;
  input wire signed [(5'h13):(1'h0)] wire180;
  input wire signed [(5'h10):(1'h0)] wire179;
  input wire signed [(4'hf):(1'h0)] wire178;
  wire [(3'h6):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire186;
  wire [(4'hd):(1'h0)] wire185;
  wire [(4'hb):(1'h0)] wire184;
  wire [(4'he):(1'h0)] wire183;
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg [(5'h14):(1'h0)] reg187 = (1'h0);
  assign y = {wire191,
                 wire188,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 reg190,
                 reg189,
                 reg187,
                 (1'h0)};
  assign wire183 = $signed((~|$unsigned($unsigned($unsigned(wire180)))));
  assign wire184 = (8'hbe);
  assign wire185 = wire183[(2'h2):(1'h0)];
  assign wire186 = wire184[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg187 <= wire180[(2'h2):(2'h2)];
    end
  assign wire188 = (~^((&{(^wire183)}) * wire183[(4'he):(4'hb)]));
  always
    @(posedge clk) begin
      reg189 <= ({wire188[(4'h9):(2'h2)], (8'ha5)} + (&(&$unsigned((wire186 ?
          wire181 : wire185)))));
      reg190 <= wire179;
    end
  assign wire191 = ((!wire186) ?
                       (wire185[(4'h8):(2'h3)] ?
                           wire181[(1'h0):(1'h0)] : $unsigned($unsigned(((8'hbd) ?
                               wire185 : wire181)))) : (&($unsigned($signed(reg187)) >>> (wire185 ?
                           $unsigned(reg187) : wire183))));
endmodule

module module138  (y, clk, wire143, wire142, wire141, wire140, wire139);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire143;
  input wire [(5'h15):(1'h0)] wire142;
  input wire [(4'hd):(1'h0)] wire141;
  input wire signed [(4'h9):(1'h0)] wire140;
  input wire [(3'h6):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire172;
  wire signed [(3'h4):(1'h0)] wire171;
  wire [(4'ha):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(3'h5):(1'h0)] wire154;
  wire signed [(2'h2):(1'h0)] wire153;
  wire [(4'hd):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire149;
  wire signed [(5'h10):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(4'hd):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  reg signed [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
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
                 reg159,
                 (1'h0)};
  assign wire144 = $unsigned((+(&$unsigned((wire140 >>> wire141)))));
  assign wire145 = $signed(((~|wire143[(3'h4):(3'h4)]) ?
                       (wire143 - $signed((wire141 ?
                           wire144 : wire140))) : wire142));
  assign wire146 = (~|wire140[(3'h7):(1'h1)]);
  assign wire147 = $unsigned((^~$signed({wire146,
                       (wire144 ? wire144 : (7'h44))})));
  assign wire148 = wire141;
  assign wire149 = wire139;
  assign wire150 = {$unsigned({$unsigned(((8'hac) >= wire147)),
                           $unsigned({(8'hb8), wire146})})};
  assign wire151 = wire146[(2'h2):(2'h2)];
  assign wire152 = {{((^$unsigned(wire147)) <<< (wire148[(4'hf):(4'he)] > $unsigned(wire143)))},
                       (^~(((^wire145) ?
                           wire144[(1'h1):(1'h0)] : wire142) == (((8'hb4) - wire145) >= (wire147 ?
                           (7'h42) : wire142))))};
  assign wire153 = ($signed(wire149) & {(^((~&wire143) & {wire144}))});
  assign wire154 = wire153[(1'h1):(1'h1)];
  assign wire155 = $unsigned({$signed($signed($unsigned(wire152))),
                       {wire144[(5'h10):(1'h1)]}});
  assign wire156 = wire155;
  assign wire157 = (8'h9e);
  assign wire158 = ({($unsigned((wire152 - wire143)) ?
                               $signed((wire148 ^ (8'hab))) : wire155),
                           $signed(((wire141 ? wire152 : wire151) ?
                               (~^(8'hbb)) : wire147))} ?
                       {$signed((wire150 <<< (wire143 ?
                               wire143 : wire155)))} : $signed(wire144));
  always
    @(posedge clk) begin
      reg159 <= (wire156[(3'h6):(2'h3)] ?
          $unsigned((~{$unsigned(wire146)})) : ((($unsigned((8'hab)) >>> $unsigned(wire151)) ?
              wire140 : (wire140[(3'h6):(3'h6)] ?
                  (&wire157) : (^~wire156))) || $signed(wire141[(3'h4):(3'h4)])));
      reg160 <= (8'hb7);
      reg161 <= {reg160};
      reg162 <= (wire141[(4'h8):(1'h0)] >>> $signed($signed(wire153[(1'h0):(1'h0)])));
      reg163 <= reg159;
    end
  always
    @(posedge clk) begin
      reg164 <= wire149;
      if (((8'hbc) ?
          (($signed((^(8'hab))) <= ($unsigned(wire157) || (wire151 || wire145))) ?
              {wire142[(2'h2):(2'h2)]} : $unsigned(wire143)) : $unsigned(wire157)))
        begin
          if ((($unsigned((~|wire151[(4'hf):(4'hc)])) ~^ wire153) & $unsigned(wire157)))
            begin
              reg165 <= $unsigned($signed($signed((~|(wire149 > (8'hb9))))));
              reg166 <= $unsigned((^(~^$signed($unsigned(reg165)))));
            end
          else
            begin
              reg165 <= wire158[(3'h5):(2'h3)];
              reg166 <= reg166;
            end
          reg167 <= (^(~|$signed(($unsigned(reg165) ?
              (reg164 ? (7'h40) : (8'ha7)) : $signed(reg164)))));
          reg168 <= (^wire142);
          reg169 <= wire158[(3'h4):(1'h0)];
          reg170 <= ((reg162[(2'h3):(2'h2)] > $unsigned((|(8'hb2)))) * {$unsigned(($signed(wire146) ^~ (&wire158)))});
        end
      else
        begin
          reg165 <= ($signed(wire154[(1'h1):(1'h1)]) != wire142);
          reg166 <= reg159[(4'hd):(3'h5)];
          reg167 <= wire149;
          reg168 <= $signed({reg159});
        end
    end
  assign wire171 = $unsigned(wire154[(3'h5):(1'h1)]);
  assign wire172 = $unsigned({$unsigned(((~^(7'h42)) && $signed(reg169)))});
endmodule

module module109
#(parameter param134 = (((((~&(8'hab)) ? ((8'hbb) ? (8'h9f) : (7'h40)) : (8'hbb)) ? ((8'had) + {(8'hb8), (8'hbc)}) : ({(7'h42)} ^~ ((8'ha6) ? (8'ha6) : (8'ha2)))) || (&(((8'hb0) <<< (8'ha0)) ? ((8'ha9) ? (8'ha8) : (8'h9f)) : ((8'ha7) ~^ (8'hb7))))) ? {((^(^(8'hb3))) ? (((8'hab) ? (8'ha1) : (7'h40)) || ((8'hab) ^~ (8'h9d))) : (8'hbe)), (|(((8'ha3) >>> (8'h9e)) | ((8'hb7) <= (8'h9d))))} : {((((8'ha5) ? (8'hbe) : (7'h41)) ? ((8'ha2) ? (7'h40) : (8'hac)) : ((7'h41) ? (8'hae) : (8'hb5))) >= ({(8'ha6), (8'h9c)} ? ((8'hb3) ? (8'ha7) : (8'ha3)) : ((7'h44) ? (8'hac) : (8'hb8))))}), 
parameter param135 = (+param134))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire114;
  input wire signed [(4'hd):(1'h0)] wire113;
  input wire signed [(4'h9):(1'h0)] wire112;
  input wire signed [(4'hc):(1'h0)] wire111;
  input wire [(4'hb):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  assign y = {wire133,
                 wire129,
                 wire128,
                 wire117,
                 wire116,
                 reg132,
                 reg131,
                 reg130,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg115,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg115 <= $unsigned(($unsigned(((&wire111) & wire112[(3'h4):(2'h2)])) ?
          ($unsigned({wire111}) || $signed({wire111})) : (8'had)));
    end
  assign wire116 = {(wire111 ?
                           wire110[(3'h6):(1'h0)] : $signed({(wire113 ?
                                   wire111 : wire112)})),
                       (wire114 ?
                           (wire111 ?
                               wire113[(4'h9):(4'h9)] : wire113) : ((-$signed(wire110)) >>> $unsigned(reg115)))};
  assign wire117 = ($signed((8'hab)) ?
                       ($signed(((reg115 == reg115) < wire110[(2'h3):(2'h3)])) ?
                           $signed(($unsigned((7'h42)) == (|wire114))) : (+wire110[(1'h0):(1'h0)])) : reg115);
  always
    @(posedge clk) begin
      if (((wire114 ?
          wire116[(1'h0):(1'h0)] : reg115[(3'h6):(2'h3)]) * wire110[(4'h9):(3'h6)]))
        begin
          reg118 <= $signed(wire117[(3'h4):(1'h1)]);
          if (((^($unsigned($signed(wire113)) ?
              wire111[(3'h7):(3'h5)] : reg115[(4'hd):(4'hd)])) == wire111[(3'h5):(3'h5)]))
            begin
              reg119 <= wire116[(1'h0):(1'h0)];
            end
          else
            begin
              reg119 <= ($signed(wire111) ?
                  (~{$signed(wire116),
                      reg119[(1'h1):(1'h0)]}) : (wire114 | $signed(($unsigned((8'haa)) << {wire113}))));
              reg120 <= $signed($signed($unsigned((((8'ha6) >> wire111) - (wire110 && (8'h9d))))));
            end
          reg121 <= {wire117};
        end
      else
        begin
          reg118 <= wire113[(3'h6):(1'h1)];
          reg119 <= wire111;
          reg120 <= reg120;
        end
      reg122 <= (~^wire116[(2'h2):(1'h0)]);
      reg123 <= (+$unsigned(wire117[(3'h7):(3'h6)]));
      reg124 <= {$unsigned((^~reg122)), $signed(reg119[(4'he):(3'h5)])};
      if ($signed(((wire113 > (8'hb3)) & (~reg115[(4'h9):(2'h3)]))))
        begin
          reg125 <= ((^~wire116) ?
              $signed($signed(($unsigned(reg119) ?
                  ((8'ha7) ^ wire110) : ((8'hb2) ^ wire111)))) : wire111);
          reg126 <= ((~&reg118[(5'h10):(2'h2)]) ?
              $signed(wire113[(3'h6):(3'h4)]) : $unsigned(wire112));
          reg127 <= reg122;
        end
      else
        begin
          reg125 <= (~^$signed(wire112));
          reg126 <= reg118;
        end
    end
  assign wire128 = ($signed($signed((|(^wire117)))) ?
                       $unsigned(reg123[(2'h2):(2'h2)]) : ((($unsigned((8'hb8)) ?
                               wire116 : $unsigned(reg118)) ?
                           (~&$signed(wire116)) : wire111[(3'h5):(2'h3)]) >= (reg118[(3'h4):(2'h2)] ?
                           (~^$unsigned(wire111)) : $unsigned({wire114,
                               reg121}))));
  assign wire129 = ((~&(8'hac)) && wire110[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg130 <= $signed($signed(({$unsigned(wire111)} ?
          ($unsigned((8'ha1)) * (!reg123)) : $signed(wire113))));
      reg131 <= $signed({(~^(^~wire110[(1'h1):(1'h1)])),
          wire111[(1'h0):(1'h0)]});
      reg132 <= (reg118[(4'hd):(2'h3)] | reg124);
    end
  assign wire133 = $unsigned(($signed(wire110[(4'h8):(3'h6)]) ?
                       (8'ha1) : $signed(reg120[(4'hd):(1'h0)])));
endmodule

module module43
#(parameter param69 = (&(((^(~(8'ha6))) ~^ (((8'ha2) ? (8'ha7) : (8'haf)) ? {(8'hbd)} : ((8'hb0) ? (8'h9d) : (8'ha2)))) >>> (((+(7'h44)) ? (~(8'hb2)) : (~&(8'hb1))) ? (+((8'hb5) == (8'hb4))) : ((|(8'hb6)) ? (~^(7'h41)) : {(8'ha7), (8'h9e)})))), 
parameter param70 = (param69 <<< {(param69 < ({param69, param69} ? {param69, param69} : (param69 ? param69 : param69))), (((!param69) ? param69 : param69) ? (((8'ha0) ? param69 : (8'hbc)) & (param69 <<< param69)) : ({param69, (8'hab)} && param69))}))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire47;
  input wire [(4'hc):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire50,
                 wire49,
                 wire48,
                 reg68,
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
                 (1'h0)};
  assign wire48 = (wire47[(4'he):(4'hc)] ?
                      $unsigned($signed($signed({wire46}))) : wire44);
  assign wire49 = wire46;
  assign wire50 = wire46[(4'hb):(3'h6)];
  always
    @(posedge clk) begin
      reg51 <= wire45[(2'h2):(2'h2)];
      reg52 <= ($unsigned($unsigned(($unsigned(wire44) ?
          (^~wire46) : $signed(wire49)))) > (&{(8'haf)}));
      if ($unsigned((|((|(wire48 ? reg52 : wire46)) * (8'haf)))))
        begin
          reg53 <= $signed({$signed($signed($signed(wire49)))});
          reg54 <= (|$signed($unsigned($unsigned((~&wire45)))));
        end
      else
        begin
          reg53 <= wire49;
          reg54 <= ($signed(reg51) <<< $signed((!$signed((reg52 <<< wire44)))));
          if (((&((^~((7'h41) ? wire46 : wire49)) >> ((wire44 ?
                  (8'ha1) : reg51) > $unsigned(reg52)))) ?
              reg53[(3'h5):(2'h3)] : ($signed($signed((~^reg54))) ?
                  $signed($unsigned($signed((8'hb6)))) : ((~&(^reg53)) >> reg54[(2'h3):(1'h1)]))))
            begin
              reg55 <= ((({$unsigned(wire50),
                  (reg52 ?
                      reg53 : (8'hb7))} << (&(wire46 || wire44))) + $unsigned(((wire46 > (8'ha3)) ?
                  $unsigned((8'hae)) : ((8'hba) < reg52)))) >> (reg54[(1'h0):(1'h0)] ?
                  reg52[(4'hb):(3'h7)] : wire46));
              reg56 <= $signed(reg53);
              reg57 <= (^~$signed((($signed(reg52) ?
                      {reg55} : (reg52 <= reg54)) ?
                  $signed((8'hbb)) : (wire49 ?
                      $unsigned(reg52) : (wire49 | reg53)))));
              reg58 <= $signed($unsigned($unsigned(({wire49, reg56} > (reg56 ?
                  (8'hb2) : reg53)))));
            end
          else
            begin
              reg55 <= reg53;
              reg56 <= $unsigned(wire50);
            end
        end
      reg59 <= $unsigned($signed(wire47));
      reg60 <= ($signed((+$signed($signed(reg54)))) ?
          ((^$unsigned((reg59 ?
              reg57 : wire48))) - reg56[(4'h9):(1'h0)]) : (^(^$signed(reg59[(3'h7):(3'h5)]))));
    end
  assign wire61 = $unsigned(((^~(!$unsigned(reg51))) ?
                      wire44 : (~($unsigned(reg57) ?
                          $unsigned((8'hba)) : $signed(wire50)))));
  assign wire62 = ((((8'hbb) ?
                      wire46[(4'h8):(1'h0)] : ($unsigned(reg60) || $unsigned(wire47))) <<< wire50[(4'ha):(3'h5)]) && ((((&wire45) != ((8'ha2) ?
                          reg58 : reg54)) > {$unsigned(wire49)}) ?
                      $signed(($signed(reg54) != $unsigned((8'hb4)))) : $signed($unsigned(wire50))));
  assign wire63 = $unsigned(wire62[(3'h7):(3'h6)]);
  assign wire64 = $signed((reg60[(1'h1):(1'h1)] ? wire47 : $unsigned(reg57)));
  assign wire65 = $signed(($signed($signed({(8'hbe),
                      wire45})) <= $signed($signed((~^wire49)))));
  assign wire66 = (~&(!wire62[(2'h2):(1'h0)]));
  assign wire67 = (wire47 >= reg53);
  always
    @(posedge clk) begin
      reg68 <= reg54;
    end
endmodule
