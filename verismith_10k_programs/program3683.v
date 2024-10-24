module top
#(parameter param241 = (8'h9f), 
parameter param242 = (!param241))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire240;
  wire signed [(4'hb):(1'h0)] wire239;
  wire signed [(3'h5):(1'h0)] wire225;
  wire signed [(4'ha):(1'h0)] wire224;
  wire [(4'hf):(1'h0)] wire223;
  wire [(3'h6):(1'h0)] wire222;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire220;
  reg [(3'h7):(1'h0)] reg238 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg237 = (1'h0);
  reg [(4'hc):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg235 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg234 = (1'h0);
  reg [(3'h4):(1'h0)] reg233 = (1'h0);
  reg [(2'h3):(1'h0)] reg232 = (1'h0);
  reg [(5'h12):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg230 = (1'h0);
  reg [(4'hf):(1'h0)] reg229 = (1'h0);
  reg [(2'h2):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg227 = (1'h0);
  reg [(5'h10):(1'h0)] reg226 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire4,
                 wire5,
                 wire26,
                 wire220,
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
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg27,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire1[(4'ha):(4'h8)] != {(^$unsigned((wire2 ?
                         wire2 : wire3)))});
  always
    @(posedge clk) begin
      if (((^(((&(7'h42)) ~^ $unsigned((8'ha4))) >= (wire5 ?
              $unsigned((8'ha5)) : (wire2 ? (8'h9d) : wire1)))) ?
          wire1[(5'h12):(4'ha)] : (($unsigned($unsigned(wire5)) ?
              $signed(wire3) : (+(wire4 >= wire2))) <= wire4[(5'h11):(4'hd)])))
        begin
          if ($unsigned($signed((wire2[(4'hb):(4'h9)] <= ((wire3 ?
              wire3 : wire4) != {wire3, wire1})))))
            begin
              reg6 <= ((wire5[(4'hd):(1'h1)] ?
                      wire2 : ((wire2 << wire5) ^ wire0)) ?
                  (~^wire4[(4'h8):(3'h5)]) : ({{$unsigned(wire0),
                          wire5}} <<< wire2[(1'h0):(1'h0)]));
              reg7 <= $unsigned($unsigned(wire5[(4'h9):(4'h8)]));
              reg8 <= (|$unsigned($unsigned({$unsigned((8'h9e))})));
              reg9 <= (($unsigned($signed({wire5, wire0})) ?
                      ((~$signed(wire0)) ?
                          $signed(reg6[(3'h4):(1'h1)]) : ((wire0 ?
                              wire4 : wire2) >>> reg6[(4'h8):(3'h5)])) : $signed((~((8'hb5) ?
                          (8'hb0) : wire3)))) ?
                  {wire2} : wire1[(2'h3):(1'h1)]);
              reg10 <= (wire1 < (~|{$signed((~^reg9))}));
            end
          else
            begin
              reg6 <= reg6[(4'h9):(3'h5)];
              reg7 <= {$unsigned({reg8[(3'h5):(1'h1)],
                      (((7'h44) ? (8'ha0) : wire5) ?
                          wire0[(3'h7):(3'h6)] : wire1[(5'h12):(3'h5)])}),
                  wire2[(3'h5):(2'h2)]};
              reg8 <= reg10;
              reg9 <= $signed($unsigned((((wire1 >>> (7'h41)) | $unsigned(wire2)) - (|(wire2 == wire0)))));
              reg10 <= (wire5 ? (7'h44) : wire1[(4'he):(4'h9)]);
            end
          reg11 <= (reg7 ?
              wire1[(2'h2):(2'h2)] : ($signed(((-wire4) < reg9)) << (!reg10[(3'h6):(1'h1)])));
          reg12 <= {reg6, $signed($signed(reg8[(2'h2):(2'h2)]))};
          reg13 <= wire4;
          reg14 <= (8'hb2);
        end
      else
        begin
          reg6 <= (reg6[(3'h6):(1'h1)] - (($unsigned(wire4) ?
                  (~wire2) : ((reg11 ? reg10 : reg14) != $signed(wire1))) ?
              ($unsigned((^reg9)) || $unsigned(reg7)) : $signed(wire2)));
          reg7 <= $unsigned((+(7'h42)));
        end
      reg15 <= {{(~&wire5[(3'h6):(2'h2)])}};
      reg16 <= wire1;
      if ($signed((((8'hb3) ^ {{reg10}, $signed(reg6)}) ?
          (wire0 ?
              reg6 : {reg13[(2'h3):(2'h3)],
                  (reg15 ? (8'hb5) : reg14)}) : (reg9[(2'h3):(2'h3)] ?
              ($signed(reg14) || $signed((8'haa))) : $signed((&reg16))))))
        begin
          if ($signed(reg9))
            begin
              reg17 <= wire5[(4'hc):(3'h7)];
              reg18 <= reg7[(1'h0):(1'h0)];
              reg19 <= $signed((^$unsigned($signed((|reg8)))));
              reg20 <= reg9[(1'h1):(1'h1)];
              reg21 <= reg11[(4'ha):(3'h7)];
            end
          else
            begin
              reg17 <= reg21;
            end
        end
      else
        begin
          if (reg12)
            begin
              reg17 <= (reg14[(2'h2):(1'h1)] ?
                  (($unsigned($signed(wire2)) ?
                      reg14 : ($unsigned(wire1) * $unsigned(reg21))) >> (reg7[(2'h3):(2'h2)] ?
                      wire0[(4'he):(4'hd)] : reg18[(3'h7):(3'h4)])) : reg18);
              reg18 <= {reg12,
                  (((~^(reg7 ? wire3 : reg9)) ?
                          $signed((&wire5)) : (-(|reg20))) ?
                      ($unsigned((8'ha3)) ?
                          reg13 : $unsigned($unsigned(reg15))) : (^{reg14[(1'h1):(1'h1)]}))};
              reg19 <= $unsigned((wire0[(3'h4):(1'h0)] ?
                  wire4[(3'h5):(3'h4)] : ($unsigned($signed(reg12)) & ((~|reg17) >> (reg10 || reg9)))));
              reg20 <= (reg16[(1'h0):(1'h0)] ?
                  ((^(reg8 ?
                      $unsigned(reg9) : reg7)) * reg16) : (($signed({reg19}) ?
                      (8'h9e) : (~|{reg9})) - wire2));
            end
          else
            begin
              reg17 <= (&(reg19[(2'h2):(1'h0)] ?
                  (~($signed(reg17) > wire0)) : $signed({(wire5 ?
                          wire4 : wire3),
                      $signed((8'hb3))})));
              reg18 <= wire5[(4'h8):(3'h5)];
            end
          reg21 <= reg11[(2'h2):(1'h0)];
          reg22 <= {wire3[(4'he):(1'h0)]};
        end
      if ((+reg6[(3'h5):(1'h0)]))
        begin
          reg23 <= $unsigned({reg10});
          reg24 <= $signed(reg10[(4'h9):(1'h1)]);
          reg25 <= (8'ha1);
        end
      else
        begin
          reg23 <= (~|((!wire5[(5'h10):(4'hf)]) <= $signed((~^reg16))));
        end
    end
  assign wire26 = (-reg11[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg27 <= wire2;
    end
  module28 #() modinst221 (wire220, clk, reg14, reg6, reg20, wire0);
  assign wire222 = $unsigned((reg7[(2'h3):(2'h3)] + (~^{reg18})));
  assign wire223 = {$unsigned(reg20[(4'he):(4'he)]),
                       {(~|$signed($unsigned(reg7))),
                           (&$unsigned($unsigned(wire5)))}};
  assign wire224 = (reg6 >>> ($signed(($signed((8'hb4)) ?
                       {reg19, reg7} : {(8'hba), reg22})) | {(((8'hb6) ?
                               reg9 : wire3) ?
                           reg8[(3'h5):(1'h1)] : wire0)}));
  assign wire225 = $signed((|(($unsigned(reg16) ?
                       $signed(reg24) : wire5[(4'hf):(4'hd)]) > reg27[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg226 <= {$unsigned($unsigned(wire4)), reg9};
      reg227 <= $signed((((|(+(8'hab))) ~^ reg17[(4'hd):(2'h3)]) ?
          {(reg27 ? wire223 : (~&reg12)), reg16} : (~^reg15)));
      if ($unsigned(wire4))
        begin
          reg228 <= reg12[(3'h4):(1'h0)];
        end
      else
        begin
          reg228 <= (+$signed($signed((!{wire4, wire223}))));
          reg229 <= reg27;
        end
      if ($unsigned((reg13[(2'h2):(1'h1)] ~^ wire222[(1'h0):(1'h0)])))
        begin
          reg230 <= $unsigned($unsigned(wire4[(2'h2):(1'h0)]));
          reg231 <= {(8'ha2), wire0[(1'h1):(1'h0)]};
          reg232 <= reg6;
        end
      else
        begin
          reg230 <= wire26[(2'h3):(2'h3)];
          reg231 <= (&{($unsigned({reg230,
                  reg27}) ^~ ((reg19 <= reg24) * ((8'h9c) ? reg9 : (8'hb4))))});
          if ((&{(&(reg228[(1'h1):(1'h0)] ^ {reg21, wire2}))}))
            begin
              reg232 <= {$unsigned(((8'h9e) >>> ((reg19 ?
                      wire1 : wire4) <<< (reg20 ? reg16 : reg9))))};
              reg233 <= $unsigned((|{reg226[(4'hc):(4'h8)],
                  ((reg14 ? reg231 : reg20) ?
                      $signed(reg11) : {(8'hac), reg231})}));
              reg234 <= $unsigned(($signed(reg20[(4'hb):(2'h2)]) >> reg232));
              reg235 <= (((!$signed({(8'ha2), (8'ha7)})) ?
                      (!(^~reg7)) : $unsigned(($unsigned(reg11) ?
                          (reg19 ? wire4 : (8'hba)) : (~reg18)))) ?
                  {wire4[(1'h0):(1'h0)]} : (~wire224));
            end
          else
            begin
              reg232 <= $signed($unsigned($unsigned((((8'hb2) ~^ (8'h9e)) ?
                  ((8'hbc) ? reg232 : reg235) : $unsigned(wire1)))));
              reg233 <= reg17;
              reg234 <= (!$signed(reg229[(4'he):(3'h4)]));
              reg235 <= $signed(reg24);
              reg236 <= (((reg8 - ((~|(8'ha2)) ^~ reg13)) * wire3[(4'hc):(2'h3)]) ?
                  ((+reg14[(3'h4):(2'h3)]) >= (reg22 ?
                      $signed(((8'h9e) - wire222)) : (-reg20))) : reg7);
            end
          reg237 <= (((($signed(reg19) ?
                  (-reg17) : $unsigned((8'h9f))) * wire224) && (reg227[(1'h0):(1'h0)] ?
                  ((reg228 ? (8'hb5) : reg24) ?
                      $signed(reg233) : (~^reg226)) : ((reg235 ?
                          reg27 : reg10) ?
                      $signed(reg9) : (reg18 ? reg231 : reg18)))) ?
              $unsigned(($unsigned(reg227) | $unsigned($unsigned(reg13)))) : reg232);
        end
      reg238 <= (~^reg236[(4'hc):(1'h0)]);
    end
  assign wire239 = reg20[(4'hb):(3'h4)];
  assign wire240 = (^((~&reg231) & ($unsigned($unsigned(wire4)) >> $unsigned((reg226 ?
                       reg7 : reg7)))));
endmodule

module module28
#(parameter param218 = (^((((~|(8'hab)) ? (^~(7'h42)) : (~&(8'haf))) - (((8'ha2) ? (8'hbd) : (8'hba)) <<< ((8'hbb) & (8'hac)))) ^ (-(~((8'hbf) <= (8'h9f)))))), 
parameter param219 = (~&param218))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire216;
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  assign y = {wire99,
                 wire66,
                 wire58,
                 wire57,
                 wire36,
                 wire35,
                 wire34,
                 wire101,
                 wire102,
                 wire103,
                 wire172,
                 wire174,
                 wire216,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 reg39,
                 reg38,
                 reg37,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= wire31[(2'h2):(2'h2)];
    end
  assign wire34 = wire30[(3'h4):(2'h2)];
  assign wire35 = $unsigned((8'ha8));
  assign wire36 = $unsigned((wire32[(5'h10):(2'h2)] ?
                      ((wire30 ?
                          {wire30,
                              wire35} : wire31[(2'h3):(1'h1)]) > {{wire32}}) : $signed($signed(wire32))));
  always
    @(posedge clk) begin
      reg37 <= reg33[(1'h1):(1'h0)];
      if ($signed((~^(^reg37[(4'hd):(1'h1)]))))
        begin
          reg38 <= (((wire31 ?
                  ($unsigned(wire32) ?
                      {wire29} : (wire34 ^~ reg37)) : {(^(8'hae))}) << $unsigned($signed((wire31 || reg33)))) ?
              (~&{(+wire29[(1'h1):(1'h1)])}) : (wire29 ?
                  reg37[(4'hf):(4'hd)] : wire30[(3'h4):(1'h0)]));
        end
      else
        begin
          reg38 <= wire36[(5'h14):(3'h7)];
          reg39 <= (&(({$signed(wire32)} ?
                  $unsigned(wire31) : {(wire34 ? wire34 : (8'hbe))}) ?
              (~&{(wire34 > (7'h44))}) : reg37));
          reg40 <= $signed((~$unsigned({(|(7'h44))})));
        end
      if ($unsigned((&(wire35 << ((wire29 | wire30) < $unsigned(wire30))))))
        begin
          reg41 <= $signed((reg33[(2'h3):(2'h2)] ^ (reg40[(4'hb):(3'h5)] ?
              wire35[(2'h3):(1'h0)] : {$unsigned(wire32), (wire36 != reg33)})));
          if ($unsigned(wire34))
            begin
              reg42 <= (reg41 && wire30);
              reg43 <= $signed(((((wire34 ?
                      wire34 : wire32) & (8'ha1)) << $unsigned(((8'ha2) ^~ wire36))) ?
                  $unsigned((&(wire32 < wire30))) : (($signed(reg33) & $signed((8'hbb))) != $unsigned($signed(reg33)))));
              reg44 <= ((~|reg43[(2'h3):(1'h1)]) >> $unsigned(reg42));
              reg45 <= (-{(&$signed((wire36 ? reg42 : wire34))),
                  ($signed((^~reg41)) ?
                      (((8'hb8) ?
                          reg41 : reg39) > (wire29 ^~ (8'ha0))) : $unsigned((reg39 ?
                          wire31 : reg42)))});
            end
          else
            begin
              reg42 <= (reg40[(3'h4):(1'h0)] && reg40[(5'h10):(5'h10)]);
              reg43 <= (&reg37[(4'hb):(2'h3)]);
              reg44 <= wire29;
            end
          reg46 <= wire34[(4'ha):(4'h8)];
        end
      else
        begin
          reg41 <= (8'hb3);
          reg42 <= {$unsigned(((^(reg46 ? (8'h9c) : reg46)) ?
                  $unsigned(reg44[(4'hd):(4'hb)]) : (~{reg37, reg46}))),
              wire29[(4'h8):(3'h4)]};
          if ((wire29[(4'h9):(4'h8)] ^ $unsigned(wire36)))
            begin
              reg43 <= (|(8'hba));
              reg44 <= wire30[(3'h4):(3'h4)];
              reg45 <= {($signed(((+(8'hac)) != (wire31 || reg43))) != reg40[(4'ha):(2'h2)])};
            end
          else
            begin
              reg43 <= (((reg38 >>> {reg37}) >> reg37[(3'h4):(3'h4)]) ?
                  (($unsigned((reg45 * reg44)) ?
                      ($unsigned(wire30) ?
                          $unsigned(wire36) : wire36[(1'h1):(1'h0)]) : $unsigned({reg37})) ~^ reg41) : (^reg39));
              reg44 <= (wire31[(2'h2):(2'h2)] ?
                  (reg38[(1'h0):(1'h0)] ^~ reg37) : (~(wire29 < $signed((&reg33)))));
              reg45 <= ($unsigned(($unsigned(wire36[(4'hb):(4'h9)]) << ({reg38,
                          reg40} ?
                      (wire32 ? reg33 : reg42) : {reg33, wire29}))) ?
                  ($unsigned(($signed((8'hb9)) ?
                      (wire32 == reg46) : (wire30 ?
                          wire30 : reg41))) ~^ reg39) : reg43[(2'h3):(2'h3)]);
            end
          if (wire34)
            begin
              reg46 <= wire34[(3'h7):(3'h6)];
              reg47 <= (reg33[(3'h4):(1'h1)] ?
                  (!$signed(reg42[(1'h1):(1'h1)])) : reg44[(4'hc):(2'h2)]);
              reg48 <= $unsigned($unsigned(((!$unsigned(reg33)) & {$signed(reg45),
                  (reg37 + reg41)})));
              reg49 <= ((wire34[(1'h1):(1'h0)] ?
                  (reg46[(2'h2):(1'h0)] ? reg45 : (8'hab)) : ((|(wire31 ?
                      reg46 : reg39)) >> (7'h41))) - $signed((-$signed((~wire29)))));
              reg50 <= $unsigned($unsigned(reg49[(1'h1):(1'h1)]));
            end
          else
            begin
              reg46 <= $unsigned($unsigned(reg37[(4'hf):(2'h2)]));
              reg47 <= {(^~$signed(reg37)),
                  (($signed((reg45 ? (8'ha3) : wire35)) ^~ ((~(8'hac)) ?
                      (wire36 ? wire29 : wire31) : (&wire35))) >> (8'haf))};
              reg48 <= reg44;
              reg49 <= $signed(({((wire35 | wire35) > (reg43 ?
                      (8'hbd) : reg37))} > {reg46[(1'h0):(1'h0)]}));
              reg50 <= (reg40[(1'h0):(1'h0)] >>> reg49);
            end
        end
    end
  always
    @(posedge clk) begin
      if ((wire32 ?
          reg45[(1'h0):(1'h0)] : (wire30 < (reg43 ?
              ((reg45 ?
                  reg37 : (8'hbf)) >>> wire32[(4'hb):(4'h8)]) : {wire30[(2'h3):(1'h1)]}))))
        begin
          reg51 <= $signed($signed(wire29));
          reg52 <= {$signed(reg33[(1'h0):(1'h0)]),
              ((reg40 ? reg42[(3'h5):(2'h2)] : (!{wire34})) - reg49)};
          reg53 <= (+$unsigned(reg46[(1'h1):(1'h0)]));
          reg54 <= ((|{$signed(reg44)}) <= $unsigned($unsigned(($signed(reg42) ?
              (wire29 ? wire31 : reg46) : wire31))));
        end
      else
        begin
          if (({(8'h9f)} ? (8'ha9) : {wire34[(4'h8):(1'h0)]}))
            begin
              reg51 <= $unsigned(((~{(~&wire36)}) <= $signed(reg37[(3'h7):(2'h2)])));
              reg52 <= reg50[(1'h1):(1'h0)];
            end
          else
            begin
              reg51 <= $signed((|$signed(reg48)));
              reg52 <= (wire36[(4'ha):(1'h0)] && ($unsigned(reg40) ?
                  (~$signed((^~(8'h9c)))) : $signed((|wire35))));
            end
          if (({(8'hb1), (!{{reg52, reg50}, $unsigned((8'h9f))})} ?
              reg45 : reg45[(2'h3):(1'h0)]))
            begin
              reg53 <= (reg47[(4'ha):(4'h8)] ?
                  wire36 : $unsigned($unsigned(((reg48 ?
                      reg43 : wire31) >>> (wire32 * reg42)))));
              reg54 <= reg49[(2'h2):(2'h2)];
              reg55 <= ((reg46[(2'h3):(1'h0)] ?
                      $signed(((reg46 || reg49) ?
                          ((8'hbf) || wire30) : reg48)) : reg41) ?
                  (reg49[(4'h9):(3'h6)] <<< reg47) : (~&reg50));
            end
          else
            begin
              reg53 <= $signed(reg33);
            end
          reg56 <= (!{{$signed($unsigned((8'hb4)))}, reg41[(3'h7):(3'h6)]});
        end
    end
  assign wire57 = ({$unsigned($signed(((7'h41) >= reg46))),
                      reg42[(2'h2):(1'h1)]} == $unsigned({wire32, reg38}));
  assign wire58 = (($unsigned((&(^~wire31))) && reg40[(4'hf):(4'hc)]) ?
                      $signed((~^(-(~reg45)))) : (wire57 ?
                          ({$signed(reg38),
                              $unsigned((8'ha6))} >> {(8'hbf)}) : {wire34}));
  always
    @(posedge clk) begin
      reg59 <= (~&wire31[(1'h1):(1'h1)]);
      if ((reg37[(2'h3):(1'h1)] ?
          ($signed(((reg46 ? wire35 : reg48) > reg37[(3'h6):(3'h6)])) ?
              (reg47 ?
                  ((reg42 ?
                      reg52 : reg37) && $signed(wire58)) : (&(wire32 >= reg42))) : ((((8'hac) ?
                      reg53 : reg55) & $unsigned((8'hb8))) ?
                  ((reg56 ?
                      reg37 : reg46) - $signed((8'ha1))) : ((+reg45) + $unsigned(reg41)))) : $unsigned(reg42[(3'h5):(2'h3)])))
        begin
          if ($unsigned(reg38[(2'h2):(1'h1)]))
            begin
              reg60 <= (+reg51[(4'ha):(3'h7)]);
              reg61 <= reg50;
              reg62 <= $unsigned($unsigned(reg42));
              reg63 <= reg52[(1'h0):(1'h0)];
            end
          else
            begin
              reg60 <= (reg51 + (+reg56[(2'h3):(2'h2)]));
              reg61 <= $signed($unsigned({wire32[(4'hd):(3'h5)]}));
              reg62 <= reg59;
              reg63 <= (reg47[(4'ha):(1'h1)] <= reg33[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg60 <= $signed(reg61);
        end
      reg64 <= ($signed(reg38[(1'h1):(1'h0)]) ?
          reg45[(1'h0):(1'h0)] : $signed(reg54));
      reg65 <= {$unsigned((8'hb4))};
    end
  assign wire66 = ($signed((($unsigned((8'hb7)) ?
                          (+reg51) : reg65[(4'ha):(3'h5)]) ?
                      $signed(reg53) : (~&$unsigned(reg43)))) < (8'hb0));
  module67 #() modinst100 (.y(wire99), .wire71(wire57), .wire72(wire34), .wire70(reg39), .clk(clk), .wire68(wire32), .wire69(reg37));
  assign wire101 = {reg46[(1'h1):(1'h1)]};
  assign wire102 = $unsigned(reg38[(1'h0):(1'h0)]);
  assign wire103 = reg55[(1'h1):(1'h1)];
  module104 #() modinst173 (.wire107(wire35), .wire105(wire66), .clk(clk), .y(wire172), .wire108(reg60), .wire106(reg64));
  assign wire174 = (-reg65);
  module175 #() modinst217 (wire216, clk, wire34, reg41, reg38, wire101, wire57);
endmodule

module module175
#(parameter param215 = ((((((8'ha7) ? (8'hbd) : (8'hbd)) && ((8'hb1) < (8'haf))) ? ({(8'ha7)} ~^ ((8'ha7) | (8'ha4))) : {((8'ha1) ? (8'hbc) : (8'hb8)), ((8'haa) << (8'h9f))}) ? ((((8'hb7) ? (8'ha8) : (8'h9c)) && ((8'ha9) >> (7'h41))) ? (((8'hbc) ? (8'hb9) : (7'h42)) ^ (!(8'ha8))) : (&{(8'h9f), (8'h9c)})) : (((8'hb2) ? (&(8'h9d)) : (&(8'had))) | ((^~(8'ha7)) ? (!(7'h44)) : {(8'h9d), (8'haf)}))) ? ((((&(8'h9e)) & ((7'h40) ? (8'hb9) : (8'hbe))) == (((8'ha0) ^~ (8'hb8)) ? ((8'ha8) || (8'hbb)) : (^(8'hb9)))) ? (8'haa) : ((~((8'hb0) > (8'haa))) * (^~((7'h44) ? (8'had) : (8'ha7))))) : (((|((8'ha4) ? (8'hb6) : (7'h43))) & (((8'ha2) | (8'hac)) != {(8'hba)})) ? (~&{((7'h43) ? (7'h43) : (8'hab))}) : {((~&(8'h9d)) ^~ ((8'hb2) ? (7'h44) : (8'ha6)))})))
(y, clk, wire180, wire179, wire178, wire177, wire176);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire180;
  input wire [(4'hf):(1'h0)] wire179;
  input wire [(5'h14):(1'h0)] wire178;
  input wire signed [(4'h9):(1'h0)] wire177;
  input wire [(4'hf):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire192;
  wire signed [(5'h15):(1'h0)] wire191;
  wire [(3'h7):(1'h0)] wire181;
  reg [(4'ha):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg213 = (1'h0);
  reg [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(3'h4):(1'h0)] reg211 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg208 = (1'h0);
  reg [(5'h14):(1'h0)] reg207 = (1'h0);
  reg [(4'h9):(1'h0)] reg206 = (1'h0);
  reg [(3'h7):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg201 = (1'h0);
  reg [(5'h15):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(5'h11):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg189 = (1'h0);
  reg [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(2'h3):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(4'hc):(1'h0)] reg182 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire181,
                 reg214,
                 reg213,
                 reg212,
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
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 (1'h0)};
  assign wire181 = $signed($unsigned(({(~|(8'hb3))} - (wire177 ?
                       $unsigned(wire178) : $signed(wire180)))));
  always
    @(posedge clk) begin
      if ($signed({wire176}))
        begin
          reg182 <= (8'hb9);
        end
      else
        begin
          reg182 <= {(+$signed(wire180)), wire179[(1'h0):(1'h0)]};
          if ((~&($signed((8'hb3)) ^~ wire180)))
            begin
              reg183 <= $signed($signed($signed({wire177[(4'h8):(3'h6)],
                  wire179[(3'h4):(3'h4)]})));
              reg184 <= $signed(wire176[(4'hf):(4'h9)]);
              reg185 <= $unsigned(({$unsigned($unsigned((7'h43)))} ?
                  wire179 : (wire177 ?
                      $signed($unsigned(wire176)) : (wire180[(1'h0):(1'h0)] ?
                          {wire176, reg182} : wire181[(1'h0):(1'h0)]))));
              reg186 <= $unsigned(wire181[(3'h7):(1'h0)]);
            end
          else
            begin
              reg183 <= wire176[(4'ha):(3'h5)];
              reg184 <= (((((8'ha8) ?
                              (wire176 ? (8'hb9) : reg186) : (reg184 ?
                                  reg183 : (7'h40))) ?
                          reg183 : $signed((wire181 ^ reg186))) ?
                      $signed($unsigned(wire179)) : (($signed(wire178) ?
                          (|(8'h9e)) : (wire178 >>> wire181)) < ($unsigned(wire177) >>> wire180[(2'h3):(2'h2)]))) ?
                  $unsigned(reg184[(5'h11):(4'hb)]) : (reg184[(4'hf):(3'h5)] ?
                      $unsigned((~&wire178[(3'h7):(3'h7)])) : reg186[(3'h5):(1'h1)]));
              reg185 <= (^~$signed({((!wire178) ?
                      (reg182 >> (8'hbd)) : wire181)}));
              reg186 <= reg186[(3'h4):(2'h2)];
              reg187 <= (~&$signed(($unsigned(reg183[(1'h0):(1'h0)]) ?
                  wire181[(3'h5):(1'h0)] : $unsigned({reg185}))));
            end
          reg188 <= $unsigned({$unsigned(((|wire180) ?
                  (reg186 ? (8'hab) : reg187) : (reg183 ? reg184 : wire179)))});
          if (((!$signed(((reg186 ? reg186 : wire176) ?
              $signed(reg183) : (^~reg183)))) != wire177[(1'h1):(1'h1)]))
            begin
              reg189 <= ((-(reg185[(4'hc):(2'h3)] ?
                      ((reg187 ?
                          wire181 : reg183) && $signed(reg185)) : {(wire181 ?
                              reg184 : wire180),
                          {wire179, (8'ha5)}})) ?
                  $unsigned((reg183 ~^ $unsigned((reg188 > wire180)))) : $unsigned(wire176[(4'h8):(3'h7)]));
            end
          else
            begin
              reg189 <= reg182;
            end
        end
      reg190 <= $unsigned((&reg185));
    end
  assign wire191 = $signed(reg187);
  assign wire192 = (|reg182);
  always
    @(posedge clk) begin
      if (reg189[(1'h0):(1'h0)])
        begin
          if ({(wire179 > reg190[(3'h4):(1'h1)]),
              $signed((|reg188[(2'h2):(1'h1)]))})
            begin
              reg193 <= $signed(wire179[(1'h1):(1'h0)]);
            end
          else
            begin
              reg193 <= wire178[(4'h8):(3'h5)];
              reg194 <= $unsigned(($signed(reg184[(4'h9):(1'h0)]) <= (wire192 << ($unsigned(reg189) ?
                  (~&reg190) : (wire177 ? wire179 : wire177)))));
            end
          reg195 <= $unsigned({((^~((8'hab) > wire178)) ?
                  $signed($unsigned(reg190)) : {((7'h41) < wire178),
                      (^(8'hbd))})});
          if (wire192[(3'h7):(3'h6)])
            begin
              reg196 <= $signed((wire191 ?
                  (^~{$unsigned(reg182),
                      reg195[(3'h5):(2'h3)]}) : (reg186[(1'h0):(1'h0)] ?
                      (8'hb1) : (((8'hac) ?
                          reg184 : wire180) << (~&wire180)))));
              reg197 <= $signed(wire192[(4'ha):(4'h8)]);
              reg198 <= (~^$unsigned((~reg188)));
              reg199 <= ((reg194[(4'hb):(1'h0)] >>> (reg190 ?
                  wire179 : wire192)) + $unsigned($signed(wire176[(4'hd):(4'ha)])));
            end
          else
            begin
              reg196 <= (8'hb2);
              reg197 <= reg182[(4'hc):(4'hb)];
              reg198 <= ((-reg193) <= ($signed((8'hb7)) || (+reg186)));
              reg199 <= reg193;
              reg200 <= {(reg197 ^ wire191),
                  (~&{(reg198[(2'h3):(1'h1)] ? $unsigned(reg189) : reg194),
                      (~reg190[(1'h0):(1'h0)])})};
            end
        end
      else
        begin
          reg193 <= $signed({(~^reg198[(2'h3):(2'h2)])});
          reg194 <= wire180;
          reg195 <= (8'ha1);
          reg196 <= (~^(reg200 ?
              {reg196[(4'h9):(4'h8)], reg183} : $unsigned($signed((reg187 ?
                  reg199 : reg197)))));
          reg197 <= (((8'had) ~^ $signed(((-reg199) ?
              (^~wire178) : (+reg185)))) > (^~wire180[(4'hd):(4'hc)]));
        end
      reg201 <= $signed(((($unsigned(reg185) ?
          reg185[(3'h6):(3'h6)] : (&reg197)) >>> (reg183 ?
          (reg198 ~^ wire181) : (!reg190))) || $unsigned($signed((8'h9e)))));
      reg202 <= reg198[(2'h3):(2'h2)];
      if ((wire191[(3'h5):(1'h0)] ?
          (^(&(reg183 ? reg188 : (!reg202)))) : (!wire179[(4'hb):(1'h0)])))
        begin
          reg203 <= $unsigned((reg188 ? wire191 : reg195[(1'h1):(1'h0)]));
          if ((reg190[(4'hb):(1'h0)] ? $signed(reg195[(4'he):(4'ha)]) : reg195))
            begin
              reg204 <= {($signed(wire177[(3'h5):(2'h3)]) ?
                      {(!(~&(8'h9f))), $unsigned((reg184 < reg203))} : reg200)};
              reg205 <= (-$unsigned((8'hbb)));
              reg206 <= $unsigned($signed($unsigned((|reg204[(3'h6):(2'h2)]))));
              reg207 <= (~^$unsigned(reg197[(1'h1):(1'h1)]));
              reg208 <= (wire181[(3'h6):(2'h2)] | $signed($unsigned((~|reg183))));
            end
          else
            begin
              reg204 <= ($unsigned((|(^(|wire181)))) ?
                  (~|{$signed(((8'h9d) ?
                          reg198 : reg198))}) : ({($unsigned((8'ha2)) & (reg183 - (7'h44))),
                          {(8'hb9), $unsigned(reg200)}} ?
                      reg200 : reg196[(4'hb):(3'h4)]));
              reg205 <= ($unsigned((7'h42)) != (($signed(reg200[(1'h0):(1'h0)]) >>> (^$unsigned((8'hb1)))) + (~^$unsigned((reg184 ?
                  reg194 : reg199)))));
              reg206 <= $signed(reg197);
              reg207 <= {reg187};
            end
          if ($signed(wire178[(4'h9):(2'h3)]))
            begin
              reg209 <= reg185[(1'h0):(1'h0)];
            end
          else
            begin
              reg209 <= (reg182[(1'h1):(1'h1)] ?
                  ((~((~reg194) && (~|reg204))) ?
                      reg206 : $unsigned(((reg190 ?
                          reg209 : (8'ha8)) <= (reg208 + reg190)))) : ((~(reg194[(4'hc):(4'ha)] ?
                      (reg186 ?
                          wire180 : wire180) : $unsigned(reg200))) >>> {wire177[(3'h5):(3'h5)],
                      (((7'h44) ? reg183 : reg207) ? wire176 : (8'hac))}));
              reg210 <= (|reg207[(4'hc):(1'h0)]);
              reg211 <= reg208;
              reg212 <= reg189[(1'h0):(1'h0)];
            end
          if ((($signed((8'hb0)) ?
                  reg182 : $unsigned({reg197[(2'h3):(2'h3)],
                      reg209[(4'h8):(1'h1)]})) ?
              reg194[(1'h1):(1'h0)] : $unsigned(reg201[(4'hb):(3'h4)])))
            begin
              reg213 <= reg198[(1'h1):(1'h1)];
              reg214 <= (&(^~$signed(($unsigned((8'hb0)) && ((8'haa) ?
                  reg198 : reg186)))));
            end
          else
            begin
              reg213 <= ((+reg195[(2'h2):(1'h1)]) * ((^~$signed({reg204})) <<< reg213));
              reg214 <= (reg210[(3'h4):(1'h1)] ?
                  (^~reg213[(3'h4):(2'h2)]) : reg183);
            end
        end
      else
        begin
          reg203 <= reg207;
          reg204 <= (reg209[(1'h1):(1'h1)] ? reg209 : reg210[(2'h3):(1'h1)]);
          reg205 <= $unsigned($unsigned({$unsigned($signed(wire177))}));
        end
    end
endmodule

module module104
#(parameter param171 = (~(7'h40)))
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h322):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire108;
  input wire [(5'h14):(1'h0)] wire107;
  input wire [(4'he):(1'h0)] wire106;
  input wire [(4'hd):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  wire signed [(5'h15):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire signed [(4'hf):(1'h0)] wire142;
  wire [(4'hf):(1'h0)] wire141;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire109;
  reg signed [(2'h2):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire148,
                 wire147,
                 wire146,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire109,
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
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg145,
                 reg144,
                 reg143,
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
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire109 = $signed((!wire108[(5'h12):(5'h11)]));
  always
    @(posedge clk) begin
      reg110 <= wire108;
      if (wire106[(3'h7):(3'h5)])
        begin
          reg111 <= reg110[(1'h0):(1'h0)];
          reg112 <= (!wire105[(3'h6):(3'h5)]);
          reg113 <= $signed({reg111[(2'h3):(2'h3)],
              (~&(((8'h9d) ? wire108 : reg110) >>> (reg112 ?
                  reg111 : wire106)))});
          reg114 <= reg110;
        end
      else
        begin
          reg111 <= ($signed((8'hb1)) - ((((wire108 ? wire108 : reg113) ?
              wire109 : $signed((8'hb0))) <= (~&$unsigned((8'ha7)))) * ((((7'h41) <= reg111) * $unsigned(reg110)) ?
              (^~(reg112 > reg113)) : $unsigned((~&reg110)))));
        end
      reg115 <= reg111[(4'hd):(4'hc)];
      reg116 <= {(($signed((+wire105)) ?
                  ($signed(wire108) ?
                      $unsigned(reg112) : $unsigned(reg110)) : {((7'h43) ?
                          reg113 : wire107),
                      {reg112}}) ?
              reg114[(3'h6):(3'h5)] : ((~|wire105) ?
                  $unsigned((-wire107)) : wire105[(3'h7):(3'h4)]))};
      reg117 <= $signed($signed(wire107[(4'ha):(4'h9)]));
    end
  always
    @(posedge clk) begin
      reg118 <= (~reg117[(1'h0):(1'h0)]);
      reg119 <= reg117;
      if ((^~(~|$unsigned((wire109[(4'h9):(3'h7)] && (^(8'hba)))))))
        begin
          if ($unsigned({(reg115 ?
                  (~&$signed(reg114)) : ((reg115 ? reg110 : reg110) ?
                      (reg115 ? reg117 : wire105) : reg114)),
              {$unsigned(wire107), wire106[(4'he):(4'ha)]}}))
            begin
              reg120 <= $unsigned(reg111[(4'h9):(3'h5)]);
              reg121 <= $unsigned(({{{wire107}, $unsigned(reg117)},
                  (-reg112[(4'ha):(4'ha)])} << (((reg118 ? reg116 : reg111) ?
                      ((7'h43) ? reg120 : reg110) : $unsigned((8'ha0))) ?
                  (^~$unsigned(reg111)) : (wire105[(4'hb):(3'h4)] <<< reg112))));
            end
          else
            begin
              reg120 <= (($unsigned($signed(reg112[(4'hb):(4'h8)])) >>> $unsigned((8'hac))) ?
                  reg119[(4'h9):(3'h5)] : reg114[(4'h9):(3'h4)]);
              reg121 <= wire109;
            end
          reg122 <= $unsigned(wire108[(4'hf):(1'h0)]);
          reg123 <= $signed(reg122[(4'h9):(3'h6)]);
          reg124 <= reg117[(3'h6):(1'h1)];
        end
      else
        begin
          reg120 <= ($signed({((reg124 ? reg120 : wire105) | $signed(reg121)),
              (wire108 ?
                  ((8'hae) ?
                      reg112 : reg121) : (wire108 - reg113))}) << $unsigned((&(reg117[(1'h0):(1'h0)] <<< reg113[(2'h3):(1'h0)]))));
        end
      reg125 <= (~^reg119[(3'h4):(2'h2)]);
      if ($unsigned({($unsigned($signed((8'ha2))) <= $signed(wire109))}))
        begin
          reg126 <= (wire109[(2'h3):(2'h2)] ?
              reg110 : $signed($unsigned((^~(8'h9e)))));
          reg127 <= ($signed((((-reg113) ? {reg119} : (+wire109)) ?
              ({reg121,
                  reg123} > $signed(reg125)) : $signed((reg114 * wire106)))) - reg111);
          if (wire106)
            begin
              reg128 <= ($unsigned((reg119 ?
                      (-wire107[(5'h13):(4'hd)]) : (!{reg119, reg124}))) ?
                  ((8'ha9) ?
                      (|({reg116} ?
                          ((8'hb2) - (8'ha4)) : (wire109 ^ reg119))) : {reg111,
                          $unsigned((reg127 ?
                              wire105 : reg117))}) : $signed((~((!(8'hbc)) ?
                      reg118 : reg116))));
            end
          else
            begin
              reg128 <= reg127[(4'h8):(1'h0)];
              reg129 <= ($unsigned($signed(((reg111 ? reg124 : reg111) ?
                  (+reg120) : reg119))) >= reg125[(2'h2):(1'h1)]);
              reg130 <= (7'h41);
              reg131 <= reg123[(5'h10):(4'ha)];
            end
          reg132 <= $unsigned($signed((^~wire106[(1'h1):(1'h0)])));
        end
      else
        begin
          if ($unsigned(($unsigned(reg118[(3'h4):(2'h3)]) ?
              wire106[(4'hd):(4'hb)] : ({(~&reg132), wire105[(1'h1):(1'h1)]} ?
                  (+$unsigned(reg127)) : reg128))))
            begin
              reg126 <= $unsigned({{(reg129 < {reg114, reg130}),
                      (~{wire109, reg123})},
                  (8'hb2)});
              reg127 <= $unsigned(($signed($unsigned({(8'ha8), reg116})) ?
                  ((8'ha8) - (reg120[(2'h3):(2'h3)] & $unsigned(wire105))) : reg131));
              reg128 <= (^~reg124[(4'h8):(2'h2)]);
            end
          else
            begin
              reg126 <= wire108;
              reg127 <= $signed((+$signed(reg131[(2'h2):(2'h2)])));
              reg128 <= ($signed($unsigned((&wire107))) >>> ((((reg121 <= wire107) >>> (reg121 <= (8'ha0))) >= ((-wire109) ?
                      wire107 : $unsigned(reg111))) ?
                  $unsigned($signed(wire108)) : (~|$unsigned($signed(reg125)))));
            end
        end
    end
  assign wire133 = $signed((reg123 ?
                       reg114 : ($signed((reg114 ? (8'hb4) : reg114)) ?
                           $unsigned({reg126}) : ((8'hb4) >> reg125))));
  assign wire134 = (((((~|reg122) ? $signed((8'ha1)) : reg121) ?
                           reg123 : ((!(8'h9c)) ?
                               reg126 : (reg117 ? wire133 : reg124))) ?
                       $signed(((reg117 ?
                           reg121 : reg132) == wire106[(2'h2):(2'h2)])) : ($signed((+reg125)) >>> (^~reg121))) >= $unsigned($unsigned((+(reg125 ?
                       reg122 : reg128)))));
  assign wire135 = (|$signed($signed($signed($signed(wire108)))));
  assign wire136 = $signed((~|$signed($unsigned((8'ha1)))));
  assign wire137 = $signed(reg118[(2'h2):(1'h1)]);
  assign wire138 = (^$unsigned((^~wire107)));
  assign wire139 = (^$unsigned(((reg127[(3'h6):(1'h1)] | (&(8'had))) != $unsigned($signed(wire136)))));
  assign wire140 = $unsigned($unsigned(reg112[(3'h7):(3'h7)]));
  assign wire141 = wire105[(3'h6):(3'h4)];
  assign wire142 = reg114;
  always
    @(posedge clk) begin
      reg143 <= ((((8'hac) << ({reg128, reg111} ?
          reg130[(3'h6):(1'h0)] : (wire109 | reg130))) ^~ $unsigned((wire108 * (reg118 + wire138)))) > (wire107[(5'h14):(3'h5)] ?
          (reg116 ?
              (^~$unsigned(reg131)) : $unsigned((reg111 ?
                  wire140 : wire107))) : (($signed(wire134) > (reg115 ?
                  reg120 : wire135)) ?
              $unsigned((wire135 ?
                  reg132 : wire142)) : (-wire136[(3'h4):(1'h1)]))));
      reg144 <= ((~&{wire107}) << (~((wire142 ~^ $unsigned((8'hac))) ?
          wire133[(4'hb):(4'h9)] : $signed(reg114[(3'h7):(1'h1)]))));
      reg145 <= (&($signed((!reg127)) && ($signed(reg110) ?
          ((~&reg131) > (&wire138)) : $unsigned($unsigned(wire141)))));
    end
  assign wire146 = reg117[(1'h0):(1'h0)];
  assign wire147 = reg113[(4'hb):(4'ha)];
  assign wire148 = ((wire133[(4'hc):(4'h8)] ?
                       wire106[(3'h5):(3'h5)] : $signed(($unsigned(reg110) >> $signed(wire134)))) >>> reg110);
  always
    @(posedge clk) begin
      reg149 <= reg143;
      reg150 <= $unsigned((^~reg145[(2'h2):(1'h1)]));
      if (((!$unsigned(wire147[(1'h0):(1'h0)])) != (wire146 ?
          (~(~$unsigned((8'hae)))) : (8'ha5))))
        begin
          reg151 <= $signed(((((!reg110) ? reg115 : wire109) ?
              wire137 : {(~^reg128)}) | ({wire108,
              (reg111 > wire146)} | reg110[(2'h3):(2'h2)])));
          reg152 <= (!$unsigned($signed(reg130)));
          reg153 <= reg118[(4'hc):(4'hc)];
          reg154 <= $unsigned($unsigned($signed(((7'h41) <<< (reg124 + wire136)))));
          reg155 <= ($unsigned($signed(((wire133 + reg120) >>> (-reg117)))) | (reg114 >= $unsigned((7'h41))));
        end
      else
        begin
          reg151 <= (reg123 ^ ((8'ha9) ?
              (^~{$signed(wire109),
                  (wire142 ? reg149 : reg154)}) : $unsigned((|{reg110,
                  wire142}))));
          reg152 <= $unsigned($unsigned(($unsigned(reg118) ?
              $signed(reg113) : (~|reg110))));
        end
      reg156 <= {($signed($unsigned((&wire107))) ?
              $signed((wire147 ^ $unsigned(wire109))) : (reg150 ?
                  (!wire107[(4'h9):(4'h9)]) : reg127)),
          $signed($unsigned((^~$unsigned(reg110))))};
    end
  assign wire157 = $unsigned({{{(wire146 ? wire140 : reg156), $signed(reg121)},
                           (wire107[(5'h10):(4'ha)] ?
                               $signed(reg115) : (~|wire107))},
                       (8'hbc)});
  assign wire158 = ((|$unsigned((^~(~|(8'hbb))))) ?
                       wire141[(4'hb):(2'h3)] : wire105[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      if ((reg121[(5'h11):(2'h3)] ?
          reg129 : (&(($unsigned(wire136) ?
              (~wire135) : (wire136 <= reg113)) && $unsigned($signed(reg125))))))
        begin
          reg159 <= (((~|((+(7'h40)) ? (&(8'ha2)) : (^reg143))) > reg124) ?
              wire136 : (^~(^wire142)));
          reg160 <= $unsigned((!(reg130 ?
              $unsigned($unsigned(reg145)) : $signed($signed(reg151)))));
          reg161 <= reg160[(2'h2):(1'h1)];
        end
      else
        begin
          reg159 <= wire158;
          if (reg122[(4'ha):(4'h8)])
            begin
              reg160 <= (&((reg126[(4'ha):(3'h7)] != $signed({reg127,
                      reg161})) ?
                  {reg125} : (~|$signed(reg129[(3'h4):(1'h0)]))));
              reg161 <= (+$signed(wire147));
            end
          else
            begin
              reg160 <= (((reg131[(1'h1):(1'h0)] <<< ({reg159, reg155} ?
                  {reg112,
                      reg145} : (wire107 + (8'hbb)))) < wire146[(1'h1):(1'h1)]) < $signed((-((wire105 ?
                  (8'ha2) : wire136) & $signed((8'had))))));
            end
          if (($unsigned((+(~&$signed(reg152)))) >>> $signed({((reg156 ?
                      reg159 : reg156) ?
                  (-(8'h9d)) : wire141)})))
            begin
              reg162 <= $unsigned((($signed((reg156 > reg117)) ?
                  reg119[(4'hc):(2'h2)] : $unsigned(wire137[(4'ha):(1'h1)])) * ($unsigned($signed(reg130)) ?
                  {(|wire105), $unsigned(reg159)} : ((wire107 ?
                          (7'h43) : reg116) ?
                      (-(8'hac)) : {reg111, (8'hbb)}))));
              reg163 <= $unsigned({$signed({(reg156 == (8'ha0)),
                      reg129[(3'h4):(3'h4)]})});
              reg164 <= {{reg143[(4'hb):(2'h2)],
                      (|($unsigned(wire147) | (reg115 ^ reg121)))}};
              reg165 <= (|($unsigned({(~^(8'ha0))}) >> (($unsigned(reg116) - $unsigned(reg160)) ?
                  {$signed((8'hbd))} : $signed($signed(reg115)))));
              reg166 <= ($unsigned(wire108[(5'h10):(2'h3)]) != wire147);
            end
          else
            begin
              reg162 <= wire142[(4'hf):(1'h1)];
              reg163 <= ((reg123 <= wire148) ^~ reg120);
              reg164 <= $unsigned((+((8'ha0) ^~ reg115)));
              reg165 <= $signed($unsigned(reg166[(3'h5):(3'h4)]));
            end
        end
      if ($signed(wire134[(2'h3):(2'h3)]))
        begin
          if (wire148[(4'hc):(3'h6)])
            begin
              reg167 <= reg124;
              reg168 <= {(wire135[(1'h0):(1'h0)] ?
                      (~reg120[(3'h5):(1'h1)]) : ($unsigned(reg143[(4'ha):(4'h9)]) >> reg159))};
              reg169 <= (^~((^{(^~reg122), reg116[(4'h9):(1'h1)]}) ?
                  (wire107 ?
                      wire146[(1'h0):(1'h0)] : ({reg122} ?
                          wire139 : wire134[(3'h6):(1'h1)])) : $unsigned((&(~reg126)))));
            end
          else
            begin
              reg167 <= $signed((^$signed((~(~^reg126)))));
              reg168 <= ((8'hbc) ?
                  $signed(reg122[(1'h0):(1'h0)]) : wire136[(4'hb):(2'h3)]);
              reg169 <= {((8'hb8) ?
                      ({$signed(wire135)} - ($signed(reg154) ?
                          {wire109} : $unsigned(reg113))) : ((&$signed(reg124)) ?
                          {reg132,
                              reg169[(4'ha):(3'h6)]} : ($unsigned((8'ha3)) ?
                              (wire158 - (8'hbd)) : (+reg112)))),
                  ($signed((reg112[(2'h2):(1'h1)] ^~ (reg150 ?
                          (8'hac) : reg160))) ?
                      reg144[(3'h5):(3'h4)] : (|((reg117 ? reg145 : reg116) ?
                          (wire106 - wire107) : {wire134})))};
              reg170 <= reg118[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg167 <= $signed((reg132 ?
              ($signed(reg168[(5'h10):(4'h8)]) ?
                  {(-reg111)} : {wire157[(2'h2):(1'h1)],
                      $unsigned((8'hbd))}) : $signed((wire146[(3'h6):(3'h6)] - $unsigned(reg118)))));
        end
    end
endmodule

module module67
#(parameter param97 = (((((&(8'had)) || (-(7'h40))) ? (((8'hb2) || (8'haa)) ^ ((8'hb3) ? (7'h43) : (7'h40))) : {(!(8'hb6)), (+(8'ha2))}) ? ((~|((8'hb4) ? (8'had) : (8'ha2))) ? (-((7'h44) - (8'h9f))) : (((8'ha9) ? (8'hbc) : (7'h41)) ? ((8'ha9) ? (7'h42) : (8'hb0)) : ((8'hb6) == (8'hb9)))) : (((!(8'hac)) < ((7'h42) ? (8'h9f) : (8'haa))) << ({(8'ha6)} - ((8'hb6) || (8'ha3))))) ? {{((+(8'hb5)) || ((8'ha8) + (8'haa))), (((8'ha3) ? (8'hb8) : (8'ha3)) ? (8'ha9) : (~^(8'hba)))}, ({((8'ha4) ? (8'hbb) : (7'h43))} >> ((~(8'h9c)) ^ ((8'hb7) >> (8'hb7))))} : (((!((8'haa) ? (7'h41) : (8'hbc))) ~^ (!{(8'hbd)})) <<< ((~(^(8'ha6))) ? (((8'ha1) ? (8'ha6) : (8'hb9)) + ((8'hbd) <= (7'h44))) : (^~{(8'hb9)})))), 
parameter param98 = ((~|{((param97 ? param97 : param97) ? {(8'hbb)} : param97)}) ? (~(|param97)) : ((~(~(param97 || param97))) ? param97 : param97)))
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire72;
  input wire [(2'h2):(1'h0)] wire71;
  input wire [(3'h6):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  assign y = {wire96,
                 wire74,
                 wire73,
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
                 (1'h0)};
  assign wire73 = $signed($unsigned(($signed(((8'ha8) & (8'hbc))) ?
                      {(wire72 ? wire70 : wire69)} : {{(8'hb6)},
                          $unsigned(wire71)})));
  assign wire74 = (~|((^(wire70 ?
                      wire72[(4'hb):(4'ha)] : $signed(wire70))) && wire69[(4'h9):(3'h4)]));
  always
    @(posedge clk) begin
      reg75 <= $unsigned($signed({(~$unsigned(wire72))}));
    end
  always
    @(posedge clk) begin
      if ($unsigned({$unsigned($signed(wire70)),
          (wire68[(1'h1):(1'h0)] ?
              (~&(~&reg75)) : ($unsigned(wire70) ?
                  {(8'hba)} : $signed(wire74)))}))
        begin
          if ((~&(7'h43)))
            begin
              reg76 <= $signed($unsigned((~{$unsigned(reg75), {wire71}})));
              reg77 <= (8'hb0);
              reg78 <= (|(-wire69[(4'hf):(2'h3)]));
              reg79 <= $unsigned(((&((reg77 ? wire69 : wire68) ?
                      (wire71 ^~ (8'hbe)) : (wire69 >= wire74))) ?
                  ({(wire74 ?
                          reg77 : reg76)} < $signed(wire74)) : {wire72[(3'h5):(2'h2)],
                      $signed((wire70 ? wire74 : wire68))}));
            end
          else
            begin
              reg76 <= reg75[(1'h0):(1'h0)];
              reg77 <= {($unsigned((!(wire68 ? wire70 : wire74))) ?
                      reg79 : (((^~(8'had)) << $unsigned((8'haa))) ^~ (wire69[(2'h2):(1'h1)] ~^ wire68[(1'h0):(1'h0)]))),
                  wire70[(3'h5):(2'h3)]};
              reg78 <= (wire68[(2'h2):(1'h1)] & $unsigned(($unsigned($unsigned((8'hb3))) >> wire69[(3'h5):(3'h5)])));
            end
          reg80 <= $signed((~^$signed(wire69[(5'h10):(4'hd)])));
        end
      else
        begin
          reg76 <= ($signed(($signed((~|wire72)) ^ $signed($signed(wire71)))) ?
              (8'h9d) : $unsigned($signed($signed(wire73))));
          reg77 <= ($unsigned({(|(wire71 != wire73)), reg78[(1'h0):(1'h0)]}) ?
              $signed(wire70[(3'h6):(1'h1)]) : (reg76[(4'h9):(1'h0)] ?
                  (8'h9c) : reg79));
          reg78 <= (^~$signed(wire71));
          reg79 <= wire72;
          reg80 <= {(~&($signed(wire68) ?
                  ((reg76 ? reg78 : wire73) == $unsigned((8'had))) : (~^(reg76 ?
                      wire68 : reg75)))),
              wire74};
        end
      if (reg76[(4'hc):(3'h7)])
        begin
          reg81 <= $unsigned(({(&(~&wire74)), ((8'haa) ~^ {reg79})} ?
              reg75 : $signed($signed({wire69}))));
        end
      else
        begin
          reg81 <= (&(({$signed(reg77),
              $unsigned((8'hb3))} <<< {wire72[(5'h11):(4'he)],
              (wire68 + wire70)}) ^~ reg76));
          reg82 <= wire68;
          reg83 <= $unsigned($unsigned($signed((~&(reg75 ~^ wire68)))));
          reg84 <= {reg79[(3'h5):(1'h1)]};
          reg85 <= (reg80 ? wire70[(1'h0):(1'h0)] : reg80[(3'h5):(2'h3)]);
        end
      if ($unsigned(($signed(reg85) >> (&($unsigned(reg82) ?
          (~|wire74) : ((8'hbf) - (8'h9f)))))))
        begin
          if (((reg80 ?
              $signed(reg76) : (-(-wire74[(3'h4):(1'h0)]))) <<< ((8'hb0) - $signed($unsigned(reg80)))))
            begin
              reg86 <= ((+$unsigned(wire69)) >>> (($signed((7'h40)) >>> $signed($unsigned(reg82))) ?
                  (~^$unsigned((wire70 ?
                      reg84 : wire69))) : ($signed((wire73 | (8'hb7))) < reg75[(1'h0):(1'h0)])));
            end
          else
            begin
              reg86 <= $unsigned(wire70[(3'h5):(1'h1)]);
              reg87 <= reg86[(3'h6):(1'h0)];
              reg88 <= (&$signed($signed(reg85[(2'h3):(2'h2)])));
              reg89 <= wire70;
            end
          if ($unsigned(($signed($unsigned((^(8'haf)))) != $signed((~&{wire73,
              (8'hbb)})))))
            begin
              reg90 <= reg84;
              reg91 <= $signed((reg86 ?
                  $signed(((reg81 ^ (8'hac)) ?
                      ((8'ha3) ?
                          (8'hb2) : wire72) : wire73[(3'h5):(2'h2)])) : {reg78,
                      wire70}));
              reg92 <= reg87;
              reg93 <= (wire68 ?
                  ((^{$unsigned(reg88)}) >= (((reg87 ?
                          (8'ha2) : reg83) >>> wire71) ?
                      reg76 : ((wire73 || reg78) ? (-reg79) : reg76))) : reg80);
              reg94 <= ((8'hb9) ? wire69[(4'hd):(3'h7)] : (~^(8'ha8)));
            end
          else
            begin
              reg90 <= (((wire71 << (8'h9e)) ?
                      ($signed((reg77 ? wire74 : reg80)) ?
                          wire70 : (^reg91[(4'hf):(2'h3)])) : ($signed($unsigned(reg79)) ?
                          $unsigned(reg78) : ((reg88 >>> wire70) + wire69[(4'hb):(4'ha)]))) ?
                  ($unsigned({(-wire70)}) ^~ $unsigned(((wire74 ?
                          wire69 : (7'h44)) ?
                      (~|wire70) : (!wire71)))) : $signed(({$signed(reg93)} ?
                      reg93 : $signed({reg88}))));
              reg91 <= (^~wire69);
              reg92 <= $signed((wire73[(5'h10):(4'h9)] ^~ reg85));
              reg93 <= ((((-{reg75, wire73}) & reg80) ?
                  reg87 : wire71) >> (&$unsigned($signed({reg85, wire73}))));
              reg94 <= (({$signed(reg90),
                  wire74[(1'h1):(1'h1)]} >> reg84) << reg75[(1'h1):(1'h1)]);
            end
          reg95 <= $unsigned({$unsigned((wire68 ?
                  $signed((8'hb5)) : $signed(reg89))),
              $unsigned($signed({wire68}))});
        end
      else
        begin
          reg86 <= {wire68};
          reg87 <= ((reg95[(4'hc):(1'h1)] ?
              $signed({reg82}) : ((wire74[(3'h4):(1'h0)] < $unsigned(reg89)) ~^ wire68[(3'h4):(1'h0)])) >> wire68);
        end
    end
  assign wire96 = ($signed(reg79[(1'h0):(1'h0)]) >>> $signed(((reg86 ?
                          $signed(reg85) : (+reg90)) ?
                      ($unsigned(wire68) ^ $signed(reg93)) : reg80[(4'hf):(2'h3)])));
endmodule
