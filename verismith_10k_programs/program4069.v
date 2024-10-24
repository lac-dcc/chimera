module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (((($unsigned(wire1) ?
                         (wire1 ?
                             wire4 : wire1) : wire0[(1'h1):(1'h1)]) ^~ wire2[(3'h7):(3'h4)]) ?
                     wire2 : wire1[(3'h4):(2'h2)]) || $unsigned((({wire2} || $unsigned(wire0)) ?
                     {(!wire1),
                         wire3} : ($unsigned(wire2) | $unsigned(wire0)))));
  assign wire6 = (!(~|$unsigned((~|{(8'hb2)}))));
  assign wire7 = (wire0 * (^((-(&wire0)) ? {(wire5 > wire2)} : wire2)));
  assign wire8 = $unsigned($unsigned($signed(wire7)));
  assign wire9 = (((+(+wire4[(3'h5):(1'h1)])) || ((|wire7) <= $unsigned((~|wire7)))) || wire1[(3'h6):(3'h5)]);
  assign wire10 = $signed(((-{(^(8'hb4)), (+wire0)}) ^ (($signed(wire8) ?
                          wire5[(3'h4):(1'h1)] : wire6) ?
                      $unsigned(wire6) : ($unsigned(wire7) ?
                          ((8'hb8) & wire5) : $unsigned(wire4)))));
  assign wire11 = (~|wire6);
  assign wire12 = (wire9 + wire2);
  always
    @(posedge clk) begin
      reg13 <= wire6;
      if ((!reg13))
        begin
          reg14 <= ((wire3[(4'ha):(3'h4)] < ({wire5} <= wire5)) < wire1[(2'h3):(1'h0)]);
        end
      else
        begin
          if (wire7[(5'h13):(4'hd)])
            begin
              reg14 <= wire10[(1'h0):(1'h0)];
              reg15 <= wire3[(2'h3):(1'h0)];
              reg16 <= $unsigned($unsigned(((wire7 >>> (wire1 ?
                      wire2 : wire5)) ?
                  wire2[(3'h7):(1'h1)] : ({wire12, wire0} ?
                      $unsigned(wire10) : wire1))));
              reg17 <= (8'hb0);
            end
          else
            begin
              reg14 <= wire1[(4'hf):(4'h9)];
              reg15 <= ({$unsigned($unsigned(wire12))} ?
                  wire10[(3'h4):(1'h1)] : ((~|wire1) - (~|$unsigned(wire11[(2'h2):(2'h2)]))));
              reg16 <= ((reg15 ?
                      wire11 : (wire5[(2'h2):(2'h2)] ?
                          $unsigned($signed(reg14)) : ($signed(wire6) && $unsigned(wire12)))) ?
                  ((&($signed((7'h43)) << $signed(wire9))) ?
                      ({((8'hb8) ? wire7 : (8'h9e)),
                          wire11[(1'h0):(1'h0)]} < wire2) : wire6) : (8'ha4));
            end
          reg18 <= (wire11 ?
              wire8 : $signed((~|(wire11 ?
                  (wire2 < wire1) : (wire4 ? reg14 : wire12)))));
          reg19 <= (8'ha0);
        end
      reg20 <= wire4;
    end
  assign wire21 = (!reg17);
  assign wire22 = (+reg18);
  assign wire23 = $unsigned(($signed($signed($unsigned(wire4))) >> ($unsigned(wire9) ?
                      $unsigned((|reg17)) : reg20)));
  assign wire24 = (reg13[(2'h2):(1'h0)] ?
                      $signed(($unsigned(reg13[(1'h1):(1'h1)]) ?
                          wire9[(4'hc):(4'h8)] : $unsigned($unsigned((8'ha6))))) : reg16);
  assign wire25 = (wire2[(3'h5):(3'h5)] ?
                      ($signed($signed((wire5 != (8'hb7)))) - (((reg20 ?
                              reg16 : wire23) - wire4) ?
                          $unsigned($unsigned(wire2)) : $unsigned(((8'ha9) ?
                              reg14 : reg15)))) : wire7);
  assign wire26 = $signed(wire2);
  assign wire27 = (wire1[(4'hd):(4'hc)] ?
                      ((8'ha3) ^ ($unsigned(wire9[(1'h0):(1'h0)]) ?
                          (^~$signed(wire21)) : wire5)) : ($unsigned((~|{reg16,
                              wire2})) ?
                          (((wire6 > wire21) <<< (reg14 ? wire6 : wire4)) ?
                              wire22 : wire4[(4'h9):(2'h3)]) : ($signed({reg17}) ?
                              (-(wire3 ?
                                  reg14 : reg20)) : $signed(reg17[(2'h3):(1'h1)]))));
  assign wire28 = $unsigned(wire23[(1'h0):(1'h0)]);
  assign wire29 = (~reg15[(4'h9):(4'h9)]);
endmodule
