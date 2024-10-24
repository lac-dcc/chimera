module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg10, reg9, reg8, (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = wire0;
  assign wire7 = $unsigned((({$unsigned(wire6),
                     (wire3 & wire6)} ^ wire1[(1'h0):(1'h0)]) + (~&wire5[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire7[(4'hb):(4'ha)]);
      reg9 <= wire3;
      reg10 <= ((({$signed(wire7)} ?
          wire1[(2'h3):(2'h3)] : (^~(~|(8'hb8)))) == $unsigned($unsigned($unsigned(wire6)))) >>> wire4);
    end
endmodule
