module top
#(parameter param12 = (~{((((8'ha7) && (8'ha7)) << ((8'ha1) ? (8'ha9) : (8'hbf))) | (^~((8'ha7) ? (7'h41) : (8'hbc))))}), 
parameter param13 = ((+(+param12)) << (((^(8'hb3)) ~^ ((param12 ? (8'ha7) : param12) >= (param12 ? param12 : param12))) + (param12 ^~ ((param12 >>> param12) ? (param12 ? param12 : param12) : param12)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed(wire1) && (~|($signed({wire1}) << (~|$unsigned(wire0)))));
  assign wire5 = (((8'h9f) ? wire4 : wire3) ?
                     $unsigned((~(wire2 ?
                         $unsigned(wire2) : (wire0 ?
                             wire0 : wire3)))) : ($signed($unsigned($unsigned(wire4))) > wire4[(2'h2):(1'h0)]));
  assign wire6 = ((((^$signed(wire4)) < (-(wire5 >>> wire3))) ?
                         ({$signed(wire0)} - $signed($signed(wire3))) : (7'h40)) ?
                     (~&wire5) : (+wire0[(3'h4):(3'h4)]));
  assign wire7 = (^~$unsigned((8'ha0)));
  assign wire8 = wire5[(3'h5):(3'h4)];
  assign wire9 = $unsigned($signed(wire8));
  assign wire10 = wire9;
  assign wire11 = (~^(wire3 ?
                      {(~(wire8 * wire7))} : ({wire4[(2'h2):(2'h2)],
                              wire3[(3'h4):(2'h2)]} ?
                          ((wire3 << wire8) < {(8'hb8)}) : $signed({wire1}))));
endmodule
