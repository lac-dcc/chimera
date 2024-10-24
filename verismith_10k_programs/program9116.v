module top
#(parameter param13 = (~((&((^~(8'ha2)) ^ ((7'h43) ? (8'hb6) : (8'ha7)))) ^ ((((8'hab) - (8'h9d)) ^~ ((8'hb2) < (8'ha8))) ? (|{(8'hb1), (7'h40)}) : ((~|(7'h41)) ? ((8'hb2) != (8'ha0)) : (~^(8'ha5)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed(wire3);
  assign wire5 = wire0;
  assign wire6 = ({wire5,
                         ((&(^wire2)) ?
                             wire5[(4'hc):(4'h9)] : (+(wire2 ?
                                 wire3 : wire2)))} ?
                     (+wire5) : wire3);
  assign wire7 = wire4[(3'h4):(1'h0)];
  assign wire8 = (~^(^~((-{wire7}) ?
                     $unsigned((wire2 > wire2)) : $unsigned($signed(wire3)))));
  assign wire9 = (~|wire5);
  assign wire10 = (+(^~wire4));
  assign wire11 = wire6;
  assign wire12 = {($signed(wire4) + $unsigned(wire3[(2'h3):(1'h0)]))};
endmodule
