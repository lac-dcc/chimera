module top
#(parameter param143 = ({((((8'ha0) != (8'ha2)) ? ((8'hb3) ? (8'ha3) : (8'ha2)) : ((8'haa) > (8'hb4))) && ((!(8'ha8)) - ((8'h9d) ? (8'ha0) : (8'ha9))))} ? (((+(~|(8'haf))) ? ((^(8'hb2)) ? (&(7'h41)) : (~|(8'hb2))) : (&((8'hb5) ? (8'h9e) : (8'hba)))) ? {(&{(8'ha9), (8'ha4)}), (((8'hbb) ? (8'ha1) : (8'hbe)) ? ((8'hae) ? (8'haf) : (8'hac)) : {(8'ha3), (8'ha2)})} : (((~&(7'h40)) >>> ((8'ha6) ? (8'h9c) : (7'h44))) || {((8'ha4) < (8'hac))})) : (-((-((8'hae) != (8'hb1))) >= ({(8'haa)} ? ((8'ha9) || (8'ha0)) : ((8'hb8) ? (8'hb1) : (8'hb3)))))), 
parameter param144 = ({((param143 ? param143 : param143) ? (param143 ? param143 : ((8'hbf) >= param143)) : (!(param143 ? (7'h44) : param143)))} ? param143 : (8'hab)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire138,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = $unsigned((wire3 + wire4[(1'h1):(1'h0)]));
  assign wire6 = $signed(((|$unsigned((wire3 ? wire4 : (7'h43)))) ?
                     {(~&((8'h9c) ^~ wire5)),
                         wire1[(5'h13):(5'h10)]} : $unsigned({wire2[(5'h13):(1'h1)]})));
  assign wire7 = (wire6[(1'h1):(1'h0)] ^~ wire1[(4'h8):(4'h8)]);
  assign wire8 = wire6[(3'h4):(1'h1)];
  assign wire9 = $unsigned($signed({{wire0}}));
  always
    @(posedge clk) begin
      reg10 <= wire7[(2'h3):(2'h2)];
      reg11 <= (wire4[(3'h5):(3'h5)] <<< wire9[(4'hb):(3'h5)]);
    end
  assign wire12 = (~|((8'ha1) ?
                      wire1[(3'h4):(1'h1)] : $unsigned($unsigned(reg10[(4'hf):(4'he)]))));
  module13 #() modinst139 (wire138, clk, wire1, reg11, reg10, wire3);
  assign wire140 = $signed(((+reg10) | ($signed(wire0[(3'h6):(3'h5)]) ?
                       wire138 : (~&(wire6 | wire7)))));
  assign wire141 = reg10;
  assign wire142 = $unsigned((wire8 ?
                       $signed(wire3) : $unsigned({$signed(wire138),
                           $signed(reg10)})));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h22b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire48;
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  assign y = {wire136,
                 wire121,
                 wire120,
                 wire118,
                 wire86,
                 wire85,
                 wire84,
                 wire74,
                 wire73,
                 wire51,
                 wire50,
                 wire48,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
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
                 reg71,
                 reg72,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 (1'h0)};
  module18 #() modinst49 (wire48, clk, wire17, wire15, wire16, wire14);
  assign wire50 = wire15;
  assign wire51 = wire48[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned($signed((|{(wire15 ^~ wire50), wire15}))))
        begin
          if (($signed($signed($signed((wire16 & wire50)))) << (|wire48)))
            begin
              reg52 <= $unsigned($signed($signed($unsigned(wire50[(2'h2):(1'h1)]))));
              reg53 <= (^$signed((^wire14[(4'ha):(4'ha)])));
              reg54 <= $signed((reg52 ? (8'hb2) : $unsigned(wire51)));
              reg55 <= $unsigned(((~|wire50[(1'h1):(1'h1)]) + (wire51[(3'h5):(1'h0)] ?
                  (|(wire15 ? wire51 : wire15)) : ((reg53 != wire15) ?
                      ((8'hbd) ? (8'hb8) : reg53) : $signed(wire17)))));
              reg56 <= wire48[(2'h3):(1'h1)];
            end
          else
            begin
              reg52 <= (reg56 ?
                  $unsigned((^$unsigned(reg55))) : (($signed((reg54 > (8'h9e))) ?
                      (!reg55[(1'h0):(1'h0)]) : ((wire51 ? (8'hb2) : wire16) ?
                          {wire16} : wire16[(4'hb):(2'h3)])) >> $unsigned(wire51[(2'h2):(1'h0)])));
              reg53 <= (~(|{((wire50 || reg56) ?
                      reg55[(2'h3):(2'h2)] : {reg56})}));
            end
          reg57 <= $signed(reg55);
          reg58 <= ((({{(8'haa), wire17}} ?
                  $signed((+wire48)) : $signed($signed((8'hac)))) <<< $signed($unsigned($signed(wire16)))) ?
              wire51[(3'h5):(3'h5)] : (~wire51));
          reg59 <= (((~|$unsigned($unsigned(wire17))) ?
              (~|((-reg55) > $unsigned(reg57))) : (+wire50[(3'h6):(3'h4)])) == {$signed($signed((|(8'h9d)))),
              $unsigned(($signed(reg52) ?
                  $unsigned(reg53) : $unsigned(wire15)))});
          reg60 <= $unsigned((wire15 == (~&$signed($unsigned(wire15)))));
        end
      else
        begin
          reg52 <= {{(&$unsigned(reg56))}, $signed(wire51[(3'h6):(3'h5)])};
        end
      if ({wire48, {reg54}})
        begin
          reg61 <= reg57;
          reg62 <= (8'hb0);
          reg63 <= $unsigned(reg53);
        end
      else
        begin
          reg61 <= $unsigned($unsigned(wire15[(1'h1):(1'h1)]));
          reg62 <= (~^reg56[(3'h6):(1'h0)]);
          reg63 <= $unsigned(((reg54[(4'h8):(3'h5)] ?
                  $unsigned($signed(reg61)) : (&wire50)) ?
              $signed(((wire48 ? wire14 : (8'hbc)) ?
                  (reg58 ? (8'hba) : reg59) : {reg52})) : reg55));
        end
      if ((($signed(reg63) && {$signed($unsigned(wire15)),
          $signed((8'hac))}) ~^ wire48[(3'h7):(2'h3)]))
        begin
          if ((8'ha0))
            begin
              reg64 <= reg56;
              reg65 <= wire48[(4'hb):(4'ha)];
            end
          else
            begin
              reg64 <= $unsigned($unsigned(reg62));
              reg65 <= ($unsigned($unsigned($unsigned(reg54))) ?
                  {($unsigned({wire50}) ~^ reg60),
                      $signed($signed({reg57}))} : wire15[(3'h4):(1'h1)]);
              reg66 <= ({reg58[(5'h10):(4'hd)]} ?
                  $signed((+$unsigned(wire50[(1'h1):(1'h1)]))) : ({$signed($signed(wire51))} ?
                      $signed((!$unsigned(reg55))) : $unsigned(wire48)));
              reg67 <= (^($unsigned(($unsigned(reg61) & (8'hb2))) ?
                  reg56[(2'h3):(2'h2)] : $unsigned(($unsigned(reg53) ?
                      reg53[(5'h12):(3'h6)] : {reg57}))));
            end
          if ($signed(reg55[(2'h2):(1'h1)]))
            begin
              reg68 <= (8'hab);
              reg69 <= reg55;
            end
          else
            begin
              reg68 <= (~|reg64);
              reg69 <= (wire14 ?
                  (+{$unsigned((^~(8'hb0)))}) : (({$unsigned(reg68),
                      (~reg58)} - $unsigned((7'h42))) > $unsigned(wire15)));
              reg70 <= (~&(^~(reg64[(1'h1):(1'h1)] >>> $signed($signed(reg68)))));
            end
          reg71 <= $unsigned($unsigned(reg63[(1'h1):(1'h1)]));
          reg72 <= reg62[(4'h8):(3'h7)];
        end
      else
        begin
          reg64 <= (!wire50[(4'h9):(1'h1)]);
          if (wire51)
            begin
              reg65 <= (8'had);
              reg66 <= reg70[(5'h11):(4'ha)];
              reg67 <= reg55;
            end
          else
            begin
              reg65 <= reg68;
              reg66 <= {$signed(((~(reg62 ? reg54 : reg72)) ?
                      {$signed(reg66)} : ((8'hbe) != (wire50 ?
                          (8'h9d) : wire51)))),
                  $signed((-reg52))};
              reg67 <= ((8'hbe) >= $signed($signed({(&reg52)})));
            end
          reg68 <= reg70[(3'h4):(1'h0)];
        end
    end
  assign wire73 = ((|reg61) * (((~&wire14) ?
                      (&(reg63 * reg55)) : $unsigned({reg67})) >= ($unsigned(reg72[(4'hb):(4'h8)]) ?
                      ($signed((8'ha2)) >>> (reg70 ?
                          (8'hba) : reg71)) : (~|$signed(wire17)))));
  assign wire74 = (!$unsigned(($unsigned((reg57 || reg53)) ?
                      $unsigned(reg57) : ($unsigned(reg63) ?
                          reg56[(1'h0):(1'h0)] : $unsigned(wire17)))));
  always
    @(posedge clk) begin
      reg75 <= wire73[(3'h7):(3'h6)];
      if ((reg63 ?
          (~(8'ha1)) : (wire17[(1'h0):(1'h0)] && {($unsigned(reg69) > reg70[(4'hc):(1'h0)])})))
        begin
          if (reg65[(5'h12):(3'h6)])
            begin
              reg76 <= wire74[(2'h2):(2'h2)];
              reg77 <= reg72[(2'h3):(2'h3)];
              reg78 <= (|(reg71[(1'h1):(1'h1)] ?
                  reg66[(1'h1):(1'h0)] : {$unsigned(reg72)}));
              reg79 <= $unsigned((~^reg64[(4'h9):(1'h0)]));
              reg80 <= wire50[(3'h4):(1'h0)];
            end
          else
            begin
              reg76 <= ((8'h9e) ?
                  {reg79, (^~(8'hbe))} : $unsigned(((|wire50) ?
                      reg70[(1'h1):(1'h0)] : ((reg55 ? reg57 : reg78) ?
                          $unsigned(wire73) : (reg69 ? reg71 : wire74)))));
              reg77 <= $signed(reg52[(1'h0):(1'h0)]);
              reg78 <= $unsigned((^~$unsigned(reg52[(4'hf):(4'he)])));
              reg79 <= $signed(reg58);
              reg80 <= (^~(^(((!reg67) ? (~^wire17) : (wire51 == reg68)) ?
                  (((7'h41) ?
                      reg53 : (8'hbc)) >= (wire16 ~^ reg55)) : $signed($signed((7'h43))))));
            end
          reg81 <= (!$signed(reg79[(4'hd):(2'h2)]));
          reg82 <= reg72[(1'h0):(1'h0)];
        end
      else
        begin
          reg76 <= (8'h9e);
        end
      reg83 <= $unsigned(reg72[(3'h7):(3'h7)]);
    end
  assign wire84 = $signed(reg66[(3'h4):(2'h2)]);
  assign wire85 = $signed((-$signed(wire17[(3'h5):(3'h5)])));
  assign wire86 = reg67[(4'h9):(4'h8)];
  module87 #() modinst119 (wire118, clk, reg60, reg83, reg77, reg61);
  assign wire120 = $signed((~&$unsigned($unsigned($unsigned(wire50)))));
  assign wire121 = $unsigned((+$unsigned(wire51[(1'h1):(1'h1)])));
  module122 #() modinst137 (.wire125(wire84), .wire127(reg77), .wire126(reg60), .wire123(wire73), .wire124(reg68), .clk(clk), .y(wire136));
endmodule

module module122  (y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire127;
  input wire signed [(5'h14):(1'h0)] wire126;
  input wire [(2'h2):(1'h0)] wire125;
  input wire signed [(2'h3):(1'h0)] wire124;
  input wire signed [(3'h7):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 (1'h0)};
  assign wire128 = ((~((-(^~wire123)) ?
                           (~(wire123 & wire123)) : (^(^~wire123)))) ?
                       wire123 : ($unsigned(wire124[(1'h0):(1'h0)]) <<< wire124));
  assign wire129 = (!{$unsigned({(wire123 ^ wire126)})});
  assign wire130 = ((wire124 | ((wire128[(4'hd):(2'h3)] ?
                               ((8'hb3) ?
                                   wire128 : (8'h9c)) : $signed(wire129)) ?
                           ($unsigned(wire126) ?
                               {wire125} : $unsigned(wire127)) : wire123[(3'h4):(2'h3)])) ?
                       (~|((((8'hab) | wire126) ?
                               {wire123} : wire128[(3'h6):(1'h1)]) ?
                           $unsigned(wire125) : (wire129 ^~ wire123[(3'h4):(2'h3)]))) : (($unsigned((wire126 >>> wire123)) ?
                           (~^(wire128 && wire129)) : wire126) <<< (wire126[(3'h5):(2'h2)] ?
                           wire124[(1'h1):(1'h0)] : ($unsigned(wire125) ~^ $unsigned(wire128)))));
  assign wire131 = $signed(wire128);
  assign wire132 = wire129;
  assign wire133 = wire124;
  assign wire134 = ((+((wire125 ? (^wire126) : $unsigned(wire124)) ?
                           wire126 : (wire133 >> $signed(wire125)))) ?
                       wire130 : (|{wire130, $unsigned($signed(wire125))}));
  assign wire135 = (~wire133);
endmodule

module module87
#(parameter param116 = (-({{{(8'hb8)}, ((8'ha6) ^~ (8'hab))}} ^ (-(((8'haf) ^ (8'hb7)) ^ {(8'hb5)})))), 
parameter param117 = param116)
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire [(4'hb):(1'h0)] wire90;
  input wire [(5'h14):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire115;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  assign y = {wire115,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire92 = {$unsigned($signed($signed($signed((7'h41))))),
                      ($unsigned($unsigned($signed(wire89))) ?
                          wire88[(1'h0):(1'h0)] : (^~wire89))};
  assign wire93 = {(!{$unsigned($signed(wire92))}),
                      ($unsigned(((^~wire88) ?
                          wire91 : (wire88 | wire89))) & {wire91, (|wire90)})};
  assign wire94 = wire93;
  assign wire95 = $signed({(8'ha8)});
  assign wire96 = wire90[(4'h8):(2'h3)];
  assign wire97 = (((&wire91) ? wire88[(2'h3):(1'h0)] : wire95[(3'h4):(2'h3)]) ?
                      $signed((~^{$signed(wire96),
                          {wire93}})) : (($unsigned((&(8'hbb))) & wire89) ?
                          $unsigned(wire95) : wire89));
  assign wire98 = (wire91 ~^ ((((wire96 >> wire90) ^ wire93[(2'h2):(1'h0)]) ^ wire88) >>> wire88));
  assign wire99 = (($unsigned(({wire92,
                      wire93} <<< wire89[(5'h10):(2'h3)])) ^ (&{(wire92 << wire96)})) ^~ wire95[(1'h1):(1'h1)]);
  assign wire100 = (((8'ha7) ?
                           wire94[(4'hb):(2'h3)] : $signed($unsigned((wire99 ?
                               wire99 : wire90)))) ?
                       ((^~{{wire94, wire95}}) <= (^~($unsigned(wire93) ?
                           wire88[(2'h2):(2'h2)] : wire93))) : $unsigned(wire91));
  assign wire101 = (8'hbb);
  assign wire102 = wire94;
  assign wire103 = wire97;
  assign wire104 = $unsigned($signed(($unsigned((wire90 ?
                       wire99 : (8'h9d))) || $signed((wire89 | (8'ha3))))));
  assign wire105 = wire97;
  assign wire106 = (wire88[(2'h2):(1'h1)] ?
                       ($unsigned($unsigned($signed(wire97))) ~^ $signed($unsigned(((8'h9d) ~^ wire93)))) : $signed((!wire103[(3'h6):(3'h6)])));
  assign wire107 = wire105[(5'h10):(3'h7)];
  always
    @(posedge clk) begin
      reg108 <= {(~&(~|wire102))};
      reg109 <= (({(wire101[(3'h5):(1'h0)] ^~ $unsigned(wire89))} ?
              $signed($signed((wire98 & wire98))) : $signed((~^wire89[(2'h2):(1'h0)]))) ?
          $unsigned((^~((wire92 && (8'ha1)) <<< (~^wire99)))) : $signed($signed(((wire106 ?
              reg108 : wire101) ^ $signed(wire90)))));
      if ({(reg109[(2'h2):(2'h2)] ?
              (($signed((8'hbf)) ?
                  wire96[(2'h2):(2'h2)] : (wire100 + wire91)) > (~|(&(8'ha8)))) : $unsigned($unsigned({wire94,
                  wire88}))),
          wire97})
        begin
          if (wire103[(4'h9):(1'h0)])
            begin
              reg110 <= reg108[(2'h2):(2'h2)];
            end
          else
            begin
              reg110 <= (($unsigned((~(!wire92))) ?
                      (!((wire89 ? (8'hab) : wire98) << (~wire93))) : (8'h9c)) ?
                  {{wire91[(1'h1):(1'h1)], (~(reg108 || wire100))},
                      {reg109}} : $unsigned((+wire89[(3'h7):(2'h3)])));
              reg111 <= (^($signed($unsigned({wire94, wire97})) ?
                  {wire95} : wire90));
              reg112 <= (-wire91);
            end
          reg113 <= wire89;
        end
      else
        begin
          reg110 <= $unsigned((~&{(8'hae), wire107}));
        end
      reg114 <= $signed(wire95);
    end
  assign wire115 = (~^((($signed(wire107) * $unsigned(reg113)) | (((8'hba) ^~ wire103) >>> wire95)) ?
                       (wire90[(1'h1):(1'h0)] ?
                           reg111[(1'h1):(1'h0)] : (|(8'haf))) : wire99[(4'h8):(3'h7)]));
endmodule

module module18
#(parameter param46 = (+{{(^(&(8'hab)))}}), 
parameter param47 = ((~|param46) ? {param46, param46} : (^(~^param46))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire23 = $signed(($signed($unsigned({wire21, (8'ha2)})) ?
                      (~&{{wire19}, (^(8'had))}) : $signed(($unsigned(wire22) ?
                          $signed(wire19) : (wire19 != wire21)))));
  assign wire24 = (!((({wire23} ~^ wire19[(2'h2):(1'h0)]) + wire23[(4'h8):(2'h3)]) ?
                      (-{wire22}) : ({wire23} >= wire20[(1'h1):(1'h0)])));
  assign wire25 = $unsigned($unsigned($signed(wire19)));
  assign wire26 = $signed(wire24);
  assign wire27 = wire21;
  assign wire28 = $signed((7'h42));
  always
    @(posedge clk) begin
      reg29 <= ($signed($unsigned(wire27[(2'h3):(1'h1)])) ?
          wire27 : wire26[(4'h9):(3'h6)]);
      reg30 <= wire25[(3'h6):(3'h6)];
    end
  assign wire31 = $signed(wire20);
  assign wire32 = (wire26[(4'ha):(3'h6)] && ((wire24 & {(wire27 != wire26)}) ?
                      ((|(wire21 | wire28)) | $unsigned($unsigned(wire27))) : wire24[(3'h7):(1'h1)]));
  assign wire33 = ((reg29[(4'hb):(4'ha)] ?
                      wire31 : wire26[(3'h7):(3'h5)]) ^ ($unsigned($signed($signed(wire32))) ^ (((wire23 || wire24) ?
                          {wire23, wire25} : (8'hab)) ?
                      $unsigned(((8'hae) != wire24)) : (~&$unsigned(wire21)))));
  always
    @(posedge clk) begin
      reg34 <= (($signed($signed($unsigned(wire28))) ?
          (wire24[(3'h6):(1'h0)] ?
              {(^~wire23), $signed((8'h9f))} : ({(8'hbf),
                  wire22} > $signed(wire22))) : wire27) - $unsigned((wire33 ?
          ((wire26 ^~ reg29) == {(7'h41)}) : wire24)));
      reg35 <= wire22;
    end
  assign wire36 = wire22;
  assign wire37 = $unsigned(reg34);
  assign wire38 = $unsigned(reg34[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg39 <= (~&$signed($unsigned($signed(wire31[(4'h8):(2'h3)]))));
      if (wire33)
        begin
          reg40 <= wire31[(3'h6):(3'h6)];
          reg41 <= $signed((+wire24[(3'h7):(2'h2)]));
          reg42 <= (wire36 ?
              {($unsigned(wire19[(2'h2):(1'h1)]) * {$unsigned(reg41)}),
                  $unsigned((wire21[(3'h6):(3'h6)] ?
                      (wire25 * wire19) : (8'ha0)))} : {$unsigned($signed((wire38 ^ wire26))),
                  wire36[(4'h8):(3'h6)]});
        end
      else
        begin
          reg40 <= reg34[(1'h1):(1'h0)];
          if ($signed($unsigned(($unsigned(wire19[(4'h9):(2'h3)]) || {(|wire24)}))))
            begin
              reg41 <= wire28;
              reg42 <= {$signed(((reg42 ?
                      $signed((8'ha0)) : (reg29 ?
                          wire28 : wire22)) > wire23[(3'h6):(3'h5)]))};
              reg43 <= {($signed($unsigned(((8'hb2) ?
                      reg39 : reg42))) == (-(+(wire33 ? wire22 : (8'hbd)))))};
              reg44 <= $unsigned((&$unsigned(wire33)));
            end
          else
            begin
              reg41 <= {wire19, (^~(~|reg35[(2'h3):(2'h2)]))};
              reg42 <= $signed($signed(($signed(wire37[(4'ha):(3'h6)]) << $unsigned((reg29 ?
                  wire38 : wire32)))));
            end
          reg45 <= ((reg29 | wire19[(4'ha):(3'h6)]) << {reg42});
        end
    end
endmodule
