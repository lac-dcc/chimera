module top
#(parameter param12 = (~^(((((8'ha9) || (8'had)) ? (|(7'h40)) : (8'hb8)) > (8'h9d)) ? ((((8'hb8) ? (8'ha8) : (8'h9f)) ? (+(8'hbf)) : (&(8'hbb))) ? ((^~(8'hb2)) ? ((8'h9c) & (8'h9c)) : ((8'ha8) ? (8'hab) : (8'hb6))) : (((7'h44) + (8'hbe)) < {(8'ha4), (8'ha3)})) : (8'hae))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (&{wire1[(1'h0):(1'h0)]});
  assign wire5 = $unsigned($signed((~|(^~$signed(wire3)))));
  assign wire6 = {$unsigned((({wire4, wire0} ? $unsigned(wire0) : (8'ha0)) ?
                         ($unsigned(wire1) ?
                             $signed(wire3) : (wire3 != wire1)) : $unsigned({wire4,
                             wire1})))};
  assign wire7 = ({$unsigned({$signed(wire4)}),
                     (wire3[(1'h0):(1'h0)] << ((wire0 * wire1) ?
                         wire4 : (8'ha7)))} >= ((wire1 ?
                         $unsigned(wire0) : $unsigned((wire4 <= wire1))) ?
                     (($signed(wire2) ^~ (~wire4)) != wire6) : (8'ha5)));
  assign wire8 = wire4[(2'h3):(2'h3)];
  assign wire9 = $signed(wire3[(2'h2):(2'h2)]);
  assign wire10 = $signed(wire7);
  assign wire11 = wire8[(2'h3):(2'h2)];
endmodule
