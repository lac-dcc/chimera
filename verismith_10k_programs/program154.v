module top
#(parameter param198 = (((8'ha1) ? (+{(&(8'ha1))}) : ((((8'haa) <= (8'haa)) ? ((8'ha8) ? (8'hb8) : (8'ha8)) : (~^(8'h9e))) ? {(+(8'ha4))} : ((~&(8'ha7)) ? (8'ha9) : (^(8'ha7))))) ? ((-(((7'h41) ? (8'ha6) : (8'hbc)) <<< {(7'h40)})) ? (({(7'h44)} > {(8'hbe)}) <<< (-(&(8'ha3)))) : (((7'h40) ? (-(8'hb5)) : ((8'h9f) <<< (8'ha0))) ? (~&((8'hb3) <= (7'h44))) : (((8'ha2) ^ (8'hbc)) ? (8'hb1) : {(7'h44)}))) : {(-(~((8'hbd) ? (8'hbe) : (8'hb0)))), ((&((8'hac) ? (8'hbe) : (8'hb4))) ? ((~(8'ha6)) - (^~(8'haf))) : (^((8'h9d) == (8'hac))))}), 
parameter param199 = (!((~|({param198} > (param198 ? param198 : param198))) >= (((-param198) * {param198, param198}) ? {(param198 & param198), (param198 ? param198 : (8'hbc))} : ((param198 ? param198 : param198) <= (8'hb5))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire197;
  wire signed [(4'h9):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire197,
                 wire195,
                 wire32,
                 wire29,
                 wire9,
                 wire4,
                 reg31,
                 reg30,
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
                 reg10,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire2[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg5 <= $unsigned(((wire3 ?
              $unsigned((wire1 ? wire0 : wire3)) : (-((8'haa) ^ wire3))) ?
          wire1[(1'h1):(1'h0)] : {wire1[(2'h2):(1'h0)], (~$unsigned(wire2))}));
      reg6 <= $unsigned(wire0);
      reg7 <= $signed({$unsigned(wire4[(3'h7):(1'h0)]),
          (|(!$unsigned(wire2)))});
      reg8 <= (~&$unsigned(wire2[(2'h2):(1'h1)]));
    end
  assign wire9 = reg5[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg10 <= wire2;
      reg11 <= (|(!$signed($unsigned((^~(8'hb9))))));
      if ((wire9[(2'h3):(2'h3)] >= (~{reg11[(3'h5):(2'h2)], $unsigned(wire9)})))
        begin
          reg12 <= ($unsigned((($unsigned(reg10) ? (^~reg10) : reg5) ?
                  $signed($signed(reg11)) : (+(reg7 || wire9)))) ?
              {(+(~&{wire0})),
                  $unsigned(reg8[(1'h1):(1'h0)])} : ((wire2 - ($unsigned(reg8) * (^reg10))) ?
                  {((~reg8) ? (+(8'hb9)) : (+wire9))} : ((^~$signed(wire0)) ?
                      ($unsigned(reg10) + $unsigned(wire0)) : ((wire1 ?
                          (8'ha2) : reg11) > (~reg6)))));
        end
      else
        begin
          reg12 <= $signed($signed(wire4));
          reg13 <= wire0;
        end
      if ((reg8[(1'h0):(1'h0)] || (~reg6)))
        begin
          reg14 <= reg10;
          reg15 <= wire3[(2'h3):(1'h1)];
          reg16 <= (~($signed($signed((reg14 == reg14))) ?
              reg10[(1'h0):(1'h0)] : (|$unsigned((reg13 ? wire3 : wire1)))));
          reg17 <= $signed(reg11);
          reg18 <= $signed(($signed($unsigned((&wire3))) < reg8[(2'h2):(2'h2)]));
        end
      else
        begin
          reg14 <= ($signed((^~(&$signed(wire2)))) ^ wire2[(4'hd):(4'hb)]);
          reg15 <= (((8'hb6) && wire4[(1'h0):(1'h0)]) ?
              (|($signed({reg6, wire3}) ?
                  $unsigned(reg13) : ($unsigned(wire4) << (reg8 ~^ reg5)))) : (wire1[(2'h2):(1'h1)] <<< wire2[(1'h0):(1'h0)]));
          reg16 <= (reg7[(1'h1):(1'h1)] || reg7);
          if (reg15[(4'hb):(4'h8)])
            begin
              reg17 <= $signed($signed(((-wire1) ?
                  (~|reg8) : (&$unsigned(wire3)))));
              reg18 <= $signed(reg8);
              reg19 <= $signed($unsigned({reg10, reg13[(1'h0):(1'h0)]}));
              reg20 <= $unsigned($signed(((reg13 ?
                  $signed(reg13) : (reg18 ? reg6 : wire2)) >>> $unsigned({reg10,
                  reg15}))));
            end
          else
            begin
              reg17 <= {($unsigned(((-wire2) ?
                      $signed((8'hbc)) : (reg11 | reg20))) * (^~(+reg8[(2'h2):(1'h0)])))};
              reg18 <= $unsigned((^~(8'ha5)));
              reg19 <= wire2;
            end
        end
      if ((~|reg12[(3'h4):(3'h4)]))
        begin
          reg21 <= (reg20 ^~ $signed(reg6[(4'hd):(4'h9)]));
        end
      else
        begin
          reg21 <= reg6[(5'h10):(4'hd)];
          if ($unsigned((-wire2)))
            begin
              reg22 <= reg14;
              reg23 <= reg18[(4'hd):(4'hb)];
            end
          else
            begin
              reg22 <= $signed($signed((^~reg12)));
              reg23 <= ($signed((&$unsigned(wire9[(4'h8):(3'h4)]))) ?
                  reg8[(3'h5):(2'h2)] : (&(wire3[(3'h5):(2'h2)] ?
                      ((reg17 ?
                          (7'h40) : (8'haa)) > (reg16 - reg18)) : wire3)));
              reg24 <= reg23;
              reg25 <= $signed(reg5);
              reg26 <= reg19[(2'h2):(2'h2)];
            end
          reg27 <= (|$unsigned($signed((|(reg11 ? reg17 : wire0)))));
          reg28 <= ($signed($unsigned(wire3[(2'h3):(2'h2)])) ?
              {wire9[(3'h6):(2'h3)],
                  ($signed((&reg13)) ?
                      (~&(|reg7)) : $unsigned((^wire4)))} : (reg21[(3'h4):(1'h1)] ?
                  ((|$signed((7'h41))) >= wire2) : reg5));
        end
    end
  assign wire29 = reg15[(4'he):(4'h9)];
  always
    @(posedge clk) begin
      reg30 <= (reg28[(1'h1):(1'h1)] >>> $signed(($unsigned($unsigned(reg11)) && (8'ha3))));
      reg31 <= ((wire4[(4'hf):(3'h5)] ?
              ((((8'h9f) ? (8'hac) : reg6) ?
                      ((8'hb5) >>> reg14) : $signed((7'h41))) ?
                  (wire2[(3'h5):(3'h4)] << (8'hb5)) : ((!reg16) ?
                      $signed(reg13) : (~wire2))) : ($unsigned($signed(reg28)) ?
                  reg6[(4'h9):(2'h3)] : ($signed((8'ha2)) ?
                      $signed(reg17) : (wire29 != (8'hbc))))) ?
          $unsigned($signed(reg24)) : ($signed((-reg8[(3'h4):(3'h4)])) || reg8));
    end
  assign wire32 = (reg21 ?
                      {((-(reg13 ? reg22 : wire29)) ?
                              reg26[(4'he):(4'he)] : ((-reg15) + $signed(reg25))),
                          $unsigned((((8'haa) >>> reg18) ^~ (~reg30)))} : $unsigned(reg13));
  module33 #() modinst196 (.y(wire195), .clk(clk), .wire34(reg27), .wire36(reg18), .wire37(reg26), .wire35(reg20));
  assign wire197 = wire3[(2'h3):(1'h1)];
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire37;
  input wire signed [(5'h12):(1'h0)] wire36;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire194;
  wire signed [(2'h2):(1'h0)] wire193;
  wire signed [(4'hc):(1'h0)] wire177;
  wire [(5'h10):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire191;
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire177,
                 wire99,
                 wire98,
                 wire95,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire68,
                 wire39,
                 wire38,
                 wire191,
                 reg97,
                 reg96,
                 reg94,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire38 = $signed(wire36);
  assign wire39 = (((({wire35, (8'ha3)} ?
                              {wire34} : $unsigned(wire34)) | ((wire36 - wire35) * wire35[(1'h1):(1'h1)])) ?
                          $unsigned(wire38[(3'h5):(2'h2)]) : wire36[(4'he):(3'h7)]) ?
                      (wire36 ?
                          (((wire34 ? wire37 : wire35) ?
                                  (~|wire38) : $signed(wire36)) ?
                              $signed(wire37[(3'h7):(3'h7)]) : {(wire38 ?
                                      wire38 : wire34),
                                  $unsigned(wire35)}) : wire37) : $signed(((wire38 ?
                              $unsigned(wire34) : {wire38, wire36}) ?
                          wire34[(3'h5):(3'h5)] : $signed($signed((8'ha7))))));
  always
    @(posedge clk) begin
      reg40 <= $signed($unsigned(wire37[(1'h0):(1'h0)]));
      reg41 <= $unsigned(({wire34[(5'h10):(4'he)], $signed((reg40 - wire39))} ?
          reg40 : (8'haa)));
      if ({wire38[(2'h3):(1'h1)]})
        begin
          reg42 <= ((reg41 ?
              ((~&$unsigned(reg40)) <= reg40[(3'h6):(1'h0)]) : ((8'ha9) ?
                  $unsigned($signed(wire39)) : (~&(wire36 ?
                      reg41 : wire39)))) | wire36);
          reg43 <= wire36[(4'h8):(2'h2)];
          reg44 <= ((!$unsigned(wire37[(1'h0):(1'h0)])) ?
              ($unsigned($signed(wire34)) >>> (^~(|(~wire39)))) : $signed((wire39 ?
                  $unsigned((wire38 >>> (8'hac))) : $signed({wire34,
                      wire37}))));
        end
      else
        begin
          reg42 <= wire39;
          reg43 <= $signed(wire38);
          reg44 <= (reg44 ? reg41 : reg43[(3'h4):(2'h3)]);
          if (wire35[(1'h0):(1'h0)])
            begin
              reg45 <= ((reg43[(3'h6):(1'h1)] ?
                  $signed(((8'hae) ?
                      (&reg44) : (wire34 ?
                          reg42 : reg41))) : wire35) <= {(wire34[(4'hf):(4'h8)] ?
                      (~&(reg43 ? reg43 : reg43)) : (!$signed(reg42))),
                  (~^((^reg43) - wire37))});
            end
          else
            begin
              reg45 <= wire39[(1'h1):(1'h0)];
              reg46 <= {$unsigned(((wire35 < reg43) && $signed((-wire37)))),
                  reg45[(4'h8):(3'h4)]};
              reg47 <= (($unsigned($signed((8'hac))) > {wire37[(4'hc):(4'ha)],
                  (reg40 ^ (wire38 ^ wire36))}) | wire36[(4'h9):(1'h0)]);
              reg48 <= wire36;
            end
          reg49 <= reg47;
        end
    end
  always
    @(posedge clk) begin
      reg50 <= (8'h9f);
      if ($signed(((|$unsigned(wire39[(1'h0):(1'h0)])) ^ $signed($signed((reg42 ~^ reg45))))))
        begin
          reg51 <= reg47[(2'h2):(1'h1)];
          reg52 <= (8'ha1);
          reg53 <= $unsigned($unsigned(($unsigned(((7'h40) ? reg45 : wire38)) ?
              $signed(reg40) : reg41)));
          reg54 <= ($signed(wire35) ?
              ((((reg53 ?
                  wire39 : reg45) ^~ wire34[(4'he):(4'ha)]) ^ $signed($unsigned((8'hb7)))) < $signed((~reg42))) : reg40);
          reg55 <= (~|(reg51[(4'hc):(3'h6)] == (8'hb8)));
        end
      else
        begin
          reg51 <= $unsigned($signed((((!reg46) ? (reg52 ^ reg55) : wire35) ?
              wire37 : $signed($unsigned(reg47)))));
          reg52 <= $unsigned({{reg54, $unsigned($signed(reg54))}});
          if ((~reg53))
            begin
              reg53 <= (~(reg40[(2'h3):(2'h3)] ?
                  (-reg47) : ($unsigned((|wire36)) ?
                      (~|reg48[(1'h0):(1'h0)]) : reg40)));
              reg54 <= $unsigned((wire37 ~^ {({wire37} ?
                      wire37[(4'h9):(3'h4)] : (wire36 >> reg40))}));
              reg55 <= $signed((&(-(-reg54[(1'h1):(1'h1)]))));
              reg56 <= wire37[(3'h4):(2'h2)];
            end
          else
            begin
              reg53 <= {$unsigned($signed(($unsigned((8'ha3)) ?
                      $signed(reg50) : {reg51})))};
            end
        end
      if (reg42[(3'h5):(1'h0)])
        begin
          reg57 <= (reg55[(3'h5):(1'h0)] | $unsigned({wire34}));
          reg58 <= (-$signed((^~$unsigned(reg49[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg57 <= {reg41[(1'h0):(1'h0)]};
          if (reg56)
            begin
              reg58 <= ((|($unsigned(wire35[(3'h6):(1'h1)]) ?
                  reg56 : reg58[(2'h3):(2'h2)])) < (8'hb7));
              reg59 <= $unsigned((!$signed($signed(reg57[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg58 <= $signed((reg54 - ({(|(8'ha7)),
                  reg57[(4'h8):(3'h6)]} >> ({(8'hbd),
                  reg54} ^~ wire38[(3'h4):(2'h2)]))));
              reg59 <= wire34;
            end
          reg60 <= $unsigned({($unsigned((!wire39)) ?
                  (reg52 || $unsigned(reg41)) : reg46),
              (~(reg54[(2'h2):(1'h0)] + $signed(wire35)))});
          if ((~(~^reg60)))
            begin
              reg61 <= (~|reg45);
              reg62 <= reg53;
              reg63 <= ((8'haf) >>> reg52);
            end
          else
            begin
              reg61 <= $unsigned((~^((^~reg45[(3'h6):(3'h4)]) < ((reg42 <= reg55) ?
                  (^~reg52) : (reg62 >>> reg41)))));
              reg62 <= $unsigned(((!{$unsigned(reg41)}) ^~ reg49));
              reg63 <= (reg55[(1'h0):(1'h0)] - $unsigned((!wire34)));
              reg64 <= $unsigned((reg62[(3'h4):(2'h2)] ?
                  (({reg55, reg55} ? (reg43 - reg48) : $signed(wire34)) ?
                      $signed($signed(reg49)) : $signed(reg62)) : $unsigned(((wire36 ?
                      reg53 : wire39) ~^ reg58[(4'hd):(2'h3)]))));
            end
          if (wire39)
            begin
              reg65 <= reg43[(4'h9):(1'h0)];
              reg66 <= reg45;
              reg67 <= {$unsigned(wire34), {$unsigned((^$signed(reg40)))}};
            end
          else
            begin
              reg65 <= wire35;
              reg66 <= (reg51[(4'h8):(3'h7)] ?
                  {(~({(8'hb3), reg43} == $unsigned(reg41))),
                      (reg41 == (~&((8'ha5) && (8'hae))))} : reg46[(1'h1):(1'h0)]);
              reg67 <= (((((reg64 - reg45) && (+wire36)) & $unsigned((~|reg63))) << ($signed({reg59}) ?
                      (-$signed(reg59)) : reg67)) ?
                  {$unsigned(wire37[(3'h7):(3'h6)]),
                      (wire34[(3'h4):(3'h4)] ?
                          reg48 : ((reg55 >> (8'ha7)) ?
                              (wire35 < (8'hbc)) : (reg53 ?
                                  (8'h9d) : reg59)))} : (wire35[(3'h4):(2'h2)] > reg47[(1'h0):(1'h0)]));
            end
        end
    end
  assign wire68 = (~|{reg62});
  module69 #() modinst90 (.y(wire89), .wire71(wire38), .clk(clk), .wire70(reg67), .wire73(wire34), .wire72(reg48));
  assign wire91 = (($signed($unsigned(reg67)) - (($signed(reg54) >>> {reg57}) ?
                      $signed($signed(reg60)) : (~^{reg50,
                          reg52}))) != {$signed(reg46[(3'h4):(2'h3)]),
                      $unsigned(((reg53 ? reg62 : reg58) ?
                          (reg53 ? wire34 : reg61) : $unsigned((8'ha7))))});
  assign wire92 = $unsigned(((reg47[(2'h3):(2'h3)] - {(reg58 << reg43),
                          wire37}) ?
                      ($signed((reg58 ? reg46 : reg43)) ?
                          (reg54 ?
                              $unsigned(reg66) : {wire34}) : wire34[(4'hd):(2'h2)]) : $unsigned(reg64)));
  assign wire93 = (~^wire37[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg94 <= {($unsigned(((reg57 ~^ reg55) == {reg56})) ?
              ($unsigned($signed((8'hbc))) ?
                  wire38 : reg67[(4'ha):(3'h6)]) : reg52[(4'ha):(3'h4)])};
    end
  assign wire95 = {($unsigned($signed((~&reg47))) ^~ (7'h43)),
                      $signed($signed({reg47[(1'h1):(1'h0)]}))};
  always
    @(posedge clk) begin
      reg96 <= $unsigned(wire38);
      reg97 <= ((((8'h9c) <= (|(reg50 > (8'h9c)))) > $signed($signed($signed(reg61)))) ?
          ($unsigned(((+(8'h9c)) ? reg67[(3'h7):(1'h0)] : (wire34 < reg46))) ?
              $unsigned(($signed(reg43) ?
                  $signed(reg62) : (wire34 ?
                      wire68 : (8'ha4)))) : (~(!(reg58 == wire93)))) : reg45[(4'h8):(2'h2)]);
    end
  assign wire98 = wire68[(1'h0):(1'h0)];
  assign wire99 = $signed($unsigned((wire98[(3'h6):(3'h5)] <<< $signed((8'haf)))));
  module100 #() modinst178 (.wire103(reg94), .wire102(wire89), .y(wire177), .clk(clk), .wire104(reg53), .wire101(reg65));
  module179 #() modinst192 (.y(wire191), .wire183(wire98), .clk(clk), .wire181(reg64), .wire180(reg61), .wire182(reg49));
  assign wire193 = $signed((wire191[(3'h5):(2'h3)] ?
                       (^~$signed((reg52 + wire37))) : (reg64[(3'h7):(3'h6)] ^ reg47)));
  assign wire194 = $unsigned((!reg43[(3'h6):(2'h3)]));
endmodule

module module179  (y, clk, wire183, wire182, wire181, wire180);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire183;
  input wire [(4'hb):(1'h0)] wire182;
  input wire signed [(2'h3):(1'h0)] wire181;
  input wire [(3'h5):(1'h0)] wire180;
  wire [(3'h7):(1'h0)] wire190;
  wire [(5'h14):(1'h0)] wire189;
  wire signed [(4'hc):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire187;
  wire signed [(2'h3):(1'h0)] wire186;
  wire signed [(5'h14):(1'h0)] wire185;
  wire [(4'h8):(1'h0)] wire184;
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 (1'h0)};
  assign wire184 = wire183;
  assign wire185 = ($signed(wire183[(4'hf):(4'hd)]) ?
                       ($unsigned(({(8'ha9), wire181} ?
                           ((8'ha2) ^ wire182) : wire183)) != {$unsigned(wire182)}) : $unsigned($unsigned((8'h9f))));
  assign wire186 = ((($unsigned(wire185[(5'h14):(3'h7)]) ?
                       $signed(wire180) : ($signed(wire182) && wire185[(4'he):(4'he)])) ^ (wire180[(2'h2):(1'h0)] ?
                       ($signed(wire184) ?
                           (8'hb5) : {wire180,
                               (8'ha8)}) : wire183)) <<< wire182[(3'h5):(1'h1)]);
  assign wire187 = (~{$unsigned(({wire182, wire182} << (wire181 ?
                           wire181 : wire183))),
                       (($signed(wire180) * ((8'ha5) >> wire184)) > (~((8'ha4) >> wire183)))});
  assign wire188 = $signed(wire184);
  assign wire189 = wire187[(3'h4):(3'h4)];
  assign wire190 = ((wire186[(1'h0):(1'h0)] ^ (((wire181 && (8'hb1)) & wire182[(3'h7):(1'h0)]) <<< wire186[(2'h3):(2'h2)])) || $signed((($signed(wire189) ?
                       (^wire182) : $signed(wire182)) > wire180)));
endmodule

module module100
#(parameter param175 = ((({(+(8'ha9)), ((8'hbc) * (8'ha4))} ? (+(~&(7'h42))) : {{(8'ha6), (8'ha8)}, ((8'hab) ? (8'hbc) : (8'hbd))}) ? (((+(8'hba)) ~^ {(8'ha4)}) ? ((|(8'hbb)) ? ((7'h44) ? (7'h43) : (8'hb2)) : ((8'hbf) > (8'haa))) : (((8'hae) >> (7'h43)) >> ((8'hb9) && (8'hab)))) : (!(|(7'h43)))) >>> {((((8'hab) | (8'hac)) ? {(8'hae)} : (8'hb2)) + {((8'had) ? (8'ha6) : (8'ha5))}), (({(8'h9f)} ? ((8'hb9) ? (8'hbc) : (8'hbe)) : (!(8'hbe))) > ({(8'hb9)} ? (|(8'hae)) : ((8'hbe) ? (8'hbf) : (8'h9c))))}), 
parameter param176 = (~(8'hbc)))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h34a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire104;
  input wire signed [(4'hf):(1'h0)] wire103;
  input wire [(4'h8):(1'h0)] wire102;
  input wire signed [(4'h8):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire171;
  wire signed [(5'h13):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire167;
  wire [(3'h4):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(4'hb):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire125,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg170,
                 reg160,
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
                 reg124,
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
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire105 = (wire104[(4'hd):(2'h2)] ?
                       wire102[(2'h3):(1'h1)] : (((8'ha9) ?
                           $signed(wire102[(3'h6):(3'h4)]) : wire104[(4'hb):(4'hb)]) << (~&$unsigned(wire101[(3'h4):(1'h1)]))));
  assign wire106 = ($signed(($unsigned($signed(wire103)) < ((wire105 ?
                           (8'hb7) : wire103) != (~&wire104)))) ?
                       {$unsigned({$signed(wire105)})} : $unsigned($unsigned(wire101)));
  assign wire107 = {(((~&(wire104 - wire103)) ?
                           wire101[(3'h6):(2'h3)] : (~^(^~wire104))) < ($signed((wire102 ?
                           wire105 : wire103)) | {((8'hb1) ? wire103 : wire103),
                           {wire106, wire105}})),
                       (!(wire102 >> wire103))};
  assign wire108 = $unsigned((~$signed((wire106 ?
                       wire107 : (wire101 ? (8'ha7) : wire106)))));
  assign wire109 = $unsigned($signed($signed(((wire106 + wire101) * $unsigned((8'hbb))))));
  always
    @(posedge clk) begin
      if (wire109)
        begin
          reg110 <= $signed($unsigned($signed(wire103[(4'h9):(3'h6)])));
          if (((^(($unsigned(wire108) & $unsigned(wire103)) + ($signed(wire106) ^ (~wire107)))) << (-wire106)))
            begin
              reg111 <= (wire107 ^ wire106[(3'h5):(2'h2)]);
              reg112 <= (+(^~wire109[(1'h1):(1'h0)]));
              reg113 <= ({wire105[(3'h7):(1'h1)],
                      (((!reg110) >>> wire103[(3'h4):(1'h1)]) <= $unsigned((|wire101)))} ?
                  wire103 : (8'hac));
            end
          else
            begin
              reg111 <= (reg110[(4'hd):(2'h2)] ?
                  (&{$signed($signed(reg111))}) : ((|($unsigned(wire103) - (wire103 ?
                          reg110 : wire104))) ?
                      wire104[(3'h7):(2'h3)] : $unsigned(wire101)));
              reg112 <= wire104;
              reg113 <= wire105;
              reg114 <= wire104;
              reg115 <= $unsigned(($signed((8'h9d)) * wire105[(2'h2):(2'h2)]));
            end
          if (wire109)
            begin
              reg116 <= $signed((((+(wire103 ^ wire109)) >>> wire104[(3'h4):(2'h2)]) && (wire104 ?
                  ((reg112 * reg113) | reg114) : (|(8'hb7)))));
              reg117 <= wire102[(3'h6):(3'h5)];
              reg118 <= (8'ha6);
              reg119 <= $unsigned(reg116);
            end
          else
            begin
              reg116 <= reg118[(3'h4):(1'h1)];
              reg117 <= wire108[(3'h5):(1'h1)];
            end
          if ($unsigned(($unsigned((reg115 << (reg118 ?
              reg118 : reg113))) ^~ (($signed(wire106) ?
              wire101 : (~^reg116)) <= $signed($signed(reg118))))))
            begin
              reg120 <= {((~|(wire104 ? (+reg110) : (^~reg114))) ?
                      $signed($signed($unsigned(wire108))) : (~&(~|$signed(wire108)))),
                  $signed(wire101[(3'h5):(2'h2)])};
              reg121 <= reg117[(1'h1):(1'h0)];
              reg122 <= ((-reg116[(4'h8):(1'h1)]) ?
                  $unsigned((|reg110)) : wire105[(4'ha):(2'h2)]);
              reg123 <= $signed($signed($unsigned(reg112)));
              reg124 <= (+reg118);
            end
          else
            begin
              reg120 <= (((^($signed(wire105) ? (^~reg122) : {reg118})) ?
                      (&(^{(8'h9c), reg123})) : $signed(({reg118, reg122} ?
                          reg111 : reg124[(4'h8):(2'h3)]))) ?
                  $unsigned(wire101) : (~$unsigned((~^(reg110 | wire103)))));
              reg121 <= $unsigned((reg120 <= wire109[(4'hb):(2'h3)]));
              reg122 <= $signed((wire103 ?
                  {(~(wire104 ? reg113 : (8'ha3))),
                      $unsigned($signed(wire107))} : (~wire109[(4'hf):(4'hf)])));
              reg123 <= $signed(wire108);
              reg124 <= {$unsigned(reg117)};
            end
        end
      else
        begin
          if (({(^~((reg111 ? reg119 : reg124) ?
                  (~wire106) : (~reg112)))} + $signed($unsigned(reg114))))
            begin
              reg110 <= $signed(wire107);
              reg111 <= $signed($signed((!reg124)));
              reg112 <= $unsigned($signed((wire103 ^~ wire103[(4'hc):(3'h7)])));
              reg113 <= $unsigned(((wire106 ?
                  (~|$unsigned(wire108)) : ({wire108} ?
                      reg113[(2'h3):(1'h1)] : {wire108, (8'ha9)})) < ({(reg124 ?
                      reg120 : wire109),
                  $signed(reg112)} + $unsigned((~|reg113)))));
            end
          else
            begin
              reg110 <= (8'hb7);
              reg111 <= $signed(wire102[(3'h5):(3'h4)]);
            end
          reg114 <= reg124[(4'hb):(4'h8)];
          reg115 <= (+wire102);
          if ($signed($signed(($signed((8'hb9)) | $unsigned($unsigned(reg115))))))
            begin
              reg116 <= reg119;
            end
          else
            begin
              reg116 <= reg115;
              reg117 <= wire102;
              reg118 <= reg114[(1'h0):(1'h0)];
            end
        end
    end
  assign wire125 = $unsigned({$signed($unsigned(((8'hba) | (7'h41)))),
                       $signed((&{(8'ha0), (8'hab)}))});
  always
    @(posedge clk) begin
      if (((wire105 ? wire102[(3'h6):(3'h4)] : (~^(|$unsigned(reg111)))) ?
          reg120 : ((~|(reg116 * ((7'h43) < reg116))) ?
              (&((reg120 >>> reg117) >= $unsigned(reg124))) : reg120[(5'h11):(4'hf)])))
        begin
          reg126 <= $unsigned((reg119[(1'h0):(1'h0)] >= (-$signed(reg124))));
          reg127 <= ({($signed((^(8'ha8))) > {$signed(reg114)})} ?
              {(^$signed(wire107))} : ($signed({wire106[(4'h9):(1'h1)],
                      (!wire108)}) ?
                  $signed(({wire102,
                      reg126} | $signed(reg111))) : $signed($signed(reg111))));
          reg128 <= {$unsigned($unsigned(((reg120 ?
                  wire101 : reg116) < wire108[(5'h10):(3'h4)])))};
          reg129 <= (^~(~&{reg119}));
        end
      else
        begin
          reg126 <= ((-wire104) ?
              $unsigned({reg119[(3'h4):(2'h3)],
                  ($unsigned((8'ha6)) & {(8'hb3)})}) : (reg116[(3'h4):(1'h0)] && ({(reg122 ?
                          reg112 : wire104)} ?
                  ($signed(reg122) || (reg118 ?
                      reg126 : wire108)) : ($signed((7'h44)) ?
                      $unsigned(reg122) : wire109[(3'h7):(3'h4)]))));
          reg127 <= (((($unsigned(reg124) ?
                      (wire102 ?
                          reg117 : (8'hba)) : (+reg110)) && $unsigned(((8'hb7) ?
                      reg112 : (8'hae)))) ?
                  (|reg120) : $unsigned($signed($unsigned(reg124)))) ?
              $unsigned(($unsigned((-reg124)) ?
                  (reg128 <<< (~reg120)) : $unsigned($signed((8'hb1))))) : wire104);
          reg128 <= ((reg116 ?
              (~&{$unsigned(reg124)}) : {((reg119 ? wire102 : reg121) ?
                      (wire104 * wire105) : (reg120 ?
                          reg122 : reg118))}) >>> (!($unsigned(reg126) ?
              reg110[(4'hf):(2'h3)] : (-$unsigned(reg116)))));
          if ({($signed((^(wire125 <= reg129))) ?
                  $unsigned({$unsigned(reg119),
                      ((8'had) >= reg121)}) : $signed(reg117)),
              $signed((|reg128[(4'hb):(3'h4)]))})
            begin
              reg129 <= (reg118 ?
                  reg119 : ($signed((8'hb6)) <= {((reg128 ?
                          reg126 : reg121) >>> $unsigned(reg116))}));
              reg130 <= $unsigned({(8'hac), wire103});
            end
          else
            begin
              reg129 <= ({((8'hb5) ?
                          ($signed(wire108) < reg113[(1'h1):(1'h1)]) : {$signed((8'hbe)),
                              (^~wire108)}),
                      reg130} ?
                  ((($unsigned((8'hae)) < $unsigned(wire108)) ?
                          reg128 : reg117[(4'hf):(3'h7)]) ?
                      $unsigned($unsigned((wire104 << reg129))) : $signed($signed(reg129[(1'h1):(1'h0)]))) : reg123);
              reg130 <= reg127;
            end
        end
      reg131 <= $signed($signed((reg129 ^ $unsigned(reg113))));
      reg132 <= $signed(($unsigned(((|wire125) ^ $unsigned(wire104))) | $signed(reg111)));
      if (wire106[(2'h3):(1'h1)])
        begin
          reg133 <= reg113;
          if ($unsigned($signed(wire108[(4'h8):(2'h2)])))
            begin
              reg134 <= reg110;
              reg135 <= reg112[(1'h0):(1'h0)];
              reg136 <= $signed(reg118);
              reg137 <= reg134[(1'h0):(1'h0)];
            end
          else
            begin
              reg134 <= ((&($unsigned(reg136) & $unsigned((reg123 << (7'h42))))) ?
                  $signed((((&reg117) == $signed(wire101)) != (reg119[(3'h4):(1'h0)] ?
                      (reg114 == reg130) : reg130[(1'h0):(1'h0)]))) : (reg135[(2'h3):(1'h0)] ?
                      (~^reg137[(3'h5):(1'h0)]) : $signed($unsigned({(8'h9f)}))));
              reg135 <= wire102;
              reg136 <= reg128[(2'h3):(1'h0)];
              reg137 <= $unsigned(($signed(({reg137} ?
                      $unsigned(reg131) : reg115[(2'h3):(1'h1)])) ?
                  (&(8'had)) : ({$unsigned((8'ha8))} ?
                      ($signed(reg128) - reg133[(1'h0):(1'h0)]) : ((reg121 ?
                          reg122 : wire105) != (8'h9f)))));
            end
          if ({reg120})
            begin
              reg138 <= $signed((+(&($signed(reg116) ?
                  (wire106 ? wire109 : reg122) : $signed((8'hbe))))));
              reg139 <= (8'hbd);
              reg140 <= ($signed($signed(wire103)) ?
                  $signed(((+wire103) ?
                      reg130 : $signed(reg114))) : (wire105[(4'hc):(3'h5)] ?
                      ($unsigned((~^wire101)) & (^(reg132 ?
                          reg112 : wire107))) : (~$signed(wire109[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg138 <= {(({(reg110 > reg118),
                          (reg122 < reg136)} >>> ($signed(reg132) ^ ((8'hbc) ?
                          wire108 : wire125))) ?
                      wire106[(4'hc):(2'h2)] : (!reg123[(4'ha):(2'h2)]))};
              reg139 <= $unsigned(reg111[(2'h2):(1'h0)]);
              reg140 <= {((~(!((8'hae) >>> reg129))) ?
                      reg136 : (reg110[(2'h2):(2'h2)] & $unsigned({wire125}))),
                  ((~{$signed(reg131)}) ~^ {$unsigned((reg113 ?
                          wire107 : wire104))})};
            end
        end
      else
        begin
          reg133 <= (reg134[(4'h9):(1'h1)] && $signed(((~&wire104) >>> (reg134[(4'ha):(1'h0)] >>> (&reg120)))));
          reg134 <= (~&reg136);
        end
    end
  always
    @(posedge clk) begin
      reg141 <= reg118;
      if ((8'h9e))
        begin
          if ((8'hb3))
            begin
              reg142 <= reg122;
              reg143 <= (|$unsigned((&(((8'hb5) <= reg110) <= (^~(8'haa))))));
              reg144 <= ($unsigned(reg123[(4'h8):(4'h8)]) * (+reg135[(3'h5):(1'h0)]));
            end
          else
            begin
              reg142 <= {(|($signed((wire108 ? reg139 : reg136)) ?
                      ($signed(reg117) + reg133[(2'h2):(2'h2)]) : ((+reg112) ?
                          (reg135 << wire107) : $signed(wire108)))),
                  (8'ha3)};
              reg143 <= ($signed(reg124[(3'h7):(3'h6)]) ?
                  reg128 : $signed($signed((8'hbd))));
            end
          if ((~^($unsigned(reg119[(2'h3):(1'h0)]) ?
              reg134[(4'he):(4'hb)] : ({(reg121 ~^ wire109),
                      (wire102 ~^ reg142)} ?
                  {(~|reg122)} : ({reg140, reg120} <<< $signed(reg114))))))
            begin
              reg145 <= $unsigned($unsigned((!wire101)));
              reg146 <= ((8'hab) ?
                  $unsigned(((~(wire101 ? reg122 : (8'ha1))) ?
                      wire103[(4'hd):(1'h1)] : reg142[(3'h5):(2'h3)])) : wire101);
              reg147 <= $unsigned($signed((-(~(reg129 ? reg112 : reg123)))));
              reg148 <= ((^~(($unsigned((8'ha5)) ?
                      reg134[(4'hc):(1'h0)] : $unsigned(reg133)) <<< ((reg141 >>> (8'hbb)) ?
                      $signed(reg117) : (^~reg130)))) ?
                  ((~&reg145[(2'h2):(1'h0)]) ?
                      (7'h40) : reg119[(3'h4):(1'h1)]) : $unsigned((&($signed(wire105) ?
                      reg135[(3'h4):(3'h4)] : {reg138, reg139}))));
              reg149 <= (({($unsigned(reg129) && (^~wire109))} ?
                      reg135[(3'h6):(2'h2)] : reg137) ?
                  reg129[(4'ha):(4'h8)] : reg118[(3'h7):(2'h2)]);
            end
          else
            begin
              reg145 <= {(($signed((reg127 ? (8'ha3) : (8'ha5))) ?
                          ($signed(reg144) ?
                              (~|wire106) : (wire106 || reg128)) : reg131[(3'h7):(3'h6)]) ?
                      (~(~wire103[(4'hf):(4'hf)])) : reg110)};
              reg146 <= (^~reg120);
              reg147 <= ($unsigned(($signed({reg130, (8'hb3)}) ?
                      $unsigned((~wire103)) : ((reg110 == reg139) ?
                          (reg149 & (8'hb1)) : (reg131 ? (8'ha0) : reg138)))) ?
                  reg115 : reg131[(3'h7):(1'h0)]);
              reg148 <= $unsigned({$unsigned(((~(8'haa)) >= (^(8'hb2)))),
                  reg149[(2'h2):(1'h1)]});
            end
          if ((^$unsigned(reg137)))
            begin
              reg150 <= (~|wire103);
              reg151 <= $signed($signed($signed($unsigned((wire103 & (8'ha2))))));
              reg152 <= $signed(($unsigned(reg142[(1'h1):(1'h1)]) ?
                  ($signed(wire107[(4'h8):(1'h0)]) ?
                      ($signed(reg139) << $signed(reg121)) : (^~((8'ha8) & reg115))) : {reg128[(4'he):(4'h8)],
                      wire104}));
              reg153 <= $unsigned((!{reg148, $unsigned($signed((8'hac)))}));
              reg154 <= $signed((^~wire109));
            end
          else
            begin
              reg150 <= reg150;
            end
        end
      else
        begin
          reg142 <= (^~$signed((((reg142 >>> reg110) - (!wire107)) << $unsigned((~|reg139)))));
          reg143 <= (+{$unsigned({(reg115 ? reg149 : wire107),
                  reg150[(1'h1):(1'h0)]})});
          reg144 <= wire125[(2'h2):(1'h1)];
          reg145 <= reg124;
        end
      if (reg150)
        begin
          reg155 <= reg132[(1'h0):(1'h0)];
        end
      else
        begin
          reg155 <= $unsigned($unsigned(reg138[(4'hb):(4'h9)]));
          reg156 <= reg132[(1'h0):(1'h0)];
          reg157 <= reg152[(1'h0):(1'h0)];
          reg158 <= {reg134};
          reg159 <= $unsigned((reg118 || (~&$unsigned(((8'hbf) << (8'hb2))))));
        end
      reg160 <= $signed($unsigned({$signed({wire125, reg146}),
          $unsigned((reg136 >> reg112))}));
    end
  assign wire161 = $unsigned(((reg123[(1'h1):(1'h0)] ?
                           $unsigned((reg126 ?
                               reg116 : reg136)) : $signed((~^reg156))) ?
                       reg146[(3'h4):(3'h4)] : reg118));
  assign wire162 = reg114[(2'h3):(2'h2)];
  assign wire163 = $signed(reg158);
  assign wire164 = (~^((^~($signed(reg130) ?
                           $unsigned((8'ha9)) : $unsigned(reg134))) ?
                       ((^reg160[(2'h3):(2'h3)]) ?
                           ((reg124 ? reg146 : (8'haa)) ?
                               (&wire163) : ((8'had) ?
                                   reg138 : wire107)) : $signed((reg137 ?
                               reg158 : (8'hb3)))) : (&((reg132 ?
                           (8'hbe) : reg127) >>> wire161))));
  assign wire165 = $unsigned($unsigned($unsigned(reg156)));
  assign wire166 = (reg160[(1'h0):(1'h0)] > ((+$unsigned($unsigned((8'hbf)))) ^~ $signed(((8'hbe) ?
                       (|wire102) : reg147))));
  assign wire167 = (reg120[(5'h10):(1'h1)] ?
                       (($signed($unsigned(reg116)) ?
                               reg118[(4'hb):(2'h3)] : ({wire101} ?
                                   $unsigned((8'hb7)) : reg111)) ?
                           (reg122 <= $signed($signed(reg112))) : reg129) : (^(reg145 >>> reg127)));
  assign wire168 = ($signed(((reg153[(1'h1):(1'h1)] >= wire108[(4'hc):(3'h6)]) * reg110)) ?
                       $unsigned(reg152) : wire164);
  assign wire169 = wire103[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg170 <= ($signed(($signed(reg112[(5'h10):(4'hb)]) ?
          (!wire125) : reg146[(2'h3):(2'h2)])) * ($unsigned($unsigned((reg118 ?
              reg158 : (8'hb0)))) ?
          reg117[(5'h11):(5'h11)] : (|wire169[(3'h7):(1'h0)])));
    end
  assign wire171 = reg126[(5'h12):(3'h7)];
  assign wire172 = (|reg121);
  assign wire173 = ($signed(reg136[(1'h1):(1'h0)]) ?
                       $signed($signed($signed($signed(reg137)))) : reg130);
  assign wire174 = $signed(reg114);
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire signed [(3'h6):(1'h0)] wire72;
  input wire [(4'h8):(1'h0)] wire71;
  input wire [(4'hb):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire75,
                 wire74,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire74 = ($unsigned(wire72[(1'h1):(1'h0)]) ?
                      (wire72 <<< $unsigned({$signed((7'h43)),
                          wire70[(3'h7):(3'h6)]})) : wire71);
  assign wire75 = wire74;
  always
    @(posedge clk) begin
      reg76 <= $signed($signed(((~|$unsigned((8'ha9))) ?
          wire73[(1'h0):(1'h0)] : {(^wire71), ((8'ha6) >= wire74)})));
      reg77 <= (~^$signed(reg76[(2'h3):(2'h2)]));
      reg78 <= $unsigned($signed({$signed(wire71[(4'h8):(3'h6)]),
          reg77[(4'hc):(4'h8)]}));
      reg79 <= (wire74[(4'hc):(1'h1)] ?
          (^~(|((wire73 ?
              reg77 : reg76) & $signed(reg77)))) : wire75[(3'h5):(1'h1)]);
    end
  assign wire80 = $unsigned($signed($unsigned(wire72)));
  assign wire81 = {$signed(($unsigned($signed((8'hb5))) * $unsigned(((7'h40) != reg78)))),
                      $unsigned(reg77)};
  assign wire82 = (wire72 ?
                      (~wire71) : ({$unsigned($unsigned(wire72)),
                          wire80[(4'he):(4'h8)]} <<< (~&wire80[(5'h10):(2'h2)])));
  assign wire83 = reg76[(4'h8):(1'h1)];
  assign wire84 = ((($unsigned((~&wire81)) ?
                              ({wire83} ? $signed(wire73) : wire82) : (7'h42)) ?
                          (&$unsigned((~&wire74))) : (~^wire72[(3'h4):(1'h0)])) ?
                      wire72 : ((8'hbc) != $unsigned($signed($unsigned((8'ha2))))));
  assign wire85 = (~|$signed((wire75 == {((8'ha4) ? wire71 : wire71),
                      (8'ha9)})));
  assign wire86 = {(~|wire72)};
  assign wire87 = $signed((~|{{reg77[(1'h1):(1'h1)], $signed(wire85)}}));
  assign wire88 = wire70;
endmodule
