module top
#(parameter param8 = (({{((8'ha6) ^~ (8'ha1)), (&(8'hb6))}} > ((~((8'hb1) ? (8'had) : (8'h9c))) == ((~(8'ha4)) >= ((8'ha0) ? (8'h9e) : (8'h9d))))) ? ((8'h9f) ? (~(^(~|(8'ha5)))) : ((((8'had) <= (8'h9f)) ^ {(8'ha2)}) ? {((8'hb5) ^~ (8'hbf))} : ((~|(8'ha1)) ? ((8'hb7) <<< (8'ha1)) : (^(8'hac))))) : (^~((^((7'h40) ^~ (8'hb8))) < (|((8'ha4) <<< (8'h9d)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed((wire0[(3'h5):(2'h3)] == $signed($signed({wire1}))));
  assign wire5 = wire1[(1'h1):(1'h0)];
  assign wire6 = wire1[(3'h6):(1'h0)];
  assign wire7 = $unsigned($signed((~&$signed($unsigned(wire5)))));
endmodule
