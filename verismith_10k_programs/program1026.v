module top
#(parameter param189 = ({{(7'h40), (&((8'ha2) ? (8'hb2) : (8'haa)))}} > ((-(~&(!(8'ha7)))) >> (((~&(8'h9c)) ? ((7'h40) * (8'hb3)) : ((8'hb5) <<< (8'hb9))) ? (((8'ha2) ? (8'ha6) : (8'ha5)) ? ((8'hab) << (8'h9e)) : ((8'hb1) << (8'h9e))) : ((!(8'ha9)) ? (~(8'hab)) : ((8'ha9) >>> (8'h9d)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire188;
  wire signed [(3'h6):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire174;
  wire [(5'h10):(1'h0)] wire173;
  wire signed [(5'h12):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(4'he):(1'h0)] wire171;
  reg signed [(4'h9):(1'h0)] reg187 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg183 = (1'h0);
  reg [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg178 = (1'h0);
  reg [(5'h15):(1'h0)] reg177 = (1'h0);
  reg [(5'h12):(1'h0)] reg176 = (1'h0);
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  assign y = {wire188,
                 wire179,
                 wire174,
                 wire173,
                 wire114,
                 wire6,
                 wire5,
                 wire116,
                 wire171,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 (1'h0)};
  assign wire5 = (wire0[(4'h8):(3'h4)] ?
                     wire0 : ((^~(8'hb2)) & ((wire4 > $unsigned(wire1)) ?
                         (wire3[(2'h3):(2'h3)] && wire4[(4'h9):(1'h0)]) : wire1[(1'h1):(1'h0)])));
  assign wire6 = $unsigned(($signed($signed(wire1)) ?
                     wire5 : wire1[(1'h0):(1'h0)]));
  module7 #() modinst115 (.wire8(wire1), .wire10(wire0), .y(wire114), .wire12(wire5), .wire9(wire3), .wire11(wire6), .clk(clk));
  assign wire116 = ((7'h44) >= $unsigned({{(wire0 ? (8'hba) : wire6),
                           wire4[(3'h4):(1'h1)]},
                       (|wire114[(5'h10):(5'h10)])}));
  module117 #() modinst172 (wire171, clk, wire4, wire1, wire5, wire2, wire3);
  assign wire173 = wire3;
  assign wire174 = wire4[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg175 <= (((wire1 - (-$unsigned(wire116))) > (8'ha6)) ?
          (!wire0[(5'h13):(5'h12)]) : (wire5 ?
              (((wire2 ? wire116 : wire116) ?
                  (wire174 ?
                      wire6 : wire5) : (wire174 <<< (8'hb8))) - {$signed(wire174)}) : $signed($signed(wire5))));
      reg176 <= (((((wire171 >>> wire174) * $signed(wire3)) ?
              $signed((^~(7'h41))) : $signed(wire5)) ?
          {wire4[(4'hc):(2'h2)],
              ($signed(reg175) ?
                  {wire116,
                      wire3} : (~^(8'ha5)))} : (|{reg175[(1'h0):(1'h0)]})) >> wire4[(4'ha):(3'h4)]);
      reg177 <= {($unsigned((wire6 < $unsigned(wire173))) ?
              (((wire114 ~^ (8'ha8)) ?
                      ((8'hab) ? wire174 : wire3) : $unsigned((7'h43))) ?
                  (wire3[(1'h1):(1'h1)] ?
                      wire116 : (wire5 ?
                          wire3 : reg175)) : reg176[(5'h10):(4'h9)]) : (((~|wire171) ?
                  $signed(wire2) : $signed(wire6)) & $signed($signed(wire174)))),
          wire5[(4'h8):(3'h7)]};
      reg178 <= (($signed((~&{wire174, reg177})) ?
          $unsigned($unsigned(wire3)) : ($unsigned(wire6[(5'h10):(5'h10)]) ?
              ((wire2 ?
                  wire4 : (8'h9f)) > wire2[(4'h8):(4'h8)]) : (~|wire174))) + (((~^wire114[(4'hd):(3'h5)]) << (+(wire114 ~^ wire1))) & wire5));
    end
  assign wire179 = (reg178 ?
                       (~|$unsigned($unsigned(wire6[(4'hc):(3'h7)]))) : $signed($unsigned(($signed(wire171) | {wire1}))));
  always
    @(posedge clk) begin
      reg180 <= ($unsigned(($unsigned({wire171}) ?
          $unsigned((wire174 ^~ wire114)) : $unsigned($unsigned(wire4)))) ^~ wire171);
      if (((!(~|(wire174 ? wire5[(3'h4):(2'h2)] : $signed(reg175)))) < wire116))
        begin
          if (($unsigned((wire174 >> (-{reg175,
              (8'ha9)}))) - (~^(^~wire0[(4'hf):(4'he)]))))
            begin
              reg181 <= $unsigned((!wire6[(5'h11):(4'hb)]));
            end
          else
            begin
              reg181 <= {$signed(({(!wire173)} ?
                      wire2 : (~&((8'hae) == wire174)))),
                  {wire4[(1'h1):(1'h1)]}};
            end
          reg182 <= wire179[(2'h3):(1'h0)];
          reg183 <= wire171;
          reg184 <= $signed((($unsigned($signed(wire4)) ?
              wire171[(4'he):(4'ha)] : wire173) && $unsigned($signed($signed(wire174)))));
          reg185 <= (&(^~(wire179[(1'h1):(1'h0)] ?
              {$unsigned((8'hac))} : reg178)));
        end
      else
        begin
          if (wire179[(2'h3):(1'h0)])
            begin
              reg181 <= ((^~$signed($signed(wire6))) < wire6[(5'h11):(1'h1)]);
              reg182 <= $signed((^~reg184[(1'h1):(1'h0)]));
            end
          else
            begin
              reg181 <= (8'hb4);
              reg182 <= $signed(((wire2[(4'he):(4'hc)] ? wire1 : (8'hbc)) ?
                  (wire116[(1'h1):(1'h1)] ?
                      ($signed((8'ha8)) ?
                          ((8'hb3) ?
                              wire173 : reg184) : (reg183 ^~ reg181)) : (~^wire5[(5'h12):(4'hd)])) : (((wire2 ?
                              reg182 : wire1) ?
                          (wire116 ? reg180 : reg185) : wire173) ?
                      ($signed(wire179) ?
                          reg180 : $signed(wire5)) : $unsigned(reg182[(2'h2):(2'h2)]))));
            end
          reg183 <= (~^$signed($unsigned((+$unsigned(wire3)))));
          reg184 <= ((^(((~^wire114) ?
              (~&wire4) : (~(8'hb3))) || ($signed(reg176) ?
              (&reg185) : ((8'ha2) | wire173)))) ^~ $unsigned((^$signed($signed(wire116)))));
          reg185 <= (+(wire171[(4'hb):(1'h1)] ?
              ((wire1 & wire171) >> ((wire5 ?
                  wire173 : wire114) | wire4)) : $unsigned($unsigned((^~wire0)))));
          reg186 <= (~|$unsigned(reg176));
        end
      reg187 <= $signed(reg178[(4'h8):(1'h1)]);
    end
  assign wire188 = ($unsigned(wire6) <<< {$unsigned($unsigned((wire6 ?
                           reg186 : wire2)))});
endmodule

module module117  (y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire122;
  input wire [(5'h14):(1'h0)] wire121;
  input wire [(5'h14):(1'h0)] wire120;
  input wire [(5'h13):(1'h0)] wire119;
  input wire signed [(4'hc):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire170;
  wire [(4'hf):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire159;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(4'hb):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  assign y = {wire170,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire148,
                 wire147,
                 wire146,
                 wire135,
                 wire134,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
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
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire123 = wire118;
  assign wire124 = (~&($unsigned($signed((~&wire119))) - (wire119 ?
                       wire123[(2'h3):(2'h2)] : ({wire120,
                           (8'hb7)} == (|wire123)))));
  assign wire125 = $unsigned($signed((wire124[(5'h15):(4'hd)] >>> (+{wire123}))));
  assign wire126 = (wire119 ?
                       $unsigned({$unsigned((wire119 ?
                               wire125 : wire123))}) : wire124[(3'h7):(1'h0)]);
  assign wire127 = $unsigned($unsigned(wire121));
  assign wire128 = $signed(wire119);
  always
    @(posedge clk) begin
      reg129 <= wire119[(5'h13):(3'h6)];
      reg130 <= reg129;
      if ($signed(($signed((wire128 > (wire124 * wire121))) ?
          (wire120 ?
              (^~$unsigned(reg130)) : ($unsigned(wire122) & (~wire122))) : $signed(wire119[(5'h10):(4'h9)]))))
        begin
          reg131 <= ($signed((&(~|wire125))) ?
              wire122 : $signed((|reg129[(4'h9):(4'h9)])));
        end
      else
        begin
          reg131 <= ((~|(wire123 && ((reg131 ? wire121 : wire119) ?
                  (wire124 ? wire122 : reg130) : {wire121}))) ?
              wire125[(4'h8):(3'h7)] : $unsigned(wire121[(5'h10):(2'h2)]));
          reg132 <= (wire124[(4'h9):(3'h7)] ?
              {((wire125 ? (~wire122) : (wire125 ? (8'ha8) : wire120)) ?
                      wire128 : wire122[(4'ha):(4'h8)])} : wire124);
        end
      reg133 <= wire124;
    end
  assign wire134 = (($unsigned(wire126) ?
                       $signed(wire118[(2'h2):(2'h2)]) : ({wire128[(4'hb):(4'ha)]} ?
                           wire122[(1'h1):(1'h0)] : ((reg132 ?
                                   wire120 : wire118) ?
                               ((8'hae) || wire128) : wire123[(3'h5):(1'h1)]))) | (+{reg129}));
  assign wire135 = wire123;
  always
    @(posedge clk) begin
      if (wire124[(5'h13):(4'hb)])
        begin
          reg136 <= ($unsigned((8'hbb)) ?
              $unsigned(wire135) : $signed((^(+((8'hbf) > (8'ha4))))));
          reg137 <= $signed(wire121[(5'h14):(5'h10)]);
          reg138 <= reg136;
          reg139 <= ((|reg131[(2'h2):(1'h0)]) + (^(reg137 ?
              {{reg132}} : reg131[(4'hc):(3'h6)])));
          reg140 <= reg131[(4'hd):(4'hc)];
        end
      else
        begin
          reg136 <= wire123[(3'h4):(2'h2)];
          reg137 <= reg139;
          reg138 <= {((wire125 ?
                  (8'hbb) : wire119[(4'h9):(1'h0)]) && {$unsigned((wire120 < (8'ha5)))}),
              $unsigned((({wire122, wire128} ?
                  $signed(wire123) : (-reg139)) && ((wire124 >> wire128) ?
                  $signed(wire118) : $signed(reg130))))};
          reg139 <= wire118[(4'hc):(4'hc)];
          reg140 <= wire128[(5'h12):(4'hc)];
        end
      if ((8'hb1))
        begin
          reg141 <= (($signed(reg132) == $signed(({reg133} | ((8'hb6) ?
              reg136 : wire134)))) << wire127[(5'h12):(3'h7)]);
          reg142 <= (reg129 ^~ (|$unsigned(($signed(reg136) ?
              (-(8'hb8)) : reg138))));
        end
      else
        begin
          reg141 <= $signed(({(((8'hb2) ? wire134 : wire122) ?
                      $signed(reg133) : (^~wire135))} ?
              reg140 : (($signed(wire120) ^ $unsigned(wire125)) < wire127)));
          reg142 <= $signed((reg131[(4'hc):(1'h0)] ~^ (|{wire127,
              (wire134 ? wire135 : reg139)})));
          reg143 <= reg131[(4'hb):(4'ha)];
        end
      if ($unsigned(reg141[(3'h4):(1'h1)]))
        begin
          reg144 <= (reg142[(4'h9):(3'h4)] ?
              $unsigned((((~&reg137) ?
                      reg137[(4'h9):(2'h2)] : $unsigned(reg133)) ?
                  (reg130[(4'hb):(4'hb)] << $signed(reg129)) : $unsigned((reg130 ?
                      (7'h42) : reg132)))) : wire121[(3'h4):(3'h4)]);
        end
      else
        begin
          reg144 <= (((wire118 != (reg141 + $signed(wire121))) >>> reg133[(3'h6):(3'h5)]) == (8'hb4));
          reg145 <= (8'ha9);
        end
    end
  assign wire146 = reg132;
  assign wire147 = $signed((reg140 ?
                       (!$signed($signed(wire146))) : $signed(((reg138 + (8'ha0)) > (wire118 ?
                           wire121 : wire128)))));
  assign wire148 = ($unsigned(($signed(wire147) >> $signed((wire123 | reg142)))) ?
                       (~^$signed({{reg145, reg132}})) : {wire122});
  always
    @(posedge clk) begin
      reg149 <= (&(8'hb2));
      reg150 <= $signed(reg142);
      if ($signed($signed((reg144 ?
          $signed(reg132) : $signed((wire119 ? reg150 : (8'had)))))))
        begin
          reg151 <= ($unsigned((~^wire120[(3'h6):(2'h3)])) | (|wire128[(5'h10):(4'hb)]));
          reg152 <= (!$signed((+$signed((|reg143)))));
          reg153 <= wire118;
          reg154 <= {{$unsigned($unsigned(wire126[(3'h5):(1'h1)])),
                  reg130[(4'hb):(4'hb)]},
              wire122};
          reg155 <= (-((-($unsigned((8'hb6)) ? reg149 : reg132)) ?
              ($unsigned(wire146[(2'h3):(1'h1)]) & (reg139[(1'h1):(1'h0)] && (~reg129))) : {(|$unsigned(reg137))}));
        end
      else
        begin
          reg151 <= wire120[(5'h13):(2'h3)];
          reg152 <= (~$signed((~|$unsigned({wire124}))));
          reg153 <= ($unsigned({(8'hbb), {reg133[(3'h5):(3'h4)], reg152}}) ?
              (($unsigned(reg154[(3'h4):(2'h3)]) == $signed($signed(reg130))) != reg144[(2'h2):(2'h2)]) : $unsigned(wire146[(1'h0):(1'h0)]));
        end
    end
  assign wire156 = (reg141[(1'h1):(1'h1)] ?
                       wire148[(4'hd):(4'h9)] : $signed(wire120[(4'hc):(3'h7)]));
  assign wire157 = reg152[(2'h2):(2'h2)];
  assign wire158 = $unsigned((~reg152[(4'hf):(2'h3)]));
  assign wire159 = (reg145[(3'h5):(1'h0)] ?
                       wire125 : (-wire146[(1'h1):(1'h0)]));
  assign wire160 = ((reg154 ?
                           (8'hb3) : $signed($unsigned($unsigned(wire120)))) ?
                       $unsigned((^~wire122)) : (reg139 <<< ($signed((reg155 ?
                               reg151 : reg137)) ?
                           wire147[(3'h7):(2'h2)] : ($signed(wire128) > $unsigned(reg150)))));
  assign wire161 = reg131[(3'h6):(2'h3)];
  assign wire162 = wire161[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((!{{($unsigned(wire124) < reg129[(1'h0):(1'h0)])}}))
        begin
          reg163 <= (|$signed(reg132));
          reg164 <= wire147;
        end
      else
        begin
          reg163 <= ({wire126, {wire119, (&$unsigned((8'hb5)))}} ?
              ({$unsigned(wire128), ((8'hbf) != $signed((8'hb3)))} ?
                  reg140 : $unsigned(wire119[(5'h12):(3'h7)])) : reg137);
          if ($unsigned(wire146[(1'h1):(1'h0)]))
            begin
              reg164 <= wire162[(3'h7):(3'h6)];
            end
          else
            begin
              reg164 <= {$unsigned($unsigned($signed($unsigned(wire122)))),
                  (reg131 ?
                      $signed(wire134) : ((~|$signed((8'ha4))) || reg154))};
              reg165 <= wire146;
            end
        end
      reg166 <= $unsigned($unsigned(wire127));
      reg167 <= reg132[(5'h13):(2'h3)];
      reg168 <= reg151;
      reg169 <= {reg164[(4'h9):(1'h0)]};
    end
  assign wire170 = reg152;
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire13;
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  assign y = {wire113,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire13,
                 reg112,
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
  assign wire13 = (~|$unsigned(((~|(-wire9)) >> $signed($unsigned(wire9)))));
  module14 #() modinst44 (.wire15(wire12), .wire16(wire10), .wire17(wire9), .wire18(wire13), .y(wire43), .clk(clk));
  assign wire45 = $unsigned(((+{(+wire43),
                      $signed(wire10)}) > (((!wire10) ^ (!wire43)) ?
                      wire12 : $unsigned($unsigned(wire8)))));
  assign wire46 = wire11[(1'h1):(1'h0)];
  assign wire47 = $unsigned(wire11);
  assign wire48 = (wire46[(3'h4):(1'h1)] ?
                      {$unsigned($unsigned(wire45[(4'hb):(2'h3)]))} : {$signed({(wire46 ?
                                  wire8 : wire43)}),
                          {wire9, (^$unsigned(wire9))}});
  module49 #() modinst81 (wire80, clk, wire48, wire11, wire10, wire45);
  assign wire82 = ($unsigned((wire10[(5'h10):(4'hd)] >= wire10[(4'hc):(3'h6)])) ?
                      wire47[(1'h1):(1'h1)] : ({{wire12[(1'h1):(1'h0)],
                              {wire48}}} != ((((8'hb2) ?
                          wire12 : (8'ha5)) >= wire12) ^~ {wire48[(2'h3):(1'h1)]})));
  assign wire83 = (~&(($unsigned((wire9 ?
                      wire12 : wire80)) * (7'h44)) - wire82));
  assign wire84 = wire47[(1'h1):(1'h0)];
  assign wire85 = wire46[(1'h0):(1'h0)];
  assign wire86 = $signed({(~^wire9)});
  assign wire87 = wire10;
  always
    @(posedge clk) begin
      reg88 <= $unsigned($signed($unsigned(wire87)));
      reg89 <= ($signed(wire48[(1'h0):(1'h0)]) >= {(wire12[(3'h7):(1'h1)] ?
              wire43 : $unsigned($signed(wire45)))});
      if ($unsigned((&$unsigned(wire85))))
        begin
          if ($unsigned(wire86))
            begin
              reg90 <= (^~wire13[(4'hb):(3'h5)]);
              reg91 <= wire13;
              reg92 <= wire86;
              reg93 <= (((~{(reg89 ~^ wire9)}) <<< (|({wire10, wire48} ?
                      (^wire84) : wire82))) ?
                  (($unsigned($signed((8'h9c))) && ((!wire10) ?
                      (wire10 == (8'ha0)) : (wire80 ?
                          wire82 : (8'h9e)))) & (wire10 ?
                      $signed((reg92 == reg91)) : $signed((~|wire12)))) : (wire43 || {wire8}));
              reg94 <= wire80;
            end
          else
            begin
              reg90 <= (8'hbd);
              reg91 <= ($unsigned((+wire10)) != ({(wire47 ?
                          {reg88, reg91} : (wire43 <= wire87)),
                      $signed((wire87 ? (8'hb8) : reg91))} ?
                  wire82[(2'h2):(1'h1)] : {wire84, reg93[(1'h0):(1'h0)]}));
              reg92 <= $unsigned((&(~reg93)));
              reg93 <= wire9;
              reg94 <= (($unsigned(wire11[(3'h6):(1'h0)]) >= $signed(wire11[(2'h3):(2'h2)])) ?
                  $unsigned(({$unsigned(reg91)} ?
                      $unsigned((&reg93)) : wire8)) : reg88[(4'hc):(4'h8)]);
            end
          reg95 <= reg88;
          if ((8'had))
            begin
              reg96 <= (wire13 > ($unsigned((((8'hbd) ? wire48 : wire80) ?
                  {wire11} : reg90)) == ($unsigned((wire9 > wire80)) & $unsigned((~^wire83)))));
              reg97 <= ($signed($unsigned(wire9)) >= ($unsigned((~|(^~wire84))) < {$signed((^reg95))}));
              reg98 <= (wire43 || $unsigned(($unsigned((wire47 ?
                  (8'hb9) : reg90)) <<< (((8'hb5) ?
                  reg93 : (7'h40)) <= $unsigned((8'ha4))))));
              reg99 <= wire82[(3'h6):(3'h6)];
              reg100 <= reg93[(4'h8):(3'h6)];
            end
          else
            begin
              reg96 <= ((~&$unsigned($signed((~&wire13)))) ?
                  wire13 : (((wire43[(3'h5):(2'h3)] ?
                          $unsigned((8'had)) : {reg90,
                              (8'ha1)}) != $unsigned(wire48)) ?
                      wire84 : wire86[(4'ha):(3'h7)]));
              reg97 <= reg92;
              reg98 <= $unsigned((-$signed(reg99)));
              reg99 <= $signed($signed(reg98));
              reg100 <= reg96[(5'h13):(3'h6)];
            end
          reg101 <= wire87;
          reg102 <= wire12[(4'hb):(3'h5)];
        end
      else
        begin
          reg90 <= reg94[(4'hf):(4'h9)];
          reg91 <= ((8'hb0) << reg98[(3'h4):(3'h4)]);
          reg92 <= ($unsigned(wire48) ?
              (wire13 == wire10) : {wire87[(4'hb):(4'ha)]});
          if ($unsigned(reg93))
            begin
              reg93 <= reg100[(2'h3):(1'h0)];
              reg94 <= reg96;
              reg95 <= wire13;
            end
          else
            begin
              reg93 <= wire9[(4'ha):(3'h6)];
              reg94 <= wire47[(1'h0):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      if ($signed((wire83[(3'h4):(3'h4)] ?
          ($unsigned((wire11 + reg98)) ?
              (~wire84) : (-$unsigned(wire87))) : {(+reg88[(3'h4):(2'h2)])})))
        begin
          reg103 <= ($signed((+{(wire48 + (8'hb9)),
              {(7'h43)}})) >= (-$signed($unsigned((^wire45)))));
          reg104 <= wire82[(3'h6):(1'h0)];
          if (wire84)
            begin
              reg105 <= $unsigned(wire80);
              reg106 <= ((~(8'hb3)) <<< (-$unsigned((wire43[(3'h7):(3'h6)] < (-wire86)))));
              reg107 <= (wire10 ? wire45[(1'h1):(1'h1)] : $signed(wire46));
            end
          else
            begin
              reg105 <= (8'ha4);
              reg106 <= wire43[(1'h1):(1'h0)];
              reg107 <= $signed(wire80[(2'h2):(1'h0)]);
            end
          reg108 <= $signed(wire85);
        end
      else
        begin
          if ($unsigned({(~&(8'hbb))}))
            begin
              reg103 <= reg95;
              reg104 <= $unsigned((reg96 == ($unsigned(((8'hb9) ^~ reg88)) ?
                  reg108[(1'h1):(1'h1)] : $unsigned((~reg94)))));
              reg105 <= (reg105 ?
                  $signed((8'hb7)) : ((reg94[(4'hc):(3'h7)] <<< reg92[(3'h5):(2'h3)]) ?
                      reg98[(2'h3):(2'h3)] : ((!(^wire85)) ?
                          ((wire9 ?
                              (8'hb2) : wire13) | reg88) : {(reg101 >>> wire13)})));
            end
          else
            begin
              reg103 <= $signed({reg101[(5'h10):(4'hf)]});
            end
          reg106 <= $unsigned((wire86[(4'hb):(4'h9)] ?
              wire9 : ($signed({wire86}) & (~|$unsigned(reg102)))));
        end
      reg109 <= (reg105[(1'h1):(1'h0)] ?
          ($signed(($unsigned(reg105) + (wire86 ? wire47 : reg100))) ?
              wire43 : (($unsigned(wire10) < reg102) ?
                  {$signed(reg104),
                      $signed(reg90)} : reg97[(4'h8):(1'h0)])) : (~^$signed((-$unsigned(wire47)))));
      reg110 <= wire87;
      reg111 <= $unsigned($signed($unsigned(reg101)));
      reg112 <= (-(reg110[(1'h1):(1'h0)] ?
          ($signed((8'ha6)) ?
              ((-reg98) ? (+wire45) : $unsigned(reg106)) : wire9) : ((8'ha9) ?
              $signed({reg101}) : ({(8'ha0), wire84} >= (reg91 ?
                  wire82 : reg109)))));
    end
  assign wire113 = (~&(7'h41));
endmodule

module module49
#(parameter param79 = ((({(!(7'h42))} - ((|(7'h42)) * (~(8'h9d)))) >= (((|(8'ha5)) > ((8'hbb) ? (8'h9f) : (8'hac))) ? {{(8'hb8)}, (8'ha6)} : (((8'hae) == (7'h43)) ^ ((8'had) ? (7'h40) : (8'ha5))))) - (^{{((8'h9d) ? (8'haa) : (8'ha4)), (^~(8'ha3))}})))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire53;
  input wire [(2'h3):(1'h0)] wire52;
  input wire [(4'hd):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire78;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire54;
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire54,
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
                 (1'h0)};
  assign wire54 = $signed({($unsigned($signed(wire51)) >> $unsigned(wire53[(3'h4):(2'h3)]))});
  always
    @(posedge clk) begin
      if ($signed((8'ha1)))
        begin
          reg55 <= wire50;
        end
      else
        begin
          reg55 <= wire51;
          if ($signed(((wire53 ^~ (8'hbc)) ?
              wire54[(3'h7):(2'h2)] : ({$unsigned(wire53),
                  ((8'ha4) & (8'hbe))} <= $unsigned((wire52 ?
                  (8'hbf) : wire54))))))
            begin
              reg56 <= (~&wire50);
              reg57 <= (reg56[(3'h4):(3'h4)] ?
                  (~($signed(wire54[(3'h6):(3'h4)]) ^~ $unsigned((~wire53)))) : ({(reg55[(2'h2):(1'h1)] - $unsigned(wire51)),
                      wire53} ^~ ({$unsigned((8'hac)),
                      (wire50 ?
                          reg56 : wire54)} == ((^reg56) != reg56[(4'ha):(4'h9)]))));
            end
          else
            begin
              reg56 <= reg55;
              reg57 <= $unsigned((wire54 <= ($unsigned((reg57 == (8'hb8))) ?
                  (((8'haf) || (7'h41)) || (wire51 ?
                      wire51 : wire51)) : {(wire50 ? wire52 : wire51)})));
              reg58 <= reg56[(4'ha):(4'h8)];
            end
          if ((((!$signed((reg57 >= (8'hb0)))) ?
                  (7'h43) : reg56[(4'hd):(3'h7)]) ?
              (+wire53) : (((^$signed(reg58)) + wire53[(3'h7):(1'h1)]) || $signed($unsigned(wire54[(4'he):(3'h6)])))))
            begin
              reg59 <= $unsigned(((($signed((8'ha0)) + (^~reg55)) || wire54) ?
                  $signed(($unsigned(wire52) + wire52[(2'h3):(2'h2)])) : (~^wire51[(4'hb):(2'h2)])));
              reg60 <= wire50;
              reg61 <= (!$signed((7'h40)));
              reg62 <= reg58[(2'h2):(1'h1)];
            end
          else
            begin
              reg59 <= $signed(reg58[(1'h0):(1'h0)]);
              reg60 <= $unsigned(($signed($unsigned(reg62[(3'h4):(2'h3)])) ?
                  wire54 : reg57));
            end
          if (((!reg55) ?
              (~(reg57 ?
                  wire51 : $unsigned((8'hab)))) : (wire52[(2'h2):(2'h2)] ~^ (((wire51 >>> reg61) ?
                  reg56 : $signed(reg60)) & ((reg58 ?
                  (8'ha1) : wire51) >= $unsigned(reg58))))))
            begin
              reg63 <= $unsigned(({reg55[(1'h1):(1'h0)],
                      ($unsigned(reg59) ? ((8'h9e) | reg56) : reg61)} ?
                  ({(reg62 + reg60),
                      (&reg59)} >> $unsigned((^~wire51))) : $signed($unsigned((&wire54)))));
              reg64 <= ($unsigned((wire50 ^~ reg56[(4'hc):(1'h1)])) < ($unsigned(((|wire50) <<< (8'hb6))) ?
                  (~|$unsigned((reg58 >= wire51))) : (~&{$signed(reg62)})));
            end
          else
            begin
              reg63 <= reg60[(3'h6):(2'h3)];
              reg64 <= (reg55[(4'h8):(2'h2)] == reg60);
              reg65 <= (^~(~wire51[(4'hc):(1'h1)]));
            end
          reg66 <= reg58[(5'h10):(3'h5)];
        end
      reg67 <= reg58[(5'h12):(4'h9)];
      reg68 <= ((8'ha7) <<< reg59[(2'h3):(1'h0)]);
      reg69 <= reg62;
      reg70 <= (!$signed($signed(reg65[(5'h12):(2'h3)])));
    end
  assign wire71 = $unsigned((-($signed(reg60) | $unsigned(((8'haa) ?
                      wire50 : wire54)))));
  assign wire72 = $unsigned($signed((({reg67} ?
                      (~&wire51) : $unsigned(reg66)) + reg58[(5'h10):(4'ha)])));
  assign wire73 = (reg65 ? ($unsigned(wire72[(3'h6):(1'h1)]) > reg62) : wire71);
  assign wire74 = $signed(reg68[(2'h3):(2'h2)]);
  assign wire75 = $signed((reg60[(1'h0):(1'h0)] ?
                      (&$unsigned((&wire54))) : {($unsigned(wire71) ?
                              (reg55 ? wire50 : reg62) : $signed((8'ha0)))}));
  assign wire76 = (&reg64[(4'hb):(4'ha)]);
  assign wire77 = (~^$signed($signed($signed({reg70, reg58}))));
  assign wire78 = reg64;
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
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
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = $signed($signed({((wire17 != (8'haf)) ?
                          (wire18 - wire17) : (8'hbe)),
                      wire18}));
  assign wire20 = (8'hbb);
  assign wire21 = ($unsigned(wire18[(4'hb):(3'h5)]) ?
                      (~&wire18[(3'h7):(2'h3)]) : {$unsigned(((wire15 ^~ wire15) - (^wire20)))});
  always
    @(posedge clk) begin
      reg22 <= (|$signed($unsigned((^~(wire15 ? (8'haf) : wire17)))));
      if (reg22)
        begin
          reg23 <= $unsigned(wire20[(3'h6):(2'h2)]);
          reg24 <= $unsigned($signed((&$unsigned((~|reg23)))));
          reg25 <= wire20;
          reg26 <= ($signed((wire17 ?
              wire18 : wire16)) * (($signed(reg25) ^~ reg23[(1'h0):(1'h0)]) && (wire16 >> (~^(wire16 ?
              wire20 : (8'hba))))));
        end
      else
        begin
          reg23 <= $signed((-wire18));
          reg24 <= $signed({$unsigned(((!wire19) << reg22[(3'h4):(3'h4)])),
              (^~($signed(wire15) ^~ $signed(reg24)))});
          if (((|wire20) ?
              $signed(($signed(reg22[(4'ha):(2'h3)]) ^~ wire19)) : $signed(wire16)))
            begin
              reg25 <= $unsigned($signed({wire17}));
            end
          else
            begin
              reg25 <= $signed((($unsigned(reg23) ?
                      $signed((reg23 ? wire19 : wire19)) : wire21) ?
                  reg22 : $unsigned($signed($unsigned((8'hb9))))));
              reg26 <= (wire18 ?
                  (((|((8'ha2) & wire17)) ? wire15 : reg23[(1'h1):(1'h0)]) ?
                      wire19 : reg26) : $signed($signed($unsigned((wire15 <<< (8'hb9))))));
              reg27 <= wire20;
              reg28 <= reg27[(3'h4):(2'h2)];
            end
        end
      reg29 <= ($signed($signed({reg26[(4'hc):(1'h1)], wire16})) ?
          reg25[(1'h0):(1'h0)] : $unsigned($unsigned(reg28[(4'hc):(2'h2)])));
      if (reg22[(5'h11):(4'h9)])
        begin
          reg30 <= {(wire18[(4'h9):(1'h0)] & $unsigned((!((8'hae) > reg25))))};
          reg31 <= ((+((wire16[(4'he):(4'hc)] ?
              reg28[(1'h0):(1'h0)] : {wire18}) < reg26[(1'h0):(1'h0)])) && $unsigned($unsigned(reg22)));
          reg32 <= {$unsigned(($unsigned((~|wire16)) ?
                  $signed((8'hbd)) : reg30[(2'h3):(1'h1)])),
              (-reg27[(3'h5):(3'h5)])};
        end
      else
        begin
          if ((~^$unsigned((|reg28[(4'ha):(2'h3)]))))
            begin
              reg30 <= {(((reg24 ?
                      {(8'hb2),
                          reg32} : $signed(reg22)) ^ reg30[(1'h0):(1'h0)]) || $unsigned((wire18[(4'h8):(4'h8)] ?
                      (reg32 ? wire17 : (8'ha4)) : (^(8'h9f)))))};
              reg31 <= wire15;
              reg32 <= $signed(reg23[(1'h1):(1'h0)]);
            end
          else
            begin
              reg30 <= {(wire17 ~^ wire20)};
              reg31 <= ((($signed(wire21) >= (~$signed(reg26))) << (8'hb3)) - reg24);
            end
          if ($signed(((~^reg30[(1'h0):(1'h0)]) ? reg24 : {reg23, reg27})))
            begin
              reg33 <= wire19;
            end
          else
            begin
              reg33 <= wire15;
              reg34 <= reg32[(3'h4):(2'h2)];
              reg35 <= reg23[(2'h2):(2'h2)];
            end
        end
      if ({$signed((|((8'ha9) ? $signed(wire18) : (^~wire16)))),
          ({$signed(reg24)} <<< $signed(((wire21 | wire20) > {wire17,
              wire17})))})
        begin
          reg36 <= reg31;
          reg37 <= {(((!wire17[(3'h4):(2'h3)]) ?
                  ((reg30 ? wire17 : (8'ha5)) ?
                      reg22 : (reg33 >> reg32)) : ($unsigned(reg23) ?
                      (reg31 ?
                          (7'h42) : (8'ha1)) : wire21[(4'ha):(2'h2)])) ~^ (|{$signed(reg24)})),
              $unsigned(((-(-wire15)) ?
                  ((-reg31) ? $unsigned(reg23) : reg23) : (~^(!reg27))))};
        end
      else
        begin
          if (reg25[(2'h3):(1'h0)])
            begin
              reg36 <= $unsigned($signed(($unsigned(reg22[(5'h13):(1'h1)]) == reg37[(3'h4):(2'h2)])));
            end
          else
            begin
              reg36 <= $unsigned((-(8'hb8)));
              reg37 <= (~$signed((~&{$signed(reg33)})));
            end
          reg38 <= (!reg26);
          reg39 <= ($signed(reg35) & $unsigned(reg22));
          if ($signed(((!{(8'ha4)}) >= reg24[(4'hd):(4'hc)])))
            begin
              reg40 <= wire18;
            end
          else
            begin
              reg40 <= (($unsigned(($signed(wire20) == (^(7'h44)))) >>> {($signed(reg25) <<< reg39),
                  reg23[(1'h0):(1'h0)]}) >> (~^reg25));
              reg41 <= reg39[(1'h1):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      if (($signed({$signed((8'hb4))}) ? (^(|wire16[(3'h4):(3'h4)])) : reg35))
        begin
          reg42 <= $signed(wire17);
        end
      else
        begin
          reg42 <= {(wire21 ?
                  $unsigned(((~&reg27) ?
                      $signed(reg25) : (!reg23))) : ((7'h41) == ((reg23 ?
                      reg34 : reg37) ~^ $signed(reg41)))),
              $unsigned({(~&(^~reg36)), $unsigned(reg24[(5'h10):(4'hd)])})};
        end
    end
endmodule
