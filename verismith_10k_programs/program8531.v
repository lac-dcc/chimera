module top
#(parameter param9 = (~&({(|(-(8'ha4)))} ? (({(8'ha1)} ? {(8'hb3)} : (^(8'h9e))) ? (7'h42) : (((8'h9f) || (8'had)) <= ((8'had) - (7'h40)))) : ((((8'hab) >>> (8'hb5)) && (^(7'h41))) ? {((8'hbf) ? (8'h9e) : (8'hac))} : ({(8'haf), (8'had)} - {(8'ha5)})))), 
parameter param10 = param9)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1;
  assign wire6 = (wire3 ?
                     (wire0 <= (~^((~&wire3) ?
                         (~&wire3) : {wire5}))) : (wire4[(2'h3):(2'h3)] * $unsigned((-(wire5 ?
                         (8'hbf) : wire5)))));
  assign wire7 = (8'h9d);
  assign wire8 = wire5[(3'h7):(3'h6)];
endmodule
