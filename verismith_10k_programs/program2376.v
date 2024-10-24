module top
#(parameter param11 = (~(({((8'hb9) ? (8'hbc) : (8'hb5)), ((8'hb8) < (8'ha1))} >= (+(|(8'h9e)))) ? (((~(7'h44)) ? ((8'h9e) | (8'ha8)) : (^~(8'hb1))) ? (~(!(8'ha3))) : (~^(~|(8'h9d)))) : (~&((-(7'h43)) >>> ((8'hbf) ? (8'hb8) : (8'hac)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire2[(3'h4):(2'h3)];
  assign wire6 = (^~$signed($signed($unsigned((^wire1)))));
  assign wire7 = $signed(wire0);
  assign wire8 = wire0;
  assign wire9 = (~|$signed((({wire2, wire0} ? $unsigned(wire1) : wire8) ?
                     $unsigned(wire6[(4'h9):(4'h9)]) : $unsigned((wire7 || wire4)))));
  assign wire10 = ($signed($unsigned(((wire9 ?
                      wire8 : (8'hab)) >= (~wire7)))) ^ (((8'ha4) ?
                      {$signed(wire6),
                          wire1[(4'ha):(4'h9)]} : ($signed(wire5) != $unsigned(wire0))) | wire4[(3'h4):(1'h1)]));
endmodule
