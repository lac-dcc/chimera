module top
#(parameter param55 = ((+{(~|((8'hab) >> (8'h9d))), (((8'hb1) << (8'hb9)) >= ((8'hb1) | (8'ha8)))}) ? ({(((8'hae) - (8'hb7)) ? ((8'haf) >> (8'haa)) : ((8'hb9) ^ (8'hb7))), (((7'h41) ? (7'h43) : (8'h9e)) != (~|(8'h9c)))} >>> (!(8'ha3))) : (((^~((8'ha1) ? (8'hb5) : (8'haf))) ? {(^~(8'ha9))} : (((8'h9c) ? (8'haf) : (8'h9e)) > ((8'h9f) ~^ (8'hb7)))) ? ((-((8'hba) | (8'hb6))) ? (((8'h9c) <= (8'h9e)) > ((8'haa) ? (7'h43) : (8'haa))) : ((8'ha3) << (~|(8'hbf)))) : ((~^(^(8'h9e))) ? (~|(8'ha5)) : {((8'haf) ? (8'hb1) : (8'hb4)), (^(8'hba))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire50;
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire21,
                 wire4,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire50,
                 reg54,
                 reg34,
                 (1'h0)};
  assign wire4 = $unsigned(wire2);
  module5 #() modinst22 (wire21, clk, wire1, wire2, wire0, wire3, wire4);
  assign wire23 = ($unsigned({($unsigned(wire4) >>> (~|wire0)),
                      wire2[(1'h1):(1'h1)]}) < ($unsigned((wire1[(3'h5):(2'h2)] * $signed(wire21))) ?
                      ($signed(wire3[(2'h3):(2'h3)]) ?
                          wire4[(4'hb):(4'h8)] : wire2) : wire2[(3'h4):(1'h1)]));
  assign wire24 = wire3[(5'h11):(4'hc)];
  assign wire25 = wire23;
  assign wire26 = {($signed((~^(^wire1))) ?
                          (^$unsigned((wire0 ?
                              wire4 : wire4))) : {($signed(wire4) - (wire1 ?
                                  wire4 : wire3))})};
  assign wire27 = wire26[(2'h3):(1'h1)];
  assign wire28 = (~|{$unsigned(($signed(wire25) ?
                          $unsigned(wire23) : (wire23 == wire23))),
                      $signed((wire24 ?
                          $signed((8'had)) : (wire23 > wire27)))});
  assign wire29 = (&$signed(wire23[(3'h4):(2'h2)]));
  assign wire30 = $unsigned((7'h40));
  assign wire31 = $unsigned($signed(({wire25[(4'ha):(1'h0)]} ?
                      ((wire21 ? wire24 : (8'ha2)) ?
                          $signed(wire25) : wire27) : wire0)));
  assign wire32 = (($signed((wire27[(2'h2):(1'h1)] | (!wire21))) ?
                      (($signed(wire24) > (wire28 ? wire25 : wire1)) ?
                          wire30 : (^~(wire28 << (8'ha7)))) : wire1[(3'h7):(3'h6)]) >>> $unsigned(wire1));
  assign wire33 = (~($unsigned(wire23) != (~$unsigned((wire24 ^~ (8'ha4))))));
  always
    @(posedge clk) begin
      reg34 <= wire32[(1'h1):(1'h0)];
    end
  module35 #() modinst51 (wire50, clk, wire26, reg34, wire31, wire24);
  assign wire52 = wire31;
  assign wire53 = wire29;
  always
    @(posedge clk) begin
      reg54 <= {(($unsigned($signed(wire4)) ?
              ((reg34 >> wire2) ~^ (8'hbb)) : wire3) >>> ($unsigned((8'hac)) >>> (8'hb0)))};
    end
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  input wire [(4'hf):(1'h0)] wire37;
  input wire signed [(5'h11):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire41,
                 wire40,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = wire39[(4'h9):(4'h9)];
  assign wire41 = wire38;
  always
    @(posedge clk) begin
      if (({wire37, wire41} ?
          $unsigned((((wire41 ? wire36 : wire39) & (wire40 >> wire39)) ?
              {(~wire38),
                  wire40[(2'h2):(2'h2)]} : $unsigned(wire41))) : wire38))
        begin
          reg42 <= (wire36[(3'h4):(1'h0)] >>> wire37);
          reg43 <= {reg42};
          reg44 <= ((~|((^~reg42) ?
              ($signed(reg43) ?
                  (wire39 <<< wire37) : wire39[(4'ha):(1'h0)]) : ((wire36 ^~ reg42) ?
                  reg42 : wire39[(4'h9):(3'h5)]))) != ($unsigned(({wire36,
                  wire37} | (wire37 ? (8'haf) : wire36))) ?
              (8'ha4) : (((-(8'ha9)) >= $unsigned((8'hbc))) ?
                  (8'hbf) : $signed((wire39 != wire38)))));
          reg45 <= $signed(wire36[(4'he):(2'h3)]);
          reg46 <= $unsigned($unsigned(reg43));
        end
      else
        begin
          reg42 <= $unsigned((8'hb4));
          if ($unsigned((~&$signed(wire38[(1'h0):(1'h0)]))))
            begin
              reg43 <= (~^reg46);
              reg44 <= $signed(({$unsigned(reg43),
                  ((wire40 > reg42) ?
                      wire41[(2'h2):(1'h0)] : $unsigned(reg42))} >> ((reg44 ?
                      wire41 : reg43) ?
                  ($signed(reg44) > $unsigned(reg45)) : ($signed((8'haa)) >>> $unsigned(reg45)))));
            end
          else
            begin
              reg43 <= $signed($signed((~&((reg42 >> wire36) ?
                  reg42[(2'h2):(2'h2)] : reg46[(2'h2):(1'h0)]))));
            end
        end
      reg47 <= wire40;
    end
  assign wire48 = ($unsigned($unsigned(wire39[(4'hf):(4'he)])) || (~|($signed(wire41[(1'h0):(1'h0)]) ?
                      ((|reg47) ?
                          $signed(wire36) : reg43[(1'h0):(1'h0)]) : $unsigned($signed(wire36)))));
  assign wire49 = {{(~|$signed((8'h9c))), reg47}};
endmodule

module module5
#(parameter param20 = ({(((~|(8'hb2)) ^~ (7'h43)) * (((8'ha6) + (8'hb8)) ? ((8'hae) ? (8'hbe) : (7'h43)) : {(8'hb2)}))} >= (((-{(8'hb4), (7'h42)}) != (~(-(8'hb6)))) ? {(((8'ha1) ^~ (8'hb5)) ? ((8'ha6) ? (8'h9d) : (8'h9f)) : (&(8'hbd))), ({(8'hb3)} | ((8'hb8) ? (8'hac) : (8'hbd)))} : (({(8'ha1)} ? ((8'hbc) | (8'h9c)) : ((8'h9e) ? (8'hba) : (8'ha4))) ? (!{(8'hb3)}) : (((8'ha5) ~^ (8'hbd)) ? (~(8'hbd)) : ((8'ha6) <<< (8'hac)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire19,
                 wire13,
                 wire12,
                 wire11,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = ((($unsigned((wire10 ? wire8 : wire9)) ?
                      (wire6[(2'h2):(1'h0)] >> wire9[(3'h4):(2'h2)]) : wire7) >> (-$signed($signed(wire7)))) && $unsigned((wire8[(3'h5):(3'h4)] && (wire10 ?
                      $signed(wire10) : $signed(wire7)))));
  assign wire12 = (!(wire11 ? wire8 : {(8'h9d)}));
  assign wire13 = wire6[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg14 <= (((~^$signed((wire11 - wire9))) ?
          wire9[(2'h3):(1'h0)] : (wire11[(4'hf):(4'hb)] ?
              {wire8} : ((wire12 == wire12) - (wire12 ?
                  wire13 : wire8)))) <<< $unsigned({$unsigned((wire7 * (8'ha4)))}));
      reg15 <= wire6[(4'ha):(3'h6)];
      reg16 <= wire9;
      reg17 <= $unsigned($unsigned((((reg14 ?
              reg14 : wire6) <<< reg16[(1'h0):(1'h0)]) ?
          (wire11[(5'h10):(3'h4)] <= reg14) : $unsigned({wire10}))));
      reg18 <= $unsigned($signed((($unsigned(wire12) >>> wire6[(4'hb):(1'h1)]) ?
          ((reg17 >>> wire8) == reg16) : {{reg15, wire9}, reg15})));
    end
  assign wire19 = ((reg14 ? ((&$unsigned(wire8)) || reg14) : reg16) ?
                      wire12[(4'ha):(1'h0)] : $signed((wire10 ?
                          wire8 : (-wire13))));
endmodule
