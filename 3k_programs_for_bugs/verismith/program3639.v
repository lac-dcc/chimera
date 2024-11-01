module top
#(parameter param192 = (~&(((~^(&(8'hb3))) ? {((8'ha4) * (8'hb3))} : (((7'h44) <= (8'haf)) ? (8'ha0) : ((8'hbd) >>> (8'h9c)))) ? {(((7'h42) | (8'had)) ? {(8'h9c), (8'h9c)} : ((8'hba) || (7'h42))), (((8'hab) != (8'hb1)) <= {(8'h9e), (8'hb7)})} : ((((8'ha0) ? (8'hab) : (8'hb3)) ? (+(8'ha8)) : (-(8'hbd))) || ((!(8'h9e)) ? (^(8'ha7)) : (~|(8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire188;
  wire signed [(3'h7):(1'h0)] wire187;
  wire signed [(4'ha):(1'h0)] wire186;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(4'ha):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire178;
  wire signed [(4'he):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire signed [(2'h3):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire171;
  wire signed [(4'h8):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire169;
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg181 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire119,
                 wire169,
                 reg191,
                 reg190,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  module5 #() modinst120 (wire119, clk, wire4, wire0, wire2, wire1, wire3);
  module121 #() modinst170 (wire169, clk, wire0, wire1, wire3, wire4, wire2);
  assign wire171 = (-wire4[(3'h6):(3'h5)]);
  assign wire172 = (~$signed(wire2));
  assign wire173 = $signed(wire169[(2'h2):(1'h0)]);
  assign wire174 = {{wire119[(2'h2):(1'h0)],
                           ({{wire1}} == $unsigned(wire4[(3'h6):(2'h2)]))}};
  assign wire175 = {(wire4[(1'h1):(1'h0)] ?
                           (~&(8'ha8)) : (!{$unsigned(wire3),
                               (wire174 ? wire0 : wire1)})),
                       (~&(&$signed($unsigned(wire0))))};
  assign wire176 = $unsigned((|((wire171 == $signed(wire171)) ?
                       (^wire174) : (!$signed(wire0)))));
  assign wire177 = $signed(((wire171[(3'h5):(1'h0)] == (~wire169)) != wire2));
  assign wire178 = (-wire172[(3'h5):(2'h2)]);
  assign wire179 = (8'h9c);
  assign wire180 = (8'hb7);
  always
    @(posedge clk) begin
      reg181 <= (^~(|wire119[(3'h7):(3'h7)]));
      reg182 <= {$unsigned(((~&(~^wire175)) >= wire119[(3'h7):(1'h1)]))};
      reg183 <= wire176[(2'h2):(1'h1)];
      reg184 <= $signed($unsigned((~^wire173)));
      reg185 <= $signed(wire4[(4'he):(4'h8)]);
    end
  assign wire186 = reg182[(1'h0):(1'h0)];
  assign wire187 = wire176[(5'h11):(2'h3)];
  assign wire188 = ($signed((-((wire0 ? wire179 : reg184) ?
                       (wire175 && wire187) : (reg181 ?
                           wire172 : wire171)))) & wire175);
  assign wire189 = (!{(((wire176 > wire119) + $signed(wire188)) < reg185)});
  always
    @(posedge clk) begin
      reg190 <= $unsigned($unsigned(wire173));
      reg191 <= ((wire177 | $signed($unsigned((+wire2)))) ? wire180 : wire176);
    end
endmodule

module module121
#(parameter param168 = {{(8'hab), (~((-(8'ha3)) * (8'ha3)))}, ({((~&(7'h42)) ? ((7'h43) + (7'h42)) : {(8'ha5), (8'ha1)})} + ({((8'hb6) ? (8'hb5) : (8'ha8))} - (+((8'hbd) ? (8'h9d) : (7'h44)))))})
(y, clk, wire122, wire123, wire124, wire125, wire126);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire122;
  input wire signed [(4'h8):(1'h0)] wire123;
  input wire signed [(5'h13):(1'h0)] wire124;
  input wire signed [(4'hf):(1'h0)] wire125;
  input wire signed [(4'ha):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire155;
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(3'h5):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  assign y = {wire127,
                 wire128,
                 wire133,
                 wire155,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 (1'h0)};
  assign wire127 = wire122;
  assign wire128 = (+$unsigned((wire125 ?
                       $unsigned((wire123 ?
                           wire125 : wire122)) : (^~$unsigned(wire123)))));
  always
    @(posedge clk) begin
      reg129 <= $unsigned(wire128);
      reg130 <= wire122[(1'h1):(1'h1)];
      reg131 <= (~&$unsigned(((wire124 < {wire122,
          reg130}) && wire127[(5'h13):(3'h6)])));
      reg132 <= ((~^(($signed((8'hbb)) ?
              wire123 : wire126[(3'h5):(3'h5)]) << (~$signed(wire126)))) ?
          {(-((~|wire128) >> (reg129 >>> (8'hac))))} : ((-$signed(wire124)) ?
              $unsigned($unsigned($unsigned(wire124))) : $unsigned($unsigned(wire125))));
    end
  assign wire133 = $unsigned(wire126);
  module134 #() modinst156 (wire155, clk, reg131, wire125, wire133, wire123);
  always
    @(posedge clk) begin
      reg157 <= $signed((($unsigned(reg130) <= {$unsigned(wire127),
              $signed(wire126)}) ?
          {($signed(wire128) ^ (8'hb4)),
              (reg129 >>> $unsigned(reg129))} : $signed($unsigned((wire133 ?
              (7'h40) : wire124)))));
      if ((|((wire123 <<< $unsigned($signed(reg130))) ?
          (({reg131, wire128} ?
                  (wire128 ? (8'ha3) : (8'haa)) : $signed(wire125)) ?
              (wire122[(3'h5):(3'h4)] && (wire125 ?
                  reg129 : wire133)) : wire133) : $unsigned(reg132))))
        begin
          reg158 <= (~^((~&((^~wire122) ?
              (wire123 == (8'hb1)) : (~^wire126))) << reg130[(4'hd):(4'hb)]));
          reg159 <= ($signed($signed({(wire122 >> wire124)})) ?
              $signed(wire155) : $unsigned((&(|reg130))));
          if (wire125[(4'h9):(3'h6)])
            begin
              reg160 <= reg159[(3'h6):(3'h6)];
              reg161 <= {reg158, (&(^~reg130[(4'h9):(1'h0)]))};
            end
          else
            begin
              reg160 <= ($signed((($signed((8'hb3)) & $unsigned((7'h41))) ?
                  (reg159[(4'h8):(3'h7)] ?
                      (^wire124) : $signed(wire124)) : (^~wire133))) + ($unsigned(wire123[(2'h3):(2'h3)]) >>> reg161));
              reg161 <= (($unsigned(reg159[(3'h5):(2'h3)]) ^~ ($signed($unsigned(reg131)) ?
                      (!(+(8'hb6))) : (8'hb6))) ?
                  (($signed($unsigned(wire128)) ?
                      $unsigned(((8'ha0) ?
                          wire126 : reg129)) : reg129) >> ((^~reg160[(2'h2):(1'h0)]) >> reg129)) : wire124[(4'he):(4'hb)]);
              reg162 <= reg158[(4'hd):(4'hd)];
              reg163 <= (((~|(wire122 | $signed(reg130))) ?
                  ((reg161[(3'h5):(2'h3)] ?
                          wire133[(5'h12):(4'hb)] : (reg130 ?
                              (8'ha5) : wire123)) ?
                      $unsigned(wire155) : (-$signed((8'hb5)))) : (|wire128[(2'h2):(1'h0)])) >> $unsigned((wire122 ^ (~|{reg132,
                  wire124}))));
              reg164 <= reg162[(5'h11):(4'hb)];
            end
          reg165 <= $unsigned(reg163);
          reg166 <= wire127;
        end
      else
        begin
          reg158 <= (~($unsigned(((reg162 * reg162) ?
                  $signed(wire123) : $unsigned((8'hb7)))) ?
              $signed(wire128) : $unsigned(({reg157} ?
                  (wire155 | reg165) : reg129))));
          reg159 <= $unsigned($unsigned($signed(reg158)));
        end
      reg167 <= (~^$unsigned(reg166[(3'h6):(1'h0)]));
    end
endmodule

module module5
#(parameter param117 = ((+(~&(|((8'hb6) || (8'hbf))))) ? ((~|(~|((8'hb4) ? (8'ha9) : (8'hb1)))) ? {(8'ha1), (((8'had) >>> (8'hb3)) ? (&(8'h9e)) : ((7'h40) ? (7'h40) : (8'hb3)))} : (-{((8'ha2) ? (8'hb8) : (8'hb9)), (~(8'h9d))})) : ({(((7'h44) >= (8'ha9)) ? (~^(8'hbb)) : (~^(8'had))), ({(8'hbf)} ? ((8'hb1) | (8'hb7)) : ((8'hbc) ? (8'hb4) : (8'ha9)))} ~^ ((^((8'h9e) == (8'ha9))) || ((!(7'h40)) * ((8'hbd) ? (8'hb9) : (8'hbb)))))), 
parameter param118 = (((8'hb6) ? param117 : (((~&(8'haf)) ? (param117 ? param117 : (8'ha1)) : (^~param117)) << (param117 ? (param117 ? param117 : (8'h9f)) : (8'hbc)))) ? ((((param117 >>> param117) ? (param117 ? param117 : param117) : ((8'hb7) ? param117 : param117)) * ((^param117) || (|param117))) <= ((~&param117) ? ((|param117) * (~param117)) : ((param117 ^~ param117) < (param117 & param117)))) : (~&{param117})))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire71,
                 wire70,
                 wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire12,
                 wire11,
                 reg114,
                 reg113,
                 reg69,
                 reg68,
                 reg67,
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
                 (1'h0)};
  assign wire11 = (-wire7[(4'h8):(1'h1)]);
  assign wire12 = wire8[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire7) ^~ wire9)))
        begin
          reg13 <= $unsigned((wire8[(3'h6):(1'h1)] & wire8[(3'h6):(3'h5)]));
          reg14 <= ((~&(^{wire10[(4'h8):(2'h3)]})) ?
              $unsigned(($signed(((8'h9d) ? reg13 : wire11)) ?
                  $signed(wire6[(3'h6):(1'h0)]) : wire10)) : wire6);
        end
      else
        begin
          reg13 <= (reg14[(3'h6):(1'h1)] ?
              {$signed($signed(wire7))} : $signed(reg14));
          if ((!{wire11[(3'h6):(3'h4)],
              $unsigned(($signed(wire10) != $signed(wire7)))}))
            begin
              reg14 <= wire11[(3'h4):(1'h0)];
              reg15 <= wire6[(1'h0):(1'h0)];
              reg16 <= (~&$unsigned((~|$signed((wire8 < wire12)))));
              reg17 <= reg14;
            end
          else
            begin
              reg14 <= (((!{(-reg17)}) ?
                  (($unsigned(wire6) ? $unsigned(wire6) : $signed(wire6)) ?
                      $signed((wire8 == reg13)) : (8'hb3)) : (~($signed(reg17) ?
                      (wire11 ? wire11 : reg13) : reg16))) < reg16);
              reg15 <= (($unsigned((8'hbc)) ?
                  (8'h9d) : wire8[(2'h2):(2'h2)]) ^ wire10[(1'h0):(1'h0)]);
              reg16 <= reg15[(3'h7):(1'h0)];
              reg17 <= $signed(reg14[(3'h7):(3'h4)]);
            end
          reg18 <= $signed({wire12, $signed($unsigned($signed(wire8)))});
          if (reg13)
            begin
              reg19 <= {wire6};
              reg20 <= {$signed(wire10), (+(^$signed((wire9 ^~ wire11))))};
              reg21 <= reg19;
              reg22 <= $signed(reg21);
            end
          else
            begin
              reg19 <= $unsigned({wire7[(3'h6):(1'h0)],
                  (($signed(wire9) ? {reg22, (8'h9f)} : $signed((8'hb5))) ?
                      (^reg16[(3'h5):(2'h3)]) : wire10)});
              reg20 <= ($unsigned((((reg18 ? reg16 : reg15) ?
                      reg13 : $unsigned(wire8)) ?
                  $signed(wire7[(1'h0):(1'h0)]) : wire9[(1'h1):(1'h0)])) ^~ $unsigned((($unsigned((8'h9d)) ?
                      (reg20 <= (8'hae)) : {wire9, wire9}) ?
                  (!$unsigned(wire6)) : ((+(8'hb3)) ?
                      $unsigned(reg19) : wire12))));
              reg21 <= (-wire12);
              reg22 <= reg14[(2'h3):(1'h1)];
            end
          reg23 <= (&reg19[(1'h1):(1'h1)]);
        end
      reg24 <= ((reg16[(2'h2):(1'h1)] <= {(8'ha2)}) ?
          ($unsigned((&{reg15})) + ($unsigned($signed((8'h9d))) * wire9[(3'h5):(1'h1)])) : {(({(7'h41)} ?
                  (|reg13) : {reg17, (8'hb2)}) && (reg20 ?
                  $unsigned((7'h41)) : $unsigned(reg13)))});
    end
  module25 #() modinst63 (.clk(clk), .wire27(reg16), .wire29(wire11), .wire26(reg17), .y(wire62), .wire28(wire12), .wire30(reg22));
  assign wire64 = $signed($signed({wire9,
                      ($unsigned(reg14) ?
                          (wire6 <<< reg20) : $signed(wire62))}));
  assign wire65 = $signed(wire6);
  assign wire66 = ($unsigned({wire11[(3'h6):(1'h1)],
                          ($signed(reg22) ?
                              $signed(wire64) : $signed(wire65))}) ?
                      ({wire64[(4'hc):(4'h9)], (~&((8'hba) ^~ reg14))} ?
                          wire9 : (+{((8'hb8) ? reg13 : reg22),
                              wire62[(2'h3):(2'h3)]})) : ($signed(({reg13,
                              reg17} ^ {wire65, reg15})) ?
                          reg24[(1'h1):(1'h0)] : {$unsigned(((8'ha0) ?
                                  (8'hba) : wire65))}));
  always
    @(posedge clk) begin
      reg67 <= (($signed((+{reg18})) ?
          $signed({$unsigned(reg22), (~^reg21)}) : {reg17,
              reg15}) | $unsigned(reg17[(3'h6):(3'h5)]));
      reg68 <= {($unsigned(reg18[(3'h5):(3'h5)]) ^ wire10),
          (reg20[(4'hb):(1'h1)] ?
              (wire6 >> $signed($unsigned(wire8))) : wire11)};
      reg69 <= reg18;
    end
  assign wire70 = wire6[(4'hf):(4'hf)];
  assign wire71 = ((reg69 ^~ wire10) ?
                      ({(((8'h9d) || (8'hbf)) && reg19[(2'h3):(2'h3)])} ?
                          ($signed(reg13) * wire8) : (&$signed({reg69,
                              wire64}))) : (~|(|reg19[(3'h7):(3'h6)])));
  module72 #() modinst109 (.clk(clk), .wire75(reg23), .wire74(wire10), .wire73(reg21), .y(wire108), .wire76(wire8));
  assign wire110 = (^~$signed(reg20));
  assign wire111 = $signed(reg15);
  assign wire112 = reg22;
  always
    @(posedge clk) begin
      reg113 <= $signed({wire71});
      reg114 <= ($signed((~|((wire62 ?
          wire9 : reg68) ^ wire7[(3'h4):(2'h3)]))) >>> $signed((|wire70)));
    end
  assign wire115 = (($unsigned({$unsigned((8'hb2)),
                       (~^(8'ha0))}) >= $unsigned(wire11[(3'h7):(1'h0)])) - reg15[(4'h9):(3'h5)]);
  assign wire116 = $unsigned(reg113[(4'hf):(2'h3)]);
endmodule

module module72  (y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  input wire signed [(4'hb):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
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
                 (1'h0)};
  assign wire77 = (^~$signed((-(|$unsigned(wire75)))));
  assign wire78 = $unsigned({wire73, wire75});
  assign wire79 = ($signed((~|(wire74[(1'h0):(1'h0)] ?
                      (wire77 ? (8'had) : wire78) : ((8'hb3) ?
                          (8'ha1) : wire74)))) > (wire78[(3'h5):(2'h2)] ?
                      (~|$signed($unsigned(wire74))) : wire73[(4'ha):(2'h3)]));
  assign wire80 = wire79;
  assign wire81 = $signed({wire73,
                      ($signed((wire79 >= wire77)) ?
                          (wire73 ?
                              $unsigned(wire80) : $unsigned(wire79)) : $unsigned((~^wire73)))});
  assign wire82 = ((~wire76) - $signed(wire77));
  assign wire83 = (~$unsigned((wire79 - $signed(wire74))));
  assign wire84 = {$unsigned((wire76[(2'h3):(2'h3)] - wire78)),
                      (~^$signed(wire80[(1'h0):(1'h0)]))};
  assign wire85 = {$signed(wire78)};
  assign wire86 = (({((wire80 ? (7'h42) : wire73) ? wire73 : (wire77 > wire84)),
                              $signed(wire77[(1'h1):(1'h0)])} ?
                          (&(wire76 == $unsigned(wire79))) : (wire81[(1'h0):(1'h0)] ?
                              (((8'hba) ?
                                  wire85 : wire78) && {wire74}) : (!wire75))) ?
                      $signed(wire79) : ((|$unsigned($signed(wire81))) << $unsigned($unsigned(wire75[(3'h6):(3'h5)]))));
  always
    @(posedge clk) begin
      reg87 <= $unsigned($unsigned($signed(({wire81} - ((8'h9f) + wire86)))));
      reg88 <= ((-($signed(wire74) ?
              ($unsigned(wire82) ?
                  $signed(wire82) : (wire83 >= wire73)) : (~|(wire79 | wire80)))) ?
          wire81 : wire78[(2'h3):(2'h3)]);
      reg89 <= ($unsigned(wire81) ^~ ($unsigned((-((8'had) >>> wire79))) >>> $signed(((~^wire74) ?
          $signed(wire82) : reg87[(1'h1):(1'h0)]))));
      if (reg87)
        begin
          if (($signed($unsigned(wire84[(1'h0):(1'h0)])) <= (reg89[(4'h8):(3'h4)] ?
              wire84 : $signed((wire82[(3'h7):(3'h7)] && (^wire73))))))
            begin
              reg90 <= ({(8'ha0)} ?
                  ((~|{$signed(reg89),
                      {wire83}}) - reg87[(1'h1):(1'h1)]) : ((~^(!(wire82 * wire76))) ?
                      (|((wire82 ? wire83 : wire84) + {wire75,
                          wire83})) : {$unsigned(reg89),
                          wire75[(3'h5):(2'h2)]}));
              reg91 <= (($unsigned(wire85) ?
                  $signed($signed(((7'h42) ?
                      wire74 : (8'h9e)))) : $unsigned($unsigned($unsigned(reg90)))) >> $signed($signed(wire77[(3'h6):(3'h4)])));
              reg92 <= (!(^(reg91 ? wire84 : $signed((~|wire78)))));
              reg93 <= $unsigned((($signed({(8'ha4),
                      (8'h9c)}) & ((wire83 + (8'hb8)) ?
                      {wire80} : ((8'hbd) > wire76))) ?
                  ((^(wire86 ^~ wire76)) | $signed(wire80[(2'h2):(1'h0)])) : {wire77[(3'h7):(2'h2)],
                      (8'ha4)}));
            end
          else
            begin
              reg90 <= $signed(wire74[(2'h3):(2'h3)]);
              reg91 <= wire78[(1'h0):(1'h0)];
              reg92 <= reg92;
              reg93 <= (&$unsigned(($unsigned(((8'haa) ? wire80 : reg93)) ?
                  $signed((wire79 ?
                      (8'hb5) : wire77)) : $signed($signed(wire77)))));
              reg94 <= wire85[(2'h2):(1'h1)];
            end
          reg95 <= wire74[(1'h1):(1'h0)];
          reg96 <= wire78;
          if ((((wire75 ?
              reg87 : reg95) >= $unsigned($unsigned(wire78))) == reg94[(3'h5):(2'h3)]))
            begin
              reg97 <= $signed($unsigned(($signed(wire79[(4'hd):(2'h2)]) >= (~$signed(wire79)))));
            end
          else
            begin
              reg97 <= wire81;
              reg98 <= ($unsigned($signed((-{wire85,
                  wire83}))) - (!((reg94[(3'h5):(1'h1)] ?
                      reg96 : (wire77 ? reg87 : (8'ha0))) ?
                  (~&$unsigned(reg93)) : ($signed(reg97) ?
                      wire75 : (wire73 * wire86)))));
              reg99 <= ((wire75[(3'h4):(2'h3)] ?
                  ($signed({wire84, wire81}) ?
                      ((reg92 ? wire79 : reg87) ?
                          reg94[(1'h1):(1'h1)] : (^~reg96)) : reg98) : reg88) <<< wire83[(3'h5):(3'h4)]);
              reg100 <= ((wire86[(3'h7):(3'h5)] ^~ $signed((reg88 ?
                  ((8'hb6) ? reg94 : wire73) : (wire81 ?
                      (8'hb1) : wire73)))) + wire79[(3'h4):(2'h2)]);
            end
        end
      else
        begin
          reg90 <= (wire79 ^ wire83[(1'h0):(1'h0)]);
          reg91 <= $signed($unsigned($signed($unsigned((-wire73)))));
          reg92 <= $unsigned((-{reg98, (8'hb3)}));
          reg93 <= $signed((-wire85[(1'h1):(1'h1)]));
        end
      if ((8'hb9))
        begin
          reg101 <= {wire85};
          reg102 <= wire80[(1'h1):(1'h1)];
          if ((wire77 ?
              $unsigned($unsigned(reg89)) : ((~(reg102[(2'h3):(2'h2)] ?
                      reg95 : (~^reg95))) ?
                  wire83[(3'h6):(3'h6)] : ($signed($signed(reg89)) ?
                      wire74[(2'h2):(1'h1)] : reg91[(2'h3):(2'h3)]))))
            begin
              reg103 <= (reg101 <= wire77[(1'h0):(1'h0)]);
              reg104 <= $unsigned(((^~$signed($unsigned((8'ha6)))) ?
                  (~((reg97 ?
                      wire77 : reg99) >>> wire74[(1'h1):(1'h1)])) : (wire79[(4'hb):(1'h1)] ?
                      wire73 : $unsigned((reg95 ? wire86 : wire78)))));
              reg105 <= $unsigned((~&reg98[(3'h5):(1'h1)]));
              reg106 <= (reg103 ?
                  {{$signed($unsigned((8'haf))), $signed(reg105)},
                      (reg88 ?
                          reg87 : ((wire85 <<< reg103) <= wire75[(4'h9):(4'h9)]))} : $unsigned((^~(reg93 ?
                      reg87[(1'h0):(1'h0)] : (reg96 ? (8'hbf) : reg93)))));
              reg107 <= reg104;
            end
          else
            begin
              reg103 <= reg100[(3'h5):(3'h5)];
              reg104 <= (reg92 ? (8'hb9) : $signed((8'ha5)));
            end
        end
      else
        begin
          reg101 <= $unsigned(reg92);
          reg102 <= reg107[(2'h2):(2'h2)];
        end
    end
endmodule

module module25
#(parameter param60 = (((~(&(!(8'ha1)))) ? ((~&{(8'ha7)}) ? (((8'h9f) ? (8'hbc) : (7'h40)) >= ((8'hab) ~^ (8'ha2))) : {(-(8'hb0))}) : ({(&(8'hbb))} ? ((~(8'h9d)) ? ((8'hab) ? (8'hb3) : (8'haa)) : (^(8'h9d))) : {((8'hbd) && (8'hb7))})) ? (|((((8'hb6) ? (8'h9d) : (8'hbf)) < ((8'hb9) >> (8'h9c))) ? (~^(~&(8'ha5))) : (((8'hb3) ? (8'hb6) : (8'h9c)) ? ((8'hb2) >>> (8'hb4)) : ((8'hb7) << (8'hbf))))) : {({{(8'hb8), (8'had)}, ((7'h41) ? (8'ha2) : (8'had))} || (~|((8'hae) ? (8'hb5) : (8'haa))))}), 
parameter param61 = {((|(~|(!param60))) ? param60 : param60)})
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg59,
                 reg58,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire31 = {$unsigned($unsigned($unsigned($unsigned(wire28))))};
  assign wire32 = wire29[(3'h4):(1'h1)];
  assign wire33 = wire31[(4'ha):(1'h1)];
  assign wire34 = (8'hb4);
  assign wire35 = (((wire30[(3'h4):(3'h4)] | (-wire27[(3'h4):(1'h0)])) << {$signed((8'hb0))}) ?
                      wire31 : (~$unsigned(((wire26 ^ (8'hae)) ?
                          $unsigned(wire29) : (~^wire28)))));
  always
    @(posedge clk) begin
      reg36 <= wire30[(1'h0):(1'h0)];
      if ($unsigned(wire26[(1'h0):(1'h0)]))
        begin
          reg37 <= $signed($unsigned(((&wire32[(4'hf):(3'h6)]) | ((wire33 ?
              wire32 : wire29) >= $unsigned(wire33)))));
          reg38 <= (wire26[(1'h1):(1'h0)] << $unsigned(((~|$unsigned(wire34)) ^~ wire33[(2'h3):(2'h3)])));
          reg39 <= ($unsigned((wire30[(1'h1):(1'h1)] <<< $unsigned({reg36,
              wire26}))) != (^~$unsigned($unsigned(reg37))));
        end
      else
        begin
          reg37 <= (wire33[(1'h1):(1'h0)] ?
              {(wire30 >> (~wire26[(1'h0):(1'h0)]))} : reg37[(3'h7):(1'h1)]);
          if ($signed(reg36))
            begin
              reg38 <= $signed((^wire26[(3'h6):(1'h1)]));
              reg39 <= wire33[(2'h2):(1'h1)];
            end
          else
            begin
              reg38 <= $signed(wire35);
              reg39 <= wire28[(3'h7):(3'h5)];
              reg40 <= ((^~$unsigned((!(^~(7'h41))))) >= wire27[(4'hb):(3'h6)]);
            end
          reg41 <= (+(($unsigned($unsigned(reg38)) >>> wire27[(2'h3):(1'h1)]) ?
              reg39[(1'h1):(1'h1)] : (wire30[(4'hd):(4'hd)] <<< $signed(reg36[(5'h11):(5'h10)]))));
          if ($unsigned({(-$unsigned({(8'hba)}))}))
            begin
              reg42 <= reg37;
              reg43 <= reg37[(3'h4):(2'h3)];
              reg44 <= wire34;
              reg45 <= reg38[(2'h3):(1'h1)];
              reg46 <= ($signed($unsigned($unsigned($signed(wire35)))) ^ $unsigned({reg44[(4'ha):(4'ha)]}));
            end
          else
            begin
              reg42 <= {(~(^~(|wire30))),
                  {(wire26 <= (^reg41[(4'h8):(1'h1)]))}};
              reg43 <= (~$unsigned(({$signed(reg36),
                  $signed((8'hbd))} + wire33[(3'h7):(2'h2)])));
              reg44 <= $unsigned($signed((8'ha3)));
              reg45 <= reg39[(1'h1):(1'h0)];
            end
        end
      reg47 <= (^~$unsigned((((reg46 ~^ reg39) ? (reg42 == reg44) : (!wire33)) ?
          {(reg44 | reg46)} : $signed((reg38 ? reg36 : (8'hbb))))));
      if (reg44)
        begin
          reg48 <= $unsigned(wire27);
        end
      else
        begin
          if (reg43)
            begin
              reg48 <= $signed($unsigned(wire28));
              reg49 <= reg43;
              reg50 <= ({(8'hae), $signed((&reg43))} ?
                  ((8'haf) ?
                      (((&reg47) + reg36[(5'h11):(4'hc)]) ?
                          wire30[(2'h3):(1'h1)] : reg37[(3'h6):(3'h6)]) : reg47) : $signed($unsigned(((wire30 ?
                      reg37 : wire30) == ((8'hbd) ? (8'ha1) : reg38)))));
            end
          else
            begin
              reg48 <= (~(({{reg50}} ?
                      $unsigned((reg41 ?
                          wire29 : reg38)) : $unsigned((reg48 >>> (8'h9d)))) ?
                  reg47 : {((|wire27) << ((8'hbf) << reg49)),
                      $signed((7'h40))}));
              reg49 <= $unsigned((((^~$unsigned(reg38)) ?
                  ((wire35 ?
                      (8'ha7) : wire29) + wire34[(4'hd):(4'hd)]) : {(|reg39),
                      $signed(reg44)}) & (($unsigned(reg45) ?
                      wire27 : (reg46 == reg49)) ?
                  wire33 : $signed($unsigned(reg50)))));
              reg50 <= reg39;
              reg51 <= $signed($signed($unsigned((&(8'hb2)))));
              reg52 <= (~(!(&$unsigned((reg37 >= reg48)))));
            end
        end
      reg53 <= reg51[(3'h7):(2'h2)];
    end
  assign wire54 = ($unsigned((+($signed(reg42) ? $signed((7'h43)) : {reg40}))) ?
                      wire35 : ($signed($signed(reg52)) ?
                          {(|$signed(reg39)),
                              (wire29 ?
                                  $signed(wire35) : (^~reg43))} : $unsigned(wire33)));
  assign wire55 = $unsigned($signed(reg51[(1'h0):(1'h0)]));
  assign wire56 = $signed(($unsigned($signed(((8'ha0) ? reg40 : reg48))) ?
                      $signed(reg51) : reg46));
  assign wire57 = (8'ha9);
  always
    @(posedge clk) begin
      reg58 <= wire27;
      reg59 <= wire27;
    end
endmodule

module module134
#(parameter param154 = (~&((({(8'hb5), (8'hbf)} | (&(7'h41))) ? (((8'hb9) ? (8'ha0) : (8'ha2)) ? (~(8'ha1)) : {(8'ha7), (8'ha0)}) : (+((8'ha5) ? (8'ha4) : (8'ha5)))) && ((((8'hb3) <= (8'h9e)) ? {(8'ha3), (8'hb2)} : ((8'hab) <<< (8'hb5))) != ((8'hb1) < (-(8'hb4)))))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire138;
  input wire [(4'hf):(1'h0)] wire137;
  input wire signed [(3'h4):(1'h0)] wire136;
  input wire signed [(4'h8):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire146;
  wire signed [(4'h8):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(4'he):(1'h0)] wire143;
  wire signed [(4'ha):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire139;
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire139,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire139 = $unsigned(wire135[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg140 <= (wire137[(4'he):(3'h6)] + (&$unsigned(({wire139} == wire135[(3'h7):(3'h6)]))));
      reg141 <= ((wire137 << (^~$signed(((8'hb2) <<< wire135)))) ?
          $signed($unsigned(wire136[(1'h1):(1'h1)])) : (^~(~&wire138)));
    end
  assign wire142 = (8'hbd);
  assign wire143 = wire139[(4'ha):(3'h6)];
  assign wire144 = (reg140[(3'h4):(2'h3)] ?
                       $unsigned($unsigned((((8'ha4) ^ reg141) < {wire139}))) : ($signed($signed({wire137})) >= $unsigned($unsigned((wire143 ?
                           wire137 : (8'ha5))))));
  assign wire145 = (((reg140 >= {(wire144 >= wire138)}) ~^ (reg141[(3'h6):(3'h6)] ?
                       $unsigned($unsigned((8'hb6))) : {$unsigned(wire136)})) * {(wire143[(4'h9):(1'h0)] ?
                           $unsigned(wire138[(4'h9):(3'h4)]) : $signed(wire138[(2'h3):(2'h2)]))});
  assign wire146 = (($signed({wire144,
                       wire135}) <<< reg140[(2'h2):(1'h1)]) ^ reg140[(1'h1):(1'h1)]);
  assign wire147 = (~&wire143);
  assign wire148 = (~|$signed({{(wire145 ? (7'h43) : wire147)}}));
  assign wire149 = (wire136[(3'h4):(2'h2)] <<< ((~|wire147[(1'h0):(1'h0)]) && (&(wire142[(1'h0):(1'h0)] * $unsigned(wire136)))));
  assign wire150 = ((^~wire149) << ($unsigned($signed(wire145)) ^~ {(wire147[(1'h1):(1'h1)] << $signed(reg140))}));
  assign wire151 = $unsigned(wire135);
  assign wire152 = (~{wire135[(3'h7):(3'h6)]});
  assign wire153 = $signed($signed($signed($unsigned(wire147))));
endmodule
