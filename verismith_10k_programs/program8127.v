module top
#(parameter param22 = (8'hb8), 
parameter param23 = param22)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire20;
  assign y = {wire4, wire5, wire6, wire7, wire20, (1'h0)};
  assign wire4 = {{wire3[(5'h11):(3'h5)]}, wire2};
  assign wire5 = wire2;
  assign wire6 = wire2[(3'h4):(1'h1)];
  assign wire7 = {(|(&(wire5 ? $unsigned(wire0) : (wire2 ? (8'hb4) : wire2))))};
  module8 #() modinst21 (.clk(clk), .wire11(wire5), .wire12(wire1), .y(wire20), .wire10(wire2), .wire9(wire3), .wire13(wire7));
endmodule

module module8
#(parameter param19 = (~|(^{(~&(^~(8'ha7)))})))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  assign y = {wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = wire9;
  assign wire15 = ((($unsigned((wire12 ? wire10 : wire14)) ?
                              {(~&wire12)} : $unsigned((wire10 ?
                                  wire13 : wire9))) ?
                          wire11 : $signed((&(wire10 ? (8'hbf) : (8'hb4))))) ?
                      {$signed((~|((8'hbf) ? (8'ha7) : wire14))),
                          wire13[(4'hd):(4'hd)]} : (~^wire12[(4'hb):(3'h5)]));
  assign wire16 = ($unsigned((wire14[(3'h4):(2'h3)] ?
                      wire15[(4'ha):(1'h0)] : (wire13[(4'he):(3'h4)] > $unsigned(wire13)))) ~^ (wire15[(1'h1):(1'h1)] ^ (((&wire10) ?
                          (wire10 - (7'h42)) : $signed(wire10)) ?
                      (-(wire9 ? wire13 : wire12)) : ((wire14 ?
                          wire12 : wire13) >>> ((8'hb6) ? wire12 : wire13)))));
  assign wire17 = (($unsigned(wire13[(3'h4):(1'h0)]) ?
                      ($signed(wire13) ?
                          (&$unsigned((8'hb6))) : (^~(^~wire16))) : {$signed((^(8'hbe))),
                          wire16}) >= $signed({{$unsigned(wire12),
                          wire12[(2'h2):(1'h0)]}}));
  assign wire18 = $signed(wire12[(3'h4):(3'h4)]);
endmodule
