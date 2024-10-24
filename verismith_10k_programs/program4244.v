module top
#(parameter param12 = ((((((8'hb3) ^~ (8'hab)) < (^(8'hb1))) ? {((8'ha4) ? (8'h9c) : (8'hb6)), {(7'h43)}} : (((8'hb2) <= (8'hac)) ? ((8'ha1) ^ (8'ha5)) : (|(8'h9f)))) ? (8'hb1) : ((((8'h9c) ? (8'ha7) : (8'haa)) ? {(8'ha5)} : ((8'hb5) ? (8'ha1) : (8'ha2))) ? ((!(7'h42)) <= ((8'ha4) ? (7'h40) : (8'hb6))) : (((8'ha5) + (8'haf)) & ((8'ha2) >>> (8'ha6))))) ? (((((7'h40) == (8'ha0)) ? ((8'hbb) ? (8'hba) : (8'hba)) : (-(8'haf))) << (((8'hba) ? (8'h9d) : (8'hbb)) << (&(8'ha1)))) << ((^(~(8'hb6))) ? ((^~(8'haf)) ? ((8'hb6) * (8'had)) : ((8'hb9) ? (8'ha4) : (8'hb5))) : ({(8'ha8), (8'h9d)} ? ((8'ha6) || (8'ha9)) : ((8'had) - (8'ha3))))) : {((!(-(8'hb9))) + {((8'ha5) ? (8'hae) : (8'h9c)), ((8'hb4) >= (8'hb9))})}), 
parameter param13 = ((({((8'hb6) ? param12 : param12)} ~^ (~(8'hb8))) <= ((~|(param12 < (8'hb0))) <<< param12)) >> (~|(~^((param12 != (8'haf)) ? (param12 ? param12 : param12) : (param12 >= param12))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (((&($unsigned((8'hbe)) ?
                             (wire3 ? wire2 : wire1) : $signed(wire2))) ?
                         wire2[(3'h6):(1'h1)] : wire3) ?
                     (wire0 > {wire0,
                         ((wire0 ?
                             wire1 : wire2) ~^ wire2)}) : $unsigned((-($unsigned(wire2) >> wire0[(1'h1):(1'h1)]))));
  assign wire5 = $signed($unsigned((((wire3 ? wire1 : wire1) ?
                     {wire2} : wire1) >>> {wire2, wire3[(2'h2):(1'h1)]})));
  assign wire6 = $unsigned({wire3,
                     {{(wire2 ? (7'h43) : wire2), wire5[(3'h4):(1'h0)]},
                         wire0[(1'h0):(1'h0)]}});
  assign wire7 = $signed($unsigned((((wire1 <= wire1) && {wire4,
                     (8'hb8)}) || ((~wire4) ?
                     $signed((8'ha8)) : (wire5 ? wire3 : wire4)))));
  assign wire8 = ((&wire4[(2'h2):(1'h0)]) != {wire0,
                     $unsigned($signed((wire4 ? wire6 : wire4)))});
  assign wire9 = ($unsigned((^~$unsigned((wire6 ?
                     wire3 : wire8)))) ^~ (~wire3[(1'h0):(1'h0)]));
  assign wire10 = {((wire8[(4'hd):(3'h6)] ?
                          (^~(-wire4)) : $signed(wire2)) - (wire3 <= {(wire1 <<< wire8),
                          (wire4 ? wire5 : wire8)})),
                      ((wire6 ?
                          (~|(wire5 ? wire3 : wire3)) : (((8'hb1) ?
                              wire2 : wire6) >>> wire1[(4'hc):(3'h5)])) == (^~((wire4 ?
                          wire1 : wire3) ^~ ((8'hb0) ? (8'hb3) : wire4))))};
  assign wire11 = $signed($signed((wire2 ?
                      $signed(((8'hbe) ? wire10 : wire7)) : ((wire0 ?
                          (8'ha3) : wire9) & $unsigned(wire1)))));
endmodule
