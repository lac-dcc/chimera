module top
#(parameter param12 = {{(&(((8'ha3) ? (8'hb7) : (8'hbd)) - (^~(8'hbd)))), ((((8'ha1) ? (7'h40) : (8'ha7)) & ((8'hb1) ? (8'ha1) : (8'hb4))) == ({(8'ha9), (8'ha2)} ? ((8'hac) ? (8'haa) : (8'haa)) : (8'hb0)))}}, 
parameter param13 = {(~|({(param12 ? param12 : param12)} ? (+((8'ha1) ? param12 : param12)) : (-param12))), (+param12)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire0[(3'h6):(3'h6)] < wire2[(2'h2):(2'h2)]);
  assign wire5 = (wire4 >> wire0);
  assign wire6 = wire5[(1'h0):(1'h0)];
  assign wire7 = {$signed((wire5 << wire4[(3'h4):(3'h4)])),
                     ($signed((!wire2[(2'h2):(1'h1)])) ?
                         ($signed((~(8'hbe))) >>> wire2[(1'h0):(1'h0)]) : (&wire2[(2'h2):(1'h1)]))};
  assign wire8 = ((^~wire3[(3'h5):(1'h0)]) + ((|($signed((7'h44)) <<< (wire2 ?
                         wire7 : wire2))) ?
                     wire7 : $signed(wire1)));
  assign wire9 = $signed((wire0 ?
                     {wire2} : $signed($signed({(8'hbf), wire8}))));
  assign wire10 = (~wire8[(5'h11):(4'hf)]);
  assign wire11 = $signed({$unsigned((~&$unsigned(wire1))),
                      ({{wire8}, $signed(wire4)} == ($signed(wire1) ?
                          wire5[(3'h4):(2'h2)] : (wire4 ? wire2 : wire1)))});
endmodule
