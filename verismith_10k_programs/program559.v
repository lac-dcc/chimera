module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire157;
  wire [(2'h2):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire148;
  wire [(2'h3):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire105;
  reg signed [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg149 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire148,
                 wire116,
                 wire115,
                 wire110,
                 wire109,
                 wire107,
                 wire23,
                 wire105,
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
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg147,
                 reg146,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg108,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$signed((8'had)), wire4[(1'h0):(1'h0)]};
      if ({wire4[(3'h4):(1'h1)]})
        begin
          reg6 <= ((~&{$unsigned(wire0), (!wire0[(2'h2):(1'h0)])}) ?
              (!(-(8'hb4))) : ($unsigned(($unsigned((8'had)) ^ $unsigned(wire1))) ^ (^~$signed((wire3 <= (8'hb6))))));
        end
      else
        begin
          reg6 <= reg6;
          if (wire0)
            begin
              reg7 <= $signed((^~(((&reg5) ?
                  wire2[(2'h3):(1'h1)] : ((8'h9d) ?
                      wire1 : reg5)) || $signed($signed((8'h9e))))));
            end
          else
            begin
              reg7 <= $signed(($unsigned(reg6[(1'h0):(1'h0)]) ^ $unsigned(($signed(wire0) < (wire2 | wire0)))));
              reg8 <= (({$unsigned(wire2[(4'hf):(4'ha)]),
                      wire1[(5'h12):(3'h5)]} < (wire1 ?
                      $unsigned(wire1[(4'hb):(4'ha)]) : wire0[(1'h0):(1'h0)])) ?
                  $unsigned(($unsigned(wire3[(5'h13):(4'hb)]) ?
                      reg5[(3'h6):(2'h2)] : ((^~wire0) ?
                          (wire1 >= reg5) : (wire4 ?
                              wire4 : wire0)))) : ((((wire1 ?
                              reg5 : wire2) ^ (8'hb2)) ?
                          $signed($signed((8'hbf))) : (!(wire4 << (8'ha3)))) ?
                      reg6[(3'h4):(1'h0)] : (!(((8'hbf) & (8'hb9)) > (reg7 ?
                          reg6 : (8'h9c))))));
              reg9 <= reg8;
              reg10 <= {wire2};
              reg11 <= wire3[(3'h5):(1'h0)];
            end
          reg12 <= reg5;
          if ({$signed((~&$signed(wire3)))})
            begin
              reg13 <= (~&((($unsigned(reg12) << $signed(wire2)) ?
                  {$signed(wire4)} : $signed((wire3 ?
                      (8'h9d) : reg9))) && $unsigned($unsigned({reg11}))));
              reg14 <= $signed(wire0);
            end
          else
            begin
              reg13 <= (reg6[(4'h9):(4'h8)] < (reg14[(4'hb):(2'h2)] ?
                  ($signed(reg8) - (!reg9[(4'hc):(4'hb)])) : (&$signed($unsigned(reg14)))));
              reg14 <= (reg13[(3'h4):(2'h2)] ?
                  $unsigned((~(8'hb6))) : ((!reg10) >= (+($unsigned(reg5) ?
                      (&reg8) : reg8))));
            end
        end
      reg15 <= reg11[(4'h8):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg16 <= wire4;
      reg17 <= reg13[(3'h5):(3'h5)];
      if (((~|wire3[(4'hf):(3'h5)]) ?
          reg12 : ($signed(reg15) ^~ (wire3 ~^ $unsigned(reg11)))))
        begin
          reg18 <= wire4[(3'h4):(1'h0)];
          reg19 <= (reg11 ^ wire4[(4'ha):(2'h2)]);
        end
      else
        begin
          reg18 <= {$unsigned(reg5)};
          reg19 <= ((((~|(!reg10)) ^ $signed({reg19,
              reg15})) >>> $unsigned((wire2 ?
              $signed(reg19) : {reg18}))) << {$unsigned(reg10[(4'hf):(4'hf)]),
              $unsigned((((8'haf) ? reg13 : reg18) >> (reg10 ~^ wire4)))});
          if (reg12[(3'h4):(2'h3)])
            begin
              reg20 <= {reg11[(4'h9):(4'h9)],
                  ($unsigned(($signed(reg19) ?
                      (!reg18) : reg9[(4'hd):(3'h4)])) <= (^$signed($unsigned((8'ha5)))))};
              reg21 <= (~^reg7);
            end
          else
            begin
              reg20 <= reg16[(2'h2):(2'h2)];
              reg21 <= reg13[(1'h0):(1'h0)];
              reg22 <= $unsigned($unsigned({{(~^wire4)}}));
            end
        end
    end
  assign wire23 = (7'h41);
  module24 #() modinst106 (wire105, clk, reg22, reg11, reg16, wire4);
  assign wire107 = ({{(+reg13), $signed(wire3)},
                       reg6[(1'h0):(1'h0)]} > wire105);
  always
    @(posedge clk) begin
      reg108 <= ($signed($signed(($unsigned(reg21) ?
          wire107[(3'h4):(1'h0)] : reg20))) >> {{((reg9 ? reg22 : reg20) ?
                  {reg20} : (wire105 | (8'ha2))),
              (((8'ha0) ? wire1 : reg8) ? (-reg15) : $unsigned((8'hbf)))}});
    end
  assign wire109 = reg18[(1'h1):(1'h0)];
  assign wire110 = reg13[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg111 <= $unsigned(wire1);
      reg112 <= $signed((8'hbc));
      reg113 <= reg13[(3'h6):(1'h1)];
      reg114 <= {$unsigned(wire109),
          (((8'ha9) ^~ $unsigned((|reg6))) ?
              ($unsigned($signed(reg6)) | ((wire110 ?
                  (8'hb0) : reg9) <<< $signed(reg14))) : $signed(reg21[(4'hb):(2'h3)]))};
    end
  assign wire115 = reg13[(2'h3):(1'h1)];
  assign wire116 = $unsigned(reg114);
  always
    @(posedge clk) begin
      reg117 <= {{wire3[(5'h12):(4'he)]}};
      if ($signed(($unsigned($signed((wire109 << reg14))) ?
          (reg6[(3'h7):(3'h7)] ?
              $signed(reg16[(1'h1):(1'h1)]) : (|(reg7 ?
                  wire115 : wire1))) : reg19[(2'h2):(2'h2)])))
        begin
          reg118 <= (reg18[(1'h0):(1'h0)] << $unsigned($unsigned($signed((~&reg108)))));
          reg119 <= reg14[(4'h8):(3'h5)];
          reg120 <= wire3[(5'h14):(4'hf)];
          if (((($signed((~wire107)) ? (8'haa) : (~|(reg6 >> reg119))) ?
              ($signed($signed(reg12)) ?
                  ($signed(reg118) ?
                      reg117 : (reg9 < (7'h40))) : (wire2 >> reg114[(4'he):(4'he)])) : (~^$signed((reg15 ?
                  wire110 : reg19)))) * ((reg6[(3'h4):(3'h4)] || $signed(reg13)) ?
              $unsigned(($signed(wire3) <= reg117)) : reg19[(3'h5):(1'h0)])))
            begin
              reg121 <= ((wire110[(2'h2):(1'h1)] ?
                      (-$unsigned((wire110 | reg9))) : $unsigned(wire107[(3'h5):(1'h1)])) ?
                  $signed(($unsigned((reg11 ?
                      reg17 : wire110)) - (+wire3))) : reg16);
              reg122 <= $signed(reg20);
              reg123 <= ((8'hac) ? $signed((reg16 > reg108)) : reg11);
            end
          else
            begin
              reg121 <= ($unsigned((^(reg122[(4'hf):(4'ha)] ?
                  {(8'hb9), (8'hbd)} : $signed((8'hac))))) | (((8'ha9) ?
                      (((8'hb2) ? reg8 : wire1) ?
                          (reg21 ?
                              reg16 : wire1) : $signed(reg111)) : (&$signed(reg6))) ?
                  $unsigned($signed($signed(wire23))) : $unsigned((^(reg122 ?
                      reg12 : wire0)))));
              reg122 <= wire116[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg118 <= reg113[(3'h5):(2'h2)];
        end
      reg124 <= reg18[(1'h0):(1'h0)];
      if ($signed((!reg15[(1'h0):(1'h0)])))
        begin
          if (reg11)
            begin
              reg125 <= ({$unsigned((^(wire1 ?
                      wire1 : wire110)))} ~^ $unsigned((^{$signed(wire109)})));
              reg126 <= ({{$signed((~|reg120)),
                      {{wire3, (8'hba)}}}} >= ($signed((8'had)) + wire109));
            end
          else
            begin
              reg125 <= ($unsigned(reg122[(5'h10):(4'h9)]) && reg124[(4'hf):(4'h8)]);
              reg126 <= $signed(wire1);
            end
          reg127 <= ($signed(wire105[(3'h4):(2'h3)]) && (!($signed($unsigned(reg5)) - {{reg123},
              $unsigned(reg14)})));
          if (wire23[(4'hb):(2'h3)])
            begin
              reg128 <= reg18;
              reg129 <= {(reg22 >>> reg5)};
            end
          else
            begin
              reg128 <= (reg127[(4'ha):(3'h4)] ^ reg22[(5'h12):(1'h0)]);
              reg129 <= ($unsigned({reg18}) && wire2);
              reg130 <= {reg120[(4'h8):(3'h5)], reg14[(4'hc):(4'ha)]};
              reg131 <= $unsigned($unsigned(reg121[(1'h1):(1'h1)]));
              reg132 <= ((($unsigned($unsigned(reg16)) && $unsigned((reg7 > reg131))) ^ $signed($unsigned(reg8[(5'h13):(3'h7)]))) ?
                  reg119 : (8'h9e));
            end
          reg133 <= reg15;
        end
      else
        begin
          reg125 <= (((8'ha6) ?
              $unsigned((|$signed(wire2))) : $signed({(8'ha8)})) + $unsigned((($unsigned(reg112) ?
                  (reg8 + reg119) : (8'ha3)) ?
              $signed((wire115 ? (8'hbc) : (8'hb0))) : reg21)));
          reg126 <= ($unsigned((reg128[(3'h7):(3'h6)] + ((reg108 && reg18) ?
              reg6[(4'h9):(3'h4)] : reg19[(1'h0):(1'h0)]))) || reg112);
          if ({$signed(((!{wire107}) >= $signed(reg117))), reg129})
            begin
              reg127 <= {reg121, reg122[(4'hb):(4'h9)]};
              reg128 <= $signed((reg119 >= (&$unsigned((~&reg14)))));
              reg129 <= reg5[(3'h5):(1'h0)];
              reg130 <= reg113;
              reg131 <= reg122;
            end
          else
            begin
              reg127 <= wire115;
              reg128 <= reg113[(3'h4):(2'h2)];
              reg129 <= $signed({$unsigned((reg114[(4'he):(1'h1)] == (reg112 ?
                      reg119 : reg5))),
                  $signed($signed((!wire2)))});
              reg130 <= (8'h9d);
            end
          if ((8'hbb))
            begin
              reg132 <= reg6[(3'h6):(1'h1)];
            end
          else
            begin
              reg132 <= reg12[(2'h3):(2'h2)];
            end
        end
      reg134 <= reg15;
    end
  always
    @(posedge clk) begin
      reg135 <= wire2[(1'h0):(1'h0)];
      reg136 <= wire105[(3'h5):(3'h5)];
      if ($signed((!wire115)))
        begin
          reg137 <= ($unsigned($unsigned(reg120[(1'h0):(1'h0)])) <= reg6);
          reg138 <= $unsigned((|{reg126[(3'h5):(1'h1)]}));
        end
      else
        begin
          if (wire116[(2'h3):(2'h3)])
            begin
              reg137 <= (+$signed($unsigned($unsigned(reg132[(2'h2):(1'h1)]))));
              reg138 <= $unsigned(((wire1[(3'h6):(3'h4)] ?
                      reg22 : ($unsigned(reg127) ? reg5 : $unsigned(reg12))) ?
                  $unsigned(((|reg126) <= ((8'hbb) ?
                      reg6 : reg132))) : (~^reg18)));
              reg139 <= $unsigned({((&(reg120 < reg134)) ?
                      {(!wire109),
                          (wire1 ? reg19 : reg10)} : $unsigned((+reg114))),
                  ((&reg132) ?
                      ($signed((8'haa)) ?
                          {reg18} : $unsigned(reg133)) : (~(reg132 ?
                          reg124 : (8'hac))))});
              reg140 <= $unsigned(reg10[(4'hc):(4'h9)]);
            end
          else
            begin
              reg137 <= $signed({(-$unsigned($signed(reg132))),
                  $signed(($unsigned((8'h9f)) ?
                      {reg131} : {wire110, wire23}))});
            end
          reg141 <= reg118[(4'hc):(4'hc)];
          reg142 <= $signed(({$unsigned($unsigned(reg113)),
              ({wire1, wire109} ?
                  $unsigned(reg108) : (reg14 - reg108))} == $signed((-reg113[(3'h4):(3'h4)]))));
          reg143 <= (~&$unsigned($signed(reg134)));
        end
    end
  always
    @(posedge clk) begin
      reg144 <= ($unsigned((wire4[(3'h6):(2'h3)] > ((wire1 ? reg16 : reg19) ?
              $signed(reg122) : (&reg9)))) ?
          $signed({reg114[(2'h3):(1'h1)]}) : $signed($unsigned((^~reg121[(4'hf):(4'h9)]))));
      reg145 <= wire115[(4'h8):(2'h2)];
      reg146 <= $unsigned($unsigned({({reg108, reg22} ?
              {reg135} : $unsigned(reg125))}));
      reg147 <= reg15[(4'ha):(4'ha)];
    end
  assign wire148 = (^((~&$signed((8'hbc))) > $signed(reg17)));
  always
    @(posedge clk) begin
      if ({reg138, reg113})
        begin
          reg149 <= (8'hb6);
          reg150 <= $signed($unsigned($unsigned(reg19)));
          reg151 <= $signed((&reg112));
          reg152 <= $signed($unsigned($signed((^~(reg134 ?
              reg140 : wire148)))));
        end
      else
        begin
          reg149 <= reg123;
          reg150 <= {(reg141[(4'hd):(4'h9)] <= {({(8'hb4), reg147} ?
                      ((7'h40) << reg108) : $unsigned((8'hb9))),
                  reg121[(4'hd):(3'h6)]})};
          reg151 <= (8'hbf);
          reg152 <= (8'h9d);
        end
      reg153 <= $signed((reg119 ? (8'hae) : reg126[(2'h3):(1'h1)]));
      reg154 <= reg22[(5'h11):(4'h8)];
    end
  assign wire155 = ((~^reg135) || ($signed(($unsigned(reg111) ?
                       (&reg5) : $unsigned(wire105))) | (reg143[(5'h13):(4'hc)] >= $unsigned((reg12 - reg10)))));
  assign wire156 = (((~&{$signed(reg9)}) ?
                       (~($unsigned((7'h43)) - $signed(reg125))) : $unsigned($signed({reg153,
                           reg147}))) <<< (-reg19));
  assign wire157 = ((reg146[(1'h1):(1'h0)] ^~ (({reg111} ?
                           $signed(reg127) : (reg147 ?
                               reg11 : reg132)) >> $signed($unsigned(wire155)))) ?
                       $unsigned(((~|(~(8'had))) ?
                           $unsigned($unsigned(reg18)) : (-$unsigned(reg141)))) : (((wire4 != (-reg119)) ?
                           $unsigned((8'had)) : (!$signed(reg137))) & ($unsigned($unsigned(reg108)) ?
                           ($unsigned(reg11) ?
                               {reg18} : $signed(reg11)) : ({reg18} ?
                               reg153[(3'h5):(1'h1)] : (!(8'hb8))))));
  assign wire158 = (8'hb2);
  always
    @(posedge clk) begin
      if ((+$signed(wire1[(5'h12):(3'h4)])))
        begin
          reg159 <= {$unsigned((((reg15 ? wire155 : (8'hbe)) == reg141) ?
                  (~^{reg126}) : (reg11[(5'h11):(5'h11)] ?
                      (-(7'h43)) : $signed(wire23)))),
              (($unsigned(reg134[(1'h1):(1'h1)]) ?
                      (reg12[(4'he):(4'he)] >= reg124) : reg22) ?
                  reg114[(4'ha):(4'h9)] : reg134[(2'h2):(1'h1)])};
        end
      else
        begin
          reg159 <= (reg159 ?
              reg113 : (~^(reg108[(4'ha):(4'ha)] ?
                  reg150 : ($unsigned(reg132) << $signed(reg132)))));
          reg160 <= $unsigned((~|((!{reg10}) <= reg159[(2'h3):(2'h3)])));
          reg161 <= {(~&(+$unsigned((reg120 | reg134)))), wire107};
        end
      if ((wire116 ?
          $unsigned($signed(((reg147 ? reg111 : (8'hbc)) ?
              {reg147, (8'hac)} : (reg141 ?
                  reg108 : (8'ha3))))) : reg142[(3'h4):(3'h4)]))
        begin
          reg162 <= {wire158};
          if ((reg136[(4'h9):(1'h1)] ?
              $signed($signed($unsigned($signed(reg12)))) : (($signed($signed(reg123)) < wire3) ?
                  $unsigned($signed((^~(8'hb6)))) : (($signed(reg141) < (~reg139)) ?
                      (reg135[(4'h9):(3'h4)] ?
                          (wire0 ?
                              wire4 : reg137) : reg6) : $unsigned((reg153 | reg20))))))
            begin
              reg163 <= wire3;
            end
          else
            begin
              reg163 <= reg135;
              reg164 <= reg7[(2'h2):(2'h2)];
            end
          if ($signed($signed(reg132[(3'h4):(2'h3)])))
            begin
              reg165 <= (~^(-reg159[(2'h3):(2'h2)]));
              reg166 <= $signed($unsigned(($signed($unsigned(reg119)) <= ({reg117,
                  reg153} - reg153[(4'hf):(4'ha)]))));
              reg167 <= $signed(reg108[(4'h8):(3'h6)]);
            end
          else
            begin
              reg165 <= ({wire110[(3'h6):(1'h0)], reg17[(2'h2):(1'h0)]} ?
                  ($unsigned(((reg152 ? reg8 : reg161) ?
                      (wire2 ?
                          reg133 : reg167) : (reg146 >> reg117))) > (reg14[(3'h4):(3'h4)] ?
                      $unsigned(reg163) : reg164)) : (8'hbc));
              reg166 <= (~|($signed($signed((reg12 ? wire0 : reg22))) ?
                  $signed({$unsigned((8'hb1)),
                      ((8'hb7) ? reg163 : reg130)}) : ({(reg19 * reg19),
                      reg22} ^ ($unsigned(reg161) != reg145))));
              reg167 <= (reg162 ?
                  $signed($signed(((reg21 ?
                      reg11 : (8'ha0)) && reg15))) : (~^$unsigned($signed((reg146 ?
                      wire109 : reg6)))));
              reg168 <= reg111;
              reg169 <= reg14[(4'ha):(3'h7)];
            end
        end
      else
        begin
          reg162 <= $unsigned(wire158);
          reg163 <= (!$unsigned(((^reg122[(3'h6):(1'h1)]) >= (~|reg126[(1'h0):(1'h0)]))));
          if (wire1)
            begin
              reg164 <= reg159;
              reg165 <= (~|$signed(reg113[(2'h2):(1'h0)]));
              reg166 <= $unsigned($unsigned(($signed(reg15) ?
                  $unsigned((~reg117)) : ((reg11 ?
                      reg113 : (8'ha6)) + (reg128 | wire148)))));
            end
          else
            begin
              reg164 <= wire109[(2'h3):(2'h2)];
              reg165 <= reg136;
            end
          reg167 <= (|(reg135[(4'h8):(3'h7)] ?
              reg120 : ({$signed(reg167),
                  (reg6 - wire155)} && $unsigned(reg152))));
        end
      reg170 <= reg16;
    end
endmodule

module module24
#(parameter param104 = (8'ha6))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire98;
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire60,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire62,
                 wire63,
                 wire64,
                 wire98,
                 reg103,
                 reg102,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire29 = (^({$unsigned({wire25, wire26}),
                      $unsigned(((8'ha9) & wire27))} * wire25[(4'hb):(3'h4)]));
  assign wire30 = $unsigned($unsigned($unsigned($unsigned((~^wire29)))));
  assign wire31 = $signed(({(|(wire29 ? wire30 : (8'hbc))),
                      wire29[(4'h8):(3'h6)]} | $unsigned(((~(8'haf)) ?
                      (wire30 ? wire26 : wire25) : (wire25 >>> (7'h44))))));
  assign wire32 = $signed(((wire28[(4'hb):(4'h8)] ?
                          ((wire30 && wire29) ^ {wire30,
                              (8'hae)}) : wire25[(1'h1):(1'h1)]) ?
                      (+((&wire31) ~^ (wire25 ? wire28 : wire25))) : wire27));
  always
    @(posedge clk) begin
      reg33 <= (^(8'ha9));
      reg34 <= $signed($unsigned($signed($unsigned((wire30 ?
          reg33 : wire30)))));
      if (wire27)
        begin
          if (wire28)
            begin
              reg35 <= $signed(wire26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg35 <= {($unsigned(wire28[(2'h3):(1'h0)]) * ($unsigned((reg34 <<< wire31)) * wire29)),
                  {((~|(~|reg33)) ? reg35 : {reg34[(3'h6):(3'h5)]}),
                      {wire30[(4'hb):(1'h0)]}}};
              reg36 <= ((8'ha8) == (^~(~|((reg33 ? reg35 : (8'ha0)) ?
                  (wire32 ? wire29 : reg34) : (wire28 - wire27)))));
              reg37 <= (wire25 ?
                  ($signed(reg33) < $signed($unsigned({reg36,
                      (8'ha9)}))) : (($signed({wire31}) ^ ($signed(wire26) ?
                          ((8'haf) < wire27) : reg36[(1'h0):(1'h0)])) ?
                      (8'h9f) : {{$unsigned(wire30), $unsigned(wire31)}}));
            end
          reg38 <= wire25[(4'hc):(2'h2)];
          reg39 <= wire25[(5'h10):(4'hf)];
          reg40 <= (($signed((8'h9d)) > $signed({wire32})) + (wire32[(2'h2):(2'h2)] > {reg35[(3'h4):(2'h2)],
              $signed((&wire28))}));
          if ((~&(((^(&wire26)) ?
              ($signed(wire30) >= wire31) : (^(wire25 ?
                  reg37 : wire30))) ^ ({wire27, $unsigned(reg37)} | reg33))))
            begin
              reg41 <= {((~^$signed($signed(reg35))) ?
                      ($signed(wire26[(2'h2):(1'h1)]) > $unsigned($unsigned((8'hb2)))) : (!wire31[(4'ha):(4'h8)])),
                  (-(($signed(reg39) << $unsigned(wire32)) >>> (+(^wire31))))};
            end
          else
            begin
              reg41 <= (reg38[(3'h4):(1'h1)] != $unsigned($unsigned({(reg33 ?
                      wire31 : reg35)})));
              reg42 <= $unsigned((&(8'hbc)));
            end
        end
      else
        begin
          if ((wire30 ? (&$unsigned(reg36)) : wire28))
            begin
              reg35 <= ((8'ha3) || $signed(wire26[(2'h3):(2'h2)]));
              reg36 <= $unsigned(reg36);
              reg37 <= (^(wire30[(5'h15):(4'hd)] < ($unsigned(wire27[(4'hd):(2'h3)]) ?
                  ((wire29 ? wire25 : reg34) <= $unsigned(wire32)) : reg42)));
            end
          else
            begin
              reg35 <= (~|wire30);
              reg36 <= $signed(((~|(|((8'h9c) & reg40))) ?
                  wire28 : $signed((wire31 ?
                      (reg36 ? wire32 : reg33) : $unsigned(reg41)))));
              reg37 <= $signed(((((-wire32) + (wire25 ?
                      wire32 : (8'haf))) <<< $signed($unsigned(reg42))) ?
                  (^~$unsigned((wire27 | (8'hbf)))) : reg40[(1'h1):(1'h1)]));
              reg38 <= (~&(~&$signed(reg34)));
              reg39 <= $signed((~(reg39[(4'he):(4'ha)] ?
                  ({reg39} ?
                      wire27[(4'hf):(4'hf)] : {reg35}) : reg38[(4'h8):(3'h5)])));
            end
          reg40 <= (wire25 - $unsigned($unsigned(wire31)));
        end
    end
  module43 #() modinst61 (.wire44(wire27), .wire47(wire28), .wire46(reg37), .y(wire60), .clk(clk), .wire45(wire31));
  assign wire62 = (reg39[(4'hf):(1'h1)] ?
                      $signed($signed($unsigned({wire29,
                          wire26}))) : $signed(reg36[(1'h1):(1'h0)]));
  assign wire63 = $unsigned({reg37[(1'h0):(1'h0)]});
  assign wire64 = $unsigned(({{(8'ha5)}, wire31} ?
                      ($signed((reg36 | reg34)) ?
                          $signed($unsigned(wire25)) : ((~|reg41) <= (reg39 ?
                              wire63 : reg35))) : wire25[(1'h1):(1'h1)]));
  module65 #() modinst99 (wire98, clk, wire30, wire60, wire29, reg37);
  assign wire100 = (wire32[(2'h2):(2'h2)] > wire30);
  assign wire101 = $signed(reg42[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      reg102 <= ($unsigned({{reg37[(4'hc):(4'hc)]}}) == (^(((reg36 ?
          (8'hb8) : (8'hac)) - $signed((8'hb4))) ^~ $signed($unsigned(reg39)))));
      reg103 <= {$unsigned((wire63[(1'h0):(1'h0)] & (&$unsigned(wire62)))),
          (!(~&(~|reg102)))};
    end
endmodule

module module65
#(parameter param96 = (((~(~&(^(8'h9f)))) ? ((-((8'had) ? (8'hb9) : (8'hb3))) ? (8'hbf) : (((8'ha3) ? (8'hb6) : (7'h43)) ? ((8'ha9) ~^ (8'ha5)) : ((8'had) ? (8'ha1) : (8'h9d)))) : (~^(((8'hb4) << (8'h9e)) && ((7'h42) > (8'hae))))) + (({((8'hba) & (8'hb0))} ? (((8'hba) < (8'hba)) ? ((8'ha1) ? (8'hab) : (8'hb6)) : ((8'ha8) > (8'hb4))) : (!((8'hbc) < (8'hb5)))) ? ((((8'ha3) < (8'hb1)) << ((8'ha9) ? (8'ha0) : (8'hbf))) ? (+((7'h44) != (8'ha3))) : {((8'hb0) == (7'h43)), ((8'ha9) >= (8'hb0))}) : {{((8'hae) >> (8'haa))}, (~^((8'ha4) ? (8'hbe) : (8'ha5)))})), 
parameter param97 = {{param96}, ((^{(-param96)}) ? ({(param96 ? param96 : (8'ha6)), (!param96)} * ((~&param96) >> (~|param96))) : ((((8'ha3) | param96) ? param96 : (!param96)) ? (&param96) : param96))})
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire [(5'h12):(1'h0)] wire67;
  input wire [(3'h4):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire70 = wire68;
  assign wire71 = $unsigned(wire66[(1'h1):(1'h1)]);
  assign wire72 = (~wire68);
  assign wire73 = (+(((+(wire72 ? wire71 : wire71)) <<< (~{wire71})) ?
                      wire71[(3'h6):(3'h6)] : (!(!wire69[(1'h0):(1'h0)]))));
  assign wire74 = wire73[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg75 <= ({{wire72}} | wire67);
      if ($signed(reg75[(4'h8):(3'h7)]))
        begin
          reg76 <= wire72;
        end
      else
        begin
          reg76 <= $unsigned(((~($signed((8'hb7)) || reg75[(4'hf):(3'h4)])) <= (((reg76 ?
                  wire67 : wire72) <<< (wire66 ? (8'haa) : wire67)) ?
              wire67[(3'h7):(3'h6)] : (|(~wire70)))));
          if ($signed(wire68))
            begin
              reg77 <= (($signed(reg75) ? {$signed(reg75)} : wire67) ?
                  wire71[(1'h0):(1'h0)] : ($signed({wire69, (^wire73)}) ?
                      wire72 : $unsigned(wire67[(3'h7):(1'h1)])));
              reg78 <= ($unsigned((~^((reg77 ? wire70 : reg76) ?
                      (wire67 ? wire66 : (7'h40)) : $signed((8'ha7))))) ?
                  {($signed($signed((8'hb1))) & wire67)} : (~(~|$unsigned((^~wire71)))));
            end
          else
            begin
              reg77 <= $unsigned($unsigned(reg78[(3'h6):(1'h1)]));
              reg78 <= wire71[(2'h2):(2'h2)];
              reg79 <= {((8'hb7) != wire69)};
            end
          reg80 <= $signed((&reg79[(3'h7):(2'h2)]));
          reg81 <= (reg75[(4'hc):(3'h4)] || wire71);
        end
    end
  always
    @(posedge clk) begin
      if ((-reg75[(4'ha):(4'h9)]))
        begin
          reg82 <= reg76[(2'h3):(2'h2)];
        end
      else
        begin
          reg82 <= $signed({$signed($unsigned((wire74 ? wire74 : reg75)))});
          reg83 <= reg80;
          reg84 <= $signed(wire71);
        end
      if (reg84)
        begin
          reg85 <= $unsigned($signed($signed({$unsigned(wire72),
              (reg84 > reg82)})));
          reg86 <= ($unsigned((wire69[(1'h1):(1'h0)] ?
                  reg84 : ($unsigned(reg83) ? {reg76} : {reg78, wire69}))) ?
              ($unsigned(((~^reg78) <= (~|wire69))) ^~ wire74[(4'h8):(1'h1)]) : $signed(wire70[(2'h2):(1'h1)]));
          reg87 <= reg77[(4'hf):(4'hb)];
          reg88 <= wire66;
          reg89 <= ({reg79,
                  {((reg81 ? wire69 : reg77) ?
                          (wire72 ~^ reg83) : (reg82 ? reg85 : wire71))}} ?
              (~|(~&reg84[(2'h2):(1'h0)])) : ((~$signed((reg76 << reg85))) ?
                  (((reg88 ?
                      reg77 : reg88) && (wire69 ^~ (8'hb2))) != (+((8'hb7) && wire74))) : $unsigned($signed(reg80))));
        end
      else
        begin
          reg85 <= (reg85[(1'h0):(1'h0)] >= (((reg82[(1'h1):(1'h1)] || (8'h9d)) & (&(reg79 == reg86))) < (^~$signed(reg75))));
          reg86 <= {$unsigned(wire72[(2'h2):(2'h2)]), reg85[(2'h3):(2'h3)]};
          reg87 <= reg78[(2'h2):(1'h1)];
        end
      reg90 <= reg79[(4'hd):(4'hc)];
      reg91 <= (reg85 - reg84);
      reg92 <= reg83;
    end
  assign wire93 = ($signed((~$unsigned($signed((8'ha1))))) ?
                      wire71[(2'h2):(2'h2)] : reg80[(1'h0):(1'h0)]);
  assign wire94 = wire70;
  assign wire95 = (((!({wire74, (8'ha8)} ? wire67[(4'hd):(2'h3)] : (!wire70))) ?
                      wire74[(1'h1):(1'h0)] : $unsigned({{reg83},
                          $signed(reg76)})) > (($signed((wire74 * wire94)) * ((reg92 + reg84) <<< (reg90 == reg92))) - (wire66[(1'h1):(1'h0)] ?
                      ({reg89, reg89} ?
                          reg77 : $signed((8'ha9))) : $signed((reg85 << reg82)))));
endmodule

module module43
#(parameter param59 = (8'haa))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire47;
  input wire [(4'h8):(1'h0)] wire46;
  input wire signed [(4'ha):(1'h0)] wire45;
  input wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire48 = wire46[(1'h0):(1'h0)];
  assign wire49 = ($unsigned(((wire45[(1'h0):(1'h0)] ^~ (wire48 ?
                          (8'hb6) : wire46)) || (wire45[(2'h3):(1'h1)] >= (wire45 ?
                          wire46 : wire46)))) ?
                      (!(|(wire44[(1'h1):(1'h1)] ?
                          (wire48 && wire45) : $signed(wire44)))) : (8'hbd));
  assign wire50 = (~^(^($signed(wire45[(4'h9):(4'h9)]) ?
                      $unsigned($signed((8'hbb))) : wire44)));
  assign wire51 = wire50;
  assign wire52 = wire49[(3'h6):(2'h3)];
  assign wire53 = wire44;
  assign wire54 = (~&wire49[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg55 <= $signed({$signed((7'h43)),
          $signed($unsigned((wire54 ~^ wire46)))});
      reg56 <= ($unsigned((~&(!$unsigned(wire49)))) ?
          wire51 : wire44[(2'h3):(2'h3)]);
    end
  assign wire57 = $signed($unsigned({$unsigned(reg55), $signed((-wire49))}));
  assign wire58 = (~&wire47[(4'ha):(4'ha)]);
endmodule
