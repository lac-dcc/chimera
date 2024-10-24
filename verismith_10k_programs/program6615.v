module top
#(parameter param139 = (8'hb4), 
parameter param140 = (+param139))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire108;
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  assign y = {wire138,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire4,
                 wire5,
                 wire6,
                 wire108,
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
                 reg127,
                 reg126,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire0[(1'h0):(1'h0)];
  assign wire5 = (~((~^$unsigned(wire4)) <<< (&$unsigned($unsigned(wire2)))));
  assign wire6 = wire5;
  always
    @(posedge clk) begin
      reg7 <= (~^$signed((+((-(8'hbc)) ? wire5[(3'h5):(3'h5)] : (|wire6)))));
      reg8 <= $signed((!(^wire1[(3'h4):(3'h4)])));
      reg9 <= $unsigned(wire0[(4'hc):(2'h2)]);
    end
  module10 #() modinst109 (.wire11(wire2), .wire14(wire6), .wire13(reg7), .clk(clk), .y(wire108), .wire15(wire3), .wire12(reg8));
  assign wire110 = $signed((wire108 != (8'hbc)));
  assign wire111 = wire2;
  assign wire112 = wire108;
  assign wire113 = (((-(-$unsigned(reg8))) ?
                       (|reg7) : wire3) ^ wire1[(3'h4):(1'h1)]);
  assign wire114 = (^~$signed($unsigned(reg9)));
  assign wire115 = $signed($signed($unsigned(reg7)));
  assign wire116 = (~|$unsigned(wire113[(4'h8):(2'h3)]));
  assign wire117 = ($unsigned(($unsigned($unsigned(wire0)) ?
                           $signed((reg8 ?
                               reg9 : wire108)) : $unsigned((wire114 ^~ (8'hb3))))) ?
                       (($unsigned(wire5) ?
                               {(~|wire2)} : wire113[(3'h6):(2'h3)]) ?
                           ($signed(reg7) ?
                               {wire4} : $signed({wire6})) : (((~&(8'hb9)) ?
                               (wire0 ?
                                   wire3 : (8'hb4)) : $signed(wire110)) ^~ {(wire2 | (8'hb1)),
                               (~wire110)})) : (({$unsigned(wire0)} ?
                           ((wire6 ? (8'h9c) : wire108) == (reg7 ?
                               wire113 : (8'haa))) : {reg7[(1'h1):(1'h1)]}) ^~ ($signed((-wire112)) != ((wire112 ?
                           wire2 : reg8) < wire5))));
  assign wire118 = wire4[(2'h3):(2'h3)];
  assign wire119 = $signed($unsigned({(8'ha2)}));
  assign wire120 = ($signed(($signed(((8'hb3) & wire4)) | $signed(wire2))) ^ ((wire117 ?
                           wire113[(4'ha):(2'h3)] : {$unsigned(wire114)}) ?
                       wire116[(4'ha):(4'h9)] : wire2));
  assign wire121 = reg9[(1'h0):(1'h0)];
  assign wire122 = (!$signed($unsigned(wire4)));
  assign wire123 = ((^((wire112 || (wire2 != wire1)) ?
                           ((wire6 ?
                               (8'hb7) : wire2) > $unsigned(wire110)) : $unsigned(wire120[(3'h6):(3'h4)]))) ?
                       (wire122[(3'h4):(2'h2)] >> $unsigned((((8'hbb) ?
                           wire110 : wire108) == $unsigned(wire4)))) : ($unsigned({wire3[(5'h12):(4'hb)]}) > (^wire113)));
  assign wire124 = wire5;
  assign wire125 = wire117;
  always
    @(posedge clk) begin
      reg126 <= $unsigned(wire121);
      reg127 <= wire114[(2'h3):(2'h2)];
      reg128 <= (wire112[(2'h2):(2'h2)] << $unsigned((~&(8'hae))));
      if ($signed(($signed((^$signed(wire125))) && {((wire113 >> wire123) || (8'ha2)),
          $unsigned(wire3)})))
        begin
          reg129 <= {wire120[(3'h6):(1'h1)],
              $unsigned((~^$unsigned((wire114 | wire122))))};
          reg130 <= (-$signed($unsigned($signed(wire114))));
          reg131 <= wire108;
          reg132 <= wire117[(2'h2):(2'h2)];
        end
      else
        begin
          if ($unsigned((~$unsigned(((wire6 >= reg126) ?
              $unsigned(wire111) : wire3[(2'h2):(2'h2)])))))
            begin
              reg129 <= $signed($unsigned((reg132[(2'h3):(2'h2)] ?
                  {$unsigned(wire0),
                      $signed(wire113)} : $unsigned((wire114 != wire119)))));
              reg130 <= ($unsigned({$unsigned($unsigned(wire118)), (8'hae)}) ?
                  (^~(8'hbe)) : ((8'had) || {(wire116[(4'hb):(2'h2)] ?
                          $unsigned((8'h9c)) : {wire118, wire119}),
                      $signed(wire110)}));
              reg131 <= ((wire1[(3'h5):(3'h4)] ?
                      ({$unsigned((8'ha1))} ?
                          ($signed(wire123) ?
                              $unsigned(wire0) : (wire4 ?
                                  wire5 : reg129)) : (~|$unsigned(wire125))) : wire120[(2'h3):(1'h0)]) ?
                  reg128 : $unsigned({(wire123[(4'h8):(1'h0)] < wire3),
                      (~^$signed(wire1))}));
              reg132 <= wire6;
            end
          else
            begin
              reg129 <= wire116;
              reg130 <= ({wire113[(4'hb):(4'h8)]} ?
                  (8'hb7) : wire110[(2'h2):(1'h0)]);
              reg131 <= (|wire124);
              reg132 <= wire125;
              reg133 <= ((~&$unsigned({(reg8 ? wire2 : wire5),
                  $signed(reg7)})) >= $unsigned($unsigned((reg129[(1'h1):(1'h1)] << (^wire111)))));
            end
          if ($signed($unsigned($signed((~$signed(wire123))))))
            begin
              reg134 <= ((wire112 - $unsigned(({(8'ha6)} >= ((8'hbf) ?
                      wire114 : reg131)))) ?
                  (&wire115[(4'h8):(2'h2)]) : {(7'h42)});
              reg135 <= $signed((($unsigned(wire6[(2'h2):(1'h0)]) >>> reg128) != {(|(~&reg126)),
                  wire121[(2'h2):(2'h2)]}));
            end
          else
            begin
              reg134 <= reg132[(1'h1):(1'h1)];
              reg135 <= (((-(^~{reg134})) ^ wire124) ^ $signed($signed(reg135)));
              reg136 <= (&wire125);
            end
          reg137 <= $signed(((($unsigned(reg127) ?
              $signed((8'ha8)) : (+reg130)) <<< $unsigned(wire112[(1'h0):(1'h0)])) > $signed((8'h9f))));
        end
    end
  assign wire138 = (8'ha2);
endmodule

module module10
#(parameter param107 = (^{(&{((8'ha9) ? (7'h41) : (7'h41)), ((8'hab) ^ (8'haf))})}))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire58;
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  assign y = {wire106,
                 wire98,
                 wire97,
                 wire76,
                 wire60,
                 wire58,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg96,
                 reg95,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
  module16 #() modinst59 (wire58, clk, wire13, wire11, wire14, wire15, wire12);
  assign wire60 = {(wire12 <= wire15[(4'he):(4'ha)]),
                      $signed(wire58[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg61 <= (wire14[(4'h9):(4'h8)] ?
          {wire14[(4'hf):(4'hb)]} : ((~^($signed(wire15) ~^ (wire60 ?
              wire14 : wire15))) << ($signed((+wire14)) ?
              {wire12[(5'h13):(4'ha)]} : {wire60[(4'hb):(3'h5)]})));
      reg62 <= (~|{$signed($unsigned((&wire15))),
          $signed((reg61 ?
              ((8'ha6) ? wire13 : (8'hbe)) : (reg61 >>> wire12)))});
    end
  always
    @(posedge clk) begin
      reg63 <= (~^($signed(wire60) ^~ $unsigned((wire15 ?
          (8'h9f) : $signed(wire12)))));
      reg64 <= $unsigned(((((reg61 ? (8'hb6) : wire15) <= $unsigned((8'hac))) ?
              {(8'ha7), (~|reg63)} : $signed((wire58 ? (7'h40) : wire13))) ?
          wire11[(2'h3):(2'h3)] : (wire11 ^ $unsigned($signed(wire60)))));
      reg65 <= (wire13[(3'h5):(3'h5)] ?
          {(reg64 > ((7'h41) >>> (reg63 ^ reg64))),
              {({(8'hb7)} && $unsigned(wire13))}} : (|wire12));
      reg66 <= ($signed($signed({(wire13 ^~ reg63), (~|wire15)})) ?
          ((~|reg65) ^~ reg61[(4'hd):(2'h3)]) : (~^$signed($unsigned((~&(8'ha2))))));
    end
  always
    @(posedge clk) begin
      if ({$signed({reg65, wire15})})
        begin
          if (wire58[(2'h3):(2'h2)])
            begin
              reg67 <= wire11;
              reg68 <= (!reg62);
              reg69 <= reg66;
            end
          else
            begin
              reg67 <= $signed({$unsigned({(~&reg62)})});
              reg68 <= $unsigned((((~^$signed(wire12)) ?
                      ($unsigned(reg69) <<< reg62) : reg69) ?
                  (((|(7'h42)) >= ((8'hb7) ?
                      wire11 : reg62)) > wire14) : $signed((reg66[(2'h2):(1'h1)] ^~ (8'h9c)))));
              reg69 <= (($unsigned(((reg65 ? (8'hbf) : wire15) & (wire58 ?
                          reg64 : wire11))) ?
                      ($signed({reg67}) ?
                          ((+reg68) && $unsigned((8'hac))) : (&$unsigned(reg66))) : $unsigned(((reg68 ?
                          wire60 : wire12) + (reg66 ? reg68 : wire15)))) ?
                  (reg66 ?
                      wire12[(4'h8):(3'h6)] : wire11) : (reg68[(4'hd):(1'h1)] + $signed(((wire14 ?
                      wire14 : (8'h9c)) < (reg62 ? wire58 : reg67)))));
              reg70 <= wire14[(4'hc):(4'h8)];
              reg71 <= (~^reg63[(1'h0):(1'h0)]);
            end
          reg72 <= (&(!(reg63[(1'h1):(1'h1)] ?
              ((reg71 ? (8'hb2) : (8'hb4)) ?
                  ((8'hb2) | reg62) : {reg69}) : (reg69 ?
                  wire58 : wire60[(2'h3):(1'h1)]))));
          if ($unsigned($signed({(8'h9e), reg61[(5'h14):(1'h1)]})))
            begin
              reg73 <= ($unsigned((reg70[(4'ha):(4'h8)] ?
                      (-reg72) : ((reg62 ? wire12 : reg71) ?
                          (wire60 <= reg62) : reg62))) ?
                  $unsigned($unsigned($signed($unsigned((8'hb4))))) : ((^~(wire60 ?
                          reg62[(4'hd):(3'h5)] : (reg68 ? reg67 : reg62))) ?
                      wire11[(1'h1):(1'h1)] : $unsigned(((wire60 + reg64) <= (-reg70)))));
              reg74 <= reg71[(4'hc):(3'h5)];
              reg75 <= reg67[(1'h0):(1'h0)];
            end
          else
            begin
              reg73 <= reg64[(4'h9):(1'h1)];
              reg74 <= reg61;
              reg75 <= reg63;
            end
        end
      else
        begin
          reg67 <= reg73;
        end
    end
  assign wire76 = reg70;
  always
    @(posedge clk) begin
      reg77 <= (($signed($unsigned($signed(reg75))) ?
              (^~$signed({(8'ha8)})) : $unsigned(wire76[(4'hf):(4'h9)])) ?
          {wire58} : ((($unsigned(wire76) ?
                  $signed(reg68) : (wire15 > (8'h9e))) << reg62[(3'h6):(3'h5)]) ?
              reg72 : (((wire15 < wire76) ?
                      (wire15 >> wire12) : (wire13 ? reg62 : reg66)) ?
                  $signed($unsigned(reg73)) : ($signed(reg67) ?
                      $signed(wire12) : (wire11 ? reg63 : reg74)))));
      reg78 <= $signed(((!((~reg75) ?
          (8'h9c) : (reg72 ? wire15 : reg65))) ^ (|$signed($unsigned(reg75)))));
      if (reg77[(3'h4):(2'h2)])
        begin
          if ((~&({(|reg65)} <<< $signed((~(reg62 & (8'ha2)))))))
            begin
              reg79 <= reg66[(4'hd):(3'h7)];
              reg80 <= (~|$unsigned((!reg72[(3'h5):(2'h3)])));
              reg81 <= ($signed(reg74) ^ {$unsigned(($unsigned((8'hae)) >>> wire14[(3'h4):(2'h3)]))});
              reg82 <= $unsigned($signed(reg70[(4'ha):(3'h6)]));
            end
          else
            begin
              reg79 <= (~&$signed(({wire11[(4'h9):(3'h7)]} & reg74[(2'h2):(2'h2)])));
            end
          reg83 <= $signed(($signed(wire60[(2'h2):(1'h0)]) ?
              (~^(~$unsigned(reg62))) : (8'h9d)));
          reg84 <= reg64;
          reg85 <= (8'ha6);
        end
      else
        begin
          reg79 <= reg79;
          reg80 <= reg85;
          reg81 <= ((8'hab) ?
              {$unsigned(((|reg69) | ((8'ha7) ?
                      reg74 : wire13)))} : {$signed($signed($unsigned(reg63))),
                  (!(reg69 ? reg66 : (wire60 ? reg66 : reg75)))});
          reg82 <= $signed($unsigned($unsigned(((reg64 ? reg77 : reg83) ?
              $signed(reg78) : reg68[(3'h5):(2'h3)]))));
          if (($signed(((reg77 ?
                  $unsigned(reg73) : {wire14,
                      reg72}) >> $signed($unsigned(wire14)))) ?
              {$signed(reg71[(1'h1):(1'h1)]),
                  {$unsigned($signed((7'h42))),
                      reg83[(1'h1):(1'h1)]}} : ((($signed((8'ha7)) ?
                      (wire11 >> wire12) : (8'h9f)) ?
                  ((reg61 - reg63) ^~ (8'ha1)) : $signed($signed(reg75))) <= (~(reg65[(4'hc):(2'h3)] > (^wire11))))))
            begin
              reg83 <= reg65[(3'h7):(1'h1)];
              reg84 <= wire76[(3'h7):(1'h0)];
              reg85 <= $signed((($unsigned($signed(wire15)) >>> reg73) ^ {(((8'hac) ~^ reg78) ?
                      {wire15} : reg81),
                  (reg73[(2'h2):(1'h0)] != reg73[(3'h6):(3'h5)])}));
            end
          else
            begin
              reg83 <= wire12[(4'hd):(3'h5)];
              reg84 <= reg67[(1'h1):(1'h1)];
              reg85 <= (-reg73[(4'hf):(4'ha)]);
              reg86 <= ($unsigned(((~^$unsigned(wire60)) & $unsigned((reg66 ?
                      (8'ha9) : reg70)))) ?
                  reg80[(1'h1):(1'h1)] : wire58[(1'h1):(1'h0)]);
              reg87 <= (&reg65[(4'hf):(4'h9)]);
            end
        end
      reg88 <= (reg71[(3'h7):(2'h3)] < (wire15 ?
          (~|$unsigned(reg75)) : (|$signed(reg71))));
    end
  always
    @(posedge clk) begin
      reg89 <= ({{reg80[(2'h2):(1'h1)]},
          $unsigned(reg70[(3'h5):(1'h0)])} ^ ($signed({$signed(reg73),
              $unsigned(reg72)}) ?
          $unsigned(wire13) : $unsigned((&{wire11}))));
    end
  always
    @(posedge clk) begin
      reg90 <= $unsigned((($unsigned(wire14[(3'h7):(2'h3)]) ?
              (reg89[(3'h6):(3'h6)] - reg63[(2'h2):(1'h0)]) : (|(reg84 ?
                  wire12 : reg88))) ?
          reg77 : {({reg86} ? reg69[(1'h1):(1'h0)] : $signed(reg85)),
              $unsigned((reg73 ^ reg66))}));
      reg91 <= (!$unsigned(reg64[(3'h4):(3'h4)]));
      reg92 <= $signed((wire11[(3'h7):(3'h4)] ?
          wire12[(5'h12):(4'hf)] : (~|reg69[(3'h7):(3'h6)])));
      reg93 <= (~{reg78, reg92});
    end
  always
    @(posedge clk) begin
      reg94 <= ((($unsigned((^reg65)) ?
              ((wire76 ?
                  reg71 : reg81) < reg72[(4'h8):(1'h0)]) : $unsigned({wire13})) <<< ($signed((~|reg69)) <= (reg64 < (reg71 ^ reg61)))) ?
          $signed((&$unsigned($signed((8'ha3))))) : $signed(reg79[(4'hc):(1'h1)]));
      reg95 <= ($unsigned($signed({wire12[(4'hb):(4'h8)], (8'ha5)})) ^ reg91);
      reg96 <= ($signed(($signed((reg65 == reg85)) | $unsigned($signed((8'ha1))))) >> reg73);
    end
  assign wire97 = (((reg87 ? reg85[(3'h5):(2'h2)] : reg63[(3'h4):(1'h0)]) ?
                          (8'hbd) : $signed((~|$unsigned(reg69)))) ?
                      reg96 : (8'hb1));
  assign wire98 = (reg61[(1'h1):(1'h0)] * $signed($signed(((wire97 ?
                      reg94 : wire12) + $signed((8'h9f))))));
  always
    @(posedge clk) begin
      reg99 <= (|reg70[(3'h7):(3'h6)]);
      if (((({$unsigned(reg99)} ^ $signed($unsigned(reg65))) ^~ $signed((~reg70))) ?
          $unsigned(($unsigned((reg79 ^~ wire12)) * ($signed(reg75) ?
              $unsigned(reg96) : (wire60 ?
                  reg95 : reg73)))) : reg63[(3'h4):(2'h2)]))
        begin
          reg100 <= (reg89[(5'h11):(1'h1)] << reg91[(1'h1):(1'h1)]);
          reg101 <= $unsigned((reg69 <= reg68[(2'h2):(1'h0)]));
          if ((~reg65))
            begin
              reg102 <= $unsigned(($signed($signed(reg62)) ^ (~reg72)));
              reg103 <= reg82;
            end
          else
            begin
              reg102 <= {reg86[(1'h0):(1'h0)],
                  (reg77 ^ ($unsigned(wire13) || reg79))};
              reg103 <= reg78;
              reg104 <= $unsigned((((reg95 <<< (reg89 & reg103)) ?
                      $unsigned(reg66[(4'hd):(3'h7)]) : ((reg63 ?
                          (8'hb4) : reg63) >= {reg68, wire14})) ?
                  (((reg92 ? reg99 : reg72) ? wire14 : (wire58 >>> reg62)) ?
                      $unsigned(reg95) : reg79[(4'hb):(4'hb)]) : $signed(reg103)));
              reg105 <= (~|reg63);
            end
        end
      else
        begin
          reg100 <= ((~|(8'h9c)) ?
              ($signed(wire58) ?
                  (~$unsigned($signed(reg71))) : $unsigned(({reg94,
                      reg99} && {reg78,
                      reg82}))) : $unsigned((wire14 >>> $unsigned(reg67[(2'h3):(2'h2)]))));
        end
    end
  assign wire106 = ($unsigned((reg103[(4'hd):(1'h1)] ?
                       reg81[(2'h3):(1'h0)] : $signed(((8'h9f) ?
                           reg99 : wire13)))) > $unsigned($unsigned(($unsigned(reg65) ?
                       $unsigned(reg69) : $signed(wire58)))));
endmodule

module module16
#(parameter param56 = {(({(8'ha6), ((7'h41) ^ (8'hb2))} > ({(7'h43), (8'h9d)} & ((8'hb4) ? (8'ha8) : (7'h40)))) ? (8'h9e) : (+{(+(8'had))}))}, 
parameter param57 = (param56 > (-param56)))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire22;
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire36,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 reg53,
                 reg52,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = ($unsigned(wire19) ^ ((8'ha1) ?
                      (~(~|wire17)) : (((^wire18) && (wire20 + (8'hb5))) & (wire19 ?
                          wire20[(3'h5):(1'h0)] : wire19[(4'hb):(3'h6)]))));
  always
    @(posedge clk) begin
      reg23 <= $signed($unsigned(wire21));
      reg24 <= wire17;
    end
  assign wire25 = (((~^{wire21[(4'hc):(3'h6)]}) ?
                      reg23[(2'h3):(1'h0)] : wire21[(4'hb):(4'h9)]) != $unsigned($unsigned(((&wire19) ?
                      wire19[(4'hc):(4'ha)] : wire18))));
  assign wire26 = $signed((~^wire21[(1'h0):(1'h0)]));
  assign wire27 = wire21[(5'h11):(4'he)];
  assign wire28 = ($unsigned(((!(|reg24)) >> {(~wire21)})) > (^((wire18[(1'h0):(1'h0)] ?
                          wire27 : $signed(wire26)) ?
                      wire19 : $signed(wire18[(2'h2):(1'h1)]))));
  assign wire29 = wire26;
  assign wire30 = (({wire22,
                      (7'h43)} <= (wire18 > ((-wire21) ^~ {wire25}))) + (wire25[(3'h6):(3'h5)] ?
                      $unsigned((wire18 <= $unsigned((7'h41)))) : wire21));
  assign wire31 = $signed(($signed(wire29) ?
                      (wire26[(4'he):(2'h3)] ?
                          $signed(wire29[(3'h5):(1'h0)]) : $unsigned(wire25)) : wire28));
  always
    @(posedge clk) begin
      reg32 <= wire20[(1'h1):(1'h0)];
      reg33 <= reg24;
      reg34 <= $unsigned(((wire21 * (((8'hbb) ?
          wire30 : wire19) < $unsigned((8'haf)))) >> wire17));
      reg35 <= $signed({$unsigned(reg33)});
    end
  assign wire36 = reg32;
  always
    @(posedge clk) begin
      reg37 <= ((&{wire20}) <<< ((wire20[(2'h3):(2'h2)] ?
              wire17[(2'h2):(2'h2)] : wire30) ?
          wire36[(4'hd):(4'hb)] : reg23));
      reg38 <= (reg35[(3'h5):(3'h4)] >= {$unsigned(((8'h9e) - (~|reg35)))});
      if (wire28[(4'hf):(4'ha)])
        begin
          reg39 <= wire28[(3'h6):(1'h0)];
        end
      else
        begin
          reg39 <= (wire19 <<< wire30[(4'h8):(3'h4)]);
        end
      if ($signed($signed(wire19[(5'h11):(4'he)])))
        begin
          if (({$signed($signed((7'h42)))} ?
              (wire20 != (!(wire36 | {wire17,
                  (8'hba)}))) : ((($unsigned((8'hb8)) ?
                      (wire36 ?
                          wire18 : wire26) : reg24[(2'h3):(2'h3)]) || wire22) ?
                  reg35 : ((wire27 ^ ((8'hae) ?
                      wire30 : wire17)) ^~ $unsigned((-wire26))))))
            begin
              reg40 <= reg39;
            end
          else
            begin
              reg40 <= $signed((7'h42));
              reg41 <= (^reg24);
            end
          reg42 <= (^~reg41[(4'h9):(3'h6)]);
        end
      else
        begin
          if (wire28)
            begin
              reg40 <= wire29[(3'h4):(2'h3)];
              reg41 <= ((^~reg41[(4'hc):(3'h5)]) ?
                  (wire31 ?
                      wire27[(4'h8):(3'h6)] : (~^$unsigned((wire30 ?
                          (8'hb9) : wire25)))) : (reg23[(1'h1):(1'h0)] << (wire36 + ((reg42 - reg37) * $signed(reg41)))));
              reg42 <= $signed({wire30[(5'h13):(4'hd)], (8'hb7)});
              reg43 <= {reg40[(4'h9):(3'h6)]};
            end
          else
            begin
              reg40 <= (-$signed((^~wire25[(3'h4):(1'h1)])));
            end
          reg44 <= wire25;
          reg45 <= ((7'h44) > (8'ha7));
        end
      reg46 <= (!$unsigned($signed($signed((wire27 ? wire18 : wire31)))));
    end
  assign wire47 = $signed($unsigned((|$unsigned($signed(reg24)))));
  assign wire48 = $signed(reg37[(5'h11):(5'h11)]);
  assign wire49 = {(^((^(wire25 ? (8'hbb) : wire22)) || (|(^~reg32))))};
  assign wire50 = (|$unsigned((8'hb4)));
  assign wire51 = ({reg46[(3'h6):(1'h1)], (!(!(~^reg37)))} ?
                      $unsigned($signed($unsigned((wire25 + reg32)))) : $signed((!(|(wire49 | wire27)))));
  always
    @(posedge clk) begin
      reg52 <= $signed((((-(~&wire18)) ? wire19 : reg39) ?
          (&$unsigned({wire51})) : (wire51[(3'h5):(3'h4)] ?
              (wire49 ?
                  ((8'h9f) ?
                      reg46 : (8'hb3)) : reg42[(1'h0):(1'h0)]) : ((8'ha4) ^ ((8'ha2) ?
                  reg44 : wire18)))));
      reg53 <= (^wire19);
    end
  assign wire54 = wire29;
  assign wire55 = (({wire28[(2'h3):(2'h2)],
                      (^$unsigned(wire30))} > $signed(reg34[(2'h2):(1'h1)])) == $signed($signed($unsigned((wire31 == (8'ha0))))));
endmodule
