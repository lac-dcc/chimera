module top
#(parameter param21 = ((!{({(7'h40)} ^ {(8'hb8), (7'h41)}), (((8'hbd) ? (8'hac) : (8'hae)) ? ((8'ha3) ? (8'ha0) : (8'haa)) : (!(8'hbf)))}) << ((~|{((8'ha2) ? (8'hb6) : (8'ha6))}) ? (^~(((8'hae) ? (8'hbd) : (7'h40)) ? ((8'ha4) == (8'h9d)) : ((7'h44) & (8'ha7)))) : {{((8'hb9) ? (8'haa) : (8'hb8))}, ({(8'h9d)} ~^ ((8'hae) << (8'ha7)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire6,
                 wire5,
                 wire4,
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
  assign wire4 = wire3;
  assign wire5 = wire2;
  assign wire6 = $unsigned($unsigned((~($unsigned((8'hb5)) ? wire1 : wire0))));
  always
    @(posedge clk) begin
      reg7 <= $signed((^$unsigned((~|(+wire0)))));
    end
  always
    @(posedge clk) begin
      if ({(~$signed($unsigned((wire2 ^ wire4)))), wire6})
        begin
          reg8 <= ($unsigned(wire1) ?
              (reg7[(2'h2):(1'h1)] ?
                  (8'ha7) : wire0[(2'h2):(1'h0)]) : wire6[(1'h0):(1'h0)]);
          reg9 <= ((((|(wire6 < wire2)) ?
                      (^~{wire0}) : $unsigned((reg8 ? wire0 : (8'haf)))) ?
                  $signed((~|(^wire3))) : wire5) ?
              $signed(((wire6 < ((8'hb2) >= wire5)) + $unsigned($signed(reg7)))) : {wire0,
                  reg8[(3'h5):(1'h0)]});
        end
      else
        begin
          reg8 <= (((wire0 ? (8'haa) : reg9[(3'h5):(3'h5)]) ?
                  (wire4[(3'h6):(2'h2)] ?
                      wire4 : ((wire3 || (8'hb2)) == (reg7 <<< wire1))) : ({(wire3 ?
                              wire2 : wire1)} ?
                      $unsigned(wire6) : reg9)) ?
              $unsigned($unsigned(reg8)) : ($unsigned(wire3[(3'h4):(3'h4)]) < (-{wire3[(2'h3):(2'h2)],
                  $signed((8'ha7))})));
          reg9 <= (({$signed($signed(wire5)), reg8} ?
              reg8[(4'h9):(4'h9)] : ((((8'hb4) ? wire5 : reg7) ?
                  (reg9 ^ wire0) : $signed((8'had))) | $unsigned((+wire6)))) <<< (8'ha3));
          if (wire1)
            begin
              reg10 <= reg7;
              reg11 <= (~{(((wire1 ^~ (8'hae)) ?
                      reg10[(1'h1):(1'h0)] : $signed((8'ha2))) & reg8[(3'h7):(3'h5)])});
            end
          else
            begin
              reg10 <= reg9;
              reg11 <= $unsigned((($signed($signed(wire1)) ?
                      {(wire3 <<< wire0)} : $unsigned($unsigned((8'hb7)))) ?
                  wire0[(2'h3):(2'h2)] : (!{reg7, (reg8 >= wire3)})));
              reg12 <= ($unsigned($unsigned({{wire3}, wire0[(1'h1):(1'h0)]})) ?
                  ((^(+reg7[(2'h2):(1'h0)])) ?
                      ((&$signed((8'had))) == reg8[(3'h5):(2'h2)]) : $signed({(wire6 >>> reg7)})) : ((~wire5[(4'hf):(3'h7)]) ?
                      $unsigned(reg8[(2'h3):(1'h0)]) : (8'ha9)));
              reg13 <= $unsigned($signed((reg11[(3'h6):(3'h5)] < ($signed(reg8) && wire0[(1'h1):(1'h1)]))));
              reg14 <= wire5;
            end
          reg15 <= $unsigned(wire4[(4'hd):(3'h5)]);
        end
      reg16 <= $unsigned($signed($signed((wire0 ? {wire6} : wire6))));
      reg17 <= (wire0 ?
          (8'h9d) : $signed({reg15, $unsigned((reg12 << wire5))}));
    end
  assign wire18 = reg14;
  assign wire19 = wire18[(2'h2):(2'h2)];
  assign wire20 = wire18[(3'h4):(1'h0)];
endmodule
