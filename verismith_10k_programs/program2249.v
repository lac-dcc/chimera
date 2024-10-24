module top
#(parameter param10 = (((~(((8'hb7) >>> (8'h9f)) * ((8'hae) ? (8'h9d) : (8'hab)))) * (((^(8'ha7)) ? ((8'hb5) ? (8'hbe) : (7'h43)) : (~^(8'hb6))) ? (((7'h42) < (8'ha3)) > ((8'h9d) ? (8'ha9) : (8'ha4))) : (((8'ha6) ? (8'hb4) : (8'hb2)) || {(8'ha2), (8'ha9)}))) ? (~((8'hac) | (((8'hbf) ? (8'hbd) : (8'hab)) ^~ {(8'hb7)}))) : (8'hb7)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (($unsigned((8'h9c)) ?
                     (~$unsigned((~^wire4))) : $unsigned($signed($signed(wire2)))) ^ wire0);
  assign wire6 = ({{wire0, (~&wire4)}} ~^ (8'hae));
  assign wire7 = ({($unsigned($signed(wire2)) ?
                             wire4 : (~|wire5[(1'h0):(1'h0)])),
                         $signed((wire1[(4'h9):(4'h8)] & $unsigned(wire2)))} ?
                     wire4[(3'h6):(3'h4)] : $unsigned($unsigned(((wire1 ?
                         wire6 : wire6) != wire0))));
  assign wire8 = ((((+(8'h9f)) & wire7) ? wire6 : $signed(wire6)) >= wire6);
  assign wire9 = ((&{$unsigned(wire1), wire4[(2'h2):(1'h0)]}) <= wire0);
endmodule
