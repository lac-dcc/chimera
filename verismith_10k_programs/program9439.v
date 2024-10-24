module top
#(parameter param12 = (~|(((8'ha0) ? {(+(8'hb1))} : (((8'hba) ? (8'had) : (8'hbd)) ? (-(8'ha6)) : ((8'hbe) != (8'hbe)))) ? ((((7'h44) << (8'hb4)) & ((8'hb1) >>> (8'ha0))) ? (~^((8'hae) << (8'h9c))) : {(~(8'hb0)), ((7'h42) ? (8'hb1) : (8'hbd))}) : ((|(8'ha5)) ? {((8'ha6) ? (8'hae) : (8'ha5)), (7'h44)} : ({(8'haf)} ? ((7'h42) ? (8'hb8) : (8'ha9)) : {(8'hbb), (8'hbb)})))), 
parameter param13 = (8'hb6))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed($signed(((wire0 ~^ wire2) - $unsigned(wire0)))) ?
                     wire0[(1'h1):(1'h0)] : (^~{$unsigned(wire0), (8'hb7)}));
  assign wire5 = (8'ha8);
  assign wire6 = wire4[(3'h4):(1'h1)];
  assign wire7 = wire4;
  assign wire8 = (&(~|wire4));
  assign wire9 = wire2;
  assign wire10 = (7'h41);
  assign wire11 = wire10[(2'h2):(1'h1)];
endmodule
