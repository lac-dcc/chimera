module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h369):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire195;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire197;
  wire signed [(3'h5):(1'h0)] wire209;
  wire [(4'hf):(1'h0)] wire210;
  wire signed [(5'h12):(1'h0)] wire211;
  wire [(4'ha):(1'h0)] wire243;
  wire signed [(3'h7):(1'h0)] wire254;
  reg [(3'h7):(1'h0)] reg253 = (1'h0);
  reg [(4'h9):(1'h0)] reg252 = (1'h0);
  reg [(2'h2):(1'h0)] reg251 = (1'h0);
  reg [(4'h8):(1'h0)] reg250 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg249 = (1'h0);
  reg [(4'ha):(1'h0)] reg248 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg247 = (1'h0);
  reg signed [(4'he):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg245 = (1'h0);
  reg [(4'ha):(1'h0)] reg244 = (1'h0);
  reg [(4'hb):(1'h0)] reg242 = (1'h0);
  reg [(5'h15):(1'h0)] reg241 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg240 = (1'h0);
  reg [(4'hc):(1'h0)] reg239 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg238 = (1'h0);
  reg [(4'he):(1'h0)] reg237 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg236 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg235 = (1'h0);
  reg [(3'h7):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg233 = (1'h0);
  reg [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(4'hb):(1'h0)] reg231 = (1'h0);
  reg [(5'h14):(1'h0)] reg230 = (1'h0);
  reg [(5'h12):(1'h0)] reg229 = (1'h0);
  reg [(4'hc):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg227 = (1'h0);
  reg [(4'hb):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg225 = (1'h0);
  reg [(4'ha):(1'h0)] reg224 = (1'h0);
  reg [(5'h14):(1'h0)] reg223 = (1'h0);
  reg [(4'hb):(1'h0)] reg222 = (1'h0);
  reg [(5'h10):(1'h0)] reg221 = (1'h0);
  reg [(5'h12):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg219 = (1'h0);
  reg [(4'hd):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg216 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg215 = (1'h0);
  reg [(4'hc):(1'h0)] reg214 = (1'h0);
  reg [(5'h15):(1'h0)] reg213 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg212 = (1'h0);
  reg [(5'h14):(1'h0)] reg208 = (1'h0);
  reg [(4'h9):(1'h0)] reg207 = (1'h0);
  reg signed [(4'he):(1'h0)] reg206 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  reg [(5'h12):(1'h0)] reg204 = (1'h0);
  reg [(3'h6):(1'h0)] reg203 = (1'h0);
  reg [(4'ha):(1'h0)] reg202 = (1'h0);
  reg [(4'h8):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg198 = (1'h0);
  assign y = {wire195,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire197,
                 wire209,
                 wire210,
                 wire211,
                 wire243,
                 wire254,
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
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
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
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
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
                 (1'h0)};
  assign wire4 = ((8'hb9) ?
                     (wire0 ?
                         ($unsigned((^(8'h9c))) ^ wire2) : (((~wire3) | (wire2 <<< wire1)) ?
                             $signed(wire0[(2'h2):(1'h1)]) : wire0)) : (($signed(wire0) ?
                         ((~wire3) ^~ wire1[(4'h9):(1'h0)]) : ($signed((8'ha2)) ?
                             {(8'hb1)} : wire0)) >>> wire3[(1'h0):(1'h0)]));
  assign wire5 = $signed(($signed($unsigned($signed(wire1))) ?
                     $unsigned(wire2) : wire1));
  assign wire6 = $signed(wire0);
  assign wire7 = ($unsigned($unsigned(($signed(wire5) && wire2[(2'h3):(1'h1)]))) < ({$signed({(8'hb5),
                             wire3}),
                         $signed(wire4)} ?
                     $signed(wire3) : ((!(wire6 + wire2)) == $signed(wire4))));
  assign wire8 = $unsigned(wire5);
  assign wire9 = ((((|$unsigned(wire6)) ?
                             (((7'h41) | wire0) <= wire2) : (+$unsigned(wire3))) ?
                         $unsigned($signed(wire7)) : {(^wire1[(3'h5):(2'h3)]),
                             ($signed(wire6) > (wire8 ? (8'haa) : (8'haf)))}) ?
                     (^wire2[(1'h1):(1'h1)]) : (wire0 ?
                         ($signed((wire2 ?
                             wire5 : wire7)) == wire6[(2'h2):(1'h1)]) : (8'had)));
  assign wire10 = wire4;
  assign wire11 = {wire4[(3'h6):(3'h6)],
                      (wire5 >>> (wire9[(5'h10):(4'hb)] ?
                          ((~^wire3) > {(8'ha1)}) : ($signed(wire7) >= wire3)))};
  assign wire12 = (~(-$unsigned(wire3[(2'h3):(1'h1)])));
  assign wire13 = wire0;
  assign wire14 = $unsigned((wire13 == wire5));
  assign wire15 = (!($signed((~(wire3 != (8'hbd)))) ^ wire4[(1'h1):(1'h1)]));
  module16 #() modinst196 (wire195, clk, wire15, wire3, wire1, wire9, wire10);
  assign wire197 = wire4;
  always
    @(posedge clk) begin
      reg198 <= $unsigned($unsigned(wire14[(5'h12):(5'h12)]));
      reg199 <= $signed(wire197[(4'h9):(4'h8)]);
      if ((8'ha3))
        begin
          if ((wire6[(3'h5):(2'h2)] && $unsigned($unsigned(($signed(wire8) ?
              wire15 : wire4[(4'h9):(3'h6)])))))
            begin
              reg200 <= (($signed($unsigned({wire13, wire14})) ?
                  {wire12,
                      $unsigned((wire4 ?
                          wire2 : (8'hbd)))} : $signed((-$signed(wire11)))) | ((^~(8'hb8)) ?
                  ($unsigned(reg199[(4'ha):(2'h2)]) ?
                      reg198[(1'h1):(1'h1)] : (|((8'h9d) * (8'ha2)))) : $signed($unsigned(((8'ha4) < wire5)))));
            end
          else
            begin
              reg200 <= $signed(($signed($signed($unsigned(wire11))) > ({(~wire1),
                      (^reg198)} ?
                  {$unsigned((7'h40))} : $signed($unsigned(reg200)))));
              reg201 <= wire2[(3'h5):(2'h3)];
            end
          if (reg198)
            begin
              reg202 <= (!(&(wire13[(1'h0):(1'h0)] + ($signed(wire5) <= wire6[(4'h9):(2'h2)]))));
            end
          else
            begin
              reg202 <= reg202[(2'h3):(1'h0)];
            end
          reg203 <= (~&$unsigned(wire7[(4'hb):(4'h9)]));
          if (wire13)
            begin
              reg204 <= (wire14 || (~|((wire1[(3'h7):(2'h3)] || (reg203 ?
                  wire6 : reg201)) + (8'ha5))));
            end
          else
            begin
              reg204 <= (wire8 ?
                  $unsigned($signed((~^(|reg202)))) : ((reg201 && (8'hbd)) ?
                      ($signed(wire195) ?
                          ((!reg204) | (reg203 < reg198)) : reg204[(1'h1):(1'h1)]) : (((wire8 == wire9) >>> (wire15 ?
                          reg202 : wire8)) >>> {$signed(wire12), (8'hbc)})));
            end
          if (((wire8[(4'hb):(3'h4)] > wire10[(4'h8):(2'h2)]) ?
              {wire14,
                  (((wire14 ? wire5 : wire9) ?
                      $signed(reg201) : (wire11 <<< reg198)) >= wire14[(4'hd):(3'h6)])} : $signed((&wire2[(2'h2):(2'h2)]))))
            begin
              reg205 <= ($signed((wire195[(3'h4):(1'h0)] ?
                      (&(reg200 && (8'hb1))) : wire9[(5'h12):(5'h11)])) ?
                  $unsigned((~^(8'hb1))) : {(|((+wire0) ^~ wire8))});
              reg206 <= ($signed((8'ha5)) & {(($signed(wire2) ?
                          (reg201 - reg202) : wire197[(5'h11):(5'h11)]) ?
                      (-(wire5 ?
                          wire197 : (8'hba))) : (wire11[(1'h0):(1'h0)] & $unsigned(reg201)))});
              reg207 <= ((&reg198) && $unsigned(reg204));
            end
          else
            begin
              reg205 <= wire15;
            end
        end
      else
        begin
          if (wire7[(1'h0):(1'h0)])
            begin
              reg200 <= {wire195};
              reg201 <= $signed((reg207[(3'h4):(1'h0)] ?
                  {wire14,
                      (reg202[(4'h8):(1'h0)] & $signed(reg201))} : (^~wire15)));
              reg202 <= reg202[(3'h7):(3'h5)];
            end
          else
            begin
              reg200 <= reg200;
              reg201 <= (8'ha6);
              reg202 <= $signed($signed((^(~&wire5))));
              reg203 <= (8'hbb);
            end
        end
      reg208 <= $unsigned((wire10 ?
          $signed((^(8'hbf))) : $unsigned((wire7 ? (!wire4) : (!wire12)))));
    end
  assign wire209 = wire0[(2'h2):(1'h0)];
  assign wire210 = (~|$unsigned(wire3));
  assign wire211 = ($unsigned(($signed(reg207) ?
                       wire13[(1'h1):(1'h1)] : ((wire210 < wire12) ?
                           $unsigned(wire210) : $signed(reg199)))) > wire7);
  always
    @(posedge clk) begin
      if ($signed(($unsigned($unsigned($unsigned(wire8))) ?
          (&(((8'hac) ? reg203 : (8'ha6)) ?
              {reg198, reg198} : (wire13 ?
                  (8'h9d) : (8'ha5)))) : {$signed((reg204 + reg204))})))
        begin
          reg212 <= $unsigned($signed($signed({(!wire8)})));
          if ({$unsigned($unsigned((^(wire8 << (8'h9f)))))})
            begin
              reg213 <= (^{(8'h9e),
                  ($unsigned(wire5) ?
                      ((wire10 << wire8) < wire197) : (reg200 ?
                          $signed(wire13) : $unsigned(wire10)))});
              reg214 <= (wire10[(4'h9):(4'h8)] != $unsigned($unsigned(reg207[(4'h8):(3'h6)])));
              reg215 <= wire15;
            end
          else
            begin
              reg213 <= ({reg202[(3'h6):(2'h2)]} >> reg205[(1'h0):(1'h0)]);
              reg214 <= (8'hbe);
            end
          reg216 <= (reg205[(3'h5):(1'h0)] ?
              $unsigned(reg201[(2'h3):(1'h1)]) : $signed(({(-wire12),
                  ((8'h9e) ? (8'hb8) : wire0)} >> reg208[(2'h2):(1'h1)])));
          reg217 <= (-(wire8 - $signed(($unsigned(reg203) >= (^~(8'had))))));
          reg218 <= (reg206 && ((^~$unsigned((reg215 ?
              (7'h44) : wire5))) && $unsigned(wire211[(4'hd):(4'hc)])));
        end
      else
        begin
          if ((~reg202[(4'h9):(1'h0)]))
            begin
              reg212 <= $unsigned(((wire11[(2'h3):(2'h2)] != $signed(((8'ha9) >= (8'hb5)))) ?
                  $unsigned(reg202) : {$signed({wire12}),
                      $signed(reg218[(1'h1):(1'h0)])}));
              reg213 <= (reg205 ?
                  reg199[(2'h3):(1'h1)] : $unsigned((-$signed(reg213))));
              reg214 <= $signed($unsigned($unsigned($signed(reg199[(3'h5):(3'h5)]))));
              reg215 <= wire11;
            end
          else
            begin
              reg212 <= (wire6[(3'h5):(1'h1)] > (+(reg205 || reg208)));
              reg213 <= $signed(wire0);
              reg214 <= $signed($unsigned($signed(((-(8'hb1)) ?
                  {wire5, wire2} : (wire209 ? wire13 : reg218)))));
            end
          reg216 <= wire12;
          if (wire195[(2'h3):(2'h2)])
            begin
              reg217 <= ($signed(($signed((wire6 <= wire14)) ?
                      $unsigned(((8'hb4) > (8'ha4))) : wire13)) ?
                  reg203[(3'h6):(3'h4)] : {($signed(reg199[(2'h2):(1'h1)]) ?
                          $unsigned(((7'h41) <= wire6)) : $unsigned($signed(reg216))),
                      ((+(~^wire11)) ?
                          reg206[(2'h2):(1'h1)] : $unsigned((^~wire9)))});
              reg218 <= (wire11 ~^ (+wire7));
              reg219 <= ($unsigned((^$signed($unsigned((8'ha7))))) || $signed($signed(wire1[(1'h0):(1'h0)])));
              reg220 <= reg204;
              reg221 <= $unsigned(reg215);
            end
          else
            begin
              reg217 <= ((((^$signed(reg219)) ?
                          ((reg202 ? reg202 : reg205) ?
                              (reg205 >> wire210) : $signed(wire197)) : reg219[(4'h8):(3'h7)]) ?
                      (wire15[(4'hf):(3'h4)] >>> (~&(~^wire12))) : wire1) ?
                  $unsigned(reg216[(3'h5):(2'h2)]) : (^(^(8'hbe))));
              reg218 <= $signed((($unsigned((wire209 <<< wire3)) << (~^$signed((7'h40)))) ?
                  (^$signed((8'ha8))) : (~&$signed(wire197))));
              reg219 <= wire7;
              reg220 <= ((wire197 ?
                  (|$signed(((8'ha4) ?
                      wire11 : reg199))) : wire12[(3'h4):(3'h4)]) >> reg214);
            end
          reg222 <= reg219[(3'h4):(1'h0)];
          reg223 <= {(reg218[(3'h5):(1'h1)] != $unsigned({((8'hb8) ?
                      wire195 : reg220),
                  reg208[(2'h3):(1'h0)]})),
              ((^~(&(|reg221))) && wire11)};
        end
      if ((($signed((reg221[(3'h5):(1'h1)] ?
          ((7'h42) ?
              reg198 : (8'ha3)) : (reg200 - wire6))) * (reg217[(4'h9):(3'h6)] ?
          (^~{reg208,
              reg198}) : ({(8'hb3)} & $unsigned(wire195)))) * $unsigned((wire1[(4'ha):(3'h6)] || {$unsigned(wire197)}))))
        begin
          if ((^$unsigned(reg218)))
            begin
              reg224 <= wire3[(3'h6):(3'h6)];
              reg225 <= $signed((^$signed(((reg199 ?
                  (8'hb1) : wire0) || reg199[(2'h2):(2'h2)]))));
              reg226 <= (-(|$unsigned(reg218)));
              reg227 <= $unsigned(((~|((reg223 ?
                  reg207 : reg207) <= $signed(wire0))) << ((~&reg201) >= (((8'hbb) ^ (8'hbe)) ?
                  (wire2 ? wire195 : reg226) : (8'haf)))));
              reg228 <= $unsigned(reg199[(4'hb):(3'h6)]);
            end
          else
            begin
              reg224 <= {(8'h9d), reg218[(4'hd):(3'h6)]};
              reg225 <= reg221[(2'h3):(1'h1)];
              reg226 <= $unsigned((((-(&wire211)) ?
                  reg205[(2'h3):(2'h2)] : (reg222 ?
                      wire5 : (reg199 <<< reg221))) == (|$signed((~&wire11)))));
            end
          reg229 <= $unsigned(({wire210} == (reg228[(4'hc):(3'h7)] >>> reg200[(4'hc):(4'hb)])));
        end
      else
        begin
          reg224 <= ($signed(wire9) ?
              (~&(wire14[(4'h8):(3'h4)] - (~|$unsigned((8'h9c))))) : $unsigned({reg226[(4'hb):(4'hb)],
                  (wire0[(2'h2):(1'h1)] == (wire8 != reg216))}));
          reg225 <= wire15;
          if ((wire11 ? reg207[(1'h0):(1'h0)] : reg204))
            begin
              reg226 <= (((+((^~wire10) >= reg228)) - $unsigned($unsigned(wire209))) ?
                  (~|(((~(8'hb9)) & (wire8 ? wire6 : reg225)) ?
                      {(!reg216)} : wire10[(3'h4):(2'h2)])) : wire13);
              reg227 <= (~^(~|$signed(reg198[(3'h4):(2'h2)])));
              reg228 <= $signed(((wire13 ?
                  $signed((reg199 ?
                      wire14 : (8'hbb))) : $unsigned(wire12[(3'h5):(3'h4)])) - $unsigned((&wire210[(4'ha):(3'h4)]))));
              reg229 <= reg229;
            end
          else
            begin
              reg226 <= (($unsigned(reg203) - $unsigned($unsigned(wire197))) >> (|reg208[(4'h9):(4'h8)]));
              reg227 <= reg215[(3'h4):(2'h3)];
              reg228 <= (reg216 | $signed(wire5));
              reg229 <= $signed({(-$signed($unsigned(reg223))),
                  ((~^(reg227 ? wire210 : wire13)) ?
                      (&$signed(reg206)) : ({reg206,
                          wire195} + (reg223 < reg228)))});
              reg230 <= wire4;
            end
          reg231 <= $signed(reg216[(2'h3):(1'h0)]);
        end
      if ($unsigned($signed($signed(reg203))))
        begin
          reg232 <= $signed(reg202);
        end
      else
        begin
          reg232 <= ($signed(wire10[(3'h4):(2'h2)]) ?
              ($signed(reg199) ?
                  $signed(reg226[(2'h3):(2'h2)]) : reg217[(1'h1):(1'h0)]) : ((~^$unsigned({reg217})) ?
                  $signed(reg217) : $signed($unsigned(wire9))));
          reg233 <= (~$unsigned($unsigned(({wire3, reg199} | $signed(wire1)))));
          if ((~^(reg228[(3'h4):(2'h3)] << wire211[(2'h2):(1'h0)])))
            begin
              reg234 <= reg221[(4'hd):(4'hb)];
              reg235 <= reg205[(4'hb):(1'h1)];
              reg236 <= ((((wire211 >> (reg202 + reg233)) ?
                      ((reg213 ? reg225 : wire8) ?
                          (^~(7'h41)) : $unsigned((8'hb8))) : wire5) >> reg225) ?
                  $signed($unsigned(wire4[(3'h5):(2'h2)])) : {$signed(reg234[(1'h1):(1'h1)]),
                      wire2});
              reg237 <= wire0[(1'h1):(1'h0)];
            end
          else
            begin
              reg234 <= wire210[(1'h0):(1'h0)];
            end
        end
      reg238 <= $signed(wire11[(2'h2):(1'h0)]);
      if ($unsigned({(~wire209[(3'h5):(3'h4)]), (-(+$signed(reg238)))}))
        begin
          if ($unsigned($unsigned((~^reg201[(3'h7):(1'h1)]))))
            begin
              reg239 <= reg218;
              reg240 <= {{$signed($unsigned((~&reg234))),
                      ($unsigned(wire7) ?
                          $unsigned(((7'h44) > wire15)) : ($signed(reg232) ?
                              (reg219 & (8'hb5)) : wire211))},
                  (8'hb0)};
            end
          else
            begin
              reg239 <= $signed((|wire15[(1'h0):(1'h0)]));
              reg240 <= ($unsigned($signed(wire14)) ?
                  ($signed((!$signed(reg198))) ?
                      $unsigned(($unsigned(reg229) - ((8'hb6) ?
                          reg225 : (8'ha0)))) : $unsigned((reg220[(2'h3):(1'h1)] ?
                          $unsigned(wire13) : $signed(reg224)))) : $signed($unsigned((reg239[(1'h1):(1'h0)] ?
                      (reg232 && reg198) : $signed(reg218)))));
              reg241 <= (reg206 <<< (((reg238 ?
                  reg205 : {reg238}) && reg198[(4'ha):(4'h9)]) != reg214[(2'h2):(1'h0)]));
            end
          reg242 <= reg230;
        end
      else
        begin
          reg239 <= $signed(reg233[(3'h7):(2'h2)]);
          reg240 <= $signed({reg237});
          reg241 <= $signed($unsigned(reg200));
          reg242 <= (|$signed(({reg217} ^ {wire211[(2'h2):(2'h2)], wire209})));
        end
    end
  assign wire243 = (($signed(((reg238 * reg219) ^~ (-reg230))) == $unsigned($unsigned($signed(wire195)))) ?
                       reg205 : ((~&(wire197[(4'hb):(3'h5)] ?
                           $unsigned(wire13) : (reg200 - (8'hb7)))) & reg232[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      if ((~&(($unsigned(reg216) > reg205[(3'h4):(3'h4)]) - (~&reg217))))
        begin
          if (reg213[(3'h7):(3'h5)])
            begin
              reg244 <= $signed(wire209[(1'h0):(1'h0)]);
              reg245 <= wire5[(2'h3):(1'h1)];
              reg246 <= {reg218[(4'hd):(4'hb)]};
              reg247 <= reg203[(2'h3):(2'h2)];
              reg248 <= {(($signed((reg223 ? wire8 : wire13)) ?
                          wire14[(4'hf):(4'h9)] : reg242) ?
                      $signed((reg237 ? reg223 : $unsigned(reg233))) : wire197),
                  $signed((reg238 == $signed((reg241 ? reg212 : reg225))))};
            end
          else
            begin
              reg244 <= reg225;
              reg245 <= $unsigned((&(~$signed(((8'h9d) * reg199)))));
              reg246 <= ((|{{wire211[(5'h12):(2'h2)],
                      {reg213, reg215}}}) || wire197[(5'h14):(3'h6)]);
            end
          reg249 <= $unsigned((~|reg230));
          reg250 <= (^reg222);
          reg251 <= {(~&reg236), reg246[(4'he):(4'h8)]};
        end
      else
        begin
          if ($unsigned($signed($unsigned(reg239))))
            begin
              reg244 <= $signed((~^$unsigned($signed({wire6}))));
            end
          else
            begin
              reg244 <= (reg240[(3'h7):(1'h1)] << (~&$signed(wire243[(3'h7):(3'h4)])));
              reg245 <= $unsigned((&$signed($unsigned(wire15[(4'h9):(3'h4)]))));
              reg246 <= $unsigned({(reg198[(3'h5):(3'h4)] ?
                      ({reg227} ?
                          (reg246 ?
                              reg239 : reg229) : (8'hb7)) : $signed(reg235[(1'h1):(1'h0)]))});
              reg247 <= (wire197[(2'h3):(2'h3)] >>> $unsigned({$unsigned(wire9[(3'h4):(2'h2)]),
                  reg228}));
              reg248 <= (^~(reg245 ?
                  $unsigned($unsigned($signed((8'hbf)))) : (^~((~reg236) == $unsigned(reg238)))));
            end
          if (($signed(($signed(reg246[(4'he):(4'hd)]) & $unsigned(reg216[(4'hf):(3'h5)]))) >> reg248))
            begin
              reg249 <= $signed(reg226[(1'h0):(1'h0)]);
              reg250 <= $unsigned(wire209[(3'h5):(2'h2)]);
              reg251 <= ($signed(((~&(reg239 ~^ reg239)) ?
                  $unsigned($signed(reg246)) : ({reg251} & (~^reg202)))) || (~^$signed(reg225)));
            end
          else
            begin
              reg249 <= ((-(8'hb0)) + {$signed(((wire14 ?
                      wire1 : reg223) < wire197))});
              reg250 <= $unsigned((wire1 ?
                  (+(+(reg205 && wire6))) : reg246[(3'h5):(2'h3)]));
            end
          reg252 <= ($unsigned(($signed((~reg202)) ?
                  wire210[(3'h5):(2'h2)] : wire0[(2'h2):(2'h2)])) ?
              ($signed(reg229[(4'hc):(2'h2)]) + (reg251 ?
                  ((reg202 ?
                      wire5 : (8'hb9)) <<< (!reg208)) : ($unsigned(wire11) ?
                      reg228[(3'h5):(3'h4)] : $unsigned((8'ha4))))) : reg231[(2'h2):(1'h0)]);
          reg253 <= reg226[(4'h8):(3'h5)];
        end
    end
  module24 #() modinst255 (.clk(clk), .y(wire254), .wire26(reg239), .wire28(wire210), .wire27(reg213), .wire25(reg198), .wire29(reg217));
endmodule

module module16
#(parameter param194 = ((((((8'h9c) <= (8'ha1)) ? ((8'hac) * (8'hbf)) : ((8'hbe) ? (8'h9e) : (8'hb8))) != (~&(^~(8'hb9)))) <= {(+((7'h43) | (8'h9f)))}) ? (^~({((8'hb1) ^ (8'hba)), (~(8'haf))} || {((8'hb5) <<< (8'ha8))})) : (((~^((8'hbc) << (8'ha9))) ^~ ((&(8'ha4)) ? ((8'haf) ? (8'ha2) : (8'hb0)) : (&(7'h43)))) ? (8'hb0) : {(((8'had) + (8'h9f)) >> ((8'haa) ? (8'ha7) : (8'hb1)))})))
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h24e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire [(4'h9):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire190;
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire176,
                 wire123,
                 wire121,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire22,
                 wire23,
                 wire52,
                 wire190,
                 reg126,
                 reg125,
                 reg124,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  assign wire22 = wire17[(5'h15):(4'ha)];
  assign wire23 = wire22[(3'h5):(2'h2)];
  module24 #() modinst53 (.y(wire52), .wire27(wire18), .wire26(wire21), .wire28(wire20), .wire25(wire22), .clk(clk), .wire29(wire17));
  assign wire54 = ((wire19[(1'h0):(1'h0)] | (!(8'hb5))) ?
                      (8'h9c) : $unsigned($signed(($signed(wire21) >= (~wire22)))));
  assign wire55 = (^wire17[(5'h15):(5'h15)]);
  assign wire56 = {wire17[(2'h3):(2'h2)]};
  assign wire57 = ((~^$unsigned((^~wire22))) - ($signed({(wire23 | wire17),
                          (wire23 != wire55)}) ?
                      (|($unsigned((8'hb0)) ?
                          (wire54 > wire20) : {wire17,
                              wire18})) : wire18[(4'h8):(3'h4)]));
  assign wire58 = $unsigned((-(wire18 ?
                      (wire18 & wire52[(2'h2):(2'h2)]) : $signed(((8'hbf) ?
                          wire17 : wire52)))));
  always
    @(posedge clk) begin
      reg59 <= (^wire22);
      if ((~|(wire57 ? (~wire19[(1'h1):(1'h0)]) : (!(+wire20[(2'h2):(2'h2)])))))
        begin
          reg60 <= (~(~&{$unsigned((+wire52)), $unsigned(wire23)}));
          reg61 <= (&{wire20, ($unsigned($signed(wire52)) ^ wire56)});
          if (((-reg60) < ((8'ha2) ? reg60[(1'h0):(1'h0)] : wire52)))
            begin
              reg62 <= (~^(^(&(|wire58[(3'h5):(2'h2)]))));
              reg63 <= {reg62[(1'h0):(1'h0)]};
            end
          else
            begin
              reg62 <= $signed({{(8'ha0)},
                  ((~^{wire17}) ? (8'ha9) : $unsigned($signed(wire22)))});
            end
          reg64 <= ((&$signed($signed((+wire21)))) >= $signed(reg59[(3'h4):(3'h4)]));
          reg65 <= wire18;
        end
      else
        begin
          reg60 <= (({$signed(wire57)} ?
              (|wire18) : (~({wire18} > $signed(reg64)))) + $unsigned($signed(wire19[(1'h1):(1'h0)])));
        end
      reg66 <= (~&$unsigned(reg59[(3'h4):(2'h2)]));
      if (wire55)
        begin
          reg67 <= (8'hae);
        end
      else
        begin
          if ({{$signed(reg63[(4'ha):(1'h0)]),
                  $signed(($signed(wire21) ?
                      $unsigned((8'hbf)) : $unsigned(wire55)))},
              (wire19[(1'h1):(1'h0)] > reg63[(4'ha):(2'h2)])})
            begin
              reg67 <= wire19;
              reg68 <= (reg67[(4'he):(4'hd)] ?
                  ((wire18[(1'h0):(1'h0)] > ($unsigned((7'h42)) - $unsigned(wire23))) ?
                      (wire23 & $unsigned((wire55 ?
                          (8'hb6) : reg67))) : $signed(reg63)) : wire55);
              reg69 <= wire19;
              reg70 <= wire20[(1'h0):(1'h0)];
              reg71 <= (^~{($signed($signed((8'hba))) * $signed((~reg68)))});
            end
          else
            begin
              reg67 <= (({wire20, (7'h43)} ?
                      $unsigned($signed(wire56)) : wire19[(1'h1):(1'h0)]) ?
                  {$unsigned($unsigned(((8'hbc) ? reg61 : wire52))),
                      {(~&$signed(wire57))}} : $signed((^~($unsigned(reg63) ?
                      (reg68 >= reg59) : $unsigned(reg63)))));
            end
        end
      if (wire52)
        begin
          reg72 <= (wire58 >= $signed($signed(reg60)));
          reg73 <= (|(-reg63));
          reg74 <= ($unsigned(reg61) ?
              (wire58 < (|wire57[(4'h8):(3'h5)])) : $unsigned(($signed({(8'ha4),
                  reg61}) - {$unsigned(wire19), (wire17 ~^ (8'h9e))})));
          reg75 <= $signed((8'h9c));
        end
      else
        begin
          reg72 <= $signed((~($signed((reg68 ? wire57 : reg62)) ?
              (wire18[(2'h2):(1'h1)] >> $signed(reg74)) : (~|wire52[(4'h8):(2'h3)]))));
          if ((wire19 ?
              $signed((({reg73} ?
                  (reg65 & wire20) : reg65) >> {wire17})) : wire22))
            begin
              reg73 <= (wire21[(4'hf):(4'h8)] - (~|(|(8'hb6))));
              reg74 <= $unsigned({$signed((wire52 ?
                      $unsigned(reg67) : (reg66 ? reg59 : wire58)))});
              reg75 <= reg66;
            end
          else
            begin
              reg73 <= wire18;
              reg74 <= (^~wire54[(4'hd):(4'h9)]);
            end
          if (wire22[(4'h9):(4'h8)])
            begin
              reg76 <= $unsigned(reg70);
            end
          else
            begin
              reg76 <= $signed($signed((8'hb4)));
              reg77 <= {{($signed($unsigned(reg68)) ?
                          wire58[(1'h0):(1'h0)] : $signed(wire23[(2'h2):(2'h2)])),
                      wire19[(2'h2):(1'h1)]}};
              reg78 <= ((^~reg68[(4'hb):(3'h5)]) * {reg62[(1'h0):(1'h0)],
                  reg66[(4'ha):(3'h5)]});
            end
          reg79 <= (((8'hb8) >> $signed({(reg65 ?
                  reg70 : reg65)})) == (((reg72 & reg73[(4'h9):(1'h0)]) < reg69) ?
              reg77[(2'h2):(1'h1)] : (+$unsigned((wire55 ? reg66 : (8'h9e))))));
        end
    end
  assign wire80 = reg79;
  assign wire81 = $signed($signed((((^~reg72) ?
                      $unsigned(reg61) : (!(8'had))) && $unsigned((reg66 <<< reg63)))));
  assign wire82 = (8'ha5);
  assign wire83 = $unsigned($signed($signed($unsigned((wire22 ?
                      reg70 : wire80)))));
  assign wire84 = (&(8'hb5));
  assign wire85 = reg64[(5'h10):(3'h4)];
  module86 #() modinst122 (.wire89(reg73), .wire91(reg65), .clk(clk), .wire87(reg63), .y(wire121), .wire88(wire52), .wire90(wire22));
  assign wire123 = ((|($signed(((8'haa) ? wire18 : reg65)) ?
                       (wire80[(3'h4):(1'h1)] <= (~reg78)) : $unsigned((reg69 ?
                           reg66 : wire22)))) >> wire82[(4'hc):(4'h8)]);
  always
    @(posedge clk) begin
      reg124 <= reg65;
      reg125 <= (~reg77[(5'h12):(2'h2)]);
      reg126 <= (^~$unsigned($unsigned($signed($signed(wire83)))));
    end
  module127 #() modinst177 (wire176, clk, wire57, wire21, reg67, wire56, reg74);
  module178 #() modinst191 (.wire182(reg72), .wire179(reg71), .wire183(wire22), .y(wire190), .wire180(reg63), .clk(clk), .wire181(reg68));
  assign wire192 = $signed($signed((($signed((8'hbf)) ?
                           (~&reg65) : $unsigned(reg60)) ?
                       (~&{wire85}) : wire85)));
  assign wire193 = $signed($unsigned($signed($unsigned({(8'ha2)}))));
endmodule

module module178  (y, clk, wire183, wire182, wire181, wire180, wire179);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire183;
  input wire [(2'h2):(1'h0)] wire182;
  input wire signed [(4'ha):(1'h0)] wire181;
  input wire signed [(5'h10):(1'h0)] wire180;
  input wire signed [(5'h15):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire188;
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  assign y = {wire189, wire188, reg187, reg186, reg185, reg184, (1'h0)};
  always
    @(posedge clk) begin
      reg184 <= ($signed(($unsigned($signed(wire179)) >> $signed(wire180))) ?
          (~^(!$signed(wire183[(3'h4):(1'h1)]))) : wire179);
    end
  always
    @(posedge clk) begin
      reg185 <= (+wire183);
      reg186 <= wire181[(4'h9):(3'h4)];
      reg187 <= ((~^(~&(~|(~&wire181)))) | $unsigned(($unsigned($unsigned(wire183)) ?
          $unsigned((^~reg186)) : $unsigned($unsigned(reg184)))));
    end
  assign wire188 = $unsigned(wire179);
  assign wire189 = reg187[(2'h3):(2'h2)];
endmodule

module module127
#(parameter param175 = ((&((^~(~&(8'hb2))) ? (((8'hbb) << (8'hb2)) ? ((8'hac) | (8'ha0)) : (8'hbc)) : (((8'hbf) - (7'h43)) ? ((8'hb8) ? (8'hbf) : (8'had)) : {(8'h9f), (8'hb8)}))) ? (((|{(8'hbd)}) >>> ({(7'h42)} ? (&(8'haa)) : (~&(8'hbd)))) >> (~|(((8'hb8) ? (8'ha2) : (8'hba)) ? ((8'hb8) + (8'hb7)) : ((8'hb8) << (8'hbc))))) : ((((~|(8'hb4)) ? (^(7'h41)) : {(8'ha7), (8'h9d)}) ? ((^(7'h42)) ? ((8'hbd) ? (8'hb6) : (8'hb4)) : ((7'h41) ? (8'hbc) : (8'h9e))) : ((!(8'hbe)) ? ((8'ha4) * (8'had)) : (^(8'hb7)))) ? ((^~((8'had) > (8'haa))) ^~ (((8'haa) ? (8'h9e) : (8'haa)) ? ((7'h42) ? (8'h9f) : (7'h40)) : ((8'ha8) ? (8'haa) : (8'hab)))) : {(!((8'hbc) ? (8'ha2) : (8'had))), {{(8'h9f), (8'hac)}}})))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire132;
  input wire [(2'h3):(1'h0)] wire131;
  input wire signed [(2'h2):(1'h0)] wire130;
  input wire signed [(5'h11):(1'h0)] wire129;
  input wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire170;
  wire signed [(4'ha):(1'h0)] wire169;
  wire signed [(3'h7):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire136;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  reg [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  assign y = {wire174,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 reg173,
                 reg172,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 reg133,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg133 <= ($unsigned($signed({wire131, (~wire132)})) >> wire129);
    end
  assign wire134 = wire128;
  assign wire135 = $unsigned(reg133[(2'h2):(1'h1)]);
  assign wire136 = (^((wire135[(1'h1):(1'h0)] > ($unsigned(reg133) != (reg133 ^~ wire135))) ?
                       ($signed({wire128, wire131}) >> ($unsigned(wire128) ?
                           $signed(wire131) : (wire128 ?
                               wire134 : (8'ha7)))) : wire129));
  assign wire137 = wire130;
  always
    @(posedge clk) begin
      reg138 <= wire131[(2'h3):(2'h3)];
      if (((8'hb0) || reg133[(1'h0):(1'h0)]))
        begin
          reg139 <= ($signed((!(+wire136[(1'h1):(1'h1)]))) ?
              (reg133 ?
                  (|$signed((wire135 > wire137))) : wire132[(2'h2):(2'h2)]) : reg133);
        end
      else
        begin
          reg139 <= (8'h9f);
          reg140 <= reg138;
          if (((7'h41) != (reg138[(4'h8):(3'h7)] - (~^$signed($signed((7'h43)))))))
            begin
              reg141 <= ($signed(reg140) ?
                  wire136 : ((^wire129) < {($unsigned(reg140) ^ (wire130 ?
                          (8'hb8) : wire129)),
                      ((8'haa) ? $unsigned(wire130) : {(8'hb6), reg140})}));
            end
          else
            begin
              reg141 <= (wire137[(4'hd):(2'h2)] >>> wire134);
              reg142 <= (~&(-(+$signed((reg133 ? (8'hb5) : wire131)))));
              reg143 <= (!$unsigned($unsigned((~|reg139[(5'h10):(3'h4)]))));
              reg144 <= reg138;
            end
          reg145 <= {reg141,
              ($signed(wire134[(3'h4):(2'h3)]) + (reg140[(2'h2):(2'h2)] ?
                  $signed((^~wire130)) : (wire134 | wire136[(2'h3):(2'h3)])))};
          if ($signed((wire135[(3'h6):(2'h2)] < $unsigned(((reg141 <= wire129) | reg145)))))
            begin
              reg146 <= reg144;
              reg147 <= (-({wire131[(2'h3):(1'h1)]} ?
                  $signed({$unsigned(reg144), wire128}) : {wire136,
                      $unsigned((reg138 >= (8'ha2)))}));
              reg148 <= (^{(~|((wire131 * reg142) ^ ((8'ha3) ?
                      wire129 : reg138))),
                  (($unsigned(reg145) >= $signed(wire129)) > $signed(((8'h9d) ?
                      reg145 : wire134)))});
            end
          else
            begin
              reg146 <= reg138;
              reg147 <= reg148[(1'h1):(1'h1)];
              reg148 <= (wire135[(3'h7):(3'h6)] > reg139[(1'h0):(1'h0)]);
              reg149 <= {wire137, (8'hb1)};
              reg150 <= (wire130 + (8'ha9));
            end
        end
      reg151 <= (reg149 ?
          ($unsigned(wire135[(3'h5):(1'h1)]) || reg150[(4'ha):(3'h6)]) : $unsigned((~^wire136[(1'h0):(1'h0)])));
      reg152 <= $unsigned(reg151);
    end
  assign wire153 = (~&((((~reg147) <<< (!reg144)) ?
                       reg144[(2'h2):(1'h0)] : ((reg150 < reg148) < (wire131 << (8'hb1)))) <= reg133));
  assign wire154 = reg147[(4'h9):(3'h7)];
  assign wire155 = {wire135[(4'h8):(3'h7)], reg152[(4'hc):(4'h9)]};
  assign wire156 = (^{reg145[(2'h3):(2'h2)], wire131});
  assign wire157 = $unsigned(((~|$signed(reg151[(3'h6):(2'h3)])) ?
                       $signed((&$signed(wire154))) : {($signed(reg145) <= wire155[(4'he):(3'h7)]),
                           ({reg151} ?
                               wire128[(4'h8):(3'h4)] : (wire129 != wire155))}));
  always
    @(posedge clk) begin
      if ($unsigned($signed((reg133 ~^ {(reg151 >= (8'ha9)),
          $signed(wire130)}))))
        begin
          if (reg146[(4'h9):(3'h5)])
            begin
              reg158 <= {(~|$unsigned($unsigned(wire135)))};
              reg159 <= ((~&{wire132,
                  ((wire155 * (8'hba)) ^~ (&reg149))}) ^~ ((($unsigned(reg141) < (8'hbb)) >>> reg141[(2'h3):(2'h3)]) | (reg141[(3'h7):(2'h2)] ?
                  reg158[(2'h3):(1'h0)] : ((wire128 && (7'h44)) >>> $unsigned(wire130)))));
              reg160 <= (!(wire157 >>> reg152[(4'he):(4'he)]));
              reg161 <= ($signed({$signed((wire154 & (7'h40)))}) || $signed((&($signed(reg138) ?
                  $unsigned(reg151) : $signed(reg159)))));
              reg162 <= (($unsigned((reg143 <<< (wire130 ?
                  reg150 : reg161))) >>> reg148) >> (wire153[(3'h4):(3'h4)] || ($unsigned(reg146) <= ((~reg158) ?
                  wire155[(3'h5):(2'h3)] : $unsigned(reg159)))));
            end
          else
            begin
              reg158 <= {$unsigned($signed((~|$signed(reg142)))),
                  ({($unsigned(wire129) == ((8'hab) ?
                          wire154 : wire154))} || reg146[(3'h4):(1'h1)])};
            end
        end
      else
        begin
          reg158 <= reg160;
          reg159 <= ((~^(wire157[(2'h3):(1'h0)] <= $signed($unsigned(reg147)))) || reg159[(4'hb):(4'hb)]);
        end
    end
  always
    @(posedge clk) begin
      if ((^wire137[(3'h6):(1'h0)]))
        begin
          reg163 <= (((((reg147 ? wire157 : (8'hac)) ?
                          (reg142 ? reg158 : reg133) : ((7'h41) != reg149)) ?
                      $unsigned($signed(wire136)) : reg140) ?
                  $signed(wire128[(3'h7):(1'h1)]) : ($unsigned(reg148) ^~ {(8'hb9)})) ?
              $unsigned($signed($unsigned(reg160))) : reg152);
        end
      else
        begin
          reg163 <= (~$signed(wire130));
          reg164 <= {$unsigned((^$unsigned((|reg151)))), reg140};
          reg165 <= $unsigned((wire129 ?
              $signed(($signed(wire137) ?
                  $unsigned(wire132) : $unsigned(wire155))) : $unsigned((reg162[(3'h4):(2'h3)] ?
                  reg161 : (reg146 && reg158)))));
        end
      reg166 <= reg139;
    end
  assign wire167 = $unsigned($unsigned($unsigned($signed({reg150}))));
  assign wire168 = (~&$unsigned((~|reg149[(3'h7):(2'h3)])));
  assign wire169 = $unsigned(reg158);
  assign wire170 = $unsigned(wire169);
  assign wire171 = reg151;
  always
    @(posedge clk) begin
      reg172 <= wire134;
      reg173 <= reg160;
    end
  assign wire174 = wire156[(2'h3):(2'h2)];
endmodule

module module86  (y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire91;
  input wire [(4'h9):(1'h0)] wire90;
  input wire signed [(2'h3):(1'h0)] wire89;
  input wire signed [(4'h8):(1'h0)] wire88;
  input wire [(5'h13):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(4'ha):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire92;
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire93,
                 wire92,
                 reg113,
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
                 (1'h0)};
  assign wire92 = $signed(({$unsigned($unsigned(wire89)),
                          (~&(wire87 - wire88))} ?
                      wire90 : $unsigned(($signed((8'hbf)) ?
                          wire87 : wire88))));
  assign wire93 = (|(8'ha7));
  always
    @(posedge clk) begin
      if (wire87)
        begin
          if ((+(^~(wire93[(3'h5):(1'h0)] ?
              $signed(wire93) : ((wire91 ? wire89 : wire89) == (&wire91))))))
            begin
              reg94 <= (+((+$signed((wire93 >>> wire92))) < $signed(($unsigned(wire88) ?
                  (wire88 > wire93) : (wire89 ^~ (7'h40))))));
            end
          else
            begin
              reg94 <= (({wire90[(3'h6):(3'h5)]} || reg94) ?
                  reg94[(4'h9):(3'h7)] : wire91);
              reg95 <= $unsigned(wire90[(2'h3):(1'h1)]);
            end
          if ((~|((wire88[(1'h0):(1'h0)] ?
              {((8'hb7) ?
                      wire87 : (8'ha4))} : {$unsigned(wire89)}) < reg94[(4'hd):(1'h1)])))
            begin
              reg96 <= wire90[(4'h9):(4'h8)];
              reg97 <= (|wire90);
              reg98 <= wire93[(2'h3):(2'h2)];
            end
          else
            begin
              reg96 <= wire93[(2'h2):(1'h0)];
            end
          reg99 <= reg94;
        end
      else
        begin
          reg94 <= (~^$unsigned($unsigned(wire93)));
          reg95 <= reg99[(1'h0):(1'h0)];
        end
      reg100 <= $unsigned(wire88[(2'h2):(2'h2)]);
      if (((~$signed(reg99)) ?
          (wire89[(2'h2):(1'h0)] ?
              (wire92 || {$unsigned(wire92)}) : ($signed((8'h9c)) && {((8'hba) - (8'ha7))})) : (!($signed($unsigned(wire93)) ?
              $signed($signed(wire91)) : reg98))))
        begin
          reg101 <= ((!wire87[(1'h0):(1'h0)]) + (-($signed(reg97) ~^ $unsigned($unsigned(reg95)))));
        end
      else
        begin
          if (reg100[(1'h0):(1'h0)])
            begin
              reg101 <= {(({wire92} & $signed(reg101)) >>> reg101),
                  $unsigned($unsigned(wire92))};
              reg102 <= ((^~reg96) > {((((8'hb1) ? (8'hb9) : (8'hab)) ?
                      ((8'haf) ?
                          wire90 : (8'ha1)) : reg97[(5'h14):(5'h13)]) << wire93[(3'h7):(1'h1)]),
                  (^$unsigned($unsigned(wire89)))});
              reg103 <= reg102;
              reg104 <= (($signed((~^$unsigned((8'ha3)))) ?
                  $unsigned((+wire87)) : wire92) <<< reg96[(4'h9):(3'h7)]);
            end
          else
            begin
              reg101 <= $signed(wire88);
              reg102 <= reg104;
              reg103 <= wire91;
              reg104 <= reg96;
            end
          reg105 <= reg104;
          reg106 <= $unsigned(($unsigned(reg103[(3'h5):(1'h1)]) ?
              $unsigned((~^(wire92 == wire93))) : reg103));
          if ((!$unsigned(($unsigned($unsigned(reg100)) ?
              $unsigned((~reg103)) : (|(reg94 || (8'hb5)))))))
            begin
              reg107 <= (~$signed(reg105));
              reg108 <= $signed(reg101[(1'h1):(1'h1)]);
              reg109 <= (8'hb2);
              reg110 <= reg100;
              reg111 <= {($unsigned(reg103) - {$signed($signed(reg103))})};
            end
          else
            begin
              reg107 <= ({(~|$signed(wire89))} ?
                  {reg106,
                      $unsigned({reg104[(3'h4):(2'h2)],
                          $signed(reg102)})} : wire92);
              reg108 <= (((~|reg96[(5'h14):(4'hc)]) ?
                      reg101[(2'h3):(2'h3)] : (^(reg108 ?
                          (~&reg107) : (reg96 ? reg106 : reg111)))) ?
                  ($signed(($unsigned(wire87) == reg104)) ?
                      $signed((~^(reg96 >> reg105))) : (^~reg102)) : $unsigned($signed(reg95[(1'h1):(1'h1)])));
              reg109 <= (($signed(($signed(wire89) ?
                          {(8'ha2), reg97} : $unsigned(reg111))) ?
                      reg104[(1'h0):(1'h0)] : $unsigned({$signed((8'hbc))})) ?
                  {wire93, (8'ha6)} : reg98);
              reg110 <= $unsigned({($signed($signed(reg106)) ?
                      ((reg106 ? reg101 : wire91) ?
                          (reg106 ?
                              wire93 : reg101) : (reg104 > reg104)) : (~^reg101[(2'h2):(1'h0)]))});
            end
        end
      reg112 <= reg96[(4'ha):(3'h5)];
      reg113 <= $unsigned((wire89 - $signed(((wire92 ? wire88 : reg108) ?
          {reg108} : {(8'hbc)}))));
    end
  assign wire114 = wire90;
  assign wire115 = {(wire90 != reg103),
                       $signed($unsigned(reg107[(3'h6):(3'h4)]))};
  assign wire116 = ((reg100 * (((8'had) ? wire87 : (reg94 >>> reg109)) ?
                       reg107[(2'h3):(2'h3)] : $unsigned(reg101[(1'h0):(1'h0)]))) * (reg98 ?
                       wire114 : $unsigned(reg113)));
  assign wire117 = (reg108 ?
                       {(-(wire89[(2'h2):(2'h2)] << reg94[(4'ha):(4'ha)])),
                           $signed(((8'hb4) ?
                               (reg99 + wire89) : $unsigned(reg108)))} : reg113);
  assign wire118 = $unsigned($unsigned((($signed((8'ha3)) ?
                       (&wire88) : (reg99 ?
                           reg99 : wire92)) | ((|wire93) | wire87))));
  assign wire119 = (wire116 || (!(&reg112[(1'h0):(1'h0)])));
  assign wire120 = $signed(reg97[(3'h7):(3'h5)]);
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(3'h6):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire [(4'hc):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  assign y = {wire51,
                 wire50,
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
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire30 = ($signed(((8'hba) >> ($signed(wire28) ?
                      (|(8'hb0)) : wire25[(4'ha):(4'h9)]))) <<< $unsigned(($unsigned($signed(wire26)) | ((wire26 ?
                      wire26 : wire28) || (wire25 ? (8'had) : wire25)))));
  assign wire31 = (wire27 ? (8'hbf) : (|$signed(wire29[(1'h0):(1'h0)])));
  assign wire32 = $signed(wire26[(4'ha):(4'ha)]);
  assign wire33 = ({(wire26 ?
                              $unsigned({(8'h9f),
                                  wire27}) : $signed((^wire27)))} ?
                      {(&(8'ha9)),
                          $signed(wire32[(3'h6):(2'h2)])} : (~|$unsigned(((wire31 == wire25) ?
                          wire32[(1'h1):(1'h0)] : $unsigned(wire25)))));
  assign wire34 = (8'hb5);
  assign wire35 = ($signed(wire28) ?
                      (-$unsigned((~|(wire30 ?
                          wire27 : wire26)))) : $signed((wire34 ?
                          wire27[(4'ha):(1'h1)] : (wire34[(4'h8):(1'h1)] << (-wire30)))));
  assign wire36 = wire32;
  assign wire37 = (~wire31[(3'h4):(1'h0)]);
  assign wire38 = $unsigned($signed(($unsigned(wire28) ?
                      (wire36[(3'h7):(3'h4)] ?
                          (wire31 <<< (8'hab)) : (wire32 ~^ wire29)) : wire33[(4'hc):(4'ha)])));
  assign wire39 = $signed($unsigned(($signed(wire37) ?
                      ($signed((8'hb9)) ?
                          wire31 : (wire26 + wire38)) : $signed((^~wire32)))));
  assign wire40 = $signed((8'h9c));
  assign wire41 = (~|{$signed($signed({wire32})), wire30});
  assign wire42 = $signed((|wire33));
  assign wire43 = wire28;
  always
    @(posedge clk) begin
      reg44 <= wire25[(3'h7):(2'h2)];
      if ($signed($unsigned(wire26)))
        begin
          if (($signed(wire31[(3'h4):(2'h2)]) ? wire39 : (~^wire27)))
            begin
              reg45 <= ($signed($unsigned(wire35)) ?
                  (~&(^(wire41[(3'h7):(3'h5)] ?
                      (+wire34) : {wire31}))) : {{{wire33[(4'hb):(4'hb)]},
                          (8'had)},
                      (-($signed(wire38) || $signed(wire28)))});
              reg46 <= wire41[(3'h6):(1'h0)];
            end
          else
            begin
              reg45 <= wire38[(4'hd):(3'h4)];
              reg46 <= wire40[(2'h2):(2'h2)];
            end
          reg47 <= (($unsigned($signed(wire43[(3'h6):(2'h2)])) > $signed(reg45[(4'h8):(3'h6)])) ?
              (wire35 ?
                  (({wire39, (8'hae)} ?
                      wire43[(2'h3):(2'h2)] : $unsigned(wire43)) * ((~|wire27) ?
                      (wire43 ?
                          (8'hb5) : wire28) : wire35)) : ($signed($signed(reg45)) ~^ wire33)) : (+wire26));
        end
      else
        begin
          if ($unsigned(wire33[(4'hd):(3'h6)]))
            begin
              reg45 <= (wire27[(2'h2):(2'h2)] ?
                  $signed((~(+(wire43 > wire40)))) : wire37);
            end
          else
            begin
              reg45 <= wire35;
            end
          reg46 <= $signed({$unsigned((!wire29[(3'h4):(1'h1)]))});
        end
      reg48 <= $signed((^~wire37));
      reg49 <= (!((((wire34 ? wire32 : wire33) < $unsigned(wire26)) ?
              wire26 : reg45[(3'h6):(1'h1)]) ?
          wire28 : wire25[(4'ha):(2'h3)]));
    end
  assign wire50 = wire25;
  assign wire51 = ($signed(reg47) >= ($signed(wire39[(3'h6):(1'h0)]) ?
                      ($signed(wire41) ?
                          $signed((wire37 ? reg45 : wire35)) : ((wire42 ?
                              (8'had) : wire42) < (^~wire36))) : wire42));
endmodule
