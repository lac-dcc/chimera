module top
#(parameter param274 = ((+(~(~{(8'hb1), (7'h42)}))) ? (~(8'ha6)) : ((|(((8'ha9) <<< (8'hbf)) >= ((8'h9c) ? (7'h44) : (8'hac)))) << ((((8'hab) ? (8'ha1) : (7'h41)) ^~ ((8'hb6) ? (8'ha3) : (7'h41))) ? (((8'hb8) + (8'hac)) ? ((8'ha1) <= (8'ha9)) : ((8'ha7) ? (8'hae) : (7'h40))) : (((7'h42) ? (8'ha7) : (8'hbc)) ? (8'h9f) : (+(7'h42)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire273;
  wire [(5'h13):(1'h0)] wire272;
  wire [(5'h15):(1'h0)] wire270;
  wire signed [(5'h14):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire273,
                 wire272,
                 wire270,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire5,
                 wire4,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned((~&wire3));
  assign wire5 = ((^(wire2 ? wire0 : wire4)) < (|wire4[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= (&$signed($unsigned($unsigned(wire2))));
    end
  module7 #() modinst106 (.wire11(wire4), .clk(clk), .y(wire105), .wire10(wire3), .wire8(wire2), .wire9(wire5));
  assign wire107 = $unsigned(((wire3 == ((wire105 - wire0) ?
                       (wire0 ?
                           wire5 : (8'hb5)) : $signed(wire4))) != wire5[(2'h2):(2'h2)]));
  assign wire108 = wire5;
  assign wire109 = wire2;
  assign wire110 = wire4[(4'ha):(3'h7)];
  module111 #() modinst271 (.wire112(wire2), .wire116(wire105), .wire113(wire3), .wire115(wire4), .y(wire270), .clk(clk), .wire114(reg6));
  assign wire272 = $signed({((^$unsigned(wire270)) == ((|reg6) >= (wire4 ?
                           reg6 : wire0))),
                       $signed((~&$unsigned(wire108)))});
  assign wire273 = $unsigned((8'ha5));
endmodule

module module111
#(parameter param268 = (|(|(^~(((7'h42) ? (8'h9d) : (8'hbc)) ? {(8'hb7)} : ((8'hac) ? (8'hb6) : (8'h9f)))))), 
parameter param269 = {{(((param268 >= param268) ? ((8'hba) ? param268 : param268) : param268) ? {((8'hb7) != param268)} : ((param268 ? param268 : param268) && (&param268))), (8'hb9)}})
(y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h30b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire116;
  input wire signed [(5'h10):(1'h0)] wire115;
  input wire [(5'h12):(1'h0)] wire114;
  input wire [(2'h3):(1'h0)] wire113;
  input wire [(5'h12):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire267;
  wire signed [(4'he):(1'h0)] wire264;
  wire signed [(4'he):(1'h0)] wire260;
  wire [(4'hb):(1'h0)] wire259;
  wire [(2'h3):(1'h0)] wire258;
  wire [(4'he):(1'h0)] wire257;
  wire signed [(4'ha):(1'h0)] wire215;
  wire signed [(4'hf):(1'h0)] wire162;
  wire signed [(4'hd):(1'h0)] wire161;
  wire signed [(5'h10):(1'h0)] wire160;
  wire [(4'hb):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire235;
  reg [(4'ha):(1'h0)] reg266 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(5'h13):(1'h0)] reg263 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg262 = (1'h0);
  reg [(3'h4):(1'h0)] reg261 = (1'h0);
  reg [(5'h10):(1'h0)] reg256 = (1'h0);
  reg [(3'h6):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg254 = (1'h0);
  reg [(4'hb):(1'h0)] reg253 = (1'h0);
  reg [(5'h15):(1'h0)] reg252 = (1'h0);
  reg [(5'h10):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg250 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg249 = (1'h0);
  reg [(4'hd):(1'h0)] reg248 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg245 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg244 = (1'h0);
  reg [(5'h14):(1'h0)] reg243 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg242 = (1'h0);
  reg [(2'h2):(1'h0)] reg241 = (1'h0);
  reg [(3'h4):(1'h0)] reg240 = (1'h0);
  reg [(5'h10):(1'h0)] reg239 = (1'h0);
  reg [(3'h7):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg237 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  assign y = {wire267,
                 wire264,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire215,
                 wire162,
                 wire161,
                 wire160,
                 wire154,
                 wire133,
                 wire129,
                 wire235,
                 reg266,
                 reg265,
                 reg263,
                 reg262,
                 reg261,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg131,
                 reg132,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 (1'h0)};
  module117 #() modinst130 (wire129, clk, wire115, wire116, wire114, wire112);
  always
    @(posedge clk) begin
      reg131 <= wire129[(4'he):(4'ha)];
      reg132 <= $unsigned((((^~reg131) ? wire113 : (~|$signed(wire112))) ?
          wire129 : $signed((wire115 < (~&(8'had))))));
    end
  assign wire133 = $signed($unsigned(wire116[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      if (((~|$unsigned($unsigned((~|wire112)))) ?
          $signed((({wire133} || (~&(8'hb6))) ?
              $signed(wire112[(4'hb):(2'h2)]) : ($unsigned(wire112) ?
                  (wire112 && wire114) : {wire115,
                      wire114}))) : (wire129 > $unsigned(wire116[(3'h4):(2'h2)]))))
        begin
          if ($signed(wire133))
            begin
              reg134 <= wire114[(5'h10):(4'he)];
              reg135 <= (~&$signed(($signed({wire129}) << (^$signed(reg132)))));
              reg136 <= $signed(wire116[(3'h7):(3'h6)]);
            end
          else
            begin
              reg134 <= reg134[(4'h8):(1'h1)];
            end
          reg137 <= {reg131[(4'he):(4'he)]};
          if ({(8'h9c)})
            begin
              reg138 <= ((((8'hab) ? (8'hbc) : $unsigned((~reg131))) ?
                  wire116[(2'h2):(1'h1)] : $unsigned({(reg131 ?
                          reg134 : wire113)})) & {($unsigned(wire133) ?
                      $signed(((8'ha5) - wire113)) : reg131[(2'h2):(1'h1)]),
                  $unsigned(reg131[(1'h0):(1'h0)])});
              reg139 <= {(({reg137[(4'hb):(4'h8)]} ?
                      (wire116 ?
                          $signed(wire116) : (reg138 ?
                              reg137 : reg132)) : wire112[(4'hc):(4'ha)]) + (reg132 ^~ (7'h42)))};
              reg140 <= $unsigned($signed(({(wire112 == wire112)} || ($unsigned(reg139) >= wire115[(5'h10):(3'h4)]))));
            end
          else
            begin
              reg138 <= (~&(($signed(wire112[(5'h11):(4'ha)]) << reg137) ?
                  $signed({(~|wire116),
                      (reg132 ? wire113 : wire112)}) : ({$unsigned(wire129)} ?
                      (reg132 ?
                          (+reg137) : wire133[(4'h9):(1'h1)]) : {{wire113},
                          (wire129 | wire112)})));
              reg139 <= reg132[(1'h1):(1'h0)];
            end
          if (wire115)
            begin
              reg141 <= $unsigned((^~$unsigned($unsigned((reg136 << (8'hb4))))));
              reg142 <= {((reg131 != $unsigned({reg139})) ?
                      $signed($unsigned((!(7'h41)))) : reg132),
                  $unsigned($unsigned($unsigned($signed(wire114))))};
            end
          else
            begin
              reg141 <= (reg131[(4'hb):(4'h8)] ^ reg142);
            end
          reg143 <= {(reg136 ? {$signed((reg140 >> reg135))} : reg131),
              reg134[(2'h2):(2'h2)]};
        end
      else
        begin
          reg134 <= wire133[(4'hb):(4'h8)];
          if (wire114[(1'h0):(1'h0)])
            begin
              reg135 <= wire113[(1'h0):(1'h0)];
              reg136 <= $unsigned(($signed(reg142) ?
                  $signed((wire113[(1'h1):(1'h1)] & (wire114 && reg139))) : {wire113[(2'h3):(1'h1)],
                      (~&(8'ha0))}));
              reg137 <= ($unsigned((reg131[(3'h7):(3'h5)] + $unsigned(wire114[(1'h1):(1'h0)]))) ?
                  ((reg142[(5'h10):(3'h5)] ?
                          $signed({reg132}) : reg131[(4'hb):(2'h2)]) ?
                      reg143[(3'h7):(2'h2)] : reg136) : {((~^wire115[(2'h3):(2'h2)]) ?
                          {(~&reg143)} : $unsigned((reg142 & reg142)))});
            end
          else
            begin
              reg135 <= reg138;
              reg136 <= ($signed(reg136[(3'h4):(2'h2)]) == $signed(reg131[(3'h6):(2'h3)]));
            end
          if ((reg136[(4'h9):(3'h7)] ?
              {reg139[(4'h8):(2'h2)],
                  {$signed((reg141 <<< (7'h43)))}} : $signed($signed(wire114))))
            begin
              reg138 <= $unsigned($signed((reg135[(1'h0):(1'h0)] ?
                  (&wire112) : reg134[(4'h8):(3'h4)])));
              reg139 <= (~|$signed($signed((reg141[(2'h2):(1'h1)] ?
                  (wire113 >= wire116) : $unsigned(wire116)))));
              reg140 <= {(^(&reg135[(1'h1):(1'h1)])), (~&wire129)};
              reg141 <= {wire129[(2'h3):(2'h2)]};
              reg142 <= $unsigned($unsigned(reg143[(3'h6):(2'h3)]));
            end
          else
            begin
              reg138 <= (reg140 ~^ $unsigned((({reg142, wire112} ?
                      wire129 : reg136[(3'h6):(2'h3)]) ?
                  $unsigned({reg141, reg138}) : $unsigned($signed(reg132)))));
              reg139 <= (wire129 + (({$signed(wire115)} ?
                  reg139 : reg141[(2'h2):(1'h1)]) >= reg132));
              reg140 <= $signed((reg141 <<< $signed((reg142[(4'he):(1'h0)] == $signed(wire112)))));
            end
          reg143 <= reg141[(2'h2):(1'h1)];
          reg144 <= ($signed(($signed((reg142 ?
              reg136 : (8'haa))) + $signed(reg131))) ^ reg143);
        end
      reg145 <= (8'haa);
      reg146 <= ($signed(reg142) ?
          reg138 : (($signed(((7'h44) ? reg143 : reg139)) ?
              {(wire113 & reg135)} : $signed({reg144,
                  reg142})) || $signed($unsigned($signed((8'had))))));
    end
  always
    @(posedge clk) begin
      if (wire133[(4'ha):(3'h7)])
        begin
          reg147 <= (reg131[(4'hc):(2'h2)] ?
              ($signed((^~{wire129})) >>> (-(~(wire133 ^~ reg143)))) : {$unsigned(reg136)});
          reg148 <= (-((($signed(wire114) ? wire129 : wire113) ?
                  $signed($signed(reg141)) : $unsigned((reg141 >= reg132))) ?
              $signed($signed(reg141)) : wire115[(2'h2):(1'h1)]));
        end
      else
        begin
          if ($unsigned(reg144[(1'h1):(1'h0)]))
            begin
              reg147 <= $unsigned({(-$unsigned($unsigned(reg146))),
                  reg134[(3'h7):(3'h6)]});
              reg148 <= (+reg138[(2'h3):(1'h1)]);
            end
          else
            begin
              reg147 <= $unsigned(reg141[(2'h2):(2'h2)]);
              reg148 <= (reg148[(4'hb):(4'h9)] ^ ($unsigned((&$unsigned(reg148))) ?
                  $unsigned($signed(reg144[(3'h4):(1'h1)])) : reg134));
              reg149 <= (^~((wire129[(4'ha):(2'h3)] << ($signed(reg137) >> {reg141})) ?
                  ((&$signed(reg141)) <= reg136[(5'h15):(4'he)]) : ((&(~&reg143)) ?
                      (reg147[(4'h9):(2'h2)] ^ (reg143 < reg143)) : (~|(reg138 ?
                          (8'ha5) : reg146)))));
            end
          if ($unsigned((^~$signed($signed(wire112)))))
            begin
              reg150 <= ((~|(^~({reg135} > reg142[(3'h5):(2'h3)]))) > $unsigned($unsigned((~(reg144 ?
                  reg131 : wire116)))));
              reg151 <= reg148;
              reg152 <= $unsigned({reg134});
            end
          else
            begin
              reg150 <= $signed(({$signed((wire114 ~^ reg140))} == ($unsigned(reg150) ?
                  reg134 : $signed($unsigned(wire133)))));
              reg151 <= (~&reg145[(3'h5):(2'h3)]);
              reg152 <= reg139[(5'h11):(2'h3)];
            end
          reg153 <= $signed((|$unsigned(reg137)));
        end
    end
  assign wire154 = (^($signed({$unsigned(reg152)}) ?
                       reg153[(2'h2):(2'h2)] : (-{((8'had) << reg141),
                           (reg148 ? (8'hb7) : reg140)})));
  always
    @(posedge clk) begin
      reg155 <= ($unsigned(((~^{reg135, reg142}) | ({wire133, reg131} ?
              (8'ha5) : $signed(wire115)))) ?
          $unsigned($signed(reg143[(1'h0):(1'h0)])) : {(~&({(7'h42)} <= reg132))});
      reg156 <= $unsigned(({((reg143 >>> reg138) <= (&reg135))} >> wire133));
      reg157 <= (^~(reg132[(1'h0):(1'h0)] ?
          $unsigned($unsigned($unsigned(reg135))) : ((8'hb6) ?
              $signed($signed(reg140)) : (^(|reg131)))));
      if (reg156)
        begin
          reg158 <= ($signed(((&$signed(reg155)) <<< wire116)) || (reg136 ?
              (8'h9f) : {reg155}));
          reg159 <= (|$unsigned($unsigned({$unsigned(reg143),
              reg131[(4'hc):(2'h3)]})));
        end
      else
        begin
          reg158 <= (reg156[(1'h1):(1'h1)] ?
              $signed(reg150[(3'h5):(3'h5)]) : wire129[(4'hc):(4'h9)]);
        end
    end
  assign wire160 = $signed(reg157[(1'h1):(1'h1)]);
  assign wire161 = reg144[(2'h3):(1'h0)];
  assign wire162 = wire133;
  module163 #() modinst216 (wire215, clk, reg137, wire112, reg136, reg148);
  module217 #() modinst236 (wire235, clk, reg159, wire114, reg157, reg142, reg136);
  always
    @(posedge clk) begin
      reg237 <= (($unsigned(wire160[(4'hb):(3'h6)]) ~^ wire114) << reg151);
      if (reg146[(1'h1):(1'h1)])
        begin
          if (((~{$unsigned((wire162 ? reg147 : reg135))}) ?
              wire113[(1'h0):(1'h0)] : ((($signed(reg237) | $unsigned(reg155)) ?
                  (reg149 < ((8'ha4) ? reg155 : wire162)) : $unsigned((reg146 ?
                      reg146 : reg139))) >= (reg143[(3'h5):(1'h1)] ?
                  reg148 : (7'h42)))))
            begin
              reg238 <= (((^~((&reg158) ? $unsigned(reg147) : wire133)) ?
                  $unsigned({(reg138 ^ wire154),
                      ((7'h42) ?
                          reg150 : wire113)}) : $unsigned((8'hbf))) * {wire161,
                  {($signed(reg131) <= $signed(reg139)),
                      (^~(reg135 ? (7'h44) : reg155))}});
              reg239 <= (reg146 | (+($unsigned(wire133[(3'h4):(1'h1)]) ?
                  ((reg131 ? reg156 : (8'hab)) ?
                      (wire161 ~^ reg157) : $unsigned((8'ha3))) : {reg139[(2'h3):(1'h0)]})));
              reg240 <= (~|({$signed($unsigned(reg131))} == ((~$signed(reg152)) != $signed(reg238[(3'h7):(3'h7)]))));
              reg241 <= $unsigned($signed($unsigned(reg157[(3'h5):(1'h0)])));
              reg242 <= {$unsigned($signed(($signed(wire114) ?
                      $signed(reg136) : $signed((8'ha9))))),
                  reg152[(4'h8):(1'h0)]};
            end
          else
            begin
              reg238 <= {(-($signed(reg155) >>> reg145[(5'h12):(4'hf)])),
                  ({(reg146[(3'h5):(1'h0)] ^~ $unsigned(reg159)),
                      reg143} && (^~reg149[(4'he):(3'h6)]))};
              reg239 <= (-$unsigned((reg157 ?
                  $unsigned(reg158[(4'ha):(1'h1)]) : (&$unsigned(wire113)))));
              reg240 <= ({reg156[(2'h3):(1'h0)],
                      $signed(($unsigned((8'hbd)) >>> (reg159 * reg152)))} ?
                  $signed(reg141) : reg139[(1'h0):(1'h0)]);
            end
          reg243 <= $unsigned(reg241);
          reg244 <= reg153[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned(((^~reg131) || (&((8'ha8) * wire160[(4'he):(4'he)])))))
            begin
              reg238 <= wire112;
            end
          else
            begin
              reg238 <= reg143[(4'h8):(2'h2)];
              reg239 <= (~|$unsigned((~^(reg243[(4'h8):(2'h2)] ?
                  reg237 : (reg239 ? wire112 : reg155)))));
              reg240 <= (reg131 < wire116[(3'h5):(1'h0)]);
              reg241 <= (+$signed($unsigned(($unsigned((8'hbf)) <= (reg147 == (8'hb5))))));
              reg242 <= (&$signed(reg146));
            end
          reg243 <= reg139;
          reg244 <= reg242;
          reg245 <= $unsigned($signed($signed($unsigned((-reg158)))));
          if ((|reg136[(4'hd):(3'h6)]))
            begin
              reg246 <= $unsigned(reg239);
              reg247 <= wire162[(4'hd):(4'ha)];
              reg248 <= wire235[(3'h7):(1'h1)];
              reg249 <= wire116[(2'h2):(2'h2)];
              reg250 <= (~(reg132 >>> $signed($unsigned($signed(wire161)))));
            end
          else
            begin
              reg246 <= ($unsigned({($signed(reg237) ?
                      ((8'ha6) | (8'hb5)) : (wire154 * reg134)),
                  (8'ha1)}) << (reg250[(5'h10):(3'h7)] ?
                  reg152[(3'h5):(2'h2)] : wire113[(1'h1):(1'h0)]));
              reg247 <= reg142[(5'h12):(4'h8)];
              reg248 <= $signed($unsigned((^~(-(reg138 <<< wire160)))));
              reg249 <= $signed(wire115);
            end
        end
      if ((wire215 ^ reg159))
        begin
          if ($unsigned(((^reg151) == {(reg242 ?
                  ((8'hbc) ? reg159 : reg140) : ((8'hb4) > reg149)),
              ((|reg137) && ((8'ha7) | reg137))})))
            begin
              reg251 <= {(-(!reg248)),
                  {((~|(^reg240)) ?
                          $unsigned((~|(7'h43))) : reg150[(4'h8):(3'h6)]),
                      ($signed((+reg245)) ? reg152 : reg144[(3'h6):(3'h6)])}};
              reg252 <= reg150;
              reg253 <= $unsigned(reg248[(2'h2):(1'h0)]);
              reg254 <= (~$signed((~^$unsigned(wire235[(4'h9):(4'h9)]))));
            end
          else
            begin
              reg251 <= reg239[(4'hb):(4'hb)];
              reg252 <= $signed(reg239[(4'ha):(2'h2)]);
              reg253 <= (|((8'hbd) ?
                  ($unsigned((reg238 ?
                      reg244 : reg156)) == $signed(reg237[(4'ha):(1'h0)])) : (^{(reg139 ?
                          (8'hb7) : wire115),
                      (reg240 ? reg138 : reg159)})));
              reg254 <= $unsigned((-(({reg244} ? $unsigned(reg131) : reg240) ?
                  reg252[(4'h9):(2'h2)] : (wire133 ?
                      (^(8'hbd)) : reg247[(4'hc):(2'h2)]))));
              reg255 <= reg142;
            end
        end
      else
        begin
          if ((((!{reg143[(1'h1):(1'h1)], (~&reg132)}) ?
              {({reg137,
                      reg243} <<< (8'ha8))} : $unsigned((&reg134))) >= ($unsigned(reg143) ?
              reg249[(1'h0):(1'h0)] : (^(|wire129[(3'h6):(3'h4)])))))
            begin
              reg251 <= (($unsigned($signed($unsigned(reg247))) ?
                  (~reg140) : (8'ha4)) ~^ reg237[(4'ha):(3'h7)]);
              reg252 <= $signed(({$unsigned((~reg241))} ?
                  reg152 : (((-reg159) - $signed(reg248)) ~^ reg144[(3'h4):(3'h4)])));
              reg253 <= $signed({(^(((8'h9e) ?
                      wire161 : wire114) < $unsigned(wire162)))});
            end
          else
            begin
              reg251 <= (((&$unsigned(reg132)) ?
                  $unsigned((|(reg147 >= reg158))) : $signed({$unsigned((8'ha2)),
                      {reg156, reg152}})) + $unsigned(($unsigned({(8'ha7)}) ?
                  $unsigned((reg245 < reg155)) : $unsigned($signed(wire133)))));
              reg252 <= ({reg143[(3'h4):(1'h0)]} ?
                  ($signed(wire215[(1'h1):(1'h1)]) >>> (!(^~((8'hba) ?
                      (8'had) : reg152)))) : ($unsigned(((reg251 >> reg139) ?
                      reg148 : wire161)) > reg252));
              reg253 <= (($unsigned($unsigned(wire116)) ?
                      reg238[(3'h4):(1'h1)] : (~&{{reg237, wire162},
                          $unsigned(reg158)})) ?
                  reg139[(4'hf):(3'h6)] : reg244[(3'h5):(2'h3)]);
              reg254 <= (wire112 ?
                  $unsigned(($unsigned((!wire112)) + (reg247[(1'h1):(1'h0)] ?
                      (reg142 > reg158) : (reg255 ?
                          reg158 : reg247)))) : reg145[(4'hb):(3'h4)]);
              reg255 <= $signed(($signed((-(reg249 < reg135))) ?
                  $signed(({wire215} - reg155[(3'h5):(2'h3)])) : wire215[(3'h5):(1'h1)]));
            end
        end
      reg256 <= (&(reg253[(4'h9):(1'h1)] ?
          (((8'ha5) ? $unsigned((8'hbe)) : $unsigned((8'ha2))) ?
              wire129 : (&{reg144})) : {(|reg148)}));
    end
  assign wire257 = {(wire112[(3'h5):(1'h0)] ?
                           ((^~reg153) ?
                               $unsigned((reg151 ?
                                   reg243 : reg140)) : reg136[(5'h14):(4'he)]) : wire129[(4'h9):(2'h2)]),
                       reg251};
  assign wire258 = $unsigned($unsigned(reg156));
  assign wire259 = (($signed($unsigned((reg155 ? reg242 : reg136))) ?
                           ((-((7'h41) || reg253)) * (!reg155[(4'he):(4'ha)])) : wire257[(4'hd):(4'hc)]) ?
                       $unsigned({wire235}) : (~&$signed((!((8'hb0) >> reg248)))));
  assign wire260 = reg237;
  always
    @(posedge clk) begin
      reg261 <= reg159[(3'h5):(1'h1)];
      reg262 <= $unsigned((~^((8'hb8) ?
          {reg157[(3'h5):(1'h1)], (reg242 > reg153)} : ((~&reg241) ?
              reg140 : $unsigned(reg246)))));
      reg263 <= reg249;
    end
  assign wire264 = {(~(+(wire116[(1'h0):(1'h0)] - (^reg134))))};
  always
    @(posedge clk) begin
      if (wire260[(4'hd):(4'hd)])
        begin
          reg265 <= {{$signed(reg146[(2'h3):(2'h2)])}};
        end
      else
        begin
          if ((wire154[(4'ha):(3'h7)] ~^ reg148))
            begin
              reg265 <= $unsigned(reg140);
            end
          else
            begin
              reg265 <= ((^reg238[(1'h1):(1'h1)]) ?
                  $unsigned(wire129[(4'h8):(1'h1)]) : wire114);
            end
        end
      reg266 <= ($signed(((~^$signed(wire162)) ?
              $unsigned($unsigned(reg261)) : ($unsigned(wire129) == (8'hb2)))) ?
          (|(reg252 > reg153[(1'h0):(1'h0)])) : $signed(reg143[(3'h6):(1'h1)]));
    end
  assign wire267 = reg144;
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire67;
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
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
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  module12 #() modinst68 (.wire17(wire9), .wire16(wire8), .wire14(wire10), .wire15(wire11), .wire13((8'hb7)), .clk(clk), .y(wire67));
  assign wire69 = $signed((~(wire11 ?
                      $unsigned($unsigned(wire8)) : ($signed(wire67) <= $signed(wire10)))));
  assign wire70 = wire10;
  assign wire71 = $unsigned(wire11);
  assign wire72 = ((wire9[(3'h4):(2'h3)] ?
                          {$signed($unsigned(wire10)),
                              $unsigned($unsigned(wire71))} : $signed({wire10[(4'hb):(4'h9)],
                              (wire11 ? (8'ha3) : wire70)})) ?
                      (~^$signed($signed((wire67 ?
                          wire8 : wire70)))) : wire67[(3'h6):(1'h1)]);
  assign wire73 = $signed({wire11[(4'hd):(1'h0)]});
  assign wire74 = ($signed($unsigned(wire11[(4'h8):(1'h0)])) << wire8);
  assign wire75 = (~^$unsigned((^~wire67[(3'h4):(2'h3)])));
  assign wire76 = ($unsigned(($unsigned((wire10 >>> (8'ha6))) <= wire72[(3'h5):(3'h4)])) <= ($signed($unsigned({(8'ha4),
                          (8'hb3)})) ?
                      $signed($unsigned((wire10 ? (8'hb1) : wire8))) : wire73));
  always
    @(posedge clk) begin
      reg77 <= ((wire10 <<< {(wire72[(4'hb):(1'h1)] ?
                  (8'hbc) : $signed(wire74)),
              {wire71[(4'ha):(4'ha)]}}) ?
          $signed(wire10) : wire69[(1'h1):(1'h1)]);
      reg78 <= $signed((~&$unsigned(({wire71} >= wire74))));
      if (wire11[(2'h3):(1'h1)])
        begin
          reg79 <= wire67;
          if (($unsigned($unsigned(wire69)) ?
              $unsigned(((wire9 ? $signed((8'h9e)) : $signed((8'hbf))) ?
                  $signed($signed(wire70)) : $unsigned(reg79))) : ((^$signed(((8'hb7) ?
                      wire75 : wire9))) ?
                  ({$unsigned(wire69)} ?
                      (wire67 ?
                          wire67 : (7'h43)) : $signed($signed(wire75))) : wire10)))
            begin
              reg80 <= reg79;
            end
          else
            begin
              reg80 <= wire10[(4'hf):(2'h2)];
              reg81 <= (^~(~((wire74[(4'hb):(4'hb)] ~^ $signed(reg78)) >= wire75)));
            end
          reg82 <= ($unsigned((!(wire10 * wire70[(4'h8):(1'h1)]))) ?
              (^wire75) : $unsigned((wire8 ^~ $signed((reg81 ?
                  wire76 : (8'h9d))))));
        end
      else
        begin
          reg79 <= (wire74[(5'h10):(4'hb)] ? wire67[(1'h0):(1'h0)] : (8'ha5));
          reg80 <= (wire72[(3'h6):(3'h6)] < $unsigned(((wire74[(4'h9):(3'h7)] ?
              (wire10 ?
                  wire73 : (8'ha2)) : wire75) ^ (wire76[(1'h1):(1'h1)] <<< $unsigned(wire76)))));
        end
      reg83 <= $unsigned(wire9);
      reg84 <= wire74;
    end
  assign wire85 = $unsigned((($signed($signed((8'h9d))) ?
                          $signed(wire70) : (&(reg82 < wire73))) ?
                      ((reg80 ?
                          ((7'h42) > wire71) : (7'h43)) != $signed(reg79)) : $unsigned($signed((^~wire76)))));
  assign wire86 = (~^$unsigned((((wire75 | reg84) << {wire9,
                      wire71}) + $unsigned((wire74 ? wire8 : reg83)))));
  assign wire87 = wire76;
  assign wire88 = {reg84};
  assign wire89 = ($signed((&$signed(wire86[(2'h2):(1'h1)]))) >>> ((((wire67 >= wire67) < $unsigned(wire8)) ?
                      {(~|wire69), $unsigned((8'ha2))} : (((8'ha5) ?
                              (8'hbd) : wire71) ?
                          (~|wire74) : (wire87 ?
                              wire8 : wire9))) == ({(wire75 == wire71)} ?
                      (8'h9d) : reg78[(2'h3):(2'h2)])));
  assign wire90 = wire9;
  assign wire91 = $unsigned({wire70[(4'ha):(3'h6)]});
  always
    @(posedge clk) begin
      reg92 <= wire86;
      reg93 <= reg92[(4'ha):(3'h7)];
      reg94 <= {wire90};
      if ($unsigned(wire87))
        begin
          reg95 <= ((~reg82[(1'h0):(1'h0)]) * $signed(wire8[(5'h14):(5'h14)]));
        end
      else
        begin
          if (reg81)
            begin
              reg95 <= (wire90 ?
                  ((reg83 << $signed({wire86, (8'had)})) ?
                      $unsigned((8'hb0)) : reg82) : ($unsigned($signed((reg80 ?
                      wire87 : reg77))) ~^ ({wire73,
                          (reg81 ? (8'ha4) : reg78)} ?
                      $unsigned(wire87[(3'h5):(3'h4)]) : $signed(wire73))));
            end
          else
            begin
              reg95 <= $unsigned($signed(wire87));
              reg96 <= (~&((-(wire75[(4'hd):(4'hd)] + $unsigned(reg77))) ?
                  ((|{wire69}) ?
                      wire8[(4'h8):(1'h1)] : ((~wire70) ?
                          (~|reg77) : reg79)) : $unsigned(wire8)));
              reg97 <= reg82[(3'h6):(1'h1)];
              reg98 <= (reg97[(3'h4):(3'h4)] < (|reg82[(1'h0):(1'h0)]));
            end
          reg99 <= wire76;
          reg100 <= wire70;
        end
      if ({(&($signed($unsigned(reg79)) ?
              wire10[(4'hf):(4'hf)] : $unsigned((reg95 <<< wire88))))})
        begin
          reg101 <= $signed((reg80 | $signed($signed({reg93}))));
          reg102 <= (^(wire89 ^~ (~|$signed(wire88[(4'h9):(3'h6)]))));
          reg103 <= ($signed(wire72[(4'ha):(1'h0)]) | (reg83[(3'h6):(2'h2)] ?
              {(((8'hba) != wire9) ?
                      (reg77 ?
                          (8'hbd) : reg99) : $signed(wire76))} : {$unsigned((~wire86))}));
          reg104 <= (8'ha1);
        end
      else
        begin
          reg101 <= $signed({$unsigned($unsigned((+reg83))),
              $unsigned($unsigned((wire8 ? (7'h43) : wire88)))});
          reg102 <= {{(~^wire74[(5'h10):(4'ha)])}};
        end
    end
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h22d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  assign y = {wire66,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire19,
                 wire18,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
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
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = $signed((({(~&(8'hb6)), $unsigned(wire14)} > wire15) ?
                      (8'hb3) : wire17[(3'h5):(3'h5)]));
  assign wire19 = (^wire15);
  always
    @(posedge clk) begin
      if ((-$signed(($signed({wire14, wire15}) & ((!wire14) <= (^~(8'ha0)))))))
        begin
          if (wire13)
            begin
              reg20 <= (wire15[(3'h4):(1'h1)] + $unsigned(((wire16 >= wire15) * ((wire13 + (8'h9e)) ?
                  (~|wire14) : $unsigned(wire13)))));
              reg21 <= $signed($signed($unsigned({wire17, wire13})));
              reg22 <= {wire17[(3'h5):(2'h2)], (7'h42)};
              reg23 <= (~^$unsigned(wire18[(1'h1):(1'h1)]));
              reg24 <= wire19;
            end
          else
            begin
              reg20 <= {$signed((($unsigned(wire13) ?
                          $unsigned(wire15) : wire17[(2'h3):(2'h2)]) ?
                      wire17[(1'h0):(1'h0)] : ((wire15 ? wire17 : wire13) ?
                          wire15[(3'h5):(1'h1)] : wire17[(2'h3):(2'h3)])))};
              reg21 <= (~&$signed(wire13[(2'h2):(1'h0)]));
              reg22 <= (-wire15);
              reg23 <= reg22[(3'h5):(1'h0)];
            end
          if (wire17)
            begin
              reg25 <= (^(wire16[(2'h3):(2'h2)] != $unsigned(wire14)));
              reg26 <= (($signed($unsigned((reg20 ?
                  (8'h9f) : reg25))) <= reg20) ~^ $unsigned((+wire13)));
            end
          else
            begin
              reg25 <= $unsigned({(((wire18 <<< (8'hb1)) > $signed(wire19)) | ((^reg26) ?
                      wire15 : (wire17 ^ wire19)))});
              reg26 <= reg24;
              reg27 <= $signed(reg21);
              reg28 <= reg26;
            end
          if ($unsigned(reg22[(2'h2):(1'h0)]))
            begin
              reg29 <= (~|{{($signed(wire15) <<< $unsigned(reg22)),
                      $signed({wire17})},
                  (~^wire15[(4'h9):(4'h9)])});
              reg30 <= reg25;
              reg31 <= ((^~$unsigned($signed(reg26))) ?
                  {(-(~&(^~(8'hbb))))} : $unsigned((8'hb5)));
            end
          else
            begin
              reg29 <= {reg23[(4'hd):(3'h7)]};
            end
          reg32 <= (&reg27[(3'h6):(2'h2)]);
          if ((reg30 < $signed($unsigned(({(8'hae), wire14} >= (wire14 ?
              reg31 : reg25))))))
            begin
              reg33 <= ($signed(reg28[(2'h2):(1'h1)]) - ((($unsigned((8'hac)) ?
                      ((8'ha1) ? wire19 : (8'hb7)) : {wire18, reg27}) ?
                  ($signed(wire18) ?
                      (~|reg23) : (reg30 - reg27)) : (+reg30)) << reg31[(3'h6):(1'h1)]));
              reg34 <= $signed((reg23 <<< ((reg28[(1'h0):(1'h0)] >= (reg21 * wire16)) ?
                  ($unsigned((8'ha9)) * (reg27 & reg20)) : ({wire15} ?
                      wire15[(3'h5):(1'h0)] : $unsigned(reg20)))));
              reg35 <= reg23;
            end
          else
            begin
              reg33 <= ((reg24[(1'h0):(1'h0)] ?
                  $unsigned({(8'hbd)}) : $signed((|reg31[(3'h5):(3'h4)]))) - $signed(wire14[(4'hc):(3'h5)]));
              reg34 <= wire14;
            end
        end
      else
        begin
          reg20 <= $unsigned(({(^(reg20 ? reg21 : reg35)),
              ((^reg23) >>> (8'hb6))} >> reg23[(4'hd):(1'h0)]));
          reg21 <= ({wire14,
              (!({wire16} ? (reg31 ? reg20 : reg35) : (^~(8'hba))))} == reg31);
          reg22 <= $unsigned($signed((&{(reg31 ? reg20 : reg20)})));
        end
      reg36 <= {wire18[(1'h0):(1'h0)]};
      reg37 <= (!($signed(wire18[(4'h9):(4'h9)]) ?
          $signed(reg29) : wire13[(1'h0):(1'h0)]));
      reg38 <= $signed($signed($signed(wire15[(4'hb):(2'h2)])));
      reg39 <= (reg32[(3'h7):(3'h6)] ?
          (reg24 <= (reg36 ?
              {$unsigned((8'hbd)), (reg28 == reg38)} : ($signed(reg24) ?
                  $unsigned(reg26) : (8'hb5)))) : (-(~{reg26, reg37})));
    end
  assign wire40 = {wire15, {(8'hb6), wire18}};
  assign wire41 = $unsigned(($unsigned(($unsigned(reg36) ?
                          reg27[(2'h2):(1'h0)] : {wire13, wire17})) ?
                      ($unsigned((~reg38)) ?
                          (-{reg37}) : (-reg25)) : (|(reg23[(3'h6):(3'h5)] ?
                          $signed(reg24) : reg23))));
  assign wire42 = wire19;
  assign wire43 = $unsigned({reg30,
                      (wire14[(3'h4):(1'h0)] ?
                          reg20 : $signed({(8'hba), (8'ha2)}))});
  assign wire44 = ($unsigned((-($signed(wire13) - reg21[(2'h2):(2'h2)]))) ?
                      (~|(reg38[(4'hd):(4'ha)] + (^~$signed((8'hbd))))) : (~|reg34));
  assign wire45 = ($signed(wire43[(4'hb):(1'h1)]) ?
                      {reg20[(1'h1):(1'h0)],
                          $signed({(-reg35), reg20[(3'h7):(3'h4)]})} : (reg33 ?
                          wire13 : (($unsigned(reg22) ?
                              wire14 : $unsigned(reg20)) && $signed(reg35[(3'h4):(1'h1)]))));
  always
    @(posedge clk) begin
      reg46 <= (reg23 ? (~&reg33) : $unsigned((~|$signed((reg33 ^ reg32)))));
      reg47 <= ((reg23 ?
          ((~|$unsigned(reg27)) && $signed(wire18)) : {$unsigned($unsigned(reg20))}) | (8'ha1));
      if ($signed($unsigned(($signed((^wire14)) ?
          $signed((~^wire40)) : reg32[(4'ha):(4'h9)]))))
        begin
          reg48 <= {((|$unsigned((wire45 != reg24))) ?
                  (|$unsigned((wire44 ~^ reg21))) : ($unsigned((|reg36)) ?
                      reg31[(3'h5):(1'h1)] : (8'hb2)))};
          reg49 <= $unsigned(reg37[(3'h7):(3'h7)]);
        end
      else
        begin
          if (($signed(reg35[(3'h4):(3'h4)]) ?
              $unsigned($signed(wire13[(3'h4):(1'h1)])) : ((((+reg33) ?
                          $signed(reg35) : reg47[(2'h2):(1'h0)]) ?
                      reg36[(4'hd):(4'hd)] : (^~$unsigned((8'h9f)))) ?
                  $signed((reg22 != reg30[(2'h2):(1'h0)])) : $signed($signed((reg25 ?
                      (8'hb2) : reg31))))))
            begin
              reg48 <= (&reg29);
              reg49 <= $unsigned($unsigned(reg47[(3'h4):(1'h1)]));
              reg50 <= $signed({(((|reg49) ^~ (-reg21)) ?
                      (~^reg36[(4'hc):(1'h0)]) : $signed((-wire19)))});
              reg51 <= (8'h9e);
              reg52 <= reg32[(3'h5):(3'h5)];
            end
          else
            begin
              reg48 <= ({{((^reg35) ?
                          (reg20 ? wire42 : reg35) : (reg23 != (8'haa))),
                      ({reg36, wire14} ? (^~reg39) : reg24[(3'h5):(2'h2)])},
                  ((wire18 & $signed((8'hab))) ?
                      wire14[(2'h2):(2'h2)] : {$signed(wire44)})} ^~ reg36);
              reg49 <= (8'ha3);
              reg50 <= reg26[(2'h2):(1'h0)];
              reg51 <= reg48;
            end
          if (wire40)
            begin
              reg53 <= (-(($unsigned((reg50 ?
                      reg26 : (8'h9e))) != {reg33[(3'h5):(2'h2)]}) ?
                  (~^($unsigned(reg28) ?
                      (reg38 ?
                          reg22 : reg50) : wire43[(3'h6):(3'h6)])) : reg30[(4'hd):(4'h9)]));
            end
          else
            begin
              reg53 <= (8'hac);
            end
          reg54 <= ($unsigned($unsigned($unsigned($unsigned(reg25)))) ?
              reg29[(4'hf):(4'h9)] : (!($signed($signed((7'h40))) ?
                  wire45 : (-(wire17 ? reg39 : reg46)))));
        end
      if ((~&$unsigned($unsigned($signed($unsigned(reg26))))))
        begin
          reg55 <= $signed($unsigned((({wire45, (8'hb6)} ?
              (wire41 ?
                  reg52 : reg50) : (|reg54)) ^ ($unsigned((7'h42)) == reg33[(4'h9):(2'h3)]))));
          if ((-(8'h9d)))
            begin
              reg56 <= reg48;
              reg57 <= $signed((((~^{reg50, reg22}) ?
                      reg51[(4'h8):(3'h7)] : ($unsigned((8'ha9)) & (wire41 ?
                          wire44 : wire13))) ?
                  {$unsigned($unsigned((8'hb5)))} : (reg35[(2'h2):(1'h0)] >>> wire13[(3'h7):(1'h1)])));
              reg58 <= reg34;
              reg59 <= (((~&$signed((reg47 ? (8'ha9) : reg24))) ?
                  reg21 : reg27[(2'h3):(2'h2)]) <= ((^reg53[(1'h0):(1'h0)]) > $signed((|$unsigned(wire42)))));
            end
          else
            begin
              reg56 <= $signed(reg51);
            end
          reg60 <= $signed(((&((&reg27) ^~ (|reg28))) ?
              {{$unsigned(reg50), (~&wire45)},
                  reg36} : (^~$unsigned(wire14[(3'h4):(2'h2)]))));
          reg61 <= reg52;
          if (reg38)
            begin
              reg62 <= $unsigned($unsigned({reg46[(5'h14):(4'h8)]}));
              reg63 <= $signed((8'hb7));
              reg64 <= reg22;
              reg65 <= ($signed(reg35[(3'h4):(1'h0)]) ?
                  ((reg38 ?
                      $unsigned((reg23 << wire41)) : {(reg53 ^ reg37),
                          {wire45,
                              reg63}}) & $unsigned(($signed(wire44) ^~ (reg34 >>> wire42)))) : reg35);
            end
          else
            begin
              reg62 <= (~reg37[(3'h7):(1'h0)]);
              reg63 <= (reg64[(1'h0):(1'h0)] >>> (^(~&$signed(((7'h41) ?
                  wire43 : reg63)))));
            end
        end
      else
        begin
          reg55 <= reg51[(4'ha):(2'h2)];
          reg56 <= (($unsigned(($unsigned(reg32) ?
                  reg21[(1'h1):(1'h1)] : ((8'hab) && reg38))) << wire16[(1'h0):(1'h0)]) ?
              ($signed(((reg49 != (8'ha4)) | {reg63, (8'hbe)})) ?
                  $unsigned(((reg29 ?
                      wire42 : reg39) >> reg53)) : (($unsigned(reg31) != (!reg56)) <<< (8'hb7))) : $signed(((reg22 ?
                  (wire16 >>> (8'ha2)) : $unsigned(reg64)) != {(reg35 ?
                      reg54 : reg32),
                  reg25[(4'h8):(4'h8)]})));
          reg57 <= {(reg29 - (reg54[(4'hd):(3'h4)] ?
                  $unsigned(reg23) : $signed((~&reg39)))),
              (+{reg30[(5'h14):(2'h3)]})};
          if (($signed(reg52) ?
              reg22[(1'h0):(1'h0)] : (reg21 ?
                  $signed(reg29) : (reg21 - ((reg33 && wire45) <= reg26)))))
            begin
              reg58 <= reg31[(5'h12):(4'ha)];
              reg59 <= ((reg25 ?
                      wire45[(4'h9):(1'h1)] : ($unsigned($unsigned(reg65)) ?
                          reg36 : $unsigned(wire44))) ?
                  reg28[(2'h2):(1'h1)] : $signed($signed($signed((reg62 ?
                      reg24 : wire15)))));
            end
          else
            begin
              reg58 <= wire40;
            end
        end
    end
  assign wire66 = (reg46[(5'h12):(4'he)] <<< reg58[(1'h1):(1'h1)]);
endmodule

module module217
#(parameter param233 = (~|((|({(8'had)} && ((8'hab) && (8'had)))) ? {(+((8'ha4) ? (8'ha1) : (8'hbb))), ((8'hb0) ? {(8'ha5), (8'ha5)} : {(8'ha5)})} : (~^(~|(!(7'h42)))))), 
parameter param234 = ((param233 ? (param233 ^~ (param233 + (|param233))) : (|param233)) != ({{param233}} ? (~&((param233 << (8'hb9)) - (param233 ? param233 : param233))) : ((+param233) ? {(param233 ? param233 : param233), {param233, param233}} : {param233}))))
(y, clk, wire222, wire221, wire220, wire219, wire218);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire222;
  input wire [(2'h3):(1'h0)] wire221;
  input wire [(3'h4):(1'h0)] wire220;
  input wire signed [(3'h4):(1'h0)] wire219;
  input wire signed [(3'h4):(1'h0)] wire218;
  wire signed [(4'hb):(1'h0)] wire227;
  wire [(3'h7):(1'h0)] wire226;
  wire signed [(3'h5):(1'h0)] wire225;
  wire [(5'h14):(1'h0)] wire224;
  wire signed [(5'h13):(1'h0)] wire223;
  reg signed [(5'h12):(1'h0)] reg232 = (1'h0);
  reg [(4'h9):(1'h0)] reg231 = (1'h0);
  reg [(3'h5):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg229 = (1'h0);
  reg [(5'h10):(1'h0)] reg228 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 (1'h0)};
  assign wire223 = (8'hbf);
  assign wire224 = $unsigned($unsigned((^(!wire222))));
  assign wire225 = ((!$unsigned($unsigned((wire221 ? wire218 : wire222)))) ?
                       ($signed($signed((wire221 ^~ wire223))) ?
                           wire222[(2'h2):(1'h1)] : ({wire219[(2'h2):(2'h2)]} ?
                               ($signed(wire223) ?
                                   wire223[(3'h5):(2'h2)] : wire224) : ((wire223 ?
                                       wire223 : (8'hb9)) ?
                                   (wire222 ?
                                       wire224 : wire219) : $signed(wire219)))) : $signed(($unsigned(((8'had) && (8'hac))) || $unsigned(wire218))));
  assign wire226 = (~|wire219);
  assign wire227 = {wire225[(3'h5):(1'h0)]};
  always
    @(posedge clk) begin
      reg228 <= $unsigned(wire225);
      reg229 <= (+wire224[(5'h11):(4'hf)]);
      reg230 <= $signed($unsigned(wire223[(5'h12):(4'h9)]));
      reg231 <= (8'ha3);
      reg232 <= $signed({reg230, {wire226[(3'h6):(3'h5)]}});
    end
endmodule

module module163  (y, clk, wire167, wire166, wire165, wire164);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire167;
  input wire [(3'h4):(1'h0)] wire166;
  input wire [(5'h11):(1'h0)] wire165;
  input wire signed [(3'h4):(1'h0)] wire164;
  wire [(4'hd):(1'h0)] wire214;
  wire [(5'h10):(1'h0)] wire213;
  wire signed [(5'h13):(1'h0)] wire212;
  wire signed [(4'hd):(1'h0)] wire211;
  wire [(4'h8):(1'h0)] wire210;
  wire [(5'h10):(1'h0)] wire201;
  wire signed [(4'h9):(1'h0)] wire195;
  wire [(5'h13):(1'h0)] wire172;
  reg [(5'h10):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(4'he):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg205 = (1'h0);
  reg signed [(4'he):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg203 = (1'h0);
  reg [(4'h9):(1'h0)] reg202 = (1'h0);
  reg [(4'hb):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg199 = (1'h0);
  reg signed [(4'he):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg197 = (1'h0);
  reg signed [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg191 = (1'h0);
  reg [(3'h7):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg178 = (1'h0);
  reg [(4'ha):(1'h0)] reg177 = (1'h0);
  reg [(3'h7):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg169 = (1'h0);
  reg [(3'h7):(1'h0)] reg168 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire201,
                 wire195,
                 wire172,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg194,
                 reg193,
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
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg168 <= (((|(^$unsigned(wire164))) >= wire165[(1'h0):(1'h0)]) ~^ (+($unsigned((wire165 * wire166)) << wire165)));
      reg169 <= (7'h40);
      reg170 <= (wire165[(3'h6):(3'h4)] & reg168[(3'h5):(3'h4)]);
      reg171 <= $unsigned((~&$unsigned(($signed(reg169) ?
          (reg168 & reg170) : (wire167 ? wire166 : reg169)))));
    end
  assign wire172 = ((($signed({reg171}) < reg170) - wire164) ?
                       $unsigned(wire166[(1'h1):(1'h0)]) : $unsigned(($signed((|wire164)) ?
                           wire164 : $unsigned({reg170}))));
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(($signed((8'haf)) <= (wire167 ?
              (8'hbe) : (8'hb6))))) ?
          {(((~&wire165) ? wire172[(4'h9):(4'h9)] : (~reg171)) ?
                  $unsigned({(8'hac)}) : $signed((wire167 != reg169)))} : ($signed((^reg169[(2'h2):(1'h1)])) ?
              reg169 : $unsigned($signed((^wire164))))))
        begin
          if (wire166[(2'h3):(1'h0)])
            begin
              reg173 <= $signed((7'h41));
              reg174 <= $unsigned((+wire166[(1'h1):(1'h1)]));
              reg175 <= $signed($unsigned($signed((!(wire172 << wire166)))));
              reg176 <= {$signed((reg170 && ((reg168 ?
                      wire164 : wire164) < (~^wire165))))};
            end
          else
            begin
              reg173 <= reg174[(3'h5):(2'h3)];
            end
          reg177 <= (~^wire164[(2'h3):(1'h0)]);
          reg178 <= {(reg176[(3'h4):(3'h4)] ?
                  reg169[(3'h7):(1'h0)] : (wire172[(5'h11):(4'hc)] ?
                      $unsigned($unsigned(reg175)) : $signed((wire166 ^~ wire165)))),
              (reg171 & wire165)};
          reg179 <= (|reg174);
        end
      else
        begin
          if (wire167[(4'h9):(3'h4)])
            begin
              reg173 <= (reg173 ?
                  wire166 : $unsigned((reg168[(1'h1):(1'h1)] & $unsigned(((8'hbc) ?
                      wire164 : reg175)))));
              reg174 <= (-(~reg169));
              reg175 <= (7'h43);
              reg176 <= reg174[(2'h3):(1'h0)];
            end
          else
            begin
              reg173 <= $signed((8'hbf));
              reg174 <= ((^$unsigned(reg179)) ? reg176 : reg179);
              reg175 <= reg179[(4'h8):(3'h7)];
              reg176 <= ((|reg179) <= reg168);
              reg177 <= {reg171[(2'h3):(1'h0)],
                  $signed((wire167 ?
                      reg175[(1'h0):(1'h0)] : ($unsigned((8'ha0)) ?
                          $unsigned((8'hb6)) : (wire164 <<< wire166))))};
            end
          if ($signed((7'h41)))
            begin
              reg178 <= (wire165[(2'h3):(1'h0)] ?
                  (reg176[(2'h2):(2'h2)] != reg177[(2'h2):(1'h1)]) : $signed(((+reg168) - $signed((reg169 + (8'hb4))))));
            end
          else
            begin
              reg178 <= (~&(+(wire172 == (&$unsigned((8'ha7))))));
              reg179 <= reg177;
              reg180 <= (wire172 - ($unsigned(reg179[(3'h6):(2'h3)]) >> reg178));
            end
          if ($signed($signed((&(wire172 ?
              $signed(wire165) : $signed(reg178))))))
            begin
              reg181 <= $signed({((reg178[(1'h1):(1'h0)] ^ (wire165 ?
                      (8'ha4) : wire166)) >>> {$unsigned(wire166), (&(8'ha5))}),
                  $signed($unsigned(((7'h44) ? reg173 : reg176)))});
            end
          else
            begin
              reg181 <= wire172;
              reg182 <= reg177;
              reg183 <= $unsigned(((8'h9e) >> wire172[(3'h6):(3'h6)]));
              reg184 <= $signed((-reg178));
            end
          reg185 <= reg175;
        end
      if ($signed($signed($unsigned({(^reg180), $unsigned(reg174)}))))
        begin
          reg186 <= $unsigned(reg175[(2'h2):(2'h2)]);
          reg187 <= ($unsigned($signed(reg173[(2'h2):(1'h1)])) ?
              (reg178 == reg169) : ($unsigned((^reg184)) ?
                  reg174[(4'h8):(1'h1)] : reg184));
        end
      else
        begin
          if ($unsigned({(($unsigned((7'h42)) ?
                      (^reg186) : (reg176 | (8'hb7))) ?
                  ((~reg187) << wire165[(4'hb):(4'h8)]) : (8'ha8)),
              (+$unsigned(reg184[(4'hb):(1'h0)]))}))
            begin
              reg186 <= reg175[(1'h1):(1'h0)];
              reg187 <= $unsigned((~^(^reg185)));
              reg188 <= reg176[(3'h5):(2'h2)];
              reg189 <= (reg174[(3'h7):(3'h6)] ?
                  wire165[(4'ha):(3'h5)] : (&($signed((^~reg168)) ?
                      wire165[(4'hf):(4'h8)] : $unsigned($signed(reg187)))));
            end
          else
            begin
              reg186 <= (8'hb7);
              reg187 <= $signed($unsigned(reg177));
            end
          reg190 <= reg185[(4'hb):(4'h9)];
          if ((!(&((wire167[(4'ha):(3'h6)] ?
              $signed(reg189) : (8'hb2)) * reg168[(1'h0):(1'h0)]))))
            begin
              reg191 <= {reg169, reg183};
            end
          else
            begin
              reg191 <= reg177;
              reg192 <= reg179[(3'h6):(3'h5)];
            end
          reg193 <= $signed((~^reg190));
          reg194 <= $signed($unsigned((~(^~$unsigned(reg175)))));
        end
    end
  assign wire195 = {($unsigned($signed(((8'hba) >= reg183))) ?
                           reg174 : ((~|(~|reg181)) ?
                               ($signed(reg174) >> reg189[(4'ha):(3'h4)]) : (reg177[(1'h1):(1'h0)] >> reg186[(3'h5):(3'h4)]))),
                       ((~(&(wire166 << reg180))) & $unsigned((8'h9f)))};
  always
    @(posedge clk) begin
      reg196 <= $signed((reg173[(2'h3):(2'h2)] * $unsigned(($signed(reg188) << ((8'hb3) ?
          reg193 : (8'haa))))));
      reg197 <= (~((+$signed(((8'hac) ?
          (8'had) : (8'ha3)))) >= (reg179 >= $signed((reg184 + (8'hb2))))));
      reg198 <= $signed((^reg197));
      reg199 <= reg171;
      reg200 <= ({$signed($signed($signed((8'ha0))))} ?
          ($unsigned((^(reg173 ? reg188 : wire166))) | (!{(reg179 - reg173),
              (reg171 ? wire167 : reg188)})) : (&$unsigned((|(reg177 ?
              (8'ha4) : reg192)))));
    end
  assign wire201 = ((((reg177 ?
                       (~reg185) : $signed(reg170)) != ($unsigned((8'ha2)) && (reg193 ?
                       reg183 : (7'h44)))) == reg183) << reg168[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire195[(1'h1):(1'h1)])
        begin
          reg202 <= $signed((|(wire195 ^~ wire195)));
          reg203 <= (reg190[(3'h4):(1'h1)] > (+{$unsigned($unsigned(wire165))}));
        end
      else
        begin
          if (wire167)
            begin
              reg202 <= reg174[(2'h2):(1'h0)];
            end
          else
            begin
              reg202 <= ($signed(reg170[(3'h4):(2'h2)]) > $unsigned($signed($unsigned(reg189[(5'h13):(4'hf)]))));
              reg203 <= ({reg192} ?
                  (!$signed(({reg170,
                      reg192} + $unsigned((8'h9e))))) : ((^(+(-reg194))) ?
                      wire172[(3'h6):(3'h4)] : $signed($unsigned($signed(reg181)))));
              reg204 <= $signed($unsigned(reg191[(2'h2):(1'h1)]));
              reg205 <= reg188[(1'h1):(1'h0)];
            end
          reg206 <= (wire165 ?
              {$signed(((+reg184) == wire201[(4'hf):(4'h8)])),
                  $signed((reg175 - (reg202 != reg188)))} : ((^($unsigned(reg188) ?
                  {(8'ha9)} : reg192)) >> (reg173[(4'ha):(3'h5)] >>> {wire172[(4'h8):(3'h5)]})));
          reg207 <= reg177;
          reg208 <= $signed(((^$unsigned((wire166 ?
              reg193 : reg182))) ^ ({{reg189}} ?
              $signed((reg191 >= reg190)) : $unsigned(reg173[(3'h7):(3'h6)]))));
          reg209 <= reg191[(1'h1):(1'h0)];
        end
    end
  assign wire210 = {($unsigned(reg206) ?
                           (|$signed($unsigned((8'hbc)))) : $signed(wire201))};
  assign wire211 = wire210[(3'h5):(3'h5)];
  assign wire212 = {(8'hb3),
                       (+({{reg199}} && ($unsigned(reg170) <<< reg190[(3'h5):(3'h5)])))};
  assign wire213 = $unsigned((-reg188));
  assign wire214 = (!$signed(reg204[(4'he):(1'h1)]));
endmodule

module module117
#(parameter param127 = (-(((((8'ha7) ? (8'ha2) : (8'ha8)) <<< (^~(8'had))) ? (8'ha4) : (((7'h41) - (8'hb1)) ~^ (^(8'ha6)))) >> ((~^{(7'h41)}) >>> ((|(8'hb1)) | ((8'hae) ? (8'hb9) : (8'ha5)))))), 
parameter param128 = param127)
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire121;
  input wire signed [(4'h8):(1'h0)] wire120;
  input wire [(5'h12):(1'h0)] wire119;
  input wire signed [(5'h11):(1'h0)] wire118;
  wire [(4'h8):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  assign y = {wire126, wire125, wire124, wire123, wire122, (1'h0)};
  assign wire122 = {((wire121[(1'h0):(1'h0)] >>> $signed((wire118 ?
                           wire120 : wire120))) + $signed(wire118[(4'hf):(1'h1)]))};
  assign wire123 = ($unsigned($signed((^~wire119))) >> $unsigned((wire119 >> $signed(wire121))));
  assign wire124 = (&(!(wire118[(4'h8):(4'h8)] <= ({wire119} ?
                       (wire121 + wire121) : wire123))));
  assign wire125 = wire122[(1'h1):(1'h1)];
  assign wire126 = wire124[(2'h3):(2'h3)];
endmodule
