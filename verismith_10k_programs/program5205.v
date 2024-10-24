module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ({(8'hb2)} ?
                     (~$unsigned($signed($unsigned(wire4)))) : (8'h9e));
  assign wire6 = $unsigned({wire2[(3'h7):(2'h2)], $signed(wire4)});
  assign wire7 = ($signed(($unsigned(wire6) ?
                         wire3 : ((~wire2) ~^ (^~wire4)))) ?
                     wire5[(1'h1):(1'h0)] : (wire5[(1'h0):(1'h0)] * (~|wire2[(3'h4):(3'h4)])));
  assign wire8 = {wire0};
endmodule
