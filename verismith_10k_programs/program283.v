module top
#(parameter param9 = (~&(~(^~((~&(7'h42)) ? (|(8'h9e)) : (8'ha6))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((^wire3[(3'h4):(1'h0)]) <= wire0[(1'h0):(1'h0)]);
  assign wire5 = wire4[(2'h2):(1'h1)];
  assign wire6 = {$unsigned($unsigned((^(wire0 || wire4)))),
                     (wire0[(2'h3):(1'h1)] | ((wire4[(2'h3):(2'h3)] != wire4) & (^(8'hb2))))};
  assign wire7 = {{$unsigned($signed($unsigned(wire3))), wire3},
                     $signed(wire6)};
  assign wire8 = (wire7 ^ ((-((-wire5) <<< (wire4 ~^ wire5))) + $unsigned(wire5)));
endmodule
