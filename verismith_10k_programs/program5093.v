module top
#(parameter param8 = (({(!((8'hbc) ? (7'h43) : (8'ha5)))} ? ((((8'ha3) ? (8'hbb) : (8'hb8)) ? (&(8'ha5)) : {(8'hab), (8'hbd)}) ? {((8'hb1) ? (8'h9c) : (8'hab))} : (&(!(7'h42)))) : ((~&((8'ha4) ? (8'ha3) : (8'hb5))) | (8'ha5))) ? ((8'had) ? {{(~(8'h9e)), {(8'ha4)}}} : (8'haf)) : {({(!(8'h9e))} || (((8'h9f) + (8'ha7)) < ((8'ha6) > (8'h9c))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire2[(4'h9):(3'h5)] ?
                     (wire0 ?
                         wire1[(2'h2):(1'h1)] : $unsigned((wire0[(4'hd):(4'h9)] ?
                             (~|wire3) : wire2[(3'h7):(2'h3)]))) : ((wire3 ?
                         ((8'ha8) != wire2) : $unsigned($signed(wire0))) - (^wire0[(4'hd):(3'h6)])));
  assign wire5 = ($unsigned(wire4) ?
                     (|(-$signed(wire4[(4'h9):(3'h4)]))) : wire3);
  assign wire6 = $unsigned((^~(wire0 ?
                     ($unsigned(wire4) ?
                         (wire4 ? wire4 : wire1) : wire5) : wire5)));
  assign wire7 = ($signed(wire0[(1'h0):(1'h0)]) != $unsigned($unsigned((7'h44))));
endmodule
