module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire8,
                 wire7,
                 wire6,
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
                 reg42,
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
                 reg10,
                 reg9,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$unsigned($signed(wire1)),
          $signed($unsigned(wire4[(3'h5):(2'h2)]))};
    end
  assign wire6 = $unsigned(((((wire2 ? reg5 : wire1) << ((8'hba) ?
                             (8'h9c) : wire3)) ?
                         wire2 : $unsigned((reg5 ? (8'hb5) : (8'hbf)))) ?
                     ({(wire1 ? wire0 : wire3), (wire0 ? (8'haa) : wire2)} ?
                         ((wire0 ? wire1 : reg5) ?
                             wire4[(3'h4):(3'h4)] : ((8'hb5) ?
                                 wire3 : wire4)) : $signed(wire0)) : ((^(|wire4)) < wire1)));
  assign wire7 = (-(!($signed($signed(reg5)) + $unsigned(wire0[(3'h5):(3'h5)]))));
  assign wire8 = wire7[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg9 <= (wire0 ?
          $unsigned(wire2[(1'h0):(1'h0)]) : ($unsigned($signed(wire6[(1'h0):(1'h0)])) && $signed(wire8)));
      reg10 <= ({(8'h9d)} ?
          $unsigned((wire1[(3'h4):(1'h1)] ?
              (-(^wire6)) : $unsigned((|(8'ha5))))) : (-(~&wire2[(4'h8):(2'h2)])));
      reg11 <= $unsigned($signed((^$unsigned((wire2 >>> wire3)))));
      if ((~|($unsigned(wire8[(3'h5):(2'h2)]) ^~ (~&(+$signed(wire6))))))
        begin
          if ({(8'hb9),
              $signed($unsigned($signed((reg11 ? (8'hb2) : (8'h9e)))))})
            begin
              reg12 <= $unsigned($signed(wire3));
              reg13 <= wire2;
              reg14 <= wire1[(1'h0):(1'h0)];
              reg15 <= (-reg5);
            end
          else
            begin
              reg12 <= ((wire3[(4'hd):(4'ha)] ?
                      wire6[(2'h3):(2'h3)] : {((-reg9) ?
                              {wire3, reg5} : (wire3 >= wire1)),
                          {(+reg12), reg5[(3'h4):(2'h2)]}}) ?
                  {wire8[(4'h9):(3'h7)]} : (reg14 ?
                      ((((8'hbc) ? (8'haf) : wire2) >= wire4[(4'ha):(4'ha)]) ?
                          ((&(8'ha8)) ?
                              wire1 : (reg11 | reg14)) : (((8'ha1) <= reg5) ?
                              {reg5, reg10} : wire7[(3'h5):(1'h0)])) : reg13));
              reg13 <= $unsigned(({($unsigned(reg10) ^~ (!(8'hb5))),
                  ((reg13 > wire4) ?
                      reg12[(2'h2):(1'h0)] : $unsigned(reg12))} <<< $signed($unsigned((+wire8)))));
              reg14 <= ((~($unsigned($unsigned(reg5)) ?
                  ((reg12 ? (8'ha1) : reg14) ?
                      $signed(reg13) : ((8'hb2) ^~ wire3)) : wire1[(2'h3):(1'h0)])) & ({$signed($unsigned((8'hae)))} ?
                  $unsigned(reg9[(5'h14):(3'h6)]) : $signed((-(~wire0)))));
              reg15 <= wire0;
              reg16 <= wire3[(3'h5):(2'h2)];
            end
          if (reg13[(1'h1):(1'h1)])
            begin
              reg17 <= $signed(reg5[(2'h2):(1'h0)]);
              reg18 <= wire6;
              reg19 <= (wire0 ? wire8[(1'h0):(1'h0)] : wire3);
              reg20 <= reg18;
            end
          else
            begin
              reg17 <= {({(+(reg18 ^~ reg12))} << wire8)};
            end
          reg21 <= wire1;
          reg22 <= ({({{wire4}, (+reg11)} ?
                  (reg14[(4'hd):(4'hb)] ?
                      {(8'ha3)} : reg5) : reg10[(3'h5):(1'h1)]),
              ($unsigned(reg13[(3'h4):(1'h1)]) < $unsigned((!(7'h41))))} != $unsigned((8'hba)));
          reg23 <= (((-((!wire7) ?
              $signed(wire1) : (8'ha5))) - reg22) != (reg16 != ((!(wire1 ?
                  reg15 : wire2)) ?
              (!(^~reg13)) : ((+reg17) != $signed(wire1)))));
        end
      else
        begin
          if ({(((!reg14[(4'ha):(3'h5)]) ? reg18 : reg13) ?
                  (reg22[(1'h1):(1'h0)] ?
                      (~^reg22[(2'h3):(2'h3)]) : (wire2[(4'h9):(4'h8)] ?
                          wire8[(3'h5):(3'h4)] : ((7'h42) ?
                              reg17 : wire1))) : reg5)})
            begin
              reg12 <= $signed((wire2 ?
                  ($unsigned(reg22) ?
                      ((reg10 & reg12) ?
                          $unsigned(wire7) : $signed(reg17)) : ($unsigned((8'h9e)) & (~^reg10))) : (wire4[(3'h5):(1'h0)] ?
                      (reg11 && $unsigned(reg10)) : reg10[(4'hc):(3'h5)])));
              reg13 <= $unsigned((wire4 < $unsigned(({wire1} ?
                  reg17 : $unsigned((8'ha3))))));
            end
          else
            begin
              reg12 <= reg17;
            end
          reg14 <= wire0[(1'h0):(1'h0)];
          if ($unsigned(reg20))
            begin
              reg15 <= $unsigned(($signed(reg23) < (8'hb0)));
              reg16 <= ((reg17[(1'h0):(1'h0)] <<< $signed($signed(reg22[(1'h1):(1'h1)]))) * $unsigned(wire4));
              reg17 <= $signed(reg23);
              reg18 <= $unsigned((~|wire6[(2'h2):(2'h2)]));
              reg19 <= reg16[(3'h4):(2'h2)];
            end
          else
            begin
              reg15 <= reg23[(3'h4):(1'h1)];
            end
        end
      if (($unsigned($signed((((8'h9d) | wire4) ?
          $signed(reg15) : (&reg15)))) ^~ (reg20[(3'h4):(1'h0)] << $signed(reg13[(1'h0):(1'h0)]))))
        begin
          if ($unsigned($signed((7'h41))))
            begin
              reg24 <= (wire4 ?
                  ((-$unsigned((^(8'hb7)))) - (({reg18} ?
                      reg20[(3'h5):(2'h3)] : (8'hb7)) + (~^(|reg22)))) : wire7[(3'h6):(1'h0)]);
              reg25 <= wire1;
              reg26 <= $unsigned(((wire1 == ($signed(reg17) && {reg19})) ?
                  (~|$unsigned(reg10)) : wire2));
              reg27 <= ($signed($signed($signed((8'ha6)))) ?
                  (8'hba) : ((^~(~((8'ha4) ^ reg9))) ?
                      ((~|(reg14 ? reg5 : wire1)) || {$signed(reg23),
                          wire8}) : $unsigned(($unsigned(reg10) ?
                          $unsigned(reg16) : ((8'haf) ? reg15 : reg24)))));
              reg28 <= wire6[(3'h4):(3'h4)];
            end
          else
            begin
              reg24 <= reg21[(2'h2):(1'h1)];
              reg25 <= reg5[(3'h4):(3'h4)];
              reg26 <= (wire4 ?
                  (~|wire6[(1'h1):(1'h1)]) : $signed($signed(((reg20 ?
                          reg9 : wire6) ?
                      reg13[(1'h1):(1'h0)] : (reg26 & wire7)))));
              reg27 <= (((reg23 ?
                      (^(!(7'h41))) : {reg11[(3'h5):(1'h1)],
                          (reg19 >> reg17)}) ?
                  $unsigned((reg10[(2'h2):(1'h1)] ?
                      ((8'haa) ?
                          reg12 : wire8) : $unsigned(wire2))) : ((&reg24[(1'h1):(1'h1)]) ?
                      (reg26 >= (~(8'ha0))) : (^~wire3))) ^ (wire6 ^ wire4));
              reg28 <= $signed(reg13);
            end
          reg29 <= $unsigned((~reg10[(3'h7):(1'h0)]));
          reg30 <= $signed(((-(((8'hbc) >>> reg26) & $signed(reg13))) << reg14[(4'h9):(3'h7)]));
          reg31 <= ($signed((~&(((8'hb5) | reg24) ?
              {(8'hb5)} : reg26[(4'h8):(3'h7)]))) - wire3);
          reg32 <= wire2[(1'h0):(1'h0)];
        end
      else
        begin
          reg24 <= (8'hbb);
          reg25 <= $unsigned((((^$signed((8'h9f))) != (~^(-reg30))) >> $signed($unsigned($unsigned((7'h41))))));
        end
    end
  assign wire33 = (^~(({$unsigned(reg18)} ~^ ((reg19 ? wire0 : reg11) ?
                      reg12[(3'h4):(1'h1)] : $signed(reg25))) ^~ $unsigned((~&((8'hba) >>> reg27)))));
  assign wire34 = reg24;
  assign wire35 = $signed((($signed((8'ha7)) ?
                      reg31 : ((wire2 ? reg18 : (7'h43)) ?
                          $signed(wire0) : (~|(8'hb8)))) > (^~((-wire4) ?
                      (reg15 + reg29) : $signed(reg17)))));
  assign wire36 = $signed($unsigned((8'hb1)));
  assign wire37 = (($signed($signed($signed(reg31))) >> reg28[(3'h5):(2'h3)]) * {({(^reg23)} ?
                          reg5[(3'h6):(3'h6)] : reg20[(5'h12):(3'h6)])});
  assign wire38 = $signed(((((^~reg32) ?
                      {(8'h9f)} : (reg23 ?
                          reg15 : (8'ha3))) >>> reg14[(2'h3):(2'h3)]) + (($unsigned(reg22) ?
                          $signed(wire4) : wire35) ?
                      wire37 : (wire8 ? $signed(wire3) : $signed((8'h9e))))));
  assign wire39 = ($signed(reg29[(3'h4):(1'h1)]) ?
                      $signed(reg15) : $unsigned($signed($signed($unsigned(reg21)))));
  assign wire40 = (|(&(8'haa)));
  assign wire41 = $signed(((8'hb5) ?
                      $unsigned(reg11) : (((reg19 + (8'hb2)) ~^ (reg29 + reg18)) ?
                          (wire4[(1'h0):(1'h0)] && reg26[(3'h4):(1'h1)]) : reg21)));
  always
    @(posedge clk) begin
      reg42 <= (&$signed(wire6));
    end
  assign wire43 = (reg19 <= (~($unsigned((reg11 >> (8'hab))) ?
                      ($unsigned((8'hb0)) ?
                          reg18[(4'hd):(1'h1)] : $unsigned(reg26)) : reg21[(1'h0):(1'h0)])));
  assign wire44 = ((~&$unsigned($unsigned($signed(wire33)))) ?
                      reg26 : ({(8'hb0), wire41} <= (((-reg31) ?
                          ((8'hb3) ?
                              (7'h40) : reg22) : (reg18 >>> wire1)) & (~^wire40[(1'h0):(1'h0)]))));
  assign wire45 = {reg12[(1'h0):(1'h0)],
                      $unsigned($signed((~|$signed(wire44))))};
  assign wire46 = $signed($signed((reg14 ?
                      (^~$unsigned(reg30)) : $unsigned((wire3 ?
                          (8'ha7) : reg12)))));
  always
    @(posedge clk) begin
      reg47 <= {($signed((reg19[(1'h1):(1'h1)] ? (|reg24) : {reg5, reg13})) ?
              (~&(~^{wire38, wire8})) : (~(~(~&wire35)))),
          $signed(reg29)};
      if (($signed($unsigned(wire33)) > $unsigned(wire33[(1'h0):(1'h0)])))
        begin
          if ($unsigned((-reg29)))
            begin
              reg48 <= reg28[(2'h3):(2'h2)];
              reg49 <= $unsigned((reg30 ?
                  reg16[(4'h8):(3'h5)] : $unsigned(({(7'h43)} ?
                      (reg25 ? reg12 : (8'h9f)) : $unsigned(wire44)))));
              reg50 <= $signed((((wire35 << $unsigned(reg14)) | (-(reg11 & (8'hab)))) ^ ($unsigned(wire1[(2'h3):(1'h1)]) ?
                  $signed($unsigned(reg17)) : $signed({(8'h9c)}))));
              reg51 <= $signed(wire43[(5'h13):(1'h0)]);
            end
          else
            begin
              reg48 <= (((|reg20[(4'ha):(3'h7)]) | (^~(reg24 ?
                      {reg42} : (8'hae)))) ?
                  $signed(((!$unsigned(wire45)) << ((~reg17) ?
                      (^~wire34) : wire39[(4'ha):(3'h4)]))) : (($unsigned((reg24 ?
                          reg16 : reg27)) >>> $unsigned(wire3[(2'h2):(1'h1)])) ?
                      reg47 : ($unsigned((~&reg49)) ?
                          $signed(reg20[(4'h9):(2'h2)]) : {reg32})));
              reg49 <= $signed($unsigned($unsigned(reg42[(4'h8):(3'h4)])));
              reg50 <= {wire45[(2'h3):(1'h0)]};
              reg51 <= (((reg29 <<< (^(!reg42))) < ((8'hbe) - reg30[(4'ha):(1'h1)])) == (wire33[(4'hd):(1'h1)] ?
                  (|(wire45 ? reg27 : $signed((8'ha8)))) : reg51));
              reg52 <= {(wire3 ~^ $signed(wire46)),
                  $unsigned((reg23 ?
                      ((8'hb5) ?
                          (wire34 >>> reg17) : (wire35 ^ reg12)) : $signed((reg17 ?
                          wire34 : wire6))))};
            end
          if (({$signed($signed(reg12)),
                  {(wire46[(2'h2):(1'h1)] ? $unsigned(reg16) : {wire43})}} ?
              $signed($unsigned(reg27[(4'hf):(1'h0)])) : ($signed($signed(reg52[(4'ha):(3'h4)])) ?
                  (+$unsigned($signed(reg47))) : (8'ha2))))
            begin
              reg53 <= reg10[(3'h6):(1'h0)];
              reg54 <= reg32[(4'h8):(3'h7)];
              reg55 <= (wire41[(4'ha):(3'h6)] | (((~|((7'h40) ?
                  wire37 : (8'ha7))) & ($signed(wire35) ?
                  wire4[(1'h1):(1'h0)] : (+wire44))) == reg24));
              reg56 <= reg21;
            end
          else
            begin
              reg53 <= $unsigned(reg27);
              reg54 <= $signed((8'h9d));
              reg55 <= ((wire8 ?
                  (reg55[(2'h2):(1'h0)] == (reg51[(4'h8):(4'h8)] ?
                      $signed((8'hb9)) : {reg31,
                          wire38})) : $signed((^(wire35 - reg53)))) - {$signed($unsigned((&wire36))),
                  reg29[(2'h3):(2'h2)]});
              reg56 <= wire34;
              reg57 <= wire33[(3'h5):(2'h2)];
            end
        end
      else
        begin
          reg48 <= ($unsigned(reg51[(4'hb):(3'h6)]) << $unsigned(((((8'hb1) ?
                      wire35 : wire6) ?
                  $unsigned(reg14) : (reg21 ? reg16 : reg22)) ?
              (reg48[(3'h5):(3'h5)] ?
                  (reg29 ?
                      reg19 : wire43) : {(8'ha6)}) : $unsigned((!reg30)))));
          reg49 <= (-{wire38[(3'h7):(3'h5)],
              ($signed({reg12}) + ((wire45 ? wire41 : wire0) ?
                  {reg13, reg50} : (wire38 ? reg9 : reg21)))});
        end
      if ($unsigned(reg49[(3'h4):(1'h1)]))
        begin
          if ($signed($unsigned(wire41)))
            begin
              reg58 <= ($unsigned((~(~|reg50))) ?
                  (reg22 ?
                      (^(|(+reg24))) : wire2[(4'hc):(4'hc)]) : $unsigned($unsigned($unsigned(wire38[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg58 <= $signed($signed(($unsigned((reg28 || reg24)) ?
                  (7'h40) : $unsigned((reg30 ? (8'hbc) : wire34)))));
            end
        end
      else
        begin
          reg58 <= $unsigned(reg48[(2'h3):(2'h2)]);
          reg59 <= {$signed((!{(reg49 ? wire38 : wire40), {wire0}})),
              $unsigned($signed(({wire1, reg18} ?
                  (reg20 ? reg18 : reg58) : (wire37 >>> reg28))))};
          reg60 <= $unsigned(reg24[(2'h2):(1'h1)]);
          if ((reg56[(1'h1):(1'h1)] ?
              ({(7'h42)} ? reg57 : reg10[(4'h8):(3'h5)]) : ((8'hb6) ?
                  {$unsigned(wire36)} : $signed($unsigned($unsigned(reg56))))))
            begin
              reg61 <= wire34;
              reg62 <= $signed(reg5);
              reg63 <= (((^~wire40[(1'h1):(1'h1)]) ?
                      wire40[(2'h2):(2'h2)] : reg12[(2'h3):(2'h3)]) ?
                  {(&{$signed((8'hab))}),
                      $unsigned((reg17 ?
                          (wire0 ?
                              reg22 : reg62) : (~^wire2)))} : (($unsigned(wire2[(4'hb):(2'h2)]) ?
                      reg56[(1'h1):(1'h0)] : (((8'hab) ^~ (8'haa)) ?
                          (wire6 | reg12) : (wire6 ?
                              (8'haf) : wire39))) ^~ $unsigned($signed((reg11 ?
                      wire39 : wire45)))));
              reg64 <= $signed($signed(reg24));
              reg65 <= $signed(reg19[(2'h2):(1'h1)]);
            end
          else
            begin
              reg61 <= reg24;
              reg62 <= reg48[(2'h3):(1'h0)];
              reg63 <= reg61[(1'h0):(1'h0)];
              reg64 <= ({{reg47[(4'hd):(4'hb)], reg32[(1'h0):(1'h0)]}} ?
                  ((((8'ha0) ? {wire45, reg62} : $signed((8'hb3))) ?
                          $signed((reg13 >>> reg63)) : wire38) ?
                      (reg49 ?
                          $unsigned(reg64[(1'h0):(1'h0)]) : $signed($signed(wire33))) : $unsigned($signed(((8'hb8) + reg53)))) : $signed($signed((~&(reg42 ?
                      reg22 : reg9)))));
              reg65 <= {(&(wire8 ? (-$signed(reg16)) : reg24[(2'h2):(1'h1)])),
                  (reg24[(1'h1):(1'h1)] ?
                      reg28 : ($unsigned($unsigned((8'ha6))) + wire39[(3'h6):(1'h0)]))};
            end
        end
      reg66 <= reg22[(2'h2):(1'h0)];
    end
  assign wire67 = ((wire8 ?
                          (((7'h40) ?
                              (wire43 ?
                                  reg64 : wire0) : $unsigned(reg26)) != $unsigned($signed(reg5))) : {($signed((8'h9c)) ?
                                  $signed(reg63) : $signed(reg52))}) ?
                      reg16 : $unsigned({(7'h42), {(wire37 >> reg57)}}));
  assign wire68 = reg10[(1'h1):(1'h1)];
  assign wire69 = $signed((({$signed(reg54),
                          reg28} < $unsigned(wire68[(3'h7):(2'h3)])) ?
                      reg31[(2'h3):(2'h2)] : (~&$unsigned($unsigned(reg56)))));
endmodule
