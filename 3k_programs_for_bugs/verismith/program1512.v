module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1f8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire212;
  wire signed [(5'h10):(1'h0)] wire197;
  wire signed [(3'h6):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire210;
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  assign y = {wire212,
                 wire197,
                 wire113,
                 wire112,
                 wire99,
                 wire97,
                 wire82,
                 wire81,
                 wire80,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire78,
                 wire210,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire4 = wire3[(5'h10):(2'h3)];
  assign wire5 = ((|wire0) ? $signed(wire4) : wire2[(2'h3):(1'h0)]);
  assign wire6 = wire2;
  assign wire7 = $unsigned(((((&wire6) ? (wire0 || wire5) : $unsigned(wire0)) ?
                         (-(~&wire6)) : wire1[(1'h0):(1'h0)]) ?
                     {(+wire1),
                         wire3[(4'hf):(3'h7)]} : ((^$signed(wire4)) << wire4)));
  always
    @(posedge clk) begin
      reg8 <= (8'h9c);
      reg9 <= wire4[(3'h5):(2'h2)];
      reg10 <= ({($signed({(8'haa)}) * (((8'ha3) == wire0) < (reg8 >>> wire1))),
              ((~^wire7[(1'h0):(1'h0)]) ^ (+(8'ha8)))} ?
          $unsigned($unsigned(wire0[(1'h0):(1'h0)])) : $signed($unsigned((wire4[(3'h5):(2'h3)] <<< $signed(reg9)))));
      if ($signed($unsigned(($unsigned({reg10, wire0}) >>> (8'h9f)))))
        begin
          reg11 <= {(8'hb5), reg10};
          reg12 <= (8'hab);
          reg13 <= $signed(wire2[(1'h1):(1'h0)]);
          reg14 <= wire7[(4'he):(3'h5)];
          reg15 <= reg9[(4'h8):(3'h7)];
        end
      else
        begin
          reg11 <= wire4;
          if (reg13)
            begin
              reg12 <= reg15[(3'h7):(3'h7)];
              reg13 <= (~^({$unsigned((wire2 ? wire1 : wire2)), {{reg14}}} ?
                  {wire0} : (wire5 >>> (-(reg11 >> reg8)))));
              reg14 <= ($unsigned(($unsigned(wire4) ?
                  wire1 : (~&(8'h9f)))) ^~ {(^(wire1[(3'h7):(3'h5)] ?
                      reg11[(2'h3):(1'h1)] : reg11[(4'hf):(3'h4)])),
                  (8'hb4)});
              reg15 <= wire0;
            end
          else
            begin
              reg12 <= reg10;
              reg13 <= (~(^~reg14[(2'h3):(2'h2)]));
              reg14 <= wire4[(1'h1):(1'h0)];
              reg15 <= reg15;
              reg16 <= $signed(wire1[(4'hc):(4'hb)]);
            end
        end
    end
  assign wire17 = (8'haf);
  assign wire18 = wire3;
  assign wire19 = wire5;
  assign wire20 = $signed((($signed((wire4 ?
                      wire6 : wire18)) ^~ wire3[(3'h5):(1'h0)]) <<< (~^reg13[(4'hb):(3'h7)])));
  assign wire21 = (+(&$unsigned({(reg14 ? wire4 : wire19)})));
  module22 #() modinst79 (wire78, clk, wire6, wire19, reg15, wire0);
  assign wire80 = reg12;
  assign wire81 = wire3[(4'ha):(4'h9)];
  assign wire82 = wire7;
  module83 #() modinst98 (wire97, clk, reg10, wire4, reg9, wire21);
  assign wire99 = $unsigned($unsigned($signed({$unsigned(reg13)})));
  always
    @(posedge clk) begin
      if ((^wire82))
        begin
          reg100 <= $signed($unsigned($unsigned((reg14[(1'h0):(1'h0)] ?
              $unsigned(reg15) : (wire2 ? reg14 : reg9)))));
        end
      else
        begin
          if ({$unsigned(wire0)})
            begin
              reg100 <= {reg11[(1'h0):(1'h0)]};
              reg101 <= ({wire4[(2'h2):(1'h1)], (~^{wire80[(3'h5):(1'h1)]})} ?
                  wire0[(4'hc):(3'h6)] : (8'hbb));
              reg102 <= wire2;
              reg103 <= (^(8'h9e));
              reg104 <= wire5[(5'h10):(4'h9)];
            end
          else
            begin
              reg100 <= ($signed($signed({$signed(wire3), (reg9 >= wire81)})) ?
                  (((^~(wire78 >= reg100)) < $signed((!(7'h43)))) && wire4) : $signed((($signed((8'hb5)) ?
                      reg9[(4'h9):(3'h4)] : (reg13 ^~ wire82)) - $signed(((8'hb0) ?
                      reg8 : wire2)))));
              reg101 <= $signed((((wire17 < (7'h44)) ?
                      {$signed(wire18), {wire1}} : $signed($signed(wire6))) ?
                  $signed(((reg14 != wire2) ^~ $signed(wire7))) : $unsigned(reg15)));
              reg102 <= {(({reg8, {wire99, (8'ha4)}} ^~ {(wire81 && wire20),
                          wire1}) ?
                      wire97 : reg104),
                  {{(~reg9[(3'h6):(2'h2)]), $signed(wire97)},
                      $unsigned(wire4)}};
              reg103 <= ($unsigned(reg102[(1'h1):(1'h1)]) * (reg14 & $signed(wire78)));
              reg104 <= ((~wire20) ?
                  reg15[(4'hb):(3'h4)] : (reg101[(2'h2):(2'h2)] || (~&$unsigned((reg10 ?
                      reg12 : wire20)))));
            end
          reg105 <= (wire5 ?
              $signed((((wire99 ~^ wire81) * (wire3 ? wire99 : reg103)) ?
                  ((wire99 ?
                      reg14 : reg12) > (wire0 - reg102)) : {$signed(wire81)})) : {(~|(^(wire3 != wire2))),
                  $unsigned((wire0[(5'h11):(4'ha)] ^ wire97[(3'h5):(2'h3)]))});
        end
      if ($signed(((wire7 >> (+(8'hab))) ?
          (reg8[(5'h12):(3'h4)] ?
              (^(wire82 ? wire81 : reg105)) : reg11) : wire80[(1'h1):(1'h1)])))
        begin
          if (reg12[(5'h12):(4'hd)])
            begin
              reg106 <= {wire81,
                  (&$unsigned(($signed(reg103) ?
                      (wire20 ^ (7'h41)) : reg11[(4'hd):(3'h5)])))};
              reg107 <= $unsigned(((7'h42) ?
                  $signed($signed((8'hbf))) : (|$signed((reg13 | reg14)))));
              reg108 <= $signed(reg101[(1'h1):(1'h0)]);
              reg109 <= wire17[(3'h6):(1'h0)];
            end
          else
            begin
              reg106 <= $signed(reg103);
              reg107 <= {$unsigned($signed($signed(((8'hb8) ?
                      reg16 : wire81)))),
                  $signed({{$signed(wire19), ((8'hb4) ~^ wire1)}})};
            end
          reg110 <= (wire4[(1'h0):(1'h0)] >>> wire81[(3'h7):(3'h7)]);
          reg111 <= $unsigned(wire19[(4'hb):(1'h1)]);
        end
      else
        begin
          reg106 <= (&$signed((8'ha5)));
          reg107 <= reg12[(5'h10):(2'h3)];
          reg108 <= {reg15[(4'hc):(4'h8)],
              $signed($signed((reg110 ?
                  ((7'h40) ? wire1 : (7'h44)) : (reg105 < reg8))))};
          reg109 <= (-wire1);
        end
    end
  assign wire112 = ((reg16 && reg105) ?
                       {$signed($signed($signed((8'ha5))))} : wire21);
  assign wire113 = $signed(wire81);
  module114 #() modinst198 (wire197, clk, reg107, reg9, reg14, wire78);
  module199 #() modinst211 (wire210, clk, wire2, wire4, wire81, reg108);
  assign wire212 = $unsigned($unsigned($signed((^~wire1))));
endmodule

module module199
#(parameter param208 = ((~^(~({(7'h41)} << (8'ha8)))) << ((((-(8'ha3)) >> ((8'hb0) <<< (8'ha4))) ? ((+(8'ha9)) >>> ((8'h9f) && (8'h9d))) : (8'hbf)) ? ((((8'hb5) ? (8'h9d) : (8'hb5)) ~^ (|(8'hbe))) ? {(8'hb2)} : (((8'ha6) >= (8'ha4)) >>> {(8'hac), (8'ha0)})) : (~^(^~(~&(8'ha8)))))), 
parameter param209 = param208)
(y, clk, wire203, wire202, wire201, wire200);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire203;
  input wire signed [(3'h5):(1'h0)] wire202;
  input wire signed [(4'h8):(1'h0)] wire201;
  input wire signed [(5'h14):(1'h0)] wire200;
  wire signed [(4'hd):(1'h0)] wire207;
  wire signed [(4'hc):(1'h0)] wire206;
  wire [(3'h6):(1'h0)] wire205;
  wire [(5'h15):(1'h0)] wire204;
  assign y = {wire207, wire206, wire205, wire204, (1'h0)};
  assign wire204 = $unsigned($unsigned(wire202[(1'h0):(1'h0)]));
  assign wire205 = (+($signed(wire202[(3'h4):(1'h1)]) ?
                       wire203[(3'h6):(2'h3)] : ($unsigned(wire200[(5'h14):(5'h11)]) ?
                           $unsigned($unsigned(wire204)) : (8'ha3))));
  assign wire206 = $signed(wire200[(3'h5):(3'h4)]);
  assign wire207 = wire206;
endmodule

module module114  (y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'h3d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire118;
  input wire [(5'h10):(1'h0)] wire117;
  input wire [(3'h6):(1'h0)] wire116;
  input wire signed [(5'h13):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire196;
  wire [(5'h11):(1'h0)] wire195;
  wire signed [(4'he):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire193;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire150;
  wire signed [(4'hd):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire140;
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg [(4'h9):(1'h0)] reg191 = (1'h0);
  reg [(5'h13):(1'h0)] reg190 = (1'h0);
  reg [(5'h14):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg187 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  reg [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(3'h7):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire151,
                 wire150,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg192,
                 reg191,
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
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg149,
                 reg148,
                 reg147,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg119 <= ($signed((|$signed(wire118[(3'h5):(3'h5)]))) > (&$unsigned($unsigned({(8'ha6)}))));
      reg120 <= $unsigned(({$signed($unsigned(wire117)),
              ((wire118 <= (8'hb7)) && (~^wire116))} ?
          reg119 : (^$signed({wire118}))));
      reg121 <= (8'hbc);
      reg122 <= $signed($signed($unsigned({reg120[(3'h7):(3'h7)],
          (&wire118)})));
      if (($unsigned((-wire116)) - wire117[(5'h10):(3'h4)]))
        begin
          if (wire115)
            begin
              reg123 <= wire116;
              reg124 <= reg122[(3'h7):(2'h3)];
              reg125 <= $unsigned(((&$unsigned(wire117)) && ({(reg124 ?
                          (8'haa) : (8'haa)),
                      {reg124}} ?
                  wire115 : (reg122[(3'h5):(3'h5)] ?
                      (~wire116) : (reg123 < wire116)))));
            end
          else
            begin
              reg123 <= ($unsigned(reg125[(3'h7):(2'h2)]) ?
                  (+wire115) : reg123);
            end
        end
      else
        begin
          reg123 <= (wire115[(4'ha):(1'h1)] || (wire116[(3'h6):(1'h1)] >> wire115[(3'h4):(1'h0)]));
          reg124 <= {(reg124[(1'h1):(1'h1)] - $unsigned(($signed(reg122) << (wire115 ?
                  reg124 : (8'ha3)))))};
        end
    end
  always
    @(posedge clk) begin
      reg126 <= $signed($unsigned($signed({wire116, (wire116 + (8'h9c))})));
      reg127 <= reg122;
      if (reg121[(2'h2):(1'h1)])
        begin
          reg128 <= $signed(reg127[(1'h0):(1'h0)]);
        end
      else
        begin
          reg128 <= $unsigned(reg128);
          reg129 <= reg124[(4'h8):(1'h0)];
          if ($unsigned(reg125))
            begin
              reg130 <= $signed($signed(reg125[(1'h1):(1'h0)]));
              reg131 <= ((8'ha0) != (($unsigned(reg120[(2'h3):(1'h1)]) ?
                  ($signed(reg121) ?
                      {reg126} : (wire117 << reg123)) : ((reg127 ?
                          reg126 : reg127) ?
                      reg129 : (8'hb0))) >> reg122));
            end
          else
            begin
              reg130 <= {((~^(^~(reg123 ? reg120 : (8'ha5)))) ?
                      wire116[(3'h6):(1'h0)] : (&((wire118 ? wire117 : reg123) ?
                          {wire116, reg130} : $unsigned(reg131)))),
                  $signed(reg129)};
            end
          if (((&(8'hb4)) >= $unsigned($unsigned(wire118[(3'h5):(2'h2)]))))
            begin
              reg132 <= (8'hb0);
              reg133 <= reg122;
              reg134 <= $unsigned($unsigned((reg132[(1'h0):(1'h0)] ~^ reg119)));
            end
          else
            begin
              reg132 <= ($unsigned($signed((wire115 ?
                  (reg129 ?
                      reg120 : reg128) : (reg134 <= wire115)))) && (~&((8'h9e) != ({reg133} ?
                  reg134[(5'h14):(2'h3)] : reg132))));
              reg133 <= $unsigned((8'hb8));
              reg134 <= $unsigned({$unsigned(wire118),
                  $unsigned($signed(((8'hbd) > (8'h9c))))});
            end
        end
    end
  always
    @(posedge clk) begin
      reg135 <= reg129;
      reg136 <= (!(7'h42));
      reg137 <= ({$unsigned(reg122),
          {(~$signed(wire116)),
              ((reg119 ? wire116 : wire117) ?
                  $unsigned(reg131) : (reg128 ^~ wire117))}} | $unsigned(reg124));
      reg138 <= (~(({$signed(reg133), reg124} ?
              $unsigned((8'ha2)) : ({(7'h40), reg121} ?
                  reg122[(1'h1):(1'h0)] : $signed((8'hb1)))) ?
          (~&((reg123 < wire115) >>> (8'hbf))) : (((reg119 <<< wire116) ?
              (reg120 || reg128) : $signed(wire117)) >> $unsigned($signed(reg130)))));
      reg139 <= {($signed(($unsigned(wire117) << $signed(reg131))) == wire116[(1'h1):(1'h0)]),
          ($unsigned((reg122 ?
              {reg135, reg135} : $unsigned(reg122))) + (reg129 ?
              reg137 : {(reg130 ? reg129 : reg133)}))};
    end
  assign wire140 = (((8'ha9) ?
                           (($unsigned(reg127) < (reg131 ? reg128 : reg134)) ?
                               ($unsigned((8'hb5)) <= $unsigned(reg129)) : $unsigned($signed(reg121))) : $signed($unsigned(wire118))) ?
                       $signed({((8'hac) || wire116[(1'h0):(1'h0)]),
                           {{(8'hac),
                                   reg134}}}) : {$unsigned({$unsigned(reg132),
                               (reg120 ? wire115 : reg138)}),
                           $unsigned(reg123[(3'h5):(1'h0)])});
  assign wire141 = reg127;
  assign wire142 = ({($signed((wire140 + reg136)) << $unsigned((|wire117)))} - reg126[(4'h9):(4'h8)]);
  assign wire143 = $signed($signed((8'hb1)));
  assign wire144 = $unsigned((($unsigned($unsigned(wire115)) & (reg134 ?
                       reg137 : (8'hb8))) >>> $signed((reg123 - $unsigned(reg130)))));
  assign wire145 = reg133;
  assign wire146 = reg123[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg147 <= (({(wire145[(1'h0):(1'h0)] ? {wire145} : reg133),
                  (wire142[(4'h9):(4'h9)] ~^ (wire142 * reg127))} ?
              ({{wire116, reg119}} ?
                  $unsigned($unsigned(wire117)) : wire141) : (reg119 | (8'hb2))) ?
          (wire117[(4'hd):(3'h5)] >>> reg135) : reg134[(5'h14):(3'h4)]);
      reg148 <= $unsigned(reg125);
    end
  always
    @(posedge clk) begin
      reg149 <= wire142;
    end
  assign wire150 = $signed($unsigned((((wire145 * reg132) ?
                           (+(8'hbb)) : reg138) ?
                       (reg128 < $unsigned(reg136)) : reg134[(5'h10):(1'h0)])));
  assign wire151 = {(-reg135)};
  always
    @(posedge clk) begin
      reg152 <= $signed((^~$signed($unsigned({(8'haa)}))));
      reg153 <= $signed(($unsigned((reg152 ? (+reg119) : $unsigned(reg136))) ?
          (~$signed((reg119 ? reg135 : reg132))) : $unsigned((~|(wire117 ?
              (8'haa) : reg119)))));
      reg154 <= (~^$unsigned(reg153[(4'hb):(3'h7)]));
      reg155 <= (8'h9d);
      if ((reg135 == reg133))
        begin
          if ($signed((wire143 ? $unsigned(reg132) : (&$unsigned(reg120)))))
            begin
              reg156 <= (+$unsigned($signed(reg130)));
              reg157 <= $signed((~|(reg153 ?
                  wire144 : $signed({reg154, reg139}))));
              reg158 <= (!(^$signed(reg131[(4'h9):(2'h3)])));
              reg159 <= $signed((($unsigned((wire117 > reg138)) == $unsigned(reg131)) == reg158));
            end
          else
            begin
              reg156 <= (+reg132);
              reg157 <= $unsigned(reg138);
              reg158 <= (|$unsigned($unsigned(reg128)));
            end
          reg160 <= (8'hb3);
          reg161 <= {$unsigned(({$signed((8'ha7)), (^~reg122)} == ((|wire150) ?
                  (~&(8'hb8)) : (reg128 & reg153))))};
          if ((reg133 ~^ $unsigned(reg154)))
            begin
              reg162 <= (reg153[(3'h6):(3'h6)] ~^ ({($unsigned(wire143) ?
                          reg123 : reg134[(4'h8):(1'h0)])} ?
                  (|reg132) : $unsigned(wire141)));
            end
          else
            begin
              reg162 <= wire140;
              reg163 <= $signed({$signed((~$signed(reg161)))});
              reg164 <= reg155[(4'he):(2'h3)];
              reg165 <= (|reg138);
              reg166 <= (reg153 ~^ ((-{$signed(reg137)}) ?
                  $unsigned(reg138) : (&reg128[(4'ha):(2'h2)])));
            end
          reg167 <= ((($unsigned(reg119) ?
              (~{reg126, (8'hb7)}) : (~|(reg122 ?
                  reg154 : reg148))) == $signed(reg148[(1'h0):(1'h0)])) >> (($signed(reg129[(4'h9):(3'h5)]) ?
                  ((-reg153) ?
                      wire144[(3'h5):(3'h5)] : (reg136 != reg147)) : reg125[(1'h0):(1'h0)]) ?
              $signed($unsigned((reg123 ?
                  (8'hbe) : reg128))) : (~&$unsigned(reg138))));
        end
      else
        begin
          reg156 <= reg149;
        end
    end
  always
    @(posedge clk) begin
      if ($signed(reg162[(4'hb):(2'h3)]))
        begin
          if ({$signed($signed((&reg149))), reg152[(2'h3):(2'h2)]})
            begin
              reg168 <= reg123;
            end
          else
            begin
              reg168 <= reg133;
            end
          if (wire146)
            begin
              reg169 <= (~&$signed(($signed((reg134 ?
                  reg149 : reg127)) >= ($signed(wire151) ?
                  reg159 : ((8'hba) ^~ wire142)))));
            end
          else
            begin
              reg169 <= wire118[(4'h8):(2'h2)];
              reg170 <= (((8'ha5) + $unsigned($signed(reg125[(2'h2):(2'h2)]))) ?
                  ($signed($signed(((8'hb7) <<< reg132))) ?
                      (&((reg136 <= reg131) ?
                          (&wire140) : $signed(wire146))) : reg132) : reg156[(2'h2):(1'h1)]);
              reg171 <= wire146;
            end
          reg172 <= ((~$unsigned(wire150[(4'h9):(3'h6)])) ?
              (~&(8'ha3)) : ((~^((8'hb0) ? $unsigned(reg154) : (~reg167))) ?
                  $unsigned((-(8'ha3))) : {($unsigned((7'h40)) ?
                          (reg122 ? wire118 : reg132) : (^reg138)),
                      reg137}));
          reg173 <= $signed({{$signed(reg136[(4'h9):(4'h8)])}});
          reg174 <= ($unsigned(reg171) | $signed(reg158));
        end
      else
        begin
          if (reg159)
            begin
              reg168 <= reg149[(2'h3):(1'h0)];
            end
          else
            begin
              reg168 <= reg125[(3'h5):(3'h4)];
              reg169 <= (~|(~^(8'hbf)));
            end
          reg170 <= $unsigned(reg168);
          if (($unsigned($unsigned(wire142[(4'h9):(3'h4)])) ?
              (wire150 || reg139) : ((~$signed((~^reg149))) ?
                  $unsigned(reg152) : reg174[(3'h5):(2'h2)])))
            begin
              reg171 <= ({wire117, (+$signed((+(8'h9e))))} ?
                  wire144 : $unsigned({{(reg130 ? reg148 : (7'h43))}}));
              reg172 <= ((^~$signed($signed((reg167 ?
                  reg136 : reg164)))) >>> reg124);
              reg173 <= $unsigned(reg159[(1'h0):(1'h0)]);
            end
          else
            begin
              reg171 <= (({reg158[(1'h1):(1'h0)]} ?
                  {($signed(reg161) >>> (reg147 ? reg128 : reg132)),
                      (^~reg173[(3'h5):(3'h5)])} : ($unsigned((^~reg132)) ?
                      (~|(wire141 << (8'hbe))) : (reg156[(2'h3):(1'h0)] ?
                          $unsigned(reg172) : $signed((8'hb6))))) < $signed((8'ha3)));
              reg172 <= {(+reg125[(3'h4):(2'h2)])};
            end
          reg174 <= reg147[(5'h10):(3'h7)];
        end
      reg175 <= (8'ha0);
      reg176 <= (reg135 & ($signed(({wire146, wire142} ?
          (reg156 ? reg121 : reg136) : reg159)) == (((+wire146) ?
          $signed(wire142) : (reg123 ?
              reg138 : reg123)) >= wire150[(4'hc):(4'ha)])));
      if ($signed(reg124[(2'h3):(1'h1)]))
        begin
          reg177 <= ((((^~$unsigned(reg162)) ? $unsigned((~&reg131)) : reg147) ?
                  $unsigned($signed((reg128 ? reg159 : (8'hbf)))) : ({(reg148 ?
                              wire117 : reg172)} ?
                      (~&wire141[(1'h0):(1'h0)]) : $signed((~^reg123)))) ?
              $unsigned($signed((reg120 * (reg125 ?
                  reg159 : (8'hbd))))) : $signed((|reg174)));
          reg178 <= reg175;
          reg179 <= reg170;
          reg180 <= reg173;
        end
      else
        begin
          reg177 <= {(reg175 ?
                  (((reg147 << reg171) - $unsigned(reg156)) ?
                      ((reg134 ? (8'hba) : wire150) ?
                          $unsigned(reg157) : $signed(reg134)) : reg147[(4'hf):(3'h7)]) : (reg123 << $signed((reg148 << reg131)))),
              $signed({{(reg179 ? wire146 : wire141)},
                  wire144[(5'h11):(4'h9)]})};
          if (($unsigned($signed($signed(reg131[(4'he):(3'h5)]))) + $signed((~&(&$signed(reg171))))))
            begin
              reg178 <= {$signed((((reg179 >= (8'ha1)) || (8'hb3)) ?
                      $signed(((7'h44) ?
                          reg176 : reg149)) : (&((8'hbf) >> reg168))))};
              reg179 <= ((($signed({reg136}) > ({wire143} >= reg132)) ?
                      (8'hbf) : ((!(reg126 & reg165)) ^ reg149)) ?
                  $signed((reg127 || {reg138[(1'h1):(1'h1)]})) : $unsigned(((reg176[(2'h2):(1'h1)] ?
                      (+reg137) : (reg155 ? reg137 : wire140)) | ({(8'ha8),
                          wire141} ?
                      (wire116 <<< reg154) : (reg136 ? (8'hbb) : reg162)))));
              reg180 <= reg149;
              reg181 <= ($unsigned(((-$unsigned(reg158)) ?
                      $signed(wire118) : ((reg172 ^ reg163) >= reg133[(2'h3):(2'h3)]))) ?
                  $signed((~^($signed(reg123) ?
                      $signed(reg154) : (|(7'h42))))) : reg132);
              reg182 <= (!($unsigned(reg135[(3'h5):(1'h0)]) != $signed(($signed(reg120) ?
                  (reg158 <= reg139) : {reg172}))));
            end
          else
            begin
              reg178 <= wire143;
              reg179 <= $signed((~^((~|reg132[(1'h1):(1'h1)]) || (~$signed(reg172)))));
            end
          reg183 <= {(!$unsigned($signed($unsigned(wire146))))};
        end
    end
  always
    @(posedge clk) begin
      reg184 <= (^~(^(reg148[(5'h10):(2'h2)] ?
          wire118[(2'h2):(1'h1)] : $signed(reg130[(1'h1):(1'h0)]))));
      if ($unsigned((($signed(reg164) ~^ (&(reg128 ? wire145 : reg119))) ?
          $signed((^{reg180, reg148})) : (reg153 ?
              {$signed(reg122), (&reg156)} : $unsigned((reg122 >= reg130))))))
        begin
          reg185 <= ($unsigned(reg173[(3'h4):(2'h2)]) == (^(((reg152 ~^ (8'ha7)) ?
                  wire145 : (~^(8'hb0))) ?
              (wire143[(1'h0):(1'h0)] >>> reg179) : $unsigned($signed((8'haa))))));
          if ($unsigned($unsigned(reg183)))
            begin
              reg186 <= reg125;
              reg187 <= wire144;
            end
          else
            begin
              reg186 <= reg124[(2'h2):(2'h2)];
              reg187 <= (&(8'hb8));
              reg188 <= (reg132[(1'h1):(1'h0)] >>> $unsigned(reg152[(1'h1):(1'h0)]));
              reg189 <= reg155[(4'hc):(4'ha)];
              reg190 <= reg182[(3'h7):(3'h4)];
            end
          reg191 <= {reg128[(4'he):(4'h9)], wire140[(4'ha):(1'h1)]};
        end
      else
        begin
          reg185 <= reg123[(2'h3):(2'h2)];
          if (reg156)
            begin
              reg186 <= (reg183 < {reg148});
              reg187 <= reg168;
              reg188 <= (reg121[(4'h8):(3'h5)] ^ $signed(wire140[(4'h9):(1'h0)]));
              reg189 <= reg131;
            end
          else
            begin
              reg186 <= {{reg191[(3'h7):(3'h4)]}};
              reg187 <= ((reg171[(4'he):(3'h5)] >> reg184) ?
                  $signed({(8'ha4)}) : reg131[(1'h1):(1'h0)]);
              reg188 <= {$unsigned(reg182),
                  ($signed(({reg129,
                      (8'hb7)} == $unsigned((8'hb5)))) >>> (|reg179))};
              reg189 <= {$unsigned(reg155)};
              reg190 <= (((wire117[(4'hb):(1'h1)] && {reg181[(1'h1):(1'h0)]}) ~^ (reg178 * reg177[(1'h0):(1'h0)])) ?
                  $signed(reg178[(4'he):(2'h2)]) : (&reg169));
            end
          reg191 <= (+({{wire145}, (&reg153)} ?
              reg149[(2'h3):(1'h1)] : $signed({(+(7'h44))})));
          reg192 <= (+$unsigned(reg168[(3'h4):(1'h1)]));
        end
    end
  assign wire193 = ({(|$signed((-reg179))), reg137} + reg130[(2'h3):(2'h3)]);
  assign wire194 = (+($unsigned({(reg139 - reg184),
                       ((8'ha4) * reg172)}) < reg180));
  assign wire195 = $signed({$unsigned(reg184[(2'h2):(1'h1)])});
  assign wire196 = (-(~reg153[(2'h2):(1'h1)]));
endmodule

module module83
#(parameter param96 = (|(((|((8'ha9) ~^ (8'ha8))) ? (|(~^(8'ha6))) : (((8'ha2) ? (8'hb1) : (8'ha8)) <<< ((8'had) >> (8'ha7)))) ^ (((^~(8'hb1)) ? (+(8'ha3)) : (~|(8'hb7))) ~^ (+((8'ha9) ? (8'hb0) : (8'had)))))))
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire87;
  input wire [(3'h5):(1'h0)] wire86;
  input wire signed [(5'h11):(1'h0)] wire85;
  input wire [(4'h8):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire88 = ($signed(wire84[(1'h1):(1'h1)]) ?
                      $unsigned((wire86[(3'h5):(1'h1)] - $signed((wire87 ^ wire85)))) : ((8'hbc) ?
                          ($unsigned((7'h41)) >> wire86[(3'h5):(1'h1)]) : $signed(wire86)));
  assign wire89 = wire88;
  assign wire90 = wire86;
  assign wire91 = wire84[(3'h6):(1'h0)];
  assign wire92 = {({(wire84 << (8'hbe))} ?
                          wire91[(1'h1):(1'h1)] : $signed(wire85[(3'h4):(1'h0)])),
                      wire89[(4'h9):(3'h7)]};
  assign wire93 = wire87;
  always
    @(posedge clk) begin
      reg94 <= wire91[(2'h2):(2'h2)];
      reg95 <= (wire92 <<< (~^(~|$unsigned(((8'hb0) != (8'ha6))))));
    end
endmodule

module module22
#(parameter param77 = (({{{(8'hb7)}}, (((8'hba) * (8'ha0)) ? ((7'h44) | (8'h9f)) : ((8'ha7) > (8'h9d)))} <<< (8'ha2)) > ((8'h9e) > ((((8'ha6) >= (8'hab)) ? ((8'hbf) - (8'haa)) : ((8'h9e) < (8'hb9))) + (((8'ha4) == (8'ha2)) ? (~^(8'ha8)) : ((8'hbc) < (8'hb3)))))))
(y, clk, wire23, wire24, wire25, wire26);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(5'h14):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire52;
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire27,
                 wire52,
                 reg73,
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
                 (1'h0)};
  assign wire27 = (8'hab);
  module28 #() modinst53 (.wire31(wire26), .wire32(wire24), .wire29(wire27), .clk(clk), .wire30(wire25), .y(wire52), .wire33(wire23));
  always
    @(posedge clk) begin
      if (wire52[(4'ha):(2'h2)])
        begin
          reg54 <= (8'hbd);
          reg55 <= ((wire52[(4'hb):(2'h2)] >> ((wire27 >>> wire24[(1'h1):(1'h1)]) == $unsigned($signed(wire24)))) - ($signed($signed(wire24[(2'h2):(2'h2)])) ?
              wire25 : wire24[(1'h0):(1'h0)]));
          if (((~|{wire24[(2'h3):(1'h1)]}) < $signed((wire52[(4'ha):(4'h9)] == $unsigned(wire25[(1'h1):(1'h0)])))))
            begin
              reg56 <= wire25;
              reg57 <= {(^~$unsigned($signed($signed(wire23))))};
              reg58 <= (((-wire24[(4'hd):(1'h1)]) ?
                  (|(wire25[(3'h6):(2'h2)] <= reg54[(3'h4):(3'h4)])) : wire52[(4'h8):(3'h4)]) & reg56);
              reg59 <= wire24[(3'h5):(3'h5)];
              reg60 <= reg56[(2'h3):(1'h1)];
            end
          else
            begin
              reg56 <= ((^reg57) ?
                  (^~(&(7'h40))) : $unsigned($signed(((wire27 ^ reg56) ?
                      $signed((8'ha6)) : $unsigned(wire25)))));
            end
        end
      else
        begin
          reg54 <= reg56;
          reg55 <= wire23[(3'h7):(3'h7)];
          if ({$signed((wire23 ?
                  (+(wire24 || reg59)) : (reg57 ? {reg58} : wire25)))})
            begin
              reg56 <= $unsigned($unsigned(reg56[(3'h5):(2'h2)]));
              reg57 <= (~&reg54[(4'ha):(2'h2)]);
              reg58 <= (~&(+{$unsigned((~reg56)), {(^~(8'ha3))}}));
            end
          else
            begin
              reg56 <= $signed($signed((({wire25, reg59} ?
                  $signed(wire24) : reg56) && $signed($unsigned((8'ha3))))));
              reg57 <= wire27[(1'h1):(1'h1)];
              reg58 <= ($unsigned((-(!{wire52}))) ?
                  (-{((reg54 ^ wire24) >> wire52),
                      ((~^wire27) ?
                          {(8'hb9)} : {wire25,
                              wire26})}) : (reg57[(4'hd):(3'h4)] ?
                      {$signed(reg57)} : wire24));
            end
          reg59 <= ((8'h9f) ?
              reg60[(2'h3):(1'h1)] : {((-(wire52 != reg59)) ?
                      wire24 : $signed(((8'h9f) ~^ reg58)))});
        end
      if (((($signed(reg58[(3'h7):(1'h0)]) != $unsigned(wire24)) && wire23) ?
          $signed(reg57) : (reg55[(3'h7):(3'h7)] ? reg58 : wire26)))
        begin
          if (((reg59 ?
              reg56 : (wire25[(3'h7):(3'h4)] ?
                  reg58 : reg59[(2'h3):(2'h2)])) >>> {$signed(wire26[(3'h7):(3'h7)]),
              (reg55 > ({wire24, reg59} * ((8'ha3) ~^ wire25)))}))
            begin
              reg61 <= (~&wire24[(2'h3):(2'h2)]);
              reg62 <= $signed((~&$signed($unsigned($unsigned(wire52)))));
              reg63 <= reg62;
              reg64 <= ((~|{wire23, $signed($unsigned((8'had)))}) ?
                  $unsigned(reg56) : {($unsigned(((8'hb9) && wire25)) ~^ $unsigned(wire25)),
                      ($signed((!(8'hb4))) != $unsigned($unsigned(wire52)))});
            end
          else
            begin
              reg61 <= (($signed((^(wire23 != reg56))) ?
                      $unsigned($unsigned((wire27 * reg58))) : (-wire26[(2'h2):(1'h1)])) ?
                  wire25 : (reg54[(2'h3):(1'h1)] ?
                      {(reg58[(3'h4):(1'h0)] << $signed(reg59))} : $signed((wire23 ?
                          (wire27 && reg56) : reg59[(2'h2):(1'h1)]))));
              reg62 <= {((!$unsigned(reg59)) ? (~{(&reg54)}) : reg57),
                  reg60[(2'h3):(2'h2)]};
              reg63 <= wire23;
              reg64 <= $signed((wire23[(3'h7):(1'h1)] > ($signed($unsigned(wire25)) ?
                  ((wire52 ^~ reg61) >> (^wire23)) : (~|wire23))));
              reg65 <= wire25[(4'hf):(2'h3)];
            end
          reg66 <= {$unsigned($signed((reg61 ? (reg56 | reg60) : reg55)))};
          if (wire52)
            begin
              reg67 <= (^~(~$signed(({(8'haa), reg60} <= $signed(wire25)))));
              reg68 <= (|$signed((^reg57)));
            end
          else
            begin
              reg67 <= (((((wire24 ? reg62 : reg61) == (+reg67)) ?
                      ((reg65 == reg60) ?
                          reg68 : (-reg67)) : $signed((!(8'hac)))) ?
                  (reg64[(5'h10):(4'hf)] ?
                      {wire23[(1'h0):(1'h0)],
                          (reg62 ? wire52 : reg64)} : ((^~wire24) != (reg64 ?
                          reg55 : wire24))) : reg54) == reg56[(1'h0):(1'h0)]);
              reg68 <= wire26;
              reg69 <= reg67;
              reg70 <= (($unsigned(reg62) ?
                  ($signed($unsigned(reg62)) ?
                      (reg60[(3'h6):(1'h0)] | reg64) : {$signed(reg58)}) : ($signed((~|reg68)) ^~ $signed({(7'h42)}))) << reg60);
              reg71 <= $signed($signed(((reg58 ? (~reg55) : $signed(reg54)) ?
                  (~wire27[(3'h4):(1'h1)]) : reg64)));
            end
        end
      else
        begin
          reg61 <= $unsigned((((8'hb2) != ({reg71} ?
              $signed((7'h43)) : (reg69 ~^ (8'ha7)))) <= ($signed({reg56}) << (reg60[(3'h5):(1'h0)] ?
              (wire27 ? reg57 : reg63) : (~&reg69)))));
          reg62 <= reg54;
          reg63 <= $signed((&($signed((reg66 < (8'hb4))) ~^ {(|reg56)})));
          reg64 <= (!wire25);
        end
      reg72 <= reg61;
      reg73 <= $signed(reg56);
    end
  assign wire74 = reg57;
  assign wire75 = reg67[(1'h0):(1'h0)];
  assign wire76 = (reg55 ?
                      {$unsigned(($signed(reg58) && reg54))} : ($signed(reg60[(3'h6):(1'h1)]) != ((reg58[(1'h1):(1'h0)] ?
                              reg63[(4'ha):(1'h0)] : wire74) ?
                          reg64[(3'h4):(1'h0)] : wire27)));
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire signed [(3'h4):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg49,
                 (1'h0)};
  assign wire34 = {wire31[(1'h0):(1'h0)]};
  assign wire35 = (+wire33);
  assign wire36 = ((((wire32[(2'h3):(2'h2)] & {wire32}) ?
                      wire31 : (~&(wire30 << wire29))) >>> $unsigned((!wire33[(3'h7):(3'h7)]))) > ((wire32[(1'h0):(1'h0)] ?
                          $signed($signed(wire34)) : $signed((|(8'ha8)))) ?
                      ($unsigned(wire30) ?
                          ((wire29 ~^ wire30) <= {(8'hb0),
                              wire35}) : wire33) : $signed(($unsigned((7'h43)) < wire32[(3'h4):(2'h2)]))));
  assign wire37 = $signed(($signed(((wire33 ? wire33 : wire31) ?
                      $unsigned(wire29) : wire35[(4'hb):(3'h7)])) ^~ $unsigned((wire30[(3'h5):(3'h5)] && (wire32 ?
                      wire34 : wire31)))));
  assign wire38 = $unsigned(($unsigned($signed($signed(wire33))) ?
                      (|wire37[(3'h6):(3'h4)]) : ($unsigned((wire37 ?
                              wire35 : wire33)) ?
                          ((~&wire32) < wire31) : (~$unsigned(wire32)))));
  assign wire39 = wire33;
  assign wire40 = wire34;
  assign wire41 = wire40[(4'h8):(3'h6)];
  assign wire42 = (-{(wire34[(2'h2):(1'h0)] + {$unsigned(wire41)})});
  assign wire43 = (-{{$unsigned($unsigned(wire42)), wire36[(3'h4):(2'h3)]},
                      $signed(wire36[(1'h0):(1'h0)])});
  assign wire44 = $unsigned($unsigned((~|{(-wire29)})));
  assign wire45 = (($unsigned(wire37[(3'h5):(3'h4)]) ^ (wire32[(2'h2):(1'h1)] ?
                      wire44[(1'h1):(1'h0)] : ((~|wire37) <= wire31[(1'h0):(1'h0)]))) << $signed((8'hbe)));
  assign wire46 = wire38[(1'h1):(1'h0)];
  assign wire47 = $signed(($signed({{wire44}}) >>> (((wire36 & wire31) ?
                      wire44 : $signed(wire42)) <<< $unsigned(wire36))));
  assign wire48 = wire39;
  always
    @(posedge clk) begin
      reg49 <= ($signed($unsigned($signed($unsigned(wire40)))) ?
          $signed($signed((~^{(8'ha7), wire44}))) : wire31[(2'h3):(2'h2)]);
    end
  assign wire50 = $unsigned(wire46);
  assign wire51 = (8'haf);
endmodule
