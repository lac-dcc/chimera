module top
#(parameter param216 = ((({(^~(8'hb9))} && {(~^(8'hbf))}) ? ((~&(&(8'hb8))) <<< (^~(+(8'hb4)))) : ({(~|(8'ha9))} * (((8'hac) ? (8'hb7) : (8'hac)) ? (&(8'h9e)) : {(8'hb0), (8'haa)}))) ? ((|(((8'hbb) && (8'hab)) ? ((8'ha3) ? (8'hac) : (8'hb1)) : ((8'hbb) ? (8'h9e) : (8'hbc)))) != {(((8'ha6) && (8'hb4)) ? (~&(8'hb5)) : (~(8'ha3))), (((8'had) ? (7'h43) : (8'ha3)) ? ((8'ha1) ^~ (8'hac)) : ((8'hb2) ? (8'hbe) : (8'h9f)))}) : ((~&(((8'hb3) <= (8'h9e)) < ((7'h40) ^~ (8'hae)))) <= (^~((+(8'hba)) ? ((7'h40) ? (8'ha2) : (7'h40)) : {(8'hae)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire215;
  wire [(3'h5):(1'h0)] wire214;
  wire [(4'hc):(1'h0)] wire196;
  wire signed [(4'hc):(1'h0)] wire195;
  wire signed [(4'he):(1'h0)] wire194;
  wire signed [(3'h6):(1'h0)] wire193;
  wire signed [(4'hf):(1'h0)] wire192;
  wire signed [(5'h11):(1'h0)] wire191;
  wire signed [(5'h14):(1'h0)] wire190;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire188;
  wire [(4'hd):(1'h0)] wire198;
  wire signed [(4'hd):(1'h0)] wire199;
  wire signed [(4'h9):(1'h0)] wire200;
  wire signed [(4'hf):(1'h0)] wire203;
  reg signed [(4'hd):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg211 = (1'h0);
  reg [(4'hf):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg209 = (1'h0);
  reg [(3'h6):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg207 = (1'h0);
  reg [(3'h6):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(4'ha):(1'h0)] reg201 = (1'h0);
  assign y = {wire215,
                 wire214,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire19,
                 wire21,
                 wire22,
                 wire188,
                 wire198,
                 wire199,
                 wire200,
                 wire203,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg202,
                 reg201,
                 (1'h0)};
  module5 #() modinst20 (.wire9(wire2), .wire6(wire4), .wire10(wire3), .y(wire19), .clk(clk), .wire7(wire1), .wire8(wire0));
  assign wire21 = $unsigned($unsigned((^~$unsigned(wire4[(4'ha):(3'h7)]))));
  assign wire22 = wire3[(4'h9):(4'h8)];
  module23 #() modinst189 (wire188, clk, wire1, wire3, wire22, wire19, wire4);
  assign wire190 = ((&{$unsigned((wire188 ? wire1 : wire188)),
                           (wire0[(3'h4):(2'h3)] ?
                               {wire2, wire3} : (wire22 < (8'hbb)))}) ?
                       $unsigned((|wire0[(2'h3):(2'h2)])) : wire4[(4'h8):(3'h4)]);
  assign wire191 = (|$signed((7'h42)));
  assign wire192 = ((!$unsigned(wire191)) ?
                       ((&$signed((wire19 - wire1))) ?
                           (~^(wire191[(3'h4):(2'h2)] <<< (wire2 ?
                               wire19 : wire3))) : $signed((wire188 & $signed(wire21)))) : {((wire21 ?
                                   (wire188 ? wire0 : wire2) : wire191) ?
                               ((wire4 != wire3) & wire3[(4'h8):(3'h7)]) : $signed($signed((8'haa)))),
                           wire3});
  assign wire193 = wire190;
  assign wire194 = (8'ha6);
  assign wire195 = $signed(((|$unsigned((wire19 ?
                       (8'ha7) : wire4))) >> (&(&wire3[(4'ha):(3'h6)]))));
  module31 #() modinst197 (wire196, clk, wire188, wire191, wire4, wire21, wire190);
  assign wire198 = (^(8'hb3));
  assign wire199 = ($signed(wire1) ~^ (&wire195[(2'h2):(2'h2)]));
  assign wire200 = wire188[(4'hc):(2'h2)];
  always
    @(posedge clk) begin
      reg201 <= $signed((-wire191));
      reg202 <= $signed($unsigned((~{(8'hb4)})));
    end
  module113 #() modinst204 (.wire116(wire3), .wire114(wire188), .wire118(wire191), .wire115(wire22), .clk(clk), .wire117(wire195), .y(wire203));
  always
    @(posedge clk) begin
      reg205 <= wire192;
      reg206 <= $unsigned({wire195[(4'h8):(3'h7)]});
      reg207 <= (wire196 ? $signed(wire22[(4'hb):(4'ha)]) : $signed(wire188));
      reg208 <= wire203[(1'h1):(1'h0)];
      if ($unsigned(wire22[(3'h6):(2'h2)]))
        begin
          reg209 <= ($signed(wire0[(2'h2):(1'h1)]) ?
              (((|{wire200}) & (+$signed(wire194))) >>> wire1) : (~reg206[(1'h0):(1'h0)]));
          reg210 <= wire19;
          reg211 <= (reg201 ?
              reg207 : (~|($unsigned($signed(reg206)) ?
                  ($unsigned(wire191) >= (+reg206)) : $unsigned({(7'h42),
                      reg206}))));
          reg212 <= (8'ha0);
          reg213 <= $unsigned($signed($signed($signed((wire195 | wire22)))));
        end
      else
        begin
          reg209 <= (reg208[(1'h0):(1'h0)] ?
              ({$signed((reg207 ?
                      reg201 : wire0))} ^ ((+(-reg212)) > (~&(8'hac)))) : ($unsigned({wire193[(3'h5):(1'h1)],
                  $signed(wire19)}) < $signed(((wire0 ~^ reg210) ?
                  $signed(reg202) : (~|reg206)))));
          reg210 <= ((8'had) <<< $signed($signed({$signed(reg202)})));
        end
    end
  assign wire214 = $signed(((^wire196) & $signed((^wire19[(3'h5):(3'h5)]))));
  assign wire215 = (-wire19[(4'h8):(2'h2)]);
endmodule

module module23
#(parameter param186 = ({(~&((-(8'ha3)) ? ((8'hbf) ~^ (8'h9c)) : ((8'h9c) > (8'hbb)))), (~&(((8'hb7) ? (8'ha5) : (8'hbb)) >>> ((8'h9e) ? (8'had) : (7'h43))))} * (+{(((8'haa) ? (8'hb2) : (8'ha6)) ? (8'hb3) : (~^(8'hbf)))})), 
parameter param187 = ((param186 ? (((!param186) <<< param186) ? param186 : ((param186 ^ param186) & (param186 ^ param186))) : param186) > param186))
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire185;
  wire signed [(4'hb):(1'h0)] wire178;
  wire signed [(3'h4):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire109;
  wire [(5'h15):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire173;
  reg signed [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(4'he):(1'h0)] reg182 = (1'h0);
  reg [(3'h6):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg [(5'h15):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  assign y = {wire185,
                 wire178,
                 wire99,
                 wire70,
                 wire68,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire173,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg177,
                 reg176,
                 reg175,
                 reg29,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= wire28;
      reg30 <= $unsigned($signed(wire24));
    end
  module31 #() modinst69 (wire68, clk, reg29, wire26, reg30, wire24, wire27);
  assign wire70 = wire26;
  module71 #() modinst100 (.wire73(wire28), .wire72(wire70), .wire74(wire26), .wire75(reg30), .y(wire99), .clk(clk));
  assign wire101 = {reg30[(4'h8):(3'h4)]};
  assign wire102 = wire27;
  assign wire103 = {$unsigned((reg30[(2'h2):(2'h2)] ?
                           {wire25} : {((8'hb5) == wire68)})),
                       wire26[(4'ha):(1'h0)]};
  assign wire104 = ($unsigned(wire68) ?
                       $signed(reg30) : (wire28[(5'h12):(4'hf)] ?
                           (wire26 || {((7'h40) ^~ wire26)}) : (^~(|wire68[(3'h5):(2'h2)]))));
  assign wire105 = wire101[(2'h2):(1'h1)];
  assign wire106 = $signed(((((^~wire27) ? (+(8'hbb)) : (+wire70)) ?
                       $unsigned($signed(wire105)) : wire26) ~^ wire101[(4'h8):(3'h7)]));
  assign wire107 = wire28[(3'h5):(1'h0)];
  assign wire108 = $signed(wire25);
  assign wire109 = wire70[(3'h4):(1'h0)];
  assign wire110 = {({wire106} ?
                           (wire106 <= (~&$unsigned(wire24))) : $signed($signed(wire103[(1'h1):(1'h1)]))),
                       wire25};
  assign wire111 = {(^~$signed($signed(wire105[(5'h15):(2'h2)]))),
                       ((!($signed(wire27) ?
                               (wire68 ? wire106 : wire24) : $signed(reg29))) ?
                           (((8'hb5) ?
                               (~^wire68) : wire99[(1'h1):(1'h1)]) & reg30) : wire24)};
  assign wire112 = $signed($unsigned(wire99[(2'h2):(1'h0)]));
  module113 #() modinst174 (.wire117(wire112), .wire114(wire103), .clk(clk), .wire118(wire68), .wire116(wire26), .wire115(wire105), .y(wire173));
  always
    @(posedge clk) begin
      reg175 <= $signed($unsigned(wire107));
      reg176 <= ((wire99[(1'h1):(1'h0)] <<< ((+wire101) ?
              wire108[(4'hd):(3'h4)] : ((~|(8'hb0)) | wire24[(1'h0):(1'h0)]))) ?
          wire70 : (wire26 ?
              $signed($signed($unsigned((8'hb1)))) : $signed(((&reg175) >>> (wire107 ?
                  wire104 : wire26)))));
      reg177 <= (((~^{wire104}) <<< wire111[(2'h2):(1'h0)]) ?
          (wire107 && (wire107 ^~ $signed((wire104 ?
              wire24 : reg29)))) : (~^(($signed(wire109) ?
              (wire26 ? wire103 : wire109) : (wire70 ?
                  wire26 : wire70)) < (wire28 | (wire104 ? wire26 : wire28)))));
    end
  assign wire178 = (wire106[(2'h3):(1'h1)] ?
                       $unsigned($unsigned(((8'hbb) && wire107[(1'h1):(1'h1)]))) : wire101);
  always
    @(posedge clk) begin
      if ($signed((((~(!wire110)) | reg30) ~^ {$unsigned((wire110 && reg176)),
          ($unsigned(reg177) ?
              (wire28 ? reg29 : wire103) : $signed(wire111))})))
        begin
          reg179 <= (((wire110[(3'h6):(1'h0)] ~^ (wire106[(2'h3):(2'h3)] && (|wire108))) * reg176) >= (($unsigned(wire103[(4'hb):(4'ha)]) && $unsigned($unsigned(wire106))) ?
              $signed((wire173 * (wire103 ?
                  wire25 : wire103))) : ($signed(wire68) ?
                  wire109[(2'h3):(1'h0)] : (^wire99))));
          reg180 <= $signed(wire25);
          reg181 <= $unsigned((8'ha3));
          reg182 <= wire105;
          reg183 <= wire103[(2'h3):(2'h3)];
        end
      else
        begin
          reg179 <= reg29[(3'h5):(3'h4)];
        end
      reg184 <= ((8'ha2) ?
          (8'hbf) : (reg181 >>> $unsigned({(reg176 | reg177)})));
    end
  assign wire185 = {$unsigned(($unsigned(wire109) ?
                           reg176 : $signed($signed(wire28))))};
endmodule

module module5
#(parameter param18 = (|(-((7'h44) <= {(~(8'hb0)), ((8'hac) ? (8'haf) : (8'hb9))}))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  assign y = {wire17, wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $unsigned({wire9[(2'h3):(2'h3)],
                      $signed({wire10[(1'h0):(1'h0)], wire10})});
  assign wire12 = ($unsigned(wire7[(2'h2):(2'h2)]) ^~ wire6[(2'h3):(1'h0)]);
  assign wire13 = wire8;
  assign wire14 = ((wire7[(1'h1):(1'h1)] >>> {$unsigned({(8'hab)}),
                          $unsigned($unsigned(wire11))}) ?
                      ($signed($unsigned(wire11)) >> wire12[(1'h0):(1'h0)]) : $signed(wire9));
  assign wire15 = $unsigned({wire9, (wire8 | $unsigned($unsigned(wire7)))});
  assign wire16 = ((wire8 ?
                      {($unsigned(wire6) ? $unsigned(wire7) : wire12),
                          $signed($signed((8'ha9)))} : $signed(($signed(wire15) ^ $unsigned(wire8)))) & wire13[(4'hf):(3'h6)]);
  assign wire17 = wire8;
endmodule

module module113  (y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire118;
  input wire signed [(4'hc):(1'h0)] wire117;
  input wire [(3'h7):(1'h0)] wire116;
  input wire signed [(5'h13):(1'h0)] wire115;
  input wire [(4'hb):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire169;
  wire signed [(3'h6):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire133;
  wire signed [(4'hc):(1'h0)] wire132;
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire133,
                 wire132,
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
                 reg151,
                 reg150,
                 reg149,
                 reg148,
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
      reg119 <= wire116[(2'h3):(2'h3)];
      if (($signed(($signed((wire117 ?
              (8'hb0) : wire117)) >= (~&$unsigned(wire117)))) ?
          ($unsigned(wire116) ?
              $signed(reg119) : wire117[(3'h4):(1'h0)]) : $signed((($unsigned((8'hac)) <= wire114) ~^ wire118[(1'h1):(1'h0)]))))
        begin
          if ((wire117 * wire116[(2'h3):(2'h3)]))
            begin
              reg120 <= wire115[(2'h3):(2'h2)];
              reg121 <= $unsigned($signed(wire115[(4'hf):(4'hb)]));
              reg122 <= ({reg121,
                  $unsigned($signed(wire116[(3'h7):(1'h1)]))} < $signed(wire116[(3'h4):(1'h0)]));
              reg123 <= wire115[(1'h0):(1'h0)];
            end
          else
            begin
              reg120 <= (($unsigned(($unsigned(wire117) ?
                          (wire114 ? reg122 : wire117) : $signed(wire116))) ?
                      {($unsigned(wire114) ?
                              $signed(reg119) : $unsigned(wire117))} : (^(8'hb2))) ?
                  reg122 : $signed(({reg121} >> wire116)));
              reg121 <= $signed((wire114 & $signed($unsigned(reg122))));
              reg122 <= ((wire114 && ((-wire117[(4'ha):(3'h4)]) || $unsigned($signed(wire116)))) ?
                  reg123 : (reg121 ?
                      {{reg120, reg121}} : $unsigned($unsigned((wire117 ?
                          reg120 : (8'h9f))))));
              reg123 <= $unsigned(wire114[(4'h8):(2'h3)]);
            end
          reg124 <= $signed((7'h42));
          reg125 <= (^~wire114);
          reg126 <= wire116[(2'h2):(1'h1)];
          reg127 <= wire115;
        end
      else
        begin
          reg120 <= $unsigned(wire114[(4'h8):(4'h8)]);
          reg121 <= ({(8'ha3)} < reg122[(4'hb):(3'h7)]);
          reg122 <= (reg123 ?
              $unsigned($unsigned((reg123 ?
                  wire115[(4'he):(3'h4)] : (reg124 ?
                      wire116 : wire117)))) : $signed(wire117));
          reg123 <= reg127[(3'h4):(2'h3)];
          reg124 <= $unsigned($signed(wire116));
        end
      if (($signed(reg123[(3'h7):(2'h2)]) && $unsigned((~((reg125 ?
          reg127 : wire118) >>> reg125)))))
        begin
          reg128 <= wire116;
          reg129 <= $signed($signed($signed((^reg125[(4'ha):(1'h1)]))));
        end
      else
        begin
          reg128 <= (~&reg125);
          reg129 <= ({($unsigned({reg129, (8'ha5)}) ?
                  (|(reg119 ?
                      reg129 : wire116)) : ($unsigned(wire115) <= reg125[(5'h13):(1'h1)])),
              (($unsigned(reg127) << (reg126 > wire118)) ?
                  (-(reg123 ^ reg128)) : reg125[(4'hd):(4'hb)])} != wire118);
        end
      reg130 <= ((reg128[(3'h4):(2'h2)] == $unsigned({(!wire118),
          {reg125, reg128}})) > (+reg125[(4'h8):(1'h0)]));
      reg131 <= (8'had);
    end
  assign wire132 = $signed(wire116);
  assign wire133 = (8'hac);
  always
    @(posedge clk) begin
      if (($signed((wire115 > $signed($unsigned(wire132)))) ?
          {(($unsigned(reg122) ? $unsigned(reg122) : reg131) << wire117),
              $unsigned((~^(wire132 ?
                  wire132 : wire116)))} : $signed($signed((+reg120[(1'h1):(1'h0)])))))
        begin
          reg134 <= ($unsigned($unsigned(reg130)) ?
              (reg122[(4'h8):(1'h1)] | ($unsigned(wire118) >>> $unsigned((reg125 ?
                  reg122 : (8'hb8))))) : (^wire133[(3'h4):(1'h0)]));
          if (((!$signed($unsigned((reg126 ?
              wire116 : wire114)))) - reg122[(1'h1):(1'h0)]))
            begin
              reg135 <= reg123[(2'h2):(1'h1)];
              reg136 <= $signed($signed(reg126[(4'h8):(3'h7)]));
              reg137 <= reg126[(3'h7):(1'h1)];
              reg138 <= (^$signed($unsigned($unsigned(reg122))));
              reg139 <= $unsigned(wire116);
            end
          else
            begin
              reg135 <= $signed((~&reg136));
              reg136 <= {reg130, reg120};
            end
          reg140 <= $signed(reg119);
          if ($unsigned(($unsigned(reg124[(1'h1):(1'h0)]) != (^~(~^$signed(reg124))))))
            begin
              reg141 <= (|(reg119[(5'h10):(4'h8)] ^~ (reg139 ?
                  (8'hae) : (|(reg126 <<< wire114)))));
            end
          else
            begin
              reg141 <= (~&$unsigned(($unsigned({wire116}) > ((~|reg127) ?
                  reg123 : (&reg123)))));
              reg142 <= $signed(reg129);
              reg143 <= (&{reg139,
                  ((+reg125[(1'h0):(1'h0)]) ?
                      {(!(8'hb6)),
                          $signed(reg141)} : $signed((reg137 + reg137)))});
              reg144 <= reg131[(4'h8):(3'h4)];
            end
          reg145 <= (reg135[(1'h0):(1'h0)] ?
              reg140[(4'hb):(4'h9)] : ({(^reg125[(3'h6):(3'h4)]),
                  {(reg119 ? reg139 : reg140)}} < reg136));
        end
      else
        begin
          reg134 <= wire133[(2'h2):(1'h0)];
          reg135 <= (reg119[(4'hd):(4'hc)] ?
              $signed((!((reg144 ? reg119 : (8'hb1)) | (reg139 ?
                  reg130 : reg141)))) : (^((^~((8'haf) ? wire116 : reg140)) ?
                  (|reg137[(2'h3):(2'h3)]) : {(reg128 ? reg128 : reg131)})));
          reg136 <= ($signed($unsigned((reg119 ?
              (!(8'ha3)) : (~|reg139)))) - wire117);
        end
      if ({$signed(((^~reg126) ?
              $unsigned($unsigned((8'hb2))) : $signed(reg135[(2'h3):(2'h3)]))),
          reg128[(1'h1):(1'h1)]})
        begin
          reg146 <= (reg144 ? $unsigned(reg135[(2'h3):(2'h2)]) : (+reg123));
        end
      else
        begin
          if (({$unsigned($unsigned(reg141))} ^~ $unsigned((!reg142))))
            begin
              reg146 <= reg119[(3'h6):(2'h3)];
              reg147 <= $unsigned((reg135[(1'h0):(1'h0)] && ((~|(reg121 >> reg143)) ?
                  $signed(reg137) : $unsigned(((8'hb9) ? wire133 : wire117)))));
              reg148 <= (reg119[(4'he):(1'h0)] >= reg124);
              reg149 <= $unsigned(($unsigned(($signed((8'h9d)) >>> $unsigned(reg136))) & $signed(wire115[(4'he):(2'h3)])));
            end
          else
            begin
              reg146 <= (~&$signed(($unsigned(reg146) ?
                  $unsigned((|wire115)) : (^{wire116, reg126}))));
              reg147 <= reg126[(3'h6):(2'h2)];
            end
          if (wire132[(4'h9):(3'h5)])
            begin
              reg150 <= $signed((reg136[(4'h8):(3'h5)] ?
                  ((reg144 >= (~^wire114)) ?
                      $signed({reg126}) : reg126[(5'h11):(4'h9)]) : reg127[(3'h5):(3'h4)]));
              reg151 <= $signed($signed((($unsigned(reg139) ?
                  $signed((8'ha2)) : $signed(reg123)) >> wire133[(1'h0):(1'h0)])));
              reg152 <= reg139;
              reg153 <= reg142;
              reg154 <= reg119[(2'h2):(2'h2)];
            end
          else
            begin
              reg150 <= reg151[(3'h5):(2'h2)];
            end
          reg155 <= reg144[(4'hf):(4'ha)];
          if (wire115)
            begin
              reg156 <= $signed((reg134[(2'h2):(2'h2)] ?
                  reg131[(3'h6):(3'h5)] : $unsigned({(^reg127)})));
              reg157 <= (^~reg127[(3'h4):(1'h1)]);
            end
          else
            begin
              reg156 <= ((&$signed(reg126)) - reg139);
              reg157 <= $signed($signed({(reg139 ?
                      wire117[(4'hc):(2'h3)] : reg146),
                  reg146[(4'hf):(4'hd)]}));
            end
          reg158 <= $unsigned((reg122[(5'h10):(2'h3)] ?
              (((reg136 > (8'hb7)) >>> {reg151, wire118}) ?
                  ($signed(reg157) ?
                      wire133[(1'h0):(1'h0)] : reg131) : (reg138[(2'h3):(2'h2)] - (wire132 + wire118))) : (&$signed(reg121[(4'ha):(4'h9)]))));
        end
      if (((reg155[(4'hb):(4'h8)] || $signed($signed((~reg143)))) || reg150))
        begin
          reg159 <= $unsigned(($unsigned($unsigned((wire115 ?
              (8'hae) : reg141))) > {$signed((+reg131)), wire116}));
        end
      else
        begin
          if (($signed((~^$unsigned((+reg119)))) >= (($signed((8'hae)) ?
              $signed(reg123) : reg157) << reg137)))
            begin
              reg159 <= $signed(wire114);
              reg160 <= ({reg122, reg156} ?
                  $unsigned((!$signed($signed(reg157)))) : reg124[(3'h5):(2'h2)]);
              reg161 <= (8'h9f);
              reg162 <= reg150[(1'h0):(1'h0)];
            end
          else
            begin
              reg159 <= $unsigned($signed(reg142));
              reg160 <= reg126;
            end
          reg163 <= ($unsigned($signed($unsigned((8'hb3)))) | $unsigned((($unsigned(reg138) >> $unsigned(reg143)) + (reg123 || $unsigned(reg150)))));
        end
      reg164 <= (reg163[(2'h3):(2'h3)] ? (!$signed(wire133)) : reg122);
      reg165 <= ((8'ha8) || (+$unsigned({(reg143 ? reg131 : reg155)})));
    end
  assign wire166 = (reg135[(2'h2):(1'h0)] ? reg135 : reg124[(3'h7):(3'h5)]);
  assign wire167 = $signed(wire166[(4'h8):(3'h5)]);
  assign wire168 = ((~^reg148[(2'h2):(2'h2)]) ?
                       reg165[(5'h13):(5'h12)] : reg159);
  assign wire169 = (reg157 ?
                       $unsigned($unsigned(((-reg152) ?
                           reg124 : ((8'h9e) ?
                               reg162 : reg122)))) : reg146[(3'h4):(3'h4)]);
  assign wire170 = $signed({reg121});
  assign wire171 = $signed((wire118[(1'h1):(1'h1)] && reg144[(5'h10):(4'h8)]));
  assign wire172 = ((~|({(~^reg125), $unsigned(reg139)} ?
                           ($signed((8'ha5)) ?
                               $signed(reg148) : (~^(8'hae))) : $signed(reg139))) ?
                       reg144 : {$signed($unsigned({reg161, reg148}))});
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire75;
  input wire [(5'h10):(1'h0)] wire74;
  input wire [(2'h3):(1'h0)] wire73;
  input wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire76;
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire79,
                 wire76,
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
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire76 = $signed((wire72[(4'hb):(3'h6)] ^ wire74[(4'hc):(4'hc)]));
  always
    @(posedge clk) begin
      reg77 <= (($unsigned(({(8'ha4), wire74} ?
              wire75[(2'h3):(1'h0)] : (~wire74))) ?
          wire72 : (~|$signed(wire74))) + wire72);
      reg78 <= (((($signed(reg77) <<< wire72) & (wire74 ?
                  (wire75 ^~ wire75) : reg77[(3'h5):(3'h4)])) ?
              ((8'haa) ?
                  $unsigned((reg77 ?
                      reg77 : wire75)) : $unsigned((-(8'hb4)))) : wire72[(4'hb):(2'h3)]) ?
          (wire72[(5'h10):(3'h5)] ?
              (wire74 <<< $unsigned(reg77)) : wire72[(3'h6):(2'h3)]) : $signed($signed(wire76[(4'hd):(4'hc)])));
    end
  assign wire79 = ($signed(($signed($unsigned((7'h42))) ?
                      $unsigned($signed(wire72)) : (reg77 ?
                          (~^wire74) : (reg78 ?
                              wire72 : (8'ha0))))) != {((((8'ha3) <<< (8'haf)) ?
                              (-wire74) : wire75) ?
                          reg77 : reg77[(3'h5):(3'h5)])});
  always
    @(posedge clk) begin
      reg80 <= $unsigned($unsigned((-($unsigned(wire73) <= $signed(wire75)))));
      reg81 <= {wire74[(1'h1):(1'h1)]};
      reg82 <= (($unsigned(wire72) ?
              {(&(reg77 >= wire75))} : $signed(({reg78} * (reg78 >= reg77)))) ?
          (~|reg81) : ($unsigned($signed(wire73[(2'h3):(2'h3)])) && reg80[(4'hd):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg83 <= ({(((wire73 ? reg80 : wire74) ?
              (wire76 ^ reg82) : $signed(reg82)) > {(7'h41)})} == (!reg80[(1'h0):(1'h0)]));
      reg84 <= reg81[(3'h7):(3'h7)];
      if ($signed(((-(^~wire73)) < reg83)))
        begin
          reg85 <= (wire72 ?
              reg80[(3'h7):(2'h3)] : {$signed(reg80[(2'h3):(2'h3)]),
                  (wire74[(4'hf):(3'h6)] ?
                      $unsigned($unsigned(wire74)) : ({reg80, wire73} ?
                          $signed(reg78) : reg77))});
          reg86 <= wire75[(4'h8):(2'h2)];
          reg87 <= ($unsigned($signed((reg78 - (+reg81)))) ~^ (+$unsigned(($signed(wire73) ?
              (reg77 + wire72) : $unsigned(wire72)))));
          if ((wire75[(4'he):(1'h1)] ?
              wire73[(1'h1):(1'h0)] : (~((reg87[(3'h6):(1'h1)] <= wire73) ?
                  (reg83 ? reg87[(3'h6):(2'h3)] : wire73) : wire76))))
            begin
              reg88 <= $unsigned(reg83[(4'ha):(3'h6)]);
              reg89 <= $signed($unsigned($signed(((reg88 ?
                  wire72 : reg82) > reg83))));
              reg90 <= {{reg82}, $signed($unsigned($unsigned(reg81)))};
            end
          else
            begin
              reg88 <= $unsigned((~&(wire79 ?
                  $unsigned((~|wire73)) : (reg78[(4'hb):(3'h7)] ?
                      {reg77, (8'ha8)} : (wire75 ? wire76 : reg83)))));
              reg89 <= (|(-reg90));
            end
        end
      else
        begin
          if ($signed({(8'ha7), $unsigned($unsigned({(8'hac), (8'ha9)}))}))
            begin
              reg85 <= reg85;
              reg86 <= (reg81[(3'h6):(2'h2)] <= (((reg85[(2'h3):(2'h3)] == {reg84,
                  wire75}) >= $signed($unsigned(reg87))) == ({(reg82 && wire79),
                  $unsigned(reg78)} || ((~^wire75) ? (~reg81) : (~wire76)))));
            end
          else
            begin
              reg85 <= (wire74[(4'he):(2'h2)] ? reg77[(2'h3):(1'h1)] : wire76);
              reg86 <= {({$signed($unsigned(reg86))} ?
                      wire75[(4'hb):(1'h0)] : reg84)};
              reg87 <= (&{reg84[(1'h0):(1'h0)],
                  $signed($unsigned(reg86[(3'h6):(3'h4)]))});
              reg88 <= reg77;
            end
          reg89 <= (8'ha4);
        end
      reg91 <= wire72;
    end
  assign wire92 = $unsigned((^~$unsigned($signed((|wire74)))));
  assign wire93 = $unsigned((^$signed(wire74)));
  assign wire94 = reg87;
  assign wire95 = wire76;
  assign wire96 = reg84[(2'h3):(2'h2)];
  assign wire97 = $unsigned({(wire95 ?
                          ({(8'hb9), (8'ha4)} ?
                              (reg80 ?
                                  (8'hbe) : reg82) : $signed(reg82)) : ($signed(reg89) == reg78)),
                      $signed((wire73 && $signed(wire76)))});
  assign wire98 = (reg90 ?
                      {$signed($unsigned((8'hbc))),
                          (wire74[(4'hc):(2'h3)] ~^ $signed($unsigned(wire96)))} : (($unsigned(wire72[(4'h9):(3'h5)]) || $unsigned(wire74)) ?
                          $unsigned((((7'h43) ? reg90 : wire74) ?
                              $unsigned((8'ha8)) : $unsigned((8'hbe)))) : ($unsigned((reg86 ?
                                  (8'ha3) : wire94)) ?
                              (^~reg85) : $signed((8'hba)))));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire36;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(4'he):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg65,
                 reg64,
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
                 (1'h0)};
  assign wire37 = $unsigned($unsigned((~wire35)));
  assign wire38 = $signed($unsigned(((~|{wire34}) ^~ ({wire34,
                      wire33} << wire37[(3'h6):(3'h6)]))));
  assign wire39 = $unsigned($signed(wire32[(5'h10):(2'h3)]));
  assign wire40 = (~^$unsigned((wire35 < wire34[(4'he):(3'h7)])));
  assign wire41 = (~^{wire38});
  always
    @(posedge clk) begin
      reg42 <= ((|wire41[(4'h8):(3'h7)]) ?
          $signed(((wire41 ?
              (^~wire33) : wire33[(4'hf):(4'hf)]) == $unsigned(((8'ha1) > wire40)))) : $unsigned((8'hab)));
      if (wire34)
        begin
          reg43 <= wire35;
          if ({(8'ha1)})
            begin
              reg44 <= $signed($unsigned(wire34[(4'ha):(4'h9)]));
              reg45 <= wire33[(3'h4):(1'h0)];
              reg46 <= $unsigned((reg42[(3'h4):(1'h1)] ^ reg43[(4'hb):(2'h2)]));
              reg47 <= $signed((8'hb2));
              reg48 <= $unsigned($unsigned($signed({(-wire35)})));
            end
          else
            begin
              reg44 <= wire39;
              reg45 <= $signed($signed($unsigned((&(wire32 ?
                  wire33 : wire33)))));
              reg46 <= wire38;
              reg47 <= wire33;
              reg48 <= $signed((((wire33 <<< {(8'haa)}) >> wire40[(1'h1):(1'h0)]) ?
                  (($signed((8'hb9)) ?
                      wire40[(2'h3):(1'h0)] : reg43) > wire36[(2'h2):(2'h2)]) : $unsigned($signed((~|reg42)))));
            end
          reg49 <= ({($unsigned($signed(wire36)) ~^ ((reg44 - reg42) ?
                      (reg42 <<< reg43) : $unsigned(wire38))),
                  $signed((^~(!reg43)))} ?
              wire39 : wire40[(2'h2):(1'h0)]);
          if ((((reg45 ?
              wire32 : ((wire35 > wire39) | $signed(reg45))) <<< {reg48}) != ((wire35 ~^ {{wire35},
              {reg47,
                  wire37}}) || (wire33[(1'h1):(1'h1)] * $unsigned((reg48 >> (8'hb1)))))))
            begin
              reg50 <= (wire32 ?
                  ($signed((-(wire40 <<< wire35))) ?
                      $signed($unsigned((~^reg47))) : wire33) : (|(!$unsigned($signed(reg46)))));
              reg51 <= $unsigned($signed((wire33 ?
                  {{wire39, (8'hb6)}} : reg45)));
              reg52 <= $unsigned((-reg48[(4'hb):(4'hb)]));
              reg53 <= ((-wire33[(4'h8):(4'h8)]) != wire40[(1'h0):(1'h0)]);
            end
          else
            begin
              reg50 <= $signed(wire36[(4'hc):(3'h4)]);
              reg51 <= $unsigned(({((wire37 > wire39) ?
                      (wire33 ? reg52 : wire36) : (~wire32))} ~^ (8'hab)));
              reg52 <= (reg42 ? reg44 : $unsigned((reg44 + (+{reg51}))));
            end
        end
      else
        begin
          reg43 <= $unsigned(((8'ha2) ?
              wire36 : (~|$unsigned($signed(wire41)))));
          if ((((~(8'ha7)) ?
              wire40 : ((wire41 ?
                  (~wire36) : (~reg49)) == $unsigned(wire40[(2'h3):(2'h2)]))) - (8'hb2)))
            begin
              reg44 <= (8'hbc);
              reg45 <= (+$unsigned({$signed((+(8'haf)))}));
            end
          else
            begin
              reg44 <= ($unsigned(((&$signed(reg51)) ?
                      $unsigned((reg44 ? wire39 : wire39)) : (8'hb3))) ?
                  $signed($unsigned((~|(|wire38)))) : $signed((~&(reg45 || reg50))));
            end
        end
      reg54 <= wire35;
    end
  assign wire55 = (((~(~^(reg45 * wire33))) == wire41[(4'h9):(2'h3)]) * (~^(~&reg43[(2'h3):(1'h0)])));
  assign wire56 = (8'ha1);
  assign wire57 = reg50[(3'h7):(3'h5)];
  assign wire58 = $signed((8'hb2));
  assign wire59 = (&$unsigned($unsigned($unsigned((reg44 ? wire39 : wire37)))));
  assign wire60 = reg50;
  assign wire61 = (wire40[(2'h2):(1'h1)] ?
                      $signed({($signed(reg49) >>> (reg50 ?
                              wire56 : wire35))}) : reg54);
  assign wire62 = ($signed((~^reg43[(1'h1):(1'h0)])) ?
                      reg50[(3'h5):(3'h5)] : $unsigned({(8'hb0)}));
  assign wire63 = $unsigned($signed(($signed(wire58) ?
                      $unsigned(wire38[(2'h3):(1'h0)]) : reg47[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg64 <= (~(8'hb6));
      reg65 <= ($unsigned((wire35 ?
          {$signed((8'ha3)),
              $unsigned(wire59)} : ($unsigned((8'hb6)) - {reg50}))) - ({reg50,
          (~$unsigned(wire55))} ^ {((~^(8'ha7)) ~^ {reg50}),
          $unsigned((wire34 ^ wire35))}));
    end
  assign wire66 = wire56;
  assign wire67 = (|$signed((~|reg52)));
endmodule
