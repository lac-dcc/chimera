module top
#(parameter param12 = ((8'ha2) ? (^~{(~|{(8'hbf)}), {(+(8'ha7))}}) : ((-(((8'h9d) ? (8'hac) : (8'hae)) ~^ ((8'ha7) == (7'h42)))) ? (^~{((8'hb3) <= (8'hbe))}) : ({(|(8'ha7))} ? (8'ha5) : (((8'hb8) ? (8'hb2) : (8'hb0)) >> (~(8'hb7)))))), 
parameter param13 = ((&(8'ha8)) - ((~|(((8'hb6) ? param12 : param12) ? param12 : (~|param12))) < (!(~(param12 ? param12 : param12))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned(($unsigned(wire4[(2'h2):(1'h0)]) ?
                     wire2 : (wire2[(5'h10):(4'h8)] ^~ $signed((~^wire0)))));
  assign wire6 = (~((wire0 ? $signed($signed((7'h42))) : wire3) ?
                     (~&{wire0[(3'h4):(2'h2)]}) : (~$unsigned((wire5 ^~ wire1)))));
  assign wire7 = wire2;
  assign wire8 = wire2[(2'h2):(1'h0)];
  assign wire9 = wire8[(3'h6):(1'h0)];
  assign wire10 = ((-$signed((!(wire6 ^~ wire2)))) > ((wire3 >> $unsigned(((8'hbc) + wire1))) ?
                      (~^($signed(wire0) - $signed((7'h41)))) : $unsigned(($unsigned(wire1) ?
                          wire0 : wire2))));
  assign wire11 = wire7;
endmodule
