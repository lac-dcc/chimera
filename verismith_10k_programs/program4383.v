module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire4, reg7, reg6, reg5, (1'h0)};
  assign wire4 = ((($signed(wire0) >= ((^wire3) ?
                     $signed(wire1) : $unsigned(wire2))) | {$unsigned($unsigned(wire3))}) == $signed((-({wire1,
                         wire1} ?
                     wire1 : ((8'ha7) >> wire0)))));
  always
    @(posedge clk) begin
      reg5 <= {wire4[(4'h8):(2'h3)]};
      reg6 <= {($unsigned(reg5[(4'ha):(4'ha)]) && reg5[(4'h9):(4'h8)])};
      reg7 <= wire0[(1'h1):(1'h1)];
    end
  assign wire8 = {(wire1[(4'h8):(3'h6)] >= (8'ha7)),
                     ((((8'h9f) ?
                             wire1[(4'hd):(3'h6)] : wire2[(2'h2):(1'h1)]) + (|$unsigned(wire4))) ?
                         $unsigned({(wire2 ?
                                 wire0 : wire4)}) : $signed(((wire3 == wire0) ?
                             (|wire2) : (!(8'ha5)))))};
  assign wire9 = {$signed($unsigned({reg7, (wire4 != wire4)})), reg5};
  assign wire10 = reg6;
endmodule
