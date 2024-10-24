module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  assign y = {wire9,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed(wire4);
  assign wire6 = $signed((^~$signed($unsigned(wire4))));
  always
    @(posedge clk) begin
      reg7 <= $unsigned(($signed(wire1[(4'h9):(2'h2)]) - wire4[(1'h1):(1'h1)]));
      reg8 <= reg7;
    end
  assign wire9 = {(&{$unsigned((8'ha5))}), wire0};
  always
    @(posedge clk) begin
      if ((($unsigned((~^(&(8'hb7)))) > $signed({wire1, wire0})) || wire2))
        begin
          reg10 <= {wire9,
              ($signed($unsigned((8'ha4))) != $signed($unsigned({wire5,
                  wire5})))};
          reg11 <= reg10;
          reg12 <= ($unsigned(reg10[(3'h4):(1'h1)]) ^ ((((wire6 ?
                      wire1 : (8'had)) >> wire1) ?
                  wire6 : reg8) ?
              wire1[(4'hf):(4'hd)] : (~^(!wire1[(5'h10):(4'h9)]))));
          if ((7'h44))
            begin
              reg13 <= {reg11[(4'h8):(3'h7)]};
            end
          else
            begin
              reg13 <= ($unsigned((((|wire1) ?
                      $signed(wire0) : wire4) >> ((^wire6) < (wire5 ?
                      wire6 : wire5)))) ?
                  (reg12[(4'h9):(3'h4)] ?
                      (^~(|$signed(wire3))) : (reg13[(3'h6):(2'h2)] ?
                          $unsigned(wire5) : ($unsigned(reg11) ?
                              $unsigned(wire2) : reg10))) : (reg11[(3'h6):(2'h3)] ?
                      ((|(wire0 ? (8'h9f) : (8'hb0))) ?
                          wire3 : ($unsigned(reg11) & $signed(wire4))) : (((^~reg12) ?
                          $unsigned(reg11) : reg7) >> wire9[(4'hf):(2'h2)])));
              reg14 <= (($unsigned(((~reg7) ?
                      (~|(8'haf)) : reg7[(3'h7):(3'h7)])) ?
                  $signed({(|(8'hb8))}) : (+$unsigned($signed((8'hb5))))) | $unsigned($signed((reg7[(4'h9):(3'h5)] + (~^reg7)))));
            end
          if (reg14)
            begin
              reg15 <= {(8'hb8),
                  {$signed((&(reg8 ? wire2 : reg12))), reg8[(3'h7):(3'h6)]}};
              reg16 <= reg12;
              reg17 <= $unsigned(($signed((~|$unsigned(reg14))) ?
                  wire9 : {$unsigned(reg13), (8'ha9)}));
              reg18 <= (^~$unsigned(reg17));
              reg19 <= reg12[(4'ha):(3'h7)];
            end
          else
            begin
              reg15 <= wire3[(3'h7):(3'h6)];
              reg16 <= wire3;
              reg17 <= reg11;
            end
        end
      else
        begin
          reg10 <= (~reg10);
          if ((((~wire3) ?
              $unsigned(reg18[(4'h8):(3'h7)]) : {reg19[(4'he):(1'h0)]}) > $signed($unsigned($signed({(8'hb7)})))))
            begin
              reg11 <= reg19;
              reg12 <= ($unsigned($unsigned(reg12)) ?
                  $unsigned(((&(wire9 && reg17)) * {$unsigned(reg10)})) : reg17[(4'h8):(3'h5)]);
              reg13 <= ((^(~&{$signed(wire9), wire2})) ^ reg15);
              reg14 <= $signed(wire1[(3'h5):(2'h2)]);
            end
          else
            begin
              reg11 <= ((|($signed((wire0 ? (8'ha9) : wire6)) ?
                  ({wire9,
                      reg16} >>> (~&reg14)) : $unsigned($unsigned(reg8)))) > $signed(reg14));
              reg12 <= (^~($unsigned((!reg11[(3'h4):(1'h0)])) && (~^((8'ha5) <<< ((8'h9f) ?
                  wire9 : reg17)))));
              reg13 <= {(8'hbb),
                  (reg7[(4'hd):(4'hd)] ?
                      ((~(wire2 ? reg19 : (8'h9d))) != {$unsigned(wire1),
                          $signed(reg10)}) : reg14[(3'h5):(1'h1)])};
            end
        end
      reg20 <= $unsigned((~^{$unsigned(reg14[(2'h3):(2'h3)]),
          (+(reg13 ? wire1 : reg12))}));
      reg21 <= (wire6 ? (&wire6) : (reg18[(4'h8):(3'h6)] + reg12));
    end
endmodule
