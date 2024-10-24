module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed((wire3 ?
                     (^($signed(wire3) ?
                         (wire1 ?
                             wire0 : wire0) : wire1[(1'h0):(1'h0)])) : (wire1 ?
                         $unsigned($signed(wire0)) : (wire0 ?
                             $signed((8'h9c)) : (wire2 ? wire3 : wire2)))));
  assign wire5 = wire4;
  assign wire6 = {(wire1[(4'h8):(1'h0)] ? wire0[(2'h3):(1'h0)] : (|wire1)),
                     (~((~wire0[(2'h2):(2'h2)]) > $unsigned((|wire0))))};
  assign wire7 = (-wire4);
  assign wire8 = $unsigned(((((|wire3) >>> {wire6, wire6}) <= ((wire0 ?
                     wire3 : (7'h40)) ^ (&wire5))) && wire3));
  assign wire9 = wire6;
  assign wire10 = (wire6[(2'h3):(1'h0)] ?
                      (wire7[(1'h1):(1'h0)] == (($unsigned(wire4) ?
                              (wire4 <= wire5) : ((8'h9c) || wire7)) ?
                          wire4 : (wire6[(3'h4):(2'h2)] ?
                              {wire6} : (wire6 ?
                                  wire0 : wire7)))) : (~&$signed((|wire2[(4'h9):(2'h2)]))));
endmodule
