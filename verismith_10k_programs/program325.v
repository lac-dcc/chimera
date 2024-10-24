module top
#(parameter param11 = (^~((~&(((8'hb1) ? (8'h9f) : (7'h42)) ? ((8'h9f) > (8'hbd)) : {(8'ha0)})) ? ((7'h44) ? (((8'hae) ? (8'hb0) : (8'h9d)) ? (8'h9d) : {(8'hb7), (8'ha0)}) : (~((8'had) ? (8'ha9) : (8'ha6)))) : ((^(!(8'hbd))) <<< {((8'hb8) ? (8'haf) : (7'h43))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, wire6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($signed(($signed(wire4) > wire3[(3'h4):(1'h1)])) || ($unsigned((-(8'hab))) >>> $signed(wire1[(2'h2):(1'h0)]))));
    end
  assign wire6 = (!$signed(wire2));
  assign wire7 = $unsigned((!$unsigned($signed((reg5 ? reg5 : wire0)))));
  assign wire8 = ($signed(($signed(((8'haf) ?
                     wire3 : reg5)) ^~ wire2)) + ($unsigned($signed(wire0)) ?
                     $unsigned($signed((wire0 && wire0))) : ((wire6 ?
                         $unsigned(wire0) : ((8'hbf) == wire4)) - $unsigned((wire0 ~^ wire7)))));
  assign wire9 = $signed(wire6);
  assign wire10 = ({wire3, wire2[(1'h1):(1'h1)]} ~^ reg5);
endmodule
