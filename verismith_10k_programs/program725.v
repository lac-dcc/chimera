module top
#(parameter param8 = (|(!((^(~(8'ha4))) ~^ (~((7'h41) <= (8'had)))))), 
parameter param9 = param8)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = (~{$unsigned((^((7'h42) <<< wire2))), (~&wire2)});
  always
    @(posedge clk) begin
      reg5 <= (-((8'ha4) & wire0[(1'h1):(1'h0)]));
    end
  assign wire6 = $signed($signed((~&{$signed(wire0), wire2})));
  assign wire7 = wire3[(1'h1):(1'h0)];
endmodule
