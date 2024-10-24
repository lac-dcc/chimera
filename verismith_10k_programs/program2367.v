module top
#(parameter param9 = (({(~&((8'hb5) || (8'h9e)))} ? ((((7'h41) != (8'ha0)) ? ((8'ha9) ? (8'had) : (8'ha8)) : (-(8'hb1))) ? ((-(8'hbf)) ^ {(8'hb0)}) : (((8'h9f) ~^ (8'ha8)) >> {(8'hbf), (8'hbd)})) : ((~&((8'hbe) >>> (8'ha6))) ? (~&((8'ha8) == (7'h43))) : {((8'hb0) != (8'hb1)), ((8'ha1) ? (8'hbe) : (8'ha3))})) ? ((((^~(8'ha4)) ? (~(8'hb2)) : {(8'hab)}) || ((~|(8'hae)) ? ((8'ha8) ? (8'hac) : (8'haf)) : (|(7'h40)))) ? {(((8'haf) == (8'hbd)) & (~(7'h40)))} : ({{(7'h44)}, ((7'h42) ? (8'hb3) : (8'hb7))} ? (~^{(8'ha8), (8'h9e)}) : (8'hba))) : (!((~|(|(8'hb7))) && (7'h40)))), 
parameter param10 = {param9, (((!param9) ~^ (8'hb8)) >>> (((param9 ? param9 : param9) ? {(8'hb3)} : (param9 >>> param9)) ? param9 : ((param9 ? param9 : param9) >>> (param9 ? param9 : (8'h9e)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (((wire2[(4'hf):(4'h8)] && $signed((wire0 >>> wire3))) ?
                     (8'hba) : ({{wire2, wire0}, (+wire2)} ?
                         wire1 : (~&$signed(wire2)))) + ({$unsigned($signed(wire3))} > wire2[(3'h4):(1'h0)]));
  assign wire5 = wire0[(3'h7):(3'h6)];
  assign wire6 = wire2[(4'he):(3'h6)];
  assign wire7 = (($unsigned(wire2[(3'h6):(3'h5)]) ?
                         $unsigned(wire4[(4'h8):(1'h1)]) : wire5) ?
                     ($unsigned({wire6, {wire0}}) ?
                         {$signed((!wire0))} : (wire4[(2'h2):(1'h0)] ?
                             $signed(((8'hb4) ?
                                 wire4 : (8'hb4))) : $unsigned(wire1))) : wire0[(3'h6):(3'h5)]);
  assign wire8 = wire3;
endmodule
