module top
#(parameter param9 = (-{(((~&(8'had)) >>> (^(7'h42))) - (((8'hb9) ? (8'had) : (8'hb2)) ? ((7'h44) ? (8'ha4) : (8'hb1)) : ((8'h9e) ? (8'hbe) : (7'h44)))), {{((8'h9f) ? (8'ha4) : (8'ha7))}, (+{(8'hac)})}}), 
parameter param10 = (^~param9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = {wire4,
                     (|(($unsigned(wire4) ?
                         (8'hb8) : {wire4}) > $unsigned(wire2)))};
  always
    @(posedge clk) begin
      reg6 <= $signed(wire3);
    end
  assign wire7 = (8'hb8);
  assign wire8 = $signed(wire7[(4'hc):(4'hc)]);
endmodule
