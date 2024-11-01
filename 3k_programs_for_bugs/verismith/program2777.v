module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (7'h44);
  assign wire5 = wire2;
  assign wire6 = $unsigned(((+$signed($unsigned(wire2))) != (wire0[(1'h0):(1'h0)] << wire2[(4'ha):(2'h2)])));
  assign wire7 = {wire6};
  assign wire8 = (~^wire5);
  assign wire9 = $unsigned(((($signed(wire5) >> {(8'ha7)}) ?
                         $unsigned($unsigned((8'hb6))) : wire4) ?
                     wire4 : $signed(($unsigned((8'hb1)) * wire6[(2'h2):(1'h0)]))));
  assign wire10 = wire5[(4'h8):(3'h6)];
endmodule
