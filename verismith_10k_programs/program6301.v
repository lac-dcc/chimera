module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire1[(2'h3):(2'h3)] << (7'h40));
  assign wire5 = (~{wire4[(1'h0):(1'h0)]});
  assign wire6 = wire5[(3'h6):(2'h2)];
  assign wire7 = $unsigned($unsigned({$signed($signed((8'hb1))),
                     (wire6[(2'h2):(1'h0)] >>> ((8'ha6) + wire2))}));
endmodule
