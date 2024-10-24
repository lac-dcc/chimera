module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire122;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire131;
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg127 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire135,
                 wire133,
                 wire120,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire122,
                 wire123,
                 wire124,
                 wire126,
                 wire130,
                 wire131,
                 reg147,
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
                 reg134,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire5 = $signed((~&$signed(wire4[(3'h5):(3'h5)])));
  assign wire6 = (^~wire2[(1'h0):(1'h0)]);
  assign wire7 = (~(7'h43));
  assign wire8 = (~|(^~wire5));
  assign wire9 = $unsigned((8'ha7));
  module10 #() modinst121 (.wire12(wire1), .wire14(wire8), .wire15(wire2), .wire11(wire7), .y(wire120), .wire13(wire5), .clk(clk));
  assign wire122 = wire6[(3'h5):(2'h2)];
  assign wire123 = wire3[(3'h6):(2'h3)];
  module16 #() modinst125 (.clk(clk), .y(wire124), .wire20(wire5), .wire17(wire1), .wire19(wire4), .wire18(wire123));
  assign wire126 = (wire6[(3'h5):(2'h2)] <= $signed(wire2[(4'hc):(4'ha)]));
  always
    @(posedge clk) begin
      reg127 <= wire122;
      reg128 <= wire2;
      reg129 <= {($signed(wire3) == {(+$signed(wire8)), (~$signed(wire126))}),
          ((&(~^(^~wire8))) <<< $signed((wire9[(3'h7):(3'h7)] - ((8'h9f) ?
              wire6 : wire122))))};
    end
  assign wire130 = ($signed(($signed((wire120 || wire8)) != (wire1[(3'h5):(2'h3)] <= wire7[(4'h9):(2'h2)]))) ?
                       $unsigned(wire120[(1'h1):(1'h0)]) : $unsigned((wire3[(2'h2):(1'h1)] ?
                           wire120 : $signed((7'h43)))));
  module10 #() modinst132 (wire131, clk, wire124, wire7, wire0, wire6, wire120);
  assign wire133 = (8'ha0);
  always
    @(posedge clk) begin
      reg134 <= ($signed(((8'hbb) ~^ reg128)) + wire8);
    end
  assign wire135 = ($unsigned($unsigned({{reg129, (8'ha6)}})) ?
                       ($signed(wire133) + (+wire0)) : (wire5[(1'h0):(1'h0)] <= wire9[(3'h7):(3'h4)]));
  always
    @(posedge clk) begin
      reg136 <= {(wire135 ?
              ($unsigned((wire130 ? wire126 : reg128)) ?
                  wire8[(4'hc):(3'h5)] : wire120[(4'ha):(4'h9)]) : {$unsigned(wire122),
                  wire135[(1'h1):(1'h1)]})};
      reg137 <= wire8;
      reg138 <= ($unsigned($signed((&$signed(wire120)))) >= $unsigned((~^(~&reg137))));
      if (reg127)
        begin
          reg139 <= (((((reg138 ^ wire133) ?
                  (^~wire8) : $unsigned(wire130)) || $unsigned((wire5 ?
                  wire5 : wire123))) ?
              (~^(wire120 ?
                  (reg138 ?
                      wire135 : wire133) : (~wire123))) : $unsigned(({wire122} ~^ $unsigned(wire0)))) >>> $unsigned($unsigned(reg138[(1'h0):(1'h0)])));
        end
      else
        begin
          reg139 <= $signed($unsigned(wire6));
          reg140 <= wire123[(1'h1):(1'h1)];
          reg141 <= (reg139[(3'h7):(2'h3)] >> {(8'hb3)});
          reg142 <= ((8'hab) >>> (~^$unsigned(((7'h40) <= wire122[(4'ha):(4'h8)]))));
        end
    end
  always
    @(posedge clk) begin
      reg143 <= ($signed((^(wire7 * ((8'ha0) || reg127)))) ~^ ((reg134[(3'h7):(3'h6)] || $unsigned((~&wire6))) * wire5));
      reg144 <= $signed($unsigned((($signed(wire133) ?
          reg128 : (wire122 ? reg128 : wire131)) * wire131[(4'ha):(3'h4)])));
      reg145 <= ($unsigned({reg142}) ? reg137 : wire120);
      reg146 <= $unsigned(reg140[(4'hb):(3'h6)]);
      reg147 <= $signed($signed(($unsigned(wire3) ?
          $unsigned($unsigned(reg138)) : wire126)));
    end
  assign wire148 = (($signed($unsigned({reg138})) ?
                           $unsigned($signed(reg146)) : $unsigned($signed(wire120))) ?
                       (($unsigned($unsigned((8'h9e))) << $signed(wire6)) ?
                           ($signed($signed(wire6)) & {wire7[(4'hd):(2'h3)]}) : ($signed((&(8'ha9))) ?
                               ((reg145 || reg139) ?
                                   ((8'hab) ?
                                       wire130 : reg147) : wire7[(4'h8):(3'h7)]) : {(wire123 ?
                                       reg128 : wire3)})) : reg138[(2'h2):(1'h1)]);
  assign wire149 = wire0[(5'h13):(5'h11)];
  assign wire150 = reg145;
  assign wire151 = reg146;
  assign wire152 = wire149;
endmodule

module module10  (y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire116;
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire51,
                 wire53,
                 wire71,
                 wire73,
                 wire95,
                 wire97,
                 wire99,
                 wire116,
                 reg98,
                 (1'h0)};
  module16 #() modinst52 (.clk(clk), .wire19(wire15), .wire18(wire11), .y(wire51), .wire20(wire12), .wire17(wire13));
  assign wire53 = wire11[(4'hf):(4'he)];
  module54 #() modinst72 (wire71, clk, wire14, wire53, wire51, wire13);
  assign wire73 = {($signed(wire15[(5'h10):(4'hd)]) ?
                          (+wire15[(4'hb):(2'h3)]) : {((~^wire14) ?
                                  (wire12 ? wire14 : wire13) : wire53)}),
                      $unsigned(wire14)};
  module74 #() modinst96 (wire95, clk, wire12, wire14, wire53, wire51);
  assign wire97 = wire53[(4'hd):(4'h8)];
  always
    @(posedge clk) begin
      reg98 <= ($unsigned(($signed(wire95[(3'h5):(2'h2)]) ?
              ((wire11 <<< (8'hac)) ?
                  ((8'ha1) >>> wire97) : wire15[(4'hb):(3'h4)]) : (8'ha6))) ?
          $unsigned(((wire51 ? $unsigned(wire95) : {wire14, (8'h9e)}) ?
              (wire71 * (!wire13)) : $signed((wire14 >= wire14)))) : wire71[(3'h4):(2'h3)]);
    end
  assign wire99 = $unsigned((|$unsigned($unsigned((8'ha1)))));
  module100 #() modinst117 (wire116, clk, wire11, wire97, wire99, wire51, wire14);
  assign wire118 = (|(({{(8'hbc), wire71}, $unsigned(wire15)} ?
                           (~^(wire53 ?
                               wire95 : wire73)) : (~&(wire71 >>> reg98))) ?
                       ($unsigned(wire97) >>> (((8'hac) ?
                           wire73 : wire73) ^~ ((8'haf) ^~ wire97))) : {$signed($unsigned(wire53)),
                           $signed($signed((8'hb5)))}));
  assign wire119 = {$signed((^wire53[(3'h4):(1'h0)])),
                       ($unsigned(({wire73,
                           wire73} > wire53[(4'he):(3'h4)])) ^ (wire99[(3'h4):(2'h2)] >= $unsigned($signed((8'hb6)))))};
endmodule

module module100  (y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire105;
  input wire [(4'h9):(1'h0)] wire104;
  input wire [(2'h2):(1'h0)] wire103;
  input wire signed [(5'h10):(1'h0)] wire102;
  input wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(4'hb):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire106;
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 (1'h0)};
  assign wire106 = ($unsigned((-(wire102 ?
                       $unsigned(wire104) : $signed(wire104)))) ^ $unsigned(wire103));
  assign wire107 = (|(!$signed($unsigned($unsigned(wire101)))));
  assign wire108 = wire105;
  assign wire109 = (~^wire107[(1'h0):(1'h0)]);
  assign wire110 = (~|$unsigned((-(^~(wire106 ? wire104 : wire105)))));
  assign wire111 = (!(8'hbf));
  assign wire112 = $signed(wire101[(3'h7):(1'h0)]);
  assign wire113 = (wire108 ?
                       (wire110 >= wire105) : $unsigned(($signed({(8'haf)}) + $unsigned($signed(wire107)))));
  assign wire114 = {wire107[(4'h8):(4'h8)]};
  assign wire115 = $signed(wire103[(2'h2):(1'h1)]);
endmodule

module module74
#(parameter param94 = (&(-(|(((8'hb6) ? (8'hb1) : (8'h9d)) | (&(8'hb7)))))))
(y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire [(5'h12):(1'h0)] wire77;
  input wire signed [(5'h10):(1'h0)] wire76;
  input wire [(5'h11):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 reg86,
                 (1'h0)};
  assign wire79 = wire76;
  assign wire80 = wire78[(3'h5):(1'h1)];
  assign wire81 = wire75;
  assign wire82 = (^$unsigned({(~|(+(8'ha6)))}));
  assign wire83 = (^~(~&{$unsigned($signed((8'hbe))),
                      $signed(wire82[(2'h3):(2'h2)])}));
  assign wire84 = wire81;
  assign wire85 = $signed($signed(($unsigned((wire84 ^~ wire81)) ?
                      wire76[(1'h1):(1'h0)] : $signed($signed(wire75)))));
  always
    @(posedge clk) begin
      reg86 <= $unsigned(wire81);
    end
  assign wire87 = wire83;
  assign wire88 = wire77[(3'h6):(3'h4)];
  assign wire89 = ($signed(wire80) <= (-(|((wire76 && wire76) | {wire75,
                      wire88}))));
  assign wire90 = (8'hbf);
  assign wire91 = $signed($unsigned($signed((wire76 != $unsigned(wire83)))));
  assign wire92 = $unsigned(((wire85[(4'hd):(4'h9)] >= $signed((wire89 ?
                          wire89 : wire85))) ?
                      (~|(|(wire82 <<< reg86))) : (({wire83, (8'ha7)} ?
                          $signed(wire85) : (~&wire87)) | (|(wire87 << wire85)))));
  assign wire93 = $unsigned($signed({(8'h9f)}));
endmodule

module module54  (y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire58;
  input wire [(3'h4):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire59;
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire59,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire59 = wire58;
  always
    @(posedge clk) begin
      reg60 <= ({($signed((wire59 ? wire59 : wire55)) - (((7'h44) >= wire58) ?
              $signed(wire58) : wire59)),
          $unsigned({(wire56 ? wire59 : wire55),
              $signed(wire56)})} < $unsigned($unsigned($unsigned((wire59 >= wire59)))));
      if ($signed(wire59))
        begin
          reg61 <= ((wire59 ?
                  $unsigned(($unsigned((8'had)) >>> wire57[(2'h2):(1'h0)])) : wire59[(2'h3):(1'h1)]) ?
              wire58[(1'h1):(1'h1)] : (8'h9d));
        end
      else
        begin
          if (wire55[(3'h4):(2'h3)])
            begin
              reg61 <= wire57[(1'h1):(1'h1)];
              reg62 <= reg60[(2'h3):(2'h2)];
            end
          else
            begin
              reg61 <= $signed($unsigned($unsigned($signed(wire56))));
              reg62 <= $unsigned(((~&$signed($signed(reg62))) << $unsigned(reg62)));
              reg63 <= wire58[(4'hd):(4'hb)];
            end
          reg64 <= reg62;
          if ((reg63 ?
              {({(reg63 <= reg60)} >= ($signed(reg61) | (!(8'ha1)))),
                  $signed(wire58[(2'h2):(2'h2)])} : (wire59[(3'h4):(1'h0)] ?
                  $unsigned({(wire56 ?
                          (8'h9e) : wire56)}) : (wire55 == $signed((reg60 ?
                      reg63 : wire55))))))
            begin
              reg65 <= wire56;
              reg66 <= $signed(reg65);
              reg67 <= $unsigned((^reg62[(5'h11):(3'h4)]));
            end
          else
            begin
              reg65 <= ((&$unsigned(wire56[(4'hc):(4'hb)])) >> ((^~reg64[(4'he):(3'h4)]) ?
                  reg64[(4'h9):(4'h9)] : $unsigned(($signed(reg67) ^~ (reg62 ?
                      (8'hb2) : reg67)))));
              reg66 <= wire56[(4'h8):(4'h8)];
              reg67 <= ((|(reg60[(3'h7):(3'h4)] ?
                  wire56[(5'h13):(5'h12)] : wire58[(4'h9):(3'h7)])) ^~ wire59[(5'h11):(4'ha)]);
              reg68 <= {$signed((((wire55 ~^ reg67) ?
                      (^(8'haf)) : $unsigned(reg61)) ^~ (|(wire55 ^ wire58))))};
            end
        end
    end
  assign wire69 = (8'hb8);
  assign wire70 = (&({reg61,
                      {wire59[(4'h9):(3'h7)],
                          $unsigned(wire69)}} * $unsigned(((reg61 ?
                      reg67 : wire56) + ((8'ha2) < (8'h9f))))));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire21;
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire38,
                 wire21,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 (1'h0)};
  assign wire21 = wire17;
  always
    @(posedge clk) begin
      reg22 <= wire19;
      reg23 <= (|wire20[(4'hc):(3'h5)]);
      if ($unsigned(wire17[(3'h7):(3'h4)]))
        begin
          reg24 <= (&(wire19[(4'ha):(2'h3)] >= wire18[(3'h5):(2'h2)]));
          reg25 <= ($unsigned(reg23[(3'h6):(2'h2)]) > (wire17[(3'h4):(3'h4)] ?
              (~|wire21[(1'h0):(1'h0)]) : (^~$unsigned((wire20 && wire21)))));
          reg26 <= wire21;
          reg27 <= ($unsigned((((reg24 ? wire18 : wire18) ?
              {wire19,
                  reg25} : $unsigned((8'hb7))) > wire20)) == ($signed(reg26[(1'h1):(1'h0)]) ?
              (8'hb2) : reg24[(3'h5):(1'h0)]));
          reg28 <= {$unsigned(reg27),
              (~|($signed(reg25) ?
                  {wire19[(3'h5):(3'h4)]} : ($signed(wire17) ?
                      $signed((8'haf)) : (wire20 ~^ reg25))))};
        end
      else
        begin
          if ($unsigned($unsigned($unsigned(((reg23 == wire19) ?
              {wire19} : $signed(reg22))))))
            begin
              reg24 <= $signed((reg27[(4'h8):(2'h2)] >> reg27[(4'h8):(1'h0)]));
              reg25 <= (|$unsigned((reg23 ?
                  $unsigned(wire20[(4'h8):(3'h6)]) : ($signed(wire20) >= $signed(reg25)))));
            end
          else
            begin
              reg24 <= reg27;
              reg25 <= wire17[(5'h12):(4'ha)];
            end
        end
      if ((((&(^{reg27})) ?
          $unsigned($unsigned((|reg27))) : (|reg28[(2'h3):(1'h0)])) + reg23[(1'h0):(1'h0)]))
        begin
          reg29 <= $signed({wire20[(4'hd):(4'h8)], reg24});
          reg30 <= $signed(((wire18[(3'h7):(3'h6)] ?
                  $unsigned(reg26) : (!wire17)) ?
              (($unsigned(reg25) ? {reg22} : $unsigned(wire18)) ?
                  (~|{reg24}) : $unsigned($signed((8'hac)))) : $unsigned(((8'haf) | $unsigned(wire21)))));
        end
      else
        begin
          reg29 <= ((-wire20[(3'h6):(2'h2)]) ?
              (($unsigned((^~reg22)) ~^ (wire21[(2'h2):(1'h1)] - reg26)) ?
                  $unsigned(((reg23 ? reg27 : reg30) ?
                      reg23[(2'h2):(2'h2)] : $unsigned(wire18))) : reg23[(2'h3):(2'h2)]) : reg25[(4'he):(4'h9)]);
          reg30 <= (!reg23);
          reg31 <= reg26;
          if ($unsigned($unsigned(reg26[(1'h0):(1'h0)])))
            begin
              reg32 <= $unsigned($unsigned($unsigned(($unsigned(wire19) + (~|wire21)))));
              reg33 <= wire19;
              reg34 <= wire17[(4'ha):(3'h5)];
              reg35 <= (^{{reg34[(5'h11):(2'h3)],
                      ((wire19 ~^ (8'hbe)) ? $unsigned(reg30) : (&reg22))},
                  wire18[(2'h2):(2'h2)]});
            end
          else
            begin
              reg32 <= $signed({(-$signed((~|wire17))),
                  (wire18 ? {(reg29 ? reg31 : reg23), (^reg30)} : reg26)});
              reg33 <= {((+{(reg23 ? reg22 : reg33),
                      (reg25 ? wire17 : reg28)}) || {$signed(((8'h9c) ?
                          reg34 : reg22))}),
                  ({reg34[(2'h2):(1'h1)], $signed($signed(reg29))} ?
                      $signed($signed(reg24)) : reg26)};
            end
          reg36 <= $unsigned({$signed((~&wire20[(4'h8):(3'h4)]))});
        end
      reg37 <= reg29;
    end
  assign wire38 = $unsigned($signed((reg27 ?
                      $unsigned($signed((8'ha1))) : (~reg35[(3'h4):(1'h1)]))));
  always
    @(posedge clk) begin
      reg39 <= reg36[(4'h8):(1'h0)];
      reg40 <= reg32;
      if (($unsigned($unsigned(((reg23 >> (8'hb5)) ?
              $signed(reg30) : ((7'h41) ? reg30 : (8'hbc))))) ?
          wire19[(1'h1):(1'h1)] : ((8'hbc) ?
              $signed((^~$unsigned(reg33))) : $signed(reg23[(3'h5):(3'h4)]))))
        begin
          reg41 <= reg33[(2'h3):(2'h3)];
        end
      else
        begin
          if ($signed(($signed($unsigned(wire21[(1'h0):(1'h0)])) ?
              (reg31[(2'h2):(2'h2)] ?
                  {(wire20 >>> (8'hb2)),
                      $unsigned(reg27)} : $unsigned((reg35 >>> reg26))) : {$unsigned(reg40),
                  $unsigned(reg26)})))
            begin
              reg41 <= reg28;
              reg42 <= $signed(wire17);
              reg43 <= wire38;
              reg44 <= ((reg31 && $unsigned((reg32[(3'h4):(2'h3)] >> $signed((7'h43))))) ?
                  ((reg36 == (+reg34)) | (8'ha6)) : reg25[(4'ha):(3'h7)]);
              reg45 <= (~^{((!(wire18 >>> reg41)) ~^ (reg37 ~^ $signed(reg37))),
                  $signed(((wire19 ? (7'h44) : reg42) ? reg25 : {reg43}))});
            end
          else
            begin
              reg41 <= $unsigned((($unsigned((reg42 ?
                      reg32 : reg40)) >> (-reg26)) ?
                  $signed(reg34[(5'h10):(4'h8)]) : (~(reg40 == reg39[(2'h3):(1'h0)]))));
              reg42 <= reg44[(1'h1):(1'h1)];
            end
          reg46 <= reg35;
          reg47 <= ((((reg46 - $signed(wire38)) ?
                  reg25[(4'ha):(3'h6)] : (~(&wire17))) ?
              {(7'h44), reg39[(2'h2):(1'h0)]} : (reg44 ?
                  reg28[(3'h4):(3'h4)] : $signed((reg32 + (8'had))))) << reg23[(3'h5):(1'h1)]);
        end
    end
  assign wire48 = $unsigned((^$signed($signed($signed(reg44)))));
  assign wire49 = reg42;
  assign wire50 = (reg44 ^~ (((~&reg24[(3'h5):(2'h2)]) && (~|reg26[(3'h4):(1'h0)])) << $signed($unsigned((wire49 + wire21)))));
endmodule
