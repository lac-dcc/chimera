module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h20f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire95,
                 wire94,
                 wire93,
                 wire90,
                 wire88,
                 wire15,
                 wire14,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg96,
                 reg92,
                 reg91,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 (1'h0)};
  assign wire5 = $unsigned(({((wire0 < (8'h9e)) ?
                             $signed((8'hb0)) : {(8'h9c), wire0}),
                         (8'hbd)} ?
                     wire0 : (8'hac)));
  assign wire6 = (~^{$signed((wire0[(2'h3):(1'h0)] ? $signed(wire5) : {wire2})),
                     (|($unsigned((8'had)) ? (!(8'ha6)) : wire4))});
  assign wire7 = (!{($signed((!wire5)) ^ $unsigned(wire2[(3'h5):(2'h2)]))});
  assign wire8 = wire3[(4'h8):(4'h8)];
  assign wire9 = (~&(~^$unsigned(({(8'ha7), wire4} >>> {wire1, (8'hb0)}))));
  always
    @(posedge clk) begin
      reg10 <= ($signed($unsigned($unsigned($signed(wire6)))) ?
          wire3 : (&({wire9} ? $unsigned(wire8) : (~^$unsigned(wire1)))));
      reg11 <= wire8;
      reg12 <= $unsigned((-{(wire9[(3'h6):(2'h3)] <= ((7'h43) ?
              wire6 : wire1))}));
      reg13 <= (|(~^wire5));
    end
  assign wire14 = (|((&$signed($signed(reg10))) ?
                      ($signed($signed(reg12)) + (~^(wire2 << wire8))) : (wire8[(4'he):(3'h4)] <<< $signed((reg12 ?
                          wire5 : (8'hb1))))));
  assign wire15 = wire9;
  always
    @(posedge clk) begin
      reg16 <= wire4;
      reg17 <= (8'hb3);
      if ((8'hbc))
        begin
          reg18 <= $signed($signed($signed(($unsigned(wire0) * reg13[(4'hb):(3'h5)]))));
          if ((reg12 ?
              ({$signed($unsigned(wire5)),
                      {(~&wire2), (reg11 ? wire7 : (8'h9d))}} ?
                  $signed((8'hab)) : $unsigned(({wire9} - $unsigned(wire6)))) : wire0[(3'h6):(3'h6)]))
            begin
              reg19 <= ((|{$signed($signed(wire9))}) ?
                  $unsigned((wire4[(2'h2):(2'h2)] ?
                      (wire14[(2'h2):(1'h0)] ?
                          wire14 : reg16[(2'h3):(2'h2)]) : reg17)) : $signed(wire6));
              reg20 <= reg18;
              reg21 <= ({(((~^(8'hb5)) ^ (wire0 | reg17)) ?
                      wire3 : $unsigned(reg19))} || {$unsigned((wire1 ?
                      reg19 : (wire15 ? reg12 : reg10))),
                  (wire2 ^~ ((wire8 < wire5) || wire7))});
            end
          else
            begin
              reg19 <= reg10[(3'h5):(1'h1)];
              reg20 <= (((wire14[(2'h3):(1'h1)] <= wire0[(3'h6):(1'h0)]) ?
                      {(~&$unsigned(reg16))} : {(+reg12)}) ?
                  (8'hbe) : wire14[(3'h4):(1'h0)]);
              reg21 <= ((reg21[(4'ha):(2'h2)] ?
                      {{(wire1 ? wire15 : wire3)}} : reg10[(1'h1):(1'h0)]) ?
                  {$unsigned(reg17)} : ((wire2[(3'h4):(1'h1)] ?
                          (wire6 ?
                              ((8'hb6) ? reg19 : wire14) : (wire6 ?
                                  wire3 : reg19)) : (+reg12)) ?
                      $signed(($signed(reg19) ?
                          $unsigned(wire1) : $unsigned(wire9))) : $signed(((wire14 ?
                          wire4 : wire8) | (~&wire3)))));
              reg22 <= (|reg17);
            end
          reg23 <= $signed((wire15[(2'h2):(1'h1)] ?
              (8'ha6) : (^(((8'hba) ? reg20 : reg18) || reg16))));
          if (wire8)
            begin
              reg24 <= $unsigned($unsigned($unsigned(($unsigned(wire2) ?
                  (^wire6) : ((8'ha5) > (8'hb1))))));
              reg25 <= (({$signed((wire8 >> reg17)),
                          {(wire7 - reg22), (-reg23)}} ?
                      $signed($unsigned($signed(reg24))) : ({{reg23, reg23},
                          ((8'hb8) ?
                              reg19 : wire15)} != reg22[(1'h0):(1'h0)])) ?
                  reg10[(3'h6):(1'h0)] : (wire4[(2'h2):(1'h0)] * $signed((+(reg21 || wire6)))));
              reg26 <= wire5[(3'h6):(3'h6)];
            end
          else
            begin
              reg24 <= ((&($unsigned(reg16) ?
                  $signed((wire14 ? wire1 : wire7)) : ((wire2 ? reg12 : reg16) ?
                      (^reg13) : (wire8 == reg21)))) && wire2[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg18 <= ((!(&((^reg22) >> {(8'ha0),
              reg19}))) && {reg11[(2'h2):(1'h1)],
              (wire6[(3'h4):(3'h4)] ?
                  ((reg12 ? wire14 : reg26) >>> wire8) : reg24)});
          reg19 <= ({{$signed($unsigned(reg17))}} ?
              $unsigned(($signed(wire8) ?
                  (^$signed(reg20)) : $unsigned((wire5 ?
                      wire15 : wire8)))) : reg22);
          reg20 <= reg11;
          reg21 <= (&$signed({(((8'hba) * (8'h9f)) ~^ ((8'h9c) && (8'ha8)))}));
        end
      reg27 <= {reg23,
          (((7'h44) ?
              ((reg23 < reg12) >= (~wire4)) : ((^~reg12) & $unsigned(reg13))) * ($signed(wire6) ?
              reg25 : {{reg23, reg18}}))};
      if ($unsigned((~reg27[(2'h3):(1'h0)])))
        begin
          reg28 <= $unsigned($signed(reg26[(4'h9):(1'h1)]));
          reg29 <= $unsigned($unsigned({$signed(reg19[(5'h11):(4'hc)]),
              ($signed(reg13) ? (wire1 ? reg11 : reg27) : {reg17})}));
          reg30 <= wire8[(1'h0):(1'h0)];
          reg31 <= (-{$unsigned(wire1)});
          if ($unsigned(((wire1[(2'h2):(2'h2)] ?
              (+reg30) : reg18[(3'h4):(1'h0)]) != reg18[(3'h6):(3'h4)])))
            begin
              reg32 <= $signed((-reg22[(3'h6):(3'h5)]));
              reg33 <= (wire15 && $unsigned($unsigned({(reg20 ? wire2 : wire2),
                  (reg10 != (8'haa))})));
            end
          else
            begin
              reg32 <= $unsigned($signed($unsigned((wire9[(4'hf):(1'h1)] >= (8'hbf)))));
              reg33 <= (($unsigned(((&(8'h9f)) - reg16)) ?
                  ({$signed(wire15), (!wire2)} ?
                      reg16 : (reg22[(1'h1):(1'h0)] - (8'hba))) : $signed($signed(reg27))) <<< wire4[(2'h2):(1'h0)]);
              reg34 <= reg17;
            end
        end
      else
        begin
          reg28 <= (|(wire0[(5'h12):(3'h4)] >= $signed((~|(reg19 ?
              reg29 : reg28)))));
          reg29 <= $signed($unsigned((!{$signed(wire1), {(7'h42), reg33}})));
          reg30 <= (8'haf);
          if (reg28[(2'h3):(1'h0)])
            begin
              reg31 <= (((($signed(wire5) ? (~reg32) : (wire9 <<< (8'hae))) ?
                      reg18 : {(reg34 ?
                              reg27 : wire6)}) << ((+$signed(reg29)) == $unsigned((reg12 ?
                      reg32 : (8'h9f))))) ?
                  ($signed(((8'ha8) ?
                      reg16[(2'h2):(2'h2)] : $signed((8'haf)))) - (-(8'hb3))) : wire7);
              reg32 <= $unsigned($signed(wire3[(5'h11):(5'h11)]));
              reg33 <= $signed((^reg26));
              reg34 <= wire14;
            end
          else
            begin
              reg31 <= $unsigned(wire14);
            end
        end
    end
  module35 #() modinst89 (.wire37(wire2), .y(wire88), .clk(clk), .wire39(reg10), .wire36(reg11), .wire38(reg28), .wire40(wire9));
  assign wire90 = (~$unsigned(wire15[(4'hd):(3'h7)]));
  always
    @(posedge clk) begin
      reg91 <= (|reg12[(3'h7):(3'h4)]);
    end
  always
    @(posedge clk) begin
      reg92 <= $unsigned(reg10[(2'h3):(2'h2)]);
    end
  assign wire93 = reg28;
  assign wire94 = (+$unsigned($signed($unsigned((wire3 | (8'h9d))))));
  assign wire95 = wire14[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= wire9[(4'ha):(3'h5)];
    end
  assign wire97 = reg96;
  assign wire98 = reg11[(4'h9):(4'h8)];
endmodule

module module35  (y, clk, wire36, wire37, wire38, wire39, wire40);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire36;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire [(4'he):(1'h0)] wire38;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire73;
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire73,
                 reg81,
                 (1'h0)};
  assign wire41 = $signed(wire36);
  assign wire42 = $signed((((~|$signed(wire40)) ? (|$signed(wire41)) : wire37) ?
                      $signed($unsigned(wire41[(4'hc):(2'h3)])) : wire39));
  assign wire43 = (&wire40[(1'h1):(1'h0)]);
  assign wire44 = $unsigned((8'ha8));
  module45 #() modinst74 (wire73, clk, wire36, wire38, wire37, wire42, wire39);
  assign wire75 = ((+($signed(wire40[(1'h1):(1'h1)]) ?
                      (wire38[(4'hc):(1'h0)] >= ((8'h9f) ?
                          wire44 : wire38)) : {(|wire43)})) * (~($unsigned(wire43) ?
                      (-$signed(wire44)) : $signed($unsigned((8'hb4))))));
  assign wire76 = wire75;
  assign wire77 = {$unsigned(($signed((~wire44)) ?
                          ($unsigned(wire40) ?
                              $signed((7'h40)) : (8'ha9)) : $unsigned((^~wire40))))};
  assign wire78 = (8'hb4);
  assign wire79 = ($signed({wire39}) >= (~|wire73));
  assign wire80 = ($signed(($unsigned((~|wire39)) ?
                      $unsigned(wire43[(3'h6):(2'h2)]) : (wire40 <= (wire43 & wire42)))) >> (^wire75[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg81 <= (wire40 ?
          $signed($signed((wire41[(4'hc):(2'h2)] ?
              $unsigned((7'h42)) : $unsigned((8'hb8))))) : $unsigned($unsigned($signed(((7'h44) <= wire75)))));
    end
  assign wire82 = $signed($unsigned(($signed(wire79[(4'he):(3'h5)]) ?
                      (!$signed((8'h9d))) : ({wire80} < $unsigned((8'h9e))))));
  assign wire83 = wire76;
  assign wire84 = {(wire80[(3'h4):(1'h0)] ?
                          wire41[(3'h5):(1'h0)] : wire38[(4'ha):(3'h6)])};
  assign wire85 = wire42[(4'hd):(2'h2)];
  assign wire86 = ((({(~^wire85)} ?
                          $signed((wire73 ? wire79 : (8'h9c))) : (&(!wire37))) ?
                      (!(wire36[(2'h3):(1'h0)] != {(8'hbc),
                          wire39})) : ({wire41,
                          $unsigned(wire44)} & (wire78[(1'h1):(1'h0)] ^ wire44))) < ($signed(reg81) ?
                      ($unsigned($unsigned((8'h9e))) ?
                          $signed(wire83) : {{wire84}}) : wire36));
  assign wire87 = wire36;
endmodule

module module45
#(parameter param71 = (^(!({((8'ha7) ~^ (8'ha4))} * (&{(8'hb2), (8'hbe)})))), 
parameter param72 = ({{param71, (param71 ? (param71 <= param71) : {(8'h9e), param71})}} == (+{param71})))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire50;
  input wire signed [(4'h9):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire [(5'h13):(1'h0)] wire47;
  input wire signed [(2'h2):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire51;
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 reg52,
                 (1'h0)};
  assign wire51 = wire46;
  always
    @(posedge clk) begin
      reg52 <= wire49[(2'h3):(1'h1)];
    end
  assign wire53 = (~|($unsigned((^(wire49 ? wire47 : wire47))) ?
                      $signed(($signed(wire50) ?
                          (!wire50) : {reg52,
                              (8'hbd)})) : ($unsigned($unsigned(wire46)) ?
                          $signed($signed(wire51)) : wire51)));
  assign wire54 = wire46[(2'h2):(1'h1)];
  assign wire55 = $signed(((~&$unsigned(wire46[(1'h1):(1'h1)])) ~^ wire46[(1'h0):(1'h0)]));
  assign wire56 = $unsigned(wire51[(3'h5):(3'h4)]);
  assign wire57 = (~|wire56);
  assign wire58 = {(8'h9c)};
  assign wire59 = (+(^~$unsigned(($signed(wire49) < $signed(reg52)))));
  assign wire60 = $unsigned(wire58);
  assign wire61 = (wire47[(2'h3):(2'h2)] * (((~$unsigned(wire53)) ?
                          (|$unsigned(wire54)) : (8'hbc)) ?
                      ((&(wire50 != wire57)) ^ (8'hbb)) : (8'ha3)));
  assign wire62 = ($unsigned(wire53) ?
                      ({($signed(wire51) >> reg52)} ^~ $signed(wire57)) : $signed({wire58[(3'h4):(2'h2)],
                          wire58}));
  assign wire63 = $signed((!(&wire49[(2'h3):(2'h3)])));
  assign wire64 = $signed($unsigned((($signed(wire53) <= (wire53 ?
                          wire58 : wire46)) ?
                      $unsigned((wire46 < wire49)) : wire58)));
  assign wire65 = wire55;
  assign wire66 = $signed(wire47);
  assign wire67 = {($signed({$unsigned(wire55), $unsigned((8'had))}) ?
                          (^wire50) : (|($unsigned(wire47) ?
                              $unsigned((8'h9d)) : $signed(wire56))))};
  assign wire68 = $signed({$unsigned((-$unsigned((8'h9f)))),
                      $unsigned(wire54)});
  assign wire69 = {$unsigned($signed($unsigned($unsigned((7'h42)))))};
  assign wire70 = (~|{(wire67 == $signed((wire60 ? wire64 : wire47)))});
endmodule
