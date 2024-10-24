module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire147;
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire147,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = $unsigned({(wire2[(3'h5):(2'h3)] ?
                         wire1[(3'h5):(1'h1)] : ($signed(wire3) ?
                             $signed(wire0) : (wire2 | wire1))),
                     {wire0[(4'hd):(1'h1)], (~((8'ha7) ~^ wire2))}});
  assign wire6 = $signed(wire5);
  always
    @(posedge clk) begin
      reg7 <= {$unsigned(wire6[(4'h8):(3'h5)]), wire2[(2'h3):(2'h2)]};
      reg8 <= $signed(({(8'ha8)} == $signed(wire2[(1'h0):(1'h0)])));
      reg9 <= $unsigned($unsigned((7'h40)));
    end
  assign wire10 = ($signed(($signed(wire6) * $signed(reg8[(2'h2):(2'h2)]))) < $unsigned({wire4[(4'h8):(4'h8)],
                      $unsigned($signed((8'hb2)))}));
  assign wire11 = (+{$signed($signed($unsigned(wire4)))});
  assign wire12 = $unsigned(wire1);
  assign wire13 = $unsigned($unsigned((^~{(~|wire11)})));
  module14 #() modinst148 (.wire17(wire13), .wire16(wire3), .wire18(reg9), .wire15(wire10), .y(wire147), .clk(clk));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire145;
  wire signed [(5'h12):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  assign y = {wire145,
                 wire129,
                 wire76,
                 wire75,
                 wire73,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire34,
                 wire25,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg23,
                 reg24,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  assign wire19 = (wire16 ?
                      (((~wire16) && (^~(~|wire17))) <<< wire17) : wire17[(2'h3):(2'h3)]);
  assign wire20 = wire17;
  assign wire21 = $signed($unsigned($unsigned($signed((!wire15)))));
  assign wire22 = wire15[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg23 <= ({({wire22[(2'h2):(1'h1)]} ?
              ({(8'h9e), wire16} <<< $signed(wire15)) : wire22),
          ($signed((wire19 ? wire22 : wire16)) ?
              $signed($unsigned(wire22)) : wire18[(3'h6):(1'h0)])} * ($signed(wire19) ?
          $signed({(+wire22)}) : wire15[(3'h4):(2'h2)]));
      reg24 <= (|$signed($signed(((wire21 | wire22) || $signed(reg23)))));
    end
  assign wire25 = (8'h9f);
  always
    @(posedge clk) begin
      if (wire18[(3'h7):(2'h2)])
        begin
          reg26 <= $unsigned((wire25[(1'h1):(1'h0)] || (~&($signed(wire22) ?
              (wire21 ? wire19 : wire25) : (wire22 ? wire15 : wire22)))));
        end
      else
        begin
          reg26 <= $signed(wire25);
          reg27 <= (~&reg26);
          reg28 <= (&wire19);
          if (reg24)
            begin
              reg29 <= reg28[(3'h6):(1'h1)];
              reg30 <= reg24;
              reg31 <= ((^~$signed((~^$signed(wire15)))) > reg30[(2'h2):(1'h0)]);
              reg32 <= ((~|$unsigned((8'hba))) ?
                  ((reg27[(1'h0):(1'h0)] & $unsigned(wire19[(4'he):(4'ha)])) ?
                      reg29[(2'h2):(1'h1)] : ($signed({wire15}) & reg26[(2'h2):(1'h1)])) : (~wire18));
            end
          else
            begin
              reg29 <= ($signed((&$unsigned((reg24 ? reg23 : reg26)))) ?
                  $signed((|$signed((reg24 ? reg31 : (8'hbd))))) : (8'ha6));
            end
          reg33 <= reg29;
        end
    end
  assign wire34 = $signed($signed($signed((reg32[(2'h3):(1'h0)] - $signed(reg33)))));
  module35 #() modinst48 (.wire39(reg31), .wire37(wire16), .clk(clk), .wire36(reg33), .y(wire47), .wire38(wire22));
  assign wire49 = (!((reg28[(4'hb):(2'h2)] ?
                      $signed(reg27) : (wire21[(2'h2):(2'h2)] ?
                          (^~wire19) : ((8'h9e) + reg33))) && $signed((~$signed(wire17)))));
  assign wire50 = $unsigned((~&((8'hb4) == (~^$unsigned(reg23)))));
  assign wire51 = wire16[(3'h5):(3'h5)];
  assign wire52 = (8'hab);
  module53 #() modinst74 (wire73, clk, wire49, reg23, reg24, wire34);
  assign wire75 = $signed(wire73);
  assign wire76 = $signed($unsigned($signed(wire21[(3'h6):(3'h6)])));
  module77 #() modinst130 (.wire80(wire19), .wire81(wire51), .wire78(wire18), .clk(clk), .wire79(wire22), .y(wire129));
  module131 #() modinst146 (.wire133(wire76), .wire136(wire17), .wire134(wire19), .y(wire145), .wire132(wire50), .clk(clk), .wire135(reg29));
endmodule

module module131  (y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire136;
  input wire signed [(2'h3):(1'h0)] wire135;
  input wire signed [(4'h8):(1'h0)] wire134;
  input wire signed [(2'h2):(1'h0)] wire133;
  input wire [(5'h12):(1'h0)] wire132;
  wire [(4'h9):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire142;
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg137 <= {(~^$signed(wire133[(2'h2):(1'h1)])), wire134};
      reg138 <= wire133;
      reg139 <= {reg138,
          (((!$unsigned(reg137)) ?
              $unsigned((^~(8'h9f))) : wire132[(2'h2):(1'h1)]) < wire134)};
      reg140 <= $unsigned((+wire135));
      reg141 <= reg137[(3'h5):(3'h4)];
    end
  assign wire142 = ($signed($signed((|$signed(wire133)))) | $unsigned({(!$signed((8'hba)))}));
  assign wire143 = (^~$unsigned((((~^wire134) ?
                       $unsigned(wire132) : {(8'ha8)}) > wire135)));
  assign wire144 = ((~^(~&$unsigned(reg141))) ?
                       (^(8'hbf)) : (|(wire135[(1'h0):(1'h0)] < $unsigned(wire134))));
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h250):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire80;
  input wire [(5'h10):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(4'hb):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire signed [(5'h12):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire103,
                 wire102,
                 wire101,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
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
                 reg87,
                 (1'h0)};
  assign wire82 = wire79;
  assign wire83 = {{$unsigned((^~{wire78, wire80})),
                          (-($unsigned(wire78) > $signed(wire81)))},
                      (8'hbb)};
  assign wire84 = wire83[(5'h12):(2'h3)];
  assign wire85 = $unsigned({wire82[(1'h1):(1'h1)],
                      (((wire82 ? wire78 : wire83) * (|wire82)) <<< wire80)});
  assign wire86 = wire80;
  always
    @(posedge clk) begin
      reg87 <= wire80;
    end
  assign wire88 = {(|{wire86}), {(8'ha6)}};
  assign wire89 = $signed(($unsigned(wire78) ~^ ($unsigned(wire78) ?
                      (^~reg87[(4'hb):(4'h8)]) : wire85[(1'h0):(1'h0)])));
  assign wire90 = wire81[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg91 <= ({(wire79[(4'he):(4'ha)] ^~ (~&(wire90 << reg87))),
              $unsigned(wire90[(3'h5):(2'h3)])} ?
          wire78 : $signed(wire90[(3'h5):(3'h4)]));
      reg92 <= (+$unsigned({(~|wire83), {$unsigned(wire89), (!wire81)}}));
    end
  always
    @(posedge clk) begin
      if ($unsigned((^({(reg92 ?
              wire90 : (7'h44))} + $signed(((8'hbd) < (8'hbe)))))))
        begin
          reg93 <= wire78;
        end
      else
        begin
          reg93 <= reg92;
          if ((^~({(~&(wire84 ? (8'ha2) : wire86))} < {reg91, (-{(8'hbd)})})))
            begin
              reg94 <= wire81[(3'h4):(2'h3)];
              reg95 <= wire88;
            end
          else
            begin
              reg94 <= (~|(~|reg94));
              reg95 <= $unsigned((^~(((wire89 ?
                      wire78 : wire86) && wire83[(5'h11):(4'hf)]) ?
                  ((wire84 || reg87) ?
                      $signed(wire88) : $unsigned(wire81)) : wire84)));
              reg96 <= (wire83 >> $unsigned($unsigned($unsigned((wire89 && wire81)))));
              reg97 <= ((reg92[(3'h5):(1'h1)] ?
                  $signed($signed($unsigned(wire86))) : {$signed((|(8'h9e)))}) ^ reg94[(3'h7):(3'h4)]);
            end
          reg98 <= ($signed(($signed(wire90[(4'hc):(4'hb)]) ?
              wire80 : ($signed(reg92) ?
                  reg95 : $signed(wire88)))) < {$signed(((!wire78) == $signed(reg92))),
              ({(wire89 & wire85), $signed(reg94)} ?
                  $unsigned(wire80) : $signed((8'hb1)))});
          reg99 <= wire89[(2'h2):(1'h1)];
          reg100 <= wire90;
        end
    end
  assign wire101 = (reg87[(4'h8):(4'h8)] ?
                       reg99[(3'h4):(1'h0)] : (^~$unsigned(wire80)));
  assign wire102 = $signed((~^($signed(reg92[(3'h4):(1'h1)]) ?
                       ($unsigned(wire79) != (wire82 ?
                           reg100 : wire78)) : $signed(((8'ha3) >>> wire79)))));
  assign wire103 = ($unsigned($signed({(+wire101)})) <<< reg91[(5'h11):(5'h11)]);
  always
    @(posedge clk) begin
      if (wire85)
        begin
          reg104 <= (~|$unsigned((((wire88 || (8'hbe)) <= (wire80 ?
                  (7'h42) : reg91)) ?
              $signed(reg97) : ((wire80 >>> (8'ha4)) || ((8'hb5) ?
                  wire81 : (8'ha2))))));
          reg105 <= (|($unsigned($signed((wire78 ? wire81 : reg98))) ?
              (+(^~((8'hb3) >= reg104))) : (~wire81)));
          reg106 <= {reg92};
          reg107 <= (-(&((-(reg96 ? wire86 : reg105)) ?
              (wire88[(1'h1):(1'h1)] <= $signed(wire85)) : {{reg87},
                  ((8'ha1) ? wire79 : reg104)})));
          reg108 <= wire85[(2'h3):(1'h1)];
        end
      else
        begin
          reg104 <= (^($unsigned(((wire86 ? reg95 : wire90) ?
                  reg104[(4'hb):(4'h9)] : $unsigned(reg107))) ?
              reg96[(2'h3):(1'h1)] : (~&$unsigned({(8'ha0), reg106}))));
        end
      reg109 <= wire89[(3'h4):(1'h0)];
      if ($unsigned(reg105[(4'he):(3'h4)]))
        begin
          if ((wire101[(4'hf):(4'hb)] ?
              ((~^$signed(reg108)) ?
                  ((+{wire86, wire85}) ?
                      (wire101 ?
                          (reg108 << wire86) : {reg107}) : $unsigned($signed(reg105))) : wire81[(3'h4):(1'h1)]) : (!$unsigned($signed((~&wire85))))))
            begin
              reg110 <= (wire86[(3'h4):(3'h4)] + (!{(-wire81),
                  {(reg104 ? reg93 : reg93)}}));
              reg111 <= wire82;
            end
          else
            begin
              reg110 <= $signed((($signed((!wire102)) ?
                  $signed((+wire85)) : (&(reg97 ?
                      (8'h9d) : (8'haa)))) + {(reg104[(5'h12):(4'h8)] ?
                      $unsigned(reg91) : $unsigned(wire82))}));
              reg111 <= wire79;
              reg112 <= {wire90,
                  $unsigned((wire79[(4'hd):(2'h3)] <= $unsigned((wire102 ?
                      reg107 : reg106))))};
              reg113 <= ($signed(reg112) ?
                  {(($signed((8'hb2)) ?
                          (wire103 >> (8'hbb)) : wire84[(3'h4):(2'h3)]) > (wire84[(4'h8):(2'h3)] <= (8'hbf))),
                      $unsigned(((~^reg91) ?
                          $signed(reg99) : (~^reg95)))} : wire101[(3'h5):(2'h2)]);
            end
          if (($unsigned(reg110) + wire101[(3'h4):(1'h1)]))
            begin
              reg114 <= $unsigned((~|wire88[(3'h6):(3'h5)]));
              reg115 <= $unsigned(wire85[(1'h0):(1'h0)]);
              reg116 <= reg97;
              reg117 <= ((^reg93[(1'h1):(1'h1)]) - (^~reg106));
            end
          else
            begin
              reg114 <= $unsigned($unsigned(wire82));
              reg115 <= $signed(($unsigned($unsigned(wire101)) + ((|{reg95}) << wire86)));
            end
          reg118 <= $unsigned((wire103 ? (~^wire82[(2'h2):(1'h1)]) : wire85));
          reg119 <= ((reg104[(5'h10):(2'h3)] ?
                  wire89[(4'hd):(4'h8)] : wire79[(3'h5):(3'h5)]) ?
              {($signed(reg99) ^~ $unsigned((reg87 * wire86)))} : ((^~$unsigned($signed(wire89))) ?
                  reg110 : $unsigned({$unsigned(reg113), $unsigned((8'ha2))})));
          reg120 <= (({(wire103[(3'h5):(3'h5)] ?
                  reg115[(3'h7):(3'h6)] : ((8'hb6) <= (8'haf))),
              ({reg100} ?
                  $signed(reg104) : $signed(wire78))} * (8'hb7)) >= reg96[(3'h4):(1'h0)]);
        end
      else
        begin
          reg110 <= ((8'ha1) >>> (($signed($signed(wire86)) * ((8'hb0) ?
                  $unsigned(reg97) : (reg105 ? wire83 : (8'h9c)))) ?
              $unsigned((+(reg107 ? reg107 : reg87))) : reg112));
          reg111 <= (~|(reg106[(4'hf):(3'h6)] && $unsigned((|$signed(wire86)))));
          reg112 <= ((~reg109[(4'h9):(2'h3)]) > $unsigned($signed(((wire81 ?
              reg116 : reg91) | (wire83 || reg114)))));
          reg113 <= ((8'hbd) ?
              (wire90[(2'h2):(1'h0)] <= $signed((~^$unsigned(reg104)))) : $unsigned($signed((~|$signed(reg110)))));
          reg114 <= (^~(&(($signed(reg113) >> reg112[(2'h3):(2'h3)]) ?
              ((reg108 ?
                  (8'hb0) : reg98) || $unsigned(wire102)) : $signed((reg92 ?
                  reg116 : wire80)))));
        end
    end
  assign wire121 = $unsigned({((reg113[(4'hf):(4'he)] <= $unsigned((8'hb1))) ?
                           $signed(wire82[(3'h6):(3'h4)]) : (reg96[(2'h3):(1'h1)] >>> (~&reg98)))});
  assign wire122 = $unsigned((($unsigned($signed(wire89)) ?
                           reg113 : $unsigned($signed(reg118))) ?
                       $unsigned(wire86[(2'h3):(1'h0)]) : reg99[(2'h3):(1'h1)]));
  assign wire123 = $unsigned(reg107[(3'h5):(1'h0)]);
  assign wire124 = reg116;
  assign wire125 = reg112[(1'h0):(1'h0)];
  assign wire126 = $signed(($signed({(wire83 ? (8'h9e) : wire79),
                       (wire125 ? reg112 : reg108)}) ^ reg104[(4'ha):(4'h8)]));
  assign wire127 = {$signed(($signed($unsigned(reg99)) ?
                           (~|reg114) : ($signed(wire125) <<< (&reg119)))),
                       $signed(wire102[(4'hd):(2'h2)])};
  assign wire128 = {$unsigned($signed((8'haf))), {reg107}};
endmodule

module module53
#(parameter param72 = ((!{(^(~&(8'h9d))), (((8'hb1) ~^ (8'ha8)) <<< ((7'h42) <<< (7'h44)))}) ? ((~|(((8'hb1) ? (8'h9c) : (8'hb1)) > ((8'h9d) ? (8'hb9) : (8'hb2)))) ? ((+((8'hbb) ~^ (8'hbf))) ? ((~^(8'haf)) << ((8'hb8) ? (8'hbf) : (8'hb9))) : (^~(!(8'hba)))) : (+(~((8'ha7) || (8'h9e))))) : ((|(~|{(8'hbb)})) <= (|{{(8'ha4), (8'ha5)}}))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  input wire [(4'hf):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire58 = wire54;
  assign wire59 = wire57[(1'h1):(1'h1)];
  assign wire60 = (8'hb6);
  assign wire61 = ((&wire57) ? wire57 : $signed(wire55));
  assign wire62 = wire60[(4'hd):(1'h0)];
  assign wire63 = $signed(wire58[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg64 <= ((^~$unsigned($signed(wire63))) ?
          $signed((~|$unsigned(wire63[(3'h7):(3'h4)]))) : (~&(~$unsigned((wire62 & wire60)))));
      reg65 <= $unsigned($signed((($unsigned(wire63) * wire54[(2'h2):(1'h1)]) * wire57)));
      reg66 <= (~|$unsigned(({$signed((8'hae))} ~^ $unsigned($unsigned(wire61)))));
    end
  assign wire67 = wire59;
  assign wire68 = reg65;
  assign wire69 = $signed(wire68[(3'h6):(2'h3)]);
  assign wire70 = $unsigned(wire59);
  assign wire71 = wire54;
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire39;
  input wire signed [(3'h7):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire37;
  input wire signed [(4'hf):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  assign y = {wire46, wire45, wire44, wire43, wire42, wire41, wire40, (1'h0)};
  assign wire40 = (wire39 ?
                      {(~^(|(wire37 ^ wire36))),
                          ($signed(wire39) >> ((wire37 ? wire38 : wire37) ?
                              {wire39} : $unsigned((8'ha0))))} : wire38);
  assign wire41 = wire39[(4'h9):(3'h4)];
  assign wire42 = (^$unsigned($unsigned(wire40)));
  assign wire43 = ((wire41[(3'h6):(3'h6)] ?
                          (~^(~|{wire41})) : $unsigned($unsigned($unsigned(wire40)))) ?
                      $unsigned((8'hbe)) : ({wire36[(1'h1):(1'h1)]} ?
                          (8'ha6) : (8'hb7)));
  assign wire44 = wire39;
  assign wire45 = $signed($signed({wire39[(4'h9):(3'h5)]}));
  assign wire46 = (((-wire41) <= (|wire43)) ?
                      ($signed($signed((wire38 ?
                          wire44 : wire44))) == wire45[(1'h1):(1'h0)]) : (^~(^~(wire40[(1'h1):(1'h1)] ^~ wire43))));
endmodule
