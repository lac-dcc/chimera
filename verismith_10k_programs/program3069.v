module top
#(parameter param23 = ({{{(+(8'hb5))}, {((8'hae) ? (8'ha0) : (8'hb2)), (^(8'hb9))}}, {{(~|(7'h42))}, ((8'ha3) ? {(8'h9f), (8'hb2)} : (!(8'hab)))}} ? ({(|((8'hb1) - (8'hb8)))} ? {(((8'h9d) ? (7'h40) : (8'hae)) ? {(7'h44), (7'h44)} : ((8'hb8) > (8'h9f)))} : (&(~|((8'hae) ~^ (8'ha4))))) : (|({((8'ha1) ? (8'hb7) : (8'hb3))} << {((8'hb5) ? (8'hb9) : (8'hbc))}))), 
parameter param24 = {((8'ha6) ? param23 : (((param23 ? (8'ha7) : param23) == (param23 ? param23 : param23)) + ((param23 ? param23 : param23) ? (8'hbe) : param23))), {(param23 * (param23 > (param23 * param23)))}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire14;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire14,
                 (1'h0)};
  module4 #() modinst15 (.wire5(wire1), .wire8(wire0), .clk(clk), .wire6(wire2), .wire7(wire3), .y(wire14));
  assign wire16 = ((~^wire2) ? wire0 : $signed($signed(wire1)));
  assign wire17 = {wire3,
                      (wire3 >>> ((!(wire1 ? wire16 : wire3)) ?
                          (wire3[(3'h6):(2'h3)] - wire2) : $unsigned((wire3 ?
                              wire16 : wire16))))};
  assign wire18 = wire1;
  assign wire19 = wire2[(5'h10):(1'h1)];
  assign wire20 = ((wire16[(4'h9):(3'h6)] | wire19) * {wire17[(3'h6):(3'h6)],
                      ((|(&wire1)) ?
                          (wire2 ?
                              (wire19 ?
                                  (8'hbb) : wire2) : (7'h44)) : {wire16[(4'hb):(3'h5)],
                              $signed(wire2)})});
  assign wire21 = ((~(wire16 ?
                          {((8'hb0) ? wire14 : (8'ha4)),
                              $signed(wire16)} : {{wire17, wire0}})) ?
                      (8'hb1) : $unsigned((&wire19[(2'h2):(2'h2)])));
  assign wire22 = ((&$signed(($signed((8'ha4)) ?
                      {wire17,
                          wire18} : (~|wire2)))) == ($unsigned(wire14) ^~ (~&wire21)));
endmodule

module module4
#(parameter param13 = ({((|((8'hb2) ? (8'ha5) : (8'h9c))) << (((8'h9c) & (8'haa)) > {(8'ha7), (7'h44)}))} != (((((8'ha8) ? (8'hb7) : (8'hb0)) >= ((8'ha2) ? (8'hb8) : (8'hbb))) ? {(-(8'haa)), (&(8'hbf))} : (((8'haf) | (8'hbb)) | ((8'ha8) * (8'ha1)))) ? ((((8'had) ^ (8'hab)) == (^~(8'hb7))) ? {((8'hbd) && (8'h9e)), (&(8'hb9))} : (&((8'hb2) ? (8'hb0) : (8'hbe)))) : (|(((8'hb8) ? (7'h43) : (8'hbe)) ? ((8'ha5) ? (8'ha6) : (8'ha4)) : (~|(8'hbd)))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(2'h3):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  assign y = {wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = (wire7[(1'h0):(1'h0)] ^~ ((~^(wire8[(2'h3):(2'h2)] ?
                     wire5 : wire5)) << $unsigned(((wire6 ~^ wire5) ?
                     $unsigned(wire8) : wire7))));
  assign wire10 = ($signed($unsigned(wire8[(2'h3):(1'h0)])) <<< wire7);
  assign wire11 = (wire6[(4'he):(4'he)] & (wire9 ?
                      wire10[(2'h2):(2'h2)] : wire6));
  assign wire12 = {{wire7[(1'h0):(1'h0)],
                          (((wire10 <<< (8'hb8)) ?
                                  wire6[(3'h7):(1'h0)] : {wire7}) ?
                              wire10 : wire7[(1'h1):(1'h1)])},
                      $signed((~^(8'ha4)))};
endmodule
