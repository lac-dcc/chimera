module top
#(parameter param13 = (~&(8'hac)), 
parameter param14 = {(|param13)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h0)];
  assign wire5 = {({$signed(wire0), ((&wire4) && wire2)} ?
                         ($unsigned($unsigned(wire0)) ?
                             wire0[(3'h4):(1'h1)] : (~&$unsigned(wire1))) : $unsigned((|(-wire2)))),
                     (((8'hbe) + $signed($unsigned((8'hae)))) ?
                         (({wire0, wire1} <<< wire0) ?
                             ((|wire1) ?
                                 (wire1 ? wire2 : wire2) : (wire1 ?
                                     wire0 : wire2)) : $unsigned(wire0)) : (((&(7'h42)) - $signed(wire0)) ?
                             (wire3[(1'h1):(1'h0)] ?
                                 $unsigned(wire1) : $signed(wire0)) : ((wire2 >> (8'ha5)) ?
                                 ((8'ha8) <<< (8'hac)) : (wire4 ?
                                     wire2 : wire3))))};
  assign wire6 = wire5;
  assign wire7 = (({{{(8'hbb)}, {wire6, wire1}}} ?
                     (wire0[(2'h2):(2'h2)] >>> (wire3[(1'h0):(1'h0)] < $signed(wire6))) : ((+(~^wire2)) ?
                         {wire0[(3'h4):(1'h1)]} : $signed({wire1}))) & ((^$unsigned((!wire5))) >= (7'h41)));
  assign wire8 = wire6;
  assign wire9 = (~|{$signed(wire3[(1'h1):(1'h0)])});
  assign wire10 = wire1;
  assign wire11 = wire3[(2'h3):(2'h2)];
  assign wire12 = wire11[(4'h9):(3'h4)];
endmodule
