module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire22;
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire45,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire22,
                 reg44,
                 reg43,
                 reg42,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned(wire2[(2'h2):(1'h1)]));
      if ((~&$signed(((~&(~|wire3)) ?
          ((^~wire3) > $signed((8'hae))) : ($unsigned(wire3) ?
              $unsigned((8'hb3)) : $unsigned(wire0))))))
        begin
          reg5 <= wire2;
          reg6 <= $unsigned($signed(($unsigned((wire0 ? wire3 : wire1)) ?
              reg4 : ((wire3 && reg4) ? $unsigned(wire3) : $signed(wire0)))));
          reg7 <= (+$signed($signed(wire0)));
          reg8 <= (^~(wire0 ?
              ((wire2[(3'h5):(3'h5)] ?
                  ((8'hbb) >= reg4) : (8'hb7)) >> (8'ha9)) : reg4));
        end
      else
        begin
          reg5 <= (&(~^{$signed(wire1)}));
          if ((^~((|$unsigned((wire0 ?
              reg5 : (8'ha1)))) > ($unsigned(wire1[(4'hb):(3'h7)]) ?
              $signed($signed(wire2)) : wire0[(1'h0):(1'h0)]))))
            begin
              reg6 <= reg6;
            end
          else
            begin
              reg6 <= wire3[(4'ha):(2'h3)];
              reg7 <= (reg4[(2'h3):(1'h1)] ?
                  wire3[(3'h5):(1'h0)] : $signed(wire0[(3'h4):(2'h2)]));
              reg8 <= (reg8 ?
                  (+$unsigned($unsigned((wire0 > wire0)))) : $signed(wire0[(1'h0):(1'h0)]));
              reg9 <= (reg8[(2'h3):(2'h3)] ?
                  ((~&(~^$unsigned(reg6))) && $signed($signed($unsigned(wire0)))) : (!$signed({(+reg8),
                      (wire0 ? wire1 : wire3)})));
              reg10 <= $signed(wire3[(4'hd):(4'hd)]);
            end
          if ((reg6[(3'h5):(3'h4)] ~^ $unsigned(($signed((wire1 ~^ reg7)) ?
              reg6[(4'h9):(3'h6)] : {$signed(wire0), (wire3 <= (8'h9f))}))))
            begin
              reg11 <= $unsigned(reg4[(4'hb):(3'h7)]);
              reg12 <= $unsigned(wire1);
              reg13 <= reg8;
            end
          else
            begin
              reg11 <= ((+(~|(-(reg6 ? reg7 : reg5)))) ?
                  $unsigned($unsigned(reg12)) : $signed(wire3));
              reg12 <= (wire0 ?
                  $signed((($signed(reg4) + $signed(reg7)) ?
                      ((reg5 ?
                          reg7 : reg13) && reg12[(2'h2):(2'h2)]) : (wire3[(3'h5):(1'h1)] ?
                          (wire1 ?
                              wire1 : wire0) : $unsigned((8'hb6))))) : $signed(reg12[(3'h4):(1'h1)]));
              reg13 <= reg9[(3'h7):(1'h0)];
              reg14 <= wire3[(4'ha):(3'h5)];
            end
          if (reg5)
            begin
              reg15 <= $unsigned(({wire0,
                      (reg7[(3'h5):(2'h3)] ? $unsigned(wire0) : (^reg7))} ?
                  (|((reg8 ? wire2 : reg8) ^ (~|reg8))) : $signed({(8'haf),
                      wire3})));
              reg16 <= (((8'hb0) <= (($signed(reg14) ^ reg5) >>> {((7'h40) ~^ (7'h42))})) ?
                  (wire1 ^~ (reg5 ?
                      reg12 : $unsigned($unsigned(reg7)))) : $signed((({(8'had),
                      (8'haa)} ^ reg6[(4'h8):(3'h5)]) < ((~&reg9) ?
                      (wire2 ? wire3 : wire2) : (reg4 ? reg9 : reg8)))));
              reg17 <= (((reg10[(5'h10):(4'ha)] ? reg13 : (~(-reg10))) ?
                  reg16 : ($unsigned((wire2 ? reg15 : reg12)) | $unsigned({reg9,
                      reg10}))) == ($signed(((8'hbc) ?
                      $unsigned(reg15) : ((8'ha0) ? reg9 : (8'hbb)))) ?
                  $unsigned(((&reg6) < wire2)) : (8'hae)));
              reg18 <= (!reg5[(3'h7):(3'h5)]);
            end
          else
            begin
              reg15 <= {(8'hb9)};
              reg16 <= (~&(&wire1));
              reg17 <= ($unsigned((-($signed(reg9) >>> $signed(reg7)))) * wire1[(1'h0):(1'h0)]);
            end
        end
      reg19 <= reg6[(3'h5):(2'h3)];
      reg20 <= (reg10 && reg4[(4'hd):(4'hb)]);
      reg21 <= ((~&$signed($signed(reg18[(3'h5):(3'h5)]))) ?
          reg16[(4'hd):(3'h7)] : reg20[(2'h3):(2'h2)]);
    end
  assign wire22 = ((($signed($signed(reg9)) ?
                          reg17 : $unsigned(wire0[(3'h4):(1'h1)])) * (8'ha7)) ?
                      (reg20 ?
                          (wire0 ?
                              (7'h42) : reg10) : (~$unsigned((!(8'ha1))))) : (reg4 ?
                          $unsigned((!$unsigned(reg16))) : (($unsigned(reg18) ^~ (wire1 <<< reg14)) << reg13)));
  always
    @(posedge clk) begin
      reg23 <= $signed(reg13);
      reg24 <= reg9;
      reg25 <= ((~^$signed({reg20[(1'h1):(1'h0)]})) ?
          (wire3 || (($unsigned(reg19) | (reg12 ? reg8 : reg4)) ?
              wire1 : (wire1[(4'hc):(2'h2)] ?
                  reg20 : (reg7 ?
                      wire2 : reg9)))) : ((~reg10[(5'h10):(4'hb)]) <<< $unsigned($unsigned($unsigned(wire2)))));
    end
  always
    @(posedge clk) begin
      reg26 <= wire1[(3'h4):(1'h0)];
      if (reg23[(4'hc):(4'hb)])
        begin
          reg27 <= {($unsigned(((reg18 == reg6) > {reg16, reg11})) >> (8'ha5)),
              ({reg7} >>> $signed((^(wire2 ^~ reg26))))};
          reg28 <= $unsigned(reg17);
          reg29 <= (8'hb4);
        end
      else
        begin
          reg27 <= {(reg12[(1'h1):(1'h1)] ?
                  $unsigned(reg23[(1'h0):(1'h0)]) : $signed($unsigned($unsigned(reg13)))),
              (&$signed(((^~(7'h42)) ? (+reg19) : reg20[(2'h3):(2'h2)])))};
          reg28 <= (8'hb3);
          reg29 <= (~^reg9);
          reg30 <= (^(reg25[(1'h1):(1'h0)] + (+(-$unsigned(reg27)))));
          reg31 <= (+wire2);
        end
    end
  assign wire32 = {reg23};
  assign wire33 = reg29[(3'h4):(1'h0)];
  assign wire34 = $signed($signed((((reg18 ~^ reg27) == {reg28}) != reg9)));
  assign wire35 = $signed(wire3[(4'hf):(4'ha)]);
  assign wire36 = (|(^~reg15));
  assign wire37 = {(8'ha3)};
  assign wire38 = reg16;
  assign wire39 = $signed((~&wire32[(2'h3):(1'h0)]));
  assign wire40 = ($unsigned(($signed((^~reg12)) ?
                      wire3 : reg19[(2'h2):(1'h1)])) ^ (^$unsigned($unsigned((wire39 ?
                      reg6 : (8'h9f))))));
  assign wire41 = $unsigned(reg31);
  always
    @(posedge clk) begin
      if (reg13[(3'h4):(2'h2)])
        begin
          reg42 <= wire32[(2'h3):(1'h1)];
          reg43 <= $unsigned($signed(reg42[(2'h2):(1'h0)]));
          reg44 <= reg11[(1'h0):(1'h0)];
        end
      else
        begin
          reg42 <= (((8'ha4) ^ $unsigned(reg25)) ?
              reg8[(2'h3):(1'h0)] : $signed(reg20));
          reg43 <= (reg16[(2'h3):(2'h3)] ?
              $signed({reg7[(3'h4):(2'h3)],
                  (+wire34[(4'hd):(4'hc)])}) : (reg25[(2'h2):(1'h0)] >= {wire35[(2'h2):(1'h0)],
                  $signed(reg20[(3'h5):(2'h2)])}));
        end
    end
  assign wire45 = reg21;
endmodule
