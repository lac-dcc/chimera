module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = {wire2};
  assign wire6 = wire2;
  assign wire7 = $unsigned((^~$unsigned(wire6[(3'h4):(1'h1)])));
  assign wire8 = ((wire2[(4'he):(4'hb)] & (wire5[(1'h1):(1'h1)] <<< ((wire5 != wire6) ?
                     (wire6 || wire2) : $unsigned(wire1)))) ^ ((((wire7 ?
                             wire5 : wire0) + wire0) ?
                         $signed(wire3) : $signed((+wire6))) ?
                     wire4 : ((wire4[(3'h7):(1'h0)] || (wire1 ?
                             wire6 : wire2)) ?
                         wire7 : wire2[(4'hd):(4'h8)])));
  assign wire9 = wire0[(2'h2):(1'h1)];
  assign wire10 = $signed((+$signed($unsigned({wire8}))));
endmodule
