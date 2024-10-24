module top
#(parameter param10 = {({((8'h9e) > ((8'ha5) <= (8'ha8)))} != ({{(7'h41), (8'h9f)}} ? {(+(8'h9e)), ((8'hbd) || (8'hae))} : (^~{(8'ha4), (8'hab)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire1[(1'h0):(1'h0)] > (wire0[(4'hb):(3'h6)] ?
                     (((wire3 && (8'hbe)) ?
                         (wire1 <<< (8'hb2)) : wire2[(4'h8):(3'h7)]) << wire0[(4'h8):(2'h2)]) : ((~^wire0[(1'h1):(1'h1)]) || ($signed(wire2) ?
                         (^wire0) : (-(8'hbf))))));
  assign wire6 = $signed($unsigned($signed(((^(8'ha5)) & $signed((8'hb3))))));
  assign wire7 = (~^$signed(wire4[(4'he):(4'h9)]));
  assign wire8 = (~^wire1);
  assign wire9 = wire0[(1'h1):(1'h0)];
endmodule
