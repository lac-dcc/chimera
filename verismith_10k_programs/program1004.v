module top
#(parameter param10 = ((((~^((8'had) ? (8'hbe) : (8'hab))) ? ((&(8'h9d)) & (+(8'ha7))) : ((|(8'hb7)) ? ((8'hb0) ? (8'hb8) : (8'ha6)) : ((8'ha6) << (8'ha2)))) ? {(((8'hb8) * (8'had)) ? ((8'h9d) ? (8'hb6) : (8'ha7)) : (&(8'hae))), (^((8'hb0) ? (8'haf) : (8'ha8)))} : (~(((8'ha9) ? (8'hb9) : (8'ha1)) ? ((7'h44) ^ (8'ha6)) : (~(8'hb6))))) ? (-((+{(8'hb2)}) * (~^((8'hb6) & (8'hb5))))) : (((((8'ha7) << (8'h9f)) + ((8'hb0) && (8'hae))) + ({(8'hb3)} ? ((7'h40) ^ (8'hb1)) : ((7'h40) ? (7'h44) : (8'hb9)))) ? ((((8'ha0) ? (8'hba) : (8'hb2)) ? ((8'hbc) == (8'h9c)) : ((8'ha6) ? (8'hb6) : (8'ha4))) + (!(8'hb6))) : (!({(8'h9f)} ? (~&(8'had)) : ((8'hae) >>> (8'hb7)))))), 
parameter param11 = (~&(~&param10)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($unsigned(((wire2 * wire3) ?
                         wire3 : $signed((7'h42)))) && {$unsigned($signed(wire2)),
                         {$unsigned(wire3), wire1[(3'h7):(2'h3)]}}) ?
                     {wire0} : (~wire2));
  assign wire5 = wire3;
  assign wire6 = ($signed(wire1) & $signed(wire5[(4'ha):(3'h6)]));
  assign wire7 = ((~$signed(($signed(wire4) ?
                         (wire5 ? wire0 : wire6) : {wire3}))) ?
                     $unsigned($signed({((8'hab) * wire5)})) : $signed((^(-$unsigned(wire0)))));
  assign wire8 = $signed($unsigned((wire2 ?
                     wire2 : $unsigned(wire6[(2'h3):(1'h1)]))));
  assign wire9 = wire5[(1'h0):(1'h0)];
endmodule
