module top
#(parameter param12 = (8'h9d), 
parameter param13 = param12)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(1'h1):(1'h1)];
  assign wire6 = ((^~{(wire0[(3'h7):(1'h0)] ?
                         wire2[(1'h0):(1'h0)] : (~wire2))}) <= ($signed((~$unsigned(wire1))) <<< wire0[(4'h9):(2'h3)]));
  assign wire7 = (^$unsigned((((^~wire5) ?
                     $signed((8'had)) : wire1) <= wire3[(2'h2):(2'h2)])));
  assign wire8 = (($unsigned((|wire7[(1'h0):(1'h0)])) ?
                     $signed($signed({wire5})) : (wire2 ^~ $signed({wire0,
                         (8'hb3)}))) != $signed((wire4 ?
                     ($signed(wire6) <<< wire1) : ((wire1 ~^ (7'h43)) ?
                         wire7[(2'h2):(2'h2)] : (~&wire4)))));
  assign wire9 = wire6[(1'h0):(1'h0)];
  assign wire10 = wire6[(3'h5):(1'h1)];
  assign wire11 = wire2;
endmodule
