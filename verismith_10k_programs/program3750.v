module top
#(parameter param9 = {(|(({(8'hbc)} ? {(8'hab)} : {(7'h40)}) || (((8'h9d) ? (8'hac) : (8'ha8)) + ((8'hb5) ? (8'ha4) : (8'hb8))))), (^(((~(8'hab)) ? (~|(8'hae)) : ((8'ha1) ? (7'h44) : (8'ha8))) >>> (+((8'h9e) + (7'h42)))))}, 
parameter param10 = (|param9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed(wire1);
  assign wire6 = wire5;
  assign wire7 = $signed($unsigned($signed(wire3)));
  assign wire8 = (($signed($unsigned((wire1 ?
                         wire7 : wire7))) << wire7[(3'h4):(2'h3)]) ?
                     (!(~|$unsigned(wire7))) : {(-$signed((8'hb0))), (-wire2)});
endmodule
