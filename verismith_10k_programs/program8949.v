module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h21e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire267;
  wire signed [(4'he):(1'h0)] wire266;
  wire signed [(5'h15):(1'h0)] wire265;
  wire [(5'h15):(1'h0)] wire264;
  wire [(2'h2):(1'h0)] wire263;
  wire signed [(4'hc):(1'h0)] wire221;
  wire [(4'he):(1'h0)] wire223;
  wire signed [(5'h12):(1'h0)] wire224;
  wire [(2'h2):(1'h0)] wire226;
  wire signed [(4'ha):(1'h0)] wire227;
  wire [(2'h2):(1'h0)] wire255;
  wire signed [(4'hb):(1'h0)] wire256;
  wire signed [(4'h8):(1'h0)] wire257;
  wire [(5'h11):(1'h0)] wire258;
  wire signed [(5'h10):(1'h0)] wire259;
  wire signed [(4'hb):(1'h0)] wire260;
  wire signed [(3'h4):(1'h0)] wire261;
  reg signed [(2'h2):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg252 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg251 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg248 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg247 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg246 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg245 = (1'h0);
  reg [(5'h11):(1'h0)] reg244 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg242 = (1'h0);
  reg [(5'h13):(1'h0)] reg241 = (1'h0);
  reg [(4'hc):(1'h0)] reg240 = (1'h0);
  reg signed [(4'he):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg238 = (1'h0);
  reg [(5'h13):(1'h0)] reg237 = (1'h0);
  reg [(4'hf):(1'h0)] reg236 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg235 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg234 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg232 = (1'h0);
  reg [(2'h3):(1'h0)] reg231 = (1'h0);
  reg [(5'h12):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg229 = (1'h0);
  reg [(4'hd):(1'h0)] reg228 = (1'h0);
  assign y = {wire267,
                 wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire221,
                 wire223,
                 wire224,
                 wire226,
                 wire227,
                 wire255,
                 wire256,
                 wire257,
                 wire258,
                 wire259,
                 wire260,
                 wire261,
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
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 (1'h0)};
  module4 #() modinst222 (wire221, clk, wire0, wire3, wire2, wire1, (8'hba));
  assign wire223 = (wire221 ?
                       (~&$signed((^$signed(wire0)))) : wire1[(3'h6):(1'h1)]);
  module94 #() modinst225 (.wire97(wire2), .wire96(wire223), .clk(clk), .wire95(wire1), .wire98(wire3), .y(wire224));
  assign wire226 = wire1[(4'ha):(1'h1)];
  assign wire227 = wire0;
  always
    @(posedge clk) begin
      if ({($unsigned(wire224[(3'h6):(2'h3)]) ?
              wire226 : ((8'hb9) ? ($unsigned(wire2) && (+wire224)) : wire227)),
          wire0[(4'h8):(3'h5)]})
        begin
          reg228 <= wire2;
          reg229 <= {$unsigned($signed(wire1[(1'h1):(1'h1)])),
              (&$unsigned($signed(wire226)))};
        end
      else
        begin
          reg228 <= ($unsigned(wire1) << (8'h9f));
          if (($unsigned((8'h9d)) > (~($signed($signed(reg229)) ^ (^(wire223 >= reg228))))))
            begin
              reg229 <= $unsigned(wire0);
              reg230 <= wire221;
              reg231 <= (~reg230);
              reg232 <= reg229;
            end
          else
            begin
              reg229 <= $signed((8'hb1));
              reg230 <= (7'h43);
              reg231 <= (-reg232);
            end
          if ((8'hb0))
            begin
              reg233 <= $unsigned(($unsigned(reg230[(2'h3):(2'h2)]) ?
                  {$signed((-wire1)),
                      wire227[(3'h6):(2'h2)]} : wire221[(4'h8):(2'h3)]));
              reg234 <= (^~wire1);
              reg235 <= $signed($signed({$signed((reg234 ? wire227 : wire226)),
                  ($unsigned(wire223) || {reg234, reg231})}));
            end
          else
            begin
              reg233 <= ($signed(reg233[(3'h5):(3'h5)]) > wire3[(1'h0):(1'h0)]);
              reg234 <= (~&wire226);
              reg235 <= ((~|({(reg231 || wire224)} >= (8'had))) ?
                  (((((8'hae) ? wire221 : wire1) - $signed(wire0)) ?
                          {(reg229 >>> reg229)} : (&(reg229 ?
                              reg231 : reg234))) ?
                      {$unsigned($signed((7'h41)))} : ($signed(wire0[(3'h7):(3'h7)]) ?
                          (wire227[(1'h1):(1'h0)] & (wire1 != reg235)) : ((reg234 <= reg235) <<< reg229))) : reg232);
              reg236 <= (~|$unsigned($unsigned((|$signed(wire0)))));
            end
          if ($signed((((&wire0) <= (wire3[(3'h6):(1'h0)] * (^~wire0))) >> wire221)))
            begin
              reg237 <= {reg230[(2'h3):(1'h1)],
                  $signed($signed($signed((~&wire2))))};
              reg238 <= {{reg235[(4'ha):(3'h5)]}};
              reg239 <= $unsigned($unsigned({reg231[(1'h1):(1'h1)]}));
              reg240 <= wire3[(4'hd):(4'ha)];
            end
          else
            begin
              reg237 <= {wire226[(1'h0):(1'h0)],
                  $signed(reg239[(4'he):(2'h2)])};
              reg238 <= (&{reg240[(4'h8):(1'h0)],
                  (($unsigned(wire3) ?
                      (reg236 ?
                          (8'ha4) : wire221) : (-reg229)) << wire224[(1'h0):(1'h0)])});
              reg239 <= $unsigned(($signed(wire223[(2'h2):(2'h2)]) <= $signed(wire221[(1'h0):(1'h0)])));
            end
        end
      if ({reg238,
          (((&(8'ha7)) >>> $unsigned(reg233)) << $unsigned(reg238[(2'h3):(1'h1)]))})
        begin
          reg241 <= ({reg234,
              $unsigned(($signed(reg232) ?
                  (|reg233) : (wire227 ?
                      reg237 : wire224)))} & $unsigned((~($unsigned(reg231) | reg240))));
          reg242 <= reg238;
          reg243 <= ((reg240[(1'h0):(1'h0)] * (+(((7'h43) ?
              (8'hb6) : wire1) ^ wire227))) <<< $signed($unsigned(($signed(wire223) ?
              (8'had) : $unsigned(wire224)))));
          reg244 <= (~&reg239);
          reg245 <= ((8'ha6) * ((reg242 >= (reg232 ^ (~&reg239))) ?
              reg231 : ((!(^~reg230)) ?
                  $unsigned((^reg237)) : reg233[(3'h5):(2'h3)])));
        end
      else
        begin
          reg241 <= reg243[(1'h0):(1'h0)];
          reg242 <= wire224[(1'h0):(1'h0)];
          reg243 <= $signed(($unsigned($signed($signed(reg241))) ?
              (!$unsigned(reg233)) : reg245));
        end
      reg246 <= $signed(($unsigned($signed($unsigned((7'h42)))) ?
          (^(-(wire227 != (8'h9e)))) : reg230[(4'hb):(3'h4)]));
      reg247 <= (|((wire221 ? (reg237[(3'h4):(2'h3)] | (8'hbc)) : reg240) ?
          {(^(8'hbc))} : (7'h42)));
      if (reg233)
        begin
          reg248 <= ($signed((reg237 ?
              reg233 : (((8'had) ? wire0 : wire1) ?
                  (8'hb7) : wire224))) ^~ reg237[(3'h6):(2'h2)]);
        end
      else
        begin
          reg248 <= (!$signed(reg237));
          if ((((!$signed((!reg243))) ?
                  (reg236 ^~ $signed((reg244 ?
                      reg244 : reg242))) : $unsigned((^$signed(wire226)))) ?
              $signed($unsigned($unsigned(reg236))) : $unsigned((((reg247 ?
                      reg236 : wire1) ?
                  wire1 : reg240) >>> $unsigned((~(8'h9d)))))))
            begin
              reg249 <= (!($signed({$signed(reg228)}) ?
                  $unsigned($signed(wire0)) : $signed(reg244[(5'h11):(4'h8)])));
            end
          else
            begin
              reg249 <= ($unsigned($signed(((reg228 ?
                  (8'hb9) : reg239) >= reg228[(3'h4):(2'h3)]))) * (~|{reg248,
                  (!$signed(reg228))}));
              reg250 <= wire226;
              reg251 <= {$unsigned($unsigned(reg229)), reg232[(4'h8):(3'h5)]};
            end
          reg252 <= $unsigned(((&(|(reg230 >>> reg229))) ?
              $unsigned((~(+(8'hba)))) : {wire0[(5'h10):(4'hf)],
                  $signed((reg247 == reg249))}));
          reg253 <= reg248[(4'ha):(3'h6)];
          reg254 <= wire2[(1'h1):(1'h0)];
        end
    end
  assign wire255 = reg253;
  assign wire256 = (~|(8'hb0));
  assign wire257 = (^((7'h41) ?
                       $signed(($unsigned(wire223) && (8'hbe))) : $signed(((reg235 ~^ wire3) * wire224[(2'h2):(1'h0)]))));
  assign wire258 = $unsigned($signed(reg230[(2'h2):(2'h2)]));
  assign wire259 = $unsigned((-{((reg248 ^ wire256) <<< (~|reg250)),
                       (~&$signed((7'h44)))}));
  assign wire260 = (((($signed(wire256) < $unsigned(reg243)) <<< ($unsigned(wire258) - {wire256,
                               reg235})) ?
                           ((~^reg247[(3'h4):(1'h1)]) ?
                               (wire258[(1'h0):(1'h0)] ?
                                   ((8'hae) == wire3) : wire223) : ({reg233} < (reg236 >= (8'ha6)))) : reg253[(2'h2):(1'h1)]) ?
                       {wire3[(4'h9):(3'h7)],
                           $unsigned(wire221[(4'hc):(1'h1)])} : {reg249});
  module4 #() modinst262 (.clk(clk), .wire7(wire256), .wire8(wire224), .wire6(wire3), .wire5(reg236), .y(wire261), .wire9(reg250));
  assign wire263 = ((~|reg247) ?
                       $signed((~reg248)) : $unsigned((|reg237[(4'ha):(3'h6)])));
  assign wire264 = (8'hac);
  assign wire265 = ((&reg240) ^ reg253[(3'h6):(1'h0)]);
  assign wire266 = $unsigned(($signed((+(~reg228))) >> (&((reg228 == reg241) ?
                       reg248 : $unsigned(wire226)))));
  module142 #() modinst268 (wire267, clk, reg240, reg252, wire258, wire264);
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h281):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire5;
  input wire signed [(2'h3):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire220;
  wire signed [(2'h3):(1'h0)] wire219;
  wire [(3'h6):(1'h0)] wire217;
  wire [(5'h11):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire130;
  wire signed [(5'h10):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire183;
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire220,
                 wire219,
                 wire217,
                 wire128,
                 wire10,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire92,
                 wire130,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire183,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = wire5;
  always
    @(posedge clk) begin
      reg11 <= wire10[(4'h8):(3'h4)];
      reg12 <= (~|wire7);
      reg13 <= ((($signed(((8'hab) << wire9)) >>> $unsigned($signed(reg12))) + reg11[(4'ha):(3'h7)]) ?
          $signed(wire10) : $unsigned($unsigned(wire5[(1'h0):(1'h0)])));
      reg14 <= wire8[(5'h11):(5'h10)];
      reg15 <= (+$signed(($unsigned($unsigned(reg13)) ?
          $signed(((8'ha7) ? wire7 : wire9)) : (^(^~wire9)))));
    end
  always
    @(posedge clk) begin
      if (((~&$unsigned(reg12)) && (reg12 && $unsigned({reg12[(3'h4):(2'h2)],
          {reg14, reg11}}))))
        begin
          if ($signed($unsigned((wire6 + $signed(reg11[(3'h7):(3'h5)])))))
            begin
              reg16 <= $signed((~($unsigned((reg14 >= wire6)) >= ($signed(reg15) ?
                  reg12[(3'h4):(1'h1)] : (wire9 + wire5)))));
              reg17 <= $unsigned((|wire9));
            end
          else
            begin
              reg16 <= reg16;
              reg17 <= (((8'ha1) <= $signed(wire9)) ?
                  (&(!($signed(wire9) >> (&reg15)))) : $signed({($signed((8'h9d)) || wire5[(3'h4):(2'h2)])}));
              reg18 <= $unsigned((~^(^~wire5)));
            end
          if (($signed(reg16[(1'h1):(1'h1)]) <= $signed({((wire7 ?
                  reg12 : reg15) <= reg11)})))
            begin
              reg19 <= wire7[(3'h5):(1'h0)];
              reg20 <= $signed($unsigned($unsigned($unsigned((reg16 >= wire8)))));
              reg21 <= {($signed($signed((wire5 & (8'h9d)))) && reg14), reg11};
              reg22 <= $signed({(((wire10 ? reg21 : reg19) ?
                          (wire9 | wire8) : (8'hb2)) ?
                      ({reg12} ?
                          {reg11, reg19} : $signed((8'ha3))) : {(~^reg21),
                          $unsigned(reg14)}),
                  (^$signed(wire10))});
            end
          else
            begin
              reg19 <= reg21;
              reg20 <= $unsigned((wire10[(2'h2):(1'h0)] <= (&$unsigned((~&reg13)))));
              reg21 <= $unsigned((~|{((&reg15) ?
                      (&(8'h9f)) : (reg13 <<< wire7)),
                  reg18}));
            end
        end
      else
        begin
          if ((^~$unsigned(wire5)))
            begin
              reg16 <= $signed((((8'hac) ?
                  wire6 : reg17[(2'h2):(2'h2)]) | (+(reg22[(4'h8):(1'h0)] ?
                  reg14 : (wire8 ? reg13 : reg17)))));
              reg17 <= wire6;
              reg18 <= {(~&{((reg18 ? reg16 : reg22) > reg20)}),
                  (({(wire5 << reg13)} >= reg12[(1'h1):(1'h1)]) ?
                      (reg20[(1'h1):(1'h1)] ^~ reg22) : ((reg21[(1'h1):(1'h0)] & reg12[(3'h4):(1'h1)]) && (|$signed(wire8))))};
              reg19 <= reg19[(5'h11):(3'h6)];
              reg20 <= $unsigned($unsigned((8'ha8)));
            end
          else
            begin
              reg16 <= wire8[(2'h2):(1'h1)];
            end
        end
      reg23 <= (~^(&{$signed(reg18), $unsigned((8'hbb))}));
      if (($signed((($signed(reg12) ^ $unsigned(reg11)) <= $unsigned((+reg18)))) ?
          {((&reg18) ?
                  {(reg11 > (8'ha0)),
                      reg12[(2'h2):(1'h1)]} : wire7[(4'h8):(3'h4)]),
              reg18[(3'h4):(1'h0)]} : ($signed(((wire9 >= wire5) ?
                  (reg18 ? reg12 : reg12) : reg17)) ?
              (((reg18 ? reg13 : wire7) > {(8'had),
                  wire8}) - (8'hbc)) : {{$unsigned((8'hab))}})))
        begin
          if ($signed(wire9))
            begin
              reg24 <= reg17[(2'h3):(2'h2)];
            end
          else
            begin
              reg24 <= (~{reg14[(4'h9):(3'h5)],
                  (((~&wire8) & {reg21}) ^ $unsigned({reg24}))});
              reg25 <= $unsigned($signed((reg16 < (^reg15))));
            end
        end
      else
        begin
          reg24 <= reg14[(4'hd):(3'h4)];
          reg25 <= reg11;
          reg26 <= $unsigned(wire7);
          reg27 <= reg13;
          if ($signed(reg16[(4'hb):(4'h8)]))
            begin
              reg28 <= reg16[(4'ha):(1'h1)];
            end
          else
            begin
              reg28 <= (|({reg16,
                  (reg15[(2'h3):(2'h3)] ? reg24 : (!reg12))} << wire6));
              reg29 <= {((((reg24 ? reg23 : reg28) << reg13[(5'h11):(3'h6)]) ?
                          $signed(reg24[(4'ha):(4'h8)]) : $unsigned(((8'ha5) ?
                              reg12 : reg25))) ?
                      ($unsigned((7'h41)) * ((reg13 ?
                          reg15 : reg20) == wire6[(1'h0):(1'h0)])) : $signed(reg28))};
              reg30 <= $signed($signed($signed((|{reg13}))));
              reg31 <= {(&$unsigned($unsigned($signed(wire5)))),
                  ($signed(wire10[(3'h7):(1'h0)]) - wire5[(4'hc):(3'h5)])};
            end
        end
      reg32 <= (~^($unsigned((~^$signed((8'ha0)))) ?
          $unsigned((+(reg12 ^ reg25))) : $unsigned(reg20[(4'h9):(3'h7)])));
    end
  assign wire33 = wire8;
  assign wire34 = reg23[(1'h1):(1'h1)];
  assign wire35 = (((reg19[(4'hd):(4'hd)] << (((7'h44) <= wire8) != (+reg12))) ?
                      ($unsigned((8'hbb)) ?
                          (~&$unsigned(reg26)) : $unsigned($signed(reg27))) : reg29) <<< (~&$signed(($unsigned(wire9) & $unsigned((8'ha6))))));
  assign wire36 = (($unsigned(((reg15 ? reg21 : reg24) + (reg12 ?
                          wire33 : (7'h40)))) < ((~(!reg18)) * (&((8'hb8) ^~ wire8)))) ?
                      {reg19} : $unsigned({wire9}));
  assign wire37 = reg17;
  assign wire38 = ($signed($unsigned(($unsigned(reg27) ?
                          wire36 : reg12[(3'h4):(1'h1)]))) ?
                      wire34[(2'h3):(2'h2)] : reg27);
  assign wire39 = $signed($unsigned(reg22[(2'h3):(2'h2)]));
  module40 #() modinst93 (wire92, clk, wire8, wire38, reg12, wire34);
  module94 #() modinst129 (.wire98(reg31), .wire97(reg16), .y(wire128), .wire96(reg29), .wire95(wire39), .clk(clk));
  assign wire130 = (reg24 ~^ reg23);
  always
    @(posedge clk) begin
      reg131 <= $signed((8'hbc));
      reg132 <= reg29[(2'h2):(2'h2)];
      if ({(({(~reg31)} >> reg26[(3'h7):(2'h2)]) ? wire34 : reg16), reg21})
        begin
          if ($signed(reg24[(2'h2):(1'h0)]))
            begin
              reg133 <= reg26[(5'h15):(2'h2)];
              reg134 <= ((~reg30[(3'h4):(3'h4)]) ?
                  (+wire38) : (reg17[(3'h4):(2'h3)] < $signed(reg132[(3'h7):(3'h7)])));
              reg135 <= (reg13 ?
                  ((~&wire37) ?
                      $signed(wire35[(1'h1):(1'h1)]) : (8'hb5)) : reg24[(3'h4):(1'h0)]);
            end
          else
            begin
              reg133 <= (!$unsigned(wire7[(1'h0):(1'h0)]));
            end
          reg136 <= reg25;
        end
      else
        begin
          reg133 <= $signed(reg19[(3'h4):(2'h2)]);
          reg134 <= {($signed((wire10 ?
                      {reg27, reg24} : wire38[(4'h8):(4'h8)])) ?
                  $unsigned((reg24[(3'h6):(3'h5)] ?
                      $unsigned(reg17) : $unsigned(reg16))) : wire36),
              reg23[(2'h3):(2'h3)]};
        end
      reg137 <= wire37[(2'h2):(2'h2)];
    end
  assign wire138 = {wire35};
  assign wire139 = reg29;
  assign wire140 = (reg27[(3'h6):(1'h0)] && wire34);
  assign wire141 = {reg132};
  module142 #() modinst184 (.clk(clk), .y(wire183), .wire145(reg132), .wire146(wire128), .wire144(reg28), .wire143(reg18));
  module185 #() modinst218 (wire217, clk, reg18, reg29, reg17, wire130, wire35);
  assign wire219 = ((^~$signed(reg28)) | reg23);
  assign wire220 = ((~|(!(^(^wire39)))) ?
                       reg27 : $signed((reg14[(2'h2):(1'h0)] ?
                           (reg26 <<< reg13[(3'h5):(2'h3)]) : reg24)));
endmodule

module module185
#(parameter param215 = {(!(8'hbc))}, 
parameter param216 = ((param215 >>> (~&(|(param215 == param215)))) ? (^param215) : (~|(~|(~((7'h41) ? param215 : param215))))))
(y, clk, wire190, wire189, wire188, wire187, wire186);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire190;
  input wire [(5'h15):(1'h0)] wire189;
  input wire [(3'h7):(1'h0)] wire188;
  input wire [(5'h10):(1'h0)] wire187;
  input wire [(3'h6):(1'h0)] wire186;
  wire [(4'h8):(1'h0)] wire214;
  wire signed [(5'h14):(1'h0)] wire213;
  wire [(4'h9):(1'h0)] wire212;
  wire signed [(3'h6):(1'h0)] wire211;
  wire signed [(5'h15):(1'h0)] wire210;
  wire [(4'h8):(1'h0)] wire209;
  wire signed [(3'h4):(1'h0)] wire208;
  wire [(3'h7):(1'h0)] wire207;
  wire [(3'h4):(1'h0)] wire196;
  wire signed [(5'h13):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire194;
  wire [(4'h8):(1'h0)] wire193;
  wire [(3'h7):(1'h0)] wire192;
  reg [(4'hc):(1'h0)] reg206 = (1'h0);
  reg [(5'h14):(1'h0)] reg205 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg [(5'h14):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg199 = (1'h0);
  reg [(5'h15):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
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
                 reg191,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg191 <= $unsigned($signed(wire186[(2'h3):(2'h3)]));
    end
  assign wire192 = $signed((((!$signed(wire189)) ?
                       ($signed(reg191) ?
                           $unsigned((8'hbe)) : $unsigned(wire186)) : {{wire189,
                               reg191}}) & $signed((~&{wire187}))));
  assign wire193 = reg191[(5'h11):(4'hb)];
  assign wire194 = $signed(((+((wire188 ?
                       wire187 : wire193) >> wire186)) > (^~$signed((wire186 == wire188)))));
  assign wire195 = ($signed(wire189) >>> (wire194 > wire188));
  assign wire196 = ($unsigned((((-wire194) ?
                       (reg191 << wire187) : wire190[(2'h2):(1'h1)]) == $unsigned(wire190))) | wire186);
  always
    @(posedge clk) begin
      if ((wire190 ?
          $signed({wire187,
              (((8'ha7) ? wire194 : wire194) ?
                  $signed(wire190) : wire196[(2'h2):(2'h2)])}) : wire196))
        begin
          reg197 <= reg191;
          reg198 <= (wire193[(1'h1):(1'h0)] | wire190);
          if (wire187)
            begin
              reg199 <= (~|$unsigned(($unsigned(((8'ha8) ?
                  wire190 : wire196)) ~^ ((~wire190) ?
                  $signed(reg191) : $signed(wire186)))));
            end
          else
            begin
              reg199 <= ((wire186[(3'h5):(1'h0)] << (((reg197 >>> (8'ha4)) ?
                      {reg199} : (wire187 ^ reg191)) <= (wire195[(5'h10):(4'hb)] ?
                      (!wire192) : (wire189 << wire188)))) ?
                  $signed($signed($unsigned({reg198}))) : wire192);
              reg200 <= (~^(7'h40));
              reg201 <= (8'ha5);
              reg202 <= (~{(&reg201[(2'h2):(1'h1)])});
            end
        end
      else
        begin
          if (reg200[(3'h4):(3'h4)])
            begin
              reg197 <= (wire189[(5'h12):(1'h1)] != (&$unsigned((~|$unsigned((8'hb9))))));
              reg198 <= reg202;
              reg199 <= $signed({(&({wire195} ?
                      $unsigned((8'hbe)) : wire189[(3'h4):(2'h3)]))});
              reg200 <= (8'hae);
              reg201 <= $unsigned(wire187);
            end
          else
            begin
              reg197 <= $signed($unsigned((({(7'h41)} ?
                      ((8'hb9) ? wire196 : wire196) : reg191[(4'h8):(3'h7)]) ?
                  $signed((&(8'hb7))) : (^~$signed((8'hae))))));
              reg198 <= (&$unsigned(wire190));
            end
          reg202 <= $unsigned({({((8'hb0) ? wire190 : wire193),
                      $unsigned(wire187)} ?
                  ($signed(wire193) || (-reg199)) : ((wire196 << wire196) | (&reg202)))});
          reg203 <= {wire195};
        end
      reg204 <= reg198[(1'h0):(1'h0)];
      reg205 <= $signed((^~(reg197 ?
          ((wire195 ^ (8'hbb)) ?
              (wire194 ?
                  reg203 : wire196) : $signed(wire193)) : (|(|wire193)))));
      reg206 <= $signed(($signed((!(wire194 >>> wire196))) ?
          $unsigned(wire187[(2'h2):(2'h2)]) : $unsigned(wire188)));
    end
  assign wire207 = wire195;
  assign wire208 = wire195;
  assign wire209 = (reg206[(1'h0):(1'h0)] && $signed({$unsigned(wire194),
                       wire195[(4'h8):(2'h2)]}));
  assign wire210 = {$signed((8'haa)), reg199};
  assign wire211 = {wire187[(4'hd):(1'h1)]};
  assign wire212 = (wire207[(3'h5):(1'h1)] ? {reg199} : wire210);
  assign wire213 = (((((!wire196) ? (~^wire208) : (|wire195)) ?
                           $signed((reg197 >> wire194)) : {(wire207 ?
                                   wire193 : wire208),
                               $signed((8'hb4))}) <<< reg202) ?
                       ({reg205, reg199} ?
                           $unsigned($signed(reg199[(2'h3):(2'h2)])) : (reg205 ^ wire211[(2'h2):(1'h1)])) : reg198);
  assign wire214 = reg202[(2'h2):(1'h0)];
endmodule

module module142
#(parameter param182 = (~|{((~(~&(8'hb2))) ? {(~|(8'ha6))} : (8'h9f)), (~{((8'h9f) ? (8'hb1) : (8'hb6)), (~^(8'ha8))})}))
(y, clk, wire146, wire145, wire144, wire143);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire146;
  input wire [(4'h9):(1'h0)] wire145;
  input wire signed [(5'h11):(1'h0)] wire144;
  input wire [(5'h15):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire181;
  wire [(4'he):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire171;
  wire [(4'h9):(1'h0)] wire170;
  wire [(2'h2):(1'h0)] wire169;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire162;
  wire [(5'h13):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg178 = (1'h0);
  reg [(5'h14):(1'h0)] reg177 = (1'h0);
  reg [(5'h15):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  assign y = {wire181,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire145[(1'h0):(1'h0)])
        begin
          reg147 <= $signed(wire146[(2'h3):(1'h0)]);
          reg148 <= (8'had);
          if (($unsigned(wire144) ?
              ((&($unsigned(reg147) ?
                  wire143[(5'h10):(1'h0)] : {wire143,
                      wire145})) >> (~|wire144[(4'hb):(2'h3)])) : reg148))
            begin
              reg149 <= (~|$signed($unsigned(wire145)));
              reg150 <= (!(^~($signed((wire144 ? wire144 : wire145)) ?
                  ((reg148 * wire146) ?
                      (~|reg147) : $unsigned((8'hbc))) : ($unsigned((8'hb5)) ?
                      (~|(8'hb5)) : (reg148 < wire144)))));
              reg151 <= reg148[(1'h1):(1'h1)];
              reg152 <= $unsigned(((8'hac) < (8'hb4)));
            end
          else
            begin
              reg149 <= ($unsigned($unsigned((+(|reg149)))) ?
                  (|((-(reg152 != wire143)) ?
                      reg147[(5'h10):(3'h6)] : (reg152 != (wire146 ?
                          reg151 : reg149)))) : (wire143[(5'h15):(5'h10)] ?
                      (((reg152 ?
                          wire144 : (7'h44)) >> (^~(8'hac))) ^ (8'hb4)) : $unsigned({wire143})));
              reg150 <= ($signed(($unsigned(reg148[(2'h2):(2'h2)]) - (^(+reg152)))) ?
                  reg148 : (|reg150));
              reg151 <= $signed($signed((~^(~^{wire146, (8'hb5)}))));
              reg152 <= $unsigned((~&($unsigned((^reg151)) ?
                  (|reg152) : reg151[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg147 <= $unsigned($signed($signed((reg149 & $signed(reg151)))));
          if (reg152)
            begin
              reg148 <= (^~$signed(reg151[(4'he):(3'h7)]));
              reg149 <= {{$unsigned((^{reg151, wire144}))}, wire144};
              reg150 <= $unsigned($signed($unsigned($signed($signed(reg148)))));
              reg151 <= $signed(reg148[(3'h4):(1'h0)]);
              reg152 <= ({$signed(wire146)} ?
                  reg150[(1'h0):(1'h0)] : (($signed((reg148 << reg147)) <= $unsigned(wire145[(1'h0):(1'h0)])) ?
                      reg152[(4'hb):(3'h5)] : ((+(~&wire143)) <<< (wire143 >= (reg150 != wire143)))));
            end
          else
            begin
              reg148 <= wire143[(1'h0):(1'h0)];
              reg149 <= reg151;
              reg150 <= (wire144[(1'h0):(1'h0)] ^ wire143[(4'he):(4'ha)]);
              reg151 <= (((-$unsigned((!wire144))) ?
                      $unsigned($unsigned((^~wire145))) : (&wire143)) ?
                  ($unsigned((((8'hab) << reg151) <= (~|wire144))) <<< (wire144 <= (reg151 ?
                      (reg150 ^~ reg147) : {reg151,
                          reg148}))) : (^~(((|reg149) ?
                      $signed(wire144) : (7'h44)) <= ($signed(reg151) >>> (reg149 ?
                      (7'h43) : wire145)))));
              reg152 <= reg150;
            end
          if (($unsigned($signed(((^reg152) << reg151))) ?
              wire146[(2'h3):(1'h1)] : ($unsigned(reg149[(4'h8):(3'h5)]) ?
                  wire144[(4'ha):(3'h7)] : reg151)))
            begin
              reg153 <= reg148;
              reg154 <= ((reg148[(1'h1):(1'h0)] ?
                  reg149 : (~^$signed((reg148 != reg147)))) >>> ((((wire146 ?
                          (8'haa) : (7'h41)) ?
                      $signed((8'ha4)) : wire145) ?
                  (wire145 ? reg147 : reg148) : {reg147[(3'h7):(3'h5)],
                      (reg150 + wire145)}) >= (($unsigned(wire144) ?
                      (reg151 ? wire145 : reg152) : $signed(reg151)) ?
                  ((reg153 ?
                      reg151 : reg148) ^ (~|(8'hae))) : (wire144[(2'h2):(2'h2)] ?
                      (reg147 == wire144) : reg151[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg153 <= ((reg151[(2'h3):(2'h2)] && $unsigned(reg150[(2'h2):(2'h2)])) + reg151);
            end
          reg155 <= $unsigned($signed(reg154));
        end
      reg156 <= $signed($signed(reg155[(4'h9):(4'h9)]));
      reg157 <= $unsigned(wire143);
      reg158 <= (({(wire145 ? (~^reg152) : {reg149, (8'haa)}),
          (~|reg150[(1'h1):(1'h1)])} <= (+($unsigned((8'ha8)) ?
          (reg149 ?
              reg150 : reg153) : $unsigned(wire146)))) <<< $unsigned((+$signed(((7'h43) * reg157)))));
      reg159 <= (^((~(reg157[(4'h8):(4'h8)] ?
          (wire145 > (7'h44)) : (reg153 | reg157))) > (-reg151)));
    end
  assign wire160 = $unsigned(reg156);
  assign wire161 = wire143;
  assign wire162 = (!(wire145 ?
                       {wire145[(4'h8):(1'h0)]} : ($unsigned((reg148 ?
                               reg158 : (8'hb8))) ?
                           $signed(reg149[(3'h4):(3'h4)]) : ((reg158 ?
                               reg153 : wire146) - wire146))));
  assign wire163 = (reg155[(3'h4):(3'h4)] ? reg158 : reg158[(5'h10):(4'hd)]);
  always
    @(posedge clk) begin
      reg164 <= ((-$signed(reg159)) & $unsigned(wire161[(4'hc):(1'h1)]));
      reg165 <= reg157;
      reg166 <= $signed($signed(reg152[(1'h1):(1'h1)]));
      reg167 <= $signed((($signed(wire146) | ((8'h9c) || (~|reg153))) ?
          $signed(reg150) : $signed($unsigned((~|(7'h40))))));
    end
  assign wire168 = wire146;
  assign wire169 = $unsigned((&(~|reg166[(2'h3):(1'h0)])));
  assign wire170 = $unsigned((~$unsigned($unsigned(reg154[(3'h6):(1'h0)]))));
  assign wire171 = reg151[(5'h10):(2'h2)];
  assign wire172 = wire146[(2'h3):(2'h3)];
  assign wire173 = wire144;
  assign wire174 = ({((^{reg159, wire145}) <= ((reg165 ?
                           reg157 : wire169) << (^reg150)))} && $signed(({reg154[(1'h1):(1'h0)]} ?
                       reg148 : ((+(8'hb0)) >> reg149[(4'h9):(3'h5)]))));
  assign wire175 = reg150[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg176 <= reg158[(4'he):(2'h3)];
      reg177 <= wire146;
      reg178 <= (wire171[(4'he):(4'h8)] ?
          (-(7'h44)) : (((+(!reg156)) ? wire168 : wire144) ^ wire146));
      reg179 <= (~&$unsigned((+wire163[(2'h2):(2'h2)])));
      reg180 <= reg176;
    end
  assign wire181 = reg155;
endmodule

module module94
#(parameter param126 = {(~^(((~^(8'ha6)) << ((8'hab) << (8'hbc))) ? {((8'hab) + (8'hb1))} : {((7'h43) ? (8'hb6) : (8'hab))})), ((~|({(8'hb0)} >>> ((8'ha8) ? (8'hb1) : (8'ha2)))) > (~|(((8'h9c) ? (8'ha5) : (8'h9c)) ? ((8'hbc) ? (7'h43) : (8'ha5)) : {(8'hb2)})))}, 
parameter param127 = (param126 < param126))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire98;
  input wire signed [(4'he):(1'h0)] wire97;
  input wire [(2'h2):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire99;
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire99,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
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
                 (1'h0)};
  assign wire99 = (~&wire96[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg100 <= $unsigned($unsigned(wire99));
      if ($signed(reg100))
        begin
          reg101 <= $unsigned(wire96);
        end
      else
        begin
          reg101 <= wire95;
          if ({($signed(wire97) ^~ wire96[(1'h1):(1'h0)]),
              ($unsigned($signed((8'hb7))) ?
                  $unsigned(wire98) : $signed((reg100[(3'h7):(1'h1)] << $unsigned(wire97))))})
            begin
              reg102 <= {({$signed($unsigned(wire97))} ?
                      $signed(wire99) : ((^$signed(reg100)) ?
                          $unsigned(wire98[(3'h7):(1'h0)]) : wire95))};
              reg103 <= {$signed((&$unsigned((reg102 ^~ wire96))))};
            end
          else
            begin
              reg102 <= wire97;
              reg103 <= (8'ha1);
              reg104 <= wire98;
            end
          reg105 <= ((+(^(reg101[(1'h1):(1'h1)] ?
              {reg104} : ((8'haa) ?
                  (8'hac) : wire96)))) >= (|reg101[(3'h5):(3'h5)]));
          if (wire98)
            begin
              reg106 <= ($signed((^$unsigned(reg104[(1'h1):(1'h1)]))) && (&reg101[(2'h2):(2'h2)]));
              reg107 <= reg106[(5'h12):(3'h5)];
              reg108 <= ({($signed({wire95,
                      wire96}) << (8'hb3))} && ((~^{(reg100 | reg106),
                  $unsigned(wire97)}) ~^ reg105));
              reg109 <= reg102[(5'h10):(4'ha)];
              reg110 <= {$signed(reg109[(1'h1):(1'h0)])};
            end
          else
            begin
              reg106 <= wire99[(2'h3):(2'h2)];
            end
          if (reg101[(3'h5):(2'h2)])
            begin
              reg111 <= {reg100,
                  (($signed(wire98[(3'h5):(3'h4)]) > (~(wire95 ?
                      reg108 : (8'ha7)))) && $unsigned($signed((reg107 && reg103))))};
              reg112 <= wire96;
              reg113 <= (!$signed((~&(((8'hb7) ~^ wire98) ?
                  reg104 : (7'h41)))));
            end
          else
            begin
              reg111 <= ($unsigned(wire97) ?
                  $signed(((~&wire95[(4'h9):(1'h1)]) ?
                      (!$signed(reg104)) : reg101[(2'h3):(1'h1)])) : ((~&reg103[(2'h3):(2'h2)]) - (($signed(reg102) | $unsigned(wire96)) <= ($unsigned(reg106) - (wire99 ?
                      (8'hb0) : reg104)))));
              reg112 <= $unsigned(wire95);
              reg113 <= ($unsigned({($unsigned(reg111) != reg106)}) << (^($signed({reg107}) <<< $unsigned($signed(reg104)))));
              reg114 <= (8'had);
            end
        end
    end
  assign wire115 = $signed((|reg110[(3'h6):(2'h3)]));
  assign wire116 = reg112[(3'h4):(2'h2)];
  assign wire117 = $signed({reg114[(2'h3):(2'h3)],
                       (wire115[(1'h0):(1'h0)] != $signed({reg110, (8'hbf)}))});
  assign wire118 = $signed((-($signed((wire117 ~^ wire116)) || $unsigned($signed(reg103)))));
  assign wire119 = reg100;
  always
    @(posedge clk) begin
      reg120 <= wire118;
      reg121 <= ({reg102[(4'hf):(2'h3)], $signed(reg112[(1'h1):(1'h0)])} ?
          (|(8'ha7)) : wire97);
      reg122 <= reg113;
      reg123 <= ({(reg104 ~^ reg102),
              ({reg106[(4'hb):(4'h8)]} ?
                  {reg106[(2'h2):(2'h2)], (reg109 != (8'haa))} : {{reg109}})} ?
          reg102 : (&$signed(wire115)));
    end
  assign wire124 = reg112;
  assign wire125 = {$unsigned((|{(~(8'hb3)), wire115})),
                       (reg120 ?
                           ((^~{wire95, wire117}) ?
                               (reg122 ^ ((8'ha6) ?
                                   (7'h40) : reg122)) : reg102) : (wire115 ?
                               wire119 : ((reg109 - wire115) ?
                                   (wire124 ?
                                       wire99 : reg108) : (wire95 ~^ wire96))))};
endmodule

module module40
#(parameter param91 = ((^~({(^(8'hb9))} ? ((!(8'ha9)) ? ((8'hbc) ^~ (8'ha8)) : {(8'hbf)}) : (((8'ha2) ? (8'hb4) : (8'hb4)) ? ((8'ha9) ? (8'hb0) : (8'hab)) : ((8'hb4) ? (8'hb1) : (8'hb1))))) ? (~&(~&((+(8'hbf)) ? (~^(8'hbe)) : ((8'h9d) + (8'hb9))))) : (8'hbd)))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire66,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
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
                 reg50,
                 (1'h0)};
  assign wire45 = ($signed(wire43) ?
                      ((8'hb8) ?
                          ((&$unsigned(wire43)) ?
                              $signed((wire41 - wire43)) : ($signed(wire42) || (+wire44))) : $unsigned(($signed(wire42) < wire41))) : $unsigned((wire41 ^ wire41)));
  assign wire46 = {($unsigned(($unsigned(wire44) > (wire45 <= (8'hb5)))) * (^~(-$signed(wire45)))),
                      $unsigned((wire43 == $unsigned(wire45)))};
  assign wire47 = $signed(wire46[(4'ha):(3'h5)]);
  assign wire48 = (-wire41[(3'h6):(1'h1)]);
  assign wire49 = (wire43[(1'h1):(1'h1)] ? (8'hbd) : wire44);
  always
    @(posedge clk) begin
      reg50 <= wire48;
    end
  assign wire51 = (&(|wire42));
  assign wire52 = (+(&(wire51 ? (~(reg50 < wire42)) : wire45[(3'h5):(2'h3)])));
  assign wire53 = (reg50 < {$signed($unsigned((wire47 ? wire51 : wire43))),
                      ({wire46, reg50[(2'h2):(1'h0)]} ?
                          ((~&wire47) ?
                              (reg50 == wire48) : (wire43 ?
                                  wire41 : reg50)) : (&(wire44 * wire48)))});
  always
    @(posedge clk) begin
      reg54 <= (wire51 > $signed(reg50));
      reg55 <= (8'hae);
      reg56 <= (&({reg54, (wire46 + wire46)} >>> $signed({wire51})));
      reg57 <= $unsigned((8'hbd));
      if ((~|$signed(((wire48[(4'h8):(2'h2)] ?
          wire45[(1'h1):(1'h0)] : wire53[(1'h1):(1'h0)]) ~^ ($unsigned(wire51) < (wire53 ?
          wire51 : reg56))))))
        begin
          reg58 <= $signed((^{$signed($unsigned(wire52))}));
          reg59 <= wire42;
        end
      else
        begin
          reg58 <= (~&{wire46});
          reg59 <= wire44;
          reg60 <= ({$signed((wire41[(4'h8):(1'h1)] ?
                  (|reg57) : $unsigned(wire45)))} >> {({$signed(wire42),
                  ((7'h43) == wire48)} < $signed({reg57})),
              $signed(($unsigned(wire42) ?
                  $unsigned(reg57) : wire42[(3'h5):(1'h1)]))});
          if ((wire49[(3'h5):(1'h0)] ^~ wire42[(2'h3):(1'h1)]))
            begin
              reg61 <= reg50;
              reg62 <= wire46[(3'h7):(3'h7)];
              reg63 <= ($signed($unsigned($signed({wire43}))) ?
                  $signed(wire42) : wire49[(3'h6):(3'h5)]);
              reg64 <= {$signed(($signed((8'hb0)) && reg63[(4'he):(4'ha)])),
                  (+((reg54[(4'h8):(3'h6)] + reg62[(2'h3):(1'h1)]) ?
                      (&reg54) : reg56))};
            end
          else
            begin
              reg61 <= (8'hb2);
              reg62 <= $unsigned(wire53[(2'h2):(1'h1)]);
              reg63 <= wire44;
              reg64 <= ({$unsigned((reg58[(1'h1):(1'h1)] ?
                          (wire48 ? reg58 : (7'h43)) : reg60))} ?
                  (~&wire41[(4'h8):(3'h5)]) : $unsigned((!$unsigned((reg57 * wire41)))));
            end
          reg65 <= reg57;
        end
    end
  assign wire66 = wire41[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg67 <= ({wire45[(3'h5):(2'h3)],
              (wire41 ?
                  ($unsigned((8'hb6)) ?
                      (reg57 >= wire48) : (wire44 ^ reg55)) : (reg63[(3'h4):(3'h4)] | reg59[(1'h0):(1'h0)]))} ?
          $unsigned(($signed(wire48[(4'ha):(4'h9)]) * $signed($signed(wire45)))) : ($signed(reg65[(2'h3):(1'h0)]) ?
              reg59[(1'h1):(1'h0)] : $signed(wire53)));
      reg68 <= (8'had);
      if (wire46[(3'h6):(2'h3)])
        begin
          reg69 <= wire51[(4'he):(2'h2)];
          reg70 <= (&((~&{{wire47, wire52}}) ?
              {$unsigned((wire53 < wire66))} : (+(reg62 * ((8'ha9) ?
                  wire52 : reg54)))));
          reg71 <= reg69[(4'hb):(1'h0)];
          reg72 <= wire43[(1'h1):(1'h0)];
        end
      else
        begin
          reg69 <= $signed($unsigned(wire49[(1'h0):(1'h0)]));
          reg70 <= $unsigned($signed({((reg67 < reg54) ^ wire66)}));
          reg71 <= ((((+$unsigned(reg65)) >>> reg68[(1'h0):(1'h0)]) ?
              $unsigned(((reg57 <<< reg60) ^ reg64)) : ($unsigned((reg62 ?
                  wire41 : reg62)) & (8'ha6))) > wire49[(3'h7):(2'h2)]);
        end
      if ((~|($signed($signed($signed(reg65))) ~^ $unsigned((!reg69)))))
        begin
          reg73 <= (reg62[(3'h6):(3'h5)] ?
              wire66 : $signed($unsigned({(wire47 ? (8'hb1) : wire49),
                  $unsigned(wire49)})));
          reg74 <= (~|$signed(($signed(reg72) ?
              $signed((+reg69)) : ($unsigned(reg67) ?
                  wire47[(3'h4):(3'h4)] : (~|wire47)))));
        end
      else
        begin
          if (wire48[(4'hc):(4'hc)])
            begin
              reg73 <= reg72;
              reg74 <= {wire48, $unsigned(reg61[(2'h3):(2'h3)])};
              reg75 <= reg60;
              reg76 <= (~&$signed((reg69[(3'h7):(2'h2)] ?
                  reg70[(3'h6):(3'h6)] : reg55)));
            end
          else
            begin
              reg73 <= wire42[(3'h6):(3'h4)];
              reg74 <= $signed((reg67[(3'h6):(3'h6)] ?
                  {($signed(wire43) ^~ $signed(reg76))} : $signed($unsigned($signed(reg76)))));
              reg75 <= ({reg69} ?
                  $unsigned({$signed($signed((8'ha7))),
                      reg63}) : $signed($unsigned(wire49)));
              reg76 <= $signed((reg71[(2'h3):(2'h2)] ?
                  reg61[(1'h1):(1'h0)] : $unsigned((^(reg72 ?
                      reg67 : reg67)))));
            end
          reg77 <= reg50[(3'h4):(2'h2)];
          reg78 <= (^~reg76);
          reg79 <= ((($signed((&wire48)) ?
                      $unsigned($signed(reg77)) : {wire43, reg72}) ?
                  $signed(((~|reg60) ?
                      (reg58 & reg71) : (reg72 & reg65))) : (^~wire48)) ?
              $signed((reg56 == $signed((~wire42)))) : (reg78 ?
                  reg61[(2'h3):(1'h0)] : (8'haf)));
        end
    end
  always
    @(posedge clk) begin
      if ((wire43[(1'h0):(1'h0)] ?
          reg57[(3'h4):(2'h2)] : ((wire42[(4'ha):(4'ha)] ^ $unsigned((^reg58))) ?
              $signed(($signed(reg67) ?
                  $unsigned(reg61) : $signed(reg58))) : wire48)))
        begin
          reg80 <= (((reg70 ?
                  $signed(reg79) : ($signed(reg63) ?
                      (reg68 ? wire41 : wire41) : $signed((8'h9d)))) ?
              $unsigned(((wire42 - wire41) ?
                  $signed(wire52) : $signed(wire43))) : reg67) ^ reg62[(1'h1):(1'h1)]);
          reg81 <= ($unsigned($signed($unsigned(reg70[(4'ha):(1'h1)]))) ?
              (-reg62) : $unsigned((8'haa)));
        end
      else
        begin
          reg80 <= $unsigned(reg69);
          if (((((+$signed(reg74)) ?
                  (8'hb8) : (((8'ha3) ? reg73 : reg78) ~^ $unsigned(reg56))) ?
              (~&reg57[(4'hb):(2'h3)]) : reg78[(4'hd):(3'h4)]) >= $unsigned($unsigned($unsigned($unsigned(reg63))))))
            begin
              reg81 <= reg55[(1'h1):(1'h1)];
              reg82 <= wire66;
              reg83 <= $unsigned(reg68);
              reg84 <= wire46[(4'hb):(4'hb)];
            end
          else
            begin
              reg81 <= (!reg56);
              reg82 <= reg62[(2'h3):(1'h1)];
              reg83 <= reg57;
              reg84 <= ((~((^$signed(reg77)) - {reg54[(2'h2):(1'h0)]})) || (~(reg50[(2'h2):(1'h0)] ?
                  {(reg83 <= wire46)} : $signed((reg50 ? wire44 : reg55)))));
              reg85 <= (8'h9e);
            end
          reg86 <= $signed(reg80);
        end
      reg87 <= (reg68[(1'h1):(1'h0)] ^~ (reg78 ?
          $unsigned(((^reg84) ? ((8'haf) || reg81) : (!reg55))) : wire46));
    end
  assign wire88 = ({(reg84[(3'h5):(2'h3)] * wire45),
                          (reg69 ? (8'hb1) : $signed((^~(8'hb7))))} ?
                      $unsigned(wire41) : (+(!(reg65 * $unsigned(reg67)))));
  assign wire89 = $unsigned(wire44[(3'h6):(1'h1)]);
  assign wire90 = reg55[(2'h2):(2'h2)];
endmodule
