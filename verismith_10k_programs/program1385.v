module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire236;
  wire signed [(3'h5):(1'h0)] wire235;
  wire [(3'h4):(1'h0)] wire234;
  wire [(3'h7):(1'h0)] wire233;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire213;
  wire signed [(4'ha):(1'h0)] wire215;
  wire signed [(5'h15):(1'h0)] wire230;
  wire signed [(2'h3):(1'h0)] wire231;
  reg signed [(4'hc):(1'h0)] reg229 = (1'h0);
  reg [(4'hf):(1'h0)] reg228 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg227 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg224 = (1'h0);
  reg [(4'ha):(1'h0)] reg223 = (1'h0);
  reg [(5'h10):(1'h0)] reg222 = (1'h0);
  reg [(4'hf):(1'h0)] reg221 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg220 = (1'h0);
  reg [(4'hf):(1'h0)] reg219 = (1'h0);
  reg [(5'h12):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg216 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  assign y = {wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire10,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire213,
                 wire215,
                 wire230,
                 wire231,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire4);
      reg6 <= {$unsigned($signed((^$unsigned(wire1)))),
          $unsigned($signed(((wire2 & (8'h9f)) >>> wire0[(3'h4):(3'h4)])))};
      reg7 <= $signed(wire1);
      reg8 <= (^~$signed((&$signed((+wire4)))));
      reg9 <= $unsigned({wire0,
          (($signed(reg6) ?
              (wire1 ? reg6 : wire0) : (wire3 ?
                  reg6 : wire1)) >>> $signed($unsigned(reg6)))});
    end
  assign wire10 = wire3[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg11 <= {wire10};
      if ($signed($unsigned((^~{(&wire4), $unsigned(reg9)}))))
        begin
          if ($unsigned(((~wire1) ?
              wire2 : ((|(reg7 ?
                  wire1 : (8'ha7))) + $unsigned($unsigned(reg6))))))
            begin
              reg12 <= $signed(reg9[(1'h1):(1'h1)]);
            end
          else
            begin
              reg12 <= ($signed($unsigned((~reg5[(3'h5):(3'h5)]))) ?
                  {$signed({$signed(reg5), $unsigned(wire2)}),
                      $signed(((^(8'hac)) ?
                          (reg8 ^ wire4) : (reg6 ?
                              wire2 : reg8)))} : $signed({wire4,
                      $signed((wire3 >= wire1))}));
              reg13 <= wire1;
            end
          reg14 <= $signed((|{({wire1} ? $signed(reg13) : $unsigned((8'ha6))),
              reg11}));
          reg15 <= $signed({$signed($signed((wire0 ? wire2 : reg13))),
              (^(8'ha5))});
        end
      else
        begin
          reg12 <= $signed($unsigned($unsigned({reg15[(4'hc):(4'hb)],
              $unsigned(reg14)})));
        end
      if (reg6)
        begin
          reg16 <= (($signed(((reg8 ?
                  wire2 : wire3) + $signed(reg9))) == $unsigned($unsigned(((8'hac) >= wire1)))) ?
              (~&$signed($signed($signed(wire1)))) : $unsigned(($unsigned(reg15) ^ reg13[(3'h5):(1'h1)])));
          if ((&reg8[(4'h9):(4'h8)]))
            begin
              reg17 <= reg11;
              reg18 <= $signed($unsigned(reg14[(3'h5):(2'h2)]));
            end
          else
            begin
              reg17 <= (^(reg14 == $unsigned(reg16[(4'hd):(4'h9)])));
            end
        end
      else
        begin
          reg16 <= wire10;
          reg17 <= reg16;
          if (wire2[(3'h4):(2'h2)])
            begin
              reg18 <= (({(reg17 != $unsigned(reg17)),
                  $signed($signed(wire4))} ^ ((|reg5[(3'h7):(3'h6)]) ?
                  reg8[(3'h7):(3'h4)] : reg7)) & reg6);
              reg19 <= (&{(8'ha3)});
              reg20 <= (($unsigned((reg17 || reg14[(1'h1):(1'h1)])) ?
                      $unsigned(({reg8, wire3} ?
                          $unsigned(reg8) : {wire2,
                              reg9})) : ($unsigned(((8'hac) <<< reg11)) * reg15)) ?
                  $unsigned($signed(((wire4 - (8'haf)) ^ reg7))) : {(&$unsigned($unsigned(wire3)))});
            end
          else
            begin
              reg18 <= (+$unsigned(reg12[(4'ha):(2'h2)]));
              reg19 <= ((~|reg5) >>> (~&$unsigned($signed((|reg16)))));
            end
          reg21 <= (({$unsigned({reg5})} ?
                  $signed(((&reg12) << (8'hb0))) : reg13) ?
              $unsigned($unsigned((^wire2))) : (reg15 & ($signed(reg12) ?
                  reg14 : ({wire2, reg8} & $unsigned(reg16)))));
        end
    end
  assign wire22 = {$unsigned((((!(8'h9c)) ? $unsigned((8'ha7)) : (!wire1)) ?
                          reg16 : $signed(reg17[(2'h3):(2'h3)]))),
                      reg18};
  assign wire23 = $signed(reg17[(3'h4):(1'h1)]);
  assign wire24 = (reg13 >>> (^~$signed(((wire23 ?
                      reg8 : (8'hb7)) || reg15[(4'hd):(4'hd)]))));
  assign wire25 = $unsigned(wire1[(2'h3):(2'h2)]);
  assign wire26 = reg16;
  assign wire27 = ($unsigned($signed($signed(((7'h42) < reg15)))) ^~ reg8[(3'h6):(3'h6)]);
  assign wire28 = (~&$signed($unsigned({(reg7 ? reg16 : wire24)})));
  module29 #() modinst214 (wire213, clk, wire22, reg13, reg8, wire26);
  assign wire215 = wire4;
  always
    @(posedge clk) begin
      reg216 <= {reg15};
      if ((8'hbc))
        begin
          reg217 <= $signed((&(^~(reg8 ? wire28 : (wire2 || (8'hbc))))));
        end
      else
        begin
          reg217 <= $unsigned(wire3);
          reg218 <= (((&((!reg9) >>> reg8)) ?
                  reg5 : (({reg16} ? $unsigned(wire22) : $signed(reg216)) ?
                      wire1 : reg20)) ?
              $signed({wire215[(4'h9):(1'h0)]}) : reg21[(1'h1):(1'h1)]);
          if (wire2)
            begin
              reg219 <= reg18;
              reg220 <= wire1[(3'h6):(2'h3)];
              reg221 <= wire24;
            end
          else
            begin
              reg219 <= (wire1[(4'h9):(2'h2)] | (^~(+wire1)));
              reg220 <= (^{$signed((&{(8'hbd), reg8}))});
            end
          if (reg11)
            begin
              reg222 <= $unsigned(wire3);
              reg223 <= (((wire215[(3'h6):(1'h1)] - $unsigned((reg16 >= wire215))) ?
                      (^~($signed(reg6) ?
                          (^~reg6) : $unsigned(reg5))) : $signed(wire22[(5'h12):(4'hd)])) ?
                  wire23[(2'h3):(2'h3)] : (-{reg16}));
              reg224 <= {$signed(reg220), reg14[(3'h5):(1'h1)]};
              reg225 <= reg217;
              reg226 <= (^~reg222);
            end
          else
            begin
              reg222 <= (^reg13[(3'h7):(1'h0)]);
              reg223 <= wire26;
              reg224 <= $signed((($unsigned((~|reg18)) ?
                      ((7'h44) - {reg217}) : ((~&(8'ha9)) ?
                          (~^reg7) : (!(8'hb7)))) ?
                  $unsigned(wire28[(4'hb):(3'h7)]) : wire28[(4'h9):(1'h0)]));
              reg225 <= $unsigned($unsigned((!($unsigned(reg222) ?
                  $signed(wire27) : (^~reg224)))));
            end
        end
      reg227 <= ($signed($signed($unsigned((reg17 & (8'ha9))))) >= reg217);
      reg228 <= $signed((~^$unsigned(wire3)));
      reg229 <= reg8[(5'h12):(5'h10)];
    end
  assign wire230 = (-reg9);
  module195 #() modinst232 (wire231, clk, wire3, reg216, reg16, reg6, reg229);
  assign wire233 = (8'hac);
  assign wire234 = ((reg6 ?
                       (reg221[(4'hd):(3'h5)] ^~ (8'h9d)) : reg7) | ({reg218[(1'h1):(1'h1)]} | wire10));
  assign wire235 = ($unsigned((~^$signed($signed(reg5)))) << {reg12[(4'h8):(3'h7)]});
  assign wire236 = (~&$signed($unsigned({$signed(wire22)})));
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire33;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire signed [(5'h12):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire211;
  wire signed [(5'h15):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire148;
  wire signed [(4'hb):(1'h0)] wire149;
  wire signed [(4'hd):(1'h0)] wire150;
  wire signed [(4'hc):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire176;
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg179 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg182 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg [(4'ha):(1'h0)] reg193 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  assign y = {wire211,
                 wire178,
                 wire75,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire108,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire143,
                 wire148,
                 wire149,
                 wire150,
                 wire151,
                 wire152,
                 wire176,
                 reg145,
                 reg146,
                 reg147,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 (1'h0)};
  assign wire34 = $unsigned($unsigned(($signed((wire32 >= wire30)) ?
                      $signed((|wire32)) : (wire32[(4'h8):(2'h3)] * (wire32 ?
                          wire33 : wire33)))));
  assign wire35 = $signed(({($signed(wire31) | $unsigned(wire34))} ?
                      (^(wire34[(4'h8):(2'h2)] ~^ $unsigned(wire32))) : $unsigned($unsigned($unsigned(wire34)))));
  assign wire36 = (+{$signed(wire33[(4'h9):(3'h4)])});
  assign wire37 = $unsigned(($signed({$unsigned(wire33),
                          wire30[(2'h2):(1'h1)]}) ?
                      $signed(($unsigned(wire30) >= {(8'ha2)})) : $unsigned((~&wire30))));
  module38 #() modinst76 (wire75, clk, wire37, wire33, wire30, wire32, wire34);
  module77 #() modinst109 (wire108, clk, wire75, wire32, wire36, wire31);
  assign wire110 = wire36[(4'he):(1'h0)];
  assign wire111 = (((wire35[(3'h5):(2'h3)] ?
                       {(~wire31)} : ((wire30 ? wire108 : wire33) ?
                           $signed((8'hb0)) : (wire110 ?
                               wire75 : wire35))) >> $signed($signed(wire31[(4'hc):(4'hc)]))) < $signed((((wire34 ^~ wire32) ^~ $signed(wire108)) ?
                       wire75 : wire110[(1'h0):(1'h0)])));
  assign wire112 = {wire36};
  assign wire113 = {wire32, (wire111 * wire30[(1'h1):(1'h0)])};
  module114 #() modinst144 (wire143, clk, wire35, wire108, wire34, wire113);
  always
    @(posedge clk) begin
      reg145 <= wire112;
      reg146 <= ($unsigned((((wire112 ?
              wire34 : wire33) || (wire32 ^~ wire36)) ?
          wire113 : wire32[(3'h6):(1'h1)])) - reg145[(2'h3):(1'h0)]);
      reg147 <= $signed(wire33[(5'h12):(4'he)]);
    end
  assign wire148 = ($unsigned($unsigned((wire37 ?
                       (wire143 <<< wire32) : wire113))) ^~ wire37[(4'h8):(3'h6)]);
  assign wire149 = wire112;
  assign wire150 = wire75[(3'h4):(2'h3)];
  assign wire151 = (wire32 ?
                       ((wire32 - wire31) >> $signed(wire34[(5'h14):(4'h8)])) : (&{($unsigned(reg145) > (reg147 == wire33))}));
  assign wire152 = {{$signed(reg146), (!$unsigned($signed(wire151)))}};
  module153 #() modinst177 (wire176, clk, wire75, wire148, wire152, wire31, wire33);
  assign wire178 = $signed(wire31);
  always
    @(posedge clk) begin
      reg179 <= ({$signed((|wire37[(3'h4):(2'h3)])),
              (wire178 && (~&(reg145 ? wire37 : wire148)))} ?
          ((!((wire110 ?
              wire30 : wire111) && reg146)) << {((-wire37) < wire151[(4'h8):(3'h6)]),
              $signed($signed(wire31))}) : $unsigned((($unsigned(wire113) ?
              (+reg147) : $unsigned(wire112)) > {wire143[(3'h4):(2'h2)],
              (~|(8'hb1))})));
      reg180 <= $unsigned((^(((wire112 ?
          wire75 : wire150) * (~reg146)) ^ wire113[(4'hf):(3'h7)])));
      if ($signed($unsigned($signed(wire108))))
        begin
          reg181 <= {({($unsigned((8'hb7)) <= wire113)} >= (!{wire148}))};
          reg182 <= {((reg179[(3'h4):(1'h0)] << wire75) ?
                  $unsigned(($unsigned(wire149) ?
                      $signed(wire30) : wire110)) : (reg179 ?
                      $signed({reg147}) : reg145)),
              ($unsigned(($unsigned(wire33) - wire30[(3'h7):(3'h6)])) * $unsigned($unsigned(wire143)))};
        end
      else
        begin
          reg181 <= (~{reg179[(4'ha):(2'h3)],
              (^((+(8'ha8)) ? (wire143 ? wire108 : wire143) : (!(8'hbc))))});
          if ($unsigned(($unsigned($signed((~&wire148))) ?
              wire143[(4'ha):(3'h7)] : $unsigned((-$signed(wire75))))))
            begin
              reg182 <= $unsigned((+wire112));
              reg183 <= wire108;
              reg184 <= $signed($signed(wire112[(3'h4):(1'h0)]));
              reg185 <= (^wire30);
            end
          else
            begin
              reg182 <= ((~|reg145) < wire112[(2'h2):(1'h1)]);
            end
          if ($signed(($signed($signed((~wire31))) ?
              $unsigned((~&$unsigned(wire110))) : $unsigned((~&(|wire30))))))
            begin
              reg186 <= ((wire178 >= $signed({(wire36 ?
                      reg184 : reg147)})) <= (wire31[(5'h12):(5'h10)] - ($signed(((8'hbb) >= wire75)) ?
                  $unsigned($unsigned(reg147)) : $signed($signed(wire148)))));
              reg187 <= $signed(($unsigned($unsigned({reg185, wire148})) ?
                  reg184 : $unsigned($signed({wire37, reg185}))));
            end
          else
            begin
              reg186 <= $signed((reg147[(1'h1):(1'h1)] && $signed({wire150})));
              reg187 <= $signed(((^~wire37[(3'h6):(3'h4)]) ?
                  $unsigned((wire32[(5'h10):(2'h2)] << wire33)) : ($unsigned((!wire30)) < ((reg184 ?
                      reg179 : wire108) ^~ wire178))));
              reg188 <= wire113[(2'h3):(1'h0)];
              reg189 <= $signed(reg187);
              reg190 <= wire36[(4'ha):(2'h3)];
            end
          if (reg180)
            begin
              reg191 <= $unsigned(($signed((((8'hbe) ? (8'hb6) : reg182) ?
                      (~reg183) : {wire149, reg146})) ?
                  reg146 : (7'h44)));
              reg192 <= wire176;
            end
          else
            begin
              reg191 <= (+wire178[(4'hf):(3'h5)]);
              reg192 <= reg145[(1'h0):(1'h0)];
            end
        end
      reg193 <= {wire32};
      reg194 <= $signed($signed((^{(reg192 || wire178), (+wire34)})));
    end
  module195 #() modinst212 (wire211, clk, reg184, wire148, reg190, reg181, wire32);
endmodule

module module195
#(parameter param210 = ((8'hb6) >= (8'hac)))
(y, clk, wire200, wire199, wire198, wire197, wire196);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire200;
  input wire [(5'h13):(1'h0)] wire199;
  input wire [(4'h9):(1'h0)] wire198;
  input wire [(3'h6):(1'h0)] wire197;
  input wire [(4'hc):(1'h0)] wire196;
  wire [(3'h4):(1'h0)] wire209;
  wire [(5'h12):(1'h0)] wire207;
  wire signed [(4'h8):(1'h0)] wire206;
  wire signed [(5'h14):(1'h0)] wire205;
  wire signed [(2'h2):(1'h0)] wire204;
  wire signed [(5'h14):(1'h0)] wire203;
  wire [(2'h3):(1'h0)] wire202;
  wire signed [(3'h6):(1'h0)] wire201;
  reg [(3'h4):(1'h0)] reg208 = (1'h0);
  assign y = {wire209,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 reg208,
                 (1'h0)};
  assign wire201 = wire196[(3'h4):(1'h1)];
  assign wire202 = wire197[(1'h1):(1'h0)];
  assign wire203 = (wire200 ? (~|wire202[(1'h0):(1'h0)]) : wire199);
  assign wire204 = wire203;
  assign wire205 = ((8'hb5) >= ((-wire196) > $signed(wire202[(1'h1):(1'h1)])));
  assign wire206 = wire197;
  assign wire207 = ($signed((8'haf)) >>> (!$signed({$signed(wire206)})));
  always
    @(posedge clk) begin
      reg208 <= (((wire202[(2'h3):(1'h0)] ?
                  $unsigned($signed(wire197)) : wire197[(1'h1):(1'h1)]) ?
              wire207 : (~|$unsigned((8'ha3)))) ?
          {wire202} : $signed($unsigned($unsigned({wire197}))));
    end
  assign wire209 = $signed(wire205);
endmodule

module module153
#(parameter param174 = (&{(((7'h43) ? ((8'ha1) >> (8'hb5)) : ((8'ha4) >= (8'h9d))) ? ((-(8'ha9)) <= ((7'h42) ? (7'h40) : (8'hb2))) : (((7'h40) <<< (8'ha4)) > (^(7'h40))))}), 
parameter param175 = {(({((8'hbc) ? param174 : param174), (param174 ? param174 : param174)} ? (param174 ^ (param174 || param174)) : (param174 < (+(8'hac)))) ^~ (((^(7'h44)) ? (param174 - (8'haf)) : {param174}) < ((param174 ? (8'ha5) : param174) < (param174 ? param174 : param174)))), (~|(^~(-(|param174))))})
(y, clk, wire158, wire157, wire156, wire155, wire154);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire158;
  input wire [(4'he):(1'h0)] wire157;
  input wire [(5'h12):(1'h0)] wire156;
  input wire signed [(4'hb):(1'h0)] wire155;
  input wire signed [(5'h10):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire171;
  wire [(3'h4):(1'h0)] wire166;
  wire signed [(2'h3):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire164;
  wire signed [(5'h11):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire159;
  reg signed [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire171,
                 wire166,
                 wire165,
                 wire164,
                 wire161,
                 wire160,
                 wire159,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire159 = wire157[(3'h6):(2'h2)];
  assign wire160 = wire157[(3'h5):(2'h2)];
  assign wire161 = {$signed(wire157), wire157[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg162 <= $signed(($unsigned(wire160[(5'h10):(4'h9)]) ?
          $signed({(wire160 >> (8'h9d))}) : ((wire156 << (wire160 > wire157)) && $signed((&wire155)))));
      reg163 <= wire156[(1'h0):(1'h0)];
    end
  assign wire164 = wire161[(3'h7):(1'h0)];
  assign wire165 = ($signed($signed((8'ha6))) <<< wire154[(4'ha):(1'h1)]);
  assign wire166 = (wire154 ?
                       $signed((wire164[(1'h1):(1'h0)] ?
                           wire164 : wire161[(3'h4):(2'h2)])) : $unsigned(wire160[(4'hb):(4'ha)]));
  always
    @(posedge clk) begin
      reg167 <= {($unsigned($unsigned((wire157 ?
              wire156 : wire157))) | ({$unsigned((8'hbb)), (~|(8'h9f))} ?
              wire161 : ((wire155 + wire160) - (8'hbe)))),
          {$unsigned($signed({wire156}))}};
      reg168 <= $signed(wire156[(1'h1):(1'h0)]);
      reg169 <= (!((+$signed((~wire166))) <= ((wire155[(2'h2):(1'h1)] ?
              {(8'ha7)} : $unsigned(wire158)) ?
          ((reg162 ? wire164 : (7'h41)) >>> (~reg162)) : ({(8'h9f)} < (wire164 ?
              (8'haf) : wire155)))));
      reg170 <= wire161[(1'h0):(1'h0)];
    end
  assign wire171 = (+(^~($signed({reg168}) < ((wire157 ?
                       wire157 : wire158) >>> wire166))));
  assign wire172 = $signed(wire159);
  assign wire173 = reg167;
endmodule

module module114
#(parameter param142 = (~^(({((8'ha8) >> (8'hb1))} <<< (-((8'hb2) ? (8'hb3) : (8'hae)))) ? (!((~&(8'hb7)) ? (-(8'hab)) : ((8'haa) >= (8'ha9)))) : {(((8'hae) >> (8'hb3)) ? ((7'h41) ? (8'ha0) : (7'h40)) : {(8'hae), (8'ha7)})})))
(y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire118;
  input wire [(4'hb):(1'h0)] wire117;
  input wire [(2'h2):(1'h0)] wire116;
  input wire signed [(5'h14):(1'h0)] wire115;
  wire [(4'he):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire [(5'h11):(1'h0)] wire119;
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  assign y = {wire141,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire119,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire119 = ({wire118, $unsigned(wire115)} ~^ ($unsigned(wire117) ?
                       wire118[(1'h1):(1'h0)] : ((^~wire115[(4'hb):(4'h9)]) <= $signed({wire115}))));
  always
    @(posedge clk) begin
      reg120 <= wire117[(2'h2):(1'h1)];
      if ($unsigned(wire117))
        begin
          reg121 <= wire116;
        end
      else
        begin
          if ($unsigned($signed((~&wire118[(3'h7):(3'h5)]))))
            begin
              reg121 <= (8'hab);
              reg122 <= {(wire119 ?
                      {((wire115 != wire117) || reg120[(3'h5):(3'h5)])} : (((^~reg120) ~^ (~(8'hba))) ?
                          wire118[(4'h8):(3'h5)] : $unsigned(wire119[(2'h3):(1'h1)]))),
                  $signed(reg120)};
            end
          else
            begin
              reg121 <= reg121[(4'he):(4'h9)];
            end
          reg123 <= wire117[(4'ha):(3'h7)];
          if ((~reg121))
            begin
              reg124 <= (|{$unsigned((!((8'ha2) + reg121)))});
              reg125 <= (~|wire115);
              reg126 <= reg125[(3'h7):(1'h0)];
              reg127 <= ($signed(($signed((wire119 && wire117)) - $unsigned(wire115[(5'h11):(4'ha)]))) >>> reg121[(4'ha):(3'h5)]);
            end
          else
            begin
              reg124 <= $unsigned(reg126[(3'h6):(2'h3)]);
              reg125 <= wire119;
              reg126 <= (8'hbf);
            end
          reg128 <= $unsigned((($signed(wire118) << reg124) & $signed(reg124[(2'h3):(2'h2)])));
        end
      reg129 <= {$signed($unsigned((&wire117[(3'h5):(3'h5)])))};
    end
  assign wire130 = ($signed({reg126}) ?
                       wire115[(3'h6):(1'h0)] : wire116[(1'h0):(1'h0)]);
  assign wire131 = ({(~&$unsigned(wire116[(1'h1):(1'h1)]))} - $unsigned($unsigned(((-wire116) ?
                       wire118[(1'h1):(1'h0)] : reg129[(1'h1):(1'h1)]))));
  assign wire132 = reg124;
  assign wire133 = ($unsigned((^($unsigned(reg125) || (wire131 && wire117)))) ?
                       (^~(($unsigned(reg122) >> reg122) ?
                           reg128 : $unsigned($signed(reg126)))) : wire118[(3'h5):(3'h4)]);
  assign wire134 = reg128;
  always
    @(posedge clk) begin
      reg135 <= (&$signed($signed((reg122 == (reg126 ? (8'hbf) : reg122)))));
      reg136 <= {wire115[(4'ha):(1'h0)]};
      reg137 <= $unsigned($unsigned((^({wire131, wire134} >> {(8'hb4),
          reg120}))));
      reg138 <= $signed($unsigned($signed(wire115[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg139 <= ((~&((|(wire133 ? (8'hab) : wire119)) | $signed((!reg123)))) ?
          reg128[(4'he):(3'h7)] : wire119[(3'h7):(3'h6)]);
      reg140 <= {$signed(wire115[(5'h13):(4'he)])};
    end
  assign wire141 = {wire134};
endmodule

module module77
#(parameter param106 = (((8'hba) ? ((~|((8'haf) >> (8'hb0))) >> (~&(8'hb3))) : {((-(8'ha4)) ? ((8'hbf) ? (8'ha6) : (8'hb4)) : (8'h9c))}) >> (~^((8'ha5) < (((8'hb4) << (8'hbf)) <<< (^(7'h42)))))), 
parameter param107 = ((param106 ? param106 : ((param106 ? (^(8'hb0)) : ((8'ha9) || (8'h9f))) && ((param106 ? param106 : (8'hb0)) >>> param106))) ^~ param106))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire81;
  input wire [(5'h14):(1'h0)] wire80;
  input wire [(5'h10):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
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
                 (1'h0)};
  assign wire82 = (wire80 | (($signed({(8'ha0)}) & wire81) ?
                      wire78[(2'h2):(1'h0)] : (~|{{wire81, wire81}})));
  assign wire83 = (&(((wire80 != $signed(wire80)) ?
                      (7'h40) : $unsigned(wire81[(2'h2):(1'h0)])) <= ((wire79[(3'h5):(1'h1)] <= wire81) ?
                      (wire82[(3'h4):(2'h3)] <= $signed(wire79)) : $signed(wire79[(1'h1):(1'h1)]))));
  assign wire84 = $unsigned({(8'ha5)});
  assign wire85 = ($unsigned($unsigned((^$unsigned(wire81)))) << $unsigned((~|wire83[(2'h2):(1'h1)])));
  assign wire86 = ((wire81[(1'h0):(1'h0)] ?
                      wire80 : $signed(wire79[(3'h6):(3'h4)])) ^ $signed(wire78));
  assign wire87 = (8'hbe);
  always
    @(posedge clk) begin
      if (wire85[(2'h2):(1'h1)])
        begin
          if ($signed(wire80[(4'hd):(2'h3)]))
            begin
              reg88 <= $signed({$unsigned(((wire85 * wire84) <<< ((8'hb7) ?
                      wire82 : wire81))),
                  wire82});
              reg89 <= ({wire82} ~^ {wire79[(3'h4):(1'h0)]});
              reg90 <= ($unsigned($unsigned(wire85[(4'hd):(4'h9)])) | (wire80[(5'h10):(4'h8)] ^~ {(!(&reg89)),
                  $signed(wire79[(4'hf):(2'h3)])}));
              reg91 <= $unsigned(wire82);
              reg92 <= wire84;
            end
          else
            begin
              reg88 <= (8'hbc);
            end
          reg93 <= $signed((8'h9d));
          if ((!reg88[(2'h3):(1'h1)]))
            begin
              reg94 <= reg89[(3'h6):(2'h3)];
              reg95 <= wire81;
            end
          else
            begin
              reg94 <= (^~wire80[(5'h13):(4'hf)]);
              reg95 <= (wire84[(3'h4):(2'h3)] ~^ reg90[(5'h15):(5'h10)]);
              reg96 <= (7'h42);
              reg97 <= $signed({{$unsigned((wire82 != reg88)),
                      $unsigned(reg88)},
                  (8'hb1)});
              reg98 <= (|reg97[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg88 <= $unsigned(reg93[(1'h0):(1'h0)]);
          reg89 <= (((~^({wire86} ?
                      reg89[(2'h2):(2'h2)] : (reg90 ? reg91 : reg95))) ?
                  $signed(($unsigned((8'hb3)) ?
                      $signed(wire85) : wire87)) : $signed((~&{reg96,
                      reg94}))) ?
              wire86[(3'h7):(3'h4)] : reg91);
        end
      if (wire87)
        begin
          reg99 <= $signed(($signed($signed($unsigned(wire86))) ?
              ($unsigned((reg88 ? wire87 : reg97)) ?
                  (reg89[(4'h9):(1'h0)] ?
                      $signed(wire87) : wire79) : ($unsigned(wire87) <= reg90[(5'h15):(5'h15)])) : $unsigned({reg98[(2'h3):(1'h1)]})));
          reg100 <= {reg96[(3'h7):(3'h5)]};
          reg101 <= $unsigned((~^(8'haa)));
        end
      else
        begin
          if (reg93)
            begin
              reg99 <= (~&$unsigned((8'hb7)));
            end
          else
            begin
              reg99 <= ({reg100} ? (~&(~wire80)) : (-$unsigned(wire80)));
              reg100 <= (~^(reg99[(4'h8):(4'h8)] ?
                  reg101[(1'h0):(1'h0)] : $signed(wire84[(2'h3):(1'h1)])));
              reg101 <= (wire85 ?
                  $signed(reg89[(4'ha):(4'ha)]) : {(8'hae),
                      ($unsigned($signed(wire84)) ?
                          $unsigned((~^wire79)) : ($signed(wire83) != (reg100 >> reg96)))});
            end
          if ((wire86 && reg99[(1'h1):(1'h0)]))
            begin
              reg102 <= (!$unsigned(wire86[(4'hd):(2'h3)]));
            end
          else
            begin
              reg102 <= $unsigned($unsigned($signed((8'hbe))));
              reg103 <= wire80;
            end
        end
      reg104 <= $signed(wire86);
      reg105 <= wire82;
    end
endmodule

module module38
#(parameter param73 = (~^((7'h41) >= (~^((~^(8'hac)) ? ((8'haa) >= (8'hba)) : {(8'ha2)})))), 
parameter param74 = (^~(param73 ? ((+(param73 == param73)) & {param73, {(8'hb2)}}) : param73)))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire43;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire signed [(4'h8):(1'h0)] wire41;
  input wire [(4'hb):(1'h0)] wire40;
  input wire [(5'h15):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg68,
                 reg67,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= ((wire42 | $signed({(wire42 ? wire41 : wire43),
          $unsigned(wire42)})) && $signed((wire41 ?
          (|(wire40 << wire41)) : $signed((-wire43)))));
    end
  always
    @(posedge clk) begin
      reg45 <= $signed($unsigned(wire41[(3'h5):(1'h0)]));
      if ((~&(wire39[(5'h12):(4'hb)] ?
          {(^(wire40 << (8'hb4))),
              ((wire41 ? wire41 : (8'hb7)) >= ((8'h9c) ?
                  wire39 : wire42))} : (|reg44))))
        begin
          reg46 <= ((+$signed($unsigned({wire43, (8'h9c)}))) ?
              $unsigned((!(reg44 > reg45[(3'h4):(2'h3)]))) : $signed($signed({$signed((8'ha4)),
                  wire43[(3'h5):(2'h3)]})));
          if ($unsigned(wire39))
            begin
              reg47 <= reg45;
              reg48 <= $unsigned($signed((!($unsigned(reg45) ^ (~^reg45)))));
              reg49 <= $signed((^~reg46));
              reg50 <= $signed($unsigned(wire42[(4'h8):(3'h7)]));
            end
          else
            begin
              reg47 <= {$signed(reg44[(1'h0):(1'h0)])};
              reg48 <= $unsigned((^({(reg48 >>> reg45), wire41[(3'h6):(1'h1)]} ?
                  $unsigned($unsigned(reg44)) : ((reg47 ? reg45 : reg48) ?
                      {reg50} : {wire42}))));
            end
          if (reg50)
            begin
              reg51 <= $unsigned($unsigned((((8'hb6) ?
                  $signed((8'h9f)) : {(8'ha0)}) ^~ ((7'h41) ?
                  (wire41 & (8'h9e)) : (reg47 ? reg48 : reg47)))));
              reg52 <= ((^$signed((wire41 ^ (wire39 <<< wire42)))) ?
                  reg47 : $unsigned(reg47[(1'h1):(1'h0)]));
              reg53 <= (~&$unsigned(wire40[(1'h0):(1'h0)]));
            end
          else
            begin
              reg51 <= reg44;
              reg52 <= {(~&(|(reg52[(1'h0):(1'h0)] ?
                      (reg49 - wire43) : (reg48 ? reg52 : reg49)))),
                  (|$unsigned((8'haa)))};
              reg53 <= (~^{{$unsigned((wire40 * wire42))}, wire41});
              reg54 <= (($unsigned(wire40[(3'h7):(2'h3)]) ?
                      (wire42[(2'h3):(2'h2)] ?
                          (8'hbe) : reg49[(1'h1):(1'h0)]) : $signed((reg49[(5'h14):(2'h2)] ?
                          (wire42 ? reg46 : (8'ha1)) : (reg44 ?
                              wire39 : reg51)))) ?
                  wire40[(4'ha):(4'h8)] : wire39[(4'he):(2'h2)]);
              reg55 <= $unsigned($signed($unsigned(reg51[(2'h3):(1'h1)])));
            end
        end
      else
        begin
          if ($signed(wire42))
            begin
              reg46 <= ($unsigned($signed((~^(+reg54)))) ?
                  (8'haa) : (reg51 ? {reg54, reg50} : {reg46}));
              reg47 <= (~($unsigned((reg47 | reg49)) ?
                  ((^~(wire39 != wire40)) ?
                      (!$signed(reg51)) : (8'hb7)) : reg45[(1'h0):(1'h0)]));
            end
          else
            begin
              reg46 <= reg54[(1'h0):(1'h0)];
              reg47 <= (!((^~$signed((wire42 ? wire42 : wire41))) ?
                  ($unsigned((8'hb7)) ?
                      ($signed(reg50) ?
                          (8'ha7) : reg48[(2'h3):(2'h3)]) : reg53[(4'hc):(4'h9)]) : wire40));
            end
          if (wire39)
            begin
              reg48 <= wire41;
              reg49 <= ((reg47[(3'h5):(2'h3)] | $signed($unsigned(reg48[(4'he):(4'ha)]))) ?
                  $unsigned($unsigned(($signed(wire42) ?
                      (reg50 >> reg46) : ((8'hbe) ? reg46 : reg52)))) : wire39);
              reg50 <= (^(+$unsigned(reg53)));
              reg51 <= $unsigned($unsigned($signed((reg53[(4'hf):(3'h5)] ?
                  (reg52 ? wire42 : wire43) : (reg49 ? reg44 : reg51)))));
            end
          else
            begin
              reg48 <= reg48;
              reg49 <= wire40;
              reg50 <= {$signed(((((7'h43) << wire39) <= (reg46 ?
                          reg53 : (8'ha1))) ?
                      {$unsigned(reg50),
                          $signed(reg48)} : wire39[(5'h10):(5'h10)])),
                  reg51[(2'h2):(1'h0)]};
              reg51 <= $unsigned(reg46);
            end
          reg52 <= $signed((wire40[(4'h8):(3'h7)] >= $signed((~wire39))));
          reg53 <= $signed({reg49[(4'h8):(1'h0)]});
          if ($unsigned(wire39))
            begin
              reg54 <= $signed({{wire40[(4'ha):(1'h0)]}});
              reg55 <= $signed(reg51[(3'h6):(3'h5)]);
              reg56 <= wire43;
              reg57 <= wire39[(4'hd):(3'h6)];
            end
          else
            begin
              reg54 <= (~$signed($unsigned((wire43[(3'h4):(2'h2)] | $unsigned(wire39)))));
              reg55 <= reg51;
              reg56 <= {((8'hbc) ? reg47[(3'h4):(3'h4)] : $unsigned(reg51))};
            end
        end
    end
  assign wire58 = $signed($signed((wire41[(3'h6):(3'h4)] ?
                      ($unsigned(wire40) ?
                          (reg44 ?
                              reg51 : reg48) : $unsigned((8'hbd))) : reg48)));
  assign wire59 = ((~^((~|(reg48 ^ reg57)) > ($unsigned(reg52) ?
                          (^~reg57) : $signed(reg46)))) ?
                      reg49[(2'h2):(2'h2)] : $unsigned(((reg54 ?
                          $unsigned(reg57) : reg49[(5'h12):(1'h1)]) + {(~reg50),
                          (|wire39)})));
  assign wire60 = $signed((reg52[(1'h1):(1'h0)] || (wire42[(3'h6):(1'h0)] ?
                      reg44[(2'h3):(2'h3)] : reg47)));
  assign wire61 = $signed((wire41 >= {((8'hab) == reg45)}));
  assign wire62 = (($signed(reg54) ?
                      ($signed((~^wire58)) ?
                          ($signed(wire39) && $signed(reg45)) : (reg57 ?
                              $signed((7'h42)) : reg52)) : (~|{wire59})) ^ (^~($signed((reg52 ?
                          reg57 : reg49)) ?
                      $signed(reg53[(3'h7):(2'h3)]) : wire42)));
  assign wire63 = {((-{(~^reg46), {reg56, reg47}}) + reg53),
                      ((~|($signed(reg56) > (wire42 >> wire62))) || ($unsigned($unsigned(reg54)) ?
                          $unsigned(wire43[(4'h8):(2'h2)]) : (|reg44)))};
  assign wire64 = $unsigned((^wire61));
  assign wire65 = reg49;
  assign wire66 = $unsigned((+wire62[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      reg67 <= (^({(reg52[(4'h8):(3'h5)] ?
              reg46[(4'h9):(3'h4)] : $unsigned(wire41)),
          $signed($signed(reg46))} ^~ $signed(reg49)));
      reg68 <= $unsigned($signed(wire64));
    end
  assign wire69 = ({$signed(reg53[(4'he):(4'hb)])} ?
                      $unsigned(reg55) : ((^$signed((wire64 <<< (7'h41)))) ?
                          reg52[(3'h5):(2'h2)] : reg45[(4'h9):(1'h1)]));
  assign wire70 = $signed((~^(!$signed($unsigned(wire59)))));
  assign wire71 = $unsigned(wire61);
  assign wire72 = {{(^~wire62[(4'h9):(3'h7)])}, {(~|reg51)}};
endmodule
