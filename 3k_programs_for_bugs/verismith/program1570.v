module top
#(parameter param10 = {(~|(&(!(8'hb0))))}, 
parameter param11 = (param10 != ((param10 <<< param10) ? {((param10 | param10) ? ((8'ha6) ? (7'h40) : (8'hbb)) : param10), ((param10 < param10) << (-param10))} : (((param10 >>> param10) ? param10 : (|param10)) ? param10 : (-(param10 ? param10 : param10))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed($signed(($unsigned({wire1, (8'ha1)}) ?
                     ($signed(wire2) != wire1) : (wire1[(4'hb):(2'h2)] && $unsigned(wire0)))));
  assign wire6 = $signed(wire4[(3'h5):(1'h0)]);
  assign wire7 = wire6[(3'h5):(1'h0)];
  assign wire8 = {{(wire7[(4'h9):(3'h4)] <= $signed((8'hb0))), wire6},
                     $signed($signed(($signed(wire1) ?
                         (wire0 ? wire5 : wire2) : {wire1, wire1})))};
  assign wire9 = $unsigned(wire5);
endmodule
