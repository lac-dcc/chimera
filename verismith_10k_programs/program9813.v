module top
#(parameter param10 = (8'hb5))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire5, reg7, reg6, (1'h0)};
  assign wire5 = (!($signed(wire4[(2'h3):(2'h3)]) <<< {(|(+wire2)),
                     wire1[(2'h2):(1'h1)]}));
  always
    @(posedge clk) begin
      reg6 <= wire0;
      reg7 <= (~|(!$unsigned($signed({(8'hbc)}))));
    end
  assign wire8 = wire2[(3'h5):(1'h0)];
  assign wire9 = wire5;
endmodule
