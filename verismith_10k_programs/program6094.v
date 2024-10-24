module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg8, reg7, (1'h0)};
  assign wire4 = wire0[(3'h4):(1'h0)];
  assign wire5 = ($signed(($signed(wire1[(2'h2):(1'h1)]) ?
                     wire3[(4'hb):(3'h7)] : wire3)) <= (wire4 ?
                     (wire3 ?
                         (wire4[(5'h14):(4'he)] >>> $unsigned(wire1)) : $signed($unsigned(wire1))) : $signed(wire0)));
  assign wire6 = {$signed($unsigned((&(wire2 == wire4)))),
                     $signed($unsigned((wire0[(1'h1):(1'h1)] ?
                         wire5[(4'h9):(3'h4)] : (8'hb4))))};
  always
    @(posedge clk) begin
      reg7 <= wire2;
      reg8 <= wire6[(1'h1):(1'h0)];
    end
endmodule
