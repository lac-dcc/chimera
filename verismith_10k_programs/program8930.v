module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((-wire4) && wire2);
  assign wire6 = $signed(wire3);
  assign wire7 = (wire2 >> $signed($signed(wire0)));
  assign wire8 = ($unsigned(({(wire3 ? wire3 : wire5),
                         $unsigned(wire6)} && $unsigned({wire1, (8'ha3)}))) ?
                     $signed((({(8'hb9), wire1} ?
                             $signed(wire3) : (wire4 | wire6)) ?
                         ((~|wire1) ?
                             ((8'hbc) ?
                                 wire3 : wire0) : $unsigned(wire1)) : (wire7[(1'h0):(1'h0)] ?
                             (8'ha8) : (~wire0)))) : wire1[(4'h8):(4'h8)]);
  assign wire9 = (7'h43);
  assign wire10 = $unsigned(((8'ha8) ?
                      $signed($unsigned(wire0)) : $unsigned(wire4)));
  assign wire11 = {wire1, (wire6 ? $signed(wire9) : wire7[(3'h4):(3'h4)])};
  assign wire12 = wire11;
endmodule
