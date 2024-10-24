module top
#(parameter param13 = ({((((8'hb1) ? (8'hae) : (8'ha1)) ^ {(8'hbb)}) ~^ (((7'h43) ? (8'hb4) : (8'ha4)) ? ((8'ha2) - (8'ha6)) : (8'h9d))), (((^(8'hb4)) || (!(8'ha5))) == (((8'ha2) - (7'h43)) ? (~|(8'hb3)) : (+(7'h42))))} != ({(^(8'h9e))} ? ({(~^(8'hb8))} ^ (^((8'had) != (7'h44)))) : (+((8'ha0) <= (^(8'ha3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $signed((!wire2));
  assign wire6 = $unsigned($unsigned((wire4[(3'h4):(2'h2)] ?
                     (~wire1[(3'h7):(1'h0)]) : wire4)));
  assign wire7 = ($unsigned(({$signed(wire4)} ?
                     ((wire4 ? wire2 : wire5) ?
                         (wire3 ?
                             (8'hb7) : (8'ha6)) : (wire4 << wire2)) : {wire2})) >> (wire2 ?
                     $unsigned(wire2[(4'h8):(1'h1)]) : $unsigned($unsigned((wire0 ?
                         wire6 : wire1)))));
  assign wire8 = $unsigned(((wire2[(3'h7):(3'h5)] ?
                         (wire6[(4'hd):(3'h7)] ?
                             (+wire7) : wire2) : ($unsigned(wire3) ?
                             (wire7 ? wire6 : wire7) : (wire3 ?
                                 wire1 : wire7))) ?
                     $signed(wire7) : $unsigned($signed((wire4 ?
                         (7'h42) : wire4)))));
  assign wire9 = $signed({wire0, wire6[(5'h10):(4'h8)]});
  assign wire10 = $unsigned($signed(((wire0[(2'h3):(2'h2)] ?
                          $unsigned(wire5) : {wire6}) ?
                      $signed(wire4[(1'h0):(1'h0)]) : ({wire1} ?
                          {wire2} : wire4[(2'h2):(1'h0)]))));
  assign wire11 = wire7;
  assign wire12 = $unsigned(((($unsigned(wire6) >> $signed(wire0)) ?
                          (^~$signed(wire0)) : (((8'hb0) ?
                              (8'hbd) : wire2) && wire7[(4'hc):(3'h5)])) ?
                      wire2 : wire9[(4'h9):(3'h6)]));
endmodule
