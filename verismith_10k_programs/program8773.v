module top
#(parameter param10 = (((^(8'ha6)) ? (((^(8'ha5)) ? ((8'ha9) ? (8'ha0) : (8'h9e)) : {(8'ha3), (8'had)}) != {{(8'ha9), (8'hbf)}, (~^(8'h9e))}) : (~&({(8'haf)} ? (^~(8'ha3)) : (~^(8'hb0))))) >> {((((8'hb5) > (8'ha5)) ? ((7'h42) | (8'ha8)) : (&(8'hac))) != (&(|(8'hbd)))), (^~({(8'hb6)} << ((8'hb3) && (8'hbd))))}), 
parameter param11 = param10)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed(((wire0[(3'h4):(1'h0)] ?
                     (wire3 ?
                         wire2 : wire2) : $unsigned(wire2)) ~^ $signed($signed((8'hba))))) && ((wire2 ?
                         (wire2 <= $signed((8'hbc))) : wire3) ?
                     ($signed((wire3 ? wire2 : (8'hbc))) >>> ((wire1 ?
                         wire1 : wire2) <<< (^wire3))) : (wire1[(4'h9):(3'h4)] ?
                         wire1[(3'h5):(3'h4)] : wire1[(1'h0):(1'h0)])));
  assign wire5 = wire2[(3'h7):(1'h1)];
  assign wire6 = (($signed((((8'hba) + wire3) || {wire2,
                         wire0})) + (~&$signed((~wire3)))) ?
                     $unsigned((((wire2 ^~ wire5) ?
                         (7'h44) : {(8'hb6)}) == wire1[(2'h3):(1'h0)])) : (&$signed(wire4[(1'h1):(1'h0)])));
  assign wire7 = wire6;
  assign wire8 = wire6[(1'h0):(1'h0)];
  assign wire9 = wire6;
endmodule
