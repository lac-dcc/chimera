module top
#(parameter param9 = ((~&(~(((7'h40) <<< (8'hbb)) ? ((8'h9c) ? (7'h44) : (8'hb1)) : ((8'h9c) < (8'h9f))))) <= ({{(|(8'hab))}, {((8'had) | (8'h9f))}} >>> (((^(8'hbf)) ? {(8'h9c)} : ((8'ha3) | (8'ha0))) ? (((8'ha1) == (8'had)) ? (^(8'h9c)) : (8'hb9)) : {{(8'ha7), (8'hb2)}, ((8'hbd) ? (8'ha8) : (8'h9d))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire3);
  assign wire5 = {$signed((wire3[(3'h4):(2'h2)] ^ wire3[(1'h1):(1'h0)]))};
  assign wire6 = ($signed(wire0[(1'h0):(1'h0)]) >> $unsigned($signed($unsigned((wire3 ?
                     wire2 : wire3)))));
  assign wire7 = {(&{($unsigned((8'hb4)) == ((8'h9e) << (8'ha0)))})};
  assign wire8 = (-(&($signed($signed(wire3)) ? (7'h43) : $signed((8'ha0)))));
endmodule
