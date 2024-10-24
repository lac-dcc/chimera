module top
#(parameter param12 = (^{((^((8'h9d) - (8'hac))) >= (&(~(8'ha6)))), ((((7'h42) ? (8'ha4) : (8'ha7)) != ((8'ha3) ? (7'h40) : (8'h9f))) ~^ (~&((8'hb7) ? (8'haa) : (8'hbd))))}), 
parameter param13 = ((~&((~param12) ? ((|param12) ? (~param12) : (~^param12)) : ({param12} << param12))) ? param12 : ((((param12 ? param12 : param12) - param12) & param12) * (({param12} <<< {(8'ha3), param12}) || {param12, param12}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire11, wire10, wire7, wire6, wire5, reg9, reg8, (1'h0)};
  assign wire5 = {$signed($signed($signed($signed(wire3))))};
  assign wire6 = $signed($signed(wire0[(3'h4):(1'h1)]));
  assign wire7 = wire2;
  always
    @(posedge clk) begin
      reg8 <= wire0[(2'h3):(1'h0)];
      reg9 <= $signed($unsigned({$signed((~&wire7))}));
    end
  assign wire10 = (({wire7[(2'h3):(1'h0)], wire2[(3'h5):(1'h0)]} ?
                      ({{(8'h9f)}} ?
                          (|wire1[(2'h3):(2'h3)]) : $signed(wire6[(4'ha):(4'h8)])) : (~|wire4[(1'h0):(1'h0)])) <<< (($signed((~^wire0)) <<< reg8) ?
                      reg8[(3'h5):(3'h4)] : $signed((^reg9[(1'h1):(1'h0)]))));
  assign wire11 = $unsigned((^~{{(wire6 | reg9), (+wire7)},
                      (wire7 ? $unsigned(wire10) : wire4[(3'h5):(1'h0)])}));
endmodule
