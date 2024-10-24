module top
#(parameter param13 = (!((|({(8'h9f)} | {(7'h43), (7'h42)})) ? (~{((7'h44) ? (7'h40) : (8'ha1)), (-(8'h9e))}) : ((~|((8'ha4) ? (8'ha0) : (8'ha9))) + {(^~(7'h43)), (~^(8'haa))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
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
  assign wire4 = ({(~|wire1)} ? $unsigned(wire2) : wire0);
  assign wire5 = wire2[(4'ha):(4'h9)];
  assign wire6 = ((wire3[(2'h2):(1'h0)] >>> wire3[(3'h5):(1'h0)]) != (8'ha7));
  assign wire7 = (8'ha4);
  assign wire8 = wire5;
  assign wire9 = wire8[(3'h4):(3'h4)];
  assign wire10 = wire5;
  assign wire11 = {(|$unsigned($unsigned((wire6 ? wire6 : wire2)))),
                      $unsigned((8'ha9))};
  assign wire12 = (~&$unsigned(wire3));
endmodule
