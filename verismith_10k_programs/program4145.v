module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (|(wire2 >> $unsigned($unsigned((wire0 ? wire1 : wire4)))));
  assign wire6 = $unsigned((({$unsigned((8'ha4)), (wire3 >> wire2)} ?
                         {wire0} : $signed((wire3 ? (8'hbe) : wire2))) ?
                     ({(wire4 <= wire0), wire4[(1'h1):(1'h1)]} ?
                         ((wire1 ? (8'hbd) : wire3) ?
                             wire0[(3'h7):(1'h0)] : $unsigned(wire0)) : ($unsigned(wire3) >> ((8'hb3) ?
                             wire1 : wire0))) : $signed($signed($unsigned(wire5)))));
  assign wire7 = ((~^(8'hb5)) ?
                     $unsigned(($signed(((8'ha0) ?
                         wire3 : wire2)) || (+wire5))) : {($signed((wire3 >>> wire2)) ?
                             $signed($unsigned(wire2)) : $unsigned((!wire3)))});
  assign wire8 = (wire3 <= wire4[(1'h0):(1'h0)]);
  assign wire9 = wire1[(2'h3):(2'h3)];
  assign wire10 = (($unsigned($signed($signed(wire5))) - $unsigned(wire4)) ?
                      ($unsigned(wire5) ~^ (-wire7[(4'h8):(2'h2)])) : $signed(((8'hb1) + ((wire8 | wire8) >> {wire0}))));
  assign wire11 = ({wire7} ^ (($unsigned($signed((8'hb4))) ?
                          $unsigned($unsigned(wire6)) : wire2[(2'h2):(2'h2)]) ?
                      (((-wire5) <= $unsigned(wire6)) || (wire7 < $signed(wire2))) : $unsigned($unsigned($signed(wire3)))));
  assign wire12 = $unsigned($unsigned(wire10[(5'h14):(5'h12)]));
  assign wire13 = $signed(($unsigned(($unsigned(wire2) * $unsigned((8'hab)))) ?
                      (!(~(wire12 || (7'h42)))) : wire11[(1'h1):(1'h0)]));
endmodule
