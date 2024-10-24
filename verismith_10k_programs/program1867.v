module top
#(parameter param10 = (((({(8'hae)} != (^~(8'hbf))) * ({(8'ha7)} ? ((7'h43) ? (8'hb1) : (8'h9c)) : (^~(8'ha4)))) ? {{(^~(8'hb1))}} : (((^(8'ha6)) <= {(8'h9f)}) ? (((8'hb0) <<< (8'hbb)) ? {(8'ha6), (8'hab)} : ((8'hbc) ~^ (8'hb2))) : (((8'hb8) ? (8'ha1) : (8'ha5)) <<< {(8'hab)}))) ? ((({(8'ha3), (8'haf)} ? ((8'haa) ? (8'hb6) : (8'ha9)) : ((8'hbb) ? (8'hb0) : (8'hac))) ? ({(8'ha1)} >= ((7'h44) ? (8'had) : (8'hb2))) : (((8'hb1) == (8'haf)) ? ((8'ha9) ^~ (8'hae)) : ((8'hb5) ? (8'hb5) : (8'hba)))) & (((|(8'hb8)) + ((8'hb5) ? (8'h9c) : (8'ha2))) - {((8'hb1) || (8'ha3)), {(8'hba), (8'ha8)}})) : (-(~|(+{(8'ha5), (8'ha4)})))), 
parameter param11 = ((param10 ? (({param10, param10} ^ ((8'hb7) <= param10)) ? param10 : ((param10 ^ param10) ? (param10 ^ param10) : (param10 <= param10))) : param10) ? {param10, param10} : (((&param10) ? param10 : param10) && ({(7'h42), (param10 ? (8'ha7) : param10)} ? (+(param10 + param10)) : ((param10 ? param10 : param10) ? (param10 | param10) : param10)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~&$unsigned($unsigned($unsigned({(8'hb0)}))));
  assign wire5 = ($signed(wire0) * (^(wire2[(3'h4):(3'h4)] < ($signed(wire4) != wire3[(1'h1):(1'h0)]))));
  assign wire6 = {({wire3} + wire1[(3'h4):(1'h1)]),
                     (~^$unsigned((((8'ha4) >= wire2) ^ (&wire3))))};
  assign wire7 = $unsigned($unsigned((($unsigned(wire2) * wire6) ?
                     (~^wire2) : (^wire1[(1'h1):(1'h1)]))));
  assign wire8 = wire6;
  assign wire9 = (-($signed($signed((!wire8))) ?
                     wire1[(4'hb):(1'h0)] : ($unsigned((wire3 ?
                             wire0 : wire5)) ?
                         (8'hb2) : (wire1[(4'hc):(4'h9)] ^ $signed(wire7)))));
endmodule
