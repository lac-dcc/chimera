module top
#(parameter param13 = {{{(+((8'haf) ? (8'ha0) : (8'hb8))), (((8'hbb) + (8'hbf)) >= ((8'hb3) & (8'h9c)))}, (8'hb6)}, (((&(~|(8'hb4))) < (((8'hbc) >= (8'hb4)) & (|(8'hbc)))) ? (~^(7'h44)) : ((~&{(8'h9c)}) ? (^((8'ha5) ^ (8'hb5))) : (((8'hb8) ? (8'hba) : (8'ha5)) ? ((7'h41) != (8'hb0)) : {(8'h9e), (8'haa)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
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
  assign wire4 = (wire0[(3'h4):(1'h1)] <= (wire1[(3'h4):(2'h3)] ?
                     wire1[(3'h6):(1'h0)] : $unsigned((!$signed((8'h9c))))));
  assign wire5 = $unsigned(wire4[(4'hb):(4'h9)]);
  assign wire6 = ((8'hb3) & $signed((wire2 <= $unsigned(wire4[(3'h4):(3'h4)]))));
  assign wire7 = wire5[(2'h2):(1'h1)];
  assign wire8 = wire0[(2'h3):(2'h3)];
  assign wire9 = wire2[(1'h0):(1'h0)];
  assign wire10 = ((~|$signed($signed($signed(wire5)))) + wire4[(4'hb):(3'h7)]);
  assign wire11 = wire7[(4'ha):(2'h3)];
  assign wire12 = wire3[(5'h13):(5'h10)];
endmodule
