module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire6;
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire6,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(3'h7):(2'h2)];
      reg5 <= wire3;
    end
  assign wire6 = (~$unsigned(wire1[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg7 <= wire6[(2'h3):(1'h1)];
      reg8 <= $unsigned({wire1[(2'h3):(2'h3)], reg7});
      reg9 <= (((~reg7) < ({{wire0, wire3}, (wire1 | reg7)} ?
          reg7[(2'h3):(1'h0)] : reg4[(3'h7):(3'h6)])) + wire3);
      reg10 <= $signed((!reg5));
      reg11 <= {$unsigned(wire1[(4'h8):(4'h8)]),
          $signed({((8'hb1) != ((8'hab) ? (7'h40) : reg4))})};
    end
  assign wire12 = $unsigned(wire1);
  assign wire13 = wire0[(4'ha):(4'ha)];
  assign wire14 = wire12[(3'h4):(1'h1)];
  assign wire15 = wire2;
  assign wire16 = (~{((8'ha2) ?
                          $signed((wire6 << wire0)) : wire6[(2'h2):(2'h2)])});
  assign wire17 = (-({reg4[(1'h1):(1'h0)], reg5[(4'hd):(3'h4)]} ?
                      $signed(($unsigned((8'hb6)) ?
                          wire13[(3'h4):(3'h4)] : reg10)) : (8'ha0)));
  assign wire18 = (+{($unsigned((reg10 << wire14)) ?
                          ($signed(wire16) ^~ {wire14}) : $signed(((8'ha7) ?
                              reg11 : reg9))),
                      {$signed($signed(reg5))}});
  assign wire19 = (wire6 ?
                      wire1[(4'ha):(4'ha)] : ({(~^(wire17 ? reg10 : (8'hbb))),
                              ($unsigned((8'h9d)) ?
                                  $unsigned(reg7) : (reg10 ? wire0 : reg7))} ?
                          $unsigned(reg4) : $signed(wire1[(4'ha):(1'h0)])));
endmodule
