module top
#(parameter param10 = (~^((!(8'hbd)) ? {((8'ha5) >= (8'ha2)), {(|(8'hb4)), {(8'ha4), (8'hbb)}}} : {((-(8'hb6)) > (!(8'h9e))), ((-(7'h43)) ? ((8'ha0) >>> (8'h9f)) : (~^(8'h9d)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4[(3'h5):(3'h4)];
  assign wire6 = (!$unsigned({((wire4 > wire1) <<< (wire1 ? wire5 : (8'hb7))),
                     $signed(wire2)}));
  assign wire7 = $unsigned(((({wire3} ?
                             $unsigned(wire0) : ((8'ha5) ? wire5 : (8'hba))) ?
                         $unsigned(wire0[(4'he):(4'hd)]) : (~&(wire5 ?
                             wire4 : (7'h42)))) ?
                     wire2[(2'h3):(1'h1)] : wire5));
  assign wire8 = wire4[(3'h4):(3'h4)];
  assign wire9 = ($unsigned(((-wire7[(5'h11):(2'h3)]) || $unsigned((wire1 ?
                     (7'h42) : wire0)))) && {$unsigned((wire4 ?
                         $unsigned((8'ha6)) : (wire0 | (8'hb8)))),
                     $unsigned(wire0[(5'h10):(4'hc)])});
endmodule
