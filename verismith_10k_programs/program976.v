module top
#(parameter param22 = (~(({(!(8'ha1))} | ((^(8'hae)) >> (~^(8'hb0)))) ? ((|((8'hb9) ^~ (8'hbe))) ? ((8'hb1) ? ((8'hb5) < (7'h42)) : (~(8'hb3))) : (((8'hba) | (7'h42)) >= (8'hae))) : (-(|(&(8'hac)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (^~$signed((~^{wire0})));
  assign wire5 = $unsigned($signed(($unsigned($signed(wire3)) & (7'h44))));
  assign wire6 = wire0[(5'h12):(4'h8)];
  assign wire7 = ((^$signed(((wire5 ^~ wire3) | (wire3 ?
                     wire4 : (8'h9d))))) < $unsigned(wire5));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire0);
      reg9 <= $signed($unsigned(((wire5[(2'h2):(1'h1)] ?
          (wire4 ? (8'hac) : wire1) : $signed(wire2)) && {wire5})));
      reg10 <= (~wire2[(2'h2):(2'h2)]);
    end
  assign wire11 = (&{{$signed({wire7, reg10}),
                          (((8'haf) ? wire3 : wire6) ? {reg10} : (-wire7))}});
  assign wire12 = $unsigned(wire1);
  assign wire13 = wire6[(2'h2):(1'h1)];
  assign wire14 = wire6;
  assign wire15 = $unsigned($unsigned($signed($signed({wire4, wire12}))));
  assign wire16 = (-wire3);
  always
    @(posedge clk) begin
      reg17 <= $unsigned(wire0);
      reg18 <= $signed($unsigned(({wire4} >> $signed($unsigned(wire0)))));
      reg19 <= ({($signed($signed(wire5)) ?
                  $signed($signed(wire15)) : (-(^wire3))),
              wire14} ?
          $unsigned(wire16[(3'h4):(2'h3)]) : (~^$signed(wire3)));
      reg20 <= ($unsigned(reg19) >= $signed((~^wire2)));
      reg21 <= $unsigned($signed((^~{$signed(wire14)})));
    end
endmodule
