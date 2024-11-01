module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire3[(5'h12):(4'h8)];
  assign wire6 = wire2;
  assign wire7 = (+(^($signed(wire3) || wire1)));
  assign wire8 = $signed($unsigned((~&wire2[(4'h8):(2'h2)])));
  always
    @(posedge clk) begin
      reg9 <= ($signed(wire3[(4'hd):(4'hd)]) < wire2[(4'h9):(3'h4)]);
      reg10 <= $signed(wire5[(4'ha):(4'h9)]);
    end
  assign wire11 = (!(($unsigned($unsigned((8'h9f))) ?
                          $unsigned((!wire4)) : $signed($signed(wire3))) ?
                      (|($unsigned(wire7) ?
                          (wire5 - reg10) : $unsigned(wire0))) : $signed(wire5)));
  assign wire12 = (~^((^$unsigned($signed((7'h42)))) ?
                      $unsigned((!{wire2, wire1})) : wire8[(1'h0):(1'h0)]));
  assign wire13 = $signed(wire4[(1'h0):(1'h0)]);
  assign wire14 = {(^$unsigned($signed({wire5, wire1})))};
  always
    @(posedge clk) begin
      reg15 <= (8'ha6);
    end
endmodule
