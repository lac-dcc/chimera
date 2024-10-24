module top
#(parameter param9 = ({(~^((!(8'hac)) ? {(8'hbc), (8'hab)} : ((8'hbf) ? (8'h9e) : (8'h9e)))), (+(^((8'hbe) >> (8'ha1))))} ? ((~^({(8'hb1)} && ((8'ha9) ? (8'hb9) : (7'h44)))) ? (((~^(8'h9c)) && {(8'hba)}) ? ((~|(7'h42)) <= ((8'hb9) == (8'h9e))) : ((~(8'hab)) ? ((8'haa) ? (8'hac) : (8'hbe)) : ((8'ha1) > (7'h44)))) : (~{((8'hb9) ? (8'hba) : (8'ha0)), (^~(7'h44))})) : (^{(~(+(8'hbf)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ({wire0[(3'h5):(2'h2)],
                     $unsigned(((+wire3) ?
                         $signed(wire3) : (|wire2)))} ~^ (~&$unsigned($signed($signed(wire1)))));
  assign wire6 = (wire3 ?
                     (~wire2) : ({($signed(wire4) ? (^wire3) : $signed(wire1)),
                             wire1[(4'h9):(1'h1)]} ?
                         wire3[(2'h2):(1'h0)] : (wire5[(3'h6):(1'h1)] & ((wire3 ?
                             wire0 : (8'hb5)) * {wire3, wire2}))));
  assign wire7 = wire5[(4'h8):(3'h6)];
  assign wire8 = (wire3[(5'h15):(4'h9)] > $signed((~$signed(((8'ha2) ?
                     wire1 : wire7)))));
endmodule
