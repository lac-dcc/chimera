module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (-{(~^(-$signed((7'h42)))), wire2});
  assign wire6 = wire1[(5'h13):(5'h13)];
  assign wire7 = wire0;
  assign wire8 = ((wire7[(3'h6):(2'h3)] * (~&{wire1})) && wire2[(2'h2):(2'h2)]);
  assign wire9 = ((-(^((wire8 ~^ wire8) - (wire7 <= wire7)))) ?
                     {{{(wire4 << wire2)},
                             wire7[(1'h1):(1'h0)]}} : $signed((~&$signed((7'h41)))));
  assign wire10 = ({$unsigned(wire0[(3'h6):(3'h5)]),
                      ({{wire4},
                          {wire4}} == (wire3[(4'h8):(1'h0)] >>> (wire1 >>> wire6)))} <<< wire0[(1'h1):(1'h1)]);
  assign wire11 = ($unsigned((^~wire7)) | $signed((~&{$unsigned(wire3)})));
endmodule
