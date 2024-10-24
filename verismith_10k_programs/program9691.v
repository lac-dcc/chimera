module top
#(parameter param19 = ({(((~(7'h44)) ? (~^(8'ha6)) : (~(8'hb4))) >> {((8'hb2) ? (8'hb0) : (8'hb7)), (~^(7'h44))}), (8'hb0)} ? (-{{((8'ha1) | (7'h42)), {(8'hbe), (8'hb8)}}}) : ({(((8'hac) ? (8'ha9) : (8'ha1)) >>> (&(8'ha3)))} ~^ (({(8'ha4)} ? ((7'h40) + (8'hbb)) : (~(8'ha8))) * (~&((8'h9d) && (8'hb3)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire18,
                 wire17,
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
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = wire2;
  assign wire7 = $unsigned(($unsigned(wire1[(4'hc):(4'hc)]) ?
                     $signed($signed($signed(wire5))) : (((wire4 | wire2) ?
                             (wire5 + wire0) : wire1[(4'hc):(3'h7)]) ?
                         wire3[(1'h1):(1'h1)] : wire5)));
  assign wire8 = $unsigned((~$signed($signed((wire0 - wire6)))));
  assign wire9 = wire8[(2'h3):(2'h2)];
  assign wire10 = $signed((wire7[(3'h6):(2'h2)] ?
                      $signed($signed(wire9)) : $unsigned(($signed(wire5) ?
                          wire9 : (wire8 || wire4)))));
  assign wire11 = wire10[(4'h8):(3'h5)];
  assign wire12 = ((wire7 * {$signed($signed(wire10))}) ?
                      (|$unsigned($unsigned(((7'h40) ?
                          wire1 : wire1)))) : ($signed({(+wire0),
                              $signed(wire9)}) ?
                          (~|$signed(wire11[(2'h2):(2'h2)])) : wire2[(1'h1):(1'h1)]));
  assign wire13 = ((wire3[(1'h0):(1'h0)] ?
                      wire2 : ((~&(wire10 ^ wire4)) ?
                          ($unsigned(wire8) ?
                              wire2[(3'h5):(3'h5)] : (wire11 ^~ wire4)) : $signed((!wire3)))) * (~&({(!(8'hb8)),
                      (wire1 == wire5)} | wire2)));
  assign wire14 = $signed({$unsigned($signed({wire0, wire2}))});
  assign wire15 = {$signed(wire10), wire13[(3'h4):(1'h1)]};
  assign wire16 = ($signed((+(wire15[(3'h7):(2'h2)] ^ (~&wire6)))) ?
                      (-wire3[(3'h4):(2'h3)]) : (!$unsigned(($signed((8'hb1)) ?
                          (~|wire11) : (~|wire11)))));
  assign wire17 = (^~$unsigned($signed(((wire8 ? wire2 : wire11) ?
                      {wire13, wire13} : wire10[(5'h10):(4'hb)]))));
  assign wire18 = $signed($unsigned(wire5[(1'h1):(1'h0)]));
endmodule
