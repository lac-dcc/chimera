module top
#(parameter param21 = {((((-(8'hb5)) ? ((8'hae) && (8'h9d)) : ((8'haf) >>> (8'hb5))) ? {((8'h9f) ~^ (8'ha6))} : (8'hb0)) != (~^((+(8'had)) ^ ((8'hba) ? (8'hae) : (8'hab))))), ((8'h9d) ? {{((7'h40) ? (8'haa) : (8'ha0))}} : (^(((8'hab) | (7'h43)) ^ (+(8'hac)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire16;
  assign y = {wire20, wire19, wire18, wire16, (1'h0)};
  module5 #() modinst17 (.clk(clk), .y(wire16), .wire7(wire3), .wire10(wire4), .wire6(wire0), .wire9(wire2), .wire8(wire1));
  assign wire18 = (^($unsigned(($signed(wire1) ?
                          $signed(wire1) : wire1[(4'ha):(1'h0)])) ?
                      (8'ha3) : (!$unsigned($signed((8'hac))))));
  assign wire19 = wire0[(4'he):(4'he)];
  assign wire20 = wire19;
endmodule

module module5
#(parameter param15 = ((((((8'h9c) >> (8'ha4)) < (&(8'ha7))) >>> (!((8'ha3) ? (8'hb8) : (8'ha2)))) == ((^~{(8'ha1)}) | ({(7'h42)} ? ((8'hb6) ? (8'hae) : (8'hb0)) : ((8'hb5) == (8'hb8))))) ? (!(^{(&(8'ha0)), ((8'ha3) <= (8'ha7))})) : (({((8'hb2) ? (8'h9d) : (8'h9d))} ? ((&(8'h9c)) == ((8'ha0) ? (8'hbf) : (8'hb2))) : ((^~(8'ha7)) ? ((8'h9f) ? (7'h44) : (8'ha2)) : ((8'hb2) ? (8'ha9) : (8'ha3)))) ? ((((8'hb5) < (8'haa)) ? ((8'ha4) ~^ (8'hba)) : ((8'ha0) * (8'hbd))) && ((!(8'hb4)) & (^(8'hb9)))) : (((&(7'h42)) ? (~^(8'hab)) : ((8'hbf) ? (8'ha3) : (8'haf))) ? ((^(8'hbb)) * (~&(7'h44))) : (^(&(8'ha0)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = wire10;
  assign wire12 = {{wire11, $unsigned((wire6 ? $signed(wire7) : wire6))},
                      {((8'hbb) ?
                              ((wire10 ?
                                  wire6 : wire6) || $unsigned(wire6)) : ((wire9 ?
                                      wire11 : (8'ha9)) ?
                                  $signed(wire10) : wire9[(1'h1):(1'h1)])),
                          $signed($unsigned((wire10 ? wire8 : (8'hb5))))}};
  assign wire13 = wire9;
  assign wire14 = wire8[(4'h9):(2'h3)];
endmodule
