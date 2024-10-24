module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire69;
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire69,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire5 = wire1[(2'h2):(2'h2)];
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      if ($unsigned({(wire2 && $signed($signed((8'hb1))))}))
        begin
          reg7 <= $unsigned($unsigned(wire6[(4'hd):(3'h4)]));
          if ((($unsigned($signed($unsigned(reg7))) ?
              (8'had) : (wire6 ?
                  wire2[(3'h4):(2'h2)] : $signed({(8'ha1)}))) | (~|$unsigned(wire3))))
            begin
              reg8 <= $signed(wire0);
            end
          else
            begin
              reg8 <= $signed((wire2[(2'h2):(1'h0)] ?
                  (wire3[(1'h1):(1'h0)] ?
                      $unsigned((^wire0)) : (-(wire3 < wire1))) : ((^~(reg7 ?
                      wire4 : (8'hb3))) | reg7[(3'h5):(1'h1)])));
              reg9 <= wire0[(3'h4):(2'h2)];
              reg10 <= (&reg7[(4'h9):(4'h8)]);
            end
          reg11 <= wire4;
          reg12 <= reg9;
        end
      else
        begin
          if ((reg10 ?
              (~&(~|($unsigned(reg7) ?
                  wire2 : ((8'ha9) > reg7)))) : $unsigned(reg8)))
            begin
              reg7 <= {reg7[(4'hf):(4'h9)], $signed((~wire0[(5'h10):(2'h2)]))};
            end
          else
            begin
              reg7 <= reg8;
              reg8 <= {(+reg10[(5'h15):(1'h1)]), reg9};
              reg9 <= (wire5[(2'h2):(1'h0)] ?
                  (&reg12) : (+($unsigned($unsigned((8'hbd))) ?
                      reg8[(2'h2):(1'h0)] : $signed($signed(wire5)))));
              reg10 <= $unsigned(wire2[(2'h3):(2'h2)]);
              reg11 <= reg8;
            end
          if ((~&$unsigned((reg12 ?
              reg8[(1'h0):(1'h0)] : $unsigned({wire4, reg12})))))
            begin
              reg12 <= (&(~&wire2));
              reg13 <= ($unsigned($signed($unsigned((wire1 || wire6)))) ?
                  (~|wire3) : (((^$unsigned(reg8)) ?
                          reg7 : ($signed(reg12) <<< (reg10 >> wire0))) ?
                      ($signed(wire6) ?
                          wire1[(1'h1):(1'h0)] : {$signed(wire6)}) : wire3));
              reg14 <= reg13[(3'h5):(1'h1)];
              reg15 <= ($unsigned(wire1) ? (^~reg11) : wire5);
              reg16 <= $signed((8'h9e));
            end
          else
            begin
              reg12 <= reg7[(2'h3):(1'h1)];
            end
          if ($signed((+{reg10, (|$signed(reg12))})))
            begin
              reg17 <= ($signed((8'hb2)) + ($signed(reg9) ?
                  $signed({reg15}) : {wire3}));
              reg18 <= wire3[(4'he):(1'h0)];
              reg19 <= reg7[(4'hb):(4'h8)];
              reg20 <= ((7'h41) >> wire4);
            end
          else
            begin
              reg17 <= $unsigned(((+$unsigned((&reg7))) ? (~|{reg10}) : reg14));
              reg18 <= (~&{$unsigned(((reg8 ?
                      wire4 : wire1) & (reg7 ~^ reg19)))});
              reg19 <= $unsigned((|$signed((~^(wire4 ? reg8 : wire1)))));
              reg20 <= {wire2[(3'h5):(2'h3)]};
              reg21 <= reg8;
            end
          if ($signed(reg10[(4'h8):(4'h8)]))
            begin
              reg22 <= reg13[(3'h4):(2'h3)];
              reg23 <= (($signed((reg17 ? (8'hb4) : reg19)) ?
                  {($signed((7'h40)) - $unsigned(reg20)),
                      ((wire3 ? reg22 : wire6) ?
                          $unsigned(reg12) : $signed(wire5))} : $unsigned((8'hb1))) == $signed($unsigned(reg15[(3'h4):(1'h1)])));
            end
          else
            begin
              reg22 <= ({reg14} & ($unsigned(wire6[(4'h8):(3'h6)]) <<< reg23[(2'h3):(2'h3)]));
              reg23 <= ((wire4[(3'h4):(1'h1)] || $signed((((8'ha7) <= reg8) < (reg7 == reg14)))) && $unsigned(reg20[(4'ha):(3'h4)]));
            end
        end
      reg24 <= ($signed(({((8'hb9) >= reg9)} == reg17[(4'he):(4'hc)])) ?
          wire6[(1'h1):(1'h1)] : $signed($unsigned(reg12)));
      reg25 <= (!wire6);
      reg26 <= {reg10};
      if ((|wire0))
        begin
          reg27 <= $unsigned($signed($signed($unsigned(reg26[(2'h3):(2'h3)]))));
          reg28 <= reg21;
          reg29 <= (reg14[(3'h6):(3'h5)] ?
              (~^wire6[(4'hf):(1'h0)]) : reg7[(3'h4):(2'h3)]);
          reg30 <= $unsigned($unsigned(((~|((8'h9d) & reg7)) ?
              (~&$unsigned(reg20)) : ((7'h44) && reg26))));
        end
      else
        begin
          reg27 <= (+$unsigned(((reg15 ?
              reg11[(4'h9):(1'h0)] : $unsigned(wire0)) == {(reg8 ^~ wire0),
              $unsigned(reg28)})));
        end
    end
  assign wire31 = ($unsigned(($unsigned($signed(reg24)) && (-$unsigned(reg20)))) && (~|((^{reg15,
                          reg30}) ?
                      $unsigned((reg7 << reg14)) : ($signed(reg29) ?
                          $unsigned(reg29) : {wire4, reg22}))));
  assign wire32 = wire4[(1'h0):(1'h0)];
  assign wire33 = reg24;
  assign wire34 = $unsigned(wire31);
  module35 #() modinst70 (.wire39(reg18), .wire38(wire0), .clk(clk), .wire37(reg21), .y(wire69), .wire36(reg13));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire39;
  input wire signed [(4'hc):(1'h0)] wire38;
  input wire [(4'he):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire50;
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire50,
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
                 (1'h0)};
  module40 #() modinst51 (.wire45(wire39), .wire42(wire38), .clk(clk), .y(wire50), .wire41((8'hb6)), .wire44(wire36), .wire43(wire37));
  always
    @(posedge clk) begin
      reg52 <= {$signed($signed($signed((~^wire36))))};
      if (wire38[(4'hc):(4'hc)])
        begin
          reg53 <= ((~($signed($signed((8'ha5))) && $signed((7'h42)))) ?
              (^~wire38) : $unsigned({$signed((!wire38)), $unsigned(wire50)}));
          if ((wire39 == wire37[(4'hc):(1'h0)]))
            begin
              reg54 <= reg52;
            end
          else
            begin
              reg54 <= ((~&reg52[(1'h0):(1'h0)]) ?
                  wire39[(4'h8):(3'h6)] : ((~&((~^reg54) ?
                          $signed(reg54) : wire50)) ?
                      $signed(wire39[(5'h10):(4'he)]) : (~&(8'hbb))));
              reg55 <= $signed($signed(wire36[(3'h4):(3'h4)]));
              reg56 <= $unsigned(wire39[(3'h7):(2'h2)]);
              reg57 <= (reg52 < reg53);
            end
          if ($signed(reg54))
            begin
              reg58 <= (((~|$signed($signed((7'h43)))) ?
                      (+$unsigned(reg53[(2'h3):(2'h2)])) : (^~$unsigned($unsigned(reg55)))) ?
                  (~&$unsigned((reg52[(2'h2):(2'h2)] ~^ wire39))) : (~&wire37[(1'h0):(1'h0)]));
              reg59 <= (wire38 ?
                  reg58[(2'h3):(1'h1)] : ($signed(reg54) ?
                      wire38[(1'h1):(1'h0)] : (wire36[(5'h11):(4'hb)] ?
                          (reg53 ? $signed(reg58) : (!wire36)) : (8'had))));
            end
          else
            begin
              reg58 <= ($signed(reg55[(2'h2):(1'h1)]) ?
                  reg56 : ((^$signed(reg58)) ?
                      ($signed((reg58 ? reg58 : reg59)) ?
                          reg52[(3'h5):(2'h3)] : $unsigned(wire36[(4'ha):(3'h7)])) : ((reg55 <<< $unsigned(reg55)) ^ ({reg54,
                              wire39} ?
                          $signed(wire38) : (wire39 >> (8'ha8))))));
              reg59 <= ($signed((+$unsigned(wire39))) << reg59[(1'h1):(1'h1)]);
              reg60 <= $unsigned(wire38);
            end
        end
      else
        begin
          if (reg52)
            begin
              reg53 <= wire38;
              reg54 <= $signed($signed(reg55[(4'h9):(2'h3)]));
              reg55 <= $unsigned(reg60[(4'hf):(4'ha)]);
            end
          else
            begin
              reg53 <= wire50[(4'hb):(3'h6)];
            end
          if ((((8'hb5) ?
              $unsigned($signed(reg58[(1'h0):(1'h0)])) : (((8'hbd) ^ {reg59,
                  wire50}) << reg60[(2'h3):(2'h2)])) ~^ reg60[(3'h6):(1'h0)]))
            begin
              reg56 <= reg58[(1'h1):(1'h0)];
              reg57 <= $unsigned(reg60[(4'h8):(3'h6)]);
              reg58 <= $unsigned(($unsigned($signed(wire39)) == (({(8'h9f),
                      reg54} < (reg59 << reg57)) ?
                  (-(wire36 || reg53)) : ($unsigned(wire37) | reg55[(4'hf):(4'h8)]))));
              reg59 <= $signed(reg57[(1'h1):(1'h0)]);
              reg60 <= (|((!$signed(wire37)) >= ({$unsigned(reg56),
                  $signed(wire38)} | $unsigned((reg53 ? (8'ha0) : wire38)))));
            end
          else
            begin
              reg56 <= (($unsigned($unsigned((!reg59))) ?
                  (~|reg60) : (reg55 ?
                      wire38 : ($signed(wire39) ?
                          wire36 : (~|wire36)))) <= (~^$signed($signed((reg56 >= reg57)))));
              reg57 <= ((&$signed((reg56 >= {wire38, reg55}))) != (-(((reg55 ?
                      reg56 : reg60) ?
                  ((8'ha6) != (8'ha3)) : (|reg56)) && (reg54[(1'h0):(1'h0)] & $signed((7'h42))))));
              reg58 <= (($signed($unsigned(reg52)) ?
                      (8'hab) : (wire36[(4'hf):(1'h0)] == (+reg54[(4'ha):(3'h4)]))) ?
                  (&($unsigned((reg55 ~^ reg52)) ?
                      $unsigned((!reg53)) : ((reg52 >= reg54) - (reg55 ?
                          reg60 : (8'ha9))))) : (8'had));
            end
          reg61 <= $signed($unsigned(wire50));
          reg62 <= reg61;
          reg63 <= $signed((8'hbd));
        end
      reg64 <= $unsigned($unsigned($signed(wire50)));
      reg65 <= wire38[(4'ha):(3'h6)];
    end
  assign wire66 = reg57;
  assign wire67 = $unsigned(wire36);
  assign wire68 = (($unsigned(wire39) && reg53) ?
                      wire50[(2'h2):(2'h2)] : $unsigned((&$signed((reg55 ?
                          wire50 : reg61)))));
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire45;
  input wire [(2'h3):(1'h0)] wire44;
  input wire signed [(4'he):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  assign y = {wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = ((wire43 ? wire43 : $signed($unsigned((~|wire43)))) ?
                      $signed(wire41) : ($signed(wire42) ?
                          ($unsigned($unsigned(wire45)) <<< ((8'hb0) ?
                              $unsigned(wire45) : wire43[(4'hd):(4'hc)])) : wire41));
  assign wire47 = {wire45,
                      $signed((+($unsigned(wire42) * (wire46 ?
                          wire44 : (8'hb6)))))};
  assign wire48 = $signed(wire43[(4'hc):(3'h5)]);
  assign wire49 = $signed((wire43 ?
                      {(wire46 | wire46),
                          (wire44[(1'h0):(1'h0)] > wire45)} : {($signed(wire45) ?
                              (wire42 && wire47) : wire42)}));
endmodule
