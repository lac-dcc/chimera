module top
#(parameter param10 = {{((((8'h9c) > (8'hb3)) ? (+(8'had)) : (|(8'hbb))) ? (((8'hb4) < (8'hb0)) ? ((8'hbe) * (8'had)) : ((8'hb5) >> (8'h9c))) : (-((8'ha8) ? (8'hab) : (8'hbd))))}}, 
parameter param11 = (param10 ? (+(!((param10 == param10) ? param10 : param10))) : param10))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned({(wire0 & {wire3})}) << $signed(wire3[(4'hd):(4'h9)]));
  assign wire5 = wire2[(2'h2):(1'h0)];
  assign wire6 = {($unsigned({wire4[(2'h3):(2'h3)]}) ^ $unsigned({$signed(wire4)})),
                     ((wire1 ?
                             wire2[(1'h0):(1'h0)] : $signed({wire3, (8'hb6)})) ?
                         $signed($signed((~^wire3))) : (-$signed(wire1[(1'h0):(1'h0)])))};
  assign wire7 = (wire5 < wire0);
  assign wire8 = wire6[(1'h1):(1'h1)];
  assign wire9 = $signed((7'h40));
endmodule
