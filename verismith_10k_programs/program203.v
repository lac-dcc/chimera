module top
#(parameter param9 = {({((^(8'had)) ? {(8'h9f), (8'h9f)} : ((8'h9d) >>> (7'h40))), (8'hb9)} & (^~{{(8'hb3), (7'h44)}})), (((((8'ha3) > (8'hbe)) == ((8'h9c) ? (8'hac) : (7'h40))) ? (-((8'hac) >>> (8'ha6))) : ((|(7'h40)) >= {(8'hb9), (8'hb2)})) <= (((^~(8'hac)) * (~(8'ha5))) ~^ (((7'h44) & (8'ha0)) ^~ (~(8'h9d)))))}, 
parameter param10 = (({(param9 == param9), ((!(8'hbf)) > (param9 ? param9 : param9))} ? ((param9 ? (param9 | param9) : (!param9)) ? (^~(+param9)) : ({param9} && (^(8'hbe)))) : ((param9 != param9) ? ((param9 | (8'ha8)) ? (+param9) : (param9 >>> param9)) : (+((8'ha9) << (8'hb8))))) * param9))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = ((((wire1 && wire1) * (~$signed(wire0))) != {$signed(wire4[(3'h5):(1'h1)])}) <= (wire4 ?
                     (~(8'ha4)) : wire4));
  assign wire6 = (~(wire5 ^~ wire1));
  assign wire7 = wire3;
  assign wire8 = ($unsigned($signed({$unsigned(wire7),
                     wire5})) + $signed($signed($signed((&wire3)))));
endmodule
