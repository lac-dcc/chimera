module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
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
      if (($unsigned((&$signed($unsigned(wire1)))) & $signed($signed(((~wire1) ?
          (wire0 ? wire2 : wire2) : $unsigned(wire2))))))
        begin
          reg4 <= {$unsigned(wire3),
              {(wire0 ?
                      (wire1[(2'h2):(1'h1)] ~^ wire3) : $unsigned($signed(wire3)))}};
          reg5 <= wire0[(1'h1):(1'h1)];
          reg6 <= $unsigned(((-{wire1[(3'h4):(2'h3)]}) >>> ((8'hac) ?
              wire0[(4'hb):(4'hb)] : (wire1[(2'h2):(2'h2)] ?
                  {wire1} : (^~wire0)))));
          reg7 <= $unsigned($unsigned((-(((8'hb8) ?
              reg4 : reg5) > (wire2 < wire1)))));
          reg8 <= (8'ha9);
        end
      else
        begin
          reg4 <= $unsigned(reg5[(2'h2):(2'h2)]);
        end
      if (((wire3 * $signed($signed($unsigned(reg7)))) ?
          ($unsigned(wire1) ?
              $unsigned(reg7[(4'hd):(4'h9)]) : $signed($unsigned((-reg7)))) : reg4))
        begin
          reg9 <= {($signed((wire1 << (~&reg5))) ?
                  (^($unsigned(reg8) ?
                      $unsigned(wire1) : $signed(reg8))) : ((8'hab) ?
                      wire2[(3'h7):(3'h5)] : $unsigned((8'ha0)))),
              (&$unsigned(reg8))};
          if ((((8'hb1) <= $unsigned(((reg6 ? reg8 : reg5) ~^ wire2))) ?
              reg4 : reg7[(4'hb):(3'h6)]))
            begin
              reg10 <= $unsigned(reg8[(5'h10):(3'h7)]);
            end
          else
            begin
              reg10 <= (8'haf);
              reg11 <= (8'hb4);
              reg12 <= {$signed((-$signed((~^reg10)))),
                  (reg6 ^ $signed(reg4[(3'h5):(2'h3)]))};
            end
          if ((reg4[(3'h5):(3'h4)] ?
              {(((reg6 ? reg8 : reg11) >>> reg11) ?
                      ((~wire0) ?
                          $unsigned((8'ha3)) : wire1) : ($signed(reg11) >> wire0)),
                  $unsigned($signed(reg4[(5'h13):(4'ha)]))} : ({$signed((|(8'h9f))),
                      ((reg10 & (8'ha6)) ?
                          (reg7 ? reg11 : reg10) : wire1[(3'h6):(2'h2)])} ?
                  {$unsigned((reg11 ? reg4 : reg9)),
                      (^$signed(reg6))} : $signed(((wire0 != reg6) ~^ wire0[(1'h1):(1'h0)])))))
            begin
              reg13 <= (-$unsigned((reg4[(5'h13):(1'h1)] ?
                  (~&reg9[(1'h1):(1'h1)]) : ({reg11} | {(8'hae)}))));
              reg14 <= reg11[(5'h11):(4'he)];
              reg15 <= reg12[(3'h4):(2'h3)];
              reg16 <= $unsigned(reg10);
              reg17 <= ((($signed(reg14) + $unsigned((reg14 ?
                      reg5 : wire2))) * $unsigned($unsigned(reg13[(2'h3):(2'h3)]))) ?
                  $signed(($signed((reg16 | reg16)) < (~(7'h42)))) : {($signed(reg12[(2'h3):(1'h0)]) << ($signed(reg4) ?
                          $signed(reg13) : $unsigned((7'h43)))),
                      $unsigned($signed((^reg14)))});
            end
          else
            begin
              reg13 <= reg16[(1'h0):(1'h0)];
              reg14 <= reg12[(1'h1):(1'h0)];
              reg15 <= reg5;
              reg16 <= reg15[(4'hd):(3'h5)];
              reg17 <= {{(~^wire1), reg8},
                  ($signed($unsigned((~^reg16))) >= ($unsigned((wire3 - (8'hb9))) - ((!reg17) ?
                      (reg15 ? reg13 : wire2) : (reg12 ? reg4 : (8'hb7)))))};
            end
          if ($signed($signed(reg8[(2'h3):(1'h1)])))
            begin
              reg18 <= reg5[(1'h0):(1'h0)];
              reg19 <= (~^(8'hb6));
              reg20 <= (({reg18} ?
                  (reg5 << reg6) : (!$unsigned(reg17))) <<< (~^reg15));
              reg21 <= (((~|$unsigned((~|reg4))) < (~|$unsigned((-wire0)))) ?
                  $unsigned((~&{(reg19 < reg20)})) : ((({reg6} ?
                          reg11 : ((8'hb1) <= (8'ha5))) ?
                      (8'had) : ((+reg16) ?
                          (reg4 >> reg12) : (reg9 ?
                              reg17 : wire2))) >> $signed(reg7[(3'h4):(2'h3)])));
            end
          else
            begin
              reg18 <= ((reg15[(4'h9):(3'h7)] >>> reg8[(5'h12):(4'ha)]) * ($unsigned($signed($signed((8'ha9)))) && {wire2}));
            end
        end
      else
        begin
          reg9 <= $unsigned(({$unsigned((reg18 ? (8'hab) : reg7)),
              $unsigned(reg6[(1'h0):(1'h0)])} ^~ (($signed((8'hbb)) ?
              (reg5 | reg5) : $unsigned(reg4)) * reg6)));
        end
      if ((+{wire2, wire0}))
        begin
          reg22 <= reg6[(1'h0):(1'h0)];
          reg23 <= reg12[(3'h4):(1'h0)];
          reg24 <= $unsigned(reg4[(2'h2):(1'h0)]);
        end
      else
        begin
          reg22 <= {(~&$unsigned((reg24 ^ $signed(reg4))))};
          reg23 <= reg8[(4'h9):(3'h4)];
        end
      if (wire2)
        begin
          reg25 <= ({($unsigned((reg18 - reg14)) ?
                      ((reg19 ? reg16 : reg20) ~^ $signed(reg14)) : reg4),
                  (+((reg6 ? reg4 : reg11) ?
                      $unsigned((8'haf)) : $signed(reg6)))} ?
              $signed(($signed($signed((8'hb5))) & reg21[(3'h5):(1'h1)])) : $signed(($unsigned((~(8'ha1))) >= ((reg20 == (8'ha6)) >> reg19[(4'h8):(1'h1)]))));
        end
      else
        begin
          reg25 <= reg21;
        end
    end
  assign wire26 = $unsigned(($signed($signed(reg11)) ?
                      wire2[(4'ha):(1'h1)] : reg22));
  assign wire27 = ((~wire2[(2'h3):(1'h0)]) ?
                      (+$unsigned({(reg17 ? reg7 : reg10),
                          (~&reg9)})) : (~|reg22[(3'h5):(3'h4)]));
  assign wire28 = (wire1 ?
                      {reg4[(5'h15):(3'h4)],
                          (~&$unsigned($signed(reg10)))} : $signed((reg24[(2'h2):(1'h1)] >= $unsigned((~|reg15)))));
  assign wire29 = ($unsigned(((&$unsigned(reg5)) ?
                          $unsigned(reg12[(1'h1):(1'h1)]) : reg11)) ?
                      $signed((reg4 ^ $signed(reg22))) : $signed(((&(+reg23)) > reg22)));
  assign wire30 = (reg17 ?
                      $signed(({(reg22 ^~ reg24),
                          reg25[(1'h1):(1'h1)]} * ((reg19 ? reg9 : reg7) ?
                          $unsigned(reg12) : (&reg16)))) : (wire26[(1'h1):(1'h1)] & ((~|(^reg6)) >> {{reg15},
                          wire1[(2'h2):(1'h1)]})));
endmodule
