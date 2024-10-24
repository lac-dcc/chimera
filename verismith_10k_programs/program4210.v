module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire133, wire132, wire130, wire115, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (wire4 ?
                     ((~^$signed((wire2 ? wire2 : (7'h44)))) ?
                         {($unsigned(wire1) <<< $unsigned(wire2))} : ((^wire0) || ((wire2 < wire4) == $signed(wire3)))) : wire3[(3'h7):(2'h3)]);
  assign wire6 = (-(+wire2[(3'h6):(3'h4)]));
  assign wire7 = (wire2 ? {$signed((+{wire0, wire3}))} : wire0[(2'h3):(1'h1)]);
  module8 #() modinst116 (wire115, clk, wire0, wire1, wire4, wire2);
  module117 #() modinst131 (wire130, clk, wire6, wire5, wire4, wire7);
  assign wire132 = $signed(($signed((~^wire6[(3'h4):(1'h0)])) ?
                       (wire130 == wire7) : $unsigned({$signed(wire6),
                           (~wire130)})));
  assign wire133 = $unsigned($unsigned((~&wire4[(5'h10):(1'h0)])));
endmodule

module module117  (y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire121;
  input wire signed [(4'h9):(1'h0)] wire120;
  input wire [(5'h14):(1'h0)] wire119;
  input wire signed [(4'h9):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(5'h14):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire122;
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 (1'h0)};
  assign wire122 = {($signed($unsigned($signed(wire119))) >>> (8'hba))};
  assign wire123 = (wire120 == $unsigned(wire118[(2'h2):(1'h1)]));
  assign wire124 = $unsigned((^({((8'haa) ? wire123 : wire120),
                       {wire119}} | {$unsigned(wire118),
                       ((7'h40) ^~ (8'haa))})));
  assign wire125 = $signed(wire124[(4'hb):(1'h1)]);
  assign wire126 = {(|{$unsigned((wire118 + wire118)), wire124[(4'ha):(1'h1)]}),
                       {($unsigned($unsigned(wire123)) == $unsigned($unsigned((7'h44)))),
                           $unsigned((wire123 ?
                               (wire124 ? wire124 : wire121) : (wire122 ?
                                   wire124 : (8'hbf))))}};
  assign wire127 = $signed($unsigned($signed(((wire119 >> (8'hb4)) >> (wire120 ?
                       wire121 : wire125)))));
  assign wire128 = (wire121[(1'h1):(1'h1)] ?
                       (((wire118[(1'h0):(1'h0)] > $signed(wire122)) && wire125) ?
                           ((~$unsigned(wire122)) ?
                               {(wire126 ?
                                       wire119 : wire124)} : wire121) : $signed(wire118[(4'h9):(2'h2)])) : ($signed(wire124[(3'h5):(2'h2)]) ?
                           (8'h9e) : ($unsigned({(8'ha3)}) ?
                               (wire119 ?
                                   wire123 : (wire124 ?
                                       wire126 : wire123)) : ((-wire126) ?
                                   (wire118 || wire125) : (~&wire123)))));
  assign wire129 = wire125;
endmodule

module module8
#(parameter param113 = (({(8'ha6)} ? (((~(8'hbb)) ~^ (|(8'hae))) ^ (((7'h41) ? (8'hbd) : (8'hbb)) < (8'ha4))) : (-(((8'hb2) ? (8'hb2) : (8'h9e)) >> ((8'h9f) ? (8'haa) : (8'hac))))) ? (~(({(7'h40), (8'hb6)} ? (~|(8'h9f)) : (|(8'had))) > ({(8'hba), (8'hae)} ? (8'ha5) : ((8'hae) == (8'hb9))))) : {{((8'hb8) - {(8'hb3), (8'ha0)})}}), 
parameter param114 = ((8'hb3) ? (!param113) : ({param113, {(param113 ? param113 : (8'hb6))}} ? ({(param113 && param113)} >>> param113) : {param113})))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(4'hc):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire13;
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  assign y = {wire112,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire76,
                 wire75,
                 wire73,
                 wire24,
                 wire13,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg96,
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
                 reg78,
                 reg77,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire13 = $unsigned($unsigned($unsigned((!$signed(wire9)))));
  always
    @(posedge clk) begin
      reg14 <= wire10[(2'h3):(1'h1)];
      if (wire10)
        begin
          if ($signed((~|{(~|wire12[(4'hc):(4'hb)])})))
            begin
              reg15 <= ($signed({$signed($signed((8'hbd))),
                  wire10[(3'h5):(1'h0)]}) < wire9);
              reg16 <= $unsigned(reg15);
              reg17 <= (~(((wire11 ? (~|reg15) : ((7'h40) ? (8'ha2) : wire10)) ?
                      wire12[(2'h3):(1'h1)] : (+$unsigned(wire12))) ?
                  wire11[(3'h5):(2'h3)] : $signed((wire9[(3'h5):(2'h2)] ?
                      (reg16 ? reg15 : wire10) : ((8'haa) == wire12)))));
              reg18 <= ((-$unsigned((~^(wire9 ? wire10 : reg14)))) ?
                  wire11 : wire9);
            end
          else
            begin
              reg15 <= (wire12 ?
                  (~|(+$unsigned($signed(reg17)))) : reg15[(4'h8):(3'h6)]);
              reg16 <= ($unsigned((~|$unsigned(reg14[(4'hf):(4'h8)]))) & $unsigned(reg15[(1'h1):(1'h0)]));
              reg17 <= (|($unsigned(wire13[(2'h2):(1'h0)]) >>> $unsigned(wire9)));
              reg18 <= (|(~&$unsigned(wire9[(4'h8):(3'h7)])));
            end
        end
      else
        begin
          if ($signed(wire11[(4'he):(3'h6)]))
            begin
              reg15 <= (wire13 ^ $unsigned(reg18[(3'h4):(2'h3)]));
              reg16 <= $unsigned($unsigned($unsigned((~(~^reg14)))));
            end
          else
            begin
              reg15 <= {$unsigned($unsigned((+$unsigned(wire13)))), (8'ha4)};
              reg16 <= $unsigned({$signed({((7'h42) ? reg15 : reg15)}),
                  $unsigned($signed((|wire12)))});
              reg17 <= (!(((wire11 ? ((8'h9c) + reg18) : (~&wire10)) ?
                  ((|(8'ha9)) ?
                      wire12 : wire9[(2'h3):(1'h0)]) : ((reg14 >= wire12) >>> ((8'ha3) ?
                      wire10 : reg16))) & ((^~$unsigned(reg18)) | reg14)));
            end
          if ({$unsigned(reg18)})
            begin
              reg18 <= wire9[(3'h4):(2'h3)];
            end
          else
            begin
              reg18 <= $signed(wire10);
              reg19 <= $unsigned((wire9[(3'h4):(3'h4)] ?
                  (~^(|(reg16 ~^ (8'h9e)))) : reg15));
              reg20 <= reg17[(2'h3):(2'h2)];
              reg21 <= ((|(wire12[(4'hd):(4'hc)] >= wire11)) <<< (&$signed($signed($unsigned(wire9)))));
            end
        end
      reg22 <= reg17;
      reg23 <= (-reg21);
    end
  assign wire24 = $signed(($unsigned($signed(wire12[(4'hf):(2'h3)])) >= ((^$signed(wire10)) >>> (wire10[(2'h2):(1'h1)] + {reg19}))));
  module25 #() modinst74 (.wire27(reg21), .clk(clk), .y(wire73), .wire29(wire24), .wire26(reg22), .wire30(wire10), .wire28(reg17));
  assign wire75 = (^(reg18[(3'h5):(1'h0)] ?
                      wire73[(1'h1):(1'h0)] : (-$unsigned({(8'had),
                          (8'ha6)}))));
  assign wire76 = (wire11 * ((((~|reg14) << $unsigned(wire12)) ^~ $signed((wire75 ?
                      wire75 : wire75))) - (-(&reg23))));
  always
    @(posedge clk) begin
      reg77 <= wire76[(2'h2):(2'h2)];
      reg78 <= (reg17 ?
          ($signed(reg23[(1'h0):(1'h0)]) ?
              reg18[(1'h0):(1'h0)] : $unsigned($unsigned($signed(reg21)))) : ((reg22[(3'h7):(3'h5)] ?
                  (|$signed(wire24)) : (reg18[(1'h0):(1'h0)] ?
                      $unsigned(reg23) : reg20)) ?
              $signed(reg16) : {(8'hb3)}));
    end
  assign wire79 = wire24;
  assign wire80 = $signed(reg14);
  assign wire81 = $signed(($unsigned($signed(wire10[(2'h3):(1'h1)])) ?
                      (reg18 ^~ $unsigned(reg78[(1'h0):(1'h0)])) : $signed($unsigned(reg19[(2'h2):(1'h0)]))));
  assign wire82 = ($unsigned((-wire76[(3'h6):(3'h6)])) ?
                      $unsigned(reg22) : (^~(((|reg16) > $signed(wire9)) ^~ {((8'ha6) - wire13)})));
  assign wire83 = $unsigned((|((reg16[(2'h3):(1'h1)] * (wire10 ?
                          wire9 : (8'hbf))) ?
                      $signed($unsigned(reg17)) : (+(wire10 ?
                          reg78 : wire75)))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned((wire10 ?
          wire76[(2'h2):(1'h1)] : (((8'ha6) | $signed((8'hbf))) ?
              (wire79[(2'h3):(1'h0)] ?
                  reg20 : (^~reg21)) : reg18[(4'hb):(4'hb)])));
      if ((~|($signed(reg20) ? reg19[(1'h1):(1'h1)] : $unsigned(wire80))))
        begin
          reg85 <= {{$unsigned({$signed(wire9), $unsigned((8'haa))})}, wire75};
          reg86 <= wire11;
          reg87 <= $signed((!($unsigned($unsigned(reg18)) ?
              ((reg20 <= reg22) && (wire11 ?
                  reg17 : reg15)) : ($signed(wire9) < $unsigned(wire24)))));
          reg88 <= (!wire24);
        end
      else
        begin
          reg85 <= wire76[(4'hc):(4'h8)];
          if ((&((|(reg86 ? (reg18 ? (7'h44) : reg14) : wire80)) ?
              ((~&(wire10 | reg84)) ?
                  $signed(wire73) : (reg86 ?
                      reg22 : reg19[(2'h3):(1'h0)])) : (8'ha3))))
            begin
              reg86 <= $signed($unsigned(wire79));
              reg87 <= reg87;
            end
          else
            begin
              reg86 <= ($unsigned((&((~^reg14) - wire81))) ?
                  (^($signed($signed(wire76)) == (~&$signed(reg21)))) : ($signed((&$unsigned(wire81))) == $unsigned((reg20 ?
                      $signed(reg78) : reg88[(2'h3):(1'h1)]))));
              reg87 <= ($signed($signed($signed(wire10[(1'h0):(1'h0)]))) ?
                  (((!$unsigned(reg21)) ? (~^wire82[(4'h8):(1'h0)]) : {reg19}) ?
                      reg15[(1'h0):(1'h0)] : reg15[(3'h7):(3'h4)]) : wire12);
              reg88 <= (-$unsigned({$signed($signed(reg86))}));
              reg89 <= (wire11[(4'hf):(4'he)] ?
                  wire76[(3'h4):(2'h2)] : (^wire12[(4'hc):(3'h5)]));
            end
          reg90 <= $signed(wire80[(1'h1):(1'h1)]);
          reg91 <= ((!{reg18,
              ((wire11 ~^ (8'h9e)) > $unsigned(wire76))}) < (8'haa));
          if (((((wire11 && (reg18 >> wire80)) < $unsigned($signed(reg88))) ?
              $signed($signed((~reg14))) : (^($signed(reg88) < reg90[(3'h5):(3'h5)]))) >>> reg17))
            begin
              reg92 <= (!$unsigned((reg23[(4'h8):(2'h3)] ?
                  $unsigned((8'ha4)) : {(wire76 + reg18),
                      (wire73 <= wire83)})));
            end
          else
            begin
              reg92 <= (-$unsigned($unsigned({$unsigned(wire79)})));
              reg93 <= (^~wire76[(4'hc):(4'h8)]);
            end
        end
      reg94 <= $signed(wire82[(1'h0):(1'h0)]);
    end
  assign wire95 = reg89[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg96 <= $signed(wire81[(2'h2):(2'h2)]);
    end
  assign wire97 = wire75[(3'h6):(3'h5)];
  assign wire98 = (+(&$signed((~&(wire83 && wire97)))));
  assign wire99 = reg88[(3'h6):(1'h1)];
  assign wire100 = $unsigned(wire83);
  assign wire101 = (|(wire24[(1'h1):(1'h1)] && reg96));
  assign wire102 = wire83;
  always
    @(posedge clk) begin
      if (($signed($signed(({reg20} >>> $unsigned(reg14)))) <<< (wire82 <= {{wire102[(4'hb):(3'h5)],
              reg23},
          (wire97[(1'h0):(1'h0)] ? $unsigned(reg15) : $unsigned(reg93))})))
        begin
          reg103 <= {$signed(($signed((~^(8'hbd))) == $unsigned((wire80 && wire98))))};
          if ($signed($unsigned(reg92)))
            begin
              reg104 <= wire80;
              reg105 <= (~(-($unsigned({(8'ha1)}) < ($signed((8'ha2)) ?
                  reg14[(4'hb):(3'h7)] : $unsigned(reg15)))));
              reg106 <= $signed(reg87);
            end
          else
            begin
              reg104 <= (((({reg87, wire24} ? (wire79 < wire76) : wire82) ?
                      (~&((7'h41) + reg20)) : ((wire9 ?
                          (7'h44) : reg89) == reg14[(5'h14):(5'h10)])) ?
                  reg92 : (($unsigned(wire98) ?
                      $signed(wire82) : (wire101 << (8'ha3))) * wire99)) <<< reg94[(4'h9):(3'h7)]);
              reg105 <= (!reg103);
              reg106 <= $signed(reg87[(2'h3):(1'h0)]);
              reg107 <= wire12;
              reg108 <= ((reg20[(3'h4):(2'h3)] ?
                  $unsigned((|(reg89 ?
                      reg103 : reg104))) : wire102[(3'h6):(2'h2)]) != (!$signed(reg92[(3'h5):(2'h2)])));
            end
          reg109 <= (^~(!{((8'ha9) && $signed(wire73)),
              $signed(reg15[(3'h4):(1'h1)])}));
          reg110 <= wire24[(3'h5):(3'h4)];
          reg111 <= (reg22[(5'h12):(4'h8)] || {($unsigned(wire12[(4'hd):(4'hc)]) >= wire97),
              ({(+reg14), (wire12 ? wire102 : reg87)} ?
                  $unsigned($unsigned(wire100)) : (reg78[(3'h5):(2'h2)] || (reg23 ?
                      (8'hbe) : (7'h44))))});
        end
      else
        begin
          reg103 <= (((wire102 ?
                      (~^{reg18, (8'hbe)}) : (reg77[(1'h1):(1'h0)] ?
                          reg92[(3'h5):(2'h3)] : $signed(wire24))) ?
                  wire97 : reg106[(1'h1):(1'h1)]) ?
              wire80 : {(reg91 ? (|(wire81 >>> wire81)) : reg77[(4'hb):(4'ha)]),
                  (reg14 ? wire83 : $signed({reg16}))});
          if (((&({$signed(reg92), $signed(reg107)} <= reg88)) ?
              {$signed(wire98[(1'h0):(1'h0)]),
                  (reg109 ^~ (!$signed(reg22)))} : $signed(reg92)))
            begin
              reg104 <= $unsigned(wire75[(4'h9):(3'h7)]);
              reg105 <= (!reg20);
            end
          else
            begin
              reg104 <= (wire13 ?
                  wire100 : ($unsigned((~|{(8'hb8), reg16})) ?
                      {(^(8'h9c))} : (8'h9e)));
              reg105 <= (!$signed(reg105));
              reg106 <= reg94;
              reg107 <= ((|(~|$unsigned((^~wire24)))) ?
                  wire98[(4'h8):(1'h1)] : wire24[(2'h2):(1'h0)]);
              reg108 <= $signed(reg20);
            end
          reg109 <= wire80[(2'h3):(1'h1)];
        end
    end
  assign wire112 = $unsigned({reg90[(3'h4):(2'h3)],
                       ((-((8'haf) >= wire9)) ^~ $signed((!wire81)))});
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire [(3'h7):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire31 = ($unsigned(wire30[(1'h1):(1'h0)]) <= {(wire27[(3'h5):(3'h4)] < wire28),
                      wire28});
  assign wire32 = ({$unsigned((~(wire28 ? wire26 : wire29))),
                          (wire29[(3'h4):(2'h3)] + (^~{wire31}))} ?
                      ($signed(wire29) ?
                          ((^(wire31 && wire26)) >= (wire28 ?
                              $signed(wire26) : (8'hb1))) : (8'h9f)) : wire29[(2'h2):(1'h1)]);
  assign wire33 = wire29;
  assign wire34 = wire32;
  assign wire35 = wire34;
  assign wire36 = $signed($unsigned($signed($unsigned(wire30))));
  assign wire37 = {$signed((&(wire36 ? wire31 : wire34))), wire32};
  assign wire38 = $signed((+((wire29[(3'h5):(2'h2)] || {wire29}) ?
                      wire27 : ($unsigned(wire33) > (wire34 >> (8'hbe))))));
  always
    @(posedge clk) begin
      reg39 <= {(&(|((wire34 ? wire37 : wire26) ?
              $unsigned(wire29) : {wire35, wire26})))};
      if (wire31)
        begin
          reg40 <= (wire33 ?
              $unsigned({(-wire26[(3'h7):(3'h4)])}) : (~$unsigned(wire31)));
          if ((~$signed((|((^~(8'ha6)) ?
              wire36 : (wire27 ? wire33 : wire37))))))
            begin
              reg41 <= (wire36 - $signed((~wire31)));
              reg42 <= (({$signed((wire33 ? wire38 : wire34))} ?
                  reg40 : wire37[(1'h0):(1'h0)]) * wire27[(2'h2):(1'h1)]);
              reg43 <= $signed($unsigned({(wire33[(2'h3):(2'h3)] || (wire26 ?
                      reg42 : wire30))}));
            end
          else
            begin
              reg41 <= {$signed(((-(&wire38)) ?
                      wire29 : (reg42[(3'h4):(3'h4)] ?
                          {wire33} : (wire34 ? reg40 : wire28)))),
                  $signed((8'ha5))};
              reg42 <= $unsigned(reg40[(5'h13):(3'h4)]);
              reg43 <= (8'hb2);
              reg44 <= ($unsigned($signed(wire31[(2'h2):(2'h2)])) ?
                  (~&$signed($signed({wire31}))) : {$unsigned($signed((~&wire35))),
                      wire28});
            end
          reg45 <= wire30;
          reg46 <= {(&$signed($unsigned({wire35, wire38})))};
        end
      else
        begin
          reg40 <= reg43[(2'h2):(2'h2)];
          reg41 <= {(8'ha8)};
          reg42 <= ((($unsigned($signed(wire31)) <= ({reg44} ?
                  $unsigned(reg40) : (wire30 >> wire34))) | wire31[(1'h0):(1'h0)]) ?
              (wire36 || ((^wire33[(2'h3):(1'h0)]) ?
                  $unsigned((wire35 << reg45)) : $signed(wire26[(3'h6):(1'h1)]))) : wire36[(4'ha):(3'h5)]);
          reg43 <= $signed(wire36[(3'h7):(2'h3)]);
        end
      reg47 <= (8'ha4);
      reg48 <= (~^($unsigned(wire27[(2'h2):(1'h1)]) ?
          (7'h41) : $signed({wire28[(4'h9):(3'h6)], (wire28 < (8'haf))})));
      reg49 <= (8'hb5);
    end
  assign wire50 = $signed({({wire29, (reg46 ? (8'ha9) : (8'hab))} ?
                          wire33[(2'h2):(1'h0)] : ($signed(wire35) ?
                              $unsigned(reg49) : reg47)),
                      wire31});
  assign wire51 = $unsigned(wire27);
  assign wire52 = (wire38 ?
                      (|$signed(((reg40 ? wire32 : wire50) ?
                          (~^(8'hb6)) : (~&reg45)))) : {wire36,
                          $unsigned((^wire30[(1'h0):(1'h0)]))});
  assign wire53 = $signed(reg39[(5'h13):(5'h12)]);
  assign wire54 = reg46[(2'h3):(1'h1)];
  assign wire55 = $signed(wire33);
  assign wire56 = ((~&($unsigned(((8'ha4) != reg39)) ^ $signed(reg41))) & (&(($unsigned(wire28) ?
                          ((8'hbe) * (8'ha0)) : $signed(wire50)) ?
                      ($signed(wire37) ?
                          ((8'hb2) ? reg42 : wire51) : {wire55}) : ((!reg39) ?
                          reg41 : wire35[(4'he):(2'h3)]))));
  assign wire57 = ((wire35 ?
                      $unsigned({(^wire28)}) : (wire50 <<< (wire34 < $unsigned(reg48)))) | ($signed((-(wire34 ?
                      wire53 : wire34))) * {{reg41[(1'h0):(1'h0)]},
                      {(wire26 ? (8'h9f) : reg39), (|wire27)}}));
  assign wire58 = wire35[(4'ha):(3'h7)];
  assign wire59 = (~&($unsigned((~&wire52)) ?
                      (|$signed($signed(wire30))) : $signed($signed(wire52))));
  always
    @(posedge clk) begin
      if (wire59[(4'hb):(3'h6)])
        begin
          reg60 <= $signed(wire33);
          reg61 <= ((((wire33 < $unsigned(reg42)) ?
              $unsigned(reg46[(2'h3):(1'h1)]) : wire34[(3'h7):(2'h2)]) || reg43[(1'h1):(1'h1)]) | reg41[(1'h1):(1'h0)]);
          if (reg41)
            begin
              reg62 <= wire36[(2'h3):(1'h1)];
              reg63 <= wire51;
              reg64 <= (8'hb6);
              reg65 <= ((wire34 - {{wire29}}) ?
                  wire33 : ((reg47[(3'h6):(3'h4)] >>> ({reg43} * (wire29 > wire27))) ^ {reg43[(3'h4):(1'h1)],
                      (wire54[(1'h0):(1'h0)] ?
                          wire29[(2'h2):(1'h0)] : $signed(wire33))}));
            end
          else
            begin
              reg62 <= wire35;
              reg63 <= {$unsigned(reg39[(3'h7):(1'h0)])};
              reg64 <= (~|{({(&reg39)} ^~ wire58),
                  $unsigned(($unsigned(reg47) ?
                      $signed(wire57) : wire51[(3'h6):(3'h4)]))});
              reg65 <= ({{(-wire30[(1'h0):(1'h0)])}, wire34[(3'h4):(1'h1)]} ?
                  reg43 : $signed($unsigned({{wire38, reg49}, (~^reg41)})));
            end
          if ((($signed(((wire27 ? wire32 : reg48) ?
                  (wire53 <= wire29) : $unsigned(wire29))) - (8'h9d)) ?
              reg46[(2'h3):(1'h0)] : $signed({{(wire36 ^~ wire50),
                      (wire36 << wire30)}})))
            begin
              reg66 <= (reg44[(2'h2):(1'h0)] | reg46);
              reg67 <= (&wire36[(4'ha):(3'h7)]);
            end
          else
            begin
              reg66 <= ((8'h9c) ?
                  (8'hb6) : ((&reg43[(1'h1):(1'h1)]) + (|wire34)));
              reg67 <= ((~(reg43 <<< (8'hae))) | reg63);
            end
          reg68 <= wire58[(1'h1):(1'h1)];
        end
      else
        begin
          reg60 <= wire59[(3'h6):(3'h5)];
          if ($unsigned($signed(((!{reg68, wire59}) - reg39))))
            begin
              reg61 <= (!{{$unsigned(wire55[(2'h3):(1'h0)])},
                  ($unsigned(reg41[(4'h9):(4'h8)]) << wire50[(3'h7):(3'h7)])});
              reg62 <= (($unsigned($unsigned(reg40)) ?
                  (wire33 >> (~|$unsigned(wire30))) : reg61[(4'hc):(4'ha)]) ^~ $unsigned((reg48[(2'h3):(1'h1)] | ($signed(wire50) ?
                  (reg40 ? (8'had) : reg60) : $unsigned((8'ha1))))));
              reg63 <= $unsigned((~&(+{(reg48 + wire30)})));
            end
          else
            begin
              reg61 <= reg61;
              reg62 <= {(~&(^~reg46[(2'h2):(1'h0)])),
                  (reg68[(4'h8):(3'h4)] ? (|(|(~reg68))) : $unsigned(reg44))};
              reg63 <= ((~&$signed(reg46[(3'h4):(2'h3)])) ?
                  $signed((($signed((8'h9d)) == (reg40 ? (8'h9f) : reg66)) ?
                      reg63[(3'h5):(3'h5)] : (+(reg64 ?
                          wire37 : reg44)))) : $signed($unsigned(wire57)));
              reg64 <= wire28;
              reg65 <= reg66;
            end
        end
      if (((8'hb8) + {(^$signed($signed(wire53))), {wire55[(4'he):(4'h8)]}}))
        begin
          reg69 <= reg47;
          reg70 <= ($signed($unsigned((^~(~&wire26)))) ?
              $signed(wire29[(1'h1):(1'h1)]) : {$signed((+$unsigned(reg49))),
                  ($unsigned((reg64 > wire54)) + ((reg39 | wire35) << wire35))});
          reg71 <= $signed($signed(((reg49 << $unsigned(reg62)) ?
              ($signed(wire28) * (reg39 <<< reg62)) : {reg44})));
          reg72 <= wire57;
        end
      else
        begin
          reg69 <= $unsigned($unsigned((8'ha2)));
        end
    end
endmodule
