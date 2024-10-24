module top
#(parameter param8 = (((^~(((8'hb7) ? (8'ha6) : (8'hae)) ? (~|(8'had)) : ((8'hbc) ? (8'ha0) : (8'hba)))) ~^ (({(8'hab)} ~^ (~(8'h9e))) - (((8'ha8) ? (8'ha7) : (8'hb3)) - ((8'ha5) >>> (8'ha0))))) ? (((&((8'hbd) ? (8'hb6) : (8'haf))) ? (((8'hbf) ? (8'hb6) : (8'hb3)) ? ((8'ha0) ? (8'hb2) : (8'h9e)) : ((7'h40) > (8'hab))) : (^(^~(8'hbf)))) ? ((!((8'ha9) ? (8'ha5) : (8'ha0))) ? (((8'hae) ? (8'hb0) : (7'h41)) ? (|(8'hbd)) : ((8'hb3) ? (8'h9f) : (8'ha5))) : (((8'hb5) ^ (8'had)) * ((8'hb7) ? (8'hb6) : (8'hb7)))) : ((((8'ha6) ? (8'hab) : (7'h43)) ^~ ((8'ha7) ? (8'hbf) : (8'hb5))) && (~^(8'h9d)))) : ({(((8'ha8) ? (7'h43) : (8'hb3)) <= (-(8'h9d))), ((|(8'hb1)) - {(8'ha8), (8'hbf)})} ? ((8'hbc) ? (8'hbb) : (((8'ha1) ^ (7'h41)) * ((8'hbd) >> (8'ha7)))) : ((-{(8'hba), (8'hbc)}) ? {{(8'hb3), (8'hb8)}, ((8'had) >>> (8'hbc))} : {((8'h9c) ^ (8'had))}))), 
parameter param9 = (~^(param8 ^~ param8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {($signed(({wire2} & (8'ha1))) ^ wire0[(3'h4):(3'h4)])};
  assign wire5 = (|(((((8'hbe) ? wire4 : wire2) ? wire3 : (^wire4)) ?
                         ($unsigned(wire0) == (^~wire2)) : $unsigned((wire1 >>> wire0))) ?
                     {(wire4[(4'hb):(4'ha)] ~^ $unsigned(wire2))} : $signed($unsigned($signed(wire2)))));
  assign wire6 = ($unsigned(($unsigned(((8'hb5) ? wire5 : (8'ha3))) ?
                         (wire4[(2'h2):(2'h2)] ?
                             (!wire2) : wire2[(4'h8):(4'h8)]) : $unsigned(((8'h9d) ?
                             wire2 : wire1)))) ?
                     $signed(wire0) : wire3);
  assign wire7 = $unsigned((+wire6));
endmodule
