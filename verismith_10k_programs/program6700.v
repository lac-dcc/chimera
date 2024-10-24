module top
#(parameter param8 = (-(((((8'had) >> (8'ha9)) ? {(8'ha0)} : ((8'hbf) ~^ (7'h42))) ? (|((7'h43) && (7'h44))) : (((8'ha0) ^ (7'h41)) < (~|(8'ha0)))) <<< {(((8'hb9) > (8'hbb)) ? ((8'h9d) ? (8'h9e) : (8'hb7)) : {(7'h43), (7'h44)}), ((~(8'hbd)) ? ((8'ha1) ? (8'hb9) : (8'hb0)) : {(8'haf)})})), 
parameter param9 = (((param8 ? param8 : param8) || ((-(&param8)) ~^ param8)) ? {((param8 ~^ (param8 ? param8 : param8)) & {{param8}, param8})} : ((~(^(&param8))) <<< (8'hbd))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($unsigned((~&wire1)));
  assign wire5 = wire2[(4'h9):(4'h9)];
  assign wire6 = wire2;
  assign wire7 = {(({wire3[(2'h3):(1'h1)]} ?
                             $signed(wire3[(2'h3):(1'h0)]) : (-(wire6 >= wire2))) ?
                         {$unsigned((wire1 << wire5))} : wire0[(3'h4):(2'h3)]),
                     wire6};
endmodule
