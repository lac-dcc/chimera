module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg9, reg8, (1'h0)};
  assign wire5 = (~^({$unsigned(wire1[(3'h6):(3'h5)]),
                         (wire3 << (wire1 ? wire4 : (7'h40)))} ?
                     $signed($unsigned((wire3 ^~ wire1))) : wire0[(1'h0):(1'h0)]));
  assign wire6 = ((wire3 ? wire1[(2'h3):(2'h3)] : (8'hac)) ?
                     $unsigned({$unsigned(wire5),
                         (wire3 + (wire1 ?
                             wire1 : wire1))}) : ($signed(wire0) << wire0[(1'h1):(1'h0)]));
  assign wire7 = (-(($signed(wire2) | $signed((~|(7'h43)))) - (~(~|(&wire2)))));
  always
    @(posedge clk) begin
      reg8 <= ({$unsigned(($signed(wire1) >= (|wire1)))} || wire5[(2'h3):(1'h1)]);
      reg9 <= $signed(reg8[(1'h1):(1'h0)]);
    end
endmodule
