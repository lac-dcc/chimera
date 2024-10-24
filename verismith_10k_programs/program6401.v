module top
#(parameter param12 = (((((8'hb5) << (~^(8'ha3))) ? (8'hae) : (((8'ha0) > (8'had)) ^ {(7'h44)})) != ((((8'ha2) & (8'ha2)) ? ((8'h9e) | (8'haa)) : (~&(8'hb4))) >>> ({(8'hbe)} ~^ (~^(8'had))))) ? (~&(!(((8'ha3) <<< (7'h42)) ? ((8'hb7) ? (8'hb5) : (8'haf)) : (8'hac)))) : (((((8'hbd) <= (8'hb4)) <<< {(8'had)}) ? ({(8'hb0)} ? ((8'hbb) | (8'ha5)) : (&(8'hb9))) : (((7'h44) ? (8'hac) : (8'ha0)) ? {(8'hb4), (7'h44)} : ((7'h41) >>> (7'h44)))) ? (~&(((8'ha7) > (7'h42)) ? ((8'hbf) || (8'haf)) : ((8'hb1) ? (8'haf) : (8'hb4)))) : (!(8'hb0)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (~|$signed(wire2));
  assign wire6 = ((wire5[(3'h4):(1'h0)] ? {$unsigned((~|wire1))} : (+(8'hb8))) ?
                     $signed(wire0[(3'h7):(3'h5)]) : wire2[(1'h1):(1'h1)]);
  assign wire7 = {(((-{wire1, wire4}) == (|wire1)) ?
                         wire2[(3'h4):(1'h0)] : wire0),
                     (~$signed($signed((wire3 || wire0))))};
  assign wire8 = {$unsigned(($unsigned((wire7 || (8'hbc))) ?
                         wire4 : $signed($unsigned(wire7))))};
  assign wire9 = ({(^~$signed((wire0 >> (8'hb3))))} > ($signed(wire5) ?
                     wire8 : (wire7 + wire7[(4'he):(4'hc)])));
  assign wire10 = $signed(($unsigned(($signed(wire2) ?
                          {wire5, wire1} : (8'had))) ?
                      $signed(($unsigned(wire2) ?
                          $unsigned(wire3) : wire2)) : {$unsigned((|wire6)),
                          (~^$signed(wire7))}));
  assign wire11 = (^~(wire4 ?
                      $signed($signed($signed(wire7))) : (wire6 ?
                          $signed($signed(wire6)) : {$unsigned(wire1)})));
endmodule
