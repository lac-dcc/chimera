module top
#(parameter param9 = {((&(((8'haa) ? (8'h9c) : (8'hae)) || (~|(8'ha0)))) < (+({(7'h43)} < ((8'ha2) || (8'hbe))))), (((((8'ha7) - (8'had)) | (^(8'hbf))) ? (((8'hbc) - (8'ha9)) && (+(8'hab))) : {(~&(7'h43)), ((8'hbc) ? (8'had) : (8'hb1))}) ? ((~((8'hbd) > (8'hb3))) ~^ (~^((8'ha8) ? (8'hb3) : (7'h40)))) : ({((8'ha0) ? (8'hb5) : (8'hbf)), ((8'hac) ? (8'ha1) : (8'hb5))} ? (8'ha3) : (&((8'hb4) - (8'ha5)))))}, 
parameter param10 = ({param9, ((8'hbb) ? param9 : ((8'haf) ? (7'h42) : ((8'hb3) != param9)))} ? (8'hab) : param9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($signed($signed(wire4)) - (~|wire1[(3'h5):(2'h3)]));
  assign wire6 = (^$signed(((wire2[(4'hb):(2'h2)] << $signed(wire4)) ?
                     $signed($unsigned(wire2)) : wire4)));
  assign wire7 = $signed({$signed(((wire3 ? wire1 : wire6) ?
                         (~|(8'hbb)) : (wire0 ? wire0 : (8'ha0)))),
                     $unsigned(wire2)});
  assign wire8 = (^(($unsigned((~^(8'hbe))) ?
                     (|(^~wire2)) : $signed(wire0[(4'hd):(4'h8)])) >> wire7[(1'h1):(1'h1)]));
endmodule
