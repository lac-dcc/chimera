module top
#(parameter param13 = (^~(!({{(8'hb9)}, ((8'hac) ? (8'ha4) : (8'h9e))} ? {(^(8'h9d))} : (!((8'hb2) ? (8'hab) : (8'hbd)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire1[(5'h11):(4'hb)];
  assign wire6 = (wire0[(2'h2):(1'h1)] <= ($signed(wire5[(1'h1):(1'h1)]) + wire4));
  assign wire7 = (^(+((wire5[(3'h4):(2'h3)] > (8'h9d)) ?
                     $unsigned(wire5) : ($signed(wire5) ? wire3 : {wire2}))));
  assign wire8 = wire6;
  assign wire9 = $unsigned((-(&wire6)));
  assign wire10 = wire2[(2'h2):(2'h2)];
  assign wire11 = (~^$unsigned((($signed(wire3) ?
                          (wire10 & wire2) : (!wire10)) ?
                      wire9[(4'hc):(4'hb)] : wire1[(4'hc):(3'h7)])));
  assign wire12 = (wire11 ?
                      $signed(({$signed((8'haa)), $signed(wire5)} ?
                          {(8'ha1),
                              (wire0 ^ wire8)} : wire7)) : $unsigned((($unsigned(wire11) == wire11[(5'h11):(4'h8)]) == ((wire10 ?
                              (8'hb3) : wire5) ?
                          wire0 : (8'hb8)))));
endmodule
