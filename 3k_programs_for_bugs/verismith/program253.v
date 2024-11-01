module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire11, wire10, wire8, wire7, wire6, wire5, wire4, reg9, (1'h0)};
  assign wire4 = $unsigned(wire2[(5'h15):(3'h6)]);
  assign wire5 = wire3;
  assign wire6 = wire1;
  assign wire7 = (7'h40);
  assign wire8 = {(+(wire3[(3'h5):(3'h4)] ?
                         $signed($unsigned(wire0)) : wire5[(4'hc):(4'hb)])),
                     $unsigned(wire3[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg9 <= (((~^{((7'h43) >> wire4)}) <= ($signed(wire2) - {$unsigned(wire6),
          wire7[(2'h2):(2'h2)]})) * $signed((wire5[(3'h7):(3'h7)] ?
          $unsigned(wire5) : $signed((wire3 ? wire2 : wire0)))));
    end
  assign wire10 = (-wire0);
  assign wire11 = ($unsigned({$signed($unsigned(wire1))}) | (!$signed({(+wire0),
                      wire3})));
endmodule
