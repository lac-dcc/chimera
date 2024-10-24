module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire3[(5'h14):(4'he)]);
  assign wire5 = ({(^~(wire3 ? (|wire1) : wire1[(4'hf):(1'h1)])),
                     {((wire4 >>> wire1) << {wire2, wire1}),
                         wire3[(4'h8):(1'h1)]}} && (8'hb4));
  assign wire6 = wire0[(4'hb):(2'h2)];
  assign wire7 = (wire6[(4'ha):(3'h5)] | wire2[(3'h6):(3'h6)]);
endmodule
