module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned((((-$signed(wire1)) ?
                     ($unsigned(wire3) >> (wire2 >>> wire0)) : (&{wire0,
                         wire0})) > (~wire2[(1'h0):(1'h0)])));
  assign wire5 = ($signed((8'hb6)) ?
                     (wire4[(4'he):(2'h2)] ^ wire4[(3'h4):(1'h1)]) : ($unsigned((wire1[(3'h5):(3'h5)] == wire1[(4'hc):(3'h6)])) < {(wire1 ?
                             {(7'h40)} : $unsigned(wire4))}));
  assign wire6 = (wire0[(1'h0):(1'h0)] ?
                     $unsigned(($unsigned(wire5[(2'h2):(2'h2)]) ?
                         {$signed(wire3)} : $signed($unsigned((8'h9d))))) : wire2);
  assign wire7 = (^$unsigned($signed(((^wire6) ?
                     ((8'h9d) | wire4) : $unsigned((8'h9c))))));
  assign wire8 = $unsigned($unsigned(($signed(wire1) ?
                     ($signed(wire4) ?
                         (wire5 >> wire7) : $unsigned(wire3)) : wire4)));
endmodule
