module top
#(parameter param17 = (|((8'h9f) ? (((-(8'ha7)) ? ((8'hb6) != (8'hb0)) : ((7'h43) ? (8'hbb) : (8'ha3))) ? (!{(8'hae)}) : ({(8'hbf), (8'hb7)} + (~^(7'h40)))) : (+(((8'h9c) ? (7'h42) : (8'hbf)) >>> ((8'ha3) ? (8'ha8) : (8'hb0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  assign y = {wire16,
                 wire15,
                 wire14,
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
  assign wire5 = wire2;
  assign wire6 = $unsigned(wire3[(3'h4):(2'h3)]);
  assign wire7 = wire0;
  assign wire8 = ($signed($unsigned(($unsigned(wire2) <= wire7))) ?
                     (&$unsigned(wire5)) : (($signed((wire4 ?
                                 wire4 : (8'hbf))) ?
                             wire5[(3'h6):(2'h2)] : $unsigned($signed(wire1))) ?
                         $signed(wire5) : $unsigned(wire3[(3'h4):(2'h2)])));
  assign wire9 = wire5;
  assign wire10 = wire8[(1'h1):(1'h0)];
  assign wire11 = wire3;
  assign wire12 = wire8;
  assign wire13 = wire1[(4'h8):(3'h5)];
  assign wire14 = ($unsigned(($unsigned(wire13) ?
                          wire2[(1'h0):(1'h0)] : (wire6[(1'h1):(1'h1)] * $signed(wire2)))) ?
                      ({$unsigned((8'hb2)), (+(wire0 ? wire5 : wire2))} ?
                          wire6 : ((wire7[(1'h1):(1'h0)] ?
                              $unsigned((8'hac)) : {(8'haf),
                                  wire4}) >>> ($signed((8'hb2)) ?
                              {wire4,
                                  wire6} : $unsigned(wire1)))) : $signed((^wire9[(1'h0):(1'h0)])));
  assign wire15 = wire11[(4'h8):(3'h4)];
  assign wire16 = ((8'h9c) ^~ wire2);
endmodule
