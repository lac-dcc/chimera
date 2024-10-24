module top
#(parameter param199 = (~|((~^(~^((8'ha5) ? (8'hb5) : (8'hbe)))) ^~ (({(8'hb1)} ? {(7'h44), (7'h42)} : (-(8'hae))) ? ((!(8'hb7)) ? {(8'hac)} : ((8'ha5) ? (8'haa) : (8'ha8))) : ({(8'ha3)} || {(8'ha5), (8'hab)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire197;
  wire [(5'h11):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire197,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire5,
                 wire4,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned((($unsigned((wire2 ? wire1 : (8'h9d))) >>> wire0) ?
                     ($signed($signed(wire0)) >>> wire3[(1'h1):(1'h0)]) : (((8'hb6) <= {wire0,
                             wire2}) ?
                         wire3 : (((7'h40) + wire2) ?
                             wire0[(5'h13):(5'h12)] : (wire1 ?
                                 wire2 : wire3)))));
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= $unsigned(((^~wire2[(3'h4):(1'h1)]) ?
          ($signed($signed(wire3)) >= ((^wire3) ?
              (~&wire4) : ((8'h9f) ? (8'hba) : wire2))) : wire0));
      reg7 <= (^(reg6 ?
          wire3[(4'h9):(3'h6)] : {($signed(wire1) ? (|reg6) : (+(8'hb6))),
              (8'hae)}));
      if (reg7[(4'hb):(1'h1)])
        begin
          reg8 <= (8'hb5);
          if (wire2)
            begin
              reg9 <= $unsigned({$signed(wire2[(1'h1):(1'h1)])});
              reg10 <= {{$signed($unsigned((|wire2)))}};
              reg11 <= $unsigned($unsigned((+reg6[(4'hb):(4'ha)])));
              reg12 <= wire0[(1'h1):(1'h0)];
            end
          else
            begin
              reg9 <= ($signed((&$unsigned((+wire5)))) ?
                  reg12 : (~&$unsigned(((-reg11) > (~&reg6)))));
            end
          reg13 <= (reg8 ? $unsigned($unsigned(wire4)) : reg9);
          if ($signed(({wire1,
              (&reg8[(3'h5):(3'h5)])} + (($unsigned(reg10) & (wire3 ?
                  wire4 : wire0)) ?
              (!{reg12, (8'hb7)}) : (~^wire2[(3'h5):(3'h5)])))))
            begin
              reg14 <= reg7;
              reg15 <= ((&$unsigned(wire4)) - $signed(wire4));
              reg16 <= $signed(($unsigned((^~reg11)) ?
                  $unsigned($unsigned((wire1 ^~ reg10))) : (({(8'ha7)} ?
                          (wire5 && reg8) : reg9) ?
                      reg11[(4'hb):(4'hb)] : ((wire0 ?
                          wire1 : wire1) >= ((8'hb1) ? wire1 : (8'h9e))))));
              reg17 <= ({$unsigned($unsigned($signed(reg8)))} ?
                  $unsigned((^~$unsigned((^reg9)))) : $unsigned((^~$signed($unsigned(reg11)))));
              reg18 <= (!{((reg8 ? (wire3 < (8'ha6)) : (!reg10)) ?
                      (~&$signed(wire4)) : reg12[(3'h6):(3'h4)]),
                  reg13[(4'h9):(4'h8)]});
            end
          else
            begin
              reg14 <= (~{($unsigned($unsigned(wire5)) ?
                      ($unsigned(wire0) ?
                          $unsigned(reg18) : ((8'ha5) <= reg12)) : $unsigned(wire0[(4'hc):(2'h2)])),
                  wire0[(5'h13):(4'hb)]});
              reg15 <= (^((8'h9e) << (reg18[(4'h8):(2'h2)] << ($signed(reg12) ?
                  $unsigned(reg13) : (reg16 != reg6)))));
            end
        end
      else
        begin
          reg8 <= (reg6 ?
              ((8'hb2) ?
                  (wire2[(2'h2):(1'h1)] ?
                      {((8'ha8) >> reg17),
                          wire4[(1'h1):(1'h0)]} : $unsigned((~wire2))) : ($signed($unsigned(reg10)) ?
                      $signed(reg8) : reg17[(2'h3):(1'h0)])) : reg12);
          reg9 <= $unsigned(((~|reg15[(1'h1):(1'h0)]) | (|($signed(wire5) ?
              (8'ha1) : {reg11}))));
          reg10 <= (~|(~|$signed((reg17[(4'ha):(3'h6)] ?
              (wire0 ^ reg15) : (reg13 || reg15)))));
          reg11 <= {$unsigned(reg6),
              ((reg17[(4'ha):(4'h8)] && reg9) & reg9[(3'h4):(2'h3)])};
          reg12 <= (-$unsigned(wire0));
        end
      reg19 <= $signed(reg8);
      if ((8'hb1))
        begin
          if (reg14[(2'h2):(1'h1)])
            begin
              reg20 <= ($signed($signed((~&{reg19, reg9}))) ?
                  ((+(+$unsigned((7'h42)))) == $unsigned(reg9)) : ($unsigned($unsigned($unsigned(reg11))) ?
                      reg14[(1'h1):(1'h1)] : ({$signed(wire0),
                              (wire2 << reg14)} ?
                          reg8 : $signed({wire1, (8'hb6)}))));
            end
          else
            begin
              reg20 <= (~&((reg7 ^ reg6) ? $signed((8'ha1)) : reg13));
              reg21 <= reg14[(1'h0):(1'h0)];
              reg22 <= reg10[(4'hc):(3'h4)];
              reg23 <= ($signed(wire3) << (~|$signed($signed(reg19))));
              reg24 <= $unsigned(wire4[(4'h8):(1'h0)]);
            end
          reg25 <= (reg9[(3'h7):(3'h4)] ?
              (((~$signed((8'hb6))) ? (+(wire3 * reg10)) : reg13) ?
                  reg9[(1'h1):(1'h0)] : $unsigned(wire0[(4'h8):(1'h0)])) : $unsigned(((+$unsigned(reg24)) ?
                  (!(^reg14)) : (-reg17))));
          reg26 <= (($unsigned(($signed(reg21) ?
              (~^reg23) : (~wire3))) & reg9[(2'h3):(2'h3)]) < wire1[(4'hb):(4'hb)]);
          reg27 <= reg24;
          reg28 <= (reg24 ?
              ($signed($signed($unsigned(reg17))) && {(wire2[(2'h2):(1'h0)] | (^wire4)),
                  $unsigned((8'hbe))}) : ((^$unsigned(reg16[(3'h7):(1'h0)])) ?
                  ((|$unsigned((8'ha2))) ?
                      reg14 : (reg8[(2'h3):(2'h3)] && {(8'hb0)})) : ((reg9 || $signed(reg11)) ?
                      reg9 : ((reg14 ? (7'h40) : wire0) ~^ reg13))));
        end
      else
        begin
          reg20 <= $signed($unsigned((!((~^(8'ha6)) ? (|reg18) : (8'hb8)))));
        end
    end
  assign wire29 = {reg9};
  assign wire30 = wire0;
  assign wire31 = reg12;
  assign wire32 = ({($signed((reg16 ? (8'hb0) : (8'hab))) > (+(reg27 ?
                              reg21 : reg19))),
                          wire29[(2'h2):(2'h2)]} ?
                      $signed((((8'ha8) >= $signed(reg11)) < (|wire2[(3'h4):(2'h2)]))) : ($signed(reg14) * wire5[(2'h3):(2'h2)]));
  module33 #() modinst198 (wire197, clk, reg28, reg13, wire0, wire32);
endmodule

module module33
#(parameter param195 = ((~((^((8'hb2) ? (8'h9c) : (8'ha0))) != (|((8'ha8) ? (8'hb1) : (7'h42))))) ? ((^~(&{(8'hbd)})) && (&(+{(8'hb6)}))) : ((8'ha8) ? (-(((8'ha4) ~^ (8'haf)) ? (~&(8'hba)) : ((8'hba) <<< (8'hb1)))) : (^(8'h9d)))), 
parameter param196 = (((8'ha3) ? {param195, param195} : (((param195 ? param195 : param195) ? (param195 ? (8'hac) : param195) : (^param195)) ? {param195} : param195)) ? (^((^(|param195)) ? param195 : {(+param195)})) : ((((&param195) ? (param195 ? param195 : param195) : {(8'ha7), param195}) ? ((~^param195) ? (param195 * param195) : param195) : param195) == (((8'hbd) ? (param195 ? (8'hb6) : param195) : (param195 >> param195)) == (-param195)))))
(y, clk, wire34, wire35, wire36, wire37);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire34;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h10):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire194;
  wire signed [(5'h11):(1'h0)] wire193;
  wire signed [(4'h9):(1'h0)] wire191;
  wire signed [(4'he):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire165;
  wire [(3'h4):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire161;
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire191,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire110,
                 wire86,
                 wire38,
                 wire39,
                 wire40,
                 wire84,
                 wire121,
                 wire122,
                 wire161,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 (1'h0)};
  assign wire38 = {{wire36[(3'h4):(1'h0)], (&$signed($unsigned((8'h9f))))}};
  assign wire39 = (({wire38,
                      ((wire38 ?
                          wire36 : wire35) * (~&wire37))} ^~ $signed((8'hb6))) * (7'h44));
  assign wire40 = $signed({(wire35[(3'h7):(3'h4)] ?
                          {((8'ha7) == wire35)} : wire37[(4'hf):(4'he)]),
                      ($unsigned((|wire38)) ?
                          (^~$unsigned(wire38)) : $signed((+wire37)))});
  module41 #() modinst85 (wire84, clk, wire35, wire38, wire39, wire34, wire40);
  assign wire86 = wire37[(3'h4):(1'h0)];
  module87 #() modinst111 (.wire88(wire34), .clk(clk), .wire91(wire84), .y(wire110), .wire90(wire40), .wire92(wire86), .wire89(wire38));
  always
    @(posedge clk) begin
      if ((&(|$unsigned({(wire84 ? wire36 : wire86), (&wire34)}))))
        begin
          if ((wire39[(5'h11):(2'h2)] ?
              $unsigned(((|(wire86 == wire38)) - ($unsigned(wire86) ?
                  wire84[(4'hc):(3'h4)] : (8'hb7)))) : (7'h41)))
            begin
              reg112 <= (+$signed(wire39[(3'h5):(1'h0)]));
            end
          else
            begin
              reg112 <= ($signed($unsigned($unsigned($signed(wire34)))) - $unsigned((+((wire37 ?
                      wire39 : wire110) ?
                  $unsigned(wire38) : $signed(wire40)))));
            end
          if (wire110[(1'h1):(1'h1)])
            begin
              reg113 <= (8'ha2);
              reg114 <= ((wire110 ?
                      (wire36[(2'h3):(1'h0)] + (8'hba)) : {($signed(reg112) ?
                              $signed((8'ha2)) : (8'hae)),
                          (^~(8'hba))}) ?
                  (8'h9d) : $unsigned($unsigned($signed(wire37))));
              reg115 <= wire36;
              reg116 <= wire86[(3'h6):(1'h1)];
            end
          else
            begin
              reg113 <= wire35;
              reg114 <= (($unsigned(wire40[(3'h4):(1'h1)]) ?
                  $signed(wire39) : wire110[(2'h2):(1'h0)]) <= (^~$signed($unsigned((reg115 ?
                  reg112 : reg113)))));
              reg115 <= $unsigned($unsigned(wire84));
              reg116 <= (8'hb9);
              reg117 <= (^(wire39 ?
                  {$signed({reg112, wire36}),
                      ((~^wire35) ?
                          $signed(wire38) : $signed(wire40))} : ({(wire39 >>> reg114),
                          wire35} ?
                      reg115 : wire86)));
            end
          reg118 <= {($unsigned(wire36[(3'h6):(2'h2)]) && (wire84[(4'h8):(3'h5)] != (~wire35[(5'h11):(5'h10)]))),
              (wire34 != ((^wire84[(4'ha):(4'h8)]) && ($unsigned(reg116) ?
                  (&reg113) : $signed((7'h44)))))};
        end
      else
        begin
          reg112 <= $signed({(($unsigned((8'ha3)) > $signed(wire40)) & {(reg112 ?
                      (8'hb5) : reg118),
                  $unsigned(reg112)}),
              $unsigned(wire86)});
          if ($unsigned(($signed(((wire39 ~^ wire110) ?
                  reg115[(1'h1):(1'h1)] : wire86[(4'h9):(3'h6)])) ?
              (wire34[(4'he):(4'ha)] > (~|(+wire86))) : (wire110[(1'h1):(1'h0)] ?
                  $unsigned($unsigned(reg117)) : wire84))))
            begin
              reg113 <= $signed(reg114);
              reg114 <= {(^wire36),
                  ($signed(reg112[(4'hd):(3'h6)]) ?
                      $signed($signed(wire36[(4'h9):(3'h5)])) : $unsigned((wire34 > (wire84 ?
                          wire84 : wire35))))};
              reg115 <= $unsigned(reg113[(5'h10):(4'he)]);
              reg116 <= (((reg114 ?
                      $signed((wire35 + wire38)) : $unsigned((~&wire84))) ^~ ({reg118[(3'h6):(3'h4)],
                          reg114[(1'h0):(1'h0)]} ?
                      $signed((reg112 ?
                          wire38 : wire110)) : ((reg112 ^~ reg112) ?
                          (reg114 ? (8'hb3) : reg118) : $signed(reg112)))) ?
                  $unsigned(wire36) : reg112[(4'ha):(3'h6)]);
              reg117 <= (reg116 ? wire35 : (^wire35));
            end
          else
            begin
              reg113 <= (wire110 >> reg116[(4'hf):(3'h4)]);
              reg114 <= wire39[(4'hd):(2'h2)];
              reg115 <= ($signed(wire36) ?
                  (~^wire35) : $unsigned(($signed((wire39 >= wire37)) >>> $signed(wire38[(5'h14):(1'h1)]))));
              reg116 <= $signed($unsigned((((^reg116) ?
                  reg118[(4'ha):(3'h5)] : (reg116 - reg115)) ^ (^(~&reg115)))));
              reg117 <= $unsigned(wire39[(3'h4):(2'h3)]);
            end
          reg118 <= ({($unsigned((wire38 ^ wire39)) ?
                  ((wire110 + wire86) ?
                      (reg114 && wire86) : (+wire40)) : ($unsigned(wire84) << (~^wire40))),
              (($unsigned(reg115) ?
                  wire40[(4'hc):(1'h0)] : {reg113}) * (wire84 ?
                  (wire110 <= wire86) : (reg112 ?
                      reg112 : (8'hbe))))} - ($signed($signed((reg115 >> reg115))) ?
              ((&{wire38, (8'hb1)}) >>> $signed((~reg112))) : reg117));
        end
      reg119 <= ((^~($signed((wire36 && reg115)) ?
          (reg112[(4'hf):(3'h6)] != wire34[(4'hd):(1'h1)]) : (^(^~wire84)))) > reg114[(2'h2):(2'h2)]);
      reg120 <= (~$unsigned(wire34[(4'hb):(3'h7)]));
    end
  assign wire121 = wire40;
  assign wire122 = (|$unsigned(reg113[(4'ha):(1'h1)]));
  module123 #() modinst162 (.wire124(wire36), .wire127(wire110), .clk(clk), .wire126(wire34), .y(wire161), .wire125(reg119));
  assign wire163 = ({wire37} >>> wire35[(4'hb):(4'ha)]);
  assign wire164 = (8'ha0);
  assign wire165 = $unsigned($unsigned(reg115[(2'h3):(1'h1)]));
  assign wire166 = (~^(+wire37));
  assign wire167 = (wire121[(3'h6):(1'h0)] && {wire35[(4'hb):(4'h8)],
                       {(8'ha3)}});
  module168 #() modinst192 (.y(wire191), .wire169(wire122), .wire170(reg117), .wire172(wire37), .clk(clk), .wire171(reg114));
  assign wire193 = wire164;
  assign wire194 = $signed(reg114);
endmodule

module module168
#(parameter param190 = (8'hb3))
(y, clk, wire172, wire171, wire170, wire169);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire172;
  input wire signed [(5'h13):(1'h0)] wire171;
  input wire [(3'h4):(1'h0)] wire170;
  input wire signed [(5'h15):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire188;
  wire signed [(4'hb):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire185;
  wire signed [(3'h7):(1'h0)] wire184;
  wire [(3'h4):(1'h0)] wire183;
  wire signed [(4'h9):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire173;
  reg [(4'hf):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg [(4'h8):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire178,
                 wire173,
                 reg181,
                 reg180,
                 reg179,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 (1'h0)};
  assign wire173 = ((+(wire172[(2'h3):(1'h1)] ^~ wire170[(2'h3):(2'h2)])) ?
                       $signed(((^~(wire171 << wire170)) >> {wire171[(5'h12):(1'h1)]})) : (8'hbe));
  always
    @(posedge clk) begin
      reg174 <= $signed(($signed($signed((wire172 ? wire170 : (8'ha0)))) ?
          wire171[(5'h13):(2'h3)] : ($unsigned(wire170[(1'h0):(1'h0)]) ?
              (wire170[(1'h1):(1'h1)] ?
                  {(8'ha2), (8'hb8)} : (wire172 & wire170)) : (wire169 ?
                  (-wire171) : $unsigned(wire171)))));
      reg175 <= wire169[(5'h12):(4'he)];
      reg176 <= ($unsigned($signed((&(wire172 ?
          wire171 : wire170)))) != ((|{wire170}) | (&wire169[(5'h11):(4'hf)])));
      reg177 <= $unsigned($unsigned($unsigned((~|(^reg176)))));
    end
  assign wire178 = $unsigned((reg174 ? (~wire170) : wire173));
  always
    @(posedge clk) begin
      reg179 <= wire171[(3'h5):(2'h3)];
      reg180 <= ({$signed({wire171[(4'h8):(3'h5)],
                  (wire171 ? wire172 : (8'hb5))})} ?
          reg177[(3'h6):(3'h4)] : wire169[(4'hb):(2'h3)]);
      reg181 <= $unsigned((wire171[(4'he):(4'hc)] ?
          wire170 : $signed($unsigned((reg176 ? wire171 : reg174)))));
    end
  assign wire182 = {((wire170 ?
                           ((~|reg174) ?
                               $unsigned(reg181) : (~&(8'ha9))) : (-wire170)) <= reg174[(4'hb):(1'h1)]),
                       (8'hba)};
  assign wire183 = reg179[(2'h2):(1'h0)];
  assign wire184 = (-$signed($signed(((+reg181) - (reg179 + reg180)))));
  assign wire185 = ((+(reg179[(3'h6):(2'h2)] >>> (-(reg180 >= wire182)))) ?
                       $signed($unsigned((^reg176[(2'h2):(1'h1)]))) : (+(($signed(reg179) ?
                           {reg181,
                               wire178} : wire173[(3'h5):(1'h1)]) != (~&(wire172 || reg180)))));
  assign wire186 = $unsigned($unsigned((reg181 ?
                       reg174 : $signed((wire172 ? wire169 : (8'ha5))))));
  assign wire187 = ($signed((~|{reg174[(4'hb):(3'h5)], reg177})) ?
                       ((wire171[(4'hc):(1'h0)] * (wire183 ?
                           $signed(wire169) : wire185)) >= (((~wire184) == $signed(reg181)) ^ ((wire169 ?
                           wire171 : reg174) <= $signed(reg180)))) : $signed($unsigned(reg177)));
  assign wire188 = $unsigned({(($signed(reg175) <= (wire182 <<< wire185)) ?
                           ((reg177 ? wire185 : wire182) ?
                               reg175[(4'hd):(4'h8)] : (^~(8'hb0))) : ((wire170 ?
                               wire172 : wire178) >= (+(8'haf)))),
                       wire182});
  assign wire189 = wire188;
endmodule

module module123  (y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire127;
  input wire [(3'h6):(1'h0)] wire126;
  input wire [(2'h3):(1'h0)] wire125;
  input wire [(3'h6):(1'h0)] wire124;
  wire signed [(4'he):(1'h0)] wire160;
  wire [(2'h3):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire158;
  wire [(2'h3):(1'h0)] wire157;
  wire signed [(4'ha):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire151;
  wire [(4'hd):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire signed [(4'he):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire [(3'h4):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire154,
                 wire151,
                 wire150,
                 wire140,
                 wire139,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg156,
                 reg153,
                 reg152,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire128 = ((wire124[(2'h2):(2'h2)] ? wire127 : wire124) || wire127);
  assign wire129 = (-wire124[(1'h0):(1'h0)]);
  assign wire130 = (($unsigned(($unsigned(wire124) == {wire129, wire124})) ?
                           wire128 : (((!(8'ha2)) && (wire127 & wire126)) + $signed($signed(wire124)))) ?
                       $signed((+((wire128 >>> wire126) >= $signed(wire129)))) : {(&((~&wire127) ?
                               (^~wire128) : (wire128 ? wire125 : wire129)))});
  assign wire131 = wire127;
  assign wire132 = (($signed((~^(wire129 ?
                       (8'ha3) : wire124))) >= (8'hb8)) >> $unsigned((~^({wire131,
                           wire129} ?
                       wire128 : $signed(wire124)))));
  assign wire133 = (($unsigned(wire129[(2'h2):(1'h1)]) & wire129[(3'h4):(1'h1)]) ?
                       $signed(((~&(wire127 ^~ wire124)) ?
                           $unsigned($signed(wire127)) : (wire127 ?
                               $signed(wire132) : $unsigned(wire126)))) : $signed((8'hb6)));
  assign wire134 = {(~|(&wire127))};
  assign wire135 = (~&((8'had) ^ wire131));
  always
    @(posedge clk) begin
      reg136 <= wire125;
      reg137 <= ($signed($unsigned((8'hac))) && (wire124[(2'h3):(2'h3)] ?
          $unsigned($signed({wire135})) : $signed((((8'hb8) && (8'hb0)) <= (wire128 ^ (8'hb8))))));
      reg138 <= ({{wire128},
          reg136[(5'h11):(4'ha)]} >>> $unsigned($signed(wire129[(2'h3):(1'h0)])));
    end
  assign wire139 = (+wire130);
  assign wire140 = $unsigned(((reg138 << $signed((wire135 ?
                           reg138 : wire130))) ?
                       (~(8'haf)) : wire135[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg141 <= ((+wire124) || ((-wire135[(4'hf):(4'hd)]) ?
          ($unsigned(reg138) ?
              ((wire124 ? wire132 : wire132) ?
                  $unsigned(wire140) : (^~reg136)) : {(wire135 ?
                      wire133 : wire129)}) : (reg137 ?
              (wire125[(2'h2):(1'h0)] == (wire127 * (7'h43))) : $signed((~&wire130)))));
      reg142 <= wire129;
      if ((((~&{wire126}) ?
          wire134[(1'h1):(1'h0)] : $signed(wire126[(3'h4):(1'h1)])) <<< reg142))
        begin
          if (($unsigned($signed(wire131[(4'hd):(3'h5)])) ?
              ($unsigned({((8'hb0) < reg138)}) ?
                  $unsigned(((reg136 ? reg138 : (7'h41)) ?
                      (-wire140) : $signed(wire130))) : ((+((8'hb4) >= wire133)) > ((wire130 ?
                          (8'h9c) : wire140) ?
                      wire129 : wire126))) : reg137))
            begin
              reg143 <= wire139[(1'h0):(1'h0)];
              reg144 <= $unsigned(({($signed(wire125) != (reg143 * (8'ha6)))} >> (8'hab)));
            end
          else
            begin
              reg143 <= wire132;
              reg144 <= wire128;
              reg145 <= wire126[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg143 <= wire127;
          reg144 <= {{wire132[(3'h5):(2'h2)]}, wire139};
          reg145 <= ((|$unsigned(wire135)) < $signed(reg142));
          reg146 <= $unsigned((^~($unsigned($signed(reg138)) ?
              {$unsigned(reg141)} : ((reg138 ? wire135 : wire127) ?
                  (wire134 ? reg145 : wire140) : (reg141 ?
                      reg142 : (7'h44))))));
          reg147 <= $signed(wire124[(3'h6):(2'h2)]);
        end
      reg148 <= (^(reg146 ^~ (wire140[(3'h7):(3'h5)] << reg141)));
      reg149 <= reg142[(2'h3):(2'h2)];
    end
  assign wire150 = wire127;
  assign wire151 = {$signed(((8'ha3) || (-((8'ha7) ? wire134 : (8'hbd)))))};
  always
    @(posedge clk) begin
      reg152 <= (&(((&$unsigned(reg137)) >= $unsigned((reg141 ?
          reg142 : reg138))) || reg137[(3'h6):(1'h0)]));
      reg153 <= (reg138 ~^ (-{({reg141} >> (reg137 * reg148))}));
    end
  assign wire154 = wire132;
  assign wire155 = (8'haf);
  always
    @(posedge clk) begin
      reg156 <= $signed(reg143[(1'h1):(1'h0)]);
    end
  assign wire157 = (^~($signed(wire128[(3'h7):(3'h4)]) ?
                       $signed(wire133) : {reg142, reg138}));
  assign wire158 = {$unsigned({$unsigned(((8'h9e) || wire140))})};
  assign wire159 = (~&{$unsigned(wire131[(4'h8):(4'h8)]), wire133});
  assign wire160 = $unsigned((~|wire154));
endmodule

module module87
#(parameter param108 = (~((+(((8'hb0) ^~ (8'hac)) ^~ (!(8'ha8)))) ? (+(((8'hba) ? (8'ha4) : (7'h43)) ? ((8'ha6) ? (8'hab) : (7'h43)) : (-(7'h43)))) : ((~(8'haf)) - (((8'haf) - (8'hbc)) ^~ ((8'hb8) ? (8'hab) : (8'hb3)))))), 
parameter param109 = (param108 || {param108, param108}))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire92;
  input wire signed [(5'h11):(1'h0)] wire91;
  input wire [(5'h13):(1'h0)] wire90;
  input wire signed [(3'h7):(1'h0)] wire89;
  input wire signed [(4'he):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  assign y = {wire107,
                 wire103,
                 wire101,
                 wire100,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg106,
                 reg105,
                 reg104,
                 reg102,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire93 = {wire88};
  assign wire94 = $unsigned($signed((wire92[(2'h3):(2'h2)] && (~&wire91[(1'h1):(1'h0)]))));
  assign wire95 = $unsigned($signed((7'h41)));
  assign wire96 = $unsigned(wire93);
  assign wire97 = (|(!$unsigned(($signed(wire92) ?
                      $unsigned(wire92) : (~^wire93)))));
  always
    @(posedge clk) begin
      reg98 <= wire96;
      reg99 <= ($signed(($signed((wire88 ? wire96 : reg98)) ?
              (((8'hae) ?
                  wire88 : reg98) >= wire92[(4'h9):(2'h2)]) : {$unsigned(wire97),
                  ((7'h44) ? wire88 : wire94)})) ?
          (^~$signed(wire94[(4'hd):(4'h9)])) : (!{wire92,
              ($unsigned(wire91) <= (wire94 ? wire94 : wire92))}));
    end
  assign wire100 = $signed((~^wire88[(3'h7):(3'h4)]));
  assign wire101 = $signed((~|{wire96}));
  always
    @(posedge clk) begin
      reg102 <= {$unsigned($signed($signed({wire97})))};
    end
  assign wire103 = $unsigned(wire88[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg104 <= (|$unsigned({wire90,
          ((wire101 ? wire103 : wire94) ? $unsigned(reg98) : (8'hb1))}));
      reg105 <= wire89[(3'h4):(1'h1)];
      reg106 <= ((~|($unsigned((!wire97)) <= ((wire101 ? wire101 : wire101) ?
              {reg99} : (wire92 >> wire92)))) ?
          (+$signed(($signed(wire103) < $unsigned(wire91)))) : (wire101 ?
              wire94[(1'h0):(1'h0)] : wire95));
    end
  assign wire107 = ((^~$unsigned(($signed(wire88) ?
                       (wire89 >= wire91) : (~|wire93)))) != wire96);
endmodule

module module41
#(parameter param83 = ((|(-(+((8'hb3) > (8'ha9))))) < (~&(((^~(8'hb5)) < (^(8'hbd))) ? ({(8'hb7), (8'ha5)} ? {(8'hb9)} : (~^(8'hb6))) : (((8'ha8) >= (8'hba)) ? ((8'ha8) ? (8'ha1) : (7'h40)) : (-(7'h43)))))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  input wire signed [(3'h6):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire43;
  input wire [(3'h7):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg82,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 (1'h0)};
  assign wire47 = $signed(wire42[(3'h4):(1'h1)]);
  assign wire48 = wire46[(1'h1):(1'h1)];
  assign wire49 = {$signed(($signed((~wire44)) ~^ $signed({wire44, wire45}))),
                      wire46[(1'h0):(1'h0)]};
  assign wire50 = (8'hba);
  assign wire51 = wire47;
  assign wire52 = (+wire47);
  always
    @(posedge clk) begin
      reg53 <= ((($signed(((8'hbc) || wire47)) ?
              (~^(~|wire51)) : wire46) << {(~|wire46[(1'h1):(1'h1)])}) ?
          ($unsigned((~|$unsigned(wire45))) >> ($unsigned({wire45, (8'ha7)}) ?
              {$signed(wire50)} : {$signed(wire52)})) : wire46);
      if ($unsigned({$unsigned((wire52[(2'h3):(2'h2)] ~^ (wire45 < wire47)))}))
        begin
          if ($signed(wire44))
            begin
              reg54 <= (!$unsigned((8'ha1)));
              reg55 <= $signed({{$signed((~wire47)), wire51[(1'h0):(1'h0)]},
                  wire50});
              reg56 <= (wire42 & $signed((($unsigned(wire51) ?
                      $unsigned(wire45) : wire49) ?
                  wire51 : $signed($unsigned(wire50)))));
              reg57 <= (wire48 << reg56[(3'h4):(1'h0)]);
            end
          else
            begin
              reg54 <= (-((8'hbe) ?
                  (|$unsigned($unsigned((8'hac)))) : $signed({(wire49 - wire43)})));
            end
          reg58 <= (((|$signed({wire43, wire49})) ?
                  wire52[(1'h1):(1'h1)] : wire47[(2'h2):(1'h0)]) ?
              $unsigned((8'haa)) : wire49);
          if ((~&wire43))
            begin
              reg59 <= (((^~$signed((wire44 >= wire42))) < $unsigned(reg53)) ?
                  ($signed($signed(((7'h42) ?
                      reg57 : wire43))) || ($signed((7'h41)) + $signed(wire44[(3'h6):(1'h0)]))) : (|(^~$signed((reg57 << reg54)))));
              reg60 <= {((-wire44) ?
                      {$signed($unsigned(reg54))} : {$signed(((8'hba) ?
                              reg53 : wire42))})};
              reg61 <= (wire49 ^ ((wire46 ?
                      (!$signed((8'h9c))) : wire42[(2'h2):(1'h1)]) ?
                  wire52 : $signed(reg53)));
            end
          else
            begin
              reg59 <= (^({$signed((wire49 && wire49)),
                  ({wire44,
                      reg57} | (wire42 && wire48))} <= $signed($signed((&reg60)))));
              reg60 <= wire42[(2'h2):(1'h1)];
            end
          if (wire49)
            begin
              reg62 <= $unsigned(reg59[(2'h3):(2'h3)]);
              reg63 <= wire49[(3'h4):(2'h3)];
            end
          else
            begin
              reg62 <= $signed({wire45, {(8'hb2)}});
              reg63 <= $signed($unsigned(((wire42[(1'h0):(1'h0)] || (^reg59)) | (^~$signed(wire44)))));
            end
        end
      else
        begin
          if ((reg56[(1'h0):(1'h0)] ?
              reg61[(5'h12):(4'hf)] : $signed(wire45[(3'h4):(1'h0)])))
            begin
              reg54 <= ($signed({wire44[(2'h3):(2'h3)]}) ?
                  $unsigned($unsigned(((wire51 ?
                      wire46 : reg61) != (8'had)))) : wire44);
              reg55 <= ($unsigned(reg59[(3'h4):(1'h0)]) & reg60);
              reg56 <= reg61[(3'h7):(2'h2)];
              reg57 <= $unsigned({{reg57[(3'h7):(2'h3)],
                      (~&wire47[(4'h8):(1'h1)])},
                  reg58});
            end
          else
            begin
              reg54 <= $signed({({(wire45 - wire45)} ?
                      reg61[(4'hc):(3'h4)] : wire52)});
            end
          reg58 <= (~^{wire44, {(^wire50)}});
          reg59 <= {(|(8'hb2))};
          reg60 <= (wire49[(3'h7):(3'h7)] ~^ $unsigned((wire52 ?
              (-((8'hac) || reg58)) : ($unsigned(wire43) >> $unsigned(reg58)))));
          reg61 <= $unsigned(reg56);
        end
      if ((8'h9f))
        begin
          if ((^(&wire49[(2'h2):(1'h1)])))
            begin
              reg64 <= ({(reg55[(4'h9):(3'h4)] | $unsigned($signed(wire48)))} ?
                  $signed(wire50) : reg61);
            end
          else
            begin
              reg64 <= $signed(reg57[(2'h3):(1'h1)]);
            end
          if ((~^wire46))
            begin
              reg65 <= reg56;
              reg66 <= $unsigned($unsigned($unsigned($unsigned($unsigned(wire46)))));
              reg67 <= $signed(($signed(((&reg58) - ((8'had) ?
                      reg56 : reg65))) ?
                  reg54 : (((^~reg64) < (reg56 && wire46)) >= $signed((wire48 ?
                      reg60 : wire52)))));
            end
          else
            begin
              reg65 <= (-(~(!wire50[(1'h0):(1'h0)])));
              reg66 <= ($signed(reg61) <= $signed(reg63[(1'h1):(1'h0)]));
              reg67 <= reg57;
              reg68 <= (|(+{((~^(8'ha1)) ?
                      ((8'ha2) ? wire51 : reg61) : reg53[(1'h1):(1'h1)]),
                  reg61[(2'h2):(2'h2)]}));
              reg69 <= wire46;
            end
          reg70 <= (+($signed((&(reg58 + wire46))) + wire52[(3'h4):(2'h3)]));
          reg71 <= {((((~wire50) ?
                  wire48 : (wire42 ?
                      (8'hb3) : wire51)) != wire50[(2'h3):(1'h1)]) ~^ $signed(wire49[(4'ha):(1'h1)]))};
          reg72 <= $signed(wire42);
        end
      else
        begin
          reg64 <= $signed(reg59[(1'h1):(1'h0)]);
          reg65 <= (-reg70);
          reg66 <= ((((wire50 >= $signed((8'hb7))) ?
                      (+wire42) : ((reg64 - reg54) || reg68)) ?
                  reg56 : reg63) ?
              reg55[(1'h0):(1'h0)] : ((~&$signed(reg64)) + wire51[(2'h3):(2'h2)]));
          if ((wire51 <= (wire44 - (reg53 ~^ {((8'hbe) ? (8'hbd) : reg70)}))))
            begin
              reg67 <= reg71;
              reg68 <= ($signed(({(~&reg55), (^wire43)} >> $signed((reg70 ?
                  wire42 : reg68)))) & ((~wire44) ?
                  $unsigned(reg71[(4'hc):(1'h0)]) : ((^~(reg65 ?
                          wire48 : reg72)) ?
                      ((reg54 || reg70) ~^ (^~wire51)) : wire50[(2'h3):(2'h2)])));
              reg69 <= (~&$unsigned((reg71[(4'hd):(3'h5)] ?
                  (reg67 ? reg62 : $signed(reg58)) : (!$unsigned((8'haf))))));
            end
          else
            begin
              reg67 <= wire46[(1'h1):(1'h0)];
            end
          reg70 <= {$unsigned(wire43)};
        end
    end
  assign wire73 = $unsigned((reg58 << $unsigned((7'h42))));
  assign wire74 = $signed(reg69);
  assign wire75 = ((~reg70[(1'h0):(1'h0)]) ?
                      ((($signed(wire42) ? reg61 : $signed(reg53)) ?
                              ({reg58} ~^ (~(8'hba))) : $unsigned({reg70,
                                  wire45})) ?
                          $signed($signed((reg57 ^~ wire74))) : ((reg57[(2'h3):(2'h3)] ?
                                  (reg66 > reg64) : reg65) ?
                              wire44[(2'h2):(1'h1)] : (wire42[(3'h7):(3'h5)] + $unsigned(reg55)))) : ($unsigned((((8'hbd) << reg55) >>> ((7'h43) <<< reg55))) ~^ (&$unsigned((reg61 ?
                          (8'hbc) : wire45)))));
  always
    @(posedge clk) begin
      reg76 <= {$unsigned((($signed((8'hab)) != (wire48 <<< (8'h9c))) ^ reg69[(1'h0):(1'h0)])),
          $unsigned(reg69)};
      reg77 <= ({(+{reg65[(1'h0):(1'h0)], $unsigned((8'ha3))}),
          $unsigned(reg71[(4'h9):(3'h5)])} + $signed((reg69[(2'h3):(2'h2)] * ($unsigned((8'hae)) ?
          {(7'h41), reg69} : $unsigned(wire73)))));
      reg78 <= reg58;
      reg79 <= $unsigned($unsigned($unsigned(wire75)));
    end
  assign wire80 = $unsigned((reg55 == wire50));
  assign wire81 = $signed($unsigned(($signed((wire73 * reg76)) ^ $signed((reg58 - reg63)))));
  always
    @(posedge clk) begin
      reg82 <= ((~&$unsigned((-$signed(reg59)))) ^~ reg71[(3'h4):(1'h0)]);
    end
endmodule
