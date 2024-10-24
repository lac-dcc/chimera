module top
#(parameter param54 = (((~|((^~(8'hb4)) << ((8'ha7) ^~ (7'h42)))) <= ({(^(8'ha8))} ? {((8'hb3) ? (8'hb9) : (7'h44))} : (((8'haf) ^~ (8'hb1)) ? ((8'hbe) >>> (8'ha1)) : ((8'hbf) ? (7'h41) : (8'ha2))))) ? (^{(^~(~&(8'hbf))), ((^~(8'hb0)) && ((7'h44) ? (8'ha9) : (8'hb0)))}) : (!(({(8'hb8), (8'hb2)} ? {(8'hb2)} : (^~(7'h43))) ? (((7'h41) ? (8'hb7) : (8'hbc)) || (-(7'h43))) : {(^~(8'ha4))}))), 
parameter param55 = param54)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h260):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire53,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 reg23,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0;
      reg6 <= wire3;
      reg7 <= {$signed($unsigned((8'hba)))};
      if ({wire0[(4'hf):(2'h3)], wire4[(2'h2):(2'h2)]})
        begin
          if ($signed($unsigned($unsigned($unsigned($unsigned((8'hbe)))))))
            begin
              reg8 <= ((($signed($unsigned(reg7)) * $unsigned((reg7 < reg6))) ~^ {(~^{wire4})}) | $unsigned(wire2));
              reg9 <= (!$signed((^~(~&$signed((8'ha2))))));
              reg10 <= {$unsigned((wire2[(1'h0):(1'h0)] ?
                      (+((8'h9e) ? reg9 : reg9)) : wire3))};
              reg11 <= (~{reg6});
              reg12 <= wire1;
            end
          else
            begin
              reg8 <= $signed((&reg12));
            end
          reg13 <= $unsigned(reg10);
          reg14 <= reg8;
        end
      else
        begin
          reg8 <= {reg11[(3'h4):(1'h0)],
              ((~^((8'ha9) ?
                  ((8'hbe) != (7'h44)) : (~^reg9))) || $signed(wire1))};
          reg9 <= ({{(reg11[(1'h0):(1'h0)] ?
                          reg6[(3'h6):(2'h3)] : (reg6 - reg5)),
                      $signed($signed(wire3))}} ?
              $unsigned(wire2) : $unsigned({($signed(wire2) ?
                      (wire2 <= wire0) : $unsigned(reg12))}));
          reg10 <= (8'h9c);
        end
      reg15 <= (7'h40);
    end
  assign wire16 = reg6[(3'h5):(1'h0)];
  assign wire17 = {(~|$signed((((8'hb2) ? reg10 : wire0) ?
                          (~^(8'h9e)) : wire1[(1'h0):(1'h0)])))};
  assign wire18 = $signed((!$signed($signed((~^wire17)))));
  assign wire19 = $unsigned(reg9);
  assign wire20 = ((7'h43) ?
                      $signed(wire19) : ((wire19[(4'hd):(4'hd)] ?
                              (^{reg6, (8'ha8)}) : reg8) ?
                          wire17[(5'h13):(3'h6)] : wire19));
  assign wire21 = $unsigned((8'hbc));
  assign wire22 = (~|($unsigned($signed(wire2)) ?
                      ($unsigned($unsigned(reg6)) ?
                          (~^$signed(wire17)) : $unsigned($unsigned((7'h40)))) : ((wire3 ?
                              (-reg8) : (^~wire19)) ?
                          (|wire2) : wire18[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg23 <= wire17;
      reg24 <= ((reg23 >>> $unsigned($unsigned(reg6[(1'h1):(1'h0)]))) ?
          wire0[(1'h1):(1'h0)] : {reg15});
      if (($signed(($signed((~^wire20)) <= wire20[(4'he):(1'h0)])) + reg9[(2'h2):(2'h2)]))
        begin
          if (reg9[(1'h1):(1'h1)])
            begin
              reg25 <= wire21;
              reg26 <= (+reg7);
              reg27 <= wire22[(2'h3):(1'h1)];
              reg28 <= $unsigned($signed($signed({reg5[(4'he):(4'hb)]})));
              reg29 <= wire17;
            end
          else
            begin
              reg25 <= $signed((wire22[(3'h5):(3'h5)] ? wire18 : wire4));
              reg26 <= reg23;
              reg27 <= $signed(reg5);
            end
          reg30 <= (~&(($signed($signed(reg24)) ?
                  (wire4[(4'ha):(1'h1)] ?
                      $unsigned(wire19) : (reg28 ?
                          reg26 : reg7)) : ($unsigned(wire3) ?
                      (&wire21) : (&reg28))) ?
              {$unsigned(wire1[(2'h2):(2'h2)]),
                  $signed(reg11)} : $signed((^(!wire4)))));
        end
      else
        begin
          reg25 <= (-(reg8[(4'hf):(2'h3)] | reg26[(2'h3):(2'h3)]));
          reg26 <= reg6;
          reg27 <= $unsigned(reg11);
          reg28 <= wire17[(5'h12):(1'h0)];
          reg29 <= ($signed(($unsigned((reg12 ? (8'hbd) : reg15)) ?
                  {reg7[(3'h5):(3'h4)]} : ($signed(reg9) ?
                      $unsigned(wire3) : $signed(reg13)))) ?
              reg8 : (!{$unsigned((reg24 ^ reg5)), {reg30}}));
        end
      reg31 <= $signed(($signed(reg13) + ({$signed(reg28)} ?
          reg25 : (reg8 ? ((8'hbd) ? reg27 : reg28) : (|wire1)))));
    end
  always
    @(posedge clk) begin
      if (wire22[(4'h9):(4'h9)])
        begin
          reg32 <= wire0;
          reg33 <= (($unsigned((^~wire21[(3'h6):(2'h3)])) ?
                  (8'ha2) : (^reg23)) ?
              (^$unsigned(wire0[(1'h1):(1'h1)])) : $unsigned((wire0 ?
                  $signed(wire18) : ((reg23 ?
                      (8'h9e) : wire2) < $unsigned(reg31)))));
          reg34 <= reg8;
          if ($signed(reg26[(2'h3):(2'h3)]))
            begin
              reg35 <= $signed((~^$signed($signed(((8'hae) ? reg31 : reg6)))));
              reg36 <= $unsigned((($unsigned($signed(wire1)) ?
                      $unsigned(reg8[(4'hc):(3'h4)]) : $unsigned($unsigned(wire19))) ?
                  reg11 : ((-reg25) ?
                      (~|(reg35 ? reg33 : (8'h9d))) : ({(8'h9e)} ^ wire21))));
              reg37 <= $signed(($signed($unsigned(wire1)) + $unsigned({(reg35 + reg10)})));
              reg38 <= reg25;
            end
          else
            begin
              reg35 <= (^($signed($signed($unsigned(reg14))) ?
                  reg25 : (((~^wire20) >= (wire1 ?
                      reg35 : reg10)) ~^ {(^reg38)})));
            end
        end
      else
        begin
          reg32 <= $unsigned((reg23 << $unsigned($unsigned($unsigned(reg14)))));
          if (((~reg26) ?
              $signed($unsigned(reg12[(1'h1):(1'h1)])) : wire20[(4'he):(4'h8)]))
            begin
              reg33 <= (-($signed(reg35[(2'h3):(2'h3)]) ^ ($signed((wire3 ?
                  reg15 : (8'hac))) <= (reg10 ? (reg26 & wire4) : (~wire16)))));
              reg34 <= wire22;
              reg35 <= $unsigned({(-((reg9 | wire4) ?
                      ((8'h9d) ? wire19 : (8'hb6)) : ((8'hb0) >> reg8)))});
            end
          else
            begin
              reg33 <= {reg31[(3'h5):(3'h4)]};
            end
        end
      reg39 <= $signed(((7'h40) + reg7));
      if (reg37[(5'h11):(1'h0)])
        begin
          reg40 <= $signed($signed($signed(((reg24 ?
              reg28 : reg10) | (&reg13)))));
          if ({({reg15} ? (!wire0) : reg36[(4'h8):(3'h6)]), (8'ha7)})
            begin
              reg41 <= (8'hb9);
            end
          else
            begin
              reg41 <= reg30[(1'h1):(1'h1)];
              reg42 <= (~|(reg12[(3'h7):(3'h5)] - wire4[(2'h3):(1'h0)]));
              reg43 <= (!$signed($unsigned($unsigned(wire3))));
              reg44 <= (wire0[(4'hd):(4'ha)] ?
                  $signed({wire21[(4'hc):(4'hb)]}) : $unsigned(reg27[(4'hd):(3'h5)]));
              reg45 <= (^(reg10[(5'h10):(4'hf)] || $signed((reg11[(3'h4):(3'h4)] || $signed(reg43)))));
            end
          if (reg37)
            begin
              reg46 <= reg40;
              reg47 <= reg34;
            end
          else
            begin
              reg46 <= wire16;
              reg47 <= reg6;
              reg48 <= wire2[(4'h8):(1'h1)];
              reg49 <= reg44;
              reg50 <= $signed(((^{(wire4 ? (7'h41) : reg36),
                  {wire21, wire22}}) & $unsigned(wire2[(4'he):(4'h9)])));
            end
        end
      else
        begin
          reg40 <= (($unsigned(reg13[(2'h2):(2'h2)]) ?
              (wire4 >>> {reg14}) : ($signed(reg32) ?
                  (reg7 - ((8'ha5) ? reg47 : reg43)) : (~^(reg50 ?
                      wire16 : reg39)))) ^~ ((wire18 << ($unsigned((8'hba)) != {(8'ha5),
                  reg14})) ?
              ((wire19 ? $unsigned(reg28) : reg49) ?
                  ($signed(reg14) ?
                      (8'ha1) : (~^reg41)) : reg10) : (+(-(reg6 ^ wire21)))));
        end
    end
  always
    @(posedge clk) begin
      reg51 <= (($unsigned(((~&reg46) ?
          (~reg26) : $unsigned(reg37))) ^~ ($unsigned(wire19[(4'h8):(1'h0)]) ?
          (8'hbb) : reg38)) - reg9[(1'h1):(1'h0)]);
      reg52 <= (reg39 ?
          ($unsigned($signed($unsigned((7'h40)))) & (+$signed((~|reg34)))) : reg38);
    end
  assign wire53 = (^~(wire4 ?
                      ((reg26 ? (reg47 ? (8'h9e) : wire4) : reg12) ?
                          $signed({reg30}) : reg15[(2'h3):(2'h2)]) : $signed((^~$signed(reg50)))));
endmodule
