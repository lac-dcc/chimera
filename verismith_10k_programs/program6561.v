module top
#(parameter param26 = ((&(8'hbd)) ? (~|((((8'ha8) * (8'ha7)) > ((8'ha7) | (8'h9d))) ? ((^~(8'h9f)) >> (~^(8'ha9))) : (7'h40))) : (|(^{((8'hbf) ? (8'hbd) : (8'ha8))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 wire13,
                 wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($unsigned((~|($signed(wire0) | (wire3 ? wire3 : wire3)))) ?
                     $unsigned($unsigned(wire3[(4'h8):(3'h6)])) : {{$unsigned((wire4 ?
                                 wire0 : wire2)),
                             (^$signed(wire2))},
                         (wire1 || $signed(wire2))});
  assign wire6 = ($unsigned(({(~|wire0), $unsigned(wire5)} ?
                     wire0[(1'h0):(1'h0)] : wire2)) + wire5);
  assign wire7 = wire1[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg8 <= (+(({(+wire7)} < $unsigned(wire7[(1'h1):(1'h1)])) ?
          (^~$signed((wire7 >>> wire6))) : $unsigned(wire4[(1'h0):(1'h0)])));
      reg9 <= $unsigned($signed((^{$unsigned(wire0)})));
      reg10 <= {(wire4 >= (8'hb4)), (7'h42)};
    end
  assign wire11 = reg8;
  assign wire12 = (8'hbc);
  assign wire13 = wire12[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      reg14 <= $signed(((^~{wire6}) == (^~((wire4 ?
          wire5 : wire11) >>> $unsigned(reg9)))));
      reg15 <= $unsigned($signed({({wire13} || wire3[(3'h5):(1'h0)])}));
      reg16 <= wire2[(3'h4):(2'h3)];
      reg17 <= $signed($signed({wire3, $signed((|(8'hb0)))}));
    end
  assign wire18 = (reg16 > (~|wire1));
  assign wire19 = $signed(((~($signed(wire4) ?
                      $unsigned((8'hb3)) : $signed(wire1))) == ($unsigned($unsigned(reg9)) == (+$signed(reg8)))));
  always
    @(posedge clk) begin
      reg20 <= $unsigned((~^wire5));
      reg21 <= $signed(($unsigned($signed(wire4[(2'h2):(2'h2)])) + $unsigned(reg8[(3'h5):(1'h0)])));
    end
  assign wire22 = (^~(8'hae));
  assign wire23 = ({$unsigned(($signed(reg10) && (!wire2))),
                      {$signed(reg9)}} + ({($signed(reg16) ?
                              $unsigned(wire4) : (wire4 ? reg17 : (8'ha9)))} ?
                      (wire7[(1'h1):(1'h0)] ?
                          (8'hb5) : (~&((7'h44) ?
                              wire13 : wire13))) : (((wire4 ^ wire1) ?
                          $unsigned(wire2) : $signed((8'ha7))) == $unsigned((wire0 - wire12)))));
  assign wire24 = $unsigned($signed((-{{wire5, reg15}, wire3[(3'h5):(1'h0)]})));
  assign wire25 = reg8;
endmodule
