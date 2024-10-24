module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(4'hf):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire14;
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire28,
                 wire14,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (~{wire3,
          (wire2[(4'hb):(2'h2)] ?
              $signed((8'hb3)) : $unsigned((wire3 ? wire0 : wire1)))});
      reg5 <= $unsigned(($signed(((wire1 ? (7'h43) : (8'hb5)) + (wire1 ?
              wire0 : wire1))) ?
          (((wire2 ? wire2 : wire2) < {(7'h42)}) ?
              (8'hbe) : (|$signed(wire2))) : ((wire3 ^ $unsigned((8'hb8))) + (8'hb2))));
      if (reg5)
        begin
          reg6 <= (~|(((-(wire1 ? reg5 : wire0)) ?
              {(~|wire1), (|(8'ha7))} : (8'hb8)) <<< (~&reg5[(1'h0):(1'h0)])));
          reg7 <= (({wire0[(3'h5):(1'h1)]} ?
              ({wire3[(1'h0):(1'h0)]} >> $unsigned((~reg6))) : ($unsigned(wire2[(5'h10):(2'h3)]) != wire1)) | $unsigned((^~{(wire2 ?
                  reg4 : reg6)})));
          reg8 <= wire3[(1'h1):(1'h1)];
        end
      else
        begin
          reg6 <= ({{wire0}} + (-({$signed(reg4),
              (reg7 ? wire1 : wire2)} == wire3)));
          reg7 <= reg6;
          reg8 <= (reg6[(2'h3):(2'h2)] >> ({((reg6 | wire0) & reg8),
                  (((8'haa) ^ reg6) ^~ (-reg4))} ?
              wire3 : (7'h42)));
          reg9 <= (reg4[(3'h7):(2'h3)] != wire1);
          if (wire2[(3'h5):(3'h5)])
            begin
              reg10 <= reg8[(1'h0):(1'h0)];
              reg11 <= reg8;
              reg12 <= ((7'h41) != $unsigned((8'hac)));
            end
          else
            begin
              reg10 <= wire3[(5'h11):(2'h3)];
            end
        end
      reg13 <= ($unsigned($unsigned($unsigned($signed(reg5)))) ?
          $unsigned(reg4) : {wire1[(3'h5):(3'h5)]});
    end
  assign wire14 = $unsigned(reg4);
  always
    @(posedge clk) begin
      if (reg11[(5'h13):(2'h2)])
        begin
          if ((&{(^(reg8 ? (reg11 ? reg6 : wire0) : wire1[(3'h4):(3'h4)]))}))
            begin
              reg15 <= $unsigned({(~|$unsigned(reg11)),
                  $signed($unsigned($unsigned(wire1)))});
            end
          else
            begin
              reg15 <= $unsigned(((&$unsigned(reg9)) ?
                  reg15[(1'h0):(1'h0)] : $unsigned($signed((reg4 + (8'ha2))))));
            end
          reg16 <= reg10[(1'h1):(1'h0)];
          reg17 <= reg6[(2'h3):(1'h1)];
        end
      else
        begin
          reg15 <= (reg8[(3'h5):(2'h2)] ?
              reg16[(1'h1):(1'h1)] : {$unsigned((&wire2)), $unsigned(wire3)});
          if ($unsigned($unsigned((~(-reg12[(1'h0):(1'h0)])))))
            begin
              reg16 <= $signed(($unsigned(reg11[(3'h4):(2'h2)]) && (((reg6 ?
                      wire2 : wire1) ?
                  $signed(reg4) : {wire14}) <<< (~((8'haf) == reg15)))));
              reg17 <= (8'h9f);
              reg18 <= ($unsigned((^~{(+wire14)})) ?
                  (wire14 ?
                      (-{(wire1 ? wire0 : reg7),
                          {reg4,
                              reg16}}) : reg15) : (|$signed(wire14[(4'h8):(1'h0)])));
              reg19 <= wire2[(5'h14):(2'h2)];
            end
          else
            begin
              reg16 <= (^(^~reg5[(3'h4):(2'h3)]));
              reg17 <= reg4[(2'h2):(1'h1)];
              reg18 <= $signed($unsigned(reg17));
              reg19 <= ($signed((reg5[(1'h1):(1'h1)] ?
                      $signed({reg8}) : wire0[(3'h7):(1'h0)])) ?
                  $unsigned((((~&(8'h9e)) && (+reg6)) >>> wire1)) : {((~(^~wire1)) ?
                          $unsigned($unsigned(reg12)) : ($signed(reg5) ?
                              (reg17 ? reg6 : reg16) : reg4[(4'hb):(3'h7)])),
                      wire2[(4'hf):(4'h9)]});
              reg20 <= ($unsigned((8'hb0)) ?
                  $signed((($unsigned(reg9) * (~|reg12)) & (~^$unsigned(reg13)))) : ({($signed(reg9) ?
                              (reg13 ? reg5 : wire3) : (reg11 ?
                                  reg17 : (8'ha2)))} ?
                      (($signed(wire3) << reg11[(4'hf):(4'he)]) ?
                          (~reg9) : ($signed(reg12) << (|(8'ha7)))) : ($unsigned((reg15 >> reg13)) || wire1)));
            end
          if ($signed(reg10))
            begin
              reg21 <= reg6[(1'h1):(1'h0)];
              reg22 <= {(({(reg10 >>> reg20)} != {reg7, reg9[(2'h3):(1'h1)]}) ?
                      $signed($unsigned(reg19)) : (&($unsigned(reg15) + reg21)))};
            end
          else
            begin
              reg21 <= ((!reg19) ?
                  (~^(reg13[(4'hc):(4'ha)] * $unsigned((reg12 ?
                      reg7 : reg21)))) : ((&(8'hb3)) && reg8[(5'h10):(4'hb)]));
              reg22 <= (+(reg18[(3'h7):(3'h4)] & $unsigned(((reg19 ^~ wire1) != (reg7 + wire1)))));
              reg23 <= wire14[(3'h7):(3'h6)];
              reg24 <= $unsigned($signed($signed((reg21 ?
                  $signed((8'ha6)) : wire2[(5'h12):(3'h6)]))));
            end
          reg25 <= reg17[(2'h2):(2'h2)];
        end
      reg26 <= (($signed(($unsigned(reg5) ?
          $unsigned((7'h43)) : $unsigned(reg20))) && ((~&(wire0 ?
              wire0 : reg8)) ?
          reg18[(4'h9):(1'h0)] : $signed({wire14, wire1}))) >>> ((8'hb0) ?
          wire0 : (^reg7)));
      reg27 <= (8'ha1);
    end
  assign wire28 = (($signed(reg26[(4'hb):(4'h9)]) > {(8'hac)}) - $signed(reg15));
  always
    @(posedge clk) begin
      if ($signed(reg25))
        begin
          reg29 <= $signed(reg10[(1'h1):(1'h1)]);
          if ($signed((-{(&reg23[(3'h4):(3'h4)]), reg8})))
            begin
              reg30 <= $signed((reg11 ?
                  reg23[(2'h2):(1'h0)] : $unsigned((reg21[(4'ha):(4'ha)] >> {reg16}))));
              reg31 <= ($unsigned((~&$signed(reg10))) ?
                  $signed($unsigned(reg13)) : $signed({$signed({(8'hb4),
                          reg8})}));
            end
          else
            begin
              reg30 <= (8'hab);
              reg31 <= $signed(reg15[(1'h1):(1'h1)]);
              reg32 <= wire14[(4'ha):(4'h9)];
              reg33 <= ((reg30 <= $unsigned(wire1[(2'h2):(2'h2)])) <<< $unsigned($signed($signed($signed((8'hb8))))));
            end
        end
      else
        begin
          reg29 <= ($signed(($unsigned($unsigned(reg15)) | $signed((reg23 << wire28)))) ?
              ($unsigned((8'hbc)) ?
                  (((reg23 ? reg7 : reg24) ?
                          $unsigned((7'h40)) : (reg11 >>> reg11)) ?
                      $unsigned(((8'ha2) < reg22)) : ((reg26 >= reg16) ?
                          (+reg5) : reg4)) : wire14[(2'h2):(2'h2)]) : reg13[(1'h0):(1'h0)]);
          reg30 <= $unsigned(reg21[(5'h11):(4'h9)]);
        end
      reg34 <= $signed((reg8 ^~ reg4[(4'h8):(2'h2)]));
      reg35 <= (~|reg26[(2'h2):(2'h2)]);
      reg36 <= $unsigned((reg24 ?
          (((|reg29) ? (reg15 <= (8'hb9)) : {wire28}) * ((reg9 ?
                  reg34 : (8'ha2)) ?
              (reg30 ? (8'ha9) : (8'ha9)) : reg5[(2'h2):(2'h2)])) : (~^{reg12,
              {(8'h9d)}})));
    end
  assign wire37 = $signed((($signed($signed((8'ha8))) ?
                      (~&{(8'haf)}) : reg18[(1'h1):(1'h1)]) - $unsigned(reg26)));
  assign wire38 = (!($signed($signed((-reg9))) * reg29[(2'h3):(1'h0)]));
  assign wire39 = ((({(^reg4),
                      reg23[(3'h4):(1'h0)]} & $signed(reg4[(1'h1):(1'h0)])) < $signed(wire37[(4'hf):(4'hb)])) >>> $signed((reg24 ?
                      wire28 : {(reg22 * reg12), reg16[(3'h7):(2'h3)]})));
  assign wire40 = $unsigned(wire2);
endmodule
