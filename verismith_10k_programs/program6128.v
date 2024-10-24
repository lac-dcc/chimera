module top
#(parameter param16 = (~^((8'had) * ({(~&(8'hae))} && ((~|(8'hb9)) ? (~&(8'ha0)) : ((8'hb2) + (8'hb5)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $signed((wire3[(4'ha):(3'h7)] ?
                     $signed($unsigned(wire0[(4'hb):(3'h6)])) : $unsigned({$signed(wire3)})));
  assign wire5 = wire2;
  assign wire6 = {$unsigned(wire4)};
  assign wire7 = ({wire6,
                     (+({wire6} ?
                         (wire5 ?
                             wire2 : wire1) : $signed(wire5)))} != wire4[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg8 <= (~wire5);
      reg9 <= {(((reg8 >= $unsigned(reg8)) >>> (wire0[(2'h3):(1'h0)] ?
                  ((8'h9f) - (8'ha6)) : $unsigned((8'hba)))) ?
              $signed($unsigned(wire1)) : (((wire7 << wire2) > {wire2}) << (~(wire7 ?
                  wire4 : wire5))))};
      reg10 <= $signed(wire0[(4'hc):(3'h6)]);
      reg11 <= $unsigned(((((wire6 ? reg10 : wire2) + (8'h9f)) ?
          wire3 : ($signed(wire6) | ((8'hbd) << wire3))) | $unsigned($signed($unsigned(wire6)))));
    end
  assign wire12 = wire1;
  assign wire13 = wire1;
  assign wire14 = $unsigned($signed($unsigned(wire3)));
  assign wire15 = $unsigned($signed($unsigned($unsigned((wire4 ^ reg11)))));
endmodule
