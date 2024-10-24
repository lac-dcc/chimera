module top
#(parameter param18 = ((~^((^(!(8'hbd))) ? (~^(~^(8'ha9))) : (8'hb3))) ? (^~((~^((8'ha2) ? (8'hb5) : (8'ha6))) ? (((8'hbe) - (8'haf)) ? (+(7'h41)) : (-(8'ha7))) : ((^(8'hab)) ? ((8'hb0) ? (7'h43) : (8'ha9)) : ((8'had) && (8'hb1))))) : ({(~|(^(8'hac)))} + (~^{{(8'hbb)}}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire6,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = {wire4,
                     $signed((~|(((8'hbd) * wire4) ?
                         (wire1 ? wire3 : (8'h9f)) : $signed(wire4))))};
  assign wire6 = $signed($unsigned($unsigned(((wire5 >> wire0) ^ wire3))));
  always
    @(posedge clk) begin
      reg7 <= wire4[(3'h4):(3'h4)];
      reg8 <= {$signed((wire2[(2'h3):(1'h1)] + ({wire1, wire2} ?
              (wire6 ? wire4 : wire6) : wire2)))};
    end
  always
    @(posedge clk) begin
      reg9 <= ($signed(wire1[(1'h0):(1'h0)]) ?
          ((-wire3) <<< $signed((^~$unsigned(wire3)))) : $signed((7'h43)));
      reg10 <= (wire5 ?
          ((^~((reg9 >> wire4) | $unsigned(wire2))) >>> wire3) : $unsigned((wire6[(4'he):(3'h7)] > wire1[(4'h9):(1'h0)])));
      reg11 <= $unsigned(wire2);
      reg12 <= reg10;
    end
  assign wire13 = $signed(wire0);
  assign wire14 = reg10[(3'h7):(3'h7)];
  assign wire15 = reg11;
  always
    @(posedge clk) begin
      reg16 <= reg10[(4'h9):(4'h8)];
      reg17 <= (&{(-((reg8 ? wire15 : wire1) ~^ (^~reg10))),
          wire13[(2'h2):(1'h1)]});
    end
endmodule
