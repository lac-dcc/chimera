module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned((wire0 ?
                     wire1[(5'h13):(5'h12)] : $unsigned(((|(8'hb6)) ?
                         wire2[(3'h5):(1'h1)] : wire0))));
  assign wire5 = $unsigned($unsigned((~|(wire0[(1'h1):(1'h0)] ?
                     wire4[(1'h0):(1'h0)] : (wire1 > wire1)))));
  always
    @(posedge clk) begin
      reg6 <= {($signed({(wire2 ? wire1 : wire1),
              (wire1 ? wire5 : wire4)}) > (wire3 - wire5[(5'h10):(3'h7)])),
          ($unsigned(wire0) == (+($unsigned(wire0) | $signed(wire0))))};
      reg7 <= (8'ha0);
      reg8 <= $unsigned(wire0);
      reg9 <= reg7;
    end
  assign wire10 = ($signed($signed(($signed(wire2) ?
                          wire5[(4'hc):(3'h6)] : $unsigned(wire0)))) ?
                      ($signed($unsigned(wire3[(3'h4):(2'h3)])) >> $signed(wire5[(4'hc):(4'ha)])) : $signed(wire2[(4'ha):(3'h6)]));
  assign wire11 = wire3;
  assign wire12 = (+$unsigned($unsigned({wire5, wire0[(1'h0):(1'h0)]})));
  assign wire13 = (+$unsigned($unsigned(wire12)));
  assign wire14 = {(~^$unsigned($signed(wire10[(2'h3):(2'h2)])))};
endmodule
