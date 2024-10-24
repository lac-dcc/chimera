module top
#(parameter param135 = {(((^~((8'h9d) - (8'ha6))) ? (((8'ha4) ^~ (7'h44)) || (~|(8'hb9))) : ((^(8'ha7)) ? ((8'ha9) ^~ (8'haa)) : {(8'h9c), (8'ha8)})) ? ({(8'hbc), ((8'ha1) >>> (7'h42))} ^ ({(8'ha3), (8'ha0)} ? {(7'h40), (8'hba)} : {(8'ha9), (8'hb7)})) : (~&(((8'hac) < (8'hac)) ~^ {(8'ha3), (8'hae)}))), (!(8'ha0))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(5'h10):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire129;
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  assign y = {wire131,
                 wire90,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire70,
                 wire92,
                 wire93,
                 wire94,
                 wire129,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire3[(4'hc):(4'hc)];
  assign wire6 = (^~{{$unsigned(wire2[(5'h12):(3'h4)]),
                         ((wire0 & wire1) ? {wire2, (8'hb8)} : wire1)}});
  assign wire7 = wire6;
  module8 #() modinst71 (.wire10(wire1), .clk(clk), .wire9(wire6), .y(wire70), .wire11(wire2), .wire12(wire3), .wire13(wire7));
  assign wire72 = (($unsigned(wire4) | wire2[(5'h13):(4'hc)]) ?
                      ((8'had) ?
                          ({wire0} != (^~wire2)) : wire6) : {(-wire70[(3'h4):(2'h3)])});
  assign wire73 = ($signed(((wire5 ?
                          $signed((8'h9c)) : wire1[(4'hd):(3'h5)]) << $unsigned(wire6))) ?
                      (^~$signed(wire1[(3'h7):(3'h6)])) : $signed((8'hbb)));
  assign wire74 = {{wire1[(1'h1):(1'h1)]},
                      $unsigned((wire73[(1'h0):(1'h0)] + $unsigned(wire70)))};
  assign wire75 = ((wire7 ? (-(|wire7[(3'h4):(1'h1)])) : (8'ha5)) ?
                      {(wire4[(4'hf):(3'h7)] ?
                              (wire6 >>> (wire7 ?
                                  wire4 : wire74)) : wire74[(2'h2):(2'h2)])} : wire1[(1'h1):(1'h1)]);
  module76 #() modinst91 (.clk(clk), .wire77(wire2), .wire81(wire0), .wire80(wire5), .wire78(wire6), .y(wire90), .wire79(wire75));
  assign wire92 = wire2;
  assign wire93 = $signed(((-wire7[(2'h3):(1'h0)]) ?
                      (^~{$unsigned(wire0)}) : wire1));
  assign wire94 = wire7[(3'h4):(2'h2)];
  module95 #() modinst130 (.clk(clk), .wire98(wire75), .wire96(wire93), .y(wire129), .wire97(wire7), .wire100(wire92), .wire99(wire0));
  assign wire131 = ((-wire74[(4'he):(4'hb)]) ?
                       ((wire1 ?
                               wire5[(4'h9):(4'h8)] : ($unsigned(wire3) << $unsigned((8'haf)))) ?
                           ((!$unsigned(wire6)) ~^ $signed((-wire1))) : $signed($unsigned(((8'ha1) ?
                               wire72 : (7'h44))))) : (-(|(-wire6))));
  always
    @(posedge clk) begin
      reg132 <= $signed({{((wire6 ? wire70 : wire1) != (+wire70)),
              ((wire93 <= wire70) ~^ (wire6 | wire72))},
          wire129});
      reg133 <= $unsigned($signed((wire2 <<< ($signed(wire2) & (wire74 ?
          wire94 : wire0)))));
      reg134 <= $unsigned((8'hbc));
    end
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire100;
  input wire [(3'h5):(1'h0)] wire99;
  input wire signed [(3'h5):(1'h0)] wire98;
  input wire [(5'h13):(1'h0)] wire97;
  input wire signed [(5'h13):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire123;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire101;
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire102,
                 wire101,
                 reg122,
                 reg121,
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
                 reg103,
                 (1'h0)};
  assign wire101 = ((~|$signed((&(^wire96)))) << ((wire99[(2'h3):(2'h2)] << wire96) ?
                       ((((7'h40) >> wire97) < $unsigned(wire97)) ?
                           ($signed(wire97) > wire96[(5'h10):(4'h9)]) : ($unsigned(wire98) ?
                               wire97 : $signed(wire97))) : $signed(((wire100 ?
                           wire99 : wire96) + (~|wire99)))));
  assign wire102 = (&$unsigned($unsigned((wire97 ^~ $signed(wire96)))));
  always
    @(posedge clk) begin
      if ({{($signed($signed(wire100)) ?
                  wire96[(4'hd):(4'hd)] : (wire100 | wire96)),
              $signed(($unsigned(wire100) ?
                  (wire100 ? wire101 : wire97) : {wire98}))}})
        begin
          reg103 <= (^~((^((wire96 ^ wire101) ?
                  wire101[(4'hb):(4'h8)] : $unsigned((8'hbe)))) ?
              wire99 : (-((wire96 ? (8'hac) : wire99) | (wire102 ?
                  wire98 : wire98)))));
          reg104 <= $signed((+$unsigned($signed(wire99))));
          reg105 <= ($signed(($signed(((8'haa) ?
              reg103 : wire102)) >> $signed(wire98))) ^ wire96[(4'ha):(4'h9)]);
          reg106 <= ($signed(((((7'h44) & reg103) || {reg104, (8'ha0)}) ?
                  ((wire102 & wire99) && (reg103 ?
                      wire100 : wire102)) : $unsigned((^reg103)))) ?
              $signed(wire96) : ($unsigned((-(wire101 ?
                  (8'hb8) : wire100))) >= $signed({reg105})));
          reg107 <= (&((+((!wire99) == $unsigned(wire102))) ?
              (wire102[(3'h6):(2'h2)] | {{wire96},
                  $unsigned(reg105)}) : (+reg106[(5'h12):(4'hf)])));
        end
      else
        begin
          reg103 <= $unsigned(reg106[(4'ha):(3'h7)]);
          if (((reg105[(3'h6):(2'h2)] ?
                  wire96 : {($unsigned(wire99) > {wire101})}) ?
              $unsigned(reg105) : wire100[(2'h2):(2'h2)]))
            begin
              reg104 <= (($signed({wire102[(1'h0):(1'h0)],
                      ((7'h44) ? reg104 : reg106)}) + (reg107[(3'h4):(3'h4)] ?
                      ((wire101 ? wire101 : wire101) ?
                          (reg106 < reg107) : ((8'ha9) || wire96)) : reg105[(1'h1):(1'h0)])) ?
                  {wire100} : wire100[(3'h5):(1'h1)]);
              reg105 <= ((($signed(wire98) <<< ($signed(reg103) ?
                  $unsigned(reg104) : (reg103 && wire100))) | wire100) != wire99);
              reg106 <= ($unsigned(($signed({wire96}) & $unsigned((reg104 == wire100)))) ?
                  (reg104 ?
                      $unsigned($unsigned(wire97[(3'h4):(1'h0)])) : reg103[(1'h1):(1'h1)]) : reg103[(1'h1):(1'h1)]);
              reg107 <= ($unsigned(wire97[(4'he):(4'ha)]) ?
                  {$unsigned(reg105)} : (+$unsigned((^$signed(wire98)))));
            end
          else
            begin
              reg104 <= (~($unsigned((&wire100[(3'h4):(1'h1)])) ?
                  reg103[(3'h4):(3'h4)] : (~wire102)));
              reg105 <= (reg107[(4'hf):(3'h7)] ?
                  (&(wire96[(4'ha):(4'h9)] ?
                      $signed(reg103) : ((-reg106) ?
                          wire99[(2'h2):(2'h2)] : (~^reg106)))) : (+wire97[(5'h10):(1'h1)]));
            end
          reg108 <= $signed($signed((^wire97)));
          if ({(-(8'ha4)), {(~|wire101[(3'h6):(3'h5)]), wire98[(3'h4):(1'h0)]}})
            begin
              reg109 <= reg108;
            end
          else
            begin
              reg109 <= (&$signed((!$signed((reg103 ? wire96 : wire102)))));
              reg110 <= (($signed((((7'h44) ?
                  reg108 : reg103) >= wire96[(2'h3):(1'h0)])) == $unsigned((((8'hb2) ?
                  wire96 : wire98) < wire99))) >>> (^~wire96));
              reg111 <= reg109[(3'h6):(3'h5)];
            end
        end
      if ((^~$signed($unsigned(wire102))))
        begin
          reg112 <= (wire98[(2'h2):(1'h0)] ?
              $signed($unsigned(reg111[(4'ha):(1'h0)])) : $signed(($unsigned($unsigned(wire99)) ?
                  reg109[(3'h4):(1'h0)] : (~(wire100 ? reg105 : reg110)))));
          if ((-{(+$signed((-reg108)))}))
            begin
              reg113 <= ($signed((7'h42)) | {reg110});
              reg114 <= $signed(wire101[(4'hb):(2'h2)]);
              reg115 <= {wire96[(4'ha):(4'ha)]};
            end
          else
            begin
              reg113 <= (~^{({reg107[(3'h5):(1'h1)],
                      $signed((8'ha0))} << {reg104})});
              reg114 <= $unsigned($signed(($signed((reg112 && reg106)) ?
                  (~^reg114) : reg104)));
            end
        end
      else
        begin
          if ($unsigned((reg107[(2'h3):(1'h1)] ?
              $signed($unsigned($unsigned((8'ha2)))) : (((+reg115) ?
                      ((8'ha8) <<< wire100) : $signed(reg108)) ?
                  (wire102 == reg107) : $unsigned({wire96})))))
            begin
              reg112 <= $signed(reg112);
              reg113 <= $unsigned((!$unsigned($unsigned({reg105, reg115}))));
              reg114 <= $unsigned(reg110[(4'h8):(1'h0)]);
            end
          else
            begin
              reg112 <= $unsigned((^($signed($unsigned(wire102)) <= $unsigned($signed((8'ha9))))));
              reg113 <= (~&(|((8'had) ?
                  $unsigned($signed(wire102)) : (~&$signed(wire100)))));
              reg114 <= reg103;
              reg115 <= (reg105[(3'h5):(3'h4)] - ((^($signed((8'hb1)) ?
                      $signed(reg106) : (reg105 > reg109))) ?
                  (reg106[(5'h12):(4'hd)] || $unsigned(((8'hb6) || reg114))) : $signed(reg105)));
            end
        end
      if (wire97)
        begin
          reg116 <= (+(wire97 > (reg115 ~^ (wire97 ?
              {reg114, reg111} : (!wire102)))));
          reg117 <= ({(reg107 ?
                  ($unsigned(reg110) ^~ $signed(wire98)) : reg110[(1'h1):(1'h1)]),
              $signed(reg103[(2'h3):(2'h2)])} || $unsigned($signed(($unsigned(reg116) ?
              (wire100 * wire97) : $unsigned((8'hbe))))));
          if ((reg113[(2'h2):(1'h1)] ?
              {wire101[(4'hb):(1'h1)],
                  reg108} : $unsigned(($unsigned(reg111[(1'h0):(1'h0)]) ?
                  (wire101 ?
                      reg108 : ((8'h9f) | reg110)) : $signed($signed(wire97))))))
            begin
              reg118 <= {wire102};
              reg119 <= ((wire100 ?
                  ($unsigned((!reg114)) & reg113[(3'h5):(3'h5)]) : ($unsigned({(8'ha7),
                          (8'hb4)}) ?
                      wire100 : {(7'h43), reg104})) == ({reg118[(3'h4):(3'h4)],
                  ($signed(reg115) ?
                      (wire101 >>> reg115) : (reg106 && reg109))} - ((reg118[(4'ha):(2'h2)] ?
                      (reg115 ? (8'ha8) : reg115) : $unsigned(reg106)) ?
                  {(+reg109)} : $signed($signed(wire100)))));
              reg120 <= wire98[(2'h3):(2'h2)];
              reg121 <= (!reg109);
            end
          else
            begin
              reg118 <= (|($unsigned((^(reg108 | reg113))) ?
                  (($signed(reg115) & wire100) << reg119[(3'h4):(2'h2)]) : ((reg118[(4'ha):(3'h6)] ?
                          reg113 : (~&reg116)) ?
                      (wire102 != reg107) : ($signed(reg106) > (reg121 && reg121)))));
              reg119 <= {((8'hb4) | reg111),
                  $signed((({reg107} ?
                      $unsigned(wire96) : wire101) > wire101))};
              reg120 <= ((8'hba) ?
                  reg120[(4'ha):(1'h1)] : ((reg115[(2'h3):(1'h1)] ?
                          $unsigned((wire100 == wire102)) : $signed(reg111)) ?
                      ({(^~reg104), $unsigned(reg109)} ?
                          reg113 : ({reg118, reg106} ?
                              reg110[(3'h6):(2'h2)] : $signed(reg105))) : {reg115,
                          reg108[(2'h2):(1'h1)]}));
            end
        end
      else
        begin
          reg116 <= $unsigned(wire100);
          reg117 <= $signed($unsigned($signed($unsigned(((8'ha2) ?
              reg105 : reg108)))));
          reg118 <= $signed((!$signed($unsigned((reg110 << (8'ha8))))));
          reg119 <= reg104;
          reg120 <= ($signed(reg111[(3'h4):(1'h0)]) || (^(wire96 ?
              reg113 : $unsigned(reg120[(4'he):(4'he)]))));
        end
      reg122 <= $signed((($unsigned((reg113 || reg111)) ?
          $signed($unsigned(wire97)) : $signed((reg105 <<< (8'ha1)))) < (~^(reg109 >= wire100[(1'h1):(1'h0)]))));
    end
  assign wire123 = wire102[(3'h6):(3'h5)];
  assign wire124 = $unsigned((reg122 << (~^reg115)));
  assign wire125 = reg110[(5'h11):(4'hb)];
  assign wire126 = $signed((reg105[(3'h5):(3'h5)] ?
                       wire100[(3'h5):(3'h5)] : reg120[(3'h4):(2'h2)]));
  assign wire127 = $signed((reg103[(1'h1):(1'h0)] < ($signed($unsigned(reg105)) >> (!(^~reg121)))));
  assign wire128 = $unsigned($signed($unsigned(({reg122} > (wire100 >>> reg112)))));
endmodule

module module76  (y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire81;
  input wire signed [(3'h5):(1'h0)] wire80;
  input wire [(3'h5):(1'h0)] wire79;
  input wire signed [(3'h4):(1'h0)] wire78;
  input wire [(2'h2):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 (1'h0)};
  assign wire82 = ({wire80,
                          {$signed($signed(wire78)),
                              {(wire80 ? wire80 : wire81), wire80}}} ?
                      (($unsigned($unsigned(wire79)) ?
                          $unsigned(wire77[(2'h2):(1'h0)]) : (~|{wire77})) >= wire78[(3'h4):(2'h2)]) : $unsigned($unsigned($signed((wire80 ?
                          wire80 : (7'h44))))));
  assign wire83 = (~&wire80);
  assign wire84 = $unsigned($signed($signed(wire81[(2'h3):(2'h2)])));
  assign wire85 = $signed($signed(($signed($signed(wire80)) ^ wire77)));
  assign wire86 = $unsigned(($unsigned({(wire82 || wire82)}) || $unsigned(wire85[(1'h1):(1'h1)])));
  assign wire87 = wire84;
  assign wire88 = $signed(wire83);
  assign wire89 = ($unsigned($unsigned((wire79 ?
                      $signed(wire88) : $unsigned(wire82)))) * ((8'hbe) ^~ (^($signed(wire79) ?
                      (wire87 <<< wire77) : (&wire88)))));
endmodule

module module8
#(parameter param69 = (((~&{((8'h9d) ^~ (8'ha3))}) >> {(((8'ha8) & (8'ha3)) ? ((8'hb6) >> (8'hb6)) : ((8'hab) - (8'hb3)))}) >= {(((^~(8'ha5)) ? ((8'hae) ? (7'h44) : (8'hbe)) : ((8'hbf) >>> (8'h9d))) ? ((+(8'hb8)) ? (~^(8'ha1)) : ((8'hb2) || (8'haf))) : (~&(&(8'h9f)))), (^(~((8'hb7) ? (8'ha1) : (8'hb9))))}))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire66;
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  assign y = {wire68,
                 wire28,
                 wire29,
                 wire66,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= wire13[(3'h4):(3'h4)];
      reg15 <= wire13[(3'h6):(2'h2)];
      reg16 <= (^(^$signed(wire13[(3'h6):(3'h5)])));
      reg17 <= $signed(wire10);
      reg18 <= wire13[(3'h4):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire10);
    end
  always
    @(posedge clk) begin
      if ($signed((-(^(~|(wire10 << wire9))))))
        begin
          reg20 <= {reg17};
          reg21 <= reg15;
          reg22 <= (reg21 - $unsigned(reg18));
          reg23 <= $unsigned(($unsigned((~$unsigned((8'hb5)))) ?
              $signed((8'had)) : $signed($unsigned(reg20[(5'h11):(4'he)]))));
          reg24 <= $unsigned(reg17[(1'h0):(1'h0)]);
        end
      else
        begin
          reg20 <= $unsigned({(wire12 + reg24[(3'h7):(3'h5)]),
              reg21[(1'h0):(1'h0)]});
          reg21 <= $unsigned(($signed(((reg23 ^~ wire9) * {(8'hb2)})) >= $unsigned(($signed(reg15) ?
              reg20[(5'h12):(4'hf)] : reg19[(1'h0):(1'h0)]))));
        end
      reg25 <= $signed($signed($signed(((wire12 ? wire11 : wire10) >> (wire10 ?
          reg17 : reg19)))));
      reg26 <= $unsigned(((((wire9 ^~ reg21) ?
          wire11 : reg22[(3'h5):(2'h3)]) << reg22[(3'h5):(1'h0)]) == (($signed(wire12) >> (reg15 & (8'ha0))) == $unsigned((reg15 ?
          reg21 : wire11)))));
      reg27 <= $signed(((reg25 ^ ((wire12 ?
          wire11 : reg21) >= reg18)) < $unsigned(((8'hbb) ? reg20 : (8'hb5)))));
    end
  assign wire28 = {$signed({{(~&reg20)}}),
                      (reg22[(3'h4):(1'h0)] >>> reg21[(4'he):(4'hd)])};
  assign wire29 = (|$unsigned(($signed($signed((8'hb0))) << ((|wire13) >= reg16))));
  module30 #() modinst67 (wire66, clk, wire28, reg22, reg26, reg14);
  assign wire68 = (^(~^(reg27[(1'h1):(1'h0)] ?
                      ($signed(reg25) ?
                          {(8'hb5)} : reg15[(2'h2):(2'h2)]) : (!(reg18 && reg15)))));
endmodule

module module30
#(parameter param64 = {(^((~((8'hb7) && (8'hbd))) != ((8'ha8) ? (|(8'hbc)) : (~|(8'hbe)))))}, 
parameter param65 = (param64 ? (param64 ? ((~&(param64 > param64)) ~^ (~{param64})) : (~((8'ha1) ? param64 : param64))) : (~|param64)))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire35;
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire35,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire35 = wire33;
  always
    @(posedge clk) begin
      reg36 <= ((&(~^wire31)) ?
          $signed(wire35[(1'h1):(1'h1)]) : (($signed(wire32[(4'hd):(4'h8)]) ?
              wire33 : ($unsigned(wire32) + (wire33 ?
                  wire32 : wire31))) | $unsigned(($signed(wire33) & $unsigned(wire35)))));
      if (wire34)
        begin
          reg37 <= $signed(($signed($signed($signed(wire32))) >= $unsigned(wire32[(5'h10):(4'hc)])));
        end
      else
        begin
          reg37 <= ($unsigned(wire33) ?
              (~&{wire34[(3'h6):(2'h3)], reg36}) : wire34);
          reg38 <= wire34[(4'he):(2'h3)];
          reg39 <= {$unsigned(reg37[(4'hb):(2'h2)])};
          if ($unsigned((~|$unsigned((8'hb8)))))
            begin
              reg40 <= wire31[(3'h4):(3'h4)];
              reg41 <= (~wire32);
              reg42 <= $signed(reg37);
              reg43 <= reg36[(3'h5):(3'h5)];
              reg44 <= $signed($unsigned(reg39[(1'h1):(1'h0)]));
            end
          else
            begin
              reg40 <= reg39[(1'h0):(1'h0)];
              reg41 <= reg39;
              reg42 <= ((+$signed($signed($unsigned(wire33)))) ?
                  ((((+wire34) & reg37) ?
                      (~^$unsigned(reg41)) : $unsigned($unsigned(reg38))) ^~ ((reg44 ^ reg41[(4'he):(1'h0)]) * wire31[(3'h4):(1'h0)])) : $signed({$signed(wire32[(2'h3):(2'h3)])}));
              reg43 <= $signed($unsigned({$signed(wire33[(5'h11):(1'h1)]),
                  $signed((&wire35))}));
            end
        end
      reg45 <= $unsigned(wire35);
      if ((((wire31 >>> reg40[(3'h6):(2'h2)]) ?
          (~(((8'ha9) ^ reg40) ?
              ((8'had) ?
                  reg42 : reg39) : reg44)) : reg39) & wire35[(1'h1):(1'h1)]))
        begin
          reg46 <= reg39[(2'h3):(2'h3)];
          reg47 <= {(+$signed($unsigned($unsigned((8'ha4))))),
              (+reg37[(4'h9):(3'h4)])};
          if ($unsigned((reg44[(4'h8):(3'h5)] - reg47[(3'h6):(1'h1)])))
            begin
              reg48 <= wire35[(1'h1):(1'h1)];
              reg49 <= reg47[(4'h8):(3'h5)];
              reg50 <= reg39;
              reg51 <= reg45;
            end
          else
            begin
              reg48 <= wire32[(5'h11):(1'h0)];
              reg49 <= reg41[(5'h12):(4'h9)];
              reg50 <= ($signed({(8'ha2), $unsigned($signed(reg37))}) ?
                  $unsigned((|$signed($signed(reg39)))) : (reg51[(3'h7):(3'h5)] ?
                      (~(8'hba)) : $signed(wire35[(2'h2):(1'h0)])));
            end
          if (reg42)
            begin
              reg52 <= ((reg50 ?
                  ($signed((^~reg44)) >>> (~$unsigned(reg43))) : $signed(reg42[(1'h0):(1'h0)])) || $unsigned((8'ha1)));
            end
          else
            begin
              reg52 <= $unsigned($unsigned(reg51[(3'h6):(2'h3)]));
              reg53 <= reg39;
              reg54 <= (reg42 ^ $signed(reg40[(1'h0):(1'h0)]));
              reg55 <= $unsigned((!$unsigned($signed((!reg39)))));
            end
        end
      else
        begin
          reg46 <= (8'ha2);
          reg47 <= wire34[(4'hd):(3'h7)];
          if ({wire31[(4'hf):(3'h6)], reg49[(2'h3):(2'h2)]})
            begin
              reg48 <= (|$signed(reg37[(3'h4):(1'h1)]));
              reg49 <= {(7'h40),
                  (~|((reg51[(2'h3):(1'h0)] >= $unsigned(reg45)) >>> {reg40[(3'h4):(3'h4)]}))};
              reg50 <= $unsigned(((8'haf) ?
                  ($signed((wire35 ? (8'h9c) : reg47)) ?
                      ({reg41} ?
                          $signed(wire32) : reg46) : $signed(reg38)) : $signed((^(wire35 ?
                      reg48 : reg39)))));
              reg51 <= reg43;
            end
          else
            begin
              reg48 <= ({($signed((reg55 | (8'ha4))) + reg48),
                      $signed((~&(^wire35)))} ?
                  wire32 : (reg52[(2'h2):(1'h0)] || (reg48[(4'hb):(3'h7)] ?
                      $signed((^(8'had))) : reg40[(2'h2):(1'h0)])));
              reg49 <= (|(({(reg53 ? reg53 : reg41),
                      {reg53}} + ($signed(reg53) >= $unsigned(reg39))) ?
                  ($signed($unsigned(reg44)) ?
                      (-$signed(reg40)) : {reg44}) : reg44[(4'h9):(2'h3)]));
              reg50 <= ({$signed($signed($signed(reg44)))} ?
                  wire35[(1'h1):(1'h1)] : $unsigned(reg50));
              reg51 <= (&((-(reg37[(2'h2):(2'h2)] ?
                      $signed((8'ha1)) : (reg38 ? reg52 : wire34))) ?
                  $signed((8'ha0)) : (^~(&reg36))));
            end
          reg52 <= (~^(reg52[(4'hd):(3'h7)] ?
              {((~^reg42) & (wire33 | reg49)),
                  wire32[(2'h3):(1'h1)]} : $unsigned(({reg48} ?
                  (reg49 ? reg44 : reg55) : (wire35 << reg37)))));
          reg53 <= $signed((8'h9d));
        end
      reg56 <= $signed({{$unsigned((reg48 ? wire32 : reg52)),
              ((reg36 ? (8'hb7) : reg47) ? (~^reg37) : $unsigned(reg40))}});
    end
  assign wire57 = (reg47[(1'h1):(1'h0)] ^ (^~$unsigned($unsigned(reg40[(1'h1):(1'h1)]))));
  assign wire58 = ($unsigned((reg44[(2'h2):(2'h2)] != reg56)) ?
                      ((reg44 ? (!$signed(reg40)) : {$signed(reg53)}) ?
                          ((~|(~reg41)) <= ((|reg55) ?
                              (reg51 ?
                                  (8'ha7) : (8'hb5)) : {reg41})) : reg41) : ($signed(wire57[(3'h4):(1'h1)]) <= ($unsigned(((8'hb0) ?
                              reg56 : reg54)) ?
                          reg37[(3'h6):(1'h1)] : (~^reg52))));
  assign wire59 = ($signed((reg43 ?
                          {$signed(wire33)} : ($signed((8'hb0)) < {reg36}))) ?
                      (reg39 ?
                          $signed($unsigned((reg40 ?
                              wire31 : reg49))) : reg43[(4'ha):(4'h9)]) : $unsigned($signed(reg38)));
  assign wire60 = reg52[(1'h0):(1'h0)];
  assign wire61 = (($signed($signed($signed(reg38))) + $unsigned(((wire59 ?
                          (8'h9e) : reg54) || wire59[(1'h0):(1'h0)]))) ?
                      {$signed(($signed(reg50) ?
                              (wire32 ?
                                  reg38 : reg45) : $signed(wire34)))} : $unsigned($unsigned(reg54)));
  assign wire62 = (reg53[(5'h10):(4'h9)] ?
                      reg50[(1'h1):(1'h1)] : ((reg39[(1'h1):(1'h0)] ?
                          reg55[(2'h2):(1'h0)] : (^~{reg48,
                              wire61})) == wire35[(1'h1):(1'h0)]));
  assign wire63 = $signed(($signed(((wire33 ? wire60 : reg39) ?
                      (~^wire31) : ((8'hbc) + (8'haf)))) << reg42));
endmodule
