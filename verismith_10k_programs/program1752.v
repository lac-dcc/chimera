module top
#(parameter param13 = ((((((8'hbd) >>> (8'ha2)) - ((8'hb2) + (8'h9e))) || {((8'hb2) ? (8'ha9) : (8'hb1)), ((8'hb4) ? (8'h9f) : (8'hb5))}) != {(((8'hbb) ? (8'hbb) : (7'h44)) ? (-(8'haa)) : (-(8'hac))), (!((8'ha7) + (8'hb7)))}) != ((-((~|(8'hb6)) * ((8'hb0) ^ (7'h41)))) > {(((8'hb3) ? (8'hb0) : (8'ha9)) * (|(8'hbb))), ((+(8'hbd)) <= {(8'hb5)})})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ($signed(((wire3[(2'h2):(2'h2)] ? wire0 : $unsigned(wire0)) ?
                         $signed($unsigned(wire1)) : ((7'h41) ?
                             (^~wire2) : (wire3 ? wire3 : (8'ha9))))) ?
                     wire2[(4'h9):(4'h9)] : $unsigned(wire1[(2'h2):(1'h1)]));
  assign wire5 = (((((wire0 ^ wire4) <<< (~&wire2)) >>> ($unsigned(wire3) >>> (~|wire2))) ~^ wire3) ?
                     $signed($signed({(8'ha0),
                         (wire2 <= wire1)})) : ($unsigned(wire1[(1'h1):(1'h0)]) ^~ (^wire1)));
  always
    @(posedge clk) begin
      reg6 <= $signed((+wire0));
      reg7 <= reg6[(4'ha):(2'h2)];
      reg8 <= (wire5[(4'hb):(2'h3)] ?
          $signed($signed({((8'h9d) | wire2)})) : wire1);
      reg9 <= $signed($signed($signed($signed((^wire2)))));
      reg10 <= $unsigned((+$unsigned(((-wire3) ? $signed(reg6) : (+wire0)))));
    end
  always
    @(posedge clk) begin
      reg11 <= reg6;
      reg12 <= (($unsigned((-$unsigned(wire2))) | ((~^(reg9 ? reg11 : reg9)) ?
              reg10[(2'h2):(1'h1)] : ({wire3, (8'hab)} <<< (wire1 >= reg10)))) ?
          ((((reg7 * wire1) ? (wire5 ? wire3 : wire1) : (-wire5)) ?
              {$signed(reg7)} : $unsigned((reg7 * wire3))) > ((+$signed(reg7)) ?
              (!$unsigned((7'h42))) : ($unsigned(reg9) < reg6))) : (reg9[(4'h8):(3'h6)] - wire0));
    end
endmodule
