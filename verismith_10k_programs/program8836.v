module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire33,
                 wire32,
                 wire31,
                 wire16,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg36,
                 reg35,
                 reg34,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned($signed({($signed(wire1) ?
                         (wire0 <= wire1) : ((8'hbf) <= wire3))}));
  assign wire5 = ((~^(~^(^~(8'hbd)))) ?
                     $unsigned(wire4[(2'h2):(1'h1)]) : wire2[(4'he):(3'h4)]);
  assign wire6 = ((($signed((~wire3)) ?
                     wire3[(2'h3):(1'h0)] : wire4[(3'h4):(1'h1)]) | (8'hac)) + wire0);
  assign wire7 = (+(~^(8'ha3)));
  always
    @(posedge clk) begin
      if (wire6[(5'h13):(3'h4)])
        begin
          reg8 <= $signed(wire3);
          reg9 <= (($unsigned((wire1[(3'h4):(1'h1)] ?
              wire4[(4'hb):(4'ha)] : (~wire0))) | wire1) & (wire7[(1'h0):(1'h0)] < ((|(~wire0)) ?
              wire2[(2'h3):(2'h3)] : wire7)));
        end
      else
        begin
          reg8 <= wire4;
          reg9 <= $signed((~&$signed(wire3)));
          reg10 <= ((~|({(wire4 | (8'h9f))} ?
                  ((|wire1) ? $unsigned(wire5) : (|(8'hbf))) : ((reg9 ?
                      wire1 : wire3) >>> (reg9 > (8'ha7))))) ?
              ({(-wire4),
                  ((wire7 ^~ (8'hb0)) ^~ (wire2 < wire4))} | $signed($unsigned($signed(wire5)))) : $unsigned($signed($signed((~&wire6)))));
          reg11 <= (~&(8'h9c));
          if (wire3)
            begin
              reg12 <= (^~$unsigned(reg11[(1'h1):(1'h1)]));
              reg13 <= {(~reg10[(3'h5):(2'h2)]),
                  (~|$unsigned(reg10[(3'h5):(2'h2)]))};
              reg14 <= reg8[(3'h6):(3'h5)];
            end
          else
            begin
              reg12 <= ((|reg14) | wire7);
            end
        end
      reg15 <= ($signed(((reg14 >>> (&reg10)) ?
              (((8'hb8) >> wire1) ^~ $signed(wire5)) : ((reg13 ?
                      reg10 : wire2) ?
                  $signed(wire6) : wire6))) ?
          (reg12 ?
              $signed(wire4[(1'h1):(1'h0)]) : $signed(($signed(wire6) >>> $signed(wire7)))) : (8'hb3));
    end
  assign wire16 = $signed(((reg8[(5'h10):(1'h1)] ^ wire5[(3'h4):(2'h2)]) < wire5[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg17 <= (wire3[(4'hb):(3'h7)] ?
          ((reg8[(3'h5):(3'h5)] ?
              wire1 : reg8[(4'hd):(4'ha)]) >= (^reg8)) : $signed($signed(wire3[(3'h5):(1'h0)])));
      reg18 <= (~&$unsigned((reg13 >>> $unsigned((~&reg17)))));
      if ($unsigned((8'hba)))
        begin
          if (($signed((-($signed(reg10) ?
                  $unsigned((8'h9c)) : ((8'h9f) < wire7)))) ?
              ((wire5[(2'h3):(2'h3)] == {(wire0 <= reg11)}) <= reg9) : $signed((reg13[(3'h5):(2'h3)] ?
                  $unsigned(wire1) : ($unsigned(wire7) ?
                      ((8'ha8) || (8'ha4)) : {wire16, (8'hb9)})))))
            begin
              reg19 <= (reg11[(2'h3):(1'h1)] ?
                  (reg14[(5'h10):(1'h1)] != wire3[(2'h3):(1'h0)]) : reg9);
              reg20 <= (wire1[(4'hf):(1'h1)] ~^ (~&(8'hbf)));
              reg21 <= (((-wire0[(1'h1):(1'h0)]) ?
                  (8'hab) : (8'hb1)) + $unsigned(wire3[(4'h8):(3'h6)]));
              reg22 <= ($unsigned((((reg17 ? reg17 : reg11) ?
                  (reg14 ?
                      (8'had) : wire5) : (^reg21)) >= $signed($signed(reg8)))) - $signed({((&wire5) ?
                      reg15 : (wire3 ~^ (8'hb3))),
                  (&{reg18})}));
              reg23 <= wire4[(4'ha):(1'h0)];
            end
          else
            begin
              reg19 <= $signed((wire7 ?
                  $signed(((reg21 >> (8'hb8)) ?
                      $signed(wire16) : reg8[(3'h7):(3'h7)])) : ((~&(reg21 ~^ (7'h42))) ?
                      (reg14 ?
                          (wire6 >>> reg8) : wire7[(2'h2):(2'h2)]) : {wire6})));
              reg20 <= (wire7 ?
                  $signed($unsigned({$unsigned(reg20),
                      wire0[(4'ha):(2'h2)]})) : ((((wire2 ? wire5 : reg13) ?
                          (^~reg20) : (8'haf)) ?
                      reg15 : wire1[(5'h11):(1'h1)]) && (^~(reg10 ?
                      {reg14, reg18} : $signed(reg17)))));
              reg21 <= (|(^(~|wire6[(4'hf):(3'h4)])));
              reg22 <= $signed((($unsigned((^~reg17)) && $unsigned(wire7[(2'h3):(1'h0)])) || (-{(~&(8'hbf))})));
              reg23 <= (wire6 ?
                  reg11[(1'h1):(1'h0)] : (!(((reg10 ?
                          wire5 : (8'hb6)) << (!wire6)) ?
                      ($signed(reg9) & (^reg17)) : reg13)));
            end
          reg24 <= (reg8[(4'hf):(4'hc)] ? reg12 : reg12);
        end
      else
        begin
          reg19 <= {(reg22[(3'h5):(2'h3)] ?
                  (((wire6 ?
                      reg21 : (8'hbe)) & (reg14 != reg14)) ^ $unsigned(reg13)) : ($unsigned((8'had)) ?
                      (~&$unsigned(reg9)) : reg9)),
              ($signed($signed(reg18[(4'h8):(3'h5)])) ?
                  $unsigned($signed(reg23)) : (|wire1))};
        end
      reg25 <= ((reg18 ?
          $signed($unsigned((reg13 - wire16))) : reg23) | {$unsigned($signed(wire1)),
          $unsigned(($unsigned(reg17) << wire2))});
      if ($unsigned(reg12[(1'h1):(1'h1)]))
        begin
          reg26 <= reg11[(1'h0):(1'h0)];
          reg27 <= {$signed(reg15[(3'h7):(3'h7)])};
          reg28 <= ($signed((7'h40)) ?
              ($signed($unsigned($signed(reg21))) ?
                  $signed(reg21[(3'h7):(3'h5)]) : (^reg9)) : $unsigned($unsigned(($unsigned(wire16) ?
                  reg19 : (reg22 ~^ reg22)))));
          reg29 <= ($unsigned({$unsigned((8'hbf)), wire4[(4'h9):(1'h1)]}) ?
              (reg19 >= $signed({reg9})) : (8'hbd));
        end
      else
        begin
          reg26 <= reg22[(4'hd):(1'h0)];
          reg27 <= $unsigned((8'hb4));
          reg28 <= {reg22,
              (((reg19[(2'h3):(1'h1)] ? reg18[(3'h5):(3'h4)] : reg12) ?
                      {(~&wire0)} : (|{wire5, reg20})) ?
                  (reg26[(3'h4):(2'h3)] | $unsigned((8'ha9))) : (^wire16[(1'h0):(1'h0)]))};
          reg29 <= ((|reg24[(1'h1):(1'h0)]) ?
              reg14 : (((7'h40) ?
                  $signed((!reg21)) : (((8'ha6) || reg18) < reg23[(4'hd):(1'h0)])) || $unsigned($signed((reg11 ?
                  reg10 : wire7)))));
          reg30 <= (reg24[(1'h1):(1'h1)] * wire5);
        end
    end
  assign wire31 = reg14[(4'hd):(4'hc)];
  assign wire32 = ((^~$signed((((8'hb2) != (8'ha7)) && (^reg22)))) >> (($unsigned((|wire4)) ?
                          $unsigned((^(8'hb6))) : wire2) ?
                      ({reg11} < ($signed(reg19) ?
                          $unsigned(wire0) : $signed((8'hb7)))) : (reg17 ?
                          (8'hbf) : ((8'hb7) ~^ $signed((8'hb3))))));
  assign wire33 = reg29;
  always
    @(posedge clk) begin
      reg34 <= ($unsigned((&(8'hbe))) + reg20[(1'h1):(1'h1)]);
      reg35 <= $signed((8'h9d));
      reg36 <= {(&$unsigned($unsigned($unsigned(reg13)))), $signed({reg28})};
      if ($signed((+(!(!(reg28 ? wire6 : reg8))))))
        begin
          reg37 <= (|reg13[(3'h7):(2'h2)]);
          if ($unsigned((|{wire3})))
            begin
              reg38 <= reg24[(1'h1):(1'h0)];
              reg39 <= (8'haa);
              reg40 <= reg12[(4'hd):(1'h0)];
              reg41 <= (&(reg10[(3'h5):(3'h4)] ?
                  $signed(reg13[(2'h3):(1'h1)]) : ({(wire1 && reg22)} ?
                      $unsigned((!wire7)) : $signed((^wire2)))));
            end
          else
            begin
              reg38 <= reg29;
              reg39 <= ($signed((((~reg12) ?
                  (reg41 ? wire32 : reg28) : $signed((8'hbe))) || ((reg23 ?
                  wire31 : wire33) ^ wire16))) != ((~|(+{wire31, reg8})) ?
                  $unsigned(({reg12,
                      reg36} != reg17)) : {$unsigned($unsigned(reg35)),
                      (~^{reg38})}));
              reg40 <= reg34[(4'h9):(3'h5)];
              reg41 <= reg9;
            end
          if ($unsigned({(~|reg37[(3'h4):(2'h2)]), $signed((+reg8))}))
            begin
              reg42 <= (~^$unsigned((reg23 != ($unsigned(reg14) ?
                  reg37[(3'h7):(2'h2)] : wire7))));
              reg43 <= wire2;
              reg44 <= $unsigned(reg20);
              reg45 <= wire7[(4'ha):(3'h5)];
            end
          else
            begin
              reg42 <= $signed(reg28[(1'h0):(1'h0)]);
              reg43 <= $unsigned((reg23 || ($unsigned(reg39[(2'h3):(2'h3)]) * $signed(((8'hb3) ?
                  reg38 : (7'h41))))));
            end
          reg46 <= $signed((8'hab));
        end
      else
        begin
          reg37 <= $unsigned(({({(7'h41)} ? (|(8'hab)) : $signed(reg40)),
                  $unsigned((wire5 ^ reg24))} ?
              ({{reg15,
                      wire4}} ~^ $signed(reg29[(3'h7):(2'h2)])) : (reg36[(1'h0):(1'h0)] ?
                  reg41[(3'h6):(1'h1)] : (^~(reg11 < reg8)))));
          reg38 <= reg25;
          reg39 <= {wire31,
              {$signed(reg20[(4'ha):(3'h5)]),
                  ((~^$unsigned(wire1)) ? ((~&reg20) > (7'h41)) : {reg39})}};
          if ($unsigned((~($unsigned(((8'haa) ?
              reg40 : reg26)) ^ $signed((~^reg44))))))
            begin
              reg40 <= (8'h9d);
            end
          else
            begin
              reg40 <= $unsigned(reg13[(2'h2):(1'h0)]);
              reg41 <= ($signed($signed($unsigned(reg41))) ?
                  $signed({(-$signed(reg9))}) : reg9[(3'h4):(1'h1)]);
            end
        end
    end
  always
    @(posedge clk) begin
      reg47 <= reg29[(3'h6):(1'h0)];
      if ((reg8 >>> (((~(reg17 >> reg43)) ?
          $unsigned((^reg14)) : reg41[(3'h4):(1'h1)]) - (^~(reg9[(1'h1):(1'h1)] ^~ reg22)))))
        begin
          reg48 <= $unsigned(reg17[(1'h1):(1'h1)]);
          if ($signed(reg19[(3'h7):(3'h5)]))
            begin
              reg49 <= {({((reg8 ? reg34 : reg29) ? (+wire31) : (^wire31)),
                      ((!reg41) ?
                          (reg40 >= reg43) : $signed(reg17))} ^ (~&{$signed(reg39),
                      (~&reg34)})),
                  {reg12, {$signed((^~reg44)), $unsigned((~&reg43))}}};
              reg50 <= reg14;
              reg51 <= wire33;
              reg52 <= $signed(($signed($unsigned(reg26)) + $signed((reg8 >>> (~^reg38)))));
              reg53 <= reg13[(1'h1):(1'h0)];
            end
          else
            begin
              reg49 <= $signed(reg11);
            end
          reg54 <= (reg49[(2'h3):(1'h1)] ?
              $signed(($signed((wire7 * reg36)) < ((-wire32) ?
                  reg44[(2'h3):(1'h0)] : (reg39 ?
                      wire7 : reg41)))) : $signed((+(~&(reg10 * reg43)))));
          reg55 <= ((((reg8 ? $signed(wire32) : (~&reg43)) + (|reg25)) ?
              (|{wire6[(5'h11):(3'h5)]}) : (((reg26 - reg50) || (^~reg46)) == $signed($signed((8'haa))))) == reg20);
          reg56 <= reg17;
        end
      else
        begin
          reg48 <= (reg46[(4'hc):(3'h7)] + reg54[(4'h8):(3'h7)]);
          if ($unsigned(({(reg54 <<< {reg37}), $signed({reg15})} >> wire4)))
            begin
              reg49 <= (&$unsigned(reg27[(2'h2):(2'h2)]));
              reg50 <= (8'ha4);
              reg51 <= ((8'hba) ?
                  $signed($unsigned((reg9 == wire6))) : (-{{$signed(reg38),
                          (reg29 ? reg10 : reg20)},
                      {reg24[(2'h2):(2'h2)]}}));
              reg52 <= (~|$unsigned(($signed($unsigned(reg27)) ?
                  (8'hbd) : reg43[(4'hd):(4'h8)])));
            end
          else
            begin
              reg49 <= $unsigned($unsigned(reg9));
              reg50 <= $unsigned(wire0[(4'hb):(1'h1)]);
            end
        end
    end
  assign wire57 = (reg8[(3'h7):(3'h4)] >> reg42);
  assign wire58 = (+wire6[(2'h2):(2'h2)]);
  assign wire59 = $signed((reg15[(3'h7):(3'h6)] == reg20[(2'h2):(2'h2)]));
  assign wire60 = {$signed({{(+(8'hb3))}, (reg18 ^ (^~reg56))}),
                      $signed(((~wire5[(3'h4):(3'h4)]) || $unsigned(((8'ha8) >> reg13))))};
  assign wire61 = $unsigned(reg11[(1'h1):(1'h0)]);
endmodule
