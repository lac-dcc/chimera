module top
#(parameter param9 = ((~(~|{{(7'h42), (8'ha1)}})) ^~ ((~|({(8'ha8)} < (&(8'had)))) >= ((&{(8'ha4), (8'hbf)}) ~^ {((8'ha8) ? (8'ha1) : (8'h9c)), (+(8'hab))}))), 
parameter param10 = ((~|({param9} & (+param9))) ? ({((param9 ? param9 : param9) <= (param9 ? param9 : param9))} && (((param9 ? param9 : param9) | (param9 ^ param9)) ? param9 : (~((8'hb2) ? param9 : param9)))) : ({((param9 ? param9 : param9) ? (7'h40) : (~param9))} ? param9 : ({param9} > param9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3;
  assign wire5 = (~$signed(wire4[(3'h6):(1'h0)]));
  assign wire6 = ($signed(($signed((wire2 ? wire1 : wire3)) > $unsigned((wire1 ?
                         (8'haf) : (8'ha2))))) ?
                     $signed(((^(wire5 ? (8'hb8) : wire4)) ?
                         $unsigned({wire3,
                             wire0}) : wire4)) : (-$signed(((wire2 ?
                         wire1 : wire4) ^ (wire2 - wire2)))));
  assign wire7 = (wire3 ?
                     $unsigned(((7'h40) ?
                         (wire3 ?
                             wire6[(3'h4):(1'h1)] : (^(8'had))) : (wire3[(3'h5):(2'h3)] < (8'hbf)))) : $unsigned(wire6[(1'h1):(1'h1)]));
  assign wire8 = (wire3[(4'hb):(3'h4)] + {wire5, wire3[(4'he):(3'h7)]});
endmodule
