module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($unsigned($unsigned(($unsigned(wire2) < (wire2 || wire4)))) ?
                     wire3[(3'h5):(2'h2)] : {wire4[(3'h6):(3'h6)],
                         $unsigned((wire4 ? (~wire1) : $signed(wire2)))});
  assign wire6 = wire3[(3'h5):(1'h1)];
  assign wire7 = ((+(!(~|wire3[(1'h1):(1'h1)]))) ^ $signed((wire6 ?
                     {(|(8'hae))} : {$signed(wire4)})));
  assign wire8 = ((wire6 ?
                         ((&wire4) ?
                             (~&$signed(wire6)) : {$signed((8'hb1))}) : wire3) ?
                     (&((wire7 ?
                         wire5[(1'h1):(1'h0)] : (wire7 ?
                             wire4 : wire0)) > wire7[(2'h2):(1'h0)])) : wire7[(4'he):(4'hd)]);
  assign wire9 = $unsigned(wire4[(3'h6):(2'h2)]);
  assign wire10 = $unsigned(($signed($unsigned((wire4 ?
                      wire6 : wire1))) << ($signed((8'had)) ?
                      wire6[(1'h0):(1'h0)] : ($signed(wire5) & {wire2,
                          (8'ha0)}))));
endmodule
