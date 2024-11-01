module top
#(parameter param167 = (({((^(8'h9f)) >>> ((8'hac) ? (8'ha7) : (8'ha7)))} ? ({{(8'hac), (8'hb0)}} * (((8'ha1) > (7'h42)) ? {(8'ha4)} : ((8'hb3) == (8'ha1)))) : ((((8'hac) == (8'hb4)) ~^ ((8'hab) & (8'hb1))) ^ (-(~|(8'haa))))) || ((((-(8'hac)) ? (^~(8'ha4)) : ((8'hbf) < (8'h9c))) ? ({(8'ha3)} ? (-(8'hbb)) : ((7'h43) ? (7'h42) : (8'hbd))) : (((8'hae) ? (8'h9d) : (8'hb0)) ? (8'h9e) : ((8'hb6) >>> (7'h41)))) & (~&(~(-(8'ha8)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire166;
  wire signed [(5'h12):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire163;
  wire signed [(4'hd):(1'h0)] wire162;
  wire [(4'hd):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire158,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (~^wire0);
  assign wire5 = wire4[(4'hb):(3'h4)];
  assign wire6 = wire4[(4'h9):(1'h1)];
  assign wire7 = $signed($signed($signed({wire6})));
  assign wire8 = ($signed(($signed((|wire6)) ?
                         (+wire7[(3'h6):(1'h0)]) : (!wire4[(3'h5):(3'h4)]))) ?
                     wire3[(3'h7):(2'h2)] : {$unsigned($unsigned($unsigned(wire2))),
                         $signed((wire1 * $signed(wire0)))});
  module9 #() modinst159 (wire158, clk, wire0, wire2, wire4, wire1);
  assign wire160 = wire1[(4'hc):(1'h1)];
  assign wire161 = (+($signed(wire8[(4'h8):(1'h0)]) ? wire160 : wire7));
  assign wire162 = {($unsigned((wire3[(3'h4):(3'h4)] ?
                           wire5 : $unsigned((8'h9e)))) << wire4[(4'hb):(3'h7)]),
                       $signed(wire0[(3'h4):(2'h3)])};
  assign wire163 = $unsigned($signed($signed(($signed(wire4) ^ $signed(wire160)))));
  assign wire164 = wire5;
  assign wire165 = (~|{(~&(-$unsigned(wire160))), wire164});
  assign wire166 = (wire158 ?
                       $unsigned($signed((wire165 ?
                           $unsigned(wire164) : (wire162 ?
                               wire158 : wire6)))) : ((~{$signed(wire158)}) ?
                           (((wire160 <<< wire165) <<< $unsigned(wire3)) ?
                               (wire165[(4'hc):(3'h5)] != (~|wire8)) : wire2[(4'ha):(1'h1)]) : {(!wire7[(1'h0):(1'h0)])}));
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire143;
  wire signed [(5'h14):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire124;
  wire [(4'hc):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(5'h15):(1'h0)] reg145 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire124,
                 wire123,
                 wire121,
                 wire48,
                 wire43,
                 wire42,
                 wire40,
                 wire15,
                 wire14,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  assign wire14 = ($unsigned((-($unsigned(wire13) ? wire13 : (&wire13)))) ?
                      wire11 : {$unsigned((8'ha2)),
                          {$unsigned(wire11), wire13}});
  assign wire15 = wire10;
  module16 #() modinst41 (wire40, clk, wire13, wire14, wire10, wire11);
  assign wire42 = ((~^$signed(($unsigned((8'hbf)) ?
                      $unsigned(wire12) : wire12))) ~^ $signed($unsigned($signed($unsigned((8'hb8))))));
  assign wire43 = $unsigned(wire13[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg44 <= (+$unsigned($unsigned($unsigned(wire40[(1'h1):(1'h0)]))));
      reg45 <= ($unsigned({(wire14 & (&(8'ha8)))}) & {(+{(reg44 + (8'hb6)),
              (8'hb5)})});
      reg46 <= (^((wire13 ~^ $signed((8'hbb))) && $unsigned(reg45)));
      reg47 <= wire11;
    end
  assign wire48 = ((wire11 ?
                          wire14[(3'h7):(1'h1)] : $signed($unsigned(wire11))) ?
                      $unsigned(wire43) : wire40);
  module49 #() modinst122 (.wire52(wire40), .wire51(wire13), .y(wire121), .wire50(reg47), .wire54(wire14), .clk(clk), .wire53(wire48));
  assign wire123 = $unsigned(reg44[(2'h2):(1'h0)]);
  assign wire124 = $signed(reg45[(2'h2):(1'h1)]);
  module125 #() modinst141 (.wire126(wire124), .wire129(wire40), .wire127(wire11), .clk(clk), .y(wire140), .wire128(wire42));
  assign wire142 = $unsigned({(~|(wire15 >>> ((8'hbd) ? (8'ha6) : (8'hab)))),
                       $unsigned((-$signed(wire15)))});
  assign wire143 = wire11[(4'he):(3'h7)];
  assign wire144 = ((({reg46} ?
                       (~&(-wire40)) : reg46) | $unsigned(((wire10 <<< wire15) ?
                       (^~reg46) : {(8'ha4)}))) ^ $unsigned((reg47 ?
                       $unsigned((~^(8'hb2))) : (|(~^wire121)))));
  always
    @(posedge clk) begin
      reg145 <= wire42[(4'h8):(2'h2)];
      reg146 <= ($unsigned(wire14) >> wire13);
      if ((+wire14))
        begin
          if ({$signed((&reg44))})
            begin
              reg147 <= wire11;
            end
          else
            begin
              reg147 <= {(~$unsigned({(8'h9e)})),
                  $signed((((wire123 >> (8'ha2)) ?
                      $unsigned((8'hbc)) : ((8'hb0) ~^ wire124)) * $unsigned((wire14 == reg147))))};
              reg148 <= ($unsigned($signed($unsigned({reg146, wire144}))) ?
                  (wire48 < {{((8'hab) * wire124), reg145[(2'h3):(1'h1)]},
                      (|(reg47 ? wire43 : wire11))}) : wire121[(5'h10):(2'h3)]);
              reg149 <= reg44;
            end
        end
      else
        begin
          reg147 <= $signed({$signed(reg147[(4'h8):(1'h0)]),
              $unsigned(wire124[(4'h9):(3'h5)])});
        end
      reg150 <= (~|$signed(wire48[(1'h1):(1'h0)]));
      reg151 <= reg47[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg152 <= reg44[(4'h8):(3'h6)];
      reg153 <= ({wire15,
              ({{reg149}} ? wire12[(4'h8):(2'h2)] : reg146[(1'h0):(1'h0)])} ?
          (8'had) : $signed(($unsigned(wire11) <= wire143)));
    end
  assign wire154 = wire123[(3'h6):(3'h4)];
  assign wire155 = wire11;
  assign wire156 = $signed(reg44[(4'he):(3'h6)]);
  assign wire157 = (wire124[(3'h6):(3'h6)] >>> ((^reg45) ? reg146 : wire48));
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire129;
  input wire [(5'h15):(1'h0)] wire128;
  input wire signed [(3'h7):(1'h0)] wire127;
  input wire [(4'hb):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire139;
  wire [(3'h7):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire [(2'h2):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire131,
                 wire130,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire130 = wire129[(3'h5):(1'h0)];
  assign wire131 = $unsigned(($signed($signed((8'hb9))) ?
                       (-((wire128 ? wire130 : wire127) ?
                           $unsigned(wire128) : $unsigned(wire130))) : {((wire130 * wire126) || (wire127 ?
                               wire130 : wire127)),
                           wire127}));
  always
    @(posedge clk) begin
      reg132 <= $unsigned($unsigned((wire126[(3'h5):(1'h1)] != $unsigned((wire128 >>> (8'hb0))))));
      reg133 <= (!$unsigned({{wire131}}));
    end
  assign wire134 = wire131[(1'h0):(1'h0)];
  assign wire135 = wire129[(3'h7):(1'h1)];
  assign wire136 = ($signed({wire127[(3'h6):(2'h2)]}) ?
                       ((((wire126 ?
                           wire135 : wire127) + wire126[(3'h5):(3'h4)]) >> {{wire131,
                               wire128}}) > (&(wire127[(1'h1):(1'h1)] << (~&reg133)))) : ((&{(wire128 ?
                                   wire130 : reg132),
                               (wire134 <<< wire128)}) ?
                           reg132[(2'h2):(2'h2)] : $unsigned(((wire130 ?
                                   (8'hae) : (8'ha6)) ?
                               $signed(wire128) : {wire127, reg132}))));
  assign wire137 = (~&{(reg133 || $unsigned(wire135[(4'hf):(4'h8)])),
                       ({$signed(reg133), (wire131 ? wire134 : wire127)} ?
                           ($signed(wire136) <= $unsigned(reg133)) : $unsigned({wire126}))});
  assign wire138 = $signed(($signed($unsigned((wire136 == wire127))) ?
                       wire136 : ({{reg132},
                           (wire134 >>> wire127)} >>> ($unsigned(wire137) ?
                           $unsigned(wire130) : reg132))));
  assign wire139 = wire136;
endmodule

module module49
#(parameter param119 = (-({((-(7'h43)) > ((8'haf) == (7'h40))), {((8'hb9) == (8'hba)), ((7'h44) & (8'hb2))}} ? ((((7'h44) ? (8'ha6) : (7'h42)) ? (8'ha3) : {(8'hbc), (7'h42)}) ? (~&(+(7'h40))) : (|{(7'h42), (8'hbc)})) : ((8'h9c) ? {(~&(7'h40)), (&(8'hac))} : ((&(8'hb7)) >>> ((8'h9d) ? (8'ha9) : (8'ha7)))))), 
parameter param120 = (((8'hb3) & {((param119 > param119) ^~ param119), (|{param119, param119})}) ^~ param119))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h2b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire54;
  input wire [(3'h7):(1'h0)] wire53;
  input wire signed [(3'h6):(1'h0)] wire52;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  reg signed [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire80,
                 wire78,
                 wire77,
                 wire76,
                 wire57,
                 wire56,
                 wire55,
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
                 reg79,
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
                 (1'h0)};
  assign wire55 = ((wire51 ?
                      ($unsigned(wire50) || wire52[(3'h5):(2'h3)]) : (~wire54)) <= (wire52[(3'h4):(1'h0)] ?
                      {(((8'hb0) ? wire53 : wire52) - (wire53 ?
                              wire52 : (8'hb0))),
                          {wire52}} : $signed(wire51[(3'h5):(2'h3)])));
  assign wire56 = (^~$unsigned($unsigned(wire54[(3'h4):(3'h4)])));
  assign wire57 = $signed(wire50[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire52[(1'h0):(1'h0)])
        begin
          if ((~(!({wire52[(2'h3):(2'h3)]} - {$unsigned((8'hb1)), (8'ha3)}))))
            begin
              reg58 <= ($unsigned($unsigned(wire56)) ~^ $signed(({(wire52 > wire57)} ?
                  wire55 : wire52)));
              reg59 <= ({((8'ha7) | wire55[(1'h0):(1'h0)]),
                  wire52[(3'h4):(1'h0)]} + wire54);
            end
          else
            begin
              reg58 <= (+reg58);
              reg59 <= (+$unsigned(((((8'hb7) ? wire53 : wire53) ?
                      (reg58 < wire54) : {reg59}) ?
                  reg58 : (wire56 || wire55[(1'h1):(1'h1)]))));
            end
          reg60 <= (~&wire55);
          reg61 <= (8'ha4);
        end
      else
        begin
          reg58 <= $signed((wire51 ?
              {$unsigned($unsigned(wire54)),
                  ($signed(wire54) >= wire52[(1'h0):(1'h0)])} : wire56));
        end
      reg62 <= $signed((reg58 ? (7'h42) : (^~(wire50 <<< (reg60 && reg59)))));
      if ((8'h9c))
        begin
          reg63 <= $signed($unsigned($unsigned((~|wire57))));
          reg64 <= (({(reg61[(3'h4):(1'h0)] > wire56[(2'h2):(1'h0)])} ?
                  (-$unsigned($signed(wire53))) : wire57[(3'h5):(1'h1)]) ?
              {wire57[(4'ha):(2'h3)], $signed($signed({reg62}))} : (reg59 ?
                  (reg58[(4'hf):(1'h1)] ?
                      $signed($unsigned((7'h44))) : (!(+(8'hb1)))) : $unsigned({$unsigned(wire51),
                      (~^reg60)})));
          reg65 <= ({$signed((!wire54[(4'h8):(3'h4)]))} ?
              ((~{(wire52 ? wire54 : wire54)}) > ((^reg62[(3'h4):(2'h2)]) ?
                  $unsigned((reg63 >= wire52)) : (&wire56))) : ($signed(((!wire54) << wire51)) ?
                  reg62[(2'h2):(2'h2)] : (((reg59 ? wire57 : reg63) ?
                      reg59[(2'h2):(2'h2)] : reg60[(4'hc):(3'h6)]) ^ ({reg61,
                          (8'hbb)} ?
                      $signed(reg58) : reg61))));
        end
      else
        begin
          reg63 <= (~^($signed((wire55[(2'h2):(1'h1)] >= $signed(reg64))) ?
              (((|reg62) << reg65) - reg61[(1'h0):(1'h0)]) : (8'hb8)));
          if ($signed(({reg65[(2'h2):(1'h0)],
                  $signed((reg64 ? wire56 : reg63))} ?
              ({wire55} & reg63) : (wire55 | (wire54[(4'h8):(2'h3)] | $signed(wire56))))))
            begin
              reg64 <= $signed((~^$unsigned(reg64[(2'h2):(1'h1)])));
              reg65 <= (^(($unsigned($unsigned(reg63)) < ($unsigned(reg65) >= reg60[(3'h4):(3'h4)])) ?
                  ((^(reg62 ? wire57 : (7'h44))) ?
                      $signed(wire55[(3'h6):(3'h6)]) : $unsigned({reg63,
                          reg58})) : ($signed((reg64 >> reg59)) != (^~reg60))));
              reg66 <= (reg65 > (reg64[(1'h0):(1'h0)] & wire51[(1'h0):(1'h0)]));
              reg67 <= wire51[(1'h1):(1'h0)];
              reg68 <= $signed($signed((reg66 ?
                  ({reg63} ?
                      reg62 : (wire56 <= reg66)) : (reg66[(3'h5):(1'h1)] - wire51))));
            end
          else
            begin
              reg64 <= $unsigned($unsigned({{(~|(8'ha0)), $unsigned(reg58)}}));
              reg65 <= ({(+(~|wire52[(3'h6):(2'h3)])),
                  wire53[(2'h3):(2'h2)]} + $unsigned(((!$unsigned(reg63)) + $unsigned((wire56 - wire53)))));
              reg66 <= (((~$unsigned(wire55[(1'h1):(1'h1)])) ^ $signed(reg58)) == ({$signed($signed(reg59))} && reg67[(3'h6):(3'h5)]));
            end
          if (wire54)
            begin
              reg69 <= {(reg59[(3'h5):(2'h2)] ?
                      $signed(((8'hbe) ^~ wire51)) : wire54)};
              reg70 <= $signed($unsigned({$signed(reg63[(4'ha):(4'ha)]),
                  ((+reg65) <<< ((8'ha4) ? reg64 : reg64))}));
              reg71 <= ($signed(((wire55 ^ $unsigned((8'h9e))) >= (-wire50[(3'h4):(3'h4)]))) ?
                  (!(|$signed((reg60 ? wire54 : wire52)))) : (($signed({reg61,
                          reg66}) || $signed((reg67 >>> (8'ha5)))) ?
                      $unsigned($signed($unsigned(wire55))) : $unsigned(wire50[(3'h4):(3'h4)])));
            end
          else
            begin
              reg69 <= {$signed((7'h40))};
              reg70 <= ($signed((reg71 <<< $signed(reg62[(1'h0):(1'h0)]))) <= (&{(8'ha7),
                  (&(reg66 ? reg69 : reg60))}));
              reg71 <= (reg62[(3'h7):(1'h1)] ?
                  $signed($unsigned((+wire51[(1'h1):(1'h1)]))) : (|reg66[(2'h2):(1'h1)]));
              reg72 <= ($signed((-{reg63})) + wire54);
            end
          reg73 <= wire54[(4'ha):(1'h1)];
        end
      reg74 <= wire53[(3'h7):(2'h3)];
      reg75 <= $signed((|reg61[(1'h0):(1'h0)]));
    end
  assign wire76 = ((reg62[(3'h7):(2'h2)] <<< $unsigned(($unsigned(reg63) ?
                          reg62 : $unsigned(reg70)))) ?
                      reg74 : $unsigned($unsigned({$unsigned(wire53)})));
  assign wire77 = (wire52 * $unsigned((!$unsigned(reg73[(2'h3):(2'h2)]))));
  assign wire78 = $unsigned((($signed((8'hb8)) && reg63[(4'hc):(3'h7)]) >= reg70));
  always
    @(posedge clk) begin
      reg79 <= $signed((~^$signed($unsigned(((7'h40) ? reg59 : (8'h9c))))));
    end
  assign wire80 = reg73[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg81 <= (!(($unsigned((^~wire50)) && reg66) * (8'hba)));
      if (reg73)
        begin
          reg82 <= (+wire57[(1'h0):(1'h0)]);
        end
      else
        begin
          reg82 <= (-reg79[(4'hf):(4'hb)]);
        end
      if ((($unsigned(reg69) ?
              ($signed(reg67) * (~&(-reg69))) : wire57[(4'hd):(3'h6)]) ?
          $unsigned(wire51[(1'h1):(1'h1)]) : {$unsigned(reg73),
              ((!wire77) ~^ reg63)}))
        begin
          reg83 <= {(!$unsigned(((|wire56) ?
                  (wire55 & wire56) : $unsigned(reg70)))),
              ($signed($unsigned($unsigned(reg75))) ?
                  (~&(wire76 >> (+wire78))) : $unsigned((reg74[(3'h5):(1'h1)] ^~ (reg67 == (8'ha7)))))};
          reg84 <= (&wire54[(3'h7):(2'h3)]);
        end
      else
        begin
          reg83 <= (((~&$signed($unsigned(reg75))) | wire52[(3'h6):(3'h4)]) >>> wire80);
          if ((8'hb3))
            begin
              reg84 <= $signed(reg60);
              reg85 <= $signed((~|wire56[(3'h7):(3'h4)]));
              reg86 <= reg82;
              reg87 <= {reg60[(4'h9):(1'h1)], $unsigned(reg58[(3'h7):(2'h2)])};
            end
          else
            begin
              reg84 <= (~&(($unsigned($signed((8'hb5))) >>> reg82[(1'h1):(1'h0)]) < ((8'hbb) >>> {((7'h41) ?
                      (7'h41) : (8'ha1))})));
            end
          reg88 <= reg72[(4'hd):(3'h4)];
          reg89 <= $signed(reg84);
          reg90 <= reg81;
        end
      reg91 <= $unsigned((8'hb1));
    end
  always
    @(posedge clk) begin
      reg92 <= $unsigned(($unsigned(reg83) ?
          ($signed((wire50 - reg73)) ?
              {$unsigned(reg70)} : ((reg68 + (8'ha7)) ?
                  reg79 : reg69[(1'h1):(1'h1)])) : reg84[(3'h7):(2'h2)]));
      reg93 <= ((reg82[(1'h1):(1'h1)] ?
              ({(reg61 >>> (8'ha9))} && $unsigned((reg58 ?
                  reg82 : wire56))) : $signed($unsigned(((8'hab) ?
                  reg66 : (8'hb3))))) ?
          (($signed((reg82 <= reg63)) | {(+reg63),
              (^~(8'hbd))}) > wire78) : $unsigned((&$unsigned((reg70 ?
              reg90 : reg81)))));
      reg94 <= ($unsigned(reg82) > {reg71[(2'h3):(2'h2)],
          wire57[(2'h2):(2'h2)]});
    end
  assign wire95 = ((($signed({reg83}) >>> reg92[(3'h7):(2'h2)]) >>> reg81[(3'h5):(3'h5)]) ?
                      {reg92[(4'hf):(3'h6)], wire80} : ((($signed(wire50) ?
                                  reg64 : (8'had)) ?
                              reg91 : wire76[(3'h5):(3'h5)]) ?
                          $signed(reg58) : $signed($signed($signed(reg85)))));
  assign wire96 = reg58[(2'h2):(1'h0)];
  assign wire97 = reg90;
  assign wire98 = ($unsigned($signed($signed($signed(reg59)))) == (reg74[(1'h1):(1'h0)] > wire55[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      reg99 <= (($unsigned({(reg63 << wire52), wire56}) ? wire96 : reg86) ?
          $unsigned((({reg84} - {(8'hb2), reg90}) > (8'hbf))) : {((!wire97) ?
                  wire77[(2'h2):(2'h2)] : ((+reg90) * $unsigned((8'hac))))});
      reg100 <= $signed((^~(~&reg84[(3'h5):(1'h0)])));
      if ({$unsigned({((reg65 <<< wire56) & $unsigned((8'hbf))),
              (+{(8'haa)})})})
        begin
          reg101 <= (reg58 <<< $unsigned((wire95[(1'h0):(1'h0)] ?
              wire53[(3'h6):(3'h5)] : (~$unsigned(reg100)))));
          if (({wire97[(1'h1):(1'h0)]} ? reg64[(2'h2):(1'h0)] : reg82))
            begin
              reg102 <= $signed($signed((wire56[(3'h5):(2'h3)] ?
                  $unsigned((reg72 & (8'hb0))) : {reg74, reg63})));
              reg103 <= {reg89, $signed(reg91)};
              reg104 <= reg79;
              reg105 <= reg64[(1'h0):(1'h0)];
              reg106 <= ((reg59[(2'h2):(1'h0)] ?
                  reg72 : (^$signed((~|reg101)))) & (+reg71[(2'h3):(1'h1)]));
            end
          else
            begin
              reg102 <= reg61[(1'h1):(1'h1)];
              reg103 <= (-(&$unsigned(reg79[(5'h14):(4'he)])));
            end
          reg107 <= ((8'ha0) ?
              (wire55 ?
                  ((-reg102) ^~ reg58[(4'he):(4'he)]) : ($signed($unsigned(reg65)) ?
                      $unsigned(wire95) : $unsigned((reg93 | reg81)))) : $unsigned((+$signed($unsigned(wire97)))));
          reg108 <= reg84;
        end
      else
        begin
          reg101 <= (($signed((reg67[(3'h7):(3'h4)] ?
                      reg85[(2'h3):(1'h0)] : {wire52})) ?
                  reg84 : (^(~^(~^reg101)))) ?
              $unsigned((~wire95[(2'h3):(2'h3)])) : {wire96});
          if ($unsigned(reg92))
            begin
              reg102 <= $signed((~|reg102[(4'hc):(3'h7)]));
              reg103 <= ((wire56 ?
                  reg89 : $unsigned(((reg74 * reg93) + $unsigned(reg64)))) ^ (~^$signed(reg101[(4'hb):(1'h0)])));
            end
          else
            begin
              reg102 <= (7'h42);
            end
          reg104 <= $unsigned((|$unsigned(reg86)));
          reg105 <= (|reg66[(1'h1):(1'h0)]);
        end
      if (($signed(($signed((~^(8'ha0))) ?
          $unsigned((reg79 ?
              reg103 : reg82)) : (&(^reg83)))) ^ (reg62[(4'h8):(3'h4)] ?
          reg63 : reg79)))
        begin
          if ({reg67})
            begin
              reg109 <= $unsigned(wire50[(1'h1):(1'h1)]);
              reg110 <= {$signed(($unsigned($signed(reg70)) > reg106)),
                  ((+({wire98} >> (-(8'hbf)))) == $unsigned($signed(((8'hb0) ?
                      (8'hb2) : reg71))))};
              reg111 <= $signed($unsigned(reg94[(4'hb):(1'h1)]));
              reg112 <= {reg68};
            end
          else
            begin
              reg109 <= {$unsigned(reg68),
                  ($unsigned(($signed(reg90) && $signed(reg86))) ?
                      ($unsigned({(8'hb2)}) == {wire56}) : (8'hbc))};
              reg110 <= reg87[(2'h2):(1'h0)];
              reg111 <= $signed(($signed(((reg112 ? reg81 : reg62) ?
                      wire77[(4'hf):(3'h5)] : reg58[(4'hd):(3'h5)])) ?
                  {((reg68 ? reg87 : reg74) ?
                          (^~wire77) : wire97[(5'h10):(4'hb)]),
                      $unsigned(wire51[(2'h3):(1'h0)])} : reg102));
              reg112 <= reg84;
              reg113 <= reg72;
            end
          if ($signed($unsigned((reg68[(4'he):(1'h1)] ?
              (~$signed(reg108)) : reg64))))
            begin
              reg114 <= (~{$signed((reg93[(1'h1):(1'h0)] & (reg69 ?
                      (8'hb5) : reg111))),
                  $signed({((8'hae) - (8'ha5)), reg79[(4'hc):(2'h3)]})});
              reg115 <= (~({$signed($signed(reg107))} ?
                  wire57[(2'h2):(1'h1)] : reg62));
              reg116 <= (^{$unsigned(($signed((8'ha8)) > (7'h41))),
                  (reg85 * $unsigned((wire77 ? reg94 : reg102)))});
            end
          else
            begin
              reg114 <= reg69;
            end
          reg117 <= wire51;
          reg118 <= $signed(reg92[(4'hb):(4'hb)]);
        end
      else
        begin
          reg109 <= $unsigned((reg81 ^~ {wire76,
              ($signed(reg111) ? (~|reg82) : (7'h44))}));
          reg110 <= $signed({$signed(((reg115 && reg81) ?
                  (~&wire76) : {wire76})),
              {((wire50 | reg67) >> (|(8'hb7))), $unsigned((reg73 >= reg59))}});
        end
    end
endmodule

module module16
#(parameter param38 = ((7'h43) == {({(^(8'ha3)), (~|(7'h43))} - ((8'hbf) >> ((8'hb7) <= (8'hba))))}), 
parameter param39 = param38)
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  assign y = {wire37,
                 wire36,
                 wire35,
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
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = (wire20 ?
                      wire19[(2'h2):(1'h1)] : ($signed((^(~&wire19))) ?
                          ((8'hbb) ^~ wire20[(1'h1):(1'h0)]) : (8'hab)));
  assign wire22 = $signed(({{(wire21 ^ wire18), wire17},
                      $signed({wire18})} != (~^wire20)));
  assign wire23 = $signed($signed($signed(({wire19, wire17} ?
                      ((8'h9d) > wire21) : (wire22 ^~ wire18)))));
  assign wire24 = ($signed(($unsigned($unsigned(wire23)) ?
                      (wire23[(3'h4):(2'h3)] ^~ (&wire23)) : ((wire21 ?
                          wire23 : wire23) | wire19))) ^ ($unsigned($signed(((8'ha6) <<< wire19))) ?
                      $signed((wire20 << wire20[(1'h0):(1'h0)])) : (((!wire18) ?
                              ((8'h9f) ? wire19 : wire20) : $signed(wire18)) ?
                          ((wire23 & wire23) >= $unsigned((8'ha1))) : wire17[(1'h0):(1'h0)])));
  assign wire25 = (wire18 | ($signed((-$unsigned(wire20))) ?
                      $unsigned($signed(wire21)) : ((~^(wire18 - wire20)) && wire24)));
  assign wire26 = wire23[(3'h5):(3'h5)];
  assign wire27 = $signed(((~^wire17) + ({wire20[(1'h0):(1'h0)]} == ($signed(wire19) < $signed(wire26)))));
  assign wire28 = $signed(wire18[(4'h8):(3'h5)]);
  assign wire29 = $unsigned($signed({wire26[(4'h9):(3'h7)]}));
  assign wire30 = ((8'ha9) & wire18[(1'h0):(1'h0)]);
  assign wire31 = ($unsigned($unsigned((wire27[(2'h2):(2'h2)] != wire30))) ?
                      $signed(wire29[(4'hb):(1'h1)]) : $signed($unsigned(wire23)));
  assign wire32 = (wire26 ?
                      $unsigned(wire25[(3'h5):(1'h0)]) : (((wire18 ?
                          $signed(wire30) : (wire30 | wire22)) ^~ wire19) == (~^$unsigned((8'hb7)))));
  assign wire33 = {$signed(((+wire20[(1'h1):(1'h1)]) ?
                          ($signed(wire32) ^~ wire30[(3'h6):(3'h4)]) : wire17)),
                      $signed($unsigned(wire17))};
  assign wire34 = wire28;
  assign wire35 = ((wire23[(1'h1):(1'h1)] ?
                      $unsigned(wire18) : $unsigned((!wire17[(4'h9):(3'h4)]))) >= ($signed(wire30[(2'h3):(2'h2)]) != wire32));
  assign wire36 = wire23;
  assign wire37 = wire28[(4'hf):(1'h1)];
endmodule
