module top
#(parameter param11 = (((((!(7'h40)) ? ((8'hbb) * (8'hb6)) : (^(7'h40))) ? (((7'h44) ? (8'hb9) : (8'hb9)) || ((8'h9c) ? (8'hb4) : (8'hac))) : ((^~(8'hbd)) && (|(8'hbf)))) && (((|(8'ha8)) && (+(8'ha7))) < {(-(7'h43))})) ? (((~((8'hab) <= (8'hb1))) ? (((7'h40) ? (8'ha6) : (8'h9d)) * {(8'hb5)}) : (((8'ha4) == (7'h42)) ? ((8'hba) ? (8'hb0) : (8'h9f)) : (~(8'had)))) ? ((((8'ha6) >> (8'ha6)) == (~&(8'ha5))) << (!(+(8'haa)))) : (({(8'hbe)} || (&(8'had))) ~^ (((8'ha8) - (8'hbb)) ? ((8'hb8) ? (8'hb5) : (8'hbb)) : ((8'hae) < (8'ha4))))) : ({(((8'ha8) ? (8'hbb) : (8'hb7)) ? ((8'ha9) ^ (8'ha7)) : ((8'ha5) ^ (8'hbb)))} + ((~|((7'h40) <<< (8'ha4))) ? (+(!(7'h44))) : ({(8'ha2), (8'ha9)} ? {(8'hb1)} : ((8'hb4) ? (8'hbc) : (7'h41)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (($signed(wire2) ?
                         ({(8'hac),
                             (wire4 <<< (8'hb8))} || wire4) : $unsigned(($signed(wire0) & $signed(wire0)))) ?
                     (8'ha5) : wire4[(1'h0):(1'h0)]);
  assign wire6 = $signed({(wire5 ?
                         ($unsigned(wire3) || $signed(wire4)) : $signed(wire1)),
                     $unsigned((wire0[(3'h6):(3'h4)] ^ (wire5 ?
                         (8'hae) : wire3)))});
  assign wire7 = ($unsigned((~|$signed(wire2))) ?
                     (wire3[(3'h6):(3'h5)] + (wire6 ?
                         wire3 : $unsigned((wire2 ?
                             wire4 : wire0)))) : {$signed($unsigned(wire4[(3'h4):(1'h1)]))});
  assign wire8 = $unsigned($signed((wire4 >>> wire3[(4'hb):(3'h5)])));
  assign wire9 = (wire7 ?
                     (($signed((+(8'h9e))) == $unsigned(wire0)) ?
                         wire7 : $unsigned(wire8)) : (~|$signed(wire2)));
  assign wire10 = wire5;
endmodule
