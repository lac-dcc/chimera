module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire42,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire16,
                 wire15,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = ($signed(((~wire3[(3'h5):(2'h2)]) == (wire1 ?
                         wire0[(4'h8):(3'h5)] : (wire1 - wire3)))) ?
                     ({{$signed((8'haa))}, wire2} * $unsigned(($signed(wire3) ?
                         (8'h9d) : $unsigned(wire3)))) : wire1[(2'h2):(1'h1)]);
  assign wire5 = wire2;
  assign wire6 = ($signed({wire3[(3'h6):(3'h4)],
                         $unsigned(wire3[(1'h1):(1'h1)])}) ?
                     (~(^(wire0 ^ wire5[(3'h4):(2'h2)]))) : (8'ha3));
  assign wire7 = wire3;
  assign wire8 = ((wire1[(2'h3):(1'h1)] | $signed((wire2 * (8'hb1)))) ?
                     $signed(($signed(wire3[(1'h0):(1'h0)]) ?
                         (^~(+wire7)) : wire4)) : $unsigned((-wire4)));
  always
    @(posedge clk) begin
      reg9 <= ($signed(wire5[(1'h1):(1'h1)]) ?
          $signed((wire0[(3'h7):(3'h7)] >> wire1[(2'h3):(1'h0)])) : $unsigned({(wire0[(5'h11):(4'hf)] ?
                  $signed((8'hbd)) : wire1[(1'h0):(1'h0)])}));
      reg10 <= wire5;
      if ({$signed((&(~^$signed((8'h9d)))))})
        begin
          reg11 <= ($unsigned(wire7[(2'h2):(1'h0)]) - $unsigned(((-wire5) - wire2[(4'hd):(4'h8)])));
        end
      else
        begin
          if ($unsigned((8'hb8)))
            begin
              reg11 <= {{({wire2} >>> wire8)},
                  ((8'hb9) << wire8[(1'h1):(1'h0)])};
              reg12 <= $signed(wire4);
              reg13 <= wire0;
            end
          else
            begin
              reg11 <= ((($unsigned(wire3) ?
                  (~^$unsigned(wire6)) : $unsigned(reg10[(2'h3):(1'h1)])) < {wire6[(3'h7):(1'h0)],
                  (8'haa)}) ~^ (&(~&(8'h9c))));
            end
        end
      reg14 <= (&(-$unsigned(wire3[(3'h5):(3'h4)])));
    end
  assign wire15 = $unsigned($unsigned(((^$signed(wire4)) + wire6)));
  assign wire16 = wire2;
  always
    @(posedge clk) begin
      reg17 <= $signed((~$unsigned(((|wire0) ?
          $signed(reg12) : (wire8 << reg12)))));
      reg18 <= (($unsigned((((8'hb7) + reg11) ?
              {(8'hba), wire5} : (wire3 ? wire6 : reg14))) ?
          {reg14[(4'h8):(2'h3)]} : $unsigned($unsigned($unsigned(reg11)))) & ((reg9[(2'h2):(1'h0)] <<< wire5) < (^~wire6)));
      if (reg18[(1'h0):(1'h0)])
        begin
          reg19 <= (($unsigned($signed($signed(reg14))) * (&((|wire15) ?
              wire15[(2'h2):(2'h2)] : wire3))) * {((((8'ha7) ^~ reg17) >>> wire8[(2'h2):(2'h2)]) || wire7[(3'h5):(1'h0)]),
              (~^wire6)});
          if (($signed(((^reg9[(1'h1):(1'h1)]) ?
                  ($signed(reg9) ?
                      (reg13 ?
                          reg11 : (8'hb8)) : wire0[(3'h6):(3'h6)]) : ($signed(wire0) ^ (^reg9)))) ?
              {(^({reg17, reg13} - (^reg14)))} : reg17[(2'h2):(1'h0)]))
            begin
              reg20 <= reg17[(4'h8):(3'h5)];
            end
          else
            begin
              reg20 <= (((~^$unsigned($unsigned(reg10))) <<< ((wire3 ?
                      (~wire16) : $unsigned(wire3)) * reg20)) ?
                  wire16 : wire3);
              reg21 <= $signed(wire6[(2'h3):(2'h3)]);
              reg22 <= (8'hb6);
            end
          reg23 <= {$signed(reg13), wire6};
          reg24 <= $unsigned(reg9[(1'h1):(1'h1)]);
          if ((|wire8))
            begin
              reg25 <= ($unsigned(wire16[(3'h6):(1'h0)]) || $signed($signed({(reg24 | reg10),
                  (reg9 ? wire15 : wire1)})));
            end
          else
            begin
              reg25 <= (wire16 >> reg25[(4'ha):(1'h0)]);
              reg26 <= $unsigned((({$unsigned(reg21), (reg19 * (8'ha9))} ?
                      $unsigned(reg18) : $signed($signed((8'h9c)))) ?
                  ($unsigned(reg14) ?
                      (|reg21) : $unsigned({reg13, wire6})) : reg20));
              reg27 <= $signed($unsigned((-{(wire16 <= wire7)})));
            end
        end
      else
        begin
          reg19 <= $signed((({(^~wire16), (reg14 & reg9)} < (~|(8'hbd))) ?
              (reg25[(3'h5):(2'h3)] ?
                  $signed({reg14}) : $signed($signed(reg21))) : (~&((~reg19) + (reg14 << wire16)))));
          if ((~&(~^(+(wire2[(5'h10):(1'h1)] & (8'ha5))))))
            begin
              reg20 <= (reg11 ?
                  (($unsigned(((8'ha9) >= reg10)) - ($unsigned(reg13) ?
                      reg10 : $unsigned(wire5))) ~^ {{(^wire0), (!(7'h40))},
                      wire7}) : (($unsigned($signed(wire3)) ?
                          reg9[(1'h0):(1'h0)] : reg10) ?
                      reg19[(2'h3):(2'h2)] : $unsigned(reg19[(1'h1):(1'h1)])));
              reg21 <= wire5[(2'h3):(1'h0)];
              reg22 <= reg25[(3'h4):(1'h1)];
              reg23 <= (wire3[(1'h1):(1'h0)] == $unsigned(reg22));
              reg24 <= $unsigned(wire7[(1'h0):(1'h0)]);
            end
          else
            begin
              reg20 <= (wire3[(3'h4):(3'h4)] >= wire6);
              reg21 <= $unsigned(((reg24[(5'h10):(4'hf)] & ((reg14 << reg9) | $signed(reg27))) != (reg19[(1'h0):(1'h0)] ?
                  reg23[(4'h8):(2'h3)] : (~|$signed(reg19)))));
            end
          reg25 <= (+(7'h40));
          reg26 <= $signed(reg23[(5'h10):(5'h10)]);
          if (reg24[(4'h8):(3'h7)])
            begin
              reg27 <= $unsigned((+reg18[(2'h2):(2'h2)]));
            end
          else
            begin
              reg27 <= $unsigned((+reg19));
              reg28 <= {$unsigned($signed((!(reg19 ^ reg12))))};
            end
        end
      reg29 <= {((reg20[(1'h0):(1'h0)] != $unsigned($unsigned((8'hb6)))) ?
              (~|$unsigned((wire2 ?
                  wire4 : reg13))) : $unsigned(reg19[(3'h5):(2'h2)])),
          ((^~{((8'hbb) - wire1)}) && {($unsigned(reg10) ?
                  ((7'h43) <<< wire0) : (reg27 >>> wire15)),
              (~|$signed((8'hb5)))})};
    end
  assign wire30 = (($signed((((8'ha8) ? reg20 : wire5) >= {reg17, wire1})) ?
                          $unsigned($unsigned((reg20 ?
                              (8'hbc) : reg24))) : (-$unsigned($signed((8'hb8))))) ?
                      wire16 : wire8[(5'h11):(2'h3)]);
  assign wire31 = (&(&$signed(wire1)));
  assign wire32 = (((($signed((8'hac)) || reg14) && $unsigned(reg20)) ^ (({wire7,
                          reg29} >> reg13) ?
                      (|$unsigned(reg21)) : ((reg22 - (8'hb4)) < $signed(reg11)))) == $unsigned(reg19));
  assign wire33 = {$signed((reg13[(4'hc):(1'h0)] ?
                          wire31 : (wire0 ? wire31 : {reg29, wire1}))),
                      ((!reg10) & wire15)};
  assign wire34 = reg12[(2'h2):(1'h1)];
  assign wire35 = ((+$unsigned($signed($signed(reg11)))) ?
                      reg23 : (|($unsigned((^reg10)) ?
                          (reg24 ?
                              $unsigned(reg11) : wire7) : (!reg26[(1'h1):(1'h0)]))));
  assign wire36 = $unsigned((&wire5[(4'ha):(3'h6)]));
  assign wire37 = $unsigned((&reg13[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg38 <= $unsigned($signed((8'ha4)));
      reg39 <= $signed((wire16[(3'h6):(2'h2)] + {$signed($unsigned((8'hbb))),
          reg20[(2'h2):(1'h0)]}));
      reg40 <= ((reg21 ?
              ((!reg18[(2'h2):(1'h1)]) ?
                  ((reg14 ?
                      (8'ha2) : reg21) * reg18[(2'h2):(2'h2)]) : $signed((wire36 <= (8'hae)))) : reg13) ?
          ({wire33[(2'h2):(2'h2)],
              (|$unsigned((8'hbc)))} <<< $signed((reg28[(2'h2):(2'h2)] ?
              reg26 : $unsigned(reg23)))) : reg10);
    end
  always
    @(posedge clk) begin
      reg41 <= $signed((8'ha4));
    end
  assign wire42 = wire1[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      if (($unsigned((!$unsigned(reg10[(3'h4):(1'h0)]))) ?
          $unsigned({reg39[(3'h4):(2'h3)],
              $unsigned((wire33 > (8'h9c)))}) : $unsigned((wire30[(1'h1):(1'h0)] ~^ $unsigned((wire30 ^ reg28))))))
        begin
          reg43 <= ($unsigned($signed(($unsigned(wire42) ?
                  reg17 : (reg27 < wire15)))) ?
              $signed($signed(((8'haa) ?
                  $unsigned(wire1) : (~&reg18)))) : $signed($unsigned($signed($unsigned((8'hb1))))));
          reg44 <= ((&(wire37[(3'h7):(1'h0)] - (wire4[(5'h12):(4'hc)] & (7'h40)))) == $signed($signed($signed((8'hbc)))));
          if (wire31)
            begin
              reg45 <= (~(!(8'hb4)));
              reg46 <= $signed($unsigned($unsigned(wire31[(2'h2):(1'h1)])));
              reg47 <= (&(((reg28[(4'h8):(3'h6)] ?
                          ((8'hb9) ? wire5 : wire35) : {wire4}) ?
                      wire16[(2'h2):(2'h2)] : (-$signed(reg20))) ?
                  (^$unsigned(reg26)) : {reg11}));
              reg48 <= $unsigned($signed(reg40[(1'h1):(1'h0)]));
            end
          else
            begin
              reg45 <= (~^reg46);
              reg46 <= (((((reg14 && reg23) ? (!wire0) : (reg13 & reg25)) ?
                      $signed((8'hb8)) : $unsigned(reg40[(2'h2):(1'h0)])) >>> {$signed((8'ha3))}) ?
                  $unsigned(reg38) : $signed({(~^((8'hb5) ~^ wire2)), wire15}));
              reg47 <= ((^(!$signed(reg22))) == wire31);
            end
        end
      else
        begin
          reg43 <= (wire3 ?
              $unsigned((({reg43, wire36} ?
                  reg26 : wire3) >>> ($unsigned(reg40) ?
                  (~wire7) : wire35[(3'h6):(3'h6)]))) : wire35[(3'h6):(1'h0)]);
          reg44 <= (($signed($unsigned($unsigned(wire4))) & $signed(wire32)) ?
              reg44 : (^~$signed(wire42[(4'h8):(4'h8)])));
          reg45 <= $unsigned(($signed((|$unsigned(reg39))) ?
              {(8'hab),
                  $unsigned($signed(wire30))} : $unsigned((^~(reg48 != reg14)))));
          reg46 <= reg26;
          reg47 <= ($unsigned({({wire4, reg17} <<< $unsigned((8'hab))),
              $signed(reg28)}) >= (reg47[(3'h5):(1'h1)] & $unsigned(reg40)));
        end
      reg49 <= $signed((^~reg41[(3'h7):(3'h7)]));
      if (wire32[(4'hd):(2'h2)])
        begin
          if ((($unsigned((^~wire36)) >= (8'hb7)) ~^ (!((8'ha4) ^~ ($signed(reg22) ?
              reg24[(2'h3):(2'h2)] : $unsigned(reg17))))))
            begin
              reg50 <= wire30;
            end
          else
            begin
              reg50 <= reg19;
              reg51 <= (+(($unsigned({reg10}) ~^ ((reg41 - wire7) <= $signed((7'h40)))) ?
                  (|wire42[(5'h10):(4'h9)]) : $signed($signed($signed(reg25)))));
              reg52 <= $unsigned($unsigned($unsigned(reg46[(3'h7):(3'h5)])));
            end
          reg53 <= $signed(reg11[(3'h4):(1'h0)]);
        end
      else
        begin
          reg50 <= reg41;
          reg51 <= ($unsigned((8'ha7)) ?
              $unsigned(((&(wire2 > wire30)) && ((wire1 ? (8'hb6) : reg45) ?
                  wire34[(3'h6):(3'h6)] : wire2[(1'h0):(1'h0)]))) : $unsigned(wire6));
          if (({wire32, $unsigned(((reg21 > wire33) < (~&(8'ha1))))} ?
              $signed(reg25[(3'h4):(1'h0)]) : reg28))
            begin
              reg52 <= $unsigned(reg53[(4'ha):(1'h0)]);
              reg53 <= ($unsigned($signed(($signed((7'h44)) ?
                      $signed(reg39) : {(7'h42)}))) ?
                  reg13 : ({$unsigned($signed(wire34))} ?
                      reg9 : (|(~|{reg39}))));
              reg54 <= wire36;
              reg55 <= (~&reg27);
              reg56 <= (((8'hb5) ?
                      (!($signed((8'hae)) ?
                          (reg53 > reg10) : $unsigned(wire1))) : $signed((-reg40[(3'h4):(2'h3)]))) ?
                  $signed(reg25) : ((({reg44} > ((8'hbf) ? wire5 : reg46)) ?
                      (!$unsigned(reg46)) : {(!reg11)}) >>> reg50[(1'h0):(1'h0)]));
            end
          else
            begin
              reg52 <= (^~wire34);
              reg53 <= ((8'hb9) ^~ (~(~^wire5)));
              reg54 <= $unsigned((~&($unsigned($unsigned(wire1)) ?
                  ($unsigned(reg55) ?
                      $unsigned((8'hbc)) : (wire8 ?
                          (8'h9e) : wire36)) : $signed(wire3))));
            end
        end
      reg57 <= reg54[(2'h2):(1'h1)];
    end
endmodule
