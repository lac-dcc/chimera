module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire205;
  wire [(5'h13):(1'h0)] wire204;
  wire [(3'h5):(1'h0)] wire203;
  wire [(5'h12):(1'h0)] wire202;
  wire signed [(4'hc):(1'h0)] wire200;
  wire signed [(5'h12):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire127;
  wire signed [(5'h10):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire200,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire122,
                 wire4,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire4 = $unsigned((wire3[(4'hf):(3'h7)] << wire0));
  module5 #() modinst123 (wire122, clk, wire1, wire2, wire3, wire4);
  assign wire124 = ((&(&{$signed(wire1), $signed((8'hb2))})) ?
                       {(wire1 ^~ (^~wire3)), wire0[(1'h0):(1'h0)]} : wire3);
  assign wire125 = wire3;
  assign wire126 = $unsigned((~wire0[(1'h0):(1'h0)]));
  assign wire127 = {($signed((!wire0[(2'h2):(1'h1)])) ? wire2 : wire1),
                       (wire125[(4'hb):(2'h2)] < $signed($signed((^~wire2))))};
  assign wire128 = wire126;
  always
    @(posedge clk) begin
      reg129 <= {$signed(wire0),
          $signed(((wire128 ?
              (8'hbb) : wire126[(1'h0):(1'h0)]) <<< wire124[(3'h5):(1'h1)]))};
      reg130 <= $unsigned(($signed((wire125 < wire0)) ^~ (|($signed(wire124) ^ $unsigned(wire1)))));
    end
  module131 #() modinst201 (wire200, clk, wire126, wire128, wire4, wire0);
  assign wire202 = $signed((wire128 ? wire0[(4'hc):(3'h5)] : reg129));
  assign wire203 = reg129[(4'hf):(1'h1)];
  assign wire204 = (^~(((wire203[(3'h5):(1'h1)] == (wire128 | (8'ha6))) && (~wire3[(4'he):(4'hb)])) ?
                       (wire202 ^ $unsigned($signed((8'hb7)))) : wire202));
  assign wire205 = ($unsigned(wire202) ^~ $signed(wire1));
endmodule

module module131  (y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire135;
  input wire signed [(5'h12):(1'h0)] wire134;
  input wire [(5'h12):(1'h0)] wire133;
  input wire [(5'h10):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire199;
  wire [(4'hc):(1'h0)] wire198;
  wire [(3'h7):(1'h0)] wire197;
  wire [(4'hd):(1'h0)] wire195;
  wire signed [(3'h6):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire136;
  assign y = {wire199, wire198, wire197, wire195, wire137, wire136, (1'h0)};
  assign wire136 = (~$signed((+wire132[(4'hb):(3'h5)])));
  assign wire137 = {(^~(^~wire134)),
                       ($unsigned((8'hbd)) ?
                           $signed(wire136[(4'hf):(2'h2)]) : wire135[(2'h3):(1'h0)])};
  module138 #() modinst196 (wire195, clk, wire132, wire135, wire136, wire134);
  assign wire197 = {(~|(($signed(wire136) ?
                           $unsigned(wire132) : $signed(wire135)) ~^ wire137))};
  assign wire198 = (^(($unsigned($signed(wire132)) ?
                           wire132 : $signed({wire135, wire132})) ?
                       (wire195[(2'h3):(1'h1)] ?
                           $signed($unsigned(wire137)) : wire133[(4'hd):(4'ha)]) : $signed((wire135[(4'he):(3'h7)] ?
                           wire134[(4'h9):(2'h2)] : (wire137 || wire132)))));
  assign wire199 = $signed(wire198[(4'h9):(1'h0)]);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire119;
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  assign y = {wire84,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire119,
                 reg121,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire10 = wire9[(2'h2):(1'h0)];
  assign wire11 = ({wire7[(3'h5):(3'h4)],
                      (wire9 < ((wire8 ? wire8 : wire8) ?
                          $signed(wire8) : $unsigned(wire6)))} >= wire9[(3'h6):(3'h4)]);
  assign wire12 = (|$unsigned(wire8));
  assign wire13 = wire9;
  assign wire14 = $unsigned((wire11[(4'h8):(2'h3)] >> {wire7[(4'hf):(4'hd)]}));
  assign wire15 = wire11[(2'h2):(2'h2)];
  assign wire16 = (($unsigned(($signed(wire13) ?
                              $signed((8'ha9)) : $unsigned(wire8))) ?
                          wire11[(3'h6):(1'h1)] : $signed(wire9[(3'h5):(3'h4)])) ?
                      wire8[(3'h6):(3'h4)] : {$signed((&wire10[(2'h2):(1'h1)])),
                          {($signed(wire14) >= wire15)}});
  assign wire17 = $signed($unsigned((&$unsigned($unsigned(wire6)))));
  always
    @(posedge clk) begin
      reg18 <= $signed($signed(wire9));
      reg19 <= ($unsigned((~|({wire8, wire17} > $unsigned(wire17)))) ?
          wire12 : $unsigned((-(-(wire12 & wire10)))));
      if ({$unsigned(($unsigned((wire8 ? wire12 : (8'ha9))) - $signed(wire8))),
          (^~wire8[(2'h3):(2'h3)])})
        begin
          reg20 <= wire10;
          if ((-$signed((reg20[(3'h6):(2'h3)] ?
              wire7[(5'h12):(4'ha)] : (wire14[(3'h4):(3'h4)] ^~ reg20)))))
            begin
              reg21 <= (8'ha4);
              reg22 <= {(((8'ha9) ~^ ((~|wire15) ?
                          $signed(wire9) : $signed(wire6))) ?
                      wire14[(1'h0):(1'h0)] : ($signed((wire10 | (8'hb0))) > $unsigned(reg20[(4'ha):(1'h0)]))),
                  $unsigned(wire9)};
            end
          else
            begin
              reg21 <= wire17[(5'h10):(4'h9)];
              reg22 <= $unsigned($unsigned(($signed((reg21 ?
                  reg22 : wire13)) | reg18)));
              reg23 <= $unsigned(wire6[(1'h0):(1'h0)]);
              reg24 <= {reg19[(3'h5):(1'h0)]};
            end
          reg25 <= reg21[(2'h2):(1'h0)];
          reg26 <= reg25[(3'h7):(3'h7)];
        end
      else
        begin
          reg20 <= (&$signed(wire13[(2'h2):(1'h0)]));
          reg21 <= (wire16[(2'h2):(1'h1)] ?
              reg25[(3'h7):(1'h0)] : ($signed((&$unsigned(reg23))) ?
                  $signed($signed((8'hbf))) : {(reg26 != (wire13 * wire16))}));
          reg22 <= ($signed(($unsigned((wire7 > wire11)) ?
                  {wire8, $signed(wire15)} : $signed((&wire10)))) ?
              reg23 : $signed((($unsigned((8'hbd)) << (wire6 ? wire9 : reg22)) ?
                  ((wire10 - reg25) ^ (wire8 >>> wire12)) : {(-wire7),
                      (&wire14)})));
          reg23 <= $unsigned((^~(~wire11)));
        end
      reg27 <= {(($unsigned((wire9 < wire8)) ?
              wire14 : $signed($unsigned(wire8))) + (((wire11 ?
              reg23 : wire12) == wire16[(1'h1):(1'h1)]) > $unsigned((reg24 ?
              reg25 : reg24))))};
    end
  module28 #() modinst85 (.clk(clk), .wire29(reg22), .wire31(wire17), .y(wire84), .wire32(reg23), .wire30(reg18));
  assign wire86 = (+$signed(wire15[(4'hd):(1'h1)]));
  assign wire87 = ($unsigned((wire86[(1'h1):(1'h1)] ?
                          ((8'ha1) ?
                              wire10[(1'h0):(1'h0)] : (wire86 >> reg20)) : $unsigned($unsigned(reg21)))) ?
                      $unsigned(wire12) : wire7[(3'h4):(1'h1)]);
  assign wire88 = $signed((8'hb2));
  assign wire89 = {{$signed(wire7),
                          ($unsigned(wire88[(1'h0):(1'h0)]) && {wire17})}};
  module90 #() modinst120 (wire119, clk, reg24, wire7, reg21, reg27);
  always
    @(posedge clk) begin
      reg121 <= $signed($unsigned((-$signed($unsigned(reg22)))));
    end
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire94;
  input wire [(5'h13):(1'h0)] wire93;
  input wire signed [(4'he):(1'h0)] wire92;
  input wire [(5'h10):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(2'h3):(1'h0)] wire109;
  wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire95;
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire95,
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
                 (1'h0)};
  assign wire95 = (($unsigned($signed($unsigned(wire92))) ?
                          $unsigned(((!wire91) ?
                              wire94[(3'h4):(1'h0)] : (wire91 ?
                                  (8'hb1) : (8'hbd)))) : wire94[(3'h7):(1'h0)]) ?
                      ($signed(((^~(8'hb2)) - $unsigned(wire93))) <= $signed(($signed(wire91) ?
                          (~&wire93) : wire92[(3'h7):(2'h3)]))) : wire91[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      reg96 <= wire94[(4'h8):(3'h7)];
      if ($signed((($unsigned(wire95) ?
          $signed((^wire94)) : $unsigned((wire94 == wire93))) << $unsigned(wire91))))
        begin
          reg97 <= reg96;
        end
      else
        begin
          reg97 <= ($signed(wire94) < $unsigned(reg97[(4'hc):(4'hb)]));
          if (wire95)
            begin
              reg98 <= $signed($signed($unsigned({(|(8'ha4)), (&reg97)})));
              reg99 <= $unsigned((8'hb1));
              reg100 <= reg98[(4'hc):(3'h6)];
            end
          else
            begin
              reg98 <= (^~reg99[(2'h2):(1'h0)]);
              reg99 <= reg98;
              reg100 <= wire94;
              reg101 <= reg96;
            end
          if (reg101)
            begin
              reg102 <= (8'hb6);
            end
          else
            begin
              reg102 <= (reg96[(4'hb):(3'h4)] ?
                  $unsigned({$signed({reg96,
                          wire94})}) : $signed($unsigned({$signed(reg98),
                      wire92[(1'h0):(1'h0)]})));
            end
          reg103 <= (&($signed(((~|reg100) ? {reg100, wire92} : (^wire95))) ?
              wire93 : $signed((~reg100))));
        end
      reg104 <= (reg101 ?
          ($signed((reg101[(3'h5):(2'h3)] ?
              (reg100 ~^ (8'hb2)) : $signed(reg98))) * wire92[(4'he):(4'hb)]) : wire95);
      reg105 <= $signed(($unsigned(reg96[(2'h3):(1'h0)]) ?
          (reg104 - ($unsigned(wire93) ?
              $unsigned(reg104) : (7'h42))) : reg97[(3'h4):(2'h3)]));
      reg106 <= reg101;
    end
  assign wire107 = (|$unsigned(wire93[(5'h12):(4'hb)]));
  assign wire108 = reg100;
  assign wire109 = wire95;
  assign wire110 = (~|$signed({{wire108[(2'h2):(1'h1)]}}));
  assign wire111 = wire108;
  assign wire112 = $signed(reg100);
  assign wire113 = ($signed(((!$unsigned(reg102)) ?
                           {$unsigned(reg103), (wire107 ^ reg106)} : ((reg100 ?
                                   wire108 : wire109) ?
                               reg102[(3'h6):(3'h4)] : {reg98}))) ?
                       ($signed($signed($signed(reg96))) == wire108[(3'h4):(2'h2)]) : reg99[(1'h1):(1'h1)]);
  assign wire114 = ((({wire110, wire110} ?
                           wire93 : ((wire110 << wire108) >> (~|reg100))) ?
                       reg100[(5'h10):(4'hd)] : reg106) * wire113);
  assign wire115 = (8'h9f);
  assign wire116 = $signed((~^wire95[(4'hc):(3'h7)]));
  assign wire117 = $unsigned(reg99);
  assign wire118 = (($unsigned((~^{wire113, (8'ha9)})) ?
                           reg97[(4'h8):(4'h8)] : wire114) ?
                       $unsigned((~|{$signed(wire108),
                           reg101[(2'h2):(2'h2)]})) : $signed(({(reg102 ?
                               (8'hb3) : wire111),
                           $unsigned(reg100)} + {{(8'hb0), reg99}})));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h268):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire [(3'h4):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire56,
                 wire44,
                 wire43,
                 wire34,
                 wire33,
                 reg77,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = wire32[(4'hc):(1'h0)];
  assign wire34 = wire30;
  always
    @(posedge clk) begin
      reg35 <= (!$unsigned(wire31[(2'h3):(1'h0)]));
      reg36 <= ({(wire34[(1'h1):(1'h0)] ?
              {(wire30 == wire30)} : (~$unsigned(wire29))),
          {($unsigned(wire29) != ((8'hbd) >>> reg35))}} >= (~^$unsigned($signed($unsigned(wire29)))));
      reg37 <= ((8'h9e) ?
          ({(!wire30[(1'h1):(1'h1)]),
              $unsigned((^~reg36))} + wire32[(1'h1):(1'h1)]) : $unsigned($signed((wire29[(1'h1):(1'h1)] ~^ (wire33 ?
              wire30 : wire29)))));
      if (($unsigned($signed((8'hae))) == ($signed(((wire31 ? reg37 : wire29) ?
          $signed(wire31) : (~^wire33))) >>> wire30[(2'h2):(1'h0)])))
        begin
          reg38 <= ({(~&reg37),
              ($unsigned(((7'h43) ? wire31 : reg35)) ?
                  (~|$signed(reg37)) : $signed(wire33[(2'h2):(1'h1)]))} << ((!(reg36 - (&wire30))) & ($signed((-(8'had))) ^ {wire32,
              wire30})));
          reg39 <= ($unsigned($unsigned($unsigned($unsigned(reg35)))) ^ reg37[(2'h2):(2'h2)]);
          reg40 <= (&(-((-$signed((8'hbc))) ?
              wire33 : ($unsigned((8'ha2)) ?
                  wire30[(4'hb):(4'h8)] : (reg37 ? wire29 : reg37)))));
          reg41 <= ($signed({(!(reg35 ?
                  wire34 : wire32))}) >> $signed((~^reg39[(2'h2):(1'h0)])));
          reg42 <= $signed({((reg37[(2'h3):(2'h2)] ?
                  reg35 : wire31[(1'h1):(1'h0)]) >> $unsigned((reg35 ^~ reg38))),
              (($signed((8'hbf)) << reg41) ?
                  ({reg40} > wire34) : {(reg37 - reg41)})});
        end
      else
        begin
          reg38 <= $unsigned(reg39[(1'h1):(1'h0)]);
          reg39 <= $signed($unsigned(($unsigned(wire30[(3'h7):(2'h3)]) ?
              (((8'ha4) * reg35) ?
                  ((8'ha9) ?
                      wire34 : wire33) : ((8'hae) >> reg39)) : {$unsigned(reg37),
                  reg35})));
          reg40 <= $signed(($unsigned((reg41[(4'h8):(3'h5)] ?
              $signed(reg40) : (~wire30))) - reg36[(3'h5):(1'h1)]));
          reg41 <= (^$signed((wire31[(1'h0):(1'h0)] ?
              (-(wire34 ^ reg38)) : wire29[(2'h3):(2'h2)])));
          reg42 <= wire31;
        end
    end
  assign wire43 = reg38[(3'h5):(1'h1)];
  assign wire44 = ($unsigned($signed(((wire33 ?
                      (8'hb1) : wire43) <<< wire31))) - wire34);
  always
    @(posedge clk) begin
      reg45 <= ($signed((wire34 <<< (|$unsigned(reg39)))) == $signed((((~^wire33) <<< wire29[(2'h3):(1'h0)]) ?
          wire31 : $signed(wire44))));
      reg46 <= reg38;
      if (($unsigned($signed(($signed(wire29) >= (^~(7'h40))))) + {wire30[(4'ha):(4'h8)]}))
        begin
          reg47 <= ((8'ha5) ?
              ($unsigned(reg41[(4'h8):(3'h7)]) == ($signed((~^reg45)) ?
                  (&reg45[(1'h0):(1'h0)]) : wire31[(2'h2):(1'h0)])) : reg35[(4'h9):(2'h2)]);
          reg48 <= ({{{wire29[(1'h0):(1'h0)]}}} >= ((^reg39) ?
              $signed(reg37) : $unsigned(((|reg39) >> (wire30 ?
                  reg36 : reg39)))));
          if ((7'h40))
            begin
              reg49 <= (8'ha3);
              reg50 <= ((~|(8'hbe)) ? wire33 : (!(+(!reg40))));
              reg51 <= (+$signed(reg45[(1'h0):(1'h0)]));
              reg52 <= $signed(({($unsigned(reg40) ?
                      (8'hb8) : wire30[(1'h0):(1'h0)])} == $signed(((reg51 ?
                      (7'h40) : wire43) ?
                  wire29[(1'h0):(1'h0)] : (^~reg36)))));
            end
          else
            begin
              reg49 <= ($signed((reg48 ^~ (8'hab))) * {$unsigned(reg52)});
              reg50 <= ((+reg52) - reg52[(3'h7):(1'h1)]);
            end
          reg53 <= {reg38[(3'h5):(2'h3)]};
          reg54 <= reg48[(1'h0):(1'h0)];
        end
      else
        begin
          if ($signed(((|($unsigned(reg50) ~^ $unsigned(reg53))) != reg35[(4'hd):(4'ha)])))
            begin
              reg47 <= (({($signed(reg49) ? $signed(reg39) : (~wire30))} ?
                  (~|wire33[(1'h0):(1'h0)]) : reg41[(2'h2):(1'h1)]) >= $signed(reg47));
            end
          else
            begin
              reg47 <= wire43;
              reg48 <= reg35[(3'h7):(3'h4)];
              reg49 <= ((($unsigned((~|(8'hbc))) <= reg40) + (^~(~reg54))) ?
                  (wire30 ?
                      ((((8'h9d) ? reg52 : reg54) || $unsigned((7'h42))) ?
                          (~(8'hb7)) : ((^reg47) ?
                              (+reg35) : (!reg35))) : reg54) : $unsigned((^~$unsigned((wire32 ?
                      (8'h9e) : (8'had))))));
              reg50 <= $signed(reg51[(4'h9):(1'h0)]);
              reg51 <= $unsigned((reg40[(3'h4):(2'h2)] ?
                  ((8'hb1) + $unsigned(wire44)) : wire34[(1'h1):(1'h1)]));
            end
        end
      reg55 <= $unsigned({$signed(({reg42} ?
              $signed(wire31) : $signed(reg49)))});
    end
  assign wire56 = (8'ha5);
  always
    @(posedge clk) begin
      reg57 <= (&$unsigned(wire32));
      reg58 <= (~&((^reg38[(4'hf):(2'h2)]) > ($signed(((8'haa) <<< reg39)) && (reg47 << {reg45,
          reg47}))));
    end
  always
    @(posedge clk) begin
      reg59 <= reg35[(2'h2):(1'h1)];
      reg60 <= $signed((8'hba));
      reg61 <= (^~(~&$signed($signed((reg53 < (8'hbc))))));
      reg62 <= {wire44[(4'h9):(4'h8)], (^~reg55)};
    end
  always
    @(posedge clk) begin
      reg63 <= (((+reg59[(1'h0):(1'h0)]) != {($unsigned(reg55) >>> reg42)}) >= reg46);
      reg64 <= (~&(^~($signed(reg40[(4'hc):(1'h1)]) ^~ $unsigned((^~reg53)))));
      reg65 <= reg61[(2'h3):(2'h3)];
      reg66 <= $unsigned(wire30[(4'h8):(2'h2)]);
      if ($unsigned($signed($unsigned($unsigned((reg35 >>> reg42))))))
        begin
          reg67 <= $signed((+$unsigned($signed((|reg62)))));
          reg68 <= $unsigned((($signed(reg54) - {reg51}) ?
              reg64[(4'hf):(2'h3)] : $signed(($signed(reg39) ?
                  (reg40 <<< reg59) : (-reg58)))));
          reg69 <= reg66[(2'h2):(1'h0)];
        end
      else
        begin
          reg67 <= $signed(reg62[(5'h11):(5'h10)]);
          reg68 <= $unsigned($unsigned((+(reg40 ?
              reg59[(3'h5):(2'h3)] : wire31))));
          reg69 <= ($signed(($unsigned(wire56[(4'h8):(1'h0)]) ?
                  (+(reg58 ? reg60 : wire43)) : ((reg53 ?
                      reg61 : wire34) == (~reg35)))) ?
              wire33 : $unsigned($unsigned($signed(((8'ha7) ?
                  reg39 : (8'h9e))))));
          if (reg36)
            begin
              reg70 <= reg47;
              reg71 <= (^(&(^~(~&reg59))));
              reg72 <= $signed({wire34[(2'h2):(2'h2)]});
              reg73 <= ((reg61[(2'h3):(1'h1)] ^~ (reg66 ?
                      wire30[(2'h2):(1'h0)] : $signed(reg48[(5'h11):(2'h3)]))) ?
                  reg48[(1'h0):(1'h0)] : $signed(reg55[(2'h3):(1'h1)]));
              reg74 <= $unsigned($signed(wire33));
            end
          else
            begin
              reg70 <= reg73[(3'h5):(1'h0)];
              reg71 <= $signed($signed(reg67[(4'h9):(4'h9)]));
              reg72 <= ((&(7'h41)) ?
                  reg68 : (($signed(reg40[(5'h10):(2'h2)]) & reg51) != reg42[(4'h9):(2'h2)]));
              reg73 <= $signed(reg47[(2'h3):(1'h1)]);
              reg74 <= reg72;
            end
          reg75 <= ($signed(reg60[(1'h0):(1'h0)]) < $signed((($signed((8'haf)) <<< (reg59 ?
                  reg61 : reg59)) ?
              (wire43 << (reg36 - reg47)) : $signed($unsigned(reg40)))));
        end
    end
  always
    @(posedge clk) begin
      reg76 <= (^~$unsigned({(reg70[(4'h8):(3'h5)] <= (~^wire34))}));
      reg77 <= ($signed(wire29[(3'h4):(1'h1)]) ?
          (reg60 ? reg50 : wire43[(4'h9):(3'h6)]) : reg38[(4'h8):(1'h1)]);
    end
  assign wire78 = (^~wire34);
  assign wire79 = $unsigned((($unsigned(reg67) ?
                          $signed((wire78 ?
                              wire44 : wire56)) : reg69[(5'h10):(2'h3)]) ?
                      (({(7'h41)} | {reg40, reg52}) ?
                          $signed((reg37 ? reg76 : reg49)) : ({wire30,
                              reg62} + (8'haa))) : (~(wire30 ?
                          (^reg74) : reg72[(4'h9):(4'h9)]))));
  assign wire80 = {$unsigned(reg63[(3'h5):(2'h3)]),
                      (($signed((reg55 << reg51)) ?
                          ($unsigned(reg72) == (reg40 >>> reg53)) : (8'h9c)) - reg61)};
  assign wire81 = ($signed(reg49[(4'h8):(3'h7)]) ?
                      {reg69[(5'h10):(4'h9)]} : reg67[(3'h4):(1'h0)]);
  assign wire82 = reg48;
  assign wire83 = {$unsigned(wire80[(3'h5):(3'h5)])};
endmodule

module module138
#(parameter param193 = ((((-((8'hb6) < (8'ha1))) ? ({(8'hbd)} >= ((8'hae) * (8'h9f))) : ((!(8'hab)) <<< ((8'hbc) ? (8'hb4) : (7'h42)))) <= (~^(((8'h9f) | (8'hba)) ? ((7'h41) ? (8'hbe) : (8'hb7)) : ((8'hac) ? (8'ha2) : (8'h9f))))) ? ({((!(7'h41)) ? ((8'haa) ? (8'haf) : (8'h9f)) : ((8'ha3) ? (8'hb0) : (8'hab))), {((7'h40) < (8'hb5))}} ? ((((8'had) ? (8'ha1) : (8'ha9)) < (|(8'ha6))) ? ((|(8'ha2)) && {(8'hb7)}) : ((|(8'hab)) || ((8'hb8) ? (7'h42) : (8'hba)))) : ((((8'ha1) ? (8'ha6) : (8'haf)) ? ((8'haa) ? (8'ha3) : (8'h9f)) : ((8'h9d) >>> (8'hb0))) ? {((8'hb9) ? (7'h41) : (8'h9e)), ((8'h9c) ? (8'hba) : (8'haa))} : (((8'hb3) ? (8'hbd) : (7'h40)) ? {(8'h9f), (8'hb9)} : {(8'hb5), (8'h9f)}))) : {((^~((8'hb0) ? (8'ha4) : (8'hb6))) ? (((8'h9e) ? (8'ha6) : (7'h44)) ? (~|(8'ha1)) : (8'hbd)) : ({(8'ha7), (8'hbd)} ? (|(8'haa)) : ((8'ha4) > (8'hb9))))}), 
parameter param194 = param193)
(y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h28c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire142;
  input wire [(5'h10):(1'h0)] wire141;
  input wire signed [(5'h11):(1'h0)] wire140;
  input wire [(5'h12):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire192;
  wire [(2'h2):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire185;
  wire [(5'h15):(1'h0)] wire184;
  wire [(4'hf):(1'h0)] wire183;
  wire signed [(3'h6):(1'h0)] wire182;
  wire signed [(4'hd):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire144;
  wire [(5'h12):(1'h0)] wire143;
  reg [(4'hf):(1'h0)] reg191 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg190 = (1'h0);
  reg [(5'h10):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg181 = (1'h0);
  reg [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg179 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg176 = (1'h0);
  reg [(3'h7):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg169 = (1'h0);
  reg [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(5'h15):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  assign y = {wire192,
                 wire189,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire145,
                 wire144,
                 wire143,
                 reg191,
                 reg190,
                 reg188,
                 reg187,
                 reg186,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire143 = (wire141[(3'h6):(2'h2)] + (~|((8'hbc) ?
                       wire140[(3'h5):(2'h3)] : $unsigned(wire142))));
  assign wire144 = (~^$signed((~|wire141)));
  assign wire145 = ((($signed($unsigned((7'h40))) ^~ $unsigned(wire141[(4'hc):(2'h2)])) <<< wire141) << $signed($unsigned({(wire141 ?
                           wire144 : wire143)})));
  always
    @(posedge clk) begin
      reg146 <= wire141[(2'h3):(1'h0)];
      if (wire143)
        begin
          reg147 <= ($signed((wire142[(5'h10):(3'h7)] >= $signed((wire143 ?
                  wire140 : wire142)))) ?
              $unsigned($signed(({(8'hb5)} ?
                  (7'h41) : (wire144 || wire142)))) : {wire139});
          if (((^$unsigned({wire144})) >>> (^~$signed(((wire140 ~^ reg146) >>> reg146[(2'h2):(1'h0)])))))
            begin
              reg148 <= (reg146 ? (8'hb8) : wire141);
              reg149 <= (reg147 <= $unsigned(({wire142[(2'h2):(1'h1)],
                      $signed(wire142)} ?
                  (reg148[(4'hc):(3'h5)] ? wire144 : {wire144}) : (-(wire144 ?
                      wire145 : reg148)))));
              reg150 <= $unsigned((((-$unsigned(wire141)) || reg147) <<< $unsigned({(wire141 >= wire142)})));
              reg151 <= ($signed(({((8'hac) ? wire141 : wire141),
                      $signed(reg150)} ?
                  {$signed(wire139)} : (reg147 ?
                      $unsigned(wire145) : $unsigned(reg147)))) <= ((+((reg150 ?
                      wire141 : wire144) ^~ (wire142 ? wire142 : wire140))) ?
                  ({{wire143, reg149}} ?
                      wire145[(2'h3):(1'h0)] : ({(8'hb3),
                          reg150} || $signed(wire139))) : ($unsigned($signed(reg148)) > (~^wire143[(4'hc):(4'h8)]))));
            end
          else
            begin
              reg148 <= ($unsigned(((~|$signed(wire140)) ?
                      ((reg147 << reg147) & wire142) : (~|reg151[(5'h14):(3'h6)]))) ?
                  $signed($unsigned($signed(reg148[(3'h4):(2'h2)]))) : ({$unsigned(wire143[(5'h10):(5'h10)]),
                      ($signed(wire145) ?
                          wire145[(3'h4):(1'h1)] : ((8'had) ?
                              wire139 : wire139))} <= ((+$signed(wire143)) | reg148[(5'h11):(5'h11)])));
              reg149 <= ((~&wire141) ?
                  (reg150 >>> $signed($signed((wire145 && (8'hb8))))) : (8'hbc));
              reg150 <= (|((reg147[(2'h2):(1'h0)] ?
                      $signed($signed(wire139)) : wire142) ?
                  (($unsigned(wire141) ?
                          (reg148 - reg149) : $unsigned(wire143)) ?
                      wire141[(4'he):(2'h2)] : reg151) : {($unsigned((8'haf)) ?
                          (reg151 ? reg151 : reg146) : $signed((8'h9e)))}));
            end
        end
      else
        begin
          if (wire144[(2'h3):(2'h2)])
            begin
              reg147 <= (reg148[(4'hc):(4'h9)] || {$signed((8'ha0)),
                  $unsigned({reg147})});
            end
          else
            begin
              reg147 <= (wire143[(1'h1):(1'h0)] ?
                  $unsigned(({(8'hb6)} ?
                      {wire141} : $unsigned((|wire141)))) : {(reg147[(1'h1):(1'h1)] ?
                          (reg149[(4'ha):(1'h0)] ?
                              (-(8'hb1)) : wire140) : wire141),
                      $unsigned((&(reg151 ? (8'h9f) : reg148)))});
              reg148 <= $signed({$signed($unsigned((^~wire143)))});
              reg149 <= (reg149 > {reg149[(1'h1):(1'h0)]});
              reg150 <= ((wire139 ?
                  reg146[(4'h8):(3'h5)] : $unsigned($signed((reg149 ?
                      wire145 : reg147)))) == (reg146[(1'h0):(1'h0)] ?
                  $unsigned(($unsigned(reg148) ? reg146 : reg149)) : reg146));
              reg151 <= $unsigned({(wire144[(3'h4):(1'h0)] ?
                      ((~^reg148) ~^ $signed(reg146)) : $signed((reg146 && reg150))),
                  {$signed((wire143 >> (8'h9d))),
                      ((~wire144) ? wire145 : {(8'hab), wire143})}});
            end
          reg152 <= reg146;
        end
      reg153 <= wire144[(4'ha):(2'h2)];
      if ((8'hbe))
        begin
          reg154 <= {((~^($unsigned(reg150) != $unsigned(reg148))) ?
                  {($signed(reg147) >= (reg147 <<< wire143)),
                      ((reg153 <<< reg146) == wire145)} : reg146)};
          reg155 <= ($signed($unsigned($unsigned(((8'ha1) & reg152)))) > $unsigned($signed($signed((reg151 ^ wire140)))));
          reg156 <= (8'hb7);
          if (($signed(reg150) << $unsigned($unsigned($unsigned(((7'h41) ~^ reg148))))))
            begin
              reg157 <= wire141;
            end
          else
            begin
              reg157 <= wire140;
              reg158 <= (&(~reg149));
              reg159 <= ((+(8'hac)) ?
                  reg156[(3'h5):(2'h2)] : $unsigned($unsigned($unsigned({reg148}))));
              reg160 <= $unsigned(reg156);
              reg161 <= ($unsigned((~($unsigned(reg159) == $signed((7'h42))))) ?
                  $unsigned(wire140) : reg160[(3'h4):(1'h0)]);
            end
        end
      else
        begin
          reg154 <= $unsigned({$signed(($unsigned(reg151) ^~ (-reg161)))});
        end
      reg162 <= reg148;
    end
  always
    @(posedge clk) begin
      reg163 <= ((reg153 ? (^(|(8'ha4))) : (~&(-$signed(reg158)))) ?
          (~&({(reg158 ? wire144 : reg157),
              $signed(wire144)} && {wire144[(4'hc):(2'h2)]})) : reg159);
      if ((~|wire139))
        begin
          reg164 <= ((^~(8'hb0)) <= (~&($unsigned((reg158 ?
              reg147 : reg154)) ^ ((^~(8'hb1)) ?
              {(8'hae), reg152} : (~&reg154)))));
          reg165 <= (-(^~(|reg146)));
        end
      else
        begin
          reg164 <= reg146;
          reg165 <= reg147[(3'h4):(1'h1)];
          reg166 <= $unsigned((!$signed($signed(wire140[(4'hb):(4'h8)]))));
          reg167 <= {reg156[(4'h9):(3'h4)]};
        end
      reg168 <= (^~$signed((reg147 + reg151)));
      reg169 <= reg158[(4'hc):(3'h6)];
      if (({($unsigned(reg168) ?
              $signed((reg155 <<< reg168)) : (~&(wire143 ^~ reg158))),
          reg153[(2'h2):(1'h1)]} >>> (&{{$signed((8'ha7))}})))
        begin
          reg170 <= {reg162};
        end
      else
        begin
          reg170 <= (reg154[(4'hf):(4'h8)] << wire139);
          if (($signed(reg150[(1'h0):(1'h0)]) ?
              (7'h43) : ((~&((^reg155) ?
                      (reg161 ? reg164 : reg146) : {wire139})) ?
                  wire145 : $signed(((~reg159) ?
                      $signed((8'ha5)) : wire143[(3'h7):(3'h6)])))))
            begin
              reg171 <= {wire143[(5'h10):(4'ha)], reg153};
              reg172 <= $unsigned((((^$signed(reg162)) ^ (reg155 ?
                      wire140 : (reg155 ? reg164 : reg170))) ?
                  ((&(reg164 >>> wire141)) ?
                      $unsigned((wire143 ? reg156 : reg156)) : (&{reg161,
                          reg158})) : $signed($signed((~^reg159)))));
            end
          else
            begin
              reg171 <= $signed(wire141[(4'hf):(3'h7)]);
              reg172 <= (reg165[(2'h3):(2'h2)] > $unsigned($signed((~^(~reg164)))));
              reg173 <= $unsigned({reg154});
              reg174 <= {(8'h9c)};
            end
          reg175 <= (+reg146);
          reg176 <= (($unsigned(($signed(reg161) ?
                  $unsigned(reg171) : wire139[(4'hf):(2'h2)])) ?
              ((|(reg158 ?
                  wire142 : reg162)) < (reg160[(3'h7):(3'h6)] >= (!reg165))) : ((~^(reg174 << reg157)) ?
                  $signed($unsigned(reg173)) : ((8'h9f) <= $signed((8'hbb))))) >> $unsigned((+(~^(wire143 ?
              reg157 : (8'hb8))))));
          if ((!$signed({reg166[(2'h3):(1'h0)]})))
            begin
              reg177 <= (&wire144);
            end
          else
            begin
              reg177 <= ($signed(($signed($signed((8'hae))) * reg152)) || reg166[(4'hf):(4'hc)]);
              reg178 <= $signed($signed({(!(reg153 ? reg173 : reg170))}));
              reg179 <= reg165[(3'h6):(3'h5)];
              reg180 <= wire143[(4'hc):(2'h2)];
              reg181 <= ((~|{(reg164 ? (^reg167) : reg151[(2'h3):(1'h1)])}) ?
                  ($unsigned($unsigned(reg164)) << reg175[(2'h3):(1'h0)]) : reg178[(3'h4):(1'h0)]);
            end
        end
    end
  assign wire182 = reg161[(2'h2):(1'h0)];
  assign wire183 = $unsigned((((reg180 ?
                               (reg178 ?
                                   (8'ha9) : reg163) : $unsigned((8'hb0))) ?
                           (8'ha4) : ((!reg154) ? (~^reg154) : {reg177})) ?
                       ($signed(wire142[(1'h0):(1'h0)]) ?
                           (wire145[(4'h8):(1'h1)] < reg176) : {$unsigned(reg167),
                               wire144[(4'he):(3'h6)]}) : ($unsigned(((8'ha3) ?
                               reg177 : reg148)) ?
                           ({(8'hb1),
                               reg172} ^~ (^~(8'h9f))) : (~^(reg153 & reg167)))));
  assign wire184 = $unsigned((~|($signed($unsigned(wire140)) ?
                       ((-reg158) ?
                           $signed((8'hae)) : {reg161}) : ((8'hae) - (wire145 == reg155)))));
  assign wire185 = (wire182[(3'h5):(2'h3)] == wire140);
  always
    @(posedge clk) begin
      reg186 <= ($unsigned($signed((reg150 || reg153[(4'ha):(1'h1)]))) ~^ reg149[(2'h3):(1'h0)]);
      reg187 <= {(reg179 ^~ reg157), reg149};
      reg188 <= wire140;
    end
  assign wire189 = (~((8'hac) ?
                       $signed((7'h44)) : $unsigned(reg164[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg190 <= ($unsigned($unsigned(reg148)) ?
          (-{reg146[(2'h3):(1'h1)],
              {$signed(reg173),
                  (8'h9f)}}) : {$unsigned((wire184[(4'he):(4'hb)] >= ((7'h43) || (8'haa))))});
      reg191 <= $unsigned($unsigned(reg155[(3'h6):(3'h5)]));
    end
  assign wire192 = reg153;
endmodule
