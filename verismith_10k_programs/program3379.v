module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire10, wire6, wire5, wire4, reg9, reg8, reg7, (1'h0)};
  assign wire4 = ($unsigned({{(-(8'ha8)),
                         wire2}}) == $signed((wire0[(2'h3):(1'h0)] * ($signed(wire2) != (wire3 + wire1)))));
  assign wire5 = $signed(wire3);
  assign wire6 = wire4[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg7 <= $unsigned({$signed((~^wire0)), wire4[(2'h2):(1'h0)]});
      reg8 <= $signed((((wire0[(1'h1):(1'h1)] ?
          wire6 : $signed((8'ha8))) << wire5[(1'h1):(1'h0)]) && wire2[(5'h10):(4'hd)]));
      reg9 <= {wire2, wire0};
    end
  assign wire10 = $signed(((wire4[(3'h5):(3'h5)] ?
                      $signed(wire1) : $signed((reg7 ?
                          reg8 : wire2))) - wire3[(2'h2):(1'h1)]));
endmodule
