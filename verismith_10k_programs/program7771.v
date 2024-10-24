module top
#(parameter param10 = ((~|(|{(^(8'hb0)), ((8'ha1) ? (8'haa) : (8'haa))})) ? {{(((8'hae) ? (8'hb8) : (8'had)) - ((8'h9e) ? (8'hbf) : (8'hb4))), (((8'had) ? (7'h42) : (8'hb0)) << ((7'h43) ? (8'ha1) : (8'h9e)))}, ({((8'ha9) - (8'h9d))} >= (!(|(8'hb0))))} : ({((~|(7'h43)) ? ((8'ha4) ? (8'ha5) : (8'hb4)) : {(8'hb7), (8'hb4)}), (~((8'ha4) ? (8'hb1) : (7'h43)))} ? (({(8'ha9)} ? (^(7'h44)) : ((8'hba) <<< (8'h9d))) * ({(8'ha5), (8'hb9)} ? (^~(8'h9d)) : ((8'h9d) ? (8'hab) : (7'h40)))) : (({(8'hb3)} == ((8'ha0) ^ (8'haa))) ? (((8'hae) >> (8'hbd)) ^~ ((8'hbd) + (7'h43))) : (&((8'ha2) ? (8'hb7) : (8'h9d)))))), 
parameter param11 = (({(^~(param10 ? (8'ha7) : param10)), ({param10, param10} ? (param10 ^~ param10) : ((8'hb3) ? param10 : param10))} ~^ param10) && (+param10)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire9, wire6, wire5, reg8, reg7, (1'h0)};
  assign wire5 = {$signed(wire3),
                     $signed(($signed($unsigned(wire4)) - $unsigned(wire4[(2'h2):(2'h2)])))};
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= $unsigned((-(~|(!$signed(wire3)))));
      reg8 <= (8'ha8);
    end
  assign wire9 = ($signed(wire2[(3'h7):(3'h7)]) == wire6);
endmodule
