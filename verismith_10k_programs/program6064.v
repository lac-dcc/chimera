module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h306):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire223;
  wire [(4'hb):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire225;
  wire signed [(4'hf):(1'h0)] wire226;
  wire [(5'h13):(1'h0)] wire227;
  wire [(4'hf):(1'h0)] wire230;
  wire signed [(4'ha):(1'h0)] wire247;
  wire signed [(4'hd):(1'h0)] wire249;
  wire [(5'h15):(1'h0)] wire250;
  wire [(4'he):(1'h0)] wire251;
  wire [(4'he):(1'h0)] wire253;
  wire signed [(3'h4):(1'h0)] wire254;
  wire [(5'h13):(1'h0)] wire262;
  wire [(3'h5):(1'h0)] wire278;
  reg [(5'h10):(1'h0)] reg277 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg276 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg275 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg274 = (1'h0);
  reg [(2'h3):(1'h0)] reg273 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg272 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg271 = (1'h0);
  reg [(3'h5):(1'h0)] reg270 = (1'h0);
  reg [(5'h12):(1'h0)] reg269 = (1'h0);
  reg [(3'h7):(1'h0)] reg268 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg267 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg266 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg264 = (1'h0);
  reg [(4'h9):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg261 = (1'h0);
  reg signed [(4'he):(1'h0)] reg260 = (1'h0);
  reg [(5'h14):(1'h0)] reg259 = (1'h0);
  reg [(3'h4):(1'h0)] reg258 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg256 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg255 = (1'h0);
  reg [(5'h13):(1'h0)] reg246 = (1'h0);
  reg [(3'h5):(1'h0)] reg245 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg244 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg242 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg241 = (1'h0);
  reg [(4'hd):(1'h0)] reg240 = (1'h0);
  reg [(5'h15):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg238 = (1'h0);
  reg [(4'he):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg234 = (1'h0);
  reg [(3'h7):(1'h0)] reg233 = (1'h0);
  reg [(4'hf):(1'h0)] reg232 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg231 = (1'h0);
  reg [(4'hf):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg228 = (1'h0);
  assign y = {wire223,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire21,
                 wire19,
                 wire225,
                 wire226,
                 wire227,
                 wire230,
                 wire247,
                 wire249,
                 wire250,
                 wire251,
                 wire253,
                 wire254,
                 wire262,
                 wire278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
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
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg229,
                 reg228,
                 (1'h0)};
  module4 #() modinst20 (.y(wire19), .wire6(wire3), .wire7(wire2), .wire5(wire1), .wire8(wire0), .clk(clk));
  assign wire21 = wire19;
  module22 #() modinst88 (wire87, clk, wire21, wire2, wire1, wire19);
  assign wire89 = (|(wire87 ? (|$signed((~&(8'haa)))) : (8'ha4)));
  assign wire90 = wire21;
  assign wire91 = wire2[(3'h7):(3'h6)];
  module92 #() modinst224 (wire223, clk, wire21, wire87, wire1, wire3, wire2);
  assign wire225 = (wire19 ?
                       wire87[(2'h2):(1'h1)] : ($unsigned((!(~^wire87))) ?
                           wire0 : wire223));
  assign wire226 = (wire2 ?
                       $signed((^~{(wire89 ?
                               wire21 : wire90)})) : wire225[(5'h11):(3'h6)]);
  assign wire227 = $signed(({wire89[(1'h1):(1'h1)]} ?
                       {$unsigned((~wire90))} : $unsigned((~|wire0))));
  always
    @(posedge clk) begin
      reg228 <= wire91[(4'h9):(3'h5)];
      reg229 <= wire91[(4'h8):(3'h5)];
    end
  assign wire230 = ((!wire90) << ((wire227[(3'h4):(1'h0)] & (~&wire87[(4'he):(3'h7)])) ?
                       $unsigned({wire1}) : $signed($signed((8'hb8)))));
  always
    @(posedge clk) begin
      if (($signed(({((7'h40) >> wire0)} ?
          ((wire230 | reg229) ?
              {wire223,
                  wire2} : $unsigned(wire87)) : $unsigned($unsigned(reg228)))) ^~ (~|$signed(wire1))))
        begin
          reg231 <= reg229[(1'h1):(1'h0)];
        end
      else
        begin
          reg231 <= $signed($unsigned($signed($unsigned($unsigned(wire1)))));
          reg232 <= {$signed(((&wire223[(2'h2):(1'h1)]) ?
                  $signed($unsigned(wire226)) : (&$signed(wire226))))};
        end
      if ((-(~|$unsigned($unsigned((wire21 == (8'hab)))))))
        begin
          reg233 <= (7'h44);
          reg234 <= (8'hae);
          if ({wire230, reg233[(1'h1):(1'h1)]})
            begin
              reg235 <= ((((^~((8'hbd) >= wire0)) ?
                  (wire21[(4'hf):(4'hf)] ~^ $signed(reg228)) : {(wire19 ?
                          wire223 : (8'hbb)),
                      reg229}) >= (|wire0)) || ({((wire2 ? wire1 : wire226) ?
                          (wire21 <= wire91) : (wire230 ? (7'h42) : reg233))} ?
                  {(8'ha2),
                      ((7'h44) ?
                          (wire223 << wire90) : ((7'h41) ?
                              reg232 : wire3))} : {$signed((+wire3))}));
              reg236 <= reg231[(3'h4):(2'h3)];
              reg237 <= reg234;
              reg238 <= (8'had);
            end
          else
            begin
              reg235 <= ({$unsigned(((reg236 && wire21) >> $signed(wire226)))} * reg233[(3'h4):(1'h0)]);
              reg236 <= (~reg231[(3'h6):(3'h6)]);
              reg237 <= (|$signed(($unsigned(wire227) ^ reg235[(4'he):(1'h1)])));
              reg238 <= (-wire87[(3'h6):(2'h3)]);
              reg239 <= ($unsigned($signed(($signed(wire226) ?
                  reg238 : $unsigned(reg235)))) >> wire0);
            end
        end
      else
        begin
          reg233 <= (~(~^reg233[(2'h2):(1'h1)]));
          reg234 <= wire19;
          reg235 <= (wire230 ?
              reg238[(1'h1):(1'h0)] : (&$unsigned(wire0[(1'h1):(1'h1)])));
          if ($signed((-(((wire223 ?
              wire91 : wire223) & $unsigned(wire230)) << $signed(wire227)))))
            begin
              reg236 <= (wire87[(2'h3):(1'h0)] ?
                  (~^(~|reg233)) : ($unsigned(reg238) != $signed($unsigned({reg238,
                      wire1}))));
              reg237 <= $unsigned($signed($signed($signed((reg237 == wire0)))));
              reg238 <= $unsigned(wire90[(3'h4):(2'h3)]);
              reg239 <= (-reg238);
            end
          else
            begin
              reg236 <= $signed(wire223[(4'h8):(3'h6)]);
              reg237 <= $signed((~^$unsigned((+wire226[(2'h2):(2'h2)]))));
              reg238 <= wire227[(4'hc):(2'h2)];
            end
        end
      reg240 <= (wire90 ?
          $unsigned((&(8'h9c))) : (~^($signed(((8'hb7) | wire21)) ^ wire1[(2'h2):(2'h2)])));
      if ($unsigned(reg238))
        begin
          reg241 <= {reg233[(3'h5):(1'h0)]};
          if (((wire1[(4'he):(1'h1)] ?
              (((wire225 ? reg229 : reg238) ^ $unsigned(reg228)) ?
                  (7'h43) : wire225) : ({reg237[(2'h3):(1'h0)], wire3} ?
                  (-(wire90 ?
                      wire2 : reg236)) : (reg239 ^~ $unsigned(reg229)))) <= wire0))
            begin
              reg242 <= $unsigned((8'h9f));
              reg243 <= (wire227 > (~^$signed((7'h42))));
            end
          else
            begin
              reg242 <= {wire230[(3'h7):(3'h7)]};
              reg243 <= wire90;
              reg244 <= ({(^wire230[(3'h4):(1'h1)])} ?
                  $signed(wire90) : (wire225[(4'hb):(3'h5)] >>> $unsigned((7'h43))));
              reg245 <= (((~|wire19[(1'h1):(1'h1)]) ?
                  $unsigned($unsigned((wire89 >= wire0))) : ({$signed(reg231),
                      reg241} ^~ $signed((~wire19)))) >> (((reg229[(4'h9):(3'h6)] ?
                      (wire227 ?
                          reg231 : (8'hbe)) : $unsigned(reg242)) << {(-reg235)}) ?
                  reg228 : $unsigned((reg239 << wire87[(4'hc):(1'h1)]))));
              reg246 <= reg235;
            end
        end
      else
        begin
          reg241 <= (!{$unsigned($unsigned({wire91, wire226}))});
          reg242 <= $signed($signed(wire226));
          reg243 <= $signed(reg246);
          reg244 <= (8'hb6);
        end
    end
  module179 #() modinst248 (.clk(clk), .wire184(reg235), .wire180(wire0), .wire182(reg240), .wire183(wire226), .y(wire247), .wire181(reg239));
  assign wire249 = wire89[(3'h4):(2'h3)];
  assign wire250 = (^~reg239);
  module179 #() modinst252 (wire251, clk, wire87, wire3, wire89, reg246, wire247);
  assign wire253 = reg240;
  assign wire254 = (^$signed({reg239[(5'h15):(2'h2)]}));
  always
    @(posedge clk) begin
      reg255 <= $signed($unsigned((($unsigned(wire254) ?
              {wire226, wire254} : {wire0, (8'ha6)}) ?
          (~$unsigned(reg246)) : ({reg239, wire254} ?
              (^reg231) : (~(8'hb2))))));
      if ({reg229[(4'ha):(4'ha)]})
        begin
          reg256 <= (wire230 + (^~reg233[(3'h4):(1'h1)]));
          reg257 <= reg228[(3'h4):(2'h2)];
          reg258 <= reg237;
          reg259 <= wire227[(4'hd):(4'h9)];
        end
      else
        begin
          reg256 <= reg243[(4'hf):(3'h4)];
          if (($unsigned($signed($unsigned((reg232 ? reg235 : reg245)))) ?
              ($unsigned($signed(reg244[(4'hc):(1'h0)])) >= ({(reg238 | reg257),
                      ((7'h44) ? wire226 : wire227)} ?
                  (wire19 ~^ $signed(wire223)) : ($unsigned(wire19) & $unsigned(wire1)))) : (~($signed((~|(8'ha5))) ?
                  (8'ha9) : (~^$signed(reg238))))))
            begin
              reg257 <= reg231;
              reg258 <= $signed($unsigned($signed(wire91[(3'h5):(3'h4)])));
            end
          else
            begin
              reg257 <= reg237;
              reg258 <= wire226;
            end
        end
      reg260 <= ($signed($unsigned((+((8'hba) ? wire3 : reg237)))) ?
          (wire19 ?
              $signed($unsigned(reg245)) : (^~$unsigned(wire1))) : $unsigned(((~|(|reg242)) ?
              (reg228[(3'h5):(2'h3)] ?
                  $signed((8'ha4)) : (reg259 - (8'hbe))) : $signed($signed(wire3)))));
      reg261 <= reg240[(4'h8):(2'h3)];
    end
  assign wire262 = ($signed(({(+wire87), (reg240 ? wire87 : wire19)} ?
                           reg240[(3'h5):(1'h1)] : (~(8'ha2)))) ?
                       reg242[(3'h4):(2'h3)] : (~|($unsigned(wire249) ?
                           (8'ha4) : $unsigned((~^wire225)))));
  always
    @(posedge clk) begin
      reg263 <= $unsigned(($unsigned($signed((!(8'h9e)))) <<< $signed($unsigned((reg240 ?
          wire251 : reg237)))));
      if ($unsigned($unsigned(reg257[(4'ha):(1'h1)])))
        begin
          reg264 <= (8'ha3);
          reg265 <= wire247;
          reg266 <= (8'ha7);
          reg267 <= ({wire19[(1'h1):(1'h1)],
              {(~^(wire225 != reg233)),
                  (wire90[(3'h4):(3'h4)] ?
                      (7'h40) : (reg238 << (8'h9e)))}} * (((reg232 < $signed(wire227)) ?
                  $unsigned($unsigned(wire91)) : reg255[(4'h9):(3'h7)]) ?
              $signed(($signed((8'hab)) & $unsigned(wire2))) : (|(~$unsigned(wire254)))));
        end
      else
        begin
          reg264 <= {reg256, {reg259[(4'h9):(3'h5)]}};
          reg265 <= $signed($unsigned(reg260[(4'hd):(4'h8)]));
          reg266 <= (&wire89);
          if (reg267)
            begin
              reg267 <= $signed(reg233);
              reg268 <= {(($signed((reg260 + reg240)) > (+(reg228 ?
                          reg243 : wire230))) ?
                      ({(wire1 && reg233)} ?
                          $unsigned(reg258) : reg236[(5'h10):(3'h6)]) : {wire19[(4'hf):(4'hb)]}),
                  (!reg244)};
              reg269 <= wire223[(4'hb):(3'h6)];
              reg270 <= reg245[(1'h0):(1'h0)];
              reg271 <= (reg238[(1'h0):(1'h0)] ?
                  reg245[(2'h2):(1'h1)] : $signed($unsigned($signed({wire89,
                      reg268}))));
            end
          else
            begin
              reg267 <= (reg243 ?
                  $signed(($signed(reg240) <= ((8'ha7) ?
                      (~|reg255) : wire227[(1'h1):(1'h0)]))) : ($unsigned({(reg241 ?
                              reg259 : wire254),
                          $signed(reg260)}) ?
                      ($signed((reg232 <<< reg229)) >= $unsigned(wire262)) : $signed(reg263[(1'h1):(1'h1)])));
              reg268 <= wire226[(2'h2):(1'h0)];
              reg269 <= wire249;
              reg270 <= reg239[(4'hc):(4'hb)];
              reg271 <= wire262;
            end
          if (((~|$unsigned($unsigned((~^reg257)))) ?
              wire2 : (^~((((7'h42) ^~ reg256) ?
                  (~|reg242) : (~^reg266)) || $signed($signed(wire21))))))
            begin
              reg272 <= $unsigned({{((-reg236) ? (+wire19) : (!reg237))},
                  $unsigned(wire1)});
              reg273 <= (+(|{$unsigned(wire3)}));
              reg274 <= $unsigned(reg269);
              reg275 <= $signed(reg234[(4'ha):(2'h2)]);
              reg276 <= ({($unsigned($unsigned((8'h9f))) ?
                          ((reg270 || reg258) + (+wire230)) : $signed((+(8'haf)))),
                      (($unsigned(reg260) - (reg264 + reg258)) ?
                          reg229 : $signed((-reg243)))} ?
                  $signed(reg243) : $unsigned(reg233));
            end
          else
            begin
              reg272 <= wire251[(4'hc):(3'h6)];
            end
        end
      reg277 <= (~(reg269[(4'hb):(4'h8)] ?
          (reg233 ~^ {wire3,
              (reg229 ? reg236 : wire1)}) : (!$signed((^~reg263)))));
    end
  module92 #() modinst279 (.wire94(reg232), .wire97(wire225), .y(wire278), .clk(clk), .wire95(reg239), .wire93(reg246), .wire96(reg257));
endmodule

module module92
#(parameter param222 = ((8'h9c) >> ({(((8'hb1) ? (8'hae) : (8'h9d)) & {(7'h44)}), {{(8'hac), (8'hb7)}, ((8'h9e) ? (8'ha7) : (7'h40))}} >> (+((^~(8'ha7)) <= (~&(8'hac)))))))
(y, clk, wire93, wire94, wire95, wire96, wire97);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire signed [(4'hf):(1'h0)] wire94;
  input wire [(5'h10):(1'h0)] wire95;
  input wire [(4'hf):(1'h0)] wire96;
  input wire [(5'h13):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire220;
  wire signed [(4'hb):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire signed [(4'hd):(1'h0)] wire176;
  wire signed [(3'h4):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire165;
  reg [(4'ha):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(4'hc):(1'h0)] reg175 = (1'h0);
  assign y = {wire220,
                 wire178,
                 wire177,
                 wire176,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire165,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 (1'h0)};
  module98 #() modinst166 (wire165, clk, wire93, wire96, wire95, wire94, wire97);
  assign wire167 = $signed(wire97);
  assign wire168 = $unsigned(wire96);
  assign wire169 = (8'ha7);
  assign wire170 = (+wire95[(4'ha):(4'h8)]);
  assign wire171 = (wire97 ?
                       (~&(((wire169 ? wire93 : wire97) ?
                               wire165 : (wire93 == wire95)) ?
                           $unsigned({wire94,
                               (8'ha2)}) : wire96)) : $unsigned((((^wire96) ?
                           (wire170 ^ wire169) : (wire96 ?
                               (8'hb7) : (7'h43))) == wire168)));
  always
    @(posedge clk) begin
      reg172 <= $signed(wire171[(1'h1):(1'h1)]);
      reg173 <= {(((^(wire93 ?
              wire93 : reg172)) && (^$unsigned(wire96))) || wire94[(4'h9):(3'h5)])};
      reg174 <= $signed($unsigned($unsigned($signed((wire165 ?
          wire96 : wire96)))));
      reg175 <= (8'hb9);
    end
  assign wire176 = {wire96[(4'hd):(4'ha)],
                       ((({reg173, (8'hbf)} ? wire170[(1'h1):(1'h1)] : wire96) ?
                               wire169[(2'h3):(1'h0)] : $signed((8'ha6))) ?
                           $signed($unsigned((~^(8'hbc)))) : {wire170[(2'h3):(2'h2)]})};
  assign wire177 = (-((wire170[(1'h1):(1'h1)] ?
                       ({wire94} - (reg175 ?
                           (8'h9c) : (7'h44))) : (|$signed(wire97))) || $signed(((~&wire165) ?
                       (wire167 ? (7'h42) : wire169) : {wire171, wire97}))));
  assign wire178 = (-$signed((-{(wire170 & wire97), (wire95 != wire168)})));
  module179 #() modinst221 (wire220, clk, wire97, wire94, wire170, wire167, reg172);
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire27;
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire27 = $unsigned(wire25[(4'hc):(4'h8)]);
  always
    @(posedge clk) begin
      reg28 <= (+wire24);
      reg29 <= wire23;
    end
  assign wire30 = (reg29[(4'h8):(1'h0)] * reg28[(4'h9):(2'h2)]);
  assign wire31 = wire23[(3'h6):(3'h6)];
  assign wire32 = $signed({wire30[(3'h7):(3'h7)]});
  assign wire33 = reg28;
  assign wire34 = (+$unsigned($signed(wire32)));
  assign wire35 = $unsigned(reg29[(4'hb):(4'h8)]);
  assign wire36 = wire24;
  assign wire37 = (wire31 ?
                      ($signed($signed($unsigned((8'hbe)))) ?
                          wire32[(1'h1):(1'h0)] : $signed(((reg28 != wire23) && $signed(wire27)))) : (-((8'hb9) | wire34)));
  module38 #() modinst82 (wire81, clk, wire33, wire35, reg28, wire27, wire23);
  assign wire83 = wire31[(4'hb):(2'h3)];
  assign wire84 = wire81;
  assign wire85 = {reg28};
  assign wire86 = wire23[(2'h2):(2'h2)];
endmodule

module module4
#(parameter param17 = ((~&(^(-((8'hab) ^~ (8'hb7))))) || (~|{(^~{(8'h9f), (8'ha7)}), ((~(7'h43)) ? (~&(8'hb8)) : ((8'hbc) ? (8'ha4) : (8'h9e)))})), 
parameter param18 = ((param17 ? param17 : param17) ? (~&(~&param17)) : (param17 >= param17)))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = wire7[(1'h1):(1'h0)];
  assign wire10 = $signed($unsigned((&((wire6 ?
                      wire8 : wire7) | $unsigned(wire5)))));
  assign wire11 = wire10[(5'h10):(4'h9)];
  assign wire12 = $unsigned($unsigned(wire10));
  assign wire13 = $signed($unsigned((+$unsigned((|wire10)))));
  assign wire14 = ({(-wire10), $unsigned($unsigned({wire9, wire11}))} ?
                      $signed($unsigned(((wire12 ?
                          (8'hac) : wire12) ^ wire9))) : (($signed((wire5 | wire12)) >>> $unsigned($signed((8'ha8)))) ?
                          (~$unsigned((8'ha0))) : {wire7,
                              wire9[(1'h0):(1'h0)]}));
  assign wire15 = $unsigned(wire11);
  assign wire16 = wire11[(4'hd):(2'h3)];
endmodule

module module38
#(parameter param80 = {({(((8'hab) ^ (8'hb6)) ? {(8'hac)} : {(8'hb2), (8'ha6)})} ? (~|(((8'hb3) && (8'haf)) ? ((8'hbe) ? (8'hb5) : (8'ha4)) : (~&(8'ha7)))) : ((&((8'hb6) + (8'ha2))) >>> {(+(8'hb1)), ((8'h9c) ? (8'haf) : (8'hb5))}))})
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire41;
  input wire signed [(5'h11):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire [(2'h3):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire44;
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire56,
                 wire55,
                 wire46,
                 wire44,
                 reg77,
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
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 (1'h0)};
  assign wire44 = wire40[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg45 <= $unsigned(wire40[(2'h2):(2'h2)]);
    end
  assign wire46 = ((reg45[(3'h4):(2'h3)] - $unsigned(($unsigned(wire41) ?
                          (^~wire42) : wire41))) ?
                      (wire42[(1'h0):(1'h0)] ^~ (($signed(wire43) ^ $unsigned(wire40)) ?
                          ((^wire43) || $signed(wire40)) : ($unsigned(wire39) ~^ (&(8'hb5))))) : (+{wire41[(4'he):(1'h1)],
                          (wire43[(3'h6):(3'h4)] < wire41[(4'h8):(2'h3)])}));
  always
    @(posedge clk) begin
      reg47 <= {((^~wire41[(4'hc):(3'h4)]) ?
              (+(wire42[(4'hf):(1'h0)] <<< (~wire41))) : $signed((~&$unsigned((8'hbc))))),
          $signed($unsigned(($unsigned(wire42) || (wire44 <= wire42))))};
      reg48 <= ({wire40[(5'h10):(4'hc)]} ?
          {$unsigned((^~(reg45 ? wire40 : (8'haa))))} : ((wire40 ?
                  $signed((wire41 - wire41)) : ((~|wire44) >> (8'ha5))) ?
              (wire41 >> (reg47[(1'h0):(1'h0)] ?
                  wire43 : reg45[(2'h2):(1'h0)])) : $signed({(^~(7'h40))})));
      reg49 <= $signed($unsigned(wire39[(3'h7):(3'h5)]));
    end
  always
    @(posedge clk) begin
      reg50 <= reg45;
      if (((!((wire41[(3'h4):(1'h1)] >= $unsigned(reg45)) ?
          wire46[(3'h5):(2'h2)] : $unsigned((reg45 ?
              (8'hb8) : reg45)))) << $unsigned($unsigned(reg45))))
        begin
          reg51 <= $unsigned((wire46 ?
              ((reg45[(3'h5):(3'h5)] ^~ $unsigned(reg48)) * $unsigned((wire40 > (8'ha2)))) : $unsigned((reg49 * (wire40 ?
                  reg49 : wire40)))));
          reg52 <= reg49;
          reg53 <= (wire40 ?
              ($signed({wire42, $unsigned(wire44)}) ?
                  ((wire39[(2'h2):(1'h1)] >> {(8'had),
                      wire44}) <<< (^{wire40})) : $unsigned(reg49[(3'h6):(3'h5)])) : ((^((reg45 ?
                          (8'hbc) : (8'ha9)) ?
                      wire43 : reg51)) ?
                  ((+{reg50}) == $unsigned(wire46)) : $unsigned((~|(+wire40)))));
        end
      else
        begin
          reg51 <= reg47[(4'hd):(4'h9)];
        end
      reg54 <= {(~{$signed($signed(reg51)), reg49[(3'h5):(1'h1)]})};
    end
  assign wire55 = reg47[(4'h9):(3'h4)];
  assign wire56 = wire40[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      if (reg54[(4'h8):(1'h1)])
        begin
          reg57 <= $signed(({(wire43[(2'h3):(2'h3)] ?
                  (|wire40) : reg45[(2'h2):(1'h0)]),
              (8'h9c)} >>> $unsigned(wire55)));
          reg58 <= {(+$signed((~^(&wire46))))};
          if ((reg49 ?
              reg54 : (+($signed((reg52 > (8'hbc))) ?
                  $unsigned((-reg48)) : ($unsigned(reg58) && ((8'hb7) <<< reg52))))))
            begin
              reg59 <= reg52;
              reg60 <= (((8'hb6) ?
                      (wire46[(3'h5):(2'h2)] ?
                          $unsigned($signed(reg52)) : $signed($unsigned(wire55))) : (wire44 != (!(+reg49)))) ?
                  wire41[(1'h1):(1'h1)] : wire55);
              reg61 <= ($signed((($signed(reg51) ?
                  (~|reg57) : (reg53 ? wire43 : reg54)) >> {(reg48 ?
                      reg52 : reg59)})) && $signed($signed((~(reg50 ?
                  wire44 : wire39)))));
              reg62 <= reg61[(2'h2):(1'h1)];
              reg63 <= $signed(wire39);
            end
          else
            begin
              reg59 <= {$signed(reg61[(1'h0):(1'h0)])};
              reg60 <= $unsigned($unsigned(reg63));
              reg61 <= $signed(($unsigned(($signed(reg54) ?
                      (~|(8'haa)) : wire41[(5'h14):(4'h8)])) ?
                  (reg49 < wire44[(3'h7):(2'h3)]) : (8'hb3)));
              reg62 <= (reg62[(2'h3):(2'h3)] < $signed((wire56[(3'h5):(2'h2)] >> $unsigned(wire40))));
            end
          if (($signed((reg49 & ((^~reg58) + {reg59, wire46}))) ?
              {reg63, $signed({reg47, (~|reg54)})} : reg57))
            begin
              reg64 <= (|wire41);
              reg65 <= reg60;
              reg66 <= {$unsigned((|reg64[(2'h3):(2'h2)])),
                  (wire39[(4'he):(4'h8)] ?
                      (8'hbc) : ((&reg58[(3'h7):(3'h4)]) ?
                          (-(-reg49)) : (~|reg62[(2'h3):(1'h1)])))};
            end
          else
            begin
              reg64 <= (wire43[(4'hf):(2'h3)] ?
                  {(($unsigned(reg49) ? (+wire56) : reg63[(3'h4):(2'h3)]) ?
                          (8'ha9) : (|(wire41 + (8'hbb))))} : {(wire42[(2'h3):(1'h1)] ?
                          $signed({reg62}) : $unsigned(reg49[(2'h2):(2'h2)])),
                      wire56});
              reg65 <= $signed((~|reg61[(2'h2):(1'h1)]));
              reg66 <= $signed($unsigned(reg52[(4'ha):(1'h1)]));
            end
          reg67 <= (($signed({(8'hbd)}) ?
                  ((~|((7'h42) <<< reg62)) ?
                      $signed($signed(reg58)) : $signed((wire42 ?
                          reg66 : reg53))) : $signed(reg50)) ?
              $signed((-(reg65[(1'h1):(1'h1)] <= reg45))) : (+(+wire40[(4'ha):(2'h2)])));
        end
      else
        begin
          if (reg45[(3'h4):(2'h2)])
            begin
              reg57 <= (-reg58);
              reg58 <= $signed(reg64);
              reg59 <= $signed($unsigned(reg62));
              reg60 <= $signed(reg58);
              reg61 <= reg45;
            end
          else
            begin
              reg57 <= $signed(((~|{(reg65 ? reg63 : reg62),
                  (+reg49)}) ^ ($unsigned((|reg58)) || reg63[(2'h3):(1'h0)])));
              reg58 <= reg51[(3'h5):(2'h2)];
            end
          reg62 <= (reg58 <<< reg65);
        end
      reg68 <= reg65;
    end
  assign wire69 = $unsigned($signed({wire46[(2'h3):(2'h3)],
                      (&$signed(wire46))}));
  assign wire70 = (-reg54[(4'hc):(4'hc)]);
  assign wire71 = (((reg57[(3'h6):(3'h4)] ?
                          $signed(wire42[(4'hd):(2'h3)]) : reg47) < $signed(wire69[(1'h1):(1'h0)])) ?
                      (^{$unsigned($unsigned((8'hbf))),
                          (+(reg68 == reg52))}) : $unsigned($unsigned(((wire46 ?
                              wire55 : wire70) ?
                          (8'ha5) : wire41))));
  assign wire72 = (((wire43 >> (!(wire56 ? reg67 : reg52))) ?
                      ($unsigned($unsigned(wire41)) * ((-wire42) << {reg58,
                          (8'hba)})) : wire55[(4'hc):(2'h2)]) + (((~^reg66) <= (~reg68)) ?
                      $unsigned(($unsigned(reg60) ^ (reg58 ?
                          wire70 : (8'hbc)))) : ((wire44 & (wire40 <= reg68)) | ((reg68 < reg62) >> wire70))));
  assign wire73 = (!$signed($signed(wire56[(3'h4):(1'h0)])));
  assign wire74 = ($signed($signed(((8'hba) ?
                      (reg65 ?
                          wire43 : reg47) : reg58))) >= ($unsigned($unsigned($unsigned((8'ha6)))) << reg63[(3'h7):(3'h6)]));
  assign wire75 = ($signed($unsigned($unsigned($unsigned((8'ha7))))) << $unsigned(((wire70[(4'h8):(1'h1)] | (reg65 || reg54)) >= ($signed(reg47) ?
                      $unsigned(reg49) : $signed(reg49)))));
  assign wire76 = (+($unsigned(reg52[(4'h8):(2'h3)]) == $signed(reg48)));
  always
    @(posedge clk) begin
      reg77 <= reg47[(2'h3):(2'h3)];
    end
  assign wire78 = reg59[(4'ha):(3'h5)];
  assign wire79 = (|(~^$unsigned((8'hb1))));
endmodule

module module179
#(parameter param218 = {(((((7'h41) ~^ (8'hb0)) ? (8'haf) : ((8'hb8) ^ (8'ha6))) ? (~&((8'hb5) ? (8'ha4) : (7'h44))) : (((8'ha4) ? (8'hb3) : (8'ha0)) ? {(8'hb0), (8'hae)} : {(7'h43), (7'h41)})) == ((((8'hb1) ? (8'ha1) : (8'ha2)) <= ((8'hb8) ? (8'hb0) : (8'hb5))) ^ (+(!(8'h9d))))), ((((~&(7'h44)) ? (^~(8'hb0)) : ((8'hb8) ? (8'ha1) : (8'hbb))) ? (&(8'hb4)) : {(~^(8'hbd)), ((8'hbd) ? (8'hb2) : (8'hb2))}) ? {{((8'hb0) ? (8'h9f) : (8'ha7))}, ((8'h9e) >>> (~^(8'ha3)))} : ((+((8'haf) >= (8'hb1))) ? {(!(8'hbb)), {(8'hb8)}} : ({(8'hac), (7'h43)} == ((8'ha0) != (8'hb6)))))}, 
parameter param219 = (((8'hb1) ? {param218, (~|(param218 > param218))} : param218) <= (^(^(~^(~param218))))))
(y, clk, wire184, wire183, wire182, wire181, wire180);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire184;
  input wire signed [(4'hf):(1'h0)] wire183;
  input wire [(4'hd):(1'h0)] wire182;
  input wire [(5'h13):(1'h0)] wire181;
  input wire [(4'ha):(1'h0)] wire180;
  wire signed [(2'h3):(1'h0)] wire217;
  wire [(4'he):(1'h0)] wire216;
  wire [(3'h7):(1'h0)] wire210;
  wire [(3'h5):(1'h0)] wire209;
  wire signed [(5'h11):(1'h0)] wire206;
  wire signed [(5'h12):(1'h0)] wire190;
  wire signed [(4'hb):(1'h0)] wire189;
  wire signed [(2'h2):(1'h0)] wire188;
  wire [(5'h12):(1'h0)] wire187;
  reg signed [(3'h4):(1'h0)] reg215 = (1'h0);
  reg [(4'he):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg213 = (1'h0);
  reg [(5'h12):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg211 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(4'h9):(1'h0)] reg207 = (1'h0);
  reg signed [(4'he):(1'h0)] reg205 = (1'h0);
  reg [(3'h5):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg202 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(3'h4):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(4'ha):(1'h0)] reg198 = (1'h0);
  reg [(2'h3):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(3'h4):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg192 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg191 = (1'h0);
  reg [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire210,
                 wire209,
                 wire206,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg208,
                 reg207,
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
                 reg192,
                 reg191,
                 reg186,
                 reg185,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg185 <= $unsigned({$unsigned($unsigned((wire183 ^~ wire181)))});
      reg186 <= reg185;
    end
  assign wire187 = {(wire180[(3'h5):(2'h3)] < wire184[(3'h7):(1'h1)])};
  assign wire188 = (-wire183);
  assign wire189 = (reg185 > $signed((+((8'hb3) ?
                       $signed(wire182) : $signed((7'h43))))));
  assign wire190 = wire181[(5'h13):(5'h10)];
  always
    @(posedge clk) begin
      reg191 <= reg186[(2'h3):(2'h2)];
      reg192 <= (wire183[(3'h5):(2'h3)] ?
          (wire189[(4'h9):(3'h7)] ?
              (reg185[(2'h2):(1'h0)] + wire183) : {(~|(8'hb7))}) : wire189[(3'h7):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg193 <= ($unsigned(wire183) ? (~|wire183) : wire180[(1'h0):(1'h0)]);
      reg194 <= (wire183[(4'h8):(2'h2)] <<< $unsigned((~^($unsigned(wire182) ?
          $unsigned(wire190) : (reg192 <= wire190)))));
      reg195 <= $unsigned(({$unsigned(wire180[(3'h7):(3'h6)]),
              reg186[(1'h0):(1'h0)]} ?
          $unsigned(wire184) : ({reg194, wire184[(2'h3):(1'h1)]} ?
              (^~(^reg186)) : (!wire181))));
      if ($unsigned(({reg192[(1'h0):(1'h0)]} ?
          reg191[(2'h2):(2'h2)] : (reg185 ?
              (wire180[(3'h4):(1'h1)] <= wire190[(5'h12):(5'h10)]) : (~{(8'ha3)})))))
        begin
          reg196 <= wire184[(4'h8):(4'h8)];
          reg197 <= wire182;
          reg198 <= (^wire181);
          if (wire181[(3'h7):(1'h0)])
            begin
              reg199 <= (-$unsigned((^~reg191[(3'h7):(3'h5)])));
              reg200 <= $unsigned((!$signed((~^reg191[(3'h7):(3'h5)]))));
            end
          else
            begin
              reg199 <= (((wire184[(1'h1):(1'h0)] - $signed(((8'h9e) ^~ wire187))) ?
                  (($unsigned(reg195) ?
                          $unsigned(wire180) : reg194[(2'h3):(2'h3)]) ?
                      reg192 : reg199[(3'h4):(3'h4)]) : $signed((reg185 ?
                      reg196 : reg195[(3'h5):(1'h0)]))) != wire189);
              reg200 <= ($signed(reg199) ?
                  (wire187[(3'h6):(1'h1)] ?
                      (wire189[(4'h8):(1'h1)] >> wire188) : $signed(($signed(wire189) ?
                          wire182 : $unsigned(reg198)))) : ((8'hb1) ?
                      ($unsigned(reg199[(1'h1):(1'h0)]) == ($signed((8'ha0)) || $signed(wire190))) : $signed((+wire187))));
              reg201 <= reg195[(2'h2):(1'h1)];
              reg202 <= $signed(reg194[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg196 <= (($unsigned($unsigned(reg185[(2'h3):(1'h1)])) ?
                  reg198[(4'ha):(3'h6)] : $signed(($unsigned(wire189) ?
                      $unsigned(reg193) : reg191[(4'h8):(3'h6)]))) ?
              wire190[(4'he):(4'he)] : wire190);
          if ((~&$unsigned((!$unsigned((-reg201))))))
            begin
              reg197 <= ((!($unsigned(((7'h41) | wire189)) & (^~wire188))) ?
                  wire187 : ($unsigned((!wire182[(2'h2):(1'h1)])) | (wire189 ?
                      wire190 : {{reg191}, $unsigned((8'h9f))})));
              reg198 <= ($signed((($unsigned(wire188) << $unsigned(reg192)) ?
                  (reg194 ?
                      $unsigned(wire182) : $unsigned((8'haa))) : $unsigned($signed(wire182)))) & {$signed((((8'h9e) & wire189) - $unsigned(wire181)))});
            end
          else
            begin
              reg197 <= (reg191 <<< ((reg196 * ((wire184 && reg194) == $unsigned(reg186))) >>> wire183));
              reg198 <= $unsigned($unsigned(($signed({reg201, wire184}) ?
                  $unsigned($unsigned(wire180)) : $unsigned((reg195 + reg192)))));
            end
          reg199 <= {($signed($unsigned($unsigned(reg197))) ?
                  reg199 : (^~(~^wire189)))};
          reg200 <= (~&$unsigned(reg186));
          reg201 <= {reg185, reg185[(3'h4):(2'h2)]};
        end
      if ((wire180 << wire189[(4'h9):(3'h5)]))
        begin
          reg203 <= ({(+(~^reg197))} ?
              ((|((~wire181) ?
                  reg186 : $unsigned(wire180))) * (~$signed(((8'ha2) ?
                  reg193 : (8'ha4))))) : wire183[(2'h2):(1'h0)]);
          reg204 <= ({(^reg191), reg193} ^~ (!reg193[(5'h11):(4'h8)]));
          reg205 <= $unsigned($unsigned({wire182, wire187}));
        end
      else
        begin
          reg203 <= {reg186};
          reg204 <= ($signed((reg195 ?
              ($signed(wire188) <<< reg192[(3'h6):(1'h1)]) : reg198[(2'h2):(1'h0)])) || $signed(reg198));
          reg205 <= reg198;
        end
    end
  assign wire206 = $signed(({reg192} ?
                       (+$signed({reg199})) : $unsigned(wire183)));
  always
    @(posedge clk) begin
      reg207 <= (^(reg192 ?
          ($signed((wire206 != wire184)) ?
              reg186[(2'h2):(1'h1)] : $signed((wire189 != reg192))) : {(wire190[(4'h8):(1'h1)] != $signed((7'h43)))}));
      reg208 <= $signed(reg207[(2'h2):(2'h2)]);
    end
  assign wire209 = ($signed({{(-wire188), reg207[(1'h0):(1'h0)]}, (+reg192)}) ?
                       ((wire190 ~^ (8'ha2)) ?
                           (&(~^(wire181 ? reg203 : wire206))) : ({(wire182 ?
                                   wire190 : reg197),
                               (wire189 ?
                                   reg204 : reg186)} < reg204)) : wire190[(4'he):(3'h4)]);
  assign wire210 = reg203[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg211 <= (($unsigned($unsigned((~&reg194))) ?
              $signed(wire188) : $unsigned((&(8'hab)))) ?
          (($signed(reg198[(3'h7):(3'h7)]) ^~ $unsigned(reg185)) ~^ (~|wire190)) : reg186[(1'h1):(1'h1)]);
      reg212 <= wire181;
      reg213 <= $signed((&($signed($unsigned(reg202)) + reg200)));
    end
  always
    @(posedge clk) begin
      reg214 <= ((~&reg207[(1'h1):(1'h1)]) <= wire206);
    end
  always
    @(posedge clk) begin
      reg215 <= $signed(reg212);
    end
  assign wire216 = (wire183[(3'h4):(2'h2)] ?
                       reg185 : (reg199 ?
                           ($signed((reg214 ?
                               (8'hbc) : wire183)) >> reg186[(1'h1):(1'h1)]) : (($unsigned(reg195) != $unsigned(reg203)) ?
                               reg202[(2'h3):(1'h0)] : (reg186[(2'h3):(1'h1)] <<< reg207))));
  assign wire217 = (((^$signed($signed(reg207))) ?
                       (8'hb5) : ({reg205} & reg203[(4'h9):(1'h0)])) == {reg186,
                       (|(reg193 ?
                           (reg208 ?
                               (8'h9c) : reg215) : reg195[(3'h7):(1'h0)]))});
endmodule

module module98
#(parameter param163 = (((!(((7'h40) >> (8'ha8)) + ((8'hb4) ? (7'h40) : (8'h9c)))) ? ((^(+(8'hbd))) ? (((8'ha7) + (8'h9f)) <= ((8'hac) >= (8'hbd))) : (((8'ha5) > (8'ha3)) ~^ (~(7'h41)))) : ((((8'hb0) ? (8'hb2) : (8'h9c)) <= (!(8'h9e))) ? (~^((8'haa) ? (8'ha3) : (8'hb1))) : (((7'h40) ? (8'ha1) : (8'ha7)) > ((8'ha5) ? (7'h43) : (8'hb8))))) ? (((~^((8'h9d) ? (8'hb3) : (8'h9f))) >>> (+((8'hb4) ? (8'hb1) : (7'h41)))) & ((((8'had) || (8'h9d)) ? {(8'hb5)} : (~|(8'hbd))) ? (((8'hab) >>> (8'hbb)) ? ((8'h9c) ? (7'h43) : (8'hac)) : ((8'hb5) ? (8'hbe) : (8'ha9))) : (!((8'hb1) == (7'h44))))) : ((|((8'hbd) ? {(8'hb2), (8'hbd)} : {(8'hb8), (8'hbd)})) ? ({((8'hb9) ? (8'ha9) : (8'had)), ((8'h9c) ^ (8'h9d))} ~^ ({(7'h41)} ? ((7'h40) <<< (7'h41)) : ((8'ha6) == (8'hb6)))) : (^{((8'ha8) == (8'ha1))}))), 
parameter param164 = (((((+param163) == (param163 <= (8'hbc))) > (+(param163 ? param163 : param163))) + param163) ^ (^~param163)))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h295):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire103;
  input wire signed [(4'hf):(1'h0)] wire102;
  input wire [(2'h3):(1'h0)] wire101;
  input wire signed [(4'h9):(1'h0)] wire100;
  input wire [(5'h10):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire162;
  wire signed [(5'h11):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire [(4'ha):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire104;
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(4'h8):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire150,
                 wire124,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
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
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
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
                 reg105,
                 (1'h0)};
  assign wire104 = (~&((($unsigned(wire103) - wire99) ?
                       (-$unsigned(wire101)) : wire101[(1'h0):(1'h0)]) * (~|$unsigned(((8'ha1) ?
                       (8'hb3) : wire99)))));
  always
    @(posedge clk) begin
      reg105 <= (((|(wire100 ?
              $signed(wire100) : $signed(wire100))) ~^ wire100[(4'h9):(2'h3)]) ?
          (8'ha5) : (^~(8'haf)));
    end
  assign wire106 = $signed(reg105[(3'h5):(1'h1)]);
  assign wire107 = wire100[(3'h6):(2'h3)];
  assign wire108 = (~&(&(($signed(wire104) ?
                       {wire107,
                           wire104} : $signed(wire101)) >>> wire102[(3'h7):(1'h0)])));
  assign wire109 = reg105;
  assign wire110 = reg105[(2'h2):(1'h0)];
  assign wire111 = wire106;
  assign wire112 = {((wire106[(4'hd):(1'h0)] * (wire102[(4'ha):(3'h4)] ?
                           wire103[(1'h1):(1'h0)] : wire102[(4'h8):(3'h4)])) - $signed(wire109)),
                       (~|wire99[(4'hb):(2'h2)])};
  assign wire113 = (8'hba);
  always
    @(posedge clk) begin
      if ((($signed(wire106[(5'h10):(4'hb)]) <= {(~|(!wire111)),
          {(wire110 < wire103)}}) < wire109[(2'h3):(1'h1)]))
        begin
          reg114 <= wire112;
          reg115 <= (-$signed(wire110));
          reg116 <= wire107[(3'h5):(1'h1)];
          reg117 <= wire104[(4'ha):(1'h0)];
        end
      else
        begin
          reg114 <= wire113[(3'h4):(2'h2)];
          reg115 <= (8'hac);
        end
      if (wire106[(4'hc):(4'h9)])
        begin
          reg118 <= ((~^$signed(reg115)) ? wire109[(3'h5):(2'h3)] : wire107);
          if (($signed($signed((+wire106))) & wire99[(2'h3):(2'h3)]))
            begin
              reg119 <= (|wire110[(3'h5):(1'h0)]);
              reg120 <= $signed(wire111[(4'hc):(1'h1)]);
              reg121 <= ((~&(-$unsigned($signed(wire103)))) + {{wire102},
                  (^$unsigned($signed(wire106)))});
              reg122 <= (~^(reg117 ?
                  ({wire102[(1'h1):(1'h1)], $unsigned((8'hbe))} ?
                      ((reg119 ?
                          reg121 : wire107) < (wire101 <<< wire108)) : $signed(reg116)) : (($unsigned(reg115) > (-wire103)) < (~^(8'h9c)))));
            end
          else
            begin
              reg119 <= (wire111[(4'hb):(3'h5)] ?
                  {(+((8'hb1) ? {wire113} : wire100)),
                      $signed((~|$unsigned(reg117)))} : $unsigned((~&(!(reg120 ?
                      wire109 : wire108)))));
              reg120 <= wire102;
            end
          reg123 <= $signed(wire101[(2'h3):(2'h3)]);
        end
      else
        begin
          reg118 <= (reg114[(3'h6):(2'h2)] ?
              (~^(~($signed(reg123) >> $signed(wire104)))) : $signed(((wire108[(3'h6):(3'h4)] | $unsigned(wire109)) + wire111[(2'h2):(1'h0)])));
        end
    end
  assign wire124 = ($unsigned(({(reg117 != (8'ha2))} ?
                           reg105 : wire108[(3'h7):(3'h6)])) ?
                       $unsigned($unsigned(reg122[(5'h12):(2'h3)])) : {(-reg123[(4'hb):(4'h9)]),
                           reg118[(2'h2):(2'h2)]});
  always
    @(posedge clk) begin
      if ((wire108[(3'h5):(3'h4)] & wire102[(2'h2):(1'h1)]))
        begin
          reg125 <= $unsigned((8'hae));
          reg126 <= wire103[(2'h2):(1'h1)];
          reg127 <= (~^$unsigned(((reg115[(2'h2):(1'h1)] ?
                  wire101[(1'h0):(1'h0)] : $signed(wire124)) ?
              $signed((8'hab)) : (wire109[(5'h11):(3'h5)] ?
                  (reg114 * (8'hb9)) : (reg117 ~^ reg105)))));
          if ($unsigned(wire102[(4'h8):(2'h3)]))
            begin
              reg128 <= wire99;
              reg129 <= ($unsigned((-(-(8'hab)))) >= wire106);
            end
          else
            begin
              reg128 <= $signed((wire108 ?
                  ($unsigned($unsigned(wire124)) ?
                      $unsigned((reg114 ?
                          wire103 : reg128)) : $unsigned((wire109 >= (8'had)))) : (^$signed($unsigned(reg116)))));
              reg129 <= $signed((!$unsigned($signed((wire108 | wire100)))));
              reg130 <= reg114;
            end
        end
      else
        begin
          if (reg126)
            begin
              reg125 <= (^{reg130[(2'h2):(1'h1)],
                  (~&(wire103[(3'h4):(3'h4)] ?
                      ((8'hbe) ? wire99 : reg129) : (^reg128)))});
            end
          else
            begin
              reg125 <= wire103;
            end
        end
    end
  always
    @(posedge clk) begin
      reg131 <= (8'hb4);
      reg132 <= (wire99[(4'hc):(3'h7)] & reg129[(1'h1):(1'h1)]);
      if (($unsigned(wire110[(1'h1):(1'h1)]) ?
          ((&$signed(reg120[(4'h9):(1'h1)])) & wire107[(4'ha):(3'h7)]) : {(wire110[(3'h4):(1'h1)] >> reg105)}))
        begin
          reg133 <= wire110[(4'hf):(3'h5)];
        end
      else
        begin
          if ((^~reg116[(1'h0):(1'h0)]))
            begin
              reg133 <= {$unsigned({(8'haa), $unsigned((reg116 >> reg105))})};
              reg134 <= reg128;
              reg135 <= $signed(({$signed($signed(reg127))} && wire111));
              reg136 <= (+wire113);
            end
          else
            begin
              reg133 <= ($signed($signed(wire113[(3'h7):(3'h4)])) ?
                  $signed((!wire113)) : $unsigned((|(reg135[(4'hf):(2'h2)] << reg131[(2'h3):(2'h3)]))));
              reg134 <= reg123[(2'h3):(2'h2)];
              reg135 <= (reg115 ?
                  ($unsigned((^~$signed(reg135))) << ((reg119[(2'h2):(1'h0)] ?
                          (reg133 * reg122) : wire110) ?
                      wire124 : (~&(reg132 ?
                          reg114 : reg105)))) : $unsigned({((reg129 ?
                              reg123 : reg134) ?
                          {reg123} : $signed(wire112)),
                      (reg132 == {reg105})}));
            end
          if (wire100)
            begin
              reg137 <= (((^~((wire103 ? wire110 : wire108) <= reg130)) ?
                  (wire101 ?
                      reg129[(3'h6):(2'h3)] : (reg136 ^ reg127)) : ($signed(((8'hb3) >= reg125)) != $unsigned(reg121))) >= wire103);
            end
          else
            begin
              reg137 <= ($signed($signed(reg118)) ?
                  reg125[(3'h7):(3'h5)] : $unsigned($signed(((reg132 ~^ wire109) == wire110))));
              reg138 <= ($unsigned(wire101[(1'h0):(1'h0)]) ?
                  (^wire107[(3'h4):(2'h3)]) : ((8'h9d) >= $signed((!wire100))));
            end
          reg139 <= (({(wire106 ?
                  (-wire103) : $signed(reg116))} >>> ({$signed((8'h9e)),
              wire124[(2'h2):(2'h2)]} | reg114[(4'hd):(4'hd)])) ^~ ((8'ha2) ?
              $unsigned(((wire101 ? wire102 : reg128) ?
                  reg121[(1'h0):(1'h0)] : reg121)) : (!({reg131} ?
                  $signed(wire100) : $unsigned(reg118)))));
          if ((^~reg131[(2'h2):(2'h2)]))
            begin
              reg140 <= (~&reg133[(2'h3):(2'h2)]);
              reg141 <= $signed($signed($signed({$signed(reg118), wire102})));
              reg142 <= ({(~^reg130), reg131[(1'h1):(1'h1)]} ?
                  $unsigned($unsigned({(reg119 ?
                          reg136 : reg127)})) : $unsigned((8'hb7)));
            end
          else
            begin
              reg140 <= ($unsigned((wire108 | wire101[(1'h1):(1'h0)])) ?
                  reg137 : ({(&$unsigned((8'had))), {(+wire101)}} ?
                      (~|(wire106 ?
                          (8'ha1) : wire100[(2'h2):(1'h1)])) : reg135[(4'he):(2'h3)]));
              reg141 <= ((^(~(8'hab))) <= ((reg129 <= $signed({reg121,
                  reg119})) >> (^reg132[(2'h2):(1'h1)])));
              reg142 <= $signed(wire107[(3'h4):(2'h3)]);
              reg143 <= $unsigned($signed(wire101));
              reg144 <= reg127[(4'h8):(2'h2)];
            end
        end
      reg145 <= ($signed((reg144[(4'hd):(1'h0)] ?
          reg130[(3'h4):(1'h1)] : (~(wire109 - reg141)))) & ((($unsigned(reg138) > {wire110}) != ((reg139 ?
              wire109 : reg140) >= reg137[(4'hd):(1'h0)])) ?
          (~reg123) : ((&wire107) > reg127)));
      if (wire112[(3'h6):(2'h3)])
        begin
          if (wire112)
            begin
              reg146 <= reg131;
              reg147 <= $unsigned(($unsigned(($unsigned(reg123) ?
                      (wire103 ? reg117 : reg114) : (~|wire100))) ?
                  ((8'hb3) + reg114) : (~|$unsigned($signed(reg134)))));
              reg148 <= reg123[(2'h2):(2'h2)];
              reg149 <= reg128;
            end
          else
            begin
              reg146 <= $signed($unsigned(reg120));
              reg147 <= wire107;
            end
        end
      else
        begin
          reg146 <= ((reg131[(1'h1):(1'h1)] ^ {(!(reg117 ? wire112 : (8'hbe))),
              ((|(8'hba)) >= reg121[(2'h2):(2'h2)])}) <= $signed($unsigned((reg147 ?
              (wire124 + reg120) : $signed(reg114)))));
          reg147 <= ((~reg131) + ((($signed(reg133) ?
                  $unsigned(reg127) : (~^reg132)) ?
              $unsigned((reg114 ? wire112 : wire107)) : ($signed(wire112) ?
                  $unsigned(reg117) : $signed((8'hbe)))) < $signed((~^reg133))));
        end
    end
  assign wire150 = (($unsigned((8'haa)) << reg140[(4'ha):(1'h0)]) + (({(reg120 ?
                           reg139 : reg141),
                       (reg137 && reg140)} << ({reg144, reg129} ?
                       $signed(reg122) : reg125)) << $signed($signed((~^(8'hb4))))));
  always
    @(posedge clk) begin
      if ($signed(reg137[(3'h7):(3'h5)]))
        begin
          reg151 <= ($unsigned(($unsigned((^~reg144)) ?
              {reg117[(1'h1):(1'h1)]} : $unsigned((wire150 ?
                  wire101 : reg122)))) + $signed(wire109[(1'h0):(1'h0)]));
          reg152 <= $unsigned(($unsigned($unsigned((reg114 >= wire99))) || ($signed(reg125) ?
              reg137[(5'h12):(5'h12)] : reg144[(5'h11):(1'h0)])));
          reg153 <= reg139;
          reg154 <= (!{reg138[(4'hc):(2'h2)], reg148[(3'h5):(2'h3)]});
          if ((8'hac))
            begin
              reg155 <= $signed($signed((+{(-(8'ha5)), (-reg138)})));
              reg156 <= reg136;
              reg157 <= (-(wire112 != ((!$signed((8'haf))) - $unsigned(reg140))));
            end
          else
            begin
              reg155 <= (($unsigned(((reg148 + reg136) & (reg148 < reg142))) ?
                  (~&(8'haf)) : {(~&(reg143 ^ wire101))}) ~^ $signed({wire150,
                  reg130[(3'h7):(3'h5)]}));
              reg156 <= $signed(reg132[(4'he):(1'h0)]);
            end
        end
      else
        begin
          reg151 <= $unsigned($signed($signed($unsigned((~|reg125)))));
          reg152 <= ($unsigned($signed($unsigned((reg121 ? reg147 : reg117)))) ?
              ((-reg118[(2'h2):(1'h0)]) ?
                  (+((-reg140) ?
                      $unsigned((8'hbd)) : $signed(reg133))) : $signed($unsigned($unsigned(reg136)))) : (~&{$unsigned(reg137[(5'h11):(3'h7)])}));
          reg153 <= (&reg148[(3'h5):(2'h3)]);
          if (reg143)
            begin
              reg154 <= (8'hbb);
              reg155 <= reg154[(2'h3):(2'h3)];
            end
          else
            begin
              reg154 <= {(^~reg114[(1'h1):(1'h0)])};
              reg155 <= $unsigned(reg152[(4'h9):(4'h9)]);
              reg156 <= $signed(reg152);
              reg157 <= $signed(($signed(({reg114} > ((8'h9f) - reg154))) ?
                  {$signed(reg154),
                      $unsigned((-(8'hbd)))} : ({(8'hba)} || reg135)));
            end
        end
      reg158 <= ($signed(($signed($signed(reg143)) ?
          $unsigned((reg118 ?
              wire108 : reg143)) : reg125[(1'h1):(1'h1)])) ^ (((^~{wire100}) ~^ (^$unsigned((8'ha7)))) ?
          {{(wire110 ? (7'h44) : reg152)},
              ($unsigned(reg131) ?
                  $signed(wire100) : (reg141 & reg147))} : ($unsigned((reg152 + reg132)) ~^ $unsigned((wire99 + reg137)))));
      if ((((reg158[(3'h7):(3'h4)] ?
                  $unsigned({reg131, (7'h40)}) : $unsigned((^wire103))) ?
              reg151 : wire112[(3'h5):(2'h3)]) ?
          wire113 : reg154))
        begin
          reg159 <= $signed(wire108[(2'h3):(2'h3)]);
        end
      else
        begin
          reg159 <= wire108;
        end
    end
  assign wire160 = (-$signed((^~$signed((reg152 ? (8'hae) : wire124)))));
  assign wire161 = reg118[(1'h1):(1'h1)];
  assign wire162 = (((~$signed(wire113)) ?
                           reg154 : (((+reg128) ? ((8'hbb) | reg141) : reg132) ?
                               (^~reg142) : (reg126 ?
                                   reg115[(3'h5):(2'h3)] : $unsigned(reg145)))) ?
                       $unsigned((~^((reg117 == wire160) ?
                           (wire108 ?
                               reg125 : reg105) : reg144[(4'h8):(1'h1)]))) : ({reg142[(2'h3):(1'h0)]} > {$signed((8'hb3)),
                           {$signed(wire102), $signed(reg146)}}));
endmodule
