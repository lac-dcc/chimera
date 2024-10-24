module top
#(parameter param22 = ((((-((8'hb9) ? (8'ha3) : (8'ha0))) ? {((8'ha2) << (8'haa)), (&(8'hbf))} : (((8'hb7) ? (8'hbc) : (8'hae)) ? ((7'h42) <= (8'hbc)) : {(8'h9c), (8'hb0)})) ? ((((8'hae) << (8'haf)) ? ((8'ha2) <<< (8'hbd)) : ((8'hb8) < (7'h44))) != (~&((8'hbc) ~^ (8'hbf)))) : (~^((|(8'haa)) ? ((8'had) && (8'h9f)) : ((8'h9d) ? (8'hbd) : (8'had))))) ? (((((7'h40) >>> (7'h43)) ? ((8'hb2) ? (7'h40) : (7'h42)) : ((7'h42) ? (8'hbf) : (8'haa))) & (8'hab)) != (7'h42)) : (({((7'h40) | (8'ha8)), (!(8'ha5))} ? {(^~(8'hb5)), ((8'ha8) ? (8'ha7) : (8'ha6))} : (((7'h42) ? (8'ha8) : (8'ha8)) ? ((8'ha4) == (7'h43)) : (8'hae))) >>> (&(((8'hbd) ? (8'ha3) : (8'h9f)) ? ((8'hb8) ? (8'hbe) : (8'hb2)) : {(8'h9f)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = (((8'ha9) >> wire0[(4'hc):(1'h0)]) ?
                     $unsigned((!$unsigned((-wire2)))) : ((&$signed(wire1)) ?
                         (((wire4 + wire0) && wire3) ~^ ((8'ha8) ?
                             (wire2 ?
                                 wire2 : wire1) : $unsigned((8'h9c)))) : (~&$unsigned((-wire3)))));
  assign wire7 = (|((((7'h44) ? (^~wire2) : {wire5, wire6}) & wire6) ?
                     (~&$unsigned(wire4)) : (|wire5)));
  always
    @(posedge clk) begin
      reg8 <= $signed($unsigned({(+$signed(wire6))}));
      reg9 <= (&(8'hbf));
      reg10 <= $unsigned($unsigned((((~^wire2) & (~wire6)) ?
          (wire3 - wire6) : (wire7[(4'h8):(2'h3)] - $signed(wire2)))));
      if (reg9)
        begin
          reg11 <= (|$unsigned((wire2 - (8'ha3))));
        end
      else
        begin
          reg11 <= $signed((~(reg9 ?
              $signed((wire4 + wire5)) : $signed((+wire7)))));
        end
    end
  assign wire12 = $unsigned((|$signed((8'hb5))));
  always
    @(posedge clk) begin
      reg13 <= $signed($signed((&($signed((7'h44)) >> {reg11, reg9}))));
      reg14 <= (!(!$signed({{(8'hbf), wire1}, $signed(wire5)})));
      reg15 <= $signed(((wire2 ?
              (wire0 ? (wire12 ? reg10 : wire5) : reg11) : $unsigned((wire7 ?
                  reg13 : wire2))) ?
          $unsigned($signed($unsigned(wire7))) : ({$signed(wire4)} ?
              (~^(wire0 ? wire7 : wire5)) : $unsigned($unsigned(wire6)))));
      reg16 <= (-$signed(wire1[(1'h1):(1'h0)]));
      reg17 <= $signed((|(($signed(wire3) ?
          wire0[(3'h5):(3'h5)] : $unsigned(reg13)) >> (~^((8'hab) ?
          wire7 : (8'hb1))))));
    end
  assign wire18 = (&reg11);
  assign wire19 = $signed(({$unsigned((^~reg14))} ^ reg8));
  assign wire20 = $signed($unsigned(((reg10[(3'h6):(3'h4)] & ((8'hbd) <<< wire2)) ?
                      (-(~reg15)) : wire19)));
  assign wire21 = (wire2[(3'h7):(2'h2)] << $signed($signed($unsigned((+reg10)))));
endmodule
