module top
#(parameter param8 = (&(~{(8'ha1)})), 
parameter param9 = (8'ha8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire2[(3'h4):(1'h0)]);
  assign wire5 = (+((^{$unsigned(wire4),
                     $unsigned(wire4)}) <= {$unsigned($signed(wire1)),
                     ((^wire1) ? wire1[(4'hc):(2'h3)] : {wire1, (8'h9c)})}));
  assign wire6 = $unsigned({$unsigned({{wire3}, (wire2 == wire1)}),
                     (wire4[(1'h1):(1'h0)] + ($unsigned(wire5) << wire3))});
  assign wire7 = wire3;
endmodule
