module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire126;
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire25,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire126,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire4 = (wire2[(2'h3):(1'h0)] ?
                     $signed((-(-(wire3 >>> wire1)))) : {((~&(wire0 ?
                                 (8'hba) : wire3)) ?
                             $signed(wire3) : $unsigned($unsigned((8'ha5))))});
  assign wire5 = wire0[(3'h4):(2'h2)];
  assign wire6 = $signed($signed(($unsigned((wire0 > wire4)) ?
                     wire0 : {$unsigned(wire1)})));
  assign wire7 = wire5;
  assign wire8 = (~|(!{wire6[(2'h2):(1'h0)], wire6}));
  assign wire9 = wire0;
  module10 #() modinst26 (wire25, clk, wire5, wire1, wire6, wire7);
  assign wire27 = (^$signed({((~|wire25) ?
                          $unsigned(wire0) : wire9[(4'h8):(3'h4)])}));
  assign wire28 = ((~&$unsigned($signed($signed(wire9)))) >= $signed(wire0[(2'h3):(2'h2)]));
  assign wire29 = ((8'hb2) ?
                      $unsigned((!$unsigned($signed(wire9)))) : wire28[(1'h1):(1'h1)]);
  assign wire30 = $unsigned((wire5[(1'h0):(1'h0)] ?
                      wire8[(2'h2):(1'h1)] : (!{$unsigned(wire25), wire29})));
  assign wire31 = $unsigned((|wire1));
  assign wire32 = (~wire30[(2'h3):(2'h2)]);
  assign wire33 = ($signed($signed(wire9)) >>> {($signed(wire27[(5'h10):(5'h10)]) - $unsigned($signed(wire5)))});
  always
    @(posedge clk) begin
      if (((wire8[(3'h4):(1'h0)] ?
          (((-wire0) ? (~|wire8) : wire30) ?
              ((~&wire5) && wire9) : $signed(((8'ha3) * wire28))) : $unsigned((wire3 >> (wire8 ?
              wire25 : wire5)))) || $unsigned((~^($unsigned(wire30) <<< ((8'hab) ?
          wire33 : wire5))))))
        begin
          reg34 <= ((wire32 <<< wire6[(2'h2):(2'h2)]) == ((|(~(^wire6))) ?
              (~(!(wire6 ? wire1 : wire27))) : ($unsigned((wire9 ?
                      wire7 : wire33)) ?
                  ((wire1 ? wire9 : wire6) >>> (wire1 & wire27)) : wire33)));
        end
      else
        begin
          reg34 <= reg34[(4'h8):(3'h7)];
          reg35 <= {$unsigned((((+(8'ha2)) << $unsigned(wire32)) ?
                  $unsigned(wire9) : ({(8'hb9)} ?
                      (wire31 && wire7) : {(8'had)})))};
        end
      reg36 <= ((~&((|wire4[(1'h0):(1'h0)]) <<< ((wire4 >= wire27) | wire0[(4'hd):(3'h7)]))) << $signed($signed(((^~wire7) >> (wire1 ~^ wire25)))));
      reg37 <= (wire3 ?
          $unsigned($unsigned((^~(~|wire2)))) : (({((8'ha6) & wire32),
              (~wire30)} < $signed($signed((8'hbe)))) <= reg34[(2'h3):(1'h1)]));
    end
  module38 #() modinst127 (wire126, clk, wire8, wire33, reg37, wire27);
  assign wire128 = $unsigned((^$unsigned((^~(^wire3)))));
  assign wire129 = wire5[(4'ha):(3'h7)];
  assign wire130 = $unsigned($unsigned((($unsigned(wire128) || wire126[(2'h2):(2'h2)]) ?
                       (8'hbb) : (-(!(8'hb3))))));
  assign wire131 = wire31[(4'hf):(4'h9)];
  assign wire132 = wire4[(1'h0):(1'h0)];
  assign wire133 = $signed($unsigned((^$unsigned((wire0 <= (8'h9d))))));
endmodule

module module38
#(parameter param125 = (&(~|{({(8'ha5), (8'ha7)} ? (^~(8'hb5)) : (~(8'had)))})))
(y, clk, wire39, wire40, wire41, wire42);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire40;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire120;
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire91,
                 wire43,
                 wire55,
                 wire93,
                 wire98,
                 wire99,
                 wire120,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire43 = wire41[(4'ha):(3'h4)];
  module44 #() modinst56 (wire55, clk, wire41, wire42, wire39, wire43, wire40);
  module57 #() modinst92 (wire91, clk, wire41, wire55, wire42, wire39, wire40);
  assign wire93 = wire43[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg94 <= wire93;
      reg95 <= ($unsigned(wire55[(3'h5):(2'h3)]) ?
          reg94[(1'h1):(1'h0)] : wire42[(2'h2):(1'h0)]);
      reg96 <= {($signed(((wire40 || wire55) ?
                  (wire41 | reg94) : wire91[(2'h2):(1'h0)])) ?
              ((wire40 <<< wire41) ?
                  wire91 : ($signed((8'ha8)) >= $unsigned(reg95))) : wire41[(3'h6):(2'h3)]),
          wire40};
      reg97 <= $signed(reg94);
    end
  assign wire98 = wire40[(4'hc):(3'h6)];
  assign wire99 = $signed($unsigned(((7'h42) + $unsigned(wire91[(2'h2):(1'h1)]))));
  module100 #() modinst121 (.y(wire120), .wire101(reg96), .clk(clk), .wire104(wire98), .wire105(reg95), .wire103(wire43), .wire102(wire91));
  assign wire122 = ($unsigned({(~|$signed(wire41))}) & ((8'hb3) ?
                       reg96[(1'h1):(1'h0)] : wire120));
  assign wire123 = $unsigned((($signed((wire98 ?
                       wire120 : reg94)) > $signed((^wire93))) > wire91[(1'h1):(1'h1)]));
  assign wire124 = ((!$unsigned(wire93)) != wire55);
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire14;
  input wire [(2'h3):(1'h0)] wire13;
  input wire [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire16,
                 wire15,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire15 = (((~&$unsigned((wire11 ^ wire12))) == wire14) ?
                      wire11 : ($unsigned((wire13 ?
                          (|wire11) : wire14[(4'h8):(3'h4)])) & (wire14[(1'h1):(1'h1)] ?
                          wire11[(3'h6):(1'h0)] : ($unsigned((8'ha5)) ?
                              wire14 : wire13[(1'h1):(1'h1)]))));
  assign wire16 = $unsigned(($unsigned(((wire15 ?
                      (8'ha8) : wire14) | (8'hac))) >>> (((wire12 ~^ wire15) >>> $unsigned(wire12)) > wire11[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg17 <= (wire11[(5'h10):(4'h9)] ?
          (^$signed(wire15)) : (wire15 ?
              ((+wire16) & wire12[(3'h4):(1'h1)]) : $unsigned(((!(8'hbf)) > (8'hb0)))));
      reg18 <= wire15;
    end
  assign wire19 = wire13[(1'h1):(1'h0)];
  assign wire20 = (wire13[(2'h2):(2'h2)] ?
                      (~wire12[(1'h0):(1'h0)]) : ((-wire12[(3'h4):(2'h2)]) ?
                          wire15 : $signed(wire12[(1'h0):(1'h0)])));
  assign wire21 = wire16[(4'hb):(1'h0)];
  assign wire22 = wire12;
  assign wire23 = ($unsigned(($signed($unsigned(wire12)) >> wire22[(3'h6):(3'h6)])) ?
                      {(((~|(8'hb7)) & (wire19 ? wire13 : wire13)) < wire16),
                          $signed(($signed((8'ha1)) << wire11[(3'h7):(1'h1)]))} : ($unsigned(wire14) ?
                          $unsigned($unsigned(((8'ha6) && reg17))) : wire14));
  assign wire24 = (8'h9e);
endmodule

module module100  (y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire105;
  input wire signed [(5'h14):(1'h0)] wire104;
  input wire [(4'hb):(1'h0)] wire103;
  input wire [(4'hf):(1'h0)] wire102;
  input wire [(3'h4):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire106 = (($unsigned((~|$unsigned(wire102))) ?
                       wire104 : ($signed(wire104[(4'hd):(1'h1)]) && wire104[(1'h0):(1'h0)])) == (wire101[(1'h0):(1'h0)] ?
                       wire105[(2'h2):(1'h1)] : wire104[(1'h0):(1'h0)]));
  assign wire107 = ($signed({(~^wire106[(4'h9):(4'h8)]),
                       ((wire103 ?
                           wire101 : wire105) > $unsigned(wire102))}) ^ {$unsigned(($signed(wire105) ^~ $signed((8'ha8))))});
  assign wire108 = $signed(({wire105} ?
                       wire105[(3'h4):(2'h3)] : ($signed($unsigned((8'hbc))) ?
                           wire105[(3'h6):(1'h1)] : (8'h9d))));
  assign wire109 = (&$signed($unsigned((wire103 ?
                       $signed(wire108) : wire106))));
  always
    @(posedge clk) begin
      reg110 <= wire102[(4'h9):(3'h4)];
      reg111 <= ($unsigned(wire106) ?
          (+(($signed((8'hb1)) - wire108[(3'h4):(2'h3)]) ?
              $signed(wire106[(4'h8):(3'h4)]) : $signed((wire108 < wire105)))) : $signed(wire106[(4'h9):(2'h3)]));
      reg112 <= ({(^$signed((wire105 || wire104)))} ?
          (((&(|wire109)) <= $signed($unsigned((8'hb6)))) ?
              $unsigned(wire106[(3'h5):(1'h0)]) : $signed(($unsigned(wire104) ?
                  (wire107 >= wire101) : wire103[(1'h1):(1'h0)]))) : $signed($signed($unsigned($unsigned(wire106)))));
      reg113 <= wire108;
      reg114 <= wire109[(1'h1):(1'h1)];
    end
  assign wire115 = (~wire108);
  assign wire116 = $signed($unsigned(reg111));
  assign wire117 = $signed($signed(((reg114 - $unsigned(wire109)) ?
                       wire101[(2'h2):(1'h1)] : $unsigned($signed(reg114)))));
  assign wire118 = wire108;
  assign wire119 = $unsigned(reg114);
endmodule

module module57  (y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire63;
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire77,
                 wire76,
                 wire66,
                 wire65,
                 wire63,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg64,
                 (1'h0)};
  assign wire63 = wire59;
  always
    @(posedge clk) begin
      reg64 <= $unsigned(((wire61[(2'h2):(1'h0)] - $unsigned((~&wire61))) ?
          $signed(((wire58 != wire58) ^~ wire61)) : wire61));
    end
  assign wire65 = wire62;
  assign wire66 = {reg64[(2'h3):(2'h3)]};
  always
    @(posedge clk) begin
      reg67 <= (({$unsigned(wire62[(4'h8):(1'h0)]), $unsigned((^wire63))} ?
              (wire63 ?
                  wire66[(4'h8):(3'h5)] : ((wire62 < wire66) ?
                      ((8'hb8) && wire58) : $unsigned(wire61))) : wire62[(5'h13):(1'h0)]) ?
          $signed(wire59) : $signed({(reg64[(4'h9):(4'h8)] ?
                  $unsigned(wire66) : $signed(wire66)),
              (wire65 ? wire62 : ((8'hb9) ? wire62 : reg64))}));
      reg68 <= $signed(wire65[(3'h5):(3'h4)]);
      reg69 <= wire60;
      if (wire61[(1'h1):(1'h1)])
        begin
          reg70 <= reg64[(4'h9):(3'h7)];
          reg71 <= reg70[(4'hf):(2'h3)];
          reg72 <= (&reg68[(3'h6):(2'h3)]);
          reg73 <= wire63;
        end
      else
        begin
          reg70 <= (reg68 << ((wire58[(1'h0):(1'h0)] <= (reg69 == {wire59,
              reg68})) * ($signed((reg70 < wire63)) ?
              $signed(wire58[(5'h11):(4'hc)]) : ((~^(8'hb1)) && (!reg69)))));
          if ((((8'ha4) < reg67) ?
              reg67[(1'h1):(1'h0)] : $unsigned(((~|wire60) ?
                  ($unsigned(reg68) * (wire66 + (8'hac))) : $signed(wire60)))))
            begin
              reg71 <= ((reg64[(4'hb):(4'ha)] >> ((reg73[(2'h2):(1'h1)] & reg73[(2'h2):(1'h1)]) << $unsigned((reg70 ?
                  (8'hab) : (8'ha2))))) ^~ {{reg71[(4'h8):(3'h6)]}});
              reg72 <= {reg72[(1'h1):(1'h0)]};
            end
          else
            begin
              reg71 <= (wire59[(3'h4):(1'h0)] << (wire66[(2'h2):(1'h0)] ?
                  ($unsigned($unsigned(reg69)) ?
                      reg67 : $signed($signed(wire66))) : ((+(+reg67)) ?
                      $signed((reg68 ?
                          wire66 : reg70)) : reg67[(2'h2):(1'h1)])));
            end
          reg73 <= ($unsigned(reg70) ?
              $unsigned((~&$unsigned(reg73[(1'h1):(1'h0)]))) : wire65[(3'h6):(3'h5)]);
          reg74 <= ((-$signed((^~reg73[(1'h0):(1'h0)]))) ?
              $unsigned(wire63) : ((8'hae) != (8'ha8)));
        end
      reg75 <= wire60;
    end
  assign wire76 = (reg72 ? (!reg75) : $unsigned((8'h9e)));
  assign wire77 = reg64;
  always
    @(posedge clk) begin
      reg78 <= reg67;
      reg79 <= ((|$signed((((8'haf) ? reg73 : reg68) <= (wire61 ?
              wire58 : reg69)))) ?
          (~^({(|(8'hb7))} << (((7'h41) ? wire61 : reg74) ?
              (+(8'ha7)) : (reg78 ? reg70 : (7'h42))))) : ($unsigned(reg72) ?
              {$signed({reg68})} : $signed($unsigned((wire76 ?
                  reg67 : wire62)))));
      reg80 <= {$signed(($unsigned($unsigned((8'hb0))) - $signed((^reg75))))};
      if (reg79)
        begin
          if (($signed(($signed((reg75 ?
              reg73 : reg78)) | $signed($unsigned((8'hac))))) + ((($signed((8'h9c)) >>> $unsigned(wire66)) ?
              {$unsigned(reg68), (^(8'ha8))} : wire76) && (~^((wire63 ?
                  reg75 : reg75) ?
              (reg64 * reg74) : wire65[(3'h6):(1'h1)])))))
            begin
              reg81 <= (&{reg69[(1'h1):(1'h0)],
                  (($unsigned(reg68) ? wire60 : (reg74 ? reg79 : reg73)) ?
                      reg73 : $unsigned((reg68 ? wire77 : reg74)))});
              reg82 <= reg67;
              reg83 <= wire65[(3'h4):(2'h3)];
              reg84 <= reg79;
              reg85 <= (wire60[(3'h5):(2'h2)] <= reg78);
            end
          else
            begin
              reg81 <= (|$unsigned((+wire76)));
            end
          reg86 <= (((((reg84 ? reg79 : reg81) > (reg70 > reg78)) ?
                      ($signed(reg72) ?
                          (~^(8'hb0)) : $signed(wire60)) : {reg74[(1'h1):(1'h1)]}) ?
                  {(^~reg83)} : $signed($unsigned((reg67 ?
                      (8'hb4) : wire62)))) ?
              (8'hb7) : reg85);
        end
      else
        begin
          if ($unsigned($signed($signed(reg82[(4'h8):(3'h7)]))))
            begin
              reg81 <= $signed(reg86);
              reg82 <= reg75;
              reg83 <= reg81[(3'h5):(1'h1)];
            end
          else
            begin
              reg81 <= wire77;
              reg82 <= (~^$signed((8'hb5)));
              reg83 <= reg85[(4'hb):(3'h6)];
            end
          reg84 <= {(|{$signed(wire65[(3'h4):(3'h4)])})};
          reg85 <= $signed($unsigned({$unsigned(reg78[(1'h1):(1'h0)])}));
          reg86 <= reg82;
        end
    end
  assign wire87 = (($unsigned({(reg81 ? reg79 : wire58),
                      (wire59 < reg86)}) | ($unsigned((reg80 ?
                      wire77 : reg71)) < {(reg78 ?
                          reg69 : wire58)})) && wire62[(1'h0):(1'h0)]);
  assign wire88 = wire65[(1'h0):(1'h0)];
  assign wire89 = (7'h41);
  assign wire90 = {$signed((8'hac)), (-reg70[(4'hd):(2'h3)])};
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire49;
  input wire [(4'hc):(1'h0)] wire48;
  input wire signed [(4'hd):(1'h0)] wire47;
  input wire signed [(5'h15):(1'h0)] wire46;
  input wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  assign y = {wire52, wire51, wire50, reg54, reg53, (1'h0)};
  assign wire50 = $signed(wire48[(3'h7):(2'h3)]);
  assign wire51 = wire50[(5'h14):(2'h3)];
  assign wire52 = wire51[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg53 <= wire52[(4'h8):(4'h8)];
    end
  always
    @(posedge clk) begin
      reg54 <= $signed(((|$unsigned($signed(wire50))) ?
          wire45 : $unsigned(wire49[(4'he):(3'h4)])));
    end
endmodule
