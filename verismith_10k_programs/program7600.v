module top
#(parameter param223 = (-{((|((8'ha8) >>> (8'hbc))) <<< (~|((8'hb9) > (8'hbd))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire222;
  wire [(3'h5):(1'h0)] wire220;
  wire signed [(4'h9):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(5'h10):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  reg [(4'he):(1'h0)] reg190 = (1'h0);
  reg [(3'h5):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  assign y = {wire222,
                 wire220,
                 wire186,
                 wire122,
                 wire121,
                 wire118,
                 wire117,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg120,
                 reg119,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire4 = ((wire1 > $unsigned(($unsigned(wire2) || $unsigned(wire3)))) ?
                     wire0[(1'h0):(1'h0)] : $signed(($unsigned((~&wire2)) ?
                         $unsigned((~wire3)) : wire1[(5'h14):(3'h5)])));
  assign wire5 = (|($unsigned(($signed(wire1) ?
                     (wire2 ^ wire1) : wire1)) - $signed((wire0 ?
                     (~&wire4) : wire4))));
  assign wire6 = (7'h41);
  assign wire7 = wire4[(2'h3):(2'h3)];
  assign wire8 = ({(-($signed(wire7) ? (wire5 <<< (8'hb3)) : $unsigned(wire4))),
                         ($signed(wire2) ?
                             wire5[(4'hb):(3'h6)] : $unsigned({wire0,
                                 wire4}))} ?
                     $unsigned($signed({$unsigned((8'h9c)),
                         wire6})) : $unsigned((^~(^wire2))));
  assign wire9 = (^~wire4);
  module10 #() modinst106 (.wire12(wire3), .wire13(wire2), .y(wire105), .wire14(wire9), .clk(clk), .wire11(wire5));
  assign wire107 = $signed(($unsigned((8'hab)) ?
                       $unsigned(((wire9 | wire105) >= $signed(wire0))) : wire8));
  assign wire108 = wire9;
  assign wire109 = (wire3 ?
                       ((wire105[(1'h0):(1'h0)] <= $unsigned($signed((8'hb1)))) >= $signed((|(wire107 == wire105)))) : ((8'hbc) != {((~|wire1) <= {wire6}),
                           $signed($signed(wire6))}));
  assign wire110 = wire105;
  always
    @(posedge clk) begin
      reg111 <= (8'hb8);
      reg112 <= (&$signed($unsigned((8'h9e))));
      if (wire110)
        begin
          reg113 <= (~|wire105[(2'h3):(2'h2)]);
          reg114 <= ((wire108[(4'h9):(4'h9)] ?
                  (($signed(reg111) + (reg111 ~^ wire110)) <<< $signed(wire7[(3'h6):(3'h4)])) : (8'hb7)) ?
              (~|reg113[(2'h2):(2'h2)]) : wire105);
        end
      else
        begin
          if ($signed($unsigned(wire9)))
            begin
              reg113 <= reg112[(1'h1):(1'h1)];
            end
          else
            begin
              reg113 <= $signed({(|reg112[(4'ha):(2'h3)])});
              reg114 <= reg112;
              reg115 <= wire105;
              reg116 <= (~^(~&$unsigned(wire109)));
            end
        end
    end
  assign wire117 = {reg115[(4'hd):(4'h9)],
                       $unsigned($unsigned(((reg111 ~^ reg116) ?
                           (~reg111) : {(8'ha0), (8'hbc)})))};
  assign wire118 = {$unsigned(($signed((wire107 && wire8)) ?
                           wire8 : ((wire5 >> wire1) ?
                               (wire107 ?
                                   wire110 : reg112) : (wire108 == wire6)))),
                       ((~$signed({wire5,
                           wire3})) >>> (&(^~wire2[(4'hb):(2'h2)])))};
  always
    @(posedge clk) begin
      reg119 <= (($signed($unsigned((~|wire118))) ?
          wire1[(4'h9):(3'h7)] : wire105[(3'h4):(3'h4)]) >> wire108);
      reg120 <= (~^(~|$signed(reg115)));
    end
  assign wire121 = $unsigned($unsigned(wire6[(1'h1):(1'h0)]));
  assign wire122 = ((8'hbe) ? (8'ha8) : (~|reg112[(1'h0):(1'h0)]));
  module123 #() modinst187 (.wire126(wire6), .clk(clk), .wire125(reg120), .wire124(reg111), .y(wire186), .wire127(wire4));
  always
    @(posedge clk) begin
      reg188 <= ((($signed((~^wire110)) << $unsigned($signed(wire1))) ?
              (reg119[(3'h5):(1'h0)] ? reg111 : $unsigned(wire4)) : (~^((wire4 ?
                      wire122 : reg120) ?
                  $signed(wire105) : (wire7 >= reg113)))) ?
          $signed(reg111[(4'hc):(3'h6)]) : $unsigned($signed($signed((^~(8'hbd))))));
      if ({wire4, (wire0 ? wire5 : reg120)})
        begin
          reg189 <= reg115[(4'h9):(3'h5)];
        end
      else
        begin
          reg189 <= wire0[(3'h4):(1'h0)];
          reg190 <= wire109[(3'h7):(3'h4)];
          reg191 <= (~&reg112[(2'h3):(1'h0)]);
          reg192 <= (&(~&wire107[(4'ha):(3'h6)]));
        end
      reg193 <= $signed((~(({wire6, reg115} ?
              $unsigned(wire7) : $unsigned(wire5)) ?
          (wire6 ?
              wire109[(1'h0):(1'h0)] : {reg116}) : $unsigned((reg120 - reg188)))));
    end
  module194 #() modinst221 (wire220, clk, wire2, wire108, wire121, wire109);
  assign wire222 = wire105[(2'h3):(1'h1)];
endmodule

module module194  (y, clk, wire198, wire197, wire196, wire195);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire198;
  input wire signed [(5'h14):(1'h0)] wire197;
  input wire signed [(4'hd):(1'h0)] wire196;
  input wire [(5'h10):(1'h0)] wire195;
  wire [(3'h5):(1'h0)] wire219;
  wire signed [(5'h13):(1'h0)] wire217;
  wire signed [(4'hb):(1'h0)] wire201;
  wire [(5'h12):(1'h0)] wire200;
  wire [(4'hd):(1'h0)] wire199;
  assign y = {wire219, wire217, wire201, wire200, wire199, (1'h0)};
  assign wire199 = wire196;
  assign wire200 = (($unsigned(((wire199 ?
                               wire196 : wire199) <= (wire199 > wire199))) ?
                           ((!wire197[(4'hd):(1'h0)]) ?
                               $unsigned((wire198 == wire195)) : $unsigned(wire196[(3'h7):(3'h7)])) : wire196[(3'h5):(1'h1)]) ?
                       (~^(wire196 > (^~(wire196 ^~ wire197)))) : {$unsigned(wire197[(4'h9):(4'h9)])});
  assign wire201 = {$signed(wire197)};
  module202 #() modinst218 (.wire204(wire199), .wire206(wire196), .wire203(wire195), .wire205(wire197), .y(wire217), .clk(clk));
  assign wire219 = $unsigned($signed(wire199));
endmodule

module module123
#(parameter param184 = {(({((8'hb4) ? (8'hbb) : (7'h42))} ~^ ((^~(8'hb9)) ? ((8'h9c) ? (8'ha5) : (8'hb4)) : ((8'hbe) ? (7'h42) : (8'hb0)))) ? (((8'ha4) ? (!(8'h9c)) : ((8'ha2) > (8'hb2))) >>> (~^(+(7'h43)))) : (({(8'hb4), (8'hb1)} - ((8'hac) >>> (8'hb4))) ? {(!(8'haa)), ((8'hae) * (8'hb4))} : (^~(&(8'h9f)))))}, 
parameter param185 = (8'ha7))
(y, clk, wire124, wire125, wire126, wire127);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire124;
  input wire signed [(4'hd):(1'h0)] wire125;
  input wire signed [(3'h7):(1'h0)] wire126;
  input wire signed [(5'h13):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire183;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(4'hf):(1'h0)] wire178;
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(3'h6):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  assign y = {wire183,
                 wire133,
                 wire134,
                 wire135,
                 wire178,
                 reg182,
                 reg181,
                 reg180,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire124)
        begin
          reg128 <= wire127[(4'hf):(3'h4)];
          reg129 <= (&$unsigned(wire125[(1'h1):(1'h1)]));
          reg130 <= $unsigned((reg129 >= $unsigned(reg129)));
          reg131 <= $signed({reg129});
          reg132 <= (~$unsigned(wire126[(3'h7):(1'h1)]));
        end
      else
        begin
          reg128 <= (^($signed((reg129[(4'hb):(3'h7)] ?
              $unsigned(reg130) : $signed((8'ha6)))) > ($signed($unsigned(wire124)) >>> reg130)));
          reg129 <= $signed(reg131);
          reg130 <= reg128;
          reg131 <= (reg129 ?
              {reg131,
                  reg128} : ((&{{(8'ha8)}}) >>> (wire125[(2'h2):(2'h2)] <= $unsigned(reg128))));
          reg132 <= $signed($unsigned($unsigned($unsigned(((8'h9d) & wire125)))));
        end
    end
  assign wire133 = reg128;
  assign wire134 = {(~&$signed(wire133))};
  assign wire135 = ((&($signed((wire127 ?
                           reg130 : wire124)) & $signed(wire125[(1'h1):(1'h1)]))) ?
                       wire134[(1'h1):(1'h0)] : wire133);
  module136 #() modinst179 (wire178, clk, wire134, wire135, wire127, wire133, wire125);
  always
    @(posedge clk) begin
      reg180 <= (wire124[(2'h2):(2'h2)] != wire178);
      reg181 <= ({(&{$signed(reg128), $unsigned((8'hab))}),
          wire135} || $signed($unsigned($unsigned({reg128}))));
      reg182 <= $signed(reg132[(1'h1):(1'h0)]);
    end
  assign wire183 = $signed(reg180[(1'h0):(1'h0)]);
endmodule

module module10
#(parameter param104 = (((~|(~(^(8'hbf)))) << (~&((^~(7'h44)) - ((7'h40) ? (8'hb8) : (8'hba))))) ? (|((((8'hb9) ^~ (8'hb9)) << (!(8'hb9))) ^~ (8'h9c))) : ((!{(!(8'hbd)), {(8'ha9), (8'h9c)}}) ? ((((7'h42) != (8'h9e)) ? ((8'ha4) ? (8'hbb) : (8'ha7)) : (+(8'hb3))) ? ((~&(8'ha6)) ? (^~(8'hb3)) : ((8'ha0) ? (8'ha9) : (8'hb2))) : (&((8'haa) <= (8'ha5)))) : (&((~^(8'hb2)) != (-(8'hac)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h1c1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire17;
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire71,
                 wire65,
                 wire63,
                 wire17,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= (8'ha2);
      reg16 <= (((+$signed((|wire13))) ~^ wire11) ?
          wire12[(4'h8):(3'h5)] : wire11[(1'h0):(1'h0)]);
    end
  assign wire17 = $unsigned($unsigned({wire12[(1'h0):(1'h0)]}));
  module18 #() modinst64 (.wire21(reg16), .wire23(wire11), .wire20(wire13), .wire22(wire14), .y(wire63), .wire19(wire12), .clk(clk));
  assign wire65 = $signed(wire12);
  always
    @(posedge clk) begin
      reg66 <= ($signed($signed($signed($unsigned(reg16)))) ?
          $unsigned((({wire17, (8'hb5)} ?
              wire63[(3'h5):(1'h0)] : (wire14 ? reg16 : (7'h41))) && (|(wire17 ?
              (8'ha6) : reg16)))) : wire14);
      reg67 <= (-wire11);
      if (reg15[(2'h3):(2'h2)])
        begin
          if (wire63[(3'h6):(1'h1)])
            begin
              reg68 <= $unsigned((reg15[(1'h0):(1'h0)] > reg67));
            end
          else
            begin
              reg68 <= ((($signed((8'hb6)) ^ (-reg15)) ~^ ({reg16} ?
                      $signed(reg67) : (+{(8'hb4)}))) ?
                  wire65 : {$unsigned($unsigned($signed(reg15)))});
              reg69 <= $signed(wire12[(3'h4):(1'h1)]);
              reg70 <= $signed(((8'hba) || (!reg68)));
            end
        end
      else
        begin
          reg68 <= (reg67 ?
              $unsigned(($signed(reg69[(1'h1):(1'h1)]) ?
                  reg15 : reg69)) : (((-$unsigned((8'had))) ?
                      $unsigned(((8'ha5) | wire17)) : {(reg67 ~^ wire65)}) ?
                  (({wire14, wire63} ? reg15[(1'h0):(1'h0)] : reg70) ?
                      ((!wire63) ?
                          wire11[(4'hc):(3'h5)] : $unsigned(wire11)) : reg16) : ($signed(reg67[(1'h0):(1'h0)]) ?
                      (+(reg15 ? reg16 : reg68)) : wire17)));
          reg69 <= {wire63[(1'h1):(1'h0)],
              $signed($unsigned({(wire63 ? reg67 : reg70)}))};
        end
    end
  assign wire71 = reg16;
  always
    @(posedge clk) begin
      reg72 <= ($signed((8'hbf)) ?
          wire14[(3'h6):(2'h3)] : ($signed($unsigned((~&reg69))) >>> (|$unsigned($unsigned(reg69)))));
      reg73 <= wire13;
      if ((8'ha6))
        begin
          if (wire12[(2'h2):(1'h1)])
            begin
              reg74 <= (8'hb1);
              reg75 <= $signed(wire14[(4'he):(1'h1)]);
              reg76 <= ((|(wire11[(3'h4):(2'h2)] ?
                      (&$unsigned(wire14)) : wire65)) ?
                  {$signed((reg15 == reg15))} : (~{(~reg67[(3'h5):(2'h3)])}));
              reg77 <= $signed(reg69);
            end
          else
            begin
              reg74 <= $signed(reg15[(2'h3):(2'h3)]);
            end
          if ((~&reg77[(3'h4):(3'h4)]))
            begin
              reg78 <= reg68;
              reg79 <= wire71[(2'h2):(2'h2)];
              reg80 <= $unsigned($signed({$unsigned(reg66[(3'h4):(3'h4)]),
                  ((wire17 * wire13) >>> wire65)}));
            end
          else
            begin
              reg78 <= (~^(~^reg75[(3'h4):(2'h2)]));
              reg79 <= $signed((!(~reg72)));
              reg80 <= reg78[(1'h0):(1'h0)];
              reg81 <= $signed((!$signed(({wire17,
                  reg73} >= $unsigned((8'hba))))));
              reg82 <= $signed(($unsigned(($unsigned((7'h43)) ?
                  (^~reg15) : (~|reg80))) ~^ (($signed(reg74) - reg78[(1'h1):(1'h0)]) ?
                  wire13 : $unsigned($signed((8'hbb))))));
            end
          reg83 <= (-reg80[(1'h1):(1'h0)]);
          if ($unsigned((($signed($signed(reg16)) ?
                  wire17[(3'h4):(2'h2)] : $signed(reg15[(2'h2):(2'h2)])) ?
              (+reg73) : (((reg76 >> reg74) ~^ wire63) ?
                  reg70 : (~^(wire65 <= (8'ha4)))))))
            begin
              reg84 <= $signed((~&((reg83[(2'h2):(1'h1)] && reg82) ?
                  {$unsigned((8'ha2))} : $unsigned($signed((8'hbb))))));
              reg85 <= (&(|$unsigned(($unsigned(wire13) ^~ (wire13 ?
                  wire13 : wire13)))));
            end
          else
            begin
              reg84 <= $signed(($unsigned((wire13[(3'h7):(3'h7)] ^ {(8'h9c),
                      wire12})) ?
                  ((reg78 ?
                      $unsigned(wire11) : (reg67 << reg76)) | $signed((reg76 ?
                      reg80 : wire14))) : (!(~$signed(wire71)))));
              reg85 <= {$signed($signed((&$signed((8'h9d))))),
                  (+wire65[(1'h0):(1'h0)])};
              reg86 <= $signed(((reg15 ?
                  (~wire71) : $unsigned($signed(reg16))) >= wire17));
            end
          reg87 <= $unsigned(wire12);
        end
      else
        begin
          reg74 <= (8'hb0);
          reg75 <= $signed($signed(reg75));
          reg76 <= ((8'haa) ? (~|{$unsigned(reg79)}) : {wire63});
          reg77 <= (8'hab);
        end
    end
  assign wire88 = reg80;
  assign wire89 = reg68;
  assign wire90 = ((|$signed((~^(reg73 ~^ wire65)))) ~^ $signed($unsigned((reg84 ?
                      $signed(reg84) : wire11))));
  assign wire91 = (($signed(wire13) ?
                          ($unsigned({(8'h9e)}) ?
                              $unsigned((|(8'hb0))) : $unsigned((reg77 >> reg81))) : reg85) ?
                      ($unsigned(wire17) ?
                          reg87[(3'h7):(3'h7)] : (((reg70 & reg74) ?
                                  (|reg16) : (!wire90)) ?
                              $unsigned(reg67[(2'h2):(2'h2)]) : {$unsigned((8'ha0))})) : (reg67 ?
                          (7'h42) : wire89[(2'h3):(1'h0)]));
  assign wire92 = wire13[(3'h4):(1'h0)];
  assign wire93 = ((^$signed((((8'ha2) == wire63) ?
                      ((8'hbe) ?
                          wire12 : (8'hbe)) : (wire88 >= reg67)))) | wire89);
  always
    @(posedge clk) begin
      if ($unsigned((&$unsigned((((8'haa) && (8'h9e)) != reg80)))))
        begin
          reg94 <= (+({{((8'ha7) ? wire17 : reg16), {wire11, reg66}}, reg67} ?
              reg66 : ((8'ha1) ~^ reg77[(4'h8):(1'h1)])));
          if ((^~$unsigned($signed($signed(((8'hb9) - reg72))))))
            begin
              reg95 <= reg87[(2'h3):(1'h0)];
              reg96 <= reg95;
              reg97 <= (!wire65);
              reg98 <= (-((($unsigned(reg96) ? reg77 : $signed(reg83)) ?
                      reg87[(3'h5):(2'h2)] : $unsigned((~&reg76))) ?
                  reg79 : {((wire65 >= reg86) ~^ (+reg73)),
                      wire65[(1'h1):(1'h1)]}));
            end
          else
            begin
              reg95 <= reg97[(4'hc):(3'h7)];
            end
          reg99 <= reg66;
          reg100 <= (~^$signed(wire65));
        end
      else
        begin
          reg94 <= reg78;
          reg95 <= {$unsigned($signed(reg67[(4'h9):(2'h3)])),
              reg83[(3'h5):(1'h1)]};
          reg96 <= ((wire71 == reg78) ~^ reg15[(2'h3):(2'h3)]);
        end
      reg101 <= $signed((&$signed($unsigned((reg76 > reg81)))));
      reg102 <= wire63[(1'h1):(1'h0)];
      reg103 <= ((reg69[(3'h7):(3'h4)] ?
              (wire17[(1'h1):(1'h0)] ?
                  $unsigned((~reg82)) : (reg16[(2'h3):(1'h0)] & ((8'ha9) ?
                      reg102 : reg96))) : (reg101[(2'h2):(1'h1)] || $signed((wire91 ?
                  (8'hb4) : wire63)))) ?
          reg68[(3'h5):(1'h0)] : $unsigned($unsigned(((reg84 < wire14) & reg86[(4'hd):(4'hd)]))));
    end
endmodule

module module18
#(parameter param61 = (!(+(~|(7'h43)))), 
parameter param62 = (^param61))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(4'h9):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire25,
                 wire24,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
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
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = ($unsigned((wire19[(2'h3):(2'h2)] ?
                          (wire21[(3'h7):(2'h3)] >> $unsigned(wire22)) : (^~$unsigned(wire19)))) ?
                      (wire21[(3'h4):(1'h0)] & wire19[(3'h6):(3'h6)]) : (&(!$unsigned(wire20[(1'h1):(1'h1)]))));
  assign wire25 = ($signed(wire20[(2'h2):(2'h2)]) ?
                      $signed(($signed((~&wire24)) >>> $unsigned(wire23))) : (+wire21));
  always
    @(posedge clk) begin
      if ($signed($unsigned(($unsigned(wire21[(3'h4):(1'h0)]) + ((|wire25) ?
          $signed(wire23) : $unsigned(wire22))))))
        begin
          reg26 <= (&$unsigned(wire22));
        end
      else
        begin
          reg26 <= $signed({wire21, wire20});
          if ((^~$unsigned($signed((((7'h42) | (8'h9d)) ?
              {wire22} : (wire25 ? wire23 : (8'ha7)))))))
            begin
              reg27 <= $unsigned(wire19[(1'h0):(1'h0)]);
            end
          else
            begin
              reg27 <= (8'h9c);
              reg28 <= (~(~&$signed(((reg27 > wire24) ?
                  $signed(wire23) : wire25))));
            end
          reg29 <= $signed(wire21);
          reg30 <= wire23[(1'h1):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg31 <= $signed(wire23);
      if (reg31[(4'ha):(3'h4)])
        begin
          if (wire24)
            begin
              reg32 <= reg31[(3'h5):(1'h0)];
              reg33 <= (reg29[(3'h7):(2'h2)] < $unsigned((8'hb8)));
            end
          else
            begin
              reg32 <= wire23;
              reg33 <= $signed($unsigned(((^(~|wire21)) >= (8'ha0))));
            end
          reg34 <= (((~(&(reg32 ? wire23 : (8'hac)))) ?
              ($signed(wire23[(4'hf):(4'he)]) ?
                  ((reg31 < wire21) ?
                      (wire21 ?
                          wire24 : reg28) : wire20) : (reg27 & $signed((8'hb5)))) : reg33) ^ $unsigned($signed((-wire19[(1'h0):(1'h0)]))));
          if ($unsigned($signed((^wire19))))
            begin
              reg35 <= reg28[(1'h0):(1'h0)];
              reg36 <= $signed(reg28);
            end
          else
            begin
              reg35 <= (^~reg35[(2'h2):(1'h0)]);
              reg36 <= wire23[(3'h4):(3'h4)];
              reg37 <= $unsigned((wire19 != $unsigned(($unsigned((8'hac)) ?
                  (~|(8'haa)) : (reg36 ? reg28 : reg27)))));
              reg38 <= (8'ha4);
              reg39 <= (!reg31);
            end
          reg40 <= ($signed(reg29) >>> $unsigned($signed(reg33)));
        end
      else
        begin
          if ((|$signed($signed({{wire25}, (^~reg40)}))))
            begin
              reg32 <= ((^(((~^reg40) & (-wire23)) ?
                  $signed((~&wire23)) : $unsigned((reg32 * reg35)))) >= ($unsigned((reg31[(3'h7):(1'h0)] < (!reg34))) - wire24[(4'ha):(3'h4)]));
            end
          else
            begin
              reg32 <= $unsigned(((reg30 ?
                      (reg29 ^~ reg30[(1'h0):(1'h0)]) : (-(reg34 < wire25))) ?
                  reg27 : {((+wire25) < (8'hab))}));
              reg33 <= reg28[(3'h6):(1'h0)];
            end
          reg34 <= ((wire25[(3'h7):(2'h2)] < (($signed(reg33) ?
                      reg36[(1'h1):(1'h0)] : reg33) ?
                  $unsigned((wire24 ?
                      reg32 : reg28)) : wire23[(2'h2):(1'h0)])) ?
              wire19[(3'h5):(2'h3)] : ((~|(reg38[(3'h4):(1'h1)] << (wire20 | reg28))) * {($unsigned(reg28) ?
                      (~|reg28) : reg29),
                  (+$signed((8'ha4)))}));
        end
      reg41 <= $signed((~($signed(((8'h9f) ?
          wire24 : reg38)) < reg40[(3'h7):(3'h4)])));
    end
  assign wire42 = ({reg31[(1'h1):(1'h1)],
                      {wire20[(2'h3):(2'h2)]}} != {reg38[(3'h7):(1'h0)]});
  assign wire43 = (|$unsigned(($unsigned(wire22) ?
                      reg29[(4'he):(3'h5)] : (^$signed(wire20)))));
  assign wire44 = reg28[(1'h1):(1'h1)];
  assign wire45 = $signed((wire25[(4'hb):(3'h5)] >= (+(|{(7'h41), reg41}))));
  assign wire46 = $signed(wire19);
  assign wire47 = reg37[(4'hd):(3'h5)];
  always
    @(posedge clk) begin
      if ((reg38[(2'h3):(2'h3)] < $signed((!$signed(reg33[(5'h11):(5'h10)])))))
        begin
          reg48 <= (($unsigned(($unsigned(wire42) ~^ (8'hbd))) < ($unsigned((wire45 ?
                  reg30 : (8'ha0))) - reg31[(3'h4):(1'h1)])) ?
              reg37[(3'h7):(2'h2)] : ((($unsigned(wire20) < reg35[(2'h2):(1'h1)]) << (|{reg27,
                      reg26})) ?
                  $signed(reg35[(1'h1):(1'h1)]) : $signed((^~(reg35 ?
                      (8'hb7) : (8'ha7))))));
        end
      else
        begin
          reg48 <= reg27;
          reg49 <= (~&({wire25,
              $signed($signed((8'ha1)))} != reg31[(3'h6):(3'h5)]));
        end
      reg50 <= (reg31 && $unsigned(wire22));
      reg51 <= (&reg37[(5'h14):(4'ha)]);
      reg52 <= reg35[(1'h1):(1'h1)];
    end
  assign wire53 = ($signed($signed($signed(wire22[(1'h0):(1'h0)]))) - (reg30[(1'h0):(1'h0)] >>> {($signed(wire46) - (reg48 ?
                          reg32 : wire47))}));
  assign wire54 = wire46;
  assign wire55 = (-reg37[(4'hc):(4'hc)]);
  assign wire56 = (((8'hbf) >> (!$signed(wire25[(3'h5):(3'h4)]))) & (($signed($signed((8'ha6))) && ($signed(reg52) ?
                          {wire46} : reg34[(1'h0):(1'h0)])) ?
                      $signed(($signed(wire20) && (reg40 ?
                          wire22 : reg31))) : (+({wire45} ?
                          (&reg27) : wire46[(3'h5):(3'h5)]))));
  assign wire57 = reg34;
  assign wire58 = ($signed($signed(wire24)) ?
                      reg52 : $unsigned((({reg34} ?
                          reg50 : $unsigned((8'hba))) ^~ reg51[(3'h4):(3'h4)])));
  assign wire59 = $unsigned(($unsigned((reg32[(2'h3):(1'h0)] ?
                          (7'h43) : wire46[(3'h6):(3'h6)])) ?
                      $unsigned((wire45[(4'ha):(3'h7)] ^~ (wire45 ?
                          reg49 : reg32))) : ((((8'hb1) > wire21) ?
                              (-reg35) : $signed(reg36)) ?
                          reg38[(3'h7):(3'h6)] : ((-reg29) ?
                              (~&reg32) : (|reg40)))));
  assign wire60 = $signed((^~(|reg36)));
endmodule

module module136
#(parameter param176 = (((+(((8'haf) ? (8'hb9) : (8'hb8)) < (~^(8'hb5)))) ? (~|(((8'hb0) ? (8'hb9) : (8'hb6)) + ((8'hb7) ? (8'hab) : (8'hb2)))) : (~^((8'hb9) ? ((7'h42) ? (8'hb8) : (8'ha7)) : (7'h42)))) <<< ((~(~^(&(8'hb3)))) ~^ (~(^~{(8'ha9), (8'h9f)})))), 
parameter param177 = {param176})
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire141;
  input wire [(5'h13):(1'h0)] wire140;
  input wire [(4'hf):(1'h0)] wire139;
  input wire signed [(4'hf):(1'h0)] wire138;
  input wire signed [(4'hd):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  wire [(5'h12):(1'h0)] wire160;
  wire [(4'ha):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire157;
  wire signed [(5'h11):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire153;
  wire [(5'h10):(1'h0)] wire152;
  wire [(4'hd):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire142;
  reg signed [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(2'h2):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire149,
                 wire148,
                 wire144,
                 wire143,
                 wire142,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg151,
                 reg150,
                 reg147,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire142 = ($signed((~&wire137[(4'h8):(1'h0)])) ?
                       (($signed(wire141) ?
                           {wire140} : wire141) ^~ {$unsigned($unsigned(wire138)),
                           wire140[(3'h6):(1'h0)]}) : {$unsigned(((8'hbf) ?
                               (wire139 || wire141) : {wire140}))});
  assign wire143 = (!((!wire139[(3'h7):(2'h2)]) ^ (~|$unsigned($signed(wire141)))));
  assign wire144 = ((((!$unsigned(wire138)) ?
                               wire138[(1'h1):(1'h0)] : (|$signed(wire143))) ?
                           (^(+wire139)) : $signed((wire140 ?
                               (+wire138) : (8'hb8)))) ?
                       wire138 : (-wire139[(4'hc):(4'hc)]));
  always
    @(posedge clk) begin
      reg145 <= $signed((|wire142[(1'h0):(1'h0)]));
      reg146 <= ((~^(-$signed(wire137))) != wire143[(5'h10):(4'hd)]);
      reg147 <= reg145;
    end
  assign wire148 = ((~^((^~reg147[(3'h5):(1'h1)]) ?
                       wire144 : wire142[(3'h5):(2'h2)])) == (((|wire142) >> ((&reg147) <<< $signed((8'hb3)))) ?
                       (({reg147,
                           reg146} || (8'ha7)) >> (~^reg147[(2'h2):(1'h0)])) : (wire138[(3'h6):(1'h0)] ?
                           $signed((8'hb6)) : (8'hb6))));
  assign wire149 = (reg147[(3'h6):(3'h5)] <<< {(reg147[(3'h5):(3'h5)] ?
                           $unsigned(wire144) : $signed($signed(wire140))),
                       $signed((wire140 ? $signed((8'hb2)) : wire140))});
  always
    @(posedge clk) begin
      reg150 <= ($signed(wire141) * {wire141[(1'h0):(1'h0)],
          (wire137[(4'h9):(3'h4)] ?
              ((+wire141) ? $unsigned(reg147) : (reg147 ^ reg145)) : ((8'haa) ?
                  {wire142, (8'hb6)} : $signed(wire139)))});
      reg151 <= $signed((wire148 ?
          (|$signed((reg146 ? wire149 : wire137))) : (wire144 ?
              reg147[(2'h3):(2'h3)] : $unsigned((wire138 ^ reg150)))));
    end
  assign wire152 = (~&(^~((+(wire140 ?
                       wire144 : wire144)) == $unsigned((&wire144)))));
  assign wire153 = reg151;
  assign wire154 = (wire137[(4'hb):(1'h1)] ?
                       wire140[(4'hb):(4'h8)] : $signed((+$signed(reg146))));
  assign wire155 = $signed($unsigned(((^$signed((8'h9f))) <<< $unsigned(((8'ha7) ^~ wire148)))));
  assign wire156 = wire152[(5'h10):(5'h10)];
  assign wire157 = wire153;
  assign wire158 = {($signed((wire138 && $unsigned((7'h43)))) < wire155),
                       wire152[(4'hc):(1'h0)]};
  assign wire159 = (&wire144);
  assign wire160 = ($signed(wire149[(4'ha):(2'h2)]) ?
                       ($signed($unsigned((~|wire149))) ^~ (wire148[(2'h3):(2'h2)] <<< wire144[(3'h5):(2'h2)])) : wire158);
  assign wire161 = ({$signed(wire141[(1'h0):(1'h0)])} <<< $unsigned($signed(wire148)));
  assign wire162 = (wire157 ?
                       wire156 : $unsigned($unsigned((wire138 * {wire161}))));
  always
    @(posedge clk) begin
      reg163 <= wire160;
      if ($signed($unsigned($signed(((wire159 ?
          wire137 : wire148) <= $unsigned(wire141))))))
        begin
          reg164 <= ((^($signed((|wire142)) ?
              $signed(wire158[(2'h3):(2'h2)]) : wire148)) > $unsigned({$unsigned(wire155[(4'he):(4'h9)]),
              $signed($unsigned(wire149))}));
          reg165 <= $signed(reg151[(1'h1):(1'h1)]);
          reg166 <= (((((wire154 >> reg165) + wire153) ?
              (wire154 ?
                  (wire162 ?
                      wire139 : wire142) : $signed((8'hb2))) : reg165) + $signed((~|$signed(reg165)))) * {(+$unsigned($unsigned(reg151)))});
          if ($unsigned(((~{$unsigned(reg146)}) ?
              (wire158[(1'h0):(1'h0)] && (~reg146)) : (&(^$unsigned((8'h9f)))))))
            begin
              reg167 <= ($unsigned($unsigned(({(7'h44)} ?
                      (wire144 >= reg163) : (wire149 + wire159)))) ?
                  wire137 : (~^{wire161[(4'h9):(2'h2)]}));
            end
          else
            begin
              reg167 <= $signed($unsigned($unsigned((~^(reg150 ?
                  wire140 : wire161)))));
              reg168 <= $unsigned((-reg147[(3'h6):(2'h2)]));
            end
        end
      else
        begin
          reg164 <= wire154[(4'he):(4'hb)];
          reg165 <= wire161;
          if ($signed($unsigned(wire155)))
            begin
              reg166 <= {((reg146[(3'h6):(3'h6)] ?
                          wire153 : ($signed(wire154) > (^~wire155))) ?
                      wire153[(2'h2):(1'h0)] : ({reg164} - (!$signed(wire157)))),
                  wire152};
              reg167 <= $signed((^~(-(wire156[(3'h6):(3'h4)] ?
                  $signed(wire137) : reg151))));
            end
          else
            begin
              reg166 <= $unsigned(reg147);
              reg167 <= (($signed((wire137[(4'hc):(3'h5)] ?
                      (wire157 ~^ reg150) : (^reg150))) || $signed(((reg164 || reg166) ?
                      {wire154} : (reg168 ? wire156 : wire140)))) ?
                  wire139[(3'h5):(1'h1)] : ($signed($signed(reg163)) - wire152));
              reg168 <= ($signed(reg145) ~^ (reg166 | ($signed($signed(wire144)) ?
                  wire148[(3'h6):(2'h2)] : {$unsigned(reg163)})));
            end
          reg169 <= $signed((wire148 ?
              wire153[(3'h4):(3'h4)] : $unsigned(((reg163 ~^ wire159) ?
                  $signed(reg145) : $signed(wire153)))));
          reg170 <= (^~(8'hbf));
        end
      reg171 <= wire154[(4'h8):(2'h3)];
    end
  assign wire172 = (^~reg163[(3'h6):(3'h4)]);
  assign wire173 = (~(^~reg150[(2'h2):(1'h0)]));
  assign wire174 = $unsigned(reg145);
  assign wire175 = (reg151 ? wire174[(4'h8):(2'h3)] : reg165[(4'h9):(4'h9)]);
endmodule

module module202
#(parameter param215 = (((~|(((7'h42) ? (8'ha4) : (8'hbe)) & ((8'ha5) ? (8'ha1) : (8'hb1)))) <= (^~(!((8'ha3) ? (8'ha9) : (7'h43))))) ? (({((8'hb0) + (8'hb8))} ? (|{(8'hbd), (8'hb1)}) : (((8'h9c) ^ (8'ha8)) >= {(8'hbe), (8'hb2)})) > {{((8'hb0) ? (8'hab) : (8'ha2)), ((8'ha8) ~^ (8'hbc))}, {(&(8'ha7))}}) : ((~&(!(~|(8'ha1)))) ~^ (-(~^{(8'hb4)})))), 
parameter param216 = param215)
(y, clk, wire206, wire205, wire204, wire203);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire206;
  input wire signed [(3'h6):(1'h0)] wire205;
  input wire signed [(3'h5):(1'h0)] wire204;
  input wire signed [(5'h10):(1'h0)] wire203;
  wire signed [(2'h2):(1'h0)] wire214;
  wire [(4'h8):(1'h0)] wire213;
  wire signed [(2'h3):(1'h0)] wire212;
  wire [(4'hd):(1'h0)] wire211;
  wire [(2'h2):(1'h0)] wire207;
  reg [(5'h12):(1'h0)] reg210 = (1'h0);
  reg [(2'h3):(1'h0)] reg209 = (1'h0);
  reg [(3'h7):(1'h0)] reg208 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire207,
                 reg210,
                 reg209,
                 reg208,
                 (1'h0)};
  assign wire207 = (wire203 ~^ wire204);
  always
    @(posedge clk) begin
      reg208 <= $signed(($unsigned($unsigned((^wire205))) <<< $signed(((~&wire206) | (^wire205)))));
      reg209 <= wire205[(3'h6):(3'h5)];
      reg210 <= $unsigned((^~((&((8'h9f) ? (8'hb3) : (7'h43))) ?
          wire203 : wire207[(1'h0):(1'h0)])));
    end
  assign wire211 = wire207[(1'h1):(1'h0)];
  assign wire212 = ({wire207[(1'h0):(1'h0)]} < (wire204[(3'h5):(1'h0)] ?
                       reg208 : wire203[(4'h9):(3'h5)]));
  assign wire213 = wire211[(1'h0):(1'h0)];
  assign wire214 = $signed((~wire211));
endmodule
