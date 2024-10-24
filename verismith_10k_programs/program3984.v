module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (8'hb0);
  assign wire6 = ((&$unsigned(wire2[(1'h1):(1'h0)])) ^ wire3[(3'h7):(3'h6)]);
  assign wire7 = ((8'hb6) ?
                     (|(+wire0[(4'hd):(1'h1)])) : ($unsigned($signed(((8'hac) << wire6))) + wire2[(2'h2):(2'h2)]));
  assign wire8 = (wire0[(2'h3):(1'h1)] ^~ $signed($unsigned((wire7 ?
                     wire6 : (~(8'ha3))))));
  module9 #() modinst118 (wire117, clk, wire1, wire3, wire8, wire4);
  assign wire119 = wire8[(2'h2):(2'h2)];
  assign wire120 = $unsigned($unsigned(wire0[(2'h3):(2'h2)]));
  assign wire121 = $unsigned($unsigned($signed($signed($signed(wire1)))));
  assign wire122 = (~|(~wire121[(2'h3):(2'h3)]));
endmodule

module module9
#(parameter param115 = ((!(8'ha3)) && {((&((8'h9e) ? (8'hb0) : (8'hb5))) < (((7'h44) ? (7'h41) : (8'h9e)) ^~ (~(8'haa)))), (~&({(7'h43)} <<< ((8'hbc) ^ (8'hb7))))}), 
parameter param116 = ((8'hac) << ((8'ha1) ^ {(~&(param115 + param115)), {param115, (~^param115)}})))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire111;
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire56,
                 wire16,
                 wire15,
                 wire14,
                 wire111,
                 reg58,
                 reg59,
                 reg60,
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
                 (1'h0)};
  assign wire14 = wire13[(4'ha):(3'h5)];
  assign wire15 = ((-wire12) ?
                      (~^{{$unsigned(wire11),
                              (wire10 == (8'ha7))}}) : $unsigned(wire10[(2'h2):(2'h2)]));
  assign wire16 = (wire11 >> (^$signed(((wire15 >= wire14) ?
                      wire10[(1'h0):(1'h0)] : $signed(wire11)))));
  module17 #() modinst57 (wire56, clk, wire16, wire14, wire12, wire15, wire10);
  always
    @(posedge clk) begin
      if (wire14[(3'h5):(1'h1)])
        begin
          reg58 <= ($unsigned($unsigned((!(wire15 | wire10)))) >= ((-wire12[(3'h5):(2'h2)]) ^ wire15));
        end
      else
        begin
          reg58 <= $unsigned($signed((wire14 || $signed((~^wire15)))));
          if ($signed((^~$unsigned(((wire14 ?
              (8'ha7) : wire56) * (wire16 ^~ wire56))))))
            begin
              reg59 <= $unsigned($unsigned(wire10[(3'h5):(2'h3)]));
              reg60 <= $signed(wire10[(3'h4):(2'h2)]);
            end
          else
            begin
              reg59 <= {$signed($unsigned(reg58[(3'h4):(3'h4)])),
                  ({wire11[(1'h0):(1'h0)],
                      (|(wire10 ? wire56 : wire16))} > reg60)};
            end
        end
      reg61 <= wire13;
      reg62 <= $unsigned((wire13 ?
          wire15 : ((!{reg60}) && reg58[(2'h2):(1'h0)])));
      if (wire56)
        begin
          if (wire56)
            begin
              reg63 <= wire16[(2'h2):(2'h2)];
              reg64 <= {(wire15[(1'h1):(1'h1)] ? reg63 : reg60),
                  $unsigned((8'hb0))};
              reg65 <= $unsigned((reg58 ?
                  $signed((~&(^~wire56))) : {(-(^~wire10)),
                      $signed($unsigned(wire56))}));
              reg66 <= wire12;
            end
          else
            begin
              reg63 <= $unsigned($signed(((reg62 ^ (wire12 == wire15)) ?
                  (8'ha2) : $signed({(8'ha5)}))));
              reg64 <= ($signed($unsigned((8'ha0))) ?
                  $signed((-reg63[(3'h4):(3'h4)])) : ($signed(reg66) | (|(wire10 >>> $signed(wire10)))));
            end
          if (((^(!wire16)) ?
              (reg61[(2'h2):(1'h0)] ?
                  (~|$unsigned((wire15 ? wire12 : reg66))) : ($unsigned({reg64,
                      (8'ha4)}) >= wire11)) : (~&($signed(reg58) - reg62))))
            begin
              reg67 <= reg66;
              reg68 <= ((((wire14[(2'h2):(1'h1)] ?
                          (wire14 ? wire13 : wire12) : (wire13 >>> (8'hbd))) ?
                      ((~(8'ha4)) ^~ $signed(wire15)) : $unsigned($unsigned((8'haa)))) * {reg61}) ?
                  $unsigned((!wire12)) : (!$unsigned(wire16[(2'h2):(1'h1)])));
            end
          else
            begin
              reg67 <= $unsigned($unsigned((-(8'ha9))));
              reg68 <= (reg68 ?
                  $signed($signed($unsigned($unsigned(wire14)))) : wire15);
            end
          reg69 <= ($unsigned($signed(wire16)) > ($signed(reg65[(4'ha):(2'h2)]) ^ {wire10[(3'h4):(3'h4)],
              ($signed(reg63) ? (reg66 <<< reg64) : (^reg68))}));
          reg70 <= wire16;
        end
      else
        begin
          reg63 <= (~|({((wire10 ? wire15 : reg67) == (-reg63))} ?
              $unsigned((wire56 ?
                  {reg58} : (&reg68))) : $unsigned(reg60[(4'h9):(2'h3)])));
          reg64 <= reg61[(3'h4):(2'h3)];
          reg65 <= ((!reg66[(2'h2):(1'h0)]) ?
              {((reg64 ? (reg61 ? reg69 : wire11) : $unsigned((7'h40))) ?
                      $unsigned($unsigned(reg64)) : reg61)} : {$signed(((wire10 < wire16) ?
                      $unsigned(wire56) : (+(8'hb6)))),
                  {$signed((reg61 ? reg58 : reg63))}});
          reg66 <= $signed(((~&$signed((~^(7'h42)))) + (((reg59 == wire13) ?
                  (reg63 ? wire13 : reg68) : $unsigned(wire11)) ?
              $signed((reg60 <= wire12)) : {(reg68 >= reg65),
                  {wire14, reg62}})));
          reg67 <= ((wire13[(4'hd):(3'h5)] ?
                  $signed(reg63[(1'h0):(1'h0)]) : (~|$signed($signed(reg65)))) ?
              ($signed((-reg61[(5'h14):(3'h5)])) >>> $unsigned($unsigned(wire15[(1'h0):(1'h0)]))) : $unsigned($signed((~&$unsigned((8'hb8))))));
        end
    end
  module71 #() modinst112 (.wire75(reg63), .wire74(wire16), .wire73(wire12), .y(wire111), .wire72(wire56), .clk(clk));
  assign wire113 = $signed(((reg65[(3'h4):(2'h3)] | ({reg65} ?
                       (^reg67) : $unsigned(wire12))) == ({$unsigned(reg69)} ^ ((7'h44) ?
                       (^wire12) : (~|(8'ha2))))));
  assign wire114 = ({$unsigned(reg61),
                       ($signed(reg66) - $unsigned((reg70 < reg64)))} >>> (8'h9d));
endmodule

module module71  (y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire75;
  input wire [(5'h10):(1'h0)] wire74;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire76;
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 reg107,
                 reg106,
                 reg105,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 (1'h0)};
  assign wire76 = $unsigned((!((-$signed((8'hb6))) ?
                      $unsigned((wire72 ? wire73 : wire75)) : wire73)));
  assign wire77 = wire72;
  assign wire78 = (8'hac);
  assign wire79 = $signed(((~$unsigned(wire74)) < $signed($unsigned({(7'h41),
                      wire76}))));
  assign wire80 = $unsigned(($unsigned(({wire77} ?
                      $unsigned(wire78) : $signed((8'hb6)))) <= (((wire76 ?
                          wire76 : wire76) ^ (wire73 ^~ wire73)) ?
                      wire72 : ({wire72, wire77} ?
                          wire78[(1'h0):(1'h0)] : $signed(wire79)))));
  always
    @(posedge clk) begin
      reg81 <= ((!(~^$signed(wire75[(4'h9):(3'h5)]))) ?
          {$signed(((wire76 ? wire73 : wire78) ?
                  $unsigned(wire76) : (wire73 != (8'hae)))),
              ((^~(7'h43)) ?
                  (((7'h42) == (8'ha6)) ?
                      (wire78 + (8'hac)) : wire76) : wire76[(3'h6):(2'h3)])} : wire72[(3'h5):(3'h5)]);
      reg82 <= $unsigned((wire80[(2'h2):(1'h1)] ?
          {wire79[(3'h7):(3'h5)], (8'h9d)} : (-wire77[(3'h5):(3'h4)])));
      if ((($signed(($signed(wire78) ?
                  (wire79 ? wire72 : (8'ha3)) : $unsigned((8'hb5)))) ?
              wire79 : (reg82[(2'h3):(1'h1)] ?
                  wire72 : reg81[(5'h10):(3'h7)])) ?
          $signed($unsigned(wire76[(3'h5):(2'h2)])) : (|(wire75[(2'h2):(1'h1)] ?
              wire72 : $unsigned((&reg82))))))
        begin
          reg83 <= (wire80[(1'h1):(1'h0)] ?
              $signed($unsigned(wire75[(4'hb):(3'h7)])) : ($signed((wire79[(4'hb):(4'hb)] ~^ (wire80 ?
                  wire77 : (8'hab)))) << wire79[(3'h4):(1'h0)]));
          reg84 <= (|wire73[(4'h8):(2'h3)]);
          if ((~^({((wire74 ? reg82 : wire73) >> wire75[(3'h4):(1'h0)]),
                  wire80} ?
              wire80[(3'h5):(1'h0)] : $unsigned((!(wire78 ?
                  (8'had) : wire74))))))
            begin
              reg85 <= $signed((wire74 ?
                  wire77[(2'h2):(1'h1)] : wire76[(4'h9):(3'h6)]));
              reg86 <= {(((!$signed((8'hae))) ^ (+$unsigned((8'haf)))) + (^~$signed(wire75))),
                  $signed(($unsigned((reg85 & wire80)) < reg82[(2'h3):(2'h2)]))};
              reg87 <= (^($signed(reg84[(2'h3):(2'h2)]) ?
                  ($unsigned(wire73) ?
                      (-(^wire79)) : ($signed(wire72) ?
                          wire78 : $signed(wire73))) : $signed(wire80)));
              reg88 <= (~|(reg85[(4'ha):(3'h7)] ?
                  {$unsigned({wire74}),
                      $unsigned((reg84 ?
                          (8'hb8) : (8'ha0)))} : $signed(wire76[(2'h3):(2'h2)])));
            end
          else
            begin
              reg85 <= (8'hb9);
            end
          reg89 <= (+$signed($signed($signed(reg88))));
          reg90 <= (~^(($signed($unsigned(wire74)) ?
              ($unsigned((8'haa)) ?
                  wire77[(5'h14):(3'h4)] : reg83[(3'h7):(1'h1)]) : $signed((reg87 ?
                  reg81 : (8'ha3)))) <<< $unsigned(($unsigned(wire76) ?
              wire73 : (^(8'hac))))));
        end
      else
        begin
          if ($unsigned(((^~(^~(+(8'had)))) ?
              wire74 : ((reg84[(1'h1):(1'h1)] >> wire73) & reg90))))
            begin
              reg83 <= reg81;
              reg84 <= wire80;
            end
          else
            begin
              reg83 <= (({wire79[(3'h7):(1'h0)], $unsigned((~^wire80))} ?
                      ({$unsigned(reg86), reg84[(1'h0):(1'h0)]} ?
                          {$signed(wire76)} : (7'h43)) : ({$unsigned((8'ha7))} ?
                          $unsigned(reg81[(4'hb):(3'h4)]) : wire73)) ?
                  wire77 : ($signed(($unsigned(wire80) ?
                      wire76 : reg87)) > ({reg90,
                      $signed(reg85)} & $signed($signed((7'h44))))));
              reg84 <= ($signed(reg86) ?
                  (wire80 ? $unsigned(wire75) : reg83) : reg84[(2'h3):(1'h1)]);
            end
          reg85 <= reg82;
        end
      if (reg87)
        begin
          if ((-reg88))
            begin
              reg91 <= (wire78[(2'h2):(1'h1)] ?
                  (~(^$unsigned($unsigned(wire73)))) : {reg88[(4'hd):(4'hb)]});
              reg92 <= reg86;
              reg93 <= wire80;
              reg94 <= $unsigned(reg90[(4'ha):(4'h9)]);
              reg95 <= reg81[(1'h1):(1'h1)];
            end
          else
            begin
              reg91 <= ((~^((|(reg89 ?
                  reg87 : reg85)) && reg93)) <<< reg91[(4'ha):(4'h9)]);
              reg92 <= reg83;
              reg93 <= ((reg95 ?
                      $unsigned($signed(wire75[(4'hb):(4'h9)])) : $unsigned((((8'hb5) ?
                          reg88 : (8'hba)) <= $signed(reg87)))) ?
                  $signed($signed(reg91[(2'h3):(1'h0)])) : ($unsigned((+(reg94 | (8'hb8)))) & $signed($unsigned((|reg91)))));
              reg94 <= (8'hbb);
            end
          reg96 <= $signed($unsigned($unsigned(((reg92 > wire72) ?
              (8'hbe) : (reg81 ? reg88 : reg82)))));
          reg97 <= $signed(({(wire77[(1'h0):(1'h0)] > (reg89 ?
                      (8'ha5) : reg87)),
                  ({wire80} ? $unsigned(reg83) : (reg95 ? (7'h41) : (7'h44)))} ?
              $signed(((8'hb0) << {reg95, (8'hb7)})) : wire76[(4'hb):(3'h7)]));
          if ($unsigned($unsigned(((-{wire72, reg90}) ?
              wire77[(3'h6):(1'h0)] : reg84))))
            begin
              reg98 <= ((-$signed(reg83[(3'h7):(3'h7)])) ?
                  (($unsigned($signed(reg89)) ?
                      {wire72[(4'ha):(3'h5)]} : reg88) == wire73) : reg91[(3'h7):(3'h7)]);
              reg99 <= ((&wire79[(4'ha):(1'h1)]) || (wire80[(4'h8):(3'h6)] >> (^~(reg83 && wire75))));
            end
          else
            begin
              reg98 <= $signed(reg95);
              reg99 <= {(8'haa)};
              reg100 <= $signed(reg97);
              reg101 <= $unsigned(reg88[(4'hd):(4'hc)]);
            end
        end
      else
        begin
          reg91 <= (reg96[(2'h3):(1'h1)] | $signed(((8'hb3) + $unsigned((^reg100)))));
          reg92 <= {$unsigned($signed((~^reg94)))};
        end
    end
  assign wire102 = (~((+$unsigned($unsigned((8'ha5)))) ?
                       $unsigned((~^(~wire79))) : ($signed($unsigned(reg97)) ?
                           ($signed((8'h9e)) ?
                               reg85[(2'h3):(1'h0)] : (reg88 ?
                                   wire79 : wire78)) : reg101[(2'h3):(2'h3)])));
  assign wire103 = reg92[(4'h8):(1'h0)];
  assign wire104 = reg86[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg105 <= wire78[(2'h2):(2'h2)];
      reg106 <= ($unsigned(reg94[(3'h4):(1'h0)]) <= {$unsigned($signed(reg87[(5'h14):(5'h12)]))});
      reg107 <= ((wire77[(1'h1):(1'h1)] | reg101[(2'h3):(2'h2)]) ?
          wire73[(3'h7):(1'h1)] : (~$signed((~|reg89))));
    end
  assign wire108 = (8'ha7);
  assign wire109 = ((wire79 <<< reg84[(1'h1):(1'h1)]) ?
                       $unsigned((^(~^$unsigned(reg107)))) : ($signed($signed((reg84 ^~ (8'ha6)))) ?
                           {wire72} : $signed((reg98[(2'h3):(2'h2)] & reg98))));
  assign wire110 = ($unsigned($unsigned($unsigned((wire108 ?
                       reg100 : reg93)))) + (wire77[(3'h5):(2'h2)] ~^ wire74));
endmodule

module module17
#(parameter param54 = (^~(&{(((7'h41) | (8'ha1)) != ((8'hb4) ? (8'hb7) : (8'hbb)))})), 
parameter param55 = ({(^(param54 ? (|(8'ha6)) : (-param54)))} ? (param54 ? param54 : (~|(param54 || ((8'ha6) ? param54 : (8'ha1))))) : ((8'hbf) || (~(^param54)))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  input wire [(3'h4):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire23;
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = (wire18[(2'h3):(1'h0)] ?
                      $unsigned($unsigned(($unsigned(wire22) ?
                          (wire19 ?
                              wire22 : wire22) : (+wire19)))) : ((~^$signed(wire18[(3'h4):(2'h2)])) ?
                          wire18[(2'h3):(1'h1)] : {wire20,
                              {wire22[(2'h2):(2'h2)]}}));
  always
    @(posedge clk) begin
      reg24 <= (wire19 ? {wire18} : (8'ha4));
      reg25 <= wire22[(4'h8):(2'h2)];
    end
  assign wire26 = $signed((|$unsigned(wire23[(1'h0):(1'h0)])));
  assign wire27 = ((~(reg25 != (~^wire19[(1'h0):(1'h0)]))) ?
                      wire19[(2'h2):(2'h2)] : wire21);
  assign wire28 = $signed(($signed((8'ha3)) != $unsigned((^wire26[(4'ha):(1'h1)]))));
  assign wire29 = (wire28 ?
                      (reg25[(4'hb):(4'ha)] ?
                          wire27 : wire20[(3'h5):(3'h4)]) : (^~(~|wire23)));
  always
    @(posedge clk) begin
      reg30 <= (($signed((!wire21)) ?
              ($unsigned((wire18 >>> wire20)) ?
                  wire27 : wire21[(1'h0):(1'h0)]) : (wire26[(1'h0):(1'h0)] ?
                  (~|wire28[(3'h6):(2'h3)]) : ($unsigned(wire28) > wire26))) ?
          $signed(wire27) : $unsigned($signed($unsigned((wire26 != reg24)))));
      if ((~&{(reg25 ? $signed($signed(wire26)) : ((!(8'ha9)) || wire29))}))
        begin
          reg31 <= {((+($unsigned(wire18) >> (wire18 || wire22))) ?
                  $signed($signed((wire29 ?
                      wire22 : wire23))) : (^~$signed({wire28, wire21}))),
              $unsigned(wire20[(1'h1):(1'h1)])};
          reg32 <= {wire26[(3'h6):(3'h6)]};
          reg33 <= (8'had);
          if ((7'h44))
            begin
              reg34 <= wire21[(4'h8):(2'h2)];
              reg35 <= reg25;
              reg36 <= ((wire20[(3'h4):(1'h0)] ?
                      (8'hb6) : (reg33 ?
                          $unsigned(((8'ha3) + wire23)) : $unsigned((wire18 ?
                              wire29 : wire21)))) ?
                  reg35 : wire20[(1'h0):(1'h0)]);
              reg37 <= wire18[(3'h4):(2'h2)];
            end
          else
            begin
              reg34 <= reg35[(4'hc):(3'h6)];
              reg35 <= wire29[(3'h4):(1'h1)];
              reg36 <= $unsigned(($unsigned(reg31[(2'h2):(1'h1)]) ?
                  (|(reg30[(4'hb):(3'h6)] != $signed(reg31))) : (-(~^$signed((8'h9d))))));
            end
          if ($unsigned(((|{(~|reg25)}) > (~reg37[(2'h2):(2'h2)]))))
            begin
              reg38 <= ($signed(((|(wire19 ? wire18 : wire18)) != (reg33 ?
                      {wire29} : $signed(wire20)))) ?
                  $signed((&($unsigned((8'hb1)) < reg33[(1'h1):(1'h0)]))) : (wire18[(1'h1):(1'h1)] - ((~&wire23) != $unsigned(reg24[(3'h7):(2'h2)]))));
              reg39 <= ($signed(reg30) || $signed(reg30[(1'h1):(1'h0)]));
              reg40 <= $unsigned((8'h9c));
              reg41 <= wire18[(2'h3):(2'h2)];
            end
          else
            begin
              reg38 <= (~&(~^$signed((~^reg40[(3'h7):(3'h7)]))));
              reg39 <= (-$signed($signed((~|$unsigned(reg35)))));
              reg40 <= {$unsigned(reg36)};
              reg41 <= (reg33[(2'h2):(1'h1)] ?
                  reg25 : {$signed((^~{(8'hab), (8'hab)}))});
            end
        end
      else
        begin
          if ($unsigned((reg40[(1'h0):(1'h0)] ?
              (^(+$unsigned((8'ha3)))) : (wire29 ?
                  $unsigned($signed(reg31)) : {(~|(8'ha7)),
                      (wire21 >>> (8'hbb))}))))
            begin
              reg31 <= ((+(wire20 ?
                      $signed((wire29 ?
                          reg30 : wire21)) : ($unsigned(reg37) != {reg32,
                          (8'hba)}))) ?
                  (~($signed($signed(wire27)) ?
                      (~|(wire20 ?
                          reg32 : wire27)) : wire21[(3'h4):(1'h1)])) : (reg41[(4'hb):(1'h1)] ?
                      $signed($unsigned(reg40[(4'h8):(3'h6)])) : wire20[(2'h3):(2'h3)]));
              reg32 <= $unsigned(reg30);
            end
          else
            begin
              reg31 <= $signed(($signed(reg31[(1'h1):(1'h1)]) ^~ (&($unsigned(reg33) + (!reg30)))));
              reg32 <= ($unsigned(((-reg33[(1'h1):(1'h1)]) * (reg34[(3'h6):(1'h1)] >>> ((8'hba) + reg38)))) ?
                  wire28[(5'h10):(3'h6)] : (-((~^{reg31,
                      wire28}) || reg41[(3'h7):(1'h1)])));
              reg33 <= (-wire26);
              reg34 <= reg34[(2'h2):(2'h2)];
            end
          reg35 <= wire29[(2'h3):(2'h2)];
          reg36 <= (&({reg25[(2'h2):(2'h2)]} ?
              (|(~^(wire18 >= wire26))) : ((~(^~wire26)) ?
                  wire20 : {wire21[(2'h3):(2'h3)], (-reg41)})));
        end
      if ($unsigned((~$unsigned((~(wire20 << wire22))))))
        begin
          if ((&($unsigned((~^$signed(reg25))) > reg31[(3'h4):(3'h4)])))
            begin
              reg42 <= (~|reg39[(4'he):(4'hb)]);
            end
          else
            begin
              reg42 <= $signed(($signed((+(reg37 <<< reg42))) ?
                  reg35[(4'hb):(2'h2)] : reg35[(3'h5):(3'h5)]));
            end
        end
      else
        begin
          reg42 <= wire21;
          reg43 <= (($signed(reg37[(1'h1):(1'h1)]) ^~ wire18[(3'h4):(3'h4)]) ?
              (7'h43) : (((wire28[(1'h1):(1'h1)] ?
                  (wire29 ?
                      reg24 : reg37) : reg24[(3'h6):(1'h1)]) > wire29) << ((~^$unsigned(reg25)) || (&(reg40 >> reg38)))));
          reg44 <= reg37[(1'h1):(1'h0)];
          reg45 <= $signed({(8'h9c)});
        end
      reg46 <= $signed(reg24[(1'h1):(1'h1)]);
    end
  assign wire47 = (($unsigned((~&(~&reg37))) ?
                          $unsigned((^~wire29[(1'h1):(1'h0)])) : $signed({(reg40 ?
                                  wire19 : wire26),
                              reg33[(1'h0):(1'h0)]})) ?
                      (~|($unsigned((reg44 ? reg34 : reg25)) ?
                          reg31[(3'h5):(3'h5)] : (wire22 <<< {reg34}))) : (((reg43[(3'h6):(1'h0)] || $signed(wire23)) ?
                          wire19[(1'h0):(1'h0)] : ((wire22 >= reg42) >= (reg30 ~^ reg46))) >>> wire29));
  assign wire48 = $unsigned(wire47[(4'hd):(3'h6)]);
  assign wire49 = $signed(($unsigned((wire48[(1'h0):(1'h0)] > reg31[(2'h2):(2'h2)])) ?
                      (~|($unsigned(reg38) >> $unsigned(reg39))) : {wire20,
                          ($unsigned(reg33) >>> reg45[(3'h7):(1'h1)])}));
  assign wire50 = reg39[(2'h3):(2'h3)];
  assign wire51 = wire21;
  assign wire52 = reg46;
  assign wire53 = (reg24[(3'h4):(2'h2)] | $signed((~(wire23 | $unsigned(reg43)))));
endmodule
