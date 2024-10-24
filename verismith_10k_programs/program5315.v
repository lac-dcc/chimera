module top
#(parameter param11 = (((~|({(7'h44), (8'hac)} + (^(8'hab)))) - (+{(&(8'hbb)), (&(8'had))})) ? {((&(|(8'hae))) & ({(8'hb8), (8'hb2)} ? (~^(8'hae)) : ((8'ha4) << (8'ha4))))} : ({{{(8'hb9)}}} ? (({(8'ha7)} < {(8'hbf)}) ? {(|(8'h9e))} : ({(8'ha6)} ^~ ((8'hb5) && (8'hb2)))) : {({(7'h40)} ~^ {(8'hbb)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($signed($signed((~&(wire3 != wire3)))) || (~wire2[(1'h0):(1'h0)]));
  assign wire6 = $unsigned(wire5);
  assign wire7 = (((7'h41) ? (~wire6) : $unsigned((wire1 && wire4))) <<< wire1);
  assign wire8 = wire0[(3'h7):(1'h0)];
  assign wire9 = {(((~&$signed(wire5)) ? wire7 : {$unsigned(wire2)}) & wire2)};
  assign wire10 = $signed(wire2[(1'h1):(1'h1)]);
endmodule
