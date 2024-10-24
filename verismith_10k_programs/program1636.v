module top
#(parameter param12 = (((({(8'hb8), (8'ha8)} <= {(7'h42)}) ? {(|(7'h40))} : (+((8'hbf) ? (8'hb3) : (8'hb7)))) >> ((|((8'hbc) ? (8'hb5) : (8'had))) * (((8'hac) ^~ (8'ha1)) - ((8'hb7) ? (7'h44) : (8'hb3))))) && ((({(7'h44)} ? ((8'hb1) ? (8'ha2) : (8'ha1)) : ((8'hbb) >> (8'hbd))) ? (((8'ha2) & (8'hbb)) ? {(8'hbc), (8'hb0)} : {(8'hb7)}) : (((8'ha3) | (8'ha8)) * {(8'ha5)})) ? {(7'h41)} : (~{((7'h40) ? (8'haa) : (8'hb6))}))), 
parameter param13 = (param12 ? (param12 ? ((^~(param12 <<< param12)) ? param12 : (^~(param12 ^ param12))) : (((param12 ? param12 : (8'hbb)) ? (^param12) : param12) ^~ (&param12))) : (~&param12)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((|(~((wire1 ? wire1 : (7'h42)) ?
                         $unsigned(wire3) : {wire1, (8'ha5)}))) ?
                     wire1[(3'h7):(1'h0)] : $unsigned(wire2[(2'h2):(1'h1)]));
  assign wire5 = ((^~wire1[(2'h3):(2'h2)]) ?
                     wire4[(1'h0):(1'h0)] : ((8'hb9) ?
                         (|{$unsigned(wire4), wire2}) : wire4[(2'h2):(1'h1)]));
  assign wire6 = ($unsigned(({(wire2 ? wire5 : (8'ha7)),
                         (wire2 ? (8'h9f) : wire2)} ?
                     ($signed(wire3) < $signed((8'h9c))) : ({(8'hb6), wire3} ?
                         wire0 : (^~wire1)))) == ({$signed(((8'ha6) & (7'h41))),
                     $unsigned($unsigned(wire3))} ~^ (^wire2[(4'hb):(3'h7)])));
  assign wire7 = ((&{((|wire0) ~^ (^wire0)), $unsigned(wire1)}) && wire3);
  assign wire8 = (~wire1[(3'h6):(2'h3)]);
  assign wire9 = (~|wire8);
  assign wire10 = $signed((~^wire2));
  assign wire11 = wire0;
endmodule
