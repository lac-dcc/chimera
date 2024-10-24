module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1[(4'h9):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= (~wire4[(4'hc):(3'h7)]);
      reg6 <= {($signed($unsigned(wire1[(5'h11):(3'h4)])) >> $unsigned($unsigned($unsigned(wire0)))),
          (~^{((8'hab) | wire1[(2'h3):(1'h0)]), (&$unsigned((7'h44)))})};
      reg7 <= reg5;
      reg8 <= ((~&(wire0 + ((reg6 ? (8'ha6) : reg6) << wire4))) ?
          (~^wire1) : $unsigned(reg7[(3'h6):(2'h3)]));
      reg9 <= {wire4[(4'h9):(2'h2)], (+$signed((~&(~&wire2))))};
    end
  assign wire10 = reg5[(3'h6):(3'h4)];
  assign wire11 = (&$signed(reg5[(3'h5):(2'h2)]));
  assign wire12 = wire1;
  assign wire13 = $signed((!(~|($signed(reg5) ? wire10 : wire3))));
  assign wire14 = wire12;
  assign wire15 = ((((wire10 ? (wire4 ~^ wire10) : wire2) ?
                              $unsigned((reg8 | (8'ha9))) : $unsigned($signed(wire11))) ?
                          $unsigned($signed((wire10 & wire2))) : wire14) ?
                      (wire14 + ($unsigned((wire14 ~^ reg9)) ?
                          (^wire10) : $unsigned(wire10))) : (~($signed(wire10[(2'h2):(1'h0)]) ?
                          ((reg6 - wire1) ?
                              wire13[(3'h6):(2'h2)] : (&wire13)) : reg5)));
endmodule
