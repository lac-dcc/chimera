module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h263):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire278;
  wire signed [(4'hb):(1'h0)] wire250;
  wire [(4'hd):(1'h0)] wire249;
  wire [(4'hb):(1'h0)] wire248;
  wire [(5'h14):(1'h0)] wire247;
  wire signed [(2'h2):(1'h0)] wire246;
  wire signed [(4'he):(1'h0)] wire245;
  wire signed [(4'h9):(1'h0)] wire244;
  wire signed [(4'h9):(1'h0)] wire236;
  wire [(3'h5):(1'h0)] wire235;
  wire signed [(3'h7):(1'h0)] wire234;
  wire signed [(5'h15):(1'h0)] wire233;
  wire signed [(3'h4):(1'h0)] wire227;
  wire signed [(4'hb):(1'h0)] wire226;
  wire signed [(4'hd):(1'h0)] wire224;
  reg signed [(5'h13):(1'h0)] reg277 = (1'h0);
  reg [(3'h7):(1'h0)] reg276 = (1'h0);
  reg [(4'he):(1'h0)] reg275 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg274 = (1'h0);
  reg [(4'hb):(1'h0)] reg273 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg272 = (1'h0);
  reg [(5'h10):(1'h0)] reg271 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg270 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg269 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg268 = (1'h0);
  reg [(4'ha):(1'h0)] reg267 = (1'h0);
  reg [(2'h3):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg265 = (1'h0);
  reg [(2'h3):(1'h0)] reg264 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg263 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg262 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg261 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg260 = (1'h0);
  reg [(4'hd):(1'h0)] reg259 = (1'h0);
  reg [(5'h13):(1'h0)] reg258 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg257 = (1'h0);
  reg [(5'h13):(1'h0)] reg256 = (1'h0);
  reg [(5'h14):(1'h0)] reg255 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg253 = (1'h0);
  reg [(4'ha):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg251 = (1'h0);
  reg [(5'h14):(1'h0)] reg243 = (1'h0);
  reg [(4'he):(1'h0)] reg242 = (1'h0);
  reg [(3'h4):(1'h0)] reg241 = (1'h0);
  reg [(3'h5):(1'h0)] reg240 = (1'h0);
  reg [(3'h7):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg238 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg237 = (1'h0);
  reg [(3'h7):(1'h0)] reg232 = (1'h0);
  reg [(2'h2):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg228 = (1'h0);
  assign y = {wire278,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire227,
                 wire226,
                 wire224,
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
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 (1'h0)};
  module4 #() modinst225 (wire224, clk, wire0, wire1, wire2, wire3);
  assign wire226 = wire0;
  assign wire227 = $signed(wire0[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg228 <= (-wire226);
      reg229 <= ($signed($unsigned((&$signed((8'hbc))))) ?
          (|{$signed($unsigned(wire2))}) : (($unsigned($unsigned(wire0)) < (8'hbd)) <<< $unsigned((|wire226))));
      reg230 <= (|({(~&(8'hb1))} ?
          ((wire224[(2'h2):(1'h1)] <= $signed(wire226)) ?
              (wire227[(1'h0):(1'h0)] != wire224) : (8'hb4)) : wire1[(4'h9):(4'h8)]));
      reg231 <= $signed((&reg228[(3'h5):(1'h1)]));
      reg232 <= (reg231 ~^ $signed(({(reg231 <<< wire227)} + $signed((wire1 ^ reg231)))));
    end
  assign wire233 = {(|wire227)};
  assign wire234 = wire0;
  assign wire235 = (~(((~&(reg232 ~^ reg232)) ?
                       (wire234[(1'h0):(1'h0)] | reg230) : reg230[(4'hc):(4'ha)]) > wire0));
  assign wire236 = wire0[(4'hc):(3'h5)];
  always
    @(posedge clk) begin
      if ($unsigned({($unsigned(reg228) ?
              {$signed(wire234), $unsigned(wire227)} : (((8'ha8) || (8'ha8)) ?
                  {reg228} : (&wire236)))}))
        begin
          reg237 <= wire227;
        end
      else
        begin
          if ($unsigned($signed((+{{reg229}, (-(8'hb3))}))))
            begin
              reg237 <= wire3[(3'h4):(3'h4)];
              reg238 <= reg231[(2'h2):(2'h2)];
              reg239 <= (wire3 ^ (~wire235));
            end
          else
            begin
              reg237 <= $unsigned($signed({{{wire226, wire224}}}));
              reg238 <= (reg228 >>> ((~|reg231[(1'h0):(1'h0)]) ?
                  ((~^(&(8'hb7))) <= $signed($signed(wire234))) : $unsigned($signed(((8'hae) || wire1)))));
            end
          reg240 <= {($unsigned(($signed(reg231) ?
                      {wire226, (7'h40)} : reg232[(1'h1):(1'h0)])) ?
                  wire2[(5'h12):(4'hc)] : wire2[(4'h9):(3'h7)]),
              reg229[(4'h9):(1'h0)]};
          reg241 <= (+$signed(wire226[(3'h7):(3'h7)]));
          reg242 <= $signed($unsigned(($unsigned(reg228[(3'h5):(2'h2)]) >> ($unsigned(wire226) ^ (~|(8'hb4))))));
          reg243 <= $unsigned(reg240);
        end
    end
  assign wire244 = reg230;
  assign wire245 = $signed((reg231 ?
                       $signed($signed((wire227 ?
                           reg229 : (7'h40)))) : reg228[(1'h1):(1'h1)]));
  assign wire246 = (($signed($unsigned(reg242)) ?
                           wire233[(5'h12):(2'h2)] : $signed(wire236[(2'h3):(2'h3)])) ?
                       {(((reg240 ? reg242 : wire1) ?
                               (reg243 == wire235) : $unsigned(reg229)) <<< (reg232 ?
                               $unsigned(wire0) : $signed((8'h9e)))),
                           $signed($signed($unsigned(wire236)))} : $unsigned($unsigned(((reg239 ?
                           reg240 : wire2) <= reg240))));
  assign wire247 = (((&$unsigned((8'hb7))) ?
                       (($unsigned(wire233) | $unsigned(wire246)) == $unsigned(((8'hb2) <= reg243))) : (^(~(wire0 ?
                           wire226 : reg231)))) >>> ($signed((~|wire236[(2'h3):(1'h1)])) ?
                       ({(&wire245)} ?
                           $signed({wire233,
                               (8'had)}) : wire246[(1'h0):(1'h0)]) : $signed(((wire2 + reg237) ~^ $unsigned(wire244)))));
  assign wire248 = ((~^((8'hb6) ?
                       reg239[(2'h2):(1'h1)] : $signed($signed(wire235)))) > $unsigned({wire3,
                       (!(wire1 && wire3))}));
  assign wire249 = (!$signed($signed({$unsigned(wire236)})));
  assign wire250 = ($unsigned((&$unsigned((^reg229)))) && wire247[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg251 <= $unsigned(wire245[(4'hb):(3'h4)]);
      if (($signed(wire235) ?
          ($unsigned((!(wire249 ?
              wire247 : wire247))) >> $unsigned($unsigned(wire0[(4'he):(2'h3)]))) : (wire236 ?
              $unsigned((reg231 || (+wire235))) : (~$signed((~&wire224))))))
        begin
          if (($unsigned({wire226[(3'h5):(1'h0)]}) ?
              ((!$unsigned((+wire2))) ^~ $signed($signed(wire236[(2'h2):(1'h0)]))) : (~&(~wire235))))
            begin
              reg252 <= $unsigned($signed(((~^(wire233 <<< wire247)) != $unsigned((~|wire3)))));
              reg253 <= wire248[(2'h3):(1'h0)];
              reg254 <= (-(-$signed(((reg239 && wire246) <= wire227))));
              reg255 <= $signed((^$signed($unsigned((reg230 ?
                  wire250 : reg254)))));
            end
          else
            begin
              reg252 <= reg230;
              reg253 <= reg242;
              reg254 <= {(+$unsigned(wire227[(1'h1):(1'h1)]))};
              reg255 <= (~|(7'h43));
              reg256 <= reg229;
            end
          reg257 <= (($unsigned(reg254) >= $unsigned(($unsigned(reg241) ?
              (wire234 ? (8'ha3) : reg255) : (wire224 ?
                  wire247 : wire234)))) >>> ($unsigned((wire224 && {reg229,
              reg242})) - (8'hbf)));
          reg258 <= wire226[(4'h8):(3'h5)];
        end
      else
        begin
          reg252 <= ($signed($unsigned((!wire234[(2'h3):(2'h2)]))) ?
              {reg232,
                  ((wire248 ?
                      (-reg243) : reg237) >= (~^reg251))} : (~$unsigned(({reg255,
                  reg230} ^ (~&reg229)))));
          if ((($signed($unsigned((wire248 ? wire235 : reg241))) ?
                  reg230[(1'h0):(1'h0)] : $unsigned($unsigned(reg231[(1'h0):(1'h0)]))) ?
              wire3[(4'h9):(1'h0)] : $signed({(~|wire0), wire224})))
            begin
              reg253 <= wire235[(2'h3):(1'h0)];
            end
          else
            begin
              reg253 <= wire227[(1'h0):(1'h0)];
              reg254 <= $signed($unsigned((((~reg254) ?
                  wire249[(1'h1):(1'h0)] : reg256[(5'h12):(4'ha)]) == wire244[(3'h7):(3'h7)])));
            end
        end
      reg259 <= wire248;
    end
  always
    @(posedge clk) begin
      reg260 <= wire224[(4'hc):(2'h3)];
      reg261 <= reg238[(3'h4):(2'h2)];
      reg262 <= $signed({reg242});
      if ((((|$unsigned($unsigned((8'hbc)))) <<< (($signed(wire226) && (&reg239)) & ({(8'ha8)} ?
              ((7'h40) ? wire224 : reg230) : $signed(wire245)))) ?
          ($signed(({wire249} & reg252[(1'h1):(1'h0)])) ?
              $unsigned(reg239) : (^~{(wire224 ^ reg255)})) : ({(8'hb8)} + (&(&wire234[(2'h3):(1'h0)])))))
        begin
          reg263 <= $unsigned(wire226[(3'h5):(1'h1)]);
        end
      else
        begin
          reg263 <= $unsigned($signed(wire244));
          reg264 <= wire247;
          reg265 <= {$unsigned({wire249[(3'h5):(3'h5)], wire250})};
          reg266 <= $signed({{$unsigned(wire245)},
              ($signed(reg231) > (!(reg260 + reg241)))});
        end
      if (reg237)
        begin
          reg267 <= $unsigned({$signed(reg263),
              ((!wire235) >= ((reg255 || reg263) ?
                  $signed((8'hae)) : wire233))});
        end
      else
        begin
          if (((((+$unsigned(wire246)) >> wire0[(2'h2):(1'h0)]) ~^ (reg240 ?
                  (|(^reg254)) : $signed(wire236[(3'h4):(3'h4)]))) ?
              $unsigned({reg228[(3'h4):(1'h0)]}) : (-reg267)))
            begin
              reg267 <= ((~((~reg263[(2'h2):(2'h2)]) ?
                  {$signed(wire248)} : $signed({wire244,
                      reg264}))) == (wire224[(4'hc):(1'h1)] ?
                  (!((reg265 ? (8'ha8) : reg258) ?
                      $unsigned((8'hac)) : (reg237 < wire244))) : reg251));
              reg268 <= ($unsigned($unsigned((^$unsigned(reg267)))) ?
                  (+(wire1[(4'hc):(4'hb)] * {(reg262 || reg260)})) : wire248[(4'hb):(1'h1)]);
              reg269 <= reg254[(3'h4):(2'h3)];
              reg270 <= $signed($signed((~((-wire234) ?
                  $unsigned(wire247) : $unsigned(reg267)))));
              reg271 <= ((($signed($signed(wire246)) > ((wire0 ?
                      reg264 : (8'ha1)) ?
                  reg229[(3'h7):(3'h7)] : reg265[(3'h5):(1'h0)])) & ($unsigned($unsigned(reg228)) <= wire249)) ^~ {$unsigned(((+(8'hae)) ?
                      (^~(8'ha6)) : (wire2 ? reg239 : wire3)))});
            end
          else
            begin
              reg267 <= wire249;
            end
          if (reg243)
            begin
              reg272 <= ($unsigned(wire248[(3'h7):(3'h4)]) ~^ (($signed($signed(reg269)) ?
                  ((~^wire234) ?
                      ((8'h9e) ?
                          (8'ha5) : reg259) : $unsigned(reg228)) : $unsigned($signed(wire3))) & reg267));
              reg273 <= reg260;
              reg274 <= reg269[(4'he):(4'h8)];
            end
          else
            begin
              reg272 <= $unsigned({{(+(reg232 <<< reg238)), reg262}});
              reg273 <= ({reg251[(4'hb):(1'h0)],
                  {$signed($signed(reg259))}} == (^$signed(($signed(reg229) ?
                  $unsigned(wire2) : (&wire246)))));
              reg274 <= $signed(reg253[(4'h9):(4'h9)]);
              reg275 <= $unsigned(reg252);
              reg276 <= (reg242[(1'h1):(1'h0)] + ((~($signed(wire226) | wire233)) ^ $signed($unsigned((8'ha6)))));
            end
          reg277 <= $signed(({(~|$unsigned(reg259)),
              ((reg270 + reg262) < (reg240 >>> (8'hb2)))} > $unsigned(reg270[(4'h8):(1'h0)])));
        end
    end
  assign wire278 = ($unsigned((|(wire244 * $unsigned(reg260)))) == ($signed((~(8'hb5))) ?
                       {((8'hbc) || wire224)} : $signed($signed($unsigned(reg262)))));
endmodule

module module4
#(parameter param222 = (({((8'ha4) ? (^~(7'h44)) : ((8'h9f) ? (8'hb2) : (8'hb2)))} ? (~(((8'hbc) == (7'h41)) ? {(8'h9e)} : {(8'hae)})) : (8'hb1)) << ((!({(8'ha6)} ? {(7'h44), (8'ha2)} : ((8'hb9) ? (7'h42) : (8'h9d)))) < (((~^(8'hab)) || ((8'hae) == (8'ha1))) ? (((8'h9c) ? (8'hb6) : (8'hbb)) ^~ (8'hbb)) : (~|((8'ha9) ? (8'hb9) : (8'hb7)))))), 
parameter param223 = ({{{{(8'ha5)}}, (^~(param222 ? param222 : param222))}, (&(((8'ha9) ? param222 : param222) ? param222 : {param222, (8'hb8)}))} == ((+param222) ? ({(param222 ^ param222)} ? ((param222 == param222) ? (8'h9d) : ((8'hb4) + param222)) : (&(param222 ^ param222))) : (!(8'h9c)))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h22c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire [(4'ha):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire221;
  wire signed [(4'ha):(1'h0)] wire220;
  wire signed [(4'h8):(1'h0)] wire218;
  wire signed [(4'hf):(1'h0)] wire217;
  wire signed [(5'h13):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire208;
  wire [(4'hc):(1'h0)] wire210;
  wire [(2'h2):(1'h0)] wire212;
  wire signed [(5'h12):(1'h0)] wire213;
  wire signed [(4'hc):(1'h0)] wire214;
  wire [(4'hf):(1'h0)] wire215;
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire218,
                 wire217,
                 wire134,
                 wire83,
                 wire64,
                 wire42,
                 wire27,
                 wire9,
                 wire66,
                 wire67,
                 wire81,
                 wire144,
                 wire208,
                 wire210,
                 wire212,
                 wire213,
                 wire214,
                 wire215,
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
                 reg136,
                 reg137,
                 reg138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 (1'h0)};
  assign wire9 = {$unsigned((^~({wire7, wire7} ? (8'haa) : $signed(wire6)))),
                     {(^(~&$unsigned((7'h44)))),
                         (~|((+wire5) ^ (wire7 ^~ wire5)))}};
  module10 #() modinst28 (.wire13(wire9), .wire14(wire7), .wire12(wire5), .y(wire27), .wire11(wire6), .clk(clk));
  always
    @(posedge clk) begin
      reg29 <= $signed(((8'hbd) ?
          {wire9[(2'h2):(2'h2)], $signed((~&wire9))} : (^~$unsigned((wire9 ?
              wire8 : wire6)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire8))
        begin
          if (wire8)
            begin
              reg30 <= $unsigned(((8'hb5) ?
                  wire9 : (&({(7'h43)} | (wire27 ? (8'hb9) : wire27)))));
              reg31 <= (|wire9);
              reg32 <= wire8;
              reg33 <= (+wire6[(4'ha):(2'h3)]);
              reg34 <= (reg30[(1'h0):(1'h0)] ?
                  reg29[(1'h1):(1'h1)] : (({$signed(reg31), wire7} ?
                          reg30[(4'hb):(4'h8)] : $unsigned((wire27 != wire9))) ?
                      wire7 : (|$signed((reg32 ? reg31 : (8'had))))));
            end
          else
            begin
              reg30 <= {$signed(({(reg31 | wire8)} ?
                      wire8[(5'h11):(1'h1)] : (-$signed(reg31))))};
              reg31 <= ($signed(((((8'ha7) < wire7) ?
                      wire9 : (wire6 ? (8'hb0) : wire27)) ?
                  ({reg34,
                      (8'hb0)} > (reg31 - reg31)) : (^(wire27 >= wire27)))) + reg32);
              reg32 <= reg31;
              reg33 <= (-reg31[(3'h5):(2'h2)]);
              reg34 <= reg34;
            end
        end
      else
        begin
          reg30 <= reg30;
        end
      if (({(~(~$signed(reg29))), $unsigned(reg30)} <<< (!(({reg33,
          wire27} >> (wire6 ? (8'hbd) : wire6)) < wire8))))
        begin
          reg35 <= {$unsigned(reg31),
              $signed((wire9[(3'h4):(3'h4)] << (|reg30)))};
          reg36 <= (wire8[(3'h6):(2'h3)] ?
              $unsigned((reg29 ~^ wire8[(3'h5):(2'h2)])) : reg34[(4'h9):(3'h7)]);
          reg37 <= $signed(((!((|(8'hb8)) && reg32[(4'hf):(4'h9)])) >>> {(^(reg31 ?
                  reg33 : reg34)),
              wire9}));
        end
      else
        begin
          if (reg31[(1'h1):(1'h0)])
            begin
              reg35 <= reg37[(5'h10):(1'h0)];
              reg36 <= $signed({(8'hb9)});
            end
          else
            begin
              reg35 <= ($signed($signed($unsigned(reg31))) ?
                  (({$signed(wire9), (reg29 ? (8'haf) : reg34)} ?
                          ((reg30 && wire6) ?
                              (!reg37) : {reg37, (7'h42)}) : (~|((8'hac) ?
                              reg33 : (8'h9f)))) ?
                      (((+wire6) * $signed(wire6)) | (&(~reg29))) : ($signed($unsigned(reg31)) == ((~^(8'hb4)) <<< (reg31 >= (8'hae))))) : (wire5[(3'h4):(2'h3)] ~^ ({(reg31 ?
                              wire8 : reg32),
                          reg35} ?
                      ($unsigned(reg30) >= reg31[(3'h5):(1'h1)]) : reg32)));
              reg36 <= reg34[(4'ha):(3'h4)];
            end
          if (wire9[(4'h8):(2'h2)])
            begin
              reg37 <= {reg36};
              reg38 <= (7'h44);
              reg39 <= reg33[(1'h0):(1'h0)];
            end
          else
            begin
              reg37 <= reg31[(3'h4):(1'h1)];
            end
        end
      reg40 <= reg32;
      reg41 <= $unsigned((reg40 ? wire6 : $signed(reg39)));
    end
  assign wire42 = wire27;
  module43 #() modinst65 (wire64, clk, reg39, wire6, wire9, wire27, reg34);
  assign wire66 = wire27;
  assign wire67 = (~|reg32);
  module68 #() modinst82 (.y(wire81), .wire73(reg32), .wire72(wire7), .wire69(wire8), .wire70(wire64), .clk(clk), .wire71(reg29));
  assign wire83 = $unsigned($signed($signed(wire8)));
  module84 #() modinst135 (wire134, clk, reg34, reg36, reg37, wire64);
  always
    @(posedge clk) begin
      reg136 <= $signed($unsigned(reg32[(2'h2):(1'h1)]));
      reg137 <= wire7;
      if (((($unsigned(reg36) != wire66[(1'h1):(1'h1)]) >> $signed(((reg136 ?
              reg34 : wire83) ?
          (wire5 | wire27) : $unsigned(reg34)))) & (reg39 * reg30)))
        begin
          reg138 <= ($signed($signed($unsigned($signed((7'h43))))) && reg137);
          reg139 <= (~|$signed(wire6));
          reg140 <= reg137[(4'ha):(1'h1)];
          reg141 <= {reg35[(3'h6):(1'h0)],
              ($unsigned(reg33[(1'h1):(1'h1)]) ?
                  reg139[(1'h1):(1'h0)] : $signed((8'ha2)))};
        end
      else
        begin
          if ((reg37 ?
              {reg31[(4'h9):(3'h4)]} : $signed((wire134 ? (8'hab) : wire7))))
            begin
              reg138 <= ((wire83[(3'h4):(2'h3)] && $signed(wire5)) ?
                  $unsigned($signed($unsigned($unsigned(reg31)))) : (wire7[(4'h9):(3'h7)] ?
                      $unsigned({$signed(reg40)}) : reg141[(3'h6):(1'h1)]));
              reg139 <= (~&(reg40[(3'h7):(2'h2)] < reg34[(4'hd):(2'h2)]));
              reg140 <= ($signed((reg30[(1'h1):(1'h0)] >= wire64)) >> $unsigned((~^reg35[(3'h7):(3'h4)])));
            end
          else
            begin
              reg138 <= wire134;
            end
        end
      reg142 <= $unsigned({reg40[(3'h4):(1'h0)]});
      reg143 <= $signed(((((reg29 && wire67) ?
          (reg136 >> reg32) : reg32[(1'h1):(1'h1)]) >> {$unsigned(wire9),
          (^reg138)}) < reg139));
    end
  assign wire144 = $unsigned({$unsigned((^$signed(reg142)))});
  module145 #() modinst209 (wire208, clk, reg136, reg142, reg141, reg38);
  module145 #() modinst211 (.wire149(reg30), .wire146(wire27), .y(wire210), .wire148(wire7), .wire147(reg138), .clk(clk));
  assign wire212 = (({$unsigned(reg36),
                       reg41[(5'h10):(1'h0)]} ^~ reg31[(4'h8):(2'h3)]) < (~^((7'h41) ?
                       (~wire210[(2'h2):(2'h2)]) : wire210[(1'h1):(1'h1)])));
  assign wire213 = $unsigned({reg35[(4'h8):(4'h8)]});
  assign wire214 = (~&(wire64[(4'h9):(3'h7)] ?
                       wire134[(2'h3):(2'h2)] : $unsigned(reg40[(3'h7):(3'h6)])));
  module145 #() modinst216 (.clk(clk), .wire148(reg33), .wire146(reg37), .y(wire215), .wire149(reg137), .wire147(wire213));
  assign wire217 = $signed($signed({(-wire81[(5'h12):(4'hb)])}));
  module145 #() modinst219 (.wire148(wire5), .clk(clk), .wire147(wire66), .wire149(wire134), .y(wire218), .wire146(wire210));
  assign wire220 = reg143[(1'h0):(1'h0)];
  assign wire221 = $unsigned((&$signed((^~(reg41 && reg34)))));
endmodule

module module145
#(parameter param207 = ((((((8'hb0) ? (8'ha2) : (8'hb1)) ? {(8'hb7)} : (~&(8'ha7))) * (((8'hba) ? (8'had) : (8'ha7)) ? (8'hbd) : ((8'hab) != (8'hb2)))) ? ({((8'hb1) | (8'ha2))} >> (((8'hb2) && (8'h9c)) ~^ ((8'h9c) + (8'ha0)))) : ((((8'hbd) << (8'h9f)) >>> {(7'h44)}) | (!((8'hb7) + (8'ha7))))) - (({((8'h9c) ? (8'hac) : (8'hb5))} * (((8'had) ? (8'hbb) : (7'h41)) < {(7'h44)})) >> ((+(!(8'ha6))) ? ((~(8'h9d)) ? ((8'haf) - (8'ha0)) : ((8'hbf) >> (8'ha6))) : (|{(8'ha6)})))))
(y, clk, wire149, wire148, wire147, wire146);
  output wire [(32'h29a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire149;
  input wire signed [(4'h9):(1'h0)] wire148;
  input wire [(4'h8):(1'h0)] wire147;
  input wire signed [(4'hb):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire206;
  wire [(4'hd):(1'h0)] wire197;
  wire signed [(5'h11):(1'h0)] wire196;
  wire [(3'h4):(1'h0)] wire181;
  wire signed [(4'he):(1'h0)] wire180;
  wire signed [(5'h12):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire178;
  wire signed [(3'h4):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire175;
  wire signed [(3'h6):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire161;
  wire signed [(5'h13):(1'h0)] wire160;
  reg [(2'h3):(1'h0)] reg205 = (1'h0);
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg199 = (1'h0);
  reg [(4'hd):(1'h0)] reg198 = (1'h0);
  reg [(4'h8):(1'h0)] reg195 = (1'h0);
  reg [(3'h6):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg193 = (1'h0);
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg [(3'h4):(1'h0)] reg191 = (1'h0);
  reg [(3'h6):(1'h0)] reg190 = (1'h0);
  reg [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(5'h13):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg187 = (1'h0);
  reg [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg171 = (1'h0);
  reg [(4'ha):(1'h0)] reg170 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  assign y = {wire206,
                 wire197,
                 wire196,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire161,
                 wire160,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg195,
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
                 reg163,
                 reg162,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned({(8'hb2), (wire147[(3'h7):(3'h4)] <<< wire146)}))
        begin
          reg150 <= (8'hbd);
          reg151 <= wire148;
          reg152 <= $signed((reg150[(3'h4):(1'h1)] ?
              (!($unsigned(wire149) < reg151)) : wire148[(1'h0):(1'h0)]));
        end
      else
        begin
          reg150 <= reg152;
          reg151 <= $signed($unsigned(reg151[(2'h3):(2'h3)]));
          reg152 <= wire148;
        end
    end
  always
    @(posedge clk) begin
      reg153 <= (((8'ha2) ?
          (~&((~wire148) ?
              $signed(wire149) : (^~(8'hbc)))) : $signed((~^(-reg150)))) > (^~$signed(($unsigned(wire146) ?
          ((8'ha3) >> wire148) : ((8'hb5) + reg151)))));
      if ($signed((|$unsigned(wire147))))
        begin
          reg154 <= $unsigned(reg152);
          reg155 <= ({(&$unsigned((reg152 ~^ (8'had))))} ?
              $unsigned(wire146[(1'h1):(1'h1)]) : ((~(reg153 ?
                      (+wire147) : (8'ha7))) ?
                  (reg150[(1'h0):(1'h0)] && reg154[(4'h9):(2'h2)]) : ((wire149 ?
                          {wire146} : $unsigned(wire146)) ?
                      $unsigned((^(8'ha9))) : ($unsigned(reg153) >= $signed(wire148)))));
        end
      else
        begin
          reg154 <= ($signed(((7'h41) && (&wire149[(3'h7):(1'h0)]))) ^~ reg153);
          reg155 <= $unsigned(wire149);
          if (reg151)
            begin
              reg156 <= (reg151[(5'h10):(4'ha)] << reg150[(3'h4):(1'h1)]);
              reg157 <= reg152;
              reg158 <= (reg156 ?
                  (^~$unsigned(($unsigned(wire146) == (8'hb3)))) : (8'ha4));
            end
          else
            begin
              reg156 <= wire146[(4'h8):(1'h0)];
              reg157 <= ($signed(wire148[(1'h0):(1'h0)]) ?
                  $signed((7'h42)) : (({wire148, (reg154 >= reg150)} ?
                      $signed(wire147) : {reg155}) * $signed($signed($unsigned(reg157)))));
              reg158 <= ($signed($unsigned(((~|reg153) ?
                      ((8'hb9) < reg152) : $signed(reg155)))) ?
                  (!$unsigned(wire148[(1'h0):(1'h0)])) : ((({reg151} >> (wire148 ?
                              (8'ha8) : (8'hac))) ?
                          $unsigned((reg155 ? reg156 : reg150)) : (+reg154)) ?
                      (^$unsigned($unsigned(reg150))) : ({((8'hb6) ^~ wire149)} ?
                          ($unsigned((8'hb6)) & (reg154 ?
                              reg151 : wire148)) : reg156)));
            end
        end
      reg159 <= ($unsigned(reg150) ?
          (~^(~(((8'hbb) - (8'haa)) ^ (wire148 ?
              reg157 : reg152)))) : {reg158[(4'h8):(1'h0)]});
    end
  assign wire160 = reg159;
  assign wire161 = (7'h42);
  always
    @(posedge clk) begin
      reg162 <= (reg150[(1'h1):(1'h1)] ?
          (|(-$unsigned((reg156 ? wire146 : wire148)))) : (wire160 ?
              $unsigned((((7'h40) && reg151) <= $unsigned(wire146))) : reg153[(1'h1):(1'h0)]));
      reg163 <= {((^~($unsigned(reg154) >= reg151)) ?
              $unsigned((wire161 ?
                  reg150[(4'hd):(4'hb)] : $unsigned(reg156))) : $signed((reg162[(1'h1):(1'h1)] ?
                  $signed(reg152) : (wire149 ? reg158 : reg151)))),
          $signed(reg152[(1'h0):(1'h0)])};
      reg164 <= wire146[(3'h7):(2'h3)];
      reg165 <= $unsigned(reg163[(4'he):(3'h4)]);
      if ((~&(8'hae)))
        begin
          reg166 <= ((reg155 ?
                  (8'hbb) : ((~&(reg159 < wire149)) ?
                      ((wire147 <= reg158) & {reg156, reg156}) : reg155)) ?
              reg156 : reg152[(1'h1):(1'h0)]);
          reg167 <= (reg159 > ({((wire146 ?
                      (8'hb0) : reg152) ~^ reg151[(4'hb):(3'h4)])} ?
              reg150[(2'h3):(1'h1)] : $unsigned($unsigned((reg156 ?
                  reg151 : reg156)))));
          if ((7'h43))
            begin
              reg168 <= $unsigned($unsigned($signed(reg154)));
              reg169 <= {(($signed(reg167) >>> $signed({reg162})) ?
                      $signed($signed(((8'hac) | wire148))) : wire148[(3'h6):(1'h0)]),
                  (reg166 >> (^~(8'hbb)))};
              reg170 <= reg166;
              reg171 <= ($signed(($signed((wire161 != wire148)) && ((wire160 >= wire146) <<< (+(8'h9d))))) ?
                  $signed(wire160) : reg151);
            end
          else
            begin
              reg168 <= ($unsigned($unsigned($signed({reg157}))) >> $unsigned((({reg155} != ((8'had) ?
                      reg168 : reg165)) ?
                  $unsigned({reg156}) : (~&$signed(reg165)))));
              reg169 <= ($signed(($signed(((8'hbf) ? reg159 : reg155)) ?
                      reg170 : ($signed(reg158) ?
                          (~^reg156) : (reg163 ? reg168 : (8'hb5))))) ?
                  $signed(reg171[(1'h0):(1'h0)]) : wire160);
              reg170 <= reg167[(3'h7):(2'h2)];
            end
          if ($unsigned($signed(reg167[(4'hf):(2'h3)])))
            begin
              reg172 <= reg164;
              reg173 <= (($signed(wire149[(4'he):(3'h4)]) ?
                  (((reg171 || reg157) >>> (&reg157)) ?
                      reg152 : $signed((^wire148))) : (~|{(reg156 >> reg155)})) & $unsigned((~((&reg155) == ((8'had) & reg150)))));
            end
          else
            begin
              reg172 <= (reg153 - ({($signed(reg159) >> wire146[(4'ha):(2'h2)]),
                  $unsigned((wire147 || reg163))} != (!(reg159 + (^~reg163)))));
            end
        end
      else
        begin
          reg166 <= reg167;
          reg167 <= (~wire149);
          reg168 <= ({reg166[(5'h13):(4'ha)], $signed(reg166)} ?
              ((&reg167) ?
                  wire161 : ({(~|reg150)} ?
                      ($unsigned(reg163) ?
                          wire149[(4'hf):(4'ha)] : $unsigned(reg157)) : (reg172[(2'h2):(2'h2)] == (wire147 * reg170)))) : ($signed($signed(wire147)) ?
                  (~$signed({wire149})) : {reg162[(3'h5):(1'h1)]}));
          reg169 <= $signed(reg172);
        end
    end
  assign wire174 = reg169;
  assign wire175 = (&(&wire148));
  assign wire176 = $unsigned($signed((reg165[(2'h2):(2'h2)] ?
                       {(&reg151)} : (7'h41))));
  assign wire177 = wire146[(3'h6):(2'h3)];
  assign wire178 = wire149[(3'h4):(3'h4)];
  assign wire179 = (wire160[(4'h9):(3'h5)] || ((~((reg151 ? wire146 : reg157) ?
                       reg154[(4'hb):(2'h3)] : (reg164 ^ reg170))) == ((~|(reg154 ?
                           (8'hb3) : reg164)) ?
                       reg154 : (~((7'h42) <<< reg163)))));
  assign wire180 = (($unsigned((^{reg162, (8'hb2)})) ?
                       {((wire161 >> (8'hb2)) || ((8'h9e) <= reg156))} : reg155[(3'h4):(3'h4)]) > (reg165[(2'h3):(2'h2)] >> {((wire149 ~^ reg172) ?
                           (&reg172) : $signed((8'hac))),
                       $unsigned((reg172 ? wire176 : reg172))}));
  assign wire181 = (reg156 && {$signed({reg155[(3'h5):(3'h4)]}),
                       $unsigned((!reg164))});
  always
    @(posedge clk) begin
      reg182 <= (!reg169[(2'h2):(2'h2)]);
      if (wire177[(3'h4):(1'h1)])
        begin
          reg183 <= $unsigned(wire176);
          reg184 <= (((~^({reg162} >> $unsigned(reg156))) * $unsigned((reg164 ?
                  {reg169} : $signed(wire175)))) ?
              reg183[(1'h1):(1'h1)] : {(&wire174)});
          if ((^~wire181))
            begin
              reg185 <= (&{(|((wire146 ?
                      (8'ha0) : reg167) | reg163[(1'h1):(1'h1)]))});
              reg186 <= $unsigned($signed(reg184[(1'h1):(1'h1)]));
              reg187 <= $unsigned(((~(+$unsigned(reg152))) * reg167));
              reg188 <= {$signed(wire174[(3'h6):(3'h4)]),
                  (($signed((reg187 & reg171)) ~^ wire149) || $signed(wire146))};
              reg189 <= (^~(reg154 ^~ (8'hbc)));
            end
          else
            begin
              reg185 <= $signed((~^(~^$unsigned(reg169[(3'h5):(1'h0)]))));
            end
        end
      else
        begin
          reg183 <= $unsigned($unsigned(((^(reg167 ? reg185 : reg153)) ?
              reg158[(2'h3):(2'h3)] : wire179)));
          reg184 <= $signed(wire146[(3'h7):(1'h1)]);
          reg185 <= reg166;
        end
      reg190 <= $signed((wire174 * ((reg189 ? reg172 : $signed(wire160)) ?
          ((reg156 ? reg163 : reg169) ?
              wire179 : reg159) : ({wire174} | (reg187 >>> reg159)))));
      reg191 <= $unsigned((($signed({reg153, (8'hb1)}) | ((reg164 ?
                  reg182 : wire181) ?
              (wire180 >> reg166) : (-reg186))) ?
          $signed(reg172[(3'h7):(3'h4)]) : (+({reg163, wire174} & (reg188 ?
              reg169 : reg158)))));
      if (reg189)
        begin
          if ((~(wire177[(2'h3):(1'h0)] ?
              (($unsigned(reg173) ?
                  reg169 : $signed(wire180)) * reg153) : {$unsigned((8'hb2))})))
            begin
              reg192 <= $signed(wire179[(4'hb):(1'h1)]);
              reg193 <= $signed($signed(({(reg185 + reg153)} ?
                  reg150[(2'h3):(2'h3)] : reg164[(2'h3):(2'h2)])));
              reg194 <= {reg152, reg192[(1'h0):(1'h0)]};
            end
          else
            begin
              reg192 <= reg188;
              reg193 <= wire177;
            end
          reg195 <= wire176[(4'hc):(4'ha)];
        end
      else
        begin
          reg192 <= ((^~((reg170 ? (!reg151) : reg192[(3'h5):(2'h2)]) ?
              reg153 : reg156[(3'h4):(1'h0)])) | (|(((8'hac) ~^ {reg151}) ?
              (wire179[(4'ha):(3'h6)] >> wire180[(3'h7):(3'h6)]) : $signed(reg155[(4'hb):(2'h2)]))));
        end
    end
  assign wire196 = $unsigned(((~|wire174) ~^ $unsigned(reg171[(4'hb):(3'h6)])));
  assign wire197 = $unsigned(wire176[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg198 <= reg167;
      if (reg167[(2'h2):(1'h1)])
        begin
          reg199 <= reg184[(2'h3):(1'h0)];
          reg200 <= (reg187[(5'h14):(4'h9)] ?
              {(reg159[(3'h5):(1'h1)] != ((wire197 ?
                      wire146 : reg194) && $unsigned((8'hb2))))} : ((^~$signed((reg155 ?
                  reg158 : (8'hb3)))) && (+reg151[(4'hd):(4'h9)])));
        end
      else
        begin
          reg199 <= wire175;
          if (({(+{$unsigned(wire160)}),
              $unsigned((((8'ha1) & (8'hb9)) ?
                  (wire149 - reg183) : (reg198 != reg158)))} & (wire179 ?
              $signed(reg167) : {(&reg163[(1'h0):(1'h0)]), reg166})))
            begin
              reg200 <= ((~$signed($signed(reg173))) >> $unsigned({($unsigned((8'had)) ?
                      $signed(wire197) : $unsigned(reg182)),
                  ((~|reg170) | (~&reg153))}));
              reg201 <= $signed($unsigned($unsigned($unsigned(reg156))));
              reg202 <= ((reg189 ?
                  reg170[(4'ha):(3'h4)] : wire180[(4'he):(4'ha)]) > $unsigned($unsigned(reg201)));
            end
          else
            begin
              reg200 <= wire179;
              reg201 <= ((+(~|((wire147 <= reg189) - wire149))) + {$signed($signed($signed(wire160)))});
              reg202 <= {reg189[(1'h1):(1'h1)],
                  (reg155[(2'h3):(1'h0)] ?
                      $unsigned(($signed((8'ha7)) ?
                          {reg192} : (reg195 && wire146))) : $signed(reg188[(4'hc):(2'h2)]))};
            end
        end
      reg203 <= reg171[(3'h7):(1'h0)];
      reg204 <= $unsigned(($signed((+{(8'h9e)})) ?
          wire197 : (wire179 == ((~^wire178) ? $signed(reg166) : {reg156}))));
      reg205 <= $signed(($signed(({reg191, wire176} ?
          $signed(wire176) : (reg187 != (8'hbe)))) + (|(wire147 - reg166))));
    end
  assign wire206 = (reg204 ?
                       $unsigned(reg162[(3'h4):(3'h4)]) : {((^(8'hb5)) ?
                               reg193 : $signed(((7'h40) >>> reg193))),
                           ($unsigned((reg182 ? (8'hb8) : reg184)) ?
                               $signed($unsigned(reg154)) : (reg173[(2'h2):(1'h1)] <<< $unsigned((8'had))))});
endmodule

module module84
#(parameter param133 = (!(+{(((8'hb9) ? (8'hb7) : (8'h9f)) ? ((8'ha7) >> (8'hbb)) : ((7'h40) != (8'hab))), {{(8'ha7)}}})))
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h1e5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire88;
  input wire [(5'h14):(1'h0)] wire87;
  input wire signed [(2'h3):(1'h0)] wire86;
  input wire [(3'h6):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(5'h12):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire89;
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire91,
                 wire90,
                 wire89,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
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
                 (1'h0)};
  assign wire89 = ($unsigned($unsigned((8'hac))) >>> ($signed((wire85[(2'h2):(1'h0)] && wire86)) | (^(8'hbc))));
  assign wire90 = (((^~$unsigned($unsigned(wire85))) < (~^$unsigned({wire88,
                          wire87}))) ?
                      wire88[(1'h1):(1'h0)] : wire85);
  assign wire91 = wire87[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire86[(1'h1):(1'h1)])
        begin
          reg92 <= $unsigned(wire90);
          reg93 <= ($signed(wire89[(1'h1):(1'h0)]) ?
              $unsigned(wire85[(2'h2):(1'h1)]) : ($unsigned(($signed((8'hb4)) - (wire86 ?
                      wire85 : wire90))) ?
                  $signed((~(wire85 ?
                      wire89 : wire86))) : {wire89[(2'h2):(1'h1)]}));
          reg94 <= {(wire89[(5'h14):(5'h12)] ?
                  reg93[(2'h3):(2'h2)] : wire85[(2'h2):(1'h0)])};
        end
      else
        begin
          if ($unsigned($signed($signed(wire85[(3'h5):(3'h5)]))))
            begin
              reg92 <= ($unsigned((~^reg92)) ?
                  $unsigned($unsigned(wire85[(1'h0):(1'h0)])) : $signed(wire89));
              reg93 <= reg93;
            end
          else
            begin
              reg92 <= reg94;
              reg93 <= reg93;
              reg94 <= ((-(+reg94)) ?
                  $signed((&$unsigned(wire85))) : ((($signed(reg92) ?
                          $unsigned((8'hb4)) : $signed(wire90)) ?
                      ($signed(wire91) ?
                          wire86[(2'h3):(1'h0)] : wire88[(3'h4):(1'h0)]) : wire91) == ($signed((wire91 ^~ wire88)) ?
                      wire86[(1'h1):(1'h0)] : $unsigned(reg93[(1'h1):(1'h1)]))));
              reg95 <= (&(^((~|(~reg94)) <<< reg93[(3'h5):(2'h2)])));
              reg96 <= (wire91[(3'h6):(3'h6)] || ((8'hb9) != wire86[(1'h1):(1'h1)]));
            end
          reg97 <= (8'ha2);
          if ((^wire88[(4'h9):(4'h8)]))
            begin
              reg98 <= reg94;
              reg99 <= ((((|$unsigned(reg95)) | $unsigned($signed(wire89))) ?
                  ((&((8'hb6) ?
                      reg93 : reg98)) << wire88[(1'h1):(1'h0)]) : (!$unsigned(wire89[(5'h12):(4'hc)]))) >> $unsigned(wire91));
              reg100 <= (-(+$unsigned((~wire88[(2'h2):(1'h1)]))));
              reg101 <= {(+{$signed($signed(reg99))})};
              reg102 <= $unsigned($signed(($signed((^~wire88)) ?
                  reg99[(3'h6):(3'h5)] : $signed($signed(reg98)))));
            end
          else
            begin
              reg98 <= (-($unsigned(({reg99, reg102} ?
                      reg99[(3'h4):(1'h1)] : (wire91 ? reg96 : reg94))) ?
                  wire90 : (((~&reg92) ? (|reg94) : reg97[(3'h6):(1'h1)]) ?
                      ({reg97, reg94} ?
                          $unsigned(reg97) : (+wire86)) : ((reg100 || wire86) ?
                          wire85[(3'h4):(1'h1)] : $signed(reg99)))));
              reg99 <= wire86;
              reg100 <= reg99;
            end
          reg103 <= {reg99, wire88};
          if ({$signed(reg95[(3'h4):(2'h2)]),
              (reg92 ?
                  (~^((reg102 <= wire89) >>> $unsigned(wire89))) : (((^~wire89) ?
                      $signed((8'haa)) : (|(8'ha5))) << ((wire89 == (8'hba)) - (wire87 ?
                      wire85 : wire91))))})
            begin
              reg104 <= ($signed((((wire85 ? wire87 : reg101) ?
                          reg100 : wire85[(2'h2):(1'h1)]) ?
                      (~reg99[(3'h6):(3'h6)]) : wire86[(1'h0):(1'h0)])) ?
                  ({reg92[(4'hd):(4'hd)]} ?
                      {$unsigned(wire88[(1'h1):(1'h1)])} : ((-reg98[(3'h4):(2'h3)]) - reg102)) : $unsigned(reg97[(3'h6):(3'h6)]));
              reg105 <= $signed(((wire90 ?
                  $signed(reg92) : reg100[(3'h4):(2'h2)]) != reg100[(1'h0):(1'h0)]));
            end
          else
            begin
              reg104 <= {wire88};
              reg105 <= $signed(reg103[(1'h1):(1'h1)]);
            end
        end
      reg106 <= wire89;
    end
  assign wire107 = ((wire90[(5'h10):(1'h0)] || (-(reg100 ?
                           reg101[(4'h9):(4'h8)] : reg93))) ?
                       ($unsigned(wire90) || {$signed($unsigned(wire91))}) : ($unsigned(((reg94 * reg103) ?
                           reg102 : $signed(reg98))) != $unsigned(((!reg98) ?
                           $unsigned(wire91) : (wire88 + reg94)))));
  assign wire108 = {((8'hb0) ?
                           $unsigned((&reg95[(1'h1):(1'h0)])) : (^~{wire107})),
                       reg95[(3'h5):(1'h0)]};
  assign wire109 = wire87;
  assign wire110 = wire90;
  assign wire111 = reg93[(1'h1):(1'h0)];
  assign wire112 = reg96;
  assign wire113 = $unsigned($unsigned($signed(reg99[(3'h4):(1'h1)])));
  assign wire114 = ($signed(((reg106 >> reg103) ?
                           wire90[(5'h12):(5'h11)] : wire85)) ?
                       ({reg100, reg102} ?
                           $signed({{wire90}}) : ((&reg100) ?
                               ({wire86} + (wire112 != reg99)) : (&wire86))) : ((reg95 && ({reg93,
                               reg94} * (wire86 <= reg97))) ?
                           wire87 : ($signed(reg94) ?
                               (reg106[(5'h13):(5'h11)] ?
                                   reg95[(1'h0):(1'h0)] : ((7'h43) ?
                                       reg99 : (8'hb9))) : ({wire107, (8'hb8)} ?
                                   (!reg92) : (^~(7'h43))))));
  assign wire115 = reg99;
  assign wire116 = reg96;
  assign wire117 = ((wire112 ?
                           reg105[(3'h7):(3'h6)] : (($unsigned(reg103) || {wire110,
                                   reg97}) ?
                               $signed((~(8'ha9))) : $signed((wire109 + wire111)))) ?
                       $unsigned(wire91) : reg96[(2'h3):(2'h3)]);
  assign wire118 = $signed((reg103[(3'h7):(3'h7)] ?
                       ($signed((!reg106)) ?
                           ($unsigned(wire89) && reg102[(4'hc):(1'h1)]) : (+{reg103})) : reg102[(4'h9):(4'h8)]));
  always
    @(posedge clk) begin
      reg119 <= ($unsigned((~&{$signed(wire114)})) | wire116);
      reg120 <= (wire88 ? reg95 : ((wire90 ^~ (^~reg93)) & wire112));
      reg121 <= (((^$signed(wire86)) || $unsigned($signed(reg93))) ?
          (&wire112) : $unsigned($unsigned(wire88)));
      reg122 <= (~&$signed(((~&$signed(reg106)) >> reg98[(5'h10):(4'he)])));
    end
  assign wire123 = (-$signed(reg120));
  assign wire124 = wire89;
  always
    @(posedge clk) begin
      if ((((reg94[(2'h3):(2'h3)] ?
          reg121 : wire113[(1'h1):(1'h1)]) >> $unsigned($signed((|wire86)))) ^ {(wire108[(1'h1):(1'h1)] ?
              reg122 : (~|(wire85 <<< wire86)))}))
        begin
          reg125 <= reg93;
          reg126 <= $signed({$signed({$unsigned(wire91), (~&wire87)}),
              (!$signed($signed(wire87)))});
          if (($unsigned($signed($signed(((8'hb2) == (8'ha8))))) ^ $signed(($unsigned(wire85) ?
              ($signed((8'h9f)) || $unsigned(reg102)) : (wire111[(2'h2):(1'h0)] ?
                  (|reg105) : $signed(reg93))))))
            begin
              reg127 <= ($unsigned({wire118,
                      ((8'ha1) ? reg100[(3'h6):(3'h6)] : $signed(wire124))}) ?
                  (reg125 ?
                      $signed((^(&(7'h41)))) : {wire114[(1'h1):(1'h1)]}) : {wire112[(3'h7):(2'h2)]});
            end
          else
            begin
              reg127 <= ((^(($signed(wire112) <= (wire85 << wire85)) & reg96)) <= {$signed($unsigned($unsigned((8'hb0)))),
                  reg120});
              reg128 <= ($signed((($signed(reg100) ?
                      (^~wire112) : ((8'h9e) - wire113)) ?
                  $unsigned((reg102 ?
                      (8'ha4) : wire113)) : (reg119[(1'h0):(1'h0)] + (reg98 ^ wire91)))) | (reg103[(2'h2):(1'h1)] - (+wire110)));
              reg129 <= ({wire108} ?
                  (wire109 ?
                      $signed(reg97) : (wire107[(1'h0):(1'h0)] ^ (wire88 & (wire118 ?
                          reg95 : reg121)))) : (&$unsigned($unsigned((reg105 ?
                      (8'hb1) : reg92)))));
              reg130 <= (((^~(((7'h44) ?
                  (8'ha4) : reg102) && reg125[(2'h2):(2'h2)])) >>> (^(((8'hb3) ?
                  reg102 : reg103) - (~^reg122)))) | (~|wire124));
            end
          reg131 <= ($signed(reg126[(1'h1):(1'h1)]) + reg103[(2'h3):(2'h2)]);
          reg132 <= (((&$unsigned((^reg126))) ?
              reg104[(3'h6):(1'h1)] : $signed($unsigned((wire87 != wire107)))) <<< $signed((($unsigned((8'hbb)) ?
              $signed(wire90) : (reg100 ^~ reg119)) > ($signed(reg122) + (wire89 ?
              wire112 : reg130)))));
        end
      else
        begin
          reg125 <= $signed(reg126[(2'h2):(1'h1)]);
          if (wire109[(3'h4):(1'h1)])
            begin
              reg126 <= (8'hb3);
              reg127 <= $signed((($signed({wire124}) ?
                  (^wire110[(4'hb):(1'h0)]) : ($signed(wire88) > (&wire91))) > (wire123[(4'hc):(4'h8)] > (~^(|reg93)))));
            end
          else
            begin
              reg126 <= wire110[(3'h6):(2'h3)];
              reg127 <= ($signed((wire117[(1'h1):(1'h1)] == ($signed(wire111) ?
                      $unsigned(reg93) : reg93[(1'h1):(1'h1)]))) ?
                  {$unsigned(reg101[(3'h6):(2'h2)])} : (~wire87[(2'h2):(2'h2)]));
              reg128 <= $unsigned({{wire124, {(~^reg127)}}});
              reg129 <= $signed($signed({((reg122 ?
                      reg96 : wire85) >> reg93)}));
              reg130 <= reg131[(1'h1):(1'h1)];
            end
        end
    end
endmodule

module module68
#(parameter param79 = (^(-((((8'hae) ? (8'hb9) : (7'h42)) ? ((8'hbd) ? (7'h41) : (8'hae)) : ((8'ha0) >= (8'hb2))) ? (!((8'hbf) ? (8'haa) : (8'h9d))) : ((~^(8'haa)) >> (|(8'hb4)))))), 
parameter param80 = ((((param79 >= {param79}) ? (((8'ha9) | param79) ? param79 : {param79}) : param79) ? (&({param79} ? {(8'ha2)} : (|param79))) : param79) ? (-{param79, param79}) : ((((^~param79) ? ((8'hbd) ? param79 : param79) : (param79 ~^ (8'ha2))) ? ((param79 - param79) ? param79 : (param79 ? param79 : param79)) : ((param79 ? param79 : param79) ? {(8'hb0)} : param79)) ^ (((param79 ? param79 : (7'h43)) <<< (param79 ? (8'h9c) : param79)) ? param79 : ((~&param79) != {param79})))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  input wire signed [(3'h5):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire signed [(2'h2):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  assign y = {wire78, wire77, wire76, wire75, wire74, (1'h0)};
  assign wire74 = wire71;
  assign wire75 = (wire72 ?
                      ((~&$signed((~wire74))) + (((wire71 ~^ wire72) != wire72[(4'hb):(3'h7)]) * {wire69,
                          $unsigned(wire69)})) : $signed(wire70[(1'h1):(1'h1)]));
  assign wire76 = $signed({(((wire69 > wire73) >>> $unsigned(wire75)) < $unsigned($unsigned(wire71))),
                      $unsigned(((wire71 ? wire73 : wire72) != (!wire72)))});
  assign wire77 = $unsigned(wire70[(2'h3):(1'h1)]);
  assign wire78 = ((8'ha8) ~^ wire77[(3'h4):(3'h4)]);
endmodule

module module43
#(parameter param63 = {(^((((8'hbf) - (8'hbe)) & ((8'hb7) ? (8'hb3) : (8'hbf))) ? {{(8'ha2), (8'hae)}, (~^(8'h9c))} : (+((8'hb8) ? (8'hb3) : (8'ha4)))))})
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire48;
  input wire [(5'h13):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= ($signed((~$signed($unsigned(wire44)))) ?
          $unsigned(((wire48 + (&wire45)) ~^ (+$unsigned(wire47)))) : wire48);
    end
  assign wire50 = ((8'h9d) == (~&((wire46 ? $signed(wire45) : $signed(wire45)) ?
                      (8'ha7) : (~(reg49 ? wire47 : reg49)))));
  assign wire51 = (!(reg49 ?
                      wire46 : ($unsigned($unsigned(wire45)) <= {(wire46 || wire46)})));
  assign wire52 = wire45;
  assign wire53 = wire48;
  assign wire54 = {wire51};
  assign wire55 = ($unsigned(((wire52 ? $unsigned(wire50) : (wire47 * wire47)) ?
                      ($unsigned((8'h9e)) ?
                          wire54 : (-wire44)) : $unsigned((-(8'hb5))))) << $signed((({wire45} ?
                      (wire48 != wire48) : (wire48 ?
                          wire48 : wire47)) & (((8'ha0) ?
                      wire50 : wire47) >> (wire50 ? wire48 : wire47)))));
  assign wire56 = {wire50,
                      $signed(((wire55 == (wire52 << wire46)) ?
                          ($signed(wire55) <= wire54) : $unsigned($unsigned(wire55))))};
  assign wire57 = reg49[(3'h4):(2'h2)];
  assign wire58 = ($signed(wire57) <<< (!(wire56 ?
                      (wire51 || wire53[(2'h3):(1'h1)]) : {wire46})));
  assign wire59 = (!(&($unsigned((8'hb3)) > ((&(8'ha1)) << {wire48}))));
  assign wire60 = wire57;
  assign wire61 = $unsigned((&(wire54[(3'h5):(3'h5)] ?
                      wire45[(4'hf):(4'hc)] : (|$unsigned(wire56)))));
  assign wire62 = (~$signed($unsigned(wire59)));
endmodule

module module10
#(parameter param25 = (((((~(8'hb1)) >> ((8'ha3) ^~ (8'ha4))) | ({(7'h43), (8'h9e)} ? ((8'hbd) >= (8'ha0)) : ((8'ha9) >= (8'hbb)))) >= {(((8'hb9) & (8'hbb)) * (-(8'hb8))), (-((8'ha8) ? (8'hbb) : (8'hbe)))}) <<< {((((8'hb9) <= (8'hb8)) ? (8'h9d) : {(8'hba), (8'hb8)}) ? (((8'ha1) ? (8'haf) : (8'hab)) ? (!(8'ha7)) : (~^(8'ha3))) : ((|(8'hb2)) <<< ((8'ha6) ? (8'ha9) : (8'ha4)))), (~(((8'haa) - (8'hb3)) ? ((8'hb6) ? (8'hb3) : (8'hb4)) : (~^(8'h9c))))}), 
parameter param26 = ((((param25 ? (param25 ? (8'ha1) : (8'hba)) : (param25 || param25)) ^~ (~&(^param25))) ? {param25, ((8'hb8) ? {param25} : (^param25))} : (param25 & (-(param25 ? (8'ha9) : (8'hb0))))) * {{((7'h44) ? param25 : {param25}), ((!param25) >> (param25 | param25))}, (~&(8'ha7))}))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire15;
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire19,
                 wire17,
                 wire15,
                 reg21,
                 reg18,
                 reg16,
                 (1'h0)};
  assign wire15 = $signed(wire11);
  always
    @(posedge clk) begin
      reg16 <= (~&$signed({wire14}));
    end
  assign wire17 = $unsigned({((wire14[(4'he):(3'h4)] > (reg16 == (8'ha6))) & reg16[(3'h7):(2'h3)])});
  always
    @(posedge clk) begin
      reg18 <= wire17[(1'h1):(1'h1)];
    end
  assign wire19 = (^(reg16[(3'h5):(1'h0)] >= (($signed(wire15) ?
                      (|wire12) : $unsigned(wire17)) >= (^~(^~wire15)))));
  assign wire20 = ({reg16, wire14} ?
                      {({(~reg18)} ?
                              ((wire15 || wire19) ?
                                  (wire11 ?
                                      wire11 : wire17) : $signed(wire11)) : reg16[(3'h6):(1'h1)]),
                          wire15} : {((((8'ha7) != wire17) * $signed(reg16)) || $unsigned(reg16))});
  always
    @(posedge clk) begin
      reg21 <= (~|{(({reg18, wire12} ?
                  $unsigned((7'h40)) : wire11[(2'h3):(2'h2)]) ?
              $unsigned(wire11) : {(~^wire14), (wire12 < reg16)})});
    end
  assign wire22 = reg18[(2'h2):(2'h2)];
  assign wire23 = ($signed(reg21) || ($unsigned(wire13) <<< (~|$signed((-(8'h9c))))));
  assign wire24 = wire14;
endmodule
