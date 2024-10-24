module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (({((wire4 ? wire0 : wire3) << $unsigned((8'h9c))),
                     {$unsigned(wire4)}} >> $signed((wire0[(3'h4):(3'h4)] ?
                     $unsigned(wire1) : $unsigned(wire0)))) != $signed({wire2}));
  assign wire6 = $unsigned($unsigned((wire0[(2'h2):(1'h0)] < wire0[(1'h0):(1'h0)])));
  assign wire7 = ({$signed((^(wire3 ~^ wire5))), (8'hbf)} ?
                     wire3[(3'h5):(1'h0)] : $unsigned(wire0));
  assign wire8 = wire5;
  assign wire9 = wire7;
  assign wire10 = wire1[(2'h2):(1'h1)];
  assign wire11 = {$unsigned(wire9)};
  assign wire12 = wire0;
  assign wire13 = wire7;
  assign wire14 = wire4;
endmodule
