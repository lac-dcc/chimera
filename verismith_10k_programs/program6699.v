module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire38,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 reg22,
                 reg21,
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
                 (1'h0)};
  assign wire5 = wire1[(3'h6):(3'h4)];
  assign wire6 = wire2;
  always
    @(posedge clk) begin
      reg7 <= (wire0[(3'h6):(3'h4)] ?
          $signed(wire1) : (~&($unsigned($signed(wire6)) && wire3[(3'h5):(3'h5)])));
      if ({$signed(((-{wire6, wire4}) ?
              ((wire1 ? wire5 : wire3) ^~ $signed(wire3)) : (!reg7)))})
        begin
          reg8 <= ({(~^$signed($signed((8'ha6)))),
              (&((wire4 ? wire5 : wire6) <<< wire4))} ^ wire2[(1'h1):(1'h0)]);
          reg9 <= (~reg8);
          reg10 <= $unsigned($signed((~&((-wire2) ?
              $unsigned(wire0) : wire4[(1'h1):(1'h0)]))));
          reg11 <= reg10;
          reg12 <= $signed($signed($unsigned(reg9[(4'ha):(4'h8)])));
        end
      else
        begin
          reg8 <= $unsigned(reg9);
          reg9 <= ($signed((wire6[(3'h4):(1'h0)] ?
                  wire0[(3'h6):(1'h1)] : $unsigned((!wire5)))) ?
              ($unsigned(($unsigned(wire4) ?
                  $signed(reg9) : (wire4 ?
                      wire5 : reg8))) > $signed($signed(wire0))) : $unsigned($signed((!(reg8 ?
                  reg12 : (8'h9d))))));
          reg10 <= (^({wire4[(3'h7):(2'h3)],
              $signed(wire4[(2'h2):(1'h1)])} + wire0[(4'hb):(4'h9)]));
          if (reg10[(4'h9):(3'h4)])
            begin
              reg11 <= (wire5[(4'hc):(2'h2)] + reg11[(1'h0):(1'h0)]);
            end
          else
            begin
              reg11 <= ($signed(wire6[(3'h5):(2'h2)]) >> reg9[(3'h7):(1'h1)]);
              reg12 <= $unsigned(wire3);
              reg13 <= (-{$signed(wire6)});
              reg14 <= reg9[(2'h2):(1'h0)];
            end
          reg15 <= (({$signed((wire1 ? reg10 : wire0)),
                  wire1} || ($unsigned(wire2[(1'h0):(1'h0)]) ?
                  $unsigned($signed(wire0)) : $unsigned((!reg14)))) ?
              ($unsigned({reg10[(2'h3):(2'h2)],
                  {wire6}}) <<< $unsigned($signed((wire5 ^~ reg14)))) : $unsigned((wire6 ?
                  reg11 : $signed((+reg10)))));
        end
      reg16 <= $signed(($signed((|(reg12 ? reg14 : wire3))) ~^ wire1));
    end
  assign wire17 = reg7[(1'h0):(1'h0)];
  assign wire18 = {$signed(reg16)};
  assign wire19 = $signed((+(!($unsigned(wire1) || $signed(reg14)))));
  assign wire20 = {($signed(($unsigned(reg15) + reg8[(3'h7):(2'h2)])) ?
                          $signed($unsigned((wire0 & wire4))) : $unsigned((|(&reg14))))};
  always
    @(posedge clk) begin
      if ((reg9[(4'he):(4'hd)] ~^ wire18[(3'h6):(3'h6)]))
        begin
          reg21 <= {$unsigned(($signed((reg11 ~^ reg7)) ?
                  (-$signed(wire0)) : (&(reg7 ? reg9 : (8'hb2)))))};
          reg22 <= (+(+wire5[(4'hb):(1'h0)]));
          if ((~|$signed($signed(reg7))))
            begin
              reg23 <= wire1[(3'h6):(3'h4)];
            end
          else
            begin
              reg23 <= reg13[(4'he):(3'h6)];
              reg24 <= $unsigned($signed((&(~$unsigned((8'hb7))))));
              reg25 <= wire2[(1'h0):(1'h0)];
            end
          if ((wire4 ?
              $signed((($unsigned((8'had)) || reg25[(2'h2):(1'h1)]) <<< reg24[(4'hb):(4'hb)])) : reg14[(2'h2):(1'h1)]))
            begin
              reg26 <= ({reg8, wire0} ?
                  ($unsigned(reg25) ?
                      reg22 : (~^(!{reg10}))) : reg9[(4'hb):(1'h0)]);
              reg27 <= $unsigned($signed(reg22));
              reg28 <= wire1;
            end
          else
            begin
              reg26 <= $unsigned(($signed($unsigned((8'hbc))) * $unsigned((reg24[(4'he):(4'ha)] * (reg26 ?
                  reg9 : reg26)))));
              reg27 <= reg9;
              reg28 <= (~$signed($signed((((7'h40) ~^ reg7) ?
                  (^~wire1) : reg13))));
            end
        end
      else
        begin
          reg21 <= ($unsigned(reg22) ?
              ($signed({reg15[(1'h0):(1'h0)],
                  (wire5 ~^ reg21)}) | (($signed(reg12) ?
                  (reg21 < wire5) : (reg26 ?
                      wire19 : wire5)) < $signed(wire17))) : wire19);
          if (wire0)
            begin
              reg22 <= $unsigned($signed(wire4));
              reg23 <= {({$signed(wire3[(2'h2):(1'h1)]),
                          ((-reg26) ? $unsigned((8'h9e)) : {reg9, (8'hbb)})} ?
                      $signed(($signed((8'hb5)) >>> {reg15})) : wire2[(3'h5):(2'h2)])};
              reg24 <= ((~^reg7[(2'h3):(1'h0)]) ?
                  (wire3[(3'h4):(2'h2)] ?
                      $signed(wire17[(1'h0):(1'h0)]) : $signed(reg27[(4'h9):(4'h8)])) : wire6[(4'h8):(3'h4)]);
              reg25 <= $signed(reg11);
              reg26 <= (!reg28[(1'h0):(1'h0)]);
            end
          else
            begin
              reg22 <= (reg25 << (($unsigned($signed(reg25)) == reg16) ?
                  $signed({reg16[(4'hb):(1'h1)],
                      $unsigned(reg11)}) : (~$signed((~^reg14)))));
              reg23 <= ((reg26[(3'h7):(2'h2)] ? reg27 : reg21) ?
                  (~^(&$unsigned((^~wire3)))) : wire2);
              reg24 <= wire20;
              reg25 <= reg16[(4'hc):(4'h9)];
              reg26 <= reg24;
            end
        end
      reg29 <= (8'haf);
      reg30 <= reg8;
      if ($unsigned(($unsigned(reg28) ?
          $signed(wire1[(1'h1):(1'h0)]) : (reg29[(2'h2):(2'h2)] >>> reg9[(4'hd):(4'hb)]))))
        begin
          reg31 <= ($signed((+reg22)) ?
              $signed($unsigned($unsigned((|reg26)))) : reg26[(3'h7):(3'h6)]);
        end
      else
        begin
          reg31 <= wire17[(1'h1):(1'h0)];
          reg32 <= $signed(((8'h9f) > reg24));
          if (reg27[(2'h3):(2'h3)])
            begin
              reg33 <= (&reg29[(1'h0):(1'h0)]);
            end
          else
            begin
              reg33 <= ($unsigned(reg10[(3'h6):(3'h6)]) ?
                  reg26 : {(~{{wire5}, $signed(reg15)})});
              reg34 <= {(8'hb0), $unsigned((^wire19))};
              reg35 <= ((reg30[(3'h4):(2'h2)] ?
                      ((~|{reg29, reg24}) ?
                          (8'hb9) : $unsigned(wire17[(3'h4):(3'h4)])) : $signed((~^$signed((8'ha5))))) ?
                  (~^reg30[(4'ha):(2'h3)]) : $signed((8'hb8)));
              reg36 <= (reg30 ~^ (~^wire4[(2'h3):(1'h1)]));
            end
        end
      reg37 <= ($unsigned((wire19 ?
          ((|(8'hb8)) ?
              {(8'hbd)} : $signed(reg21)) : wire3)) ~^ reg32[(1'h0):(1'h0)]);
    end
  assign wire38 = (8'hb3);
  always
    @(posedge clk) begin
      reg39 <= (~&$unsigned(({$unsigned(reg14),
          wire4} >= reg27[(1'h0):(1'h0)])));
      reg40 <= {{($unsigned((reg26 ? wire4 : wire1)) ?
                  ($unsigned((8'hb1)) ?
                      ((8'hbe) ? reg22 : reg35) : wire3) : ($signed(reg24) ?
                      reg22[(3'h5):(1'h0)] : $signed(reg22))),
              (((wire19 ? reg23 : wire38) ?
                  reg33[(1'h0):(1'h0)] : (~^wire3)) >= $signed((~^reg33)))},
          wire4[(3'h4):(1'h0)]};
      reg41 <= $signed($unsigned(reg28));
      reg42 <= $signed(($unsigned($signed(wire19)) ?
          $signed($unsigned($unsigned(wire4))) : $unsigned(wire18[(4'h9):(1'h1)])));
      reg43 <= $signed((reg30[(4'hd):(1'h1)] ^ reg37[(4'ha):(2'h3)]));
    end
endmodule
