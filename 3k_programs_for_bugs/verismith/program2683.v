module top
#(parameter param156 = (|({(8'hb2), (~((8'hb9) & (7'h43)))} ? ((^((8'had) ? (8'hbc) : (8'ha0))) ? {(-(8'ha9))} : (((8'hb5) ? (8'hb7) : (8'ha6)) > ((8'hb8) ? (8'hb8) : (8'ha3)))) : (+(~^((7'h42) <<< (8'hab)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire151;
  wire signed [(5'h10):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire76;
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire151,
                 wire149,
                 wire4,
                 wire5,
                 wire7,
                 wire76,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned({$unsigned((&$unsigned(wire2)))});
  assign wire5 = wire0;
  always
    @(posedge clk) begin
      reg6 <= ($signed($unsigned(($unsigned(wire3) ?
              (wire1 ? wire2 : wire3) : (wire2 ? wire5 : (8'hac))))) ?
          (wire3[(3'h7):(2'h3)] ?
              $unsigned(wire3[(4'he):(4'hc)]) : wire1[(3'h7):(1'h0)]) : $unsigned((-{$unsigned(wire1),
              (wire3 << (8'ha4))})));
    end
  assign wire7 = ($unsigned($unsigned(((8'ha2) ?
                     (wire1 | wire0) : ((8'hb5) <= wire1)))) == wire0[(2'h2):(1'h0)]);
  module8 #() modinst77 (wire76, clk, wire5, reg6, wire0, wire3);
  module78 #() modinst150 (.wire79(wire1), .wire83(wire5), .clk(clk), .wire82(reg6), .wire81(wire4), .wire80(wire3), .y(wire149));
  module15 #() modinst152 (wire151, clk, wire5, wire149, wire7, wire3, reg6);
  assign wire153 = $unsigned($unsigned($signed((~(-reg6)))));
  module45 #() modinst155 (.y(wire154), .wire47(wire2), .wire48(wire3), .clk(clk), .wire46(wire153), .wire49(wire0));
endmodule

module module78  (y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire83;
  input wire signed [(3'h4):(1'h0)] wire82;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire [(5'h13):(1'h0)] wire80;
  input wire [(5'h14):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire148;
  wire [(4'h8):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire127;
  wire signed [(5'h13):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(5'h10):(1'h0)] wire124;
  wire signed [(4'h8):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(5'h12):(1'h0)] wire84;
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg [(4'hb):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(3'h4):(1'h0)] reg128 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire118,
                 wire86,
                 wire85,
                 wire84,
                 reg146,
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
                 reg128,
                 (1'h0)};
  assign wire84 = wire80[(4'hc):(4'hb)];
  assign wire85 = (((wire80 >>> {$signed(wire83), wire82}) ?
                          wire83 : (^$signed((~|wire79)))) ?
                      (8'hac) : ($signed($signed((wire80 == wire80))) ?
                          $unsigned($unsigned(((8'hb1) <= wire82))) : $unsigned($unsigned((-wire81)))));
  assign wire86 = (wire81[(3'h5):(2'h2)] ?
                      (!(wire83 ?
                          {$signed(wire82),
                              $unsigned((8'ha2))} : $signed(((8'hb0) ?
                              (8'hba) : wire84)))) : wire80);
  module87 #() modinst119 (wire118, clk, wire86, wire84, wire79, wire81);
  assign wire120 = (^~wire81);
  assign wire121 = $unsigned((wire79[(5'h14):(5'h12)] == (-$signed($unsigned(wire86)))));
  assign wire122 = wire80;
  assign wire123 = wire122;
  assign wire124 = (((($signed(wire123) ? (-wire81) : (8'ha7)) ?
                           (wire118 ? (&wire118) : (8'hb9)) : ({wire81,
                               wire86} << ((8'hb9) <<< wire80))) ?
                       $signed(wire85[(5'h10):(4'h9)]) : (((|wire86) ?
                           $unsigned((8'ha8)) : (wire85 ?
                               wire79 : wire121)) || wire122)) - (~&wire118[(3'h7):(1'h0)]));
  assign wire125 = (($signed((wire118 ?
                           wire85[(4'hc):(4'h8)] : wire118[(3'h6):(1'h1)])) == $signed($signed(wire85[(1'h1):(1'h0)]))) ?
                       (wire84 ?
                           (wire86[(4'hb):(3'h7)] ?
                               wire80[(5'h12):(4'h9)] : {$unsigned((8'h9c)),
                                   wire124[(4'h8):(2'h3)]}) : $unsigned(wire81[(4'h9):(2'h3)])) : wire123);
  assign wire126 = {(wire81[(4'h8):(1'h1)] ?
                           ((((8'ha8) & wire124) ?
                                   $signed(wire85) : $unsigned(wire121)) ?
                               $unsigned((!wire81)) : (~^$signed(wire124))) : wire80[(2'h2):(1'h1)])};
  assign wire127 = $unsigned($unsigned((wire85[(1'h0):(1'h0)] ?
                       wire80 : {wire124, $unsigned(wire81)})));
  always
    @(posedge clk) begin
      reg128 <= $signed(wire121);
      if ((^~wire86))
        begin
          reg129 <= (^wire79);
          reg130 <= (($unsigned($signed($signed((8'had)))) || wire85[(3'h4):(2'h3)]) && wire85);
          if ($signed($signed((((&wire118) > wire80[(1'h0):(1'h0)]) & (~&((8'hb1) ?
              (7'h40) : wire80))))))
            begin
              reg131 <= (&({$unsigned($signed(wire126))} ?
                  (~|wire120) : (((wire127 ^~ wire83) ?
                          ((8'ha6) ? wire80 : (8'hab)) : $unsigned(wire120)) ?
                      (~&(-wire127)) : $signed($unsigned((8'hab))))));
              reg132 <= (+(reg129 ?
                  (wire83[(4'h8):(3'h7)] + (8'hb9)) : wire127));
              reg133 <= $signed(((((wire86 <<< wire86) ?
                      (~&(8'hb2)) : $signed(wire82)) < (wire121 * $signed(wire125))) ?
                  $signed(($unsigned(reg132) ?
                      $signed((8'hba)) : reg130[(2'h3):(1'h0)])) : reg131[(4'h8):(3'h6)]));
              reg134 <= (^~($signed((wire126 < $unsigned((8'hb2)))) < $unsigned(wire81)));
              reg135 <= (((wire125 > (wire86 << (~reg130))) > (-(reg132[(4'h8):(3'h4)] ?
                      (~&reg133) : wire120))) ?
                  ({(^~wire127),
                      (wire125[(3'h4):(2'h2)] & wire118)} && $signed(wire118[(4'hf):(1'h1)])) : wire85);
            end
          else
            begin
              reg131 <= (-(^$unsigned(reg131[(4'hc):(1'h0)])));
              reg132 <= ((reg135 ?
                  wire121[(2'h3):(2'h3)] : (~((wire81 <= wire79) && ((8'ha0) <= wire82)))) * ((wire83 || $signed($signed(wire124))) != reg134));
            end
        end
      else
        begin
          reg129 <= {wire121[(4'h8):(3'h7)]};
          reg130 <= $signed({(((^~wire121) && $unsigned(reg134)) ?
                  ((-reg128) ? $signed((8'hb5)) : wire85) : reg128)});
          reg131 <= wire79[(4'h9):(3'h6)];
          reg132 <= ((!$signed(reg132)) ?
              ({$unsigned((wire122 & wire125))} ?
                  $signed((((8'hae) >= reg130) ?
                      $unsigned((7'h40)) : (reg131 == (8'hb9)))) : wire84[(4'hd):(1'h0)]) : $unsigned(reg134[(1'h1):(1'h1)]));
        end
      if ($signed($unsigned($signed($unsigned((wire82 + (8'hb8)))))))
        begin
          if ($signed(($unsigned((wire126 | $signed(reg128))) ?
              {(~|$unsigned(reg135)),
                  wire121[(4'h8):(3'h7)]} : ((wire123 > wire84[(3'h4):(2'h3)]) ?
                  ($signed(wire85) > ((8'had) ~^ wire123)) : wire123))))
            begin
              reg136 <= $unsigned((~|$unsigned(wire85)));
              reg137 <= {wire86[(4'h9):(3'h6)],
                  ($signed((8'h9d)) ?
                      (+($signed(wire79) && (|wire81))) : $unsigned($unsigned((wire120 << wire83))))};
              reg138 <= $signed($unsigned({wire82[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg136 <= wire81[(4'hd):(3'h5)];
            end
          if (wire85)
            begin
              reg139 <= (reg135 <= {$unsigned((&(+reg130)))});
            end
          else
            begin
              reg139 <= $unsigned({reg129[(1'h1):(1'h1)]});
              reg140 <= wire121;
              reg141 <= $unsigned((^~wire127[(3'h6):(3'h4)]));
              reg142 <= {wire84, $unsigned($unsigned((-(wire127 <<< wire81))))};
            end
          reg143 <= $unsigned(reg132[(2'h3):(1'h0)]);
          reg144 <= (^{reg142[(4'h8):(3'h4)], {reg128[(1'h0):(1'h0)]}});
          reg145 <= ($signed(wire84) ?
              $signed(wire83[(3'h6):(3'h6)]) : {$unsigned(($signed(reg140) < wire81[(2'h2):(2'h2)]))});
        end
      else
        begin
          if ($signed((((~&(7'h43)) >> (reg130[(3'h7):(1'h0)] != $signed(reg133))) ?
              reg135 : (((reg128 * wire121) != ((8'h9f) ?
                  wire80 : reg139)) <= ({(8'hab), wire84} ?
                  (reg136 ? reg138 : wire86) : (!(8'hb0)))))))
            begin
              reg136 <= $signed($unsigned($signed(((-reg128) ?
                  reg137 : reg135))));
              reg137 <= $unsigned({(((~|reg134) ?
                          reg136[(3'h6):(1'h1)] : (~&reg134)) ?
                      {reg140[(2'h2):(1'h0)]} : $unsigned((~&reg130)))});
              reg138 <= wire83;
              reg139 <= (|$signed((((wire83 ?
                      wire85 : reg136) < $unsigned(wire122)) ?
                  $signed($signed(reg132)) : ({(8'hb9)} >= (reg142 ~^ wire82)))));
              reg140 <= reg128[(2'h3):(2'h2)];
            end
          else
            begin
              reg136 <= {$signed((^~({reg143} ~^ (reg138 ^ wire121))))};
            end
          if ((reg131[(1'h1):(1'h0)] ?
              ($unsigned(wire118) & (~reg131)) : (((8'hab) ~^ wire121) + wire118)))
            begin
              reg141 <= {wire80,
                  $signed($signed((wire122 ?
                      $unsigned(reg130) : reg132[(4'hd):(4'ha)])))};
            end
          else
            begin
              reg141 <= $signed($signed($signed(wire122)));
              reg142 <= reg136[(4'h8):(3'h5)];
              reg143 <= $unsigned($signed($unsigned((~reg130[(3'h5):(2'h2)]))));
              reg144 <= ($unsigned(($unsigned((reg137 ^~ wire83)) ?
                  $signed((reg134 ?
                      wire127 : reg128)) : $signed(reg142[(3'h5):(2'h3)]))) & (($signed((wire124 ?
                      reg129 : (8'h9f))) ^ $signed((reg141 | wire81))) ?
                  (+({wire120} << wire79)) : $signed($unsigned(((8'h9c) ?
                      reg130 : wire79)))));
            end
          reg145 <= $unsigned($signed(reg144));
        end
      reg146 <= ($signed(($signed((~reg142)) ?
              reg131 : reg142[(3'h6):(1'h1)])) ?
          ((($unsigned(wire126) ?
                  {wire124, wire122} : $unsigned(wire82)) <= (~^reg134)) ?
              reg141 : {wire80[(2'h2):(1'h1)]}) : (&{((^wire81) ?
                  reg135[(1'h1):(1'h1)] : {wire121})}));
    end
  assign wire147 = $signed($signed({$unsigned(wire120)}));
  assign wire148 = $unsigned((~|$unsigned((!$signed(reg135)))));
endmodule

module module8
#(parameter param75 = ({((((8'hb2) ? (8'ha1) : (8'ha8)) ? ((8'hbd) ~^ (8'hb7)) : (~&(8'hbe))) + ((-(8'h9f)) ? ((8'hb9) ^~ (8'ha6)) : ((8'hb0) < (8'hb7))))} ^~ {(~^((~|(8'hb3)) > ((8'hab) ? (8'ha3) : (8'hb8)))), ((8'ha0) ? {((8'hb7) - (8'ha3)), (+(8'hb2))} : ((^(8'ha1)) ? {(8'hb7)} : ((8'haa) ? (8'hae) : (8'ha1))))}))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire42;
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  assign y = {wire74,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire44,
                 wire13,
                 wire14,
                 wire42,
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
                 (1'h0)};
  assign wire13 = wire10[(3'h5):(3'h4)];
  assign wire14 = $unsigned(wire12[(1'h1):(1'h1)]);
  module15 #() modinst43 (wire42, clk, wire14, wire10, wire11, wire13, wire9);
  assign wire44 = $signed((~&$unsigned(wire11)));
  module45 #() modinst56 (.y(wire55), .wire48(wire14), .clk(clk), .wire47(wire42), .wire46(wire10), .wire49(wire13));
  assign wire57 = (+wire55[(2'h2):(1'h0)]);
  assign wire58 = $signed(wire12[(4'hc):(1'h0)]);
  assign wire59 = wire13[(4'hf):(3'h5)];
  assign wire60 = (8'ha8);
  assign wire61 = wire55[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg62 <= ((((^$unsigned(wire12)) ?
                  wire44[(3'h5):(2'h3)] : $unsigned((wire58 == wire55))) ?
              wire13[(4'h8):(2'h2)] : $signed($unsigned($signed(wire61)))) ?
          (($signed($signed((8'hac))) ? wire12[(1'h0):(1'h0)] : (^~wire13)) ?
              wire57 : wire57[(2'h3):(2'h2)]) : wire14[(3'h7):(3'h5)]);
      if ((^~(($unsigned((wire9 & wire61)) ? wire55 : wire11) ?
          ((&(wire57 ?
              wire11 : wire55)) && {wire44[(1'h1):(1'h0)]}) : (((wire10 ?
                  (8'h9e) : wire58) ?
              (~^wire59) : $signed(wire9)) && (-$signed(wire9))))))
        begin
          reg63 <= $signed($signed({wire57}));
          reg64 <= (7'h41);
          if (({reg64[(1'h0):(1'h0)]} ^~ wire11))
            begin
              reg65 <= (8'hba);
              reg66 <= (wire12[(4'he):(2'h2)] >> (wire9 ? wire59 : (7'h43)));
            end
          else
            begin
              reg65 <= {$unsigned($unsigned({(^reg65)})),
                  ((^$unsigned((-(8'hae)))) ?
                      $unsigned(($unsigned((8'had)) ?
                          (wire11 ?
                              wire59 : reg64) : wire55[(1'h0):(1'h0)])) : (^~wire60[(1'h1):(1'h0)]))};
              reg66 <= reg64;
              reg67 <= wire14[(4'hb):(4'hb)];
            end
          if ((wire10 ?
              (+$signed($unsigned($signed(wire61)))) : ((!reg66[(1'h1):(1'h0)]) ?
                  $unsigned($signed(wire10)) : $unsigned(reg62))))
            begin
              reg68 <= wire14;
              reg69 <= $unsigned(wire13[(4'hb):(1'h0)]);
              reg70 <= ($signed((wire12[(3'h7):(3'h7)] && {wire55})) ?
                  {wire59[(3'h5):(2'h3)]} : ($unsigned((((8'hb4) ?
                          wire60 : wire58) <<< (&reg69))) ?
                      ({$unsigned(reg65),
                          (wire9 ~^ wire42)} < reg65) : $unsigned(((reg66 ?
                              reg63 : reg66) ?
                          wire10[(4'h9):(2'h2)] : $unsigned(wire59)))));
              reg71 <= (wire61 ? (&{(-(~&wire61))}) : (^~$signed((8'hb4))));
            end
          else
            begin
              reg68 <= (8'hba);
              reg69 <= reg71[(4'he):(4'h9)];
              reg70 <= (~&{$unsigned({(reg69 ? (8'h9e) : wire57)}), reg69});
              reg71 <= (($unsigned((wire12 ?
                      $unsigned((8'hb7)) : reg63[(4'he):(4'hc)])) ?
                  ($signed(wire42[(2'h2):(1'h1)]) ?
                      wire14[(5'h12):(4'hd)] : {{wire10}}) : reg67[(1'h0):(1'h0)]) < reg64);
              reg72 <= reg66;
            end
          reg73 <= wire58[(1'h0):(1'h0)];
        end
      else
        begin
          reg63 <= $unsigned(($unsigned(wire13) > reg69[(4'he):(4'h8)]));
          reg64 <= (^reg68);
        end
    end
  assign wire74 = (($signed((&((8'had) - (8'h9f)))) ?
                          $signed({(wire42 ?
                                  (8'hab) : wire61)}) : wire11[(3'h4):(3'h4)]) ?
                      (8'hb6) : $unsigned(wire42));
endmodule

module module45
#(parameter param54 = (({(&((8'hbe) ? (7'h40) : (7'h42))), (~&(8'hb8))} ? ((((7'h41) ? (8'ha1) : (8'h9e)) ? ((8'hb5) ^~ (8'h9e)) : {(8'hbd), (8'h9c)}) ? (&{(8'h9c), (8'hb5)}) : (((8'hb5) ? (8'hbe) : (8'ha2)) >= {(8'hbf)})) : (|{((7'h44) ? (8'hbe) : (8'hb6))})) ? (-({((8'hbb) ~^ (8'hab))} & (8'h9d))) : (((((8'haf) ^~ (8'hb0)) ? (&(8'hba)) : ((8'ha0) ? (8'ha2) : (7'h44))) << {(^~(8'ha0))}) >>> ((((8'ha5) ~^ (8'hb2)) & {(8'ha7)}) ? {((8'hbd) >> (8'hb7)), ((8'hb0) != (7'h41))} : {{(8'h9c)}}))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire49;
  input wire [(3'h4):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  assign y = {wire53, wire52, wire51, wire50, (1'h0)};
  assign wire50 = ($unsigned($signed($unsigned(wire49[(4'h9):(1'h0)]))) ?
                      wire46[(1'h1):(1'h0)] : (8'hb8));
  assign wire51 = (8'hb5);
  assign wire52 = (^~wire48);
  assign wire53 = {(wire46 ~^ $unsigned((~|{wire46, wire52}))),
                      (($signed($unsigned(wire49)) ?
                          ({wire46, wire48} ?
                              (wire48 - wire50) : $unsigned(wire51)) : wire47[(2'h3):(1'h1)]) - (($unsigned(wire50) < $unsigned((8'ha0))) ^ (~&$signed(wire51))))};
endmodule

module module15
#(parameter param41 = (({((&(8'haf)) ? ((7'h44) ? (7'h41) : (8'hac)) : (!(8'ha1))), (^~(~|(8'hbe)))} == {((+(8'ha1)) ? ((8'h9e) ^~ (8'hb6)) : ((8'haa) ? (8'hac) : (8'hb8))), ((~|(8'haa)) >> (&(8'ha6)))}) ? (((((8'ha6) ? (8'hb6) : (8'hb5)) ^ ((8'hbb) ? (8'ha5) : (8'ha5))) - (8'hac)) <= (!({(8'h9d)} ? ((8'hb9) ? (8'ha7) : (8'hb0)) : ((8'ha3) ^ (8'ha9))))) : (((!((8'hac) ? (8'h9e) : (8'hb0))) != (-((8'ha0) | (8'hb4)))) ? (((~|(8'h9e)) >= (8'hbd)) ? (((8'h9c) * (7'h40)) + ((8'hb1) >>> (8'ha6))) : ({(8'hb7), (8'hb8)} ? ((8'hb5) >= (8'hae)) : (|(7'h42)))) : (^(-((8'hbe) != (8'hb8)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire28,
                 wire27,
                 wire24,
                 wire22,
                 wire21,
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 reg23,
                 (1'h0)};
  assign wire21 = (8'h9f);
  assign wire22 = (wire17[(2'h2):(2'h2)] || ($unsigned($signed($unsigned(wire17))) ?
                      $unsigned(wire20) : ($signed(wire16) ?
                          $signed(wire19[(2'h3):(1'h1)]) : (~$signed(wire19)))));
  always
    @(posedge clk) begin
      reg23 <= ((($unsigned(wire18) < $unsigned(wire18[(2'h2):(2'h2)])) << ((+wire22) ^~ (wire18 >= $signed(wire18)))) ?
          ($signed((+(wire20 ^~ wire22))) ?
              (wire20[(1'h1):(1'h0)] != wire18[(4'ha):(4'h8)]) : $unsigned(wire17[(3'h4):(3'h4)])) : (8'hba));
    end
  assign wire24 = ($signed(wire16[(1'h1):(1'h1)]) ?
                      reg23 : {(((|wire19) ? {(8'hba)} : wire20) ?
                              (&wire20[(3'h6):(2'h3)]) : $signed({wire16,
                                  wire16})),
                          (wire20 ^~ (7'h40))});
  always
    @(posedge clk) begin
      reg25 <= wire24[(4'ha):(3'h5)];
      reg26 <= $signed((8'haf));
    end
  assign wire27 = $unsigned($unsigned(((!$unsigned(wire24)) ?
                      {wire21[(2'h2):(1'h1)], (!wire24)} : reg26)));
  assign wire28 = {(reg23 >> wire16)};
  always
    @(posedge clk) begin
      reg29 <= ($signed($signed({wire22})) >>> (((&(wire22 ^ reg25)) * wire19) >= $unsigned({wire28})));
      reg30 <= ($signed((&((7'h44) & $signed(wire22)))) != $signed((wire16 ?
          (!(reg26 >>> wire19)) : wire19)));
      reg31 <= wire22[(3'h7):(2'h3)];
    end
  assign wire32 = $unsigned((~&{wire24, wire27}));
  assign wire33 = (8'hab);
  assign wire34 = $signed(({wire17} <<< $signed(((^~wire21) ?
                      wire16[(2'h2):(2'h2)] : wire28[(1'h0):(1'h0)]))));
  assign wire35 = ((~^(((reg30 <<< wire32) ? (reg25 > wire19) : (8'ha9)) ?
                      wire34[(2'h3):(1'h0)] : wire24)) < $unsigned($signed($unsigned(wire18[(4'h8):(2'h3)]))));
  assign wire36 = $signed((^(!((reg23 ? (8'had) : reg29) ?
                      $unsigned((8'hbe)) : $signed(reg23)))));
  assign wire37 = wire18[(4'h9):(1'h1)];
  assign wire38 = ($signed((-((reg26 ^ (8'hb4)) ?
                      $unsigned(wire16) : {(8'h9d)}))) > ((^wire17[(3'h4):(1'h0)]) ?
                      {$signed((reg26 ? (8'h9e) : reg25)),
                          ($unsigned((8'h9f)) + $unsigned(reg23))} : $unsigned($unsigned($unsigned(reg26)))));
  assign wire39 = {(reg23[(2'h3):(2'h3)] ?
                          $signed($signed(wire35[(3'h4):(3'h4)])) : (wire20[(2'h2):(2'h2)] ?
                              (^(reg26 >= wire16)) : (~|$unsigned(wire16))))};
  assign wire40 = wire36[(2'h3):(2'h3)];
endmodule

module module87
#(parameter param117 = (((((^~(8'hb4)) >= (^~(8'hae))) ? (((8'h9e) ? (8'hb9) : (8'hb8)) ? ((8'hbd) || (8'hba)) : (^(7'h43))) : (((8'h9e) ? (8'hae) : (8'h9e)) >= ((8'ha9) - (8'ha4)))) > ((7'h40) ? (((8'hbb) < (8'ha1)) & (~&(8'ha4))) : (8'ha6))) << (+(!{((8'hb9) ^ (8'ha7)), ((8'hbc) ? (8'hb0) : (8'haa))}))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire91;
  input wire signed [(5'h12):(1'h0)] wire90;
  input wire signed [(2'h2):(1'h0)] wire89;
  input wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(5'h15):(1'h0)] wire110;
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  assign y = {wire112,
                 wire110,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg111,
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
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg92 <= $unsigned(wire88);
      if (($signed($unsigned(((^(8'hba)) >>> (reg92 >>> reg92)))) ?
          wire91 : (reg92[(4'h8):(1'h0)] ?
              ((wire89 >> $signed(wire90)) ?
                  (&$signed(reg92)) : wire88) : wire89[(1'h1):(1'h1)])))
        begin
          reg93 <= wire89[(2'h2):(1'h0)];
          reg94 <= wire89;
        end
      else
        begin
          reg93 <= $signed((((^$unsigned(reg94)) | reg93) ?
              (reg92[(1'h1):(1'h0)] || $signed(reg92[(2'h2):(1'h0)])) : $unsigned($signed($unsigned((7'h43))))));
          if ($signed($unsigned(wire89[(2'h2):(1'h1)])))
            begin
              reg94 <= (~{$signed(wire89[(1'h1):(1'h0)])});
              reg95 <= $signed(((~(wire91 != reg92)) ?
                  $unsigned(((^(8'h9e)) ?
                      {reg92,
                          wire88} : $unsigned(wire91))) : $signed($signed(((8'hb6) ?
                      reg93 : reg93)))));
            end
          else
            begin
              reg94 <= ($signed((^(((8'hbe) ?
                      wire88 : reg93) == (reg95 >= wire90)))) ?
                  $unsigned(wire91) : $unsigned($unsigned(wire91)));
              reg95 <= $signed(wire89);
            end
        end
      reg96 <= $signed((((reg92[(4'hd):(2'h2)] < $signed(wire90)) ?
          (reg95[(1'h1):(1'h1)] || wire88) : (wire90[(4'h8):(3'h7)] ~^ wire89)) >= ((~|wire89[(1'h0):(1'h0)]) ?
          wire90 : ((wire91 ? reg93 : reg95) <= (-reg95)))));
      if (reg92[(4'hd):(3'h7)])
        begin
          if ($signed((reg92 ?
              (&$unsigned((~(8'hbf)))) : (~reg92[(3'h6):(3'h6)]))))
            begin
              reg97 <= $unsigned(reg92[(4'h8):(1'h0)]);
              reg98 <= reg94;
              reg99 <= reg93[(4'hb):(3'h4)];
              reg100 <= $unsigned((^~reg95[(1'h0):(1'h0)]));
            end
          else
            begin
              reg97 <= $signed(reg93);
              reg98 <= $signed((!$unsigned(reg97[(1'h0):(1'h0)])));
            end
          reg101 <= $unsigned($signed(reg92[(3'h7):(3'h4)]));
          if ($unsigned((^$signed($unsigned($unsigned((8'haa)))))))
            begin
              reg102 <= $signed((wire91[(3'h5):(2'h3)] ?
                  wire90[(4'he):(2'h2)] : (((!reg96) ?
                          $unsigned(reg93) : wire90) ?
                      (!(!reg93)) : $signed((reg101 ? reg93 : reg92)))));
              reg103 <= reg95;
              reg104 <= reg96[(3'h4):(1'h1)];
              reg105 <= reg95;
              reg106 <= ((^reg104) ~^ {{$unsigned(((7'h40) ?
                          reg95 : wire88))}});
            end
          else
            begin
              reg102 <= ((8'hb2) ?
                  ((((~&reg96) || reg100[(4'hb):(3'h5)]) | $unsigned($signed(reg98))) <= $unsigned($unsigned((reg95 ?
                      reg92 : reg103)))) : $unsigned($unsigned(reg101[(3'h6):(1'h1)])));
              reg103 <= ($unsigned((reg95 ?
                      reg99[(4'ha):(4'h8)] : ($unsigned((8'hb5)) ?
                          reg106 : (wire88 >>> reg98)))) ?
                  ($signed($unsigned(reg103)) < reg105) : $unsigned(($unsigned((~|reg105)) ?
                      $signed($unsigned(reg99)) : (-(reg94 * (8'h9d))))));
              reg104 <= (-$unsigned(wire91[(4'hb):(3'h5)]));
              reg105 <= (|$signed($unsigned((reg104[(3'h7):(3'h4)] ?
                  $signed(reg98) : {wire89, reg105}))));
              reg106 <= $signed(reg104);
            end
          reg107 <= reg93[(3'h7):(1'h0)];
        end
      else
        begin
          if (wire88)
            begin
              reg97 <= $signed($unsigned(((reg97[(1'h0):(1'h0)] && {(7'h43),
                  reg94}) ^~ ((reg97 != wire90) ?
                  $unsigned(reg97) : $signed(reg95)))));
              reg98 <= (reg100 ^ reg97);
              reg99 <= ($signed({$signed(reg107)}) + reg96);
            end
          else
            begin
              reg97 <= $unsigned(reg99);
              reg98 <= reg105;
            end
        end
    end
  always
    @(posedge clk) begin
      reg108 <= (^~{(8'h9c), (~&(^~$unsigned(reg98)))});
      reg109 <= {($unsigned((wire91[(4'h8):(2'h3)] ?
                  $signed(reg92) : (reg93 >= reg92))) ?
              ((((8'ha6) ? reg97 : reg98) ?
                  ((8'ha5) ? reg97 : (8'hb7)) : ((8'ha0) ?
                      reg106 : reg100)) < wire91[(3'h6):(3'h5)]) : reg101),
          $signed((8'hb3))};
    end
  assign wire110 = reg94[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg111 <= ($unsigned(reg92[(3'h6):(1'h0)]) > (-reg108[(3'h4):(1'h1)]));
    end
  assign wire112 = ((((wire88[(2'h2):(1'h0)] ?
                           (reg93 ?
                               reg97 : reg106) : (~^reg99)) && ((reg94 != reg103) ?
                           (reg92 ? wire89 : reg111) : reg94[(3'h5):(3'h4)])) ?
                       ($signed(reg107) && reg99) : reg97[(1'h0):(1'h0)]) | (~{(~^(|wire90))}));
  always
    @(posedge clk) begin
      reg113 <= (|($signed((~^$unsigned((7'h41)))) ?
          $unsigned(reg109[(2'h2):(1'h1)]) : reg100[(3'h5):(2'h3)]));
      reg114 <= (-$unsigned($signed($signed(reg103))));
      reg115 <= reg92;
      reg116 <= {$unsigned(reg100[(4'h9):(1'h1)])};
    end
endmodule
