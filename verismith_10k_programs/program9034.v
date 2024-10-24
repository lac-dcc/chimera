module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire49,
                 wire48,
                 wire46,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg62,
                 reg58,
                 reg57,
                 reg51,
                 reg50,
                 reg8,
                 (1'h0)};
  assign wire4 = wire3[(3'h5):(1'h1)];
  assign wire5 = $unsigned($signed($unsigned(wire1)));
  assign wire6 = (&$signed($unsigned((~&(wire3 ? wire4 : (8'ha4))))));
  assign wire7 = (+wire5[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg8 <= (!$unsigned($unsigned(((wire0 << wire2) << wire1[(1'h0):(1'h0)]))));
    end
  assign wire9 = ((~|(~^wire3)) ?
                     $signed((~|$unsigned((reg8 ?
                         (8'hac) : reg8)))) : (($signed(((8'hb8) & wire2)) ?
                         wire5 : (reg8[(1'h1):(1'h0)] ?
                             (wire2 >>> wire0) : wire0[(4'hf):(4'he)])) >> {wire2[(2'h2):(2'h2)],
                         (((7'h42) == wire5) ^~ (wire0 && (8'hbc)))}));
  assign wire10 = (($signed(($signed(wire1) ?
                          (wire9 ^ wire6) : (wire2 ?
                              wire6 : (8'haa)))) - $signed({wire7[(4'he):(2'h2)]})) ?
                      (wire3 ?
                          wire5 : wire6[(1'h0):(1'h0)]) : ((-wire2) >= $unsigned((((8'hab) < wire1) > wire2[(3'h6):(2'h2)]))));
  assign wire11 = (+($unsigned(wire2) ?
                      $unsigned($unsigned({(8'h9c),
                          wire9})) : $signed((~$signed(reg8)))));
  assign wire12 = $unsigned(((~wire5[(3'h5):(1'h0)]) ?
                      wire0[(4'h8):(3'h7)] : wire3));
  module13 #() modinst47 (.wire16(wire4), .wire14(wire0), .wire17(wire9), .y(wire46), .clk(clk), .wire15(wire3));
  assign wire48 = wire0[(2'h2):(1'h1)];
  assign wire49 = $signed(wire3[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg50 <= wire7;
      reg51 <= {wire5[(3'h4):(1'h1)]};
    end
  assign wire52 = {(~&wire48[(4'ha):(4'h9)])};
  assign wire53 = {{(({reg51} ? $unsigned(wire11) : wire3[(2'h2):(2'h2)]) ?
                              {(8'had),
                                  $unsigned((8'hae))} : $unsigned((!(8'hab))))}};
  assign wire54 = {(8'hac), $unsigned($signed((&wire6)))};
  assign wire55 = wire48;
  assign wire56 = reg8;
  always
    @(posedge clk) begin
      reg57 <= {(7'h42), (~&(!wire12[(1'h0):(1'h0)]))};
      reg58 <= $unsigned($signed(($unsigned((^~wire49)) ?
          ((|wire56) ?
              $unsigned(reg50) : wire4[(4'hb):(3'h7)]) : ($signed(wire6) ?
              (!wire53) : (~|wire9)))));
    end
  assign wire59 = wire3[(5'h10):(2'h3)];
  assign wire60 = $signed($signed($signed((^~wire4[(4'h8):(1'h1)]))));
  assign wire61 = (^$signed($signed(($signed(wire52) ?
                      (wire4 ? wire5 : (8'hb1)) : wire5))));
  always
    @(posedge clk) begin
      reg62 <= $unsigned(((reg50[(1'h1):(1'h1)] << wire9) || (~($unsigned(wire2) ?
          (~&wire7) : $signed(wire53)))));
    end
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  assign y = {wire45,
                 wire36,
                 wire35,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire17[(3'h4):(2'h2)])
        begin
          reg18 <= (wire14 ? (wire15 >>> wire14[(3'h4):(2'h3)]) : wire17);
          reg19 <= wire16;
          reg20 <= wire16[(3'h5):(3'h4)];
          if ($signed((8'ha3)))
            begin
              reg21 <= ((~^($signed(wire17[(3'h4):(2'h3)]) ~^ {(+wire15)})) ~^ $signed($unsigned((~wire16))));
              reg22 <= $unsigned((8'hb8));
              reg23 <= (wire17[(1'h1):(1'h1)] ?
                  $signed((~^$signed({wire17}))) : (~|((+{reg21}) <<< $unsigned((&reg20)))));
              reg24 <= (reg20 ? reg18 : reg21[(4'ha):(4'ha)]);
            end
          else
            begin
              reg21 <= $unsigned($unsigned(reg21));
              reg22 <= wire14;
            end
        end
      else
        begin
          if ($signed(reg19))
            begin
              reg18 <= reg18;
              reg19 <= reg19[(1'h0):(1'h0)];
              reg20 <= $signed((~^(((reg18 ?
                  reg21 : reg21) | (^~wire14)) >= (+(wire16 ?
                  reg23 : reg22)))));
              reg21 <= ((|(-(~^{reg21, wire14}))) ^~ (reg18[(4'ha):(4'h8)] ?
                  (-$unsigned((reg21 && reg18))) : {wire14[(2'h2):(1'h0)]}));
              reg22 <= $unsigned({$signed(wire17)});
            end
          else
            begin
              reg18 <= $unsigned((+reg23));
              reg19 <= ((wire15[(2'h3):(2'h2)] ?
                  reg24 : ((~^$signed(reg24)) >>> (reg22 <= (reg20 ?
                      wire17 : wire14)))) + reg23);
              reg20 <= {reg24};
            end
        end
      reg25 <= ((wire14 ? $unsigned(reg22) : wire16[(4'hb):(1'h0)]) ?
          wire14 : (wire14 | (!(&(reg22 ? wire14 : wire14)))));
      reg26 <= $signed($unsigned($unsigned((~$unsigned(wire16)))));
      if ($signed($unsigned(($unsigned(reg19[(3'h4):(3'h4)]) >>> ((+reg24) ?
          reg23[(4'hc):(1'h0)] : (wire16 == wire15))))))
        begin
          if ($unsigned((wire14[(1'h0):(1'h0)] & wire17)))
            begin
              reg27 <= (&$signed(reg21));
              reg28 <= reg21;
              reg29 <= {(($unsigned((~reg20)) ?
                      wire14 : wire16) | $signed(reg27))};
              reg30 <= ((~(($signed(reg19) ?
                      $signed(reg18) : (reg20 << reg29)) ?
                  wire17 : $unsigned((reg27 >> reg20)))) <= ((reg21[(3'h4):(1'h0)] < (reg26 ?
                  (wire16 ? reg18 : reg22) : {(8'ha0),
                      reg18})) ^~ $unsigned(((reg19 ?
                  wire14 : reg22) * $signed(reg18)))));
              reg31 <= reg27[(1'h0):(1'h0)];
            end
          else
            begin
              reg27 <= (wire17[(3'h4):(1'h0)] == ($signed(({reg26,
                  wire17} ^~ $signed((8'hbc)))) || reg31[(1'h0):(1'h0)]));
              reg28 <= wire17[(1'h1):(1'h0)];
              reg29 <= reg21[(4'h8):(3'h7)];
              reg30 <= reg28;
              reg31 <= $signed($signed($unsigned((reg23[(3'h5):(1'h1)] ?
                  reg23[(3'h7):(2'h2)] : {wire15, wire17}))));
            end
        end
      else
        begin
          if ({$unsigned(reg24), $unsigned(reg29)})
            begin
              reg27 <= $unsigned({reg30,
                  (reg21[(1'h1):(1'h0)] ?
                      wire14[(2'h3):(2'h2)] : $unsigned((reg19 ?
                          (8'ha9) : wire16)))});
              reg28 <= ((~|(+reg18[(4'h8):(2'h3)])) ?
                  reg27 : (~&$unsigned({$unsigned(reg22),
                      (wire17 ? reg19 : reg19)})));
              reg29 <= (-((~reg23) <<< reg22[(3'h6):(3'h5)]));
              reg30 <= $signed(wire14[(3'h4):(1'h0)]);
            end
          else
            begin
              reg27 <= (reg29 != reg19[(3'h5):(3'h5)]);
              reg28 <= {(((!$unsigned((8'hb7))) | reg30[(4'hd):(3'h4)]) ?
                      $unsigned(reg25) : {reg31[(1'h1):(1'h0)],
                          (+reg22[(4'h9):(3'h5)])})};
            end
        end
      if ((((~^((reg21 ~^ reg29) ?
          ((8'hb5) - reg22) : wire14[(2'h2):(2'h2)])) & reg21) >> ((reg20 <<< $unsigned((reg27 >> reg22))) ?
          $signed(reg22) : $signed({$signed(reg20), (~&reg24)}))))
        begin
          reg32 <= (&(reg19 ?
              $signed(($signed(reg31) ?
                  (reg20 ?
                      reg21 : (8'ha4)) : $unsigned((8'h9e)))) : (($unsigned(reg23) <= (wire16 | (8'hbd))) | ((reg18 || wire14) ^ wire14[(1'h1):(1'h0)]))));
          reg33 <= {{(!$unsigned($unsigned(reg20)))}};
          reg34 <= (^~(&($signed($signed(reg18)) > (+(~reg22)))));
        end
      else
        begin
          reg32 <= wire16[(2'h3):(1'h0)];
          reg33 <= (!$unsigned($unsigned((~(8'hbd)))));
        end
    end
  assign wire35 = $signed($signed($unsigned(wire15)));
  assign wire36 = $signed((!(($signed(reg25) ?
                          ((8'hac) ? reg28 : (8'ha1)) : (reg22 ?
                              wire14 : reg27)) ?
                      (wire35 >> wire16) : reg23[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((((reg34 ? reg24 : reg22) && $signed((8'hb2))) ?
          ({reg20, reg25} ^~ (reg20 ? reg22 : wire17)) : ($signed(wire17) ?
              (reg27 ? reg30 : reg33) : reg27[(3'h5):(1'h1)])))))
        begin
          reg37 <= reg30[(2'h3):(1'h0)];
          reg38 <= reg18[(1'h0):(1'h0)];
          reg39 <= (7'h43);
          if ($unsigned((($signed(reg20) ?
              wire36[(4'h8):(1'h0)] : $signed($signed(wire14))) >> (8'hb9))))
            begin
              reg40 <= (8'hb9);
              reg41 <= $signed((!reg27));
              reg42 <= $unsigned((((+(reg37 > reg23)) ?
                  ($unsigned(reg40) && wire17[(3'h5):(3'h5)]) : ($signed(reg18) ^ {wire14,
                      reg20})) << (~&reg23)));
              reg43 <= reg38;
            end
          else
            begin
              reg40 <= (wire36 & (^~((^reg20) - {{reg25, reg40}})));
              reg41 <= $unsigned(wire17[(3'h5):(1'h1)]);
              reg42 <= reg34[(1'h0):(1'h0)];
            end
          reg44 <= (^~$unsigned({(((8'h9c) ? wire15 : reg25) ?
                  reg38 : {reg26})}));
        end
      else
        begin
          reg37 <= reg22;
          reg38 <= (reg24[(4'h8):(1'h0)] ?
              (reg19[(1'h0):(1'h0)] ~^ {((reg40 || reg39) ?
                      reg34[(2'h2):(1'h1)] : reg29[(4'h9):(3'h7)])}) : ($signed((reg34 >>> ((8'hb4) ?
                      wire16 : (8'ha1)))) ?
                  reg33[(3'h4):(3'h4)] : ({reg29[(2'h3):(1'h0)]} ?
                      $unsigned(reg18) : (|reg20))));
          reg39 <= reg29[(4'h9):(1'h1)];
          if ($signed($signed({$unsigned($unsigned((8'h9f))),
              reg29[(4'h8):(3'h7)]})))
            begin
              reg40 <= $signed($unsigned((^$signed({reg23, reg39}))));
              reg41 <= reg29;
              reg42 <= ((reg34[(1'h0):(1'h0)] && (+$signed($signed(wire35)))) << (&$unsigned((8'h9d))));
            end
          else
            begin
              reg40 <= reg22;
              reg41 <= {reg18,
                  (~&({reg40[(4'hb):(4'h9)], (-reg23)} ?
                      ($unsigned(reg21) * (reg28 ?
                          (8'hb1) : reg30)) : ($signed(reg19) != (wire14 ?
                          reg26 : reg38))))};
              reg42 <= (^(~|{$signed($unsigned(reg42)),
                  $unsigned((reg26 >>> reg37))}));
              reg43 <= (reg24 ^~ {$unsigned((wire16 <= $unsigned(reg29))),
                  ($signed(reg33[(2'h3):(2'h3)]) ?
                      (reg21[(3'h4):(1'h1)] >= $signed(wire16)) : ((reg26 ?
                              (7'h44) : reg40) ?
                          $signed(reg22) : $unsigned(wire35)))});
            end
        end
    end
  assign wire45 = reg24[(5'h15):(4'hb)];
endmodule
