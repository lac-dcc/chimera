module top
#(parameter param20 = (-(((((8'h9e) ? (8'hb8) : (8'h9f)) || (!(8'ha0))) ? (((7'h42) ? (8'h9d) : (8'hac)) ^ ((8'hb2) <<< (8'ha2))) : {((8'hbc) + (8'hb6))}) != ((((7'h43) <= (8'ha0)) ? ((8'hb1) * (8'hb6)) : (~^(8'ha9))) >= {((8'hb6) ~^ (8'hab))}))), 
parameter param21 = param20)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire19, wire18, wire17, wire15, wire4, (1'h0)};
  assign wire4 = {(~&(~|(8'ha4))),
                     (wire3[(3'h7):(2'h3)] ?
                         {$unsigned(wire0[(2'h2):(1'h1)]),
                             wire1[(1'h1):(1'h0)]} : (wire1 ?
                             $unsigned($signed(wire2)) : ((~wire2) ?
                                 wire1 : wire2[(3'h7):(1'h0)])))};
  module5 #() modinst16 (.clk(clk), .wire9(wire4), .wire6(wire1), .wire7(wire0), .wire8(wire3), .y(wire15));
  assign wire17 = (((wire15[(4'h9):(3'h4)] <<< wire3[(3'h4):(3'h4)]) ?
                          wire3[(5'h12):(3'h6)] : wire2) ?
                      {wire1[(3'h5):(3'h5)],
                          $unsigned(wire4)} : $unsigned($unsigned($signed((!wire1)))));
  assign wire18 = {wire0};
  assign wire19 = wire4[(4'ha):(3'h6)];
endmodule

module module5
#(parameter param14 = ((((((8'hbe) ? (8'hb6) : (8'ha7)) + (~|(7'h44))) ^~ (((8'ha2) ? (7'h44) : (8'ha9)) <<< ((7'h40) ? (8'hbb) : (8'hbb)))) << ((~|((8'ha8) || (8'ha7))) && (8'hbe))) ? (((^((8'ha3) - (7'h44))) ? (((8'hae) <<< (8'ha0)) & ((7'h43) + (8'hbe))) : (~^((8'ha6) ? (8'hb2) : (7'h44)))) ? ((((8'hbd) >= (8'h9e)) ? (-(8'ha5)) : ((8'h9f) ? (8'ha6) : (8'ha0))) ^~ ((+(8'had)) ? ((8'hbc) ? (8'hb1) : (8'h9f)) : {(8'haa)})) : ({((8'hb6) ? (7'h44) : (8'haf)), {(8'hbf), (8'ha7)}} ? (((8'hbd) ? (8'ha7) : (8'hb4)) >> ((7'h41) ? (8'ha5) : (8'ha8))) : (-(~|(8'hbd))))) : (((&((8'ha5) ? (8'h9e) : (8'h9c))) * {{(8'hb2), (8'hb7)}}) || (-(~(|(8'hbd)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire6[(1'h0):(1'h0)];
  assign wire11 = $signed(wire9);
  assign wire12 = ((~&((~$unsigned(wire9)) >= wire8)) ~^ $signed(((~$signed(wire8)) >>> (+$unsigned(wire11)))));
  assign wire13 = $unsigned((wire12 ? $unsigned(wire7[(3'h4):(2'h2)]) : wire6));
endmodule
