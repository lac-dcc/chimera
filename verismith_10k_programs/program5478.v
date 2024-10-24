module top
#(parameter param9 = (((^{((8'hb3) >= (8'hac)), ((8'ha1) ? (8'hbf) : (8'ha7))}) >> ((((8'hab) >> (8'hbd)) ? (-(8'hac)) : (~|(8'hba))) > (((8'ha0) ? (8'hac) : (8'hb1)) ^~ ((7'h42) >= (8'haa))))) ? (8'hbc) : {(8'h9d), ((((8'haa) >> (8'hbd)) || (~|(8'ha5))) && (~((8'hb1) << (8'hbb))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(($unsigned(wire0[(1'h1):(1'h1)]) && $signed((wire1[(4'ha):(1'h1)] <<< $unsigned(wire3)))));
  assign wire6 = $signed({({(^wire2)} < (!(!wire5)))});
  assign wire7 = $signed(wire1[(1'h0):(1'h0)]);
  assign wire8 = wire3;
endmodule
