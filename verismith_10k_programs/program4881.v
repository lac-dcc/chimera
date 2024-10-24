module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire10;
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$signed(wire2[(1'h1):(1'h0)])};
      reg6 <= (wire3[(3'h4):(2'h3)] ?
          $unsigned($signed(wire0)) : wire2[(1'h0):(1'h0)]);
      reg7 <= {(~^$unsigned({reg6, (reg5 ? wire1 : (8'ha3))})), reg6};
      reg8 <= wire4;
      if ({((^~(+(|wire1))) ?
              (~|($unsigned(reg7) ?
                  $signed((8'hb2)) : {reg6, (8'ha3)})) : reg8),
          wire1})
        begin
          reg9 <= wire1;
        end
      else
        begin
          reg9 <= ($unsigned($signed(((reg8 & reg8) | $unsigned(wire4)))) - wire0[(3'h7):(2'h3)]);
        end
    end
  assign wire10 = ((reg8 ~^ {{(wire3 ? wire2 : reg5)}}) ?
                      {reg5[(3'h4):(1'h1)],
                          (-wire2[(2'h2):(2'h2)])} : (&$unsigned(({reg5} <= (~reg6)))));
  always
    @(posedge clk) begin
      reg11 <= (!(^$signed({wire1[(4'hb):(2'h2)]})));
      reg12 <= $signed((~^(8'hac)));
      reg13 <= {(|wire1[(4'hf):(3'h6)])};
      reg14 <= wire1;
    end
  assign wire15 = {($signed(wire3) ?
                          ($unsigned($signed(reg7)) ?
                              wire10 : $signed((reg5 || reg11))) : $signed(wire4))};
endmodule
