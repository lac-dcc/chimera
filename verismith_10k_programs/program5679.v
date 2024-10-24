module top
#(parameter param37 = (({(~&((8'ha0) && (8'h9e))), {((8'ha5) < (8'hb1))}} << ({{(8'ha4)}, ((8'hb9) < (8'hab))} ? (((7'h42) | (8'ha3)) >> (|(8'ha9))) : ((~|(8'hac)) <<< ((8'hbb) ? (8'had) : (7'h42))))) - (((((7'h42) > (8'h9d)) & ((8'hbd) ? (8'hb5) : (8'ha3))) ~^ (8'ha0)) ? (((~^(8'haf)) >>> (!(8'hab))) ? (+((8'ha5) | (8'hb4))) : (~|((8'hbd) ^ (8'hb5)))) : ((&(-(8'hb3))) ? (^{(8'ha3), (8'h9c)}) : (^~{(8'h9e)})))), 
parameter param38 = param37)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
  assign wire5 = (!(wire0 >= $unsigned(wire3)));
  assign wire6 = wire2[(1'h0):(1'h0)];
  assign wire7 = wire0[(2'h3):(2'h2)];
  assign wire8 = (8'hb6);
  assign wire9 = wire2;
  assign wire10 = (wire8 ?
                      ((+((7'h43) ? (wire7 <= (7'h41)) : wire9)) ?
                          wire0 : {(wire4 ?
                                  wire4 : (~|wire0))}) : (((wire4[(2'h3):(1'h1)] ?
                              (8'hb2) : $signed((7'h43))) ?
                          ({wire2,
                              wire1} ^~ (wire1 + wire4)) : ($signed((8'hb3)) ?
                              $signed(wire7) : $unsigned(wire5))) & {wire8[(1'h0):(1'h0)],
                          ({wire2} ? (~^wire3) : wire2[(1'h1):(1'h1)])}));
  assign wire11 = wire8;
  assign wire12 = wire3[(4'hc):(3'h4)];
  assign wire13 = (~$signed((wire1[(3'h4):(1'h0)] ?
                      $signed($unsigned(wire2)) : wire2[(3'h4):(2'h3)])));
  assign wire14 = {wire2[(2'h2):(1'h1)], wire13[(2'h2):(1'h0)]};
  assign wire15 = ($signed(wire2) - (((wire3[(1'h0):(1'h0)] << $unsigned(wire7)) >= ((wire3 ?
                          wire3 : wire6) ?
                      $unsigned((8'ha9)) : wire7)) ^ $unsigned(wire11[(1'h0):(1'h0)])));
  assign wire16 = wire2[(3'h5):(3'h4)];
  assign wire17 = ({(((+wire14) ?
                              ((8'ha2) ? wire14 : wire5) : {wire9,
                                  wire12}) <<< wire13)} ?
                      $signed((~^(+$signed((8'ha9))))) : wire15[(4'hd):(1'h0)]);
  assign wire18 = ($unsigned(wire17) ?
                      wire12[(3'h5):(3'h5)] : (wire0 <<< $unsigned($unsigned(wire10[(1'h0):(1'h0)]))));
  module19 #() modinst31 (.wire21(wire14), .y(wire30), .wire22(wire12), .wire23(wire16), .wire20(wire13), .clk(clk));
  assign wire32 = (($unsigned($signed((wire9 < (8'hb5)))) || $signed($signed(wire6))) != $unsigned({wire9[(3'h5):(2'h3)],
                      $unsigned(((7'h43) ? (8'hb6) : wire13))}));
  assign wire33 = ((wire18 ?
                      (~^$unsigned($signed(wire13))) : $unsigned((-$signed(wire9)))) > $unsigned(({$signed(wire8),
                      (wire9 ? wire9 : wire1)} || ((wire14 ?
                      (8'hb7) : wire17) | {wire13, wire32}))));
  assign wire34 = (~|wire5);
  assign wire35 = wire34[(3'h5):(2'h2)];
  assign wire36 = (~(($signed($signed(wire7)) ?
                      wire12 : (~|(wire16 >> wire32))) ^ $unsigned(wire16[(3'h7):(1'h0)])));
endmodule

module module19
#(parameter param28 = (~|((~^(~^(~(8'h9e)))) ? (((+(7'h41)) ~^ (~^(8'ha8))) >>> (~^{(8'hb7)})) : (^((8'ha9) >= (8'ha1))))), 
parameter param29 = param28)
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h17):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  assign y = {wire27, wire26, wire25, wire24, (1'h0)};
  assign wire24 = (((^$unsigned((wire22 <= wire23))) * wire23) ?
                      wire22[(2'h2):(1'h1)] : wire21[(1'h1):(1'h1)]);
  assign wire25 = wire24[(2'h3):(2'h3)];
  assign wire26 = wire22[(2'h2):(2'h2)];
  assign wire27 = $unsigned(wire26);
endmodule
