module top
#(parameter param19 = ((|((((8'hb6) ? (8'hb1) : (8'ha9)) ? ((8'ha5) || (8'hab)) : {(8'ha6)}) ? (~&((8'hb6) ? (8'hac) : (8'hbd))) : (~((8'hbe) ? (8'had) : (8'hb5))))) ? ((({(8'hb3)} ? ((8'hbd) || (7'h43)) : ((8'h9f) ? (8'hb7) : (8'hb0))) ? (~|((8'ha4) ? (8'h9c) : (8'had))) : (^((7'h43) == (7'h41)))) * (((~|(8'had)) ? {(8'h9c), (8'hac)} : ((8'hbd) ? (8'hb7) : (8'hbd))) > (!((8'h9d) || (8'hb6))))) : {{((^(8'ha6)) ? (!(8'hb2)) : ((8'ha4) >= (8'hbb)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire15,
                 wire14,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg13,
                 reg12,
                 reg8,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = wire3;
  assign wire7 = ((~|(({(7'h41), wire4} ^~ (wire5 ? wire5 : wire5)) ?
                     ((&wire3) ?
                         (wire0 ? (8'ha9) : (8'hb9)) : ((8'h9f) ?
                             (7'h40) : wire2)) : (~|$signed((8'hbf))))) >>> $signed($signed((wire4[(1'h1):(1'h0)] >= ((8'ha4) ?
                     wire4 : wire2)))));
  always
    @(posedge clk) begin
      reg8 <= ((~^(((wire6 * wire0) ?
              {wire2} : (^~wire1)) - $signed((wire2 | wire4)))) ?
          (!$signed((8'hb4))) : $unsigned((^$unsigned($unsigned(wire0)))));
    end
  assign wire9 = {(~^$unsigned($unsigned((wire1 ? reg8 : wire1)))),
                     $signed(({(reg8 <<< wire4)} || wire2))};
  assign wire10 = wire7[(3'h4):(1'h1)];
  assign wire11 = $unsigned((reg8 ?
                      $unsigned((^$unsigned(wire6))) : ((wire9[(1'h0):(1'h0)] ?
                          {wire4} : (7'h42)) || wire4)));
  always
    @(posedge clk) begin
      reg12 <= (~^$signed((-({(8'hb5)} ^ reg8))));
      reg13 <= $unsigned((+{wire11[(3'h6):(2'h3)]}));
    end
  assign wire14 = ($unsigned(wire9[(2'h2):(1'h0)]) ?
                      wire11 : reg12[(3'h4):(2'h2)]);
  assign wire15 = ((^~$signed({wire1, wire5[(3'h7):(3'h7)]})) == wire5);
  always
    @(posedge clk) begin
      reg16 <= $signed(($signed((~&(wire4 ?
          wire10 : wire6))) >> $signed((~(+reg12)))));
    end
  assign wire17 = $unsigned($unsigned($unsigned(wire4)));
  assign wire18 = reg12[(3'h5):(3'h4)];
endmodule
