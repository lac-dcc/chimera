module top
#(parameter param12 = ((+({(~^(8'hb5))} ? (((8'ha7) ? (8'haf) : (7'h44)) + (~|(8'haf))) : (((8'hbc) ^~ (8'hbf)) ? ((7'h41) > (7'h42)) : ((8'hb5) ? (8'ha8) : (8'hbf))))) ? ((((8'hb6) < ((7'h41) ? (8'ha1) : (8'hbe))) << (!(|(8'ha8)))) + ((~|(+(8'hb6))) ? (~|((8'ha9) != (8'hb2))) : (!((8'hb9) * (7'h40))))) : ({(!(^(8'had))), (~&(^(8'ha8)))} ? ((((8'ha1) && (8'hbe)) ~^ (8'h9d)) ~^ {{(8'hbb)}, (+(8'ha1))}) : ((((8'ha6) ? (8'hbf) : (8'h9d)) ? {(8'hb0)} : ((8'hbc) ? (8'had) : (8'had))) ? {((8'h9e) != (8'hae))} : ((!(8'hb5)) || ((8'h9f) ? (7'h43) : (8'ha9)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (8'hb8);
  assign wire6 = ((+(^$unsigned((wire2 == wire2)))) * wire5);
  assign wire7 = $signed(((wire1[(5'h10):(2'h3)] >>> ($unsigned(wire3) ?
                     (wire0 ? wire1 : wire1) : ((8'h9d) ?
                         wire4 : wire6))) ^ wire4[(3'h7):(3'h6)]));
  assign wire8 = $unsigned((~&$unsigned({wire7[(2'h2):(2'h2)], wire1})));
  assign wire9 = $unsigned(wire1);
  assign wire10 = {wire6[(1'h0):(1'h0)], $signed($signed({{wire8, wire7}}))};
  assign wire11 = $unsigned(wire10);
endmodule
