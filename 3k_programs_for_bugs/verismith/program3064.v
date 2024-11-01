module top
#(parameter param10 = (+(&(-(^(-(8'h9e)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {{wire2}, (wire0 | (^~wire4))};
  assign wire6 = wire0;
  assign wire7 = (((wire3 ?
                         (((8'haa) ? wire6 : (8'hbf)) ~^ {wire4,
                             wire0}) : ($signed(wire3) ?
                             {wire1} : (&wire6))) || ($unsigned(wire0) & (!(wire5 ?
                         wire2 : wire6)))) ?
                     wire5[(3'h5):(1'h0)] : {$unsigned(wire1[(4'ha):(2'h2)])});
  assign wire8 = (~^(((wire0 ?
                         wire6[(2'h3):(2'h2)] : (wire6 | (8'ha9))) ^ (((8'hbe) ?
                             wire4 : wire5) ?
                         {wire1, wire2} : (wire3 & wire4))) ?
                     $signed((~|wire7)) : $signed((!(wire1 ? wire2 : wire1)))));
  assign wire9 = (8'ha1);
endmodule
