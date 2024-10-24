module top
#(parameter param9 = ((|(~|(^~{(7'h43), (7'h43)}))) != (^~({((8'h9c) ^ (8'h9c))} ? ((-(8'ha3)) >= ((8'h9e) ? (8'ha1) : (8'h9c))) : (8'had)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (~|(~^(($signed(wire1) | wire3[(2'h2):(1'h0)]) ?
                     {$unsigned(wire4)} : ($signed(wire0) ?
                         wire3 : (^~wire2)))));
  assign wire7 = ({wire0[(4'hb):(4'ha)]} ?
                     wire2 : $unsigned((($signed(wire0) || (~^wire1)) ?
                         ({(8'ha3)} ?
                             $signed(wire0) : (!wire6)) : (~^$unsigned(wire6)))));
  assign wire8 = $signed($unsigned($unsigned(wire6[(4'h8):(2'h3)])));
endmodule
