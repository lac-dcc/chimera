module top
#(parameter param15 = ((((((8'ha8) > (8'ha2)) ? ((8'hb7) || (8'hab)) : (~&(8'ha4))) ? (((8'haf) || (7'h42)) || ((8'ha3) ? (8'h9c) : (7'h44))) : (((7'h43) ? (7'h42) : (8'hb7)) ? ((7'h43) ? (7'h43) : (8'had)) : {(8'h9d)})) & (|(^~((8'h9c) < (8'ha7))))) ? {(!(((8'hbc) >> (8'hac)) ? (~|(8'hb9)) : ((8'h9d) > (8'hb6)))), (((!(8'ha5)) ? (^~(8'hb2)) : (~&(8'ha7))) ? (((8'ha2) != (7'h44)) ? ((8'ha2) > (8'hb3)) : ((8'hbf) ? (8'had) : (7'h40))) : (((8'hac) ? (8'had) : (8'hb8)) < (|(8'hb6))))} : ({((~|(8'h9f)) ? (~|(8'ha9)) : (&(8'ha5)))} << ({{(8'h9f)}} && {((7'h40) ~^ (8'ha0)), {(7'h40), (8'ha4)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (((wire0[(3'h4):(2'h2)] ^ $unsigned(wire2[(1'h0):(1'h0)])) ^~ wire0) >> wire2);
  assign wire6 = $unsigned(((wire4[(3'h5):(1'h1)] ?
                     $unsigned(wire5) : wire3) | wire0));
  assign wire7 = (~^wire2);
  assign wire8 = wire3[(2'h2):(1'h1)];
  assign wire9 = ($signed(($unsigned((wire5 >>> wire0)) * wire6[(1'h0):(1'h0)])) ?
                     wire7 : wire4);
  assign wire10 = ($unsigned((8'h9d)) || wire4[(2'h2):(1'h0)]);
  assign wire11 = wire0[(3'h4):(1'h0)];
  assign wire12 = $unsigned(((8'hb8) - (wire10 ?
                      (|$signed(wire5)) : $signed((^wire8)))));
  assign wire13 = (wire3[(3'h6):(2'h3)] | wire0);
  assign wire14 = (($unsigned($unsigned($signed(wire7))) ~^ $unsigned({{wire9,
                              (8'hb4)},
                          $unsigned(wire10)})) ?
                      {({wire8[(1'h0):(1'h0)],
                              {wire3}} >>> $unsigned($signed(wire7))),
                          wire10[(2'h2):(1'h0)]} : (&wire0[(3'h5):(1'h0)]));
endmodule
