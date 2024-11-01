module top
#(parameter param12 = (8'hb2), 
parameter param13 = (|(param12 ? param12 : (^((param12 >= param12) - (param12 - param12))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire5, wire4, reg11, reg10, reg9, reg8, reg7, reg6, (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = wire0[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= wire2[(4'h9):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg7 <= (wire0[(1'h1):(1'h0)] ?
          ((&wire1[(2'h3):(1'h0)]) * (&wire2[(1'h0):(1'h0)])) : $unsigned((8'haf)));
      reg8 <= {$unsigned(wire5), wire4[(2'h3):(2'h3)]};
      reg9 <= ((((8'hbf) ?
              (reg6 ^~ {wire3,
                  reg6}) : $signed($signed((8'hbf)))) << reg8[(2'h3):(1'h1)]) ?
          $unsigned($signed(({wire3, reg8} ?
              $unsigned(wire2) : (~wire4)))) : wire2[(2'h2):(2'h2)]);
      reg10 <= $signed(((reg7 >> $signed((wire0 ? wire5 : wire0))) ?
          (~{$unsigned(wire2),
              (reg6 ? (8'haf) : reg9)}) : reg7[(2'h2):(1'h0)]));
      reg11 <= $unsigned($signed($signed(reg10)));
    end
endmodule
