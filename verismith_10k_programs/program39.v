module top
#(parameter param18 = {(8'ha6), {((((7'h41) * (8'h9e)) ? (8'hae) : (!(8'hbf))) ? ((!(8'hb9)) - (^(8'hac))) : (~&(!(7'h44)))), (&(((7'h40) < (8'hb1)) * (|(8'hbc))))}}, 
parameter param19 = param18)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire17,
                 wire16,
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
                 wire4,
                 (1'h0)};
  assign wire4 = wire1[(4'h9):(1'h0)];
  assign wire5 = ((^~(($signed(wire0) ? wire0 : wire2) ?
                         $signed((wire1 ? wire0 : wire3)) : (8'ha1))) ?
                     wire0[(5'h10):(4'h8)] : (!$signed(((wire1 - (8'hb1)) ?
                         wire0[(4'he):(1'h0)] : wire2[(1'h0):(1'h0)]))));
  assign wire6 = ($unsigned((8'h9f)) ?
                     (wire0[(4'h9):(4'h8)] ?
                         ({$unsigned(wire3)} ?
                             (^~$unsigned((8'ha0))) : ($signed(wire0) > {wire2,
                                 wire1})) : wire1) : wire2[(4'hc):(3'h5)]);
  assign wire7 = $unsigned((+wire1[(4'h9):(2'h3)]));
  assign wire8 = {$signed({($signed(wire6) ?
                             $signed((8'hb2)) : (wire1 ? wire6 : wire4))})};
  assign wire9 = wire1;
  assign wire10 = (&($unsigned(wire3[(3'h7):(3'h4)]) * $unsigned(wire1[(3'h7):(1'h0)])));
  assign wire11 = wire10[(1'h1):(1'h0)];
  assign wire12 = ((~&(wire6 ?
                      wire8[(2'h2):(1'h0)] : $unsigned(wire0[(1'h1):(1'h0)]))) && wire7);
  assign wire13 = (wire5 ?
                      (wire12 << wire4) : $unsigned(((((8'ha8) ?
                              wire6 : wire11) <= ((8'ha3) ? wire10 : wire2)) ?
                          wire12 : $signed(wire12))));
  assign wire14 = (!$unsigned($signed(($signed(wire0) ?
                      {wire12} : $signed(wire7)))));
  assign wire15 = wire13;
  assign wire16 = ((7'h41) ?
                      $signed(wire5[(3'h4):(1'h0)]) : (((~^wire14[(3'h5):(1'h1)]) ?
                          {$unsigned(wire12)} : $signed($unsigned(wire6))) <= (((~wire7) ?
                          $signed(wire6) : wire2[(4'h8):(3'h6)]) <= $signed(wire3[(2'h2):(1'h1)]))));
  assign wire17 = wire9;
endmodule
