module top
#(parameter param12 = ((((((8'had) && (7'h43)) ? {(7'h41)} : ((8'ha7) < (7'h42))) ? (~|((7'h40) || (8'hbe))) : ((!(8'ha4)) ? ((8'h9f) ? (8'hb2) : (8'hb9)) : (^~(8'ha7)))) ~^ (({(8'hb6), (8'ha5)} - ((8'ha0) >>> (7'h40))) ? (^(~(8'ha8))) : (!((7'h40) << (8'hb5))))) >> (({((8'had) <<< (8'hb8))} <= {((8'hbd) <= (8'h9d)), (8'hab)}) ? {{((8'hb5) ? (8'hb5) : (7'h44))}, (!(8'hb5))} : ((7'h44) > ({(8'had)} <<< ((7'h41) << (8'h9f)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, wire7, wire5, wire4, reg6, (1'h0)};
  assign wire4 = (8'hb5);
  assign wire5 = wire4[(5'h11):(4'hd)];
  always
    @(posedge clk) begin
      reg6 <= $signed({($signed(((8'hab) ?
              (8'h9c) : wire4)) >>> $unsigned((wire2 ? wire3 : wire0))),
          (~|wire1)});
    end
  assign wire7 = $unsigned((+$signed($unsigned(wire1))));
  assign wire8 = $signed($signed(({(wire1 ? wire3 : (8'hbe)), (wire1 - wire2)} ?
                     (wire2 ? (~|reg6) : (8'ha2)) : (^(8'hbb)))));
  assign wire9 = $unsigned(wire1);
  assign wire10 = (((wire1 << (wire9[(2'h2):(1'h0)] != $unsigned(wire5))) ?
                      wire0 : $signed(($signed(wire7) & wire9))) || {wire0[(4'h8):(3'h6)],
                      (^{$signed(wire9)})});
  assign wire11 = (+(&$unsigned((((8'h9f) ? wire3 : wire1) ?
                      (8'ha8) : $signed(wire4)))));
endmodule
