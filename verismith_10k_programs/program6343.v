module top
#(parameter param12 = (~((((~|(8'ha7)) ? ((8'ha3) ? (8'ha8) : (8'had)) : (!(7'h41))) ? {(~&(8'hb2)), {(8'h9d), (8'ha6)}} : {((8'hbb) ? (8'hb2) : (8'hb0)), (~(8'haa))}) ? ({(~^(8'ha5)), ((8'hb7) ? (8'ha5) : (8'hb1))} - (8'haa)) : ((|((8'ha9) - (8'hb2))) ^~ ({(8'had)} ? (~(8'hb8)) : {(8'hb7), (8'hb6)})))), 
parameter param13 = ((((param12 ~^ (+param12)) ? (param12 + (8'ha9)) : {(param12 ? param12 : param12), {param12}}) ^~ ((&(param12 ? param12 : param12)) ? param12 : ((~^param12) ? (~^param12) : param12))) != {param12, param12}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {($unsigned(($signed(wire3) == $signed(wire3))) ?
                         (7'h42) : $signed((wire4[(4'hd):(1'h1)] ^ (wire3 ?
                             wire3 : wire0)))),
                     $signed($unsigned({(^(8'hb1))}))};
  assign wire6 = (wire4[(4'h8):(1'h0)] ?
                     wire3[(5'h10):(4'hd)] : wire1[(3'h4):(3'h4)]);
  assign wire7 = wire1;
  assign wire8 = (($unsigned(($signed(wire2) ?
                     (wire3 ?
                         wire0 : wire7) : (wire3 ~^ wire0))) >>> wire6) >> (wire2 <<< $unsigned(($signed(wire0) ?
                     (&wire1) : (^wire3)))));
  assign wire9 = ({$signed($unsigned((wire6 * wire3)))} ?
                     {(-(8'ha0))} : (|{$signed(wire6),
                         ((~&(8'ha1)) ? wire5 : (wire8 ? wire1 : wire8))}));
  assign wire10 = (|{(&wire6)});
  assign wire11 = (!{($unsigned($unsigned(wire1)) ?
                          wire6[(1'h0):(1'h0)] : ((wire5 ? (8'hbf) : wire5) ?
                              wire2 : (wire9 ? (8'hb1) : wire5)))});
endmodule
