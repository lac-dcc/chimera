module top
#(parameter param101 = (((^~(^~{(8'hb8)})) ? (-(8'hb1)) : (~&(~((8'hbf) ^~ (8'hb7))))) == (({{(8'ha9)}, ((8'hb8) || (7'h41))} ? ({(8'hab), (8'hb1)} < (8'h9d)) : (^((8'ha3) == (8'hac)))) ? ({(+(7'h42)), {(8'hb0)}} >> (!((8'hb1) - (8'ha3)))) : (^((8'ha1) ? {(8'ha2)} : (-(8'h9c)))))), 
parameter param102 = ((~^(+{(~|param101), param101})) ? (|(~^(param101 ? (param101 ? param101 : param101) : (param101 < param101)))) : (^(8'ha2))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire5;
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire5,
                 (1'h0)};
  assign wire5 = (wire2[(2'h2):(1'h0)] << {(&$unsigned($signed(wire1))),
                     $unsigned(wire0[(3'h5):(1'h1)])});
  module6 #() modinst90 (wire89, clk, wire1, wire2, wire4, wire5);
  assign wire91 = $signed(wire4);
  assign wire92 = $unsigned((|wire89[(4'hc):(2'h2)]));
  assign wire93 = {$signed($unsigned(((8'ha8) >>> wire89[(4'h8):(4'h8)])))};
  assign wire94 = wire93;
  assign wire95 = (^~($unsigned((wire93[(4'hb):(1'h0)] ?
                          wire2[(4'hc):(3'h4)] : wire92[(2'h2):(2'h2)])) ?
                      ($unsigned(wire93[(5'h14):(5'h13)]) - (wire4[(3'h7):(1'h0)] << (wire94 ?
                          wire1 : wire2))) : wire89));
  assign wire96 = (((wire5[(2'h3):(2'h3)] ?
                              (wire4 ?
                                  $signed(wire93) : (wire91 >= (8'haf))) : $signed($unsigned((7'h41)))) ?
                          wire5[(1'h0):(1'h0)] : wire0) ?
                      wire94 : {{((wire93 ? wire89 : wire5) + $signed(wire93)),
                              wire91},
                          (~^(wire92[(1'h1):(1'h0)] != (wire1 ?
                              wire2 : (8'hb0))))});
  assign wire97 = ((~^$signed((wire91 ^~ (8'ha9)))) >= {wire94});
  assign wire98 = (^wire94);
  assign wire99 = (((+$signed($signed(wire0))) | $unsigned(wire2[(3'h5):(2'h2)])) == (wire98[(1'h0):(1'h0)] ?
                      $unsigned({$unsigned(wire94),
                          (8'ha6)}) : ($signed(((8'ha5) - (8'ha2))) >= $unsigned(((8'hb6) != wire93)))));
  assign wire100 = ((~&{{(wire4 >>> (8'ha4))},
                       (&(wire98 >>> wire98))}) > (!(wire89[(2'h3):(1'h0)] ?
                       ((wire93 ? wire99 : wire96) ?
                           wire4[(3'h5):(3'h5)] : wire92[(2'h3):(2'h2)]) : wire98)));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h209):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire41,
                 wire40,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 (1'h0)};
  assign wire11 = wire7;
  assign wire12 = ((wire10 ? (~&wire10[(1'h1):(1'h1)]) : $unsigned((8'hb0))) ?
                      $unsigned((wire8 ~^ (!(wire10 ?
                          wire10 : wire9)))) : wire11);
  assign wire13 = wire10;
  assign wire14 = (+(wire8[(2'h2):(1'h0)] ? {(8'hb2)} : $unsigned((~&wire11))));
  assign wire15 = wire11;
  always
    @(posedge clk) begin
      if ((($signed($unsigned((wire10 ?
              wire7 : wire10))) | $signed(wire12[(1'h0):(1'h0)])) ?
          ((^~{$unsigned(wire11)}) ?
              $signed({$signed(wire8),
                  wire8[(1'h1):(1'h0)]}) : $signed(((8'hb1) >= wire12[(3'h4):(2'h2)]))) : (wire12[(3'h7):(3'h6)] && wire13)))
        begin
          reg16 <= $signed(wire8);
          if (wire9[(3'h7):(2'h3)])
            begin
              reg17 <= wire14;
              reg18 <= $unsigned($signed($unsigned(((^reg16) ^ (~&wire9)))));
            end
          else
            begin
              reg17 <= (((($unsigned(wire10) <= (~|wire15)) ?
                          wire7 : $unsigned((~^wire13))) ?
                      (wire14[(4'ha):(4'h9)] ?
                          $signed(((8'ha7) >= reg17)) : ($signed(reg17) && wire11)) : wire10) ?
                  {wire8[(1'h1):(1'h1)]} : ((wire15 ?
                          (|(wire11 - reg18)) : $unsigned(wire15)) ?
                      $signed($unsigned(wire8[(4'h8):(3'h5)])) : (~&{wire9})));
              reg18 <= wire7;
            end
          reg19 <= $signed((&((((7'h41) - wire15) >= reg18) ?
              ((reg18 - wire10) ^ $unsigned(wire12)) : (~(reg17 <<< wire10)))));
          reg20 <= $unsigned($unsigned((((wire12 ?
              (8'had) : reg18) + $unsigned(wire15)) >= $signed(wire13[(4'ha):(2'h3)]))));
        end
      else
        begin
          if ((wire14 ?
              ((((wire13 ? (8'ha8) : wire8) << wire9) > {$unsigned((8'haa)),
                  (wire8 ?
                      wire15 : (8'ha4))}) ~^ $signed(wire8)) : ((($unsigned(wire10) < wire9) + ($signed(wire12) ?
                      (wire10 ? wire12 : wire14) : reg17[(2'h3):(2'h2)])) ?
                  $signed($signed(wire13[(4'hb):(2'h2)])) : ((^((8'ha7) >> wire14)) >> $unsigned(wire15[(3'h5):(3'h5)])))))
            begin
              reg16 <= {(+$signed((7'h41))), (wire15 - {(!(|reg18))})};
              reg17 <= ((~^(($unsigned(wire10) >> (~&(8'ha9))) ?
                  $unsigned($unsigned((8'hb5))) : $unsigned(reg19[(4'h8):(4'h8)]))) << $signed({$unsigned($unsigned(wire8)),
                  $signed(((7'h43) << wire8))}));
              reg18 <= (~|$signed(wire10[(2'h3):(1'h1)]));
              reg19 <= reg19[(1'h1):(1'h1)];
              reg20 <= $signed(wire8[(1'h1):(1'h0)]);
            end
          else
            begin
              reg16 <= $unsigned((8'ha5));
              reg17 <= reg19;
              reg18 <= {$unsigned($unsigned((reg17 && (-wire13))))};
            end
          reg21 <= $signed(((+(wire11[(2'h2):(1'h0)] || $unsigned(wire15))) ?
              ((^~((8'ha3) ? reg20 : (8'ha5))) ?
                  (^(8'h9d)) : {(7'h40)}) : (((reg17 ? wire15 : reg18) ?
                  $unsigned(wire13) : {wire13}) != {wire11, {wire11}})));
          reg22 <= {((((-(8'ha8)) ?
                  (+wire8) : (reg21 ?
                      wire14 : wire10)) + $unsigned(reg21[(5'h10):(4'hd)])) <<< {((reg17 ?
                          wire8 : wire13) ?
                      (wire15 ~^ reg19) : (wire9 ? wire13 : wire15)),
                  (reg21[(5'h10):(2'h2)] ?
                      (reg16 <= reg16) : (wire10 || wire7))}),
              ((({reg19, wire15} ?
                      $signed(wire8) : $signed(wire13)) << (^(reg17 ?
                      wire10 : wire11))) ?
                  (((^wire9) ? reg18[(3'h4):(3'h4)] : (~&reg20)) ?
                      wire14 : ((~(8'hba)) ?
                          (^~reg17) : {wire10,
                              wire7})) : (~^$signed((^wire14))))};
          reg23 <= ((reg17 == reg20) ?
              reg19 : (!$signed($unsigned($signed(wire10)))));
        end
      reg24 <= (~&wire7[(2'h3):(1'h0)]);
      reg25 <= $unsigned(reg22[(3'h4):(1'h0)]);
      reg26 <= (reg21 + $unsigned(wire11));
    end
  always
    @(posedge clk) begin
      reg27 <= {reg25[(1'h1):(1'h1)],
          $unsigned($unsigned(reg17[(2'h2):(1'h1)]))};
      reg28 <= (-{(^~{wire8[(3'h5):(3'h4)]}), wire9[(4'h9):(3'h6)]});
      reg29 <= (+($unsigned($unsigned((~|wire15))) ?
          ($signed((wire15 ? (8'ha0) : reg20)) ?
              $unsigned($unsigned(reg26)) : ((~|reg16) ?
                  (wire12 - wire15) : (wire15 + reg26))) : $unsigned((-$unsigned(wire15)))));
      if ({$unsigned(reg27[(4'h9):(3'h6)])})
        begin
          reg30 <= (reg24[(4'he):(3'h5)] ?
              (-$signed($signed($unsigned(wire9)))) : $signed(reg26[(3'h4):(2'h3)]));
          reg31 <= (reg21[(3'h6):(2'h2)] ? wire13 : reg28[(1'h1):(1'h1)]);
          if (((reg27[(4'hd):(2'h3)] <<< wire7[(1'h0):(1'h0)]) ?
              $unsigned($signed(reg23[(1'h1):(1'h1)])) : (~&(wire14 - wire9))))
            begin
              reg32 <= (wire11[(1'h1):(1'h0)] ?
                  ((~|(+(^~reg25))) ?
                      wire14 : (-({reg17, reg19} ?
                          (reg25 ^~ (8'h9d)) : $unsigned(reg16)))) : {reg22});
              reg33 <= ((^~wire13) <= reg27[(4'hd):(1'h0)]);
              reg34 <= ({$signed({$unsigned(reg22),
                      (reg32 ? wire13 : reg17)})} && reg17[(2'h2):(1'h0)]);
              reg35 <= (wire8[(2'h3):(2'h3)] * reg16[(4'hc):(2'h3)]);
            end
          else
            begin
              reg32 <= reg25;
            end
          if ($signed(wire11))
            begin
              reg36 <= ((reg29[(2'h3):(2'h2)] << {$unsigned({reg17}),
                  (~&{reg28})}) ~^ (^(8'ha1)));
              reg37 <= $signed({(reg19 >= $unsigned(wire8[(3'h4):(2'h2)]))});
            end
          else
            begin
              reg36 <= reg31[(2'h3):(2'h3)];
              reg37 <= ((~&$signed($unsigned((-reg29)))) << wire14);
              reg38 <= $signed(($signed(reg29[(4'ha):(4'h9)]) ?
                  wire10[(1'h0):(1'h0)] : wire12));
            end
          reg39 <= $signed(($signed({reg26[(2'h3):(1'h0)],
              (reg28 ? wire13 : reg34)}) - ($unsigned($unsigned(wire12)) ?
              (+$signed(reg30)) : ($signed(reg36) < ((8'hba) ~^ reg26)))));
        end
      else
        begin
          reg30 <= ((8'hbc) * reg39[(1'h0):(1'h0)]);
          reg31 <= $unsigned(((({reg34, reg16} ?
                  (~reg37) : ((8'ha4) ?
                      (8'had) : (8'hbe))) >= $unsigned((&reg32))) ?
              reg29[(4'hb):(4'ha)] : $signed($unsigned(reg27[(1'h0):(1'h0)]))));
          if ((~^(~$unsigned($signed((reg21 ^ wire12))))))
            begin
              reg32 <= wire14[(4'h9):(1'h0)];
              reg33 <= (((reg24 ?
                          $unsigned({reg34,
                              reg31}) : ($unsigned(reg25) + (8'haf))) ?
                      ($signed((8'hb5)) || $signed((^~wire14))) : ($unsigned((^(7'h43))) ?
                          $unsigned(reg22[(4'he):(4'he)]) : reg22[(5'h12):(5'h11)])) ?
                  ({{(wire7 || reg16)}} ?
                      reg24[(3'h5):(1'h1)] : {({reg25} ?
                              (reg28 ? reg36 : reg35) : (wire11 * wire12)),
                          (-reg24[(4'he):(3'h4)])}) : $unsigned(reg23));
              reg34 <= $signed(((($unsigned(reg33) < (reg35 ? reg33 : wire11)) ?
                      reg38 : $unsigned($signed(reg32))) ?
                  $unsigned(((wire9 ~^ wire10) ?
                      (wire14 ?
                          (8'ha0) : reg39) : (|(8'hb8)))) : $unsigned({$signed((8'h9e))})));
              reg35 <= $unsigned((((-(reg39 >> reg20)) ?
                  $signed((8'ha6)) : ((reg30 & reg39) ?
                      reg34 : (reg26 && reg37))) >> $signed(reg33)));
              reg36 <= {$unsigned(reg28), reg18[(2'h3):(2'h2)]};
            end
          else
            begin
              reg32 <= $unsigned(reg37);
              reg33 <= $signed($unsigned({reg22[(4'h9):(3'h7)],
                  reg39[(3'h5):(3'h5)]}));
              reg34 <= (8'ha0);
            end
          reg37 <= $signed((((8'ha4) ?
                  reg20 : ((wire13 ? (8'hbf) : wire8) < (reg30 ^~ reg25))) ?
              $unsigned(reg25[(3'h5):(1'h0)]) : {(reg22[(5'h11):(4'ha)] ?
                      (-reg17) : $signed(reg35)),
                  (8'ha2)}));
        end
    end
  assign wire40 = (-reg32);
  assign wire41 = reg35[(3'h5):(2'h3)];
  module42 #() modinst71 (wire70, clk, wire14, wire15, wire8, wire9, reg31);
  assign wire72 = $signed(wire14);
  assign wire73 = (~|($signed((~|(~&(8'h9c)))) ?
                      $signed(($signed(reg33) || $signed(reg21))) : $unsigned(reg22[(4'h9):(2'h3)])));
  assign wire74 = $signed(($signed((reg20 - (&(8'hbe)))) - $unsigned(((reg20 & reg17) ~^ $signed(wire9)))));
  assign wire75 = (-reg19[(1'h0):(1'h0)]);
  assign wire76 = $unsigned((&wire11[(1'h1):(1'h1)]));
  assign wire77 = (+$signed({(reg30 ? wire41 : (+(7'h44))), wire41}));
  assign wire78 = {reg35[(2'h2):(1'h0)], wire41};
  always
    @(posedge clk) begin
      reg79 <= (&(wire15 >> $signed($unsigned((reg28 ~^ wire75)))));
      if (reg30)
        begin
          reg80 <= $unsigned(({{(-reg25)}, reg16} ?
              reg21 : $signed((!(-reg17)))));
          reg81 <= $unsigned((~|(!$unsigned($unsigned(reg19)))));
          reg82 <= (8'h9e);
          reg83 <= wire14[(3'h7):(1'h0)];
        end
      else
        begin
          reg80 <= $unsigned((wire76 | $unsigned($unsigned($signed(reg80)))));
          reg81 <= (~((8'hb2) ? $unsigned(reg83) : reg34[(2'h2):(2'h2)]));
          reg82 <= ((~|$unsigned(($unsigned(reg20) & wire12))) ?
              ($signed((~(wire11 ?
                  reg24 : wire41))) ^ {$unsigned(reg23[(4'h9):(3'h7)]),
                  $signed((wire74 ^ wire78))}) : $signed(((~^wire41[(5'h11):(2'h3)]) >> $signed((reg17 ?
                  reg80 : reg80)))));
          reg83 <= (^~(reg20 | (8'ha3)));
        end
      reg84 <= (~|({wire7[(1'h1):(1'h1)]} && ((^~reg28[(3'h4):(1'h1)]) ?
          {(!reg33)} : $signed((wire10 << wire75)))));
      reg85 <= $signed(($unsigned(reg17[(3'h4):(1'h0)]) ?
          (~&{(^reg28), wire75[(4'hc):(4'hc)]}) : reg31));
      reg86 <= $unsigned((7'h44));
    end
  assign wire87 = (-wire73[(2'h2):(1'h0)]);
  assign wire88 = reg39;
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire47;
  input wire [(4'h8):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  input wire [(4'h8):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  assign y = {wire69,
                 wire60,
                 wire59,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire48 = $unsigned($unsigned($unsigned($unsigned($unsigned(wire44)))));
  assign wire49 = $unsigned({({(wire48 | (8'haa)), wire46[(1'h1):(1'h1)]} ?
                          (|(~|wire45)) : $unsigned(wire47[(4'ha):(3'h6)]))});
  assign wire50 = wire45[(4'h9):(2'h2)];
  assign wire51 = (({$signed((wire49 ? wire48 : wire48))} ?
                      wire44[(1'h1):(1'h1)] : $signed({(^~(8'hbf)),
                          wire45})) + wire45);
  assign wire52 = ((|(~^wire47[(1'h0):(1'h0)])) ?
                      wire50[(3'h4):(3'h4)] : (8'ha1));
  assign wire53 = wire43;
  assign wire54 = wire49;
  assign wire55 = (~({((~wire48) ? (~&(8'haf)) : $unsigned(wire50))} ?
                      wire51[(1'h0):(1'h0)] : {(^~(wire51 ?
                              (8'ha1) : wire51))}));
  always
    @(posedge clk) begin
      reg56 <= (($signed(($signed(wire49) >= {wire49})) & $unsigned(wire43[(1'h1):(1'h1)])) ?
          $unsigned((~|$unsigned($unsigned(wire54)))) : (~wire49));
      reg57 <= wire54[(4'hf):(1'h1)];
      reg58 <= (($unsigned((~wire55[(1'h0):(1'h0)])) ? wire52 : wire52) ?
          wire51 : wire52[(3'h7):(2'h2)]);
    end
  assign wire59 = wire45[(4'h8):(1'h1)];
  assign wire60 = ((((8'haf) * wire54) ?
                          (!wire53[(3'h5):(2'h2)]) : $unsigned(wire55[(1'h1):(1'h0)])) ?
                      (8'hb4) : reg56);
  always
    @(posedge clk) begin
      if (wire45)
        begin
          if (($signed($unsigned(($signed(wire52) ?
                  $signed(wire50) : (wire59 * reg57)))) ?
              ($unsigned(((~&wire59) ? $unsigned(wire54) : $signed(wire54))) ?
                  {(reg58[(1'h0):(1'h0)] < (reg56 - (7'h41)))} : (~^$unsigned(wire43))) : $unsigned(((((8'ha6) ?
                      wire53 : wire51) ?
                  wire51[(3'h4):(2'h3)] : $signed((7'h44))) * {(8'ha8),
                  (wire52 + wire59)}))))
            begin
              reg61 <= (^~$unsigned((wire49 ?
                  {(wire60 + wire52), (^~wire52)} : ({wire50,
                      wire59} ^ reg57[(4'hd):(2'h3)]))));
              reg62 <= $unsigned($unsigned({(8'haa),
                  $unsigned($unsigned(wire55))}));
              reg63 <= reg57;
            end
          else
            begin
              reg61 <= (($unsigned($unsigned((wire44 >> wire54))) ?
                      wire44 : wire43[(3'h6):(3'h4)]) ?
                  $unsigned((~(wire44[(1'h0):(1'h0)] ?
                      (wire53 >>> reg63) : $signed((8'ha6))))) : $signed((&wire44)));
              reg62 <= wire52;
              reg63 <= {$signed({$signed(reg58),
                      $unsigned(reg62[(4'hb):(4'h8)])})};
              reg64 <= ((-$unsigned(((!wire60) * reg58[(1'h0):(1'h0)]))) & $signed($signed(wire53)));
            end
        end
      else
        begin
          reg61 <= ($unsigned((wire59 + $signed((~(8'hab))))) ?
              wire52[(4'he):(4'h9)] : (-$unsigned($unsigned((wire47 > reg58)))));
          if ((^~($unsigned(((8'hbd) ?
              wire60[(2'h3):(2'h3)] : wire60)) >> reg57)))
            begin
              reg62 <= $signed(reg63[(4'ha):(2'h3)]);
              reg63 <= $unsigned(reg57);
            end
          else
            begin
              reg62 <= $unsigned($signed($unsigned({wire53[(3'h6):(3'h5)],
                  wire60[(4'he):(2'h2)]})));
              reg63 <= ((^wire48) <= ((^~((-wire50) * (reg57 ?
                  (7'h40) : wire44))) ^~ ({(-wire53)} ^ (wire43 ?
                  $unsigned(reg56) : $unsigned(reg62)))));
              reg64 <= $signed($unsigned((&$signed($signed(wire51)))));
            end
          reg65 <= wire49;
          if (wire54)
            begin
              reg66 <= (((wire54 == (reg56 ?
                      (~^wire46) : wire60[(4'hd):(3'h6)])) || wire46) ?
                  $unsigned(({{wire54, (8'ha7)}} ?
                      (wire44[(2'h3):(1'h1)] - {wire53,
                          reg56}) : (~&(+(8'ha5))))) : $signed($signed(reg58[(2'h2):(2'h2)])));
            end
          else
            begin
              reg66 <= ((~^(!(^~$signed((8'haf))))) - (&wire48));
            end
        end
      reg67 <= {reg58, {reg62, reg56[(2'h2):(1'h0)]}};
      reg68 <= {wire50[(1'h1):(1'h0)]};
    end
  assign wire69 = $unsigned(wire54);
endmodule
