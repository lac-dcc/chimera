module top
#(parameter param12 = (({((8'hbc) ? (&(7'h42)) : {(8'h9c)}), ((~&(8'hb3)) || (&(8'hab)))} ? {(((8'hbe) ? (8'h9f) : (8'hb7)) == ((8'ha4) ? (8'h9e) : (8'hb7))), (((7'h41) ? (8'ha1) : (8'hae)) | {(7'h41)})} : {((8'hb2) <= {(8'hb1)})}) * ((8'hb0) ? {((8'haa) < ((8'h9e) < (8'hb1)))} : {(!((8'hb0) >> (8'ha2)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire9, wire4, reg8, reg7, reg6, reg5, (1'h0)};
  assign wire4 = (wire0[(3'h5):(3'h4)] ? wire3 : wire2);
  always
    @(posedge clk) begin
      reg5 <= wire1[(4'hf):(1'h0)];
      reg6 <= wire3;
      reg7 <= (^~$signed(wire0));
      reg8 <= (wire4[(4'hf):(4'hf)] ? (8'hbb) : $signed(wire4));
    end
  assign wire9 = ((~|(reg5[(3'h4):(1'h0)] ?
                         (~|$signed((8'ha9))) : ($signed(wire3) != (~wire0)))) ?
                     ((((8'ha0) & (wire0 ? wire1 : reg5)) ?
                             $signed(wire2) : ($signed((8'hae)) != wire2[(2'h3):(1'h1)])) ?
                         reg7[(5'h10):(4'hb)] : $unsigned((7'h44))) : $unsigned(($unsigned($unsigned(wire0)) ?
                         $signed((wire3 <= reg6)) : ((wire4 >= wire0) ?
                             (wire3 ? reg8 : wire0) : (wire3 ?
                                 (8'hae) : reg8)))));
  assign wire10 = (($unsigned((8'ha1)) ?
                      $unsigned($unsigned((wire2 ?
                          wire9 : wire4))) : $signed($signed(wire0))) ~^ (~^$signed({reg6[(1'h0):(1'h0)],
                      wire1})));
  assign wire11 = (wire3 ?
                      (^~(^~$unsigned((~reg7)))) : {(^~wire1),
                          $unsigned(($unsigned(wire4) ?
                              $unsigned(wire3) : (wire3 ^~ (8'hb8))))});
endmodule
