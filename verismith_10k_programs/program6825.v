module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed(wire2);
  assign wire5 = $unsigned($unsigned(($signed((wire0 ? wire1 : wire3)) ?
                     wire2[(4'hc):(2'h2)] : $unsigned((wire4 > wire0)))));
  assign wire6 = wire5;
  assign wire7 = ((((!(~wire0)) ? (~^$unsigned(wire5)) : wire6) ?
                     wire4 : (((wire3 <<< wire3) >= (wire2 ^~ wire2)) ?
                         $signed((wire2 - wire2)) : $signed((8'ha8)))) >= ($signed($signed(wire4)) ~^ ($unsigned($unsigned(wire1)) <<< ((wire3 + wire5) ?
                     $unsigned(wire1) : $unsigned(wire6)))));
  assign wire8 = ((7'h40) << (wire5[(3'h4):(1'h0)] || $signed(wire6)));
  assign wire9 = $unsigned((8'hbd));
  assign wire10 = ($unsigned({$signed(wire7[(1'h0):(1'h0)])}) || (8'haa));
endmodule
