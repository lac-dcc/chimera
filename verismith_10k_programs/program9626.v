module top
#(parameter param8 = ((+(({(8'hbb)} ? ((8'ha5) * (8'hbd)) : (^(8'h9c))) && (|{(8'ha0)}))) ^ {(~|(((8'hb5) ? (7'h44) : (7'h41)) ? {(8'ha2)} : (^(7'h43)))), ((~&(^~(8'haa))) ? {(-(8'ha0))} : {{(8'hb1)}})}), 
parameter param9 = param8)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((($unsigned((wire3 > wire3)) == (8'hbe)) < wire1));
  assign wire5 = {$unsigned((~^$signed(wire3[(1'h1):(1'h0)])))};
  assign wire6 = {{($unsigned({wire3, wire2}) ?
                             (~&(wire4 < wire0)) : (wire3 ?
                                 (&wire0) : $signed(wire5))),
                         $signed($signed((~&wire2)))},
                     ($signed($unsigned(wire3[(2'h2):(2'h2)])) ^ (wire5[(4'hc):(1'h1)] ?
                         wire0[(2'h2):(1'h0)] : ($signed(wire2) ?
                             {wire2, wire1} : wire4[(2'h2):(1'h1)])))};
  assign wire7 = wire2[(4'ha):(1'h1)];
endmodule
