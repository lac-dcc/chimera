module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((!(wire1[(3'h5):(1'h1)] ^ wire3)));
  assign wire5 = ((wire1[(1'h1):(1'h1)] < (7'h40)) > ($unsigned($signed($unsigned(wire0))) ?
                     $signed((^$unsigned((8'hb4)))) : wire2[(3'h6):(3'h5)]));
  assign wire6 = $unsigned((!(wire5 ? (7'h42) : (+$unsigned((8'ha2))))));
  assign wire7 = wire1;
endmodule
