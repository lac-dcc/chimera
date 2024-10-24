module top
#(parameter param8 = (|{(|(|((8'ha5) ? (8'ha4) : (8'hac)))), (~&((~(8'hbe)) ? ((8'ha7) ? (7'h42) : (8'hb3)) : ((8'h9e) ? (7'h43) : (8'hb0))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {$signed((~($signed(wire0) <= (~^(7'h40)))))};
  assign wire5 = (7'h41);
  assign wire6 = {(^~((~$unsigned(wire2)) ?
                         wire4[(2'h3):(2'h3)] : ((7'h44) ?
                             ((8'hb9) >> (7'h42)) : $unsigned(wire0)))),
                     $unsigned($signed((+wire1[(2'h3):(1'h0)])))};
  assign wire7 = (wire0[(3'h4):(2'h3)] << wire2);
endmodule
