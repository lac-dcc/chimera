module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (&wire2[(5'h12):(3'h4)]);
  assign wire5 = ((wire3[(2'h2):(1'h1)] ^~ wire2[(3'h5):(3'h4)]) & {wire0[(5'h13):(5'h12)],
                     ($signed((wire1 & wire3)) ?
                         $unsigned($signed(wire1)) : wire2[(4'h9):(2'h3)])});
  assign wire6 = (((({wire3, wire3} ? (~|(8'hb8)) : {wire5}) ?
                         {(~wire0)} : wire0[(3'h4):(1'h1)]) != ($unsigned($unsigned(wire3)) ?
                         ({(8'ha7)} & ((8'hab) <<< (8'hb2))) : wire4)) ?
                     $signed(wire4[(4'he):(3'h7)]) : wire5);
  assign wire7 = wire1;
endmodule
