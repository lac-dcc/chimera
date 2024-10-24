module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire9, wire7, wire6, wire5, reg8, (1'h0)};
  assign wire5 = (&wire3[(2'h2):(1'h0)]);
  assign wire6 = $signed((~&$unsigned((~&wire1))));
  assign wire7 = wire2[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg8 <= wire7;
    end
  assign wire9 = ((!wire7) ?
                     wire1[(4'hc):(4'h9)] : {(wire5[(1'h0):(1'h0)] & wire3[(4'ha):(3'h5)])});
endmodule
