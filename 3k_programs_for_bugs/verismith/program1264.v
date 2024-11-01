module top
#(parameter param13 = {(~&(!((&(8'hba)) ? (~(8'haf)) : {(8'hb6), (8'hae)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned($signed(($signed($signed(wire2)) ?
                     (!$signed(wire3)) : ($unsigned((8'ha9)) + (&wire3)))));
  assign wire6 = $signed(({{((8'hae) ? wire3 : (8'ha8)), wire2},
                     (8'ha7)} ^~ ($signed((+wire2)) ~^ ((8'hb5) ?
                     $signed(wire0) : $unsigned(wire3)))));
  assign wire7 = (^($signed({wire1}) ?
                     (8'haa) : {wire2[(3'h4):(2'h3)], wire0[(5'h12):(3'h5)]}));
  assign wire8 = $signed($signed($signed((&wire3[(3'h7):(3'h5)]))));
  assign wire9 = (7'h42);
  assign wire10 = wire1;
  assign wire11 = ((^($signed((wire3 ~^ wire3)) <= (8'hbb))) ?
                      ({wire4[(1'h0):(1'h0)], $signed((^~wire2))} ?
                          $signed((8'hae)) : {(^$signed(wire2))}) : $signed(($signed($unsigned(wire1)) >>> $unsigned($signed((8'ha3))))));
  assign wire12 = wire8;
endmodule
