module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(wire2[(4'hf):(1'h0)]);
  assign wire6 = (wire3 ~^ {$unsigned($unsigned((!(8'hb2)))),
                     {((|wire4) ? wire1[(3'h5):(1'h1)] : (8'haf)),
                         (-{(8'ha0)})}});
  assign wire7 = (^(((~(wire2 ? wire4 : (8'ha3))) ?
                     $signed($unsigned(wire0)) : (~&(wire5 ?
                         wire5 : wire1))) ^~ (wire2[(4'hf):(1'h0)] < (wire3[(4'h9):(1'h1)] ?
                     $signed(wire5) : wire2[(4'hb):(1'h0)]))));
  assign wire8 = $signed((~&{(&{wire7, wire5}), (~|$unsigned(wire4))}));
  assign wire9 = (^~$unsigned((8'h9f)));
  assign wire10 = (&(|wire8[(1'h0):(1'h0)]));
  assign wire11 = ((~|wire4) <= wire9);
endmodule
