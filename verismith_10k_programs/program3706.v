module top
#(parameter param8 = (^(~&(&({(8'hb4)} ? {(8'ha1), (8'ha8)} : ((7'h40) ? (8'ha9) : (8'hb8)))))), 
parameter param9 = (param8 ? (-{(param8 || (!param8)), (8'ha3)}) : (8'h9c)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (|(^wire3[(4'ha):(1'h0)]));
  assign wire5 = $unsigned($signed(wire1));
  assign wire6 = {(8'hb4),
                     (~((wire5[(4'he):(4'h9)] <= {wire3}) ?
                         ({wire0} ?
                             (wire4 ? wire3 : wire1) : (wire1 ?
                                 (8'hba) : wire4)) : wire2))};
  assign wire7 = wire1[(2'h3):(1'h0)];
endmodule
