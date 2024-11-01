module top
#(parameter param9 = (!(-(((-(8'hb7)) == {(8'hbc), (7'h44)}) << (~|{(8'ha5), (7'h40)})))), 
parameter param10 = param9)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire8, wire7, wire5, wire4, reg6, (1'h0)};
  assign wire4 = (8'ha1);
  assign wire5 = (wire0[(3'h4):(2'h3)] >>> ({$signed(wire4),
                     ($unsigned(wire1) || {wire2})} && wire3));
  always
    @(posedge clk) begin
      reg6 <= wire2[(2'h2):(2'h2)];
    end
  assign wire7 = $unsigned($signed(((|(^wire5)) <= $unsigned((wire0 - (8'ha3))))));
  assign wire8 = wire0;
endmodule
