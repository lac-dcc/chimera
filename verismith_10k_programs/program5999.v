module top
#(parameter param9 = (~&({(((7'h42) ? (8'hac) : (8'ha4)) < (^(8'hbd))), (~^(+(8'hbe)))} ? (~|(((8'hbf) - (8'ha3)) ? ((7'h44) ? (8'hb3) : (8'hac)) : (~(8'hb3)))) : (8'hae))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned($signed((^~(wire3[(3'h5):(3'h4)] & (wire2 - wire0)))));
  assign wire6 = {$signed($signed($unsigned($signed(wire4)))), wire5};
  assign wire7 = ($unsigned((^~(&wire1))) ?
                     $signed((($unsigned(wire4) >>> $unsigned(wire4)) - $signed($unsigned(wire0)))) : (7'h40));
  assign wire8 = ({wire7, wire5[(4'h9):(3'h4)]} ?
                     ($signed({{wire5,
                             wire4}}) ~^ (8'hb3)) : $signed($signed(wire5[(3'h5):(1'h0)])));
endmodule
