module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 reg12,
                 reg11,
                 reg8,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (((wire0 == (8'had)) ?
              wire4[(4'h9):(4'h8)] : (((!wire1) ?
                      $unsigned(wire0) : $unsigned(wire0)) ?
                  wire0 : $unsigned(wire0))) ?
          {(-($unsigned(wire1) <<< (wire3 ? wire4 : wire2))),
              (((!wire2) >= (wire2 ? (8'ha0) : (8'hbf))) ?
                  wire2 : $signed((^~(8'hbf))))} : (~&$signed((&$unsigned(wire4)))));
    end
  assign wire6 = (+{$unsigned(wire3[(2'h3):(1'h0)]), $signed($signed(reg5))});
  assign wire7 = (!(+reg5));
  always
    @(posedge clk) begin
      reg8 <= (~|wire2);
    end
  assign wire9 = wire3;
  assign wire10 = (wire1 ? wire1 : (+wire2));
  always
    @(posedge clk) begin
      reg11 <= wire0[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg12 <= $signed(wire4);
    end
  assign wire13 = ((~&((^reg5[(5'h11):(1'h1)]) ?
                          $unsigned((wire0 && wire6)) : reg8)) ?
                      ((($signed(wire1) ?
                          wire4[(4'h8):(3'h5)] : $unsigned(wire6)) >= (wire3[(3'h4):(1'h0)] < (reg8 ^~ wire0))) && (!reg12)) : wire3[(1'h1):(1'h1)]);
  assign wire14 = wire3;
  assign wire15 = ((reg5 ?
                      (({reg8, wire14} ?
                              (wire3 ? wire4 : wire7) : (reg11 ?
                                  wire10 : (7'h40))) ?
                          (+$unsigned(wire3)) : {(reg12 ?
                                  wire9 : wire3)}) : $unsigned((^~wire9[(3'h4):(2'h2)]))) >= (((wire7 ?
                          $signed((8'ha8)) : $unsigned(wire4)) & ((reg12 ?
                              wire10 : wire1) ?
                          $unsigned(wire3) : {wire6})) ?
                      $unsigned((&$unsigned((8'hbe)))) : reg8[(4'h8):(4'h8)]));
  assign wire16 = $signed(wire6[(3'h6):(3'h4)]);
  assign wire17 = (^$unsigned(({reg8[(1'h1):(1'h0)]} <= (8'hb5))));
endmodule
