module top
#(parameter param11 = (((((^~(8'ha9)) | ((8'hb7) ? (8'haa) : (8'ha9))) ? (((8'haf) ? (7'h41) : (8'hab)) >= (~(8'ha3))) : (((8'h9e) >>> (8'hac)) ? ((8'ha7) ? (7'h42) : (8'ha4)) : (+(7'h44)))) ? ((((8'ha5) == (7'h40)) + (~^(8'hac))) ? ((~&(8'haf)) << ((8'ha0) ? (7'h43) : (8'h9e))) : (^((8'h9d) ? (8'hb8) : (8'hab)))) : ({(!(8'ha1)), {(8'ha6)}} ? (^~(!(8'hb6))) : (7'h44))) ? ((({(8'hb1), (8'hb7)} ? {(8'hb5), (8'hb9)} : {(8'hba)}) ? {(+(8'hbc))} : {{(8'hb0)}}) ? (8'hae) : (^~({(8'haa)} <= (~^(8'hb9))))) : ((~&(|((8'hbf) ? (8'ha5) : (7'h43)))) & (-{((8'ha6) != (8'hb5)), ((7'h44) ? (8'ha2) : (8'ha5))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (({{(wire0 & wire2), (wire2 <= wire0)}} ?
                     wire2[(3'h5):(3'h5)] : $signed(wire2[(3'h4):(1'h0)])) != ($unsigned((wire1 ?
                     $unsigned(wire3) : (wire3 >> wire0))) == ((wire0[(1'h0):(1'h0)] ?
                         (+wire2) : (wire0 && wire0)) ?
                     $signed($unsigned(wire2)) : $unsigned(wire0))));
  assign wire5 = (($unsigned(((wire1 ? wire4 : wire2) ?
                             (-wire4) : {wire2, wire0})) ?
                         $signed($signed($unsigned(wire1))) : (($signed((8'hb0)) ?
                             wire4[(1'h1):(1'h0)] : (~|wire3)) >>> $signed(((8'hb5) ?
                             wire1 : (8'hb2))))) ?
                     wire1 : wire4[(1'h0):(1'h0)]);
  assign wire6 = wire2;
  assign wire7 = (wire1 ?
                     ({(wire3[(4'hd):(3'h4)] ^ $unsigned(wire2)),
                             $unsigned(wire0[(1'h0):(1'h0)])} ?
                         {(~|wire0),
                             (wire1 ?
                                 $unsigned(wire6) : (|wire1))} : (((^wire3) >= {wire0,
                             wire3}) >= wire3)) : $unsigned((^(&$unsigned(wire5)))));
  assign wire8 = ((wire0 ?
                         wire4 : ($signed(wire0) ?
                             $unsigned((wire5 & (7'h43))) : ((wire1 ^ (8'hb7)) + $signed(wire4)))) ?
                     ($unsigned((~^(wire7 > (8'hb9)))) <= (-$signed((^wire7)))) : $signed((&wire2)));
  assign wire9 = (wire1[(2'h2):(1'h1)] ?
                     wire5 : (&$signed(wire1[(1'h1):(1'h1)])));
  assign wire10 = {wire9, (~|$unsigned(wire4[(2'h2):(1'h1)]))};
endmodule
