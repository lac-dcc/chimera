module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned($unsigned($unsigned($unsigned(wire1)))));
  assign wire5 = $unsigned((~&(-$signed(((8'hab) ? wire1 : wire4)))));
  assign wire6 = (((wire3 ?
                         $signed((wire5 | wire3)) : wire0[(1'h0):(1'h0)]) <= wire0) ?
                     $signed(((wire3[(4'h8):(1'h0)] ?
                         (wire5 ?
                             wire3 : wire0) : $signed(wire5)) + (~&(8'hb8)))) : $unsigned($unsigned((+$signed(wire4)))));
  assign wire7 = (+(wire0 ? wire1 : wire1[(2'h2):(2'h2)]));
endmodule
