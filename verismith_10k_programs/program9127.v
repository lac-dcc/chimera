module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
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
  assign wire5 = ($signed($signed(wire3[(3'h5):(1'h0)])) ?
                     wire1 : wire3[(4'he):(3'h4)]);
  assign wire6 = $unsigned((($unsigned($signed((8'haa))) ?
                     $unsigned(wire2) : $unsigned((~^wire1))) <<< $unsigned((8'hb3))));
  always
    @(posedge clk) begin
      reg7 <= $signed((~(~|wire2)));
      reg8 <= (-$unsigned(wire1));
      reg9 <= (-(^$unsigned($signed({wire6, wire5}))));
      reg10 <= $signed({($signed((~|wire1)) && ((~|(8'hbe)) - {wire5,
              wire2}))});
    end
  assign wire11 = wire3[(3'h7):(3'h5)];
  assign wire12 = $signed(wire11);
  assign wire13 = (+($unsigned($signed(wire5[(3'h7):(2'h2)])) > wire5[(2'h2):(1'h1)]));
  assign wire14 = $unsigned((!(~|reg9[(4'ha):(4'ha)])));
  assign wire15 = $signed(wire2[(4'hf):(3'h4)]);
  assign wire16 = $unsigned($unsigned($signed({(~&reg7),
                      (wire4 ? (8'ha4) : reg8)})));
  assign wire17 = $unsigned(wire15[(2'h2):(1'h0)]);
endmodule
