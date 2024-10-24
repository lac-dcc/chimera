module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0[(4'h8):(3'h7)];
  assign wire6 = $signed((|wire0));
  assign wire7 = {($unsigned((((7'h42) && (7'h40)) >> $signed((8'haf)))) << {((wire5 || wire2) < wire0[(1'h0):(1'h0)])})};
  assign wire8 = (8'hba);
  assign wire9 = ($unsigned($unsigned(($signed(wire2) ?
                     wire6 : $signed(wire1)))) >>> $signed($signed(($unsigned(wire6) ?
                     {wire8, wire2} : wire3))));
endmodule
