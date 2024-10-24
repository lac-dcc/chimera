module top
#(parameter param271 = (|(~^((|(8'haa)) >>> (8'ha6)))), 
parameter param272 = ((param271 ? param271 : (8'ha5)) >> (^{((|param271) ? ((8'ha3) < param271) : param271)})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h36c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire270;
  wire signed [(3'h4):(1'h0)] wire269;
  wire [(5'h15):(1'h0)] wire268;
  wire signed [(4'ha):(1'h0)] wire266;
  wire signed [(4'h8):(1'h0)] wire264;
  wire [(4'h9):(1'h0)] wire220;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire216;
  wire signed [(3'h6):(1'h0)] wire218;
  wire signed [(3'h7):(1'h0)] wire222;
  wire [(2'h3):(1'h0)] wire259;
  wire signed [(4'hb):(1'h0)] wire260;
  wire [(4'ha):(1'h0)] wire262;
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg224 = (1'h0);
  reg [(3'h5):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg227 = (1'h0);
  reg [(5'h12):(1'h0)] reg228 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg229 = (1'h0);
  reg signed [(4'he):(1'h0)] reg230 = (1'h0);
  reg [(2'h3):(1'h0)] reg231 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg233 = (1'h0);
  reg [(5'h13):(1'h0)] reg234 = (1'h0);
  reg [(3'h6):(1'h0)] reg235 = (1'h0);
  reg [(4'hb):(1'h0)] reg236 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg237 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg238 = (1'h0);
  reg [(5'h13):(1'h0)] reg239 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg240 = (1'h0);
  reg [(3'h5):(1'h0)] reg241 = (1'h0);
  reg [(5'h10):(1'h0)] reg242 = (1'h0);
  reg [(2'h2):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg244 = (1'h0);
  reg [(5'h12):(1'h0)] reg245 = (1'h0);
  reg [(5'h12):(1'h0)] reg246 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg248 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg249 = (1'h0);
  reg [(3'h7):(1'h0)] reg250 = (1'h0);
  reg [(5'h10):(1'h0)] reg251 = (1'h0);
  reg [(5'h13):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg253 = (1'h0);
  reg [(5'h14):(1'h0)] reg254 = (1'h0);
  reg [(4'ha):(1'h0)] reg255 = (1'h0);
  reg [(5'h12):(1'h0)] reg256 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg258 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg265 = (1'h0);
  assign y = {wire270,
                 wire269,
                 wire268,
                 wire266,
                 wire264,
                 wire220,
                 wire13,
                 wire49,
                 wire51,
                 wire52,
                 wire53,
                 wire216,
                 wire218,
                 wire222,
                 wire259,
                 wire260,
                 wire262,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg236,
                 reg237,
                 reg238,
                 reg239,
                 reg240,
                 reg241,
                 reg242,
                 reg243,
                 reg244,
                 reg245,
                 reg246,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 reg251,
                 reg252,
                 reg253,
                 reg254,
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 reg265,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(2'h2):(1'h0)];
      if (wire0[(3'h5):(1'h1)])
        begin
          reg5 <= wire1[(2'h3):(2'h3)];
        end
      else
        begin
          reg5 <= $unsigned(wire0);
          reg6 <= (~(({(~^wire3), $signed(wire0)} ?
              ($signed((8'ha5)) * $signed((8'hb6))) : wire3[(1'h1):(1'h0)]) >= (~|$unsigned((~^(8'had))))));
          reg7 <= $unsigned((8'ha5));
          reg8 <= reg5;
          reg9 <= (~^(wire1 <= ($signed($unsigned(reg6)) ^~ reg5)));
        end
      reg10 <= $unsigned(((~reg8[(3'h6):(1'h0)]) + (((wire2 ?
          reg7 : wire2) <= $unsigned(reg8)) && ((wire2 ? (8'h9c) : reg9) ?
          reg8[(1'h1):(1'h0)] : (reg7 >= wire0)))));
      reg11 <= reg7;
      reg12 <= reg10;
    end
  assign wire13 = $signed((^{reg10}));
  module14 #() modinst50 (.wire17(reg5), .clk(clk), .wire19(wire3), .wire16(reg4), .wire18(reg11), .y(wire49), .wire15(wire0));
  assign wire51 = $signed((&$unsigned({((8'haa) ? reg7 : wire0), (~^reg9)})));
  assign wire52 = reg7[(4'ha):(1'h0)];
  assign wire53 = (8'hbe);
  always
    @(posedge clk) begin
      if (reg7)
        begin
          if ({({((wire2 ? (8'h9d) : wire3) ?
                      ((8'hb2) >>> (8'h9f)) : $signed(reg8)),
                  reg7[(2'h3):(2'h3)]} || reg6[(2'h2):(1'h1)]),
              wire52})
            begin
              reg54 <= ((reg5[(4'h8):(1'h0)] ?
                      $signed($signed((wire49 ^ wire2))) : {$unsigned(reg12[(3'h6):(3'h6)])}) ?
                  ((({wire2} ? $signed(reg12) : (~|wire2)) ?
                          ((reg8 ^~ reg11) <<< ((8'hbe) ^~ wire1)) : ((wire51 <= (7'h43)) ?
                              wire13[(2'h2):(1'h1)] : $signed((8'ha1)))) ?
                      $signed(((reg9 ?
                          wire3 : wire49) != $unsigned(wire49))) : wire51[(4'hc):(4'ha)]) : $unsigned((~&$signed((wire49 ?
                      wire49 : wire53)))));
              reg55 <= reg8[(1'h0):(1'h0)];
              reg56 <= $signed($signed($unsigned(wire2[(4'ha):(4'h8)])));
            end
          else
            begin
              reg54 <= (-(({$signed((8'h9d)), $unsigned(reg11)} ?
                      wire53[(1'h1):(1'h1)] : reg6) ?
                  $unsigned((8'hbd)) : ($signed(reg7[(1'h1):(1'h0)]) <= (~&reg10[(3'h6):(2'h3)]))));
            end
          if ($signed((!$signed($signed((reg54 ? (8'ha1) : reg10))))))
            begin
              reg57 <= $unsigned({$unsigned(((wire53 <= reg54) ?
                      (reg56 ? reg12 : (8'hb3)) : wire52[(2'h3):(1'h0)]))});
            end
          else
            begin
              reg57 <= $unsigned(($signed($signed(wire3[(4'hb):(2'h2)])) ^~ $signed($signed(((8'ha3) ?
                  (8'hbf) : reg55)))));
              reg58 <= $signed($unsigned({(wire49[(1'h0):(1'h0)] && $signed(reg4)),
                  $signed((^wire13))}));
            end
          reg59 <= reg7[(4'hc):(1'h1)];
          reg60 <= $unsigned(wire13);
        end
      else
        begin
          reg54 <= (reg55[(3'h6):(3'h6)] | wire0);
          reg55 <= (^~(-(wire3 ?
              $unsigned(((8'ha6) ? wire0 : reg9)) : (~^reg56))));
          if (reg8[(3'h6):(3'h4)])
            begin
              reg56 <= reg60;
            end
          else
            begin
              reg56 <= $signed(((reg57[(3'h4):(3'h4)] ?
                      ($signed(wire3) ?
                          $signed(reg55) : (reg12 ?
                              reg10 : reg10)) : $signed($unsigned((8'hac)))) ?
                  $unsigned((reg4[(3'h6):(1'h1)] * wire1[(3'h7):(2'h3)])) : (!((8'h9c) ?
                      (~^wire2) : {reg6}))));
              reg57 <= (8'hb6);
              reg58 <= $signed((reg8 ?
                  (!$signed((reg9 == (8'haa)))) : $unsigned(({wire1, reg8} ?
                      wire13 : (reg60 < reg59)))));
              reg59 <= $unsigned(reg56[(3'h6):(1'h0)]);
            end
        end
      reg61 <= (($unsigned($signed(((8'hb6) ~^ (8'hb6)))) ?
          wire2[(3'h4):(2'h2)] : $signed((~&$unsigned((8'hb2))))) >> {{{(reg57 ?
                      reg54 : reg4)},
              (8'h9d)}});
    end
  module62 #() modinst217 (wire216, clk, reg10, wire3, reg4, wire0, reg5);
  module25 #() modinst219 (wire218, clk, reg60, wire53, reg9, wire2, wire216);
  module14 #() modinst221 (wire220, clk, reg57, reg55, wire13, reg12, reg61);
  assign wire222 = wire52;
  always
    @(posedge clk) begin
      reg223 <= (~^{{$unsigned((^~(8'ha3)))},
          (wire52 ? reg8[(3'h5):(2'h2)] : ((!wire2) ? {wire218} : (|reg61)))});
      if ((+(-(!($unsigned(wire0) ? {reg4, reg54} : $unsigned(wire222))))))
        begin
          if ($unsigned(reg54))
            begin
              reg224 <= $signed((8'hb4));
              reg225 <= $signed({reg5[(3'h6):(2'h3)]});
              reg226 <= (|$unsigned(reg60));
              reg227 <= $signed($unsigned(wire49[(3'h7):(3'h4)]));
            end
          else
            begin
              reg224 <= wire13;
              reg225 <= (+reg55);
              reg226 <= wire52;
              reg227 <= (^reg10);
              reg228 <= ($unsigned(($unsigned($unsigned(reg55)) <= ({wire220} ?
                  $unsigned((8'hbc)) : (+wire218)))) != $signed(wire216));
            end
          if (($unsigned($signed($unsigned(reg226[(1'h1):(1'h0)]))) >> $unsigned(reg7)))
            begin
              reg229 <= ((reg7[(3'h4):(1'h0)] ?
                      $signed({((8'h9f) ? reg59 : reg59),
                          $unsigned(wire49)}) : reg8[(2'h2):(1'h0)]) ?
                  reg5[(1'h1):(1'h1)] : {$unsigned(((reg4 ? (8'h9f) : wire3) ?
                          $unsigned(reg11) : (wire3 ? reg223 : wire3))),
                      $signed(reg60)});
            end
          else
            begin
              reg229 <= ($signed((-(wire216 ?
                  (~^reg58) : {wire0, (8'ha7)}))) <= wire49[(2'h3):(2'h3)]);
              reg230 <= (^~$unsigned(reg6[(2'h2):(1'h0)]));
              reg231 <= wire220;
              reg232 <= (|reg10[(4'hb):(4'h8)]);
            end
          if ((~^$unsigned(wire2[(4'h9):(1'h1)])))
            begin
              reg233 <= reg59;
              reg234 <= (8'haa);
              reg235 <= (~^$unsigned({$signed(reg11)}));
              reg236 <= $unsigned(wire1);
            end
          else
            begin
              reg233 <= $signed((($signed(((8'ha3) ? reg226 : reg227)) ?
                  ($unsigned(reg11) ?
                      reg55[(1'h0):(1'h0)] : $signed(wire2)) : ((|wire52) ~^ {reg5})) >>> (reg6[(3'h4):(2'h3)] ?
                  {reg55, $unsigned(reg10)} : $signed((wire2 ?
                      reg228 : wire52)))));
              reg234 <= (|$signed((reg12[(1'h1):(1'h0)] ?
                  $unsigned($signed(reg233)) : (reg11 ?
                      $signed(reg56) : (wire1 ? (8'hbf) : reg12)))));
              reg235 <= {{reg224, wire49},
                  $unsigned(((~^(reg5 ?
                      reg236 : reg58)) ~^ (reg59 - (~(7'h42)))))};
            end
          reg237 <= reg229;
          reg238 <= $unsigned((~&(-wire216[(5'h11):(2'h3)])));
        end
      else
        begin
          reg224 <= wire218[(3'h6):(2'h2)];
          reg225 <= reg5[(4'hc):(3'h5)];
          reg226 <= (&(+(^~((reg229 ? reg7 : reg6) ?
              wire3[(3'h6):(3'h4)] : ((8'hb0) | wire218)))));
          reg227 <= ((($signed((wire222 != wire0)) & ((reg234 ?
                      reg60 : reg4) >>> (~reg226))) ?
                  (!$unsigned((7'h44))) : (8'hbd)) ?
              (^~($signed($unsigned(wire0)) && (^~(reg57 ^~ reg58)))) : {(8'hab)});
          reg228 <= reg11;
        end
      reg239 <= wire53[(2'h3):(1'h0)];
      if ((&reg223[(4'h8):(1'h1)]))
        begin
          reg240 <= $signed($signed((reg58 ^~ wire1[(4'h9):(4'h8)])));
          if (wire13[(3'h7):(2'h3)])
            begin
              reg241 <= (($signed(wire0) ?
                  reg238[(4'hc):(2'h3)] : $unsigned((8'h9e))) >> $signed(reg229));
              reg242 <= ((({(reg10 ? wire1 : reg240), $unsigned(reg223)} ?
                  ((reg10 ? reg235 : wire53) == {wire52,
                      (8'haf)}) : (reg240[(4'hb):(4'h8)] - $unsigned(reg55))) << (reg61[(4'h8):(2'h3)] > (^~(^reg236)))) && ((~^$signed({reg7})) ?
                  (reg54[(4'ha):(1'h0)] == (reg4[(1'h0):(1'h0)] ?
                      (reg56 > reg223) : (8'ha8))) : (((wire13 - wire218) ?
                          reg228 : {wire52}) ?
                      reg239[(2'h2):(1'h1)] : $signed($unsigned(reg226)))));
              reg243 <= $signed(wire49);
              reg244 <= $signed(reg57[(5'h14):(3'h7)]);
              reg245 <= $unsigned($signed((~$signed((reg243 * (8'hbb))))));
            end
          else
            begin
              reg241 <= $unsigned(reg236);
              reg242 <= reg58;
              reg243 <= $signed(($unsigned($unsigned($unsigned(reg57))) < $signed((|(&reg7)))));
              reg244 <= $signed($signed((reg225 < {wire220,
                  wire216[(3'h5):(1'h1)]})));
              reg245 <= (^$unsigned((reg230[(3'h7):(2'h2)] ?
                  $signed(((8'hb0) ?
                      (8'hae) : wire220)) : (~|reg57[(4'he):(4'ha)]))));
            end
        end
      else
        begin
          reg240 <= ($unsigned(wire216[(3'h4):(3'h4)]) ?
              {(!reg6)} : $signed($signed(((reg237 < reg56) ?
                  $signed(reg12) : reg57[(3'h7):(3'h6)]))));
          if ((($unsigned((8'ha4)) ?
                  reg61 : (wire220[(1'h0):(1'h0)] ?
                      reg238[(4'ha):(3'h4)] : wire1)) ?
              wire51[(2'h3):(2'h2)] : wire222))
            begin
              reg241 <= reg241[(1'h0):(1'h0)];
            end
          else
            begin
              reg241 <= (~|$signed(wire218));
              reg242 <= $signed($unsigned(wire220));
              reg243 <= reg9[(3'h4):(1'h0)];
              reg244 <= ($unsigned(((reg6 ?
                      (reg242 ? reg5 : reg5) : (-reg231)) ?
                  $unsigned({(8'hbd),
                      wire13}) : $signed(wire13[(1'h1):(1'h1)]))) && $signed($unsigned($signed((8'ha7)))));
            end
          reg245 <= ($unsigned(reg54) != {reg4[(4'ha):(1'h0)],
              $unsigned($unsigned(reg57))});
          if (wire3)
            begin
              reg246 <= reg59[(3'h6):(3'h4)];
              reg247 <= (~^(reg234 ?
                  (7'h43) : $signed((reg227 ? {(7'h41), reg7} : reg245))));
            end
          else
            begin
              reg246 <= reg242[(3'h4):(1'h1)];
              reg247 <= reg57[(5'h12):(4'hc)];
            end
          reg248 <= ($signed($signed(reg225[(3'h4):(2'h2)])) <<< ((reg239[(4'hc):(4'h9)] ?
              (+(^wire2)) : $unsigned((reg61 ? wire220 : reg226))) << (((reg61 ?
                      reg11 : reg240) ?
                  $unsigned(reg60) : $signed((8'ha5))) ?
              $unsigned((reg228 ? (7'h42) : reg6)) : {(~^reg61), (~reg5)})));
        end
      if ($signed(reg240))
        begin
          reg249 <= ((!{$signed((&reg226)), reg245[(1'h0):(1'h0)]}) ^ reg245);
          reg250 <= $unsigned((((~reg55) == reg230[(4'h8):(1'h0)]) ?
              {(reg10 ~^ wire3[(1'h1):(1'h1)]),
                  (reg233 || reg232[(3'h7):(1'h0)])} : reg57));
          if ($signed(($signed(reg250) == $signed((8'hac)))))
            begin
              reg251 <= ($signed($signed((^(+reg233)))) ~^ $signed({$signed(wire218[(1'h1):(1'h0)])}));
            end
          else
            begin
              reg251 <= ((({$unsigned((8'ha4)), (&(8'ha9))} ?
                      {{reg227}} : {(~reg227)}) | $unsigned((^(reg241 && reg241)))) ?
                  {({reg250[(1'h1):(1'h1)]} ?
                          $signed((reg223 ? wire52 : reg226)) : {wire2}),
                      $unsigned((&wire1[(4'ha):(3'h4)]))} : ($signed($signed(wire220[(3'h7):(1'h1)])) + ((~|(^~reg223)) ?
                      $unsigned({reg61}) : $unsigned(wire52))));
              reg252 <= (+$signed(((reg60 + (reg57 & reg242)) ?
                  {(reg224 >= reg59)} : reg55[(3'h6):(1'h1)])));
              reg253 <= (({{((8'ha2) ? (8'ha0) : reg233)}} ?
                  ((reg12 ? {wire51, wire218} : reg235) == ((&reg223) ?
                      (reg236 ? wire1 : reg12) : $signed((8'hb6)))) : {wire216,
                      (&(-wire51))}) | (((~|(|(8'haf))) <= (-$signed(reg248))) * reg235[(3'h6):(3'h5)]));
            end
          reg254 <= (|(~&reg58));
        end
      else
        begin
          if ($signed(wire218))
            begin
              reg249 <= {(!((reg227 >> (~reg224)) || reg6[(2'h3):(1'h0)]))};
            end
          else
            begin
              reg249 <= ($unsigned((reg246 || reg57)) ?
                  $unsigned((!(8'hac))) : (reg245 ?
                      $signed(reg233) : $signed((reg254 == {wire51, reg247}))));
              reg250 <= $signed((|$signed(wire220[(3'h6):(3'h4)])));
              reg251 <= reg237;
              reg252 <= $signed((~|$unsigned(reg10)));
              reg253 <= (reg229[(3'h6):(1'h0)] ?
                  (reg247[(2'h3):(1'h0)] <<< reg232[(1'h1):(1'h1)]) : (+$signed(reg9)));
            end
          if (reg228)
            begin
              reg254 <= (($unsigned(reg61) << (reg246 ^ $signed({reg12,
                  reg5}))) << ($signed(reg250) ?
                  reg254[(3'h6):(2'h3)] : (|reg10)));
              reg255 <= ($signed($signed(((reg252 && wire0) ?
                  $unsigned(reg224) : (~^reg224)))) | reg4[(3'h5):(3'h4)]);
            end
          else
            begin
              reg254 <= (~|$signed(reg251));
              reg255 <= $signed($unsigned({(~^{reg224})}));
              reg256 <= reg230;
            end
          reg257 <= reg54[(1'h1):(1'h1)];
          reg258 <= (8'hb7);
        end
    end
  assign wire259 = $signed(wire49[(1'h0):(1'h0)]);
  module68 #() modinst261 (wire260, clk, reg252, reg4, reg255, reg245, reg223);
  module133 #() modinst263 (.wire136(reg230), .wire134(reg237), .clk(clk), .y(wire262), .wire135(reg10), .wire137(wire220));
  assign wire264 = (8'ha2);
  always
    @(posedge clk) begin
      reg265 <= $unsigned($unsigned((reg59 & wire0[(3'h5):(3'h4)])));
    end
  module25 #() modinst267 (.wire30(reg9), .clk(clk), .wire28(reg257), .wire29(reg229), .y(wire266), .wire26(wire216), .wire27(wire13));
  assign wire268 = ((({(-reg234)} > (~^reg9)) ~^ reg56[(4'hc):(4'h9)]) ?
                       reg57 : {(($unsigned(reg58) ?
                                   {reg235, reg240} : $signed((8'h9c))) ?
                               (~|reg237[(1'h0):(1'h0)]) : (&(reg241 > reg258)))});
  assign wire269 = ($signed((^~($unsigned(reg7) <= $unsigned((8'ha2))))) > wire260[(3'h5):(2'h3)]);
  assign wire270 = reg244[(4'hd):(3'h7)];
endmodule

module module62
#(parameter param214 = (&{(((^(8'ha2)) != ((8'hb3) ? (8'ha5) : (8'h9f))) * ((^~(8'ha6)) ? (-(8'ha8)) : ((8'haa) ? (8'ha2) : (8'hb9)))), {({(7'h42), (8'ha9)} << (8'ha4)), (((8'hb1) ? (8'hab) : (8'hb5)) ? ((8'hb2) ? (8'hbd) : (8'hab)) : (+(8'haa)))}}), 
parameter param215 = ((+{(~&(&param214))}) ? param214 : ((-({param214} ? param214 : (param214 >>> (8'hb0)))) ? {(8'ha8), ((param214 - param214) + param214)} : ((~{param214, (8'hb3)}) + ((param214 ? (8'hb6) : param214) << (^~param214))))))
(y, clk, wire63, wire64, wire65, wire66, wire67);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire63;
  input wire [(5'h13):(1'h0)] wire64;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(4'h9):(1'h0)] wire66;
  input wire signed [(3'h4):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire213;
  wire [(5'h10):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire [(5'h15):(1'h0)] wire197;
  wire signed [(4'hb):(1'h0)] wire193;
  wire signed [(3'h6):(1'h0)] wire192;
  wire [(4'h9):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire189;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'he):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire119;
  reg [(2'h3):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg205 = (1'h0);
  reg [(3'h4):(1'h0)] reg204 = (1'h0);
  reg [(2'h2):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(5'h15):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg194 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire197,
                 wire193,
                 wire192,
                 wire191,
                 wire189,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire119,
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
                 reg196,
                 reg195,
                 reg194,
                 (1'h0)};
  module68 #() modinst120 (wire119, clk, wire64, wire67, wire66, wire63, wire65);
  assign wire121 = (7'h43);
  assign wire122 = ($unsigned($signed({(wire65 ? wire63 : wire67)})) ?
                       $signed((8'h9f)) : ($signed({{wire119, wire63}}) ?
                           wire121 : wire119[(2'h2):(1'h1)]));
  assign wire123 = wire66;
  assign wire124 = wire121;
  assign wire125 = $signed({$unsigned(((8'hbd) ^ wire63))});
  assign wire126 = ((wire125[(1'h1):(1'h1)] ?
                           {((wire66 >= (8'hb4)) ?
                                   $signed(wire121) : $unsigned((8'hb6)))} : {wire124}) ?
                       (wire63 && $signed(wire67[(3'h4):(1'h0)])) : (+{({wire122} ?
                               (~wire63) : (wire64 << wire63)),
                           ((wire121 ^~ wire123) > (wire64 ?
                               wire63 : wire64))}));
  assign wire127 = (((wire119[(1'h1):(1'h0)] ?
                           (((8'hae) ^ wire65) ?
                               wire119[(1'h1):(1'h1)] : (8'hbe)) : (|wire125)) ?
                       (8'hbf) : (({(8'hbc)} ?
                               $unsigned(wire65) : (wire124 & (7'h41))) ?
                           ((wire126 && wire67) ?
                               wire66[(3'h5):(2'h2)] : $unsigned(wire123)) : $unsigned({wire126}))) <= wire123);
  assign wire128 = (wire123 ?
                       ({wire123,
                           $unsigned(wire64[(5'h12):(3'h5)])} <= {(wire125[(4'h9):(3'h4)] ?
                               (wire122 << wire64) : wire125[(4'hc):(2'h3)]),
                           ((wire67 * wire65) ?
                               (wire119 ?
                                   wire122 : wire122) : {wire63})}) : $unsigned($unsigned(wire66[(3'h5):(1'h1)])));
  assign wire129 = $unsigned($signed(wire123));
  assign wire130 = {(-$unsigned(wire127)), $signed({$unsigned((8'hb7))})};
  assign wire131 = (7'h41);
  assign wire132 = wire126[(2'h2):(2'h2)];
  module133 #() modinst190 (wire189, clk, wire64, wire132, wire67, wire128);
  assign wire191 = $unsigned(wire130[(3'h7):(3'h5)]);
  assign wire192 = (wire130 ?
                       (~^$signed($unsigned($signed(wire191)))) : (~(wire128 || {(8'hb4),
                           $signed(wire189)})));
  assign wire193 = $unsigned((wire65 ^ ($signed(((7'h40) ? wire119 : wire67)) ?
                       wire63 : wire123[(4'h8):(1'h0)])));
  always
    @(posedge clk) begin
      reg194 <= wire65[(1'h0):(1'h0)];
      reg195 <= (~&(-((wire126[(1'h1):(1'h1)] > $unsigned(wire65)) ?
          {(~^wire121), wire65[(4'hc):(3'h7)]} : (^wire127))));
      reg196 <= wire131;
    end
  assign wire197 = {(^~($unsigned(wire123) * wire192[(2'h3):(1'h0)])),
                       (+$unsigned($signed(wire125[(3'h6):(3'h4)])))};
  always
    @(posedge clk) begin
      reg198 <= ((~&wire64) <= $signed(wire121));
      if ((~(reg196[(2'h3):(1'h0)] == wire189[(3'h7):(3'h6)])))
        begin
          reg199 <= reg195;
          reg200 <= ({wire192[(3'h6):(2'h2)],
              ($unsigned((|wire132)) - {(reg196 ?
                      reg194 : wire126)})} <= ((wire189 ?
              $unsigned((wire197 ?
                  wire63 : wire132)) : $unsigned($unsigned(reg198))) & ($signed((wire121 << (8'hac))) && (~&$unsigned((8'ha1))))));
          reg201 <= $signed((8'hbb));
        end
      else
        begin
          reg199 <= $signed(wire122[(2'h3):(2'h2)]);
          reg200 <= $signed({(({wire192} <= wire119[(1'h0):(1'h0)]) >= $signed(reg199)),
              (~&(~&(wire67 ? wire119 : (7'h42))))});
          reg201 <= $signed(reg200);
        end
      reg202 <= (!wire119[(2'h2):(1'h0)]);
      if ((-$signed((8'ha9))))
        begin
          reg203 <= reg194;
          if ($signed(((({wire191} ? reg198 : wire191[(3'h6):(3'h4)]) ?
                  ({wire119} ?
                      wire193[(2'h3):(2'h3)] : (8'hb5)) : wire128[(4'hd):(1'h0)]) ?
              (-$unsigned(wire122)) : wire123[(4'hf):(2'h2)])))
            begin
              reg204 <= reg201;
              reg205 <= wire132[(3'h5):(1'h0)];
              reg206 <= $signed(({($unsigned(reg199) ^ wire132[(4'hd):(2'h3)])} || wire124));
              reg207 <= {{(+($unsigned(reg202) ? wire64 : wire130))}};
            end
          else
            begin
              reg204 <= wire126;
              reg205 <= (~{$unsigned(reg200[(3'h5):(3'h5)])});
              reg206 <= (8'h9f);
              reg207 <= reg198;
            end
          reg208 <= (|wire64[(4'h8):(1'h0)]);
        end
      else
        begin
          if ((wire119[(1'h0):(1'h0)] ?
              ($unsigned((((8'ha2) ~^ reg198) > (reg195 ?
                  (8'ha3) : (7'h40)))) < ($unsigned((wire197 ?
                  wire197 : (8'hbb))) * ((reg204 ? reg200 : (8'hb0)) ?
                  wire191 : (8'hae)))) : (-((8'hb7) ~^ (wire131[(3'h7):(3'h5)] - wire65)))))
            begin
              reg203 <= ($unsigned(reg199[(4'h8):(4'h8)]) <= (wire197[(4'h8):(2'h3)] >> $unsigned((((8'hac) ?
                      wire189 : wire126) ?
                  (reg196 & wire63) : $signed(wire129)))));
              reg204 <= (($signed($unsigned(wire132[(1'h0):(1'h0)])) != ($unsigned(wire193[(4'h9):(3'h4)]) | reg208[(5'h14):(3'h5)])) ?
                  $unsigned(reg206[(1'h1):(1'h0)]) : wire123[(3'h7):(3'h4)]);
              reg205 <= (wire64 | (+reg202[(4'h8):(1'h1)]));
              reg206 <= wire122;
              reg207 <= reg201;
            end
          else
            begin
              reg203 <= $signed($unsigned($signed(wire189)));
              reg204 <= $unsigned((8'hbb));
              reg205 <= {wire119};
              reg206 <= wire124;
              reg207 <= wire129[(1'h0):(1'h0)];
            end
          reg208 <= $signed(({(((8'hae) ? wire63 : wire119) ?
                  (reg199 ? wire129 : wire125) : $signed(wire119)),
              (8'h9f)} - (reg201[(3'h4):(2'h2)] > $unsigned(wire131))));
        end
      if (wire129)
        begin
          reg209 <= reg204;
        end
      else
        begin
          reg209 <= wire191[(3'h4):(1'h0)];
          reg210 <= $signed($signed((reg208 - ({(7'h41)} && wire128[(4'h9):(2'h2)]))));
        end
    end
  assign wire211 = $signed(wire64[(4'h9):(3'h7)]);
  assign wire212 = $unsigned(((~^$unsigned(reg205)) >= $unsigned($unsigned(reg195))));
  assign wire213 = (|(~(|wire122[(1'h1):(1'h1)])));
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire41;
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire41,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire20 = (|$unsigned(wire16[(2'h3):(2'h2)]));
  assign wire21 = {wire15[(3'h4):(1'h1)], (wire17 <<< wire16[(1'h0):(1'h0)])};
  assign wire22 = (~|$unsigned((wire21[(1'h0):(1'h0)] ?
                      ((~(8'haa)) ?
                          $signed((8'h9c)) : $unsigned(wire21)) : (&wire18[(3'h5):(2'h2)]))));
  assign wire23 = (wire20 << (^~(|$signed(wire20[(2'h2):(1'h1)]))));
  assign wire24 = wire23[(3'h5):(1'h1)];
  module25 #() modinst42 (wire41, clk, wire17, wire21, wire20, wire19, wire18);
  always
    @(posedge clk) begin
      reg43 <= ((-((^(&wire17)) ?
          wire22 : $signed($signed(wire23)))) <= $unsigned(wire23[(2'h2):(2'h2)]));
      reg44 <= wire19[(3'h6):(2'h3)];
    end
  assign wire45 = ($unsigned(wire16[(3'h7):(3'h6)]) ?
                      (!$unsigned($signed((-(8'h9d))))) : $unsigned(((+(wire20 || reg43)) && wire19)));
  assign wire46 = {$signed($unsigned($unsigned($signed(wire23))))};
  assign wire47 = $unsigned(({reg44[(3'h4):(1'h1)],
                          {wire20[(4'h8):(1'h1)], {wire23, wire24}}} ?
                      $unsigned(($signed(wire18) ?
                          wire17 : wire41[(4'ha):(2'h3)])) : {($signed(wire18) >>> (wire45 ?
                              wire21 : reg44))}));
  assign wire48 = $unsigned($unsigned((|$unsigned((&wire19)))));
endmodule

module module25
#(parameter param40 = (8'hac))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  input wire signed [(2'h2):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire31 = $unsigned($signed(({(~^wire30)} ?
                      ((wire28 ? wire30 : wire29) <= (8'ha0)) : {{wire30}})));
  assign wire32 = {(wire29[(2'h3):(1'h0)] == {((wire26 >> (8'h9c)) || $unsigned(wire30)),
                          {{wire29, wire31}, (!wire29)}})};
  assign wire33 = (($unsigned((|wire30)) <<< wire31[(4'hb):(1'h0)]) ?
                      wire26 : (!(wire31 >> (^(^~wire27)))));
  assign wire34 = {$signed((^$unsigned(wire32)))};
  assign wire35 = $signed(wire29[(4'h9):(3'h4)]);
  assign wire36 = (wire33 ? wire28 : wire35);
  assign wire37 = ($unsigned(wire31) != $signed({($unsigned(wire32) ?
                          wire33 : wire34[(1'h0):(1'h0)])}));
  always
    @(posedge clk) begin
      reg38 <= wire35;
      reg39 <= (wire31 ?
          wire26 : $unsigned(($signed((wire26 ? wire35 : wire33)) ?
              (-$unsigned(wire36)) : reg38)));
    end
endmodule

module module133
#(parameter param187 = (+((^{((8'h9f) ? (8'hbe) : (8'ha1)), (~(8'hab))}) | (~^(((7'h40) ? (8'ha5) : (7'h40)) ? ((8'hb9) ? (8'hb2) : (8'ha7)) : ((7'h40) ? (7'h42) : (8'h9d)))))), 
parameter param188 = param187)
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h208):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire137;
  input wire [(4'he):(1'h0)] wire136;
  input wire [(3'h4):(1'h0)] wire135;
  input wire [(2'h2):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire185;
  wire [(4'hf):(1'h0)] wire184;
  wire [(3'h7):(1'h0)] wire183;
  wire [(3'h5):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire181;
  wire signed [(4'ha):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire [(4'h8):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire155;
  wire [(4'hc):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire153;
  wire signed [(2'h3):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire138;
  reg [(4'hf):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(3'h6):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg168 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  reg [(5'h10):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire138,
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
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 (1'h0)};
  assign wire138 = {((wire135[(3'h4):(1'h1)] ?
                               ((-wire136) > (~^wire136)) : $signed((wire136 ?
                                   (8'hb5) : wire134))) ?
                           {wire136,
                               $unsigned((|wire135))} : ((wire136[(1'h1):(1'h1)] & (8'hb5)) * $signed(wire137))),
                       ($unsigned($unsigned(wire136[(4'h9):(1'h0)])) ?
                           {$signed($unsigned(wire137))} : (~wire134[(2'h2):(1'h1)]))};
  always
    @(posedge clk) begin
      reg139 <= wire134[(1'h1):(1'h1)];
      reg140 <= reg139[(4'h8):(3'h5)];
      if ($unsigned($unsigned((^~(reg139[(3'h6):(3'h5)] >>> (reg139 * wire134))))))
        begin
          reg141 <= reg140;
          reg142 <= $signed(wire138[(4'hf):(3'h7)]);
          reg143 <= $signed(reg141);
          if ((~&$unsigned({$unsigned(reg143[(3'h7):(3'h6)]),
              (~$unsigned((8'hb6)))})))
            begin
              reg144 <= (reg143 ?
                  wire137[(2'h3):(1'h1)] : wire136[(4'h9):(1'h0)]);
              reg145 <= (reg139[(4'hd):(2'h3)] == $unsigned((-$unsigned(reg142))));
              reg146 <= ($unsigned((8'hb3)) ?
                  {reg140} : $unsigned(((&(8'ha8)) >> $unsigned($signed(reg145)))));
              reg147 <= $signed((wire138 ?
                  $unsigned(reg143) : {((~^(8'had)) ^ $signed(reg141)),
                      ($signed(wire134) ? (8'ha2) : (8'h9d))}));
              reg148 <= $signed($unsigned(((((7'h40) ? (7'h43) : reg139) ?
                      (reg139 ? reg145 : reg143) : $signed((8'haa))) ?
                  $unsigned(((8'ha8) | wire136)) : $signed($signed(reg140)))));
            end
          else
            begin
              reg144 <= (&wire134);
              reg145 <= (reg142[(2'h2):(1'h1)] >= reg144[(2'h2):(1'h1)]);
              reg146 <= $signed($signed(({(~&wire135)} + (8'ha2))));
              reg147 <= ((({(reg148 < (8'h9c))} ?
                          (reg146 * $unsigned(reg144)) : wire137[(3'h7):(1'h0)]) ?
                      wire136[(4'h9):(2'h2)] : {$unsigned(reg146[(1'h0):(1'h0)]),
                          wire134}) ?
                  (^~(|$signed($unsigned(reg142)))) : reg142);
            end
        end
      else
        begin
          reg141 <= wire137;
        end
    end
  assign wire149 = wire135[(3'h4):(2'h2)];
  assign wire150 = ($signed((^~$signed($signed(reg145)))) ?
                       $unsigned($signed($unsigned($unsigned(reg147)))) : reg140[(3'h7):(3'h7)]);
  assign wire151 = ((&reg140) ^~ (~&(wire135[(1'h0):(1'h0)] ?
                       $signed(reg141) : $unsigned((+(8'ha4))))));
  assign wire152 = reg142[(2'h2):(1'h0)];
  assign wire153 = $unsigned(((((|wire151) >= (reg146 ~^ reg139)) ?
                           $signed((&reg144)) : $unsigned(((8'hb5) + reg142))) ?
                       (8'hba) : (+($unsigned(reg143) == $unsigned(wire138)))));
  assign wire154 = wire138;
  assign wire155 = wire149[(4'ha):(4'h8)];
  assign wire156 = (wire149 ?
                       $signed((^($signed(wire134) ?
                           wire137 : wire134[(2'h2):(1'h0)]))) : reg146[(2'h2):(1'h1)]);
  assign wire157 = wire134;
  always
    @(posedge clk) begin
      if (($unsigned(({(wire137 ? (8'hbf) : reg140)} ?
          reg141 : $unsigned($signed(wire157)))) + $signed(wire156[(3'h7):(3'h7)])))
        begin
          reg158 <= ($unsigned(($signed(wire155) ?
                  ($signed(wire134) ?
                      $signed(wire137) : ((8'ha2) ?
                          wire152 : reg145)) : reg146[(2'h2):(1'h0)])) ?
              (!reg146) : $unsigned(reg146));
          reg159 <= (((~$unsigned((reg142 ? wire137 : (7'h40)))) ?
                  wire137 : wire136[(4'hb):(3'h5)]) ?
              $signed({{$unsigned(reg143)},
                  $unsigned((reg141 ?
                      reg158 : wire149))}) : {wire151[(2'h3):(2'h2)],
                  ($signed((reg142 <<< wire157)) << (+reg140))});
          reg160 <= (~|($signed((~&{reg144,
              wire138})) && $signed((^$unsigned(wire149)))));
          reg161 <= reg144;
        end
      else
        begin
          reg158 <= {$unsigned((~|(+$signed(reg139)))),
              ((!$signed((&reg147))) ?
                  ((+$unsigned(reg160)) ?
                      wire135 : {(~|reg143),
                          wire138[(4'h8):(2'h2)]}) : (^{(-wire152),
                      wire152[(2'h2):(2'h2)]}))};
          reg159 <= (wire152 <<< reg142);
          reg160 <= $unsigned(wire156);
          reg161 <= $unsigned($signed($signed(wire136[(3'h5):(2'h2)])));
          if (((({$signed(reg144), $signed(reg145)} | (((8'h9f) ?
                  reg143 : wire156) < (reg139 ?
                  (8'h9c) : reg146))) == (+(8'hbb))) ?
              ({$signed(reg158),
                  wire157[(1'h0):(1'h0)]} >= {$signed((-wire154)),
                  ((reg143 ? wire156 : wire154) ?
                      wire156[(5'h11):(5'h10)] : $signed(wire153))}) : $signed($signed(reg143[(4'hd):(1'h1)]))))
            begin
              reg162 <= (^(($unsigned((reg142 ?
                  wire149 : reg141)) || ((~&(8'hb9)) ?
                  reg139 : $signed(wire138))) & (reg146 | ((reg144 ?
                      wire153 : (8'haa)) ?
                  (wire157 - wire153) : (!wire149)))));
              reg163 <= wire150;
              reg164 <= (&(8'hb3));
              reg165 <= (&{reg145,
                  ((8'had) ~^ ((wire135 ?
                      wire135 : wire155) > (reg139 <= wire138)))});
              reg166 <= ((&wire149) ?
                  $signed(($signed((~wire152)) ?
                      ((reg142 ~^ reg162) ^ (reg147 ?
                          (8'hb3) : reg143)) : (reg142[(1'h0):(1'h0)] >>> (wire157 >>> reg159)))) : reg144);
            end
          else
            begin
              reg162 <= {$unsigned((($unsigned(wire137) > wire156[(5'h11):(4'ha)]) || wire153[(2'h2):(1'h1)]))};
              reg163 <= reg158[(4'h9):(4'h8)];
            end
        end
      if ((8'hac))
        begin
          reg167 <= ((reg161[(2'h3):(1'h1)] ?
                  (reg166 ?
                      (|(&(7'h40))) : (reg164[(4'he):(3'h7)] <<< (reg147 ?
                          reg163 : wire153))) : $unsigned($signed(reg162))) ?
              wire152[(2'h2):(2'h2)] : ($unsigned(reg143) ?
                  ($unsigned(wire150[(1'h1):(1'h1)]) - $signed(wire138[(2'h3):(2'h3)])) : wire150));
          if ($unsigned(reg145))
            begin
              reg168 <= {($unsigned(wire156) <<< $unsigned($unsigned((~|wire151))))};
            end
          else
            begin
              reg168 <= ((((8'hb6) && ($signed((8'hbd)) ?
                      $signed(wire151) : ((8'haa) ? reg163 : wire136))) ?
                  $signed($signed(reg161)) : (8'ha3)) || wire137[(2'h2):(1'h0)]);
              reg169 <= reg159;
              reg170 <= $unsigned(reg163);
              reg171 <= $signed(wire154);
            end
          if (wire150)
            begin
              reg172 <= reg147[(1'h1):(1'h0)];
              reg173 <= $unsigned(reg139[(3'h4):(2'h3)]);
              reg174 <= $signed($unsigned($signed(((reg146 ? reg147 : reg147) ?
                  {(8'hb5), reg145} : ((8'hb5) && wire155)))));
            end
          else
            begin
              reg172 <= ($signed(wire151) > (^~wire150[(5'h10):(1'h1)]));
              reg173 <= reg148;
              reg174 <= wire156;
            end
          reg175 <= {(~(((wire135 > wire136) ? $unsigned(reg161) : (~&reg174)) ?
                  wire157 : wire152))};
        end
      else
        begin
          reg167 <= (8'ha5);
          reg168 <= reg168;
          reg169 <= (reg144[(2'h2):(1'h1)] ?
              (wire153[(3'h4):(1'h0)] + ((((8'hbe) ? wire137 : reg174) ?
                      {wire155, reg162} : (reg170 * reg174)) ?
                  (-$signed(reg141)) : wire151)) : (~^(wire155[(2'h3):(2'h3)] ~^ ((reg162 & reg160) < (8'hb9)))));
          reg170 <= (reg172 ? reg166 : {(-wire149[(4'hc):(3'h7)])});
        end
      reg176 <= (reg144[(1'h0):(1'h0)] | $signed((($unsigned(reg144) ?
          ((8'ha8) > reg164) : (reg139 ? (8'ha8) : reg163)) * $signed({reg160,
          wire153}))));
      reg177 <= wire138[(3'h7):(1'h0)];
    end
  assign wire178 = $unsigned(reg145[(1'h1):(1'h0)]);
  assign wire179 = ((($unsigned({wire155}) * $unsigned((reg166 ?
                           (8'ha0) : reg174))) >>> ($signed($signed(reg164)) ?
                           $signed((+reg142)) : (~{reg166}))) ?
                       reg143[(1'h0):(1'h0)] : $unsigned({(|wire154),
                           (~&$signed((8'h9f)))}));
  assign wire180 = reg142[(2'h3):(1'h1)];
  assign wire181 = (8'hb4);
  assign wire182 = (+(wire149 != (wire156 <= (-$signed(wire178)))));
  assign wire183 = (^($signed((&{reg146, reg159})) ?
                       (8'hb2) : $unsigned((8'ha6))));
  assign wire184 = wire183;
  assign wire185 = (^reg144);
  assign wire186 = wire154;
endmodule

module module68
#(parameter param117 = (^~{(8'hb1), (({(8'hb6)} + ((7'h43) + (8'hb8))) ? (((8'ha0) ? (8'hb9) : (8'hb5)) << {(8'ha0), (8'hb9)}) : (+{(8'hb0)}))}), 
parameter param118 = ((param117 == ((|(param117 - param117)) ? {{param117}, (param117 ? (8'haf) : param117)} : (param117 ? param117 : (param117 >= param117)))) ? (+(param117 * ((&param117) ~^ {param117}))) : (~&param117)))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire73;
  input wire signed [(2'h2):(1'h0)] wire72;
  input wire signed [(4'h9):(1'h0)] wire71;
  input wire [(5'h12):(1'h0)] wire70;
  input wire [(5'h11):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  assign y = {wire107,
                 wire101,
                 wire100,
                 wire91,
                 wire90,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg89,
                 reg88,
                 reg87,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire74 = (~^$unsigned($signed((~&{wire69}))));
  assign wire75 = wire72[(2'h2):(1'h1)];
  assign wire76 = ($signed(wire74[(4'hd):(4'hc)]) ~^ $signed(wire70[(1'h1):(1'h1)]));
  assign wire77 = (8'ha2);
  always
    @(posedge clk) begin
      if ({{wire76}, $unsigned(wire71[(3'h4):(1'h0)])})
        begin
          if (({($signed(wire72) == (~&(~&wire72)))} ?
              $signed({{(wire75 & wire71),
                      (wire70 ? wire72 : (8'ha0))}}) : (wire72 ?
                  wire73 : (((8'ha4) ?
                          wire73[(4'h9):(1'h1)] : $signed(wire73)) ?
                      wire69[(4'hc):(3'h5)] : ($unsigned((8'ha4)) << (wire75 - wire69))))))
            begin
              reg78 <= (wire77[(1'h1):(1'h0)] ?
                  {{wire71[(1'h1):(1'h1)],
                          (wire69[(4'hf):(4'hb)] ?
                              $unsigned((8'hb0)) : (&wire74))}} : wire76);
            end
          else
            begin
              reg78 <= reg78;
              reg79 <= {wire72};
              reg80 <= (!((wire69 ?
                  (~(wire73 ?
                      wire75 : wire76)) : wire69[(4'h8):(2'h3)]) & wire76[(1'h1):(1'h1)]));
            end
        end
      else
        begin
          reg78 <= (($signed(wire69[(4'h9):(4'h8)]) ?
              (&$unsigned(wire74)) : wire77[(3'h7):(3'h4)]) <= wire76);
          reg79 <= (+((wire73 ?
              (wire75 ?
                  (wire70 >>> wire73) : $unsigned(reg80)) : ($unsigned(wire71) ?
                  wire76[(2'h2):(1'h1)] : {wire69,
                      (8'ha4)})) || $unsigned((~^(!wire75)))));
        end
    end
  assign wire81 = (^~{$unsigned(($signed((8'h9d)) ?
                          wire75 : wire73[(5'h10):(4'hb)]))});
  assign wire82 = {(|$unsigned(wire76[(1'h0):(1'h0)])),
                      {((^{(8'hb1)}) >> wire70[(4'hb):(4'ha)])}};
  assign wire83 = $signed(wire72);
  assign wire84 = (~^((^wire83) ? wire74[(4'hb):(2'h2)] : wire71));
  assign wire85 = (|$unsigned($unsigned({reg79[(1'h1):(1'h0)],
                      $unsigned(wire73)})));
  assign wire86 = (^~wire77);
  always
    @(posedge clk) begin
      if (($unsigned((&$unsigned($signed(wire86)))) ?
          (&($signed($signed(wire69)) ? wire75 : wire72)) : (wire73 ?
              wire70[(2'h2):(2'h2)] : (8'ha4))))
        begin
          reg87 <= {(~&(8'hbe)),
              $signed((reg80[(4'h8):(2'h2)] ?
                  (|$unsigned(wire75)) : wire81[(4'h9):(3'h7)]))};
        end
      else
        begin
          reg87 <= wire71[(1'h1):(1'h1)];
          reg88 <= $signed(wire82[(4'he):(4'he)]);
          reg89 <= {$signed(((~&(~^wire83)) < (wire73[(4'h8):(3'h5)] < $unsigned(wire76))))};
        end
    end
  assign wire90 = wire70;
  assign wire91 = wire70[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      reg92 <= $unsigned(reg89);
      reg93 <= (!(8'hac));
      reg94 <= wire77[(4'hc):(2'h3)];
      if ({wire83[(4'h9):(3'h5)],
          $signed((reg78[(3'h6):(1'h0)] ?
              (reg78 & $unsigned((8'haa))) : wire81[(4'h8):(3'h5)]))})
        begin
          reg95 <= $signed(wire70);
          reg96 <= reg95[(4'hc):(4'hc)];
        end
      else
        begin
          if ({$signed($signed(reg93)),
              (^~$signed(((^(8'ha1)) & $signed(wire85))))})
            begin
              reg95 <= (-wire75);
              reg96 <= (reg94 ?
                  wire90[(1'h1):(1'h0)] : ($unsigned(reg95) == (reg94[(3'h5):(2'h3)] ?
                      (reg92[(3'h7):(3'h5)] ^~ reg87) : (wire73 ?
                          (wire73 ? reg94 : reg96) : (reg79 - wire76)))));
            end
          else
            begin
              reg95 <= wire84[(3'h6):(1'h0)];
              reg96 <= ({$unsigned($unsigned((|wire90))),
                      {((wire74 <= reg80) ?
                              ((8'ha7) ? reg79 : wire84) : $signed(wire70))}} ?
                  ((!(&{wire83})) | ($unsigned(reg88[(1'h1):(1'h0)]) ?
                      $unsigned($signed(wire70)) : $signed($signed((8'hb3))))) : {wire75});
              reg97 <= $signed($signed($signed($unsigned($signed(wire81)))));
            end
          reg98 <= wire71;
        end
      reg99 <= ({(reg94 & $signed(reg93[(3'h6):(2'h2)]))} != $unsigned(wire70));
    end
  assign wire100 = {((+$signed($unsigned(reg94))) ?
                           ($signed($signed(reg92)) <<< $signed(reg92)) : ((!(^wire86)) < {wire76[(1'h0):(1'h0)]}))};
  assign wire101 = (($signed((reg97[(4'hf):(3'h4)] >> (reg80 < wire90))) ?
                           ($signed($signed(wire70)) ?
                               wire84[(2'h3):(2'h3)] : ((wire76 ?
                                       wire85 : reg95) ?
                                   $unsigned(wire91) : {(8'h9c)})) : wire73[(3'h7):(1'h0)]) ?
                       wire77 : (((reg78 ? reg87 : wire73[(4'hb):(3'h7)]) ?
                           ($signed(wire82) < (reg96 ?
                               wire86 : reg95)) : ($signed(wire100) ?
                               $signed(reg93) : wire70)) <= ($signed(reg89[(4'h8):(2'h3)]) ?
                           $signed((reg80 ?
                               reg78 : reg87)) : ((wire85 <= (8'hb9)) ?
                               wire74 : reg97))));
  always
    @(posedge clk) begin
      reg102 <= ((((8'hbe) ?
              $signed((wire73 ?
                  wire71 : wire76)) : {$unsigned(reg92)}) * {$unsigned($unsigned(wire69)),
              $signed(wire81)}) ?
          ($unsigned(wire70[(2'h3):(1'h1)]) & $unsigned((^(7'h43)))) : (reg88 ?
              wire84 : (~|(8'hb6))));
      reg103 <= $unsigned(($signed((+(reg93 ?
          wire75 : reg87))) && reg94[(3'h7):(3'h6)]));
      reg104 <= (^(~|$unsigned((-reg89[(2'h2):(1'h1)]))));
      reg105 <= {(!$signed($signed($unsigned((8'hba)))))};
      reg106 <= reg92[(4'h9):(4'h8)];
    end
  assign wire107 = $signed($unsigned(reg102[(4'h8):(3'h6)]));
  always
    @(posedge clk) begin
      reg108 <= wire75[(4'ha):(4'h9)];
      reg109 <= (|wire107[(2'h2):(1'h1)]);
      reg110 <= reg79[(2'h3):(1'h1)];
      reg111 <= ($unsigned($signed(((wire100 <<< wire83) < (|wire69)))) ?
          (!{$signed((8'hb6)),
              (+(reg110 ?
                  reg87 : (8'h9c)))}) : ($signed((~(wire76 >>> wire107))) <<< ($signed(reg102[(2'h2):(1'h1)]) >> $signed($signed(reg99)))));
      reg112 <= (~|($unsigned(((reg102 == reg104) ?
          wire90 : reg93)) < wire101));
    end
  always
    @(posedge clk) begin
      if ((~^(~(~&$unsigned($unsigned(reg88))))))
        begin
          reg113 <= (({($unsigned(reg102) ?
                      $unsigned(reg102) : (~^reg110))} || {(wire75 ?
                      (wire82 ^ reg93) : (wire86 > reg110)),
                  ((reg111 <= wire77) <= reg92[(1'h1):(1'h1)])}) ?
              ((wire84[(4'ha):(4'h9)] ?
                  $unsigned((&reg104)) : ((&wire73) ?
                      $unsigned(reg88) : (wire83 < wire84))) != $signed($unsigned($signed(reg78)))) : (|wire76[(1'h1):(1'h0)]));
          reg114 <= reg112;
        end
      else
        begin
          reg113 <= $signed((~|(((~|reg97) ?
                  $signed(wire85) : (reg97 ^~ reg108)) ?
              $unsigned((-(8'hab))) : ($signed(reg102) - (+wire71)))));
          reg114 <= reg106;
          reg115 <= wire90;
          reg116 <= $unsigned($unsigned($signed($unsigned((wire77 <<< (8'hb5))))));
        end
    end
endmodule
