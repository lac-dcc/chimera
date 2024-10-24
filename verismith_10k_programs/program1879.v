module top
#(parameter param9 = ((8'ha6) ^ (((((8'ha8) ^ (8'had)) ? ((8'ha2) ? (7'h40) : (8'hbc)) : ((8'hab) ? (8'hb7) : (8'ha9))) << (((8'ha7) & (7'h42)) ? ((8'ha0) <<< (8'hbe)) : ((8'haf) ? (8'hb8) : (8'ha0)))) | ((~((8'ha3) ? (8'haa) : (8'hb5))) ? (((7'h43) != (8'haa)) ^ ((8'hb9) ^ (8'hb5))) : (-(~^(8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed((~&$unsigned($signed((8'h9d))))) ?
                     $unsigned($unsigned($unsigned($signed(wire0)))) : wire2[(3'h4):(1'h1)]);
  assign wire5 = $unsigned(wire4);
  assign wire6 = $signed({wire5[(1'h1):(1'h0)],
                     $unsigned((^~wire2[(4'he):(4'ha)]))});
  assign wire7 = wire4[(4'h9):(3'h5)];
  assign wire8 = $signed(($unsigned(((wire7 >= wire0) ?
                         (-wire2) : (wire1 != wire2))) ?
                     {$signed(wire7), $unsigned({(7'h40)})} : ($signed(wire1) ?
                         wire7 : $unsigned((wire5 ? wire6 : (8'ha3))))));
endmodule
