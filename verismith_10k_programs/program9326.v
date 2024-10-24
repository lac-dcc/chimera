module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(3'h4):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire signed [(3'h6):(1'h0)] wire158;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire163;
  wire signed [(4'hc):(1'h0)] wire164;
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire4,
                 wire5,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire154,
                 wire163,
                 wire164,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire4 = ($unsigned((wire0[(3'h6):(1'h0)] ^~ ({wire0} ?
                         $signed(wire3) : wire0[(1'h0):(1'h0)]))) ?
                     wire3 : wire1);
  assign wire5 = wire4[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      if (($unsigned($unsigned((~&$unsigned(wire1)))) > ($unsigned(wire1) >>> (~|$unsigned((wire5 ?
          (8'hbb) : wire5))))))
        begin
          reg6 <= $signed({((~|wire2) <= $unsigned((wire1 & wire3))),
              {(^~wire5[(5'h11):(4'hc)])}});
        end
      else
        begin
          if (wire3)
            begin
              reg6 <= (wire1 ?
                  ((wire1 ?
                          ((wire0 ?
                              wire0 : wire5) >> (!wire2)) : (wire3[(2'h3):(2'h2)] ?
                              $signed(wire4) : wire5[(4'h9):(3'h5)])) ?
                      (8'hb8) : $unsigned($signed((reg6 ?
                          wire0 : wire3)))) : (~|$signed($unsigned({(8'hac),
                      wire3}))));
              reg7 <= wire4[(2'h3):(1'h1)];
              reg8 <= (!$signed($unsigned($unsigned(wire1[(1'h1):(1'h1)]))));
              reg9 <= $signed(wire5[(4'he):(4'h9)]);
            end
          else
            begin
              reg6 <= (8'hae);
              reg7 <= wire4[(2'h2):(2'h2)];
              reg8 <= ((8'hb8) ?
                  (~(reg7[(2'h2):(2'h2)] <<< (^$signed(wire2)))) : ($signed(((|reg9) ?
                      reg6 : reg6[(3'h6):(2'h2)])) != reg9[(1'h1):(1'h1)]));
              reg9 <= $signed((~(&((7'h40) ?
                  $unsigned(wire2) : wire1[(4'he):(4'he)]))));
            end
          reg10 <= wire5[(4'ha):(1'h1)];
        end
      reg11 <= wire4;
      reg12 <= wire1;
    end
  assign wire13 = $signed($unsigned((((reg10 ? (7'h43) : reg11) ?
                          (reg10 ? (7'h43) : wire3) : reg9) ?
                      (wire3[(5'h10):(4'h8)] << $signed(reg8)) : reg10[(3'h4):(2'h2)])));
  assign wire14 = (reg6 << (~(~|((8'ha6) ? wire13 : reg7))));
  assign wire15 = (($signed(((wire4 ? (8'hbc) : wire14) > $unsigned((8'h9c)))) ?
                      {$unsigned({reg6, wire14}),
                          $signed({wire13,
                              wire3})} : wire4) * $unsigned((&((~^reg10) ?
                      $signed(reg9) : (wire0 || reg6)))));
  assign wire16 = ($signed((!$signed((wire5 ? reg7 : wire0)))) ?
                      (wire14[(5'h11):(5'h11)] ?
                          (!((wire15 >> reg12) > wire1)) : ($unsigned($unsigned((8'hbd))) >>> ($unsigned(reg10) ?
                              (wire4 ^ reg12) : {reg6}))) : $unsigned($unsigned(($unsigned(wire2) ?
                          wire3[(5'h13):(3'h7)] : $signed(wire5)))));
  module17 #() modinst155 (.wire18(reg7), .wire20(reg12), .y(wire154), .wire21(wire15), .clk(clk), .wire22(wire3), .wire19(wire1));
  assign wire156 = (8'hb9);
  assign wire157 = (~&(&$signed(wire5)));
  assign wire158 = $signed(wire154[(3'h6):(2'h3)]);
  assign wire159 = ((&(&wire157[(2'h3):(2'h3)])) && $signed((~&($signed(wire2) ^ (wire3 ?
                       reg10 : reg12)))));
  assign wire160 = wire15[(4'hb):(4'hb)];
  module23 #() modinst162 (wire161, clk, reg11, wire15, reg9, wire2, wire5);
  assign wire163 = $unsigned($unsigned(wire5));
  module38 #() modinst165 (.y(wire164), .wire39(wire4), .wire41(wire158), .clk(clk), .wire40(reg11), .wire42(wire5));
endmodule

module module17
#(parameter param152 = (-(((~^((8'ha0) == (8'hbd))) << (((8'hbd) ? (8'ha4) : (7'h44)) != ((8'hae) ? (8'hb3) : (7'h41)))) >> ((((7'h43) & (8'haf)) ^ ((8'ha0) ? (8'hb5) : (8'ha3))) < (-((8'hb2) ? (8'hab) : (8'hba)))))), 
parameter param153 = (8'ha0))
(y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire146;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire36;
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  assign y = {wire148,
                 wire146,
                 wire93,
                 wire91,
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
                 wire54,
                 wire36,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  module23 #() modinst37 (wire36, clk, wire21, wire22, wire18, wire20, wire19);
  module38 #() modinst55 (wire54, clk, wire22, wire36, wire18, wire20);
  assign wire56 = ((wire18 >>> {(&((7'h40) & (8'hb0)))}) == (+(~|$signed((~&wire20)))));
  assign wire57 = (((wire54 * {(~&wire20)}) >= wire22[(3'h6):(3'h4)]) ?
                      (+$unsigned($unsigned((wire36 ?
                          wire36 : wire56)))) : wire36);
  assign wire58 = (($unsigned($signed((wire56 >= wire20))) | (|((~|(8'hbe)) <= $unsigned(wire21)))) != ((-(wire21[(4'ha):(4'h9)] ?
                      $unsigned(wire57) : (wire57 ?
                          wire21 : wire21))) >> $signed((^$unsigned(wire21)))));
  assign wire59 = wire21;
  assign wire60 = $unsigned($unsigned({({wire54, wire58} ~^ {wire21,
                          wire54})}));
  assign wire61 = (~^(8'ha6));
  assign wire62 = (^~$signed(wire19[(3'h4):(1'h1)]));
  assign wire63 = $unsigned(wire54[(3'h7):(3'h7)]);
  assign wire64 = $unsigned(wire19);
  assign wire65 = {$unsigned($signed((^~wire56[(2'h3):(2'h2)]))),
                      wire60[(5'h12):(3'h6)]};
  module66 #() modinst92 (wire91, clk, wire57, wire63, wire21, wire19);
  assign wire93 = $unsigned($unsigned((~$unsigned((~^wire54)))));
  module94 #() modinst147 (.clk(clk), .wire97(wire64), .wire95(wire58), .y(wire146), .wire98(wire57), .wire96(wire91));
  assign wire148 = wire56[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg149 <= ((~&(8'h9c)) ?
          $unsigned((&(wire54[(3'h7):(1'h1)] ?
              ((7'h42) || wire56) : $signed(wire146)))) : $unsigned($unsigned(((~wire18) < $unsigned(wire56)))));
      reg150 <= wire58;
      reg151 <= (^((($unsigned(wire64) ? {wire146} : $unsigned(wire58)) ?
              wire93[(2'h2):(1'h1)] : wire22) ?
          ({(wire21 ? wire21 : (8'hbd)), $signed(wire64)} ?
              wire36[(5'h13):(5'h12)] : $signed((~^wire58))) : (8'hb7)));
    end
endmodule

module module94  (y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire [(3'h4):(1'h0)] wire97;
  input wire signed [(5'h14):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire [(3'h4):(1'h0)] wire99;
  reg [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
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
                 reg125,
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
                 (1'h0)};
  assign wire99 = $signed($unsigned(($unsigned((~|wire96)) ?
                      wire95[(4'h9):(2'h3)] : ($unsigned((7'h44)) ?
                          wire96 : (wire97 <= wire97)))));
  assign wire100 = (8'ha2);
  assign wire101 = $signed(wire98);
  assign wire102 = (|(7'h41));
  assign wire103 = (+wire101[(5'h15):(5'h14)]);
  assign wire104 = $signed((!($unsigned(wire101) ?
                       (wire103[(3'h4):(2'h3)] ~^ ((8'ha0) ~^ wire103)) : $signed((^wire96)))));
  assign wire105 = wire102;
  assign wire106 = $unsigned({({$unsigned(wire97),
                           ((8'hae) && wire104)} ^~ $signed((wire105 ?
                           wire100 : wire104))),
                       ($unsigned(wire102[(3'h5):(2'h2)]) <= ((wire98 ?
                               wire105 : wire98) ?
                           (!wire101) : (wire98 ? (8'hab) : (8'ha3))))});
  assign wire107 = $signed($unsigned(wire97[(2'h3):(2'h2)]));
  assign wire108 = wire97;
  assign wire109 = wire95[(4'hb):(4'h9)];
  always
    @(posedge clk) begin
      reg110 <= {wire103[(5'h11):(1'h0)]};
      if ($signed(($unsigned($unsigned((wire109 ~^ wire104))) ?
          (wire98[(3'h4):(2'h3)] | $unsigned($signed(wire108))) : (^wire104))))
        begin
          reg111 <= (^(~&(8'h9c)));
          reg112 <= wire95[(4'h9):(1'h0)];
          reg113 <= wire96[(5'h12):(2'h3)];
          reg114 <= $unsigned($unsigned((wire102[(2'h2):(2'h2)] ^~ ((!(8'h9f)) ?
              (reg111 ? reg112 : wire104) : wire105))));
          reg115 <= $unsigned(wire95);
        end
      else
        begin
          reg111 <= (!wire98[(2'h3):(2'h2)]);
          if (reg115)
            begin
              reg112 <= (wire109 >= ($signed(((+(8'hbe)) + $unsigned(reg110))) ?
                  $unsigned(($signed((8'h9f)) << wire108[(5'h10):(4'h9)])) : wire101[(3'h7):(1'h1)]));
              reg113 <= reg110[(2'h3):(2'h2)];
              reg114 <= {(wire107 ?
                      (~((!wire107) < reg114)) : (+$unsigned(reg110[(3'h5):(3'h5)]))),
                  ((($signed(wire96) & $signed(wire103)) + $signed(wire104[(3'h5):(3'h4)])) >= wire109)};
            end
          else
            begin
              reg112 <= $signed((|wire95));
              reg113 <= ((|$signed(wire109[(4'hd):(2'h2)])) > wire100[(4'ha):(2'h2)]);
            end
        end
      if (($signed({{$unsigned(wire102), wire107}, (~|(8'hbb))}) ?
          wire100[(4'hc):(3'h7)] : $unsigned($signed(($unsigned(wire96) == $signed(wire106))))))
        begin
          reg116 <= wire107[(1'h1):(1'h1)];
          reg117 <= wire95[(4'hd):(4'hc)];
        end
      else
        begin
          reg116 <= wire108;
          reg117 <= reg111;
        end
      reg118 <= ((~^(8'ha2)) >> (!reg110[(3'h4):(2'h3)]));
      reg119 <= $unsigned($unsigned(($unsigned($unsigned(reg111)) ?
          (wire99[(3'h4):(1'h1)] | $unsigned(wire106)) : reg110[(3'h4):(2'h3)])));
    end
  assign wire120 = ((&(-(reg117 >= (wire108 ?
                       reg110 : wire101)))) <= $unsigned(reg116[(4'h8):(3'h4)]));
  assign wire121 = $unsigned(reg119);
  assign wire122 = reg116;
  assign wire123 = ($unsigned((^(reg110[(2'h2):(1'h1)] >> (wire96 ?
                           wire121 : wire97)))) ?
                       reg112 : ($signed(wire98) ?
                           ($unsigned($unsigned(reg114)) == (wire106 ?
                               $signed(wire120) : (wire104 ?
                                   wire121 : wire101))) : reg119[(2'h2):(2'h2)]));
  assign wire124 = (((+$unsigned(reg110)) || $signed(reg116)) ^ $unsigned((reg111 ?
                       (((7'h40) ^~ reg119) ?
                           (~^wire96) : (reg115 << wire107)) : (~$signed(wire109)))));
  always
    @(posedge clk) begin
      reg125 <= (({$signed(wire122),
          $signed(wire109)} <= wire98) ^~ $signed($signed(({reg115} >= (^~wire104)))));
    end
  assign wire126 = $unsigned(((|$signed(reg116[(3'h6):(2'h2)])) ?
                       (reg125 ?
                           ($unsigned(wire109) ?
                               reg111[(3'h6):(1'h1)] : (8'h9e)) : $signed($signed(reg118))) : ($signed((~reg117)) && ((wire100 ^ wire108) > $unsigned(wire124)))));
  assign wire127 = $unsigned(((reg113[(4'h9):(4'h9)] ?
                       wire123 : wire126[(2'h2):(1'h1)]) ~^ reg115));
  assign wire128 = (8'ha7);
  always
    @(posedge clk) begin
      reg129 <= ($unsigned(((8'hb3) && $signed(wire107))) != ({reg113,
              ((wire102 << reg113) ? reg118[(3'h6):(2'h3)] : reg118)} ?
          reg114 : reg118));
      reg130 <= $signed(wire106);
      if ((8'hba))
        begin
          reg131 <= $unsigned(wire105[(2'h3):(2'h2)]);
          if ($unsigned($unsigned((reg115[(3'h5):(3'h4)] << reg112[(2'h2):(1'h1)]))))
            begin
              reg132 <= reg111[(4'hd):(4'h9)];
              reg133 <= (wire105 ?
                  {$unsigned(((wire107 ?
                          wire101 : wire127) | $unsigned(wire104))),
                      $unsigned((((7'h44) > wire109) & (^wire109)))} : reg117);
              reg134 <= (&reg110);
              reg135 <= ($unsigned(($unsigned((8'ha8)) | $signed((wire106 ?
                  reg134 : reg110)))) * $unsigned(({(reg110 || reg130)} < (!(wire120 ?
                  wire121 : wire121)))));
            end
          else
            begin
              reg132 <= wire95;
              reg133 <= (({(!wire122[(1'h0):(1'h0)])} >= (&(8'haf))) ?
                  (($unsigned($unsigned(reg132)) >>> ({wire121} & (reg132 & wire96))) ~^ {{(reg130 - wire106),
                          (wire121 - wire127)},
                      (~|reg131)}) : wire128[(4'hf):(3'h5)]);
              reg134 <= $unsigned($unsigned({$signed($signed(reg130)),
                  $signed(((8'ha2) <<< wire101))}));
            end
          if (((-({(wire109 ^ wire122), wire102[(3'h7):(3'h5)]} ?
                  ($signed(reg132) ?
                      (wire103 ?
                          reg112 : reg119) : (wire120 | reg110)) : wire100[(4'hd):(4'h9)])) ?
              $signed((8'h9d)) : wire105))
            begin
              reg136 <= $signed(($signed(reg112) <= (+(reg116[(2'h3):(1'h0)] || ((8'ha6) | reg115)))));
              reg137 <= ({(~&wire95[(2'h3):(2'h3)])} ?
                  $signed((wire123 <<< $signed(reg134))) : ($signed({$signed((8'ha7))}) || $signed((wire99[(3'h4):(3'h4)] ?
                      $unsigned(wire98) : (-reg132)))));
              reg138 <= (8'hbe);
            end
          else
            begin
              reg136 <= $unsigned($unsigned({reg110}));
              reg137 <= ((^~$unsigned(((reg113 ? wire97 : wire104) ?
                      (wire102 ? reg119 : (8'hb7)) : (reg138 ?
                          wire100 : wire103)))) ?
                  $signed((wire124 + $unsigned(((8'hb7) ?
                      reg111 : wire123)))) : wire103);
              reg138 <= (~|(^~($signed((reg113 ? wire99 : reg111)) ?
                  (~|wire105) : reg117[(2'h2):(1'h0)])));
              reg139 <= wire98[(1'h1):(1'h0)];
            end
          reg140 <= ($signed((($signed(wire99) << $signed(reg135)) ?
                  $signed($signed((7'h40))) : $signed((~^wire96)))) ?
              (wire126 != $unsigned(reg136[(5'h10):(2'h3)])) : {(|((|reg112) ?
                      (reg115 ? reg111 : reg134) : $signed(wire101)))});
          reg141 <= (reg118 ^ (wire104 >= (8'hb9)));
        end
      else
        begin
          reg131 <= {$signed({wire122}),
              (wire95[(1'h0):(1'h0)] | (~($signed(wire107) ?
                  $signed(reg115) : (^reg135))))};
          reg132 <= $signed($unsigned(wire120));
          reg133 <= (((($unsigned((8'hb4)) ? {reg141} : reg137) + wire101) ?
              wire95 : ($unsigned($signed(reg110)) ?
                  $signed($unsigned((8'hba))) : {wire126})) >> {wire123[(2'h3):(2'h3)]});
          reg134 <= reg140[(2'h2):(2'h2)];
          reg135 <= (~($unsigned($unsigned((^~wire100))) >= (wire100[(2'h3):(1'h1)] != $unsigned(((7'h44) ?
              (7'h44) : (7'h44))))));
        end
      if ((8'hbc))
        begin
          reg142 <= ((~((|$signed(wire95)) <= $unsigned(((8'h9e) ?
                  (7'h42) : wire103)))) ?
              (!(|wire123[(3'h7):(1'h0)])) : $unsigned(reg135[(4'hf):(4'hf)]));
          if (({wire97, wire124[(1'h0):(1'h0)]} ?
              $signed($unsigned(wire107[(3'h6):(2'h3)])) : (((+{reg129,
                      reg111}) ?
                  ($unsigned(wire108) > wire96) : $signed(reg125[(3'h7):(3'h7)])) == ((&$signed(wire104)) ?
                  (wire124[(2'h3):(1'h0)] ?
                      wire101[(5'h10):(1'h1)] : (-reg140)) : $unsigned((8'had))))))
            begin
              reg143 <= $unsigned(wire128);
            end
          else
            begin
              reg143 <= $unsigned(reg136);
            end
          reg144 <= (8'ha1);
          reg145 <= $unsigned(reg117);
        end
      else
        begin
          if (reg138)
            begin
              reg142 <= ({$unsigned($signed((wire102 ?
                      wire96 : (8'ha6))))} | ($unsigned(wire109[(4'hb):(4'ha)]) & ((&(reg117 <<< reg110)) ?
                  $signed(wire96) : ({(8'ha8)} <= (wire106 >>> wire108)))));
              reg143 <= {wire121[(2'h2):(1'h1)],
                  $unsigned({((~wire100) ? wire97 : $unsigned(reg112))})};
            end
          else
            begin
              reg142 <= reg138;
              reg143 <= ((-(8'ha9)) ? reg145 : reg133);
              reg144 <= reg138;
              reg145 <= (({(reg114 && $signed(reg113)),
                      $unsigned((~|reg144))} >> ((!reg118) ?
                      {$signed(reg138)} : ($signed((8'hb4)) + wire128))) ?
                  (^~(reg139[(1'h0):(1'h0)] ?
                      {(wire101 ? reg129 : (8'had)),
                          $signed(wire124)} : ($signed((8'had)) ?
                          (reg132 ?
                              wire120 : wire99) : (7'h43)))) : (reg139[(2'h3):(1'h0)] ?
                      ($unsigned($unsigned(reg119)) * wire109[(1'h1):(1'h1)]) : wire128));
            end
        end
    end
endmodule

module module66
#(parameter param89 = (+(!(((^(8'ha5)) ? (|(8'ha6)) : (!(8'h9d))) ^~ (((8'haa) ? (8'hbf) : (8'haf)) - {(8'h9d), (7'h41)})))), 
parameter param90 = ((|param89) || (8'hab)))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire70;
  input wire signed [(4'ha):(1'h0)] wire69;
  input wire signed [(5'h10):(1'h0)] wire68;
  input wire [(5'h10):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg88,
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
                 (1'h0)};
  assign wire71 = (^wire69);
  assign wire72 = wire70;
  assign wire73 = wire71;
  assign wire74 = wire69[(3'h4):(1'h1)];
  assign wire75 = (wire70[(3'h7):(3'h5)] == $signed(($unsigned($signed((8'hb5))) ?
                      (-(wire69 | wire74)) : ($unsigned(wire73) && (wire73 > wire71)))));
  always
    @(posedge clk) begin
      reg76 <= ((($signed((wire69 > wire72)) != wire75) ^~ (!$signed((!(7'h41))))) < {wire69[(1'h0):(1'h0)],
          wire67[(2'h3):(1'h1)]});
      reg77 <= (((+((wire67 ? wire68 : wire68) ?
              ((8'had) * wire75) : (&(8'hb7)))) != (~^$unsigned(wire74))) ?
          (wire68 ?
              $signed((+$unsigned(wire69))) : $signed(((~^wire68) ^ (~&wire73)))) : ((~|(wire67[(3'h6):(1'h1)] - $signed(wire69))) ^~ wire75[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg78 <= {(~|(~&$unsigned($signed(wire67))))};
      if ($unsigned(wire72[(5'h12):(5'h10)]))
        begin
          reg79 <= $signed($unsigned(reg78));
          reg80 <= wire68[(3'h6):(1'h1)];
          reg81 <= reg77[(1'h0):(1'h0)];
        end
      else
        begin
          reg79 <= $signed(wire68[(3'h7):(2'h3)]);
          reg80 <= (((wire67[(4'hc):(3'h5)] ?
                  ((reg76 ?
                      wire67 : reg81) ^ $unsigned(wire73)) : $unsigned((reg78 | wire74))) << $signed(wire74)) ?
              reg80 : (reg81 + $unsigned($signed((reg78 >= reg80)))));
          if (reg81[(4'h9):(1'h1)])
            begin
              reg81 <= $unsigned((wire74[(1'h0):(1'h0)] << wire72[(5'h12):(3'h4)]));
              reg82 <= $signed(((+$signed((wire68 ? (8'hba) : wire70))) ?
                  (((wire71 ? (8'hbd) : wire75) ?
                      (wire70 ?
                          wire71 : (8'ha5)) : (8'h9e)) ^ reg79) : wire69));
              reg83 <= (-$signed($unsigned($unsigned($signed(wire72)))));
            end
          else
            begin
              reg81 <= wire71[(3'h5):(1'h0)];
              reg82 <= wire70;
            end
          if (((8'ha3) ?
              {$signed(reg76[(4'hc):(4'h9)]),
                  $signed(reg76)} : $signed(((^~$signed(wire67)) ?
                  ($signed((8'ha2)) ?
                      (-(8'haa)) : {reg80}) : $unsigned(reg82)))))
            begin
              reg84 <= (~$unsigned(($signed(wire68[(4'ha):(3'h7)]) <<< wire72[(4'hc):(4'h9)])));
              reg85 <= wire68[(3'h6):(3'h5)];
            end
          else
            begin
              reg84 <= ((wire73[(3'h4):(3'h4)] ?
                      wire67[(5'h10):(4'hf)] : wire75) ?
                  $unsigned(wire68) : (|$unsigned(((reg78 ?
                      reg76 : wire70) || (^(8'ha9))))));
              reg85 <= (wire74 ?
                  reg80[(1'h1):(1'h0)] : $unsigned({$unsigned(wire69[(1'h0):(1'h0)])}));
              reg86 <= $unsigned(wire70);
            end
        end
      reg87 <= ((($signed($unsigned(reg84)) && $signed($signed((8'ha5)))) ?
              (~&wire70) : $signed($signed($unsigned(wire75)))) ?
          (!wire69[(3'h4):(3'h4)]) : $unsigned(reg79));
      reg88 <= ({{{$signed(reg85), reg77}}, reg85[(1'h0):(1'h0)]} >= (^~reg83));
    end
endmodule

module module38
#(parameter param52 = {(((((8'hbf) ? (7'h40) : (8'hb1)) ? ((8'had) ? (7'h40) : (8'h9c)) : {(8'haf)}) ? (8'hae) : (!{(8'ha0), (8'ha4)})) ? (-((~&(8'hbc)) ? {(8'ha7), (8'hbb)} : ((8'ha2) ? (7'h42) : (8'hb6)))) : {(8'ha0), (+((8'hbb) ? (8'had) : (8'hbc)))}), (((((8'hb7) ? (8'haf) : (8'hbd)) >= (~^(7'h40))) + (~|(~&(7'h44)))) ? (~|({(7'h44), (8'ha7)} ? ((8'hb1) != (8'hbc)) : ((8'hbe) || (8'hb9)))) : (({(8'hbb)} + ((8'hb3) << (7'h43))) >> ((+(8'hb5)) ? {(8'ha9), (8'ha3)} : ((8'hb5) == (8'hbb)))))}, 
parameter param53 = (param52 ? (^~{(^{param52}), {(!param52)}}) : ({(~|(param52 << param52)), (&{param52})} ^~ ({(param52 & param52), param52} & {(param52 ? param52 : param52), (&param52)}))))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(2'h2):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire43;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = wire42[(4'h9):(3'h7)];
  assign wire44 = (($unsigned($unsigned((wire41 ?
                      wire43 : wire42))) != wire39[(1'h1):(1'h0)]) > ((~|{$unsigned(wire41),
                          (wire40 == wire41)}) ?
                      wire40 : (~&((wire42 || wire42) << (^~wire43)))));
  assign wire45 = $signed(wire41[(3'h6):(1'h1)]);
  assign wire46 = wire42[(3'h6):(3'h6)];
  assign wire47 = {(wire43[(1'h0):(1'h0)] && $signed(((wire43 <= (7'h40)) ?
                          ((8'ha7) != wire40) : $signed(wire40)))),
                      ((^~(~|(wire43 > wire39))) != {((wire46 <= (8'ha1)) ?
                              wire44 : (~wire45)),
                          wire40[(3'h6):(2'h3)]})};
  assign wire48 = ($unsigned((($signed(wire46) >>> $unsigned(wire40)) ?
                      $unsigned((wire45 ?
                          wire44 : wire47)) : (~|wire47[(4'hb):(3'h5)]))) + wire39);
  assign wire49 = ({$unsigned(wire42[(3'h7):(3'h6)]),
                      wire41[(3'h5):(3'h4)]} >= $unsigned($signed((&$unsigned(wire41)))));
  assign wire50 = $signed($signed($signed((^(8'haf)))));
  assign wire51 = $signed($unsigned((!$unsigned((8'h9c)))));
endmodule

module module23
#(parameter param34 = ((8'hbc) ? (((7'h41) ? {((8'hab) == (8'ha1)), {(8'haf)}} : (((8'hb0) ? (8'h9c) : (8'hbf)) ? ((8'hbc) >= (8'h9d)) : ((7'h40) ? (8'hbb) : (8'hb4)))) ? ((~&(~|(8'hbb))) ? {((8'hb8) << (8'haf))} : (~&(|(8'hba)))) : ({((7'h42) ? (8'hba) : (8'hb3))} + (((8'ha1) ? (8'ha3) : (8'h9c)) ? ((8'hbf) * (8'hb6)) : ((8'hb8) & (8'h9d))))) : (~(-({(8'hae), (8'hab)} ? (8'ha2) : (~&(8'hba)))))), 
parameter param35 = ((|(((~^param34) == {param34}) ? ((8'h9d) ? (param34 ? param34 : (8'hb0)) : (param34 ? (7'h43) : param34)) : {(8'hb1), (param34 * param34)})) != param34))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(3'h7):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire [(3'h4):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  assign y = {wire33, wire32, wire31, wire30, wire29, (1'h0)};
  assign wire29 = wire28;
  assign wire30 = $unsigned($unsigned(((-wire28) ?
                      (|$unsigned(wire28)) : ($unsigned(wire26) ?
                          wire28[(4'hb):(4'h8)] : wire27[(2'h3):(2'h2)]))));
  assign wire31 = wire30[(4'hb):(2'h2)];
  assign wire32 = $unsigned(({wire24} ? wire31 : wire28));
  assign wire33 = (wire27 << $unsigned(($unsigned((wire31 ?
                      wire30 : wire31)) | wire31[(3'h4):(1'h0)])));
endmodule
