module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire192;
  wire [(4'ha):(1'h0)] wire189;
  wire signed [(2'h3):(1'h0)] wire187;
  wire signed [(4'hb):(1'h0)] wire186;
  wire [(4'hd):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire183;
  wire [(5'h12):(1'h0)] wire182;
  wire [(5'h12):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire164;
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg179 = (1'h0);
  reg [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg167 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  assign y = {wire192,
                 wire189,
                 wire187,
                 wire186,
                 wire185,
                 wire183,
                 wire182,
                 wire172,
                 wire68,
                 wire70,
                 wire71,
                 wire72,
                 wire164,
                 reg191,
                 reg190,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 (1'h0)};
  module4 #() modinst69 (.clk(clk), .wire8(wire1), .wire7(wire2), .y(wire68), .wire6(wire3), .wire5(wire0));
  assign wire70 = $unsigned((8'hb8));
  assign wire71 = wire68;
  assign wire72 = $unsigned($unsigned((&wire0)));
  module73 #() modinst165 (wire164, clk, wire0, wire70, wire3, wire2, wire68);
  always
    @(posedge clk) begin
      if ($signed({wire3, wire0}))
        begin
          reg166 <= (({$signed((wire2 ? wire71 : (8'hb5))),
              $signed(wire71[(2'h3):(1'h0)])} && $unsigned(wire70[(3'h6):(2'h2)])) ^ (wire70 != (7'h41)));
          reg167 <= $signed($signed((wire68[(4'h8):(3'h7)] != ((^~wire1) ?
              (~^wire164) : $signed(wire2)))));
          reg168 <= reg167[(3'h4):(3'h4)];
          reg169 <= $signed((~&(reg166[(4'hd):(1'h1)] ?
              wire2[(4'hc):(4'h8)] : (wire0[(3'h5):(3'h4)] >>> $signed((8'h9c))))));
          reg170 <= $signed($signed((^~reg167[(1'h1):(1'h0)])));
        end
      else
        begin
          reg166 <= reg168[(3'h7):(3'h7)];
          reg167 <= reg170[(1'h0):(1'h0)];
          if ({($signed(reg168) ?
                  ((+wire1) >> ($unsigned(reg170) ?
                      (wire0 ^~ wire3) : $signed((8'hb1)))) : $unsigned($signed(reg169))),
              $unsigned({(~|wire72)})})
            begin
              reg168 <= ((!({$signed(reg166),
                      wire68[(1'h0):(1'h0)]} >= (~^(wire70 == wire164)))) ?
                  reg167 : ($unsigned(($signed(wire70) | (reg167 ?
                      wire2 : reg167))) << wire2[(5'h13):(4'hb)]));
              reg169 <= wire70[(4'hc):(4'h8)];
            end
          else
            begin
              reg168 <= $signed($signed((~&($unsigned(wire71) < (~&reg168)))));
            end
          reg170 <= {$signed((wire1[(1'h1):(1'h0)] >> (^~wire70[(1'h1):(1'h0)]))),
              ($unsigned((!$unsigned((8'hb3)))) ?
                  wire1[(3'h6):(3'h4)] : ($signed(wire68) - reg168[(3'h4):(2'h3)]))};
          reg171 <= $unsigned((reg169[(1'h1):(1'h1)] <= wire72));
        end
    end
  module73 #() modinst173 (wire172, clk, reg169, wire0, wire164, reg166, reg167);
  always
    @(posedge clk) begin
      reg174 <= wire1;
      reg175 <= wire172;
      if ($signed(reg166))
        begin
          reg176 <= $unsigned($signed(reg170));
          reg177 <= ((^~wire2[(4'hd):(4'h8)]) == (reg169[(3'h4):(2'h3)] >= $signed($signed(wire0[(4'hd):(1'h1)]))));
        end
      else
        begin
          reg176 <= {wire0[(4'hc):(2'h3)],
              {($unsigned((wire172 ? wire0 : wire1)) ?
                      {(~reg174),
                          wire164[(3'h6):(3'h5)]} : (reg176[(3'h7):(3'h4)] ?
                          (wire68 ~^ reg169) : wire1[(3'h5):(3'h4)])),
                  (wire71[(2'h2):(2'h2)] + {((8'hb9) ^~ (8'h9c))})}};
          reg177 <= wire2;
          reg178 <= wire3;
          reg179 <= $unsigned($signed(reg169[(4'ha):(3'h6)]));
          if (wire0)
            begin
              reg180 <= wire3[(5'h11):(3'h4)];
            end
          else
            begin
              reg180 <= {$unsigned(reg174[(4'ha):(4'h8)])};
            end
        end
      reg181 <= wire72[(1'h0):(1'h0)];
    end
  assign wire182 = $signed((~|(~$unsigned(reg171))));
  module117 #() modinst184 (wire183, clk, wire71, wire164, reg175, reg167);
  assign wire185 = (wire183 ?
                       (wire0 >>> {reg169[(4'h9):(2'h2)],
                           reg177[(3'h4):(3'h4)]}) : {(+$signed({reg177,
                               reg170})),
                           $signed((~|{reg166}))});
  assign wire186 = wire70;
  module80 #() modinst188 (wire187, clk, reg168, reg171, reg169, reg179);
  assign wire189 = (~^wire3);
  always
    @(posedge clk) begin
      reg190 <= ((~|$signed(wire68[(4'hd):(1'h1)])) ?
          ((^$signed((8'hb9))) <= reg168[(1'h1):(1'h1)]) : (reg169[(4'h9):(4'h8)] - ({{wire70,
                  wire182}} >>> ((^~reg167) ?
              wire186[(3'h4):(3'h4)] : reg169))));
      reg191 <= wire1[(2'h3):(1'h0)];
    end
  assign wire192 = $signed($signed((reg178 ? $unsigned(wire183) : reg190)));
endmodule

module module73
#(parameter param162 = (((^(((7'h40) ? (7'h40) : (8'h9f)) ? ((7'h41) * (7'h43)) : (+(8'hba)))) > {(~&((8'h9d) ? (8'ha6) : (7'h40))), {(~&(8'ha5)), ((8'hb0) ? (8'hbe) : (8'hbb))}}) << (((((8'hb0) ? (8'ha8) : (8'h9c)) ? (-(8'hb0)) : ((8'hb1) ? (8'ha3) : (8'h9d))) ^ ((~^(8'h9e)) + {(8'ha2)})) ? (+(((8'hb6) | (8'had)) * (^~(8'hb6)))) : (&(((8'h9f) ? (8'hbf) : (8'had)) <<< ((7'h43) ? (8'hac) : (8'h9e)))))), 
parameter param163 = ((|param162) ? (((-{param162, param162}) * param162) & (+(+param162))) : (-(^((param162 ? param162 : param162) ? (param162 ^ param162) : param162)))))
(y, clk, wire78, wire77, wire76, wire75, wire74);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire78;
  input wire [(4'he):(1'h0)] wire77;
  input wire signed [(3'h7):(1'h0)] wire76;
  input wire [(4'hc):(1'h0)] wire75;
  input wire [(5'h10):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire160;
  wire signed [(5'h10):(1'h0)] wire159;
  wire [(3'h6):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire156;
  wire signed [(4'hb):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire104;
  wire [(3'h5):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire79;
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire104,
                 wire103,
                 wire102,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire79,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire79 = $unsigned((wire75 & $signed({wire75,
                      wire78[(4'h9):(3'h5)]})));
  module80 #() modinst94 (.wire82(wire74), .wire83(wire75), .clk(clk), .wire84(wire79), .wire81(wire77), .y(wire93));
  assign wire95 = (wire79[(3'h4):(1'h1)] + (!(~wire75)));
  assign wire96 = {$signed(wire79)};
  assign wire97 = $unsigned((($signed({wire75, wire93}) && (wire95 ?
                          $unsigned(wire74) : (8'haa))) ?
                      $unsigned(({(8'hb8)} ?
                          $signed(wire79) : $signed(wire77))) : $signed(((+wire79) << (wire77 && wire96)))));
  assign wire98 = ($signed((|wire77)) ? (8'hb7) : (~^wire78));
  always
    @(posedge clk) begin
      reg99 <= (~(7'h40));
      reg100 <= ($signed($unsigned(wire76)) ?
          $signed((wire75[(3'h5):(2'h2)] & (wire79 | (wire93 ?
              wire97 : wire75)))) : (8'hbc));
      reg101 <= wire96;
    end
  assign wire102 = (8'haf);
  assign wire103 = {wire98};
  assign wire104 = $unsigned(reg100[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      if ({(($unsigned($unsigned(wire76)) ?
                  (!(wire97 ? wire75 : (8'hab))) : ({reg99, wire93} ?
                      wire79[(2'h3):(1'h1)] : wire95[(3'h5):(1'h0)])) ?
              wire77 : wire102[(4'h9):(1'h1)])})
        begin
          if (wire76[(1'h0):(1'h0)])
            begin
              reg105 <= $signed($signed($signed(wire96)));
              reg106 <= reg105[(3'h7):(2'h2)];
            end
          else
            begin
              reg105 <= ((^wire76) <<< reg106[(1'h1):(1'h0)]);
              reg106 <= (~wire74);
              reg107 <= (|(8'hbf));
              reg108 <= ({$signed(wire93),
                      $signed((wire74[(2'h3):(2'h2)] ? {reg101} : (!wire98)))} ?
                  wire98[(3'h5):(2'h2)] : {(^~wire103[(2'h3):(2'h3)]),
                      wire77[(4'he):(4'hb)]});
              reg109 <= reg100;
            end
          if ((wire97[(4'ha):(4'h9)] ?
              ($unsigned(wire76[(3'h5):(1'h1)]) + (reg109[(3'h4):(1'h1)] <= $unsigned(wire104))) : wire98))
            begin
              reg110 <= wire93[(1'h1):(1'h1)];
              reg111 <= (!((wire103 ?
                      (~|(reg108 + reg109)) : ((reg99 >>> wire74) <<< (!(8'h9f)))) ?
                  reg109[(4'hf):(2'h2)] : {(&wire104[(3'h4):(1'h1)])}));
              reg112 <= ($signed($unsigned(wire93[(3'h4):(3'h4)])) >= wire77);
            end
          else
            begin
              reg110 <= $unsigned($signed(wire95[(3'h4):(2'h3)]));
              reg111 <= (reg112[(1'h1):(1'h1)] <= {((~((8'had) + (8'h9f))) < (!(wire96 ?
                      reg111 : (8'hbd))))});
            end
          reg113 <= reg110[(2'h2):(1'h1)];
          reg114 <= {{{wire79, wire103}}};
        end
      else
        begin
          reg105 <= wire75;
          if (wire97[(4'hb):(3'h4)])
            begin
              reg106 <= reg111[(1'h0):(1'h0)];
              reg107 <= ((|wire97[(3'h4):(1'h0)]) <= (+(!reg105[(4'h8):(3'h4)])));
              reg108 <= $signed((($unsigned((!(8'hbc))) ?
                      (~|$unsigned(reg101)) : (^{wire96, reg112})) ?
                  ((~(wire95 ^ (8'hbf))) ?
                      reg107[(2'h2):(2'h2)] : $signed({(8'hb1),
                          wire93})) : (wire77 <<< (^~(+reg111)))));
              reg109 <= $unsigned($unsigned(reg100));
            end
          else
            begin
              reg106 <= ((&(wire102 && reg101[(4'h9):(1'h1)])) ?
                  reg99[(3'h5):(3'h4)] : $unsigned(reg100));
              reg107 <= {reg113, reg101};
              reg108 <= $unsigned((wire75[(4'h8):(3'h5)] ?
                  reg106 : (-$signed(wire76))));
            end
        end
      reg115 <= ({(~reg114), (^(8'hbf))} ?
          {wire98} : (~&reg105[(4'h8):(3'h4)]));
      reg116 <= ($unsigned(wire74) | $unsigned({($unsigned(wire104) >> $signed(wire102)),
          $signed(wire102)}));
    end
  module117 #() modinst154 (.wire118(reg112), .wire120(wire102), .clk(clk), .y(wire153), .wire119(reg109), .wire121(wire96));
  assign wire155 = reg114;
  assign wire156 = wire104[(4'hb):(3'h6)];
  assign wire157 = $signed(($signed($signed(((8'hac) ?
                       reg115 : reg99))) <= $signed($signed(wire155))));
  assign wire158 = (^~($signed((~|(^~wire77))) ?
                       reg107 : (($signed(reg111) ?
                               (8'h9f) : (reg112 ? wire75 : reg108)) ?
                           reg109[(1'h0):(1'h0)] : ((~wire79) ?
                               (reg116 + wire77) : $signed(reg100)))));
  assign wire159 = (8'hb3);
  assign wire160 = $unsigned($signed($signed($unsigned({reg106, reg116}))));
  assign wire161 = (8'ha3);
endmodule

module module4
#(parameter param66 = {({(((8'h9d) == (8'ha1)) ? ((8'ha5) ? (8'h9c) : (8'h9e)) : {(8'ha7), (8'ha2)})} >> (+((&(8'hac)) ? (~(8'ha3)) : ((8'hb9) ? (8'hb5) : (8'hbc)))))}, 
parameter param67 = (7'h43))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire25,
                 wire22,
                 wire10,
                 wire9,
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
                 reg24,
                 reg23,
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
                 (1'h0)};
  assign wire9 = ((wire5 ? (+wire8) : wire8) ^ {(-wire7[(4'hc):(4'h8)]),
                     (~|(&(!wire6)))});
  assign wire10 = $unsigned((wire9[(2'h2):(1'h1)] ~^ {wire7[(4'ha):(2'h2)],
                      ($signed(wire9) ? $unsigned(wire7) : wire8)}));
  always
    @(posedge clk) begin
      reg11 <= wire7;
      reg12 <= $signed(((-wire7[(5'h13):(4'ha)]) | wire7[(4'hd):(4'hb)]));
      if ((^~$unsigned($signed({$signed(wire6), $signed(wire10)}))))
        begin
          reg13 <= wire9[(2'h3):(2'h3)];
          if (reg11)
            begin
              reg14 <= ((reg12 ? wire5 : wire5[(4'h8):(3'h4)]) ?
                  reg12 : (wire5 ? reg11 : wire10[(2'h3):(2'h2)]));
            end
          else
            begin
              reg14 <= wire6;
              reg15 <= ($signed((wire7 ?
                  reg14[(4'h9):(1'h0)] : ((reg11 & wire5) ?
                      (-wire10) : reg11))) != $unsigned(reg14));
            end
          reg16 <= (wire8 ? (8'ha4) : {$signed(reg13)});
          if (({reg14[(4'h9):(3'h6)], $signed((~&{wire9}))} >> ($signed(reg14) ?
              wire5[(3'h6):(3'h4)] : (~|wire9[(2'h2):(1'h1)]))))
            begin
              reg17 <= (-reg13);
              reg18 <= reg11[(4'hb):(4'ha)];
              reg19 <= reg14[(1'h0):(1'h0)];
              reg20 <= reg17[(3'h4):(3'h4)];
              reg21 <= {{(~(8'ha0)),
                      ({$unsigned(reg14), reg18} ?
                          {(wire10 > reg14)} : {reg17[(3'h5):(3'h5)],
                              (~reg13)})}};
            end
          else
            begin
              reg17 <= reg17;
              reg18 <= $unsigned(wire10);
              reg19 <= $signed((((+(~(8'hb6))) ^~ $unsigned({reg11})) >>> reg14));
              reg20 <= $unsigned((8'ha5));
              reg21 <= {$unsigned((8'hb4))};
            end
        end
      else
        begin
          reg13 <= $signed(wire8);
          reg14 <= reg20;
        end
    end
  assign wire22 = reg19[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg23 <= (wire9[(2'h2):(1'h0)] >= $signed({wire10[(3'h6):(3'h5)],
          reg20[(1'h0):(1'h0)]}));
      reg24 <= {(^$unsigned((!((8'h9f) ? reg14 : reg11))))};
    end
  assign wire25 = (-$signed(wire22));
  module26 #() modinst40 (wire39, clk, wire8, reg21, wire22, reg18);
  assign wire41 = $signed(($signed(reg12) & reg21));
  assign wire42 = $unsigned(((~wire6[(1'h1):(1'h1)]) != (~&$signed(wire6[(3'h6):(1'h0)]))));
  assign wire43 = wire10;
  assign wire44 = (((wire9 && wire10) ?
                      (reg11[(1'h1):(1'h1)] - reg20) : $unsigned($signed($signed(wire42)))) <= ({(8'ha5),
                      $signed($signed(wire8))} <<< reg15[(3'h6):(2'h3)]));
  assign wire45 = $unsigned($signed($signed((|reg19[(4'hb):(3'h6)]))));
  assign wire46 = (8'hbb);
  assign wire47 = (reg17[(3'h7):(2'h3)] ? reg13[(1'h1):(1'h0)] : (~&wire9));
  assign wire48 = (^(($signed($signed(wire25)) <= reg19[(3'h4):(3'h4)]) << ($unsigned((^reg13)) & $unsigned($signed(wire42)))));
  assign wire49 = wire47[(4'h8):(3'h7)];
  assign wire50 = (!$unsigned((&((wire46 || wire25) + (reg19 >>> wire41)))));
  assign wire51 = ($signed($signed($unsigned((wire25 ^~ reg20)))) ?
                      reg13 : (|wire8));
  assign wire52 = wire50;
  always
    @(posedge clk) begin
      reg53 <= {(wire5[(1'h1):(1'h1)] ?
              $signed(((!reg13) ?
                  wire10[(3'h6):(2'h3)] : wire10[(3'h7):(2'h3)])) : ($unsigned((^~(8'hb6))) <<< (wire45 ?
                  (reg16 & reg23) : wire7[(3'h7):(1'h0)]))),
          {(((^~reg20) >> (reg13 <= (8'had))) <<< (~|$signed(reg16))),
              wire8[(4'hc):(1'h0)]}};
      if (((({(reg20 ? reg53 : (8'ha3)), (~&(8'ha4))} ?
          $unsigned(reg23) : wire22[(2'h3):(2'h3)]) | $signed({wire44[(3'h4):(2'h2)]})) || $signed($signed({$unsigned((7'h40))}))))
        begin
          reg54 <= {($unsigned((+reg20[(1'h1):(1'h1)])) || reg24), wire50};
          reg55 <= wire5[(2'h2):(1'h0)];
          if (wire10)
            begin
              reg56 <= ($unsigned(wire42[(1'h1):(1'h1)]) >= ((reg15[(1'h0):(1'h0)] ?
                      (~&reg12[(3'h5):(1'h0)]) : (wire52 ?
                          (+reg20) : (wire8 < reg17))) ?
                  $signed(((~^wire43) ?
                      {wire48} : (~&wire42))) : ($unsigned($unsigned(reg18)) ?
                      $signed($unsigned(wire48)) : $signed($signed(reg23)))));
              reg57 <= (&(($signed(reg20) << (&$signed((8'hab)))) < $unsigned(($unsigned(reg18) ?
                  {wire22} : (wire47 <= wire52)))));
              reg58 <= {reg24[(1'h1):(1'h0)],
                  (wire6[(4'h9):(3'h7)] ?
                      (wire48[(3'h4):(1'h1)] ?
                          {wire43} : (wire44[(1'h0):(1'h0)] ^~ wire45)) : ($signed($signed(reg18)) ?
                          ((reg23 ?
                              reg13 : reg15) ^ (reg11 <<< wire48)) : ((reg19 ?
                              reg24 : wire6) + reg20[(1'h1):(1'h1)])))};
              reg59 <= (^(^(((reg21 >>> wire25) || {reg12}) * ((wire7 > reg16) < $signed(wire43)))));
            end
          else
            begin
              reg56 <= (!reg17[(3'h5):(3'h5)]);
              reg57 <= wire7[(3'h6):(2'h3)];
              reg58 <= (((reg18[(3'h6):(2'h2)] ?
                          $signed((&wire46)) : $signed(reg19)) ?
                      ($unsigned(wire45) && wire43) : $signed($signed(wire47[(4'h9):(2'h3)]))) ?
                  (reg21 + reg12) : (~|(reg19[(3'h4):(1'h0)] ?
                      wire51 : (wire47[(4'h8):(1'h0)] | wire41[(1'h0):(1'h0)]))));
              reg59 <= ($unsigned((((~^reg18) ?
                          (wire49 ? (8'hb6) : (7'h41)) : (~^(8'hb7))) ?
                      {wire46[(4'hd):(4'h8)]} : (-reg13[(2'h3):(2'h2)]))) ?
                  reg16[(4'hf):(1'h0)] : ($signed(($unsigned((8'ha7)) ^ (|wire5))) * reg17));
              reg60 <= $unsigned((~|{(wire52[(1'h1):(1'h0)] ?
                      {reg55, wire10} : wire45[(5'h11):(4'hf)]),
                  $signed((reg55 ? wire46 : reg24))}));
            end
          reg61 <= {$signed((^~((wire47 == reg21) ?
                  $unsigned(wire45) : reg14[(3'h7):(3'h6)])))};
          reg62 <= {({($signed(reg23) << (reg20 > wire6))} ?
                  wire48 : $signed(((8'hb8) * (+(8'hb7)))))};
        end
      else
        begin
          reg54 <= ((!(((wire22 || reg13) >>> (^~wire5)) ?
              (|{wire46, (7'h42)}) : $unsigned((reg21 ?
                  wire48 : reg20)))) - {($unsigned(((8'hb5) - reg18)) ?
                  (~^{reg16, (8'hb3)}) : $unsigned((+reg13)))});
          reg55 <= ((($unsigned($signed(reg21)) ?
                  (reg11 >= $signed(reg61)) : ((reg21 >> wire47) << (~wire8))) ?
              reg13[(3'h5):(3'h4)] : {$signed(wire50)}) && $signed(reg23));
          reg56 <= (|$unsigned((~(reg13 >= {wire6, reg56}))));
        end
      reg63 <= reg24;
      reg64 <= $signed((wire43[(2'h3):(1'h0)] ?
          $unsigned($signed(wire22)) : (8'ha3)));
      reg65 <= $unsigned($unsigned({((8'ha8) ?
              reg59[(3'h6):(3'h6)] : $signed(wire9))}));
    end
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire signed [(2'h3):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  assign y = {wire38,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire31 = $signed(wire27[(2'h2):(1'h1)]);
  assign wire32 = $signed((wire30[(4'hc):(2'h2)] == (~wire31)));
  assign wire33 = wire31;
  assign wire34 = $signed($unsigned($signed($signed((8'hbf)))));
  always
    @(posedge clk) begin
      reg35 <= ($signed((-wire33)) ^ $unsigned({wire30[(4'h8):(4'h8)]}));
      reg36 <= {wire28};
      reg37 <= wire27[(2'h3):(2'h2)];
    end
  assign wire38 = ((wire32[(3'h4):(3'h4)] ?
                          {$unsigned(reg36[(4'he):(1'h1)])} : (|wire34[(5'h12):(5'h10)])) ?
                      (wire28 != $signed($signed($signed(wire29)))) : ((((wire31 & wire33) + ((8'hb5) ?
                          wire31 : wire28)) <<< (|$unsigned(wire34))) || wire34));
endmodule

module module117
#(parameter param151 = ((({((8'ha7) ? (8'ha6) : (8'hb7)), ((8'hab) ? (8'ha8) : (8'haa))} >> (^(8'hbd))) >= (~^(((8'hae) != (8'ha5)) ? (&(8'hbe)) : {(8'hab)}))) ? (-((8'hb1) - (((8'hb8) ? (8'haf) : (8'h9f)) - ((8'ha4) ? (8'h9f) : (8'hbb))))) : (({((8'hbb) ? (8'hb6) : (8'hac)), (8'haa)} == ((8'ha7) | ((8'ha1) ? (8'hbb) : (8'hbc)))) & (((~(7'h42)) && (&(8'haa))) ? ({(8'hb1)} ^~ ((8'ha7) ? (8'hac) : (7'h44))) : (((8'h9f) ? (8'hac) : (8'ha4)) >> (8'hb0))))), 
parameter param152 = (param151 ? param151 : ({({param151, param151} ? (param151 ? param151 : param151) : (param151 && param151)), (((8'h9f) ? (7'h43) : param151) ? (~^(8'h9f)) : (param151 ? param151 : param151))} == (~|(8'hb1)))))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire121;
  input wire [(5'h15):(1'h0)] wire120;
  input wire [(4'h9):(1'h0)] wire119;
  input wire signed [(3'h7):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire150;
  wire [(3'h6):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire138;
  wire [(2'h3):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire122;
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire148,
                 wire139,
                 wire138,
                 wire137,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire122 = $signed($signed((|wire121[(2'h2):(1'h1)])));
  assign wire123 = ((((+(wire121 ? wire119 : wire119)) ?
                       wire120 : (wire119[(3'h6):(1'h0)] ?
                           wire121 : (~(8'ha7)))) == $signed($signed($unsigned((8'ha3))))) <<< wire118[(3'h4):(2'h3)]);
  assign wire124 = wire119;
  assign wire125 = wire118[(3'h4):(3'h4)];
  assign wire126 = ((&(+((wire121 < wire119) == (wire122 > (8'hb7))))) < (^~(wire120[(4'hc):(2'h2)] ?
                       (wire125 ?
                           $unsigned(wire124) : wire121[(4'hc):(2'h3)]) : $signed($signed(wire122)))));
  assign wire127 = ($unsigned(wire118[(3'h6):(1'h1)]) ?
                       ($signed($signed({wire118})) ?
                           $unsigned(((~&wire119) || (8'hb3))) : $signed(wire123)) : wire122[(3'h7):(1'h1)]);
  assign wire128 = (~^(wire118 != $unsigned(((wire119 >> wire125) & {wire122}))));
  assign wire129 = (8'hb6);
  always
    @(posedge clk) begin
      if ($signed(wire125))
        begin
          reg130 <= wire129[(1'h1):(1'h1)];
        end
      else
        begin
          reg130 <= $signed(wire118[(2'h2):(2'h2)]);
          if (wire129)
            begin
              reg131 <= wire128[(3'h4):(3'h4)];
              reg132 <= {($unsigned($signed($signed(wire123))) >>> wire125[(3'h6):(2'h3)])};
            end
          else
            begin
              reg131 <= $signed(((&{wire127}) <<< $unsigned(((wire118 ?
                  wire125 : wire126) ~^ wire128))));
            end
          reg133 <= ($unsigned((^{wire128})) ?
              (wire124 ?
                  (8'hb1) : ($signed(((8'hb5) ? wire122 : reg132)) ?
                      $signed((reg131 == (7'h44))) : (8'ha3))) : $signed((&$signed($signed(wire128)))));
          reg134 <= {(8'hbc)};
        end
      reg135 <= $unsigned(((~$unsigned(wire129[(1'h1):(1'h0)])) - wire126));
      reg136 <= ($unsigned(($unsigned($unsigned(wire125)) ?
          wire129[(1'h1):(1'h1)] : (~&$signed((8'ha2))))) <<< reg131[(2'h3):(1'h1)]);
    end
  assign wire137 = $unsigned($unsigned(((7'h44) ?
                       wire121 : (wire123 & $unsigned(wire127)))));
  assign wire138 = ($signed((reg132 ?
                           ((&reg131) + $signed(reg134)) : $unsigned((reg135 ?
                               (8'ha0) : reg135)))) ?
                       ($unsigned(reg131) >= wire119) : (($unsigned($unsigned(reg135)) & (~^wire127[(1'h1):(1'h0)])) != ($signed((wire122 ?
                           (8'haa) : wire118)) == $unsigned((wire126 - (7'h40))))));
  assign wire139 = $signed({reg134});
  always
    @(posedge clk) begin
      reg140 <= (8'ha8);
      reg141 <= reg130;
    end
  always
    @(posedge clk) begin
      if ((wire119 ^~ $unsigned(($signed(reg135) > wire124))))
        begin
          if ($signed(((~|(8'hb7)) + (8'hb5))))
            begin
              reg142 <= $unsigned({(((wire126 ? reg131 : wire125) ?
                      $unsigned(wire138) : wire139) >>> $signed((&(8'h9d))))});
              reg143 <= (!$signed(($signed(reg140) + reg142[(4'h9):(2'h3)])));
              reg144 <= $signed(({$unsigned(wire126),
                      ((wire126 == reg130) ?
                          (reg130 ? wire120 : wire128) : (!reg130))} ?
                  wire138 : $unsigned(({wire138} < (~wire128)))));
            end
          else
            begin
              reg142 <= (+{wire125[(4'hf):(4'h9)], wire119});
              reg143 <= {wire129[(4'ha):(4'h9)], (&(!wire126))};
              reg144 <= (8'hae);
            end
        end
      else
        begin
          reg142 <= (8'ha9);
        end
      reg145 <= ($signed((reg136 ?
          $signed((wire118 ? reg134 : reg132)) : {$signed(wire137),
              wire120[(3'h5):(1'h1)]})) ^ wire122);
      reg146 <= ((+$signed($signed(reg130))) ?
          wire120[(5'h11):(4'hc)] : ((wire127 ?
                  $unsigned(wire119[(1'h0):(1'h0)]) : (wire129[(2'h2):(2'h2)] >= (wire128 ?
                      wire121 : wire127))) ?
              (-$signed((wire126 || (8'hb4)))) : (8'ha3)));
      reg147 <= (((wire122 * $unsigned((wire126 ? (7'h41) : wire125))) ?
          $unsigned($unsigned((reg131 ~^ wire118))) : wire120[(1'h1):(1'h0)]) && (8'h9e));
    end
  assign wire148 = reg132[(1'h1):(1'h0)];
  assign wire149 = (!reg134[(2'h2):(1'h0)]);
  assign wire150 = $signed($signed((wire139[(4'ha):(3'h4)] ?
                       $unsigned((+wire148)) : $unsigned($signed(reg146)))));
endmodule

module module80
#(parameter param92 = ((({((8'ha2) ^ (8'h9f))} ? (((8'hbf) ^ (8'hb7)) ? (~^(8'ha0)) : ((8'hb0) ? (8'haa) : (8'haf))) : ((8'ha3) ? ((7'h41) != (8'hae)) : (|(7'h43)))) == {(((7'h44) ? (8'hb7) : (8'ha5)) ? ((8'had) ? (8'hae) : (7'h44)) : (&(8'hba)))}) ? ((~^(((8'hae) || (7'h40)) ? ((8'h9c) | (8'h9c)) : (-(8'h9f)))) || (((&(8'hba)) >>> (^(8'ha3))) ? (((8'ha7) ~^ (7'h41)) >> ((8'hbc) == (8'ha0))) : (((8'ha2) ^~ (8'hba)) ? ((8'had) ? (7'h43) : (8'haa)) : {(8'ha8)}))) : {(({(7'h44), (8'hbd)} == (-(8'ha6))) ? (~((8'hb8) <<< (8'hab))) : (((8'ha4) ? (8'hb9) : (8'h9d)) ~^ ((7'h40) ? (7'h42) : (8'hbc))))}))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire84;
  input wire signed [(3'h7):(1'h0)] wire83;
  input wire [(4'hb):(1'h0)] wire82;
  input wire [(3'h6):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  assign y = {wire90, wire89, wire88, reg91, reg87, reg86, reg85, (1'h0)};
  always
    @(posedge clk) begin
      reg85 <= ((-$signed($unsigned((!wire81)))) ?
          wire83[(1'h0):(1'h0)] : $unsigned(wire81[(2'h2):(2'h2)]));
      reg86 <= ($signed($unsigned(wire82[(1'h1):(1'h1)])) < $signed(wire81[(3'h6):(2'h2)]));
      reg87 <= {$signed((|reg86))};
    end
  assign wire88 = ({$unsigned($signed({wire82}))} ?
                      $signed((($unsigned((8'h9e)) * (reg85 ?
                          wire83 : wire84)) < wire84[(4'ha):(1'h1)])) : ((~&(wire82[(2'h3):(2'h3)] & ((8'hbd) != reg87))) ?
                          $signed({(reg85 || wire83)}) : {{wire81[(1'h0):(1'h0)],
                                  wire84},
                              $unsigned(wire84[(3'h7):(3'h6)])}));
  assign wire89 = (wire83 ^~ ($unsigned($signed($signed(reg85))) < (~&($signed(reg85) ^~ (wire81 ?
                      wire81 : reg87)))));
  assign wire90 = ((~&wire81[(1'h1):(1'h0)]) ?
                      wire84[(4'hb):(3'h7)] : $signed(({((8'hb1) ?
                              (8'hb4) : reg85)} * (8'h9c))));
  always
    @(posedge clk) begin
      reg91 <= wire81;
    end
endmodule
