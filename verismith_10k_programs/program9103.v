module top
#(parameter param8 = (8'ha8), 
parameter param9 = (-(param8 == (+(param8 ? (~|(8'h9e)) : param8)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (^$unsigned((^~$signed((~wire3)))));
  assign wire5 = wire1;
  assign wire6 = (^~$signed($unsigned((wire1[(1'h1):(1'h1)] ?
                     (|wire4) : ((8'hb7) ? wire0 : (8'hb5))))));
  assign wire7 = wire6[(2'h3):(2'h2)];
endmodule
