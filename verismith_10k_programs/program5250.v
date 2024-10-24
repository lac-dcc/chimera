module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire10;
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire10,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($unsigned($signed(wire1[(3'h6):(1'h0)])));
      reg5 <= ($unsigned(((-wire0) >>> wire1[(3'h7):(3'h6)])) ?
          {{(&$unsigned((8'hb4)))}} : $signed($signed($unsigned($unsigned(reg4)))));
      reg6 <= ($signed(({wire0[(4'he):(3'h5)]} ?
              $unsigned($unsigned(wire1)) : ((8'ha4) ?
                  wire0[(2'h3):(1'h0)] : (wire3 ? wire2 : (7'h42))))) ?
          $signed($unsigned((-(reg4 ?
              (8'h9e) : wire3)))) : (reg5[(3'h7):(3'h6)] == $signed(wire0)));
      if ((-(($unsigned((^~reg4)) ?
              (~^$unsigned(wire2)) : $unsigned((wire3 ~^ reg6))) ?
          reg5[(1'h1):(1'h1)] : {reg6,
              (reg5[(5'h11):(3'h5)] <= $unsigned(wire1))})))
        begin
          reg7 <= (~^((!$signed(((8'hae) ? reg4 : wire1))) ?
              $signed(reg4) : wire1[(4'hd):(2'h2)]));
          reg8 <= ($signed($signed(wire1)) ^ ($signed(((reg5 - (8'hab)) >>> reg4[(3'h7):(3'h5)])) ?
              reg6 : reg6));
          reg9 <= (wire3 ?
              wire2 : ({($unsigned(reg4) | {wire3})} ?
                  (|($unsigned(wire0) ?
                      (wire1 * (8'hbf)) : wire0)) : {$unsigned($unsigned(wire2)),
                      (8'ha7)}));
        end
      else
        begin
          reg7 <= $signed(reg4[(2'h3):(1'h0)]);
        end
    end
  assign wire10 = (((($signed(reg9) < $unsigned(wire0)) ~^ (~{reg6, reg6})) ?
                      (~|$signed((8'h9c))) : (reg7[(1'h0):(1'h0)] ?
                          wire3[(4'h9):(3'h7)] : wire2[(4'hd):(2'h3)])) != $unsigned(({(~wire1),
                      {reg4, wire1}} << ((8'hbd) != reg8))));
  always
    @(posedge clk) begin
      reg11 <= ((|($unsigned($unsigned(reg5)) ?
          (reg5 ?
              $unsigned(wire2) : (wire0 ? reg5 : reg6)) : ((reg6 != (8'hab)) ?
              (reg4 < wire2) : (reg7 + reg4)))) <<< reg7[(2'h2):(2'h2)]);
      reg12 <= $unsigned((^~($unsigned(((8'ha5) << reg9)) ?
          ((!(8'ha3)) && $signed(wire1)) : ($unsigned((8'hb5)) - (-(8'ha6))))));
    end
  always
    @(posedge clk) begin
      reg13 <= {wire3};
      reg14 <= (wire3[(4'hc):(2'h3)] + (reg9[(2'h3):(1'h0)] > ((7'h44) > ((wire10 <= (8'h9e)) || $signed(reg4)))));
    end
  assign wire15 = ((~^(8'h9e)) >>> (wire3 == $signed($unsigned((-reg14)))));
  assign wire16 = $unsigned({($unsigned({reg4}) & ({reg6, (8'hb7)} >= (-reg6))),
                      {(wire10 ? {(7'h42)} : (reg12 ? reg12 : reg7)),
                          ($unsigned(wire15) ?
                              wire0[(5'h10):(1'h0)] : (wire2 ?
                                  wire15 : wire1))}});
endmodule
