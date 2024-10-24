module top
#(parameter param10 = (~&((8'ha6) ? ((+(~(7'h40))) << {((7'h42) ? (8'ha2) : (8'h9d)), (~(8'hbb))}) : ((((8'ha9) - (8'hb0)) ? ((8'h9c) >> (8'ha2)) : ((8'ha4) << (8'hac))) ? (((8'ha6) ? (8'hae) : (8'hb3)) ? (8'haa) : ((8'hbc) > (8'ha2))) : ((~(8'ha7)) ? ((8'hb6) ? (8'hbe) : (8'hb9)) : {(8'hab)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg9, reg8, (1'h0)};
  assign wire5 = wire0[(2'h3):(1'h0)];
  assign wire6 = (^($signed($unsigned($signed(wire1))) * wire5[(3'h5):(2'h2)]));
  assign wire7 = (-(+({$unsigned(wire4)} ?
                     $signed((wire4 < wire4)) : $unsigned({wire4}))));
  always
    @(posedge clk) begin
      reg8 <= wire3;
      reg9 <= wire2[(3'h4):(1'h1)];
    end
endmodule
