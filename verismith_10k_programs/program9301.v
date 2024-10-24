module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg8, reg7, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (~|((wire0[(2'h2):(1'h1)] ?
                     wire0[(4'hc):(4'h9)] : ($unsigned((8'ha9)) < (wire0 ?
                         wire2 : wire2))) != wire2));
  assign wire6 = wire1[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= $signed((~|($signed((wire1 ? wire3 : wire4)) ?
          wire1[(2'h2):(2'h2)] : wire0)));
      reg8 <= $unsigned(((~|($unsigned(wire6) - (wire5 - wire0))) ?
          $unsigned((~^(wire1 && (8'hb2)))) : ($signed({wire6}) ?
              $unsigned(wire4) : ((~^wire0) ^ (reg7 ? reg7 : wire3)))));
    end
endmodule
