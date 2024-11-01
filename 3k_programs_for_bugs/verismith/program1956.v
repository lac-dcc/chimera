module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire2[(2'h2):(1'h1)];
  assign wire6 = ((((|(8'ha9)) & $signed((wire0 > (8'hac)))) ?
                     {$unsigned(wire3),
                         wire2[(1'h1):(1'h0)]} : ($signed(wire3[(1'h0):(1'h0)]) == wire0)) ^~ wire5[(2'h3):(2'h2)]);
  assign wire7 = $signed((+wire3));
  assign wire8 = wire2[(2'h3):(2'h2)];
  assign wire9 = (((wire7[(4'h8):(3'h5)] ^ $unsigned(((8'hb7) >= wire4))) ^~ $signed($unsigned((^~wire6)))) ?
                     $unsigned((^~((wire1 ?
                         wire2 : wire8) || (^wire8)))) : (-(((wire0 ?
                                 wire0 : wire0) ?
                             wire2 : $signed(wire1)) ?
                         (~$unsigned(wire6)) : {$signed(wire7), (-(8'ha1))})));
  assign wire10 = ((~&($signed({wire5}) ?
                          (((7'h43) < (8'hb6)) != {wire9,
                              wire4}) : ($signed((8'h9d)) ?
                              (~&wire7) : (wire5 < (8'ha5))))) ?
                      wire0 : $unsigned({{wire7[(2'h3):(1'h0)]}}));
  assign wire11 = wire6;
endmodule
