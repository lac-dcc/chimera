module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire183;
  wire [(5'h14):(1'h0)] wire182;
  wire signed [(4'h8):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire176;
  wire [(4'h8):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire180;
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  reg [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire178,
                 wire176,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire6,
                 wire5,
                 wire180,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire5 = {(wire3 ?
                         (!({wire0} >>> $unsigned(wire3))) : $unsigned((|(wire0 == wire0)))),
                     (wire2 ?
                         {$unsigned((wire0 ? wire4 : wire0)),
                             (8'ha6)} : (8'hab))};
  assign wire6 = wire1[(3'h7):(3'h5)];
  module7 #() modinst123 (.clk(clk), .wire10(wire6), .wire8(wire2), .wire11(wire4), .wire9(wire0), .y(wire122));
  assign wire124 = (~^wire5[(2'h3):(1'h0)]);
  assign wire125 = $unsigned(wire6);
  assign wire126 = $unsigned({(~^((^~wire6) > (wire122 != wire1)))});
  assign wire127 = $signed((~(~((~wire3) ?
                       (wire122 == wire1) : $signed(wire122)))));
  assign wire128 = wire0;
  assign wire129 = ($signed(wire1[(2'h3):(1'h1)]) & $signed((^~$signed(wire125[(4'ha):(3'h7)]))));
  module130 #() modinst177 (wire176, clk, wire1, wire5, wire124, wire126);
  module15 #() modinst179 (wire178, clk, wire0, wire129, wire4, wire127, wire3);
  module15 #() modinst181 (.wire16(wire126), .wire19(wire0), .wire20(wire125), .y(wire180), .wire18(wire4), .clk(clk), .wire17(wire124));
  assign wire182 = $unsigned($unsigned($signed(wire6)));
  assign wire183 = wire0[(5'h14):(5'h13)];
  always
    @(posedge clk) begin
      reg184 <= ($signed((($unsigned(wire1) > ((7'h42) ?
          wire128 : wire178)) == {$signed(wire178),
          (wire0 ^~ wire1)})) && wire4[(4'h8):(2'h2)]);
      reg185 <= wire129;
      reg186 <= wire2;
    end
endmodule

module module130
#(parameter param174 = ((-(+(8'hab))) << (8'ha6)), 
parameter param175 = {((-param174) >>> (~|{(~|param174)}))})
(y, clk, wire134, wire133, wire132, wire131);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire134;
  input wire [(5'h15):(1'h0)] wire133;
  input wire [(3'h6):(1'h0)] wire132;
  input wire [(4'hf):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire signed [(4'h9):(1'h0)] wire163;
  wire signed [(2'h3):(1'h0)] wire135;
  reg [(4'hf):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg168 = (1'h0);
  reg signed [(4'he):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(4'h9):(1'h0)] reg165 = (1'h0);
  assign y = {wire173,
                 wire172,
                 wire163,
                 wire135,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  assign wire135 = (~&(|$signed(wire131[(4'hd):(4'hd)])));
  module136 #() modinst164 (wire163, clk, wire133, wire135, wire134, wire132);
  always
    @(posedge clk) begin
      if ($signed(wire131))
        begin
          reg165 <= $signed(((~|{(wire134 == wire163)}) ^ (~($signed(wire134) ?
              $unsigned(wire131) : $signed(wire135)))));
          reg166 <= wire135;
          reg167 <= reg166;
          reg168 <= $unsigned({(reg165[(3'h4):(1'h0)] ? reg166 : wire133)});
          if ($signed(reg167))
            begin
              reg169 <= $unsigned({(~((&reg166) ^~ (reg165 <= wire134))),
                  $unsigned({wire133, (wire134 ? wire163 : wire133)})});
              reg170 <= $signed($signed($signed($signed((wire131 ?
                  reg165 : reg165)))));
            end
          else
            begin
              reg169 <= $signed(wire135[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          if ((reg167 - wire134[(1'h1):(1'h1)]))
            begin
              reg165 <= $unsigned($signed((~^(^~$signed(wire132)))));
              reg166 <= $unsigned({$unsigned(wire134),
                  $signed({(!wire133), wire135})});
              reg167 <= reg170[(1'h0):(1'h0)];
              reg168 <= $signed({wire132[(2'h3):(2'h2)],
                  ({wire132,
                      $signed(wire132)} < ((wire135 >> reg168) <<< {reg168,
                      wire134}))});
              reg169 <= wire163;
            end
          else
            begin
              reg165 <= $signed((($unsigned((wire131 * wire163)) * reg166) ?
                  $signed(wire134) : (wire135 ?
                      ((reg165 & (8'hb7)) ?
                          (wire134 ?
                              reg165 : (7'h43)) : $unsigned(reg169)) : $unsigned(reg168[(4'hd):(4'ha)]))));
              reg166 <= $signed((^wire132));
            end
        end
      reg171 <= $signed(((((8'ha3) ?
          wire163 : (reg166 << (8'hab))) >= $unsigned($unsigned(wire135))) * (wire134 ?
          $signed((^~(8'ha9))) : (wire132[(1'h0):(1'h0)] * (reg166 ?
              reg168 : wire134)))));
    end
  assign wire172 = (($unsigned(($signed(wire163) ? {(8'hbe)} : wire135)) ?
                           (($signed(wire163) ?
                                   $unsigned(reg165) : (wire135 != reg167)) ?
                               reg171 : {(7'h43),
                                   (reg170 ?
                                       (8'hae) : (7'h44))}) : $signed((wire163 & $unsigned(reg170)))) ?
                       {(^~((wire132 - reg168) <= (&reg169))),
                           ({(wire163 ? wire132 : reg166),
                                   wire134[(3'h5):(3'h4)]} ?
                               $unsigned((|reg170)) : (~|$signed(wire134)))} : wire134);
  assign wire173 = reg168[(4'hb):(3'h5)];
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire12;
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire120, wire90, wire88, wire14, wire12, reg13, (1'h0)};
  assign wire12 = wire10[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg13 <= $signed($signed($unsigned(wire8[(1'h0):(1'h0)])));
    end
  assign wire14 = (~|$unsigned(((^~(wire11 <= reg13)) ^~ (wire8 == wire12[(4'h8):(3'h4)]))));
  module15 #() modinst89 (.wire18(wire10), .y(wire88), .wire17(wire12), .wire20(reg13), .wire16(wire11), .wire19(wire14), .clk(clk));
  assign wire90 = $signed((reg13[(2'h2):(1'h0)] <<< (($signed(wire10) ?
                      ((8'hba) ?
                          wire8 : wire8) : (wire14 && wire11)) != $unsigned((wire12 + wire12)))));
  module91 #() modinst121 (wire120, clk, wire90, wire9, wire12, reg13, wire8);
endmodule

module module91
#(parameter param118 = (8'ha8), 
parameter param119 = param118)
(y, clk, wire96, wire95, wire94, wire93, wire92);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire96;
  input wire [(5'h14):(1'h0)] wire95;
  input wire signed [(3'h7):(1'h0)] wire94;
  input wire signed [(4'h8):(1'h0)] wire93;
  input wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(2'h3):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire110,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire97 = wire92;
  assign wire98 = wire93;
  assign wire99 = $signed(wire97[(4'hc):(2'h2)]);
  assign wire100 = ($signed((+((wire94 ? wire95 : (8'hbc)) ?
                           {wire96} : wire96[(3'h6):(3'h6)]))) ?
                       {(7'h41),
                           ((((8'hae) ?
                               wire92 : wire94) - (&wire95)) << ($unsigned((8'hb8)) ?
                               $signed(wire99) : ((8'hb7) ?
                                   wire93 : (8'hb7))))} : {($signed(wire96) * ((~&wire96) ~^ $unsigned((8'hb8)))),
                           (wire98[(2'h2):(2'h2)] ?
                               (+$unsigned(wire93)) : $unsigned(wire92))});
  assign wire101 = $signed($unsigned(($unsigned($unsigned(wire97)) ?
                       wire100[(1'h0):(1'h0)] : {(wire94 * wire95), wire100})));
  always
    @(posedge clk) begin
      reg102 <= (wire92 || wire94[(1'h0):(1'h0)]);
      reg103 <= {$signed($signed(reg102[(4'h8):(3'h6)])),
          ((((wire99 ? reg102 : (8'hae)) ?
                  wire101[(4'hc):(3'h5)] : wire98[(2'h2):(1'h0)]) != {(wire94 ?
                      wire92 : wire94)}) ?
              wire92 : $signed((reg102 < (wire92 ? wire99 : wire93))))};
      reg104 <= $signed(wire101);
    end
  always
    @(posedge clk) begin
      reg105 <= $unsigned(({((wire97 ? reg103 : wire100) ?
                  $signed(wire98) : ((8'ha4) ? wire92 : wire99))} ?
          ($signed(reg104[(3'h6):(2'h2)]) ?
              ((~(8'ha9)) ?
                  $signed((8'hae)) : wire94) : $signed($unsigned(wire100))) : (8'haf)));
      reg106 <= ($signed((wire98[(1'h0):(1'h0)] ?
          $unsigned($signed((7'h44))) : wire93)) >= $unsigned(($unsigned(reg104) ?
          ((wire101 ? reg105 : wire94) < ((8'ha0) ?
              wire98 : wire101)) : $signed({reg103}))));
      reg107 <= (($unsigned($signed({wire96, wire98})) ?
          (reg102 ?
              {(wire96 ?
                      reg106 : wire100)} : reg104) : $signed($unsigned(wire99))) << (^$signed(((wire99 ?
          wire93 : wire100) != (wire98 ? wire101 : (8'ha8))))));
      reg108 <= $signed((8'hab));
      reg109 <= ($signed($signed($unsigned((reg106 >> wire101)))) * ({{(reg108 << reg102),
                  wire95},
              $signed(((8'h9f) ? wire100 : wire94))} ?
          (|{$signed(wire94),
              reg104}) : (wire100 <= $unsigned(((8'ha3) >>> reg105)))));
    end
  assign wire110 = wire94;
  always
    @(posedge clk) begin
      reg111 <= $unsigned({{((-wire98) >>> ((8'h9d) || (8'ha5)))},
          ($signed($signed((8'hb4))) ? wire92 : $unsigned({wire95, wire94}))});
      reg112 <= $signed($signed(reg104));
      reg113 <= reg107;
      reg114 <= (&(-wire96));
      reg115 <= $signed($unsigned((wire100 ?
          {reg113[(3'h5):(1'h0)], (reg112 >>> reg114)} : (8'hb0))));
    end
  assign wire116 = $unsigned((!reg106[(2'h3):(2'h2)]));
  assign wire117 = ((!($unsigned($signed(wire92)) ^~ $unsigned((wire92 ?
                       wire98 : reg107)))) * (($unsigned(wire97[(2'h3):(1'h0)]) ?
                           (~wire95[(4'hc):(3'h4)]) : $unsigned((~|wire98))) ?
                       (reg111 ?
                           (reg108 ? (|(8'ha7)) : $signed(wire96)) : (reg108 ?
                               wire93[(3'h6):(2'h3)] : reg107)) : reg102[(2'h2):(1'h0)]));
endmodule

module module15
#(parameter param87 = {((&(|((7'h44) ? (8'ha0) : (8'ha5)))) ? ((-((8'haa) ? (8'hab) : (8'hba))) ? ((~(8'hb2)) << (!(8'hbb))) : (|((7'h41) - (8'hac)))) : ({(~|(8'h9f)), ((8'hbe) ? (8'hbd) : (8'haa))} || {((8'hac) ? (8'h9c) : (7'h44))}))})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h2e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire71;
  wire [(3'h7):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  assign y = {wire84,
                 wire71,
                 wire70,
                 wire68,
                 wire42,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire28,
                 wire23,
                 wire22,
                 wire21,
                 reg86,
                 reg85,
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
                 reg69,
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
                 reg41,
                 reg40,
                 reg39,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = wire18;
  assign wire22 = wire16;
  assign wire23 = wire17;
  always
    @(posedge clk) begin
      reg24 <= {(~|(!(+$unsigned(wire18)))),
          (wire19[(2'h2):(1'h1)] ?
              wire22 : {$unsigned(wire23[(2'h2):(2'h2)])})};
      reg25 <= (reg24 << (($signed($signed(wire22)) - wire18) ?
          ($unsigned($signed(reg24)) < (wire22[(4'h8):(3'h4)] < (~^wire18))) : (-reg24)));
      reg26 <= (((7'h43) >>> $unsigned(($signed(wire17) ?
              {(8'h9c), reg24} : (8'hb2)))) ?
          ($unsigned({{wire23, wire23}}) | (&((wire20 ?
              (8'h9e) : reg25) + wire21))) : wire23);
      reg27 <= $unsigned(wire18);
    end
  assign wire28 = $signed((~wire19[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      if ($signed($unsigned(((^$unsigned(wire22)) ~^ ($signed(wire28) ?
          $unsigned(wire22) : wire20[(4'ha):(3'h6)])))))
        begin
          reg29 <= {($unsigned({$unsigned(reg24), (reg27 | wire19)}) ?
                  (8'ha8) : wire19)};
          if (wire19[(2'h3):(1'h1)])
            begin
              reg30 <= $signed(wire20[(4'hc):(4'ha)]);
            end
          else
            begin
              reg30 <= (~|(8'haf));
            end
          reg31 <= $unsigned($signed($unsigned($unsigned((~wire23)))));
          reg32 <= $signed($signed($unsigned(wire21)));
        end
      else
        begin
          reg29 <= {(~reg26)};
          reg30 <= ((reg29 < $unsigned((-wire20))) - $signed($signed(($unsigned((8'hbf)) ?
              reg27 : $unsigned(wire22)))));
          reg31 <= $unsigned((~((~^wire22[(2'h3):(2'h2)]) ?
              ($unsigned((8'h9f)) ?
                  {reg25, reg27} : (^~reg31)) : ($signed(reg30) | {reg31,
                  reg27}))));
          reg32 <= $unsigned($signed((8'h9e)));
        end
      reg33 <= $unsigned((^(($unsigned(wire17) ?
              reg30[(4'hc):(3'h7)] : {reg30, wire18}) ?
          (|(reg32 | wire28)) : (|$unsigned((8'hbb))))));
      reg34 <= (^~reg33);
    end
  assign wire35 = (~&$unsigned($unsigned((+(reg31 <<< (8'h9e))))));
  assign wire36 = $signed({$unsigned(reg25[(1'h0):(1'h0)])});
  assign wire37 = (wire20 && {$signed($signed({reg33})),
                      $unsigned(({wire36} ? $unsigned(reg31) : (|reg30)))});
  assign wire38 = $unsigned($signed(wire23));
  always
    @(posedge clk) begin
      reg39 <= $unsigned($unsigned($signed(wire35[(3'h4):(1'h1)])));
      reg40 <= {$signed((8'hb2))};
      reg41 <= (^~(+(-$unsigned(reg30))));
    end
  assign wire42 = {(~(({reg27} ?
                          (reg31 ?
                              reg30 : wire18) : (|reg34)) <<< (^((8'had) < reg34))))};
  always
    @(posedge clk) begin
      if ((($unsigned($unsigned(reg29[(1'h0):(1'h0)])) << $unsigned(((reg30 << (8'hb9)) ?
          (reg29 || reg30) : (wire22 ? wire28 : wire20)))) << (wire22 ?
          (&$signed((wire19 >= wire16))) : {reg33[(4'ha):(3'h7)],
              ((wire17 ? (8'ha3) : wire18) ?
                  (wire20 ? reg26 : reg34) : reg24)})))
        begin
          reg43 <= (!wire16);
          if ($unsigned(reg34))
            begin
              reg44 <= (^~(+$signed($unsigned((~|reg33)))));
              reg45 <= $unsigned({{($unsigned((8'had)) << $signed((8'hb9)))},
                  ({(reg31 ? wire21 : wire23)} ?
                      (reg40 <<< $signed(reg43)) : reg34[(4'hd):(4'hb)])});
            end
          else
            begin
              reg44 <= $signed(wire23[(3'h5):(2'h2)]);
              reg45 <= (wire17 ?
                  reg39 : ($unsigned((reg41 * {(8'hbe)})) >= $unsigned(($signed(reg26) ?
                      (wire16 ? reg44 : reg33) : (reg32 ^~ wire17)))));
              reg46 <= reg33;
              reg47 <= $unsigned(((8'hb0) >> $unsigned(((~wire35) <= wire35[(1'h0):(1'h0)]))));
              reg48 <= $signed(reg41[(4'h8):(1'h0)]);
            end
          reg49 <= reg39[(3'h7):(2'h2)];
          if ((($signed($signed($unsigned(reg26))) ?
              $signed($unsigned(wire18[(1'h0):(1'h0)])) : $unsigned($signed(reg33))) >> (~^(!reg40))))
            begin
              reg50 <= ({$unsigned((8'hb6)),
                  (-reg31)} >= (reg29 && (~^$signed(reg29[(3'h5):(1'h0)]))));
            end
          else
            begin
              reg50 <= $signed(((((reg47 ?
                      wire22 : wire42) << $unsigned(reg26)) ?
                  {wire23[(3'h7):(2'h2)]} : ({reg33, reg47} ?
                      reg40 : (8'hb7))) >> reg24[(1'h0):(1'h0)]));
              reg51 <= reg41;
              reg52 <= reg25[(4'h8):(3'h5)];
              reg53 <= ((|$unsigned(wire38)) ?
                  reg40 : (wire20[(3'h6):(3'h5)] << reg50[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg43 <= $unsigned(((wire17 == $signed(wire28)) ~^ wire22[(2'h2):(2'h2)]));
          if (reg45)
            begin
              reg44 <= (reg51 ?
                  wire22[(3'h6):(3'h5)] : (^~reg29[(4'he):(2'h2)]));
              reg45 <= (8'hb0);
              reg46 <= ((reg29[(4'hb):(3'h4)] - (reg32 && reg52[(3'h5):(1'h0)])) ?
                  (wire21 != (reg31 ?
                      wire19[(3'h4):(1'h0)] : $signed((~^reg49)))) : reg33[(1'h1):(1'h1)]);
            end
          else
            begin
              reg44 <= {reg31};
              reg45 <= ($signed(reg46[(1'h1):(1'h0)]) ?
                  (8'hb9) : {($signed({wire37, reg33}) ?
                          {(!reg29)} : $unsigned(wire18)),
                      wire18});
              reg46 <= (|wire23[(2'h3):(2'h3)]);
            end
          if ({(($signed((reg53 && reg32)) ?
                  (reg29 ? reg46 : wire36[(1'h1):(1'h1)]) : $unsigned((reg34 ?
                      reg47 : wire28))) >>> $signed($unsigned($unsigned(reg44)))),
              {(-((wire19 ? reg24 : wire18) && (~^reg40))),
                  {(~^{reg41, wire28}), (8'ha8)}}})
            begin
              reg47 <= ($signed((7'h43)) & $signed(reg26[(3'h5):(2'h3)]));
              reg48 <= (($signed($signed((8'hac))) ?
                      {({wire18, wire28} || {reg49,
                              (8'had)})} : (!($unsigned(reg25) < (~&reg45)))) ?
                  {$unsigned($signed((reg34 >>> reg53))),
                      (reg33[(4'ha):(4'h8)] ?
                          wire16[(4'h8):(1'h0)] : reg30[(3'h6):(3'h5)])} : ($unsigned(reg40[(3'h7):(3'h4)]) || (((reg27 ^~ reg51) ?
                      $unsigned(reg43) : $unsigned((8'hbf))) >= $signed(wire16))));
              reg49 <= (^~$unsigned($unsigned(reg49[(4'hd):(4'hc)])));
            end
          else
            begin
              reg47 <= $signed($unsigned(wire35[(3'h7):(1'h1)]));
              reg48 <= reg33;
              reg49 <= $signed(reg30);
            end
          reg50 <= {reg40, ((8'ha7) >= (-wire21[(5'h12):(3'h7)]))};
          reg51 <= wire35;
        end
      if ($unsigned(((8'hb1) ?
          reg24 : {($unsigned((8'hb0)) ? wire23 : $unsigned(reg44))})))
        begin
          reg54 <= (((({reg47, reg41} > $signed(reg32)) ?
                  ($signed(reg49) ? reg50 : $unsigned((8'hbd))) : (wire35 ?
                      $unsigned(reg31) : (reg48 >= reg26))) & ($signed($signed(wire28)) | $signed(reg39[(4'ha):(3'h4)]))) ?
              $signed(wire42[(3'h6):(1'h1)]) : (~$unsigned((((8'hbc) ?
                      wire18 : reg41) ?
                  reg31[(2'h2):(1'h1)] : $signed((8'hbe))))));
          reg55 <= (((+(~&(wire35 * (8'hbf)))) ?
                  $unsigned(wire35) : $unsigned(($signed(reg45) * reg47))) ?
              reg49[(1'h0):(1'h0)] : (8'haf));
          reg56 <= (reg40 ?
              (&($unsigned(reg26) & (reg50 << (~wire21)))) : $unsigned((reg51[(3'h5):(3'h5)] ^ $unsigned((~&reg53)))));
          if ($unsigned((reg40[(3'h6):(1'h1)] + $signed({wire36[(2'h3):(2'h2)]}))))
            begin
              reg57 <= ((&reg33) ?
                  $signed(wire20[(1'h0):(1'h0)]) : $signed(($unsigned(reg33[(5'h12):(4'hf)]) ?
                      reg40[(4'h8):(3'h7)] : reg54[(1'h0):(1'h0)])));
              reg58 <= {($signed(((wire20 & (8'hb2)) | (8'hb3))) != (!$signed({(7'h41),
                      reg47}))),
                  reg31[(2'h2):(1'h0)]};
              reg59 <= $signed(($unsigned({reg57[(4'hb):(1'h1)]}) || {(wire37 ?
                      (-reg31) : (+reg34))}));
              reg60 <= ((&(((wire16 ?
                      wire20 : reg52) & (reg51 <= reg58)) <<< $unsigned((reg51 ?
                      reg24 : (8'ha8))))) ?
                  $signed(reg56[(3'h6):(2'h2)]) : (~|(~$signed($signed(reg24)))));
            end
          else
            begin
              reg57 <= ((8'ha4) ? (8'haa) : reg50[(2'h2):(1'h1)]);
              reg58 <= (wire37 - ((~($unsigned(wire37) ?
                      $signed(wire18) : {wire21})) ?
                  ((~&reg44) ?
                      ((~&reg30) ? (~|(8'hbe)) : (~wire38)) : (((8'hb0) ?
                          wire20 : reg52) * (reg55 >= wire19))) : reg51[(1'h0):(1'h0)]));
              reg59 <= $signed({reg53,
                  ($unsigned((~|reg60)) >>> $signed((^reg48)))});
              reg60 <= wire36;
              reg61 <= ($signed((reg26[(3'h7):(3'h7)] ?
                      (~&(reg59 ? wire42 : reg34)) : wire42[(3'h5):(3'h4)])) ?
                  (reg51[(1'h1):(1'h1)] < $unsigned($signed({reg51}))) : wire18);
            end
          if (((+(8'ha3)) ? $unsigned((~^wire38)) : $signed(wire38)))
            begin
              reg62 <= (^~$signed((((&(8'hab)) != (~&reg30)) ?
                  ({reg43, reg32} == {reg32}) : (^~$signed(reg52)))));
              reg63 <= (~wire20[(4'hd):(3'h5)]);
              reg64 <= wire35[(3'h4):(2'h2)];
              reg65 <= $unsigned(reg64);
              reg66 <= $unsigned(((-$unsigned((wire38 ? wire38 : reg48))) ?
                  $unsigned($unsigned((reg39 > reg41))) : $unsigned(reg56[(1'h1):(1'h1)])));
            end
          else
            begin
              reg62 <= ($unsigned((7'h43)) - ({((reg56 ?
                          reg45 : (8'ha8)) ^ reg62),
                      (wire18[(4'hd):(3'h7)] == $signed(reg45))} ?
                  $signed((8'hb9)) : {((-wire17) || (reg29 >= wire35)),
                      {((8'hac) == (7'h41)), (reg63 >> reg61)}}));
              reg63 <= (7'h44);
            end
        end
      else
        begin
          reg54 <= (!{{(((8'ha6) & (8'hb8)) ?
                      $signed(reg40) : $signed((8'hbc)))},
              $unsigned($signed(wire20))});
          if ((^~reg39))
            begin
              reg55 <= reg59;
              reg56 <= wire21[(3'h6):(3'h5)];
              reg57 <= (~|(+((&(|reg66)) ? $unsigned(reg40) : reg39)));
              reg58 <= ($signed(reg55[(2'h3):(2'h2)]) | ((^~(((8'h9d) ?
                          reg41 : reg26) ?
                      (!reg65) : $unsigned(reg27))) ?
                  (~|($signed(reg33) & {reg63})) : (~|wire22)));
              reg59 <= reg48[(1'h0):(1'h0)];
            end
          else
            begin
              reg55 <= $unsigned(((reg64[(4'hb):(3'h5)] ?
                      reg32 : {(8'hb1), (^~(8'had))}) ?
                  $unsigned(((-reg29) ~^ $unsigned(reg41))) : $signed({$signed(wire23),
                      reg65})));
              reg56 <= wire18[(4'he):(4'h8)];
              reg57 <= $signed({$unsigned((reg48 ?
                      $signed((8'hb1)) : $signed(reg25))),
                  wire38[(5'h10):(3'h4)]});
              reg58 <= wire36;
              reg59 <= (reg27[(4'hb):(2'h2)] ?
                  (^~($unsigned($signed((8'hbc))) ?
                      {reg48} : $signed((8'ha3)))) : ($signed($signed((reg64 ~^ wire35))) ?
                      {$unsigned($unsigned(wire35))} : reg50));
            end
          if ($unsigned({{({reg24, reg49} ? {reg53, wire16} : reg62)},
              {reg65, $unsigned(((8'ha2) ^ wire36))}}))
            begin
              reg60 <= reg51[(1'h0):(1'h0)];
              reg61 <= reg24[(4'hf):(3'h6)];
              reg62 <= reg53;
              reg63 <= reg45[(4'ha):(3'h6)];
            end
          else
            begin
              reg60 <= (reg51[(1'h0):(1'h0)] ?
                  (~&reg47[(3'h5):(3'h5)]) : wire37);
              reg61 <= reg60[(2'h2):(1'h1)];
              reg62 <= reg34[(3'h4):(3'h4)];
              reg63 <= wire19;
            end
        end
      reg67 <= (+((+{$unsigned(reg43), $signed(wire18)}) == (8'hb5)));
    end
  assign wire68 = {wire19,
                      $signed((wire37[(2'h3):(1'h0)] >= (((8'hbf) ?
                          reg51 : reg52) != reg52[(1'h1):(1'h1)])))};
  always
    @(posedge clk) begin
      reg69 <= $unsigned($unsigned($signed(reg24[(3'h4):(2'h3)])));
    end
  assign wire70 = reg64;
  assign wire71 = {(~^(reg43[(4'hb):(2'h2)] ?
                          $unsigned(reg55) : ((^reg41) ?
                              (wire37 > reg57) : $signed(reg43)))),
                      reg27};
  always
    @(posedge clk) begin
      reg72 <= ((reg41[(3'h4):(2'h3)] ?
              ({(reg34 >= reg39), reg59[(1'h1):(1'h1)]} ~^ {$signed(wire70),
                  (reg27 ? reg31 : reg60)}) : reg27[(4'hd):(4'h9)]) ?
          wire70 : (wire70 | {wire22, (8'hb7)}));
      reg73 <= (((($signed(wire37) ? reg26 : wire70) || $unsigned((reg66 ?
              reg55 : (8'ha8)))) * (-((reg32 ?
              reg67 : reg30) <= reg56[(2'h2):(2'h2)]))) ?
          $signed($signed($unsigned(((8'ha5) <= wire36)))) : (+reg29));
      if (($signed(($signed((~^reg43)) * ($signed(wire17) ?
          $unsigned(reg26) : (reg32 ~^ reg55)))) || (^reg69)))
        begin
          reg74 <= (((|$unsigned(reg67[(3'h7):(1'h1)])) || reg39) ?
              (reg63[(5'h12):(2'h3)] >>> (^(~|(wire42 & reg54)))) : reg32);
          reg75 <= $signed({wire71, (~^(8'hae))});
          if ((reg59[(2'h2):(1'h0)] * $signed(reg59[(2'h3):(2'h3)])))
            begin
              reg76 <= reg43[(4'he):(3'h7)];
            end
          else
            begin
              reg76 <= reg52;
              reg77 <= (&({($unsigned(wire19) && (reg50 ? wire70 : (8'hb8))),
                      reg62[(2'h2):(1'h0)]} ?
                  $signed(wire22[(3'h4):(2'h2)]) : wire18));
              reg78 <= $unsigned(reg54);
              reg79 <= $signed(reg34);
              reg80 <= (~&{(reg72[(1'h1):(1'h0)] ?
                      {(+wire20)} : (reg59[(1'h1):(1'h1)] && $unsigned(reg73)))});
            end
          reg81 <= ((~&({((7'h44) ? reg65 : (8'ha7)),
                  $signed(wire19)} < reg77)) ?
              (8'ha7) : {(reg58[(3'h4):(2'h3)] ?
                      {{wire23, reg67}} : $signed((wire21 ? reg43 : wire18)))});
          if (((~|wire16[(4'h8):(4'h8)]) ?
              {(-reg57[(4'hf):(1'h0)]), (~&(~&(reg43 ~^ reg81)))} : reg62))
            begin
              reg82 <= (~^{$signed($unsigned((-reg49)))});
              reg83 <= $unsigned((&reg77));
            end
          else
            begin
              reg82 <= (~(~&$unsigned(reg81[(1'h1):(1'h1)])));
            end
        end
      else
        begin
          if (wire22)
            begin
              reg74 <= wire38;
              reg75 <= {($unsigned((~&(reg47 && reg45))) - ($signed(wire71[(4'h8):(4'h8)]) ?
                      reg81 : ($signed(reg40) ? reg78 : (8'hbd))))};
            end
          else
            begin
              reg74 <= reg39;
              reg75 <= $unsigned(reg29);
              reg76 <= wire23[(4'h8):(3'h5)];
              reg77 <= (reg76 ~^ (~reg50));
            end
        end
    end
  assign wire84 = $unsigned((({(^reg59),
                      wire28} & reg54[(3'h5):(3'h5)]) >> {$unsigned((reg58 ?
                          reg43 : reg56))}));
  always
    @(posedge clk) begin
      reg85 <= reg82;
      reg86 <= (reg48 ? $signed(wire18[(2'h3):(2'h2)]) : reg31);
    end
endmodule

module module136
#(parameter param162 = ((~^((((8'hb8) ? (8'ha7) : (8'haa)) ? (~|(8'hb0)) : ((8'hb7) ? (8'ha3) : (8'hae))) ? (8'h9f) : ((|(8'ha6)) ^ (!(8'ha7))))) << ((+{((8'hb5) ? (8'h9d) : (8'haa))}) & {(((7'h42) ? (8'h9e) : (8'ha6)) <= (~&(8'ha7)))})))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire140;
  input wire [(2'h3):(1'h0)] wire139;
  input wire signed [(4'ha):(1'h0)] wire138;
  input wire signed [(3'h6):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire154;
  wire signed [(2'h2):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire151;
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg149 = (1'h0);
  reg [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  assign y = {wire161,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg141 <= (wire139 - $unsigned(wire140[(1'h0):(1'h0)]));
      reg142 <= wire140;
      reg143 <= wire138;
      if ($unsigned(wire140))
        begin
          reg144 <= (((wire140 ? wire140 : {reg141, reg142[(3'h6):(2'h3)]}) ?
                  $unsigned(((+(8'hb1)) ?
                      reg141[(3'h4):(2'h2)] : (reg142 ?
                          reg143 : wire138))) : $unsigned((~|(wire138 ~^ reg141)))) ?
              (((~{reg143, (8'ha2)}) >>> $unsigned($signed(reg143))) ?
                  $unsigned(wire138) : $signed($unsigned(((8'ha2) ?
                      reg141 : wire139)))) : wire137);
          reg145 <= $signed(reg142[(3'h5):(3'h5)]);
          if (reg141)
            begin
              reg146 <= reg145[(1'h1):(1'h0)];
              reg147 <= ($signed(reg141) ?
                  {($unsigned({wire139}) ?
                          reg146[(2'h3):(1'h1)] : ((reg141 >>> reg146) ?
                              (wire137 ^ (8'hb8)) : ((8'hb9) ?
                                  reg142 : reg141))),
                      (wire137 ?
                          ((~|reg144) * (7'h40)) : ({reg146} ^ $unsigned(wire139)))} : wire140[(3'h5):(1'h0)]);
            end
          else
            begin
              reg146 <= ((+(((reg141 ? reg146 : wire137) - $unsigned((8'h9f))) ?
                      ({(8'hbc)} ?
                          (reg147 ?
                              wire139 : wire137) : $unsigned(reg143)) : reg143)) ?
                  ((~&reg147[(1'h1):(1'h0)]) <= $unsigned((wire138[(3'h5):(2'h2)] ^ $unsigned(reg143)))) : ($signed(reg144[(4'hf):(1'h1)]) ?
                      wire138[(4'h9):(3'h5)] : {((reg144 ?
                              reg141 : (8'ha9)) & (reg147 ? reg147 : reg143)),
                          reg145}));
            end
          reg148 <= $unsigned({reg143[(2'h3):(2'h3)]});
          reg149 <= (reg144[(5'h12):(4'hb)] ?
              (8'haf) : ($unsigned($signed(reg143[(2'h3):(2'h3)])) ?
                  $signed((wire137[(1'h1):(1'h1)] ?
                      (wire137 != reg143) : reg148)) : {$signed($unsigned(wire139))}));
        end
      else
        begin
          reg144 <= $unsigned((~|reg143));
          reg145 <= $signed((~(((8'hb6) ^ $signed(wire137)) ^ reg141[(4'h8):(2'h2)])));
          if (wire137)
            begin
              reg146 <= $unsigned((|((+(-wire137)) ?
                  $unsigned((reg143 & reg149)) : $unsigned(reg145))));
              reg147 <= $signed(reg145[(1'h0):(1'h0)]);
              reg148 <= wire140[(2'h2):(2'h2)];
              reg149 <= (wire139[(1'h1):(1'h1)] >= $signed(($unsigned(((8'hab) * reg144)) == (((8'hb3) < reg146) ~^ $signed(reg143)))));
            end
          else
            begin
              reg146 <= (reg147[(2'h3):(1'h0)] << ($unsigned($unsigned((reg146 ?
                      reg143 : wire139))) ?
                  ({wire137[(3'h5):(3'h5)]} - wire139) : $unsigned($signed(wire138[(4'h8):(3'h6)]))));
              reg147 <= {reg147, wire139[(1'h1):(1'h1)]};
            end
        end
      reg150 <= (~^(8'h9e));
    end
  assign wire151 = (wire140[(2'h2):(2'h2)] ^ $signed(reg147[(2'h3):(2'h3)]));
  assign wire152 = $signed($signed((($unsigned(wire151) ?
                       {reg141,
                           wire151} : $signed(wire139)) != reg147[(1'h0):(1'h0)])));
  assign wire153 = (+((wire139[(1'h0):(1'h0)] ?
                       ($unsigned(reg148) ?
                           wire152[(3'h7):(1'h0)] : $signed(wire140)) : ((wire138 ?
                           reg150 : wire140) >> {reg148})) >> {$signed(reg143)}));
  assign wire154 = (((|$signed((&(8'hba)))) ?
                           ($unsigned(reg141) ?
                               $unsigned(reg147[(2'h2):(1'h1)]) : $signed($signed(wire140))) : $unsigned($unsigned({wire137,
                               reg148}))) ?
                       reg141 : $unsigned(($unsigned((~reg141)) ^~ $signed($unsigned(wire139)))));
  always
    @(posedge clk) begin
      reg155 <= reg147[(2'h3):(1'h1)];
      if ((((^~(((7'h44) ^ wire153) ? reg141 : wire140[(2'h2):(1'h0)])) ?
              ((8'ha1) ?
                  ($unsigned((8'hb4)) && $signed(reg145)) : {((8'ha6) >>> reg149)}) : wire151[(2'h2):(2'h2)]) ?
          {$unsigned(reg149), (reg150 <<< wire138)} : (reg143 ?
              $unsigned(reg150[(3'h4):(2'h3)]) : $unsigned($signed({reg150,
                  reg142})))))
        begin
          reg156 <= $signed((|wire137[(1'h0):(1'h0)]));
          reg157 <= wire151;
          reg158 <= ((^wire152[(3'h6):(2'h2)]) ?
              (($unsigned((7'h44)) ?
                  reg147 : (wire140 ?
                      wire137 : reg156[(3'h7):(3'h5)])) <= reg146[(1'h0):(1'h0)]) : wire137);
          reg159 <= (wire152[(2'h3):(2'h3)] | reg147);
          reg160 <= reg150[(2'h2):(1'h1)];
        end
      else
        begin
          reg156 <= ((~&(($unsigned(reg141) ?
                  $signed(reg149) : reg147[(2'h2):(2'h2)]) ^~ ((wire154 <<< reg159) * (^reg149)))) ?
              $unsigned(({reg147, reg147[(1'h0):(1'h0)]} ?
                  $unsigned(wire152[(3'h6):(3'h5)]) : {$unsigned(reg150)})) : (wire138 ^~ wire151[(1'h1):(1'h1)]));
          if ({($signed(reg159) ?
                  (^(reg157[(2'h2):(1'h0)] ?
                      (reg160 > wire154) : $signed(wire137))) : ((+(reg150 ?
                      reg150 : (8'hba))) && ((reg141 > wire140) << $unsigned(wire151))))})
            begin
              reg157 <= reg143[(4'hb):(4'h9)];
              reg158 <= $signed($signed(reg158));
            end
          else
            begin
              reg157 <= ((wire137 ?
                  $unsigned((+$signed(wire154))) : ($unsigned($signed(wire138)) | $unsigned(reg141))) != reg144[(5'h11):(3'h4)]);
              reg158 <= reg147;
            end
        end
    end
  assign wire161 = reg143;
endmodule
