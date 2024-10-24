module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire28,
                 wire27,
                 wire17,
                 wire16,
                 wire15,
                 wire5,
                 wire4,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned(($unsigned((((8'ha2) > wire0) & wire2)) >> $unsigned(({wire3,
                     wire3} ^ ((8'hb8) - wire3)))));
  assign wire5 = (wire2[(4'h9):(2'h3)] ~^ ({wire0} || wire0[(3'h4):(1'h0)]));
  always
    @(posedge clk) begin
      reg6 <= $signed(((~|(~(^wire1))) | {$signed($unsigned(wire4))}));
      reg7 <= $signed(wire5);
      if ((reg7 <= {{wire0[(3'h4):(3'h4)]}, wire3}))
        begin
          reg8 <= {(wire2 ? (~|((wire3 ? wire2 : wire3) <<< (~|wire2))) : reg7),
              (~&(7'h44))};
          reg9 <= (wire1 ?
              wire2[(4'hc):(4'hb)] : $signed($unsigned(wire4[(3'h5):(3'h5)])));
          reg10 <= (^~reg8);
        end
      else
        begin
          reg8 <= reg10;
          reg9 <= $signed($signed((+(!$unsigned(reg8)))));
          reg10 <= (~&wire5);
          reg11 <= ((wire4 ?
              (~^(-(~^wire4))) : ((+wire2[(3'h6):(1'h0)]) ?
                  ($unsigned(wire1) ?
                      (|reg9) : $signed(reg6)) : (&(^~reg9)))) <= (~{$unsigned((reg7 ^~ (8'had)))}));
          reg12 <= $unsigned(({reg8} ?
              (({reg7,
                  reg7} ^ (reg8 | (8'h9c))) || $signed((|reg8))) : $unsigned((reg10[(4'hb):(4'hb)] - reg10[(1'h0):(1'h0)]))));
        end
      reg13 <= reg7[(1'h1):(1'h0)];
      reg14 <= reg11;
    end
  assign wire15 = reg6[(1'h0):(1'h0)];
  assign wire16 = ($signed($unsigned($unsigned((reg14 ? reg11 : reg8)))) ?
                      (~$signed({reg14})) : reg9);
  assign wire17 = (8'hbd);
  always
    @(posedge clk) begin
      if (reg12)
        begin
          reg18 <= (!{((reg12 + reg12[(2'h3):(2'h3)]) ?
                  reg10[(4'h8):(3'h7)] : (-$unsigned(wire16))),
              reg13[(3'h7):(2'h2)]});
          reg19 <= ($unsigned($unsigned({(~wire16)})) ?
              $signed((-$signed(reg10[(3'h4):(1'h1)]))) : $unsigned($signed(wire1[(1'h0):(1'h0)])));
          reg20 <= (~$signed($signed(((wire0 ? wire3 : reg6) <<< (^~wire0)))));
          reg21 <= wire4[(2'h2):(2'h2)];
          reg22 <= reg20;
        end
      else
        begin
          reg18 <= (8'hbc);
          reg19 <= $unsigned($unsigned(((&((8'h9d) ~^ reg8)) - {$unsigned(reg21),
              $signed(reg10)})));
          if (wire17[(2'h2):(1'h1)])
            begin
              reg20 <= (|wire17);
              reg21 <= $unsigned((^reg10[(3'h4):(1'h1)]));
            end
          else
            begin
              reg20 <= $signed($signed(wire0[(1'h1):(1'h0)]));
              reg21 <= $unsigned($signed((&(reg22 >> (reg10 ?
                  reg11 : reg20)))));
              reg22 <= $unsigned($signed(({$unsigned(wire1)} >>> reg19[(3'h6):(2'h2)])));
              reg23 <= reg10[(2'h2):(2'h2)];
            end
        end
      reg24 <= $unsigned($signed(reg23));
      reg25 <= $unsigned(wire17);
      reg26 <= (~(&$signed($unsigned((~reg20)))));
    end
  assign wire27 = $unsigned($signed((^~{wire15, (|(7'h41))})));
  assign wire28 = wire0[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg29 <= $signed(reg12);
      if ($unsigned(wire0[(1'h0):(1'h0)]))
        begin
          reg30 <= wire28[(3'h7):(1'h1)];
        end
      else
        begin
          reg30 <= reg24[(3'h7):(1'h1)];
        end
      if ((-$signed(($signed((reg6 & wire4)) != $unsigned((|wire17))))))
        begin
          reg31 <= $signed($unsigned(((&(wire2 ?
              reg9 : wire2)) ^ $signed((+reg21)))));
        end
      else
        begin
          reg31 <= $unsigned(((reg8 - reg21[(1'h1):(1'h1)]) <<< reg29[(4'hb):(4'h9)]));
          reg32 <= reg10[(3'h5):(2'h2)];
        end
      reg33 <= (!$unsigned(reg9));
    end
  assign wire34 = (reg19 << ($unsigned({reg10, ((7'h41) ? wire2 : reg11)}) ?
                      ($signed((wire4 ? reg10 : reg19)) ?
                          (^~(reg33 ?
                              reg13 : reg20)) : reg20[(2'h3):(2'h3)]) : (8'hb6)));
  assign wire35 = ($unsigned({reg25[(4'he):(4'h9)]}) << $unsigned($unsigned(wire2)));
  assign wire36 = reg31;
  assign wire37 = $unsigned($signed(wire35));
  assign wire38 = (!wire4);
  assign wire39 = $signed($unsigned($unsigned(((!reg20) ?
                      (~^reg12) : (wire36 ? (8'haf) : reg24)))));
  assign wire40 = (&wire3[(4'h8):(4'h8)]);
  assign wire41 = {(($signed(wire3) == ({(8'hbb), wire28} <<< ((8'hb8) ?
                          (8'hbe) : (7'h41)))) >= (-(~wire34[(3'h7):(1'h1)])))};
  assign wire42 = (!((((8'hb3) & (wire34 ? reg32 : reg19)) ?
                      ({wire4,
                          reg8} == reg31) : (|wire34[(4'h9):(1'h1)])) && (+(~$signed(wire28)))));
  assign wire43 = ($unsigned(reg30[(3'h7):(3'h5)]) ?
                      (($signed(reg8[(4'h8):(3'h4)]) ?
                              (~&(wire4 ?
                                  wire15 : wire5)) : $unsigned(reg24[(3'h4):(1'h1)])) ?
                          ($unsigned(wire3[(3'h4):(3'h4)]) ?
                              reg25[(1'h0):(1'h0)] : wire35) : (reg31 ^ (wire27[(4'h8):(3'h4)] ?
                              (wire42 << reg13) : reg12))) : $signed(wire34[(2'h3):(1'h1)]));
  assign wire44 = (^(!(($unsigned((8'h9d)) > wire15) ?
                      reg22[(4'h8):(1'h0)] : $signed($unsigned(wire27)))));
  assign wire45 = reg6;
  assign wire46 = (~^(~&(wire35 ?
                      $signed(((8'hac) >>> reg31)) : ($signed(reg33) || wire38))));
endmodule
