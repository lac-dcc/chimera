module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire118,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire14,
                 wire13,
                 wire5,
                 wire4,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ((((wire1[(2'h2):(1'h1)] >> ((8'hae) > wire3)) - wire2[(5'h12):(5'h12)]) ?
                         $unsigned($signed({(8'hab)})) : (+$unsigned((~wire0)))) ?
                     $signed((!{(!wire1), wire3})) : wire0);
  assign wire5 = (({((~|wire2) ^ wire4),
                     $signed({(8'ha5)})} >= wire1) ~^ (+(+wire0[(3'h6):(2'h2)])));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg6 <= {$signed((~((^~(8'hb2)) ?
                  (~wire4) : (wire0 ? wire1 : wire3))))};
        end
      else
        begin
          if ($unsigned(wire3[(4'hc):(2'h3)]))
            begin
              reg6 <= ($signed(wire4) ?
                  $unsigned($unsigned((wire4[(1'h1):(1'h0)] == (wire1 ^ wire4)))) : (wire3 ?
                      ($signed($signed(wire5)) >>> {wire2[(3'h7):(1'h0)],
                          wire5[(2'h3):(2'h3)]}) : (~&$unsigned(wire0))));
              reg7 <= ((wire0[(2'h2):(1'h0)] ?
                  ($unsigned((|reg6)) << ((!wire3) ~^ $signed((7'h40)))) : (^(&{reg6,
                      (8'had)}))) ^ wire5[(1'h0):(1'h0)]);
            end
          else
            begin
              reg6 <= $signed(($signed(wire4[(1'h0):(1'h0)]) >> (reg6[(4'h8):(3'h5)] ?
                  ((7'h42) ? $signed(wire4) : $signed(wire2)) : (+wire1))));
              reg7 <= $signed((wire2 | (wire3[(5'h11):(4'h9)] ?
                  $signed($unsigned(wire1)) : $signed((wire0 ?
                      reg7 : wire1)))));
              reg8 <= (((-{(~&reg7)}) == $unsigned(({wire4} ?
                  reg7[(3'h5):(3'h4)] : (~reg6)))) & (wire5 ^ wire2[(2'h2):(1'h0)]));
              reg9 <= (+$signed($unsigned(($signed((7'h41)) ?
                  reg6 : $unsigned((8'ha3))))));
            end
          reg10 <= wire5;
        end
      reg11 <= reg9[(4'he):(4'h8)];
      reg12 <= (wire2[(5'h10):(3'h7)] <= (-$signed($signed((wire3 ?
          reg7 : wire3)))));
    end
  assign wire13 = (((8'hae) ?
                          (((reg12 ? (8'hbc) : (8'hbe)) << {wire2,
                              (8'hb4)}) | ((|(8'h9c)) << (reg10 ?
                              reg8 : reg7))) : $signed($unsigned(wire1))) ?
                      $unsigned(($signed(wire2) > (~reg9[(4'hd):(4'h9)]))) : reg12[(2'h3):(2'h3)]);
  assign wire14 = $unsigned({wire4[(1'h1):(1'h0)], reg8});
  always
    @(posedge clk) begin
      reg15 <= (8'hb9);
      if ((((({wire3,
          (8'h9f)} || ((8'hbe) ~^ reg8)) && reg7[(2'h2):(1'h0)]) < ((7'h40) ?
          reg7[(1'h0):(1'h0)] : reg6[(2'h3):(1'h1)])) >= (^reg12)))
        begin
          reg16 <= (^(reg9 ^~ $unsigned({$unsigned(wire2),
              (wire4 ? wire2 : reg15)})));
          reg17 <= ($unsigned(((wire5 ?
                  $signed(wire5) : $unsigned(reg12)) != reg8)) ?
              reg15 : $signed(reg16[(4'hc):(3'h7)]));
        end
      else
        begin
          if ({((~|reg11[(4'hf):(2'h3)]) < reg10[(3'h7):(3'h6)]),
              $unsigned({((reg8 ? (7'h41) : reg7) ?
                      (|wire3) : $signed((8'hb1))),
                  ({(8'hbb)} ? $unsigned(wire4) : reg12[(2'h2):(1'h0)])})})
            begin
              reg16 <= $signed(((-$unsigned(reg8[(1'h1):(1'h1)])) ?
                  {reg8, reg8[(3'h6):(1'h1)]} : {(((8'hb1) & reg10) ?
                          {reg11, reg10} : (wire14 ? reg11 : reg17))}));
              reg17 <= wire5;
              reg18 <= (&(wire1 ?
                  $unsigned(reg11[(2'h2):(2'h2)]) : wire3[(5'h11):(1'h1)]));
            end
          else
            begin
              reg16 <= $unsigned(reg7);
              reg17 <= wire13;
              reg18 <= ((!(~(8'ha4))) << (reg11 - wire0[(1'h0):(1'h0)]));
              reg19 <= ({{((^~reg6) >> wire3)},
                      $unsigned(reg10[(5'h12):(2'h2)])} ?
                  $signed(reg11) : reg12[(1'h1):(1'h1)]);
            end
          if (($signed((^wire2[(4'hf):(3'h5)])) ?
              (reg11[(2'h2):(2'h2)] << ($signed((reg18 < reg6)) > (reg9 ?
                  (~|reg11) : (wire2 >> (8'hb4))))) : (~^($unsigned((wire0 ?
                  reg7 : wire2)) << (^wire1)))))
            begin
              reg20 <= ($signed(((~reg18[(3'h4):(2'h3)]) | ((-wire14) ?
                  (~reg10) : $signed(reg16)))) >> $unsigned($unsigned(wire14)));
              reg21 <= ((((~|$unsigned((7'h44))) ?
                  reg9 : {(wire14 <<< (8'had)),
                      ((8'hb5) && reg7)}) && $signed((&(~&wire5)))) < ($signed(((-reg15) << {wire2,
                  (8'ha6)})) ~^ (reg15[(2'h3):(1'h0)] >>> ((8'ha8) ?
                  reg20 : reg11[(4'hc):(4'h8)]))));
            end
          else
            begin
              reg20 <= wire4;
              reg21 <= ({$signed(($unsigned(reg10) ?
                          wire5[(2'h3):(2'h2)] : (^reg6)))} ?
                  reg16[(3'h4):(2'h3)] : wire4[(1'h1):(1'h1)]);
            end
        end
      reg22 <= reg12[(1'h1):(1'h0)];
      reg23 <= (+reg17[(1'h0):(1'h0)]);
      reg24 <= reg7[(1'h0):(1'h0)];
    end
  assign wire25 = reg20;
  assign wire26 = wire0;
  assign wire27 = {reg16[(1'h1):(1'h1)]};
  assign wire28 = (&((wire25[(1'h1):(1'h0)] ?
                          $signed((-wire5)) : reg19[(1'h0):(1'h0)]) ?
                      $unsigned($unsigned($unsigned(wire5))) : ({(+reg23)} || (~&{reg21}))));
  assign wire29 = $signed(reg9);
  assign wire30 = reg17[(3'h4):(2'h2)];
  assign wire31 = {{(~{(wire25 ? (8'had) : reg12), wire4})}};
  assign wire32 = reg17;
  assign wire33 = (!reg12);
  assign wire34 = reg11;
  module35 #() modinst119 (.wire36(wire32), .wire38(wire4), .wire39(reg24), .wire37(reg6), .y(wire118), .clk(clk));
  assign wire120 = (7'h44);
  assign wire121 = $signed(((((wire34 != wire14) ?
                               (&wire2) : (wire34 + wire120)) ?
                           $unsigned((reg10 + wire3)) : (+wire31)) ?
                       (-reg12) : $signed((wire26[(4'h8):(1'h1)] + $unsigned(wire3)))));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire39;
  input wire [(4'hb):(1'h0)] wire38;
  input wire [(5'h15):(1'h0)] wire37;
  input wire [(4'h9):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire87;
  assign y = {wire117, wire115, wire89, wire87, (1'h0)};
  module40 #() modinst88 (.wire42(wire38), .y(wire87), .clk(clk), .wire44(wire39), .wire43(wire37), .wire41(wire36));
  assign wire89 = ((|wire39[(2'h2):(1'h0)]) ^ $unsigned((($signed(wire87) ^ $unsigned(wire39)) == {$signed(wire38),
                      {wire38}})));
  module90 #() modinst116 (.wire92(wire89), .clk(clk), .wire93(wire38), .wire91(wire87), .wire94(wire36), .y(wire115));
  assign wire117 = wire36[(4'h8):(3'h7)];
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire94;
  input wire [(4'ha):(1'h0)] wire93;
  input wire signed [(5'h11):(1'h0)] wire92;
  input wire [(4'h8):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire110;
  wire [(4'h9):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire103,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire95 = wire91[(4'h8):(2'h3)];
  assign wire96 = {(8'ha6), {wire94[(2'h2):(1'h0)]}};
  assign wire97 = (~$signed((&((wire91 ? wire94 : wire94) ?
                      {wire92, wire94} : $signed(wire94)))));
  assign wire98 = wire91;
  always
    @(posedge clk) begin
      reg99 <= (^~wire93);
      reg100 <= (wire97 ?
          (wire96 >> reg99[(2'h2):(2'h2)]) : ({$signed(wire98[(3'h6):(3'h4)])} ?
              {$signed((^reg99))} : $unsigned(wire94)));
      reg101 <= (8'hba);
      reg102 <= $signed((((((8'hbe) >> (8'h9c)) > (&wire98)) ^~ (~&(reg99 << wire98))) ?
          wire97 : (((^~wire97) ?
              $signed(wire96) : (wire91 ?
                  wire96 : wire95)) - wire97[(5'h11):(3'h5)])));
    end
  assign wire103 = (~&reg102[(4'h8):(3'h6)]);
  always
    @(posedge clk) begin
      reg104 <= {(^~((+(^~reg102)) ?
              ((reg101 ^~ (8'h9e)) - reg100[(3'h4):(1'h0)]) : (~{reg100,
                  reg99})))};
      reg105 <= ({(-wire98), $signed(reg99)} ?
          (($unsigned($unsigned(wire97)) | $signed($signed((8'ha1)))) ?
              reg104 : (~$unsigned((|wire92)))) : wire93);
      reg106 <= $signed($unsigned($signed(wire97[(4'hd):(3'h6)])));
      reg107 <= (8'hb3);
      reg108 <= wire95[(5'h11):(5'h11)];
    end
  assign wire109 = {wire93[(2'h3):(2'h2)]};
  assign wire110 = $signed(wire94);
  assign wire111 = $signed((8'ha6));
  assign wire112 = $signed(((((&reg100) >>> wire103[(2'h2):(2'h2)]) ?
                       (8'h9d) : (~reg105)) <<< reg105));
  assign wire113 = (~&(-(&($unsigned(wire91) ? (reg108 ^~ wire97) : (8'h9d)))));
  assign wire114 = $unsigned($signed((^$unsigned(wire110))));
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire44;
  input wire signed [(5'h15):(1'h0)] wire43;
  input wire [(3'h5):(1'h0)] wire42;
  input wire [(4'h9):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire45 = ($signed($unsigned(((wire44 ? wire43 : wire42) & (wire42 ?
                          wire43 : wire44)))) ?
                      wire42[(1'h0):(1'h0)] : {(wire43[(1'h1):(1'h1)] ?
                              (8'ha7) : ((^~wire42) ?
                                  (wire42 ? wire44 : wire43) : wire43)),
                          $unsigned($unsigned((!wire42)))});
  assign wire46 = ((({(wire41 ? (8'h9f) : wire45),
                          $unsigned(wire45)} <<< (wire43 ?
                          (wire41 ? wire44 : wire44) : {wire43})) ?
                      (^~((wire41 ?
                          wire45 : wire45) ^~ ((8'hbe) || (8'ha4)))) : (+$signed(wire42))) & {{$signed((8'hb3)),
                          $signed((8'ha3))},
                      wire41});
  assign wire47 = ((~&(&wire45[(4'h8):(1'h0)])) | $unsigned(($unsigned((wire42 ?
                      (8'hb5) : (8'hb6))) >> $signed((wire46 > wire43)))));
  assign wire48 = wire43;
  assign wire49 = $signed($unsigned(($unsigned(wire44[(1'h1):(1'h0)]) <= (|(wire46 | wire48)))));
  assign wire50 = {(($unsigned((wire45 ?
                              wire48 : wire44)) + $signed($signed((8'hb7)))) ?
                          $signed((wire44[(2'h3):(1'h0)] ?
                              wire44 : (wire47 != wire42))) : $unsigned((^~(-wire42))))};
  assign wire51 = wire47[(1'h1):(1'h0)];
  assign wire52 = ((^$signed(wire46[(1'h0):(1'h0)])) ?
                      $unsigned(wire46) : $unsigned((~^$signed({(7'h40)}))));
  assign wire53 = wire43;
  assign wire54 = ((8'had) <<< (~&((8'ha4) ? wire45 : (8'haa))));
  always
    @(posedge clk) begin
      reg55 <= (~^$unsigned((wire41 ?
          $signed($signed(wire47)) : {$signed(wire51),
              wire44[(3'h5):(3'h5)]})));
      if ((wire54[(1'h0):(1'h0)] >> wire41))
        begin
          reg56 <= wire44[(3'h4):(1'h1)];
        end
      else
        begin
          if (wire53[(1'h0):(1'h0)])
            begin
              reg56 <= (~^((wire52[(2'h2):(1'h1)] ?
                      (~^$unsigned(wire47)) : $unsigned((wire43 <= wire54))) ?
                  $signed(wire46) : wire45));
              reg57 <= (~|$signed(reg56));
            end
          else
            begin
              reg56 <= {wire45[(4'ha):(4'ha)]};
              reg57 <= (~^((wire46[(3'h5):(3'h4)] >> {((7'h43) ^~ wire49)}) ?
                  wire49[(3'h5):(3'h4)] : (wire54 ^ $unsigned(reg55[(5'h10):(4'hc)]))));
              reg58 <= reg56;
              reg59 <= $unsigned((($unsigned(wire45[(4'h9):(2'h2)]) ?
                      ({reg57} < (reg57 ?
                          wire52 : wire44)) : (~&$unsigned(wire53))) ?
                  reg58 : wire51[(2'h2):(2'h2)]));
              reg60 <= ($signed($signed((|(wire41 - reg55)))) ?
                  ($unsigned(((reg56 ?
                          wire52 : reg55) < reg59[(4'h8):(3'h5)])) ?
                      $unsigned(wire50) : $unsigned({(^wire46),
                          (wire48 & reg57)})) : wire49);
            end
          if (wire49)
            begin
              reg61 <= (7'h44);
              reg62 <= ((reg59[(3'h4):(2'h2)] ?
                  ((wire42[(1'h1):(1'h1)] ?
                      (8'haf) : reg58) <= (((8'ha3) == wire41) >= {wire50})) : {((reg58 ^ wire44) ?
                          $signed(reg60) : (~^reg56)),
                      reg57}) >>> wire43[(1'h1):(1'h0)]);
              reg63 <= ($unsigned((8'hac)) + wire50);
            end
          else
            begin
              reg61 <= $signed((^{((wire48 ~^ reg61) ?
                      (reg62 ? (8'ha3) : wire42) : (wire50 ?
                          wire41 : reg58))}));
            end
          reg64 <= ($signed(reg61) + ({$unsigned(wire45[(4'h9):(2'h3)])} ?
              $signed(wire42) : ($signed((reg62 ?
                  wire52 : reg57)) != {wire48[(2'h3):(1'h1)],
                  {(7'h43), reg60}})));
          reg65 <= wire49;
          reg66 <= $unsigned(((^~$unsigned({wire50, reg57})) ?
              ((8'ha2) ?
                  wire43[(3'h5):(3'h5)] : (|$signed((8'h9e)))) : $unsigned((wire41 * (wire42 != wire42)))));
        end
      if ((8'hbf))
        begin
          reg67 <= $unsigned((~|wire46[(1'h1):(1'h1)]));
        end
      else
        begin
          if (reg56[(3'h6):(2'h3)])
            begin
              reg67 <= reg60;
              reg68 <= $signed(((-$signed(wire51[(1'h1):(1'h1)])) << wire42[(1'h0):(1'h0)]));
            end
          else
            begin
              reg67 <= ({{{$signed(wire51)}},
                  reg68} <<< $unsigned(reg57[(3'h6):(2'h3)]));
              reg68 <= reg67[(4'hb):(4'h9)];
              reg69 <= (!wire44);
            end
          if ({(^$signed({(+wire41)}))})
            begin
              reg70 <= (~^(+({reg65} ?
                  (wire53 ? {(8'hba)} : (wire41 >> wire47)) : wire44)));
              reg71 <= reg62;
            end
          else
            begin
              reg70 <= $unsigned(($signed(reg69) < (($unsigned(reg56) ?
                      $unsigned(wire42) : reg62[(2'h3):(1'h0)]) ?
                  {$unsigned(reg70), $unsigned(wire42)} : {wire49,
                      (^(7'h41))})));
              reg71 <= $signed($unsigned((($signed((8'h9e)) ?
                  reg70[(1'h1):(1'h1)] : reg60) && reg56)));
              reg72 <= ($unsigned(reg71[(1'h1):(1'h0)]) ?
                  $unsigned(reg69[(3'h4):(2'h3)]) : reg61);
              reg73 <= ($signed(((^(wire44 * wire52)) ?
                      reg68 : ((wire51 ? wire45 : wire43) ?
                          reg65 : $signed(reg63)))) ?
                  $unsigned(reg58[(3'h6):(2'h2)]) : wire48[(3'h5):(1'h0)]);
              reg74 <= {wire42[(1'h0):(1'h0)]};
            end
          reg75 <= $signed(wire45);
        end
      reg76 <= $signed(wire52[(2'h3):(2'h2)]);
      reg77 <= (reg57 ^~ $unsigned((~^(!(wire54 ? reg64 : wire51)))));
    end
  assign wire78 = (~|reg71);
  assign wire79 = $unsigned({$signed(reg61), $signed({(wire45 ~^ wire78)})});
  assign wire80 = $unsigned({(^reg56[(3'h4):(3'h4)])});
  assign wire81 = ($signed({(&(8'hb6)), (^~$unsigned(reg56))}) ?
                      $signed((((wire50 ? reg58 : wire45) <= (~|wire48)) ?
                          (+$signed(reg63)) : reg63[(4'hd):(4'h9)])) : reg74[(2'h2):(1'h1)]);
  assign wire82 = (~&reg58);
  assign wire83 = ((|(($unsigned(reg74) << wire44[(3'h4):(1'h0)]) ?
                      reg65 : (!$unsigned(reg57)))) ~^ (^($signed((|wire82)) ?
                      wire80 : $unsigned($unsigned(wire81)))));
  assign wire84 = wire82[(4'hf):(4'he)];
  assign wire85 = $unsigned((({(8'ha9),
                      ((7'h42) || (8'h9c))} >>> reg55) ^~ wire46[(1'h0):(1'h0)]));
  assign wire86 = ($signed({(8'hbd), wire85[(5'h14):(3'h4)]}) ?
                      ($unsigned((~(wire54 ?
                          wire80 : wire79))) & reg72[(3'h7):(1'h1)]) : ((7'h41) || $signed({(reg58 ?
                              wire46 : reg71),
                          {reg56, (8'ha8)}})));
endmodule
