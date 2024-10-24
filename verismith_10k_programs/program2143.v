module top
#(parameter param184 = {((~|(((8'hb0) || (8'hab)) || ((8'hb3) <= (8'ha5)))) ? (7'h41) : (~((8'haf) ? ((7'h43) ? (8'hba) : (8'ha1)) : (~&(8'hb4)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire183;
  wire [(2'h3):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire179;
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire179,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((($unsigned($unsigned((8'ha3))) ?
              (8'ha8) : ((wire0 ? (8'haa) : wire0) > wire2)) ^~ (((wire2 ?
                  wire3 : wire2) ?
              wire2 : (wire0 ? wire3 : wire2)) >> $signed((8'hb2)))) ?
          $signed($signed(((wire1 ? wire0 : wire2) >>> (wire0 ?
              wire3 : wire2)))) : (wire1[(3'h5):(3'h4)] - (~&wire0))))
        begin
          reg4 <= $unsigned($unsigned(((wire3[(3'h6):(2'h2)] ?
              wire3 : (~&wire0)) - wire0)));
          reg5 <= (8'hab);
          if ($unsigned(wire3[(1'h1):(1'h0)]))
            begin
              reg6 <= wire0[(1'h1):(1'h0)];
              reg7 <= $signed($unsigned($signed($unsigned($unsigned(reg4)))));
            end
          else
            begin
              reg6 <= ((({wire3[(3'h6):(3'h5)]} ^ ($unsigned(wire3) * {reg5})) & {$unsigned($unsigned(reg5))}) == (wire2[(4'h8):(4'h8)] > ((~^{wire1}) & ((^~reg4) ~^ (+reg7)))));
              reg7 <= $signed((reg6[(3'h6):(1'h0)] <<< (^~wire2[(3'h7):(3'h4)])));
            end
          if ($unsigned($signed($signed($signed($signed((8'ha7)))))))
            begin
              reg8 <= wire2;
              reg9 <= $signed($unsigned({{reg6, reg5[(4'h8):(1'h0)]},
                  $signed((reg7 ? reg8 : reg6))}));
            end
          else
            begin
              reg8 <= (~(+reg4));
              reg9 <= ($signed(reg9[(2'h3):(2'h3)]) ?
                  ((reg8 == $signed(wire0[(2'h3):(1'h1)])) - (!(-reg9))) : (7'h42));
            end
        end
      else
        begin
          reg4 <= (((wire0[(2'h2):(2'h2)] || wire1) ?
              (8'ha5) : (^$signed({reg8, wire0}))) <<< (~^(((reg7 >= reg5) ?
              (~(8'hbb)) : $unsigned(reg8)) | $signed(wire3[(3'h4):(3'h4)]))));
        end
      reg10 <= (~&reg7[(2'h2):(1'h0)]);
    end
  assign wire11 = reg5[(4'h9):(3'h4)];
  assign wire12 = (reg9[(2'h2):(1'h0)] - $unsigned({(-(!reg5))}));
  assign wire13 = {(8'haf),
                      ($signed(({wire2} != $unsigned(wire1))) << ($signed((reg4 | (8'hb4))) <= $signed((reg9 ?
                          reg6 : reg5))))};
  assign wire14 = wire11;
  assign wire15 = wire2[(1'h1):(1'h1)];
  assign wire16 = {wire11[(3'h7):(3'h5)],
                      (~^$signed(((wire15 <<< wire2) >>> (wire15 ?
                          wire2 : wire3))))};
  assign wire17 = (reg10[(4'hd):(1'h1)] ?
                      ((reg10 <<< ($unsigned((7'h42)) | (wire1 ?
                              reg6 : wire11))) ?
                          $unsigned(reg5) : ((~(8'haf)) & $unsigned({wire16}))) : ((+wire12[(4'ha):(3'h7)]) ?
                          $signed(((|wire15) >>> wire16[(3'h6):(3'h5)])) : $signed(reg5)));
  assign wire18 = wire11[(3'h4):(1'h1)];
  assign wire19 = wire18[(4'h9):(4'h9)];
  assign wire20 = wire11[(4'h9):(2'h2)];
  assign wire21 = wire13[(4'hd):(1'h0)];
  assign wire22 = wire15;
  assign wire23 = $unsigned($unsigned($unsigned(($unsigned(wire13) ?
                      {wire1, (8'ha1)} : $signed((8'had))))));
  assign wire24 = reg4;
  assign wire25 = $unsigned(wire20[(3'h6):(2'h2)]);
  module26 #() modinst180 (wire179, clk, wire18, reg4, reg10, wire12, wire0);
  assign wire181 = (&$signed($signed((reg9[(1'h0):(1'h0)] << (wire11 ?
                       (8'hb7) : (7'h42))))));
  assign wire182 = (~($signed(({wire14, wire13} && wire2)) ?
                       (wire13 ?
                           ($signed(wire3) >= wire20[(1'h1):(1'h1)]) : (~&wire24[(3'h4):(1'h1)])) : $unsigned($signed((~|wire0)))));
  assign wire183 = wire11[(2'h3):(1'h1)];
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h2b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire172;
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire174,
                 wire109,
                 wire98,
                 wire79,
                 wire56,
                 wire54,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire111,
                 wire172,
                 reg176,
                 reg175,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire32 = (~wire29);
  assign wire33 = (|{$unsigned(wire32), wire27[(2'h2):(1'h0)]});
  assign wire34 = (((~^(~^(wire28 ? (8'hbb) : wire27))) ?
                      ((8'hb7) == $unsigned({wire33})) : $unsigned((wire30 ?
                          wire33 : (wire29 >= (8'hb2))))) < wire27[(3'h6):(1'h1)]);
  assign wire35 = ($signed(($signed((wire27 ?
                      wire31 : wire31)) ~^ wire28)) != $unsigned(wire28));
  module36 #() modinst55 (wire54, clk, wire32, wire27, wire34, wire30);
  assign wire56 = {wire33[(1'h0):(1'h0)], (wire33[(3'h7):(3'h6)] ^ (8'hab))};
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire28)))
        begin
          reg57 <= (&($unsigned(wire33) ? (~^wire34) : wire56));
        end
      else
        begin
          reg57 <= $unsigned(({(!wire28[(1'h0):(1'h0)])} ?
              {$signed($signed((7'h43)))} : $unsigned($signed(wire35))));
          if (wire30[(4'hd):(3'h7)])
            begin
              reg58 <= $unsigned($signed(wire54[(4'ha):(3'h5)]));
              reg59 <= $signed($signed(((8'ha5) ?
                  $signed(((8'h9f) <<< (8'haa))) : (wire28[(1'h0):(1'h0)] ?
                      (wire33 & wire34) : (reg58 != reg57)))));
              reg60 <= wire27[(1'h0):(1'h0)];
              reg61 <= ($unsigned((wire35[(4'he):(4'hc)] ?
                      ({wire54,
                          wire27} >>> (wire35 <= wire56)) : $signed((^(7'h42))))) ?
                  $unsigned(wire29[(4'hd):(4'hd)]) : {{(wire54[(3'h7):(3'h6)] ?
                              (wire54 ? reg59 : reg60) : $unsigned(wire34))},
                      $unsigned((!reg58))});
              reg62 <= $signed($unsigned((wire35[(4'hc):(2'h2)] + $signed(wire35))));
            end
          else
            begin
              reg58 <= $unsigned($unsigned(((&(wire28 ?
                  wire31 : wire56)) <= reg60[(3'h6):(3'h4)])));
              reg59 <= (((!reg62) | (($signed(reg62) & {wire31}) && (&(wire56 <<< (7'h42))))) < ((8'ha5) >> wire35));
            end
          reg63 <= $unsigned($signed(wire54[(4'h9):(1'h1)]));
          reg64 <= $unsigned({(&wire28),
              (~&((reg58 ^ (8'had)) ? reg59[(2'h2):(2'h2)] : wire28))});
        end
      reg65 <= {wire30, reg61[(1'h1):(1'h0)]};
      if (reg57)
        begin
          reg66 <= (($signed((((8'hbe) << wire32) ~^ wire54)) | {(+reg57)}) && (reg59 + reg57));
          reg67 <= (7'h44);
          reg68 <= ($signed(wire34[(3'h7):(1'h0)]) ^ wire34);
          if ($signed(wire30[(1'h1):(1'h1)]))
            begin
              reg69 <= $signed((reg66[(4'hb):(3'h6)] || (~((reg66 ^~ reg58) ~^ (~reg67)))));
              reg70 <= {$signed(wire31),
                  {($unsigned($unsigned(wire28)) < (&(wire29 ? reg65 : reg64))),
                      reg59}};
            end
          else
            begin
              reg69 <= (reg70[(3'h6):(2'h3)] + $unsigned((~wire32)));
              reg70 <= wire27;
              reg71 <= (((&wire34[(3'h7):(2'h2)]) ^~ ($signed((reg70 ?
                      reg65 : wire27)) ?
                  (+{wire29}) : ((wire29 ? reg60 : reg67) ?
                      wire27 : $unsigned(reg57)))) ^ (+wire35[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          reg66 <= $signed($signed($unsigned($signed(((8'hb0) >>> reg70)))));
          if (wire33)
            begin
              reg67 <= {(((wire30[(1'h1):(1'h1)] ?
                      {reg64,
                          reg69} : $unsigned((8'hbc))) ^~ reg65[(1'h0):(1'h0)]) & (~^$unsigned((wire32 == wire34))))};
              reg68 <= (&((($signed(reg71) ?
                          $unsigned(wire28) : (wire56 ? wire28 : reg60)) ?
                      $signed(wire34[(1'h1):(1'h0)]) : ($unsigned(reg63) || reg58)) ?
                  ($signed(reg67) ?
                      reg58[(2'h2):(1'h0)] : (reg71 ?
                          $signed(reg68) : $signed(reg58))) : ($signed((wire34 ?
                      reg59 : wire34)) >= $unsigned($signed((8'hb8))))));
              reg69 <= {(((+wire35[(4'he):(4'h8)]) ?
                          $unsigned(wire34) : reg68) ?
                      $unsigned(wire35[(1'h0):(1'h0)]) : (&$signed({wire33}))),
                  $unsigned(($unsigned({reg70, reg64}) ?
                      wire33 : reg59[(1'h1):(1'h0)]))};
            end
          else
            begin
              reg67 <= (|reg68);
            end
          reg70 <= wire32[(2'h3):(2'h2)];
        end
      reg72 <= $signed($signed(reg69));
      if (wire27)
        begin
          reg73 <= $signed(wire34);
          reg74 <= $unsigned(({wire32[(4'ha):(4'ha)]} & ((wire31[(1'h1):(1'h0)] & wire56) > $unsigned((reg63 - wire32)))));
        end
      else
        begin
          if (($signed({$unsigned($signed(reg59))}) ?
              (&wire34[(3'h5):(2'h2)]) : $signed($unsigned($unsigned((~^reg66))))))
            begin
              reg73 <= $signed(wire35);
            end
          else
            begin
              reg73 <= reg65;
              reg74 <= ((($signed(reg67[(5'h13):(4'ha)]) && (&(^~reg68))) ?
                      ($signed((wire29 || wire29)) - {(reg62 ?
                              reg66 : reg63)}) : (7'h41)) ?
                  reg67[(4'h8):(2'h3)] : wire33);
              reg75 <= (~^{(|(reg58 >>> $unsigned(reg67)))});
            end
          reg76 <= (reg71 ? reg74[(2'h2):(1'h0)] : wire33);
          reg77 <= $signed(wire27);
          reg78 <= reg60;
        end
    end
  assign wire79 = ({{$signed((~|reg75)), (!reg75[(3'h5):(2'h2)])},
                      $signed($unsigned((|(8'hb1))))} && (8'hac));
  always
    @(posedge clk) begin
      if ((~^{($unsigned(wire79[(3'h4):(2'h2)]) ?
              $signed((reg66 > (7'h40))) : $unsigned($signed(reg67))),
          (8'hb7)}))
        begin
          reg80 <= reg71;
          reg81 <= $signed((((!{(8'ha1), reg80}) <= ($signed(reg67) <= {reg75,
                  reg71})) ?
              $unsigned((~&(7'h41))) : ((+reg75[(3'h4):(3'h4)]) > (wire30[(4'h8):(3'h5)] || {reg57}))));
          if (reg62[(5'h12):(1'h1)])
            begin
              reg82 <= $signed(((($signed(reg81) ~^ (wire56 != wire33)) >> wire79[(2'h3):(1'h0)]) || reg78));
              reg83 <= (+$signed($unsigned((8'ha9))));
            end
          else
            begin
              reg82 <= (|(wire35 ?
                  (^~(~reg62[(3'h5):(2'h2)])) : ({{reg64,
                          reg70}} << (wire79[(4'h9):(3'h7)] ?
                      $signed((8'ha9)) : $unsigned(wire27)))));
            end
          reg84 <= $unsigned(wire34[(5'h12):(3'h5)]);
          if ((8'ha1))
            begin
              reg85 <= wire34;
              reg86 <= {(|{((reg81 ? (8'ha7) : (8'hab)) < $signed(reg84))})};
              reg87 <= ((|(8'ha6)) ^~ ((&(-$signed(reg60))) ? reg70 : {reg82}));
              reg88 <= $unsigned((^~(((|reg66) << $unsigned(reg83)) <= reg70)));
              reg89 <= (^~wire31);
            end
          else
            begin
              reg85 <= (^$signed(((~|reg87) ?
                  wire56[(3'h4):(2'h3)] : (8'ha0))));
              reg86 <= $unsigned((-(^reg60)));
              reg87 <= reg64;
              reg88 <= $unsigned($signed($unsigned(((~&(7'h44)) ?
                  (wire30 <<< reg65) : $signed(reg88)))));
            end
        end
      else
        begin
          reg80 <= {(^reg86[(4'h9):(3'h6)]),
              ($unsigned((|$signed(reg69))) ?
                  (($signed(wire35) ? (^~reg88) : (wire32 ? reg89 : wire30)) ?
                      {{(8'haf), reg77}} : ((reg80 - wire33) ?
                          $unsigned(reg76) : $unsigned(reg87))) : reg74[(1'h1):(1'h1)])};
          reg81 <= $unsigned({wire33});
          reg82 <= ((~&reg59[(3'h7):(1'h1)]) ?
              (reg65 >= ((((8'ha0) ~^ reg85) >= ((8'hbf) ?
                  (8'ha3) : reg60)) == $signed($signed(wire54)))) : (~|(^$signed($unsigned(reg82)))));
          reg83 <= $signed({(^~(^~$signed(reg81))), wire30});
          reg84 <= $signed(wire34[(5'h10):(4'hf)]);
        end
      reg90 <= $signed((reg84[(2'h3):(1'h0)] ?
          ((~&(|wire27)) * reg59[(2'h2):(2'h2)]) : (+$unsigned(wire54[(1'h0):(1'h0)]))));
      if ($signed(reg63))
        begin
          reg91 <= {$unsigned(((reg67[(5'h14):(3'h7)] ?
                      (&reg80) : (reg89 ? reg81 : reg76)) ?
                  reg72 : $unsigned((|reg62)))),
              (8'hbd)};
          reg92 <= $signed({(reg68[(1'h0):(1'h0)] > ({reg77, (8'ha3)} ?
                  (reg71 ? reg82 : reg70) : {reg64, reg89})),
              (((reg62 * (7'h44)) ?
                      ((8'hb0) ? wire28 : reg60) : (wire30 ? reg89 : (8'h9c))) ?
                  $signed((~^wire54)) : wire32[(2'h3):(2'h3)])});
        end
      else
        begin
          reg91 <= ($signed(((reg64 >= reg75[(2'h2):(1'h0)]) & (|$signed((8'h9c))))) | ($unsigned(((reg58 ?
                      (8'hbe) : reg88) ?
                  (reg59 ? reg64 : wire29) : reg70[(1'h0):(1'h0)])) ?
              reg91[(4'h8):(2'h2)] : (^((^reg72) * $signed(reg74)))));
          if (wire30[(2'h3):(1'h0)])
            begin
              reg92 <= (~^reg64[(2'h2):(1'h1)]);
              reg93 <= reg61[(1'h1):(1'h1)];
              reg94 <= ({reg82} << {((~&(reg65 ?
                      reg71 : (8'ha0))) | wire27[(5'h13):(5'h10)])});
            end
          else
            begin
              reg92 <= wire31[(1'h1):(1'h1)];
            end
          reg95 <= wire34[(3'h7):(3'h4)];
        end
      reg96 <= ((((~^(reg84 != reg92)) ~^ (~(-reg64))) ?
          reg90 : reg75) || wire54);
      reg97 <= wire32[(4'ha):(4'h9)];
    end
  assign wire98 = (!reg68);
  module99 #() modinst110 (wire109, clk, reg61, reg76, reg57, reg68, wire30);
  assign wire111 = {$signed((($signed(reg78) ?
                               ((8'haa) == reg68) : $signed(reg88)) ?
                           reg74 : $signed(reg92[(4'h9):(1'h1)]))),
                       wire34};
  module112 #() modinst173 (.wire117(reg89), .wire114(reg80), .wire115(wire56), .wire116(reg97), .y(wire172), .wire113(reg96), .clk(clk));
  assign wire174 = {reg63[(4'hb):(4'ha)]};
  always
    @(posedge clk) begin
      reg175 <= $signed($signed((wire109 ?
          $unsigned(reg78[(2'h2):(1'h0)]) : (((8'haf) ?
              reg70 : wire174) | (-(8'haf))))));
      reg176 <= ((~reg65) ?
          (~&{((reg57 ? reg74 : reg69) ? {reg67, reg94} : reg95),
              (8'hae)}) : wire35[(4'ha):(2'h3)]);
    end
  assign wire177 = ({reg74} ? (~$signed($signed({(7'h42), reg89}))) : reg77);
  assign wire178 = ((((^~$unsigned(reg76)) - reg175) && reg96[(3'h6):(2'h3)]) ?
                       (($signed($signed(reg93)) ?
                               $unsigned($signed(reg84)) : (~|reg84[(1'h0):(1'h0)])) ?
                           {reg59[(1'h1):(1'h0)]} : reg87) : {$signed(($unsigned(wire79) ?
                               {(8'hb3)} : $unsigned(reg69)))});
endmodule

module module112
#(parameter param170 = ((((((8'hb2) ? (8'hb5) : (8'haa)) - ((8'hb2) > (8'hb4))) ? (+((8'hb0) * (8'h9c))) : ((~(8'had)) < ((7'h41) * (7'h44)))) ? (~&((-(8'hbc)) ? (8'h9f) : (-(8'ha1)))) : (({(8'hbc), (8'hae)} >> ((8'hbe) || (8'ha5))) >>> (|(&(8'hab))))) ? (~^((((8'hb2) ? (8'ha3) : (8'hbe)) ? ((8'hbf) ? (8'hab) : (8'hab)) : {(7'h43), (8'hb0)}) ? (((8'hbc) ? (8'hbd) : (8'hb1)) ? (~(8'ha9)) : {(8'hbf)}) : {(^~(8'hb1))})) : (-((((7'h40) ? (8'ha5) : (8'hb7)) ? (~^(8'ha6)) : ((8'ha3) ? (8'h9e) : (8'had))) ? ((+(8'hba)) ^ ((8'hbe) > (7'h42))) : (((8'ha8) <= (8'hae)) ? ((8'hb5) ? (8'hb2) : (7'h41)) : ((8'hb2) ? (7'h44) : (8'ha9)))))), 
parameter param171 = (+(&param170)))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h249):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire117;
  input wire [(3'h7):(1'h0)] wire116;
  input wire signed [(2'h2):(1'h0)] wire115;
  input wire signed [(4'h8):(1'h0)] wire114;
  input wire signed [(4'ha):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire167;
  wire [(5'h10):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire [(3'h6):(1'h0)] wire164;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(3'h7):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(5'h10):(1'h0)] wire120;
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(3'h4):(1'h0)] reg156 = (1'h0);
  reg [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  assign y = {wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire120,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 reg118,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg118 <= $signed((~&($unsigned($unsigned((8'ha7))) ?
          ($unsigned(wire116) ~^ {wire113, wire113}) : (~(wire117 ?
              wire115 : wire116)))));
      reg119 <= wire116[(3'h6):(1'h1)];
    end
  assign wire120 = (($signed((+$signed(wire113))) ?
                       ($unsigned(wire114[(3'h7):(3'h5)]) ?
                           wire117 : {wire113[(4'h9):(3'h7)],
                               (wire114 >>> (7'h41))}) : $unsigned((reg119[(1'h0):(1'h0)] ?
                           (wire113 ? wire114 : wire115) : ((7'h44) ?
                               wire113 : reg118)))) <= $unsigned({wire114,
                       (&{reg118})}));
  always
    @(posedge clk) begin
      reg121 <= (wire114[(3'h7):(2'h3)] >> ($signed($signed((+wire117))) << (((&reg118) - wire120[(3'h6):(1'h1)]) >> $unsigned((^~wire113)))));
      if (((wire114[(1'h1):(1'h1)] ?
              ($unsigned({wire115,
                  reg121}) >> wire113[(3'h4):(1'h0)]) : {((+reg119) && reg121[(2'h3):(2'h2)])}) ?
          $signed(reg119[(2'h2):(1'h1)]) : (wire120[(5'h10):(2'h3)] ?
              $unsigned(((wire113 && reg118) ^~ (-reg118))) : $signed({$signed(reg118),
                  reg119[(2'h2):(2'h2)]}))))
        begin
          reg122 <= wire115[(2'h2):(1'h1)];
          reg123 <= {$unsigned(reg121[(3'h4):(3'h4)])};
          reg124 <= (^~((reg121[(4'h9):(3'h6)] <= reg122[(4'hf):(4'hd)]) >> {$signed({wire113}),
              reg119[(1'h1):(1'h1)]}));
          reg125 <= (|$unsigned((wire116 | (wire115 ?
              $unsigned(wire117) : (~|wire116)))));
          reg126 <= $signed({{reg125, reg118}});
        end
      else
        begin
          reg122 <= $signed({reg124[(4'hb):(3'h7)]});
          reg123 <= $unsigned(((~|((wire114 ? reg121 : wire114) != ((8'hb5) ?
              reg124 : wire120))) < (^$signed(wire113[(3'h6):(2'h2)]))));
          if ((reg126[(1'h0):(1'h0)] ?
              (^~wire117[(3'h7):(3'h6)]) : ($unsigned((^~(+reg122))) ?
                  $signed(((^~wire120) ?
                      $signed(wire114) : $unsigned(wire114))) : (!reg125))))
            begin
              reg124 <= (($signed((~(8'ha8))) || (~|reg122)) ?
                  $unsigned(((((8'ha1) ?
                          wire117 : (8'hbb)) >>> reg122[(5'h15):(1'h0)]) ?
                      $unsigned(reg125[(4'hb):(1'h0)]) : ($signed(wire113) || $unsigned(reg126)))) : (!(((7'h43) | (reg126 ?
                      wire116 : (8'hb7))) <= (wire116 - reg119[(1'h1):(1'h0)]))));
              reg125 <= $unsigned((({(reg123 <<< wire120)} ?
                      wire115 : $unsigned(reg118[(4'h8):(3'h5)])) ?
                  reg124[(1'h1):(1'h0)] : $unsigned(wire116[(1'h1):(1'h1)])));
              reg126 <= $unsigned(reg123);
            end
          else
            begin
              reg124 <= reg124;
              reg125 <= (^{(reg122 ? (~|reg126) : reg122[(4'hb):(1'h1)])});
              reg126 <= reg126;
            end
          if (reg124[(4'h8):(1'h1)])
            begin
              reg127 <= {wire116[(2'h2):(1'h1)],
                  ({reg122, (^~(reg125 >> reg122))} ?
                      $signed($unsigned((reg122 | reg125))) : reg122[(3'h6):(3'h5)])};
              reg128 <= (8'haf);
              reg129 <= ((~(wire114[(2'h3):(2'h2)] ?
                  (~^(wire117 ^ reg121)) : wire116[(3'h5):(3'h5)])) ^~ ((~&{wire114}) ~^ reg119));
            end
          else
            begin
              reg127 <= reg121[(1'h0):(1'h0)];
              reg128 <= $signed({reg129});
              reg129 <= $unsigned(wire117);
            end
        end
      reg130 <= ($unsigned((^reg119)) ^~ $signed((~$signed((|reg124)))));
      reg131 <= (~^reg129);
    end
  always
    @(posedge clk) begin
      reg132 <= reg118;
      reg133 <= ((({$signed(wire114), $unsigned(reg119)} ?
          ({wire113} + reg132) : wire120[(5'h10):(2'h2)]) << reg124) <= reg122[(2'h3):(1'h1)]);
      if ((reg127 ?
          (($signed($signed(wire113)) ^~ wire113) ?
              ($unsigned((wire113 ?
                  reg128 : reg119)) != ($unsigned(reg127) <<< ((8'hb1) != reg121))) : ($unsigned((reg118 || reg131)) ?
                  {$unsigned(reg132),
                      wire120} : $unsigned($signed(wire113)))) : reg119))
        begin
          if ($unsigned((($signed(reg130) ?
              {(reg128 ? (8'haa) : (8'haa)),
                  wire120[(4'h9):(3'h4)]} : reg131[(4'h9):(1'h0)]) ~^ {reg132[(2'h3):(2'h3)],
              reg132})))
            begin
              reg134 <= (+(~&$unsigned(($unsigned(wire117) ^ {reg124,
                  wire120}))));
            end
          else
            begin
              reg134 <= wire115[(1'h1):(1'h0)];
              reg135 <= {$signed((wire120 < $signed((wire116 ?
                      reg118 : reg129))))};
              reg136 <= {$signed($signed(wire115[(1'h0):(1'h0)])),
                  $signed((7'h41))};
            end
          reg137 <= $unsigned(((|reg121) + reg125));
        end
      else
        begin
          reg134 <= reg118[(1'h0):(1'h0)];
          reg135 <= (wire117 ?
              $unsigned($unsigned($unsigned(wire114))) : $signed($signed((7'h43))));
        end
      reg138 <= (~&(-(&{(&reg134), reg137[(1'h1):(1'h0)]})));
    end
  assign wire139 = $unsigned($signed(reg137[(1'h1):(1'h0)]));
  assign wire140 = $signed($unsigned((~&$signed((wire115 ?
                       wire115 : reg132)))));
  assign wire141 = (~(wire113[(4'ha):(1'h0)] ?
                       $signed(reg130) : $signed((|reg121[(1'h1):(1'h0)]))));
  assign wire142 = $unsigned(((reg130 || (8'h9c)) ?
                       reg129[(4'hd):(3'h6)] : reg122[(5'h12):(1'h0)]));
  always
    @(posedge clk) begin
      reg143 <= {reg136};
      if ($signed($unsigned(wire114[(4'h8):(3'h6)])))
        begin
          reg144 <= $unsigned($signed({reg125[(1'h0):(1'h0)]}));
          if ((~^$signed($signed($signed(reg129)))))
            begin
              reg145 <= (+$unsigned((reg118 ~^ (|{wire113}))));
              reg146 <= ((!reg135[(2'h3):(2'h3)]) <= (&$signed($unsigned((+wire116)))));
              reg147 <= ($unsigned(reg143[(3'h4):(1'h1)]) ?
                  $signed({{(wire141 == (8'hb3))},
                      (|$signed(reg128))}) : reg127);
              reg148 <= ($unsigned($unsigned(((|reg132) ?
                      {reg132, (8'haa)} : (wire117 <= reg134)))) ?
                  {reg123[(3'h4):(1'h1)]} : (reg127[(4'hb):(1'h1)] ?
                      (~(~(reg134 || wire139))) : reg133));
            end
          else
            begin
              reg145 <= $signed($signed((^~(reg135 ?
                  $signed(wire117) : $signed(reg143)))));
              reg146 <= (8'hab);
              reg147 <= ((~$unsigned({reg126[(1'h0):(1'h0)]})) ?
                  $signed((|(|reg146[(4'hb):(4'h9)]))) : (reg132 == (8'ha8)));
            end
          if ({$unsigned(wire113[(4'ha):(3'h4)])})
            begin
              reg149 <= (&(wire120 ?
                  (($signed(reg147) || {reg125}) ?
                      wire115 : $signed((~^wire142))) : $signed((~$signed(wire117)))));
              reg150 <= reg121[(4'h9):(1'h1)];
            end
          else
            begin
              reg149 <= ($unsigned(((7'h40) + $unsigned((wire113 >> reg148)))) ?
                  $signed(({((8'hb2) << reg118),
                      {wire117}} <= {$unsigned(reg132)})) : {$signed($unsigned($signed(reg138)))});
              reg150 <= $signed(reg126);
            end
          reg151 <= (((reg129 < wire114) < $signed($signed((8'hbf)))) ?
              $signed(($unsigned((reg125 ^~ (8'hbc))) ?
                  (reg123 ~^ $unsigned(reg143)) : reg131)) : $signed((($signed(reg121) < (8'hb3)) > wire139)));
        end
      else
        begin
          if (reg149)
            begin
              reg144 <= $signed($signed($unsigned($signed(reg143))));
              reg145 <= reg127[(1'h0):(1'h0)];
              reg146 <= $signed((((reg127[(4'h8):(4'h8)] ?
                          (reg129 ? reg146 : (8'hb7)) : (wire115 && reg119)) ?
                      ((^~reg138) == reg145) : $signed(wire116[(3'h5):(2'h3)])) ?
                  (^~(^$unsigned(reg143))) : reg124[(4'h9):(2'h2)]));
            end
          else
            begin
              reg144 <= ($signed((reg148[(2'h2):(2'h2)] ?
                      $signed({reg127,
                          reg151}) : $unsigned($signed(wire115)))) ?
                  (~|reg151) : ((wire139[(5'h11):(4'hb)] * (reg122 ?
                          (&wire142) : {wire115})) ?
                      reg145[(2'h2):(1'h1)] : (~{{reg121, (8'ha9)},
                          wire115[(2'h2):(1'h1)]})));
              reg145 <= reg125;
              reg146 <= reg150;
            end
          reg147 <= $signed((reg127[(4'ha):(4'h9)] < (reg130[(2'h2):(1'h1)] ?
              reg138 : {reg133, $unsigned((7'h41))})));
          if ((~^((~^$signed({(7'h43)})) ?
              ((~^(reg148 ? wire120 : reg122)) != (+(reg149 ?
                  (8'hbf) : reg128))) : $signed(reg134[(4'ha):(4'h8)]))))
            begin
              reg148 <= $signed(reg123[(1'h1):(1'h0)]);
              reg149 <= reg133;
            end
          else
            begin
              reg148 <= (reg147 ? (!reg128) : $signed(reg126));
              reg149 <= {wire120[(5'h10):(4'ha)]};
              reg150 <= $unsigned(reg143[(4'h8):(1'h1)]);
              reg151 <= (+(reg135 ?
                  (wire140[(2'h2):(1'h1)] ?
                      ((wire116 ? reg129 : wire113) ?
                          $unsigned(reg144) : {reg133}) : ((reg147 <<< wire139) + (reg125 ?
                          wire141 : reg135))) : (reg127 ?
                      {$unsigned(reg132)} : ((|reg131) ?
                          (^~wire142) : $unsigned(reg131)))));
              reg152 <= $signed(($unsigned(reg133[(4'h8):(2'h2)]) | $unsigned(((reg135 && wire120) ?
                  wire141[(2'h3):(1'h0)] : reg125[(4'ha):(4'ha)]))));
            end
        end
      if (((8'ha6) >> ((($signed(wire139) <<< (+reg143)) ?
              reg138[(3'h5):(2'h2)] : reg147[(1'h1):(1'h1)]) ?
          $unsigned(((reg149 ? reg125 : reg146) ?
              {(8'hbb),
                  reg144} : ((8'haf) != reg118))) : {$unsigned($unsigned(wire115)),
              {(reg136 ? reg148 : wire113)}})))
        begin
          if ($signed(reg145[(2'h2):(1'h0)]))
            begin
              reg153 <= ($unsigned((~&reg118[(2'h2):(1'h1)])) + $signed({($signed(wire141) ?
                      $signed(reg132) : (reg128 ? wire116 : reg148)),
                  wire114[(3'h7):(1'h1)]}));
              reg154 <= reg122[(3'h4):(1'h1)];
            end
          else
            begin
              reg153 <= (^~reg138);
              reg154 <= reg125;
            end
          reg155 <= ($unsigned(reg119[(2'h2):(1'h0)]) ?
              wire120 : reg150[(3'h5):(3'h4)]);
          if ($unsigned(reg152))
            begin
              reg156 <= (!(wire117 ^~ $signed((reg136[(1'h1):(1'h1)] ?
                  (+reg134) : wire142[(4'hc):(3'h6)]))));
              reg157 <= wire120[(2'h3):(1'h1)];
              reg158 <= (-wire142);
            end
          else
            begin
              reg156 <= reg132[(2'h3):(2'h3)];
              reg157 <= (($signed({$signed(reg131)}) & $unsigned(reg151)) ?
                  {(+$unsigned(reg119)), reg156} : reg143[(3'h5):(3'h5)]);
              reg158 <= (8'ha8);
              reg159 <= (reg128 & (^~$unsigned((&wire114))));
            end
        end
      else
        begin
          reg153 <= reg155;
          reg154 <= (&{((reg138[(3'h6):(2'h2)] ?
                      $unsigned((8'haa)) : (reg123 | reg155)) ?
                  $signed($unsigned(reg126)) : {reg118, (~^reg144)})});
          if ((|($signed($signed($signed(reg154))) ? (+reg149) : reg134)))
            begin
              reg155 <= (reg159 ?
                  $signed($signed((((8'hbf) - (8'ha0)) ~^ reg123))) : (({(wire117 ~^ wire114),
                              (wire142 != reg119)} ?
                          wire141[(1'h1):(1'h1)] : (8'hb0)) ?
                      reg121 : reg137[(1'h1):(1'h0)]));
              reg156 <= (8'ha0);
              reg157 <= reg132;
            end
          else
            begin
              reg155 <= wire113[(2'h2):(1'h1)];
              reg156 <= (|$signed(reg145[(1'h0):(1'h0)]));
              reg157 <= reg121[(1'h0):(1'h0)];
            end
        end
      if ({(~wire114[(3'h5):(1'h0)]),
          $unsigned(($signed((reg155 ? reg156 : reg152)) ?
              ((~&(7'h42)) ?
                  wire115[(2'h2):(2'h2)] : (reg144 == reg135)) : reg131[(5'h14):(4'hc)]))})
        begin
          reg160 <= $unsigned((reg153 + (($unsigned(reg125) ^ (reg126 ?
                  reg153 : reg151)) ?
              ($signed(wire117) <= reg134) : reg151[(1'h1):(1'h0)])));
          reg161 <= $signed($unsigned($signed($signed((reg159 ?
              wire115 : wire117)))));
          reg162 <= wire115;
          reg163 <= (wire114 >= (&$unsigned(($unsigned(reg148) - reg154[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg160 <= ($unsigned($unsigned(((~&reg121) ? wire120 : reg156))) ?
              (reg132[(2'h2):(1'h0)] ^~ ((reg143 ?
                      reg158 : (wire120 > wire113)) ?
                  {(~|reg133)} : reg124[(4'h9):(1'h0)])) : $signed($signed(reg161)));
          if ({(reg144[(3'h4):(2'h2)] && (((~&reg136) >>> (reg144 ^~ reg125)) * $unsigned((wire139 << reg150)))),
              (reg157 | ($unsigned((8'hbb)) * (^reg123)))})
            begin
              reg161 <= {reg159[(3'h6):(1'h1)],
                  (-(~^$signed((wire115 * reg148))))};
            end
          else
            begin
              reg161 <= (|(($signed((~reg159)) << $unsigned($signed(reg148))) >= ((~$unsigned(reg146)) != (!wire142[(4'h8):(1'h0)]))));
            end
          reg162 <= $signed(($signed((&reg129[(3'h6):(3'h6)])) ?
              $unsigned(((^~reg150) >= reg144[(1'h1):(1'h0)])) : (reg125[(3'h6):(2'h3)] ?
                  (reg128 ^ (wire117 ?
                      (8'h9d) : reg158)) : ($signed(wire141) & {wire116}))));
          reg163 <= reg136;
        end
    end
  assign wire164 = reg127;
  assign wire165 = (reg154 ^ (reg136 ?
                       $signed($unsigned((wire142 ?
                           reg143 : reg161))) : $signed(reg150[(1'h0):(1'h0)])));
  assign wire166 = (($unsigned((wire116 >> $unsigned(reg153))) ?
                       (wire164 <= $unsigned(wire165[(2'h2):(1'h0)])) : (($unsigned((8'hbe)) ?
                           {wire117} : (wire113 | reg119)) == reg149[(4'ha):(2'h3)])) && (({((7'h42) ?
                               reg131 : (8'hbf))} == {(reg127 <<< reg157),
                           (reg155 ? reg138 : (8'ha1))}) ?
                       (+reg130[(3'h4):(2'h3)]) : $signed({wire117[(2'h3):(2'h3)]})));
  assign wire167 = $signed($signed(wire117[(1'h1):(1'h0)]));
  assign wire168 = reg148[(2'h3):(2'h2)];
  assign wire169 = (reg163[(3'h4):(1'h0)] ? $unsigned({reg134}) : reg159);
endmodule

module module99  (y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire104;
  input wire [(3'h6):(1'h0)] wire103;
  input wire [(4'h9):(1'h0)] wire102;
  input wire signed [(4'h9):(1'h0)] wire101;
  input wire [(4'h9):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  assign y = {wire108, wire107, wire106, wire105, (1'h0)};
  assign wire105 = (($unsigned(wire103[(2'h2):(2'h2)]) ?
                       $unsigned((+(^~wire102))) : ((&{(8'ha5),
                           (8'ha9)}) != wire102)) <= ($signed(wire100) - $signed($unsigned((^~wire102)))));
  assign wire106 = (~^$signed(wire102));
  assign wire107 = $unsigned(wire103);
  assign wire108 = $signed($signed(wire103[(1'h0):(1'h0)]));
endmodule

module module36
#(parameter param52 = (((8'hb9) ? ((((8'hbc) ? (8'ha4) : (8'hb9)) >= (^~(8'hb4))) ~^ (((8'hb1) ? (7'h41) : (8'hb3)) ? ((8'ha5) - (8'h9d)) : {(8'hbd)})) : (~|(((8'hae) != (8'hab)) ? ((8'hbd) > (8'h9c)) : (-(8'hbb))))) ? (^((+(~&(8'hbd))) && {((8'hb5) ? (8'ha0) : (8'hba)), ((8'ha2) ? (8'hb6) : (8'hbb))})) : {(+(-(^~(8'ha2)))), ((((8'h9f) ? (7'h41) : (8'hba)) ? {(7'h41)} : (8'ha3)) != (((8'hb9) ^ (8'had)) != ((8'ha7) || (7'h43))))}), 
parameter param53 = ((~(|(param52 && {param52}))) ? ({param52, ((!param52) ? (param52 ? param52 : param52) : ((8'h9c) ? param52 : (8'hb1)))} ? (~&(|(param52 && param52))) : (~^((+param52) ? (~|param52) : param52))) : ({((param52 | param52) ? param52 : (param52 <= param52)), {param52, {param52}}} ? {(^((8'hbc) ? param52 : param52))} : (+(((8'hbc) > param52) >= (param52 <<< param52))))))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= {wire37, (~&wire38)};
      if (((|$unsigned($signed(reg41))) ? wire40 : wire38))
        begin
          reg42 <= $signed((~|{(wire38 ?
                  (wire39 ? wire37 : wire38) : wire37[(4'hd):(3'h4)]),
              wire40}));
          reg43 <= $unsigned($unsigned(($unsigned((wire39 < wire38)) > ({wire37,
                  wire38} ?
              ((8'hb1) ? wire37 : reg42) : (reg42 ? wire39 : wire37)))));
          reg44 <= reg41[(4'hd):(1'h0)];
          reg45 <= reg43[(2'h3):(1'h1)];
        end
      else
        begin
          reg42 <= $signed((~|((8'haf) ?
              reg42[(4'ha):(1'h1)] : (~&{(8'ha7)}))));
          reg43 <= $signed($unsigned(reg41[(3'h4):(1'h1)]));
          reg44 <= $unsigned({((!$signed(wire39)) && ({reg43, wire38} ?
                  $signed(reg42) : wire37[(3'h4):(1'h1)]))});
        end
      reg46 <= (^~($signed(((~^wire37) ?
          (reg43 ?
              wire39 : wire40) : reg42[(4'h9):(3'h7)])) * $signed((+$unsigned(wire37)))));
    end
  assign wire47 = ((reg41 ?
                      $unsigned(($unsigned(reg43) < (reg45 <= wire40))) : $signed(reg41)) >> (reg44 ?
                      wire39 : reg43[(2'h3):(2'h3)]));
  assign wire48 = (reg41[(4'ha):(1'h1)] >= reg41);
  assign wire49 = reg41;
  assign wire50 = {{wire49,
                          (reg46[(1'h0):(1'h0)] ?
                              $signed({reg42}) : (|(&reg41)))}};
  assign wire51 = $unsigned($unsigned({wire37[(4'h9):(2'h2)]}));
endmodule
