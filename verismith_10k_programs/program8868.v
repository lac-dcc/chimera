module top
#(parameter param26 = (8'hb6))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed((8'ha9));
  always
    @(posedge clk) begin
      if (((|wire5[(3'h5):(1'h0)]) - ($signed(((~|wire3) ?
          ((8'hbd) ~^ wire0) : (wire0 << wire0))) - wire1[(5'h11):(1'h0)])))
        begin
          reg6 <= wire1;
        end
      else
        begin
          reg6 <= {((wire4 ?
                      ((reg6 >= wire1) ?
                          reg6[(3'h7):(1'h0)] : {wire3}) : wire2) ?
                  $signed((~&{(8'haf), wire4})) : wire0),
              (wire1 - (($unsigned(wire2) ?
                  (8'ha1) : $signed(wire5)) >> (~^(wire3 > wire3))))};
          reg7 <= $signed(wire0[(4'h9):(2'h3)]);
          if (wire0[(3'h4):(2'h3)])
            begin
              reg8 <= ($unsigned((($signed(wire0) ?
                          (wire5 <= reg7) : (wire2 ? wire2 : reg7)) ?
                      $unsigned({wire0}) : $signed(((7'h42) - wire0)))) ?
                  reg6 : (+(reg7[(2'h3):(2'h3)] ?
                      $signed(wire1[(3'h5):(1'h1)]) : (wire1 ?
                          $signed(wire1) : $unsigned(wire2)))));
              reg9 <= (-$signed($unsigned((wire0[(2'h3):(1'h0)] >>> wire4))));
              reg10 <= wire2[(4'ha):(3'h7)];
              reg11 <= {($signed((~^$unsigned((8'hb4)))) ?
                      ((+{reg7, reg6}) ?
                          (~wire3) : $signed($unsigned(wire0))) : ((~&(8'hb2)) || wire0)),
                  $unsigned({(wire1[(3'h5):(3'h5)] > (wire5 ?
                          (8'hae) : reg10))})};
            end
          else
            begin
              reg8 <= (~|(reg7 ?
                  (($signed(wire3) > reg10) || $unsigned((reg11 ?
                      reg9 : reg11))) : (wire5 ^ (~|(^reg11)))));
              reg9 <= reg8[(2'h2):(1'h0)];
              reg10 <= $signed({wire3[(3'h4):(1'h0)], wire4[(2'h2):(2'h2)]});
            end
          reg12 <= wire4;
        end
      if ((!$unsigned(((&(8'hbd)) ?
          {(reg11 <<< (7'h43)), $unsigned(reg7)} : reg9))))
        begin
          reg13 <= (!reg6);
          reg14 <= ({(7'h41)} == (-(reg8[(1'h0):(1'h0)] ?
              (wire5 ? {reg10} : $unsigned(reg10)) : $signed($signed(reg8)))));
          reg15 <= (~^$signed((wire4 & ((-reg12) ?
              reg7[(4'hd):(4'h8)] : (wire0 ? (7'h41) : wire0)))));
          if ($unsigned($signed((~&((8'hba) ?
              (reg10 ? wire3 : (8'ha8)) : reg12)))))
            begin
              reg16 <= $unsigned($signed($signed($signed(reg6))));
              reg17 <= reg14[(1'h1):(1'h0)];
              reg18 <= $unsigned(({(|((8'hb8) ? reg17 : reg9))} == wire5));
              reg19 <= (^~$signed({{wire5, $signed(wire0)},
                  reg15[(1'h1):(1'h0)]}));
              reg20 <= {$unsigned(reg16)};
            end
          else
            begin
              reg16 <= reg9;
              reg17 <= ((({reg20[(3'h7):(3'h4)]} ?
                  (reg8 ~^ {(8'hb2),
                      reg16}) : reg14[(1'h1):(1'h0)]) >> (reg9 | ({reg19} ?
                  $signed(reg19) : wire4))) >> $signed((^~wire3[(4'h8):(3'h7)])));
              reg18 <= $signed((reg8[(3'h6):(3'h4)] ?
                  ($signed($unsigned(wire0)) << reg13[(1'h1):(1'h0)]) : $unsigned({wire5,
                      (reg14 && wire1)})));
              reg19 <= $unsigned(((8'ha9) <= wire4));
            end
        end
      else
        begin
          reg13 <= ($signed(reg6) ?
              reg16 : (-($signed($unsigned((7'h42))) ?
                  ((+wire1) >>> (reg11 | wire5)) : {(wire5 & wire1),
                      {wire2}})));
          reg14 <= $unsigned($unsigned(({reg14[(1'h1):(1'h0)],
              (reg16 ? reg7 : reg11)} & $unsigned((!reg6)))));
          reg15 <= $unsigned(reg14);
          reg16 <= wire5[(2'h3):(1'h1)];
          reg17 <= ($signed((&{$signed((8'ha4))})) ?
              (wire3[(1'h1):(1'h1)] ?
                  $unsigned(($unsigned(reg8) + (^~reg8))) : $unsigned(((reg15 ?
                      reg20 : (8'hae)) >> wire2))) : (({{reg9},
                  ((8'hb5) > wire4)} + wire2[(4'hb):(2'h2)]) * $unsigned(((wire1 ?
                      reg17 : reg17) ?
                  $unsigned(reg12) : wire2))));
        end
    end
  assign wire21 = (~&(($unsigned($unsigned(wire3)) ?
                          wire3[(4'h9):(1'h0)] : (((8'hb2) ?
                              reg14 : (8'hbc)) != {(7'h40), reg11})) ?
                      {$signed((wire0 && wire4)),
                          (8'hbc)} : $signed($signed($unsigned(reg14)))));
  assign wire22 = $unsigned(((^~({reg10, reg15} ?
                          ((7'h44) ? wire4 : wire3) : {reg19})) ?
                      wire3[(2'h3):(2'h2)] : (~&{(7'h41)})));
  assign wire23 = $signed((reg11 ?
                      (wire4 * reg10[(3'h7):(3'h7)]) : $signed((~^(reg17 ?
                          (8'hb5) : reg17)))));
  assign wire24 = ($signed((reg19[(4'h9):(3'h5)] ?
                      ((7'h40) ?
                          (wire3 >= reg11) : $unsigned(wire5)) : ((&reg7) >> ((8'ha5) != reg17)))) || $signed((reg6 ?
                      $unsigned(reg12[(4'h9):(3'h5)]) : {(wire21 * reg7)})));
  assign wire25 = $unsigned(((wire5 | $signed({wire3,
                      reg11})) || wire24[(4'h8):(1'h0)]));
endmodule
