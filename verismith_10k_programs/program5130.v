module top
#(parameter param8 = (^{(((8'hb3) >> (^~(8'ha4))) ? (((7'h42) ? (8'hb3) : (7'h43)) ? (^(8'h9c)) : (8'h9c)) : ({(8'hb5)} ? ((8'hb7) ? (8'hbe) : (8'had)) : {(7'h44)})), ((((7'h42) != (8'hba)) || ((8'hbc) - (8'h9f))) + (((8'hac) && (8'hac)) ? ((8'hb5) >= (8'ha1)) : ((8'hb2) ? (8'h9d) : (8'hbd))))}), 
parameter param9 = (param8 ? (((param8 + (param8 << param8)) ? (~(param8 ? param8 : param8)) : (~{param8, param8})) <<< (+(~|(param8 ? param8 : param8)))) : (^((8'ha0) < (8'h9f)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((((~(wire3 ? wire0 : wire2)) ?
                     (-(wire1 ?
                         wire0 : (8'hbf))) : wire3) == $signed(wire0)) >> $signed($unsigned((+wire0[(4'h8):(2'h3)]))));
  assign wire5 = $signed(($unsigned(($signed(wire1) + $signed(wire4))) ^~ (((wire2 && wire2) < (wire4 ?
                         wire0 : wire0)) ?
                     wire0[(2'h2):(2'h2)] : (|(wire4 ? wire2 : wire3)))));
  assign wire6 = {(|$signed($unsigned(((7'h42) << (8'hbd))))), wire0};
  assign wire7 = wire2;
endmodule
