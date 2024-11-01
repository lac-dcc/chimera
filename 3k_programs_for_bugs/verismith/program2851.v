module top
#(parameter param11 = (((8'ha7) ? (^(((7'h40) ? (8'hb0) : (8'hb3)) <<< (~^(8'hac)))) : (((+(8'hb0)) ? ((8'hae) >>> (8'ha0)) : (~(8'hac))) > ({(8'hbd), (8'hbe)} ? (~^(8'hb0)) : {(8'hb5), (8'hb5)}))) ~^ ({(((7'h41) ? (7'h40) : (8'ha7)) ? (~(8'hb6)) : ((7'h41) <= (8'hb6))), ((^(8'hbc)) - ((8'ha6) == (8'ha3)))} && {{{(8'h9e), (8'hbe)}}, (((8'ha9) ^~ (8'hb7)) > (!(8'hb5)))})), 
parameter param12 = param11)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, reg10, (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = $unsigned($signed($signed(wire2)));
  assign wire6 = wire5[(3'h4):(3'h4)];
  assign wire7 = (8'ha6);
  assign wire8 = (~^({wire7[(3'h6):(1'h1)], (-wire5)} ?
                     (^~{{wire3, wire5}, (^wire0)}) : $unsigned((|(!wire3)))));
  assign wire9 = wire7[(4'h9):(3'h7)];
  always
    @(posedge clk) begin
      reg10 <= {(!$signed(wire5))};
    end
endmodule
