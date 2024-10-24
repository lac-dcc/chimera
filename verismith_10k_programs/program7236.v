module top
#(parameter param161 = ((7'h41) ? (~^((((8'hb6) ? (8'ha0) : (7'h40)) ? (^~(8'hac)) : ((8'hb9) ? (8'ha7) : (8'hb7))) ? {((8'hb4) < (8'h9e)), ((8'hb6) ? (8'hac) : (8'ha5))} : (!(^~(8'hb1))))) : (((((8'hb2) || (8'hbb)) ? ((8'h9c) < (8'ha3)) : (+(7'h41))) ? (~&((8'hb9) == (8'hb0))) : (((8'had) ? (8'ha4) : (8'hb1)) > {(8'hb1)})) | ({((8'ha3) + (8'h9c)), ((8'h9d) && (8'hba))} ? (|{(8'ha7), (7'h44)}) : {((8'hbe) ? (8'hba) : (7'h40))}))), 
parameter param162 = (((7'h42) == (~|param161)) - param161))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire156,
                 wire108,
                 wire107,
                 wire105,
                 wire7,
                 wire6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((((wire3 ?
          wire3 : wire2) && (~wire2)) >>> wire3) - $unsigned(({wire1} ?
          (wire1 ?
              wire0 : (8'ha9)) : (-wire2)))) <= {$unsigned($unsigned($unsigned(wire0)))});
      reg5 <= wire1;
    end
  assign wire6 = wire3[(2'h3):(1'h1)];
  assign wire7 = ($signed($signed((wire3 ?
                     $unsigned(wire0) : $unsigned(wire3)))) ^~ reg5[(4'hf):(4'ha)]);
  module8 #() modinst106 (.wire10(wire7), .wire11(reg5), .y(wire105), .clk(clk), .wire12(wire1), .wire9(reg4));
  assign wire107 = (!($signed($signed((^~(7'h40)))) ?
                       wire7[(3'h5):(3'h4)] : $unsigned(((-wire1) ?
                           (8'hbb) : (wire6 <= reg4)))));
  assign wire108 = wire6[(3'h4):(1'h0)];
  module109 #() modinst157 (wire156, clk, wire0, wire3, wire1, wire108);
  assign wire158 = ((wire1[(2'h3):(1'h0)] < $unsigned(wire3)) ?
                       wire3 : (~|wire107));
  assign wire159 = $signed($unsigned($unsigned(($unsigned(wire107) ~^ $signed(wire1)))));
  assign wire160 = $unsigned(((|(reg5 > wire108[(4'he):(4'hd)])) ?
                       wire107 : ($unsigned({(8'ha6), (8'hae)}) ?
                           (wire0[(5'h11):(5'h10)] != (reg5 ?
                               wire158 : wire156)) : (wire107 & $unsigned((8'haa))))));
endmodule

module module109
#(parameter param155 = (((7'h42) * (~&(((8'hb9) ? (8'hba) : (8'ha2)) ? {(8'hb9), (8'ha3)} : {(8'hbe)}))) == (~^((((8'hba) ? (8'hb3) : (8'hac)) && {(8'hb7), (8'hbb)}) ? {((8'ha8) ? (8'haf) : (8'hbe))} : {{(8'haf)}}))))
(y, clk, wire110, wire111, wire112, wire113);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire110;
  input wire [(5'h12):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire112;
  input wire [(5'h13):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  wire [(5'h12):(1'h0)] wire152;
  wire [(4'h9):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(4'hb):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire121;
  wire [(3'h5):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire124;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire149;
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire114,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire127,
                 wire130,
                 wire149,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg129,
                 reg128,
                 reg126,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire114 = (wire110[(4'h9):(3'h4)] ?
                       wire112 : ({$signed(wire113[(1'h1):(1'h0)]),
                           {(wire112 + wire110),
                               (&wire110)}} << $signed({$signed(wire110)})));
  always
    @(posedge clk) begin
      reg115 <= $unsigned(wire110);
      reg116 <= ((wire111[(4'h9):(3'h7)] ?
          $signed(wire112) : (~^$signed((|wire113)))) || wire110);
      reg117 <= $signed(wire112);
    end
  assign wire118 = $signed((($signed((wire111 <= wire111)) ?
                       wire112[(5'h11):(4'hc)] : ((wire111 >> reg115) >= {reg117})) >> wire111[(4'hd):(4'hc)]));
  assign wire119 = $unsigned($signed((~|(8'hb8))));
  assign wire120 = (((wire114 ?
                       $unsigned($signed(wire111)) : $unsigned(reg117)) <<< wire110[(4'hb):(1'h1)]) | (|(($unsigned(wire110) ?
                           (reg117 & reg117) : $signed(reg115)) ?
                       $unsigned($signed((8'ha0))) : (~^wire114))));
  assign wire121 = ((($unsigned(wire120[(3'h7):(1'h0)]) * $unsigned({wire120,
                           wire118})) ?
                       wire113[(2'h2):(2'h2)] : ((reg116[(4'hb):(3'h7)] ?
                               (wire114 - wire111) : $signed(reg117)) ?
                           wire114 : $signed(wire119))) ^ ((^~reg115[(2'h2):(2'h2)]) ?
                       reg115[(1'h1):(1'h0)] : (+$signed((8'hb3)))));
  assign wire122 = $signed($unsigned($signed($unsigned(wire112[(2'h3):(1'h1)]))));
  assign wire123 = $signed((&$signed(wire112)));
  assign wire124 = wire122;
  assign wire125 = wire111[(4'ha):(1'h0)];
  always
    @(posedge clk) begin
      reg126 <= ($unsigned((reg116 >>> ($unsigned(wire112) && {wire113}))) ?
          (wire110[(5'h13):(2'h3)] ?
              {(wire110[(4'hc):(3'h5)] ?
                      (wire113 << wire113) : $unsigned(wire110)),
                  wire120} : (((wire121 ^ wire111) <<< (+wire118)) ?
                  $unsigned(wire122) : {$signed(wire125),
                      wire118})) : wire125[(1'h1):(1'h0)]);
    end
  assign wire127 = (^~$unsigned(($unsigned((wire119 ? wire122 : wire124)) ?
                       (~|$unsigned(wire120)) : {wire120[(3'h6):(1'h0)],
                           (~&reg126)})));
  always
    @(posedge clk) begin
      reg128 <= (~^$signed((^{$unsigned(wire112),
          ((7'h42) ? wire111 : wire122)})));
      reg129 <= (~$unsigned((+wire122[(1'h1):(1'h1)])));
    end
  assign wire130 = reg115[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg131 <= $unsigned(wire125);
      reg132 <= (wire124[(3'h7):(2'h3)] ?
          ($unsigned(wire112[(3'h4):(1'h0)]) + wire120) : (({(wire112 ?
                      wire130 : (7'h42))} <= ($unsigned(wire112) ?
                  (wire114 * wire124) : wire127[(1'h1):(1'h1)])) ?
              ((8'ha8) ?
                  ((8'ha1) ?
                      $signed(wire123) : ((8'h9c) ^ wire120)) : $unsigned($unsigned(wire113))) : ($unsigned(reg129) ^~ ((wire122 <<< wire123) ?
                  $signed((7'h40)) : {reg131, wire113}))));
      reg133 <= $signed(($unsigned(({reg129} ^~ $signed(reg131))) ?
          ((+(wire123 || reg117)) ?
              ({wire120, wire110} ?
                  $signed(reg128) : {reg115,
                      wire124}) : $signed($signed(reg132))) : ($unsigned($signed(wire113)) ?
              ($signed(wire111) ?
                  $signed(wire121) : (reg131 + (8'hb5))) : reg129)));
      reg134 <= (&(reg126[(3'h4):(2'h2)] ^~ (~|$unsigned((~^wire113)))));
      reg135 <= $signed(reg116);
    end
  module136 #() modinst150 (wire149, clk, wire114, wire110, wire121, wire123, wire112);
  assign wire151 = ((wire125[(1'h1):(1'h1)] ?
                           (8'ha6) : (+$signed((^~wire112)))) ?
                       {{{$unsigned(reg131)}, $unsigned((wire124 && wire113))},
                           wire118} : ((((&reg135) >>> {(8'ha1)}) ?
                               reg134[(1'h1):(1'h1)] : $signed(((8'ha0) ?
                                   wire114 : (8'hbd)))) ?
                           (~&(^~{(8'hbf)})) : ((^~wire114) > wire123[(4'hf):(4'hf)])));
  assign wire152 = $unsigned((wire111 ? wire123 : {wire111}));
  assign wire153 = ({wire113,
                           ((|$unsigned((8'hac))) ?
                               wire130 : (-wire119[(4'ha):(3'h4)]))} ?
                       (+(~($unsigned(reg129) && $unsigned(reg133)))) : (-$unsigned(reg115[(2'h2):(1'h0)])));
  assign wire154 = $unsigned((7'h41));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire76;
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire20,
                 wire21,
                 wire38,
                 wire76,
                 reg19,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire13 = (&wire11);
  assign wire14 = wire10;
  assign wire15 = (&$signed({$unsigned(wire10[(1'h1):(1'h0)])}));
  assign wire16 = wire13;
  assign wire17 = wire15[(1'h1):(1'h0)];
  assign wire18 = ((((wire14 && $signed((8'hae))) >= $unsigned($signed(wire16))) - ($unsigned($signed(wire16)) ?
                          $unsigned($signed(wire15)) : $signed((wire11 ~^ wire11)))) ?
                      wire17[(4'hb):(2'h2)] : wire12);
  always
    @(posedge clk) begin
      reg19 <= wire9[(4'h9):(4'h8)];
    end
  assign wire20 = ((+((!(|wire10)) > ((wire13 ? wire10 : wire9) ?
                      (^wire16) : wire14[(3'h7):(2'h2)]))) <<< $unsigned((wire9[(4'hb):(2'h3)] >> reg19)));
  assign wire21 = wire17[(4'hc):(1'h0)];
  always
    @(posedge clk) begin
      reg22 <= wire15;
      if ($signed((~^wire15)))
        begin
          reg23 <= {reg22};
        end
      else
        begin
          if ($signed(($unsigned(($signed(reg23) ?
                  (wire17 ? (8'hb1) : wire16) : (reg19 ? reg22 : wire9))) ?
              wire17 : ($signed((wire10 << wire14)) + ($signed(wire17) + $unsigned(wire16))))))
            begin
              reg23 <= wire21;
              reg24 <= (~^(+$signed($unsigned((!(8'hbb))))));
            end
          else
            begin
              reg23 <= wire11[(1'h0):(1'h0)];
              reg24 <= wire21;
              reg25 <= {$signed(wire12),
                  $unsigned(($signed(wire10) ?
                      ((wire11 < reg23) && {wire21}) : (~wire20)))};
              reg26 <= $signed((~|wire18[(4'h8):(1'h0)]));
            end
          reg27 <= $signed((!$unsigned(((wire11 ?
              wire20 : reg26) ^ reg23[(4'h9):(3'h7)]))));
          reg28 <= (!({(~&wire21), (wire15 >= wire9)} ?
              ((wire14[(4'hd):(2'h2)] ?
                  (+wire13) : $signed(wire11)) + $signed(wire18[(4'he):(3'h6)])) : $unsigned($signed((wire17 ~^ wire9)))));
          reg29 <= reg23[(4'he):(4'ha)];
          reg30 <= $unsigned($unsigned($unsigned((((8'ha1) ~^ wire17) ?
              $signed(wire16) : (wire18 ? wire21 : wire11)))));
        end
      if (wire17[(1'h1):(1'h0)])
        begin
          reg31 <= reg28[(2'h3):(1'h0)];
          reg32 <= $unsigned((7'h44));
          reg33 <= ($unsigned({wire21[(2'h3):(1'h0)]}) ?
              (~(^wire14[(1'h1):(1'h0)])) : reg23[(3'h6):(3'h4)]);
        end
      else
        begin
          reg31 <= (reg32[(3'h6):(3'h6)] || $unsigned($signed((-{reg19}))));
          reg32 <= wire13;
          if ((-((~&$unsigned((reg31 ^ wire20))) != ({(reg24 == reg33)} ?
              (^$signed(reg23)) : $unsigned((reg33 ? (8'hb6) : wire11))))))
            begin
              reg33 <= $unsigned((~^((^~(reg22 ? wire18 : reg23)) ?
                  ($signed((7'h43)) ?
                      $signed(wire11) : $unsigned((8'ha6))) : wire12)));
              reg34 <= wire11[(3'h4):(2'h2)];
            end
          else
            begin
              reg33 <= reg24[(4'h9):(1'h0)];
              reg34 <= (({((reg24 ? wire12 : reg32) ?
                          $unsigned(reg28) : $unsigned(reg22))} + wire20) ?
                  wire12[(4'hd):(4'hb)] : reg22);
            end
          reg35 <= (~|$unsigned(({wire12[(1'h0):(1'h0)], reg34[(1'h1):(1'h1)]} ?
              (reg33[(2'h3):(2'h3)] ?
                  (reg30 ? reg30 : reg26) : (~^reg22)) : ({reg23,
                  reg27} << (wire11 ? reg31 : wire16)))));
        end
      reg36 <= wire10[(1'h1):(1'h0)];
      reg37 <= ($unsigned((reg23[(3'h5):(2'h3)] ?
          (8'h9f) : wire11[(2'h3):(2'h3)])) << $signed({(~|(wire16 <= wire15)),
          (reg26[(3'h4):(2'h2)] ? $unsigned(reg19) : reg23[(2'h2):(1'h0)])}));
    end
  assign wire38 = (wire18[(1'h0):(1'h0)] ?
                      $unsigned(($unsigned(((8'ha7) & reg27)) ?
                          reg22 : $signed(wire11[(2'h3):(2'h3)]))) : (wire10 <= {(^$signed(reg25)),
                          ((wire21 ? wire16 : reg35) && $unsigned(wire14))}));
  module39 #() modinst77 (.wire43(wire17), .clk(clk), .y(wire76), .wire40(wire13), .wire42(reg28), .wire41(wire38));
  module78 #() modinst100 (.clk(clk), .wire81(reg28), .y(wire99), .wire82(wire10), .wire79(wire38), .wire80(reg25));
  assign wire101 = $signed($unsigned($unsigned(((^wire17) >> wire17[(4'h9):(1'h1)]))));
  assign wire102 = reg29;
  assign wire103 = (wire13 * $signed(wire18));
  assign wire104 = ((reg34[(4'hc):(2'h3)] >= $unsigned($signed(wire18[(2'h3):(2'h2)]))) ?
                       {($unsigned($signed(reg28)) < ((-(7'h41)) ?
                               (8'hae) : ((8'ha2) - wire17)))} : wire20[(1'h0):(1'h0)]);
endmodule

module module78  (y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire82;
  input wire signed [(4'h9):(1'h0)] wire81;
  input wire [(5'h14):(1'h0)] wire80;
  input wire signed [(4'h8):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire signed [(4'ha):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 (1'h0)};
  assign wire83 = $signed(($unsigned({$unsigned((8'hb8)),
                          wire80[(3'h5):(3'h4)]}) ?
                      (~^$signed(((8'hbe) ~^ wire80))) : ($unsigned(wire82) ^~ $unsigned((wire81 << wire79)))));
  assign wire84 = {$unsigned($signed(wire80[(3'h6):(2'h2)])),
                      ($signed({$signed(wire83)}) * $signed($unsigned(wire80)))};
  assign wire85 = wire83;
  assign wire86 = wire82;
  assign wire87 = (~wire82[(1'h1):(1'h0)]);
  assign wire88 = wire83;
  assign wire89 = wire82[(2'h3):(2'h2)];
  assign wire90 = wire85[(3'h7):(3'h4)];
  assign wire91 = $signed($unsigned(wire85[(4'hc):(4'hb)]));
  assign wire92 = (^(~((8'hba) ?
                      $unsigned($unsigned(wire84)) : $unsigned($signed(wire87)))));
  assign wire93 = $signed(wire79);
  assign wire94 = (&$unsigned((-$unsigned((^wire93)))));
  assign wire95 = wire83;
  assign wire96 = (-wire87[(5'h10):(3'h4)]);
  assign wire97 = ((8'ha4) ? wire88[(3'h7):(2'h3)] : (~|(^(8'hbf))));
  assign wire98 = wire93[(4'hb):(3'h4)];
endmodule

module module39
#(parameter param75 = (8'hba))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire44;
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  assign y = {wire74,
                 wire72,
                 wire71,
                 wire70,
                 wire44,
                 reg73,
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
                 (1'h0)};
  assign wire44 = {$signed($signed($unsigned(wire42))), wire41[(2'h3):(2'h3)]};
  always
    @(posedge clk) begin
      if ((^~$signed($signed($unsigned(wire41)))))
        begin
          reg45 <= wire40;
          reg46 <= $unsigned((($unsigned($signed(wire42)) >> (-wire40[(3'h4):(1'h1)])) ?
              $signed((~^wire44)) : $signed(wire42[(1'h1):(1'h0)])));
        end
      else
        begin
          reg45 <= wire42[(1'h1):(1'h0)];
          if ((!$signed(($signed(wire43) ?
              ({wire44} ?
                  (wire42 < reg45) : (reg46 ?
                      reg46 : wire44)) : $signed((wire41 && reg45))))))
            begin
              reg46 <= $signed($signed((((wire44 ~^ wire41) ^ (+wire44)) ?
                  ((wire43 ?
                      reg46 : reg45) << wire42[(4'hb):(3'h5)]) : (~&(wire42 ?
                      reg45 : wire41)))));
              reg47 <= $unsigned((wire42[(3'h5):(1'h1)] ?
                  $signed($signed((^(8'ha9)))) : wire42));
            end
          else
            begin
              reg46 <= (~&$unsigned((~|reg45)));
              reg47 <= $signed($signed((+(7'h40))));
              reg48 <= ($signed((((reg45 ? (8'hbd) : wire43) ?
                          reg46[(1'h1):(1'h1)] : reg45[(2'h2):(1'h1)]) ?
                      $signed((~&(8'ha3))) : $signed($unsigned(wire43)))) ?
                  $signed(wire44[(4'ha):(3'h5)]) : wire44);
              reg49 <= $unsigned((|wire44));
            end
          if ((wire43[(4'hb):(3'h7)] ?
              ((8'haf) << wire44) : ($signed($signed({wire40, reg49})) ?
                  reg49[(5'h14):(4'ha)] : $unsigned((&wire40[(2'h2):(1'h1)])))))
            begin
              reg50 <= wire40[(4'hb):(2'h2)];
              reg51 <= (8'hab);
              reg52 <= reg45;
            end
          else
            begin
              reg50 <= (!(!reg47));
            end
          reg53 <= $unsigned((&(reg50 ?
              ($unsigned(reg52) ^ (reg45 && reg52)) : wire40[(3'h4):(2'h3)])));
        end
      reg54 <= $signed({$signed(wire41),
          {reg47[(2'h3):(2'h2)], (~^(&(8'hb9)))}});
      if (($signed(((7'h41) != ((^~reg47) & $unsigned(reg53)))) ?
          (reg45[(1'h1):(1'h0)] ?
              $signed(((reg46 <<< wire41) ?
                  (wire42 & wire41) : $signed(reg51))) : $signed(reg51)) : $unsigned(reg47)))
        begin
          reg55 <= {reg50};
        end
      else
        begin
          reg55 <= wire41[(3'h7):(3'h7)];
          reg56 <= $signed((8'hac));
          if ((($unsigned($signed((reg53 >> wire42))) ?
                  (-((reg54 ?
                      reg46 : reg49) == (reg54 != reg49))) : (~^wire44[(5'h15):(5'h13)])) ?
              (+wire43) : (~&(reg50 >= ((^~reg50) >>> (~^reg47))))))
            begin
              reg57 <= (8'haf);
              reg58 <= reg53;
              reg59 <= reg53;
              reg60 <= (^~(8'ha6));
              reg61 <= {((~^($unsigned(reg49) ?
                      reg58 : {(8'hb8)})) <= $signed((^(reg45 * reg59)))),
                  (~&(reg47 >= reg49[(4'he):(4'he)]))};
            end
          else
            begin
              reg57 <= $unsigned((|(({(8'ha7), reg54} ? wire42 : (^(8'hb7))) ?
                  reg51 : wire40)));
              reg58 <= (($unsigned($signed((reg50 <<< reg54))) ?
                      (~|{$unsigned(wire40),
                          $unsigned(reg60)}) : reg45[(4'ha):(3'h4)]) ?
                  (&(~^$unsigned({reg48,
                      reg60}))) : (-$unsigned(((reg59 != wire42) ?
                      (wire41 && reg47) : (^reg53)))));
              reg59 <= $unsigned($unsigned((((!wire41) ?
                      (reg57 ? reg61 : reg57) : (~|reg45)) ?
                  (wire42[(4'hc):(3'h4)] << (reg54 && reg57)) : ($signed(reg60) ^ $unsigned(reg53)))));
              reg60 <= $signed($signed(wire42[(3'h6):(1'h1)]));
              reg61 <= {($unsigned($signed({reg61, reg48})) ?
                      $unsigned($unsigned(reg61[(2'h3):(2'h3)])) : $signed((8'ha0)))};
            end
          reg62 <= $signed((&$unsigned($signed($unsigned(reg53)))));
          reg63 <= $signed((reg57[(2'h2):(2'h2)] ?
              (((~^(8'ha6)) ? (reg61 >> reg48) : $unsigned(reg49)) ?
                  (|(reg62 ?
                      wire40 : reg61)) : reg60[(1'h1):(1'h0)]) : (~&($unsigned(wire40) - $signed(reg53)))));
        end
      if (wire43[(4'h8):(3'h6)])
        begin
          reg64 <= (+(reg51 ?
              {$signed((-reg54)), $signed(reg61)} : reg49[(1'h1):(1'h1)]));
          reg65 <= $unsigned(wire44);
          reg66 <= (&reg54);
          reg67 <= $unsigned($signed((reg48[(1'h1):(1'h1)] ?
              reg57 : (~^{wire42}))));
          reg68 <= $unsigned($unsigned(($signed((reg48 >= wire41)) ?
              (~&$unsigned(wire43)) : reg45)));
        end
      else
        begin
          reg64 <= reg48;
          reg65 <= (8'hb1);
          reg66 <= ($signed(($signed(((8'haf) >> reg68)) ?
                  (reg66 && $unsigned(reg55)) : (((8'hb8) ? (7'h41) : reg53) ?
                      (reg66 == wire40) : reg62))) ?
              ((&reg60[(3'h6):(2'h3)]) ?
                  $unsigned($unsigned((reg58 ^ reg47))) : (^~reg64)) : reg54);
        end
      reg69 <= ($unsigned(($unsigned($unsigned(reg60)) <= ((!(8'hb4)) ?
              reg67[(4'hf):(3'h7)] : reg68[(3'h4):(3'h4)]))) ?
          {(((&wire44) ~^ $unsigned(reg68)) ?
                  (~|{reg56, reg56}) : $signed($signed(reg48))),
              (7'h43)} : $unsigned(($unsigned($signed(reg51)) << $unsigned({reg52,
              reg59}))));
    end
  assign wire70 = reg45[(1'h1):(1'h1)];
  assign wire71 = $signed($unsigned((^reg46[(4'ha):(3'h7)])));
  assign wire72 = ((wire41[(1'h1):(1'h1)] ?
                      (^~(reg66 * wire42[(3'h6):(2'h2)])) : $signed(($signed((8'had)) ?
                          $signed(reg67) : (wire70 | (8'haf))))) && reg56);
  always
    @(posedge clk) begin
      reg73 <= $signed(wire43);
    end
  assign wire74 = $signed(wire41[(2'h3):(1'h1)]);
endmodule

module module136
#(parameter param148 = (+((!((!(8'hb5)) ? ((8'h9d) ^ (7'h42)) : ((8'hbb) ? (8'hac) : (8'ha8)))) ? {(((8'haf) >> (8'ha4)) ? ((7'h42) ~^ (7'h41)) : ((8'hb4) ? (7'h42) : (8'hac)))} : (|({(8'hab)} ? ((8'haa) ^ (8'h9c)) : ((7'h44) ? (8'ha0) : (8'ha2)))))))
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire141;
  input wire [(4'h9):(1'h0)] wire140;
  input wire [(3'h7):(1'h0)] wire139;
  input wire [(5'h15):(1'h0)] wire138;
  input wire [(2'h3):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(4'hf):(1'h0)] wire142;
  assign y = {wire147, wire146, wire145, wire144, wire143, wire142, (1'h0)};
  assign wire142 = $signed($unsigned(wire139[(3'h4):(2'h2)]));
  assign wire143 = (&$signed((~|$signed(((8'ha2) ? wire142 : wire142)))));
  assign wire144 = {$signed($signed($unsigned(wire143))), wire140};
  assign wire145 = wire143[(4'hf):(4'hb)];
  assign wire146 = wire143[(4'hf):(4'h8)];
  assign wire147 = $signed((wire144[(3'h5):(3'h4)] >= (wire137 ?
                       wire145 : $unsigned({wire145}))));
endmodule
