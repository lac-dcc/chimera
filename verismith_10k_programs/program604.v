module top
#(parameter param11 = (^(((((7'h43) ? (8'hb1) : (8'haf)) ? ((8'h9d) ~^ (8'ha5)) : (~&(8'hb6))) != ((8'ha8) ? ((8'ha0) ? (8'hb1) : (8'ha7)) : ((8'hab) ^ (8'hb4)))) < (((&(8'hb7)) ? ((7'h41) && (7'h40)) : (~&(8'ha1))) ? ((^~(8'ha4)) - {(8'ha5)}) : (((8'haf) ? (8'hb5) : (8'hbc)) >= ((8'hba) ? (8'hb9) : (8'ha8)))))), 
parameter param12 = (~param11))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = ($signed($unsigned($unsigned(wire1))) & wire3);
  assign wire6 = (+$unsigned(wire1[(3'h7):(3'h5)]));
  assign wire7 = ($unsigned((wire3 + wire6)) ?
                     (~|(^wire5[(3'h4):(2'h2)])) : (~|($unsigned($unsigned((8'hb8))) ?
                         wire5[(1'h1):(1'h1)] : wire6)));
  assign wire8 = (wire7 ? wire3 : wire0);
  assign wire9 = (~&(({(wire8 <<< wire3)} ?
                     wire2 : (wire4 ?
                         $signed(wire2) : wire2)) || {$unsigned($unsigned(wire0)),
                     (8'hb7)}));
  assign wire10 = (((-wire9) ?
                      $signed($signed((wire8 ? wire8 : wire3))) : {wire0,
                          (-$unsigned(wire0))}) >= wire3);
endmodule
