module top
#(parameter param196 = ((~(^~{((8'ha0) ? (8'hab) : (8'ha4)), ((8'haf) ? (8'hbf) : (8'ha3))})) >>> (({(~|(8'ha4))} ? (&(^(8'hb3))) : (((8'ha2) + (8'hbd)) >= ((8'ha7) & (8'ha3)))) | (~(((8'ha3) ? (8'haa) : (8'had)) + ((8'hae) * (8'haf)))))), 
parameter param197 = (|param196))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire194;
  wire signed [(4'ha):(1'h0)] wire193;
  wire signed [(5'h10):(1'h0)] wire192;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire163;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire180;
  wire [(4'hb):(1'h0)] wire181;
  wire signed [(4'ha):(1'h0)] wire182;
  wire signed [(2'h3):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire184;
  wire [(4'he):(1'h0)] wire185;
  wire signed [(5'h13):(1'h0)] wire190;
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg187 = (1'h0);
  reg [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg173 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire178,
                 wire177,
                 wire176,
                 wire165,
                 wire163,
                 wire4,
                 wire180,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 wire190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 (1'h0)};
  assign wire4 = wire0;
  module5 #() modinst164 (wire163, clk, wire2, wire3, wire1, wire0);
  assign wire165 = $unsigned((~&($unsigned((wire4 ?
                       wire163 : wire163)) || ((~&wire4) != (wire4 ?
                       (8'ha6) : wire0)))));
  always
    @(posedge clk) begin
      reg166 <= $signed(wire163[(3'h7):(3'h4)]);
      reg167 <= (~|{$signed($signed($unsigned(wire165))),
          ($signed(wire165) <= (~|(+wire0)))});
      if (wire165)
        begin
          reg168 <= $signed({((wire163[(3'h7):(1'h0)] ?
                  (~(8'haf)) : $signed(reg167)) > $unsigned($unsigned(reg167)))});
          reg169 <= (reg167 ? $unsigned(wire163) : $signed(wire1));
          if ((!($unsigned($signed(wire2[(4'ha):(2'h2)])) ?
              (wire1 & $signed(wire3)) : ((8'ha8) ? (^~(~^reg169)) : wire163))))
            begin
              reg170 <= (8'hac);
              reg171 <= wire0[(2'h3):(2'h3)];
              reg172 <= ($signed((wire165 ?
                      (wire3[(4'hd):(4'ha)] << (8'haa)) : wire4[(4'hc):(4'h9)])) ?
                  $signed($unsigned(({reg167,
                      (8'hb9)} + $signed(wire4)))) : (wire163[(1'h1):(1'h0)] ?
                      $signed({reg170}) : (!$signed(reg168[(2'h2):(1'h1)]))));
              reg173 <= (wire1[(5'h11):(4'hf)] ^ $unsigned({reg171[(2'h3):(2'h3)],
                  (((8'ha8) != reg168) | (reg171 ^ wire165))}));
              reg174 <= $unsigned($signed((|($unsigned(reg167) >>> wire2[(4'he):(3'h4)]))));
            end
          else
            begin
              reg170 <= wire2;
              reg171 <= reg171;
              reg172 <= ($unsigned((reg169[(2'h2):(1'h0)] ?
                  (wire0 ?
                      reg166[(3'h4):(1'h0)] : (reg167 ?
                          reg172 : (8'haa))) : $signed($unsigned(wire1)))) <<< reg171[(3'h6):(3'h4)]);
              reg173 <= reg173;
            end
          reg175 <= ($unsigned($unsigned($unsigned($unsigned((8'h9c))))) ?
              $signed((8'h9f)) : (+(~&$signed(wire2))));
        end
      else
        begin
          reg168 <= (8'hbc);
          reg169 <= $unsigned(($signed({reg167[(5'h10):(4'h8)]}) + $unsigned($signed($unsigned(reg171)))));
        end
    end
  assign wire176 = wire4;
  assign wire177 = {(((!reg167[(4'hc):(1'h1)]) ?
                               $signed(reg175) : {wire165[(3'h5):(3'h5)]}) ?
                           $signed((reg171[(2'h2):(1'h0)] ^ wire165)) : (~&($unsigned(reg175) ?
                               wire2 : (reg169 <<< wire165)))),
                       {(($signed(reg171) ?
                                   $signed(wire0) : (wire176 + reg169)) ?
                               reg168[(2'h3):(2'h2)] : {(reg175 ?
                                       wire4 : wire176),
                                   reg169}),
                           ({(wire3 ?
                                   reg168 : reg172)} ^~ ((|(8'h9e)) || {wire3}))}};
  module37 #() modinst179 (wire178, clk, wire176, wire4, reg174, wire163);
  assign wire180 = (~|$signed(reg172[(3'h7):(3'h7)]));
  assign wire181 = $signed(wire3[(5'h10):(1'h1)]);
  assign wire182 = wire0;
  assign wire183 = (wire182[(3'h5):(3'h5)] * (wire0 || (reg172 ?
                       wire0[(4'h8):(3'h7)] : wire0[(3'h6):(3'h6)])));
  assign wire184 = wire3;
  assign wire185 = wire3[(4'hc):(4'hc)];
  always
    @(posedge clk) begin
      reg186 <= wire4;
      reg187 <= ((^{$unsigned((reg167 >= reg173))}) | $unsigned((|$signed((8'hbc)))));
      reg188 <= (($signed(($unsigned(wire1) ? (&wire0) : (~|reg172))) ?
          ($signed({(8'h9e)}) & $unsigned((wire180 - wire177))) : (~{reg186[(1'h0):(1'h0)]})) != $signed(wire181));
      reg189 <= $unsigned((~wire182));
    end
  module99 #() modinst191 (.wire103(wire2), .wire101(wire185), .y(wire190), .wire102(wire165), .wire104(wire163), .wire100(wire182), .clk(clk));
  assign wire192 = $signed((wire2 ?
                       ((wire165[(2'h2):(1'h0)] ? $signed(wire177) : reg188) ?
                           (reg167[(5'h11):(4'hd)] || (reg174 ?
                               (8'ha8) : wire2)) : {{(8'haa)}}) : $unsigned(wire177)));
  assign wire193 = ($signed(wire190) ?
                       $signed({reg173[(1'h0):(1'h0)],
                           wire4[(5'h11):(3'h5)]}) : $signed({(wire184 >>> wire165)}));
  assign wire194 = (&$signed($unsigned(reg172)));
  assign wire195 = (wire2[(4'ha):(1'h0)] <= wire193);
endmodule

module module5
#(parameter param161 = ((({((8'ha1) || (8'hb7))} != {((8'hb9) && (8'h9f))}) <= ((((7'h44) ^ (8'hae)) >> (!(8'h9f))) == (8'hae))) ? {(-((~&(8'h9e)) ? ((8'had) ? (8'haa) : (7'h42)) : (8'ha8))), ((((8'hbe) || (7'h42)) ? ((8'h9f) ? (8'h9d) : (8'hbc)) : ((8'ha0) ? (8'haa) : (8'ha1))) != ((~^(8'h9c)) ? (-(8'hb4)) : ((8'hb3) ? (7'h43) : (8'had))))} : (-(^~(((8'h9d) ? (8'hae) : (8'hbe)) + ((8'hb8) <<< (8'hb1)))))), 
parameter param162 = (8'hac))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire159;
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire33,
                 wire35,
                 wire36,
                 wire46,
                 wire96,
                 wire98,
                 wire159,
                 reg14,
                 (1'h0)};
  assign wire10 = (wire6[(3'h5):(3'h4)] ?
                      (~^$unsigned(wire7[(1'h1):(1'h0)])) : (+$signed((wire8 ?
                          wire7[(2'h3):(2'h2)] : $unsigned(wire8)))));
  assign wire11 = {wire8[(4'hf):(1'h1)]};
  assign wire12 = ($unsigned((-$unsigned($signed((8'ha9))))) ?
                      wire6 : $unsigned(({$unsigned(wire10)} ?
                          ($signed(wire10) << (wire10 >> (7'h41))) : ({wire10} == {wire9}))));
  assign wire13 = $signed(($unsigned({(8'hbe), $unsigned(wire10)}) ?
                      {(^~(~&wire9))} : (((wire9 ? wire6 : wire7) > (~^wire7)) ?
                          $unsigned(wire12[(4'hf):(3'h6)]) : wire11)));
  always
    @(posedge clk) begin
      reg14 <= ($unsigned((((wire10 | wire7) ?
              wire6[(3'h7):(2'h3)] : wire12[(4'he):(3'h6)]) & ((wire12 + wire12) << $signed(wire11)))) ?
          $signed((&($unsigned(wire7) ?
              (wire9 >>> wire11) : (wire9 ^ wire8)))) : (wire11[(2'h2):(1'h0)] ?
              (((^(8'hb1)) ?
                  (+wire7) : (wire6 < wire10)) != ((wire11 <= (8'hbb)) ?
                  wire8[(4'h9):(2'h3)] : ((7'h42) ?
                      wire6 : wire6))) : $unsigned(wire13[(3'h5):(3'h4)])));
    end
  module15 #() modinst34 (wire33, clk, wire13, wire12, wire8, wire11);
  assign wire35 = (~^(!wire12));
  assign wire36 = wire33;
  module37 #() modinst47 (wire46, clk, wire35, wire11, wire9, wire7);
  module48 #() modinst97 (wire96, clk, wire13, wire8, wire11, wire12);
  assign wire98 = (((((&wire33) ? (~^wire8) : $signed(wire35)) || {((8'hbb) ?
                          wire11 : wire46)}) ^~ reg14) || (reg14[(2'h3):(1'h1)] ?
                      (~^$signed((!wire35))) : $signed($unsigned(((7'h43) ?
                          wire33 : wire46)))));
  module99 #() modinst160 (wire159, clk, wire8, wire10, wire12, wire6, wire96);
endmodule

module module99  (y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire104;
  input wire signed [(2'h3):(1'h0)] wire103;
  input wire [(4'ha):(1'h0)] wire102;
  input wire [(4'hc):(1'h0)] wire101;
  input wire signed [(4'h9):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire105;
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire144,
                 wire143,
                 wire142,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire105,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
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
                 reg116,
                 reg115,
                 reg114,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire105 = (((wire103[(1'h0):(1'h0)] <<< (~|(wire103 ?
                           wire101 : wire100))) != $unsigned($unsigned(wire100))) ?
                       ((((~wire101) ?
                           (|wire103) : $unsigned(wire100)) <<< $unsigned((~^wire100))) ~^ $unsigned(($unsigned(wire102) ?
                           wire104[(2'h3):(2'h3)] : (wire100 && wire102)))) : wire103[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg106 <= (((8'ha8) ?
          (~wire100) : $signed((((8'hac) + wire105) && $unsigned(wire103)))) <<< {$unsigned(wire100),
          {(8'hbe)}});
      if ($signed($signed(({(|wire100), $signed((8'hb2))} ?
          (|$signed(reg106)) : $signed(reg106)))))
        begin
          reg107 <= (~&(|((&(~|wire102)) ^ {$unsigned(wire101)})));
        end
      else
        begin
          reg107 <= wire105[(3'h5):(3'h5)];
        end
      reg108 <= $signed($unsigned($signed(($unsigned((8'hb3)) < $unsigned((8'hbc))))));
    end
  assign wire109 = $unsigned((reg106[(4'h8):(2'h2)] ^ $unsigned(wire105[(3'h5):(3'h5)])));
  assign wire110 = wire104;
  assign wire111 = $signed(((~{(reg108 > wire101)}) ?
                       $unsigned((wire105 != (~&wire109))) : (|($unsigned(wire109) ?
                           $unsigned(reg108) : ((8'ha6) + (8'hb3))))));
  assign wire112 = (~&wire109[(1'h0):(1'h0)]);
  assign wire113 = $signed((~^wire104));
  always
    @(posedge clk) begin
      if (wire113[(2'h3):(2'h2)])
        begin
          if (wire104)
            begin
              reg114 <= (~^((|($signed((8'ha9)) || $signed(wire100))) ?
                  {$signed({wire100}),
                      $unsigned(wire103[(1'h1):(1'h1)])} : (~&$unsigned(reg108))));
              reg115 <= (^(reg106[(3'h5):(1'h1)] + (~(&$unsigned((8'had))))));
            end
          else
            begin
              reg114 <= $signed(wire105);
              reg115 <= ($unsigned($signed({(~wire102)})) ?
                  (((!$signed(wire104)) ?
                      ((wire110 ?
                          wire104 : reg115) <<< wire102) : reg108[(3'h6):(1'h0)]) > wire101) : ((~|wire112[(1'h0):(1'h0)]) ?
                      $signed((-$unsigned(wire111))) : $unsigned((~((8'hbd) ?
                          reg107 : reg107)))));
              reg116 <= ((($unsigned((+wire102)) ?
                      wire103 : (~(wire113 | wire104))) ?
                  wire101 : (reg114[(1'h0):(1'h0)] * $signed(reg108))) <= $signed((reg106 ?
                  (+$unsigned((8'hb9))) : ((wire102 >= wire105) << $signed(wire110)))));
              reg117 <= ($signed(((wire111[(2'h3):(2'h2)] ~^ $signed(wire101)) ?
                  $signed($signed(wire101)) : (reg106 > $signed(reg108)))) <= (reg106 & (((wire111 ?
                      (8'ha6) : (8'hb9)) ?
                  (reg108 ? wire109 : (8'ha7)) : (8'ha7)) - $unsigned(((8'ha5) ?
                  wire109 : reg115)))));
            end
          if ($unsigned({wire109}))
            begin
              reg118 <= $unsigned((~|($unsigned($signed(reg116)) ?
                  wire103[(1'h1):(1'h0)] : $signed($signed(reg106)))));
              reg119 <= ($unsigned($signed(($unsigned((8'hb6)) >> {wire112}))) ?
                  (+$signed(((~(8'hb1)) <<< (wire103 ?
                      (8'hbd) : (8'hae))))) : ($signed(((reg118 ?
                              reg118 : wire100) ?
                          wire103 : $signed(wire105))) ?
                      $unsigned(((reg118 << wire113) ?
                          ((8'hbf) ?
                              wire103 : wire111) : wire100[(3'h6):(2'h3)])) : $unsigned(wire102)));
              reg120 <= wire101[(1'h1):(1'h1)];
              reg121 <= (-$unsigned(wire101));
            end
          else
            begin
              reg118 <= $unsigned($signed($unsigned($signed({reg107}))));
              reg119 <= wire100[(4'h8):(1'h0)];
            end
        end
      else
        begin
          reg114 <= wire113;
          if ($signed(reg114[(1'h0):(1'h0)]))
            begin
              reg115 <= (((^($unsigned(wire113) - $unsigned(wire112))) ^~ {((reg119 ^~ reg115) ?
                          $unsigned((7'h43)) : $signed(reg108))}) ?
                  wire104 : (8'hb6));
              reg116 <= wire101;
              reg117 <= {reg121[(2'h3):(2'h3)], (-wire105)};
              reg118 <= ({$unsigned({(wire103 ? wire109 : reg119),
                          $signed(wire102)})} ?
                  $unsigned((((wire111 >>> (8'hbe)) ?
                      $unsigned(reg121) : (~|(8'ha7))) == ($signed(wire103) + (reg115 * (8'hb8))))) : ((reg121[(1'h1):(1'h0)] ?
                          (^wire101[(1'h1):(1'h1)]) : wire113) ?
                      (^(~&{wire101,
                          (8'ha6)})) : (reg119 ~^ $signed((-reg120)))));
              reg119 <= (wire101[(4'h9):(1'h1)] - reg119[(3'h4):(2'h3)]);
            end
          else
            begin
              reg115 <= wire102[(3'h7):(2'h2)];
            end
          reg120 <= (reg108[(4'hb):(2'h2)] - $unsigned(reg121[(1'h1):(1'h0)]));
          reg121 <= reg107[(1'h0):(1'h0)];
        end
      if (($unsigned((($unsigned(reg120) + (wire109 | reg121)) ?
          reg117 : wire109)) - wire100[(4'h9):(4'h9)]))
        begin
          if (reg106)
            begin
              reg122 <= reg117;
              reg123 <= (-$unsigned((wire104[(1'h0):(1'h0)] ?
                  $signed(reg114[(4'hd):(4'h9)]) : wire111[(1'h1):(1'h1)])));
              reg124 <= {((8'h9d) >>> $signed(wire102[(2'h3):(1'h0)])),
                  (reg121 ?
                      reg122 : ((wire105[(3'h6):(2'h3)] ?
                              $unsigned(wire109) : wire109[(2'h3):(1'h0)]) ?
                          (^$unsigned(reg108)) : reg116[(3'h4):(3'h4)]))};
              reg125 <= wire113[(4'hc):(4'hc)];
            end
          else
            begin
              reg122 <= (8'hba);
              reg123 <= wire105[(2'h3):(2'h3)];
              reg124 <= (~|$signed(wire104));
              reg125 <= wire112[(1'h0):(1'h0)];
            end
          if ($unsigned(wire100[(3'h4):(1'h1)]))
            begin
              reg126 <= (!wire102);
              reg127 <= ($unsigned($unsigned((wire113 ?
                      (reg126 ? wire112 : reg116) : $unsigned(wire105)))) ?
                  wire103 : (|wire110));
            end
          else
            begin
              reg126 <= $signed((|{wire111, $unsigned(reg122[(3'h6):(3'h5)])}));
            end
          reg128 <= reg123[(2'h2):(1'h0)];
          reg129 <= $signed(reg119[(3'h7):(2'h3)]);
        end
      else
        begin
          if (($unsigned({($signed(reg118) == $unsigned(reg123)),
              $unsigned(reg124[(3'h4):(3'h4)])}) && $signed($signed(reg128[(3'h5):(1'h1)]))))
            begin
              reg122 <= (reg108 == $unsigned($signed((~|{reg114}))));
              reg123 <= (&(((wire101[(2'h2):(2'h2)] ^ reg129) ^ (reg107[(3'h7):(3'h6)] + (reg126 ?
                  (8'ha9) : wire102))) >= ($unsigned($unsigned(reg122)) ?
                  (&$unsigned(reg115)) : $signed((^reg119)))));
              reg124 <= (^~$signed(wire112));
            end
          else
            begin
              reg122 <= {reg106[(4'h8):(2'h3)],
                  (reg119 ^ $signed($unsigned($unsigned(reg106))))};
              reg123 <= (^$signed(wire103));
            end
          if (wire111)
            begin
              reg125 <= (^~(!($signed(reg106) ?
                  ((|reg126) <<< reg127[(5'h11):(4'hf)]) : reg114)));
              reg126 <= reg117;
              reg127 <= reg129[(2'h3):(1'h1)];
              reg128 <= $unsigned((&(^reg106)));
              reg129 <= (~|reg127[(2'h3):(2'h2)]);
            end
          else
            begin
              reg125 <= ($unsigned($signed(reg127[(4'h8):(2'h3)])) >= reg129[(2'h2):(1'h1)]);
            end
          reg130 <= wire101;
        end
      reg131 <= (reg120[(3'h5):(1'h1)] ?
          reg117[(3'h5):(2'h2)] : ($signed(((reg114 ?
              reg121 : reg126) * reg120[(3'h7):(1'h1)])) || $unsigned((reg106 & (reg107 ?
              reg122 : wire110)))));
      reg132 <= reg107[(3'h7):(3'h4)];
      if ($unsigned(reg115))
        begin
          reg133 <= reg123[(1'h1):(1'h0)];
        end
      else
        begin
          reg133 <= (reg131[(2'h2):(1'h0)] ?
              (-wire109) : ($unsigned(((reg130 ? reg119 : wire113) ?
                  (reg114 ?
                      reg120 : reg118) : {reg114})) << (($unsigned(reg123) && $signed(reg118)) > ((wire110 > reg130) & (reg117 ?
                  (8'hac) : reg122)))));
        end
    end
  always
    @(posedge clk) begin
      reg134 <= reg116[(1'h0):(1'h0)];
      reg135 <= $signed($unsigned((~&$unsigned((wire112 ? reg130 : (8'hbc))))));
      if ($signed((!(~|wire100[(3'h5):(2'h2)]))))
        begin
          reg136 <= $signed($signed((~|reg129)));
          reg137 <= {$unsigned(reg136[(2'h2):(2'h2)])};
          reg138 <= {wire113, reg133[(1'h0):(1'h0)]};
          reg139 <= ($signed(($unsigned(reg133[(2'h2):(1'h0)]) ^ ((reg125 ?
                      wire113 : reg138) ?
                  $unsigned(wire110) : (-reg137)))) ?
              ($signed($unsigned((reg131 >>> reg130))) == $unsigned((((8'ha7) >>> reg133) ?
                  (reg126 << reg107) : $unsigned(reg122)))) : (&(($signed(wire100) - reg117[(2'h2):(1'h0)]) ?
                  reg136[(2'h2):(1'h0)] : ((reg134 == reg114) && $unsigned(wire110)))));
          reg140 <= $unsigned(($signed(reg106) ?
              reg123 : $unsigned($signed({reg106}))));
        end
      else
        begin
          reg136 <= {(^~((((8'hbe) * reg130) ^ (reg129 ~^ (8'hbc))) ?
                  $signed(wire110[(1'h0):(1'h0)]) : (wire100 ?
                      reg132 : $signed(reg125))))};
          reg137 <= (&(reg124 + (($signed(reg121) ?
                  (reg140 ? (8'ha7) : reg106) : reg134[(3'h6):(1'h0)]) ?
              ($unsigned(wire100) - (8'ha8)) : (~|$unsigned(wire110)))));
        end
      reg141 <= ((reg116[(2'h3):(2'h2)] ?
              ((+(~wire113)) ? (8'hb1) : (reg126 + (&reg117))) : reg123) ?
          (+{$signed(reg122)}) : (reg136[(1'h0):(1'h0)] + reg137));
    end
  assign wire142 = ({$signed({((8'ha9) == reg127)})} ?
                       ((reg139 ~^ wire101) >> (^($signed(reg126) ?
                           {reg123, reg131} : (reg131 ?
                               reg119 : wire112)))) : (+reg126));
  assign wire143 = ($signed(reg106[(4'h8):(1'h1)]) ?
                       $signed($unsigned((&reg120[(2'h3):(2'h3)]))) : (reg129 < (^~$unsigned(wire104))));
  assign wire144 = $signed(wire101);
  always
    @(posedge clk) begin
      if ($unsigned(reg127))
        begin
          reg145 <= (reg122[(4'h8):(1'h1)] ?
              (-(($signed((8'hb1)) ? $unsigned(wire100) : (reg141 & reg128)) ?
                  wire112 : $signed(reg140[(1'h0):(1'h0)]))) : $unsigned($unsigned(($signed(reg123) ^ wire113))));
          reg146 <= reg127;
          reg147 <= (reg132[(1'h0):(1'h0)] ~^ ($unsigned((|$signed(reg146))) ?
              $signed($signed($signed(wire113))) : $signed(reg145)));
          if ({(reg107[(2'h3):(1'h1)] ?
                  reg135 : (reg145[(1'h1):(1'h1)] ?
                      {reg134[(3'h6):(2'h3)]} : $unsigned(reg139[(1'h0):(1'h0)]))),
              $unsigned($signed($signed(reg118[(4'he):(3'h5)])))})
            begin
              reg148 <= (&{(((wire142 <= (8'ha6)) > {wire105, reg147}) ?
                      $signed((8'ha9)) : (wire143[(2'h3):(2'h2)] ?
                          (8'hb2) : $signed(reg133)))});
              reg149 <= ($unsigned((^reg106[(2'h3):(2'h3)])) > {($unsigned((wire143 ?
                          wire103 : (8'ha6))) ?
                      (reg132[(1'h0):(1'h0)] >> $unsigned(wire100)) : $signed({reg108,
                          reg128})),
                  wire104});
              reg150 <= (~$unsigned(reg108));
              reg151 <= (8'hbf);
            end
          else
            begin
              reg148 <= reg129;
              reg149 <= $signed((^({reg107[(1'h1):(1'h0)], (~&wire142)} ?
                  ($unsigned(reg150) || $signed((8'hb8))) : {$signed(reg120)})));
              reg150 <= (({(~&$signed(wire102)), (!$signed((8'had)))} ?
                  $signed($signed(reg141)) : wire142[(4'h9):(1'h0)]) > (^~(((reg141 ?
                      reg125 : reg137) ?
                  (-reg114) : reg146) + wire111)));
              reg151 <= $signed(reg138);
            end
        end
      else
        begin
          reg145 <= reg134[(3'h4):(2'h2)];
          reg146 <= wire100[(3'h7):(2'h2)];
          reg147 <= {$unsigned(wire112[(3'h5):(3'h5)]),
              $signed({({reg134, (8'hb6)} ?
                      wire102[(3'h7):(1'h1)] : {reg114})})};
          reg148 <= (wire101[(4'h8):(3'h6)] ? (~&$unsigned(reg116)) : (7'h42));
          reg149 <= (&({({reg145,
                  reg133} ^~ (~reg141))} * (|($unsigned(reg133) ?
              wire111[(1'h0):(1'h0)] : (reg114 ? wire110 : wire105)))));
        end
      reg152 <= reg118;
      reg153 <= reg122[(3'h5):(1'h0)];
      reg154 <= $signed(($unsigned((((8'h9d) >>> reg120) ^~ reg122)) ?
          wire142[(5'h11):(1'h0)] : reg141));
    end
  assign wire155 = reg106;
  assign wire156 = {$unsigned((^reg140)), $signed({(+(reg116 * (8'haa)))})};
  assign wire157 = $unsigned(($signed(reg135[(4'he):(3'h6)]) ?
                       ((wire144 ?
                           reg115[(4'h8):(1'h1)] : $unsigned(reg107)) + $signed((|wire142))) : reg128));
  assign wire158 = (-({((!reg130) ^ (wire104 ?
                           wire105 : reg123))} < $signed(wire112)));
endmodule

module module48
#(parameter param94 = (~&((~^(((8'hbe) > (8'ha8)) ? (&(8'ha1)) : ((7'h40) ? (8'h9d) : (8'h9c)))) ^ ((~&((7'h40) > (8'had))) ? {((8'ha8) ^~ (8'hb5))} : (~^(~&(8'hb2)))))), 
parameter param95 = ((param94 + ((~^param94) ? (~(param94 ? param94 : param94)) : param94)) ? {{(^~(^param94)), param94}, (param94 | ((param94 >> param94) << (^param94)))} : (|(!(param94 ? (8'ha7) : param94)))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire52;
  input wire signed [(5'h14):(1'h0)] wire51;
  input wire [(5'h15):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 (1'h0)};
  assign wire53 = {{wire52[(3'h7):(2'h2)]}};
  assign wire54 = $unsigned((wire52 ?
                      {(~(wire51 ?
                              wire50 : (8'h9c)))} : {$unsigned((^~wire49))}));
  assign wire55 = wire50;
  assign wire56 = $signed($unsigned($unsigned({$unsigned((8'hab))})));
  always
    @(posedge clk) begin
      if (wire52[(1'h1):(1'h1)])
        begin
          reg57 <= ($unsigned((~$signed((wire52 ? wire56 : wire56)))) ?
              $signed((((^(8'hb2)) ^~ (!wire54)) ?
                  wire49 : wire55)) : $signed(wire50[(4'ha):(4'ha)]));
          if ((($signed((~wire52)) ?
              $signed(((~&wire52) <= (wire50 < (8'hbc)))) : (wire55[(4'h9):(3'h4)] != $signed(wire55[(4'hb):(1'h1)]))) >>> wire52))
            begin
              reg58 <= (~^(($signed(((7'h41) ? wire56 : wire50)) ?
                      ((~^wire50) ~^ (8'hbc)) : ($signed((8'hb1)) ?
                          ((8'h9f) ? reg57 : wire51) : wire55[(4'hc):(4'h8)])) ?
                  $signed(((-wire55) & (wire51 ?
                      wire49 : wire50))) : (wire51[(4'ha):(3'h4)] ?
                      (~&wire56[(3'h7):(2'h2)]) : ((wire52 ?
                          wire51 : wire49) < (wire55 ? wire50 : wire51)))));
              reg59 <= $unsigned((reg57 + $signed(wire55)));
            end
          else
            begin
              reg58 <= (~|{({$signed(reg57),
                      (wire50 * wire49)} >> reg58[(3'h4):(3'h4)])});
              reg59 <= ((-(|$signed($signed(reg57)))) && ($signed({wire50[(2'h2):(1'h0)],
                      $signed(wire50)}) ?
                  (8'ha3) : ($unsigned(wire52) ^ (wire54[(1'h0):(1'h0)] ?
                      {wire51, reg58} : $signed(wire52)))));
              reg60 <= ($unsigned((^~$signed($unsigned((8'h9e))))) <<< (wire54[(1'h1):(1'h1)] ?
                  (((8'hb7) ?
                      (^~wire55) : $signed(reg58)) || (8'hb0)) : $unsigned(($signed(wire52) & $signed(reg58)))));
              reg61 <= $unsigned(wire50);
            end
          reg62 <= ($unsigned($unsigned(wire49[(3'h4):(1'h1)])) ^~ $signed($unsigned(wire52[(4'ha):(4'ha)])));
          reg63 <= {$signed({reg60, $signed((reg60 ? wire56 : (7'h42)))}),
              (wire53[(2'h2):(1'h0)] <<< (wire52[(1'h0):(1'h0)] ?
                  (~(wire53 >= reg62)) : {wire49[(3'h4):(3'h4)]}))};
          reg64 <= ($unsigned($signed((wire55 < reg63[(3'h6):(1'h0)]))) >> $signed($signed($unsigned((wire49 ?
              reg63 : wire54)))));
        end
      else
        begin
          reg57 <= wire50;
          reg58 <= {(~reg59[(4'hb):(3'h7)]),
              ($signed({(wire55 ? reg58 : reg58), (^~reg58)}) ?
                  {reg59} : reg57[(4'hb):(3'h5)])};
          if ({(+wire49),
              $unsigned((^($signed(wire54) ?
                  wire50[(5'h12):(1'h0)] : $unsigned(wire52))))})
            begin
              reg59 <= ((^(reg63 & (reg60[(4'ha):(4'h8)] ?
                  {reg63} : (reg58 ?
                      wire49 : reg60)))) + (^~wire49[(1'h1):(1'h1)]));
              reg60 <= reg59;
              reg61 <= $signed($unsigned($signed({wire53[(2'h3):(2'h3)],
                  $unsigned(reg64)})));
              reg62 <= {(($signed((reg62 ?
                          reg63 : wire51)) - $unsigned((wire51 ?
                          wire53 : wire50))) ?
                      (~^$signed((reg57 ? (7'h43) : wire51))) : reg62)};
              reg63 <= reg64[(2'h3):(1'h0)];
            end
          else
            begin
              reg59 <= $signed((8'hae));
              reg60 <= wire53;
              reg61 <= $unsigned($unsigned($signed(((wire49 * (8'hb5)) | (reg60 | reg59)))));
              reg62 <= reg60[(4'ha):(2'h2)];
              reg63 <= $unsigned($unsigned({wire56}));
            end
        end
      reg65 <= reg63[(1'h0):(1'h0)];
      reg66 <= {$unsigned((reg57[(3'h5):(2'h2)] ?
              (reg61[(3'h4):(2'h3)] ^~ $unsigned((8'hbd))) : $signed((reg63 + wire54))))};
      reg67 <= {$signed($unsigned(reg59)), (^~wire55[(4'h9):(2'h2)])};
      if ($unsigned({$signed($unsigned(reg58[(1'h0):(1'h0)])),
          reg59[(4'hd):(3'h6)]}))
        begin
          reg68 <= (8'haa);
          reg69 <= ($unsigned($signed({wire51})) >> $signed(({reg61[(3'h6):(1'h0)],
                  wire50} ?
              $unsigned((|reg64)) : {(wire56 ? wire49 : (8'haf)),
                  $unsigned(reg67)})));
          reg70 <= ((($signed($unsigned(reg58)) ?
                  ((!reg68) < $signed(reg63)) : ($signed(reg63) ?
                      (~&(8'haa)) : wire50)) ?
              (8'ha5) : wire56[(4'h8):(3'h7)]) ~^ reg68[(3'h4):(1'h0)]);
        end
      else
        begin
          if (((8'ha5) ^~ (wire53 < (wire51 <= (reg62[(1'h1):(1'h0)] <= (reg61 & reg62))))))
            begin
              reg68 <= {$signed((reg58 ^ ($signed(reg60) ?
                      $signed(wire54) : (8'hbb)))),
                  (($signed($unsigned(wire52)) ?
                          reg62[(3'h4):(1'h0)] : ($unsigned((8'ha7)) ?
                              {wire49} : $unsigned(reg63))) ?
                      (wire53 >> {reg65[(1'h0):(1'h0)]}) : ((|(wire52 ?
                              reg64 : reg57)) ?
                          wire53 : ($unsigned(wire51) ?
                              reg68[(3'h5):(1'h1)] : (~reg60))))};
              reg69 <= {$signed((&$unsigned({(8'ha0)})))};
            end
          else
            begin
              reg68 <= (reg70 ? reg69 : wire51[(1'h1):(1'h0)]);
              reg69 <= wire52[(3'h4):(1'h0)];
            end
          reg70 <= $signed(wire56[(3'h4):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      if ({reg57})
        begin
          reg71 <= {$signed(({reg65, (reg63 ? reg63 : reg58)} << reg67))};
          reg72 <= reg68;
          if (reg71)
            begin
              reg73 <= ($signed(wire53) ?
                  $signed($unsigned(wire49)) : $unsigned(((reg64 <<< reg63[(2'h2):(1'h0)]) != reg72[(5'h11):(2'h3)])));
              reg74 <= wire51[(2'h2):(1'h1)];
              reg75 <= (((^wire55[(4'h8):(2'h2)]) ?
                      (reg61 ?
                          reg59 : $unsigned($unsigned(reg63))) : ((wire53[(1'h1):(1'h0)] ?
                              (reg71 ? wire54 : wire49) : ((8'ha4) || reg66)) ?
                          reg68[(2'h2):(2'h2)] : (8'hbd))) ?
                  ((|$signed($signed(reg61))) ?
                      (((8'h9c) & $signed(reg66)) ?
                          (reg60 ? wire56 : reg62) : ($unsigned(reg59) ?
                              (~&reg59) : (|wire51))) : (reg61[(4'hc):(3'h7)] < (~&(wire50 > wire50)))) : ($unsigned((&(wire51 ?
                          reg69 : wire53))) ?
                      $unsigned({$unsigned(wire55),
                          $unsigned(reg69)}) : (8'hb1)));
              reg76 <= wire53;
              reg77 <= (|$signed(wire51));
            end
          else
            begin
              reg73 <= reg65;
            end
          reg78 <= (8'ha7);
        end
      else
        begin
          reg71 <= (((((wire52 ?
              wire53 : (7'h43)) && $unsigned(reg66)) < $signed((reg77 ?
              reg64 : reg61))) + ((^(|reg70)) > reg59[(4'h9):(4'h8)])) + (reg64 ^ (~&((reg57 ?
              reg61 : wire50) ^~ $unsigned(reg73)))));
          reg72 <= (8'ha0);
          reg73 <= reg75[(2'h3):(1'h1)];
          if ($unsigned(($unsigned(({reg61, wire51} >>> $signed(wire54))) ?
              {(reg71[(3'h5):(1'h1)] ~^ reg64),
                  $signed((!reg68))} : wire49[(3'h4):(1'h0)])))
            begin
              reg74 <= ($unsigned($signed(reg67[(1'h1):(1'h0)])) ?
                  wire49 : ({(8'ha3)} ? (+wire56) : wire52[(3'h5):(1'h1)]));
            end
          else
            begin
              reg74 <= reg78[(2'h2):(1'h0)];
              reg75 <= ({$unsigned(reg77)} < (!$signed(reg78[(2'h2):(1'h0)])));
              reg76 <= {$unsigned($signed($unsigned(wire53)))};
            end
        end
    end
  assign wire79 = reg61;
  assign wire80 = reg62;
  assign wire81 = wire49[(3'h5):(3'h4)];
  assign wire82 = reg57;
  assign wire83 = (~^((((~^wire82) ?
                      $signed((8'ha7)) : $signed(wire55)) < reg69[(3'h5):(2'h3)]) < (((wire53 & reg74) + $unsigned(reg64)) ?
                      wire50[(4'hb):(3'h7)] : wire51[(5'h11):(3'h6)])));
  assign wire84 = (-wire50);
  assign wire85 = reg76;
  assign wire86 = reg58;
  assign wire87 = $unsigned((reg73[(5'h13):(2'h2)] ?
                      (+(|wire86[(3'h5):(1'h0)])) : $unsigned(reg67[(2'h2):(1'h1)])));
  assign wire88 = (({$signed((!wire80)),
                      ((reg67 ?
                          reg60 : reg64) && (wire84 << wire84))} >>> (((reg58 < wire56) ?
                          $signed(wire55) : (8'ha5)) ?
                      $signed($signed(wire80)) : reg59[(4'h8):(2'h2)])) != (&$signed(((+(8'hae)) && reg65))));
  assign wire89 = (+{reg65[(4'hc):(3'h6)]});
  assign wire90 = wire50;
  assign wire91 = $signed($unsigned(wire79[(4'he):(4'h9)]));
  assign wire92 = reg65[(2'h3):(2'h2)];
  assign wire93 = $unsigned(wire56);
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  assign y = {wire45, wire44, wire43, wire42, (1'h0)};
  assign wire42 = wire40[(3'h5):(1'h0)];
  assign wire43 = (~|wire39);
  assign wire44 = (^(wire38 ~^ $signed({(wire40 | wire40),
                      wire42[(4'hb):(3'h7)]})));
  assign wire45 = $unsigned((wire41[(2'h2):(2'h2)] ?
                      ((-(wire43 && wire40)) < (!$unsigned((8'ha8)))) : $signed(($signed(wire40) == $unsigned(wire42)))));
endmodule

module module15
#(parameter param31 = (8'hbc), 
parameter param32 = ((((param31 | (~param31)) ? (~^param31) : {(8'hba), (^(8'haf))}) || param31) | ((({param31} ? (^~param31) : (param31 ? param31 : param31)) * (8'hac)) ~^ (((^param31) ? {param31} : (+param31)) ? {(8'ha5)} : ((-param31) ? ((8'hb7) << param31) : (param31 ? param31 : param31))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire20;
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire20,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = wire18;
  always
    @(posedge clk) begin
      reg21 <= $signed((wire16[(1'h1):(1'h1)] * wire19));
      reg22 <= wire19[(2'h2):(2'h2)];
      reg23 <= $unsigned({(!(~&$unsigned(wire16)))});
      reg24 <= {reg22};
    end
  assign wire25 = (~&wire20[(4'ha):(1'h0)]);
  assign wire26 = ($signed($unsigned((!wire25))) < ({$unsigned((wire25 ?
                          wire16 : reg22)),
                      ((reg21 ?
                          (8'hac) : reg21) + $signed(wire19))} || (wire17 ^ wire25[(1'h1):(1'h0)])));
  assign wire27 = ($signed((-((wire19 ^~ reg24) < reg23))) ?
                      (($unsigned(((8'hb6) - reg23)) ?
                          wire16[(4'ha):(2'h3)] : (^~(8'ha9))) + (~^$unsigned((wire18 | wire25)))) : $signed($unsigned({(~&(8'ha7)),
                          wire17})));
  assign wire28 = $signed((reg21[(4'h8):(1'h0)] ?
                      $unsigned(reg22[(1'h0):(1'h0)]) : $unsigned(reg21[(4'hd):(1'h1)])));
  assign wire29 = (|$unsigned(({(reg22 ? wire19 : reg24)} ?
                      $unsigned(((8'ha6) != reg21)) : ($unsigned(reg23) >= reg24[(3'h6):(1'h0)]))));
  assign wire30 = reg21[(4'hf):(4'hf)];
endmodule
