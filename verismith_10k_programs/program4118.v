module top
#(parameter param9 = (8'hb6))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire3;
  assign wire7 = ((((wire6[(1'h1):(1'h0)] ?
                         (&wire2) : wire3[(3'h6):(2'h3)]) < ((8'ha1) ?
                         wire3[(3'h4):(2'h2)] : $signed((8'hb3)))) <<< $signed($signed($unsigned(wire2)))) ?
                     ({wire5[(3'h7):(1'h0)]} ?
                         wire1[(1'h1):(1'h1)] : ($unsigned({wire1,
                             (8'ha0)}) <<< $unsigned($signed(wire6)))) : (!wire6[(4'ha):(2'h2)]));
  assign wire8 = ((wire2[(3'h7):(3'h4)] ?
                         (~^wire6[(4'hf):(3'h7)]) : wire5[(2'h3):(1'h0)]) ?
                     ((($signed(wire0) & (wire2 < wire6)) ?
                             (!(wire4 ?
                                 wire1 : wire1)) : wire5[(3'h7):(2'h2)]) ?
                         (|({wire2} >>> wire7)) : (+$unsigned((wire7 ?
                             (8'ha4) : (8'ha9))))) : $unsigned({($signed((8'h9f)) & wire1[(1'h0):(1'h0)]),
                         $signed($signed(wire2))}));
endmodule
