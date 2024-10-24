module top
#(parameter param40 = (^(({((8'h9e) || (8'hb6))} == ((|(8'hb2)) ? (&(8'ha2)) : ((8'ha2) ~^ (7'h43)))) || (~|{((8'ha1) ? (8'ha5) : (8'hb7))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire5,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ($signed(wire0[(4'hc):(2'h2)]) ^ $unsigned($unsigned($unsigned(wire3[(4'h9):(4'h8)]))));
  always
    @(posedge clk) begin
      if ($signed(wire1[(4'ha):(4'h8)]))
        begin
          reg6 <= ((wire0[(4'hc):(1'h1)] ?
                  {wire0[(4'h9):(3'h5)], wire1} : wire5[(4'ha):(4'h8)]) ?
              $signed(wire0[(1'h1):(1'h0)]) : wire5[(4'h9):(3'h5)]);
        end
      else
        begin
          reg6 <= (wire2[(2'h3):(2'h2)] & $unsigned(wire4));
          reg7 <= ((7'h42) - wire4[(3'h6):(1'h0)]);
        end
      if ($signed(wire4))
        begin
          reg8 <= $unsigned($signed($unsigned($signed((&wire0)))));
        end
      else
        begin
          reg8 <= $signed(reg6[(1'h1):(1'h0)]);
          if ($unsigned($unsigned(wire2[(3'h7):(1'h0)])))
            begin
              reg9 <= (wire2 ?
                  $unsigned((wire2 && {(reg6 ?
                          reg8 : reg7)})) : (($signed((!wire3)) ?
                          ($unsigned(reg7) & $unsigned(wire4)) : (|wire1[(4'h8):(3'h6)])) ?
                      ($unsigned($unsigned((8'ha9))) <= (!{wire2,
                          reg7})) : (~|((reg7 ? wire0 : wire3) ?
                          wire5[(1'h0):(1'h0)] : wire1[(1'h1):(1'h1)]))));
              reg10 <= wire0[(2'h2):(2'h2)];
              reg11 <= (~^$unsigned(reg10));
            end
          else
            begin
              reg9 <= $signed($unsigned($unsigned((+$signed((7'h43))))));
              reg10 <= $unsigned($signed(reg10[(1'h0):(1'h0)]));
              reg11 <= $signed((~wire1[(3'h6):(3'h6)]));
              reg12 <= wire3;
              reg13 <= (+(($unsigned(wire4[(4'h9):(2'h2)]) ^~ ($unsigned(reg10) ?
                  (reg7 ?
                      wire4 : reg11) : (^(8'h9d)))) ^~ wire0[(2'h3):(2'h2)]));
            end
          if (((&($unsigned(reg6) ?
              reg10 : {$unsigned(reg6), $unsigned(wire5)})) > wire3))
            begin
              reg14 <= $signed((~^{$unsigned($unsigned(reg12))}));
              reg15 <= $signed($signed(reg8[(3'h7):(2'h3)]));
              reg16 <= reg12[(4'h9):(4'h9)];
              reg17 <= ($unsigned(wire1) | (reg11 <= {((reg7 ?
                      reg9 : reg13) <<< (+reg9)),
                  reg13}));
            end
          else
            begin
              reg14 <= {{(~|wire1[(2'h2):(2'h2)]),
                      ((reg17[(5'h10):(3'h6)] ?
                              (reg15 & reg12) : (reg8 ? reg7 : reg14)) ?
                          (8'hbf) : wire3)}};
              reg15 <= ({$signed($unsigned({reg13, reg15})),
                  (^~$unsigned($unsigned(reg13)))} | {(reg16 ?
                      $unsigned(reg9) : $signed(reg8[(3'h5):(2'h2)]))});
              reg16 <= reg10[(4'hb):(4'hb)];
            end
        end
      reg18 <= ((|($unsigned((~|reg16)) ?
          $unsigned($unsigned(wire3)) : reg11)) ^ $signed($unsigned($unsigned((~&reg7)))));
    end
  assign wire19 = (^~(($unsigned((reg17 - reg10)) ?
                      reg13 : (~^reg6[(1'h1):(1'h1)])) ~^ ({reg16[(3'h6):(3'h5)],
                          (reg12 ? reg15 : (8'hb9))} ?
                      $unsigned(wire0[(4'h8):(4'h8)]) : reg11)));
  assign wire20 = (7'h42);
  assign wire21 = (+wire3);
  assign wire22 = ((reg12 + wire0[(4'hb):(3'h5)]) != wire21);
  assign wire23 = (reg8 ?
                      ($signed(reg18[(4'h9):(2'h3)]) ?
                          {((&(8'ha8)) >>> reg6),
                              $unsigned({(8'hac), reg8})} : (8'hba)) : reg11);
  always
    @(posedge clk) begin
      reg24 <= reg8;
      reg25 <= (((&wire23[(4'hb):(3'h5)]) ?
              ((reg13 && wire2) & $signed({reg17,
                  reg12})) : ((~&$unsigned(wire21)) ?
                  (wire1 ?
                      ((8'hb3) ?
                          reg17 : wire22) : reg15[(3'h6):(3'h5)]) : (+(reg16 >> wire19)))) ?
          $signed(($signed((~|(8'had))) < $signed((reg24 * wire1)))) : $unsigned(reg10));
      if ($unsigned(wire1[(3'h5):(3'h5)]))
        begin
          if (($signed({$unsigned($signed(reg16))}) ?
              ((wire4[(3'h6):(2'h2)] ?
                  $signed((wire19 || wire3)) : ((wire20 & reg17) * (wire2 ?
                      reg14 : reg6))) > $signed($unsigned($signed(wire21)))) : reg6))
            begin
              reg26 <= $unsigned($unsigned((^((wire0 <<< wire5) ?
                  (reg25 ? (8'ha2) : wire22) : $signed((8'ha1))))));
              reg27 <= wire20[(1'h1):(1'h0)];
              reg28 <= reg17[(3'h6):(1'h1)];
            end
          else
            begin
              reg26 <= $signed($signed(wire22[(2'h2):(1'h1)]));
              reg27 <= {(($unsigned((wire2 != wire5)) < (8'hb2)) >> reg26[(2'h2):(1'h1)])};
              reg28 <= wire4[(3'h4):(3'h4)];
              reg29 <= (^~$signed(((~|$unsigned(reg12)) ?
                  reg26[(1'h0):(1'h0)] : {(reg8 ? reg27 : reg14)})));
            end
          reg30 <= ((reg17[(5'h15):(2'h2)] ^~ $unsigned(reg10)) >>> ($signed($signed(reg10[(2'h2):(1'h1)])) ?
              $signed($signed(((8'hbd) ?
                  (7'h44) : reg10))) : {(!$unsigned(reg9)), (~|(7'h42))}));
          reg31 <= ((8'hab) ? reg28[(3'h6):(1'h1)] : $signed(reg29));
        end
      else
        begin
          reg26 <= (~reg13);
          reg27 <= $unsigned((wire0[(3'h5):(1'h1)] ?
              (^~reg26[(1'h1):(1'h0)]) : ((8'hba) ?
                  ($signed(reg9) <<< (&reg31)) : (reg28 + (reg30 ?
                      wire20 : wire23)))));
          reg28 <= wire23[(4'hc):(4'h9)];
          reg29 <= {(^$signed($signed((-reg7)))), reg7[(1'h0):(1'h0)]};
        end
      reg32 <= reg26[(1'h1):(1'h0)];
      if (reg6[(4'hc):(3'h6)])
        begin
          reg33 <= $signed({$unsigned((&wire3))});
        end
      else
        begin
          reg33 <= $signed((&wire20));
          reg34 <= $signed(reg25[(4'he):(4'hb)]);
          reg35 <= {$unsigned($signed((reg24 ^ $unsigned((8'ha2))))), reg18};
          reg36 <= {$unsigned(wire22)};
          reg37 <= {$unsigned((reg12[(4'hb):(4'h9)] >>> reg12[(1'h0):(1'h0)]))};
        end
    end
  assign wire38 = $signed((8'hb4));
  assign wire39 = {(~|{(&$signed(wire2))})};
endmodule
