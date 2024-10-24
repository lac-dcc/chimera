module top
#(parameter param12 = {(((((8'hb4) < (8'haf)) != {(8'hb3)}) ? {((8'hb7) <= (8'hb0))} : ((~&(8'ha2)) ? ((8'h9e) >>> (7'h41)) : {(8'had)})) ? ((((7'h42) ? (8'ha8) : (8'ha5)) ? {(8'ha7), (8'hb9)} : (-(8'ha2))) && {((8'ha3) ? (8'ha5) : (7'h40)), ((8'hac) ? (7'h42) : (8'hb9))}) : (+(+{(8'hb5)}))), ((((|(8'hbe)) << ((8'ha7) && (8'hb8))) ? ((-(8'ha6)) ? (8'hb9) : (~(8'ha9))) : ((~^(8'hb1)) ? (!(8'ha1)) : ((8'ha1) == (8'h9e)))) ? ((8'hba) ? ((^~(8'ha7)) ? {(8'ha7)} : ((8'hb9) ? (8'hb9) : (7'h43))) : (((8'ha5) - (8'hbd)) ? (+(8'haa)) : (^~(7'h41)))) : (8'ha3))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, reg11, (1'h0)};
  assign wire5 = ((wire1 ?
                     wire4 : ((~(wire0 << wire0)) > $unsigned((wire0 ?
                         wire3 : wire0)))) & wire3);
  assign wire6 = wire5;
  assign wire7 = {(7'h40)};
  assign wire8 = ((&wire4) ?
                     (~|$signed($signed((wire0 ? wire3 : wire7)))) : wire4);
  assign wire9 = $unsigned($signed((((~&(8'hb0)) | $signed(wire0)) - ($signed(wire7) ^ wire7[(2'h3):(1'h0)]))));
  assign wire10 = (~&(wire7[(1'h1):(1'h0)] ?
                      (wire1[(2'h3):(2'h3)] + (8'hbe)) : $signed($signed($signed(wire7)))));
  always
    @(posedge clk) begin
      reg11 <= $signed($signed(((8'ha3) << wire4)));
    end
endmodule
