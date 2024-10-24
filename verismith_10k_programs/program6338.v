module top
#(parameter param13 = ((8'ha6) ? (((((8'h9c) ? (8'hbc) : (8'hb5)) ? (~|(8'hb6)) : {(8'ha3), (8'hb8)}) >>> (-(+(8'hb0)))) & ((((7'h42) ? (8'ha0) : (8'hae)) ? ((8'hae) ? (8'hba) : (7'h41)) : (-(7'h40))) ? ({(8'hb9), (8'hb9)} ? (8'h9c) : ((8'hac) < (8'hb9))) : ((~&(8'ha3)) ? ((8'ha7) >> (8'hae)) : {(8'hb2), (8'hae)}))) : (8'ha7)), 
parameter param14 = (8'ha7))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, reg12, reg11, reg10, reg9, (1'h0)};
  assign wire5 = {{((^wire1) > (((8'hac) - wire4) ?
                             wire2[(4'ha):(2'h3)] : (!wire3))),
                         (~|(|wire1))}};
  assign wire6 = wire4[(4'hf):(3'h4)];
  assign wire7 = $unsigned($signed(($signed({wire5}) ?
                     $signed(wire4[(4'hf):(3'h4)]) : (8'ha6))));
  assign wire8 = $signed((~^{$signed((wire5 && (8'h9c))), {(!wire6)}}));
  always
    @(posedge clk) begin
      reg9 <= (+$signed(wire7));
      reg10 <= wire2[(2'h3):(1'h0)];
      reg11 <= (^$signed($signed(((~^wire0) ?
          wire7[(3'h4):(1'h0)] : wire5[(5'h14):(3'h7)]))));
      reg12 <= $unsigned($unsigned((^~wire5[(5'h12):(5'h11)])));
    end
endmodule
