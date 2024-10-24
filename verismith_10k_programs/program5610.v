module top
#(parameter param303 = ((&(~|((!(8'ha8)) >= ((8'h9e) ? (7'h42) : (8'hb4))))) ~^ {{{(~|(8'hb7))}, ({(8'hab)} && {(8'hba), (8'ha9)})}}), 
parameter param304 = ({((param303 | param303) ? {((8'hab) ^~ param303)} : param303)} - (^~param303)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire302;
  wire [(3'h7):(1'h0)] wire301;
  wire [(4'hd):(1'h0)] wire300;
  wire [(2'h3):(1'h0)] wire299;
  wire signed [(5'h14):(1'h0)] wire297;
  wire signed [(4'h8):(1'h0)] wire295;
  wire [(4'hc):(1'h0)] wire294;
  wire [(5'h11):(1'h0)] wire293;
  wire [(3'h6):(1'h0)] wire292;
  wire signed [(3'h7):(1'h0)] wire269;
  wire [(4'hd):(1'h0)] wire267;
  wire signed [(4'hb):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire155;
  wire [(4'hf):(1'h0)] wire153;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg291 = (1'h0);
  reg [(4'hf):(1'h0)] reg290 = (1'h0);
  reg [(5'h10):(1'h0)] reg289 = (1'h0);
  reg [(4'hd):(1'h0)] reg288 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg287 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg286 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg285 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg284 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg283 = (1'h0);
  reg [(4'h8):(1'h0)] reg282 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg281 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg280 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg279 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg278 = (1'h0);
  reg [(2'h2):(1'h0)] reg277 = (1'h0);
  reg [(4'hf):(1'h0)] reg276 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg275 = (1'h0);
  reg [(5'h10):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg273 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg272 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg271 = (1'h0);
  reg [(4'hd):(1'h0)] reg270 = (1'h0);
  assign y = {wire302,
                 wire301,
                 wire300,
                 wire299,
                 wire297,
                 wire295,
                 wire294,
                 wire293,
                 wire292,
                 wire269,
                 wire267,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire4,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 (1'h0)};
  assign wire4 = wire3;
  module5 #() modinst154 (wire153, clk, wire4, wire1, wire3, wire2);
  assign wire155 = $signed((8'ha9));
  assign wire156 = ($unsigned($unsigned($signed((wire153 < wire3)))) + (wire2[(4'h9):(3'h7)] ?
                       $signed($unsigned($signed(wire4))) : wire4[(2'h2):(2'h2)]));
  assign wire157 = wire4[(4'h9):(3'h5)];
  assign wire158 = $unsigned(((-wire3[(1'h0):(1'h0)]) ?
                       (~&wire3) : wire153[(4'h9):(3'h4)]));
  module159 #() modinst268 (wire267, clk, wire0, wire3, wire156, wire157);
  assign wire269 = {$unsigned((^(7'h41))),
                       ($unsigned($unsigned((^wire155))) >>> ((wire155[(2'h3):(1'h1)] ?
                               wire0 : {wire4, wire3}) ?
                           $unsigned($unsigned(wire3)) : $unsigned(wire153)))};
  always
    @(posedge clk) begin
      if ($unsigned(wire156))
        begin
          if (((($signed($signed(wire157)) >= (-wire158)) ?
                  wire156[(4'hb):(4'ha)] : wire3[(3'h7):(2'h2)]) ?
              $signed(wire1) : (&$unsigned(wire269))))
            begin
              reg270 <= wire3[(4'hb):(2'h2)];
              reg271 <= wire157;
              reg272 <= reg271;
            end
          else
            begin
              reg270 <= $signed($unsigned($unsigned((~|{wire153}))));
              reg271 <= wire153[(2'h3):(2'h3)];
              reg272 <= $unsigned((-$unsigned($signed({wire155, wire4}))));
              reg273 <= wire157;
              reg274 <= (+($unsigned({(+(8'hb0))}) - wire269[(1'h0):(1'h0)]));
            end
          if (((wire3[(3'h6):(3'h5)] ?
              (($unsigned(wire4) ? $signed(wire155) : reg270) ?
                  $unsigned($unsigned(wire156)) : $unsigned($signed(wire4))) : (~^wire2[(3'h5):(3'h5)])) << wire0[(4'hb):(1'h0)]))
            begin
              reg275 <= $unsigned(({((~^reg270) ^ (reg270 ?
                          (8'hb6) : wire153))} ?
                  (~(wire3[(3'h5):(1'h1)] ?
                      (wire156 ?
                          wire158 : (7'h44)) : wire153)) : wire2[(2'h2):(1'h1)]));
              reg276 <= (wire269[(3'h7):(3'h5)] ?
                  {wire269} : (($unsigned((8'hb5)) ^ {{wire4, (7'h43)},
                      (8'hb8)}) && wire267[(4'hd):(4'h9)]));
              reg277 <= (8'ha4);
              reg278 <= (^(reg273 << (+((~&reg275) ?
                  reg274[(3'h7):(2'h3)] : wire156[(4'hf):(3'h6)]))));
              reg279 <= ((wire155[(5'h11):(2'h3)] >>> reg277) ?
                  ((8'ha5) ?
                      {$signed((^wire153)),
                          ($signed(reg276) != (wire158 ~^ wire153))} : (|wire155)) : (~^(8'hb6)));
            end
          else
            begin
              reg275 <= $unsigned(((~|(^(+(7'h41)))) ?
                  wire269[(3'h6):(1'h0)] : (-wire269[(3'h6):(2'h2)])));
              reg276 <= {(8'hbf), (~$unsigned($signed($signed(wire269))))};
            end
          reg280 <= $signed({$signed(wire2), $signed(reg273)});
        end
      else
        begin
          reg270 <= wire153;
          if (((reg273 ?
              reg273 : $signed($unsigned(reg274[(3'h4):(2'h2)]))) >= (~|(~&((reg275 == reg277) >= wire1[(1'h1):(1'h0)])))))
            begin
              reg271 <= $signed(({(&$signed(wire267))} | (8'hbc)));
            end
          else
            begin
              reg271 <= (+wire153[(4'hc):(4'ha)]);
              reg272 <= reg279[(1'h0):(1'h0)];
            end
          reg273 <= ($signed($signed(wire3)) ?
              $unsigned((reg273[(1'h0):(1'h0)] ?
                  (wire155[(3'h6):(3'h4)] ?
                      (wire267 < (8'ha3)) : $signed(wire4)) : ($signed(wire158) >>> (reg275 ?
                      (8'h9c) : reg271)))) : $signed($unsigned((reg275 ?
                  (reg280 * wire153) : (reg274 ? reg280 : wire269)))));
        end
      if ({reg273,
          ($unsigned((|reg278[(5'h14):(4'ha)])) ?
              (wire269 >>> (8'hb0)) : wire269)})
        begin
          reg281 <= $signed(reg276);
          if (($signed($unsigned(wire269[(3'h7):(1'h1)])) ?
              reg279[(1'h0):(1'h0)] : reg281))
            begin
              reg282 <= (wire155[(3'h7):(3'h7)] ?
                  reg274[(3'h4):(2'h3)] : (^(!$unsigned((wire157 ?
                      reg276 : wire153)))));
              reg283 <= (~((8'h9f) ? reg279[(1'h0):(1'h0)] : (!(+(-wire155)))));
              reg284 <= wire1;
            end
          else
            begin
              reg282 <= ($unsigned({$signed(((8'ha5) * reg281)),
                      ((-wire157) ? (~|wire267) : reg272[(1'h0):(1'h0)])}) ?
                  (wire2 ?
                      (|(~(8'h9d))) : ((7'h42) ?
                          (wire267[(3'h5):(3'h5)] ?
                              (reg278 ?
                                  wire2 : reg274) : wire158[(3'h6):(2'h3)]) : wire4)) : (|((wire158[(2'h3):(2'h2)] >> (^~wire157)) & reg284)));
              reg283 <= $signed((reg279[(1'h0):(1'h0)] ?
                  (~^wire155[(4'hf):(2'h3)]) : $unsigned((~^$signed(reg283)))));
              reg284 <= {(~^$signed({$signed(wire269)})),
                  $unsigned($signed(((reg283 <= reg280) <<< (reg277 & reg270))))};
              reg285 <= wire0[(3'h5):(1'h0)];
            end
          if ($unsigned(((~|(((8'hb4) << wire155) ?
                  {(8'hbd)} : (wire153 && reg270))) ?
              $signed((+(reg273 ? (7'h44) : reg281))) : wire269)))
            begin
              reg286 <= ($signed(reg285[(3'h7):(3'h7)]) && {$unsigned(reg284),
                  (8'hbc)});
              reg287 <= ((wire1 ?
                      ((^$signed(wire0)) ?
                          $unsigned($unsigned((8'hb5))) : reg277) : reg283[(3'h4):(1'h0)]) ?
                  {(-$unsigned($signed(wire269)))} : (8'hba));
            end
          else
            begin
              reg286 <= (8'ha1);
            end
          if (($signed($unsigned((^~(reg282 ? reg279 : reg281)))) ?
              ($signed(wire3[(5'h11):(5'h11)]) ?
                  (reg270[(1'h0):(1'h0)] ?
                      $signed((~^reg273)) : $signed({wire3,
                          reg277})) : $signed(($unsigned(wire157) ?
                      (^~wire269) : reg280))) : {(wire269[(1'h1):(1'h0)] ?
                      $signed($signed(reg272)) : (~|$signed((8'ha8)))),
                  (~|reg276[(3'h5):(1'h0)])}))
            begin
              reg288 <= reg279[(1'h0):(1'h0)];
              reg289 <= (reg278 ?
                  (reg272[(1'h0):(1'h0)] ?
                      reg270 : ({(~reg273)} + (!(reg280 ?
                          reg280 : reg271)))) : (+reg274[(3'h5):(2'h2)]));
            end
          else
            begin
              reg288 <= ($unsigned(reg286) ?
                  {wire269[(3'h6):(2'h3)]} : $unsigned($unsigned(($signed(reg274) + $unsigned(wire156)))));
              reg289 <= $signed(reg286);
              reg290 <= $unsigned(wire153[(4'hc):(3'h4)]);
              reg291 <= (&({wire269[(1'h0):(1'h0)]} ? (8'ha6) : reg271));
            end
        end
      else
        begin
          reg281 <= wire2;
        end
    end
  assign wire292 = wire4;
  assign wire293 = $signed((|(!($unsigned(reg275) >= reg291))));
  assign wire294 = ($signed((reg272 - ((reg282 ? wire269 : reg274) ?
                       ((8'hbd) ^~ reg276) : (~^wire3)))) && (reg271 && {($unsigned(wire267) >> (wire158 ?
                           reg272 : reg286)),
                       (|$signed(wire293))}));
  module10 #() modinst296 (wire295, clk, reg275, wire293, reg273, wire153, reg286);
  module10 #() modinst298 (wire297, clk, wire155, wire2, reg289, reg290, reg291);
  assign wire299 = $signed($unsigned(wire269[(2'h3):(2'h2)]));
  assign wire300 = (wire155[(4'h8):(3'h5)] >>> wire3);
  assign wire301 = wire299[(1'h1):(1'h1)];
  assign wire302 = ((((&wire4[(4'h9):(2'h2)]) ?
                               (reg279 ?
                                   reg285 : (wire299 ?
                                       wire299 : reg289)) : (((7'h40) || (8'hb5)) || (wire269 >> reg278))) ?
                           $signed($unsigned($signed((8'hbf)))) : $signed({$unsigned(reg277),
                               $signed((8'hb9))})) ?
                       $signed(reg291) : $unsigned($unsigned((reg276 ?
                           (~^reg274) : (wire157 ~^ wire292)))));
endmodule

module module159
#(parameter param265 = (~^{((~(7'h40)) ? (((7'h41) ? (8'hbf) : (8'hb8)) <<< ((8'hba) == (8'hae))) : {(^(8'hb7)), (^~(8'hb4))}), ({((8'ha9) ? (8'had) : (8'haa))} > (&((8'ha7) ? (8'hb4) : (8'had))))}), 
parameter param266 = (|({(8'hbc)} ? (+param265) : {(~&param265), (+(+param265))})))
(y, clk, wire160, wire161, wire162, wire163);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire160;
  input wire [(5'h14):(1'h0)] wire161;
  input wire signed [(5'h10):(1'h0)] wire162;
  input wire signed [(4'he):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire263;
  wire [(3'h6):(1'h0)] wire233;
  wire signed [(5'h12):(1'h0)] wire232;
  wire signed [(4'h8):(1'h0)] wire164;
  wire signed [(4'h8):(1'h0)] wire165;
  wire signed [(4'hf):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire167;
  wire signed [(5'h15):(1'h0)] wire168;
  wire signed [(4'hc):(1'h0)] wire199;
  wire signed [(5'h11):(1'h0)] wire201;
  wire [(4'hd):(1'h0)] wire217;
  reg [(4'ha):(1'h0)] reg231 = (1'h0);
  reg [(4'h9):(1'h0)] reg230 = (1'h0);
  reg [(5'h15):(1'h0)] reg229 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg228 = (1'h0);
  reg [(5'h14):(1'h0)] reg227 = (1'h0);
  reg [(4'he):(1'h0)] reg226 = (1'h0);
  reg [(4'hd):(1'h0)] reg225 = (1'h0);
  reg [(2'h3):(1'h0)] reg224 = (1'h0);
  reg [(5'h11):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg220 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg219 = (1'h0);
  reg [(4'h9):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  assign y = {wire263,
                 wire233,
                 wire232,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
                 wire199,
                 wire201,
                 wire217,
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
                 reg170,
                 reg169,
                 (1'h0)};
  assign wire164 = (wire160 <<< $signed($signed($signed($unsigned(wire163)))));
  assign wire165 = $signed({{((~|wire161) >>> $signed((8'h9c)))}, (+(8'hb6))});
  assign wire166 = (-{$signed(wire163), wire163});
  assign wire167 = (({{$signed(wire163), (~|(8'ha9))}} + $signed((7'h41))) ?
                       wire160 : $signed((|($unsigned(wire160) ?
                           $unsigned(wire165) : wire163))));
  assign wire168 = $signed((|wire166));
  always
    @(posedge clk) begin
      if (wire162)
        begin
          reg169 <= {{wire166, (^{wire164[(3'h4):(1'h0)], wire160})}};
        end
      else
        begin
          reg169 <= $unsigned(wire168[(4'hc):(3'h6)]);
          reg170 <= wire167[(1'h0):(1'h0)];
        end
    end
  module171 #() modinst200 (wire199, clk, wire162, wire167, wire163, wire161);
  assign wire201 = reg169[(2'h2):(2'h2)];
  module202 #() modinst218 (.wire207(wire162), .clk(clk), .wire205(wire166), .wire206(wire201), .wire204(wire161), .y(wire217), .wire203(wire167));
  always
    @(posedge clk) begin
      reg219 <= wire165[(3'h4):(1'h1)];
      if (wire166[(1'h0):(1'h0)])
        begin
          reg220 <= ((&((|(wire165 > wire165)) ^ $signed($unsigned(reg169)))) ?
              (reg170 ?
                  wire165 : (($signed(wire166) ?
                      reg169[(3'h4):(1'h0)] : (wire163 ?
                          wire164 : (8'haf))) >>> {$signed(wire201)})) : (reg219[(3'h4):(1'h1)] >= (wire164 ?
                  $unsigned(wire163[(4'h9):(1'h1)]) : (~wire163[(2'h2):(1'h1)]))));
          reg221 <= $signed({(reg220[(1'h0):(1'h0)] != wire161[(4'hc):(3'h5)])});
          reg222 <= (reg220[(2'h2):(1'h0)] ?
              $signed((-reg170)) : $unsigned(wire163));
          reg223 <= ((((^~wire167) * (^$signed(wire168))) <= $unsigned(wire162[(4'hd):(4'hb)])) ?
              (-({reg222} ?
                  $unsigned((wire165 ?
                      wire161 : wire163)) : wire163[(3'h7):(2'h3)])) : (~^($unsigned($unsigned(reg220)) + wire164)));
        end
      else
        begin
          reg220 <= (!(($unsigned($signed(wire164)) ?
              (&(|wire164)) : (~&wire201[(4'he):(3'h7)])) > (reg223 ?
              $signed((reg219 <<< wire166)) : (~$unsigned(wire161)))));
        end
      reg224 <= ($unsigned((~|(wire217[(3'h5):(3'h4)] ?
              reg170 : ((8'hac) + wire164)))) ?
          (reg222[(3'h5):(1'h0)] <<< $unsigned((reg223[(5'h11):(5'h10)] ?
              (+reg219) : reg169[(4'h9):(1'h1)]))) : (&(8'haf)));
      if (wire164)
        begin
          reg225 <= {$signed(($unsigned($unsigned(reg222)) ?
                  wire168 : (wire162[(4'h8):(2'h2)] ^~ (wire199 && wire162)))),
              wire162[(4'hb):(2'h2)]};
          if ((~^reg224))
            begin
              reg226 <= wire167[(4'hb):(1'h0)];
            end
          else
            begin
              reg226 <= reg221[(1'h1):(1'h1)];
              reg227 <= ($unsigned(((!reg170) << (((8'ha6) >= reg226) - wire162))) >>> (^$unsigned($unsigned(((7'h44) ?
                  wire164 : wire164)))));
              reg228 <= (+{$signed($signed($signed(wire163)))});
              reg229 <= ((~&reg220) ?
                  ($signed($unsigned($signed(reg221))) < (wire165 ?
                      $unsigned(reg222) : (~&{wire166, wire199}))) : reg221);
            end
          reg230 <= wire166[(4'hd):(2'h3)];
        end
      else
        begin
          reg225 <= reg230[(1'h1):(1'h0)];
          if (reg228)
            begin
              reg226 <= reg230;
              reg227 <= $signed((((~^$signed(wire201)) ?
                      reg224[(1'h1):(1'h0)] : $unsigned((reg230 ?
                          (8'hbc) : wire199))) ?
                  ((wire165 ?
                      ((8'hb1) ?
                          wire166 : reg221) : reg222[(1'h1):(1'h0)]) - wire167[(4'hf):(4'hf)]) : $signed({(wire166 < reg222)})));
              reg228 <= ($signed($signed((|(reg226 ?
                  reg169 : wire160)))) ^ {(~^(~|$signed(reg226))),
                  $unsigned({wire165[(2'h2):(1'h1)], (reg170 * (8'hb7))})});
            end
          else
            begin
              reg226 <= $unsigned((~wire199));
              reg227 <= wire166;
              reg228 <= ($signed({reg222[(1'h1):(1'h1)], $signed((&(7'h44)))}) ?
                  (reg223 ?
                      wire166 : reg224[(2'h3):(1'h0)]) : $signed(((reg223 ?
                          wire201[(2'h3):(1'h1)] : $unsigned((8'hbf))) ?
                      reg222 : ($unsigned((8'hb1)) ? reg223 : wire199))));
              reg229 <= reg170;
            end
        end
      reg231 <= (-$unsigned($unsigned((wire168[(1'h0):(1'h0)] ?
          $unsigned(wire160) : wire166[(4'hd):(2'h2)]))));
    end
  assign wire232 = (!(+reg222[(1'h1):(1'h1)]));
  assign wire233 = $unsigned(reg170);
  module234 #() modinst264 (wire263, clk, reg219, reg231, wire232, wire168);
endmodule

module module5
#(parameter param152 = ((({((8'hb1) ? (7'h44) : (8'hb7)), ((8'ha1) >>> (8'hbd))} <<< ((~|(8'hbe)) ? {(8'h9c), (8'h9d)} : ((8'ha2) || (8'hae)))) ? (7'h41) : (((~(7'h44)) || ((7'h44) >= (8'hb0))) ? ((~|(8'hb0)) + (^(8'haf))) : (((8'hb0) ? (8'hb0) : (8'ha0)) ? (^~(8'hb0)) : {(8'ha4), (8'hba)}))) <= {(~^{{(8'h9c), (8'hb4)}, ((8'haf) ? (8'hb4) : (8'hbf))}), {(^{(8'h9d), (8'hbd)}), {(-(8'hb7)), ((8'hb2) & (8'ha9))}}}))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire145;
  wire signed [(4'hb):(1'h0)] wire144;
  wire [(5'h13):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire140;
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(2'h2):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire66,
                 wire110,
                 wire112,
                 wire113,
                 wire114,
                 wire140,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  module10 #() modinst67 (wire66, clk, wire6, wire7, wire9, wire8, (8'haa));
  module68 #() modinst111 (.wire70(wire66), .wire69(wire8), .y(wire110), .wire71(wire6), .wire72(wire7), .clk(clk));
  assign wire112 = {((wire7[(4'hc):(3'h5)] >> wire6) ?
                           wire9[(4'h8):(2'h2)] : wire66),
                       $signed($unsigned($signed((~wire6))))};
  assign wire113 = wire9[(3'h4):(1'h1)];
  assign wire114 = (wire113[(3'h5):(3'h4)] || {$signed((+$unsigned(wire6)))});
  module115 #() modinst141 (.wire118(wire7), .wire117(wire112), .wire120(wire114), .wire116(wire113), .wire119(wire6), .y(wire140), .clk(clk));
  assign wire142 = (|(wire9 ?
                       $unsigned(wire9[(4'hc):(4'hc)]) : ((~&$signed((8'hb6))) >> $signed($unsigned(wire114)))));
  assign wire143 = wire113;
  assign wire144 = $signed($signed((^~$signed((wire113 && (8'ha2))))));
  assign wire145 = wire110[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg146 <= ($signed($unsigned(wire143)) ?
          ({(+{wire9}), (^~{(7'h42), wire112})} <= $signed(((wire6 ?
                  wire143 : wire66) ?
              wire140[(2'h2):(1'h1)] : wire7[(3'h7):(1'h0)]))) : wire140);
      if ({$unsigned((!((reg146 ? wire6 : wire6) > $unsigned((8'ha2)))))})
        begin
          reg147 <= (wire112[(2'h2):(2'h2)] ^ wire7);
          if (wire112)
            begin
              reg148 <= wire142;
            end
          else
            begin
              reg148 <= wire8[(1'h1):(1'h0)];
              reg149 <= {wire143, (^wire113)};
            end
          reg150 <= wire110;
        end
      else
        begin
          reg147 <= (~(($unsigned((reg149 && (8'hab))) == $unsigned((wire6 & (8'ha7)))) ?
              wire7[(5'h10):(4'h9)] : wire145));
        end
      reg151 <= reg149;
    end
endmodule

module module115  (y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire120;
  input wire signed [(4'hf):(1'h0)] wire119;
  input wire [(3'h7):(1'h0)] wire118;
  input wire signed [(5'h13):(1'h0)] wire117;
  input wire signed [(4'ha):(1'h0)] wire116;
  wire [(4'hc):(1'h0)] wire139;
  wire [(3'h4):(1'h0)] wire138;
  wire [(4'hf):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire121;
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire121,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire121 = wire116;
  always
    @(posedge clk) begin
      if ((8'hab))
        begin
          if ((($signed($unsigned((^wire118))) ^ (($signed(wire120) ?
                      (wire118 ? (8'had) : wire116) : wire120[(1'h0):(1'h0)]) ?
                  $signed($unsigned(wire119)) : $unsigned((wire120 ?
                      wire118 : wire118)))) ?
              wire121 : $unsigned(((~^(8'h9d)) ?
                  $unsigned((!wire120)) : wire117[(4'hd):(4'hb)]))))
            begin
              reg122 <= ($unsigned(wire121[(5'h11):(1'h1)]) ?
                  ($unsigned(($unsigned(wire116) ?
                          ((7'h41) && wire117) : ((8'ha4) | wire119))) ?
                      (^$unsigned((~(8'h9f)))) : $unsigned(wire119)) : (^~$unsigned(wire119)));
              reg123 <= ((wire118[(3'h4):(2'h2)] ?
                  $unsigned($signed(reg122[(1'h0):(1'h0)])) : (+(wire117 >= $unsigned(wire118)))) && $signed((8'hac)));
              reg124 <= wire116[(4'ha):(2'h3)];
              reg125 <= $unsigned(({($signed((8'hb9)) >> $unsigned(wire117)),
                      ($unsigned((8'h9e)) ?
                          $unsigned(wire118) : $unsigned(wire116))} ?
                  $unsigned($signed(reg123[(1'h0):(1'h0)])) : wire121[(4'h9):(3'h5)]));
            end
          else
            begin
              reg122 <= ({$unsigned($unsigned((wire118 ~^ wire119)))} <= reg125[(2'h2):(2'h2)]);
              reg123 <= reg124;
              reg124 <= $unsigned($unsigned((wire117 >> $signed($signed(wire121)))));
              reg125 <= $signed(((!(wire120 ~^ wire121[(4'hc):(3'h4)])) ?
                  (reg122 ?
                      {$signed(wire116),
                          (^~reg122)} : $signed($signed(reg125))) : $unsigned((wire118[(2'h2):(1'h0)] ?
                      (reg125 <= reg125) : (wire120 ? wire117 : (8'haf))))));
              reg126 <= $signed($signed(wire121[(4'h8):(3'h7)]));
            end
          reg127 <= ((-$unsigned((^((8'hbc) ? wire120 : (7'h41))))) ?
              wire120 : (($unsigned($signed(wire119)) && ({wire117} ?
                      $signed(reg126) : $signed(reg124))) ?
                  $signed(reg123[(1'h0):(1'h0)]) : reg123));
        end
      else
        begin
          reg122 <= reg123[(2'h3):(2'h3)];
          reg123 <= reg127[(1'h0):(1'h0)];
          reg124 <= ($unsigned((($signed(reg124) ?
                  ((7'h44) | wire116) : $signed((8'hb1))) ?
              ((~(8'hb6)) ?
                  reg123[(3'h5):(3'h4)] : (wire118 ?
                      reg123 : wire117)) : ((reg126 ^~ wire121) ?
                  {wire121} : (reg123 <<< reg124)))) + wire119);
          reg125 <= wire121;
        end
    end
  assign wire128 = (~^reg125[(3'h4):(1'h1)]);
  assign wire129 = reg123[(3'h7):(2'h3)];
  assign wire130 = wire128[(4'ha):(2'h2)];
  assign wire131 = reg123[(3'h4):(1'h1)];
  assign wire132 = $unsigned((wire128 ?
                       wire117 : ((wire129 & (8'hbf)) ?
                           (wire119 ?
                               $unsigned((8'ha5)) : $signed(wire131)) : $unsigned(wire128))));
  assign wire133 = wire128[(4'ha):(2'h3)];
  assign wire134 = $signed((&{$signed((reg122 ? reg127 : (8'hab)))}));
  assign wire135 = wire133[(4'hb):(3'h7)];
  assign wire136 = (-(wire135[(4'ha):(3'h5)] ^ $signed((reg124 <<< reg126[(2'h2):(2'h2)]))));
  assign wire137 = wire130[(3'h4):(1'h0)];
  assign wire138 = $unsigned((~(~&(wire136 >= wire129[(3'h5):(1'h0)]))));
  assign wire139 = $unsigned({(^~({wire130, wire133} ?
                           $unsigned((8'ha6)) : (wire129 <= wire117))),
                       reg126[(4'h8):(3'h6)]});
endmodule

module module68
#(parameter param108 = (8'ha6), 
parameter param109 = param108)
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire72;
  input wire signed [(5'h11):(1'h0)] wire71;
  input wire [(3'h6):(1'h0)] wire70;
  input wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(5'h12):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire73;
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire73,
                 reg107,
                 reg106,
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
                 (1'h0)};
  assign wire73 = wire69[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg74 <= (((({(8'haa),
                  (8'hb4)} - $unsigned((8'hb0))) ^ {wire73[(1'h1):(1'h1)]}) ?
              $unsigned({$unsigned(wire71)}) : $unsigned(wire69)) ?
          {(wire72[(2'h2):(2'h2)] > $signed({wire72}))} : wire69[(1'h1):(1'h1)]);
      if ((({(wire72[(1'h1):(1'h1)] < $unsigned(wire69)),
              (wire69[(1'h0):(1'h0)] ? $signed(wire72) : (wire72 | wire71))} ?
          $signed({wire70}) : $unsigned($signed(reg74))) + ((wire71 <<< wire70[(2'h3):(1'h0)]) | (wire69[(1'h1):(1'h0)] & wire69[(3'h4):(1'h1)]))))
        begin
          reg75 <= wire71[(5'h11):(3'h7)];
        end
      else
        begin
          reg75 <= $signed((^~reg75[(3'h5):(2'h3)]));
          reg76 <= wire72;
          if ((8'hbb))
            begin
              reg77 <= {(({wire71[(5'h11):(3'h5)], (~^wire72)} ?
                          ($signed(wire69) ?
                              $signed(reg76) : $signed(wire69)) : $unsigned($signed(reg76))) ?
                      reg76[(1'h0):(1'h0)] : reg75),
                  $unsigned((8'hb4))};
              reg78 <= $signed($unsigned({((wire72 == wire70) ?
                      reg75[(3'h4):(1'h1)] : wire70[(2'h2):(1'h0)])}));
              reg79 <= {reg78};
              reg80 <= reg78[(1'h0):(1'h0)];
            end
          else
            begin
              reg77 <= {reg77[(2'h2):(1'h0)], wire69[(1'h0):(1'h0)]};
            end
          reg81 <= $signed(reg76);
          reg82 <= (reg77[(2'h2):(1'h0)] >= $unsigned((&$unsigned(reg81))));
        end
      reg83 <= ((~&$unsigned(reg74[(3'h4):(2'h3)])) <<< $signed($signed(wire72)));
      if ($unsigned($unsigned($unsigned(($signed((8'hb2)) ?
          $unsigned((8'hb2)) : (!reg78))))))
        begin
          reg84 <= ((reg76 ?
                  (^~$unsigned((reg77 <= wire73))) : wire72[(3'h4):(2'h3)]) ?
              $signed($unsigned(wire72)) : reg81);
          reg85 <= $unsigned((-(8'ha0)));
          reg86 <= ($unsigned($unsigned($signed((reg76 <= reg78)))) ?
              reg83 : reg85[(1'h0):(1'h0)]);
          reg87 <= reg76[(3'h4):(1'h0)];
          reg88 <= ($signed(reg80[(1'h0):(1'h0)]) ^ $unsigned(wire73[(2'h2):(1'h1)]));
        end
      else
        begin
          reg84 <= $unsigned((^~$unsigned({$signed(reg74)})));
          reg85 <= $unsigned(reg77);
          reg86 <= {($signed($unsigned((reg82 >= wire73))) + $unsigned(((-reg77) || (~|reg87)))),
              ($unsigned((^(8'ha2))) >>> reg77)};
          reg87 <= reg82[(1'h0):(1'h0)];
          if (wire73[(2'h2):(2'h2)])
            begin
              reg88 <= (+reg79[(3'h6):(3'h5)]);
            end
          else
            begin
              reg88 <= wire72;
              reg89 <= (~wire69[(2'h3):(1'h1)]);
              reg90 <= ((8'hae) ? (8'hac) : $signed((~&((~|reg76) <<< reg84))));
              reg91 <= {reg78[(3'h5):(2'h3)]};
            end
        end
      reg92 <= (^~($unsigned($unsigned((&reg85))) * ($unsigned((^(8'hb7))) ?
          $signed(reg90) : wire70[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg93 <= ($unsigned($signed(({reg92,
          (7'h44)} ^~ $unsigned(reg76)))) << reg81);
    end
  always
    @(posedge clk) begin
      if ({(+((((8'hbc) + reg86) << (reg85 ?
              reg92 : (8'ha1))) & $unsigned($signed(reg75))))})
        begin
          reg94 <= (((+$signed((reg90 ? reg85 : reg80))) == (+((wire72 ?
                  reg80 : wire72) ?
              ((7'h41) ?
                  reg89 : wire73) : $signed(reg86)))) - reg84[(2'h2):(2'h2)]);
          reg95 <= $unsigned((reg78[(3'h5):(3'h5)] >>> (8'ha3)));
          reg96 <= (8'ha2);
          reg97 <= $signed(reg96[(4'ha):(3'h7)]);
          reg98 <= $unsigned($unsigned(($unsigned((reg76 - (8'ha2))) ?
              $unsigned((reg83 ? reg81 : reg79)) : (~^reg81))));
        end
      else
        begin
          reg94 <= $unsigned(({reg77[(2'h2):(1'h0)],
              (&{reg83, reg83})} < $signed($unsigned((reg93 ?
              reg94 : reg74)))));
          if (reg75[(1'h0):(1'h0)])
            begin
              reg95 <= $unsigned({reg95, $unsigned(reg86)});
              reg96 <= ({((!(^reg85)) >= ($unsigned(reg94) ~^ (~^(8'hae)))),
                      ({(+reg79), $signed(reg94)} ?
                          (!$unsigned(reg77)) : (^~{reg75}))} ?
                  (^~reg78[(1'h0):(1'h0)]) : $unsigned((+wire72[(2'h2):(1'h1)])));
              reg97 <= $signed(reg88);
              reg98 <= reg77;
            end
          else
            begin
              reg95 <= ($signed($signed((|(7'h41)))) ?
                  (($signed((reg80 ? reg88 : (8'hbe))) <= (~&(reg92 ?
                      reg75 : reg84))) == ((~|reg87[(3'h4):(1'h1)]) >>> (+$signed(reg74)))) : $signed((reg91 == $unsigned(reg81))));
            end
        end
      reg99 <= reg90[(3'h7):(1'h1)];
    end
  assign wire100 = $unsigned((-({wire73[(1'h0):(1'h0)],
                       (wire73 ? reg77 : reg83)} >= ({reg80} ?
                       (reg77 && reg86) : $unsigned(reg75)))));
  assign wire101 = (-$unsigned(wire72[(1'h0):(1'h0)]));
  assign wire102 = (wire72[(1'h0):(1'h0)] ?
                       ($unsigned(((~&reg87) || reg79)) ?
                           wire100[(1'h1):(1'h1)] : ((|wire100) ?
                               {{reg84, reg82},
                                   reg76[(4'ha):(4'h9)]} : $unsigned(reg78))) : $unsigned(((!$signed(reg95)) | wire69[(3'h5):(1'h0)])));
  assign wire103 = $signed({{$signed($unsigned(reg89))},
                       {((8'hb5) ? $signed(reg90) : $unsigned(wire102))}});
  assign wire104 = reg80[(1'h1):(1'h0)];
  assign wire105 = $unsigned((reg94 ?
                       $unsigned({(wire103 ^ (8'had))}) : wire104[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      reg106 <= (!$unsigned((reg80[(1'h0):(1'h0)] ?
          (reg80 || (reg97 & reg93)) : wire71[(1'h1):(1'h0)])));
      reg107 <= (($signed({$signed(wire73)}) * $signed(((&reg96) != $unsigned((7'h44))))) ?
          (reg94 ?
              wire73 : ((8'ha1) >> reg82[(4'h9):(4'h9)])) : reg88[(2'h2):(1'h0)]);
    end
endmodule

module module10
#(parameter param65 = ((^~(~((~(8'hbe)) < ((8'hb3) >= (8'ha3))))) ? (^(8'hbb)) : (((((7'h44) ? (8'ha1) : (7'h40)) ? (~(7'h41)) : ((8'ha1) * (8'hab))) < {((8'ha0) ? (8'haf) : (8'hb8)), ((8'hab) ~^ (8'hbc))}) ? {(~&(^(8'hb2)))} : {(!((8'hbe) - (8'ha1)))})))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h281):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  assign y = {wire64,
                 wire60,
                 wire59,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg63,
                 reg62,
                 reg61,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 reg27,
                 reg26,
                 reg25,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire16 = (&wire14);
  assign wire17 = (&(+$signed((wire12 >= $unsigned(wire15)))));
  assign wire18 = wire11[(3'h4):(2'h2)];
  assign wire19 = ($signed((!((wire11 ? (8'ha9) : wire15) ?
                          $signed(wire14) : wire17[(4'h9):(1'h1)]))) ?
                      wire13 : ((wire12 | (!(~wire18))) ^ (7'h40)));
  always
    @(posedge clk) begin
      reg20 <= $unsigned(wire11);
      reg21 <= ($unsigned($unsigned((~^(&wire17)))) | wire14);
      reg22 <= wire19[(1'h0):(1'h0)];
    end
  assign wire23 = (wire18[(3'h5):(1'h1)] && {{(~|((7'h41) < wire13)),
                          ($unsigned((8'hb5)) ?
                              wire18[(3'h7):(3'h6)] : wire16)},
                      (wire17 ?
                          ($unsigned(wire12) >>> (-(8'ha7))) : wire13[(2'h2):(2'h2)])});
  assign wire24 = $unsigned((&wire18));
  always
    @(posedge clk) begin
      reg25 <= (~|$unsigned($signed(((wire24 ? wire24 : reg21) ?
          (wire16 ^ wire18) : (wire11 - wire13)))));
      reg26 <= (8'hbd);
      if ((+{(($signed(wire13) <<< (reg26 <= wire23)) == ((wire15 ?
              wire13 : wire11) <= (wire14 * reg22))),
          $unsigned(wire16[(3'h4):(1'h1)])}))
        begin
          reg27 <= wire11;
          reg28 <= {(^~$unsigned((+$unsigned(wire15))))};
          if ((!{(|(-wire14)), wire23[(5'h13):(5'h10)]}))
            begin
              reg29 <= (&((~&$unsigned({(8'ha1), reg25})) ?
                  {((wire24 + wire11) - (^~(7'h43))),
                      wire11[(4'h9):(3'h4)]} : $unsigned(reg27)));
            end
          else
            begin
              reg29 <= ({wire17, reg26} ?
                  wire12 : $signed($unsigned($unsigned((wire24 ?
                      reg27 : (8'hbf))))));
              reg30 <= $signed(((((reg28 - reg21) * (wire15 ^ (8'ha6))) - $signed(((8'hb8) || reg20))) || $unsigned($unsigned((8'ha8)))));
              reg31 <= reg28;
              reg32 <= $unsigned(wire23[(5'h11):(1'h0)]);
              reg33 <= $unsigned($unsigned($unsigned($signed(reg20))));
            end
          reg34 <= ($unsigned(reg33[(4'hd):(2'h2)]) >> $signed({reg33[(3'h6):(3'h6)],
              reg28}));
          if ((reg32[(4'ha):(4'h8)] ?
              ({reg26} ?
                  (-(8'ha1)) : {$unsigned((wire23 >= wire13))}) : (({(+wire24),
                  wire11} + wire11) < ($signed($signed(reg34)) >> ((reg29 <<< wire14) ?
                  $unsigned(reg22) : ((8'hac) ? wire19 : reg31))))))
            begin
              reg35 <= $unsigned($signed(reg34[(5'h12):(3'h6)]));
            end
          else
            begin
              reg35 <= ((wire16[(2'h2):(2'h2)] ?
                  ((&$signed((8'hba))) ?
                      $signed(wire23) : $signed($signed(wire18))) : $unsigned($unsigned({reg33,
                      (7'h42)}))) & (reg33[(3'h6):(2'h2)] ?
                  (~$unsigned(wire19)) : reg34));
              reg36 <= reg31[(1'h1):(1'h0)];
              reg37 <= wire23[(4'hf):(4'h8)];
              reg38 <= wire19[(4'he):(3'h5)];
            end
        end
      else
        begin
          reg27 <= reg30[(1'h1):(1'h1)];
          reg28 <= {reg31[(1'h1):(1'h0)], $unsigned(wire18)};
          reg29 <= (!$unsigned({((reg35 ? reg20 : reg26) ?
                  {reg20} : $signed(wire19)),
              {reg32[(3'h7):(3'h4)]}}));
          reg30 <= reg27[(3'h5):(1'h1)];
          reg31 <= (reg34[(2'h2):(2'h2)] ?
              ((+((8'haa) | (8'hb0))) ^ reg33) : reg22);
        end
    end
  always
    @(posedge clk) begin
      if (((($unsigned((reg38 ? wire13 : wire23)) ?
                  (^{reg37}) : wire16[(1'h0):(1'h0)]) ?
              wire12[(4'ha):(4'h8)] : (((~wire18) ?
                  reg20 : (wire11 >= wire17)) + $signed($signed(wire18)))) ?
          reg33[(4'hf):(4'h8)] : (-$unsigned((!$unsigned(reg30))))))
        begin
          reg39 <= $signed(reg30);
          reg40 <= ((reg22[(5'h14):(1'h0)] & $unsigned($signed((wire14 ?
                  wire12 : wire15)))) ?
              reg39[(4'he):(4'hc)] : wire19);
          reg41 <= {(~^(~^(reg29[(1'h1):(1'h0)] ? (!reg28) : $signed(wire16)))),
              {wire18[(3'h4):(2'h2)]}};
          reg42 <= $unsigned(({((8'hb7) ^~ (~^wire18))} > (~|{reg22,
              wire15[(1'h0):(1'h0)]})));
          if (((8'hb9) ?
              (8'hbe) : ($signed(({(8'hb5), reg39} >> (wire23 ?
                  reg33 : (8'hb9)))) - reg39)))
            begin
              reg43 <= $unsigned((($signed(wire16) ?
                      reg32 : $unsigned((-(8'ha0)))) ?
                  ($signed(wire24[(1'h1):(1'h1)]) ?
                      $unsigned($signed(reg34)) : (&((8'hb2) ?
                          reg35 : wire17))) : wire14[(3'h4):(2'h2)]));
              reg44 <= $signed($unsigned({($signed(reg30) || reg39),
                  (reg37[(1'h0):(1'h0)] ? wire23 : wire14)}));
              reg45 <= (reg35 ? (8'hb8) : reg28[(2'h3):(2'h3)]);
              reg46 <= $signed((8'hb4));
            end
          else
            begin
              reg43 <= (-reg36);
              reg44 <= {(({reg38[(4'h8):(3'h4)], reg43} < $unsigned((reg34 ?
                          reg35 : (8'ha8)))) ?
                      reg30[(4'h9):(2'h2)] : (reg41 + {((8'had) | (8'h9d))})),
                  (($signed(wire13) ?
                      ($unsigned(reg40) < {reg28}) : reg29[(1'h1):(1'h0)]) >> ((reg39 ^ wire16[(2'h2):(1'h1)]) <= reg42))};
              reg45 <= reg32[(3'h7):(3'h5)];
            end
        end
      else
        begin
          if ($unsigned(((+$unsigned(wire24)) ?
              (reg32 ?
                  $unsigned(reg45[(3'h5):(2'h3)]) : ($unsigned(wire16) ?
                      reg25[(4'hd):(4'hd)] : (reg33 ?
                          wire13 : wire11))) : ($unsigned({reg46,
                  (8'hbe)}) < $unsigned(wire16)))))
            begin
              reg39 <= $signed(({reg35[(4'hd):(3'h6)],
                  wire13[(4'h9):(3'h6)]} ^ $signed(($signed(wire14) ?
                  wire23 : (reg32 && reg32)))));
              reg40 <= wire16[(3'h5):(1'h1)];
              reg41 <= ($unsigned(wire14) ?
                  $unsigned(reg37[(1'h0):(1'h0)]) : (wire13[(4'hb):(4'h8)] ?
                      wire24 : $unsigned(($unsigned(reg43) >>> (!reg46)))));
              reg42 <= reg33[(1'h1):(1'h0)];
            end
          else
            begin
              reg39 <= reg22;
              reg40 <= (reg42 ?
                  ((~^(~((8'ha6) - reg25))) ^ {($signed(wire12) ?
                          $signed(reg29) : reg30[(2'h2):(2'h2)]),
                      $unsigned($unsigned((8'ha1)))}) : (reg31 ?
                      reg40 : (8'h9f)));
              reg41 <= wire12;
              reg42 <= (~reg29);
            end
          reg43 <= $unsigned(((((reg33 ?
                  reg29 : wire15) ^~ (&(8'ha7))) + wire16) ?
              ($unsigned($signed((8'hb9))) ?
                  (8'ha1) : ((~|wire18) ?
                      wire14[(5'h10):(4'h9)] : (reg45 ?
                          wire11 : wire17))) : (-reg36[(4'ha):(1'h1)])));
          reg44 <= (reg33[(5'h11):(1'h0)] - (^~((^reg25[(3'h6):(3'h4)]) + ((-reg39) ?
              {reg46, (8'h9c)} : (reg44 ~^ wire14)))));
        end
    end
  assign wire47 = (-wire24[(1'h0):(1'h0)]);
  assign wire48 = ($signed($unsigned($signed((|reg41)))) != (~|$signed(((reg35 >>> wire12) * (reg37 ?
                      wire24 : reg45)))));
  assign wire49 = $unsigned((~|($signed((reg41 ?
                      reg20 : reg39)) ~^ reg37[(1'h0):(1'h0)])));
  assign wire50 = ($unsigned($signed((~wire18))) ?
                      (&$signed((8'h9d))) : $unsigned($unsigned($unsigned(reg41[(3'h6):(3'h5)]))));
  assign wire51 = (wire17 && {reg29, reg36[(2'h3):(2'h2)]});
  assign wire52 = ((((~|{reg39, reg34}) || $unsigned({(7'h43), reg25})) ?
                      (reg22[(2'h3):(2'h2)] ?
                          {reg32} : $unsigned(reg33[(3'h6):(1'h0)])) : $signed((~^(&wire15)))) >> wire13);
  assign wire53 = $signed((~^reg29));
  always
    @(posedge clk) begin
      if (wire51[(5'h10):(4'he)])
        begin
          reg54 <= (+(reg33[(4'ha):(2'h3)] ? reg29 : (7'h40)));
        end
      else
        begin
          reg54 <= (~$signed($unsigned($unsigned((reg36 == wire14)))));
          reg55 <= reg31[(1'h1):(1'h1)];
          reg56 <= ($signed((wire11 & {wire11[(3'h7):(2'h2)],
              reg22})) != (8'hbb));
          reg57 <= ((&$unsigned((~(wire19 ?
              wire16 : reg39)))) <= wire52[(2'h2):(2'h2)]);
          reg58 <= ((wire14[(2'h2):(1'h0)] ^~ {reg25}) & (reg35[(5'h11):(5'h10)] ?
              (|$signed(wire49[(3'h5):(2'h2)])) : (^$unsigned((wire23 | reg44)))));
        end
    end
  assign wire59 = $unsigned(wire13[(2'h2):(1'h0)]);
  assign wire60 = reg39;
  always
    @(posedge clk) begin
      reg61 <= (wire12[(2'h3):(2'h3)] ?
          reg22 : ((~&(+(reg39 ? reg22 : reg34))) ?
              wire60 : ($unsigned($signed(reg38)) ?
                  reg36[(4'h9):(1'h0)] : (wire18 & $unsigned(wire19)))));
      reg62 <= (-$unsigned((^~{$signed(reg21)})));
      reg63 <= (wire11[(5'h12):(4'hd)] < (~&(~&reg46[(3'h6):(1'h0)])));
    end
  assign wire64 = $signed($unsigned($signed($signed(wire53[(1'h1):(1'h1)]))));
endmodule

module module234
#(parameter param261 = (({{(^(8'ha0))}} ~^ ((-(^~(8'hbf))) ? (~(&(8'hbc))) : ((~&(8'hb5)) ? ((8'hba) < (8'hb3)) : (^~(8'haf))))) ? (-((((8'hb2) ? (8'hac) : (8'hb3)) ^~ ((7'h42) | (8'hb6))) ? ({(8'ha2), (8'had)} * (|(8'hb8))) : {{(8'ha1)}})) : (~&((((8'hb2) >> (8'hae)) >> ((7'h43) ^~ (7'h40))) >= ({(8'hb5)} && (~&(8'hb1)))))), 
parameter param262 = (~&(^(~^param261))))
(y, clk, wire238, wire237, wire236, wire235);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire238;
  input wire signed [(2'h2):(1'h0)] wire237;
  input wire signed [(3'h4):(1'h0)] wire236;
  input wire [(3'h4):(1'h0)] wire235;
  wire [(5'h14):(1'h0)] wire260;
  wire signed [(3'h6):(1'h0)] wire259;
  wire [(4'hc):(1'h0)] wire258;
  wire [(4'ha):(1'h0)] wire257;
  wire [(3'h7):(1'h0)] wire256;
  wire signed [(5'h10):(1'h0)] wire255;
  wire signed [(5'h12):(1'h0)] wire254;
  wire signed [(2'h2):(1'h0)] wire253;
  wire signed [(4'hc):(1'h0)] wire252;
  wire signed [(4'hb):(1'h0)] wire251;
  wire signed [(5'h15):(1'h0)] wire250;
  wire signed [(5'h10):(1'h0)] wire249;
  wire [(4'hf):(1'h0)] wire248;
  wire [(5'h11):(1'h0)] wire247;
  wire signed [(4'hd):(1'h0)] wire246;
  wire [(5'h10):(1'h0)] wire245;
  wire signed [(4'h9):(1'h0)] wire244;
  wire [(4'hd):(1'h0)] wire243;
  wire [(3'h6):(1'h0)] wire242;
  wire signed [(5'h14):(1'h0)] wire241;
  wire [(3'h6):(1'h0)] wire240;
  wire signed [(4'hb):(1'h0)] wire239;
  assign y = {wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire239,
                 (1'h0)};
  assign wire239 = (^(~&$signed(((+wire238) || wire238[(4'h9):(3'h5)]))));
  assign wire240 = ($signed({($signed(wire235) ?
                           $unsigned(wire237) : wire239)}) == ($unsigned(($unsigned(wire236) ?
                       wire237 : $unsigned(wire238))) ^~ {(~{wire238,
                           wire236})}));
  assign wire241 = {wire239,
                       ($unsigned(wire235[(1'h1):(1'h1)]) ?
                           (~^wire236) : $signed(wire238))};
  assign wire242 = {$signed({$signed($unsigned(wire239)),
                           wire235[(2'h2):(1'h1)]})};
  assign wire243 = wire241;
  assign wire244 = $signed({$signed({wire237[(1'h1):(1'h1)]})});
  assign wire245 = (~&$unsigned(wire243[(4'hd):(3'h5)]));
  assign wire246 = (-($unsigned($signed((wire245 ?
                       wire245 : wire243))) && ($unsigned($unsigned(wire243)) ?
                       ($unsigned(wire242) ?
                           (&wire239) : (^wire237)) : (wire244[(3'h7):(1'h1)] <<< wire238))));
  assign wire247 = wire246;
  assign wire248 = wire237;
  assign wire249 = {$unsigned((&(^~$unsigned(wire245))))};
  assign wire250 = (~(($signed((wire242 ? (8'ha2) : wire248)) ?
                       (~wire242[(1'h1):(1'h1)]) : ((+wire242) & wire246[(4'h8):(4'h8)])) && $unsigned(wire247)));
  assign wire251 = $signed(wire237[(2'h2):(1'h0)]);
  assign wire252 = $signed(wire240[(2'h2):(1'h1)]);
  assign wire253 = wire240[(1'h1):(1'h1)];
  assign wire254 = (wire244 || (wire244[(4'h9):(1'h0)] << (~|(~|(wire245 ?
                       wire235 : (8'hb1))))));
  assign wire255 = (wire253 ?
                       $unsigned($unsigned((wire239 != (8'had)))) : (((&(wire236 << (8'hbb))) * wire238[(3'h6):(3'h4)]) ?
                           (^wire253[(2'h2):(1'h1)]) : (wire243[(4'hb):(4'h8)] ?
                               wire239[(2'h3):(2'h3)] : (~(wire251 ?
                                   wire237 : wire242)))));
  assign wire256 = ({(&(^~wire235))} <= (^wire252[(1'h1):(1'h1)]));
  assign wire257 = wire246[(2'h2):(1'h0)];
  assign wire258 = $unsigned(wire255[(4'hf):(3'h6)]);
  assign wire259 = ($unsigned(wire245[(3'h7):(1'h0)]) ?
                       (~$unsigned((wire258[(2'h3):(1'h1)] ?
                           (wire239 == wire244) : (wire237 + wire247)))) : wire245[(1'h1):(1'h1)]);
  assign wire260 = {$unsigned($signed(wire245))};
endmodule

module module202
#(parameter param215 = ({(!(((8'ha9) ? (8'ha0) : (8'hb1)) ? ((8'ha1) > (8'ha5)) : {(8'ha1)})), {{((8'ha1) ? (8'haf) : (8'hb1)), (~(8'ha2))}, {((8'hbb) ? (8'ha6) : (8'hac))}}} >>> (~&{(^(~|(8'hba))), ((~(8'hb2)) ? (~(8'hb3)) : (~&(8'hb2)))})), 
parameter param216 = param215)
(y, clk, wire207, wire206, wire205, wire204, wire203);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire207;
  input wire signed [(3'h5):(1'h0)] wire206;
  input wire signed [(4'hf):(1'h0)] wire205;
  input wire [(3'h4):(1'h0)] wire204;
  input wire [(4'ha):(1'h0)] wire203;
  wire [(4'h8):(1'h0)] wire214;
  wire [(4'h9):(1'h0)] wire213;
  wire signed [(4'ha):(1'h0)] wire212;
  wire [(5'h12):(1'h0)] wire211;
  wire [(3'h7):(1'h0)] wire210;
  wire [(2'h2):(1'h0)] wire209;
  wire [(4'hf):(1'h0)] wire208;
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 (1'h0)};
  assign wire208 = {$unsigned({(+wire204), $unsigned($signed(wire206))}),
                       wire203[(3'h6):(3'h4)]};
  assign wire209 = wire206;
  assign wire210 = wire206;
  assign wire211 = wire204[(3'h4):(2'h2)];
  assign wire212 = wire210[(3'h4):(2'h2)];
  assign wire213 = ((~|(wire205 && wire203)) + $signed(($unsigned({wire203}) ^ wire204)));
  assign wire214 = wire206[(1'h1):(1'h0)];
endmodule

module module171
#(parameter param197 = (((({(8'h9e), (8'hbc)} == ((8'hb7) >= (8'ha0))) && (^((8'hb9) & (8'ha4)))) < ((((8'h9f) ? (7'h42) : (8'hac)) <<< (~&(8'hac))) ? (&{(8'ha1)}) : ((^(8'hab)) & ((8'hbd) - (8'hb1))))) * (((((8'hb2) + (7'h40)) ? ((8'hb4) ? (8'hb2) : (8'ha7)) : ((8'hb4) ? (8'hba) : (8'hb6))) >> (^((8'haa) != (8'hb8)))) ? (^~{{(8'hae), (8'hb6)}}) : {(&((8'hac) || (8'haa)))})), 
parameter param198 = {(-(param197 ^~ param197)), (~(({param197} ? {param197} : (param197 ^ param197)) | param197))})
(y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire175;
  input wire signed [(5'h10):(1'h0)] wire174;
  input wire [(4'h8):(1'h0)] wire173;
  input wire [(5'h14):(1'h0)] wire172;
  wire signed [(5'h11):(1'h0)] wire196;
  wire [(4'ha):(1'h0)] wire195;
  wire [(4'h8):(1'h0)] wire194;
  wire [(4'he):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire [(4'hc):(1'h0)] wire191;
  wire [(5'h13):(1'h0)] wire190;
  wire [(4'ha):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire185;
  wire [(5'h14):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire183;
  wire signed [(4'hf):(1'h0)] wire182;
  wire signed [(4'ha):(1'h0)] wire181;
  wire signed [(2'h2):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire179;
  wire signed [(4'hd):(1'h0)] wire178;
  wire signed [(3'h5):(1'h0)] wire177;
  reg signed [(3'h5):(1'h0)] reg188 = (1'h0);
  reg [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg176 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 reg188,
                 reg187,
                 reg186,
                 reg176,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg176 <= wire174[(4'h8):(2'h2)];
    end
  assign wire177 = $unsigned({(~^(wire174 ?
                           (&wire175) : wire174[(4'hb):(4'h8)]))});
  assign wire178 = (~wire177[(2'h3):(2'h2)]);
  assign wire179 = $unsigned($unsigned({((wire177 ? wire175 : reg176) ?
                           (reg176 || wire178) : $signed(wire173)),
                       wire173}));
  assign wire180 = wire173;
  assign wire181 = $signed($signed((($signed(wire178) << $signed(wire179)) ?
                       (~^wire172[(1'h1):(1'h0)]) : ((~&(8'hb6)) ^ (wire179 ?
                           wire178 : wire173)))));
  assign wire182 = reg176[(1'h1):(1'h1)];
  assign wire183 = ((wire181[(1'h1):(1'h1)] <<< $unsigned(((~&(7'h41)) < (8'h9d)))) < (((wire180 ?
                       wire174 : $signed(reg176)) > wire173[(3'h6):(3'h5)]) ^~ $unsigned((^~{wire180,
                       wire180}))));
  assign wire184 = $signed((({(^wire181), {wire182}} ?
                           wire175[(3'h6):(1'h1)] : {$unsigned(wire172)}) ?
                       wire177[(1'h1):(1'h0)] : ((^wire183[(4'h8):(1'h1)]) * $signed((wire179 - wire172)))));
  assign wire185 = wire181[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg186 <= wire179;
      reg187 <= $unsigned($unsigned((((wire184 ?
          wire182 : wire172) >= $signed(wire180)) >= $unsigned($unsigned(wire178)))));
      reg188 <= ((-{(((8'ha7) ? (8'hb6) : reg186) ?
                  (&reg186) : wire174[(4'ha):(3'h5)]),
              wire177[(1'h0):(1'h0)]}) ?
          wire172[(4'hd):(4'ha)] : {({(wire174 ? (8'hb0) : wire183),
                      wire180[(1'h1):(1'h1)]} ?
                  $signed(reg187) : (7'h40)),
              (-(-wire184))});
    end
  assign wire189 = wire185;
  assign wire190 = reg187;
  assign wire191 = (~|({((wire190 ? (8'hb5) : wire178) ?
                           (wire184 && wire175) : {reg186}),
                       $signed($unsigned(reg188))} ^ (!$unsigned((wire189 <<< reg186)))));
  assign wire192 = ($unsigned(wire183[(4'h8):(2'h3)]) ?
                       (~^wire178) : {reg187,
                           (&$unsigned(wire172[(4'he):(1'h0)]))});
  assign wire193 = $signed(wire189[(3'h6):(3'h6)]);
  assign wire194 = wire193[(4'hb):(2'h2)];
  assign wire195 = ((wire184[(4'h9):(2'h2)] ?
                           ($signed(reg187) ?
                               $signed(wire174) : (~&(~&wire189))) : wire181) ?
                       $unsigned((|$unsigned({wire178,
                           wire174}))) : $signed(((wire172[(1'h0):(1'h0)] ?
                               {(8'hb3)} : (|wire189)) ?
                           wire192 : wire173[(3'h7):(3'h7)])));
  assign wire196 = (8'hac);
endmodule
