module top
#(parameter param13 = (((~^{((8'h9c) > (8'ha7))}) ? (~&{((7'h41) << (8'ha8))}) : ((((8'hbb) < (8'hb5)) > ((8'ha3) ^~ (8'h9e))) & {(^(8'hb8))})) ? (~^(+(+((8'ha4) ? (8'hb5) : (8'hbc))))) : (8'hb7)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
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
  assign wire4 = (!wire1);
  assign wire5 = (8'h9f);
  assign wire6 = wire1;
  assign wire7 = {wire4,
                     ($unsigned($unsigned(wire6[(2'h3):(2'h2)])) >> (!$unsigned(wire5)))};
  assign wire8 = wire2[(3'h7):(2'h2)];
  assign wire9 = $unsigned((8'h9e));
  assign wire10 = wire9[(2'h3):(1'h0)];
  assign wire11 = ($unsigned((&$unsigned((wire4 == wire5)))) != $unsigned({$unsigned($signed((8'hb2)))}));
  assign wire12 = wire0;
endmodule
