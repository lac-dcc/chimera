module top
#(parameter param12 = ((8'h9f) == {((!((7'h44) ? (8'ha4) : (8'hb5))) > (((8'h9f) ? (8'h9d) : (8'hbe)) <= ((7'h44) ? (8'h9f) : (8'hb9)))), ((!((8'hbd) != (8'haa))) <<< (~^((8'hbc) || (8'ha9))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {$unsigned(((8'ha8) ^~ $signed((+wire0)))),
                     ($unsigned(($signed((8'h9c)) ?
                         (wire0 ?
                             wire1 : wire1) : $signed((8'ha1)))) < (-$signed((wire4 ^ wire3))))};
  assign wire6 = $signed(((wire2 >= $unsigned(wire5)) == (~(8'ha8))));
  assign wire7 = wire4;
  assign wire8 = $signed($signed(wire6[(4'hc):(4'hb)]));
  assign wire9 = wire6[(2'h2):(1'h0)];
  assign wire10 = $unsigned({(~(!wire4[(5'h15):(5'h14)])), (~^wire2)});
  assign wire11 = $signed((8'hb8));
endmodule
