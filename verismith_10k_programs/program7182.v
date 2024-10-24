module top
#(parameter param13 = {(^~({((8'ha9) & (7'h41))} ? (~&((8'h9f) ? (8'hba) : (7'h43))) : (!{(8'ha5)}))), ({{{(7'h42), (8'hb6)}, (~(8'hae))}, {((8'hb0) > (8'hab)), ((8'haa) != (8'hb8))}} & (8'hb6))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = ($signed((wire0[(2'h3):(1'h1)] - (wire3[(3'h7):(3'h4)] ?
                     (|wire0) : wire3[(4'h8):(3'h7)]))) < (wire0 && wire1[(2'h2):(1'h0)]));
  assign wire5 = wire0[(2'h3):(1'h1)];
  assign wire6 = ($unsigned(wire0) ?
                     (|$signed($signed(wire4))) : {wire0[(1'h0):(1'h0)],
                         (~^$signed((~&wire3)))});
  assign wire7 = (~(8'hb7));
  assign wire8 = wire3[(4'hf):(4'h9)];
  assign wire9 = (~&((~|wire7[(3'h4):(2'h2)]) ?
                     (wire6 ?
                         ((&wire8) && wire7) : $signed((wire0 && wire3))) : wire5[(5'h10):(2'h2)]));
  assign wire10 = (wire1[(4'h9):(3'h6)] >>> wire5);
  assign wire11 = (wire10[(5'h10):(3'h5)] | wire3);
  assign wire12 = (~|$signed((~^wire7[(1'h0):(1'h0)])));
endmodule
