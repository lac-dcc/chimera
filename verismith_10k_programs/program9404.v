module top
#(parameter param9 = ((({((8'hb0) ? (8'hb0) : (8'hb6)), ((8'h9e) <= (8'hb4))} ? ((~(8'hbd)) ? {(8'hb8), (7'h44)} : {(8'ha3)}) : (|((8'h9f) ? (8'ha4) : (8'hb2)))) ? (^({(8'had)} == ((8'had) ? (8'hb9) : (8'hbc)))) : {(((8'ha0) ? (8'had) : (8'haa)) >>> (~(8'hbf)))}) ? ((~|(+(+(7'h40)))) ^~ (+(^((8'hb7) ~^ (8'hba))))) : {{(((7'h41) ? (8'hbd) : (8'ha0)) ? ((8'hbc) ? (8'hbc) : (8'haf)) : ((8'hbf) * (7'h42)))}}), 
parameter param10 = ((param9 ? ((-param9) & (~(!(8'h9e)))) : (param9 - {((8'ha1) ^~ param9), {param9, param9}})) ? (~|(8'h9f)) : param9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (~|(&wire0));
  assign wire6 = {($signed(wire2) ?
                         (|wire1) : ($unsigned((+wire3)) < $signed((&wire1)))),
                     (({wire2} ?
                         (+wire5[(1'h0):(1'h0)]) : $signed((wire4 ?
                             wire5 : wire2))) ~^ $signed(($unsigned((8'hac)) ?
                         wire2[(1'h1):(1'h1)] : (wire3 ? wire0 : (8'hbc)))))};
  assign wire7 = (wire6[(4'hb):(3'h4)] ?
                     (~|$unsigned({(wire0 ? wire5 : wire5)})) : (^wire6));
  assign wire8 = {wire0};
endmodule
