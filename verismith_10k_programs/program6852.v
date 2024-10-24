module top
#(parameter param10 = ({{(((8'ha4) ? (8'h9e) : (7'h42)) ? (~&(8'hbd)) : {(8'hb4), (8'ha1)})}, (~&(((8'ha3) ? (8'hb2) : (8'haa)) & {(8'hb5)}))} < (~&(~((&(8'hac)) << ((8'hbc) ? (8'hbd) : (7'h41)))))), 
parameter param11 = (8'hb9))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire9, wire6, wire5, wire4, reg8, reg7, (1'h0)};
  assign wire4 = (wire1 <<< wire3);
  assign wire5 = ((|$signed($unsigned((wire0 ?
                     (8'hb2) : wire2)))) ^ $signed((wire0 << wire2[(4'h8):(2'h2)])));
  assign wire6 = (((+((wire0 ?
                         (8'had) : wire0) ^ (wire5 >= wire1))) & $signed(wire1)) ?
                     wire1[(2'h2):(1'h0)] : {wire3[(3'h5):(1'h1)],
                         $signed($signed($signed(wire4)))});
  always
    @(posedge clk) begin
      reg7 <= wire4[(1'h1):(1'h1)];
      reg8 <= wire1;
    end
  assign wire9 = wire4[(1'h0):(1'h0)];
endmodule
