module top
#(parameter param9 = ((&{(8'ha8), ((~^(8'hbc)) ? (8'ha5) : ((8'h9f) ? (8'hbe) : (8'hb2)))}) ? (+((((8'hbd) ? (8'ha2) : (8'hbd)) * (-(8'h9d))) ? ({(8'hb4), (8'ha7)} <<< {(8'ha1)}) : (((8'ha0) >= (8'hac)) ^~ ((8'h9e) ? (8'ha5) : (8'hab))))) : (((~(~(8'ha7))) ? (((7'h40) ? (8'hab) : (8'ha7)) ? ((8'hbd) ? (8'hb6) : (8'hab)) : (8'hb4)) : (8'hb1)) ? (&(((8'hbc) ? (8'hb1) : (8'h9f)) ? ((8'ha0) >>> (8'ha4)) : (+(7'h44)))) : ((((8'h9c) != (8'haf)) ? ((8'hba) > (8'hac)) : ((8'hb8) ? (8'h9c) : (8'haf))) != (((8'hbf) < (8'ha0)) ? ((8'h9c) ? (8'ha9) : (8'hbb)) : {(7'h42), (8'hb8)})))), 
parameter param10 = ((~|{{{param9}}}) ? (~(((param9 >> param9) ^ param9) ? ((^~param9) <<< (!param9)) : (8'hbd))) : ((|param9) ? {{((8'ha6) ? param9 : param9)}, param9} : param9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((-$unsigned((~&$unsigned(wire2)))) ?
                     $unsigned((|wire1[(4'he):(4'he)])) : $unsigned((-((wire0 >> wire1) ?
                         (8'h9d) : $signed(wire0)))));
  assign wire5 = (~{{$unsigned({wire0})}});
  assign wire6 = $unsigned(wire0);
  assign wire7 = ((($signed($unsigned(wire2)) != (wire5 * wire3)) >> $unsigned(wire4[(3'h4):(3'h4)])) ^~ wire2);
  assign wire8 = $unsigned(wire3);
endmodule
