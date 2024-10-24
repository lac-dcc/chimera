module top
#(parameter param148 = ((~^(7'h43)) ? (((((8'hb1) ? (8'hb1) : (8'ha8)) ~^ {(7'h42)}) ? (((7'h43) ? (8'hb5) : (8'hbb)) ? (~&(7'h40)) : (|(8'ha1))) : ((8'ha9) ? (|(8'had)) : ((8'hbf) ? (8'hbb) : (8'had)))) ? ((~^(&(8'hbc))) ? (((8'hb3) ~^ (8'hb6)) + (^~(7'h41))) : (8'hb4)) : ({((8'hb2) ? (7'h42) : (8'hb4))} ~^ (^~(~^(8'haa))))) : (~(&({(8'hac)} ? ((8'hb0) ? (8'ha4) : (8'h9f)) : ((8'hbc) ? (8'h9d) : (8'hb5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire145;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire143;
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire70,
                 wire6,
                 wire5,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire143,
                 (1'h0)};
  assign wire5 = (($unsigned(wire4[(5'h11):(4'h9)]) >> $unsigned((^$signed(wire0)))) ?
                     $signed($signed(({wire3, wire2} ?
                         wire3[(3'h4):(3'h4)] : $unsigned(wire3)))) : $unsigned((~&(wire0 ?
                         wire1 : (~^wire2)))));
  assign wire6 = wire4;
  module7 #() modinst71 (wire70, clk, wire6, wire5, wire1, wire0, wire4);
  assign wire72 = (($unsigned(wire70) ?
                      wire70 : $unsigned((wire70[(1'h0):(1'h0)] * (wire2 ?
                          wire5 : wire4)))) <<< wire3[(3'h4):(3'h4)]);
  assign wire73 = $signed(wire70[(1'h1):(1'h0)]);
  assign wire74 = wire5;
  assign wire75 = wire6[(3'h5):(1'h1)];
  module76 #() modinst144 (wire143, clk, wire72, wire2, wire75, wire4, wire1);
  assign wire145 = $unsigned($signed(((8'ha1) ~^ (~^$signed(wire73)))));
  assign wire146 = {wire4[(5'h14):(5'h10)],
                       {wire143[(2'h3):(2'h2)], $unsigned((&(|wire1)))}};
  assign wire147 = ((wire72 + wire70[(1'h0):(1'h0)]) & wire145[(3'h4):(1'h0)]);
endmodule

module module76
#(parameter param142 = (~&(!({((8'ha1) ? (8'hb1) : (8'haa)), (~|(8'haf))} && (~|{(8'h9d)})))))
(y, clk, wire77, wire78, wire79, wire80, wire81);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire77;
  input wire [(5'h10):(1'h0)] wire78;
  input wire signed [(5'h10):(1'h0)] wire79;
  input wire [(5'h15):(1'h0)] wire80;
  input wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(5'h15):(1'h0)] wire126;
  wire signed [(2'h3):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire105;
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire135,
                 wire133,
                 wire129,
                 wire128,
                 wire126,
                 wire124,
                 wire107,
                 wire82,
                 wire83,
                 wire105,
                 reg136,
                 reg134,
                 reg132,
                 reg131,
                 reg130,
                 reg127,
                 reg84,
                 reg85,
                 (1'h0)};
  assign wire82 = {(((wire79[(3'h5):(2'h2)] - (!wire78)) == ($signed(wire79) ?
                              (~^wire81) : wire77)) ?
                          {({wire81, wire80} ?
                                  wire81 : wire80)} : wire80[(3'h4):(1'h1)]),
                      wire77};
  assign wire83 = ({(~wire79[(2'h2):(1'h0)])} ?
                      $signed($signed((~^wire78))) : (-(~&$unsigned(wire78[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg84 <= {(~(wire77 ?
              {(wire81 ? (7'h43) : wire80)} : (|wire79[(4'h8):(1'h0)])))};
      reg85 <= $unsigned(($signed((^{wire77})) != (wire80 ?
          (~|(8'hbd)) : (|$unsigned(wire82)))));
    end
  module86 #() modinst106 (.wire87(wire79), .wire91(wire80), .wire89(wire77), .wire90(wire82), .wire88(wire81), .y(wire105), .clk(clk));
  assign wire107 = ({((~|$unsigned(wire105)) ?
                           $unsigned((~wire83)) : $signed({(8'h9c),
                               wire79}))} & wire80);
  module108 #() modinst125 (.wire110(reg84), .wire112(wire81), .y(wire124), .wire111(wire80), .wire109(wire77), .wire113(wire79), .clk(clk));
  assign wire126 = wire105;
  always
    @(posedge clk) begin
      reg127 <= wire82;
    end
  assign wire128 = wire78;
  assign wire129 = ((((((7'h44) ? wire82 : wire81) >> $signed(reg85)) ?
                               reg127[(2'h3):(2'h3)] : wire79[(3'h5):(2'h2)]) ?
                           $signed(wire128) : (&$signed((&(8'h9c))))) ?
                       (wire82 ?
                           reg127[(5'h10):(4'h8)] : (-wire79[(3'h4):(3'h4)])) : ($unsigned($signed((!reg85))) && $signed($unsigned(wire78))));
  always
    @(posedge clk) begin
      reg130 <= wire79[(1'h0):(1'h0)];
      reg131 <= wire129[(3'h5):(3'h4)];
      reg132 <= $signed($unsigned($unsigned($signed(wire82[(4'hf):(1'h0)]))));
    end
  assign wire133 = $unsigned($unsigned((8'haf)));
  always
    @(posedge clk) begin
      reg134 <= wire107;
    end
  assign wire135 = wire124;
  always
    @(posedge clk) begin
      reg136 <= reg127[(3'h6):(3'h6)];
    end
  assign wire137 = wire126[(5'h14):(4'hb)];
  assign wire138 = {$unsigned(reg130[(3'h4):(3'h4)])};
  assign wire139 = $signed((($unsigned(wire79[(5'h10):(3'h5)]) ?
                       ((-wire78) | $signed(wire107)) : $signed((8'ha4))) <= reg132[(2'h2):(1'h1)]));
  assign wire140 = wire124[(2'h2):(1'h0)];
  assign wire141 = $signed({wire139[(1'h1):(1'h1)], wire139});
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire50;
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire50,
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
                 (1'h0)};
  assign wire13 = ((8'hac) | wire12);
  assign wire14 = (^~(!$unsigned((!wire9))));
  assign wire15 = wire12[(1'h1):(1'h1)];
  assign wire16 = wire8[(1'h0):(1'h0)];
  assign wire17 = (($unsigned(((^wire16) ?
                      wire9[(4'hc):(3'h5)] : ((8'h9f) * wire11))) || $unsigned(((wire15 ?
                          (8'hbf) : wire8) ?
                      $unsigned((8'hb3)) : $signed(wire13)))) ^~ wire14[(4'h9):(2'h2)]);
  assign wire18 = {$unsigned($signed({(wire9 ? wire10 : wire9), (~^wire12)})),
                      $unsigned(((|$signed(wire10)) ~^ wire9))};
  assign wire19 = $signed((8'hb3));
  assign wire20 = (wire18[(1'h1):(1'h1)] && wire8);
  assign wire21 = (~(wire16[(1'h1):(1'h0)] <<< $signed((wire9 >= wire18[(1'h1):(1'h0)]))));
  module22 #() modinst51 (.y(wire50), .wire25(wire13), .wire24(wire19), .wire26(wire8), .clk(clk), .wire23(wire16), .wire27(wire9));
  always
    @(posedge clk) begin
      reg52 <= wire9;
      reg53 <= (^~(^(($unsigned(wire11) <= wire8) ^ wire14)));
      if ($unsigned(wire18))
        begin
          reg54 <= reg52[(1'h1):(1'h1)];
          reg55 <= wire20;
          reg56 <= reg55;
          reg57 <= wire12;
        end
      else
        begin
          reg54 <= $signed(($unsigned(reg55[(1'h0):(1'h0)]) << (^~wire11)));
        end
      reg58 <= wire13;
      if (wire14)
        begin
          reg59 <= (~^($signed($unsigned($unsigned(wire50))) ?
              (reg54 ?
                  ($unsigned(wire12) ?
                      (wire9 ? reg58 : wire14) : (wire11 ?
                          wire10 : (8'hba))) : reg57) : $unsigned((reg52 ?
                  (^~reg54) : reg53[(2'h2):(1'h1)]))));
          reg60 <= ($signed((({(8'hb6),
                  wire21} < wire19[(4'hc):(1'h0)]) - $signed($signed(wire19)))) ?
              {(wire13 << {$unsigned(reg53),
                      (wire21 ? reg57 : (7'h44))})} : (8'ha6));
        end
      else
        begin
          reg59 <= reg55;
          reg60 <= $unsigned(wire14[(1'h1):(1'h1)]);
          reg61 <= (|$signed({((7'h40) - $unsigned(reg52)), (8'ha7)}));
        end
    end
  assign wire62 = wire14[(2'h2):(2'h2)];
  assign wire63 = {wire50};
  assign wire64 = (8'h9e);
  assign wire65 = (!(+wire62[(3'h5):(2'h2)]));
  assign wire66 = wire17;
  assign wire67 = reg52;
  assign wire68 = $unsigned(reg57);
  assign wire69 = $signed($signed((~&$signed((reg61 ? wire67 : wire14)))));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  input wire [(5'h12):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire28;
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg29,
                 (1'h0)};
  assign wire28 = $signed(wire25[(4'hd):(4'h8)]);
  always
    @(posedge clk) begin
      reg29 <= {$unsigned((((^(7'h42)) ?
              wire26[(2'h2):(1'h0)] : (wire24 != wire27)) - ((wire23 ?
              (8'ha6) : (7'h40)) || wire24)))};
    end
  assign wire30 = $unsigned((wire23[(2'h3):(1'h1)] >= $unsigned((8'ha3))));
  assign wire31 = wire23[(1'h0):(1'h0)];
  assign wire32 = $signed((8'haa));
  assign wire33 = (wire30 >= (wire25 ?
                      $unsigned($signed(wire32)) : {{$unsigned(wire23)}}));
  assign wire34 = ($signed((8'ha4)) ?
                      ($unsigned(wire24) ^ $unsigned(wire25)) : (&((~&$signed(wire27)) ?
                          wire33 : $signed($signed(wire27)))));
  always
    @(posedge clk) begin
      reg35 <= wire28[(2'h2):(1'h1)];
      if (wire32)
        begin
          reg36 <= ((&(($unsigned(wire32) ? $signed(reg29) : $signed(reg29)) ?
              ($signed(wire23) & wire25[(3'h4):(3'h4)]) : wire34)) >>> (8'hb2));
        end
      else
        begin
          reg36 <= wire28[(3'h6):(3'h5)];
          reg37 <= (~&(^~$signed((wire28 ? {wire28} : reg36))));
          reg38 <= wire24[(4'hc):(3'h6)];
        end
    end
  always
    @(posedge clk) begin
      reg39 <= wire32;
      if (reg35[(5'h11):(4'h8)])
        begin
          if (reg36[(4'ha):(3'h5)])
            begin
              reg40 <= ((wire24 ?
                  wire28 : $unsigned(wire30[(1'h0):(1'h0)])) || $signed((^(~&(wire32 && wire34)))));
              reg41 <= $unsigned($unsigned(reg35[(2'h3):(2'h2)]));
              reg42 <= (8'hb4);
              reg43 <= wire30[(3'h4):(1'h1)];
              reg44 <= {$unsigned($signed(wire28[(3'h5):(2'h2)])), reg35};
            end
          else
            begin
              reg40 <= $signed(((&($unsigned(wire30) ?
                      $signed((8'hba)) : $unsigned((8'ha8)))) ?
                  {$signed((^wire34)),
                      ({wire27} ?
                          (|wire26) : wire27)} : $signed(((wire26 == (8'ha8)) ?
                      ((8'hb0) >>> reg42) : (reg36 ? reg42 : (8'hb1))))));
            end
        end
      else
        begin
          reg40 <= (~&(wire28[(1'h0):(1'h0)] * wire28[(1'h0):(1'h0)]));
          reg41 <= ((reg36[(1'h0):(1'h0)] ?
                  (!{$unsigned((8'hb0))}) : $unsigned(reg40)) ?
              {{wire32,
                      $unsigned((reg40 ~^ (8'ha5)))}} : wire30[(4'hf):(4'h8)]);
          reg42 <= $signed(reg36[(4'ha):(3'h7)]);
          reg43 <= wire30[(2'h2):(1'h1)];
          if ((reg38 - $signed(reg42[(4'h9):(2'h3)])))
            begin
              reg44 <= {reg43[(4'hd):(4'hc)], reg44[(2'h3):(2'h2)]};
              reg45 <= wire32;
              reg46 <= reg40[(3'h7):(2'h2)];
              reg47 <= (wire30 * $signed($signed((~(wire31 & wire26)))));
              reg48 <= {((($unsigned(reg42) ? (~^reg44) : reg45) ?
                      (&reg38) : ($unsigned((8'ha2)) ?
                          (wire32 * wire34) : ((8'hb7) ?
                              reg46 : wire26))) - reg40)};
            end
          else
            begin
              reg44 <= reg44[(3'h5):(2'h2)];
            end
        end
      reg49 <= wire27[(4'hd):(3'h7)];
    end
endmodule

module module108
#(parameter param123 = ((!({(-(8'hbf))} ~^ (((8'h9c) ^ (8'ha8)) * (&(8'hbc))))) ? (((((8'hb6) ? (8'h9f) : (8'hb3)) ? (+(8'ha4)) : (-(8'ha5))) <<< (&((7'h43) ? (8'ha8) : (8'hb0)))) ? (((&(8'hb3)) - {(8'ha0), (8'h9e)}) > {((8'ha8) ? (8'ha2) : (7'h42))}) : (~^(((8'hb0) ~^ (8'ha4)) ? ((8'hbd) && (8'ha8)) : ((8'hbf) ? (8'had) : (8'h9e))))) : {(((8'ha2) ? (&(8'h9d)) : ((8'hb9) <= (8'ha4))) ~^ {((7'h41) <<< (8'hb9)), {(8'hb2), (7'h43)}})}))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire113;
  input wire [(3'h6):(1'h0)] wire112;
  input wire signed [(4'ha):(1'h0)] wire111;
  input wire [(3'h6):(1'h0)] wire110;
  input wire signed [(4'h8):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire signed [(4'he):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(5'h15):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 (1'h0)};
  assign wire114 = wire111[(3'h5):(2'h3)];
  assign wire115 = $unsigned($signed(((^$signed(wire110)) ?
                       $signed((8'ha9)) : (~&(wire112 | wire113)))));
  assign wire116 = wire113[(4'h8):(4'h8)];
  assign wire117 = wire110;
  assign wire118 = ((wire110[(3'h5):(1'h1)] * ({{(8'hb8), wire115},
                           (wire110 * wire109)} ?
                       (~|$signed(wire111)) : wire113)) < (^(wire116 || {wire114[(1'h0):(1'h0)]})));
  assign wire119 = {wire110[(2'h3):(2'h2)]};
  assign wire120 = wire115;
  assign wire121 = $unsigned($unsigned(($unsigned({(8'h9c)}) ?
                       wire116 : wire114[(1'h1):(1'h0)])));
  assign wire122 = $unsigned((8'hb1));
endmodule

module module86
#(parameter param103 = ({{{(&(8'h9e)), (8'h9e)}}, (^(((8'ha2) ? (8'ha6) : (8'hb2)) ? ((8'hb4) * (8'ha3)) : {(8'h9d)}))} ~^ (((((8'hba) > (8'hb4)) ? ((8'ha4) ? (8'hb6) : (8'hab)) : {(8'hbb), (8'ha7)}) ? (((8'ha7) ? (7'h40) : (8'ha4)) ? ((8'ha5) > (8'ha2)) : (8'hbe)) : ((~(8'hb5)) ? ((7'h41) ? (8'ha2) : (8'hb5)) : ((8'haa) | (8'haf)))) ? (~(((8'h9e) ? (8'hbc) : (8'hbd)) || ((8'ha9) ? (8'ha3) : (8'hb9)))) : (~&(!((8'h9f) <<< (8'hae)))))), 
parameter param104 = param103)
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire91;
  input wire signed [(4'h9):(1'h0)] wire90;
  input wire [(3'h7):(1'h0)] wire89;
  input wire [(3'h4):(1'h0)] wire88;
  input wire signed [(5'h10):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(5'h11):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 (1'h0)};
  assign wire92 = $signed(((!$unsigned(wire90[(2'h3):(2'h3)])) > ((wire91 > {wire91}) ?
                      $signed({wire88}) : wire87)));
  assign wire93 = ((wire89[(1'h1):(1'h1)] ~^ (~(wire90 >> (+(8'hac))))) ?
                      wire91 : wire92);
  assign wire94 = (({(~(8'h9f)), {wire93, {wire89}}} & (+($signed((8'hae)) ?
                          (wire93 ?
                              wire92 : (8'hb7)) : wire89[(3'h4):(2'h3)]))) ?
                      (wire91 - $unsigned(wire90)) : ((wire89 ?
                              wire93 : wire89[(1'h1):(1'h1)]) ?
                          (wire91 ?
                              $unsigned((wire89 ?
                                  (8'hb6) : wire87)) : ($signed(wire88) ?
                                  {wire91} : {wire91,
                                      wire91})) : wire89[(2'h3):(1'h1)]));
  assign wire95 = ((~({$signed(wire94), $unsigned((8'hab))} ?
                      (+$signed(wire91)) : (^$signed((8'hb3))))) == ({wire93} ?
                      ($unsigned((wire93 == wire93)) & wire91) : wire87));
  assign wire96 = $unsigned($signed(($unsigned((+wire91)) ?
                      (&$signed(wire95)) : wire94)));
  assign wire97 = (({wire94} ?
                          wire91[(4'h8):(2'h3)] : $signed(($signed(wire89) ^ (wire95 ?
                              (8'ha7) : (7'h42))))) ?
                      wire87 : (^((!(wire93 <= wire93)) ^~ {(~wire91)})));
  assign wire98 = ($unsigned(wire96[(2'h2):(1'h1)]) ^~ (wire93 ?
                      (($unsigned(wire89) ^~ (wire88 != wire93)) ~^ ((|(8'hba)) ?
                          (wire94 && wire87) : ((8'h9e) ?
                              wire92 : wire89))) : wire87[(4'hc):(4'h9)]));
  assign wire99 = (((~^{(~wire95), (~^wire87)}) ?
                          {$unsigned($unsigned(wire91)),
                              wire97} : $unsigned((8'ha7))) ?
                      (~^$unsigned((^~{wire92,
                          wire93}))) : $signed(wire95[(3'h6):(3'h6)]));
  assign wire100 = wire95;
  assign wire101 = ({(^$unsigned((wire98 != wire95)))} ?
                       wire97[(4'he):(4'ha)] : (~&(($signed(wire97) ?
                           wire95 : $unsigned(wire100)) ^~ {$unsigned(wire96),
                           wire92[(1'h1):(1'h0)]})));
  assign wire102 = (!$signed(wire97[(1'h0):(1'h0)]));
endmodule
