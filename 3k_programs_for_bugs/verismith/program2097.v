module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire193;
  wire [(3'h4):(1'h0)] wire192;
  wire signed [(4'hc):(1'h0)] wire191;
  wire [(4'hf):(1'h0)] wire190;
  wire signed [(5'h13):(1'h0)] wire189;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire187;
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire55,
                 wire59,
                 wire60,
                 wire74,
                 wire187,
                 reg57,
                 reg58,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 (1'h0)};
  module5 #() modinst56 (.wire9(wire2), .y(wire55), .wire6(wire1), .wire8(wire0), .wire7(wire4), .clk(clk));
  always
    @(posedge clk) begin
      reg57 <= $unsigned(($unsigned($signed((-wire0))) || wire55[(4'ha):(1'h1)]));
      reg58 <= ({wire3,
          wire1[(3'h4):(1'h1)]} < (wire0[(5'h12):(4'ha)] >>> wire55));
    end
  assign wire59 = $unsigned((-{wire2[(5'h12):(1'h0)],
                      $unsigned($unsigned(wire1))}));
  assign wire60 = wire59;
  always
    @(posedge clk) begin
      reg61 <= $signed(($signed($unsigned(wire3)) < ((&wire1) * (^~$signed((8'ha5))))));
      reg62 <= (^$signed($unsigned(($unsigned(reg61) ?
          (wire59 ? wire2 : wire1) : wire0))));
      reg63 <= (|(8'hb6));
      if ($unsigned(reg62))
        begin
          reg64 <= {{($unsigned(((8'hb1) >> wire3)) ? wire0 : wire4),
                  (wire4 ? (^reg57) : $unsigned((wire2 ? wire60 : reg61)))}};
          reg65 <= reg62;
          if ($signed($unsigned((((wire55 != reg61) ? $signed(reg63) : wire59) ?
              $unsigned((reg63 != wire2)) : ($unsigned(reg64) | wire3[(3'h6):(2'h2)])))))
            begin
              reg66 <= (~reg61);
              reg67 <= $signed($signed(wire55[(4'h9):(3'h6)]));
              reg68 <= reg57[(3'h4):(2'h3)];
            end
          else
            begin
              reg66 <= (^(~wire1));
              reg67 <= $signed($signed(wire0[(4'h9):(1'h0)]));
              reg68 <= ({$signed($unsigned($unsigned(reg68))),
                  $unsigned(reg67)} | (+(~^{$signed((8'hb3))})));
            end
          if (((({reg67[(1'h1):(1'h0)]} ?
                  $signed((wire4 > wire59)) : {(~(8'ha3))}) ?
              reg66[(4'hd):(4'hd)] : ({(wire3 ~^ wire59)} != ((wire59 != reg57) == (reg65 ?
                  wire4 : (8'hb3))))) >> ({(~|$signed(wire0)),
                  $unsigned((reg58 ? wire0 : reg66))} ?
              {((reg57 ? reg57 : reg64) ? wire0 : reg67),
                  wire2[(5'h10):(1'h1)]} : ($signed(reg61) * ((wire59 ?
                  wire60 : wire4) >= {(8'ha0), wire0})))))
            begin
              reg69 <= (-{(wire1 ?
                      (&reg57) : ($unsigned(wire59) >= $signed((8'hb2)))),
                  $unsigned($signed(wire60[(5'h12):(5'h10)]))});
              reg70 <= $unsigned($unsigned({((reg61 <= (8'ha0)) <= wire59[(5'h13):(4'hb)])}));
            end
          else
            begin
              reg69 <= $signed(wire2);
              reg70 <= (((reg63 ?
                      (reg67 | $unsigned(wire0)) : ($signed(reg58) ?
                          reg69[(1'h0):(1'h0)] : (wire59 != wire55))) ?
                  $unsigned(wire1) : (~^{(~|reg57)})) << (-wire3));
              reg71 <= reg61;
            end
          reg72 <= $unsigned({(-((8'ha5) ?
                  {reg70, wire55} : $unsigned(wire60)))});
        end
      else
        begin
          reg64 <= (({reg66} ?
                  {$signed({reg58})} : ($signed((reg62 ? reg66 : reg70)) ?
                      ({(8'ha1),
                          (8'hb9)} * reg68[(4'h9):(1'h0)]) : {$unsigned(wire1),
                          ((8'ha2) << reg64)})) ?
              $unsigned(reg65[(4'hf):(4'h9)]) : wire4[(1'h0):(1'h0)]);
          reg65 <= (&{((|$signed(reg65)) ?
                  ((reg64 | wire0) ?
                      $unsigned(wire3) : wire2[(4'h8):(2'h2)]) : $unsigned($unsigned(wire55))),
              (($signed(wire2) ? (|reg67) : (reg71 ? reg67 : reg71)) ?
                  $signed((~&reg70)) : (wire2 ?
                      (wire55 ? wire60 : (8'hbe)) : (reg67 * reg58)))});
          reg66 <= (~wire59);
          reg67 <= (wire3 ?
              (wire3 - (^{{reg61}, $unsigned((8'hb7))})) : (~^(reg66 ?
                  ((wire4 != reg64) >>> $signed(wire0)) : $signed(reg71))));
          reg68 <= (($unsigned((reg70 != $unsigned(reg69))) != $signed(reg70)) ?
              (|$signed(((wire55 >> reg70) ?
                  wire59 : (~&reg62)))) : reg61[(1'h1):(1'h0)]);
        end
      reg73 <= reg62;
    end
  assign wire74 = $unsigned((reg57[(3'h4):(2'h2)] ^ $unsigned(reg67)));
  module75 #() modinst188 (wire187, clk, reg58, reg67, reg65, wire0);
  assign wire189 = ((wire2[(4'h8):(1'h0)] ?
                       wire60[(4'he):(4'hd)] : ((&reg66[(4'hb):(1'h0)]) ?
                           reg68[(1'h1):(1'h1)] : ((wire3 * reg73) && $unsigned(wire55)))) + reg70);
  assign wire190 = reg70;
  assign wire191 = $signed(wire187[(2'h2):(1'h0)]);
  assign wire192 = (wire2[(4'hb):(3'h5)] ?
                       reg64 : (reg57 ?
                           reg63[(4'hb):(3'h5)] : $signed(reg68[(1'h1):(1'h0)])));
  assign wire193 = {wire55, (^~(wire187 << (+wire1[(3'h4):(3'h4)])))};
  assign wire194 = (reg72[(2'h2):(1'h1)] ?
                       ((&(-(~&wire74))) ?
                           (~$signed((reg58 ?
                               reg62 : wire59))) : (~^wire0[(5'h13):(3'h5)])) : $signed($unsigned({(^wire55)})));
  assign wire195 = (~|$unsigned(($unsigned(reg63) != wire0)));
endmodule

module module75
#(parameter param186 = (((~^({(8'ha4), (8'hb8)} << {(8'hab), (8'hba)})) ? ((((8'hbe) ? (8'hbe) : (8'hb9)) ? (-(8'hb9)) : ((8'hb8) ^ (8'hbd))) + ((~|(7'h42)) && (&(7'h41)))) : ((&{(8'hb0), (8'ha7)}) >= ((^~(8'hb3)) ? (^~(8'ha6)) : ((8'had) - (8'hb7))))) ? (&{(((8'hbb) ? (8'h9f) : (8'h9d)) + ((8'ha9) ? (8'hba) : (8'hb0)))}) : ((^(((7'h44) ~^ (8'ha2)) <= (!(8'h9d)))) ? ((&((8'ha5) + (8'ha4))) ? (((8'ha3) >= (8'hab)) == ((8'hb2) ? (8'hb6) : (7'h42))) : {(|(8'h9c)), (&(8'hba))}) : (((8'h9d) ? {(8'hbc), (8'hb2)} : ((7'h43) ? (8'ha0) : (8'hbd))) ? ({(8'hae)} ~^ (~|(8'hb7))) : (((8'ha6) ^~ (8'h9f)) ? {(8'hb6)} : (~|(8'ha4)))))))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h260):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire79;
  input wire [(3'h5):(1'h0)] wire78;
  input wire signed [(3'h5):(1'h0)] wire77;
  input wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire185;
  wire [(4'h8):(1'h0)] wire184;
  wire signed [(3'h5):(1'h0)] wire183;
  wire signed [(5'h10):(1'h0)] wire182;
  wire signed [(5'h11):(1'h0)] wire181;
  wire signed [(3'h6):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire179;
  wire [(4'hb):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire176;
  wire [(4'hd):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire86;
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire176,
                 wire125,
                 wire124,
                 wire123,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire86,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed($unsigned(($unsigned((wire76 ?
          wire79 : wire76)) >>> (8'hb7)))))
        begin
          reg80 <= ((~(^~(+$signed(wire77)))) && ((($unsigned(wire77) > (wire77 ?
              (8'ha1) : wire76)) + $unsigned(wire78)) >= (+(+(wire76 && (8'h9c))))));
        end
      else
        begin
          if ($unsigned(({wire79, $signed((!wire76))} < reg80)))
            begin
              reg80 <= (wire78[(3'h5):(2'h3)] ? wire76 : reg80[(1'h1):(1'h0)]);
              reg81 <= (~^((~$unsigned($unsigned((8'hbe)))) | (+wire78[(3'h5):(3'h4)])));
            end
          else
            begin
              reg80 <= $signed((reg81 ? $unsigned({(8'ha9)}) : (8'hba)));
            end
          reg82 <= (^~(|$unsigned(($signed(reg81) ?
              wire79 : (reg80 ? wire77 : reg81)))));
        end
      reg83 <= ($unsigned({reg80[(2'h3):(2'h2)]}) * $unsigned(($signed($signed(wire76)) != reg80[(1'h1):(1'h1)])));
      if ((8'ha6))
        begin
          reg84 <= wire78[(1'h0):(1'h0)];
        end
      else
        begin
          reg84 <= {(~|{$signed((wire76 ? wire79 : reg80))})};
        end
      reg85 <= ({reg80[(3'h5):(3'h4)]} ?
          (^$signed($signed(reg82[(3'h4):(1'h0)]))) : ({{((7'h42) >> reg83)},
                  (^~$unsigned(wire76))} ?
              (~&reg84[(3'h5):(1'h1)]) : reg81));
    end
  assign wire86 = (($signed((reg83 ? (-reg81) : reg80)) ?
                          $signed(((^~wire79) & (&wire79))) : (!(^~(8'had)))) ?
                      $unsigned(((reg82[(4'hf):(3'h5)] ?
                              $signed(reg82) : wire76[(1'h1):(1'h0)]) ?
                          wire76 : reg82[(1'h1):(1'h0)])) : ((~((reg81 << wire76) ?
                              $signed((8'hb5)) : (reg83 <= reg81))) ?
                          reg85[(2'h3):(1'h1)] : ($unsigned($unsigned(reg83)) ~^ $unsigned($signed(reg84)))));
  always
    @(posedge clk) begin
      reg87 <= (-$unsigned(reg83[(4'hd):(3'h4)]));
      reg88 <= $unsigned($signed((reg80 == wire76)));
      reg89 <= $unsigned($signed($unsigned((8'ha8))));
      if ($unsigned($signed($signed($unsigned(((8'ha2) ? reg84 : (7'h44)))))))
        begin
          reg90 <= (-wire86[(3'h6):(3'h6)]);
          reg91 <= $unsigned($unsigned(({(!reg82)} == ($unsigned(reg83) > wire77[(2'h2):(1'h1)]))));
          reg92 <= $signed((|$signed((-reg85[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg90 <= wire79;
          reg91 <= (wire79 && $unsigned((^~$signed((reg88 ?
              wire78 : (8'hb1))))));
          reg92 <= (|$unsigned($signed((!{reg84, reg81}))));
        end
      reg93 <= $unsigned((!$signed(reg90)));
    end
  assign wire94 = (reg83 ? reg83 : (&{$unsigned((reg92 ^ reg91))}));
  assign wire95 = $signed($unsigned($signed($signed((wire76 < wire78)))));
  assign wire96 = {reg84[(1'h1):(1'h1)]};
  assign wire97 = (reg89[(4'h9):(1'h0)] ?
                      $signed(((8'ha9) ?
                          {{wire78, wire95},
                              wire79[(1'h1):(1'h0)]} : reg87)) : {reg84,
                          (({reg90,
                              wire96} ^ $unsigned(reg82)) || reg80[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg98 <= ({$unsigned(((wire76 ? wire96 : reg92) ?
              (~^reg82) : reg82[(4'h9):(2'h2)]))} > wire77);
    end
  always
    @(posedge clk) begin
      if (reg90)
        begin
          reg99 <= $signed($signed({$unsigned($signed(reg93))}));
          reg100 <= {$signed((~|((^~reg98) ?
                  $signed(reg80) : (reg90 ? reg91 : wire97)))),
              $unsigned(($signed(reg83[(4'hf):(4'h9)]) ?
                  (reg80 ?
                      {(8'hbf)} : reg98[(3'h6):(1'h1)]) : ($signed(wire95) ?
                      (^~wire78) : $unsigned(reg87))))};
        end
      else
        begin
          reg99 <= ($signed(reg81) & $signed(reg100));
          reg100 <= $signed($signed(wire97[(4'ha):(4'ha)]));
          reg101 <= (8'ha5);
        end
      reg102 <= $unsigned({(+(~&wire78)), $unsigned($signed({reg84}))});
      if (wire96[(1'h1):(1'h0)])
        begin
          reg103 <= wire95;
        end
      else
        begin
          if ((!(|(&$unsigned({reg87, wire86})))))
            begin
              reg103 <= wire95[(3'h4):(3'h4)];
              reg104 <= $signed({wire77[(2'h3):(2'h3)]});
              reg105 <= $signed({(~&reg87[(4'h8):(2'h2)])});
              reg106 <= reg83;
              reg107 <= {(^reg100[(3'h5):(3'h4)])};
            end
          else
            begin
              reg103 <= $unsigned($unsigned($signed((wire86[(2'h3):(2'h3)] ?
                  $unsigned(reg82) : (^reg89)))));
            end
        end
      reg108 <= wire79[(3'h4):(1'h0)];
      reg109 <= $unsigned($signed(wire79[(4'hd):(2'h3)]));
    end
  always
    @(posedge clk) begin
      reg110 <= (reg85 ?
          $unsigned(((^reg108) ?
              $unsigned(wire94) : wire94[(4'hc):(4'hc)])) : ($signed({reg85}) || $unsigned($unsigned(reg83[(5'h10):(4'hb)]))));
      reg111 <= {$unsigned(wire76[(2'h3):(1'h0)]),
          $signed(reg106[(2'h3):(1'h0)])};
      if ($unsigned((^~(!(((8'ha4) ? reg92 : wire79) | {reg108, reg103})))))
        begin
          reg112 <= (|$signed(wire76));
          reg113 <= reg105[(3'h6):(3'h4)];
          reg114 <= (((wire86[(3'h7):(3'h7)] ?
                  (^~((8'haa) | reg80)) : (!(reg101 ? reg113 : (8'ha6)))) ?
              reg88[(5'h12):(4'h9)] : $signed(reg98)) >>> reg93);
          if (reg101[(4'h8):(2'h3)])
            begin
              reg115 <= reg80;
              reg116 <= (8'hbc);
              reg117 <= $signed($unsigned((8'ha6)));
              reg118 <= $unsigned(reg92);
            end
          else
            begin
              reg115 <= (((+$unsigned(reg111[(4'h8):(2'h3)])) ?
                  (((+wire77) <<< (wire77 ?
                      reg82 : reg114)) && (8'hbc)) : (~^({wire94} ?
                      reg118 : reg107))) | {{(|reg107[(1'h1):(1'h1)])}});
              reg116 <= ((&$unsigned($signed((!reg83)))) ?
                  $unsigned(($signed((reg100 - reg98)) ^~ {$signed((8'hb1)),
                      $unsigned((8'hb6))})) : $unsigned($signed((-(reg111 + reg113)))));
              reg117 <= $unsigned((reg117 ?
                  (reg82 ?
                      ((reg116 >= wire76) << $unsigned(wire95)) : (-$unsigned(reg82))) : (&(|reg88[(4'hd):(3'h4)]))));
              reg118 <= $unsigned(({((!reg116) ? wire97 : $unsigned(reg90)),
                      reg87[(1'h0):(1'h0)]} ?
                  reg88 : $signed(wire77)));
            end
          reg119 <= $unsigned((~^((~&(~reg115)) + $signed(((8'ha5) ?
              reg107 : reg113)))));
        end
      else
        begin
          reg112 <= reg104[(2'h3):(2'h2)];
          reg113 <= $unsigned({wire76[(4'h9):(2'h2)]});
          reg114 <= {((~|$unsigned((8'h9e))) & $signed((reg110[(3'h7):(1'h0)] <<< (8'hbf))))};
          if (reg89)
            begin
              reg115 <= (+{(reg81[(1'h0):(1'h0)] ?
                      $unsigned((~(8'h9f))) : ((~&(8'hac)) ?
                          $signed((8'hb4)) : $signed(wire95)))});
              reg116 <= (~((({reg110, reg88} ^ reg115) ?
                      {(~|reg110), {reg118, wire97}} : (8'ha1)) ?
                  $unsigned((~&(!reg84))) : ($signed((-reg93)) != $unsigned((wire97 - reg87)))));
            end
          else
            begin
              reg115 <= {$signed($signed(reg100))};
              reg116 <= {reg81[(1'h0):(1'h0)], wire94[(3'h7):(2'h2)]};
              reg117 <= (wire96[(4'h9):(3'h6)] != (~$unsigned((8'hae))));
            end
          if ((|($unsigned(((^reg98) || (|reg85))) ?
              $unsigned(((~|reg111) ?
                  reg92 : $unsigned((8'ha2)))) : $signed(reg80[(1'h1):(1'h1)]))))
            begin
              reg118 <= {(({$signed(wire97), {reg82}} ?
                      (7'h43) : $unsigned($signed(reg118))) && $signed(wire97[(1'h0):(1'h0)])),
                  reg99[(3'h6):(3'h5)]};
              reg119 <= ($unsigned(reg93[(3'h7):(3'h6)]) <<< wire95[(2'h3):(1'h1)]);
              reg120 <= reg93[(2'h2):(2'h2)];
            end
          else
            begin
              reg118 <= (reg104 < {reg93,
                  (|((reg105 ^ reg107) ? (&reg82) : $signed(reg118)))});
              reg119 <= ((8'haf) <<< (~|({(reg98 ? wire79 : reg120), reg92} ?
                  reg102[(4'hc):(4'ha)] : reg106[(2'h3):(2'h2)])));
              reg120 <= (~|$signed({wire96,
                  (reg109[(3'h4):(2'h3)] ?
                      $unsigned(reg82) : $signed(reg114))}));
              reg121 <= (+(|reg112[(1'h0):(1'h0)]));
            end
        end
      reg122 <= reg116;
    end
  assign wire123 = (reg110[(1'h1):(1'h0)] ? reg118 : (!((8'hbd) <= (^reg112))));
  assign wire124 = reg81[(1'h0):(1'h0)];
  assign wire125 = wire123[(4'h9):(2'h2)];
  module126 #() modinst177 (wire176, clk, wire96, reg89, reg98, wire79);
  assign wire178 = reg87[(3'h7):(2'h3)];
  assign wire179 = (($signed($unsigned($unsigned((8'ha2)))) ?
                           (wire79[(3'h5):(2'h3)] < ((reg89 ? (8'haa) : reg88) ?
                               reg121 : $unsigned(reg91))) : $unsigned($unsigned((^wire79)))) ?
                       {$unsigned(($unsigned(reg84) ?
                               reg101 : (reg121 * wire76))),
                           wire77[(1'h1):(1'h1)]} : wire76);
  assign wire180 = reg89;
  assign wire181 = (&reg85[(2'h3):(1'h1)]);
  assign wire182 = ((~{wire77,
                       reg112[(2'h2):(2'h2)]}) >>> ((&wire180[(1'h0):(1'h0)]) ?
                       (^~reg115) : ($signed((^~(8'ha0))) || {reg83})));
  assign wire183 = $signed($unsigned(reg90[(5'h10):(4'he)]));
  assign wire184 = (^$signed({reg90, ($signed(reg106) && $signed(reg122))}));
  assign wire185 = {$unsigned($signed(($signed(reg115) ?
                           $signed(reg116) : (wire179 ^~ wire184)))),
                       $unsigned((($signed(reg107) ?
                           (reg87 ? reg114 : (8'ha3)) : reg116) != wire97))};
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire35;
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  module10 #() modinst36 (wire35, clk, wire8, wire7, wire9, wire6);
  assign wire37 = ($unsigned($signed($unsigned((wire9 | (8'h9e))))) ^~ (~|wire35[(3'h4):(1'h1)]));
  assign wire38 = (-$unsigned($signed($signed(wire37[(1'h1):(1'h1)]))));
  assign wire39 = $unsigned(wire38);
  assign wire40 = {$unsigned(wire6[(4'h8):(1'h1)]),
                      (^$signed($signed(((8'ha8) + wire37))))};
  always
    @(posedge clk) begin
      reg41 <= wire35;
    end
  always
    @(posedge clk) begin
      if ((^~wire9[(4'h9):(1'h0)]))
        begin
          reg42 <= wire35[(4'hc):(4'hc)];
          reg43 <= ({$unsigned((!(8'hb8)))} ?
              $signed(wire35[(4'h8):(3'h4)]) : (!({(&wire37), (-(8'hb5))} ?
                  (wire35[(4'he):(1'h1)] ?
                      wire6[(4'h8):(1'h0)] : $signed(wire9)) : wire35)));
          reg44 <= wire8[(4'h9):(1'h0)];
        end
      else
        begin
          if (((8'h9f) << {$unsigned($unsigned($signed(wire35)))}))
            begin
              reg42 <= ($signed(wire37[(2'h2):(1'h1)]) ?
                  (~&$unsigned(((wire6 ? wire6 : wire9) ?
                      wire35[(3'h5):(3'h4)] : (|reg43)))) : ($unsigned(($unsigned(reg42) ?
                      (~reg42) : wire40)) ^ reg44[(4'ha):(4'h8)]));
              reg43 <= $signed((((~&(wire9 ? reg41 : wire8)) ?
                      (~&(wire37 | reg43)) : {(wire39 & wire8)}) ?
                  ($signed($unsigned(wire37)) >>> reg42) : {$signed(((8'hb3) ?
                          (8'hbb) : wire35)),
                      (8'ha6)}));
              reg44 <= $signed((8'hb6));
              reg45 <= (^~reg41[(1'h0):(1'h0)]);
            end
          else
            begin
              reg42 <= $signed(wire35);
              reg43 <= (|(((^~(wire35 ? (8'hb8) : (8'hab))) >>> ((+wire6) ?
                      wire9[(4'h8):(3'h4)] : $unsigned(reg44))) ?
                  (((reg41 ^ (8'h9e)) ?
                          (wire35 ? (8'hbd) : reg45) : {reg41, wire37}) ?
                      $unsigned((&wire39)) : $unsigned((~^wire6))) : wire7));
              reg44 <= $unsigned({(($unsigned(reg45) <<< (wire38 != wire8)) ?
                      wire35 : $unsigned(reg44))});
              reg45 <= $signed($signed(reg43));
            end
          reg46 <= (|(((!(8'ha0)) ?
              wire40[(1'h1):(1'h0)] : $unsigned($signed(wire35))) < $signed(reg41[(2'h2):(1'h0)])));
          if (((($signed($signed(wire6)) ?
              {$signed(wire39)} : $unsigned($signed(reg42))) >= ($signed((wire9 || wire6)) * wire38)) << reg43[(1'h0):(1'h0)]))
            begin
              reg47 <= $signed($unsigned($signed((-(reg42 < wire6)))));
              reg48 <= ((^$unsigned(wire35)) ?
                  $unsigned(({((8'hb6) ? (8'ha3) : wire37), $signed(wire6)} ?
                      $unsigned((reg44 ?
                          wire7 : wire35)) : reg44)) : wire8[(2'h3):(1'h1)]);
              reg49 <= (~&reg47[(5'h11):(1'h1)]);
              reg50 <= (reg45[(2'h2):(1'h1)] ? wire39 : reg42);
              reg51 <= ({$unsigned(reg45[(1'h1):(1'h0)]),
                      ($unsigned($unsigned((8'hb8))) ?
                          $unsigned((8'h9e)) : ((wire40 ? reg48 : wire8) ?
                              (&wire6) : wire40[(3'h7):(3'h7)]))} ?
                  wire39[(1'h0):(1'h0)] : (8'ha2));
            end
          else
            begin
              reg47 <= wire7[(2'h2):(1'h1)];
              reg48 <= (reg46 << reg44[(4'h8):(3'h5)]);
              reg49 <= wire7;
              reg50 <= ($unsigned($signed({{wire9}})) && (wire40 || reg49));
            end
          reg52 <= $signed($unsigned($unsigned((|reg48))));
        end
      reg53 <= (~|$unsigned(((8'hb5) ?
          (&(wire7 ? wire37 : reg46)) : $signed(reg51[(4'h8):(2'h3)]))));
      reg54 <= wire38;
    end
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg30,
                 (1'h0)};
  assign wire15 = $unsigned(wire12[(1'h0):(1'h0)]);
  assign wire16 = (!$signed(({(~|(7'h42)), $unsigned(wire12)} || ((+(8'haf)) ?
                      wire12 : (&wire13)))));
  assign wire17 = wire15[(3'h4):(2'h3)];
  assign wire18 = wire11[(3'h5):(2'h3)];
  assign wire19 = $signed((~($unsigned($signed((8'hb8))) ?
                      {(^~(8'ha6)),
                          $unsigned(wire18)} : wire16[(2'h2):(2'h2)])));
  assign wire20 = wire18;
  assign wire21 = $unsigned(($unsigned((~&(wire13 ~^ wire12))) == wire11[(4'h8):(2'h2)]));
  assign wire22 = wire20[(4'he):(4'hc)];
  assign wire23 = ((({(wire17 ? (7'h43) : wire22), $signed((7'h42))} ?
                              wire13 : {$signed(wire22),
                                  wire21[(4'ha):(4'ha)]}) ?
                          wire18[(1'h1):(1'h1)] : wire15) ?
                      $unsigned(wire21) : ($signed(wire11[(2'h2):(1'h1)]) ?
                          ((wire22[(4'h9):(3'h4)] ?
                              ((8'h9d) != wire19) : $signed(wire15)) != $signed((~|wire13))) : $unsigned(($unsigned(wire22) ^~ $signed(wire16)))));
  assign wire24 = {(((!(wire22 ? (8'hae) : wire18)) ?
                          $unsigned(wire18[(2'h3):(1'h1)]) : {((8'ha4) >>> wire23)}) || ($unsigned(wire12[(3'h6):(1'h1)]) ?
                          ($signed(wire19) ?
                              $unsigned(wire13) : wire13[(4'he):(3'h7)]) : wire13[(4'ha):(3'h7)])),
                      (wire17[(5'h10):(4'hd)] ?
                          (((+wire11) ^ {wire21}) < wire11[(3'h6):(3'h5)]) : (((wire20 ?
                              wire15 : wire20) - $unsigned(wire18)) ^~ (-(wire11 ?
                              wire13 : wire14))))};
  assign wire25 = ((wire19 ?
                      $unsigned($signed(((8'ha5) <= wire19))) : ((~(wire22 <<< (8'hb1))) <= wire15[(1'h0):(1'h0)])) != ($unsigned($signed($unsigned(wire24))) | (~&($signed((8'had)) >> (wire23 ?
                      wire11 : (8'hb7))))));
  assign wire26 = $unsigned($signed((((+wire22) ? (^~(8'hbf)) : wire13) ?
                      (~|(~wire15)) : ($unsigned(wire25) ?
                          $signed(wire19) : wire15[(1'h1):(1'h1)]))));
  assign wire27 = ($signed($unsigned($unsigned($signed(wire15)))) ^ $unsigned({wire18[(4'ha):(3'h6)],
                      wire16[(1'h1):(1'h1)]}));
  assign wire28 = wire23;
  assign wire29 = $unsigned(wire20[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg30 <= $unsigned($unsigned(wire17[(1'h1):(1'h0)]));
    end
  assign wire31 = {wire29, wire17};
  assign wire32 = $signed((wire31 + $signed(((!wire24) ?
                      (reg30 ^ wire16) : wire19[(2'h3):(2'h3)]))));
  assign wire33 = (&(wire25 ^~ $signed({$signed(wire15)})));
  assign wire34 = ($unsigned(wire26[(2'h2):(2'h2)]) != $unsigned((+wire27)));
endmodule

module module126
#(parameter param175 = (({{(^(8'hba)), ((8'hb8) >= (8'hb5))}, (~&(-(8'hac)))} ? ({(~^(8'hb7)), ((7'h43) ^~ (8'h9d))} ? (+((8'hbf) << (8'hab))) : (-((8'h9e) >= (8'hb0)))) : (((~^(8'ha0)) ? (+(7'h41)) : {(8'hb4), (8'hac)}) ? (((8'hb1) ? (8'hb9) : (8'ha7)) ? (&(7'h43)) : (-(8'hbd))) : (((8'hbb) & (8'ha7)) - {(8'ha9), (8'h9e)}))) ? {((((8'ha5) <= (8'ha5)) ? (~(8'ha3)) : (^(7'h44))) >= (~&(!(8'hb9)))), (!{(8'ha4)})} : {(((|(7'h41)) || {(8'ha2), (8'hb3)}) || ((^~(8'hbd)) ? ((8'h9d) ? (8'h9d) : (8'h9f)) : (^~(8'hb0)))), ((&(^~(8'hb6))) ? (8'haa) : (8'ha6))}))
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h23c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire130;
  input wire signed [(4'he):(1'h0)] wire129;
  input wire signed [(4'he):(1'h0)] wire128;
  input wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire174;
  wire [(4'h9):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire168;
  wire signed [(4'hd):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire164;
  wire [(5'h11):(1'h0)] wire163;
  wire signed [(3'h6):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(5'h12):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  reg signed [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire138,
                 wire137,
                 wire132,
                 wire131,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire131 = wire127[(3'h4):(1'h0)];
  assign wire132 = (&wire130[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg133 <= {$unsigned((wire132[(2'h3):(2'h2)] + wire130)),
          {$unsigned(((8'hb8) ? (wire129 ^ wire127) : $unsigned(wire131))),
              (((8'ha9) ? wire130 : (~&wire131)) ?
                  ((wire132 - wire131) ?
                      (~(8'hba)) : $unsigned(wire129)) : ($signed(wire130) ?
                      {wire127, wire128} : (+wire131)))}};
      reg134 <= wire132[(4'h9):(1'h0)];
      reg135 <= {((wire132 << $signed(reg133[(4'hc):(3'h6)])) ~^ $unsigned($unsigned($signed((8'ha7))))),
          ($signed(($unsigned(wire129) ?
              reg133[(1'h0):(1'h0)] : (wire132 * wire132))) ^~ $signed(wire130[(1'h0):(1'h0)]))};
      if ($signed(wire128))
        begin
          reg136 <= ($unsigned((!$signed({wire127, wire128}))) ?
              (wire128 + $unsigned(((&wire127) == (~&(8'ha3))))) : (!$signed(wire127[(4'ha):(3'h4)])));
        end
      else
        begin
          reg136 <= (-$unsigned($signed(reg134[(1'h0):(1'h0)])));
        end
    end
  assign wire137 = $signed(($signed(wire131[(1'h0):(1'h0)]) >> $unsigned(($signed(wire128) ?
                       $signed(wire127) : $unsigned(wire131)))));
  assign wire138 = ({reg136[(1'h0):(1'h0)]} ?
                       (|$unsigned(reg136)) : (+$unsigned((!$signed((8'had))))));
  always
    @(posedge clk) begin
      reg139 <= reg134;
      reg140 <= $unsigned(reg139[(3'h6):(2'h2)]);
      reg141 <= wire138;
      reg142 <= ((-{$unsigned((wire128 ? reg133 : wire127))}) ?
          reg139 : (reg140 ?
              wire132[(4'h8):(2'h3)] : ($signed($signed((8'hba))) + reg133[(1'h1):(1'h0)])));
      reg143 <= $signed(reg135);
    end
  always
    @(posedge clk) begin
      if (reg133[(5'h11):(1'h1)])
        begin
          if (reg140)
            begin
              reg144 <= {(($signed((wire138 | reg135)) ?
                          (wire132 || (reg141 >= reg133)) : ($unsigned(reg142) ?
                              (~|wire131) : (+reg140))) ?
                      reg139 : $unsigned($unsigned($unsigned(wire132)))),
                  ((~&(((8'hb9) ? wire128 : wire129) & (!(8'hb4)))) ?
                      $signed((wire129[(4'hd):(4'h8)] ?
                          (~&wire132) : (reg135 == reg140))) : wire129[(2'h2):(2'h2)])};
            end
          else
            begin
              reg144 <= ((wire137 <= wire132[(3'h6):(2'h3)]) ?
                  $signed((~&($unsigned(reg142) & wire127[(4'ha):(2'h2)]))) : reg144);
            end
          reg145 <= $signed($signed((~^$signed(((8'had) ? reg143 : wire128)))));
          reg146 <= reg139;
          if (($unsigned((^~(((8'h9d) && wire129) ~^ $unsigned(wire130)))) < ((|(^$unsigned(wire131))) ?
              {reg134} : (reg134 >>> $unsigned(wire130[(1'h1):(1'h1)])))))
            begin
              reg147 <= reg139;
            end
          else
            begin
              reg147 <= {wire130[(1'h0):(1'h0)]};
              reg148 <= (((~^((^~reg142) < reg133)) ?
                  reg144 : $signed((reg139 ?
                      reg134 : wire128[(3'h5):(2'h3)]))) >= ({$unsigned((reg142 + wire137)),
                  $signed(wire127)} < (&(~&$signed(wire131)))));
              reg149 <= reg143;
              reg150 <= (+$unsigned(($signed((wire127 ?
                  wire130 : wire137)) - reg142)));
            end
        end
      else
        begin
          reg144 <= wire138;
        end
      reg151 <= $unsigned(wire128[(3'h4):(2'h3)]);
      reg152 <= $unsigned($unsigned((~&$signed($signed(reg133)))));
      reg153 <= reg134[(1'h1):(1'h1)];
      if ($signed($signed(reg148)))
        begin
          reg154 <= $unsigned($unsigned($signed(reg147[(4'h9):(3'h7)])));
          reg155 <= ({((8'h9d) ?
                  ((reg143 <= reg153) ?
                      (reg154 != wire128) : (-wire131)) : wire132),
              (!((8'ha0) ?
                  (reg148 ?
                      (8'ha8) : wire128) : reg142[(4'hf):(1'h0)]))} ^ (-wire137));
        end
      else
        begin
          if (reg155)
            begin
              reg154 <= $signed($signed(reg141));
              reg155 <= ((+(&((reg136 < reg135) ?
                  (wire127 ~^ wire128) : reg142))) & (({(wire130 ?
                          reg142 : reg136)} << $signed($signed(wire131))) ?
                  reg142 : (8'hbb)));
              reg156 <= {($unsigned($unsigned(reg141[(3'h4):(2'h3)])) & reg142[(4'hd):(1'h0)])};
              reg157 <= ((reg134 & $unsigned((reg135 | $unsigned(reg149)))) ^~ (8'h9f));
            end
          else
            begin
              reg154 <= {reg141[(5'h11):(4'hf)],
                  (^~{wire130,
                      ($unsigned(wire138) ?
                          $unsigned(reg133) : (wire138 ? reg143 : wire130))})};
              reg155 <= reg149[(3'h5):(2'h2)];
            end
        end
    end
  assign wire158 = (^~((8'ha5) ?
                       $signed($unsigned((reg154 & wire130))) : (($unsigned(reg151) != $unsigned(reg134)) ?
                           $signed(reg151) : $unsigned($unsigned((8'hb6))))));
  assign wire159 = (+reg134[(3'h5):(1'h0)]);
  assign wire160 = $signed((|wire130));
  assign wire161 = (|reg154[(1'h1):(1'h0)]);
  assign wire162 = reg152;
  assign wire163 = {(~^wire137), $signed(reg151[(5'h10):(4'he)])};
  assign wire164 = (-$unsigned($unsigned(reg135[(1'h0):(1'h0)])));
  assign wire165 = wire138;
  assign wire166 = ($unsigned(reg135) < ($signed(reg151) && (($unsigned(reg142) ?
                       (~&(8'hb2)) : (reg149 != reg147)) | ((+(8'hbe)) ?
                       wire164[(3'h5):(2'h3)] : wire128[(3'h7):(3'h7)]))));
  assign wire167 = wire163[(3'h5):(3'h4)];
  assign wire168 = {((~(^~(reg146 ? reg149 : reg151))) ?
                           $unsigned(((wire132 | reg147) ?
                               {reg154,
                                   wire132} : reg134)) : (!((reg145 << reg142) ?
                               reg150 : wire161))),
                       (($signed((wire159 ? (8'had) : (8'hbd))) ?
                               $signed($unsigned(wire131)) : (^$unsigned(reg147))) ?
                           reg143 : {{$unsigned(reg152)},
                               {$unsigned(reg152)}})};
  always
    @(posedge clk) begin
      reg169 <= reg155[(4'h9):(4'h9)];
      reg170 <= (~^reg143);
      reg171 <= ((~(reg152 ?
          wire168 : (wire163 ? {reg150} : reg155))) ^~ $signed((wire129 ?
          ((^reg144) ? $unsigned(reg148) : $signed(reg144)) : wire129)));
      reg172 <= (wire166 ?
          {(~&$signed({(8'hb7)})),
              {wire166[(2'h3):(1'h0)], $unsigned({reg148})}} : ((8'ha8) ?
              {reg144,
                  ((wire166 ?
                      (7'h40) : wire164) && (~|wire128))} : (|$unsigned((8'hb8)))));
    end
  assign wire173 = (!reg153);
  assign wire174 = {$unsigned($signed($signed((reg146 && reg141))))};
endmodule
