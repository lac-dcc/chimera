module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = {({(8'hbf)} >> wire1[(4'h8):(3'h7)])};
  assign wire6 = $signed((8'haf));
  assign wire7 = (|$signed($signed(((wire2 ? wire5 : (8'had)) ^ (-wire5)))));
  assign wire8 = $signed((+$signed(((^wire3) ?
                     $unsigned(wire6) : $unsigned(wire2)))));
  assign wire9 = ($signed($unsigned((wire1[(4'hc):(3'h5)] == wire2[(5'h10):(3'h6)]))) ?
                     $signed(((|wire1[(4'hd):(4'h8)]) || wire1[(4'hd):(3'h6)])) : (|$unsigned(wire3)));
  assign wire10 = (^(wire9 ?
                      ((8'hbf) ?
                          wire1 : $signed((wire8 << wire5))) : $signed(wire9[(1'h1):(1'h1)])));
  assign wire11 = ((~|wire0[(3'h4):(2'h3)]) ? wire7 : {wire10, wire6});
  assign wire12 = wire3[(1'h1):(1'h1)];
endmodule
