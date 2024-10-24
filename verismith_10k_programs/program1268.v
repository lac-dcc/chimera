module top
#(parameter param9 = ({({((8'hbd) ? (8'h9d) : (8'hb2))} - {(~^(8'hab))}), (|((!(8'hbf)) - ((8'ha6) ^~ (8'hab))))} ? (-{{((7'h40) >>> (8'ha8))}, ({(8'hb4)} ? (!(8'hb7)) : ((8'h9f) ? (8'ha2) : (8'ha8)))}) : {(((!(8'hb7)) ? ((7'h41) && (7'h42)) : (-(8'haf))) << (+{(8'hae), (8'hbb)})), {{(~|(8'ha1)), ((8'ha5) <= (8'hb3))}, (~&{(8'hb9)})}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $signed((wire4[(3'h6):(3'h5)] ?
                     (8'ha8) : wire2[(2'h2):(2'h2)]));
  assign wire6 = ($unsigned($signed($unsigned(wire3))) ?
                     ((({wire5, wire3} >> wire5) ?
                         $unsigned((wire5 ~^ wire0)) : ((7'h44) ?
                             wire1[(1'h1):(1'h0)] : (wire4 & (8'hb4)))) ^ (~wire5)) : wire2[(2'h2):(1'h0)]);
  assign wire7 = ((&(~&((~&wire2) ? wire0 : $signed(wire2)))) ?
                     (wire1 > $unsigned($signed(wire5))) : ((8'hab) == (wire4[(4'hb):(2'h3)] ?
                         wire1 : ((wire3 >>> wire6) > $unsigned(wire1)))));
  assign wire8 = ((wire6[(1'h0):(1'h0)] ?
                     ({$signed((8'hb7)), wire4[(5'h14):(4'hd)]} ?
                         (~$signed(wire5)) : (|$signed(wire4))) : ((|wire0) ?
                         (!wire4[(5'h10):(3'h5)]) : $unsigned((~^(8'hbe))))) != $unsigned((&$signed(wire4[(1'h0):(1'h0)]))));
endmodule
