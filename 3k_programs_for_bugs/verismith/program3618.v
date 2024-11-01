module top
#(parameter param11 = {({(!((8'haa) - (7'h43))), ((!(8'hbc)) ? ((8'hb9) ? (8'h9f) : (8'haa)) : ((8'hae) >= (8'had)))} ? ((((8'hb2) ? (8'ha8) : (8'hbb)) ? {(8'hbc)} : ((7'h42) ^~ (8'haa))) ? (((8'haf) - (8'hb0)) << ((8'ha5) ? (8'ha3) : (8'ha7))) : {(^~(8'hab))}) : ((^~(~(8'hba))) ? ((~|(8'h9e)) ? (|(8'hbe)) : {(8'hb5), (8'h9d)}) : (((7'h44) ? (8'hb3) : (8'hb9)) ? (~|(8'hba)) : ((8'h9c) ^ (8'hbe)))))}, 
parameter param12 = {({(^(param11 >>> param11)), {(~param11)}} ? ((8'h9d) << ({param11} ~^ (param11 ? param11 : param11))) : (-{((8'ha7) < param11), {param11}}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (wire2[(1'h1):(1'h1)] ?
                     wire1[(4'h9):(2'h3)] : wire4[(1'h1):(1'h1)]);
  assign wire6 = {wire4[(2'h3):(1'h1)], $signed((^~wire4[(3'h6):(2'h3)]))};
  always
    @(posedge clk) begin
      reg7 <= wire0;
      reg8 <= reg7;
      reg9 <= $signed($unsigned(wire2[(2'h3):(1'h1)]));
      reg10 <= (($unsigned(($unsigned(wire2) << $unsigned(wire5))) ?
          ((8'hb0) ^~ (~|(^(8'hbb)))) : (^~$signed(wire6))) && reg8[(4'he):(4'hc)]);
    end
endmodule
