module top
#(parameter param10 = ({((~((8'ha7) ? (8'ha4) : (7'h43))) + (((8'hae) ? (8'hb8) : (8'had)) | ((7'h41) ? (8'h9e) : (8'h9f)))), ((((8'ha2) & (8'hbb)) ? ((8'hb3) >= (8'haa)) : (~&(8'had))) > ({(7'h44)} ? (^~(8'hab)) : ((8'haf) <= (8'hb2))))} ? (((((8'h9d) ? (8'haa) : (8'hb2)) ? {(8'h9c), (8'hac)} : {(7'h43)}) ? (((8'haa) ? (8'hb2) : (8'hba)) >= ((8'hb6) ? (8'had) : (8'h9f))) : ((!(8'ha3)) ? ((8'hb5) * (8'hb2)) : (!(8'hb3)))) ? (+((&(8'hb4)) + ((7'h44) ? (8'hb2) : (8'ha1)))) : ((^((8'ha0) ^ (8'h9e))) == (+((8'hb4) ? (8'ha6) : (8'hb8))))) : (|(((8'hac) == ((8'ha9) ? (8'hb7) : (8'h9e))) ? (((7'h41) * (8'ha4)) ? ((8'h9e) + (8'hb4)) : ((8'hb6) <= (8'ha9))) : (~^((8'ha8) || (8'hbb)))))), 
parameter param11 = (^(^~(-((~^param10) ? (param10 > param10) : param10)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1[(2'h3):(2'h2)];
  assign wire5 = $signed((|wire0));
  assign wire6 = (($unsigned((wire3 * {wire1, wire0})) ~^ ({$unsigned((8'ha9)),
                         (wire2 >> wire3)} + $unsigned((~wire1)))) ?
                     $unsigned(((wire5 ?
                         $unsigned(wire3) : (8'hab)) ^ $signed($unsigned(wire2)))) : ($signed((~$signed(wire5))) << wire4[(1'h1):(1'h0)]));
  assign wire7 = wire2[(2'h3):(2'h2)];
  assign wire8 = wire2;
  assign wire9 = $signed(wire2);
endmodule
