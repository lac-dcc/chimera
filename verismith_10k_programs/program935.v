module top
#(parameter param93 = (8'hb4), 
parameter param94 = (^(({(param93 | param93)} ? ((+param93) <= (&param93)) : ((param93 ~^ param93) ? (param93 ? param93 : param93) : (~&param93))) ? {{((8'hbe) << param93), (~&(8'ha7))}, param93} : (((8'hba) ? (^param93) : (|param93)) ? ((param93 ? param93 : param93) > param93) : ((param93 ? param93 : param93) ? ((8'ha8) ? param93 : param93) : param93)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(2'h2):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire75;
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire79,
                 wire78,
                 wire77,
                 wire4,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire23,
                 wire27,
                 wire75,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg5,
                 reg6,
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
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire4 = $signed($unsigned((^~((wire3 ? wire0 : wire1) ~^ (8'ha1)))));
  always
    @(posedge clk) begin
      reg5 <= $signed(wire4);
      reg6 <= ($unsigned((~wire4[(2'h3):(2'h3)])) && (wire2[(2'h3):(2'h2)] ?
          reg5[(1'h0):(1'h0)] : wire4));
    end
  assign wire7 = ({$signed(wire4), reg5} ?
                     (^~{$signed($signed(wire4)), $signed((~&wire3))}) : reg6);
  assign wire8 = $unsigned({$signed((8'hba)), wire4[(3'h6):(3'h5)]});
  assign wire9 = (wire2 ? (8'ha3) : reg6);
  assign wire10 = (8'ha7);
  always
    @(posedge clk) begin
      reg11 <= {($unsigned($unsigned($signed(wire4))) * $unsigned({wire0[(4'h9):(1'h0)],
              wire9})),
          wire1[(4'hf):(2'h2)]};
      if ((^~wire3))
        begin
          reg12 <= $signed((((-$unsigned(wire3)) || {$signed((7'h41))}) ^ $unsigned({{wire10,
                  wire0}})));
          if (wire9)
            begin
              reg13 <= wire3;
              reg14 <= wire2;
              reg15 <= wire7;
              reg16 <= (~^wire0);
            end
          else
            begin
              reg13 <= reg6;
              reg14 <= reg13[(4'h9):(3'h5)];
              reg15 <= (~&{reg6, $unsigned(reg16)});
              reg16 <= ($signed(reg11[(4'h8):(4'h8)]) ?
                  reg13 : $signed(wire10[(3'h4):(2'h3)]));
              reg17 <= $signed(wire0);
            end
          reg18 <= (!$unsigned({$signed(wire4),
              $signed(wire8[(4'he):(1'h0)])}));
        end
      else
        begin
          reg12 <= ({$unsigned(reg11)} <<< $signed(reg16[(3'h4):(2'h2)]));
          if ((+$unsigned($unsigned((+wire9[(3'h4):(1'h0)])))))
            begin
              reg13 <= {wire8[(4'hf):(3'h6)],
                  ($unsigned($signed((wire1 ?
                      reg15 : reg5))) + $unsigned($signed($signed(reg15))))};
              reg14 <= (~|wire1);
            end
          else
            begin
              reg13 <= $unsigned(reg15);
              reg14 <= reg14;
              reg15 <= (wire0[(3'h6):(1'h1)] ?
                  (wire0[(2'h2):(1'h0)] >>> (wire0 ?
                      ((^reg16) ~^ (reg16 ?
                          wire10 : reg13)) : (|wire0))) : (~&(~|($unsigned(reg17) <<< wire2[(2'h3):(1'h0)]))));
            end
          reg16 <= wire3;
          if ((^(reg18 ?
              ($unsigned(reg16[(1'h0):(1'h0)]) ?
                  $unsigned($unsigned(reg14)) : $unsigned((wire0 <<< (8'ha1)))) : (((~reg17) > wire9[(4'hb):(4'h9)]) ?
                  reg14[(2'h3):(1'h1)] : ({wire4} - $unsigned((8'hb0)))))))
            begin
              reg17 <= reg16[(4'h8):(2'h2)];
              reg18 <= ((&wire1[(3'h7):(1'h0)]) ?
                  reg5[(4'he):(4'hc)] : $unsigned($unsigned((8'hac))));
            end
          else
            begin
              reg17 <= $signed($signed(wire9[(4'hb):(3'h4)]));
              reg18 <= {wire1};
              reg19 <= reg13[(4'hb):(3'h4)];
              reg20 <= $unsigned((8'hbb));
            end
        end
      reg21 <= (|reg19[(2'h2):(2'h2)]);
      reg22 <= ({wire7[(3'h5):(2'h2)]} ^~ $unsigned($unsigned(reg11[(4'h8):(1'h0)])));
    end
  assign wire23 = reg13;
  always
    @(posedge clk) begin
      reg24 <= {($signed($unsigned($unsigned(reg11))) * {{(wire23 & reg17),
                  (reg15 <= reg22)},
              (~^$unsigned(reg6))})};
      reg25 <= {$unsigned($signed(reg5)), wire23};
      reg26 <= (~^{$signed(((8'hb5) > reg21[(4'h9):(1'h0)]))});
    end
  assign wire27 = $unsigned(reg5[(2'h2):(1'h1)]);
  module28 #() modinst76 (wire75, clk, wire1, wire9, wire27, reg11);
  assign wire77 = ({({reg13, (8'hbf)} < reg11[(2'h3):(1'h1)]),
                          wire3[(1'h0):(1'h0)]} ?
                      reg16[(2'h3):(2'h2)] : ((!$signed((reg26 ?
                          wire9 : wire27))) < ((8'hab) - (wire4[(3'h5):(3'h4)] >= (reg18 ?
                          reg21 : reg6)))));
  assign wire78 = ($unsigned(reg12) ^ {($unsigned((wire2 ? wire27 : (8'hb3))) ?
                          ($signed(wire27) <= $signed(reg24)) : wire0),
                      ($signed($signed(reg14)) ?
                          ((~|reg16) ?
                              $unsigned(reg25) : ((7'h43) ?
                                  reg5 : (7'h41))) : (|(reg11 ?
                              wire9 : (8'hb5))))});
  assign wire79 = {$unsigned($unsigned(((~&reg24) ?
                          reg20[(1'h0):(1'h0)] : $unsigned(wire0))))};
  always
    @(posedge clk) begin
      if ($signed($signed(wire78[(3'h6):(1'h1)])))
        begin
          reg80 <= reg11[(4'hb):(2'h2)];
        end
      else
        begin
          if ((reg20[(4'hd):(4'h9)] <= reg18[(3'h4):(1'h0)]))
            begin
              reg80 <= (~&(8'hb6));
              reg81 <= $unsigned(($unsigned(wire78) ?
                  $unsigned(((-reg24) ^ $signed(wire77))) : $signed($signed(reg13[(4'h8):(2'h2)]))));
              reg82 <= (({(~|(~^wire4)),
                      ($unsigned(reg22) ? wire79 : (-reg17))} ?
                  reg17 : ($unsigned($unsigned(wire10)) == $signed({reg6,
                      reg15}))) - (-{(reg81 ? (^~reg14) : reg25),
                  $signed(wire7[(2'h2):(2'h2)])}));
              reg83 <= {(reg12 ? reg17[(3'h4):(2'h3)] : wire8[(2'h3):(2'h2)])};
            end
          else
            begin
              reg80 <= (^{(&(~^(wire78 ? reg81 : wire7))), wire79});
              reg81 <= (~^((|(&$unsigned(reg20))) == ($signed($unsigned(reg5)) ?
                  $signed($signed(wire10)) : (^~$unsigned(wire7)))));
              reg82 <= (&($signed($signed(reg22)) ?
                  $signed(reg11) : $signed({reg22[(2'h2):(1'h0)]})));
              reg83 <= reg6;
            end
        end
      reg84 <= (&(+$unsigned(wire3[(1'h0):(1'h0)])));
    end
  assign wire85 = reg20[(3'h5):(2'h3)];
  assign wire86 = ($unsigned($unsigned((-$unsigned(reg11)))) ^ reg5[(4'hc):(3'h4)]);
  assign wire87 = $signed($signed($signed(((reg5 ? wire7 : reg20) ?
                      $unsigned((8'hba)) : $unsigned(reg19)))));
  assign wire88 = $signed(($signed((8'hbc)) <<< ((~^(reg22 < reg17)) >= {{reg80,
                          wire10}})));
  assign wire89 = $signed($signed(reg20));
  assign wire90 = wire4[(1'h1):(1'h1)];
  assign wire91 = ($unsigned($unsigned($unsigned((wire79 ? wire2 : wire27)))) ?
                      {({$unsigned(wire87), ((8'hb4) >= wire79)} && (-{reg11,
                              wire85})),
                          $signed(((wire88 ? reg15 : reg16) ?
                              (reg80 ?
                                  reg11 : (8'haf)) : $signed(reg84)))} : (&wire86[(3'h5):(3'h4)]));
  assign wire92 = reg13;
endmodule

module module28
#(parameter param74 = (~(|(&(|(~|(7'h42)))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  assign y = {wire65,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire33 = (wire29[(1'h1):(1'h0)] << $unsigned(((|wire32[(3'h5):(3'h5)]) ?
                      $unsigned({wire31}) : ((-(8'ha1)) < wire32))));
  assign wire34 = (wire32[(2'h3):(1'h0)] ?
                      {{{(~wire33)}, (wire29 >= $signed(wire29))},
                          ((wire29[(2'h2):(2'h2)] ?
                              (8'ha5) : (!wire31)) | wire31[(1'h0):(1'h0)])} : $unsigned(($signed((wire33 >>> wire30)) ?
                          ((8'ha6) ?
                              (wire30 && wire32) : wire32) : $signed((+wire32)))));
  assign wire35 = ((^$unsigned((-(wire31 ? wire32 : wire33)))) ?
                      $signed(wire32[(2'h3):(1'h1)]) : wire32[(2'h2):(1'h1)]);
  assign wire36 = wire33;
  always
    @(posedge clk) begin
      reg37 <= wire30[(3'h5):(3'h4)];
      if ($unsigned(wire29[(3'h6):(2'h2)]))
        begin
          reg38 <= (~&(~&wire30));
          if ($unsigned(wire33[(1'h0):(1'h0)]))
            begin
              reg39 <= $signed(wire31);
              reg40 <= $unsigned((((|wire34[(3'h7):(1'h1)]) ?
                  ($signed(reg38) ?
                      (wire29 ? wire34 : reg39) : (reg37 < reg39)) : (wire32 ?
                      wire29[(4'h8):(2'h3)] : wire32)) + $signed($signed($unsigned(reg38)))));
              reg41 <= wire36[(2'h3):(2'h2)];
            end
          else
            begin
              reg39 <= (8'h9c);
            end
          if ((wire32[(2'h3):(2'h3)] >= $signed(((((8'ha4) >> wire32) ?
                  $signed(wire29) : $signed(reg38)) ?
              ($unsigned(reg37) > reg38) : (wire32[(1'h0):(1'h0)] ?
                  (~|wire33) : wire29[(2'h2):(2'h2)])))))
            begin
              reg42 <= $unsigned((~^reg40[(1'h0):(1'h0)]));
              reg43 <= wire29[(3'h6):(3'h4)];
              reg44 <= $unsigned((~^wire30[(3'h6):(1'h1)]));
              reg45 <= (reg43[(1'h0):(1'h0)] ?
                  $unsigned({reg39}) : ($unsigned($unsigned($signed(reg38))) >> {{reg38[(3'h6):(2'h3)],
                          (reg44 >> reg40)}}));
              reg46 <= (reg43[(1'h0):(1'h0)] ?
                  $signed($signed(((reg38 ?
                      reg41 : reg38) ~^ $signed(wire30)))) : $signed(reg37));
            end
          else
            begin
              reg42 <= {(^wire29[(4'hb):(3'h6)])};
              reg43 <= $signed((+{({reg46, reg42} << (^wire31)),
                  wire33[(1'h0):(1'h0)]}));
              reg44 <= $unsigned(($signed(wire36) + wire30));
              reg45 <= {(+wire29[(3'h6):(3'h6)]),
                  ($signed($unsigned($signed((8'hb2)))) ~^ $unsigned($unsigned((reg41 ?
                      reg41 : reg37))))};
            end
          if ((reg37[(4'hb):(1'h1)] ^~ $signed($signed(reg38[(4'hb):(2'h2)]))))
            begin
              reg47 <= reg41[(4'he):(1'h0)];
            end
          else
            begin
              reg47 <= (((&($unsigned(reg39) ? $signed(wire36) : (!wire36))) ?
                      (~^reg47) : $signed($unsigned((reg46 ?
                          reg41 : (8'ha7))))) ?
                  (~|wire29) : $unsigned((-(~&{reg42, wire32}))));
              reg48 <= (~(|$unsigned((8'hae))));
              reg49 <= ((reg42[(4'hd):(2'h2)] & {$unsigned((8'hb2))}) ?
                  {($unsigned((^~(8'hbf))) ?
                          ({wire30, reg37} >= ((8'hb1) ?
                              wire35 : reg44)) : (^~(wire33 != (8'ha8)))),
                      ($unsigned((^~reg41)) ?
                          $unsigned((wire30 ?
                              wire29 : reg41)) : $unsigned(wire29))} : reg47);
              reg50 <= (((!$unsigned((&reg44))) ?
                      wire29[(4'h8):(1'h1)] : ((8'ha1) ^ $signed($unsigned(wire31)))) ?
                  $signed((^~(reg47[(3'h7):(3'h4)] > reg42))) : reg41[(1'h1):(1'h0)]);
              reg51 <= (8'hbe);
            end
          reg52 <= reg38;
        end
      else
        begin
          reg38 <= (8'ha1);
          reg39 <= ($unsigned((((reg37 * reg45) ?
              $signed((8'h9e)) : (^~(8'hb3))) | ((reg47 ? reg49 : (8'hae)) ?
              reg51[(1'h1):(1'h1)] : wire31))) ^~ $signed((reg52[(2'h3):(1'h0)] ?
              (reg51[(4'hf):(4'h9)] >> (reg52 ^~ reg42)) : reg37)));
          reg40 <= $signed(reg45[(3'h4):(2'h3)]);
          reg41 <= reg37;
          reg42 <= $signed($unsigned((reg52[(2'h2):(1'h1)] ?
              (reg43 ? ((8'hac) >> wire32) : reg38[(1'h1):(1'h1)]) : reg39)));
        end
      if (wire33)
        begin
          if ((+(8'hba)))
            begin
              reg53 <= $unsigned(reg41);
              reg54 <= reg47[(2'h3):(2'h3)];
              reg55 <= ($signed($signed((wire30[(1'h0):(1'h0)] ?
                  reg51 : reg53[(3'h7):(2'h2)]))) ~^ reg40[(1'h0):(1'h0)]);
              reg56 <= (($signed(reg49[(3'h4):(2'h2)]) > $unsigned(reg47)) ?
                  {{((&reg37) ? $unsigned(reg39) : $signed(reg38)),
                          ((reg47 | reg49) + (reg55 ? reg55 : reg50))},
                      (|reg50[(1'h0):(1'h0)])} : (reg55 ^ reg40));
            end
          else
            begin
              reg53 <= $unsigned({(reg56 | wire35),
                  (&($unsigned((8'hbb)) ? (^~(7'h42)) : {wire34}))});
              reg54 <= $unsigned($signed(reg48));
              reg55 <= reg38[(2'h2):(1'h1)];
              reg56 <= $signed($unsigned(reg43));
              reg57 <= (8'hb5);
            end
        end
      else
        begin
          if ($signed($unsigned(reg40[(1'h0):(1'h0)])))
            begin
              reg53 <= $unsigned($signed((~|(|$unsigned((8'hb3))))));
            end
          else
            begin
              reg53 <= reg46;
            end
          reg54 <= $unsigned(((&$unsigned($signed(reg41))) ?
              (^$signed($signed(wire33))) : (wire34[(1'h0):(1'h0)] < $unsigned($signed((8'h9f))))));
          reg55 <= (reg51[(3'h4):(3'h4)] ?
              (wire32 ?
                  ($signed($unsigned((8'hb8))) ?
                      (~((8'had) & wire34)) : wire31) : ($signed(reg54[(4'h8):(4'h8)]) > $unsigned({reg56}))) : reg41);
        end
      if ((-$signed($unsigned(reg56))))
        begin
          reg58 <= (-($signed(((reg40 ? reg48 : reg42) ^~ $unsigned(reg49))) ?
              wire33 : ((reg37 ?
                  $unsigned(reg53) : reg43[(2'h3):(1'h1)]) | (reg43 ?
                  (wire29 != wire31) : reg48))));
          if (reg45)
            begin
              reg59 <= ($signed(reg54[(1'h1):(1'h0)]) ?
                  (~^(!($signed(reg41) ?
                      (^reg38) : reg55))) : $unsigned(($signed(reg50) || (+wire30[(1'h0):(1'h0)]))));
              reg60 <= ((+((~&(^reg45)) ?
                      $unsigned($unsigned(wire36)) : $signed($signed(wire31)))) ?
                  wire36[(3'h4):(2'h2)] : $signed(reg55[(2'h3):(1'h1)]));
              reg61 <= ($unsigned(reg50) * {$unsigned((wire32[(1'h1):(1'h1)] ?
                      ((8'hbd) ? (8'ha9) : reg58) : $signed(reg48)))});
              reg62 <= (((~$signed($signed((8'hac)))) ?
                  (8'hbc) : $signed(($unsigned((8'h9d)) ?
                      $signed(reg42) : reg38[(4'ha):(3'h7)]))) ^~ $unsigned(reg54[(4'ha):(3'h6)]));
              reg63 <= reg58[(2'h3):(1'h1)];
            end
          else
            begin
              reg59 <= ($unsigned(($signed($unsigned(wire30)) ?
                  (8'hbd) : reg49)) | $unsigned($unsigned(($signed(reg38) ?
                  reg59 : (reg54 && wire30)))));
            end
          reg64 <= (-(reg38 | (&((wire36 * reg45) ?
              $signed(wire34) : {reg37}))));
        end
      else
        begin
          reg58 <= $signed((&$unsigned({$signed(reg46), $signed(reg61)})));
        end
    end
  assign wire65 = (~^reg60[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg66 <= wire65;
      if (((reg46[(4'hc):(3'h7)] ?
              (((reg41 ? reg55 : (7'h42)) == reg39[(3'h4):(2'h2)]) ?
                  {(wire30 ? (8'hb5) : wire34),
                      $unsigned(reg47)} : (reg48[(2'h2):(1'h0)] <<< (^~reg43))) : reg45) ?
          {$unsigned((8'hb5))} : (-reg60)))
        begin
          reg67 <= ($signed(reg45) ? reg60[(1'h0):(1'h0)] : reg51);
          reg68 <= ($unsigned(reg59) ?
              $signed(reg40[(2'h2):(1'h1)]) : ($unsigned($unsigned((+wire65))) | (~|((~^wire65) ?
                  {wire65, (8'hbc)} : $unsigned(wire31)))));
          reg69 <= ((reg41[(3'h4):(2'h3)] | (reg66[(4'hd):(3'h5)] ?
              reg61[(1'h0):(1'h0)] : $signed(reg64[(1'h0):(1'h0)]))) <= $unsigned({reg66}));
          reg70 <= wire30[(1'h1):(1'h0)];
          reg71 <= (-reg58[(5'h11):(4'h8)]);
        end
      else
        begin
          reg67 <= reg46[(3'h6):(1'h0)];
        end
      reg72 <= (&($signed(reg37[(3'h6):(3'h5)]) & ($unsigned((~|reg60)) - $signed(wire34[(2'h2):(1'h0)]))));
      reg73 <= $signed($unsigned(reg67[(2'h2):(1'h1)]));
    end
endmodule
