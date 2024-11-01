module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire243;
  wire signed [(4'hf):(1'h0)] wire242;
  wire signed [(5'h12):(1'h0)] wire241;
  wire signed [(5'h13):(1'h0)] wire240;
  wire [(4'h9):(1'h0)] wire238;
  wire [(3'h7):(1'h0)] wire190;
  wire signed [(3'h6):(1'h0)] wire189;
  wire [(5'h13):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire186;
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire238,
                 wire190,
                 wire189,
                 wire188,
                 wire19,
                 wire186,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned($signed(((~|wire2) << $signed(wire2)))) - {(~(wire1 >= wire3))});
      reg6 <= wire2;
      if ((wire4 ?
          $signed(((((8'ha4) ? wire2 : wire3) ?
                  (~|wire3) : (wire2 ? reg5 : (8'h9d))) ?
              ((wire4 ? wire4 : reg6) && $unsigned(wire3)) : ((|wire0) ?
                  (reg6 >= wire1) : wire0))) : ($unsigned($unsigned($signed(wire2))) ?
              wire3[(3'h5):(1'h0)] : wire1)))
        begin
          reg7 <= wire2;
          reg8 <= (~|wire0[(1'h0):(1'h0)]);
          reg9 <= (reg7[(2'h3):(1'h0)] ?
              (^$signed(((reg6 ? wire2 : wire0) ?
                  wire4 : reg8[(4'h8):(2'h3)]))) : {$unsigned(({wire2, wire0} ?
                      (wire4 >>> wire3) : wire4[(4'he):(4'he)]))});
          reg10 <= $unsigned(($unsigned((+$unsigned(wire3))) != (~&$signed($unsigned(reg8)))));
          reg11 <= (&$unsigned({$unsigned(reg9[(4'he):(3'h5)]), reg10}));
        end
      else
        begin
          reg7 <= (reg7 > $unsigned($signed({$unsigned(reg9)})));
          reg8 <= (~wire3);
          if ({(8'ha6), $signed(wire1[(2'h2):(1'h1)])})
            begin
              reg9 <= wire1;
              reg10 <= reg5[(1'h0):(1'h0)];
              reg11 <= reg9;
              reg12 <= ((8'ha9) ?
                  reg8[(4'hc):(4'hc)] : {($unsigned({reg11}) != (~^(8'ha4)))});
              reg13 <= (($unsigned(wire1) ?
                  (|((reg7 ~^ reg12) ?
                      wire0 : (+wire2))) : reg5) & ($unsigned($unsigned($signed(reg10))) ?
                  $signed($unsigned(wire1)) : ($signed(reg10[(3'h5):(1'h0)]) | $signed(reg8[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg9 <= {({(reg11 & $unsigned(reg10))} <<< $unsigned(wire3[(4'hf):(4'hc)]))};
              reg10 <= (8'hb2);
              reg11 <= (~(!$unsigned((reg7 ?
                  $unsigned(reg10) : (wire3 <<< reg12)))));
              reg12 <= (wire3[(3'h6):(2'h2)] && ({$unsigned(reg8[(3'h6):(3'h5)])} ?
                  reg11 : (reg9[(1'h1):(1'h1)] ?
                      ((~(8'hb0)) == ((8'hbf) >> reg7)) : reg6[(3'h4):(1'h0)])));
              reg13 <= wire1[(1'h0):(1'h0)];
            end
          reg14 <= (reg5 <<< (reg7 ?
              wire4[(4'h9):(2'h3)] : ((reg13[(4'ha):(3'h5)] ?
                      $signed(wire3) : reg9[(4'h9):(4'h9)]) ?
                  (((8'ha9) <= reg13) ?
                      wire2[(3'h5):(2'h2)] : reg5) : {((8'hb8) != reg5),
                      $signed(wire2)})));
        end
    end
  always
    @(posedge clk) begin
      reg15 <= ($unsigned((8'hbe)) ?
          (((~&((8'ha1) ? reg6 : wire3)) ?
              {(^~wire3),
                  (reg13 * reg8)} : $signed($unsigned((7'h40)))) < reg5[(1'h0):(1'h0)]) : (8'ha4));
      reg16 <= ($signed(reg9) ?
          (reg9[(3'h4):(1'h1)] > $unsigned($unsigned((reg5 && wire2)))) : {(wire4 ?
                  reg12 : $signed(((8'ha1) - reg13))),
              $unsigned(((reg10 ? reg13 : wire1) ? (reg15 | reg15) : reg15))});
      reg17 <= (($signed(($unsigned(wire0) | reg13[(4'hc):(3'h5)])) ?
              ({$signed((8'h9e)), reg5[(2'h3):(2'h3)]} ?
                  (-(^~reg5)) : $signed({reg16})) : wire1[(2'h2):(2'h2)]) ?
          (~^reg5) : {wire4[(2'h3):(2'h3)],
              (-((~^reg7) ? (!wire2) : $unsigned(wire4)))});
      reg18 <= {(!((-(reg12 << reg14)) ?
              $signed($signed(reg7)) : $unsigned((wire0 - reg6)))),
          $unsigned((($unsigned(wire1) <<< (reg7 <= reg12)) != reg13[(4'h9):(2'h2)]))};
    end
  assign wire19 = (~|(($signed({reg10}) <= $signed(reg7)) & $signed({$signed(reg14),
                      (reg18 ? reg13 : reg18)})));
  module20 #() modinst187 (wire186, clk, reg18, reg9, reg11, reg5, wire2);
  assign wire188 = $unsigned(((^~reg18) ?
                       $unsigned({reg7[(5'h11):(4'hf)]}) : (&$signed((|reg13)))));
  assign wire189 = reg18;
  assign wire190 = $unsigned($unsigned((wire186 ?
                       ({wire186} ?
                           $unsigned((8'hb9)) : wire0) : $signed(wire2[(1'h0):(1'h0)]))));
  module191 #() modinst239 (wire238, clk, wire0, wire188, reg9, reg10, reg11);
  assign wire240 = $unsigned((reg13[(4'hb):(3'h7)] <<< reg5[(1'h0):(1'h0)]));
  assign wire241 = ((+$unsigned((!wire0))) ?
                       (((&(~^wire240)) ?
                           (+(!reg7)) : $unsigned($unsigned(wire186))) ~^ {reg16}) : (($signed($signed((8'hb3))) ~^ $signed(wire238)) ?
                           $unsigned(((-wire19) ?
                               reg15[(1'h1):(1'h1)] : ((8'hb6) ?
                                   reg13 : wire238))) : ($signed(((8'ha3) ?
                                   reg16 : reg8)) ?
                               wire4[(4'he):(2'h2)] : ($signed(wire1) ?
                                   (reg7 == reg15) : (reg17 ?
                                       wire188 : reg16)))));
  assign wire242 = wire189[(2'h3):(1'h1)];
  assign wire243 = $signed((!wire1[(1'h0):(1'h0)]));
endmodule

module module191
#(parameter param236 = {{(~(~(~^(7'h40))))}}, 
parameter param237 = (((+((param236 < (8'ha3)) | (~^param236))) ? param236 : ((param236 <= (param236 ~^ param236)) ? (~^{param236}) : param236)) ^~ ((8'ha4) ? param236 : (~(8'hb9)))))
(y, clk, wire196, wire195, wire194, wire193, wire192);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire196;
  input wire [(5'h13):(1'h0)] wire195;
  input wire signed [(3'h4):(1'h0)] wire194;
  input wire [(4'ha):(1'h0)] wire193;
  input wire signed [(4'hb):(1'h0)] wire192;
  wire [(3'h5):(1'h0)] wire235;
  wire signed [(4'h9):(1'h0)] wire234;
  wire signed [(5'h10):(1'h0)] wire233;
  wire [(5'h14):(1'h0)] wire232;
  wire [(3'h4):(1'h0)] wire220;
  wire signed [(2'h3):(1'h0)] wire219;
  wire [(4'hf):(1'h0)] wire218;
  wire [(3'h7):(1'h0)] wire217;
  wire [(4'hd):(1'h0)] wire216;
  wire signed [(4'hd):(1'h0)] wire215;
  wire signed [(2'h2):(1'h0)] wire214;
  wire [(5'h14):(1'h0)] wire213;
  wire [(5'h10):(1'h0)] wire212;
  reg [(3'h7):(1'h0)] reg231 = (1'h0);
  reg [(5'h14):(1'h0)] reg230 = (1'h0);
  reg [(2'h2):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg228 = (1'h0);
  reg [(4'hf):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg226 = (1'h0);
  reg [(4'hf):(1'h0)] reg225 = (1'h0);
  reg [(5'h11):(1'h0)] reg224 = (1'h0);
  reg [(5'h13):(1'h0)] reg223 = (1'h0);
  reg [(4'ha):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg211 = (1'h0);
  reg [(4'h9):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg207 = (1'h0);
  reg [(4'h9):(1'h0)] reg206 = (1'h0);
  reg signed [(4'he):(1'h0)] reg205 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg204 = (1'h0);
  reg [(4'ha):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg201 = (1'h0);
  reg [(5'h11):(1'h0)] reg200 = (1'h0);
  reg [(4'ha):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg198 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  assign y = {wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg197 <= (wire195[(2'h3):(2'h3)] ?
          $unsigned(($unsigned((wire193 ?
              (8'h9f) : wire192)) | $unsigned((wire195 << wire192)))) : wire193);
      reg198 <= (^(|$unsigned({(wire195 ? (7'h42) : wire193),
          wire192[(4'h8):(3'h6)]})));
      reg199 <= $signed((wire196 ?
          wire196[(4'he):(3'h7)] : (~&{wire196[(4'he):(4'hd)],
              reg197[(2'h3):(2'h3)]})));
      reg200 <= $unsigned({(~|wire196[(5'h14):(3'h6)]),
          $unsigned(wire193[(2'h3):(1'h1)])});
    end
  always
    @(posedge clk) begin
      if ((!{reg197[(4'h8):(1'h0)], wire192}))
        begin
          if ($signed((&(reg197 ?
              $signed(wire195[(4'hf):(1'h0)]) : (~&reg198[(3'h4):(3'h4)])))))
            begin
              reg201 <= ((^$unsigned(wire193)) ?
                  ((((8'hb0) < $signed(wire196)) ?
                      wire192 : (8'hb3)) == $signed($signed($unsigned(wire192)))) : {((~&$signed(reg199)) | reg198[(1'h0):(1'h0)]),
                      reg200[(4'ha):(2'h2)]});
              reg202 <= ($unsigned(wire195[(5'h10):(3'h5)]) ?
                  wire196[(4'hb):(3'h5)] : ($signed((wire193[(2'h2):(1'h0)] != $signed(reg198))) ?
                      wire193 : $signed($unsigned($signed(reg198)))));
              reg203 <= ((^~$signed(((8'hab) && wire196))) ?
                  (~((8'hb4) & ($unsigned(reg199) ?
                      $unsigned(reg197) : {wire194,
                          wire192}))) : {$unsigned($signed($unsigned(wire194))),
                      wire195});
              reg204 <= ((|({reg200, {reg197}} & $signed((wire196 ?
                  wire196 : wire193)))) == reg202);
              reg205 <= (&(!$unsigned($signed(reg199))));
            end
          else
            begin
              reg201 <= $unsigned($signed(($signed(reg197[(2'h3):(1'h1)]) ?
                  (!(reg199 ?
                      (8'hb8) : (8'ha9))) : $unsigned($unsigned(reg203)))));
              reg202 <= (reg200[(3'h6):(1'h1)] ?
                  $unsigned((({reg204} ? wire193 : $signed(wire193)) ?
                      ((8'hb4) ~^ $signed(wire193)) : $unsigned((wire195 ?
                          reg197 : reg197)))) : (reg201 >>> $unsigned(({wire193,
                          reg200} ?
                      $unsigned(reg205) : wire192))));
              reg203 <= reg203;
              reg204 <= $signed((!(~|$signed(wire194[(2'h3):(1'h0)]))));
              reg205 <= (8'ha0);
            end
        end
      else
        begin
          reg201 <= {(^~$unsigned($signed((~wire196)))),
              (reg205 ?
                  reg199[(4'h8):(4'h8)] : (((8'ha3) & (reg201 << (8'ha0))) ?
                      $signed((reg199 ? (8'hb8) : reg203)) : {$signed(wire195),
                          reg198[(3'h7):(3'h4)]}))};
          reg202 <= (reg200[(1'h1):(1'h1)] ?
              ({reg205[(2'h3):(2'h3)]} ?
                  wire194 : $unsigned({(wire194 == reg198)})) : reg199[(4'ha):(4'h9)]);
          reg203 <= {(~|($signed($unsigned(reg200)) ?
                  $signed(((8'hb5) > wire192)) : {{reg201, (8'hb0)},
                      $signed(wire193)}))};
          reg204 <= (+((($signed(reg199) & $unsigned(wire194)) <= $unsigned($unsigned(wire192))) * (((|(7'h41)) ?
                  (wire195 >= wire195) : (reg203 ? (7'h42) : wire195)) ?
              {reg200[(2'h3):(1'h0)],
                  {wire194, reg199}} : $signed((reg203 != reg202)))));
        end
      reg206 <= (((^((reg197 ? reg198 : reg199) ?
              (reg201 ? wire195 : wire193) : (reg198 ?
                  (7'h44) : wire194))) * reg198) ?
          ($unsigned(reg199) ?
              reg198[(4'hb):(3'h7)] : (-(reg202[(3'h7):(1'h0)] || $unsigned(reg197)))) : $unsigned(wire192));
      reg207 <= (-(reg197 >= ((~^(reg200 * reg204)) ?
          {{wire192},
              (reg198 - reg197)} : ((reg202 ^ reg201) != reg197[(1'h0):(1'h0)]))));
      if (wire194[(2'h2):(2'h2)])
        begin
          reg208 <= $unsigned((-(wire196[(5'h11):(4'hb)] && $signed(((7'h41) ?
              reg205 : (8'ha4))))));
          reg209 <= {$signed($unsigned($signed((^reg199))))};
          reg210 <= ((~&$signed((^$signed(reg205)))) || ($signed((~&(+reg204))) || reg197[(4'h9):(3'h6)]));
        end
      else
        begin
          reg208 <= (wire192[(3'h7):(3'h5)] <= ({(~|wire192[(2'h3):(1'h1)])} == $unsigned((|(wire196 & wire195)))));
          reg209 <= $signed($unsigned($signed(($unsigned((7'h42)) ~^ (+(8'h9d))))));
          reg210 <= $unsigned(($unsigned(reg201[(4'ha):(4'h8)]) ?
              $unsigned((~^(7'h42))) : (~^(~&{reg200}))));
          reg211 <= (($signed(((reg199 ~^ wire194) ? (8'ha0) : (~^(8'ha2)))) ?
                  (+($signed((8'hb3)) + {wire194,
                      wire195})) : $unsigned(reg208)) ?
              reg202[(3'h4):(1'h0)] : $unsigned($unsigned($signed((wire194 >>> reg208)))));
        end
    end
  assign wire212 = reg206;
  assign wire213 = ((~&reg208[(4'hf):(3'h5)]) != $unsigned({reg208[(4'hf):(3'h5)]}));
  assign wire214 = reg208;
  assign wire215 = wire194;
  assign wire216 = reg203;
  assign wire217 = ((((&wire196[(4'h9):(3'h5)]) ? reg205 : (8'h9f)) ?
                           reg205[(4'h8):(4'h8)] : (8'hbc)) ?
                       $signed((^(reg207[(3'h7):(3'h5)] * (reg200 < reg197)))) : ($unsigned((~^reg200[(3'h7):(1'h1)])) & ($signed((wire213 ?
                           reg208 : reg200)) * ((wire192 ~^ wire215) ?
                           (^~reg210) : reg202))));
  assign wire218 = wire212[(4'h8):(2'h2)];
  assign wire219 = (|(reg210[(1'h0):(1'h0)] ^~ (-$unsigned($signed(wire213)))));
  assign wire220 = (wire214[(1'h1):(1'h0)] ?
                       $signed(((reg197[(1'h1):(1'h0)] ?
                           $unsigned(reg206) : reg200[(3'h7):(3'h6)]) <<< {wire192[(4'h9):(3'h6)],
                           ((8'haa) ?
                               reg211 : reg199)})) : (&(((wire194 ~^ reg206) * $unsigned(reg208)) ?
                           ((reg199 >> wire216) ?
                               wire216 : (|(8'hbd))) : (!wire216[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg221 <= (~&($signed(reg197[(4'h8):(2'h3)]) ~^ $unsigned($signed(reg198[(4'hb):(3'h4)]))));
      reg222 <= reg197[(4'h9):(4'h8)];
      if (reg199[(4'h9):(3'h5)])
        begin
          reg223 <= $signed(wire216);
          reg224 <= $unsigned(wire196);
          if (wire214)
            begin
              reg225 <= reg205;
              reg226 <= $unsigned($unsigned($signed({(7'h44), (!wire217)})));
              reg227 <= (~&$signed((($signed(reg211) ?
                  reg223[(5'h12):(4'ha)] : wire218) * reg203[(3'h5):(1'h1)])));
              reg228 <= reg209;
              reg229 <= (~&wire214);
            end
          else
            begin
              reg225 <= {$signed(($unsigned($unsigned(reg223)) == (reg199[(3'h4):(2'h2)] | (reg199 >>> reg226))))};
            end
        end
      else
        begin
          reg223 <= $signed(($signed(reg208) >> {($unsigned(reg208) == {reg222,
                  reg210})}));
          if ($signed(($signed($signed((wire192 ?
              wire214 : wire192))) != $signed((^~$signed(reg203))))))
            begin
              reg224 <= {wire213[(2'h3):(1'h0)],
                  {(wire219[(1'h1):(1'h0)] ?
                          (|reg202[(3'h5):(3'h5)]) : ((~(8'hb0)) ^~ $unsigned(reg223))),
                      (~$unsigned((reg203 ? wire220 : reg202)))}};
              reg225 <= $unsigned(reg202[(3'h6):(2'h2)]);
            end
          else
            begin
              reg224 <= (~|$signed((($signed(reg224) <<< $unsigned(reg221)) < $signed($signed(wire219)))));
              reg225 <= (wire218 - $unsigned((reg201[(5'h10):(4'ha)] ?
                  $signed(wire213) : ($signed(wire212) - reg200))));
              reg226 <= $signed({(wire213[(2'h2):(2'h2)] ?
                      $unsigned(wire192[(1'h0):(1'h0)]) : $unsigned($unsigned(reg199)))});
              reg227 <= (-reg221[(4'hf):(4'hc)]);
              reg228 <= {wire212};
            end
          reg229 <= (8'hb1);
        end
      if (reg227)
        begin
          reg230 <= wire213;
        end
      else
        begin
          reg230 <= $signed(wire220[(2'h2):(1'h0)]);
          reg231 <= $unsigned(wire195);
        end
    end
  assign wire232 = (reg221 <<< (reg201 * ({$signed(reg203)} <<< {$unsigned(reg226)})));
  assign wire233 = (((|$unsigned($unsigned((8'ha8)))) <<< wire213) ?
                       {(((+(8'h9e)) ?
                               (reg229 ?
                                   reg200 : reg231) : reg206) ~^ $unsigned(reg210[(3'h6):(2'h2)])),
                           (wire212[(4'h9):(4'h9)] ?
                               {(+wire195),
                                   {reg224}} : reg228)} : (($signed(reg228) >> ($unsigned(reg226) + wire194)) ?
                           (~^(!$signed(reg207))) : (|wire196)));
  assign wire234 = $signed({(!(&$signed(wire217)))});
  assign wire235 = ($signed(reg201) ?
                       (|((~^wire217[(3'h7):(1'h0)]) & $signed((wire193 ?
                           wire218 : wire217)))) : ((reg228[(4'hd):(3'h4)] ?
                           (~wire195) : (+$unsigned(wire193))) & {wire196[(5'h10):(2'h2)],
                           reg202[(1'h0):(1'h0)]}));
endmodule

module module20
#(parameter param184 = (+(8'h9d)), 
parameter param185 = (param184 ? (+param184) : param184))
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire23;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire signed [(4'hd):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire154;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire81;
  reg signed [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(4'h9):(1'h0)] reg180 = (1'h0);
  reg [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(5'h11):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg177 = (1'h0);
  reg [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg [(4'ha):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg165 = (1'h0);
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(3'h6):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire158,
                 wire157,
                 wire156,
                 wire154,
                 wire84,
                 wire83,
                 wire26,
                 wire27,
                 wire81,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
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
                 (1'h0)};
  assign wire26 = {(+(wire22 - wire24)),
                      ($unsigned(((&wire22) == (wire22 ? wire21 : wire21))) ?
                          (((wire21 ?
                              (8'ha5) : wire21) ^ (&wire23)) <<< ({(8'hba),
                                  wire23} ?
                              $signed(wire24) : wire22)) : (!wire23))};
  assign wire27 = wire24[(3'h7):(3'h4)];
  module28 #() modinst82 (.y(wire81), .wire33(wire21), .clk(clk), .wire29(wire24), .wire30(wire27), .wire31(wire23), .wire32(wire22));
  assign wire83 = $signed($signed(($unsigned((wire25 > (8'hbe))) ?
                      ((wire24 < wire21) == $unsigned((8'h9c))) : ({wire81,
                              wire24} ?
                          wire26[(3'h6):(1'h0)] : $signed(wire25)))));
  assign wire84 = ((&$unsigned(($signed(wire26) ? wire24 : $signed(wire21)))) ?
                      $signed(wire23) : wire27[(4'hb):(4'h8)]);
  module85 #() modinst155 (wire154, clk, wire21, wire26, wire22, wire27);
  assign wire156 = (wire84 ^ wire84[(3'h4):(2'h3)]);
  assign wire157 = ($signed($unsigned({$unsigned(wire22), wire156})) ?
                       wire156[(3'h4):(1'h1)] : (wire25 ?
                           $unsigned((8'hb9)) : $signed((~wire21))));
  assign wire158 = $unsigned($unsigned(({(wire156 | wire83),
                       (wire25 + wire83)} <= wire26)));
  always
    @(posedge clk) begin
      reg159 <= wire154;
      reg160 <= $signed((({wire24[(2'h2):(1'h1)],
              (8'ha8)} || ((wire156 == wire21) ? $signed(wire26) : {reg159})) ?
          wire81[(3'h6):(2'h3)] : {wire154, $signed(wire83[(1'h1):(1'h0)])}));
      if ((+wire157))
        begin
          reg161 <= ($signed(wire23) < wire83);
          if ((($unsigned(wire27) > $signed((wire157 ?
              $signed(wire83) : (wire26 < wire22)))) <= $unsigned((wire158[(1'h1):(1'h0)] ?
              ((|(8'hb7)) ?
                  reg159[(1'h0):(1'h0)] : {wire83}) : ($unsigned(wire26) - (^reg159))))))
            begin
              reg162 <= (~|reg160[(3'h7):(3'h7)]);
              reg163 <= $signed((wire26[(4'h9):(3'h7)] & wire83[(4'h8):(3'h7)]));
              reg164 <= reg160[(4'hd):(2'h2)];
              reg165 <= {$signed((wire23[(4'hc):(4'hc)] ^ wire27)),
                  (|$signed($unsigned((&reg162))))};
            end
          else
            begin
              reg162 <= (wire27 ?
                  ((!((~&wire156) * $signed(reg159))) > (^(!wire25[(2'h3):(1'h1)]))) : $unsigned(reg162));
            end
          if ((|reg161))
            begin
              reg166 <= $unsigned($unsigned((((&reg160) >> wire21) ^~ wire84[(3'h4):(1'h1)])));
              reg167 <= $signed((-(&$signed($signed(reg166)))));
              reg168 <= (!reg159);
              reg169 <= (reg159[(1'h0):(1'h0)] ?
                  (~|{reg167[(2'h2):(1'h0)]}) : $signed((~&$unsigned($signed(wire23)))));
              reg170 <= {wire27};
            end
          else
            begin
              reg166 <= (-(8'hb7));
              reg167 <= $unsigned((8'ha7));
              reg168 <= $signed({(-wire23), $unsigned($signed((^~reg161)))});
              reg169 <= ((+reg166[(3'h6):(3'h4)]) || wire83[(1'h1):(1'h0)]);
              reg170 <= wire21;
            end
          reg171 <= wire83[(2'h2):(1'h0)];
        end
      else
        begin
          reg161 <= {($signed((~^reg170)) ~^ wire83),
              $unsigned(reg170[(1'h1):(1'h1)])};
          reg162 <= $signed($unsigned($unsigned($unsigned((reg161 ?
              wire25 : wire25)))));
          if ({$unsigned((^{(!reg161)})), $unsigned(wire24)})
            begin
              reg163 <= $unsigned(wire25[(3'h6):(2'h3)]);
              reg164 <= ((^reg159[(2'h2):(2'h2)]) ?
                  ({(&((8'hb0) && reg161))} >= wire83[(3'h7):(2'h2)]) : (($signed((~&wire84)) > $unsigned(reg159)) ?
                      ((^~wire26[(3'h7):(1'h1)]) >= wire27) : wire21[(3'h6):(2'h3)]));
            end
          else
            begin
              reg163 <= $signed(reg161[(2'h3):(1'h1)]);
            end
          reg165 <= ((wire157 * wire156) <<< $signed(($signed((8'hbb)) ?
              $signed(((8'ha3) ? wire27 : wire21)) : reg166)));
          if (reg170)
            begin
              reg166 <= $unsigned($signed((^~($unsigned(wire23) == {wire158,
                  wire22}))));
            end
          else
            begin
              reg166 <= $signed(($unsigned(reg171) ?
                  (wire22[(2'h2):(1'h1)] > $signed(((7'h40) >> reg160))) : wire83));
              reg167 <= (~(((^(wire83 <<< wire81)) ?
                      (+(!wire156)) : wire81[(2'h3):(1'h0)]) ?
                  wire83[(1'h1):(1'h0)] : (reg164 <= {(wire27 | wire24),
                      wire22})));
              reg168 <= $unsigned(({(&$unsigned(wire27)),
                      {wire81, (reg169 < reg160)}} ?
                  $signed($unsigned(reg169[(3'h5):(3'h5)])) : $unsigned((~|(wire22 ?
                      (8'h9d) : wire26)))));
            end
        end
    end
  assign wire172 = reg159;
  assign wire173 = wire157[(1'h1):(1'h0)];
  assign wire174 = $unsigned((~&wire27));
  always
    @(posedge clk) begin
      if ((~|($signed($unsigned($signed(reg159))) ?
          $signed(((wire26 - (8'hac)) << wire154)) : {reg159,
              $signed({reg164, wire81})})))
        begin
          reg175 <= $signed($signed(wire84));
          reg176 <= reg166[(2'h2):(1'h1)];
          reg177 <= (8'hb9);
          reg178 <= $unsigned(reg164[(1'h1):(1'h1)]);
          reg179 <= (-reg161);
        end
      else
        begin
          reg175 <= wire157;
          reg176 <= (((reg171 - (+(~^reg177))) ?
              $unsigned($signed(reg163[(3'h5):(1'h0)])) : {(wire21[(4'h9):(1'h0)] >>> $unsigned(wire23)),
                  $signed($unsigned(wire27))}) * (|wire23));
          reg177 <= {reg176[(1'h0):(1'h0)]};
          if (wire25)
            begin
              reg178 <= ((|$signed({(reg165 || wire23)})) ^~ $unsigned(reg161));
              reg179 <= $unsigned(reg162[(2'h2):(1'h1)]);
              reg180 <= $unsigned((~&(wire173[(4'h8):(3'h7)] > $signed((reg160 + (8'h9d))))));
              reg181 <= (~&(|{$unsigned($unsigned((8'ha9)))}));
              reg182 <= $signed(wire84);
            end
          else
            begin
              reg178 <= ((({$unsigned(wire154),
                      $unsigned(reg178)} | $signed($signed(wire81))) == $unsigned(reg163)) ?
                  $unsigned($unsigned(((reg168 ? reg169 : reg164) ?
                      $unsigned(wire172) : reg179))) : reg164[(1'h0):(1'h0)]);
              reg179 <= {(~|$unsigned(((wire157 ?
                      reg169 : reg169) + wire25[(4'h9):(1'h1)])))};
              reg180 <= ($unsigned((|((wire83 ? wire154 : wire174) ?
                  $signed(reg167) : (wire172 ?
                      wire23 : wire27)))) - {((!reg182[(1'h0):(1'h0)]) ?
                      reg164[(1'h0):(1'h0)] : $signed($unsigned(wire172))),
                  ($unsigned((reg168 >>> wire23)) >>> reg181)});
              reg181 <= {$signed($signed(wire25[(4'h9):(2'h2)]))};
            end
          reg183 <= wire158;
        end
    end
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h2d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire [(4'hc):(1'h0)] wire87;
  input wire signed [(4'ha):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(3'h5):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire136,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire110,
                 wire95,
                 wire94,
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
                 reg112,
                 reg111,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg90 <= (^(^wire89));
      reg91 <= wire87;
      reg92 <= (~&(^~wire87[(1'h0):(1'h0)]));
      reg93 <= $unsigned({$unsigned($unsigned({reg92})), reg92[(1'h1):(1'h1)]});
    end
  assign wire94 = (~$signed(((~|(wire86 && wire88)) >>> ((wire86 ?
                      reg90 : wire87) == wire86))));
  assign wire95 = (wire94 ?
                      $signed($unsigned(wire88[(2'h2):(2'h2)])) : (~(~|$signed(reg90))));
  always
    @(posedge clk) begin
      if (wire94)
        begin
          reg96 <= wire87[(3'h7):(3'h6)];
          reg97 <= {wire94};
          if ((~|$unsigned($signed({{wire88}, $unsigned(reg96)}))))
            begin
              reg98 <= $signed(wire95);
              reg99 <= ((8'hb4) ?
                  (((-((7'h40) <<< reg92)) ?
                          $signed({reg93}) : ({reg90, wire89} > (+wire95))) ?
                      ($signed(wire86[(3'h6):(1'h0)]) ?
                          reg96[(1'h0):(1'h0)] : reg92[(4'h8):(3'h4)]) : $signed($unsigned($unsigned(reg93)))) : {reg91,
                      $unsigned((((8'hbf) ? (8'hb0) : reg91) ?
                          (reg96 >>> (8'hbc)) : (~(8'h9e))))});
              reg100 <= {(reg93[(3'h4):(2'h2)] != $signed((~&(wire89 ?
                      wire89 : reg93))))};
              reg101 <= reg97;
              reg102 <= (~^wire95);
            end
          else
            begin
              reg98 <= (~^($signed(((reg100 != reg100) ?
                  wire88[(4'hc):(4'h8)] : reg93)) != reg91[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          if (wire94)
            begin
              reg96 <= reg99;
              reg97 <= ((-wire94[(3'h7):(2'h2)]) ~^ wire88[(3'h6):(2'h2)]);
              reg98 <= reg100[(3'h6):(1'h0)];
              reg99 <= $unsigned($unsigned($unsigned((!reg92[(4'h8):(3'h7)]))));
            end
          else
            begin
              reg96 <= wire94;
              reg97 <= wire87;
              reg98 <= {$signed(reg98[(3'h4):(1'h0)])};
              reg99 <= {reg91[(3'h4):(2'h3)], (7'h40)};
            end
          reg100 <= wire89;
        end
      reg103 <= reg101[(3'h4):(1'h1)];
      if ((+((~^$signed((reg99 ?
          reg101 : reg98))) <= $unsigned($unsigned(reg100[(3'h7):(3'h4)])))))
        begin
          reg104 <= {reg91};
          if ((8'h9e))
            begin
              reg105 <= reg102;
              reg106 <= ((+{$unsigned($signed(reg92)), $unsigned(reg105)}) ?
                  (($signed((wire88 == reg101)) || reg103[(4'h9):(1'h1)]) ?
                      wire89[(3'h4):(1'h0)] : $signed(($unsigned(reg96) ?
                          reg92[(2'h3):(1'h0)] : {reg101,
                              (8'hb5)}))) : {reg93});
              reg107 <= (wire86 < (reg97[(4'hb):(3'h7)] ?
                  ($signed(wire88) * reg105) : wire94[(3'h7):(2'h2)]));
              reg108 <= $unsigned(reg98);
            end
          else
            begin
              reg105 <= $signed((-{$signed(reg103[(3'h5):(3'h4)])}));
              reg106 <= (reg100 >>> $signed(($signed(((8'hae) <<< (8'ha0))) ?
                  (reg103 ?
                      (wire95 < reg99) : $signed(reg101)) : (^~(reg92 <<< reg102)))));
              reg107 <= ($signed($signed(({(8'hbe)} ? (8'ha9) : (8'h9e)))) ?
                  ((^{{reg106, reg98}}) >>> {((+reg104) ?
                          {reg99, reg96} : wire88)}) : reg92[(3'h7):(1'h1)]);
              reg108 <= reg108[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg104 <= (~&$unsigned(reg90));
          if (reg99[(2'h2):(1'h0)])
            begin
              reg105 <= wire89[(2'h2):(1'h1)];
              reg106 <= $signed(($unsigned((~&wire87)) << reg104[(3'h4):(2'h2)]));
            end
          else
            begin
              reg105 <= $unsigned($signed(($unsigned(wire89) ?
                  ($unsigned(reg100) ?
                      (!wire94) : reg99[(1'h1):(1'h0)]) : reg99[(1'h0):(1'h0)])));
              reg106 <= (({(~|(^~(8'ha7)))} ?
                  (((reg99 ? reg105 : reg93) ~^ (reg108 ?
                      (8'hb4) : reg91)) || (~^((8'h9c) ?
                      reg108 : reg91))) : (((reg90 ?
                      (8'had) : reg90) < reg96[(1'h1):(1'h1)]) | (~&$signed(wire86)))) * $signed(wire87));
            end
          reg107 <= $unsigned({reg106[(4'hb):(1'h0)],
              ((reg98[(1'h0):(1'h0)] ?
                      reg101[(2'h3):(2'h2)] : (reg98 >>> reg91)) ?
                  (reg93 + (reg97 ? reg100 : reg103)) : $signed({wire87}))});
          reg108 <= (&$signed(reg100));
        end
      reg109 <= ((~|reg101) * ($unsigned(((wire87 ? reg96 : reg108) ?
              (reg107 != reg91) : (wire89 & (8'hbd)))) ?
          {{(reg92 | reg97),
                  ((8'ha1) ? (8'h9c) : reg92)}} : $unsigned(reg105)));
    end
  assign wire110 = {((((wire86 ?
                               (8'hbc) : reg102) ^ reg101) | $signed((reg90 != reg102))) ?
                           reg92[(2'h3):(2'h2)] : (^~({wire87,
                               reg106} * reg97[(1'h1):(1'h1)]))),
                       ((^$unsigned((reg103 - reg101))) <<< $unsigned(reg106[(3'h4):(2'h2)]))};
  always
    @(posedge clk) begin
      reg111 <= (^$unsigned(reg97));
      reg112 <= reg93[(5'h10):(4'hc)];
    end
  assign wire113 = (!(^(reg109 ?
                       ({wire94,
                           (8'hbc)} >> $signed((8'hb5))) : (~(reg96 ~^ wire86)))));
  assign wire114 = (($unsigned(((7'h43) ^ (8'ha0))) << $unsigned({{wire110},
                       {reg109}})) | $signed(reg97));
  assign wire115 = reg107[(3'h6):(2'h2)];
  assign wire116 = ((^((~|{(8'hb1), reg111}) * $signed((reg109 ?
                           reg108 : reg107)))) ?
                       (reg93[(5'h15):(4'h9)] ?
                           reg109[(4'h8):(3'h7)] : (^$unsigned($unsigned(wire88)))) : reg92[(4'hb):(3'h7)]);
  assign wire117 = $signed(reg112);
  always
    @(posedge clk) begin
      if ((({(^wire94)} ?
          ((~^$unsigned((8'ha6))) ?
              ((wire95 ? reg103 : wire95) > (wire110 >> wire117)) : ({(8'hb3),
                      (8'hae)} ?
                  reg92 : $unsigned(wire110))) : wire116[(4'hc):(3'h6)]) >>> wire86[(4'h9):(4'h8)]))
        begin
          reg118 <= ((~|((~|$unsigned(reg92)) >> $unsigned(reg92))) ?
              reg102[(3'h4):(2'h3)] : $signed((~^($signed(reg101) ?
                  reg102 : reg108[(3'h6):(3'h5)]))));
          reg119 <= $unsigned(($unsigned((~|wire94)) >= (((wire113 & reg99) ?
              $signed(reg93) : (reg91 ?
                  reg105 : wire113)) >= $unsigned((^~reg109)))));
          if ({(8'hbf), $unsigned((!$unsigned($unsigned((8'hb2)))))})
            begin
              reg120 <= (^(((reg111[(2'h3):(2'h3)] || ((8'hb7) == reg104)) < (8'hb2)) && $unsigned($unsigned((reg105 ?
                  wire110 : reg97)))));
              reg121 <= wire115;
              reg122 <= reg93;
              reg123 <= reg107;
            end
          else
            begin
              reg120 <= reg106;
              reg121 <= {((+($unsigned(wire89) == (reg102 ?
                      wire87 : reg97))) << $unsigned(((+reg107) ?
                      {reg96} : reg123[(2'h2):(1'h0)])))};
              reg122 <= (^(^~(+$signed((8'hab)))));
              reg123 <= $unsigned(($unsigned(({reg98,
                      (8'hb2)} == reg100[(4'h8):(1'h1)])) ?
                  ((reg104[(3'h4):(3'h4)] & {(7'h41)}) ?
                      wire115 : ((wire89 >>> reg123) >> $signed(wire117))) : (((wire94 ?
                          wire113 : (8'hb6)) ?
                      wire86[(3'h4):(1'h0)] : reg120[(2'h2):(1'h1)]) >= reg109)));
            end
          reg124 <= reg123[(1'h1):(1'h1)];
          if ((($unsigned(($unsigned(reg98) ?
              reg91[(1'h1):(1'h0)] : reg93[(4'hd):(1'h1)])) >>> wire114) == $signed({$signed((^reg103)),
              reg91})))
            begin
              reg125 <= {{reg106}};
            end
          else
            begin
              reg125 <= $unsigned((reg105 ?
                  (^~((&wire113) ?
                      (~^reg106) : reg120[(2'h2):(1'h1)])) : wire95[(4'hb):(4'ha)]));
            end
        end
      else
        begin
          reg118 <= reg99[(2'h3):(1'h0)];
        end
      if ({wire89})
        begin
          reg126 <= (|(reg109[(4'ha):(3'h7)] > reg119[(4'hc):(4'ha)]));
        end
      else
        begin
          reg126 <= reg98[(4'h9):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned(((8'ha3) ?
          (reg101 * reg104) : (^~wire114))))))
        begin
          reg127 <= ((8'hbb) && $unsigned(({(wire114 >>> reg90),
                  {wire95, (8'hba)}} ?
              reg104 : $unsigned($unsigned(wire110)))));
          reg128 <= $unsigned($unsigned((({(8'hbc), reg104} ?
              $unsigned(reg96) : wire113[(2'h3):(1'h0)]) >> ($unsigned((8'hb8)) ?
              (-reg97) : $unsigned(reg108)))));
        end
      else
        begin
          reg127 <= ((+reg119[(1'h0):(1'h0)]) ?
              ({(~|(reg126 ~^ wire94))} >> (-((reg128 ?
                  (8'ha6) : wire117) ~^ wire89[(4'ha):(4'h8)]))) : {($unsigned({(8'haf),
                      reg125}) != ((^reg101) ? (~wire89) : reg105))});
          reg128 <= wire110;
          reg129 <= reg90[(1'h1):(1'h0)];
          reg130 <= $unsigned((^($unsigned(((8'hb6) ? reg101 : (7'h42))) ?
              {(reg107 ? wire113 : reg118),
                  wire87} : (reg124[(4'h8):(3'h7)] | wire89))));
          reg131 <= (^(wire88 ? reg107 : reg107));
        end
      reg132 <= reg128[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg133 <= $unsigned(reg101[(2'h2):(1'h0)]);
      reg134 <= reg120[(3'h4):(2'h2)];
      reg135 <= reg129;
    end
  assign wire136 = $unsigned((~&(reg120 ? (~|{reg109}) : reg124)));
  always
    @(posedge clk) begin
      reg137 <= $unsigned($signed($unsigned($signed((reg126 ?
          reg118 : wire89)))));
      if ((reg123 ?
          reg118[(2'h2):(2'h2)] : ((~^(|$unsigned(reg92))) ?
              (8'hb6) : ($signed((reg129 ?
                  reg97 : reg133)) ~^ ($signed((8'ha4)) ?
                  wire117 : $unsigned(reg121))))))
        begin
          reg138 <= $signed((~^reg133[(3'h7):(3'h7)]));
          if (((+reg121) - (reg106[(4'ha):(4'ha)] << $unsigned($unsigned($signed((8'h9e)))))))
            begin
              reg139 <= reg108;
              reg140 <= {(reg134[(3'h5):(3'h4)] ?
                      ((&(reg126 ? reg128 : reg129)) ?
                          {(reg100 ? (8'hb8) : reg106),
                              (reg125 >> (7'h41))} : ((wire95 ?
                              reg102 : reg109) ^~ (-reg134))) : reg102)};
              reg141 <= (8'haf);
              reg142 <= ($signed(reg123) + ((!{$unsigned(wire113),
                      wire115[(2'h3):(1'h0)]}) ?
                  $unsigned(wire117) : wire94[(3'h5):(1'h0)]));
              reg143 <= $unsigned(reg91);
            end
          else
            begin
              reg139 <= ((^~reg126) - ((reg138[(1'h1):(1'h0)] ?
                      wire115[(4'h9):(2'h3)] : (8'hb0)) ?
                  (^~$signed(reg98[(1'h0):(1'h0)])) : (((reg131 ?
                      reg91 : (8'hb4)) ^ (reg127 >> (8'hbb))) + wire86)));
              reg140 <= (reg92 ? reg109 : reg123[(2'h2):(1'h0)]);
              reg141 <= ($signed((reg112[(5'h10):(4'ha)] ?
                      $signed((~&reg141)) : (reg125[(1'h0):(1'h0)] | {(8'ha5)}))) ?
                  reg93[(3'h6):(3'h5)] : (~^wire86));
              reg142 <= (($signed($signed($unsigned(reg139))) ?
                      (+$unsigned((reg140 <<< reg127))) : ($signed(wire114) ?
                          (~&wire88) : $unsigned(reg124))) ?
                  reg137[(2'h2):(1'h0)] : ($unsigned((-(wire115 ?
                      reg99 : reg129))) & wire87));
            end
          if (((wire117[(4'ha):(1'h0)] ?
              $signed((8'had)) : (reg108[(4'hc):(4'hb)] ?
                  $signed((reg99 << (8'hbe))) : $signed(reg98[(4'h9):(3'h5)]))) >>> (wire95[(4'hb):(4'h9)] < ((^~{reg134}) ?
              (^~reg108[(2'h3):(1'h0)]) : reg140))))
            begin
              reg144 <= {$signed(reg133)};
              reg145 <= {($signed((8'hb4)) & reg105[(1'h1):(1'h0)]),
                  $signed((~|(^~reg107)))};
              reg146 <= ((|((!$signed((7'h44))) < $unsigned(wire87))) ?
                  $unsigned({$signed($unsigned(reg92)),
                      $signed(reg135)}) : ((reg118 ?
                      (~&{reg105,
                          reg107}) : $unsigned($signed((8'hbf)))) <<< (((8'ha2) >= $unsigned(reg101)) ?
                      (^$signed(reg120)) : wire89)));
              reg147 <= (7'h42);
              reg148 <= (8'hae);
            end
          else
            begin
              reg144 <= {(reg124[(1'h0):(1'h0)] > (+reg130[(4'ha):(4'h9)])),
                  reg103[(3'h7):(2'h2)]};
            end
          reg149 <= $unsigned((^(|$signed($signed(wire95)))));
          reg150 <= reg109;
        end
      else
        begin
          reg138 <= {$unsigned(reg99)};
          if ((($signed(reg145) != $unsigned($signed(((8'had) <= reg144)))) ^~ (+({(&reg147),
                  $signed(reg109)} ?
              ((reg138 - reg141) ?
                  ((8'hae) ?
                      reg103 : (7'h41)) : reg122[(3'h6):(2'h3)]) : (~^(^~(8'hb3)))))))
            begin
              reg139 <= reg130[(4'h9):(3'h5)];
              reg140 <= (+$signed(wire86[(3'h4):(2'h2)]));
              reg141 <= $signed((($unsigned(reg120[(1'h0):(1'h0)]) ?
                  $signed($unsigned(reg134)) : ((~|reg109) > (8'haf))) ~^ ($signed($unsigned(reg92)) ?
                  (~$unsigned(reg140)) : ((reg98 ^ reg118) ?
                      (reg129 | reg108) : (reg134 | wire110)))));
              reg142 <= $unsigned($signed((|(~&(8'ha3)))));
              reg143 <= reg140[(1'h0):(1'h0)];
            end
          else
            begin
              reg139 <= $signed(wire95[(4'hb):(3'h4)]);
              reg140 <= reg106;
              reg141 <= $unsigned(reg119[(1'h1):(1'h0)]);
              reg142 <= (~&reg129[(4'h8):(3'h7)]);
              reg143 <= reg132[(1'h0):(1'h0)];
            end
          if ($signed((!{$signed($unsigned(reg140))})))
            begin
              reg144 <= (~|($signed(((reg134 << reg148) ^~ (-reg144))) ?
                  $unsigned((8'hb2)) : {reg109[(1'h1):(1'h0)]}));
              reg145 <= $unsigned({$unsigned((((8'hb5) >>> reg129) ^ (reg91 <<< reg129)))});
              reg146 <= ((^~reg143) ?
                  (((~|reg139) ?
                          ($signed(reg109) ~^ (reg97 ?
                              (8'ha9) : wire88)) : reg118) ?
                      wire117 : reg143[(2'h2):(1'h1)]) : reg146);
              reg147 <= (({$signed((|reg126)), $unsigned((8'hae))} ?
                  ((~reg112[(5'h10):(1'h0)]) ?
                      reg123[(1'h1):(1'h0)] : $signed((^~reg143))) : reg112) * $unsigned(reg129));
              reg148 <= ($signed(wire86) ?
                  {reg97[(2'h2):(1'h1)]} : ((~^(^(&reg148))) > reg133[(4'hc):(3'h7)]));
            end
          else
            begin
              reg144 <= $signed($signed(((8'h9d) ?
                  ((8'ha7) >= reg93) : (reg147 >> reg104))));
              reg145 <= (reg99[(1'h0):(1'h0)] ^ $unsigned(reg137));
            end
        end
    end
  assign wire151 = $signed((wire94 ~^ $unsigned(reg139)));
  assign wire152 = ((($signed($signed(reg131)) >>> reg101[(3'h4):(3'h4)]) ?
                           ($signed(reg101) | wire94[(1'h1):(1'h1)]) : $signed($unsigned((|(8'hb1))))) ?
                       {(reg122 == ($unsigned(reg91) ?
                               $unsigned(wire88) : (reg137 << reg145))),
                           ((~reg138) | reg98[(3'h6):(1'h0)])} : {reg148,
                           ((+{reg133, reg104}) + $unsigned(reg133))});
  assign wire153 = ($signed($unsigned(reg141[(2'h3):(1'h1)])) <<< reg103[(1'h0):(1'h0)]);
endmodule

module module28
#(parameter param80 = (((!(8'ha7)) ? ((((8'ha9) ? (7'h44) : (8'h9d)) != {(8'hbe), (8'hbe)}) ? (((8'hac) ? (8'hab) : (8'h9d)) ? ((8'hb4) ? (8'hb3) : (8'h9f)) : ((8'hb2) ? (8'ha3) : (8'had))) : {((8'ha0) ? (8'haa) : (7'h44)), ((8'h9d) ? (8'h9c) : (8'ha5))}) : ((((8'hb8) ? (8'h9c) : (8'hb9)) + ((8'hb7) - (8'ha7))) & ((&(8'ha1)) ? (!(8'ha0)) : (~(8'hbd))))) >>> {(({(8'h9c)} ? ((8'hb7) ~^ (8'hb5)) : ((8'ha6) ? (8'hac) : (8'hbc))) >>> (8'hbf)), {({(8'hb6), (8'haf)} ? ((7'h44) < (8'h9c)) : ((8'hb4) ? (8'had) : (8'had)))}}))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire33;
  input wire [(3'h4):(1'h0)] wire32;
  input wire signed [(5'h11):(1'h0)] wire31;
  input wire signed [(4'hf):(1'h0)] wire30;
  input wire signed [(2'h3):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(4'hf):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire43,
                 wire35,
                 wire34,
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
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire34 = $signed($signed(wire31));
  assign wire35 = wire29[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ($unsigned(((wire35 >= $unsigned($unsigned((8'hbf)))) | (-$signed($signed(wire33))))))
        begin
          if ($unsigned($signed((|wire30))))
            begin
              reg36 <= $signed((wire35 ?
                  wire29[(1'h0):(1'h0)] : {{$unsigned((8'hb9))}}));
              reg37 <= (~|((&wire33) ^ wire34));
              reg38 <= $unsigned(wire35[(2'h2):(1'h1)]);
            end
          else
            begin
              reg36 <= ($unsigned((reg38[(4'h8):(1'h0)] > $unsigned((wire34 ?
                      wire31 : wire34)))) ?
                  {{(wire35[(3'h5):(1'h1)] ?
                              $unsigned(wire30) : $unsigned(wire31))}} : $signed(($unsigned($signed(wire30)) + (^~$signed(wire31)))));
              reg37 <= ($signed(($unsigned((^reg37)) ?
                  ((wire32 <<< (8'h9d)) ~^ (wire33 | wire32)) : wire30[(4'he):(1'h0)])) != ($unsigned($signed((8'hb8))) ?
                  {(((8'hbb) <<< wire34) ?
                          $unsigned(wire35) : $unsigned(wire32)),
                      reg37} : (8'hb8)));
              reg38 <= $unsigned((^~reg38[(1'h1):(1'h0)]));
            end
          reg39 <= $unsigned(wire31[(3'h6):(1'h0)]);
          reg40 <= wire32;
        end
      else
        begin
          reg36 <= (({wire29[(1'h1):(1'h1)]} ?
              {{$unsigned(wire30)},
                  wire34[(3'h5):(1'h1)]} : (-wire31)) ^~ {{((^(7'h44)) && wire30[(4'he):(4'h9)]),
                  {$signed(wire31), (&wire34)}}});
          reg37 <= wire35[(4'h9):(3'h7)];
        end
      reg41 <= (-{($signed((reg38 >> wire33)) ?
              $signed($signed(reg37)) : wire32[(1'h1):(1'h1)]),
          (-$unsigned((reg36 - wire35)))});
      reg42 <= (reg36[(3'h5):(3'h5)] ^~ reg39[(3'h6):(2'h2)]);
    end
  assign wire43 = $unsigned($unsigned(((~&(~wire33)) | {$signed(wire31),
                      {reg41}})));
  always
    @(posedge clk) begin
      reg44 <= (~^(~&reg41[(1'h1):(1'h0)]));
      if (({reg38} ?
          reg40 : (reg36[(1'h1):(1'h1)] - ($signed($signed((7'h40))) != wire33[(1'h1):(1'h1)]))))
        begin
          if ((^(&$signed($signed($unsigned(reg44))))))
            begin
              reg45 <= $signed(reg36);
              reg46 <= (~{wire35});
              reg47 <= reg39[(3'h7):(2'h3)];
              reg48 <= $unsigned($signed(((((8'hbf) == reg46) >> wire32) ~^ reg46)));
            end
          else
            begin
              reg45 <= {{(^~($unsigned(wire31) ^~ {wire29}))}};
              reg46 <= (~|reg44);
            end
          reg49 <= ($unsigned(($signed($signed(reg44)) >>> $unsigned((!reg40)))) ?
              wire32[(1'h1):(1'h1)] : (~(wire31 <= reg36)));
        end
      else
        begin
          reg45 <= (($unsigned(((~&reg38) ~^ {reg42})) + ($signed({wire34,
              reg46}) <<< (8'hb1))) || $unsigned(($signed((reg45 ?
              wire30 : reg41)) ~^ (^~wire33[(4'he):(4'hb)]))));
        end
      reg50 <= wire43[(4'hd):(4'hc)];
      if (wire43)
        begin
          if (({$signed(((reg40 ~^ reg39) ?
                  wire29[(2'h3):(1'h0)] : (reg45 ~^ reg50))),
              wire31} << ((~$unsigned($unsigned(reg45))) ?
              reg45[(1'h0):(1'h0)] : $signed((8'hb3)))))
            begin
              reg51 <= {reg42};
              reg52 <= reg46[(2'h2):(1'h1)];
              reg53 <= wire43;
            end
          else
            begin
              reg51 <= reg42;
              reg52 <= $unsigned((~&($signed($signed(reg48)) ?
                  ({reg38} ?
                      (reg52 ? reg48 : reg49) : (reg44 ?
                          (8'h9c) : reg44)) : reg48[(3'h6):(3'h4)])));
            end
          reg54 <= $signed(wire34[(1'h0):(1'h0)]);
          if ({($signed((reg47 ? {wire43, reg41} : $signed(reg53))) ?
                  (~^wire34[(1'h1):(1'h0)]) : ($signed(reg50[(4'h9):(3'h5)]) ?
                      $signed(wire30[(3'h4):(2'h3)]) : (!(reg51 ?
                          reg47 : reg45)))),
              (((((7'h43) - reg45) ?
                      (reg37 ? (8'h9d) : reg54) : reg51[(2'h2):(1'h1)]) ?
                  (&{(7'h43), reg50}) : ($unsigned(reg50) ?
                      reg41[(4'h9):(1'h0)] : wire33)) > ((wire29[(2'h2):(1'h1)] > reg44[(4'hc):(3'h6)]) ?
                  $signed($unsigned(reg47)) : reg38[(3'h6):(3'h6)]))})
            begin
              reg55 <= reg42[(4'hd):(4'hc)];
              reg56 <= (($signed($unsigned((reg53 ^ wire31))) != ($unsigned(reg39) ?
                      (|(!(8'hae))) : $signed((reg52 >> wire43)))) ?
                  (8'hbb) : reg45[(1'h0):(1'h0)]);
              reg57 <= (((~|reg44[(4'h8):(3'h4)]) < $unsigned($unsigned(reg49))) & wire34);
              reg58 <= reg41;
              reg59 <= reg46;
            end
          else
            begin
              reg55 <= (($unsigned({(reg49 ? (8'hb4) : reg46)}) ?
                      (((~|wire34) != wire31[(1'h1):(1'h1)]) ?
                          (~|$unsigned(reg36)) : ((7'h44) ?
                              (wire30 ? reg44 : reg52) : (reg40 ?
                                  reg49 : reg58))) : (reg59 ?
                          $unsigned(wire35[(4'ha):(4'h8)]) : $signed($signed(reg57)))) ?
                  (reg47 ?
                      ($unsigned($unsigned(reg46)) ?
                          ($unsigned(reg44) ?
                              reg46 : (^reg54)) : $signed($signed(reg50))) : (($signed(reg46) ?
                          (reg58 ? reg36 : reg54) : (wire33 ?
                              reg46 : reg41)) > ($signed(reg50) + reg40[(2'h2):(1'h1)]))) : ($signed((~&(^~reg45))) ?
                      wire32[(2'h3):(1'h1)] : ({$unsigned((8'ha2)), (-reg45)} ?
                          reg53[(3'h5):(2'h2)] : reg36)));
            end
          reg60 <= $signed($unsigned($signed($signed((8'h9d)))));
          if (({wire31[(5'h10):(1'h0)],
              (8'hab)} ^~ $unsigned(((wire30[(3'h7):(1'h0)] ?
              $signed(reg58) : $signed(reg55)) ^~ (reg58[(5'h14):(4'hf)] ?
              $unsigned(wire32) : reg53[(3'h6):(1'h1)])))))
            begin
              reg61 <= wire31;
              reg62 <= (^~reg48);
              reg63 <= (~&wire43);
            end
          else
            begin
              reg61 <= wire29;
              reg62 <= reg46;
              reg63 <= (-wire43[(5'h13):(5'h11)]);
            end
        end
      else
        begin
          if (((^reg63) ^~ {wire30,
              ($unsigned(reg54) ? reg50 : ({reg58} >>> (^(7'h40))))}))
            begin
              reg51 <= $signed((+((8'hb7) != (|$unsigned(reg55)))));
            end
          else
            begin
              reg51 <= (reg40[(1'h1):(1'h0)] >>> reg39[(2'h2):(2'h2)]);
              reg52 <= (^reg61);
              reg53 <= wire30[(4'hc):(3'h6)];
            end
          reg54 <= {$signed(((7'h43) ^ $unsigned(wire34)))};
          reg55 <= (^$unsigned(wire29[(2'h3):(1'h0)]));
        end
    end
  assign wire64 = (~^((~&{reg54}) ?
                      {wire30[(3'h6):(2'h2)],
                          ($signed(reg46) ?
                              (wire33 != (8'hba)) : (reg45 >> reg55))} : $unsigned((reg61 ?
                          (~reg62) : (reg40 ? reg61 : reg38)))));
  assign wire65 = reg38[(3'h6):(1'h1)];
  assign wire66 = ((8'h9e) ?
                      (7'h41) : (~&(reg58 ?
                          reg62[(1'h1):(1'h1)] : {reg61[(2'h2):(1'h0)]})));
  assign wire67 = (|$unsigned(reg58[(5'h13):(5'h13)]));
  assign wire68 = $unsigned(reg59);
  assign wire69 = $unsigned(wire35);
  assign wire70 = {{reg51,
                          ((!reg42) ?
                              ((~&wire65) ?
                                  $signed((8'haf)) : {wire65}) : reg40)},
                      $signed($unsigned(($signed(reg50) > wire31)))};
  assign wire71 = $signed($unsigned($signed((wire35 ?
                      reg63 : $unsigned(wire43)))));
  assign wire72 = wire32[(2'h2):(2'h2)];
  assign wire73 = $signed(reg61[(1'h0):(1'h0)]);
  assign wire74 = reg63[(4'ha):(4'ha)];
  assign wire75 = (({$unsigned($unsigned(reg58)),
                          ((wire33 ^~ (8'ha7)) ? $unsigned(reg40) : (!reg60))} ?
                      (reg38[(2'h2):(2'h2)] && $unsigned((wire31 < (8'ha2)))) : $unsigned(((~reg39) ?
                          {reg37} : $unsigned(reg60)))) ^ {wire29});
  assign wire76 = (&wire72[(4'hf):(2'h3)]);
  assign wire77 = reg39[(2'h3):(2'h3)];
  assign wire78 = $unsigned(((($signed(wire76) != wire66[(4'ha):(3'h7)]) < $unsigned(reg41[(1'h0):(1'h0)])) ?
                      $signed(reg36[(4'ha):(4'ha)]) : $unsigned((8'h9e))));
  assign wire79 = reg48[(3'h5):(1'h0)];
endmodule
