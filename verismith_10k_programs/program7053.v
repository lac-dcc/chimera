module top
#(parameter param128 = {(-({(~^(8'ha5))} ? (((7'h43) | (8'hb2)) & (8'hb1)) : ({(8'hba), (8'hae)} <= {(8'ha4)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire125;
  wire signed [(3'h7):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire120,
                 wire119,
                 wire118,
                 wire115,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg117,
                 (1'h0)};
  assign wire4 = (wire3[(2'h3):(2'h2)] ?
                     (|$signed($unsigned($unsigned(wire1)))) : (($signed((wire2 ?
                         wire2 : (8'ha7))) << (~&wire3)) == $signed(wire2)));
  assign wire5 = $signed(wire4[(4'h9):(2'h2)]);
  assign wire6 = wire1;
  assign wire7 = $signed((($signed(wire3) ?
                     wire6 : wire6) ^ $signed(wire0[(3'h5):(1'h0)])));
  module8 #() modinst116 (.y(wire115), .clk(clk), .wire9(wire0), .wire11(wire2), .wire10(wire7), .wire12(wire3));
  always
    @(posedge clk) begin
      reg117 <= wire7[(1'h1):(1'h0)];
    end
  assign wire118 = wire6;
  assign wire119 = $unsigned($signed((wire5 ? wire7 : $signed((8'ha4)))));
  assign wire120 = wire118[(5'h11):(4'hf)];
  always
    @(posedge clk) begin
      reg121 <= ($signed(wire7[(1'h1):(1'h1)]) ?
          $signed(reg117) : $unsigned(($signed((reg117 <<< wire115)) ~^ (+(wire2 ?
              wire119 : wire120)))));
      reg122 <= (~|(wire119 < wire118[(1'h0):(1'h0)]));
      reg123 <= $signed((&$unsigned(reg122[(3'h4):(3'h4)])));
      reg124 <= (wire0 << ({wire5, $unsigned(wire115[(1'h1):(1'h0)])} ?
          (wire118[(2'h3):(2'h2)] ? wire3 : reg122[(3'h6):(1'h1)]) : {wire6}));
    end
  assign wire125 = ($unsigned(wire3) ?
                       ({((reg123 != (8'hbe)) << (wire1 <= reg117))} ^ reg124) : $unsigned((wire119[(4'h8):(3'h4)] >>> (&(wire0 && wire1)))));
  assign wire126 = (~^(&(wire118 && $signed(((7'h43) ? (8'ha3) : wire3)))));
  assign wire127 = wire4[(4'hc):(2'h3)];
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire112;
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  assign y = {wire114,
                 wire13,
                 wire14,
                 wire62,
                 wire112,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire13 = ((((^(-wire10)) ?
                          (~&(8'h9f)) : wire10) ^ (-wire11[(3'h6):(1'h1)])) ?
                      (wire9 >> ($signed({wire9}) ^~ ((wire9 ?
                              wire11 : wire12) ?
                          wire12 : $signed(wire12)))) : ($signed((wire11[(4'h9):(3'h5)] < ((8'hb0) ?
                              (8'hbb) : (8'h9f)))) ?
                          (-(wire12 == $unsigned(wire9))) : (($unsigned(wire9) ?
                                  wire11[(4'ha):(1'h1)] : wire9) ?
                              {$signed(wire9)} : $signed($signed(wire9)))));
  assign wire14 = $signed($signed((~($signed(wire9) >= $signed((8'hbd))))));
  module15 #() modinst63 (.clk(clk), .y(wire62), .wire18(wire9), .wire17(wire14), .wire19(wire10), .wire16(wire13));
  always
    @(posedge clk) begin
      if (($signed($signed(($unsigned(wire9) ?
          (wire10 ?
              wire10 : wire10) : $unsigned(wire14)))) & $unsigned($signed($signed(wire62[(3'h5):(3'h4)])))))
        begin
          if ((((wire13[(5'h12):(4'h8)] > {(wire11 ?
                  wire9 : wire62)}) * $unsigned((^(~^(8'ha4))))) | {$signed(wire11[(4'hb):(3'h4)]),
              {(-(wire12 < wire12))}}))
            begin
              reg64 <= $unsigned((&$signed(wire62[(3'h5):(3'h4)])));
              reg65 <= {wire62,
                  (reg64[(4'h8):(1'h0)] ?
                      (-(|(wire14 ?
                          wire62 : wire11))) : ((reg64[(2'h2):(1'h1)] ?
                              (7'h41) : (~|wire10)) ?
                          $unsigned($signed(wire14)) : (~((8'ha1) || wire12))))};
              reg66 <= (^$signed({($signed(wire62) ^ $signed(wire9)),
                  (reg65[(1'h0):(1'h0)] ? $unsigned((7'h42)) : (|wire14))}));
            end
          else
            begin
              reg64 <= $unsigned((($unsigned(reg65) ?
                  $unsigned(wire9[(3'h5):(1'h1)]) : wire14[(3'h5):(1'h1)]) | ($unsigned((wire11 ?
                  wire11 : wire11)) == wire12[(4'hc):(4'h8)])));
              reg65 <= ({(^((wire10 ? wire12 : wire14) ?
                          $signed(wire13) : (&wire12)))} ?
                  (((+$unsigned(reg65)) ?
                          wire9 : (reg65 == wire9[(4'he):(4'h9)])) ?
                      {$unsigned((wire11 ? (7'h42) : wire9)),
                          wire12[(3'h5):(1'h0)]} : $signed(((reg66 ?
                          (8'hac) : wire11) == wire62))) : ((((~wire14) ?
                          (wire13 ?
                              wire62 : reg66) : reg65[(1'h1):(1'h1)]) && ({reg64} >= (wire12 ?
                          wire10 : wire12))) ?
                      $signed(reg66[(5'h12):(3'h7)]) : $unsigned($signed((wire11 + reg66)))));
              reg66 <= wire11;
            end
          reg67 <= wire13[(5'h12):(1'h1)];
          reg68 <= ($signed(wire14[(2'h3):(1'h0)]) ~^ ((($unsigned((8'ha3)) & wire62) ^~ (~^wire9)) ?
              ($signed(wire13[(5'h12):(3'h7)]) ?
                  (~|wire9[(3'h5):(3'h4)]) : $unsigned($unsigned(reg64))) : $unsigned(reg64[(3'h6):(2'h2)])));
          reg69 <= wire12[(3'h6):(1'h0)];
        end
      else
        begin
          reg64 <= wire11;
          if (wire10[(3'h5):(3'h4)])
            begin
              reg65 <= wire11;
              reg66 <= (reg65 < $unsigned($unsigned((((8'hb8) ~^ wire12) == (!wire12)))));
              reg67 <= $unsigned($signed({(~|(~&reg69)),
                  {wire9, $unsigned(wire10)}}));
              reg68 <= (wire62 >= (((|$signed(wire13)) ?
                  (~^wire9) : {wire12}) > reg67));
              reg69 <= {reg68[(3'h6):(1'h0)]};
            end
          else
            begin
              reg65 <= ((wire13[(4'hd):(3'h7)] && wire10[(1'h0):(1'h0)]) ?
                  $signed((|(8'h9c))) : ({wire10[(3'h7):(3'h7)]} & (reg68 || $unsigned((reg69 ?
                      wire62 : (8'hb0))))));
              reg66 <= (|{$signed((8'hbf)),
                  ((|$signed(reg66)) ? (+wire13) : reg64[(3'h4):(1'h1)])});
            end
          reg70 <= {($signed(wire14) - reg67), wire62};
          reg71 <= (&(^~{wire13}));
          reg72 <= {(reg64[(4'hd):(1'h1)] || wire62)};
        end
      if ({(8'h9f)})
        begin
          reg73 <= wire11[(3'h4):(2'h2)];
          if (wire11)
            begin
              reg74 <= (wire62[(2'h3):(2'h3)] << ((reg64 >> reg71) < (^{wire9})));
              reg75 <= ($unsigned(wire62) ? (8'hbb) : reg67);
              reg76 <= (reg73 ?
                  (~^$unsigned(reg75[(4'h9):(2'h2)])) : ((^~((+wire11) ?
                          (-wire9) : (reg75 || reg74))) ?
                      $unsigned(((^wire12) + (reg73 ?
                          (8'ha8) : reg72))) : $signed(reg66[(4'he):(4'hd)])));
              reg77 <= (~^reg75);
            end
          else
            begin
              reg74 <= ({(&((reg77 ? reg73 : wire10) ?
                      $unsigned((8'haf)) : (-wire9)))} * wire12);
              reg75 <= (+($signed(reg67[(1'h0):(1'h0)]) & {((reg75 - reg64) ?
                      (&reg77) : $signed(reg70))}));
              reg76 <= {$unsigned(reg70[(1'h0):(1'h0)]), $signed((~^wire12))};
              reg77 <= wire9[(2'h2):(2'h2)];
            end
          reg78 <= $signed(reg68[(3'h6):(3'h4)]);
          reg79 <= $signed((~^wire62[(3'h7):(3'h5)]));
        end
      else
        begin
          reg73 <= $signed((!reg78[(1'h0):(1'h0)]));
        end
      reg80 <= ((($signed((8'hab)) ?
              (((8'ha6) | reg71) | $unsigned(reg65)) : $signed($signed(wire13))) ?
          (reg68[(3'h4):(3'h4)] ?
              $signed({reg76}) : reg64) : $unsigned($signed({reg76}))) | $unsigned(wire14));
      reg81 <= $unsigned((($unsigned($signed(reg78)) ?
          $signed($signed(reg73)) : (reg73[(3'h6):(1'h1)] ?
              ((8'hba) ? (8'hb1) : (8'hb0)) : (reg75 <= reg79))) >> wire14));
      reg82 <= (!{reg68,
          (reg79 ? $unsigned((wire10 ? wire14 : reg69)) : (^~(~reg72)))});
    end
  module83 #() modinst113 (wire112, clk, reg68, wire62, reg69, reg65);
  assign wire114 = $unsigned(($unsigned(((reg79 ? reg76 : (8'ha2)) ?
                           reg74[(2'h3):(2'h2)] : reg76)) ?
                       $signed(((!wire112) ?
                           reg79[(4'ha):(2'h3)] : (reg77 >> wire11))) : $unsigned(($unsigned((8'hac)) > (reg80 ?
                           reg65 : reg77)))));
endmodule

module module83
#(parameter param111 = (((+(~^(~^(8'ha9)))) != (({(8'hb4)} - {(8'h9e)}) >> ({(8'hac)} ~^ (^~(8'ha1))))) - (((((8'ha8) << (8'hb1)) | {(8'h9f)}) ? (~|(~|(8'hbb))) : ((|(8'h9d)) - ((8'hb8) ? (7'h42) : (8'haf)))) != (^(!((8'hb9) ? (8'hb0) : (8'ha6)))))))
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire87;
  input wire signed [(5'h11):(1'h0)] wire86;
  input wire signed [(4'h8):(1'h0)] wire85;
  input wire signed [(3'h4):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire88;
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  assign y = {wire110,
                 wire88,
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
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire88 = (wire85 ?
                      $signed(({$unsigned((8'hae))} + wire87[(3'h5):(1'h0)])) : $signed($unsigned(wire87[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg89 <= (wire84[(3'h4):(3'h4)] ?
          wire86[(4'h8):(3'h6)] : $unsigned($unsigned($signed($unsigned(wire88)))));
      reg90 <= wire87;
      if ($signed(wire88[(3'h5):(3'h4)]))
        begin
          if (reg90)
            begin
              reg91 <= {$signed(wire84),
                  (wire84[(3'h4):(1'h0)] ?
                      wire84[(2'h3):(2'h2)] : ($unsigned((wire88 ?
                              wire85 : reg89)) ?
                          wire84[(3'h4):(2'h3)] : wire86))};
              reg92 <= wire85;
              reg93 <= $unsigned(((8'hb5) ?
                  $signed($unsigned(wire88)) : $unsigned(($signed(reg92) | wire84))));
            end
          else
            begin
              reg91 <= (($unsigned($signed($unsigned(reg92))) <= (wire88[(3'h5):(3'h4)] ?
                  ($signed(reg93) ?
                      $unsigned(reg90) : (wire85 < wire86)) : reg91)) << {$signed($signed((8'hbb)))});
              reg92 <= reg93[(3'h5):(3'h5)];
              reg93 <= wire87[(3'h4):(1'h1)];
              reg94 <= ({(~|{(reg89 ? reg92 : wire86),
                      (wire87 ?
                          wire88 : reg91)})} >> (($unsigned((wire87 == reg91)) >>> reg92[(3'h5):(2'h3)]) ?
                  (((reg93 ? (8'hb6) : reg90) & reg90) ?
                      (!$unsigned(reg92)) : $signed($unsigned(wire86))) : ((reg91 ?
                      $unsigned(reg89) : (wire88 ?
                          wire87 : wire86)) > $unsigned((wire84 | (7'h43))))));
            end
          reg95 <= reg90;
          reg96 <= ($unsigned(reg92) <<< $unsigned({$unsigned({reg90, reg92}),
              wire87[(3'h5):(3'h5)]}));
          reg97 <= $unsigned(((8'haf) != (($signed(reg90) >= {(8'hb2),
              (8'hb2)}) >> (8'hb5))));
        end
      else
        begin
          reg91 <= {(8'hb2)};
          reg92 <= $signed(({wire88} != (+(((7'h44) <<< reg90) ?
              $unsigned(reg96) : reg94))));
          reg93 <= $unsigned($unsigned(wire85));
          if (wire87[(3'h5):(2'h2)])
            begin
              reg94 <= $unsigned({{reg92,
                      ($signed(reg90) * (reg90 ? (8'h9c) : reg96))}});
            end
          else
            begin
              reg94 <= ((&{$unsigned($signed(reg96)),
                  ($signed(reg89) ?
                      $unsigned(reg94) : $signed(reg93))}) <<< ($unsigned(reg91) - $signed(reg97[(2'h2):(2'h2)])));
              reg95 <= (^~$unsigned((reg90 < $unsigned(reg89[(3'h4):(1'h1)]))));
              reg96 <= (wire87[(3'h6):(2'h3)] || ($signed({((8'hbd) | wire85)}) ?
                  ((8'hbb) + reg92[(3'h5):(2'h2)]) : $unsigned({(reg89 ?
                          (7'h40) : reg89)})));
              reg97 <= $unsigned({reg92});
              reg98 <= $unsigned($signed($signed(((&(7'h41)) - wire85[(1'h1):(1'h0)]))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg99 <= ($signed(reg92) >= reg91[(4'hf):(3'h6)]);
      if ((reg94[(1'h1):(1'h1)] ?
          reg90 : $signed($signed({$signed(wire85), (reg93 >= reg97)}))))
        begin
          reg100 <= reg91;
        end
      else
        begin
          reg100 <= wire85[(3'h5):(3'h5)];
          reg101 <= reg92[(3'h5):(2'h3)];
          reg102 <= $unsigned($signed((|reg97)));
          reg103 <= $unsigned((8'ha5));
          reg104 <= (|((^$signed(((8'hbe) <= (8'hba)))) + (wire86 ?
              (reg90 ?
                  (reg91 ?
                      reg103 : reg91) : $signed(reg99)) : reg94[(2'h2):(1'h0)])));
        end
      if (reg95)
        begin
          reg105 <= $signed($unsigned(reg98));
        end
      else
        begin
          reg105 <= ($signed((&(8'ha3))) + $signed(reg100[(3'h6):(1'h0)]));
          reg106 <= (8'hb7);
          reg107 <= wire88;
          reg108 <= (((~|((reg97 ?
              reg97 : reg91) >>> $unsigned(reg90))) > (~&(+{reg106,
              reg89}))) >> $signed($signed(($signed((8'hb7)) ?
              $signed(reg98) : $unsigned(reg104)))));
        end
      reg109 <= (~$signed($unsigned((reg105[(1'h0):(1'h0)] ?
          reg106[(3'h4):(1'h1)] : $unsigned(wire84)))));
    end
  assign wire110 = reg104[(2'h3):(1'h1)];
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire20;
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  assign y = {wire61,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire20,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = $signed(wire17[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire17)
        begin
          reg21 <= $unsigned($unsigned(wire17));
          reg22 <= (((-(|(|wire16))) ?
                  ({((8'hba) ^~ wire16), (&(8'hb7))} ?
                      ($unsigned(wire19) || (wire19 ?
                          wire20 : wire20)) : {(~wire16)}) : wire17) ?
              wire20 : (+(($signed(wire18) == wire19) + reg21)));
          reg23 <= (~&wire17);
        end
      else
        begin
          reg21 <= (8'hb1);
          reg22 <= (~{{reg23[(1'h1):(1'h1)]}, wire16[(4'h9):(2'h3)]});
          if (wire18[(1'h0):(1'h0)])
            begin
              reg23 <= $unsigned(({$signed(wire16)} ^~ (&{wire18[(2'h3):(2'h3)]})));
              reg24 <= wire18;
              reg25 <= $unsigned(wire18);
              reg26 <= ((8'ha1) || $unsigned((reg21 >> $unsigned($unsigned(reg24)))));
            end
          else
            begin
              reg23 <= $signed((+(|$unsigned((reg24 != (8'hab))))));
              reg24 <= $signed((($signed((wire19 ?
                  wire18 : wire19)) - reg23) ~^ ($signed((wire20 & reg26)) >>> $signed({wire16,
                  reg24}))));
              reg25 <= {($unsigned(reg23[(1'h1):(1'h0)]) < (((reg24 < wire19) != reg23[(1'h1):(1'h0)]) << (|$unsigned((8'hba))))),
                  $signed(wire19[(2'h3):(2'h2)])};
              reg26 <= wire17[(1'h1):(1'h0)];
            end
          if (reg21[(3'h5):(2'h3)])
            begin
              reg27 <= reg26[(1'h1):(1'h1)];
              reg28 <= reg25;
            end
          else
            begin
              reg27 <= ((8'hac) ? reg25[(1'h1):(1'h0)] : (7'h42));
              reg28 <= reg24[(3'h5):(3'h4)];
              reg29 <= (wire19[(2'h2):(1'h1)] == ((({reg23} ?
                          (&wire19) : ((8'hbe) | reg27)) ?
                      (!(reg22 ?
                          reg25 : reg27)) : $unsigned($unsigned(reg28))) ?
                  (^~(8'hbf)) : reg27));
              reg30 <= ((-$unsigned(((reg21 || reg25) ?
                      (wire16 ? reg26 : (8'ha1)) : $unsigned(reg28)))) ?
                  (!((reg27[(5'h10):(4'ha)] & ((8'hb4) ? reg29 : wire17)) ?
                      reg27 : {reg28[(3'h6):(3'h4)],
                          wire19[(3'h7):(2'h2)]})) : $unsigned((+reg29[(1'h0):(1'h0)])));
              reg31 <= reg24;
            end
          if ((~&wire19[(3'h5):(2'h3)]))
            begin
              reg32 <= (8'hae);
              reg33 <= wire17;
              reg34 <= (8'hae);
              reg35 <= ((8'ha9) * reg34);
              reg36 <= {(-$unsigned((reg31[(4'h8):(3'h6)] && $unsigned(reg22)))),
                  $unsigned((8'h9d))};
            end
          else
            begin
              reg32 <= (~^$unsigned(wire19[(3'h6):(3'h6)]));
              reg33 <= (~$signed({(8'hbe)}));
              reg34 <= (+$unsigned((+(!$signed(reg32)))));
            end
        end
      reg37 <= $unsigned({reg30,
          (-($unsigned(reg25) ? (wire18 << reg27) : $signed((8'hb4))))});
      reg38 <= $unsigned(reg33[(2'h3):(2'h3)]);
      reg39 <= ((reg36 ? {reg35[(1'h1):(1'h1)]} : reg26[(1'h0):(1'h0)]) ?
          (wire16[(4'hf):(4'hc)] ?
              $unsigned((^(wire17 ?
                  reg21 : reg36))) : (&reg29)) : wire16[(3'h7):(3'h6)]);
      reg40 <= wire19[(3'h5):(3'h5)];
    end
  assign wire41 = (-((^$signed($unsigned(reg33))) >= reg36));
  assign wire42 = (wire41[(4'h8):(2'h2)] ?
                      $unsigned((&((+reg25) - wire16[(3'h7):(1'h0)]))) : ($signed(reg37) << ($signed((wire17 || reg22)) > $unsigned($signed(reg40)))));
  assign wire43 = (~$signed(($signed(reg26) || reg30)));
  assign wire44 = reg26;
  assign wire45 = $unsigned(reg28);
  assign wire46 = (^~($unsigned(reg36) ?
                      (reg29[(1'h1):(1'h1)] ?
                          wire42[(4'hc):(4'h8)] : ($unsigned((8'ha3)) >= reg30)) : $unsigned(($unsigned((8'hbe)) + (reg26 - wire16)))));
  assign wire47 = $unsigned(wire19);
  assign wire48 = ($signed(((8'hbc) <= ((wire18 ? wire47 : (8'haf)) ?
                      (reg36 ? wire18 : wire47) : reg21))) ~^ wire43);
  assign wire49 = (({((~|reg40) ?
                                  $signed(wire42) : (reg40 ?
                                      (8'ha0) : (8'hb3)))} ?
                          reg37 : ($signed(reg29) ?
                              reg26 : $signed((reg22 ? wire19 : wire47)))) ?
                      ($signed(($unsigned(wire44) ?
                          (reg27 << reg35) : wire47[(3'h6):(1'h0)])) != (~{$signed(wire42)})) : reg29[(3'h5):(2'h3)]);
  assign wire50 = ((({wire17[(3'h4):(3'h4)]} == (reg31[(4'hc):(1'h1)] ?
                          ((7'h43) ?
                              reg23 : reg25) : $signed(reg40))) * reg35) ?
                      wire48[(1'h1):(1'h0)] : ((($unsigned(reg22) * $unsigned(reg24)) >> $unsigned(reg39[(1'h1):(1'h0)])) ?
                          reg23[(2'h2):(1'h0)] : (&($signed(wire46) << (^~wire46)))));
  assign wire51 = (-(|{$unsigned(reg39)}));
  assign wire52 = {wire41, ((^wire19) ? wire48 : reg24[(3'h7):(3'h4)])};
  always
    @(posedge clk) begin
      reg53 <= $unsigned(wire18);
      reg54 <= (7'h44);
      reg55 <= ($signed(reg28) ^~ $unsigned(reg23[(1'h0):(1'h0)]));
      reg56 <= {(^~reg37[(4'hb):(4'ha)]),
          (~{$signed(((8'hbb) ? wire48 : reg25)), wire43[(4'ha):(3'h6)]})};
    end
  always
    @(posedge clk) begin
      reg57 <= {((reg30[(4'hf):(2'h3)] & {(wire18 ? reg53 : wire17),
                  (reg25 ? (8'h9c) : wire19)}) ?
              wire41 : (wire50 ? wire43[(3'h5):(3'h5)] : wire44)),
          (wire51[(3'h7):(2'h3)] ?
              (~^$unsigned((reg28 ? reg22 : wire51))) : (reg31 ?
                  ($unsigned(reg40) ?
                      (wire42 ?
                          reg24 : reg36) : $unsigned(wire46)) : $signed(wire16[(1'h1):(1'h0)])))};
      reg58 <= $signed(($signed($unsigned($unsigned(wire47))) ?
          ($signed((+wire49)) ?
              ((+wire50) ?
                  {wire45} : ((7'h41) <<< wire20)) : {reg54[(3'h6):(1'h1)],
                  $signed((7'h42))}) : reg26));
      reg59 <= $signed((~(((8'hac) - (&reg28)) >>> ((wire49 ?
          reg23 : (8'ha9)) >= reg25))));
      reg60 <= reg58;
    end
  assign wire61 = $signed((reg57 ?
                      $signed($unsigned(reg28)) : $unsigned(({(8'hb8), wire41} ?
                          $unsigned(reg57) : $unsigned(reg60)))));
endmodule
