module top
#(parameter param15 = ({(&(~|((8'hb6) ? (8'hac) : (8'had))))} ? ((~&(((8'haf) || (8'ha6)) <<< {(8'hb2)})) ? (~|((&(8'ha9)) ? (~^(8'h9e)) : ((8'ha7) <<< (8'hbe)))) : ({((8'h9f) == (8'hac)), ((8'hb6) ? (8'had) : (8'ha9))} ^~ {(+(8'hab)), ((8'h9d) >= (8'hac))})) : ((+(((8'hb8) ? (8'hb4) : (7'h43)) ~^ ((8'haf) + (8'ha1)))) ? (|(~&((8'ha5) ? (8'hac) : (8'hab)))) : ((((8'h9c) > (8'ha5)) ? (-(7'h43)) : ((8'ha9) ? (8'haa) : (8'hb3))) ? (!(^(7'h42))) : ((8'hb7) ? {(7'h42)} : ((7'h44) > (8'hb2)))))), 
parameter param16 = (-(~|param15)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $signed({wire4});
  assign wire6 = (wire4[(3'h6):(3'h6)] ?
                     {$signed(wire5),
                         ((+$signed((8'hb3))) ?
                             $signed($unsigned(wire5)) : {$signed(wire5)})} : $unsigned($signed(wire5)));
  always
    @(posedge clk) begin
      reg7 <= (+$unsigned((|(|wire2[(1'h1):(1'h1)]))));
      reg8 <= wire3;
      reg9 <= (reg8 ?
          (!((+wire4[(5'h10):(4'ha)]) ?
              ((~wire5) ?
                  ((8'ha2) ?
                      wire4 : wire6) : {wire6}) : (8'hbf))) : $unsigned(wire0[(2'h2):(1'h0)]));
      reg10 <= ({(($unsigned(wire4) ?
              $unsigned(reg9) : $signed(wire3)) ~^ reg8),
          ((!(-wire2)) && reg7[(2'h3):(2'h3)])} != $unsigned(((!$signed(wire0)) >> (wire1[(1'h1):(1'h1)] >= {(8'had),
          wire1}))));
    end
  assign wire11 = {((~|$signed((wire1 >= wire5))) ? wire3 : $unsigned(reg8)),
                      reg9};
  assign wire12 = $signed(reg10);
  assign wire13 = (!wire1);
  assign wire14 = $signed({$unsigned(reg8)});
endmodule
