module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {wire0};
  assign wire6 = $signed(wire5[(4'hb):(3'h6)]);
  assign wire7 = ($signed(wire3) ?
                     {(~$signed($signed(wire1))),
                         (($signed((8'hab)) ? (&wire1) : (|wire1)) ?
                             ($signed((8'hbe)) ?
                                 {(7'h43), wire4} : {wire0}) : {(wire3 ?
                                     (8'hab) : wire1),
                                 (wire2 >>> wire6)})} : $unsigned((+{((8'ha7) ?
                             wire5 : (8'ha7)),
                         $signed(wire1)})));
  assign wire8 = (-wire2[(3'h6):(3'h5)]);
endmodule
