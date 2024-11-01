module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {wire4};
  assign wire6 = (($unsigned((^~wire1[(3'h5):(3'h5)])) ?
                         $unsigned((wire2 ?
                             (wire2 && wire3) : wire5[(5'h13):(3'h4)])) : {wire4,
                             wire2}) ?
                     {$unsigned(wire1[(2'h3):(2'h2)])} : (|(wire1[(4'h9):(2'h3)] == (wire0 * (wire4 < (8'hb1))))));
  assign wire7 = wire1[(3'h5):(1'h1)];
  assign wire8 = {wire6[(5'h11):(1'h0)],
                     ($signed($signed(wire4[(4'h8):(3'h6)])) ?
                         $unsigned($signed((|wire2))) : $signed(($unsigned((8'hb3)) & $signed((8'ha7)))))};
endmodule
