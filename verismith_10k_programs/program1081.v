module top
#(parameter param9 = ((~^((((8'ha3) ? (7'h40) : (7'h42)) == (&(8'haa))) ^ (~|((8'ha8) ? (8'hb8) : (8'hbe))))) >>> ({(((8'hb4) ? (8'ha4) : (8'hae)) + ((7'h43) == (8'hbd)))} >= ((8'hac) ^ ((^~(8'hb4)) ? ((7'h41) != (8'h9e)) : ((8'hb7) ~^ (8'ha7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire8, wire6, wire5, reg7, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1;
    end
  assign wire5 = (8'had);
  assign wire6 = (~|(reg4[(4'h8):(3'h4)] && ((+$unsigned(wire1)) ?
                     ((8'hac) ?
                         (wire2 ?
                             wire2 : wire5) : (wire2 && wire2)) : $unsigned(reg4[(4'hd):(2'h2)]))));
  always
    @(posedge clk) begin
      reg7 <= wire2;
    end
  assign wire8 = $signed(wire5[(1'h0):(1'h0)]);
endmodule
