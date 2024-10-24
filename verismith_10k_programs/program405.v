module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire49;
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire13,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire49,
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
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire3[(1'h0):(1'h0)];
  assign wire5 = wire0[(4'hc):(4'hb)];
  assign wire6 = wire1[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (wire1[(1'h1):(1'h0)])
        begin
          reg7 <= wire5[(1'h0):(1'h0)];
          if ({(({wire1, $signed(wire0)} - wire2) ?
                  (wire2[(4'h9):(3'h5)] ?
                      wire0 : {wire4[(1'h1):(1'h1)]}) : wire6),
              wire5})
            begin
              reg8 <= $signed((~|{(wire1 | (wire2 ? reg7 : wire4)),
                  (^~((8'h9c) ~^ (8'ha9)))}));
              reg9 <= wire5;
              reg10 <= $unsigned(wire0);
              reg11 <= (reg9[(2'h2):(1'h1)] - ({($unsigned((8'h9e)) < wire2),
                      ((wire4 == (8'hb6)) ? wire1 : (~^(8'hb0)))} ?
                  $unsigned((reg10 < (^~reg7))) : ({wire0} ?
                      reg8 : reg8[(3'h7):(1'h0)])));
            end
          else
            begin
              reg8 <= (^~((^((-reg8) ?
                  {wire3, (8'hbb)} : reg8[(1'h1):(1'h0)])) != ({{reg7, reg7}} ?
                  $unsigned($unsigned(reg8)) : {(wire2 ? wire6 : (8'hbc))})));
            end
          reg12 <= $signed(((-(~^$unsigned(reg7))) ?
              ((((8'hb6) ? reg11 : wire2) ?
                  (wire3 >= wire0) : (wire6 + wire4)) | ((reg10 ?
                      wire0 : wire4) ?
                  $signed(reg10) : $unsigned((8'ha4)))) : {(reg8[(2'h3):(1'h1)] ?
                      {reg8} : (reg7 + wire2)),
                  {reg8}}));
        end
      else
        begin
          if ({(&reg9[(2'h3):(2'h3)])})
            begin
              reg7 <= reg7[(2'h2):(2'h2)];
              reg8 <= reg12;
            end
          else
            begin
              reg7 <= {$unsigned(wire6)};
            end
          if ((~|wire1))
            begin
              reg9 <= ((^~{{wire0}}) * reg8);
              reg10 <= wire5[(1'h0):(1'h0)];
              reg11 <= $unsigned({(reg8 ?
                      wire5 : $unsigned((wire6 ? wire3 : wire6)))});
            end
          else
            begin
              reg9 <= (reg7 ?
                  $unsigned((((wire4 ? wire0 : wire2) ?
                          (~^reg8) : ((8'ha3) * wire2)) ?
                      (~$unsigned(reg10)) : {(wire0 == (8'hb5)),
                          reg10[(4'hc):(3'h5)]})) : reg11);
              reg10 <= (^~($signed(reg11) * ({reg10} ?
                  (!reg11[(3'h7):(3'h6)]) : reg11[(4'h8):(4'h8)])));
            end
        end
    end
  assign wire13 = (+wire5[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg14 <= wire5;
      reg15 <= $signed(((~&((wire0 ^~ wire5) ? (reg9 >> reg14) : (!wire3))) ?
          $unsigned(((7'h40) ? (-wire13) : wire1)) : (^reg9[(2'h2):(1'h0)])));
    end
  assign wire16 = $signed({reg15[(1'h1):(1'h1)]});
  assign wire17 = $unsigned(wire3);
  assign wire18 = (~&((&wire5[(1'h0):(1'h0)]) >>> (((&reg7) > ((8'h9c) ?
                          (8'hb9) : reg10)) ?
                      (8'h9d) : wire3[(2'h2):(1'h0)])));
  assign wire19 = $signed(($signed($unsigned($signed(wire6))) ?
                      reg15 : $unsigned(wire2)));
  assign wire20 = wire17[(1'h1):(1'h1)];
  assign wire21 = (~^(wire1 ^ (wire1 ?
                      $unsigned({reg14}) : (reg15[(1'h1):(1'h1)] ^ {(8'hb6),
                          wire17}))));
  assign wire22 = (wire3 + $signed(($unsigned((reg12 ^ reg10)) ?
                      (^$signed(reg7)) : wire17[(1'h0):(1'h0)])));
  module23 #() modinst50 (wire49, clk, wire6, reg15, reg10, wire2, wire19);
  always
    @(posedge clk) begin
      reg51 <= wire22[(2'h3):(1'h1)];
    end
  always
    @(posedge clk) begin
      if (reg51[(3'h6):(1'h1)])
        begin
          reg52 <= {reg11[(1'h0):(1'h0)]};
        end
      else
        begin
          reg52 <= reg15[(3'h7):(2'h2)];
          reg53 <= wire19[(1'h1):(1'h0)];
          reg54 <= $signed((reg53 ~^ wire5[(1'h0):(1'h0)]));
          reg55 <= wire22[(4'h9):(2'h2)];
        end
      reg56 <= $unsigned($unsigned((~((~wire17) < wire5))));
      reg57 <= $signed(wire16);
      reg58 <= $signed((^wire20[(4'h8):(1'h1)]));
      if ($unsigned(reg9[(3'h4):(3'h4)]))
        begin
          if ((&reg15))
            begin
              reg59 <= (~^$signed($unsigned(wire2[(4'h9):(3'h5)])));
              reg60 <= reg14[(3'h4):(1'h1)];
            end
          else
            begin
              reg59 <= reg57;
            end
          reg61 <= ($unsigned(($unsigned((wire16 >>> (8'ha0))) != (8'had))) ?
              (!$unsigned((wire20[(2'h2):(2'h2)] >= $signed(wire18)))) : reg60[(3'h6):(3'h4)]);
        end
      else
        begin
          reg59 <= reg58[(1'h0):(1'h0)];
          reg60 <= $signed((8'hb9));
          reg61 <= ((^wire4[(2'h2):(1'h1)]) >>> ({wire4[(1'h0):(1'h0)],
                  (&reg12)} ?
              (((reg61 | reg10) ~^ (|(8'hba))) ?
                  {$signed(reg11),
                      (-wire1)} : reg7) : (($unsigned(wire1) >> (wire22 ?
                      (8'hb8) : reg57)) ?
                  reg15[(3'h6):(3'h4)] : wire3)));
          reg62 <= reg60[(3'h5):(2'h2)];
        end
    end
endmodule

module module23  (y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  assign y = {wire40,
                 wire39,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= {wire25[(4'hc):(4'h9)], $signed(wire28[(3'h4):(2'h2)])};
      if ((8'h9e))
        begin
          if ({$signed((~&$unsigned((wire28 ? (7'h42) : wire25)))), (8'haa)})
            begin
              reg30 <= $signed((!wire27[(2'h2):(2'h2)]));
              reg31 <= wire26;
              reg32 <= $signed($unsigned($unsigned((wire27 ?
                  wire25[(3'h7):(1'h0)] : wire24[(4'ha):(3'h4)]))));
              reg33 <= (wire26 && $signed(reg32));
            end
          else
            begin
              reg30 <= ((8'had) * (((reg30 >= (wire27 * wire25)) >>> ((^wire24) ^ $signed(reg31))) ?
                  (-{(&reg32)}) : {((reg31 ? reg31 : (8'haa)) ?
                          wire28 : (8'h9c)),
                      (-(^~(8'ha5)))}));
              reg31 <= {$signed($unsigned((^$signed((8'ha3))))),
                  $signed(($signed($signed(wire25)) * ({(8'hba), wire27} ?
                      (wire28 <<< wire24) : wire28[(1'h1):(1'h1)])))};
              reg32 <= $unsigned((-($signed((reg32 ?
                  reg32 : reg32)) >> ((wire24 ? wire24 : wire26) ?
                  (wire28 ? wire28 : wire26) : (!wire26)))));
              reg33 <= reg30;
              reg34 <= wire28[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg30 <= wire28[(1'h0):(1'h0)];
          reg31 <= $unsigned($unsigned((((reg30 ?
              reg29 : reg32) - $unsigned(wire26)) >>> ($unsigned(reg30) ^~ reg29[(2'h3):(1'h1)]))));
          if (wire27)
            begin
              reg32 <= ((((^(|reg31)) ^~ (((8'h9f) > wire26) + $unsigned(wire26))) ?
                      {wire25} : (^(&wire27[(3'h5):(2'h3)]))) ?
                  $unsigned($unsigned((-{wire27}))) : $signed({$signed($unsigned(reg33))}));
              reg33 <= $unsigned($signed(reg31));
              reg34 <= wire24[(5'h10):(4'h9)];
              reg35 <= (reg33 + $signed($unsigned((reg30[(2'h3):(1'h0)] << wire24[(3'h7):(2'h3)]))));
            end
          else
            begin
              reg32 <= reg32[(4'hb):(4'h8)];
              reg33 <= $signed(reg35);
              reg34 <= ($unsigned({reg29[(3'h6):(3'h4)],
                      $unsigned((-wire25))}) ?
                  reg35 : $signed({($unsigned(wire27) >= $signed(reg34)),
                      (|(reg32 ? (8'ha1) : reg32))}));
              reg35 <= $unsigned(wire27);
            end
          reg36 <= (!($signed(((wire27 ? (7'h41) : reg34) ?
                  (wire24 * (8'h9d)) : $signed(reg35))) ?
              ($signed({reg31, wire27}) ?
                  $unsigned($signed(reg35)) : reg33[(1'h1):(1'h0)]) : reg33[(1'h1):(1'h0)]));
        end
      reg37 <= ($signed(((((8'hb5) ~^ wire25) - (wire26 ? wire27 : reg35)) ?
              wire27 : wire25)) ?
          wire24 : (~^$signed((wire28 || (reg30 <<< (8'ha4))))));
      reg38 <= (reg32[(5'h11):(1'h0)] ? wire24[(2'h2):(1'h0)] : (8'hb9));
    end
  assign wire39 = $signed(($signed({reg33,
                      ((8'hac) ?
                          wire28 : (8'ha3))}) ^~ $unsigned($unsigned((^~wire25)))));
  assign wire40 = $unsigned((~&(+$unsigned((wire25 ? reg31 : reg34)))));
  always
    @(posedge clk) begin
      if (wire28)
        begin
          reg41 <= $unsigned(reg30[(4'h8):(3'h5)]);
          reg42 <= $unsigned(reg33[(1'h0):(1'h0)]);
          if ((((reg34 ? $unsigned((wire40 << reg37)) : reg31) ?
                  (reg31[(3'h6):(1'h1)] >>> reg33[(4'hc):(2'h2)]) : ($signed(wire40) ?
                      $signed((&wire28)) : reg29[(3'h4):(3'h4)])) ?
              ({reg31[(2'h2):(1'h0)],
                  $signed((~^reg36))} & wire28[(1'h0):(1'h0)]) : reg37[(1'h0):(1'h0)]))
            begin
              reg43 <= $signed((wire26[(1'h1):(1'h0)] ?
                  (wire40[(3'h4):(1'h0)] == reg35[(1'h1):(1'h0)]) : (((reg38 | (7'h41)) ~^ $unsigned(reg42)) ?
                      (+wire25[(4'ha):(3'h7)]) : (~|wire24[(4'hb):(3'h5)]))));
            end
          else
            begin
              reg43 <= ($unsigned(reg29[(1'h0):(1'h0)]) <<< ($unsigned({((7'h42) ?
                      (8'hbb) : reg29),
                  $signed(wire26)}) >= $unsigned(reg43[(4'hb):(4'h8)])));
            end
          reg44 <= $unsigned(reg38);
          reg45 <= $signed(($signed($unsigned(wire28)) ?
              (8'hb0) : ($signed($signed(wire40)) ?
                  reg41[(1'h0):(1'h0)] : $unsigned((reg30 ?
                      (8'hbe) : reg35)))));
        end
      else
        begin
          reg41 <= (reg29 ? reg33[(3'h4):(1'h0)] : reg38[(4'h8):(3'h4)]);
          reg42 <= (8'ha9);
          reg43 <= $unsigned($signed(reg45[(1'h0):(1'h0)]));
          reg44 <= wire25[(2'h2):(1'h0)];
          reg45 <= $unsigned($signed((8'hbe)));
        end
      reg46 <= wire27;
      reg47 <= (~^reg34[(4'h9):(3'h4)]);
      reg48 <= $unsigned(((wire24 > reg44) >> $signed(reg35[(1'h1):(1'h0)])));
    end
endmodule
