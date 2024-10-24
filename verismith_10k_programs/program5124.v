module top
#(parameter param139 = ((((((8'hb3) | (8'had)) & ((8'hb5) <<< (8'had))) ^ (^((8'hae) ? (8'ha8) : (8'ha5)))) ~^ (8'ha5)) < {((((8'ha7) ? (8'hb3) : (8'ha1)) ? ((8'ha2) >= (8'hb5)) : (^~(8'hb9))) ? {((8'hbe) ? (8'ha9) : (8'hba))} : ((^~(8'ha3)) ? (~^(7'h40)) : ((8'ha2) ? (8'hb1) : (8'haf))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire132;
  wire signed [(4'hd):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire129;
  wire signed [(4'hb):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire122;
  wire signed [(3'h6):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire33;
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  assign y = {wire137,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire33,
                 reg136,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg131,
                 (1'h0)};
  module4 #() modinst34 (wire33, clk, wire0, wire3, wire1, wire2, (7'h43));
  module35 #() modinst118 (.wire37(wire1), .clk(clk), .y(wire117), .wire39(wire2), .wire36(wire0), .wire38(wire33));
  assign wire119 = (($unsigned({$unsigned(wire33)}) ?
                       wire1 : ($signed({wire33}) >> $signed($unsigned(wire0)))) ~^ wire117[(3'h7):(1'h1)]);
  assign wire120 = wire33;
  assign wire121 = $signed($unsigned($unsigned($signed((wire1 <= wire120)))));
  assign wire122 = $signed($unsigned(wire1[(4'h8):(3'h7)]));
  always
    @(posedge clk) begin
      reg123 <= wire120[(1'h0):(1'h0)];
      reg124 <= (+(^~wire33));
      reg125 <= (wire0 & $signed($signed(wire33)));
      reg126 <= (^(((8'ha6) >= {((8'ha7) ?
              wire1 : wire3)}) > ((((8'hb0) & (7'h41)) <<< reg125[(1'h0):(1'h0)]) || wire33)));
    end
  assign wire127 = {(|(8'hbb))};
  assign wire128 = $unsigned((wire0 ?
                       wire119 : $unsigned(wire121[(3'h5):(1'h0)])));
  assign wire129 = $signed(($unsigned(wire0[(4'hc):(2'h2)]) ?
                       {$signed({(8'ha5)}),
                           ($unsigned(wire3) ?
                               ((8'hb2) || wire117) : (wire117 > reg123))} : wire0));
  assign wire130 = ($signed({$signed(wire3[(3'h6):(3'h5)]),
                       $signed(((8'ha8) ?
                           wire122 : wire121))}) <<< wire127[(4'he):(4'h8)]);
  always
    @(posedge clk) begin
      reg131 <= $unsigned((7'h41));
    end
  assign wire132 = reg123;
  assign wire133 = {$unsigned((&wire2))};
  module4 #() modinst135 (.clk(clk), .wire8(wire132), .wire6(wire2), .wire7(reg125), .y(wire134), .wire9(reg126), .wire5(reg131));
  always
    @(posedge clk) begin
      reg136 <= ((((~&(8'haf)) <<< (7'h43)) && reg123) ?
          (($unsigned((!wire130)) == {(wire33 ?
                  (8'hb5) : wire130)}) ~^ wire122) : ({wire133,
                  wire129[(3'h6):(2'h3)]} ?
              (8'hac) : ((!$signed(reg125)) <= (wire0[(4'h9):(2'h3)] ?
                  $signed(wire0) : (wire1 > wire134)))));
    end
  module56 #() modinst138 (.clk(clk), .y(wire137), .wire60(wire130), .wire57(reg131), .wire59(reg126), .wire58(wire120));
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire [(5'h14):(1'h0)] wire37;
  input wire [(5'h15):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  assign y = {wire116,
                 wire114,
                 wire92,
                 wire90,
                 wire55,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire41,
                 wire40,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 (1'h0)};
  assign wire40 = ((~&(wire36[(4'ha):(2'h3)] >= (wire39 ?
                          $signed((8'hb6)) : ((8'hb6) ? wire37 : wire36)))) ?
                      $unsigned(wire37[(4'ha):(3'h7)]) : $signed($unsigned(($signed(wire39) ?
                          {wire38, (7'h44)} : wire37[(1'h1):(1'h1)]))));
  assign wire41 = ($signed(wire37) ?
                      ($unsigned(wire37[(4'h9):(3'h6)]) ?
                          ($signed($signed(wire37)) ?
                              wire37 : $signed((wire40 ~^ wire36))) : wire38[(5'h13):(5'h10)]) : (wire39[(1'h0):(1'h0)] ?
                          wire39 : (-((wire40 ?
                              (8'h9d) : wire40) + $unsigned((8'ha2))))));
  always
    @(posedge clk) begin
      reg42 <= {({(~&(wire37 ? wire36 : wire40))} ?
              ((-{wire38}) ?
                  {(wire37 ^~ wire36),
                      {wire40,
                          wire37}} : $signed(wire40[(4'h8):(2'h3)])) : (((wire41 < wire38) ?
                      $unsigned(wire39) : (~wire40)) ?
                  ($unsigned(wire41) ?
                      $unsigned(wire37) : $unsigned(wire40)) : wire37))};
      reg43 <= $unsigned(((7'h43) ?
          ({(wire38 ?
                  wire37 : reg42)} < ((~|wire40) & wire36[(4'hc):(4'hc)])) : wire39[(3'h6):(1'h1)]));
      reg44 <= wire36[(4'ha):(1'h1)];
      reg45 <= wire36;
      reg46 <= (reg45[(3'h4):(2'h2)] ?
          $signed($unsigned($unsigned($unsigned(reg45)))) : reg43[(1'h0):(1'h0)]);
    end
  assign wire47 = $signed((wire41 ?
                      ((reg43[(1'h0):(1'h0)] >> reg42) > (|reg43[(1'h0):(1'h0)])) : {(8'hbf)}));
  assign wire48 = (8'hb2);
  assign wire49 = (wire38 < wire47);
  assign wire50 = ((reg44[(1'h0):(1'h0)] ?
                          ((~&(reg44 ? wire49 : wire41)) ?
                              $unsigned(reg43[(2'h2):(1'h1)]) : $unsigned(wire49)) : ($unsigned($unsigned(reg44)) ?
                              (reg44 ?
                                  $signed(wire40) : ((8'ha8) >> wire49)) : ({wire36,
                                      (7'h41)} ?
                                  (~(8'hb6)) : (wire36 >= wire41)))) ?
                      wire40[(3'h4):(2'h2)] : wire47[(4'h8):(3'h6)]);
  always
    @(posedge clk) begin
      reg51 <= $signed((8'had));
      reg52 <= $unsigned($unsigned((wire41[(4'hd):(1'h0)] ?
          $unsigned(reg43) : (wire50 ? $signed(reg43) : $signed(wire40)))));
      reg53 <= ($signed($signed(wire47[(4'h8):(2'h2)])) ?
          wire38 : wire49[(1'h1):(1'h0)]);
      reg54 <= (~^(~|(wire36[(4'h8):(3'h5)] ^~ $signed((reg43 <= wire36)))));
    end
  assign wire55 = ({$signed((~^$unsigned(wire41)))} < wire50);
  module56 #() modinst91 (wire90, clk, reg44, reg45, wire50, wire55);
  assign wire92 = $unsigned((8'hb9));
  module93 #() modinst115 (wire114, clk, wire37, reg42, wire36, wire38, wire41);
  assign wire116 = ($signed($unsigned($signed((~wire50)))) ^~ {$signed(wire92[(3'h5):(1'h1)])});
endmodule

module module4
#(parameter param32 = (+({({(7'h41)} ? {(7'h40)} : ((8'ha2) ? (8'hb4) : (8'ha4)))} ? ({{(8'h9e), (8'ha8)}} ? (|((8'hb6) == (8'ha1))) : (((8'hab) ? (8'h9f) : (8'hb2)) - (~|(8'hb5)))) : (^((~^(8'h9e)) ? {(8'h9f)} : ((8'ha6) <<< (8'h9d)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire5;
  input wire [(5'h13):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire26;
  assign y = {wire31, wire30, wire29, wire28, wire26, (1'h0)};
  module10 #() modinst27 (.wire14(wire8), .wire12(wire7), .wire13(wire5), .wire15(wire6), .y(wire26), .wire11(wire9), .clk(clk));
  assign wire28 = $unsigned($signed(($unsigned({wire7}) >>> wire7)));
  assign wire29 = wire8;
  assign wire30 = wire28[(3'h4):(3'h4)];
  assign wire31 = wire29;
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 (1'h0)};
  assign wire16 = (((~&((8'hb2) ?
                          $signed(wire15) : wire14)) ^ (wire15[(4'hd):(1'h0)] | wire13[(3'h5):(3'h4)])) ?
                      {wire14[(1'h0):(1'h0)]} : wire14);
  assign wire17 = $signed((&{(+wire14)}));
  assign wire18 = $signed((wire13[(4'h8):(1'h1)] ?
                      (((wire12 != wire17) || ((7'h44) ? wire14 : wire15)) ?
                          $signed($unsigned(wire14)) : ((wire12 > (8'hb4)) <<< (wire16 <= wire12))) : $unsigned($signed((wire12 ?
                          wire11 : wire15)))));
  assign wire19 = (^~wire18[(4'hb):(3'h6)]);
  assign wire20 = $signed($signed((!wire16)));
  assign wire21 = wire12;
  assign wire22 = (($unsigned((wire13 << $unsigned(wire21))) != {((^~(8'hbf)) ?
                          $unsigned(wire19) : $signed(wire15)),
                      ($unsigned((8'had)) ?
                          wire19 : $unsigned(wire12))}) ^~ $signed((+$signed((wire11 ?
                      wire18 : wire15)))));
  assign wire23 = $signed((wire16 != wire15[(3'h7):(3'h4)]));
  assign wire24 = $signed($signed({($unsigned(wire21) ?
                          (8'hbc) : $unsigned(wire14))}));
  assign wire25 = {((8'hb1) <<< $unsigned((wire17 & (wire18 * wire13))))};
endmodule

module module93
#(parameter param112 = ((((~|{(8'hbb)}) ? (((8'hbb) - (7'h42)) == {(8'h9c), (8'hbe)}) : ((~|(8'h9f)) ? ((8'ha6) > (8'hb5)) : (~&(8'hbe)))) == ((-((8'hac) ? (8'h9c) : (8'hbc))) ? (^(^~(8'hb2))) : ({(8'hba)} ? ((8'hb5) - (7'h44)) : {(8'ha0), (8'h9c)}))) <<< {(((8'h9c) > ((7'h44) > (8'hb1))) && (+((8'h9d) >> (8'had))))}), 
parameter param113 = (-((({(8'hb8)} ? (+param112) : (param112 ^~ param112)) ? param112 : (~|param112)) << (!param112))))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire98;
  input wire [(5'h12):(1'h0)] wire97;
  input wire signed [(3'h6):(1'h0)] wire96;
  input wire [(5'h11):(1'h0)] wire95;
  input wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire104;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire99;
  assign y = {wire111,
                 wire110,
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
                 (1'h0)};
  assign wire99 = $signed($signed(((!$unsigned((8'h9f))) ^~ $signed(wire94[(3'h5):(1'h0)]))));
  assign wire100 = $unsigned(wire96[(2'h2):(1'h0)]);
  assign wire101 = {$unsigned((((wire95 ? wire97 : wire100) == (^wire94)) ?
                           $signed($unsigned(wire94)) : $unsigned((&wire99)))),
                       wire98[(4'hb):(3'h5)]};
  assign wire102 = wire101;
  assign wire103 = (|(+$signed(wire101[(4'he):(2'h2)])));
  assign wire104 = wire95;
  assign wire105 = $unsigned($unsigned(($signed({wire97}) & wire98[(2'h3):(2'h2)])));
  assign wire106 = $signed((8'hb6));
  assign wire107 = $unsigned(($signed($unsigned(wire95[(4'hd):(4'hc)])) == (wire100 ?
                       $signed($unsigned(wire98)) : (^$unsigned((8'ha5))))));
  assign wire108 = ($signed($signed(((8'ha2) ?
                           wire102[(1'h1):(1'h0)] : wire107))) ?
                       (wire107 >= $unsigned((&(wire100 ?
                           wire100 : wire101)))) : wire95[(4'hd):(2'h2)]);
  assign wire109 = $signed(wire108);
  assign wire110 = $unsigned(wire101);
  assign wire111 = $signed({$unsigned((&wire96[(2'h2):(2'h2)]))});
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire60;
  input wire [(2'h2):(1'h0)] wire59;
  input wire signed [(4'hb):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire78,
                 wire77,
                 reg81,
                 reg80,
                 reg79,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= ($unsigned(wire57) ?
          ($signed($signed((8'h9d))) ?
              $signed((&$signed(wire60))) : (~|$unsigned(wire57[(3'h5):(2'h2)]))) : (&(!{wire60})));
      reg62 <= $signed($signed((({wire58, reg61} - (8'haf)) ?
          ((wire58 >= wire57) ?
              (!wire57) : (wire58 ? wire59 : wire57)) : (^$signed(wire57)))));
      reg63 <= ((~|(^($unsigned(wire60) || wire60[(2'h2):(1'h1)]))) == wire57[(2'h3):(2'h3)]);
      if (reg61)
        begin
          reg64 <= (!$signed(wire60[(2'h2):(1'h1)]));
          reg65 <= ((~$signed((wire59[(2'h2):(1'h1)] == ((8'h9e) ?
                  reg61 : reg61)))) ?
              reg64[(2'h3):(2'h2)] : wire60);
          reg66 <= (wire59[(1'h0):(1'h0)] <<< {$signed({wire60}), reg62});
          reg67 <= (($signed(reg62) > (|reg65[(1'h1):(1'h0)])) ^ wire57[(3'h4):(1'h1)]);
          reg68 <= (^~{reg65[(2'h2):(1'h1)]});
        end
      else
        begin
          reg64 <= reg62[(3'h4):(1'h1)];
        end
      if (($unsigned({((reg65 >= reg65) ? {(8'h9d)} : reg63[(1'h1):(1'h0)])}) ?
          ($signed($unsigned((reg64 ? (7'h40) : reg68))) ?
              {$unsigned((reg67 ^ reg67)),
                  (~^(reg63 - (8'ha8)))} : $unsigned((reg67 ?
                  reg65 : wire59[(2'h2):(1'h0)]))) : $signed((((reg61 ?
                  wire57 : reg67) != reg62[(4'ha):(3'h7)]) ?
              wire58 : (~&$signed(reg62))))))
        begin
          reg69 <= {{reg62[(4'h8):(3'h6)]},
              $unsigned($signed($unsigned({wire57})))};
          if ($signed({{reg69[(3'h4):(3'h4)]}}))
            begin
              reg70 <= $signed({({$unsigned(wire58)} ?
                      ((8'ha4) + reg62[(4'ha):(3'h4)]) : $unsigned((wire60 ?
                          reg62 : wire59))),
                  reg63});
              reg71 <= {(8'ha1),
                  ({(~&{(8'h9c)})} ?
                      $unsigned($unsigned($unsigned(reg64))) : {reg66[(4'hb):(3'h6)],
                          $signed(wire57)})};
              reg72 <= (8'hb2);
            end
          else
            begin
              reg70 <= {((reg71 <= $signed(reg69[(2'h3):(2'h3)])) <<< ((~((8'ha7) ~^ reg61)) || ($unsigned(reg62) <= $signed(reg67)))),
                  (!(~^reg71[(2'h2):(2'h2)]))};
              reg71 <= $unsigned(((8'ha9) ?
                  $signed((reg67 <<< reg67)) : reg61[(4'he):(3'h5)]));
              reg72 <= $signed((~|(^(~&$signed(reg71)))));
            end
          reg73 <= (reg68[(3'h4):(1'h1)] + (~^reg69[(3'h5):(3'h5)]));
          reg74 <= {(($signed(reg72) ? reg71 : {$signed(wire58)}) ?
                  $signed((^~$signed((8'ha0)))) : (reg69 >>> (reg64 ?
                      (!reg69) : $unsigned(reg63))))};
        end
      else
        begin
          if ({(reg73[(2'h2):(2'h2)] <= (~$unsigned((reg63 ? reg62 : reg62))))})
            begin
              reg69 <= reg64[(3'h4):(2'h2)];
              reg70 <= ((^~reg64) >>> $signed((reg72[(4'h8):(4'h8)] - $signed($unsigned(reg62)))));
              reg71 <= (|reg63[(1'h0):(1'h0)]);
              reg72 <= reg64[(2'h2):(2'h2)];
              reg73 <= (|reg67);
            end
          else
            begin
              reg69 <= $unsigned($signed((~&$unsigned((|reg61)))));
              reg70 <= (!$signed(wire60));
              reg71 <= reg67;
              reg72 <= wire60;
            end
          reg74 <= ((&{(~^(reg67 ? wire58 : wire58))}) ?
              {wire58} : $signed({((8'hb0) ? (reg61 == wire57) : {reg61}),
                  $unsigned($signed(reg66))}));
          reg75 <= $unsigned({reg67[(2'h3):(1'h1)]});
          reg76 <= (reg68 ^ ((&(~|reg69[(3'h5):(1'h0)])) | $unsigned($unsigned((wire58 > reg71)))));
        end
    end
  assign wire77 = (wire60[(1'h1):(1'h1)] < reg72[(1'h0):(1'h0)]);
  assign wire78 = $unsigned(reg68[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg79 <= $unsigned(reg62[(2'h2):(2'h2)]);
      reg80 <= (&(-$unsigned(reg64)));
    end
  always
    @(posedge clk) begin
      reg81 <= wire58;
    end
  assign wire82 = {wire60[(1'h0):(1'h0)],
                      (($unsigned((reg72 ? reg76 : reg80)) ?
                          (~(wire58 ? wire57 : reg63)) : ((~&reg63) ?
                              (reg71 ~^ (8'hba)) : reg79[(2'h2):(2'h2)])) < {reg76[(3'h7):(3'h6)]})};
  assign wire83 = ((~|{(8'hb4), (8'hb9)}) > reg61[(4'he):(3'h6)]);
  assign wire84 = reg63[(2'h2):(2'h2)];
  assign wire85 = (reg63 ?
                      (|(wire82[(2'h3):(2'h3)] ?
                          reg70[(1'h1):(1'h0)] : (^(wire83 ?
                              reg80 : reg81)))) : $signed(wire83));
  assign wire86 = reg66[(1'h0):(1'h0)];
  assign wire87 = $signed({($unsigned(wire82[(1'h0):(1'h0)]) ?
                          $unsigned({reg69, reg61}) : $unsigned((!reg67)))});
  assign wire88 = $unsigned(($unsigned((|wire83[(1'h1):(1'h1)])) >> $signed(((reg76 & wire58) ^ (8'hb6)))));
  assign wire89 = {$signed($unsigned((~&{wire57})))};
endmodule
