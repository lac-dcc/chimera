module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire208;
  wire [(5'h14):(1'h0)] wire207;
  wire signed [(4'he):(1'h0)] wire206;
  wire [(4'hb):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire199;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(2'h3):(1'h0)] wire202;
  wire signed [(5'h14):(1'h0)] wire203;
  wire signed [(5'h15):(1'h0)] wire204;
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire123,
                 wire23,
                 wire22,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire125,
                 wire199,
                 wire201,
                 wire202,
                 wire203,
                 wire204,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = (^wire3[(4'h8):(1'h1)]);
  assign wire5 = {wire4[(3'h5):(1'h1)]};
  assign wire6 = (^~$unsigned(($unsigned($unsigned(wire1)) ?
                     $signed($unsigned((8'hb6))) : wire3[(3'h5):(1'h0)])));
  assign wire7 = $unsigned((wire4 >>> wire1[(3'h4):(1'h0)]));
  assign wire8 = $unsigned($unsigned($unsigned((8'ha6))));
  assign wire9 = $unsigned((wire3 >> wire2));
  assign wire10 = (-(|{wire7[(1'h1):(1'h0)]}));
  assign wire11 = wire2[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if ((wire8 || wire2[(3'h7):(1'h0)]))
        begin
          reg12 <= wire1;
        end
      else
        begin
          if ($signed(wire1))
            begin
              reg12 <= wire7;
              reg13 <= {(wire7[(2'h3):(2'h3)] ?
                      $unsigned((~&(wire2 ? (7'h44) : reg12))) : wire8)};
              reg14 <= wire3[(3'h6):(3'h6)];
              reg15 <= (($signed(wire2) ?
                  (8'hbd) : ($signed(reg12) ?
                      ($unsigned(wire6) ? (+wire4) : {wire3}) : ((|wire7) ?
                          (wire4 <<< reg14) : $unsigned(wire10)))) - {$signed(reg13)});
            end
          else
            begin
              reg12 <= wire7;
              reg13 <= $signed(($signed(wire7) << $unsigned((wire2[(1'h1):(1'h1)] ?
                  reg15[(5'h12):(3'h5)] : {wire6, wire2}))));
              reg14 <= wire0[(2'h2):(1'h1)];
            end
        end
      if (($signed((wire3 ?
          {(wire6 ? wire6 : wire7),
              reg13} : reg12[(4'h9):(3'h5)])) >>> $signed(wire4)))
        begin
          reg16 <= {$signed($signed((~^wire6))),
              ({{wire4, $signed((8'h9d))},
                      ((^(7'h40)) ? $signed(wire11) : wire5[(4'hd):(4'hb)])} ?
                  $unsigned(wire1) : (((wire3 ? wire5 : wire8) ?
                          $unsigned(reg13) : wire11[(1'h1):(1'h0)]) ?
                      $unsigned((~&wire11)) : wire8[(3'h4):(3'h4)]))};
          reg17 <= {wire0[(2'h2):(1'h1)]};
          reg18 <= (!reg17);
        end
      else
        begin
          if (($unsigned((reg15 ?
              $signed(wire7[(2'h3):(1'h0)]) : wire4)) != wire10[(3'h5):(3'h5)]))
            begin
              reg16 <= ((8'hba) ^~ $signed($unsigned(($unsigned(wire4) ?
                  (-wire1) : (wire4 ? reg15 : wire10)))));
              reg17 <= wire7[(1'h0):(1'h0)];
              reg18 <= wire2[(1'h0):(1'h0)];
            end
          else
            begin
              reg16 <= {{$unsigned(reg17)},
                  ((wire9[(4'ha):(4'h8)] ~^ wire2[(2'h2):(1'h1)]) - $unsigned((reg13[(1'h1):(1'h0)] <= (~|wire9))))};
              reg17 <= {wire0, (wire2[(4'h8):(3'h4)] <= (~|(&(|wire10))))};
              reg18 <= (8'hac);
              reg19 <= wire2[(4'h8):(3'h6)];
              reg20 <= {wire9, $unsigned($unsigned((~^{wire11, reg12})))};
            end
          reg21 <= $signed(wire11[(3'h6):(1'h0)]);
        end
    end
  assign wire22 = $unsigned(wire9[(4'hb):(4'h9)]);
  assign wire23 = wire5;
  module24 #() modinst124 (wire123, clk, reg20, reg19, wire1, wire4, wire2);
  assign wire125 = (wire1[(4'ha):(3'h7)] ? wire9 : (+{$unsigned((~reg17))}));
  module126 #() modinst200 (.wire129(wire22), .y(wire199), .clk(clk), .wire128(wire123), .wire127(wire1), .wire130(wire8));
  assign wire201 = (((~^wire9[(4'ha):(3'h6)]) <<< ((~(wire0 ?
                       wire1 : wire10)) || $unsigned($signed(reg19)))) > {(wire11 == ($unsigned(wire9) | $unsigned((8'ha4))))});
  assign wire202 = $signed($signed((~{(~|wire199), wire2[(3'h5):(2'h2)]})));
  assign wire203 = $unsigned($unsigned(((~|(reg12 ?
                       wire202 : (8'hbf))) ~^ (8'hbc))));
  module94 #() modinst205 (.y(wire204), .wire97(reg18), .clk(clk), .wire98(reg15), .wire95(wire0), .wire96(reg12));
  assign wire206 = wire6[(2'h3):(1'h1)];
  assign wire207 = (^(((wire7 <<< (wire0 ? wire22 : wire9)) ? reg16 : wire206) ?
                       wire5[(4'h8):(4'h8)] : ((((8'hab) ?
                               wire204 : wire7) <= (~|reg20)) ?
                           wire202[(1'h1):(1'h0)] : (|$unsigned(wire7)))));
  assign wire208 = wire4;
endmodule

module module126  (y, clk, wire127, wire128, wire129, wire130);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire127;
  input wire signed [(4'hb):(1'h0)] wire128;
  input wire [(3'h4):(1'h0)] wire129;
  input wire signed [(3'h5):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(3'h4):(1'h0)] wire197;
  assign y = {wire131, wire132, wire133, wire197, (1'h0)};
  assign wire131 = (wire130 > (^{(wire129 >> (8'ha0)), (-wire130)}));
  assign wire132 = wire131[(1'h0):(1'h0)];
  assign wire133 = wire127[(3'h6):(2'h3)];
  module134 #() modinst198 (.wire138(wire130), .y(wire197), .wire137(wire133), .wire135(wire132), .clk(clk), .wire136(wire131), .wire139(wire128));
endmodule

module module24
#(parameter param122 = (~&{({{(8'hac), (8'ha8)}, ((7'h42) <= (8'ha1))} != (((8'haa) <= (7'h44)) && (-(8'hab))))}))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(5'h12):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(4'hb):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire115,
                 wire92,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  assign wire30 = $signed(($signed((wire26[(3'h4):(3'h4)] ?
                      $signed(wire28) : (wire26 ?
                          wire29 : wire29))) >= (8'h9c)));
  assign wire31 = wire25[(1'h0):(1'h0)];
  assign wire32 = wire31;
  assign wire33 = {$unsigned($unsigned(wire25))};
  assign wire34 = ($signed(((|{wire33}) ?
                      {(wire28 ?
                              wire26 : wire30)} : $signed($unsigned(wire32)))) && (wire30 ?
                      {wire26,
                          wire26} : (($signed(wire27) >> $signed(wire29)) < ($unsigned(wire32) < {wire33}))));
  module35 #() modinst93 (.wire36(wire28), .wire39(wire32), .clk(clk), .wire37(wire34), .wire38(wire33), .y(wire92));
  module94 #() modinst116 (wire115, clk, wire26, wire32, wire33, wire27);
  assign wire117 = (8'hbb);
  assign wire118 = $signed((wire117[(3'h6):(1'h1)] ^ wire28[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg119 <= (~|wire34[(2'h3):(2'h2)]);
      reg120 <= $unsigned(wire92);
      reg121 <= ((~((8'hbc) ?
              ((wire26 > wire31) ?
                  $signed((8'hb4)) : wire117[(4'he):(2'h3)]) : $signed(wire28[(4'hc):(3'h5)]))) ?
          $signed((($signed(wire28) ?
              $unsigned(wire33) : ((8'ha3) ~^ wire32)) <<< reg119[(4'h9):(3'h7)])) : wire31);
    end
endmodule

module module94
#(parameter param114 = (&(~(+(((8'ha5) ? (8'hb1) : (8'hbc)) ? ((8'hb5) ? (8'ha2) : (8'hae)) : (+(8'h9e)))))))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire98;
  input wire [(3'h6):(1'h0)] wire97;
  input wire [(2'h3):(1'h0)] wire96;
  input wire signed [(2'h3):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(4'ha):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire99 = (^~{(!wire95), (~$signed($signed((8'hb6))))});
  assign wire100 = $signed((wire97 ?
                       $unsigned((8'h9f)) : (~|({wire97,
                           wire98} >> {wire98}))));
  assign wire101 = wire100;
  assign wire102 = (^wire96);
  assign wire103 = {wire101};
  always
    @(posedge clk) begin
      reg104 <= (-$signed(($signed(wire101[(5'h11):(4'hd)]) << wire97[(2'h3):(1'h0)])));
      reg105 <= reg104[(3'h7):(3'h7)];
    end
  assign wire106 = $unsigned(wire95);
  assign wire107 = (($signed(((wire96 ?
                           wire101 : wire103) | $signed(wire106))) ?
                       $unsigned((!$signed(wire98))) : (($signed(wire99) > {(8'hbe)}) ?
                           ((8'hb3) ?
                               (wire100 ?
                                   wire101 : (8'ha8)) : $signed(wire106)) : $unsigned((+wire95)))) ^~ $signed({{$signed(wire95),
                           (wire99 ? wire95 : reg104)}}));
  assign wire108 = ($unsigned($unsigned({{(8'hbb)}})) ?
                       (((-$unsigned(wire100)) ?
                               (^{(8'had)}) : {$unsigned((8'hb7)),
                                   $unsigned(wire103)}) ?
                           $signed(((wire100 ? wire98 : wire96) - ((8'hba) ?
                               wire98 : reg104))) : {(!(wire98 ?
                                   (8'ha9) : (8'h9f))),
                               $signed((!wire99))}) : $signed(wire95));
  assign wire109 = $unsigned((wire101 >= $signed($unsigned(wire101[(4'hb):(3'h5)]))));
  assign wire110 = wire95[(2'h3):(2'h3)];
  assign wire111 = $unsigned($unsigned((wire96[(2'h3):(1'h0)] ?
                       ((wire106 ? (8'hab) : wire95) ?
                           (reg105 ? wire108 : wire99) : (wire108 ?
                               wire102 : wire100)) : $signed($signed(wire110)))));
  assign wire112 = (-$signed((((wire110 || reg104) * (~wire109)) ?
                       reg104 : (8'ha4))));
  assign wire113 = (8'h9f);
endmodule

module module35
#(parameter param91 = {{((((8'hb8) ? (8'hac) : (7'h40)) ? ((8'haf) ? (8'hb2) : (7'h41)) : ((8'ha4) ? (8'h9e) : (8'hb3))) * ((8'hb5) ? (~&(8'hb4)) : ((8'hb7) * (8'ha7))))}, (+{{{(8'hbf), (8'ha4)}}})})
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h224):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire signed [(3'h6):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  assign y = {wire90,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
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
                 reg56,
                 reg55,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= ($signed(wire36) - (~&(((wire38 ^~ wire38) ?
          $unsigned((8'hbb)) : (8'ha9)) <= (wire38 ?
          $signed(wire36) : $unsigned(wire38)))));
      reg41 <= wire36;
      reg42 <= (wire38 ?
          $unsigned(wire36[(5'h12):(4'hd)]) : wire39[(5'h10):(2'h2)]);
      reg43 <= reg41;
    end
  assign wire44 = $signed(($signed(($unsigned(reg41) ?
                          reg43[(4'hb):(2'h2)] : $signed(wire36))) ?
                      $signed($unsigned((~|(8'hb8)))) : ($signed($unsigned(wire36)) ?
                          $signed($unsigned(wire37)) : wire39[(4'ha):(1'h1)])));
  assign wire45 = {(wire44[(1'h0):(1'h0)] && ($signed((wire38 >>> wire36)) ?
                          ($unsigned(wire36) ?
                              (wire38 ?
                                  wire39 : wire38) : $signed(reg42)) : $unsigned((wire39 ^~ reg41)))),
                      $signed((8'hae))};
  assign wire46 = {wire39, reg40};
  assign wire47 = (wire46 > $unsigned($unsigned($unsigned($unsigned(wire44)))));
  assign wire48 = {$signed(((!$signed(wire45)) ?
                          wire38[(1'h1):(1'h1)] : $unsigned((+wire39)))),
                      $unsigned((wire45[(5'h10):(3'h5)] ?
                          (!$signed(wire37)) : (!$signed(wire46))))};
  assign wire49 = $unsigned(reg40[(1'h0):(1'h0)]);
  assign wire50 = (!{$signed(($signed(wire45) ? (~wire49) : $signed(wire39)))});
  assign wire51 = $unsigned((wire45[(1'h1):(1'h1)] >= (~&(+(wire47 ?
                      reg40 : wire50)))));
  assign wire52 = $signed(wire44[(2'h3):(2'h3)]);
  assign wire53 = wire37[(1'h1):(1'h0)];
  assign wire54 = (~|(~|(wire44 ?
                      (wire51[(3'h6):(1'h1)] ^ {wire53}) : $unsigned(reg43))));
  always
    @(posedge clk) begin
      reg55 <= ($signed(wire36[(5'h12):(3'h4)]) ?
          (((wire52 && $unsigned((8'ha6))) ?
              ((~wire39) ?
                  (wire50 << wire47) : wire45) : wire54) >>> ({(~wire38)} ?
              (wire54[(3'h7):(1'h0)] ?
                  {wire51, reg42} : (~(8'hb9))) : ((wire52 ? (7'h44) : wire51) ?
                  wire37 : $unsigned(wire36)))) : (~&wire50));
      reg56 <= $signed(reg55);
    end
  assign wire57 = (8'h9e);
  assign wire58 = (((($unsigned(wire46) || $signed(reg56)) << ($signed(wire37) - (+wire54))) ?
                      (&$unsigned((wire48 >= (8'haf)))) : ($unsigned(((8'hbb) + (7'h41))) ^~ ($unsigned(wire39) ?
                          $signed(wire39) : {wire36}))) <<< {$unsigned(wire36),
                      $unsigned({wire38, (^~wire57)})});
  assign wire59 = $signed($unsigned((|$signed((~|reg42)))));
  assign wire60 = wire57[(2'h2):(1'h0)];
  assign wire61 = (+$unsigned(wire52));
  assign wire62 = (wire44[(2'h3):(2'h3)] ^~ wire51[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      reg63 <= {$signed($unsigned((|$signed(wire51)))),
          $signed(({(wire38 ? wire53 : wire54), (wire45 ? reg42 : wire39)} ?
              wire58[(2'h3):(1'h1)] : ((wire38 ? wire48 : wire57) ?
                  wire38[(2'h3):(1'h1)] : (reg56 ^ (7'h42)))))};
      if (wire62)
        begin
          reg64 <= (8'ha8);
        end
      else
        begin
          reg64 <= (-$unsigned((|(|$unsigned(wire58)))));
          reg65 <= (~^{wire49[(1'h1):(1'h1)],
              (reg40[(1'h1):(1'h1)] ?
                  ((-wire46) * $signed(wire45)) : $unsigned((^~reg40)))});
          reg66 <= $signed((wire39 > (8'hbb)));
        end
      if (($unsigned(wire61) | $unsigned((!wire51[(3'h4):(1'h1)]))))
        begin
          reg67 <= {$unsigned((~^reg40)),
              {((((7'h40) & reg64) ? (wire57 < reg56) : wire44) ?
                      $signed((7'h44)) : wire59[(4'h8):(2'h3)])}};
          reg68 <= wire52;
          if ($signed((wire36[(5'h11):(5'h11)] >> (reg63 & (~(wire61 ?
              reg43 : reg43))))))
            begin
              reg69 <= wire46[(1'h0):(1'h0)];
            end
          else
            begin
              reg69 <= $signed((^~{{((8'hb5) ? wire52 : wire58)}}));
            end
          if (wire58[(2'h2):(2'h2)])
            begin
              reg70 <= (reg63 ?
                  $signed($signed((|wire50[(3'h7):(1'h1)]))) : wire38);
              reg71 <= reg43[(4'hd):(2'h2)];
              reg72 <= (-$unsigned(wire58));
              reg73 <= reg40;
            end
          else
            begin
              reg70 <= ($signed($unsigned(wire58[(3'h7):(3'h4)])) ~^ {wire37[(1'h0):(1'h0)],
                  reg71});
              reg71 <= ((wire62 * reg65) | (!$signed({wire49})));
              reg72 <= $signed(reg70[(2'h2):(1'h0)]);
            end
          if ($signed((8'hac)))
            begin
              reg74 <= reg71[(4'hc):(2'h3)];
              reg75 <= $unsigned(wire53);
              reg76 <= (-(~&({reg56, $signed(wire50)} == ((reg43 ?
                      (7'h44) : (8'h9c)) ?
                  wire53 : (|(8'hb9))))));
              reg77 <= {((8'ha5) ^~ reg72[(1'h0):(1'h0)]),
                  reg55[(2'h3):(1'h1)]};
            end
          else
            begin
              reg74 <= (&$signed(wire49));
              reg75 <= ($unsigned($unsigned((wire39[(4'hc):(3'h7)] ?
                  (reg72 ^ (7'h44)) : $signed((8'ha7))))) + ($unsigned((((8'hab) & wire51) & (!reg73))) ?
                  (8'hb3) : {wire60[(1'h1):(1'h0)]}));
              reg76 <= ($unsigned(($unsigned({wire38, (8'ha3)}) ?
                  $unsigned($unsigned(reg75)) : (wire39 != (reg41 ^ wire53)))) << {wire62[(1'h0):(1'h0)]});
              reg77 <= (+$unsigned($unsigned(wire52)));
              reg78 <= (((reg63[(3'h4):(2'h2)] | $unsigned((~&wire37))) ?
                      (wire38[(3'h5):(3'h4)] ?
                          ((reg63 >= (8'h9d)) ^ reg41) : {wire58}) : $unsigned($unsigned((+(8'haf))))) ?
                  ((wire61[(2'h2):(2'h2)] >= wire46) - wire61[(3'h7):(2'h3)]) : reg70[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          if (wire49)
            begin
              reg67 <= (wire47 >>> (~^$unsigned({(|reg75),
                  (wire49 ? wire38 : wire36)})));
              reg68 <= $unsigned((&(^$unsigned((~|reg71)))));
            end
          else
            begin
              reg67 <= (wire39 ?
                  wire51[(1'h0):(1'h0)] : $unsigned({$signed((wire60 ?
                          reg64 : wire54))}));
              reg68 <= reg43;
              reg69 <= wire47;
              reg70 <= $unsigned(($unsigned({reg67,
                      (wire61 ? reg64 : wire54)}) ?
                  reg68[(1'h0):(1'h0)] : $unsigned($signed((~reg68)))));
            end
          if ($signed($unsigned(reg78)))
            begin
              reg71 <= $unsigned(reg66);
              reg72 <= reg67;
            end
          else
            begin
              reg71 <= reg74;
              reg72 <= $unsigned(wire48[(3'h5):(1'h1)]);
              reg73 <= ((wire45[(3'h5):(2'h2)] ^~ $unsigned({(wire37 ?
                          reg55 : wire36),
                      $signed(wire60)})) ?
                  $unsigned(wire47[(3'h4):(1'h1)]) : reg71);
            end
          reg74 <= $signed((reg72 >= $unsigned(($unsigned(reg65) ?
              (reg43 ? (8'had) : wire58) : (reg76 ? reg55 : (8'haa))))));
          reg75 <= $unsigned((-$signed($signed($unsigned(wire48)))));
          reg76 <= $signed(reg66);
        end
      if (reg75)
        begin
          reg79 <= (-(-reg42));
          if (reg64)
            begin
              reg80 <= wire49;
              reg81 <= (({({reg65, reg68} ?
                      (|wire48) : (&wire37))} ^ (reg42[(1'h1):(1'h1)] ?
                  wire49[(3'h6):(2'h2)] : $unsigned(((8'hb8) ^~ (8'hb7))))) >> (({(reg77 ^~ reg78)} > $unsigned(((8'hb5) ?
                  reg74 : wire58))) * reg56[(3'h5):(2'h3)]));
            end
          else
            begin
              reg80 <= $unsigned((($signed($unsigned((8'ha8))) <= ({wire44,
                      reg71} ^ {wire62})) ?
                  $unsigned(reg40) : reg79[(4'hb):(3'h4)]));
              reg81 <= $unsigned(reg55);
              reg82 <= (reg40 ^~ (^~$unsigned(((reg66 ? wire46 : wire62) ?
                  (reg65 ? reg73 : (8'hb2)) : (reg74 && wire59)))));
              reg83 <= ($signed(($unsigned($signed(wire44)) == ($signed(reg42) ?
                      {(8'ha6), wire45} : reg70[(1'h0):(1'h0)]))) ?
                  (~|((!(^wire39)) ?
                      $signed(wire57) : $signed((8'ha4)))) : {(($signed(reg75) ?
                              $signed((8'hbb)) : wire49[(3'h4):(1'h0)]) ?
                          (reg67 ?
                              (~|reg76) : reg78[(3'h7):(3'h6)]) : $signed(reg79[(1'h0):(1'h0)]))});
            end
        end
      else
        begin
          reg79 <= (~{(({reg55} ^~ ((8'ha7) >>> wire54)) >= wire54),
              wire52[(1'h0):(1'h0)]});
          reg80 <= (^$signed($signed((((8'hbe) ^ reg69) > wire57))));
          reg81 <= wire49[(1'h1):(1'h0)];
          if (($unsigned(((wire62[(3'h4):(2'h2)] || $unsigned(wire50)) ?
                  reg78[(1'h0):(1'h0)] : ($signed(reg82) ?
                      wire54[(1'h0):(1'h0)] : ((8'haf) ? reg80 : reg40)))) ?
              (~|(8'hbb)) : $signed($unsigned({(reg75 <= reg56),
                  $unsigned(reg40)}))))
            begin
              reg82 <= $signed((~&wire60[(1'h1):(1'h0)]));
              reg83 <= (^reg43[(4'h8):(3'h4)]);
              reg84 <= ($signed(wire46) ?
                  (wire58[(4'hc):(4'h9)] >> (wire38 ?
                      reg79[(1'h0):(1'h0)] : (&$signed(wire58)))) : wire37[(1'h0):(1'h0)]);
              reg85 <= $signed($unsigned($signed((~&reg40[(1'h1):(1'h1)]))));
              reg86 <= $unsigned($signed((~^{$signed((8'hb4)), {(8'haa)}})));
            end
          else
            begin
              reg82 <= reg73;
              reg83 <= $unsigned((~$signed((~^(wire38 && wire36)))));
              reg84 <= (8'had);
              reg85 <= $signed($signed(($unsigned((reg67 ? (8'ha5) : wire59)) ?
                  ((reg75 ~^ (8'hba)) ?
                      (^~wire59) : reg68) : (reg56 < reg75[(3'h5):(3'h5)]))));
              reg86 <= ($unsigned($signed($unsigned({wire44, reg78}))) ?
                  $unsigned((-$signed($signed(reg84)))) : $signed(reg79));
            end
        end
      reg87 <= {(8'hb0)};
    end
  always
    @(posedge clk) begin
      reg88 <= ((-reg43[(5'h14):(4'hc)]) ^ wire59);
      reg89 <= $unsigned({reg67[(4'hd):(4'hb)],
          (reg55[(4'hd):(1'h0)] ? (|(|(8'hb0))) : reg76)});
    end
  assign wire90 = ((8'hb2) && $unsigned($signed((~|reg40))));
endmodule

module module134
#(parameter param196 = ((~(^(((8'had) ? (8'ha3) : (8'hae)) ? ((8'hbd) + (8'hb0)) : ((8'hb9) == (8'hab))))) <<< ({((+(8'had)) * (~|(8'hbc)))} <<< ((~&(|(8'ha0))) ? ({(8'hb4), (8'ha1)} >>> ((8'ha1) ^~ (8'hb6))) : {((8'ha9) + (8'hbd))}))))
(y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h283):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire139;
  input wire signed [(3'h5):(1'h0)] wire138;
  input wire [(4'hf):(1'h0)] wire137;
  input wire signed [(4'hb):(1'h0)] wire136;
  input wire signed [(4'ha):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire194;
  wire [(5'h11):(1'h0)] wire187;
  wire signed [(4'he):(1'h0)] wire186;
  wire signed [(4'he):(1'h0)] wire185;
  wire signed [(4'h8):(1'h0)] wire184;
  wire signed [(4'he):(1'h0)] wire179;
  wire [(5'h13):(1'h0)] wire178;
  wire [(3'h6):(1'h0)] wire177;
  wire [(4'ha):(1'h0)] wire176;
  wire [(2'h3):(1'h0)] wire175;
  wire [(2'h3):(1'h0)] wire174;
  wire [(3'h4):(1'h0)] wire173;
  wire [(4'hd):(1'h0)] wire172;
  wire [(3'h5):(1'h0)] wire149;
  wire signed [(4'he):(1'h0)] wire148;
  wire signed [(4'he):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire142;
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(2'h2):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(4'ha):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(4'hc):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(2'h2):(1'h0)] reg140 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire149,
                 wire148,
                 wire147,
                 wire142,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
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
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg141,
                 reg140,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg140 <= wire138[(2'h3):(2'h3)];
      reg141 <= (|((~^wire139) ?
          (reg140[(1'h1):(1'h0)] >= {wire138}) : (((wire135 >> wire135) ?
              reg140 : {wire135}) >> (~&(reg140 == wire136)))));
    end
  assign wire142 = $signed($unsigned($signed(wire135[(4'h8):(3'h6)])));
  always
    @(posedge clk) begin
      if (wire142[(5'h11):(4'hc)])
        begin
          reg143 <= $unsigned(($signed((wire139 || wire142[(4'he):(4'hc)])) ?
              ($signed({wire138}) ?
                  wire136[(3'h4):(2'h2)] : wire135[(1'h1):(1'h0)]) : $unsigned(wire139[(2'h3):(1'h0)])));
          reg144 <= (^~wire137[(3'h6):(3'h6)]);
          reg145 <= wire136[(4'hb):(4'ha)];
          reg146 <= $signed($unsigned((~|$unsigned($signed(reg141)))));
        end
      else
        begin
          if (wire135)
            begin
              reg143 <= {(reg146[(1'h1):(1'h1)] & $signed(reg145[(3'h4):(2'h2)]))};
            end
          else
            begin
              reg143 <= $unsigned(reg146[(4'hb):(4'ha)]);
              reg144 <= $signed((8'hb5));
            end
          reg145 <= wire139;
          reg146 <= reg143;
        end
    end
  assign wire147 = (8'h9e);
  assign wire148 = (((~^$signed(reg143[(4'h8):(2'h3)])) | $signed($signed($unsigned(wire137)))) ?
                       (8'had) : (reg141 & reg143[(3'h6):(2'h3)]));
  assign wire149 = wire137[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      if (wire135[(3'h4):(2'h2)])
        begin
          if ({(~($unsigned((~&reg140)) ^~ reg145[(4'hd):(3'h5)]))})
            begin
              reg150 <= ((($signed($unsigned(reg144)) ?
                      (^~(+wire147)) : ({reg145, wire149} | (reg141 ?
                          (8'hb8) : wire147))) ^ ($unsigned(wire137) ?
                      {$signed((8'hb6)), wire149} : (|(wire139 & reg146)))) ?
                  (!(~reg143[(3'h4):(1'h0)])) : {(-$unsigned({wire148}))});
              reg151 <= ($signed((&reg150)) ?
                  $signed($unsigned(wire147[(3'h4):(3'h4)])) : (~|reg140[(1'h1):(1'h1)]));
              reg152 <= {{$unsigned(($signed(wire138) ?
                          reg145 : $unsigned(wire138))),
                      wire147},
                  reg140[(1'h1):(1'h0)]};
              reg153 <= (^((reg141 ?
                  $unsigned($signed(reg141)) : $signed(((8'hb6) >>> wire148))) ~^ (($signed(reg145) ?
                  (8'ha7) : (wire148 ?
                      reg152 : reg144)) << wire137[(2'h3):(1'h0)])));
              reg154 <= wire137[(4'hc):(3'h6)];
            end
          else
            begin
              reg150 <= $signed(wire149);
            end
        end
      else
        begin
          reg150 <= wire148;
        end
      if ((+$unsigned(reg150)))
        begin
          reg155 <= $signed(wire142[(1'h1):(1'h1)]);
        end
      else
        begin
          reg155 <= (((-($unsigned(reg144) + (reg154 ~^ wire149))) < wire139[(1'h0):(1'h0)]) ?
              wire149 : (8'had));
          reg156 <= reg153;
          reg157 <= $unsigned((|{(wire135[(3'h4):(1'h1)] * reg151),
              (~(wire142 ^~ wire149))}));
          reg158 <= $signed(((($signed(reg144) ?
                  ((8'hac) + wire135) : (-reg153)) ?
              $signed((8'hb3)) : (!{reg155})) & $signed((reg156[(3'h5):(1'h0)] >>> (reg155 ^ wire148)))));
        end
      reg159 <= (+(((&$unsigned(wire142)) ?
              ((reg143 ? wire147 : reg145) ?
                  (reg150 & reg146) : reg140) : {(wire142 ? reg140 : wire148),
                  (~^reg140)}) ?
          wire136 : $signed(wire139[(3'h5):(2'h2)])));
      if ($signed(reg144))
        begin
          reg160 <= reg159[(3'h7):(3'h6)];
          if (reg154[(4'ha):(3'h4)])
            begin
              reg161 <= ($signed(reg152[(2'h2):(2'h2)]) ?
                  $signed(wire138) : $unsigned((~$unsigned($unsigned(reg151)))));
              reg162 <= (((((wire138 ? reg159 : reg158) ?
                          reg146[(3'h6):(3'h4)] : (^wire139)) ?
                      $unsigned(reg146[(4'hb):(2'h3)]) : reg158) ?
                  (reg158[(4'hd):(4'hd)] && ((~^reg154) ?
                      wire142[(5'h12):(2'h2)] : (wire135 ?
                          wire137 : reg151))) : (^~{((8'ha0) ?
                          wire139 : reg152),
                      reg144[(3'h4):(1'h0)]})) | $unsigned($unsigned($unsigned(reg140))));
              reg163 <= $unsigned(reg152);
            end
          else
            begin
              reg161 <= ($signed({(|{reg150, reg140}), {(reg154 >= reg157)}}) ?
                  $unsigned($signed(reg144[(3'h7):(2'h3)])) : wire136);
              reg162 <= {$signed((|((reg162 && reg160) + reg150[(4'h9):(3'h7)])))};
              reg163 <= $unsigned((($unsigned($unsigned(reg160)) || $signed((^(8'hab)))) ^ $unsigned(((!wire138) ?
                  reg161[(4'he):(1'h0)] : (reg161 ? (8'hbb) : reg153)))));
            end
          reg164 <= $signed($unsigned(wire148));
        end
      else
        begin
          reg160 <= wire135;
          reg161 <= $signed(reg144);
          if ($signed(((($unsigned(reg144) ~^ (reg156 ? reg156 : reg161)) ?
                  $unsigned((wire135 << (8'hb1))) : (((7'h44) ?
                          wire136 : reg158) ?
                      (wire148 & (7'h40)) : wire136[(3'h6):(2'h2)])) ?
              $unsigned(reg150) : $signed((8'hb1)))))
            begin
              reg162 <= ((8'had) ? reg140 : (~&wire138[(3'h4):(3'h4)]));
              reg163 <= wire139[(3'h6):(2'h3)];
              reg164 <= $unsigned(wire147);
              reg165 <= {((8'ha3) ^~ (reg143[(1'h0):(1'h0)] ?
                      reg161[(4'he):(4'h9)] : wire142))};
            end
          else
            begin
              reg162 <= reg155[(1'h0):(1'h0)];
              reg163 <= $unsigned((^~(!reg157)));
            end
          reg166 <= ({(~|(!reg146[(2'h2):(2'h2)]))} >>> $unsigned(($signed((&reg157)) <<< {wire139[(1'h0):(1'h0)],
              (!reg151)})));
          if (((~^$signed(wire138[(3'h5):(3'h5)])) & (wire148 ?
              $unsigned($signed($signed(wire136))) : $signed(reg165))))
            begin
              reg167 <= $signed((reg154[(2'h2):(2'h2)] << (+($unsigned(reg166) + reg151[(2'h2):(1'h0)]))));
              reg168 <= (((-reg146) ?
                  $unsigned((reg155 || $unsigned(reg154))) : wire137[(3'h7):(3'h6)]) || (reg162 ~^ ($unsigned({reg150,
                      reg160}) ?
                  reg157 : {reg151, {reg166}})));
              reg169 <= (($signed(wire147[(3'h4):(3'h4)]) >> ((reg145 || (reg163 ?
                      reg157 : reg156)) - $unsigned((wire137 || wire137)))) ?
                  reg163[(1'h0):(1'h0)] : $unsigned($signed($unsigned(reg145[(4'hb):(2'h2)]))));
            end
          else
            begin
              reg167 <= ($unsigned(reg158[(4'hc):(4'h8)]) ?
                  $signed(({$signed(reg143)} ?
                      $unsigned(reg144) : reg157)) : ((^$unsigned({wire138})) ?
                      {reg141,
                          ($signed(reg163) ?
                              reg154[(3'h4):(1'h0)] : reg144)} : (!reg153)));
              reg168 <= (wire137[(4'hc):(4'hb)] <<< reg165);
              reg169 <= $signed({(~wire138[(2'h3):(2'h3)]),
                  (reg154[(3'h7):(2'h3)] <= (~|{reg145}))});
              reg170 <= $unsigned($unsigned((wire147 | reg141[(1'h0):(1'h0)])));
              reg171 <= reg166[(3'h4):(1'h0)];
            end
        end
    end
  assign wire172 = reg169[(4'ha):(3'h7)];
  assign wire173 = reg158[(2'h3):(1'h0)];
  assign wire174 = (((8'ha8) != $unsigned(reg168[(4'h9):(3'h4)])) + (+reg151));
  assign wire175 = (|{(^((reg150 ? wire139 : wire172) ?
                           $signed(wire149) : reg161[(1'h1):(1'h1)]))});
  assign wire176 = reg144[(3'h4):(3'h4)];
  assign wire177 = reg151[(2'h3):(2'h3)];
  assign wire178 = $unsigned($unsigned($signed($unsigned((+(8'hbe))))));
  assign wire179 = (wire135[(2'h2):(2'h2)] > (8'ha6));
  always
    @(posedge clk) begin
      reg180 <= reg155;
      reg181 <= ({(~^wire142)} & ((!$signed($signed(reg165))) ?
          $unsigned(((reg156 <<< wire149) ?
              reg167[(3'h5):(3'h5)] : (!reg169))) : (^wire142[(3'h5):(3'h4)])));
      reg182 <= (reg158[(2'h2):(1'h1)] + reg159);
      reg183 <= $unsigned((((-$signed(wire172)) ?
          $unsigned(wire142) : $signed({wire173})) << $signed($unsigned(reg155[(1'h0):(1'h0)]))));
    end
  assign wire184 = reg159[(3'h5):(2'h2)];
  assign wire185 = reg145[(2'h3):(1'h1)];
  assign wire186 = reg161[(2'h2):(2'h2)];
  assign wire187 = (8'hb1);
  always
    @(posedge clk) begin
      if ($unsigned($signed((-{$unsigned(reg143)}))))
        begin
          reg188 <= (wire135[(1'h1):(1'h0)] ?
              $signed(wire137[(3'h4):(1'h0)]) : wire135);
          reg189 <= reg161[(4'ha):(1'h0)];
          reg190 <= ((8'ha1) - reg153);
        end
      else
        begin
          reg188 <= (|$signed((-(~^$signed((8'ha9))))));
          reg189 <= wire138[(3'h5):(3'h5)];
          reg190 <= reg188;
          reg191 <= reg166[(2'h3):(2'h2)];
        end
      reg192 <= ($unsigned((reg167[(3'h6):(3'h4)] >>> $unsigned(reg159[(1'h1):(1'h0)]))) | $signed($signed((~^$signed(wire149)))));
      reg193 <= reg168;
    end
  assign wire194 = (8'hb6);
  assign wire195 = (reg159[(3'h5):(1'h1)] ?
                       $signed({(-(~reg168)),
                           wire176[(3'h4):(1'h0)]}) : reg156[(1'h0):(1'h0)]);
endmodule
