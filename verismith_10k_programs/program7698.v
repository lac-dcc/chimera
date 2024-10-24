module top
#(parameter param28 = ((&((-(^~(7'h40))) <= (-(|(8'hab))))) ~^ {(((!(8'ha9)) << (+(8'ha3))) ? (~{(8'hac)}) : (((7'h42) ? (8'hb8) : (8'hb5)) || ((8'ha7) ? (8'hb5) : (8'ha2)))), (+(!((8'ha2) ? (7'h40) : (7'h44))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire18,
                 wire6,
                 wire5,
                 wire4,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
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
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire1[(4'ha):(3'h4)];
  assign wire6 = ($unsigned(wire1[(2'h3):(1'h1)]) & (!wire1));
  always
    @(posedge clk) begin
      reg7 <= ($unsigned((~&($unsigned(wire4) << (wire3 ?
          wire0 : (8'h9e))))) == wire3[(2'h3):(2'h3)]);
      reg8 <= ({($signed($signed(wire3)) ?
                  ($unsigned(wire1) >= (~|(8'h9f))) : $signed($unsigned(wire6))),
              ((8'ha3) - ((wire4 > wire4) ? $unsigned((8'hbe)) : (~(8'h9e))))} ?
          $signed($signed(($signed(wire3) + wire3))) : ($signed($unsigned((wire0 ?
                  wire1 : wire2))) ?
              wire0 : $unsigned(wire3)));
      if (wire0)
        begin
          reg9 <= $unsigned(wire1);
          reg10 <= (~&(((8'haa) >> $signed(wire5)) ?
              $signed($signed((reg9 == (8'hb6)))) : (wire2[(3'h5):(3'h4)] && ((8'hb0) >> $unsigned(reg7)))));
          if ({$signed(wire0[(4'h8):(1'h0)])})
            begin
              reg11 <= $signed((~^((wire1[(3'h7):(2'h3)] ?
                  wire5[(1'h0):(1'h0)] : (^(8'ha7))) ~^ wire2[(4'hb):(4'hb)])));
            end
          else
            begin
              reg11 <= wire0;
              reg12 <= ((^~(^~reg10)) ?
                  (reg8 ?
                      $signed(reg11[(4'hf):(1'h0)]) : reg10) : $unsigned($signed(wire6)));
              reg13 <= $signed(wire2);
              reg14 <= wire3;
              reg15 <= ($unsigned($unsigned((reg9[(2'h3):(1'h0)] ?
                  $unsigned((8'ha0)) : (reg8 ?
                      reg9 : wire6)))) << $signed({(wire1 | (wire6 ?
                      reg8 : reg10)),
                  $unsigned(((8'hbe) ? wire6 : reg12))}));
            end
          reg16 <= $unsigned($signed(reg9));
        end
      else
        begin
          reg9 <= {($unsigned($unsigned({reg15, wire1})) << wire1)};
          reg10 <= (~$signed(($signed((wire4 ? reg16 : wire6)) ?
              ((reg8 ?
                  reg13 : reg10) != (reg13 - wire2)) : ((~^(8'ha0)) - (8'hba)))));
          reg11 <= $signed($signed(reg16));
          reg12 <= $signed(wire4);
          if (({(+reg10)} ?
              wire0[(2'h3):(2'h2)] : ((&(&reg16[(4'hd):(4'hd)])) ?
                  wire4[(4'he):(3'h4)] : (reg16 <<< ((-reg8) ?
                      (wire0 ? wire0 : wire0) : (reg12 ? wire2 : reg11))))))
            begin
              reg13 <= (^~wire3);
              reg14 <= reg11;
              reg15 <= (reg11[(5'h11):(1'h1)] ?
                  $signed(((~|$unsigned(wire4)) == $unsigned(reg9[(3'h5):(3'h4)]))) : {(!(+(wire5 == reg11)))});
              reg16 <= ((+wire2[(4'hd):(4'ha)]) >> (!(~|$signed(wire3))));
              reg17 <= wire1[(1'h1):(1'h0)];
            end
          else
            begin
              reg13 <= {($signed(reg14[(3'h7):(3'h4)]) ?
                      $unsigned($unsigned((~|reg16))) : ({(wire5 >> reg16),
                              reg14} ?
                          reg11[(3'h5):(1'h1)] : $unsigned({(7'h44)})))};
            end
        end
    end
  assign wire18 = $unsigned($unsigned((wire0[(4'hc):(3'h7)] ?
                      $unsigned(wire1) : $signed((reg17 && wire2)))));
  always
    @(posedge clk) begin
      reg19 <= $signed((($unsigned((~reg7)) ~^ wire5) & reg13[(1'h1):(1'h0)]));
      reg20 <= wire5[(4'h8):(2'h3)];
      reg21 <= (-($unsigned(wire2) ?
          (($unsigned(reg15) ? wire0[(4'hc):(3'h6)] : (reg20 ? wire3 : wire4)) ?
              ((wire4 < reg9) ?
                  $unsigned((8'hbe)) : $unsigned(wire0)) : {$signed(wire4)}) : (reg15[(4'h8):(2'h3)] ?
              wire5[(4'ha):(3'h4)] : reg9)));
      if ((reg21[(5'h12):(3'h5)] <= {wire6, {(~&(wire6 || wire2))}}))
        begin
          reg22 <= ($unsigned(wire1[(3'h7):(2'h3)]) ?
              (8'hb4) : $unsigned(reg14));
          reg23 <= (!(reg21[(1'h0):(1'h0)] >> ((8'hb6) - $signed($signed(reg20)))));
          reg24 <= $unsigned((~&wire3));
          reg25 <= (reg23 ?
              $signed({reg9,
                  $unsigned(wire18[(1'h1):(1'h1)])}) : wire5[(4'ha):(2'h3)]);
        end
      else
        begin
          reg22 <= (((($signed(reg12) ?
                      $unsigned(reg7) : $signed(reg19)) || ((reg22 ~^ (8'ha6)) && (wire2 ?
                      reg10 : (7'h44)))) ?
                  (((^reg23) ?
                      $unsigned(reg17) : reg24[(4'h9):(2'h3)]) == (-$signed(reg14))) : (8'ha0)) ?
              (8'ha8) : $signed(reg10[(2'h3):(2'h2)]));
        end
    end
  assign wire26 = $signed({$unsigned(((reg10 ? wire1 : (8'hbb)) ?
                          wire4 : reg23[(4'hb):(1'h1)])),
                      $signed($signed(reg24))});
  assign wire27 = reg15;
endmodule
