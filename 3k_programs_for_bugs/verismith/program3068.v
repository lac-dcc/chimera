module top
#(parameter param17 = {(((8'hbe) > ((~(8'haa)) != {(8'hba)})) << (8'ha0))}, 
parameter param18 = (8'hb5))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 wire4,
                 reg15,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (~$signed($unsigned($signed((wire2 ? wire0 : wire3)))));
  assign wire5 = $unsigned(wire3);
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned($unsigned(wire3)));
      reg7 <= $unsigned(wire5);
      reg8 <= $unsigned($signed(($signed((wire4 ? reg7 : wire4)) >> reg7)));
      reg9 <= (wire5 ?
          $signed(reg6) : ((($signed(wire3) & (-reg7)) | (((8'h9d) - wire0) ?
              (+wire3) : wire5)) >>> ((((8'ha3) ^ (7'h42)) ?
                  $signed(wire5) : $unsigned(wire0)) ?
              (-wire2[(2'h3):(1'h0)]) : {(wire4 ? reg8 : wire5), wire3})));
      reg10 <= ((wire0[(3'h5):(3'h4)] ?
              (~|$signed((~wire1))) : reg6[(4'h9):(2'h3)]) ?
          (^~wire1) : ((wire3 | wire2) && $unsigned((wire2[(1'h1):(1'h1)] ?
              (wire4 & wire4) : reg8))));
    end
  assign wire11 = (-(&wire5[(1'h0):(1'h0)]));
  assign wire12 = (&wire5[(2'h2):(2'h2)]);
  assign wire13 = wire1;
  assign wire14 = reg6;
  always
    @(posedge clk) begin
      reg15 <= wire3[(3'h6):(2'h2)];
    end
  assign wire16 = (!(reg10 - (~$unsigned((wire13 & wire12)))));
endmodule
