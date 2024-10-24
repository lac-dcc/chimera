module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire6, wire5, wire4, reg9, reg8, reg7, (1'h0)};
  assign wire4 = $unsigned((((wire2 ? $unsigned(wire0) : $signed((7'h44))) ?
                     {wire1} : ((wire3 >> wire0) >> $unsigned(wire2))) && $unsigned(wire1[(4'h8):(3'h4)])));
  assign wire5 = {wire4,
                     (wire3 ? $signed(wire1) : (|$unsigned((wire4 ~^ wire0))))};
  assign wire6 = (wire1 ~^ wire1);
  always
    @(posedge clk) begin
      reg7 <= $signed((wire6 + (~&($unsigned(wire2) * (!wire0)))));
      reg8 <= (&wire4[(4'hf):(4'hb)]);
      reg9 <= {((wire4 <<< wire6[(3'h5):(3'h5)]) ?
              wire6 : (+wire1[(4'h9):(3'h4)]))};
    end
  assign wire10 = reg9;
endmodule
