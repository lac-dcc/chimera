module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (8'hb4);
  assign wire5 = (($signed($unsigned(wire4)) ?
                     wire2 : (+{((8'hb1) ? (8'hae) : wire1),
                         (wire3 - wire3)})) < ({wire1[(5'h10):(2'h3)]} >= wire1[(5'h13):(5'h13)]));
  assign wire6 = (wire3[(1'h0):(1'h0)] < (((^wire4) && $unsigned($unsigned(wire4))) == (wire5 ?
                     wire3 : $unsigned((wire1 ? wire5 : wire4)))));
  assign wire7 = $unsigned($unsigned($unsigned(((wire0 ? wire3 : wire2) ?
                     $signed((8'h9c)) : {(8'had)}))));
  assign wire8 = $unsigned($signed($unsigned(wire2)));
  assign wire9 = $unsigned(wire4);
endmodule
