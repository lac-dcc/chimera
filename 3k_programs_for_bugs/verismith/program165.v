module top
#(parameter param10 = ({(8'ha5), ((~((8'ha0) < (8'ha5))) <= (~&((8'ha2) >= (8'hb2))))} ? (((~^(8'hb9)) | (((8'haf) ? (8'h9e) : (8'hae)) ? ((8'ha0) ? (7'h43) : (8'hbd)) : {(8'ha3)})) ? (|(((8'hae) + (8'hac)) ? ((8'ha8) | (7'h44)) : (&(8'ha3)))) : (8'hb4)) : {(^({(8'h9d), (8'ha3)} <<< (^(8'ha2)))), (-(((8'ha2) ? (8'ha5) : (8'ha9)) ? ((8'hb8) ? (8'hb8) : (7'h40)) : ((8'hb8) >> (8'hb0))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed({(|(+wire4))});
  assign wire6 = ((-({$signed((8'hbe))} >>> (^~wire4[(1'h0):(1'h0)]))) <<< (wire5[(4'hc):(4'ha)] ?
                     ($signed(wire0[(3'h7):(2'h3)]) ?
                         (8'ha1) : wire2[(1'h0):(1'h0)]) : (($signed(wire1) ?
                             (+wire2) : ((8'hb9) >= wire3)) ?
                         wire3[(4'h9):(3'h5)] : $unsigned((wire4 ?
                             wire2 : (8'ha3))))));
  assign wire7 = ((^~wire5[(4'hc):(1'h1)]) << (({((8'ha9) >>> wire4),
                         wire4[(4'he):(2'h2)]} ?
                     $signed(wire6[(3'h7):(1'h0)]) : wire4[(4'hf):(4'hc)]) ~^ $signed((wire2 <<< $unsigned((8'ha7))))));
  assign wire8 = wire7[(4'h9):(3'h4)];
  assign wire9 = wire6[(4'he):(4'ha)];
endmodule
