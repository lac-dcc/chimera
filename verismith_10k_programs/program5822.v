module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(3'h5):(3'h5)];
  assign wire6 = (&wire4[(1'h0):(1'h0)]);
  assign wire7 = ($unsigned((wire0 && $unsigned((8'hba)))) ?
                     (wire5[(2'h2):(1'h0)] ?
                         (~$unsigned((wire0 >> wire1))) : wire2[(1'h0):(1'h0)]) : $unsigned((($unsigned(wire2) ^ $signed(wire0)) ?
                         (~^wire6[(1'h0):(1'h0)]) : ({wire5,
                             wire4} - {wire4}))));
  assign wire8 = $signed({$signed(wire0[(4'ha):(3'h5)]),
                     $signed((|(wire5 >= wire6)))});
endmodule
