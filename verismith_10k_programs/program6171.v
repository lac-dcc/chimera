module top
#(parameter param12 = {((((~&(8'ha3)) ? (7'h43) : ((7'h40) ? (8'hba) : (8'h9d))) && (((8'ha8) ? (8'haf) : (8'ha7)) ? (^(8'hab)) : ((8'h9d) ? (8'hae) : (8'hb9)))) & (+{{(8'h9e), (8'ha0)}, (^(8'h9e))}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned((({((8'hb9) ?
                         wire2 : wire3)} > ((&wire4) + $unsigned(wire1))) >= (|wire0)));
  assign wire6 = wire2;
  assign wire7 = wire6[(4'h8):(4'h8)];
  assign wire8 = (^$signed(($signed((8'ha5)) >> (7'h43))));
  assign wire9 = ((^(~|$unsigned(wire3))) ?
                     wire0[(4'h9):(1'h1)] : $signed(wire1[(1'h0):(1'h0)]));
  assign wire10 = ((((((8'ha9) * wire8) ~^ wire2[(3'h5):(1'h0)]) ?
                          (wire5 | wire9) : $unsigned(wire3)) ?
                      $unsigned(wire8[(3'h6):(3'h5)]) : $unsigned({(~^(8'ha3))})) >= (~&{(wire6[(3'h4):(2'h2)] ?
                          {wire6} : wire7),
                      $unsigned(wire1[(4'h9):(2'h2)])}));
  assign wire11 = (wire7 ? (!$signed(wire1)) : wire5);
endmodule
