module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4;
      reg6 <= $unsigned(wire0[(2'h2):(1'h1)]);
      reg7 <= (&reg6);
    end
  always
    @(posedge clk) begin
      if ($signed((((^(reg7 << wire2)) ?
          $signed(wire3[(4'hd):(1'h1)]) : reg5) <= (^~$signed((+reg5))))))
        begin
          reg8 <= $unsigned({reg7});
          reg9 <= $unsigned(((~^$signed($signed(wire2))) ^ $signed((wire0[(3'h6):(2'h2)] + reg8[(2'h3):(1'h0)]))));
          reg10 <= (~^wire0);
          reg11 <= ((~|$signed(wire2)) | $unsigned((8'ha7)));
          if (reg9)
            begin
              reg12 <= wire1[(1'h0):(1'h0)];
              reg13 <= {{reg5, (wire0[(3'h6):(3'h5)] ? reg8 : (&reg8))},
                  (wire0 & wire4)};
              reg14 <= $unsigned(reg8[(3'h6):(3'h5)]);
            end
          else
            begin
              reg12 <= {(wire3 ? (&{(reg13 | reg11)}) : reg11[(1'h0):(1'h0)])};
              reg13 <= reg6;
            end
        end
      else
        begin
          reg8 <= (wire2 ?
              (~(~^$unsigned($signed(wire1)))) : ($unsigned($unsigned((+reg6))) ?
                  $unsigned($signed((reg6 ? reg12 : wire2))) : reg7));
          reg9 <= ($signed(wire2[(1'h0):(1'h0)]) ?
              ($signed((reg5[(1'h0):(1'h0)] > (reg6 - reg14))) ?
                  $signed(reg5) : (~reg10[(4'hc):(2'h3)])) : reg11);
          reg10 <= (reg9 ? (wire0[(1'h0):(1'h0)] + reg11) : (8'ha0));
          reg11 <= $signed(((^~reg14[(4'hc):(3'h7)]) >>> ($signed({reg14}) ?
              {$signed(reg14)} : $unsigned((reg7 << wire2)))));
        end
      reg15 <= wire3[(4'h8):(3'h7)];
      reg16 <= reg7[(2'h2):(2'h2)];
      reg17 <= (7'h44);
      if ((((8'ha3) << (($signed(reg10) | $signed(wire0)) == ((~|reg15) | reg11[(2'h2):(1'h0)]))) ?
          (~$signed({reg13[(3'h5):(3'h4)], (7'h44)})) : {wire0[(1'h0):(1'h0)],
              $unsigned(($signed(reg6) ? reg10 : (|(8'h9c))))}))
        begin
          reg18 <= {{((^(&reg13)) != $signed($unsigned(wire3)))}};
          reg19 <= reg11[(2'h2):(2'h2)];
          reg20 <= (reg8 * wire0[(1'h1):(1'h0)]);
          reg21 <= wire1;
          reg22 <= (+$signed((($unsigned(reg6) ^~ (reg10 << wire0)) ?
              reg20[(2'h3):(1'h0)] : reg9)));
        end
      else
        begin
          reg18 <= (~(~(-($unsigned(reg9) ^~ wire3[(4'hd):(1'h0)]))));
          reg19 <= reg21[(2'h2):(1'h0)];
          reg20 <= wire0[(2'h2):(1'h1)];
          reg21 <= {$unsigned(reg9)};
          reg22 <= (reg10 ?
              $unsigned((reg21 ?
                  wire4[(4'ha):(3'h4)] : (~^(wire3 ^~ reg14)))) : $unsigned((&($signed((8'hb5)) == reg9[(3'h5):(2'h3)]))));
        end
    end
  assign wire23 = $signed((&wire3));
  assign wire24 = $signed(reg20[(5'h13):(5'h11)]);
  assign wire25 = reg9;
  assign wire26 = ($signed(wire25) ^~ (({$signed(wire0),
                      reg16[(2'h3):(1'h1)]} ^~ $signed($unsigned((8'hb3)))) <<< (~^(8'ha4))));
  always
    @(posedge clk) begin
      if ((reg18[(4'ha):(2'h3)] && wire3[(4'ha):(3'h7)]))
        begin
          if ((~|{(({wire24, reg21} ? $signed(wire23) : {wire23, reg9}) ?
                  $signed(reg10[(4'ha):(4'ha)]) : (8'hbc))}))
            begin
              reg27 <= wire25[(1'h0):(1'h0)];
              reg28 <= ((&(reg16 ?
                  $unsigned($unsigned((8'hbe))) : $signed(wire2[(4'ha):(2'h2)]))) >>> ({{reg22[(1'h0):(1'h0)],
                          (&reg17)}} ?
                  wire24 : $signed((reg19[(4'hd):(3'h7)] == (reg8 ^~ reg13)))));
              reg29 <= reg12;
              reg30 <= reg15;
            end
          else
            begin
              reg27 <= (reg10[(3'h5):(1'h1)] ?
                  ($unsigned(reg27) | (reg7[(3'h4):(3'h4)] ^~ $signed($unsigned(reg10)))) : reg5[(3'h4):(2'h3)]);
            end
          reg31 <= ($unsigned($unsigned($unsigned((wire26 & reg30)))) ?
              reg30 : (~&(wire25[(1'h0):(1'h0)] ?
                  (wire0[(4'hf):(3'h5)] ?
                      ((8'hbf) << reg22) : $signed(reg6)) : $signed(((8'hbc) ?
                      reg18 : (8'ha3))))));
          if (reg15)
            begin
              reg32 <= {$signed(($unsigned($signed((8'ha8))) == reg6[(3'h4):(2'h2)]))};
              reg33 <= $unsigned(wire23[(1'h0):(1'h0)]);
              reg34 <= $signed((wire3[(4'hb):(1'h0)] >= {(((7'h42) ?
                      reg27 : wire1) || (reg9 == wire0))}));
              reg35 <= $signed(wire25[(3'h4):(1'h0)]);
              reg36 <= $signed(wire23);
            end
          else
            begin
              reg32 <= reg5;
              reg33 <= reg12;
            end
          if ({$signed($signed({$unsigned(reg16)}))})
            begin
              reg37 <= reg13[(1'h1):(1'h0)];
              reg38 <= $unsigned(((+reg14) ?
                  $signed($signed((8'ha5))) : (^~(!{reg16}))));
              reg39 <= (!(-($signed({reg9}) || ($signed((8'hb7)) < wire3))));
            end
          else
            begin
              reg37 <= reg36[(1'h1):(1'h0)];
              reg38 <= $unsigned(({($signed((8'hbb)) - (^~wire1))} || reg36));
              reg39 <= reg28[(4'h8):(3'h6)];
            end
        end
      else
        begin
          reg27 <= ($unsigned((8'h9f)) ? (~^(~|reg28)) : reg21[(3'h6):(2'h3)]);
          if ((^~{(&(+reg8[(3'h4):(2'h2)])),
              (((8'hae) ?
                  ((8'ha4) + reg10) : (reg22 != wire1)) ~^ ($unsigned(reg31) && $unsigned((8'ha4))))}))
            begin
              reg28 <= $signed((-$unsigned((~|$signed(reg10)))));
              reg29 <= $signed(reg13);
              reg30 <= (^~$signed($signed(reg9[(4'he):(4'hc)])));
              reg31 <= $unsigned((({wire24, (wire23 ~^ reg27)} ?
                  (reg30 < reg27) : (reg17[(4'he):(1'h1)] || (~reg37))) && (reg19[(1'h1):(1'h0)] ^~ ((~(7'h41)) << $signed((8'h9d))))));
            end
          else
            begin
              reg28 <= reg14;
              reg29 <= ((-reg15) ?
                  ($signed($unsigned(reg7[(4'h9):(4'h9)])) ~^ (((reg19 + reg13) | {wire4}) || {(reg20 ?
                          reg21 : reg7),
                      $signed(reg36)})) : reg39);
              reg30 <= $signed(((8'ha6) ?
                  (((~^wire26) ? reg39 : $unsigned(reg30)) ?
                      (+{reg16, (8'hb3)}) : reg31) : $signed((reg20 <<< {reg17,
                      reg16}))));
              reg31 <= ((reg36 ?
                      ($unsigned({reg37}) ?
                          ((reg9 ? wire26 : reg19) ?
                              (reg6 ^ (8'hac)) : (~^wire25)) : $signed((~|wire23))) : reg31) ?
                  {wire1,
                      ((((8'ha5) >>> reg10) << $signed(wire23)) & (+(reg29 ?
                          wire1 : (8'hbf))))} : {{{reg7}, reg36}});
              reg32 <= $unsigned(reg30);
            end
          reg33 <= (^reg12);
          reg34 <= (|reg29[(3'h7):(2'h2)]);
        end
      reg40 <= (+reg30[(2'h3):(1'h0)]);
      reg41 <= $unsigned(reg29[(2'h2):(2'h2)]);
      reg42 <= (reg20[(1'h0):(1'h0)] ?
          wire23[(2'h3):(2'h2)] : (^{(8'hb8), (+reg14[(1'h1):(1'h1)])}));
    end
endmodule
