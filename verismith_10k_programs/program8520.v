module top
#(parameter param9 = {(~&((((8'hb0) ? (7'h44) : (8'h9f)) ? {(8'haa), (8'ha6)} : ((8'hab) ? (8'ha9) : (8'hb5))) ? (~^(+(8'hae))) : (~((8'ha9) ? (8'hb3) : (8'ha1))))), (~&(({(8'hb6), (8'hbd)} ? {(8'hb0)} : (~(8'had))) >= (((8'hb3) ? (8'ha8) : (8'h9e)) <= ((8'h9e) <= (8'ha8)))))}, 
parameter param10 = {(~&((~|(param9 ? param9 : param9)) ? ((param9 ? param9 : (8'hb3)) ? param9 : (8'hb0)) : {(param9 >>> param9), {param9}}))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (!((8'hbb) ?
                     $unsigned($unsigned($unsigned(wire4))) : ({(wire3 - wire0),
                         wire3} <<< $signed($signed(wire3)))));
  assign wire6 = $signed((8'ha6));
  assign wire7 = $signed(((8'hb3) < (!(^~(8'hab)))));
  assign wire8 = ((wire5 < (&wire2)) <<< wire6[(1'h0):(1'h0)]);
endmodule
