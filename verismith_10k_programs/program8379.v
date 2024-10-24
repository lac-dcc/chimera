module top
#(parameter param11 = ((~|((!((8'hbe) ? (8'ha3) : (8'hba))) ^ ({(8'ha7), (8'hb2)} ? (~&(8'hb5)) : {(7'h42), (8'hba)}))) >>> (|({(~(8'hbc))} ~^ (((8'had) & (8'hba)) >= (-(8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (((((8'h9c) ?
                     $unsigned(wire2) : $unsigned(wire4)) ^ (8'h9f)) && wire4) + (8'had));
  assign wire6 = ($signed($signed($signed((~|wire1)))) ?
                     $signed($unsigned(($signed(wire1) ?
                         {wire0, wire1} : (wire3 <= wire5)))) : (8'haa));
  assign wire7 = $unsigned($unsigned(wire6));
  assign wire8 = ($unsigned((~$unsigned(wire5))) * $signed(($signed((wire5 ?
                         wire1 : wire3)) ?
                     (-(~^wire3)) : ((wire1 >> wire5) > $signed(wire6)))));
  assign wire9 = (&(+$signed((~^$signed(wire6)))));
  assign wire10 = (~^(wire4 ?
                      $unsigned($unsigned((wire2 ?
                          wire3 : wire4))) : $signed($signed((wire5 ~^ (8'haa))))));
endmodule
