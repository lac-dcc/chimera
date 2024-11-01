module top
#(parameter param10 = (({(~(+(8'hba)))} != ({(8'hb7)} ? (~&{(8'ha3)}) : (((8'h9c) ^~ (8'haf)) ? ((8'ha9) >> (8'had)) : (^(8'ha6))))) ? (^~((((8'hbf) ? (8'haf) : (8'hbb)) ? (^~(8'hab)) : ((8'ha9) | (8'hb0))) ? (-{(8'haf), (8'h9e)}) : (((8'ha4) >= (8'ha7)) < ((8'hb5) ? (8'ha4) : (8'hae))))) : (!(!(~^(8'ha4))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned((~^$unsigned(wire0)));
  assign wire6 = $unsigned(((wire3 ?
                     $unsigned($signed(wire4)) : $unsigned({wire2})) < $unsigned($signed(wire1))));
  assign wire7 = (wire6[(1'h1):(1'h1)] == wire6[(4'h9):(2'h2)]);
  assign wire8 = wire1[(2'h2):(2'h2)];
  assign wire9 = {(^(|((wire3 ? wire3 : (8'ha1)) ^~ $unsigned(wire5)))),
                     $unsigned(($signed((^~wire2)) ?
                         wire5 : $unsigned((wire4 < wire1))))};
endmodule
