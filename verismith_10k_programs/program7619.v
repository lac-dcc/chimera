module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire38,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg46,
                 reg45,
                 reg44,
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
      reg5 <= $signed(wire0);
      reg6 <= (8'ha4);
      if (reg6[(3'h6):(2'h2)])
        begin
          reg7 <= (((8'hb3) ?
              wire1 : wire2[(4'he):(3'h7)]) ^~ $unsigned($unsigned((~(~wire2)))));
          if ((((wire3[(2'h2):(2'h2)] <= ($signed(wire2) ?
                  reg6[(3'h4):(1'h1)] : (wire2 & wire0))) * (^(8'ha3))) ?
              {(^~(~(wire1 ? wire2 : (8'ha2))))} : reg6[(4'h8):(3'h5)]))
            begin
              reg8 <= (reg7[(4'hd):(3'h6)] ?
                  {(8'ha9),
                      ((reg6[(3'h4):(2'h2)] ?
                          $unsigned(wire1) : {reg7, wire3}) - ($signed(reg6) ?
                          (|wire4) : wire4))} : $signed((wire2 - {reg7,
                      (wire1 ^ wire4)})));
              reg9 <= {reg6};
            end
          else
            begin
              reg8 <= $signed((&(wire2[(4'h9):(3'h6)] ~^ {reg8, (~^(8'hb6))})));
              reg9 <= $signed(wire2[(4'he):(3'h7)]);
              reg10 <= $unsigned((reg9[(1'h0):(1'h0)] ?
                  $unsigned($signed((wire4 ? (7'h41) : (8'ha2)))) : (^~wire2)));
            end
          if ($unsigned(wire2))
            begin
              reg11 <= wire1[(2'h3):(2'h3)];
              reg12 <= ((~&reg7[(3'h4):(1'h0)]) ^ (~($signed($unsigned(reg6)) != (7'h44))));
              reg13 <= $unsigned({$unsigned($unsigned(((8'hb3) ?
                      wire2 : reg8))),
                  wire2[(3'h6):(3'h6)]});
            end
          else
            begin
              reg11 <= {(reg9[(1'h1):(1'h0)] > $signed(((~reg12) + {(8'hb7)})))};
              reg12 <= reg12[(3'h7):(3'h6)];
              reg13 <= $signed(wire1);
              reg14 <= (({wire4,
                      $signed(reg9[(1'h0):(1'h0)])} < ($unsigned(wire1[(2'h2):(1'h0)]) <= $signed(((8'ha4) ?
                      wire0 : wire2)))) ?
                  reg7 : wire2);
              reg15 <= (((|{wire4, (reg12 - wire2)}) + $unsigned(reg5)) ?
                  reg12[(1'h1):(1'h1)] : $signed(wire2));
            end
        end
      else
        begin
          reg7 <= (reg8 >> (~(+reg8)));
          reg8 <= $unsigned(reg15[(3'h7):(2'h3)]);
          reg9 <= $unsigned($signed((8'hb0)));
          reg10 <= {$unsigned($signed({$unsigned(reg8)}))};
        end
    end
  assign wire16 = reg13[(4'h8):(3'h4)];
  assign wire17 = wire16[(4'h9):(3'h6)];
  assign wire18 = wire1[(3'h4):(2'h2)];
  assign wire19 = (^~$signed((reg7[(3'h5):(2'h2)] ?
                      ($signed(reg9) ?
                          $unsigned((8'ha6)) : $signed(reg9)) : reg15)));
  assign wire20 = $signed(reg8[(4'hd):(1'h0)]);
  assign wire21 = {$unsigned($signed((~^((8'hbd) != wire17))))};
  always
    @(posedge clk) begin
      reg22 <= (&reg6);
      reg23 <= (~($unsigned(($signed(wire18) ? $signed(reg5) : wire21)) ?
          (({wire17} < $signed(reg6)) <= reg14) : (-$unsigned($unsigned(reg14)))));
    end
  always
    @(posedge clk) begin
      if ($signed(($unsigned($signed((wire4 * reg11))) ?
          $signed((^~{reg15, wire17})) : reg15)))
        begin
          reg24 <= ($signed($signed((((8'ha9) ^~ reg22) ?
              wire2 : wire19[(3'h4):(3'h4)]))) ^ wire2[(4'hc):(1'h0)]);
          reg25 <= reg22;
          reg26 <= reg14;
        end
      else
        begin
          reg24 <= ({((-(reg24 + reg7)) + reg13[(5'h10):(1'h0)]),
                  ($signed(wire20) ?
                      ((+wire1) < $signed(reg25)) : {(reg8 - wire4),
                          (reg25 ? reg23 : (8'h9e))})} ?
              $unsigned(reg13[(5'h13):(4'ha)]) : wire3);
        end
    end
  always
    @(posedge clk) begin
      reg27 <= (reg11 != $signed((^$signed(wire16))));
      reg28 <= (8'h9c);
      if ({($signed((^~$unsigned(wire2))) ~^ (!$unsigned(wire1[(1'h0):(1'h0)]))),
          reg6[(3'h4):(2'h2)]})
        begin
          reg29 <= (((reg22 * ((reg22 ^~ reg15) << $unsigned(wire18))) ?
              $signed(reg24) : (({reg22, reg5} != (~|reg11)) ?
                  reg27[(2'h3):(1'h0)] : (^(reg24 && (8'hb7))))) == reg5[(3'h4):(2'h2)]);
        end
      else
        begin
          reg29 <= wire1;
          reg30 <= wire21[(4'h9):(4'h8)];
          if ({(reg13 | reg23[(3'h4):(2'h2)])})
            begin
              reg31 <= ($signed(wire2) ?
                  {(7'h41)} : (((~&reg28) < $unsigned($signed(reg9))) <<< (((wire17 ?
                          reg9 : reg7) << $signed(reg29)) ?
                      $unsigned((~|reg30)) : (~|(wire20 || reg24)))));
              reg32 <= (~$unsigned({$unsigned($unsigned(reg31)),
                  reg29[(3'h5):(2'h2)]}));
            end
          else
            begin
              reg31 <= {$unsigned($unsigned(wire2))};
              reg32 <= $unsigned(reg28[(3'h5):(2'h3)]);
              reg33 <= (~$unsigned(({{reg24, reg22}} ?
                  $unsigned($signed(reg28)) : reg28)));
              reg34 <= (+reg27[(3'h4):(3'h4)]);
            end
          reg35 <= $unsigned($signed(((^~$unsigned(reg6)) ?
              reg13[(5'h10):(4'ha)] : $unsigned($unsigned(wire3)))));
        end
      reg36 <= ($unsigned($signed((~^$unsigned(reg32)))) ?
          $signed(reg12) : reg5);
      reg37 <= $unsigned(((~&(reg24[(4'he):(2'h2)] ?
          (~&wire3) : reg32[(1'h0):(1'h0)])) <= reg15[(3'h4):(1'h1)]));
    end
  assign wire38 = (^($unsigned(reg22[(3'h7):(3'h4)]) < reg32[(4'h9):(3'h4)]));
  always
    @(posedge clk) begin
      if ((8'hbf))
        begin
          reg39 <= (8'hbd);
          if ($signed((((+$signed(reg30)) && wire18) || reg27)))
            begin
              reg40 <= $signed((wire0 + (($signed(reg39) ?
                      (~&reg35) : reg22[(3'h5):(3'h4)]) ?
                  ({reg8} <<< reg12[(2'h3):(1'h1)]) : ($signed(reg6) ?
                      $unsigned(reg26) : (wire21 ? (8'h9f) : wire2)))));
              reg41 <= reg8[(4'hd):(3'h7)];
              reg42 <= $unsigned(reg10);
              reg43 <= (+(8'hb0));
            end
          else
            begin
              reg40 <= reg31[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg39 <= $signed((8'ha0));
          reg40 <= {$signed($unsigned($signed((reg37 ? reg15 : wire4))))};
          reg41 <= (~^((($signed((8'hb6)) ?
                  $unsigned(reg22) : $unsigned((8'ha9))) - $signed(reg15[(2'h3):(1'h0)])) ?
              $unsigned(reg33) : ((7'h40) >= reg28)));
          if (reg24)
            begin
              reg42 <= $signed($signed($signed($unsigned(((8'ha7) >= reg9)))));
              reg43 <= reg12;
              reg44 <= reg35;
            end
          else
            begin
              reg42 <= $unsigned($signed(wire4));
              reg43 <= (+$signed(($signed({(8'hae), reg24}) > (+wire2))));
              reg44 <= reg24[(3'h6):(2'h3)];
              reg45 <= $signed(reg39[(2'h3):(2'h2)]);
              reg46 <= $unsigned({(8'h9f),
                  (reg12 > ($signed((8'h9c)) && ((8'ha2) ? (8'h9f) : reg9)))});
            end
        end
    end
endmodule
