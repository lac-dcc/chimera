module top
#(parameter param168 = ((~{(|(!(8'hb9))), {((8'hab) - (8'ha0))}}) & (^(~^{{(8'ha8), (8'had)}, ((8'ha3) * (8'hb6))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire165;
  wire [(3'h4):(1'h0)] wire164;
  wire signed [(2'h3):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire141;
  wire signed [(4'hf):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire148;
  wire [(3'h4):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire156;
  wire signed [(3'h5):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire162;
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire143,
                 wire5,
                 wire141,
                 wire145,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire151,
                 wire153,
                 wire155,
                 wire156,
                 wire160,
                 wire161,
                 wire162,
                 reg159,
                 reg158,
                 (1'h0)};
  assign wire5 = wire4[(3'h7):(3'h5)];
  module6 #() modinst142 (.wire11(wire2), .y(wire141), .clk(clk), .wire9(wire4), .wire10(wire3), .wire8(wire0), .wire7(wire1));
  module6 #() modinst144 (.wire9(wire2), .wire10(wire141), .wire8(wire0), .clk(clk), .wire7(wire4), .wire11(wire1), .y(wire143));
  assign wire145 = $signed({(!(((8'hab) <<< wire141) != ((8'hb8) ?
                           wire2 : wire143)))});
  assign wire146 = (~&((-(wire1 - $signed(wire141))) | wire2[(4'hb):(1'h0)]));
  assign wire147 = ({($signed($unsigned(wire5)) & ({wire143} != $signed(wire146)))} ?
                       {wire145[(3'h6):(1'h1)],
                           {(~^(~^wire3))}} : $signed($unsigned(wire5)));
  assign wire148 = wire0[(2'h3):(1'h0)];
  module13 #() modinst150 (.wire15(wire3), .clk(clk), .y(wire149), .wire16(wire1), .wire17(wire148), .wire14(wire145));
  module125 #() modinst152 (wire151, clk, wire145, wire4, wire3, wire141);
  module125 #() modinst154 (wire153, clk, wire148, wire141, wire1, wire146);
  assign wire155 = {(wire149[(3'h4):(3'h4)] ?
                           (&{wire2,
                               (^~(8'hbe))}) : $signed(wire2[(5'h13):(4'hd)]))};
  module125 #() modinst157 (.wire129(wire148), .wire126(wire146), .wire127(wire0), .clk(clk), .wire128(wire5), .y(wire156));
  always
    @(posedge clk) begin
      reg158 <= wire141[(4'he):(4'h8)];
      reg159 <= wire155[(2'h2):(1'h0)];
    end
  assign wire160 = (8'hac);
  assign wire161 = ($unsigned($signed(reg159)) ^~ (^~(~|$signed((wire141 ?
                       wire2 : wire143)))));
  module34 #() modinst163 (wire162, clk, wire145, wire148, wire141, wire4, wire161);
  assign wire164 = wire146;
  assign wire165 = wire143[(1'h1):(1'h0)];
  assign wire166 = ((7'h43) ?
                       wire5 : {(wire164[(2'h3):(1'h0)] ?
                               wire155[(1'h1):(1'h0)] : (^~(!wire1))),
                           $unsigned($signed((wire165 ? wire162 : (8'ha0))))});
  assign wire167 = $unsigned((($signed($signed(wire4)) * wire153[(4'hb):(2'h3)]) ?
                       {($unsigned(wire149) ? (&wire0) : wire5)} : wire166));
endmodule

module module6
#(parameter param139 = (~^(((+(&(8'hb1))) ? (((8'ha7) || (8'hab)) >>> ((8'ha4) | (8'ha3))) : ((~(8'ha5)) - ((8'hb0) ? (8'ha6) : (8'hb1)))) ? (+((|(7'h42)) >>> ((8'hb4) >= (8'ha7)))) : (!{((8'haa) ? (8'hac) : (8'hb1))}))), 
parameter param140 = (^((((param139 <<< param139) || ((8'ha6) ? (8'hb5) : param139)) ? ({(8'ha3), param139} != (param139 | param139)) : ((param139 ? param139 : param139) ~^ param139)) ? param139 : (((param139 ? param139 : (8'haf)) ? {(8'ha2)} : (param139 ~^ (8'hb3))) ? param139 : ((param139 >= param139) ? (param139 ? param139 : param139) : (8'ha4))))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire134;
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire117,
                 wire57,
                 wire12,
                 wire30,
                 wire32,
                 wire33,
                 wire55,
                 wire119,
                 wire120,
                 wire134,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 (1'h0)};
  assign wire12 = (8'hb9);
  module13 #() modinst31 (wire30, clk, wire9, wire11, wire12, wire10);
  assign wire32 = $signed((wire11 ? wire7 : $unsigned(wire8)));
  assign wire33 = wire7;
  module34 #() modinst56 (.wire38(wire33), .wire35(wire11), .clk(clk), .wire36(wire7), .wire37(wire32), .wire39(wire10), .y(wire55));
  assign wire57 = (~wire33[(3'h6):(2'h2)]);
  module58 #() modinst118 (wire117, clk, wire33, wire32, wire11, wire55, wire9);
  assign wire119 = (wire30[(5'h12):(5'h11)] ?
                       $signed(wire11[(4'hb):(3'h5)]) : wire12);
  assign wire120 = $unsigned({{(-(|wire119))}});
  always
    @(posedge clk) begin
      reg121 <= wire12[(4'h8):(2'h2)];
      reg122 <= (|wire120[(1'h1):(1'h1)]);
      reg123 <= {$unsigned({reg121[(3'h5):(2'h3)]}),
          $unsigned(($signed({wire120, reg121}) ? wire11 : $unsigned(wire30)))};
    end
  always
    @(posedge clk) begin
      reg124 <= wire8[(1'h1):(1'h1)];
    end
  module125 #() modinst135 (wire134, clk, wire10, wire9, wire12, reg122);
  assign wire136 = $signed(((8'hb7) < wire119[(4'hc):(4'hc)]));
  assign wire137 = $signed(reg123[(1'h1):(1'h1)]);
  assign wire138 = $signed($signed(({$unsigned(wire137), $signed(wire32)} ?
                       wire117 : $unsigned((&wire136)))));
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire129;
  input wire [(4'h9):(1'h0)] wire128;
  input wire [(2'h2):(1'h0)] wire127;
  input wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire130;
  assign y = {wire133, wire132, wire131, wire130, (1'h0)};
  assign wire130 = ((^(~|$signed(wire126[(1'h0):(1'h0)]))) == ((wire126 ?
                       (&(~^(8'hba))) : $unsigned(wire126[(3'h5):(2'h2)])) ^~ wire127));
  assign wire131 = ((-$unsigned((|(8'ha5)))) & (wire130 ?
                       {wire128,
                           (+(wire126 ?
                               (8'hae) : (8'haf)))} : $unsigned(wire130[(3'h5):(2'h2)])));
  assign wire132 = $unsigned(($signed($unsigned((|wire126))) ?
                       (wire126[(3'h5):(3'h4)] | wire131) : (~|wire126)));
  assign wire133 = $unsigned(((wire128[(4'h9):(1'h1)] ?
                           wire127 : wire126[(3'h4):(1'h1)]) ?
                       $signed(($unsigned(wire128) ?
                           (wire127 ?
                               (7'h42) : (8'hba)) : $unsigned(wire132))) : wire131));
endmodule

module module58
#(parameter param115 = (({(((8'ha8) != (7'h41)) ~^ (&(8'ha4)))} ^~ (~^{(!(8'had)), (~|(8'hbc))})) ~^ ({((~(7'h41)) ? (|(7'h41)) : ((8'hb7) || (8'had)))} ? ((~|{(8'hbe), (8'hb8)}) - {((8'ha7) <= (7'h44)), {(7'h43), (8'hae)}}) : (~{((8'hbf) >>> (8'hb2))}))), 
parameter param116 = ((+param115) == {(param115 ? (param115 ? param115 : param115) : param115)}))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h238):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire63;
  input wire signed [(3'h5):(1'h0)] wire62;
  input wire signed [(3'h6):(1'h0)] wire61;
  input wire signed [(2'h2):(1'h0)] wire60;
  input wire signed [(5'h10):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire68;
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire101,
                 wire100,
                 wire99,
                 wire91,
                 wire90,
                 wire75,
                 wire68,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg64 <= wire62;
      reg65 <= $unsigned(wire61[(3'h6):(1'h0)]);
      reg66 <= $unsigned($unsigned(($signed(wire62) ?
          ({wire61, reg64} ? (wire61 <= wire60) : (8'ha3)) : reg64)));
      reg67 <= $unsigned((reg64[(3'h5):(3'h4)] >= $unsigned(reg66[(2'h3):(1'h0)])));
    end
  assign wire68 = $unsigned($signed((|(reg66[(5'h10):(4'hd)] <= $unsigned(wire62)))));
  always
    @(posedge clk) begin
      reg69 <= (($signed(reg65) * (~^$signed($signed(reg67)))) ?
          $unsigned((~^$signed(reg66))) : (+(|($unsigned(reg67) >= wire63))));
      reg70 <= ((wire60 ?
          reg64[(2'h2):(1'h1)] : ((reg66[(5'h11):(4'he)] < $signed(wire62)) ?
              {wire59[(1'h1):(1'h0)]} : wire61)) != $signed(reg69[(2'h2):(1'h0)]));
      if ({(~|{((wire62 || (8'hba)) ? (+reg65) : (wire59 ? wire61 : wire63))}),
          {(8'hac)}})
        begin
          reg71 <= reg70;
          reg72 <= (+$unsigned($unsigned(($unsigned(reg67) ?
              reg64 : (reg69 ? reg70 : (8'hba))))));
        end
      else
        begin
          reg71 <= (wire63[(5'h11):(4'hb)] >> (reg70[(3'h4):(1'h0)] ?
              ((-(reg71 ? reg71 : reg66)) != ({wire68} ?
                  wire63[(3'h6):(2'h3)] : {reg69,
                      wire60})) : $unsigned((((7'h40) >> reg69) <= (wire60 >>> reg71)))));
          if ($signed(wire60))
            begin
              reg72 <= wire63[(4'h8):(1'h0)];
              reg73 <= (wire59 * $unsigned($unsigned($unsigned((^wire60)))));
              reg74 <= $signed((-$unsigned({wire68[(3'h4):(3'h4)]})));
            end
          else
            begin
              reg72 <= (($signed($signed(reg67[(2'h2):(1'h1)])) ?
                      (reg66 == (wire68 ?
                          $unsigned(wire60) : (&reg72))) : $signed(((reg66 - reg65) ?
                          $unsigned(reg66) : wire68))) ?
                  $signed(($unsigned(wire68) ?
                      {$signed(reg71),
                          wire61} : $unsigned(reg66))) : $signed($unsigned({reg69,
                      (^~wire68)})));
            end
        end
    end
  assign wire75 = {(wire63 ?
                          ($unsigned($unsigned(reg70)) || reg72[(3'h7):(2'h2)]) : $signed($signed((7'h41))))};
  always
    @(posedge clk) begin
      reg76 <= (8'ha9);
      if ($signed((~^(^~$signed($signed(reg66))))))
        begin
          reg77 <= (reg66[(5'h13):(4'ha)] >>> (+$unsigned($unsigned((reg67 ~^ wire59)))));
          reg78 <= (wire75[(3'h7):(3'h7)] || $unsigned($unsigned({reg67})));
          reg79 <= {reg77[(3'h4):(2'h3)]};
        end
      else
        begin
          reg77 <= wire68;
          reg78 <= $signed($unsigned($unsigned(({reg70, wire75} <= wire75))));
          reg79 <= $unsigned($unsigned(reg67));
        end
      reg80 <= ((|(^$signed(reg69))) ?
          $signed(((8'ha6) & $unsigned($signed(reg77)))) : $signed((8'ha0)));
      reg81 <= ((wire61[(2'h3):(1'h0)] ?
          $unsigned((~|$unsigned(reg72))) : (reg73[(5'h14):(5'h11)] ?
              (~^wire61) : ($signed(reg72) <<< {reg70, wire68}))) <= (reg65 ?
          reg69 : reg69[(1'h0):(1'h0)]));
      if ($unsigned((((reg73[(5'h11):(4'hc)] <= {reg69, reg66}) ?
              ($unsigned(reg72) >>> $unsigned(wire63)) : {$unsigned(wire75),
                  {wire68, (8'hba)}}) ?
          (^~reg64) : (^~{$signed(wire59), $unsigned(reg69)}))))
        begin
          reg82 <= ((reg80 ?
              (reg70 ?
                  (reg81[(1'h1):(1'h0)] ?
                      reg72[(1'h1):(1'h1)] : $unsigned(reg76)) : ((reg76 ?
                      wire59 : reg66) * reg71[(3'h4):(3'h4)])) : (8'h9f)) > (^~$signed($signed($unsigned(reg73)))));
          reg83 <= reg79;
          reg84 <= {{reg79[(2'h2):(2'h2)]}};
          reg85 <= (8'haf);
          reg86 <= wire62;
        end
      else
        begin
          reg82 <= (&reg74);
          reg83 <= {(8'ha9), wire60[(1'h1):(1'h1)]};
          reg84 <= (8'ha3);
          if (reg85)
            begin
              reg85 <= (reg69 & $signed($signed((^$signed(wire59)))));
              reg86 <= ($unsigned({reg73[(4'hc):(2'h2)],
                      reg86[(2'h2):(1'h1)]}) ?
                  {$signed({reg80, reg71})} : $unsigned($unsigned({(8'ha5)})));
              reg87 <= wire63;
              reg88 <= reg77[(5'h10):(4'hf)];
            end
          else
            begin
              reg85 <= reg79;
              reg86 <= {$unsigned({($signed(reg82) ? {reg86, wire59} : (8'ha4)),
                      ((~^wire62) + $signed(reg64))}),
                  $unsigned((reg88[(3'h4):(1'h0)] + (|(reg80 ?
                      reg74 : reg73))))};
            end
          reg89 <= $signed(reg79[(1'h1):(1'h0)]);
        end
    end
  assign wire90 = reg85;
  assign wire91 = $unsigned(($signed(($unsigned(reg64) || (&reg81))) ?
                      ({(~&wire68)} ^~ reg70) : ($unsigned($unsigned(reg88)) ?
                          (reg83[(4'hb):(4'h8)] ?
                              $signed(reg73) : $unsigned((8'ha9))) : (reg67 || reg79[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg92 <= $signed((~&$unsigned(($signed((8'ha5)) ?
          ((7'h41) ^~ (8'hbe)) : $signed(wire59)))));
      if (reg65)
        begin
          reg93 <= $unsigned($unsigned($signed($unsigned(reg92[(2'h2):(1'h1)]))));
          if (($signed((~{(reg64 ? reg67 : wire60)})) ?
              $signed($unsigned(reg87)) : reg77[(3'h6):(3'h4)]))
            begin
              reg94 <= (wire68[(4'hb):(4'h8)] ?
                  ({(~&reg83[(1'h0):(1'h0)])} - reg86[(2'h2):(2'h2)]) : ({$signed((reg81 ?
                          reg80 : wire62)),
                      (8'hbe)} >> reg67[(2'h2):(1'h0)]));
              reg95 <= (reg79 * $signed(reg88));
              reg96 <= ($signed({reg92}) || ((^~({reg73} == wire68)) << (reg64 ?
                  (reg79 ~^ wire60) : ((reg81 ~^ reg66) ?
                      (8'hbd) : {(8'ha7)}))));
            end
          else
            begin
              reg94 <= $signed(reg72);
            end
          reg97 <= $signed(($unsigned({reg96}) < reg83));
          reg98 <= $signed(((^~((reg92 ?
                  reg78 : reg83) - reg95[(1'h0):(1'h0)])) ?
              $signed((((8'ha1) <<< reg80) ?
                  (^~reg77) : (~^reg73))) : ($unsigned({wire60}) ?
                  $unsigned($signed(wire61)) : $signed((8'ha2)))));
        end
      else
        begin
          if (reg95)
            begin
              reg93 <= $signed($signed(reg89[(3'h7):(2'h3)]));
              reg94 <= ($unsigned((($signed(reg76) ?
                      reg72 : (reg84 ? wire75 : wire90)) < ((reg67 - reg84) ?
                      reg84[(3'h6):(3'h6)] : reg74[(4'h9):(2'h3)]))) ?
                  (($signed(reg82[(4'hf):(4'hf)]) ?
                          $signed((-reg84)) : reg92[(1'h0):(1'h0)]) ?
                      wire90[(2'h2):(2'h2)] : (((reg84 * reg66) & (~^wire91)) ?
                          reg76[(3'h5):(3'h4)] : ($unsigned(reg98) > (wire60 ?
                              reg69 : reg86)))) : (!$signed(reg98)));
              reg95 <= ((~((+$signed(wire90)) ?
                  {reg82,
                      (|(8'hb7))} : reg86[(3'h6):(1'h0)])) == ($unsigned(wire59) << (reg96 >= reg92[(2'h2):(1'h0)])));
            end
          else
            begin
              reg93 <= (^~reg82[(3'h5):(3'h4)]);
              reg94 <= reg88[(2'h3):(2'h2)];
              reg95 <= (((reg76[(1'h0):(1'h0)] ?
                      reg86[(3'h7):(3'h7)] : ($unsigned(wire90) ?
                          reg77 : $unsigned(reg69))) ?
                  $signed({$signed(reg72)}) : {reg80[(3'h7):(1'h1)],
                      $unsigned($unsigned(reg71))}) || (8'hb7));
              reg96 <= $signed((((reg86 ? $signed(reg94) : (~^reg92)) ?
                  wire60[(1'h0):(1'h0)] : {reg89[(4'hc):(3'h5)]}) ^~ ({((8'hab) != reg92),
                      (reg97 ? reg64 : reg78)} ?
                  reg98[(1'h0):(1'h0)] : (8'hb6))));
            end
        end
    end
  assign wire99 = {($unsigned(((~|reg79) ? reg98[(1'h0):(1'h0)] : (8'h9c))) ?
                          (8'hb0) : (reg69 < $unsigned(wire68)))};
  assign wire100 = (|wire62[(1'h0):(1'h0)]);
  assign wire101 = {reg70[(2'h3):(2'h3)]};
  always
    @(posedge clk) begin
      if ($signed($signed(((+(wire90 - (8'hb9))) ?
          $unsigned({(8'ha7), wire75}) : ((reg82 ? reg82 : reg83) ?
              wire100 : (reg71 >= reg95))))))
        begin
          if ((wire63[(3'h6):(3'h6)] ? reg94 : wire63[(5'h10):(4'hf)]))
            begin
              reg102 <= reg96;
              reg103 <= (($unsigned((8'hb7)) ? reg93 : reg96) && (~&reg94));
              reg104 <= $signed($unsigned((~|$signed($signed(reg74)))));
              reg105 <= $signed($signed((7'h44)));
              reg106 <= reg92;
            end
          else
            begin
              reg102 <= (~|wire63);
            end
        end
      else
        begin
          reg102 <= (((^({reg71, reg92} ? reg87 : (~|(8'haf)))) ?
              (|wire100) : $unsigned(($unsigned((8'hb3)) >>> wire60))) * reg71);
          reg103 <= (&$signed((~|reg104)));
        end
    end
  assign wire107 = (!((|(reg77 < (reg64 ? reg85 : reg85))) ?
                       {((reg96 ? reg87 : (8'hb5)) ?
                               {reg103,
                                   reg71} : (^reg104))} : $signed($unsigned($signed(reg89)))));
  assign wire108 = $signed({$signed(reg64[(1'h1):(1'h1)])});
  assign wire109 = wire62;
  assign wire110 = $unsigned($signed(($unsigned((~^wire59)) ?
                       (&$unsigned((8'ha5))) : {wire91})));
  assign wire111 = reg64[(3'h4):(3'h4)];
  assign wire112 = (~&$signed(((~&wire59) > $unsigned((8'hbf)))));
  assign wire113 = (wire111[(2'h2):(1'h0)] ?
                       (((~^(wire62 ? (8'hbe) : reg88)) ?
                           (reg95[(1'h0):(1'h0)] ?
                               $signed(wire107) : (^~(8'h9f))) : $signed(wire107[(5'h12):(2'h3)])) >= (((!wire63) ?
                               (reg71 >= wire109) : (wire99 > reg79)) ?
                           ($unsigned(reg96) ?
                               (wire110 ?
                                   reg103 : reg105) : ((8'ha4) != wire68)) : (reg92[(2'h2):(1'h1)] ^~ (reg70 - reg78)))) : {((wire99[(1'h1):(1'h1)] ^~ $signed(wire91)) || reg89),
                           (8'h9d)});
  assign wire114 = (({$unsigned(wire108[(3'h6):(3'h5)]),
                           $unsigned($signed((8'hb8)))} << reg95) ?
                       $signed(((reg92 ? $unsigned(reg81) : $signed(wire109)) ?
                           (wire90[(2'h2):(1'h0)] != reg86) : $signed($unsigned(reg84)))) : (($unsigned($unsigned((8'had))) ?
                           reg82 : ((reg86 > reg64) >>> reg80)) < reg74));
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire [(3'h7):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  input wire signed [(3'h5):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire40;
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  assign y = {wire54,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire40,
                 reg53,
                 reg52,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire40 = {$unsigned($signed(wire35[(3'h6):(1'h0)])),
                      (wire39[(3'h6):(3'h6)] ^ $signed($signed((wire37 ?
                          wire39 : wire36))))};
  always
    @(posedge clk) begin
      reg41 <= $unsigned($signed(wire40));
    end
  always
    @(posedge clk) begin
      reg42 <= (~((^(((8'ha2) ? wire38 : wire38) ?
              $unsigned(wire40) : $unsigned(wire40))) ?
          {wire36, (-(wire37 + wire40))} : $unsigned({(reg41 > wire39)})));
      reg43 <= $signed((~reg42[(3'h5):(3'h4)]));
      if (wire36[(1'h1):(1'h1)])
        begin
          reg44 <= {wire36[(2'h2):(2'h2)]};
          reg45 <= wire36[(2'h2):(2'h2)];
        end
      else
        begin
          reg44 <= wire38;
          reg45 <= wire38[(2'h3):(2'h2)];
        end
      reg46 <= $unsigned(({$signed((^reg43)),
          reg41} + $unsigned({wire39[(1'h1):(1'h0)], (reg42 ^ wire37)})));
      reg47 <= $signed((^reg43));
    end
  assign wire48 = (wire36 ?
                      ((($unsigned(reg41) ?
                          (|(8'hb9)) : (-wire36)) == $signed((reg46 ~^ reg44))) >>> reg44[(3'h4):(2'h2)]) : ((((wire37 ?
                              (8'h9d) : (8'hb8)) ^ $signed(reg43)) ?
                          (reg45 * {reg46}) : $unsigned((!reg43))) * ((~&$signed(reg45)) >> $unsigned((wire40 ?
                          wire35 : wire40)))));
  assign wire49 = wire38[(2'h2):(1'h1)];
  assign wire50 = (|wire48[(2'h2):(1'h0)]);
  assign wire51 = $signed($unsigned((8'h9c)));
  always
    @(posedge clk) begin
      reg52 <= ($unsigned($unsigned({$unsigned(reg41)})) || wire37);
      reg53 <= reg42[(3'h6):(2'h3)];
    end
  assign wire54 = (wire50[(3'h4):(3'h4)] || {wire35});
endmodule

module module13
#(parameter param28 = (((~(8'haa)) ? (-(((8'ha0) >>> (8'hb4)) ? (^(8'hb2)) : (~&(7'h44)))) : ((((8'haf) - (8'ha5)) ? ((7'h44) ? (8'hbd) : (8'ha4)) : (+(7'h44))) <<< (|{(8'h9f), (8'hac)}))) ? {(^~{((8'hba) ? (8'ha3) : (8'h9f))})} : {((^~((8'hba) << (8'ha8))) ? (~(-(8'ha0))) : (((8'hac) - (8'hb1)) <<< (~^(8'ha5))))}), 
parameter param29 = (^((((~|param28) << (&(8'ha8))) ? ((^(8'hb6)) ? (param28 ? param28 : param28) : (param28 <<< param28)) : ({(8'hbc), param28} ? (-param28) : (param28 && param28))) != (-(param28 | param28)))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(3'h4):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire18;
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire18 = $signed((8'ha6));
  assign wire19 = ((|$signed($unsigned({wire15, wire16}))) - $signed((8'ha8)));
  assign wire20 = (({(8'ha4)} ^ $unsigned(wire17)) ?
                      $signed((((!wire17) ?
                              wire14[(1'h1):(1'h1)] : (wire16 ?
                                  wire18 : wire15)) ?
                          ((wire16 - wire19) ?
                              (wire15 ? wire19 : wire18) : (wire19 ?
                                  wire17 : wire17)) : (7'h40))) : wire17);
  always
    @(posedge clk) begin
      if ($signed(((^~((8'h9c) ?
          $unsigned(wire18) : {wire20})) == $signed($unsigned($signed(wire17))))))
        begin
          reg21 <= (^~wire17[(2'h3):(2'h2)]);
          reg22 <= (wire14[(1'h1):(1'h0)] < (8'hb0));
        end
      else
        begin
          if ($signed((~|$signed((-$unsigned(wire15))))))
            begin
              reg21 <= $signed((+$unsigned((!$unsigned((8'ha3))))));
            end
          else
            begin
              reg21 <= $unsigned(($signed(wire18[(3'h6):(3'h6)]) ?
                  (reg22[(3'h7):(2'h3)] ?
                      $unsigned((!wire18)) : ({(7'h44), wire18} ?
                          wire17[(1'h1):(1'h0)] : wire19[(1'h1):(1'h0)])) : $unsigned(wire14[(1'h0):(1'h0)])));
              reg22 <= ($signed(wire15[(4'h8):(4'h8)]) ^~ $unsigned($unsigned((wire20 ?
                  $signed((8'h9f)) : ((7'h44) + wire14)))));
              reg23 <= ($signed(wire17[(2'h3):(1'h1)]) ?
                  ((~&wire19[(2'h2):(1'h0)]) ~^ wire18) : reg21);
              reg24 <= (wire16[(1'h0):(1'h0)] ?
                  (((+{(8'hb4), wire20}) ?
                          ((wire18 > wire15) * $signed((8'h9d))) : wire18) ?
                      reg23 : reg21[(1'h1):(1'h1)]) : $unsigned(wire14));
              reg25 <= reg22;
            end
          reg26 <= ($signed((-(8'hb7))) ?
              $signed(reg24) : wire19[(1'h1):(1'h0)]);
          reg27 <= (|(8'ha0));
        end
    end
endmodule
