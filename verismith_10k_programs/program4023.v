module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire187;
  wire signed [(5'h11):(1'h0)] wire184;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg186 = (1'h0);
  assign y = {wire187,
                 wire184,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg186,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire3[(1'h1):(1'h1)];
  assign wire7 = $unsigned(($signed((^wire0)) || ((^~(wire6 == wire0)) + $signed($unsigned(wire0)))));
  assign wire8 = (wire3[(2'h2):(2'h2)] ?
                     $signed($unsigned((~^wire4))) : wire6[(3'h6):(3'h6)]);
  assign wire9 = $signed(wire8);
  module10 #() modinst185 (wire184, clk, wire3, wire6, wire4, wire1);
  always
    @(posedge clk) begin
      reg186 <= (wire1 | (~|$unsigned(wire1[(1'h1):(1'h1)])));
    end
  assign wire187 = (wire5 ^~ (~(~|((wire0 ?
                       wire3 : wire184) & (wire0 & wire4)))));
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire151;
  wire [(4'he):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire182;
  assign y = {wire107,
                 wire62,
                 wire60,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire109,
                 wire148,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 wire154,
                 wire182,
                 (1'h0)};
  assign wire15 = {wire11[(3'h7):(1'h0)],
                      $signed((wire11[(2'h3):(1'h0)] - $unsigned((wire13 ?
                          wire13 : wire12))))};
  assign wire16 = wire13[(5'h11):(3'h5)];
  assign wire17 = wire12;
  assign wire18 = wire14[(4'ha):(4'ha)];
  assign wire19 = {$unsigned(wire18[(2'h3):(1'h1)])};
  assign wire20 = (wire15[(2'h2):(2'h2)] < (wire17[(1'h1):(1'h0)] ?
                      wire11[(4'h9):(3'h4)] : $signed(wire12[(4'h8):(2'h3)])));
  module21 #() modinst61 (wire60, clk, wire12, wire11, wire19, wire15);
  assign wire62 = wire20[(4'h9):(3'h4)];
  module63 #() modinst108 (wire107, clk, wire20, wire14, wire60, wire62, wire18);
  assign wire109 = ((^~wire60) | wire13[(5'h11):(4'hf)]);
  module110 #() modinst149 (wire148, clk, wire13, wire107, wire16, wire20);
  assign wire150 = wire109;
  assign wire151 = $signed(($signed(($unsigned(wire18) ? wire148 : (8'ha4))) ?
                       ({(wire11 ? wire60 : wire60),
                           {wire15,
                               wire148}} > wire14) : ((8'hb3) != wire150[(3'h7):(3'h4)])));
  assign wire152 = $signed((~(~|$signed($unsigned(wire151)))));
  assign wire153 = wire16;
  assign wire154 = $signed((~(^~(8'h9d))));
  module155 #() modinst183 (.wire158(wire19), .wire156(wire17), .wire159(wire18), .wire160(wire153), .clk(clk), .y(wire182), .wire157(wire60));
endmodule

module module155
#(parameter param181 = (((~({(8'h9c), (8'hbb)} | ((8'hbc) ? (8'hac) : (8'haa)))) ? (-(((8'h9c) - (8'hb0)) == ((8'haa) ? (8'ha6) : (8'hab)))) : (~{((8'hbd) ? (8'had) : (8'hbf))})) >>> ({(((8'hbb) ? (8'hb2) : (8'hbd)) >= {(8'ha2), (8'hbb)})} <= (((!(7'h44)) ? {(8'hb6)} : {(8'ha1), (8'ha3)}) && (~^((7'h44) ? (8'ha1) : (7'h43)))))))
(y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire160;
  input wire signed [(4'hf):(1'h0)] wire159;
  input wire signed [(5'h14):(1'h0)] wire158;
  input wire [(5'h13):(1'h0)] wire157;
  input wire [(4'hd):(1'h0)] wire156;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(3'h5):(1'h0)] wire179;
  wire [(4'he):(1'h0)] wire178;
  wire signed [(4'hb):(1'h0)] wire177;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(3'h6):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(5'h12):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire163,
                 wire162,
                 wire161,
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
                 (1'h0)};
  assign wire161 = $signed((wire157[(3'h5):(3'h5)] + wire160[(4'hd):(4'h9)]));
  assign wire162 = wire159[(4'hb):(3'h7)];
  assign wire163 = wire160;
  always
    @(posedge clk) begin
      if ($signed((($signed(wire162[(3'h6):(2'h3)]) ?
              (wire158 * (~|wire156)) : wire161[(3'h4):(2'h3)]) ?
          wire161[(3'h7):(1'h0)] : ($signed({wire158}) > (8'hb5)))))
        begin
          reg164 <= {($unsigned($unsigned(wire160)) ?
                  {$signed((8'h9f))} : (wire159[(3'h5):(3'h5)] ?
                      wire161[(3'h4):(1'h0)] : (wire159[(4'h9):(3'h7)] ?
                          $unsigned(wire160) : {wire159})))};
          reg165 <= (-$unsigned(((reg164[(3'h6):(3'h5)] ?
                  $signed(wire163) : $signed(wire158)) ?
              (~|(wire163 ? wire157 : wire161)) : $signed($signed(wire159)))));
          reg166 <= wire161[(4'ha):(3'h5)];
        end
      else
        begin
          if (wire158[(5'h12):(4'ha)])
            begin
              reg164 <= wire158[(2'h3):(1'h0)];
            end
          else
            begin
              reg164 <= (8'ha3);
              reg165 <= $unsigned(reg166[(2'h3):(2'h2)]);
              reg166 <= reg165;
            end
          if ($unsigned(wire159))
            begin
              reg167 <= wire162[(2'h2):(2'h2)];
            end
          else
            begin
              reg167 <= ((-(wire162[(1'h0):(1'h0)] ?
                  wire162[(2'h2):(1'h1)] : $signed((wire156 ?
                      (8'h9d) : wire161)))) == reg165);
              reg168 <= wire163[(1'h0):(1'h0)];
              reg169 <= $signed(wire160[(4'h8):(3'h6)]);
            end
          if (((~^((+wire163[(3'h7):(2'h3)]) ?
                  ((wire162 || reg167) ?
                      $signed(wire157) : $signed(reg166)) : wire158)) ?
              {((&reg166) >> $signed((8'hac))),
                  $signed((~|(reg164 | wire163)))} : (|$unsigned((wire158 || (wire161 ?
                  reg169 : wire161))))))
            begin
              reg170 <= $signed((-(&$signed($unsigned(reg165)))));
              reg171 <= reg167;
            end
          else
            begin
              reg170 <= (reg166[(1'h0):(1'h0)] ^~ (!(&wire160[(4'hd):(3'h6)])));
              reg171 <= (((($unsigned(reg169) ?
                      reg165 : (wire158 == reg169)) & (8'ha2)) < wire160[(4'h8):(3'h7)]) ?
                  $unsigned((wire163 - wire160)) : $unsigned(reg169));
              reg172 <= $unsigned($signed((reg167 << $signed($signed(wire162)))));
              reg173 <= (~&{(~&$unsigned((wire156 ? reg165 : wire163))),
                  {((reg172 <<< reg169) >> (wire162 ? reg172 : wire156)),
                      (wire163[(4'h9):(4'h8)] << $signed(reg166))}});
            end
        end
      reg174 <= ({$signed(((wire159 != wire157) >> (reg168 ?
                  (8'hb6) : reg171)))} ?
          wire158[(1'h0):(1'h0)] : reg172[(5'h13):(4'hd)]);
    end
  always
    @(posedge clk) begin
      reg175 <= $signed(($signed(reg167) || ($unsigned((~reg173)) ?
          (~(~&wire163)) : (|reg168))));
      reg176 <= reg174[(3'h4):(1'h0)];
    end
  assign wire177 = (8'ha6);
  assign wire178 = (wire161[(2'h2):(1'h0)] * wire160[(4'hf):(2'h3)]);
  assign wire179 = $unsigned(($unsigned((^(-wire161))) <<< $signed(($signed(reg170) ?
                       (wire158 ? reg173 : reg167) : $signed(reg165)))));
  assign wire180 = reg166;
endmodule

module module110  (y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire114;
  input wire [(2'h2):(1'h0)] wire113;
  input wire signed [(3'h5):(1'h0)] wire112;
  input wire signed [(4'hb):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire123,
                 wire122,
                 wire116,
                 wire115,
                 reg142,
                 reg141,
                 reg140,
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
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire115 = {wire114,
                       (~|(($signed(wire113) ?
                           (wire114 <<< wire113) : wire112) + ((wire112 ?
                               wire113 : (8'ha2)) ?
                           wire114[(1'h0):(1'h0)] : (^wire111))))};
  assign wire116 = (wire113[(1'h0):(1'h0)] ?
                       $signed((wire114 >>> (wire115 ?
                           wire111 : $signed(wire113)))) : (~&$signed($signed(wire111[(2'h2):(2'h2)]))));
  always
    @(posedge clk) begin
      reg117 <= wire112[(1'h1):(1'h0)];
      reg118 <= ((wire112 ?
          (~^(wire114 ?
              $unsigned((8'hbd)) : ((8'ha7) ?
                  (8'ha4) : wire112))) : $signed((~^$unsigned((8'ha0))))) - wire115);
      reg119 <= wire116[(2'h3):(2'h3)];
      reg120 <= wire112;
      reg121 <= (~|{wire112});
    end
  assign wire122 = $unsigned($unsigned($unsigned($unsigned((wire116 - reg119)))));
  assign wire123 = ($signed((reg118 ?
                           (~(reg119 ? wire112 : reg119)) : ({wire116} ?
                               (wire111 ~^ wire113) : {reg121, wire113}))) ?
                       ($signed($signed($unsigned((8'ha8)))) <<< $signed({$unsigned(wire112),
                           (~|reg119)})) : $signed(wire122));
  always
    @(posedge clk) begin
      reg124 <= $signed($unsigned(wire123));
      if (reg118)
        begin
          if ($unsigned(({{(+wire116)}, reg117} ?
              (~^(^(reg117 > reg117))) : (!(wire112 * wire111)))))
            begin
              reg125 <= ((reg119[(3'h5):(3'h5)] ?
                      (+{reg118}) : (~&$signed($signed(reg118)))) ?
                  wire115[(4'ha):(2'h3)] : ($unsigned($unsigned($unsigned(reg124))) ?
                      (reg118 ?
                          reg124[(1'h1):(1'h0)] : $signed($unsigned(reg119))) : (~|wire113)));
              reg126 <= $signed(((wire115 ?
                      $signed(wire123) : (reg119 ?
                          $signed(reg117) : wire112[(3'h5):(1'h1)])) ?
                  (((reg118 ?
                      wire111 : (8'h9d)) >= (reg121 <<< wire111)) >> (~&$unsigned(reg124))) : $signed(($unsigned(reg124) ?
                      $unsigned((8'hbd)) : {reg117}))));
              reg127 <= wire114[(4'hd):(4'hc)];
              reg128 <= ($unsigned((($unsigned(wire111) ?
                      $unsigned(wire112) : (wire114 * wire116)) ?
                  wire122 : $signed((wire123 ^ (8'ha7))))) << ((reg119[(1'h0):(1'h0)] ?
                      ({(8'h9f)} ?
                          reg124[(3'h4):(1'h1)] : (wire112 - wire114)) : $unsigned(((8'hac) && reg121))) ?
                  $unsigned((wire122 ?
                      (reg127 ?
                          wire115 : reg119) : (reg118 != wire112))) : wire115[(4'hc):(4'ha)]));
              reg129 <= wire113;
            end
          else
            begin
              reg125 <= wire112;
              reg126 <= (~|(reg121 ? (^(-$unsigned(wire114))) : reg119));
              reg127 <= reg119[(4'he):(4'hc)];
              reg128 <= {(-$signed(reg129)), (7'h43)};
            end
          reg130 <= $signed((reg124 * $signed(({reg119} << $signed(reg129)))));
          reg131 <= ((~wire113) >= (((~$signed(wire114)) | wire114) * ((~$signed(reg117)) ^~ $signed($unsigned(reg121)))));
          if ({reg119[(5'h10):(4'hc)]})
            begin
              reg132 <= $signed($unsigned({$unsigned((wire122 || wire111)),
                  ((&wire113) << (wire115 ? reg117 : reg129))}));
            end
          else
            begin
              reg132 <= ((reg129 ^~ $signed((reg128[(3'h4):(1'h1)] ?
                  (reg131 ? reg117 : reg129) : (reg127 ?
                      reg121 : reg130)))) == ((~^(reg121[(4'hc):(3'h6)] <<< (7'h42))) ?
                  $signed(reg130[(4'ha):(3'h7)]) : {(wire112 ?
                          {wire116, (8'had)} : (wire123 ? reg119 : (8'hb9)))}));
              reg133 <= (!reg131);
              reg134 <= (wire116 ? $unsigned(reg121[(4'ha):(4'h9)]) : wire116);
            end
          reg135 <= reg129[(3'h5):(3'h5)];
        end
      else
        begin
          if (reg133)
            begin
              reg125 <= reg134;
              reg126 <= reg117[(3'h4):(1'h0)];
            end
          else
            begin
              reg125 <= $unsigned(reg134);
            end
          reg127 <= ($signed($signed($unsigned(reg124[(3'h7):(2'h3)]))) ?
              (reg124 ?
                  (~|$signed(wire114[(4'h9):(3'h7)])) : ($unsigned($signed((8'ha8))) ?
                      reg133[(2'h2):(1'h1)] : $unsigned((wire115 ?
                          reg133 : (8'ha9))))) : reg127);
        end
    end
  assign wire136 = (~{$signed((wire115 >= (reg118 ? reg125 : (7'h43)))),
                       $signed((((8'hbe) + reg127) ?
                           {(7'h42), (8'hac)} : $unsigned(reg134)))});
  assign wire137 = wire122[(1'h0):(1'h0)];
  assign wire138 = (8'hb8);
  assign wire139 = (8'hab);
  always
    @(posedge clk) begin
      reg140 <= (^~$signed((^~(~wire112))));
      reg141 <= ((((|reg132) ?
              {(reg133 & wire122)} : ({(7'h40)} ^~ {(8'ha0),
                  wire139})) + (~^(8'hb3))) ?
          $signed((^reg125)) : wire114[(3'h4):(2'h3)]);
      reg142 <= $signed($unsigned(((8'h9f) >> reg124)));
    end
  assign wire143 = (wire137 >= ($unsigned($unsigned($signed(wire114))) <= (wire116[(4'hb):(3'h7)] ?
                       wire123[(3'h6):(1'h0)] : wire112[(1'h0):(1'h0)])));
  assign wire144 = ($unsigned($unsigned($signed(wire143[(4'h8):(3'h5)]))) ?
                       wire114[(2'h2):(2'h2)] : (~{(&(-reg125)),
                           reg128[(1'h0):(1'h0)]}));
  assign wire145 = wire144[(4'hd):(3'h6)];
  assign wire146 = ((~^(~&$signed($unsigned(reg132)))) > (!wire145));
  assign wire147 = reg132[(2'h2):(2'h2)];
endmodule

module module63
#(parameter param106 = ((((((8'hb7) ? (8'hb3) : (8'hbb)) < (!(8'hbf))) >> ((-(8'hb1)) << (-(8'h9f)))) ? ({((7'h42) << (8'hbe))} && (((8'hb5) ? (8'haf) : (7'h41)) ? ((8'hb0) != (8'hab)) : ((8'ha0) ? (8'hb6) : (8'ha6)))) : (8'hb3)) <<< ((((~|(8'hb8)) >> ((8'hb4) ? (8'ha4) : (8'ha7))) >>> ((^(8'hb2)) ? {(8'haf)} : (~|(7'h40)))) + ((~&((8'hb3) ? (8'hb4) : (8'ha6))) || (7'h40)))))
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire68;
  input wire [(5'h15):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  input wire signed [(3'h4):(1'h0)] wire65;
  input wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire69;
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire72,
                 wire71,
                 wire69,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
                 reg74,
                 reg73,
                 reg70,
                 (1'h0)};
  assign wire69 = (!$unsigned(wire65));
  always
    @(posedge clk) begin
      reg70 <= ($signed(wire69[(4'hb):(3'h6)]) ^~ wire67[(4'ha):(4'h9)]);
    end
  assign wire71 = reg70;
  assign wire72 = wire67;
  always
    @(posedge clk) begin
      reg73 <= wire71;
      if ((~|wire69))
        begin
          reg74 <= (^~(wire68 ^ $signed((|wire65))));
          reg75 <= ((wire66[(1'h0):(1'h0)] & (reg70[(1'h0):(1'h0)] || $unsigned((wire64 ?
              wire71 : wire68)))) >>> (($unsigned(reg70) >>> $signed({wire67})) & wire64[(2'h2):(1'h1)]));
          if (wire69[(5'h15):(2'h3)])
            begin
              reg76 <= ($signed(wire71) ?
                  $signed(wire65) : $signed($unsigned({{(8'hb7)}, wire67})));
            end
          else
            begin
              reg76 <= $unsigned($signed($unsigned(({reg76,
                  wire66} & $signed(wire72)))));
              reg77 <= ($signed((|(-$signed(wire68)))) ?
                  (7'h44) : {((^wire71) == $unsigned((wire72 * wire65)))});
            end
          if ((wire71 ?
              $unsigned((~^{reg76[(1'h1):(1'h0)],
                  reg74[(2'h3):(2'h3)]})) : wire67))
            begin
              reg78 <= $signed(((({wire65} ^ (&reg73)) ?
                  (~&(wire68 ?
                      wire69 : wire67)) : (reg73[(4'ha):(2'h3)] + (~wire68))) * wire65[(2'h2):(1'h0)]));
              reg79 <= (reg70 == $signed($unsigned(((wire65 ?
                  wire68 : reg74) >>> wire67[(4'h9):(3'h4)]))));
              reg80 <= $unsigned(($signed(reg75) ?
                  wire68[(3'h5):(2'h2)] : reg75[(2'h2):(1'h0)]));
              reg81 <= $unsigned(((^((~|reg70) ?
                  (reg76 ~^ reg75) : $signed((8'hba)))) ^~ reg70));
              reg82 <= ($unsigned(wire71) ?
                  ($unsigned(((reg81 & (8'hb0)) ?
                      (8'h9e) : (&reg80))) && reg78) : wire72[(4'h8):(3'h4)]);
            end
          else
            begin
              reg78 <= (reg79 ?
                  (~^($unsigned(wire65[(2'h3):(1'h1)]) << ((~wire66) || (~|wire71)))) : wire72[(2'h3):(1'h0)]);
              reg79 <= (-$signed((~|($signed(reg80) ?
                  $unsigned(wire69) : $unsigned(reg75)))));
              reg80 <= $signed(reg74[(4'hd):(2'h2)]);
              reg81 <= (($signed((|(reg78 <<< wire71))) ?
                  reg80[(3'h4):(2'h2)] : (((^~(8'ha0)) ?
                      $signed(wire65) : wire71[(3'h4):(2'h3)]) < $signed((wire66 ?
                      reg80 : reg77)))) >= $signed({reg77[(3'h5):(3'h4)]}));
              reg82 <= {wire72, reg74[(4'hc):(1'h0)]};
            end
          if ((+{{{(wire64 << reg74)}, wire66}}))
            begin
              reg83 <= reg78[(4'hd):(3'h5)];
              reg84 <= wire72;
              reg85 <= reg73;
            end
          else
            begin
              reg83 <= $unsigned(wire64[(2'h2):(2'h2)]);
              reg84 <= ((wire71 || (((^wire66) ?
                          reg82[(2'h3):(2'h2)] : (~&reg85)) ?
                      ($unsigned(wire65) ?
                          {reg70} : reg79[(1'h0):(1'h0)]) : $signed(((8'hbd) ?
                          reg84 : reg80)))) ?
                  $unsigned($signed(reg83[(3'h4):(1'h1)])) : (8'h9f));
              reg85 <= (^~((|reg76) - $signed(wire65[(2'h2):(2'h2)])));
              reg86 <= wire66[(3'h4):(2'h2)];
              reg87 <= $signed({(^$unsigned((!reg84)))});
            end
        end
      else
        begin
          reg74 <= $signed({(~^$unsigned((reg76 < reg80)))});
          if ((wire67[(5'h11):(3'h7)] == (|wire64[(1'h1):(1'h0)])))
            begin
              reg75 <= $signed($unsigned({{$signed(reg70)}}));
              reg76 <= (8'hb3);
              reg77 <= $signed($unsigned((8'ha5)));
            end
          else
            begin
              reg75 <= ({$signed(reg81[(3'h7):(3'h6)])} ?
                  $unsigned(reg78[(4'hc):(4'hb)]) : (~|($signed($unsigned(wire67)) & reg75)));
              reg76 <= $unsigned((~&((!{reg85}) ?
                  reg82[(1'h1):(1'h1)] : reg78[(4'hd):(1'h1)])));
            end
          reg78 <= reg81;
          if (({((!wire65[(2'h2):(1'h0)]) == $signed((~&reg73))), wire67} ?
              $signed($signed(((reg80 || wire66) ?
                  ((8'ha9) * reg74) : $signed(reg76)))) : $signed(reg76)))
            begin
              reg79 <= (reg86 ?
                  ((($signed((8'hbc)) > (reg83 * (8'ha7))) ?
                          {$signed(wire64),
                              ((8'ha5) ? wire64 : wire68)} : $unsigned(reg77)) ?
                      wire67[(5'h15):(4'hd)] : $signed($signed(((8'ha1) == wire64)))) : $signed($signed((&{reg83,
                      reg70}))));
              reg80 <= ((reg87 ?
                      $signed((-$unsigned(reg81))) : $unsigned({reg86[(3'h6):(1'h1)]})) ?
                  $signed($signed(wire68[(4'hb):(4'hb)])) : reg81[(2'h2):(2'h2)]);
            end
          else
            begin
              reg79 <= ($signed((((wire66 ? reg87 : reg85) >>> (reg77 ?
                  reg75 : wire66)) ^ (-(wire69 ? reg74 : reg83)))) >= reg85);
              reg80 <= (~^(!$unsigned($signed(wire69))));
              reg81 <= reg70;
              reg82 <= (wire72[(3'h4):(3'h4)] ?
                  ((~&(|(reg77 ? reg79 : wire71))) ?
                      $signed($signed(reg75)) : wire66) : {(reg79 < (+$signed(reg75)))});
            end
        end
    end
  assign wire88 = (~|(reg80 & (reg82 ?
                      (-(reg81 >>> reg84)) : (wire64 ?
                          reg81[(3'h6):(3'h5)] : reg86))));
  assign wire89 = $signed(reg79);
  assign wire90 = $signed($signed($signed({{reg86}})));
  assign wire91 = {{$signed(wire68[(4'h8):(4'h8)]),
                          $unsigned($unsigned((8'h9f)))}};
  assign wire92 = (^($unsigned(($signed(wire64) <<< $unsigned((8'hb5)))) ^ (^~$signed(wire65[(1'h1):(1'h0)]))));
  assign wire93 = (-{($unsigned((^(8'hb6))) ?
                          {(~&wire65)} : (reg84[(4'h9):(3'h7)] >>> wire65[(2'h3):(2'h3)]))});
  assign wire94 = (~reg81[(4'h8):(3'h7)]);
  assign wire95 = ((reg70 ?
                          (($signed(wire67) ?
                              ((8'ha0) + wire90) : (&reg86)) & wire67) : (reg75[(3'h6):(2'h3)] ?
                              reg78[(2'h3):(1'h0)] : reg84)) ?
                      (wire93[(3'h6):(2'h2)] ?
                          (~&(~(wire92 <= wire72))) : wire93[(3'h5):(2'h2)]) : reg84);
  assign wire96 = ((-{$unsigned({reg75}),
                      $signed((8'ha5))}) <<< $signed(reg85[(4'h9):(3'h4)]));
  assign wire97 = $unsigned($unsigned($unsigned(((^reg76) || (^wire69)))));
  assign wire98 = $unsigned(wire96);
  assign wire99 = wire91[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire69)
        begin
          reg100 <= (8'hbb);
          reg101 <= ((8'h9e) ?
              {$signed(({wire69, (8'ha0)} ?
                      (^wire88) : (reg79 ? wire99 : reg73))),
                  $unsigned(((wire92 & reg87) ?
                      wire97[(2'h3):(1'h1)] : ((7'h42) ?
                          wire94 : reg74)))} : wire89[(2'h3):(1'h0)]);
        end
      else
        begin
          reg100 <= ($unsigned((^~reg79[(3'h4):(1'h1)])) ?
              (+$unsigned(reg84[(2'h3):(2'h2)])) : reg76[(2'h2):(1'h0)]);
          reg101 <= ($unsigned(wire91) ?
              (wire97 ?
                  $signed(wire72[(2'h3):(1'h0)]) : (~(~(wire98 >= reg79)))) : reg76[(2'h2):(2'h2)]);
        end
      reg102 <= $signed((((wire97 ?
              wire71[(2'h2):(1'h0)] : (wire95 ?
                  (8'ha7) : (8'hba))) * (wire90[(3'h5):(1'h1)] ^ reg73[(4'he):(1'h0)])) ?
          $signed((~^reg70[(3'h5):(1'h1)])) : ((~&wire99) <= $signed((|wire71)))));
      reg103 <= {reg102[(3'h4):(2'h3)]};
      if (($unsigned((&$unsigned((wire66 ? wire89 : (8'hb1))))) ?
          $unsigned(wire66[(2'h2):(1'h1)]) : $unsigned($unsigned((~|reg74[(3'h6):(3'h4)])))))
        begin
          reg104 <= (-($unsigned({(-wire91)}) != wire67));
          reg105 <= $unsigned(reg101[(4'hd):(1'h1)]);
        end
      else
        begin
          reg104 <= {(({$unsigned(wire98)} < reg105[(2'h3):(1'h1)]) ?
                  reg100[(3'h7):(3'h7)] : ((7'h44) ?
                      $unsigned((wire71 ?
                          wire98 : wire71)) : (reg84[(3'h6):(2'h3)] ?
                          ((8'ha1) ? reg83 : (8'hb1)) : $signed(reg83))))};
          reg105 <= ($signed(reg103[(3'h5):(3'h4)]) << wire93[(3'h4):(1'h0)]);
        end
    end
endmodule

module module21
#(parameter param59 = (~&{((~^(^(8'h9e))) == ((8'haa) ~^ ((8'ha6) ? (8'hb8) : (8'ha0)))), {(&(+(8'haa))), (7'h41)}}))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire27,
                 wire26,
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
                 reg43,
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
                 (1'h0)};
  assign wire26 = wire25[(4'h8):(3'h4)];
  assign wire27 = (!$unsigned(((|(^wire24)) || wire26)));
  always
    @(posedge clk) begin
      if (wire27[(2'h2):(1'h0)])
        begin
          if ({$signed($signed((wire25[(2'h2):(1'h1)] << (wire22 ?
                  wire27 : wire23))))})
            begin
              reg28 <= (-(8'hb8));
              reg29 <= (8'haf);
            end
          else
            begin
              reg28 <= (&$unsigned((~|wire27)));
              reg29 <= ((wire25[(3'h6):(1'h1)] >> {(-(^~wire25)),
                      $unsigned((8'ha3))}) ?
                  {{((reg28 ? wire22 : wire23) + $signed(wire24)),
                          $unsigned(wire26)},
                      $signed($signed(reg29[(2'h3):(2'h2)]))} : (-({(wire22 ?
                              wire23 : reg28),
                          (reg28 ? reg29 : wire25)} ?
                      (wire26[(2'h2):(1'h0)] ?
                          $unsigned(wire26) : $signed(reg28)) : ($signed(wire23) ?
                          wire25 : $signed((8'hbf))))));
              reg30 <= (wire26 > wire25);
              reg31 <= $signed($unsigned((({wire26} ?
                      wire22[(1'h0):(1'h0)] : $unsigned(wire24)) ?
                  ((~&wire22) && (wire25 ?
                      reg28 : wire27)) : $signed($unsigned(wire23)))));
            end
          reg32 <= (wire25[(4'h8):(3'h5)] ?
              $signed(reg29) : (wire22[(4'ha):(4'ha)] ?
                  $unsigned(({reg30} ?
                      (wire25 ?
                          reg29 : wire22) : (^~wire23))) : (+$unsigned(reg28))));
        end
      else
        begin
          reg28 <= ($unsigned(wire26[(1'h1):(1'h0)]) ?
              ((~&reg29[(2'h2):(1'h0)]) >= {$signed(((8'hbb) ?
                      wire22 : reg30))}) : reg28[(2'h3):(2'h3)]);
          if (($signed({$signed({wire26,
                  reg30})}) > $signed($signed($signed((wire25 ?
              reg31 : reg30))))))
            begin
              reg29 <= $signed((reg32 >> (7'h43)));
              reg30 <= (wire26[(3'h6):(2'h3)] ?
                  $unsigned(((((7'h41) >>> wire25) ?
                          (reg30 && wire23) : (reg29 ~^ reg30)) ?
                      (^reg30[(5'h11):(4'hf)]) : $signed((reg28 == wire23)))) : (({wire26,
                      (wire24 ? wire23 : wire23)} && $unsigned({reg32,
                      reg31})) ^ $unsigned((~^wire26))));
              reg31 <= (($unsigned(($unsigned((8'haf)) < wire22[(1'h1):(1'h0)])) ?
                  (8'haa) : $unsigned((reg30 ?
                      (~^reg32) : {wire25,
                          (8'ha8)}))) >> {$unsigned((&$unsigned((8'ha8)))),
                  {wire25}});
              reg32 <= {($unsigned(({wire24, wire24} && (~|wire26))) ?
                      wire23 : reg29[(1'h0):(1'h0)])};
            end
          else
            begin
              reg29 <= (reg32 ?
                  $unsigned({wire26}) : {(8'ha3), wire26[(4'h9):(3'h4)]});
              reg30 <= $signed((^~{$signed((^~reg29))}));
              reg31 <= $signed((({(!reg29)} * reg29[(1'h1):(1'h0)]) - reg29));
            end
          reg33 <= (!$unsigned($signed(({reg29} * (reg32 > wire22)))));
        end
      reg34 <= {$unsigned(reg33),
          $unsigned((&$unsigned(reg30[(4'h9):(4'h8)])))};
      if (($unsigned((((wire27 ? reg31 : wire25) ? wire24 : (wire27 * wire27)) ?
          reg30[(3'h4):(2'h3)] : wire26[(1'h0):(1'h0)])) && wire24[(1'h0):(1'h0)]))
        begin
          if ((reg29 < $signed((^{(wire25 ? wire27 : reg30), reg34}))))
            begin
              reg35 <= ($unsigned((((reg28 ? reg33 : wire26) ?
                      $unsigned(wire27) : (&reg31)) ?
                  {{wire27,
                          wire23}} : (wire26[(3'h4):(3'h4)] - ((8'h9f) - reg28)))) | (reg34[(5'h14):(1'h1)] ?
                  (reg29 ?
                      $signed((wire22 ? reg32 : wire27)) : {(wire24 ?
                              wire27 : reg31),
                          wire23[(3'h6):(3'h6)]}) : {((~^reg32) < (wire26 ?
                          wire25 : wire27))}));
              reg36 <= ($signed($unsigned(wire23[(3'h5):(2'h2)])) ?
                  $unsigned({$signed(wire25[(3'h6):(3'h5)])}) : wire26);
              reg37 <= (7'h42);
              reg38 <= (~wire26);
              reg39 <= (-reg30);
            end
          else
            begin
              reg35 <= reg39[(4'h8):(2'h3)];
              reg36 <= reg32;
              reg37 <= {reg36};
              reg38 <= (!wire26);
            end
          if ((reg29 ? reg28 : $signed((8'hae))))
            begin
              reg40 <= wire23[(5'h14):(5'h13)];
              reg41 <= ($signed(wire25[(3'h4):(2'h2)]) - (~^(reg32 ?
                  $unsigned(((8'ha3) ?
                      reg37 : reg39)) : reg32[(3'h5):(3'h4)])));
              reg42 <= {reg34};
              reg43 <= $unsigned({$signed((7'h43))});
              reg44 <= ((-(((8'hbd) * $signed(reg41)) & {(+reg35),
                  reg38})) <<< reg33);
            end
          else
            begin
              reg40 <= $unsigned(reg42);
              reg41 <= (!(wire27[(4'hd):(2'h3)] ?
                  {reg34[(4'he):(3'h5)],
                      ((reg39 >>> reg36) ?
                          wire26[(4'ha):(3'h5)] : (reg30 ?
                              wire27 : reg40))} : {(|$unsigned(reg33))}));
            end
        end
      else
        begin
          reg35 <= $unsigned((-($signed(wire22) ?
              ({reg37, reg33} >= (reg41 ?
                  reg29 : reg41)) : (-$unsigned((8'ha9))))));
          reg36 <= $signed(reg39[(4'h9):(3'h4)]);
          if ((((~&reg36) - (~&{reg29[(2'h2):(1'h0)]})) || (reg40 == $signed((~$unsigned(wire23))))))
            begin
              reg37 <= reg38;
              reg38 <= (({(wire27 ? {wire22, (7'h43)} : reg38[(2'h2):(1'h0)])} ?
                      ($signed($unsigned(reg32)) ?
                          wire23 : {$unsigned(reg39),
                              (reg38 ?
                                  (8'ha8) : reg43)}) : $signed($signed($signed(reg43)))) ?
                  reg29 : reg36[(4'hc):(4'hc)]);
              reg39 <= (!((({(8'hb2)} ?
                      reg42[(3'h4):(1'h1)] : reg33) != ((reg40 && reg41) ?
                      $unsigned(reg36) : (reg40 ? reg40 : reg35))) ?
                  $unsigned({wire25[(3'h4):(1'h1)], (7'h40)}) : wire22));
              reg40 <= reg40;
            end
          else
            begin
              reg37 <= reg40[(4'h8):(3'h4)];
              reg38 <= reg29;
              reg39 <= (+(!$unsigned(reg40[(4'hd):(4'h8)])));
              reg40 <= reg28[(4'h9):(2'h2)];
              reg41 <= reg29[(1'h0):(1'h0)];
            end
          reg42 <= $unsigned(wire23);
          reg43 <= reg43[(5'h10):(4'ha)];
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg41))
        begin
          reg45 <= {(wire23[(4'hd):(4'hd)] && wire23[(1'h0):(1'h0)])};
          if (((($signed($unsigned(reg40)) >>> $signed((wire23 ?
                      (8'h9d) : reg33))) ?
                  wire25 : wire23) ?
              reg35 : reg43[(5'h13):(4'hc)]))
            begin
              reg46 <= {{$unsigned((wire23[(5'h13):(3'h6)] << $unsigned(reg34))),
                      reg39[(1'h1):(1'h1)]}};
              reg47 <= {(-wire24)};
              reg48 <= $signed((!((~&((8'hb6) >= reg42)) && reg40[(2'h2):(2'h2)])));
            end
          else
            begin
              reg46 <= ($signed(reg37[(2'h2):(1'h0)]) >>> ($unsigned(reg44[(1'h1):(1'h0)]) ?
                  wire23[(5'h14):(4'he)] : (8'hb3)));
              reg47 <= reg31;
            end
          reg49 <= $signed((8'h9e));
          reg50 <= wire24[(1'h0):(1'h0)];
          reg51 <= (wire25 ~^ reg48[(3'h6):(2'h2)]);
        end
      else
        begin
          reg45 <= reg43;
          if (wire25)
            begin
              reg46 <= {wire22[(3'h6):(3'h5)], wire27};
              reg47 <= ($signed($signed($unsigned($unsigned(reg38)))) ?
                  wire27[(3'h6):(2'h3)] : $unsigned((~&{(+reg44)})));
              reg48 <= reg44[(4'h8):(3'h6)];
            end
          else
            begin
              reg46 <= reg31[(1'h0):(1'h0)];
              reg47 <= ({reg31[(1'h1):(1'h0)],
                      (wire23 ?
                          $unsigned((!reg35)) : ($unsigned(wire22) <= {(8'ha4)}))} ?
                  ((reg32 == reg37) ?
                      ((8'hbc) ~^ $signed(wire27)) : $unsigned(reg38[(4'h8):(3'h4)])) : (reg28[(4'hc):(4'h8)] & (~&($unsigned(reg44) > wire24))));
            end
          reg49 <= (-(reg48[(2'h3):(2'h3)] < ($unsigned($signed(reg42)) ?
              (^~reg40[(4'h8):(3'h5)]) : (reg46 ~^ (reg41 ? wire26 : reg31)))));
          reg50 <= reg32;
        end
      reg52 <= reg38[(4'hb):(4'ha)];
      reg53 <= (($signed((reg49[(2'h3):(2'h3)] >= reg31)) >= (reg33 ^~ (!reg29))) ?
          {$unsigned(((reg36 == reg32) >= (+reg47)))} : ((8'hb3) ?
              (&$signed((reg38 ^ reg48))) : (wire24 != (reg41 ?
                  $signed(wire23) : $signed(reg48)))));
      if ((((8'had) == (((reg48 < reg28) ?
          $signed(reg48) : (8'ha0)) & $unsigned($signed(reg39)))) * $signed($unsigned({(reg52 >> reg48)}))))
        begin
          reg54 <= (((8'ha7) * $signed(reg45)) || ((reg28[(4'ha):(3'h6)] ?
              reg37[(4'hb):(4'ha)] : (8'hae)) | (~^((reg53 + reg43) ~^ reg28))));
          reg55 <= ((($signed((+reg42)) || reg41) > wire25) == $unsigned((^wire24)));
        end
      else
        begin
          reg54 <= $unsigned($signed((8'had)));
          reg55 <= reg50;
        end
      reg56 <= $signed($unsigned(reg39[(1'h0):(1'h0)]));
    end
  assign wire57 = $unsigned(reg48);
  assign wire58 = (((&(reg50[(4'h9):(2'h3)] ?
                              $unsigned(reg39) : (wire26 ^ reg33))) ?
                          (~^reg51) : $signed(reg45)) ?
                      reg29[(2'h2):(1'h0)] : ((reg51[(4'h9):(3'h7)] ?
                              (reg51 | {reg45, reg56}) : ({reg39, wire25} ?
                                  reg31[(3'h5):(3'h5)] : $unsigned(reg43))) ?
                          (8'hb7) : $unsigned($unsigned(((8'hb4) ?
                              reg42 : (8'had))))));
endmodule
