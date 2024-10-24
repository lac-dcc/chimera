module top
#(parameter param12 = {(((((8'hae) ? (8'ha8) : (8'haa)) << ((8'ha1) >= (8'haf))) ? (((8'ha2) ? (8'ha6) : (8'hb8)) ? ((7'h40) ? (8'hbc) : (8'hbb)) : (~&(8'hab))) : (8'hb2)) == {{(8'hb7), ((8'hba) ? (7'h43) : (8'ha0))}}), (!((((8'haa) ? (8'hb2) : (8'ha1)) ~^ ((8'ha4) ? (8'haa) : (8'had))) ? (^~((8'ha5) >= (8'ha7))) : (((8'ha3) >>> (8'hb1)) ? {(8'hb9), (7'h42)} : {(8'ha9)})))}, 
parameter param13 = {((({param12} ? (param12 ? param12 : param12) : (|param12)) ? param12 : {(param12 ? param12 : param12), (~param12)}) ? (+(~|(+param12))) : (!((param12 ? param12 : param12) ? ((8'had) ? (8'hbe) : param12) : param12))), (param12 ? ({param12, param12} != (param12 >> param12)) : param12)})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {((($unsigned(wire3) >= (wire3 >>> wire3)) * $signed(wire0)) * wire3)};
  assign wire5 = wire1;
  assign wire6 = ($signed(wire2) < $signed($signed($signed({wire1, wire5}))));
  assign wire7 = {{$unsigned({(wire4 ? wire0 : wire2), wire6}),
                         ($unsigned((wire1 == wire3)) ?
                             (&(wire2 ?
                                 wire4 : wire5)) : (~^wire5[(4'h9):(3'h4)]))},
                     (|wire6[(1'h0):(1'h0)])};
  assign wire8 = wire2;
  assign wire9 = $unsigned($unsigned((wire2 ?
                     (^$unsigned(wire2)) : wire2[(1'h0):(1'h0)])));
  assign wire10 = wire6;
  assign wire11 = wire9;
endmodule
