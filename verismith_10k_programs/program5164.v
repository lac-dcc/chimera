module top
#(parameter param8 = (^{{(((8'hb3) ? (8'hab) : (7'h43)) || ((8'ha2) | (8'ha4)))}, ((((8'hb9) <= (8'ha8)) >= {(8'haf), (8'haf)}) >= {{(8'ha8)}})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed(wire1) ?
                     $signed(({{wire2}} <<< wire0[(2'h3):(1'h0)])) : ($unsigned($signed($signed(wire0))) && (((+wire3) ?
                         (wire3 ?
                             wire3 : wire0) : wire3) ~^ wire3[(5'h10):(3'h5)])));
  assign wire5 = (($signed((wire1[(1'h1):(1'h0)] * $signed(wire3))) ~^ $unsigned($signed((wire1 >= wire3)))) ?
                     (^$signed((^(~wire2)))) : $signed($signed((((8'haa) ^~ wire4) ?
                         ((8'hbc) ? wire0 : wire0) : (wire0 < wire0)))));
  assign wire6 = $signed($signed($unsigned(($signed(wire3) ?
                     $signed(wire5) : (wire0 ? wire0 : wire0)))));
  assign wire7 = (~|wire4);
endmodule
