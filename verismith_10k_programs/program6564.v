module top
#(parameter param8 = {(((((8'hb6) ? (8'ha1) : (8'hbe)) <<< ((8'hab) ? (8'hb9) : (8'hb9))) ? {(~|(8'ha8))} : (^(8'hbb))) < (({(8'ha0), (8'hb2)} ? ((8'hbd) ? (8'haf) : (8'hb4)) : ((8'haa) ? (8'ha0) : (8'hb7))) ? (((8'had) > (8'had)) != {(8'hab)}) : ((~^(8'h9e)) <<< ((7'h41) >> (7'h44))))), (&((~((8'hbe) >= (8'ha7))) ? (((7'h41) && (8'hb1)) < ((8'hbd) == (7'h43))) : ({(8'h9e), (8'h9f)} ? (|(8'ha1)) : ((8'haf) ? (8'ha9) : (8'ha3)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned($signed(wire0));
  assign wire5 = $unsigned((($unsigned(wire3) ?
                     wire0[(4'h9):(1'h1)] : wire3[(3'h6):(3'h6)]) && wire4[(4'h8):(3'h4)]));
  assign wire6 = ($signed(wire5[(4'hb):(4'ha)]) ?
                     $unsigned($unsigned(((wire1 ?
                         wire0 : wire1) != wire2[(1'h0):(1'h0)]))) : $unsigned((wire3[(4'h8):(2'h3)] ?
                         ((~|(8'hb2)) ?
                             wire5[(3'h4):(2'h2)] : $signed(wire0)) : (&wire0[(3'h4):(1'h0)]))));
  assign wire7 = ((((~^$signed(wire4)) <= $unsigned(wire4[(2'h2):(1'h0)])) && $unsigned($signed((-wire0)))) ?
                     {($unsigned({wire3}) == {{wire1}})} : $unsigned(wire6));
endmodule
