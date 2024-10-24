module top
#(parameter param8 = {(^(((+(8'ha6)) ? ((8'h9c) ? (8'hbe) : (8'ha7)) : (!(8'hbb))) == {((8'h9e) ? (8'haf) : (8'hba)), ((8'hb6) ? (8'haf) : (8'hb5))})), ((^((8'ha3) < (~|(8'ha2)))) * ((~&((8'ha3) ? (8'ha7) : (8'hb8))) >= ((|(8'hae)) + ((7'h40) << (7'h41)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (8'ha7);
  assign wire5 = (wire3 | {{wire1, wire2[(3'h6):(1'h1)]}});
  assign wire6 = {(8'ha9)};
  assign wire7 = $signed(wire5[(1'h1):(1'h1)]);
endmodule
