module top
#(parameter param9 = (+(+({((7'h42) ? (8'ha0) : (8'hab)), {(8'hb5)}} ? ({(8'h9d), (8'had)} ? ((7'h42) ^~ (7'h44)) : (~|(8'haa))) : (~|((8'hb6) ? (8'ha6) : (7'h42)))))), 
parameter param10 = param9)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire3[(4'h8):(3'h5)]);
  assign wire5 = (|((8'ha0) ?
                     (^~{$unsigned(wire2),
                         (8'ha3)}) : $unsigned($signed((wire1 ?
                         wire1 : wire3)))));
  assign wire6 = {(~^$signed($unsigned($signed((8'h9c)))))};
  assign wire7 = (wire6 ?
                     wire4 : ((^~$unsigned((wire1 ? wire6 : wire1))) ?
                         wire6[(4'h9):(3'h5)] : ((8'hb4) ?
                             (wire6[(3'h6):(1'h1)] ?
                                 wire6[(4'h8):(3'h5)] : ((8'ha0) <<< wire1)) : $signed((wire0 >>> wire2)))));
  assign wire8 = wire5;
endmodule
