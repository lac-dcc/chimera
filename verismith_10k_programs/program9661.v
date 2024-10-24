module top
#(parameter param9 = ((({(~|(8'ha1)), ((8'hb8) ^ (7'h41))} << (((8'ha7) ? (8'hb0) : (8'hbd)) ~^ (~^(8'ha7)))) ? ((+((8'ha4) > (8'ha7))) | ({(8'h9e), (8'hb9)} ~^ ((8'hac) >= (7'h42)))) : ((((7'h42) ? (8'had) : (8'ha2)) != {(8'ha1)}) ? (+((8'hb4) >= (8'hbd))) : (+(+(8'ha7))))) ? (({((8'ha7) ~^ (8'haa))} ? {((8'ha6) | (8'hbd))} : ((^(8'ha9)) - ((8'hac) ? (8'hb2) : (8'hbf)))) >= (|((|(8'ha3)) ? {(8'hb5)} : ((8'ha5) >>> (8'ha5))))) : ((-((!(8'hb0)) ? ((8'hbd) ? (8'h9d) : (8'hb0)) : (|(8'hb6)))) ^~ {{{(8'hba)}, {(8'hb7), (8'ha1)}}, {{(8'hb6)}, ((8'hbe) <<< (8'ha3))}})), 
parameter param10 = ({param9} >>> (-param9)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(((wire3 ?
          (~^wire1) : wire2[(4'hb):(4'h9)]) != ($signed(wire0) ?
          $unsigned($signed(wire3)) : ((wire1 < (8'hac)) >>> wire3[(4'h8):(1'h0)]))));
    end
  assign wire5 = $signed(reg4[(2'h2):(2'h2)]);
  assign wire6 = wire5;
  assign wire7 = $unsigned($signed(wire3[(4'h9):(2'h2)]));
  assign wire8 = wire1[(4'h9):(3'h4)];
endmodule
