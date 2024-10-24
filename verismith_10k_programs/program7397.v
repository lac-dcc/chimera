module top
#(parameter param28 = ((((~|((8'hba) ? (8'hb2) : (8'ha6))) ? (((8'h9e) ? (8'haa) : (8'ha4)) ? ((8'hb5) <<< (8'ha7)) : {(8'h9d), (8'hac)}) : {{(8'hbe)}, (~^(8'ha3))}) <<< (+{(+(8'ha1))})) ^ (|{((+(7'h43)) ^ ((8'ha1) || (8'hbe)))})), 
parameter param29 = param28)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire7,
                 wire6,
                 wire5,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = wire2[(3'h4):(2'h3)];
  assign wire6 = {$unsigned((wire2[(3'h4):(3'h4)] << $signed({wire3})))};
  assign wire7 = ((wire6 && ($unsigned(wire4[(2'h3):(1'h1)]) - wire1[(1'h0):(1'h0)])) ?
                     (wire6[(4'h9):(3'h7)] ^ (^($signed(wire6) ~^ (~(8'ha1))))) : ($signed(($unsigned(wire0) | $signed((8'hb6)))) <<< ((+$unsigned((8'hb8))) ^ $unsigned($unsigned(wire4)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned($signed({wire2[(1'h0):(1'h0)]}));
      reg9 <= {$signed(wire3)};
      if (({(($signed(wire7) <<< (wire3 ?
                  wire4 : (8'hac))) ~^ $unsigned(wire5)),
              wire0} ?
          {wire7} : ((reg9[(4'he):(1'h1)] ^~ (8'haf)) && wire5[(2'h2):(1'h1)])))
        begin
          reg10 <= $unsigned((wire4 + ($unsigned((^~wire4)) ?
              $unsigned((wire7 - reg9)) : reg9[(4'hc):(4'ha)])));
        end
      else
        begin
          reg10 <= wire2;
          reg11 <= ((reg10 + $signed((&wire7))) ?
              (!(&wire4)) : ($signed((wire7[(1'h1):(1'h1)] ?
                      (reg8 ? wire6 : wire5) : wire4[(2'h2):(2'h2)])) ?
                  wire2 : wire0));
        end
      reg12 <= $signed(wire3[(2'h2):(1'h0)]);
    end
  assign wire13 = wire2;
  assign wire14 = $signed((($signed({reg11}) ?
                      $unsigned(reg10[(2'h3):(2'h2)]) : ((+(8'ha2)) ?
                          (wire0 >>> wire0) : {wire4,
                              reg12})) ^ ($unsigned(reg11) != {$unsigned(wire1),
                      wire1[(1'h1):(1'h0)]})));
  assign wire15 = reg10[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire0);
      reg17 <= (!reg16);
    end
  assign wire18 = (wire0 > ((^~{wire3[(2'h2):(2'h2)],
                      $signed(reg12)}) << wire14));
  assign wire19 = (wire15 && $signed(($unsigned((reg9 ?
                      wire18 : reg9)) != {(reg16 != reg17),
                      wire13[(4'hd):(2'h3)]})));
  always
    @(posedge clk) begin
      reg20 <= (+(&$unsigned(reg16[(1'h1):(1'h1)])));
      reg21 <= (($signed(reg11) ?
              $signed((reg8 ?
                  $unsigned(wire13) : (wire7 <= wire18))) : $signed(reg17[(1'h0):(1'h0)])) ?
          reg10 : wire4[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg22 <= wire18[(4'hb):(2'h2)];
      reg23 <= (($signed((~reg12)) * (^($unsigned(wire0) ?
          wire7 : $signed(wire2)))) || ((-$signed((^~wire14))) || ((~(wire7 ?
          reg10 : wire19)) | (~^(wire0 ? reg8 : wire2)))));
    end
  assign wire24 = wire4;
  assign wire25 = (($unsigned(((reg9 ? reg22 : reg16) ?
                      reg11[(1'h1):(1'h0)] : (reg8 ?
                          wire2 : wire2))) == (wire14[(1'h1):(1'h1)] ?
                      $unsigned(reg8) : $signed($unsigned(wire0)))) ~^ (~&reg21));
  assign wire26 = $signed($signed(wire4[(1'h1):(1'h0)]));
  assign wire27 = ({$unsigned(reg11), reg22[(2'h2):(1'h1)]} ?
                      (!(^~reg16[(4'hb):(1'h1)])) : wire4);
endmodule
