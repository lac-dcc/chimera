module top
#(parameter param13 = (+((8'ha7) >> (+(((8'hac) != (8'haf)) <<< {(8'h9d)})))), 
parameter param14 = {({{param13}, (~|param13)} ? (((param13 ? param13 : param13) ? {param13} : (param13 == param13)) || ((param13 ? param13 : param13) > {param13, param13})) : ({(param13 | (8'ha4)), param13} ? (^~(7'h42)) : ((&param13) != ((8'hb8) ? (8'hb8) : param13)))), (+(~|(8'h9e)))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed((!(8'hac)));
  assign wire6 = wire3;
  assign wire7 = $unsigned(wire4);
  assign wire8 = wire7;
  assign wire9 = wire7[(3'h4):(2'h2)];
  assign wire10 = $signed($signed({(~&wire2), wire0}));
  assign wire11 = $unsigned(($signed($unsigned($signed(wire10))) & $unsigned({(wire2 ?
                          wire1 : wire0),
                      wire9[(3'h5):(3'h4)]})));
  assign wire12 = $signed(wire3[(4'hf):(3'h7)]);
endmodule
