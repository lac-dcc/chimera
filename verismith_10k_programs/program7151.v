module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire9, wire7, wire6, wire5, reg8, (1'h0)};
  assign wire5 = wire3;
  assign wire6 = {(^~wire2)};
  assign wire7 = wire3[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg8 <= (~|$unsigned($unsigned((wire4[(1'h0):(1'h0)] ?
          ((7'h40) << wire5) : ((8'hb4) ? wire0 : wire0)))));
    end
  assign wire9 = {$signed(wire4)};
endmodule
