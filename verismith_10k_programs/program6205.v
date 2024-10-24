module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire283;
  wire [(4'h8):(1'h0)] wire282;
  wire signed [(5'h14):(1'h0)] wire281;
  wire signed [(5'h14):(1'h0)] wire279;
  wire [(3'h6):(1'h0)] wire278;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire276;
  reg signed [(4'hb):(1'h0)] reg293 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg292 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg291 = (1'h0);
  reg [(5'h14):(1'h0)] reg290 = (1'h0);
  reg [(4'hf):(1'h0)] reg289 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg288 = (1'h0);
  reg [(4'hd):(1'h0)] reg287 = (1'h0);
  reg [(4'he):(1'h0)] reg286 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg285 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg284 = (1'h0);
  assign y = {wire283,
                 wire282,
                 wire281,
                 wire279,
                 wire278,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire276,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 (1'h0)};
  assign wire5 = $signed((-$signed(((~&wire4) < {wire0, wire1}))));
  assign wire6 = wire2;
  assign wire7 = ((((wire2[(1'h1):(1'h1)] < (~wire5)) >> {$unsigned(wire6)}) ?
                     (+$signed(wire3)) : ((wire4[(3'h4):(1'h0)] >>> (~|wire2)) <= $unsigned((wire5 ?
                         wire0 : wire6)))) ~^ ($unsigned(wire4) | wire3));
  assign wire8 = $unsigned(wire6);
  assign wire9 = wire4[(3'h4):(2'h3)];
  assign wire10 = {wire0[(4'ha):(4'h9)],
                      $signed((!((wire1 * wire2) ? (8'hbd) : {wire0, wire3})))};
  assign wire11 = $signed(wire0);
  module12 #() modinst277 (wire276, clk, wire0, wire9, wire4, wire11, wire8);
  assign wire278 = $unsigned(((^~(wire5[(1'h1):(1'h0)] ? wire276 : (^~wire8))) ?
                       ((^~(~^wire276)) ?
                           (~^$unsigned(wire11)) : ($signed(wire276) ?
                               wire8[(2'h3):(2'h3)] : (8'hb2))) : (^$signed($signed(wire0)))));
  module188 #() modinst280 (wire279, clk, wire7, wire6, wire4, wire3);
  assign wire281 = wire276[(4'hf):(3'h7)];
  assign wire282 = (7'h44);
  assign wire283 = $unsigned((+($unsigned((wire6 ?
                       wire6 : wire278)) * (+{wire7}))));
  always
    @(posedge clk) begin
      if ((($unsigned(wire1) ?
              wire279 : (^~((wire4 ? wire283 : wire11) ?
                  wire0[(3'h5):(3'h5)] : wire9))) ?
          (+((-wire8) ?
              $signed((wire279 && wire11)) : wire278[(3'h5):(2'h3)])) : $unsigned((({wire278} ?
                  (~^wire278) : (wire4 ? wire279 : wire3)) ?
              $signed($unsigned(wire1)) : $signed(wire8)))))
        begin
          if ($signed(wire276))
            begin
              reg284 <= ((wire1[(3'h5):(1'h0)] ?
                  wire8 : wire8[(4'he):(4'hd)]) != ((-wire6) ?
                  $signed($signed((wire6 ?
                      wire8 : wire10))) : $signed(wire281)));
              reg285 <= wire276[(3'h4):(2'h2)];
            end
          else
            begin
              reg284 <= wire9[(3'h6):(3'h6)];
              reg285 <= wire278;
              reg286 <= $signed({$signed((wire276 ?
                      (wire8 & wire5) : $unsigned((8'ha7))))});
              reg287 <= (({$unsigned($signed(wire4))} ?
                  wire7 : $signed(((wire279 ^~ wire1) << (^wire8)))) ~^ {wire1,
                  (8'ha6)});
              reg288 <= $unsigned({wire3});
            end
          reg289 <= (!(~|(reg285[(1'h0):(1'h0)] | ((8'ha9) >> {(8'ha9),
              reg287}))));
          reg290 <= {wire5[(2'h3):(2'h3)],
              $signed($unsigned(reg289[(3'h4):(2'h3)]))};
        end
      else
        begin
          reg284 <= ($signed(($signed($signed(reg286)) ?
              wire6[(5'h10):(1'h0)] : ($unsigned(wire10) ?
                  ((8'hb7) ? reg288 : wire8) : (^reg289)))) <<< wire282);
          if ((wire7[(2'h2):(1'h1)] ?
              $unsigned((&(wire276[(4'hf):(4'hb)] ?
                  reg290[(3'h4):(2'h2)] : (wire7 ?
                      wire1 : wire4)))) : (wire0[(2'h3):(2'h2)] ?
                  wire1 : $signed(((!wire7) * wire6)))))
            begin
              reg285 <= {wire279[(4'h8):(3'h4)]};
              reg286 <= (reg286 & reg285[(3'h5):(3'h5)]);
              reg287 <= (($unsigned(reg289[(4'ha):(3'h6)]) > (reg286 ?
                      wire283[(3'h5):(2'h2)] : $signed((~^wire8)))) ?
                  (8'h9f) : $signed((~reg290)));
            end
          else
            begin
              reg285 <= $unsigned(reg286);
              reg286 <= $signed(({(wire10[(1'h0):(1'h0)] ?
                      {(8'hba)} : $signed((8'hb9)))} < (~^$signed($unsigned(wire4)))));
              reg287 <= $unsigned((wire278[(1'h1):(1'h0)] | wire278[(3'h4):(3'h4)]));
              reg288 <= wire6;
              reg289 <= $signed($unsigned($unsigned(wire276)));
            end
        end
      reg291 <= (wire6[(4'hc):(2'h3)] + wire281[(4'hc):(3'h5)]);
      reg292 <= ((8'hb3) ? wire282[(2'h3):(2'h2)] : wire10[(2'h3):(1'h0)]);
      reg293 <= (((~^reg284[(1'h1):(1'h0)]) <= (({reg287,
                  reg289} * $unsigned(reg288)) ?
              wire282[(1'h0):(1'h0)] : (~wire276[(1'h0):(1'h0)]))) ?
          (((~wire11[(3'h4):(1'h0)]) ?
                  ($signed(wire281) ?
                      $signed(wire8) : wire281[(5'h12):(4'hd)]) : $signed(wire1)) ?
              $unsigned(wire276) : (wire11[(5'h11):(1'h1)] ?
                  $signed((wire279 ? wire5 : wire279)) : ({wire281,
                      reg289} * $signed(reg292)))) : wire5[(1'h1):(1'h0)]);
    end
endmodule

module module12
#(parameter param275 = (8'hab))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h1b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire271;
  wire signed [(4'ha):(1'h0)] wire246;
  wire signed [(3'h7):(1'h0)] wire245;
  wire signed [(5'h15):(1'h0)] wire244;
  wire signed [(2'h2):(1'h0)] wire243;
  wire [(4'hc):(1'h0)] wire242;
  wire signed [(4'he):(1'h0)] wire240;
  wire [(4'he):(1'h0)] wire187;
  wire [(5'h15):(1'h0)] wire186;
  wire [(4'hd):(1'h0)] wire185;
  wire [(5'h13):(1'h0)] wire182;
  wire signed [(5'h15):(1'h0)] wire181;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire170;
  reg signed [(4'hb):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg273 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg [(3'h7):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(4'hb):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  assign y = {wire271,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire240,
                 wire187,
                 wire186,
                 wire185,
                 wire182,
                 wire181,
                 wire46,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire48,
                 wire69,
                 wire170,
                 reg274,
                 reg273,
                 reg184,
                 reg183,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 (1'h0)};
  assign wire18 = (((-wire15[(3'h7):(3'h5)]) & (^$signed((&wire13)))) ?
                      (|$unsigned($signed({(8'hbb),
                          wire16}))) : $signed(({wire16[(3'h6):(3'h5)],
                          wire16} < (|wire15[(4'ha):(2'h2)]))));
  assign wire19 = $signed(wire18[(2'h3):(1'h1)]);
  assign wire20 = $unsigned(wire16);
  assign wire21 = (&wire20);
  module22 #() modinst47 (.wire24(wire18), .clk(clk), .wire25(wire20), .wire23(wire16), .wire27(wire13), .wire26(wire17), .y(wire46));
  assign wire48 = wire21[(3'h5):(1'h1)];
  module49 #() modinst70 (.wire53(wire20), .wire52(wire17), .clk(clk), .y(wire69), .wire51(wire21), .wire50(wire48));
  module71 #() modinst171 (wire170, clk, wire69, wire14, wire18, wire17, wire15);
  always
    @(posedge clk) begin
      reg172 <= $unsigned(((8'h9d) + (wire17 ?
          ((wire17 ~^ wire20) ?
              (-wire14) : (wire13 < wire17)) : wire21[(5'h10):(1'h0)])));
      if (((~^({wire17[(4'ha):(1'h0)], $signed(wire17)} ?
              (&wire69[(1'h0):(1'h0)]) : ((wire46 ?
                  wire13 : (8'hb8)) - wire13[(4'he):(3'h5)]))) ?
          reg172 : (!wire170)))
        begin
          if ((!(({(|wire14)} ? $signed(wire15) : (^~$unsigned(wire14))) ?
              wire16[(3'h6):(2'h2)] : wire15)))
            begin
              reg173 <= wire13;
            end
          else
            begin
              reg173 <= {{{(8'hb7)},
                      ((8'hbd) << ((~&wire48) ?
                          (reg173 ?
                              (8'hb1) : wire19) : wire21[(5'h13):(4'ha)]))}};
              reg174 <= $unsigned((8'h9c));
              reg175 <= wire48[(3'h7):(3'h5)];
              reg176 <= (~^wire46[(3'h7):(2'h3)]);
            end
          reg177 <= $unsigned((wire19[(3'h5):(3'h5)] ?
              {reg172[(4'h9):(2'h2)],
                  (^~$signed(reg173))} : ($unsigned(((8'ha2) | (8'haa))) == $signed((reg172 >>> (8'ha6))))));
          reg178 <= ((-(($signed(wire21) || wire20[(3'h7):(3'h5)]) ?
                  $signed(wire46) : {reg175})) ?
              ((~^wire13) ?
                  wire20[(3'h4):(2'h3)] : (wire14 ^~ (+(reg173 >= wire48)))) : (($unsigned((wire48 != wire48)) ?
                      (reg176[(4'h8):(2'h3)] ?
                          (reg176 ? (8'ha5) : wire19) : {wire46,
                              wire21}) : wire170) ?
                  (7'h44) : (((&wire48) + reg177) ^ ({wire19, wire69} ?
                      (wire14 & wire19) : $signed(wire19)))));
          reg179 <= $unsigned($signed((-((^wire17) | wire14[(2'h3):(2'h3)]))));
        end
      else
        begin
          if (wire170[(3'h5):(3'h5)])
            begin
              reg173 <= (8'hb3);
              reg174 <= (8'hbc);
              reg175 <= ((7'h43) >> $unsigned((&wire13)));
              reg176 <= {{(wire48 && $signed($unsigned(reg175)))},
                  $unsigned($unsigned(wire15))};
              reg177 <= (($unsigned(wire14) ^~ $unsigned(wire19[(3'h5):(1'h1)])) * ($signed($signed($signed(reg173))) - (-reg173)));
            end
          else
            begin
              reg173 <= ((^wire170[(3'h4):(3'h4)]) | $signed(($signed($signed(reg179)) ?
                  ($signed(wire13) ?
                      $unsigned(wire17) : wire170[(1'h1):(1'h0)]) : ((wire48 <<< (7'h44)) ?
                      $signed(reg178) : $unsigned(wire170)))));
              reg174 <= wire16[(2'h3):(2'h2)];
              reg175 <= $signed((~^{wire69[(4'h9):(4'h8)]}));
            end
          reg178 <= $signed($unsigned((&(&(8'hac)))));
        end
      reg180 <= $unsigned({$unsigned({$unsigned(wire20)}), reg176});
    end
  assign wire181 = {($signed((~|$signed(wire13))) ?
                           wire14 : {{reg180, reg173}})};
  assign wire182 = $unsigned($signed($unsigned(wire14)));
  always
    @(posedge clk) begin
      reg183 <= $signed($unsigned(reg172));
      reg184 <= (($unsigned({$unsigned(wire14)}) ?
              wire21[(5'h14):(4'ha)] : (wire170[(4'ha):(2'h2)] ?
                  ((+wire182) ?
                      (wire17 ? reg178 : (7'h43)) : (reg173 ?
                          reg175 : (8'hb5))) : $signed($signed(wire18)))) ?
          reg174 : wire170[(1'h1):(1'h1)]);
    end
  assign wire185 = $unsigned(((wire18[(3'h6):(1'h1)] < $unsigned((&reg175))) == (^~((|wire181) == $signed(reg183)))));
  assign wire186 = wire48[(4'he):(4'h9)];
  assign wire187 = ($unsigned(wire19) | $signed(reg184));
  module188 #() modinst241 (wire240, clk, wire182, wire20, wire21, wire19);
  assign wire242 = $signed({$signed(wire19[(4'h8):(2'h3)]),
                       (wire16[(3'h7):(3'h4)] <= ((|wire16) ?
                           reg174[(3'h6):(3'h6)] : {wire69}))});
  assign wire243 = reg172;
  assign wire244 = ($signed($unsigned($unsigned($signed(wire15)))) ?
                       (|($signed(wire186) ?
                           wire46 : $unsigned(wire14))) : $signed($unsigned({reg174})));
  assign wire245 = reg179[(3'h5):(1'h1)];
  assign wire246 = $unsigned(wire240);
  module247 #() modinst272 (.y(wire271), .clk(clk), .wire249(wire21), .wire251(wire48), .wire248(wire242), .wire250(wire17));
  always
    @(posedge clk) begin
      reg273 <= $signed($signed(((((8'hb5) | (8'hb8)) ?
          $signed((8'h9f)) : (wire13 >> (8'h9e))) | $signed(reg179[(1'h0):(1'h0)]))));
      reg274 <= (7'h42);
    end
endmodule

module module247
#(parameter param269 = (&(8'hbd)), 
parameter param270 = (param269 - {(param269 ? {(~|param269)} : param269), (((8'hab) ? {(8'hba), param269} : (^param269)) && ({param269} + ((8'hb4) ? param269 : param269)))}))
(y, clk, wire251, wire250, wire249, wire248);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire251;
  input wire [(2'h2):(1'h0)] wire250;
  input wire signed [(4'ha):(1'h0)] wire249;
  input wire [(4'hc):(1'h0)] wire248;
  wire signed [(4'h9):(1'h0)] wire268;
  wire signed [(4'he):(1'h0)] wire267;
  wire signed [(4'hc):(1'h0)] wire266;
  wire [(5'h12):(1'h0)] wire258;
  wire signed [(3'h6):(1'h0)] wire257;
  wire signed [(3'h6):(1'h0)] wire252;
  reg [(2'h3):(1'h0)] reg265 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg264 = (1'h0);
  reg [(2'h3):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg262 = (1'h0);
  reg [(5'h11):(1'h0)] reg261 = (1'h0);
  reg [(2'h2):(1'h0)] reg260 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg256 = (1'h0);
  reg [(4'hf):(1'h0)] reg255 = (1'h0);
  reg [(3'h5):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg253 = (1'h0);
  assign y = {wire268,
                 wire267,
                 wire266,
                 wire258,
                 wire257,
                 wire252,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 (1'h0)};
  assign wire252 = wire251;
  always
    @(posedge clk) begin
      reg253 <= (+(wire251 != $signed(((wire248 ?
          wire248 : (7'h43)) || (8'ha2)))));
      reg254 <= (wire250 | ($unsigned(wire251) >>> $unsigned(wire250[(2'h2):(1'h0)])));
      reg255 <= wire250;
      reg256 <= (~(&(wire248[(2'h3):(1'h1)] ^~ (-(!(8'hbc))))));
    end
  assign wire257 = wire250;
  assign wire258 = $signed((|(wire252 << $unsigned((^wire251)))));
  always
    @(posedge clk) begin
      reg259 <= wire257[(1'h0):(1'h0)];
      reg260 <= $signed(wire250[(2'h2):(1'h1)]);
      if (reg255[(4'hc):(3'h5)])
        begin
          if ((wire257[(3'h4):(3'h4)] ?
              (($unsigned((8'hb3)) >>> $signed(wire249)) != (8'hbd)) : $unsigned((reg255[(1'h1):(1'h0)] >> $unsigned((reg255 * wire248))))))
            begin
              reg261 <= {($signed(({wire257, reg260} ?
                          reg260[(1'h1):(1'h1)] : reg256)) ?
                      ((~&(reg260 ? reg259 : wire248)) ?
                          $unsigned((~|reg256)) : $unsigned($unsigned(reg254))) : $signed($signed((!reg254))))};
              reg262 <= reg255[(1'h0):(1'h0)];
              reg263 <= ($signed(reg260[(1'h0):(1'h0)]) ?
                  $unsigned((&(|(~|reg255)))) : wire250[(2'h2):(1'h0)]);
            end
          else
            begin
              reg261 <= (reg255[(3'h4):(3'h4)] | $unsigned(($unsigned($signed(reg253)) ~^ wire257[(3'h4):(2'h2)])));
              reg262 <= ($signed($unsigned(reg255[(4'h9):(3'h4)])) || wire252);
              reg263 <= reg261[(1'h0):(1'h0)];
            end
          reg264 <= (-reg262[(5'h10):(3'h4)]);
          reg265 <= {wire257[(1'h1):(1'h0)],
              $unsigned({$unsigned(reg261),
                  ($unsigned((8'hae)) >= wire250[(1'h0):(1'h0)])})};
        end
      else
        begin
          reg261 <= wire252[(3'h5):(1'h0)];
        end
    end
  assign wire266 = ((!(reg262[(4'he):(4'hb)] ?
                       wire257 : (|reg253[(4'hc):(4'h9)]))) > (reg259[(4'hf):(3'h5)] < {({reg253} ?
                           wire249 : (reg260 < wire257)),
                       ($unsigned(reg265) <= $unsigned(reg253))}));
  assign wire267 = (|(8'hbc));
  assign wire268 = $signed(reg260[(1'h1):(1'h1)]);
endmodule

module module188
#(parameter param239 = (~^(~&(^~{((8'ha5) ? (8'ha8) : (8'hb8)), ((8'ha6) ? (8'hb3) : (8'had))}))))
(y, clk, wire192, wire191, wire190, wire189);
  output wire [(32'h1fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire192;
  input wire signed [(5'h10):(1'h0)] wire191;
  input wire [(5'h10):(1'h0)] wire190;
  input wire [(3'h4):(1'h0)] wire189;
  wire [(4'hd):(1'h0)] wire238;
  wire signed [(3'h5):(1'h0)] wire237;
  wire [(2'h2):(1'h0)] wire236;
  wire [(4'hb):(1'h0)] wire235;
  wire [(4'hb):(1'h0)] wire228;
  wire signed [(5'h12):(1'h0)] wire227;
  wire [(3'h5):(1'h0)] wire226;
  wire signed [(4'h9):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire215;
  wire signed [(5'h11):(1'h0)] wire214;
  wire [(2'h2):(1'h0)] wire213;
  wire signed [(4'hb):(1'h0)] wire209;
  wire signed [(3'h5):(1'h0)] wire208;
  reg [(3'h5):(1'h0)] reg234 = (1'h0);
  reg [(4'hb):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg232 = (1'h0);
  reg [(3'h4):(1'h0)] reg231 = (1'h0);
  reg [(5'h13):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg229 = (1'h0);
  reg [(4'h9):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg223 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg221 = (1'h0);
  reg [(5'h12):(1'h0)] reg220 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg217 = (1'h0);
  reg [(4'hd):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg212 = (1'h0);
  reg [(4'hd):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg210 = (1'h0);
  reg [(4'h8):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg204 = (1'h0);
  reg [(3'h7):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg202 = (1'h0);
  reg [(4'ha):(1'h0)] reg201 = (1'h0);
  reg [(4'ha):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(4'he):(1'h0)] reg193 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire215,
                 wire214,
                 wire213,
                 wire209,
                 wire208,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg212,
                 reg211,
                 reg210,
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
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire192[(4'he):(3'h5)] <= wire189[(3'h4):(2'h3)]))
        begin
          reg193 <= {($signed((|(wire191 ? wire190 : wire192))) ?
                  $unsigned(((-wire192) ?
                      (wire192 <<< wire189) : ((8'hb0) ?
                          wire191 : (8'hb7)))) : $unsigned(((~^wire191) <<< (+wire189)))),
              wire191};
          reg194 <= $signed((+$unsigned($unsigned(wire189))));
          reg195 <= $unsigned(reg194[(3'h4):(2'h2)]);
        end
      else
        begin
          reg193 <= ((8'ha5) ^~ wire189);
          reg194 <= ($signed(wire189[(2'h3):(1'h0)]) ?
              (~|(wire192 <<< wire192[(3'h6):(1'h1)])) : {$unsigned((^~$unsigned((8'haf)))),
                  wire189});
          reg195 <= ((^~{{(|reg193), (^~wire189)},
              ($unsigned(reg193) >>> (reg193 ?
                  wire189 : wire192))}) & $unsigned($unsigned($signed((reg195 <<< wire191)))));
        end
      if (wire192[(3'h4):(2'h3)])
        begin
          reg196 <= (+$signed(reg193[(3'h4):(2'h2)]));
          reg197 <= (($unsigned((wire191[(4'hd):(1'h1)] >> {(8'ha5)})) ?
                  wire190[(4'he):(4'h8)] : wire192[(5'h10):(4'hd)]) ?
              wire192 : $unsigned((+reg193)));
          if (reg197[(4'h9):(3'h6)])
            begin
              reg198 <= ($signed((^~(^~reg195))) ?
                  $unsigned($unsigned($signed((&wire190)))) : $signed((reg194[(4'h8):(2'h3)] ?
                      {$unsigned(reg194)} : $signed({wire190, reg193}))));
              reg199 <= ($unsigned(wire192) ?
                  $signed(((&(wire192 + wire190)) > {wire189})) : (!$unsigned({$signed(wire190),
                      $unsigned((8'hb6))})));
              reg200 <= (8'hba);
              reg201 <= reg194;
            end
          else
            begin
              reg198 <= ($unsigned((|reg197)) ?
                  $signed(reg197) : (reg193 > (^$signed((8'hba)))));
              reg199 <= {reg200[(4'h9):(3'h5)]};
              reg200 <= (~|reg200[(3'h4):(2'h3)]);
              reg201 <= reg195[(4'hf):(4'h9)];
            end
          reg202 <= ((7'h40) ?
              (~{$unsigned($signed(reg195)),
                  reg198}) : ($signed(wire190[(3'h4):(1'h0)]) ~^ wire190));
        end
      else
        begin
          reg196 <= (~&(reg196[(4'h9):(2'h3)] ?
              ($unsigned($unsigned(reg194)) * reg198[(1'h0):(1'h0)]) : {$unsigned($signed((8'ha4))),
                  reg196[(4'hc):(4'hb)]}));
          if (($signed((((wire191 ? wire191 : (8'hb3)) >= (wire192 ?
                  wire189 : reg193)) ?
              $unsigned($unsigned(reg202)) : reg198[(1'h0):(1'h0)])) > $signed(wire192[(5'h12):(3'h7)])))
            begin
              reg197 <= $signed((($signed(reg193) ?
                      $signed((reg196 * (8'hac))) : $unsigned($signed(reg193))) ?
                  reg193[(1'h0):(1'h0)] : ($signed(reg201) << reg198[(1'h1):(1'h1)])));
              reg198 <= reg197;
              reg199 <= (({reg196} <<< $unsigned((~|$signed((8'haa))))) == $signed($signed($signed((reg195 ?
                  reg196 : reg196)))));
              reg200 <= ((reg194[(3'h6):(3'h6)] >> $unsigned(reg197[(4'hc):(4'h8)])) ?
                  ((8'ha6) ?
                      {$signed((~|wire189)),
                          (~|reg196[(4'hf):(2'h3)])} : $unsigned((reg201[(3'h4):(2'h2)] ?
                          reg195[(3'h4):(2'h2)] : wire189))) : $signed($unsigned((reg197 | wire192))));
              reg201 <= (wire192[(4'h9):(2'h3)] != (8'ha0));
            end
          else
            begin
              reg197 <= reg196;
              reg198 <= reg199[(1'h0):(1'h0)];
            end
          reg202 <= reg196;
          reg203 <= ((reg201[(3'h6):(3'h5)] != $unsigned($unsigned(wire190[(1'h1):(1'h0)]))) & ({reg193,
                  ($signed(wire189) ? (8'ha4) : (~|reg201))} ?
              (8'had) : {$unsigned(((8'hb9) ? reg198 : reg194)),
                  (&$signed(reg201))}));
          reg204 <= reg193;
        end
      reg205 <= (!{{(8'hbb)}, (7'h40)});
      reg206 <= (~|reg200);
      reg207 <= {(~&(($unsigned(reg199) << $unsigned((8'hb3))) ?
              ((reg201 && reg196) ^~ (~^reg200)) : reg199)),
          (reg200 ? $signed({(reg204 >= reg196)}) : reg204[(3'h4):(3'h4)])};
    end
  assign wire208 = ({reg193[(4'ha):(1'h0)]} != $unsigned((^(&reg193))));
  assign wire209 = (7'h41);
  always
    @(posedge clk) begin
      reg210 <= (&wire208[(1'h0):(1'h0)]);
      if (reg206)
        begin
          reg211 <= $unsigned(((((reg198 >= reg204) >>> (~wire191)) ?
              wire189 : ((-reg199) ?
                  $signed(reg204) : $unsigned(reg198))) - $unsigned((!(reg199 ?
              reg202 : reg197)))));
        end
      else
        begin
          reg211 <= wire209;
          reg212 <= $unsigned(reg211);
        end
    end
  assign wire213 = reg212[(2'h2):(1'h1)];
  assign wire214 = reg202;
  assign wire215 = $unsigned({($signed(reg201) >>> $unsigned((wire214 ^ reg205))),
                       ($signed(reg194[(2'h3):(1'h1)]) >> $unsigned($signed(wire190)))});
  always
    @(posedge clk) begin
      reg216 <= $unsigned((8'hb5));
      if ($signed($unsigned((((reg205 ?
          wire192 : reg207) < reg206) & $unsigned(reg212)))))
        begin
          reg217 <= wire215[(4'hd):(2'h3)];
        end
      else
        begin
          if ((reg199[(2'h3):(2'h3)] ? reg197 : reg195[(4'hc):(4'h8)]))
            begin
              reg217 <= $signed($signed($unsigned((~^{reg200, reg193}))));
            end
          else
            begin
              reg217 <= ((^{reg200,
                  (reg212 | $signed((8'h9d)))}) <<< reg195[(4'hf):(4'h9)]);
              reg218 <= $unsigned(($signed((|{wire209,
                  reg210})) ^ $signed(($unsigned(reg207) ?
                  (reg204 ? wire213 : reg202) : wire191))));
              reg219 <= ($unsigned((!$unsigned(wire191[(4'he):(4'ha)]))) ?
                  reg212[(1'h1):(1'h1)] : (~&(&(+((8'ha5) ?
                      (8'hb2) : reg204)))));
              reg220 <= (&$unsigned({reg207[(2'h3):(1'h1)],
                  (|$signed(reg194))}));
              reg221 <= $signed($unsigned({$signed($unsigned(wire208)),
                  ((~^reg204) ^ (^~reg195))}));
            end
        end
      reg222 <= ($signed($unsigned(((reg207 ?
          reg216 : reg196) | wire208))) >> (wire192 ?
          (($unsigned(reg197) & $signed(reg221)) ?
              $unsigned((~|(8'ha1))) : (((8'hbb) ^ reg193) * $signed((8'hae)))) : ($signed(wire214[(4'he):(4'hb)]) ?
              {$signed(reg220)} : (&{reg193}))));
      reg223 <= wire191[(4'hb):(4'h8)];
      reg224 <= (((((-reg216) | {reg200,
                  reg199}) >= $unsigned(((8'ha0) || reg194))) ?
              {({reg198} ? $unsigned(reg220) : {(8'ha3)}),
                  reg193[(4'h9):(3'h4)]} : $unsigned((((8'ha6) > wire215) ?
                  $signed(wire214) : $unsigned(wire191)))) ?
          ({$signed((~|wire208)),
                  (reg217[(4'h8):(1'h1)] ? $unsigned((8'hba)) : reg212)} ?
              $signed($signed($unsigned(reg221))) : $signed($signed(reg205))) : (wire208[(3'h4):(3'h4)] ?
              $unsigned(reg222[(2'h2):(1'h1)]) : (^~{(~(8'hb0))})));
    end
  assign wire225 = reg219;
  assign wire226 = reg207[(3'h4):(2'h2)];
  assign wire227 = {(((~|$unsigned(reg216)) >>> (8'haf)) * $unsigned($signed((&reg211))))};
  assign wire228 = $signed($unsigned((reg218[(4'hf):(3'h4)] ?
                       reg199 : reg193)));
  always
    @(posedge clk) begin
      if ($signed(({(!$unsigned(reg216)),
          $unsigned($signed((7'h43)))} ~^ (($signed(reg216) && (&(8'h9e))) ?
          (reg220 | (^reg205)) : (reg221[(3'h7):(1'h1)] == wire228)))))
        begin
          if (wire192[(3'h6):(1'h1)])
            begin
              reg229 <= {$signed(reg205[(3'h4):(1'h0)])};
            end
          else
            begin
              reg229 <= wire214[(5'h11):(5'h11)];
              reg230 <= wire227;
              reg231 <= wire189[(3'h4):(2'h2)];
              reg232 <= reg198[(2'h3):(1'h0)];
            end
          reg233 <= $signed({$unsigned({(reg230 ? reg207 : reg218)})});
          reg234 <= wire213;
        end
      else
        begin
          reg229 <= reg219[(4'h9):(4'h9)];
          reg230 <= $unsigned(({reg212} ?
              (~|wire213) : (($unsigned(wire192) && (wire225 >> reg223)) & $signed((reg230 ?
                  (8'hb7) : reg195)))));
          reg231 <= ((~&$signed(reg204[(4'ha):(3'h7)])) ?
              reg229[(3'h6):(3'h5)] : ((wire213[(1'h1):(1'h1)] ?
                  ((wire208 ? wire208 : (8'h9c)) ?
                      (^wire208) : (^reg231)) : reg229) ^ (~^($signed(reg222) ^ $unsigned(wire208)))));
          reg232 <= $signed(reg194[(4'h9):(1'h1)]);
          reg233 <= (~|wire225);
        end
    end
  assign wire235 = $signed(((reg204[(4'hf):(3'h7)] ?
                       reg224 : (+$signed(reg196))) ^ reg223));
  assign wire236 = wire225;
  assign wire237 = $signed($signed(wire191));
  assign wire238 = (reg224 <= reg223);
endmodule

module module71
#(parameter param168 = ((~&((+{(8'h9f)}) ? ((~|(7'h43)) ? ((7'h41) ? (8'hb4) : (8'hbc)) : ((8'hac) >= (8'hb3))) : {(^(8'ha8))})) ? (8'hb9) : (-{({(8'hab), (8'h9d)} ? ((8'ha1) == (8'ha5)) : ((8'h9f) + (7'h44))), (~|(^~(8'haf)))})), 
parameter param169 = {{(({param168} << {param168, param168}) ? (8'h9e) : (param168 ? (param168 == param168) : (+param168))), {param168, (+(param168 ? (8'had) : (8'ha3)))}}, {((|(param168 ^~ param168)) ^~ param168), (!(!param168))}})
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h3e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire76;
  input wire [(2'h3):(1'h0)] wire75;
  input wire [(2'h2):(1'h0)] wire74;
  input wire [(3'h6):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire151;
  wire signed [(2'h3):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire147;
  wire signed [(4'h8):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(4'h9):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire77;
  reg [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg164 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  assign y = {wire151,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire77,
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
                 reg150,
                 reg149,
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
                 reg115,
                 reg114,
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
                 reg93,
                 reg92,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire77 = $signed($unsigned({(~(!wire73)), wire73}));
  always
    @(posedge clk) begin
      reg78 <= (^$signed((8'hb7)));
      if (reg78)
        begin
          if ((8'ha5))
            begin
              reg79 <= $unsigned($signed((^~($signed(wire73) | wire73[(2'h3):(1'h1)]))));
              reg80 <= wire76[(3'h5):(1'h1)];
            end
          else
            begin
              reg79 <= (~&(~&(wire74 << (~|$signed((8'h9c))))));
              reg80 <= (~|(7'h44));
              reg81 <= {({$unsigned(wire76[(2'h3):(2'h2)]),
                          ($signed((8'ha1)) == ((8'hbb) ? wire77 : wire75))} ?
                      (~^((-wire75) >= $signed(wire74))) : (^reg78[(3'h5):(3'h5)]))};
            end
          reg82 <= wire77;
        end
      else
        begin
          reg79 <= wire73[(3'h4):(1'h1)];
          reg80 <= {wire75[(1'h0):(1'h0)], $signed((8'ha5))};
          reg81 <= (|reg80);
          reg82 <= ($unsigned((wire73 ?
                  $unsigned((^wire77)) : ({wire75, wire76} && {reg81}))) ?
              $unsigned(wire77[(2'h2):(1'h0)]) : wire74);
        end
      reg83 <= ({({$unsigned(wire76),
              $unsigned(wire76)} | wire77[(2'h2):(1'h0)])} >= (((wire77 ?
                  (wire72 ? reg80 : wire75) : (wire72 && reg78)) ?
              $signed((8'h9d)) : (8'hba)) ?
          (^{$unsigned(wire75)}) : (|((^wire76) < {reg82, (8'hbf)}))));
      if (reg81)
        begin
          reg84 <= wire77;
        end
      else
        begin
          reg84 <= ($unsigned(reg80) ?
              (~|$unsigned({reg79[(2'h3):(1'h0)],
                  (reg83 ?
                      reg82 : wire76)})) : {$unsigned($signed((reg82 < (8'ha6)))),
                  (^reg84)});
          reg85 <= $unsigned((($unsigned((8'ha3)) ?
              (~|reg83[(1'h0):(1'h0)]) : $signed(reg83[(1'h0):(1'h0)])) <<< (reg84 ^~ {(|(8'ha2)),
              $signed(reg84)})));
          reg86 <= (reg84[(4'hc):(2'h3)] ?
              (+$unsigned(((-wire73) < (wire76 ?
                  reg78 : reg82)))) : (~(^$signed($signed(reg79)))));
        end
    end
  assign wire87 = (!wire72[(3'h7):(1'h1)]);
  assign wire88 = $signed(wire75);
  assign wire89 = $unsigned($signed((wire73[(2'h2):(1'h0)] ^~ {(reg85 || reg83)})));
  assign wire90 = $unsigned(reg83);
  assign wire91 = wire73[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      if ({{reg84[(4'hb):(4'h9)],
              ({(wire74 ? reg83 : reg84)} ?
                  ({reg81} ?
                      $signed(wire89) : $signed(reg86)) : $signed($signed(wire89)))},
          (~|(^{reg80[(4'h8):(3'h4)], {reg85, reg83}}))})
        begin
          reg92 <= ((~$signed($unsigned(wire76))) * $signed($signed($unsigned((wire87 << reg81)))));
          reg93 <= (($unsigned((8'ha8)) ?
              $signed($unsigned($unsigned(wire91))) : ($unsigned((wire74 ^~ (8'hb9))) && ((reg83 | (8'hb3)) ?
                  (reg79 != reg92) : (reg78 < reg84)))) >>> ($signed({reg83}) ^ (8'hb9)));
          reg94 <= reg84[(2'h3):(1'h0)];
          if ((^~(8'had)))
            begin
              reg95 <= (reg85[(1'h1):(1'h1)] ?
                  reg92[(3'h5):(2'h2)] : {((reg81 ^~ $signed(reg93)) && reg93[(1'h0):(1'h0)]),
                      ((~(reg81 ? reg84 : wire75)) <<< ($signed((7'h44)) ?
                          wire87 : $unsigned(reg83)))});
              reg96 <= reg92;
            end
          else
            begin
              reg95 <= $unsigned($signed({wire74,
                  $unsigned({wire87, wire77})}));
              reg96 <= $unsigned(wire91[(2'h2):(2'h2)]);
              reg97 <= (8'hb4);
            end
        end
      else
        begin
          reg92 <= (~&$signed({((^~reg84) ? $unsigned(wire77) : {reg97})}));
          if ({(^~(~|$signed(wire76))),
              $signed({reg86, $signed($unsigned((8'hbe)))})})
            begin
              reg93 <= $unsigned(((((~&reg84) - {wire76}) ?
                      (8'hb1) : $signed((reg97 ? reg96 : wire91))) ?
                  ($signed(reg78) ?
                      reg81[(3'h5):(1'h1)] : wire72) : {(~|$unsigned(reg95)),
                      ($unsigned(wire90) ?
                          $unsigned(wire75) : $unsigned(reg92))}));
              reg94 <= {$signed((7'h43)),
                  {$signed(((+reg93) & ((8'hb8) & reg79)))}};
              reg95 <= ({{wire74},
                  (((~&wire91) ?
                      $unsigned(reg92) : reg78) >>> ((reg83 > reg78) ?
                      $unsigned(wire75) : (reg80 | reg97)))} * $signed((~&($signed((7'h40)) > (8'hb3)))));
              reg96 <= wire73;
            end
          else
            begin
              reg93 <= (+{$signed($signed((~|wire77)))});
              reg94 <= $unsigned(($signed($unsigned(reg81[(3'h6):(3'h6)])) >= wire89[(3'h7):(1'h0)]));
              reg95 <= reg86[(1'h1):(1'h0)];
              reg96 <= reg80;
              reg97 <= ($unsigned((reg79[(3'h4):(1'h1)] ?
                  $signed(((7'h42) & (8'had))) : ($unsigned(reg97) ?
                      $unsigned(wire91) : (~^reg94)))) == wire76[(1'h1):(1'h0)]);
            end
          reg98 <= (wire76[(3'h6):(2'h3)] == $signed(((^~(&reg83)) ?
              $signed(reg92) : wire73)));
        end
      if (wire77[(1'h0):(1'h0)])
        begin
          reg99 <= reg86;
          reg100 <= wire87;
          if ((~^($signed($signed((~^reg78))) ?
              $signed(reg97[(1'h0):(1'h0)]) : reg95)))
            begin
              reg101 <= ($signed(($signed((reg82 ? (7'h44) : wire91)) ?
                  reg96[(3'h6):(1'h0)] : (-(reg95 ?
                      wire73 : reg95)))) > $unsigned(({$unsigned(reg80),
                  ((8'haf) ? wire74 : reg79)} ~^ (~|reg95))));
              reg102 <= (8'hb9);
              reg103 <= reg92;
              reg104 <= wire77[(3'h7):(2'h3)];
            end
          else
            begin
              reg101 <= (reg95[(4'ha):(4'h9)] * wire73);
              reg102 <= {($unsigned($unsigned((~|wire77))) & $unsigned(((^wire74) > (-reg103))))};
              reg103 <= (^reg102[(3'h4):(3'h4)]);
              reg104 <= wire91[(2'h2):(2'h2)];
            end
          reg105 <= ($signed($unsigned(($signed(reg103) >> {reg95, reg96}))) ?
              {($unsigned($signed(reg93)) ^ (8'h9f))} : {(wire77 ?
                      $signed($unsigned(reg82)) : wire90[(2'h2):(2'h2)]),
                  wire91[(1'h0):(1'h0)]});
          reg106 <= (reg86[(1'h1):(1'h1)] ?
              reg97[(3'h4):(3'h4)] : ((reg86 ?
                  (~^reg102[(3'h6):(1'h1)]) : $unsigned(reg103)) && $signed(wire91)));
        end
      else
        begin
          reg99 <= $unsigned((~|(reg95[(4'hc):(4'ha)] ?
              (|$unsigned(wire74)) : wire76[(3'h5):(2'h2)])));
          reg100 <= wire90[(4'hb):(4'ha)];
          reg101 <= wire89[(4'ha):(3'h6)];
          if (wire88[(3'h5):(1'h0)])
            begin
              reg102 <= reg106[(3'h7):(3'h5)];
              reg103 <= (!wire77);
            end
          else
            begin
              reg102 <= $signed(reg102[(2'h3):(2'h3)]);
              reg103 <= $unsigned((~(8'h9f)));
              reg104 <= $signed(reg79[(2'h3):(1'h1)]);
              reg105 <= ((reg92 ?
                  (^(((8'hb9) ? reg82 : reg102) ?
                      (reg93 ?
                          reg105 : wire77) : (reg93 * reg96))) : (8'ha5)) && {wire87[(3'h7):(1'h0)],
                  reg99[(3'h4):(1'h1)]});
              reg106 <= ({reg94,
                  (((8'hba) ?
                      reg103 : reg85[(2'h3):(1'h1)]) - (reg92 - {reg86}))} <= (^$signed($signed((&reg103)))));
            end
          reg107 <= $signed(reg82[(3'h5):(2'h2)]);
        end
      reg108 <= ($unsigned(wire90[(4'h8):(1'h0)]) ?
          reg99[(1'h0):(1'h0)] : reg81);
      if (((-(&(8'ha4))) ?
          (((((8'h9d) && reg96) ? $signed(wire73) : (reg97 ? wire89 : wire74)) ?
              (reg93[(2'h2):(1'h1)] <<< reg107[(3'h6):(2'h3)]) : wire88) || $unsigned((^(reg106 - (8'hab))))) : reg99[(2'h3):(1'h0)]))
        begin
          reg109 <= {($unsigned((^((8'ha8) ? reg106 : reg107))) | (reg79 ?
                  (reg103[(2'h3):(1'h1)] * (+reg83)) : ((reg86 <<< reg93) > wire73[(1'h1):(1'h0)])))};
          reg110 <= reg97;
        end
      else
        begin
          reg109 <= $signed($unsigned(($unsigned(reg110) >>> $unsigned((^~wire75)))));
          reg110 <= $unsigned({$unsigned(wire72)});
          reg111 <= (($unsigned(reg86[(1'h0):(1'h0)]) || (^~(((8'ha3) << reg84) <= (~reg96)))) ?
              $unsigned((((wire73 ? reg102 : (8'hac)) ?
                  reg101 : reg81) ^ ($signed(reg86) ?
                  $signed((8'hb2)) : reg79))) : wire72[(2'h2):(1'h1)]);
        end
      reg112 <= reg102;
    end
  always
    @(posedge clk) begin
      reg113 <= ((8'ha7) + (^(reg102[(3'h4):(2'h3)] ?
          (wire77 ? $signed(reg93) : wire74) : (-(!reg92)))));
      reg114 <= $unsigned(reg81);
      reg115 <= {reg112[(3'h4):(2'h3)], $unsigned(reg107)};
    end
  assign wire116 = {{(((reg107 ? reg80 : reg99) ?
                                   (reg97 ?
                                       wire72 : (8'h9e)) : (reg84 || (8'hac))) ?
                               reg96[(3'h5):(2'h2)] : (!reg107))},
                       (reg114 ?
                           reg83[(2'h2):(2'h2)] : (~wire88[(4'h8):(2'h3)]))};
  assign wire117 = ($signed(wire73[(3'h5):(1'h0)]) ?
                       $signed(reg102) : $unsigned((reg95 ~^ (reg95[(4'ha):(3'h6)] <= $signed(reg98)))));
  assign wire118 = (({{reg101, (reg115 << wire72)}, (!(reg109 - wire72))} ?
                           reg106[(3'h5):(1'h1)] : $signed(($signed(reg82) >> (&reg84)))) ?
                       {wire90, reg86} : $signed((reg84[(3'h6):(2'h2)] ?
                           reg110[(4'h8):(2'h2)] : reg99[(3'h5):(1'h0)])));
  assign wire119 = {(($signed($unsigned(reg96)) ?
                               $unsigned($unsigned(reg99)) : wire87) ?
                           (((~(7'h42)) & $unsigned(reg98)) <= {{reg100, reg99},
                               (!wire75)}) : (((^(8'ha0)) && reg104[(4'h8):(2'h2)]) ?
                               reg106[(2'h2):(1'h1)] : reg81))};
  always
    @(posedge clk) begin
      if (reg97[(1'h1):(1'h1)])
        begin
          reg120 <= (8'ha8);
        end
      else
        begin
          if (((^~reg96) ?
              $signed({{wire75}}) : (|(reg110[(1'h0):(1'h0)] <= reg98))))
            begin
              reg120 <= (((($unsigned(reg111) > wire117[(4'he):(4'h9)]) >> {wire89,
                  ((8'hba) >> reg81)}) || (wire77[(4'h8):(3'h6)] ?
                  reg110 : ((reg120 ? reg97 : wire73) ^ {wire74}))) << wire89);
              reg121 <= reg95;
              reg122 <= ($signed((-(+(reg92 + reg83)))) ?
                  reg105[(4'ha):(2'h2)] : (&((wire90[(4'ha):(4'ha)] ?
                      wire77[(4'hb):(4'h8)] : reg95) << (~&{wire116}))));
              reg123 <= (reg93 * $signed($signed(({reg121, wire77} ?
                  $unsigned(reg99) : (+wire75)))));
            end
          else
            begin
              reg120 <= $unsigned(reg78);
              reg121 <= {$unsigned((!$unsigned((reg120 >>> wire74))))};
            end
          if ((~^reg78[(3'h6):(3'h6)]))
            begin
              reg124 <= ($unsigned($signed($signed($signed(reg84)))) & reg114[(4'ha):(3'h6)]);
              reg125 <= (reg94[(1'h1):(1'h1)] ?
                  (8'hbc) : ((^~reg100[(3'h4):(2'h3)]) << (8'haa)));
              reg126 <= $unsigned(reg82);
              reg127 <= $signed(reg104[(1'h1):(1'h1)]);
              reg128 <= (^~reg123);
            end
          else
            begin
              reg124 <= {(wire90 < ((reg101[(1'h0):(1'h0)] ?
                      {reg113, reg109} : wire76) + $signed((reg121 ?
                      reg96 : reg96))))};
            end
          reg129 <= ((reg122[(1'h1):(1'h0)] > ($unsigned({reg109}) && ((~|reg122) >>> (reg115 && reg79)))) ?
              (~|(~&reg84)) : wire73);
        end
    end
  always
    @(posedge clk) begin
      if ((^(^~{reg124, reg83[(2'h2):(1'h1)]})))
        begin
          if (reg109[(1'h1):(1'h1)])
            begin
              reg130 <= {(^$unsigned($unsigned($signed(wire118)))),
                  (wire87[(2'h2):(1'h0)] && (^~(^reg108)))};
              reg131 <= reg99[(2'h2):(1'h0)];
            end
          else
            begin
              reg130 <= reg112;
              reg131 <= reg80[(3'h5):(3'h5)];
              reg132 <= $signed($signed((^~(~^(reg123 == reg110)))));
              reg133 <= {((^~(8'hb0)) ?
                      reg93[(2'h3):(1'h1)] : reg97[(2'h3):(1'h1)]),
                  $unsigned(($signed($unsigned(reg85)) ?
                      (reg95 ?
                          reg102[(2'h3):(1'h1)] : reg93[(3'h5):(3'h4)]) : {(reg126 ?
                              reg128 : (8'hae))}))};
            end
          if ($signed($unsigned((8'hb9))))
            begin
              reg134 <= $signed($unsigned($signed($signed((reg129 ?
                  reg83 : reg94)))));
              reg135 <= {({(!$signed((8'hb8)))} != (($unsigned(reg113) >= reg107[(2'h2):(2'h2)]) ?
                      $signed(wire90[(3'h6):(3'h5)]) : reg78[(3'h5):(1'h1)]))};
              reg136 <= (reg81[(3'h4):(1'h0)] ?
                  (({(wire90 ? reg130 : (8'hbe)), reg81} ?
                      reg129[(3'h5):(3'h5)] : ((!reg120) ?
                          (reg83 | reg83) : (reg103 + reg125))) <= $unsigned($signed((8'ha4)))) : ($unsigned(reg82) >> (|(reg108[(1'h1):(1'h0)] ?
                      (reg98 <= reg81) : reg113[(4'hc):(4'ha)]))));
              reg137 <= ((reg92 ?
                      $signed(((~&reg120) + (^~wire73))) : {reg130}) ?
                  (({wire87} ^~ $unsigned(reg99)) >>> $unsigned(((wire73 ?
                          reg79 : reg131) ?
                      reg109[(1'h0):(1'h0)] : reg105))) : ($signed(({reg128,
                          reg110} ?
                      (&(7'h42)) : $unsigned(reg132))) >= {$signed(reg96)}));
              reg138 <= $unsigned(reg109);
            end
          else
            begin
              reg134 <= $unsigned(({((^~(8'ha6)) | $signed(reg109)),
                      ({reg97, reg96} <= $signed(wire77))} ?
                  ((reg137[(3'h6):(1'h1)] >>> ((8'ha0) ?
                      reg126 : (8'hba))) + (8'ha1)) : ($signed(reg83[(2'h2):(1'h1)]) ?
                      $signed($unsigned(reg105)) : wire118)));
            end
          if (({($unsigned((|reg83)) ? reg134[(5'h12):(5'h11)] : reg105),
              reg78} && $unsigned($unsigned((reg98 & $unsigned(reg124))))))
            begin
              reg139 <= $unsigned((8'hbe));
            end
          else
            begin
              reg139 <= ((reg83 ?
                      (reg134 ?
                          $unsigned($signed((7'h42))) : reg127) : $unsigned(reg82)) ?
                  reg131[(4'h8):(3'h6)] : {$unsigned($unsigned((reg120 ?
                          reg94 : reg125))),
                      (~^(((8'hb8) ? reg130 : reg111) ?
                          $signed(reg79) : reg126))});
              reg140 <= $unsigned(reg103);
              reg141 <= (~&(reg80[(4'h8):(3'h6)] > $signed(($unsigned((7'h40)) <= $unsigned(reg113)))));
              reg142 <= {$signed((7'h43))};
            end
        end
      else
        begin
          reg130 <= {reg82[(3'h6):(1'h1)], {{reg125}}};
        end
      reg143 <= $signed((reg100 ?
          (~$signed((~^reg122))) : (wire91 + $signed($signed(reg113)))));
      reg144 <= ($unsigned(($signed((reg98 <= (8'h9d))) || {(^~reg114),
              (reg120 ? reg102 : reg129)})) ?
          $unsigned($unsigned($signed((reg124 ?
              reg84 : reg80)))) : ({($signed(reg125) ~^ $signed(reg78))} == (8'ha2)));
    end
  assign wire145 = (-reg94);
  assign wire146 = ((|reg137[(2'h3):(2'h3)]) ?
                       $signed({(reg112 > (reg94 >>> wire72))}) : $signed($unsigned((wire74 ?
                           (^(8'ha5)) : (reg130 == (8'ha5))))));
  assign wire147 = ({$signed((&(wire76 ? reg135 : reg95))),
                       $unsigned(wire146)} >>> {reg128[(3'h4):(2'h2)]});
  assign wire148 = reg105;
  always
    @(posedge clk) begin
      reg149 <= reg105;
      reg150 <= ((reg106[(1'h0):(1'h0)] - ((~|$signed(reg129)) ?
          (reg85 ^~ $signed(reg82)) : ((reg79 && reg133) >= $unsigned(wire72)))) > $signed((-reg95[(4'hf):(4'hb)])));
    end
  assign wire151 = ($unsigned($unsigned(reg149[(3'h6):(3'h5)])) > (^~reg132));
  always
    @(posedge clk) begin
      if ($unsigned(wire118))
        begin
          if ($unsigned($unsigned(reg143[(3'h4):(2'h3)])))
            begin
              reg152 <= $unsigned(wire77[(4'h9):(3'h6)]);
              reg153 <= $unsigned($signed($unsigned(reg130[(4'hb):(2'h3)])));
              reg154 <= reg86[(1'h1):(1'h0)];
              reg155 <= ($signed($unsigned(($signed(reg83) < reg96))) == reg86[(3'h4):(3'h4)]);
              reg156 <= reg122;
            end
          else
            begin
              reg152 <= $signed({((^~$signed(reg129)) ?
                      (|$unsigned(wire145)) : (^(reg100 ? reg106 : reg102)))});
              reg153 <= $unsigned(((((reg142 ? reg98 : reg85) ?
                          reg133[(2'h3):(1'h0)] : wire88) ?
                      ((8'h9f) | (+wire88)) : (+$signed(reg120))) ?
                  $signed($signed(reg154)) : $signed(reg130)));
              reg154 <= $signed(($unsigned($unsigned((~|reg138))) ?
                  reg136[(1'h0):(1'h0)] : (reg143 & (~(~&reg130)))));
              reg155 <= $signed((&(!($signed(wire73) != $unsigned(reg154)))));
            end
          reg157 <= wire147[(2'h2):(2'h2)];
          if ($unsigned({($unsigned($unsigned(reg149)) ^~ {$signed(reg137)})}))
            begin
              reg158 <= {$unsigned(((|{reg103, reg139}) <= ({reg107} ?
                      reg154 : (wire148 << reg133)))),
                  ($unsigned((reg134 ? $signed(wire148) : $signed(reg141))) ?
                      {((~^(8'hbe)) + $unsigned(wire74))} : reg83[(1'h0):(1'h0)])};
              reg159 <= $unsigned($signed((~|reg100[(1'h1):(1'h0)])));
              reg160 <= $unsigned($signed($unsigned(reg121)));
              reg161 <= (($signed((&(~&reg79))) ?
                  ($signed(reg137[(1'h1):(1'h1)]) <= wire117) : reg142[(4'hc):(4'hb)]) || reg136[(4'h8):(1'h0)]);
              reg162 <= {({$unsigned(((8'hb0) ?
                          reg149 : (8'hab)))} ^~ $unsigned((reg83[(2'h2):(1'h0)] ?
                      reg152 : $signed((7'h41)))))};
            end
          else
            begin
              reg158 <= ($unsigned((((reg114 ? (8'hbc) : reg86) ?
                      $signed(wire117) : (reg82 ? reg101 : reg130)) ?
                  $signed({reg83}) : reg158)) >> $unsigned(reg138));
              reg159 <= ($unsigned(($signed((~^wire116)) ?
                  ((~|reg124) ?
                      (reg126 ?
                          reg83 : (8'ha0)) : $signed(reg86)) : $signed($unsigned((7'h44))))) ^~ (8'hb0));
            end
          if (reg95[(3'h6):(2'h2)])
            begin
              reg163 <= {($unsigned(((reg101 ? wire118 : reg102) ?
                          $signed(reg108) : (~&(8'hae)))) ?
                      $unsigned($signed(reg112[(4'h9):(3'h7)])) : ((-(reg107 ?
                          reg134 : reg140)) || wire148[(2'h2):(2'h2)])),
                  (((8'h9e) ?
                      ({(8'ha4), reg136} ?
                          (~&reg111) : wire75) : $unsigned($signed((8'hb6)))) || $unsigned((~|{reg114,
                      (8'ha0)})))};
              reg164 <= (~^({(~&{reg109, (8'ha6)})} ?
                  (8'hbc) : $unsigned($signed($signed(reg136)))));
              reg165 <= reg139;
              reg166 <= (-$signed(((|(reg138 <= reg95)) ?
                  $signed(reg161[(1'h1):(1'h0)]) : reg113)));
              reg167 <= $unsigned($unsigned((($signed(reg82) <<< {reg120}) ?
                  $signed(reg130[(2'h2):(1'h0)]) : {$signed(reg115)})));
            end
          else
            begin
              reg163 <= wire151[(1'h1):(1'h1)];
              reg164 <= $unsigned($unsigned(($unsigned({wire117}) >= reg99)));
              reg165 <= (^~($unsigned(reg115) != {{{reg131, reg113}}}));
              reg166 <= ($signed($unsigned((wire116 ^ (reg123 <= reg106)))) != (((~|(^reg156)) > $unsigned($signed(wire74))) ?
                  (reg137[(3'h5):(3'h4)] ?
                      (reg100[(1'h1):(1'h1)] ?
                          (8'ha8) : {wire117}) : reg160) : (reg139 && wire76[(3'h4):(3'h4)])));
              reg167 <= $unsigned((~(8'hb4)));
            end
        end
      else
        begin
          reg152 <= reg115;
          reg153 <= (-reg158[(1'h0):(1'h0)]);
          if ($signed(reg115[(2'h2):(2'h2)]))
            begin
              reg154 <= (~reg82);
              reg155 <= (8'ha5);
              reg156 <= wire147[(3'h7):(1'h0)];
              reg157 <= (!($unsigned({(reg84 ? reg82 : reg128), (~^(8'hab))}) ?
                  $unsigned({(reg92 ? (7'h42) : wire147),
                      reg102}) : $signed((^~reg122))));
              reg158 <= $unsigned($unsigned((^((reg81 ?
                  wire147 : wire151) >= {reg124}))));
            end
          else
            begin
              reg154 <= (~|reg132);
              reg155 <= ($unsigned(reg101) ~^ $signed((wire88 == $unsigned((&reg82)))));
              reg156 <= $signed((($unsigned(reg157[(3'h4):(2'h3)]) << $unsigned((~&reg165))) - reg165));
              reg157 <= ((|wire146) ?
                  (~^$signed((reg121[(1'h0):(1'h0)] ?
                      $signed((7'h40)) : $signed(reg136)))) : (-$signed((reg127[(2'h3):(1'h1)] - $signed(wire119)))));
              reg158 <= reg164;
            end
        end
    end
endmodule

module module49
#(parameter param67 = ((((((8'h9f) ? (7'h44) : (8'hb4)) - ((7'h44) & (8'hba))) >> (^((8'hb0) ? (8'ha9) : (8'hb1)))) ? (~^(((8'hb2) ? (8'hb6) : (8'h9c)) | ((7'h40) < (7'h42)))) : {((!(8'ha6)) ? (~^(8'hbc)) : (|(8'hba))), {((8'hae) < (7'h43)), (~|(8'hbd))}}) ? (~^(((&(8'hba)) ? ((8'hb1) ^ (8'hbd)) : {(8'hb7)}) * (~&(-(8'h9c))))) : (^~(!(8'ha0)))), 
parameter param68 = (&(((^(param67 && param67)) || ((param67 ? param67 : param67) || (param67 ? param67 : param67))) <<< {param67})))
(y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire53;
  input wire [(5'h10):(1'h0)] wire52;
  input wire signed [(5'h14):(1'h0)] wire51;
  input wire signed [(5'h15):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  assign y = {wire66,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire54 = $signed(wire52[(3'h4):(1'h1)]);
  assign wire55 = ((^(8'hb1)) ?
                      (&(-((wire54 ?
                          wire51 : wire52) - (^~(8'ha6))))) : (($unsigned(wire53[(4'he):(4'he)]) ^ (^~wire50[(4'hc):(3'h4)])) ?
                          ((~|$signed(wire52)) & $unsigned((8'h9f))) : wire53));
  assign wire56 = $unsigned((^~$unsigned(((wire54 < wire55) <<< {wire55}))));
  assign wire57 = (((wire51[(4'h9):(1'h0)] ?
                          (wire52[(4'h8):(1'h1)] & (wire51 & wire51)) : (!wire53[(4'ha):(2'h2)])) + ((~|$unsigned((8'ha5))) + (wire54 ?
                          wire51[(5'h11):(4'ha)] : (~wire56)))) ?
                      (~|wire53[(3'h4):(3'h4)]) : (-wire52));
  assign wire58 = wire57[(4'hd):(3'h4)];
  assign wire59 = wire58;
  assign wire60 = ((~(wire53[(2'h3):(1'h1)] < $signed((wire51 && wire57)))) && ((8'h9e) < $unsigned(($unsigned(wire55) | ((7'h40) ?
                      wire55 : wire54)))));
  always
    @(posedge clk) begin
      reg61 <= {wire54[(1'h1):(1'h0)], wire58[(4'hb):(3'h7)]};
      reg62 <= wire55;
      if (wire60)
        begin
          reg63 <= ($unsigned((wire56[(2'h3):(1'h1)] ?
              (|(wire59 == wire58)) : (((8'hbf) ? reg62 : wire54) ?
                  $unsigned((8'ha3)) : (reg62 ? wire57 : wire57)))) || wire54);
        end
      else
        begin
          reg63 <= ($unsigned(($unsigned(wire53) ?
                  wire56[(2'h3):(1'h0)] : ((wire58 ? reg61 : (8'hb4)) ?
                      ((7'h43) >>> reg63) : wire57))) ?
              {$signed(((wire52 ? reg61 : wire53) ?
                      {wire59,
                          (8'ha4)} : wire50[(4'h9):(4'h9)]))} : $signed(wire60));
          reg64 <= ((~|$unsigned(wire54[(1'h1):(1'h1)])) ?
              $unsigned((8'hac)) : {$signed($signed((^~wire55)))});
        end
      reg65 <= $signed($unsigned(wire52[(4'he):(4'hb)]));
    end
  assign wire66 = $signed(($signed(wire57) >>> ((^~$signed(wire56)) ?
                      $unsigned((wire56 ? reg63 : wire57)) : $signed(wire58))));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire27;
  input wire [(4'ha):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire25;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
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
                 (1'h0)};
  assign wire28 = ($signed(wire25) ?
                      {($signed({(8'ha7)}) ?
                              $signed((wire27 ? (8'ha3) : wire26)) : (8'ha6)),
                          ($unsigned((wire25 ? wire26 : wire27)) ?
                              (^(wire25 >= wire23)) : wire27[(1'h1):(1'h1)])} : (wire24 ~^ (!(wire23 ^ wire23[(5'h14):(2'h2)]))));
  assign wire29 = (8'hb0);
  assign wire30 = (^~wire27);
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg31 <= $signed(((!(wire25[(4'hf):(1'h0)] & $signed((8'hb7)))) < (~$signed(wire28[(3'h4):(1'h0)]))));
          reg32 <= wire26[(1'h1):(1'h0)];
          if (((~|(((wire29 && wire23) ?
                  {wire30} : (wire23 ?
                      wire27 : reg31)) && $unsigned((wire24 == reg32)))) ?
              wire29[(1'h1):(1'h1)] : wire23[(1'h1):(1'h1)]))
            begin
              reg33 <= reg32[(3'h4):(3'h4)];
              reg34 <= {wire29[(3'h7):(3'h5)],
                  (wire26[(1'h0):(1'h0)] ?
                      $signed({wire23,
                          (wire29 ? wire30 : wire30)}) : (((wire27 ?
                              wire28 : wire27) << $unsigned(wire28)) ?
                          $unsigned({wire24, reg33}) : wire28))};
            end
          else
            begin
              reg33 <= $signed((((~((8'h9c) ~^ (8'hb9))) ?
                      (~|((8'hb7) * reg34)) : wire23[(5'h15):(5'h12)]) ?
                  wire29 : reg34));
              reg34 <= ($unsigned(((&{(8'hab),
                  reg34}) <<< $signed(wire26[(4'ha):(3'h6)]))) == ((&((~(8'ha6)) >> $signed(wire30))) + wire29[(3'h6):(3'h4)]));
            end
          reg35 <= {$unsigned($signed(reg34))};
          reg36 <= $signed((+((reg35[(2'h2):(1'h0)] >>> (wire26 < wire29)) ~^ reg31)));
        end
      else
        begin
          reg31 <= $unsigned(reg33[(4'h8):(1'h1)]);
          reg32 <= {(wire23[(3'h6):(3'h5)] ?
                  reg36 : $unsigned(reg32[(3'h5):(1'h1)]))};
        end
      if ({wire30[(4'h9):(3'h4)]})
        begin
          reg37 <= wire30[(1'h1):(1'h1)];
        end
      else
        begin
          if (reg33)
            begin
              reg37 <= (~|wire24);
              reg38 <= $signed($unsigned((wire29 ?
                  wire26[(3'h6):(2'h2)] : $unsigned($unsigned(reg35)))));
              reg39 <= reg35;
            end
          else
            begin
              reg37 <= reg34[(3'h4):(3'h4)];
              reg38 <= (reg37 ?
                  ((wire28[(3'h5):(2'h2)] ?
                      (&$signed(reg35)) : (wire29[(3'h5):(1'h1)] ?
                          $signed(wire27) : $unsigned(wire26))) & $signed($unsigned((reg39 ?
                      reg37 : (8'ha3))))) : (wire25[(3'h7):(3'h7)] ^ ((^((8'hb0) ?
                          wire30 : wire26)) ?
                      {$unsigned(reg35), wire28} : $signed(wire30))));
              reg39 <= (|((8'ha7) ?
                  (wire25 >> $signed({wire26, reg39})) : wire23));
            end
          reg40 <= (8'ha6);
          reg41 <= (reg40[(2'h2):(1'h0)] ? reg39 : {reg40});
          reg42 <= (|wire26);
        end
      reg43 <= ((+(8'hb7)) >> reg31[(3'h7):(3'h4)]);
      reg44 <= $signed(({reg36[(1'h1):(1'h1)], wire30[(3'h4):(2'h3)]} ?
          {(&(~^reg31)),
              ((reg34 >>> wire30) ?
                  reg37[(3'h4):(2'h2)] : reg42[(4'hc):(3'h7)])} : {$signed($unsigned(reg35))}));
    end
  always
    @(posedge clk) begin
      reg45 <= ($signed(reg35[(3'h5):(3'h4)]) ?
          reg42[(3'h7):(1'h0)] : $signed({(wire26 != wire23)}));
    end
endmodule
