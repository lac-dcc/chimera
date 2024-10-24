module top
#(parameter param8 = (~(^((~((8'hb5) ? (8'hac) : (8'hbf))) ? (((8'hb0) ? (8'hab) : (8'ha7)) ? ((8'hb5) ? (8'hb5) : (8'hb0)) : ((8'ha7) ? (8'ha1) : (8'hba))) : (((7'h40) ? (7'h40) : (8'ha8)) <<< (~^(8'h9d)))))), 
parameter param9 = ({(((&(8'h9c)) ? param8 : (param8 ? param8 : param8)) ? {param8} : ((param8 ? (8'ha1) : param8) ? ((8'ha7) ? (8'had) : (7'h40)) : {param8, param8})), ((&(param8 ? param8 : param8)) < (+(param8 ~^ param8)))} * (param8 ? ((((8'h9f) ? param8 : param8) != ((7'h40) >>> param8)) | param8) : param8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1[(4'ha):(3'h4)];
  assign wire5 = wire2;
  assign wire6 = (^(({wire3[(4'hf):(3'h5)]} & (((8'haa) ^ wire3) ?
                     {wire1} : wire3[(1'h1):(1'h1)])) && (((^~wire1) ~^ wire3) > (-$signed(wire3)))));
  assign wire7 = (wire4 ?
                     ($signed($signed((wire3 ?
                         wire1 : wire1))) < $signed((|wire0[(4'hc):(3'h5)]))) : wire0[(1'h0):(1'h0)]);
endmodule
