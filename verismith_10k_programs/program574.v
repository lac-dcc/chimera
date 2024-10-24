module top
#(parameter param231 = ((^((((8'h9d) ? (8'had) : (8'hb1)) ? (8'ha5) : (~|(8'hbd))) ? (~{(8'haf), (8'hab)}) : (+((8'hbe) << (8'hb7))))) ? ((~&(^((8'hb5) ? (8'hb8) : (8'ha0)))) ^~ ({((8'ha0) ? (8'hb5) : (8'h9e))} || (8'hb1))) : (~|(({(8'ha6), (8'hbc)} ? (~^(8'hb7)) : ((8'ha6) ? (8'hbc) : (8'hbc))) ? (~(8'hab)) : (((8'hb0) ? (8'ha4) : (8'ha9)) ? ((8'h9e) ? (8'haa) : (8'h9f)) : (~&(8'hb3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire218;
  wire [(4'ha):(1'h0)] wire217;
  wire signed [(5'h11):(1'h0)] wire216;
  wire signed [(3'h6):(1'h0)] wire211;
  wire [(2'h2):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire [(5'h12):(1'h0)] wire208;
  wire [(4'hb):(1'h0)] wire205;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire213;
  wire [(5'h11):(1'h0)] wire214;
  wire signed [(3'h6):(1'h0)] wire220;
  wire [(2'h2):(1'h0)] wire228;
  wire signed [(3'h5):(1'h0)] wire229;
  reg signed [(4'h9):(1'h0)] reg207 = (1'h0);
  reg [(4'hc):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg222 = (1'h0);
  reg [(2'h3):(1'h0)] reg223 = (1'h0);
  reg [(5'h13):(1'h0)] reg224 = (1'h0);
  reg [(4'h9):(1'h0)] reg225 = (1'h0);
  reg [(5'h10):(1'h0)] reg226 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg227 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire205,
                 wire7,
                 wire6,
                 wire5,
                 wire213,
                 wire214,
                 wire220,
                 wire228,
                 wire229,
                 reg207,
                 reg221,
                 reg222,
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (8'ha2);
  assign wire7 = wire3[(4'hb):(4'h9)];
  module8 #() modinst206 (wire205, clk, wire4, wire2, wire1, wire7);
  always
    @(posedge clk) begin
      reg207 <= $unsigned((^wire3));
    end
  assign wire208 = (((^~(+(wire2 != (8'h9f)))) ?
                       wire0 : wire205[(4'ha):(2'h3)]) >>> (8'hbc));
  assign wire209 = (8'hab);
  assign wire210 = (&$unsigned(wire7[(5'h13):(5'h13)]));
  module91 #() modinst212 (wire211, clk, wire209, wire1, wire6, wire4, wire208);
  assign wire213 = (({wire3} ?
                       reg207[(3'h6):(3'h4)] : $signed(((wire1 ?
                               (8'hbf) : wire6) ?
                           wire210 : $signed(wire205)))) > $unsigned({{{wire3},
                           $signed(wire6)}}));
  module91 #() modinst215 (.y(wire214), .wire95(wire4), .wire96(wire208), .clk(clk), .wire92(wire6), .wire93(wire7), .wire94(wire0));
  assign wire216 = $signed((~&((wire7[(1'h0):(1'h0)] && (wire208 ?
                           (8'hb9) : wire1)) ?
                       (wire5[(2'h2):(1'h1)] && (wire205 ^~ wire6)) : $unsigned((wire1 >= (7'h41))))));
  assign wire217 = wire1;
  module91 #() modinst219 (wire218, clk, wire216, wire1, wire209, wire211, wire208);
  assign wire220 = (8'hac);
  always
    @(posedge clk) begin
      reg221 <= wire1;
    end
  always
    @(posedge clk) begin
      reg222 <= wire213;
      reg223 <= wire208;
      reg224 <= (($unsigned({(reg221 ? reg207 : wire210), wire4}) ?
          wire213 : ($unsigned(wire216) ^~ ($unsigned(wire4) ?
              (reg221 < wire214) : (~^wire214)))) >> wire213[(1'h1):(1'h0)]);
      reg225 <= wire2;
      reg226 <= wire4[(4'h9):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg227 <= {$unsigned(wire7[(3'h5):(1'h0)]),
          ((^$unsigned($signed(wire214))) ^~ $unsigned(($signed(wire216) | (wire205 ?
              (8'hb3) : wire216))))};
    end
  assign wire228 = $unsigned(wire205);
  module162 #() modinst230 (.wire165(wire3), .y(wire229), .clk(clk), .wire163(wire1), .wire164(wire216), .wire166(reg225));
endmodule

module module8
#(parameter param203 = ((~^{(8'hae)}) <= (((((8'haf) ? (8'hb0) : (8'had)) ? (~&(8'hab)) : ((8'hbe) | (8'ha8))) ^ (|((8'ha3) == (8'hac)))) ? ((~&(~|(8'had))) >>> (|((8'hae) ? (8'hb9) : (8'hba)))) : (+(((8'hbe) - (8'ha3)) >> (8'hb9))))), 
parameter param204 = param203)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(4'ha):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire150;
  wire signed [(4'hd):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire157;
  wire [(3'h6):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire159;
  wire [(4'he):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire161;
  wire [(3'h4):(1'h0)] wire201;
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  assign y = {wire41,
                 wire14,
                 wire13,
                 wire77,
                 wire79,
                 wire90,
                 wire150,
                 wire152,
                 wire154,
                 wire155,
                 wire156,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 wire201,
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
                 reg153,
                 (1'h0)};
  assign wire13 = (|$signed($unsigned(wire12)));
  assign wire14 = ({$unsigned((wire10[(1'h0):(1'h0)] ^~ (wire13 ~^ wire12)))} <= wire10);
  module15 #() modinst42 (.wire17(wire14), .wire19(wire11), .wire20(wire9), .y(wire41), .wire16(wire13), .wire18(wire10), .clk(clk));
  module43 #() modinst78 (.wire46(wire14), .wire44(wire9), .clk(clk), .wire47(wire41), .y(wire77), .wire45(wire12));
  assign wire79 = $unsigned($unsigned(($signed((wire12 ^ wire10)) >> $unsigned($signed(wire11)))));
  always
    @(posedge clk) begin
      reg80 <= (wire12[(3'h4):(2'h2)] || $signed((!wire13[(4'h9):(3'h6)])));
      reg81 <= {wire41};
      reg82 <= $signed((wire14 ?
          {$signed(wire12[(3'h5):(1'h0)]),
              $signed({wire79})} : $unsigned((wire10 != wire41))));
      reg83 <= (^~(8'ha0));
      if (wire13)
        begin
          reg84 <= (reg82 ?
              (~((7'h44) ?
                  reg80[(3'h7):(3'h6)] : (((8'ha3) ? wire10 : wire77) ?
                      wire9[(2'h3):(2'h3)] : (wire12 >> (8'ha9))))) : wire41);
          reg85 <= (($signed($unsigned(wire9)) ?
                  (((~^reg81) ?
                      reg80 : (8'ha7)) ~^ reg80[(4'h9):(1'h1)]) : (-((^~wire79) ^ {(8'ha0)}))) ?
              $unsigned($unsigned({$unsigned(wire11),
                  (reg83 ? reg82 : reg80)})) : wire14[(1'h0):(1'h0)]);
        end
      else
        begin
          if ($signed((&{{(wire11 ? reg85 : (8'hb8)), {reg84, reg80}},
              (wire41[(3'h5):(2'h3)] & (&(8'ha6)))})))
            begin
              reg84 <= $signed($unsigned((~&{(wire41 >= reg85)})));
              reg85 <= (~|wire9[(5'h10):(1'h1)]);
              reg86 <= (+{($unsigned((~&wire11)) - (wire41 >>> ((8'hbe) >>> wire77)))});
              reg87 <= $signed(wire13);
              reg88 <= wire77;
            end
          else
            begin
              reg84 <= {$signed((({reg87,
                      wire13} - (!(8'ha2))) <<< ($unsigned((8'ha7)) ?
                      (wire13 ? wire12 : wire77) : wire9[(4'hd):(3'h5)])))};
              reg85 <= (wire77[(3'h5):(2'h3)] >> $unsigned($signed({(reg88 ^~ wire14),
                  reg87})));
            end
          reg89 <= ($unsigned(($signed({reg88}) ?
              (~reg86[(1'h0):(1'h0)]) : (^~reg83))) > (-$signed((^~(wire77 < wire13)))));
        end
    end
  assign wire90 = ((~^(&$unsigned({reg88}))) ^ ((((+wire9) ?
                          $signed(wire13) : {wire14}) ?
                      (8'hb6) : reg84) | $signed($signed($unsigned(reg85)))));
  module91 #() modinst151 (.wire92(wire9), .wire95(wire77), .y(wire150), .wire96(wire13), .clk(clk), .wire94(wire79), .wire93(reg80));
  assign wire152 = ({((8'ha6) ^ wire14)} ?
                       {reg84[(4'ha):(2'h3)]} : wire14[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg153 <= $signed({(^~wire150),
          ($signed($signed(reg85)) << ({wire41, wire77} ?
              (reg80 ? wire90 : wire77) : ((8'h9d) ^~ wire152)))});
    end
  assign wire154 = wire14[(2'h3):(2'h3)];
  assign wire155 = ($signed((((wire10 >>> wire154) ?
                           reg88 : $signed(wire79)) >>> (wire14 ^ (+reg80)))) ?
                       reg83 : wire90[(4'hb):(2'h2)]);
  assign wire156 = {wire79, reg88};
  assign wire157 = (({reg86, {$unsigned((7'h41)), reg87}} != reg81) ?
                       (~&$signed($unsigned(((8'hb6) << reg88)))) : (^(^~{$unsigned(wire154),
                           (reg81 ? wire77 : reg87)})));
  assign wire158 = wire9;
  assign wire159 = (($signed($signed(((8'ha8) <<< reg89))) < (~((!(8'hbc)) ^~ (-reg81)))) ?
                       $unsigned(wire9) : (wire10 - (wire154 ~^ $unsigned(wire10))));
  assign wire160 = reg81[(3'h4):(3'h4)];
  assign wire161 = (+wire11[(2'h2):(2'h2)]);
  module162 #() modinst202 (.wire166(reg80), .clk(clk), .wire163(wire154), .wire164(reg86), .y(wire201), .wire165(reg87));
endmodule

module module162
#(parameter param199 = {(&{(&(|(8'hac)))})}, 
parameter param200 = ((|(param199 - (~&param199))) + {({(param199 ? (8'h9f) : param199), ((7'h43) ? param199 : param199)} ? param199 : (8'hb7)), param199}))
(y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire166;
  input wire [(4'hb):(1'h0)] wire165;
  input wire signed [(2'h2):(1'h0)] wire164;
  input wire signed [(2'h3):(1'h0)] wire163;
  wire signed [(3'h6):(1'h0)] wire198;
  wire signed [(5'h14):(1'h0)] wire197;
  wire signed [(4'ha):(1'h0)] wire186;
  wire signed [(5'h12):(1'h0)] wire185;
  wire signed [(2'h2):(1'h0)] wire184;
  reg [(4'hc):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg194 = (1'h0);
  reg [(5'h12):(1'h0)] reg193 = (1'h0);
  reg [(3'h7):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg189 = (1'h0);
  reg [(2'h3):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg187 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg181 = (1'h0);
  reg [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg175 = (1'h0);
  reg [(5'h12):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(3'h5):(1'h0)] reg167 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire186,
                 wire185,
                 wire184,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg167 <= wire165[(3'h7):(1'h1)];
      if ($unsigned(wire165))
        begin
          reg168 <= (~^wire163[(2'h3):(2'h3)]);
          reg169 <= reg168[(2'h3):(1'h1)];
          reg170 <= {$unsigned(wire165[(4'hb):(2'h2)]),
              ((wire164 >>> {(reg167 ? reg167 : (8'ha3)),
                  (reg167 - (8'hbe))}) & $unsigned((wire166 ?
                  reg169[(3'h5):(3'h5)] : (wire164 >> wire166))))};
          reg171 <= (|reg169[(3'h7):(1'h1)]);
        end
      else
        begin
          reg168 <= (!(wire165[(3'h4):(3'h4)] ? wire165 : reg168));
          if ((~$unsigned(((&(reg168 != wire165)) == $unsigned($unsigned(wire166))))))
            begin
              reg169 <= ((&$signed($unsigned((^reg169)))) ?
                  (reg169[(3'h5):(1'h1)] ?
                      ($unsigned(reg169[(1'h1):(1'h0)]) == ((+reg169) ?
                          (wire166 * wire165) : $signed(reg169))) : reg170[(4'h9):(3'h4)]) : ($signed(reg171[(4'hc):(3'h6)]) ?
                      $unsigned({$unsigned(reg167)}) : $unsigned($unsigned((~^wire165)))));
              reg170 <= (wire164[(1'h0):(1'h0)] ?
                  {wire165[(1'h0):(1'h0)]} : (~|(~^{wire166, (~^wire163)})));
              reg171 <= ($unsigned($signed({(!wire166)})) * reg169[(4'hc):(2'h3)]);
              reg172 <= $signed(((((!wire165) ?
                          $signed(reg170) : (reg170 * (8'hac))) ?
                      {(wire165 == (7'h40))} : $signed((8'haf))) ?
                  reg170[(4'hf):(2'h2)] : (wire166[(3'h6):(3'h5)] ?
                      $unsigned(wire166) : ((wire164 >>> reg170) * $unsigned(wire163)))));
            end
          else
            begin
              reg169 <= $signed($signed((wire166[(4'h8):(3'h6)] ?
                  $signed($unsigned(wire166)) : ((wire165 ? (8'hbf) : reg168) ?
                      $unsigned(wire165) : (~&reg169)))));
              reg170 <= $signed(({((wire163 != reg168) ?
                      {wire163, reg172} : wire163)} <= (((^(8'h9e)) < {wire163,
                      (8'hb0)}) ?
                  (((8'ha5) ?
                      wire166 : (8'hba)) ^ reg171) : (wire164 ^ (8'hb6)))));
              reg171 <= {(wire166 * reg171)};
            end
          if (reg171)
            begin
              reg173 <= $signed(reg172[(3'h5):(2'h3)]);
              reg174 <= (8'ha7);
              reg175 <= (^((~reg173) ?
                  (($unsigned(reg168) ?
                      {wire164,
                          reg168} : $signed((8'ha3))) >> wire166[(2'h2):(1'h1)]) : $signed((reg174 ^ {reg174,
                      reg173}))));
              reg176 <= reg173[(2'h3):(1'h1)];
              reg177 <= (7'h40);
            end
          else
            begin
              reg173 <= (((|reg174[(3'h5):(3'h5)]) ?
                      $unsigned($unsigned((wire165 ?
                          wire165 : wire163))) : (((!wire164) >= $signed(reg172)) ?
                          (reg174 >>> reg176[(3'h6):(3'h5)]) : ({(8'ha6),
                                  reg174} ?
                              reg173 : (&reg169)))) ?
                  {reg168[(3'h4):(3'h4)]} : ((~^(reg172[(3'h5):(3'h5)] ?
                      reg174[(4'h8):(3'h5)] : reg175)) >= $signed(reg176[(2'h2):(1'h1)])));
              reg174 <= $unsigned({{reg175, (!$unsigned(wire166))}, reg174});
              reg175 <= wire164;
              reg176 <= (!reg177[(5'h12):(4'he)]);
              reg177 <= (reg169 != (reg169[(4'h9):(3'h7)] ?
                  (((reg176 ?
                      (8'ha5) : reg167) ^ reg176[(4'h9):(3'h7)]) > wire164[(2'h2):(2'h2)]) : reg169));
            end
          reg178 <= (8'hb7);
        end
      reg179 <= (^~reg171);
      if (reg169)
        begin
          reg180 <= wire164;
          reg181 <= reg176[(4'ha):(4'h8)];
          reg182 <= $unsigned({(~wire165)});
          reg183 <= ({$signed(reg174)} != reg176);
        end
      else
        begin
          reg180 <= reg168[(3'h5):(1'h1)];
          reg181 <= {$unsigned(((~^$unsigned((8'h9d))) ?
                  $unsigned($unsigned(wire164)) : ($signed((8'had)) >> reg181[(1'h1):(1'h1)]))),
              wire163};
        end
    end
  assign wire184 = $unsigned(($signed((reg173[(3'h4):(1'h0)] <= {reg179})) ?
                       ((reg167[(1'h1):(1'h0)] ?
                               (!(8'hb8)) : reg168[(3'h4):(3'h4)]) ?
                           {(reg183 ? reg176 : reg168),
                               reg179[(5'h12):(4'hf)]} : reg183) : ($unsigned(wire164[(2'h2):(1'h1)]) ^~ wire165[(4'h9):(1'h1)])));
  assign wire185 = $signed(reg180);
  assign wire186 = wire166[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg187 <= $signed(reg176);
      if (reg183)
        begin
          reg188 <= $signed(((reg169 >= (&(wire164 ? reg183 : reg183))) ?
              $signed(({reg180} - reg171[(2'h3):(1'h0)])) : (wire165[(4'h8):(1'h0)] | reg174[(3'h4):(3'h4)])));
          reg189 <= (wire184[(2'h2):(2'h2)] ?
              ($unsigned(wire165[(3'h5):(2'h2)]) && {reg167[(3'h4):(2'h2)],
                  wire164[(1'h0):(1'h0)]}) : (!(^~reg188[(2'h3):(1'h1)])));
          reg190 <= (wire164[(1'h1):(1'h1)] != (^wire184[(1'h0):(1'h0)]));
        end
      else
        begin
          if (reg172[(1'h1):(1'h1)])
            begin
              reg188 <= $signed(((~(reg182[(3'h5):(1'h0)] && (!wire184))) < reg171));
              reg189 <= ($signed(({(+wire184), (^reg182)} ?
                  ((reg177 ?
                      reg177 : reg168) >>> (-wire184)) : reg170)) ~^ (((reg177 ?
                      $signed(wire166) : wire163[(2'h3):(2'h2)]) << $signed(wire164[(1'h0):(1'h0)])) ?
                  {({reg171, wire165} ? $signed(reg171) : reg174),
                      wire164} : (($unsigned(wire184) <= (reg188 ^~ reg175)) ?
                      (~&$signed(reg174)) : reg176)));
            end
          else
            begin
              reg188 <= $signed((+(~wire185)));
              reg189 <= $unsigned($unsigned($unsigned($unsigned({reg168,
                  reg178}))));
              reg190 <= {$signed(wire166),
                  $unsigned($signed($signed($unsigned(reg174))))};
            end
          reg191 <= reg175[(3'h4):(2'h2)];
          if ({(!$unsigned($signed((~|(8'had))))),
              $signed((~|$signed(reg180[(4'he):(2'h3)])))})
            begin
              reg192 <= $unsigned(wire184[(1'h1):(1'h0)]);
              reg193 <= (~&$unsigned($unsigned(reg177)));
              reg194 <= {($unsigned($signed($unsigned(reg180))) >> $unsigned(reg192)),
                  (($unsigned({wire186,
                      (8'hbd)}) | reg189[(2'h2):(2'h2)]) && $unsigned($signed((reg191 - reg180))))};
              reg195 <= (reg169 ?
                  (+$unsigned((-$signed(wire163)))) : {reg190[(5'h12):(4'hf)],
                      $unsigned($signed((reg188 ? reg189 : reg173)))});
              reg196 <= $unsigned($signed(reg171));
            end
          else
            begin
              reg192 <= reg178;
              reg193 <= $signed((reg173[(1'h0):(1'h0)] | ((~reg178[(3'h5):(3'h5)]) ?
                  reg174 : $unsigned((reg170 & wire163)))));
              reg194 <= ((+reg191) ?
                  ($signed((7'h44)) > {reg189[(1'h1):(1'h0)]}) : (-reg194));
              reg195 <= (|wire163[(1'h0):(1'h0)]);
            end
        end
    end
  assign wire197 = $signed((({(reg171 <<< reg189),
                           $signed((8'h9c))} >> {(reg169 || wire166)}) ?
                       (~&($unsigned(reg173) < (reg192 ?
                           reg190 : reg177))) : (wire185[(5'h10):(4'he)] ?
                           (reg192[(3'h4):(2'h2)] > reg191[(1'h0):(1'h0)]) : reg191)));
  assign wire198 = $signed({((+$signed(reg187)) ?
                           $signed(reg181) : (^reg179[(1'h1):(1'h0)])),
                       reg194[(4'h8):(2'h2)]});
endmodule

module module91
#(parameter param149 = (^~(+((((8'hb9) >> (8'h9f)) ? (|(8'ha7)) : (^(8'h9d))) ? (&{(8'hb4)}) : (~(^~(8'hb4)))))))
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire96;
  input wire [(4'hf):(1'h0)] wire95;
  input wire signed [(5'h14):(1'h0)] wire94;
  input wire signed [(2'h3):(1'h0)] wire93;
  input wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire145;
  wire [(3'h5):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire142;
  wire [(4'hf):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire136,
                 wire135,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire99,
                 wire98,
                 wire97,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  assign wire97 = ((wire95 != wire92) >>> (-(-$signed({wire92}))));
  assign wire98 = wire96;
  assign wire99 = wire92[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      if ($signed((wire98 ?
          (wire98 + (~wire95[(4'he):(4'h8)])) : $signed({(&wire93),
              (wire94 ? wire97 : wire97)}))))
        begin
          reg100 <= ({wire98[(5'h10):(2'h2)]} ?
              (($signed({wire94}) ?
                      {((8'hb8) ? wire96 : wire92),
                          {wire95, wire94}} : ((wire98 ? wire93 : wire92) ?
                          (+wire94) : wire99[(4'h8):(1'h1)])) ?
                  (-wire98[(3'h7):(2'h3)]) : $signed(wire94)) : wire94);
          if (wire98[(2'h2):(1'h1)])
            begin
              reg101 <= (($signed((!wire96[(3'h5):(3'h4)])) ?
                  reg100 : wire99[(5'h14):(2'h2)]) <<< wire92);
              reg102 <= $signed($unsigned($unsigned($unsigned($unsigned(wire93)))));
              reg103 <= wire95[(4'he):(3'h4)];
              reg104 <= {wire93};
              reg105 <= reg102;
            end
          else
            begin
              reg101 <= ((($signed((wire92 ~^ reg101)) ?
                      (+{reg104, reg100}) : (wire96[(4'hd):(2'h3)] <= (wire92 ?
                          wire99 : reg101))) > ((!(reg103 ?
                      (8'ha8) : reg104)) ~^ (wire94[(2'h2):(2'h2)] & (wire95 ?
                      wire98 : wire93)))) ?
                  reg103 : (^($signed(((8'ha9) < reg102)) ?
                      $unsigned((reg103 != wire95)) : ($signed(reg102) ?
                          (&(8'hbf)) : $unsigned(reg100)))));
              reg102 <= (8'hbc);
              reg103 <= ({($signed((wire96 < reg104)) ?
                          (wire97 << reg101[(2'h2):(1'h0)]) : {wire93[(2'h3):(2'h3)],
                              reg102[(2'h3):(1'h1)]})} ?
                  $signed(((|$signed(reg103)) <= $signed($signed(reg101)))) : (~|($unsigned((wire97 ?
                      reg101 : reg101)) ^ (wire96[(4'hc):(1'h0)] ?
                      wire92[(4'hb):(4'h9)] : reg101[(2'h2):(1'h0)]))));
              reg104 <= ($unsigned((8'hab)) || ($signed((^~(~wire94))) >>> (+(+$unsigned((8'hb5))))));
            end
        end
      else
        begin
          reg100 <= ((!(~^$signed(reg100))) * ($unsigned({wire97,
              (~^reg104)}) | $signed({reg104, (^(8'h9f))})));
          reg101 <= $signed(reg100);
          reg102 <= reg105[(3'h6):(1'h0)];
          if ($unsigned((reg104 ?
              (~&({reg101} << ((8'h9d) > wire96))) : reg103)))
            begin
              reg103 <= (reg102[(2'h2):(2'h2)] < {(8'hb7),
                  ((+(-wire95)) << ($unsigned(wire96) ?
                      (reg103 <<< reg102) : (&wire93)))});
              reg104 <= $signed($signed(($unsigned((reg101 >> wire92)) ?
                  ((wire94 ? wire97 : reg105) >= wire93) : $unsigned(wire99))));
              reg105 <= ($signed((|($unsigned((8'h9c)) ?
                  $signed(reg104) : $signed((8'hb1))))) ^~ reg103[(3'h6):(1'h0)]);
              reg106 <= (reg105[(1'h1):(1'h1)] ?
                  wire94[(4'h9):(1'h1)] : (-$unsigned((!$unsigned(wire94)))));
              reg107 <= {$signed((!((!reg103) ~^ (wire99 ? reg105 : wire93))))};
            end
          else
            begin
              reg103 <= (8'ha8);
              reg104 <= {$unsigned((^($signed((8'hb0)) ?
                      reg106[(4'hc):(4'h9)] : reg106[(4'ha):(2'h2)])))};
              reg105 <= (wire97[(1'h0):(1'h0)] <= $unsigned($signed((+(wire92 >>> (8'hae))))));
            end
          if (wire92[(3'h6):(2'h3)])
            begin
              reg108 <= (+wire95);
              reg109 <= wire94;
              reg110 <= (wire92 ?
                  ({$unsigned({wire92, wire94}),
                          {$signed((8'h9f)), $signed((8'hae))}} ?
                      ((reg108[(3'h6):(1'h0)] <<< $unsigned((8'hbc))) * (&wire99[(4'hf):(4'ha)])) : ((-$unsigned((8'hbd))) ?
                          wire93[(2'h3):(2'h3)] : (~&(~^wire97)))) : wire92[(4'hb):(3'h7)]);
            end
          else
            begin
              reg108 <= {$unsigned((~$unsigned((~^reg103))))};
              reg109 <= (^(reg106 ?
                  ($unsigned((reg106 ?
                      (8'ha4) : (8'hbb))) << reg110[(1'h1):(1'h1)]) : reg107[(2'h3):(1'h1)]));
            end
        end
      reg111 <= $unsigned($signed((wire95[(4'hd):(1'h1)] ?
          $unsigned((reg103 ? reg106 : reg100)) : (^~wire98[(4'h8):(1'h0)]))));
    end
  assign wire112 = $signed(((-((~^wire93) ^~ $unsigned(reg102))) ?
                       reg109 : wire95));
  assign wire113 = reg101[(3'h6):(3'h6)];
  assign wire114 = (8'hb8);
  assign wire115 = (($signed(wire113) ? reg104 : reg111) ?
                       {(+$signed(reg106)),
                           wire96[(4'hb):(1'h0)]} : $signed(wire114[(2'h3):(2'h2)]));
  assign wire116 = reg111;
  assign wire117 = {(wire95[(2'h2):(1'h0)] << {($signed(reg107) ^~ (~|reg103))}),
                       wire99};
  assign wire118 = (~$unsigned(($signed({reg107}) ~^ wire92)));
  assign wire119 = (($signed(wire93) ?
                           ((~|(wire97 ? wire95 : (8'ha2))) ?
                               $unsigned(reg108[(1'h1):(1'h0)]) : ((wire115 & reg110) ^~ (~|wire115))) : ({(+wire99)} ?
                               reg100 : wire115[(3'h4):(2'h3)])) ?
                       wire92[(4'he):(1'h1)] : {$unsigned($unsigned((~&wire113))),
                           $unsigned(reg104[(2'h2):(1'h1)])});
  always
    @(posedge clk) begin
      if ($unsigned((((&(wire99 >= wire116)) | wire96[(2'h3):(2'h2)]) == (reg109[(1'h0):(1'h0)] - $unsigned($unsigned(reg104))))))
        begin
          reg120 <= ($unsigned($unsigned($unsigned(wire93))) ?
              ($unsigned({wire115[(3'h4):(1'h0)]}) << wire94) : wire98[(3'h7):(1'h1)]);
          reg121 <= $unsigned(reg111);
          reg122 <= $unsigned(wire114);
          reg123 <= {reg105[(2'h3):(2'h3)], reg122};
          reg124 <= ($unsigned(($unsigned({(8'haf), reg101}) ?
              reg107[(4'hd):(2'h2)] : (|reg122))) * $unsigned(reg105[(4'h8):(3'h7)]));
        end
      else
        begin
          reg120 <= wire112;
          reg121 <= reg121[(3'h6):(1'h0)];
        end
      if (((reg102 + (^~wire99[(2'h2):(2'h2)])) ?
          {(~&wire99),
              $unsigned($unsigned(wire97[(1'h1):(1'h1)]))} : {$signed((reg107 ?
                  (-(8'ha9)) : $unsigned(reg121))),
              (8'ha3)}))
        begin
          reg125 <= $signed(reg111);
          reg126 <= wire99;
          reg127 <= (^((wire116[(1'h0):(1'h0)] && (-reg110[(1'h1):(1'h1)])) ?
              $unsigned({$signed(reg101)}) : (!((^~(8'hbb)) <= reg124))));
          reg128 <= $signed((reg127[(2'h2):(1'h0)] * (wire116[(2'h2):(2'h2)] << reg100)));
        end
      else
        begin
          reg125 <= $signed(wire95);
          if ({reg122,
              (^(wire96[(5'h11):(4'h9)] ?
                  (8'hab) : $unsigned(((8'hb4) - (8'hbd)))))})
            begin
              reg126 <= $unsigned($signed($unsigned(($unsigned(reg126) <= (reg127 ?
                  wire118 : wire114)))));
            end
          else
            begin
              reg126 <= reg123[(2'h2):(1'h0)];
              reg127 <= (&(wire117 ?
                  (reg108 ?
                      (wire112 ?
                          (^~reg111) : wire95[(4'hb):(4'h8)]) : $unsigned({reg121,
                          reg111})) : $unsigned(({wire113,
                      wire118} < $unsigned(reg105)))));
              reg128 <= reg100[(4'ha):(3'h7)];
            end
        end
      reg129 <= (8'hba);
      if (reg102[(2'h2):(1'h1)])
        begin
          reg130 <= reg128[(1'h1):(1'h0)];
          reg131 <= ($unsigned(wire114[(5'h13):(5'h13)]) + reg125);
          reg132 <= reg111;
          reg133 <= $signed(reg124[(2'h3):(1'h0)]);
        end
      else
        begin
          reg130 <= (reg130 ?
              $unsigned(($signed($unsigned(reg121)) << $unsigned($unsigned(reg110)))) : reg100);
          reg131 <= {($unsigned((wire114 && (^~wire97))) && ($signed(wire118) ?
                  ($unsigned(reg131) >= (reg133 && reg133)) : $signed(reg120))),
              wire115[(3'h5):(2'h3)]};
          reg132 <= reg120[(2'h2):(2'h2)];
        end
      reg134 <= $signed($unsigned(reg105[(3'h4):(2'h2)]));
    end
  assign wire135 = reg111;
  assign wire136 = $unsigned((!reg128[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg137 <= wire118;
      reg138 <= reg122;
      reg139 <= reg102[(2'h2):(1'h1)];
      reg140 <= {{$signed($signed((^~reg125))), $signed({(reg131 >= wire118)})},
          {$unsigned($signed((reg134 >> (8'ha4)))), reg106[(4'he):(4'hc)]}};
      reg141 <= (!$signed((&wire98[(3'h7):(1'h1)])));
    end
  assign wire142 = $unsigned($signed($signed({$signed(reg101)})));
  assign wire143 = reg121[(2'h3):(1'h1)];
  assign wire144 = $signed(($signed($signed(wire94[(5'h12):(4'ha)])) ?
                       reg126 : $unsigned($unsigned(reg131[(4'h8):(3'h4)]))));
  assign wire145 = (({({reg141,
                           reg109} <<< reg105)} >> reg121[(2'h3):(2'h2)]) << reg120);
  assign wire146 = (($signed((reg134 ?
                       ((8'ha6) >= wire142) : (~&reg100))) || wire99[(3'h7):(3'h6)]) - (8'ha1));
  assign wire147 = reg141;
  assign wire148 = (~&($signed(((reg137 << wire117) != ((8'ha6) ?
                       (8'hbf) : wire142))) * $signed(reg105)));
endmodule

module module43
#(parameter param76 = (~|((&{{(8'h9f)}}) != (+(((8'ha6) <= (8'ha9)) ? {(8'hbb), (8'hbd)} : ((7'h44) ? (8'ha0) : (7'h44)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h12c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire [(4'ha):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire57,
                 wire56,
                 wire51,
                 wire50,
                 wire49,
                 reg72,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= $signed(wire45[(3'h4):(1'h1)]);
    end
  assign wire49 = (+reg48);
  assign wire50 = {{wire44, wire47[(2'h2):(1'h1)]}};
  assign wire51 = ((8'hb8) ?
                      $unsigned((reg48 != wire46[(1'h0):(1'h0)])) : wire45[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg52 <= {{$unsigned($unsigned(wire51))}};
      reg53 <= $unsigned((wire51 - (wire47 | $signed(wire47[(4'hc):(2'h3)]))));
      reg54 <= ($signed((~$signed((wire50 << wire47)))) ?
          reg53 : $signed(($unsigned($unsigned(wire45)) < $signed($signed(wire50)))));
      if (wire44)
        begin
          reg55 <= (($unsigned(reg54[(4'ha):(1'h1)]) ?
                  (~$unsigned($signed(wire49))) : ($signed((wire45 <<< wire47)) ?
                      (wire47[(5'h11):(4'hd)] ? wire46 : reg48) : reg52)) ?
              (!({wire51[(1'h1):(1'h0)]} >= ($unsigned(wire50) <<< $signed(wire50)))) : $unsigned(((&reg53[(4'h9):(3'h7)]) ?
                  (~&reg52) : (reg53 | (wire49 == reg48)))));
        end
      else
        begin
          reg55 <= (reg54[(3'h4):(1'h1)] ?
              (!$signed((~(^wire50)))) : (wire50 ?
                  $signed(wire51) : $signed(((reg53 < (8'hb9)) + (!wire49)))));
        end
    end
  assign wire56 = reg48;
  assign wire57 = (~&(reg48[(4'h9):(3'h5)] ?
                      (^(reg48[(4'h9):(3'h5)] ?
                          (wire49 != reg55) : wire49[(2'h3):(1'h1)])) : ((~|wire47[(4'h9):(3'h6)]) <= $unsigned((wire46 >> wire46)))));
  always
    @(posedge clk) begin
      reg58 <= {(^{(((8'hb6) ? reg53 : wire49) >> (wire45 >> wire49))}),
          (-$unsigned(((wire50 ? reg53 : wire57) ?
              (^wire47) : $signed(reg54))))};
      reg59 <= (~&(-$unsigned((~&$unsigned(wire50)))));
      reg60 <= $signed(wire57);
      if (wire50)
        begin
          reg61 <= {(&(wire57[(1'h0):(1'h0)] || (wire50[(4'h8):(2'h3)] - (wire49 ?
                  wire51 : reg58)))),
              $unsigned((reg60[(4'h8):(2'h2)] <<< wire45[(3'h5):(1'h1)]))};
          if ($signed((&$signed($unsigned((wire46 <= wire46))))))
            begin
              reg62 <= $signed((~$unsigned(($unsigned((8'hb7)) ?
                  $unsigned(reg54) : (wire44 ? reg53 : reg55)))));
              reg63 <= (~^(((~&(~|wire47)) ~^ $unsigned({wire49,
                  reg61})) >> wire51[(1'h1):(1'h1)]));
              reg64 <= $unsigned({(reg63[(1'h1):(1'h1)] - ((-reg52) ~^ $signed(reg53)))});
              reg65 <= wire50[(3'h4):(1'h0)];
              reg66 <= wire47;
            end
          else
            begin
              reg62 <= reg62;
            end
          if (reg60[(4'hd):(4'hb)])
            begin
              reg67 <= (-(!reg63));
              reg68 <= $signed((~(~^$unsigned((wire51 ? reg66 : reg48)))));
              reg69 <= (reg60 >>> reg55);
              reg70 <= $signed(wire46);
            end
          else
            begin
              reg67 <= ((8'hb3) * $signed($unsigned((&(reg59 * reg68)))));
              reg68 <= (8'ha2);
            end
        end
      else
        begin
          if ({(8'hae), reg68})
            begin
              reg61 <= reg52;
            end
          else
            begin
              reg61 <= $unsigned({reg64[(4'hf):(3'h4)]});
            end
          reg62 <= ((($signed($unsigned((8'hba))) << ($signed(reg55) <= reg66[(1'h1):(1'h0)])) ?
              {$signed($unsigned((8'hba))),
                  ({reg70,
                      reg62} || (~|(8'hbe)))} : reg48[(4'h8):(3'h7)]) <<< $unsigned((reg70[(4'hd):(4'h9)] > ($unsigned(reg69) ?
              {reg54} : reg63))));
        end
    end
  assign wire71 = ((wire56 ~^ (8'hb2)) & reg69);
  always
    @(posedge clk) begin
      reg72 <= (((+(reg68 ? reg68[(2'h3):(2'h2)] : reg64)) ?
          reg55 : ($unsigned(reg65[(4'h8):(3'h6)]) ?
              {reg55} : reg60[(3'h5):(2'h3)])) | $signed($unsigned((wire45 > wire45))));
    end
  assign wire73 = (($unsigned((wire49 ?
                          $unsigned(wire45) : (reg52 & wire56))) >> reg62[(1'h1):(1'h1)]) ?
                      wire49[(1'h1):(1'h1)] : ((8'hbe) ?
                          (~|{$unsigned(reg55)}) : ((~$unsigned(reg72)) ?
                              reg68 : (~|$signed(wire57)))));
  assign wire74 = reg58;
  assign wire75 = (((((reg53 ?
                          reg52 : wire56) || wire46[(3'h4):(1'h0)]) >> ((8'hab) && {reg60,
                          wire74})) && $signed(reg69)) ?
                      $signed($signed(wire56[(4'hb):(1'h1)])) : wire45[(2'h2):(2'h2)]);
endmodule

module module15
#(parameter param40 = (-{(((~^(8'hb7)) ^ ((8'hbc) >> (8'h9c))) | (~^(~^(7'h42)))), {{{(8'haa), (8'h9f)}}}}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire39,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 (1'h0)};
  assign wire21 = $signed(({wire18[(3'h7):(3'h4)]} ?
                      {$unsigned($unsigned((8'ha7))),
                          $signed((wire19 > wire18))} : $signed(((~|wire20) ?
                          (~(8'hb0)) : $signed(wire19)))));
  assign wire22 = ($signed({$unsigned($signed(wire21))}) ?
                      ((wire19 ?
                          wire18 : (~&wire21)) == $signed(($unsigned(wire21) ?
                          (+wire19) : (^wire21)))) : ((~^{wire17,
                          (+wire21)}) && {wire17, (^~(~wire20))}));
  assign wire23 = $unsigned($signed($signed({$signed(wire16)})));
  assign wire24 = (-wire19);
  assign wire25 = (~^$signed({$unsigned(wire18[(3'h6):(3'h6)])}));
  assign wire26 = (wire23[(2'h3):(1'h1)] ?
                      wire24[(1'h0):(1'h0)] : ((($unsigned(wire24) && wire25[(3'h5):(1'h1)]) ?
                              $signed($unsigned(wire24)) : $unsigned((wire23 ?
                                  wire18 : wire19))) ?
                          (!wire20) : (8'ha1)));
  assign wire27 = {wire26, (8'ha6)};
  assign wire28 = wire23[(3'h4):(2'h2)];
  assign wire29 = (wire26[(3'h4):(3'h4)] ?
                      (~&(~(wire23[(2'h2):(1'h0)] ?
                          (|wire16) : (wire28 ?
                              wire20 : wire24)))) : {(-$unsigned((~^wire25)))});
  assign wire30 = ((wire25 ? wire27 : wire17) - wire20);
  assign wire31 = (&wire20[(3'h6):(3'h4)]);
  assign wire32 = $signed((8'hac));
  assign wire33 = wire21[(5'h12):(1'h0)];
  always
    @(posedge clk) begin
      reg34 <= (&wire26[(3'h5):(3'h5)]);
    end
  assign wire35 = ((8'hb8) ?
                      (!(-wire18)) : ((({wire24} ?
                              $signed(wire33) : (wire25 ? (8'hac) : wire33)) ?
                          wire31[(1'h1):(1'h1)] : ((wire21 * wire25) ?
                              $unsigned(wire20) : wire24)) || $unsigned(wire29)));
  always
    @(posedge clk) begin
      reg36 <= ((wire21[(4'h8):(3'h7)] - (($unsigned(wire21) ?
                  (wire29 ? wire35 : (7'h41)) : $signed((8'hb6))) ?
              ((8'ha1) ? $signed(wire23) : $signed(wire25)) : wire17)) ?
          wire28 : (^{(8'ha7)}));
      reg37 <= wire25;
      reg38 <= ((~$signed($unsigned(wire23[(2'h2):(1'h1)]))) > wire17[(3'h4):(2'h2)]);
    end
  assign wire39 = ($signed(((+$signed(wire16)) >= (!wire29[(3'h4):(2'h2)]))) <= $unsigned((((wire23 ?
                          wire22 : wire31) << $signed(wire21)) ?
                      (((8'hab) >> wire25) ?
                          wire23 : $unsigned(reg36)) : wire23)));
endmodule
