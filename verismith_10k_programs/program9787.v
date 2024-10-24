module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $unsigned((($signed(wire1[(4'hb):(1'h1)]) ?
                     ((wire1 ? wire2 : wire3) ? {wire3} : (^wire0)) : {wire3,
                         $signed(wire4)}) << wire4[(4'hd):(4'hd)]));
  assign wire6 = {(^~$signed($signed((~wire2)))), wire4[(5'h12):(1'h0)]};
  assign wire7 = $unsigned($signed((wire6[(3'h6):(1'h1)] ?
                     $signed($signed((8'ha3))) : wire4[(4'hd):(3'h4)])));
endmodule
