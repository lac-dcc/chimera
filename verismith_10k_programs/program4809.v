module top
#(parameter param140 = (+{(({(8'hbd)} ? ((8'ha7) ? (8'hb3) : (8'hbf)) : {(8'ha6)}) ? (((8'ha9) ? (8'hab) : (8'ha1)) ~^ {(8'ha5)}) : (((8'hb2) >>> (8'hb3)) ? {(8'ha8), (7'h44)} : ((8'ha4) ? (8'hb5) : (8'h9d))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h14):(1'h0)] wire139;
  wire signed [(4'h9):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire136;
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire22,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire136,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  module4 #() modinst23 (wire22, clk, wire3, wire1, wire0, wire2, (8'hb7));
  assign wire24 = (!(!((8'hbc) ^~ (!(8'haf)))));
  assign wire25 = (~|wire1);
  assign wire26 = (((wire22[(4'hc):(1'h1)] <<< wire3[(2'h2):(1'h0)]) ?
                          wire1[(4'h9):(3'h7)] : (^$signed($signed(wire0)))) ?
                      (!$unsigned((wire3 ?
                          $signed((8'hba)) : (wire2 | wire22)))) : wire24);
  assign wire27 = $unsigned({$unsigned((wire1 ?
                          (wire0 ? wire25 : wire2) : wire0[(4'h9):(1'h0)])),
                      (+wire26[(4'hc):(1'h0)])});
  assign wire28 = $unsigned(wire2[(4'hc):(2'h2)]);
  always
    @(posedge clk) begin
      if (wire27)
        begin
          reg29 <= (^($unsigned(wire2[(4'h8):(3'h7)]) ?
              (!$unsigned(((8'h9d) ? wire3 : wire2))) : {{((7'h41) ?
                          (8'haf) : wire0)},
                  (!$signed(wire1))}));
        end
      else
        begin
          reg29 <= ((((wire24 ? {reg29, wire25} : (wire24 * reg29)) ?
                  (wire22[(1'h0):(1'h0)] ?
                      wire28[(1'h0):(1'h0)] : wire22) : $signed(wire26[(1'h1):(1'h0)])) ?
              $unsigned(wire1[(3'h6):(3'h6)]) : $unsigned($signed(wire2))) < (&(wire25[(2'h3):(1'h1)] <<< $unsigned((wire1 == wire25)))));
          reg30 <= (~^wire24);
          reg31 <= wire28;
          reg32 <= (8'ha4);
          reg33 <= $signed(reg32);
        end
      if (reg31)
        begin
          reg34 <= $signed((+(&reg32)));
          reg35 <= reg31[(2'h3):(2'h3)];
          reg36 <= $unsigned((reg33[(1'h1):(1'h1)] ?
              (wire24 ?
                  wire24 : ((-(8'hb7)) ?
                      (reg35 ?
                          reg32 : reg32) : reg33)) : ((^(~|(8'h9f))) != wire24)));
          reg37 <= (wire1 || wire3[(4'h9):(4'h9)]);
        end
      else
        begin
          reg34 <= (wire24 >>> $unsigned((|wire27)));
        end
    end
  assign wire38 = ($signed((reg37 <<< (8'ha3))) ?
                      (wire3 ?
                          reg34[(5'h11):(3'h6)] : reg32[(1'h0):(1'h0)]) : (reg37[(1'h1):(1'h1)] < ($unsigned(reg35) >> $unsigned($unsigned((7'h42))))));
  assign wire39 = wire24;
  assign wire40 = (7'h43);
  assign wire41 = reg33[(1'h0):(1'h0)];
  assign wire42 = reg36[(4'ha):(3'h4)];
  assign wire43 = ((8'ha0) > (wire39[(1'h0):(1'h0)] ?
                      (&$unsigned((reg36 ^~ wire0))) : reg37));
  assign wire44 = wire42;
  assign wire45 = ($signed($unsigned(reg35)) ^ wire3[(4'h8):(1'h1)]);
  assign wire46 = (wire27[(1'h1):(1'h1)] == $unsigned({reg33[(2'h2):(2'h2)]}));
  assign wire47 = wire26;
  always
    @(posedge clk) begin
      reg48 <= wire22[(4'h9):(2'h3)];
      reg49 <= {$unsigned((~|(-(wire40 ? wire41 : wire1))))};
      reg50 <= reg33;
    end
  module51 #() modinst137 (.wire55(wire38), .wire53(wire43), .wire52(wire3), .y(wire136), .wire54(reg32), .clk(clk));
  assign wire138 = ((^$signed((~|{reg31, wire46}))) + wire46);
  assign wire139 = $unsigned(wire136);
endmodule

module module51
#(parameter param134 = ({(-({(8'hba), (8'h9d)} ? ((8'ha6) ? (8'hbb) : (8'hb5)) : {(8'ha3)})), (+(((8'ha3) ? (8'ha3) : (8'ha4)) ? ((8'ha6) ? (8'hb0) : (8'haf)) : (7'h43)))} ? (^~(((!(8'hb0)) == ((8'h9c) ? (8'haf) : (8'hb6))) ? ((~&(8'hbf)) ? (~(7'h41)) : ((8'ha3) ? (8'ha0) : (8'hbf))) : (+((8'ha0) ? (8'hae) : (8'hbd))))) : (({((8'h9d) | (7'h41)), {(8'h9d)}} - {(8'hb0), (^(8'ha6))}) ? ((((8'h9f) >> (8'hb7)) ? ((8'hb2) < (8'had)) : ((8'ha4) ? (8'h9d) : (8'had))) ? ((8'hb3) ? (~&(8'hae)) : (&(8'hbe))) : (((8'h9c) * (8'hb8)) >> {(8'ha7), (7'h43)})) : (&{((7'h44) ? (8'ha8) : (8'ha2)), (~&(7'h44))}))), 
parameter param135 = (((+(+(param134 ? param134 : param134))) ? (({(8'hb2)} ? (~(7'h44)) : (~^(8'ha7))) ? {((8'hb0) ? (8'hac) : param134), (&(8'hb8))} : (((8'haf) ? param134 : (8'ha0)) <<< (param134 ? (8'haa) : param134))) : {(~param134), ((param134 >> param134) | (param134 & param134))}) & param134))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire [(5'h11):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(3'h6):(1'h0)] wire132;
  wire signed [(4'hd):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire60;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire56;
  reg [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg101 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
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
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire56 = (({(+((8'hbd) ? wire53 : wire55))} & $signed(((^~wire53) ?
                      (~&wire53) : wire52))) ^ wire53);
  assign wire57 = {wire54,
                      $unsigned({$unsigned($unsigned(wire54)),
                          (wire52[(4'h8):(1'h1)] >>> wire52[(4'hc):(2'h3)])})};
  assign wire58 = ($signed(wire53[(3'h7):(3'h7)]) ?
                      {wire56[(1'h1):(1'h0)],
                          wire52} : ($signed((^~$unsigned(wire56))) > wire52));
  assign wire59 = (wire57[(4'hf):(4'ha)] ?
                      ($unsigned({(+wire56),
                          (7'h40)}) >= $unsigned(wire57)) : (wire54[(4'he):(4'h8)] ?
                          (&wire52) : wire55[(1'h1):(1'h1)]));
  assign wire60 = ((wire55[(1'h0):(1'h0)] << {(wire53 > $unsigned(wire59)),
                      (wire52[(4'hb):(3'h6)] ?
                          (wire52 ?
                              wire55 : wire58) : $signed(wire56))}) + (8'ha8));
  module61 #() modinst97 (.wire64(wire56), .clk(clk), .wire63(wire54), .wire62(wire60), .wire65(wire59), .y(wire96));
  assign wire98 = wire52[(4'ha):(1'h0)];
  assign wire99 = (+$unsigned(wire55[(4'hb):(2'h2)]));
  assign wire100 = (((^($signed(wire96) >> wire60[(4'ha):(3'h5)])) && $unsigned(((^~wire60) != (^wire59)))) ?
                       $unsigned(wire60[(4'h8):(4'h8)]) : wire54[(4'hc):(4'hb)]);
  always
    @(posedge clk) begin
      if ($signed(wire60))
        begin
          reg101 <= (-{wire57});
        end
      else
        begin
          reg101 <= (^(-$unsigned(wire56[(2'h2):(1'h0)])));
          if (($signed(wire56[(3'h4):(2'h3)]) ?
              ((~|$unsigned({(8'hb9)})) ?
                  (~|wire55) : {(~reg101[(4'h9):(3'h7)]),
                      $signed((wire57 ? wire99 : wire57))}) : wire99))
            begin
              reg102 <= wire55;
              reg103 <= ((!(|(&wire98[(1'h0):(1'h0)]))) ? wire99 : reg101);
              reg104 <= $signed(($unsigned(wire60[(2'h2):(1'h0)]) ?
                  (reg101 ?
                      $unsigned(wire55) : $signed(((8'ha2) > wire54))) : (+$unsigned(wire99[(1'h1):(1'h1)]))));
              reg105 <= wire55[(3'h6):(3'h6)];
              reg106 <= reg102;
            end
          else
            begin
              reg102 <= $unsigned(({(~&$unsigned(wire54)),
                      wire58[(1'h0):(1'h0)]} ?
                  wire55[(1'h0):(1'h0)] : {(-(-reg101))}));
              reg103 <= $unsigned(reg102);
              reg104 <= wire56[(4'hd):(4'hb)];
              reg105 <= $unsigned(reg105[(1'h1):(1'h1)]);
            end
          if ($signed($signed(reg106[(1'h0):(1'h0)])))
            begin
              reg107 <= $unsigned($signed($signed($unsigned((wire52 * reg106)))));
              reg108 <= {$unsigned($unsigned((8'h9d))),
                  ((~wire53[(5'h10):(3'h7)]) * (~$signed(wire98[(1'h1):(1'h1)])))};
              reg109 <= (reg107 ?
                  ($unsigned($signed((-wire54))) ^ $unsigned((reg103 ^ reg101))) : $unsigned(reg104[(2'h3):(1'h0)]));
            end
          else
            begin
              reg107 <= (7'h43);
              reg108 <= ($unsigned(reg107[(3'h4):(1'h1)]) + reg104[(3'h5):(3'h5)]);
            end
          reg110 <= $signed($signed($signed(($unsigned(reg102) ?
              wire54[(4'hf):(3'h5)] : (reg104 ? wire53 : wire96)))));
          if (reg101)
            begin
              reg111 <= ((((+wire59[(5'h10):(3'h5)]) ^~ ((+reg104) || $signed(reg102))) ?
                  $signed(($signed(wire98) ?
                      {wire57, (8'hbd)} : (reg109 ?
                          reg103 : wire56))) : ((^(~^reg110)) ?
                      $unsigned(wire54) : (|reg103))) ^ $signed(wire98));
              reg112 <= (~|wire54[(5'h12):(3'h5)]);
            end
          else
            begin
              reg111 <= $signed((wire57 ?
                  $signed(reg103) : $unsigned($unsigned((~reg105)))));
            end
        end
      if ({{{(wire58 ? ((8'hb3) << wire53) : $signed(wire59))}}})
        begin
          reg113 <= (~|reg107);
          reg114 <= wire55;
          if ((^$unsigned(reg114[(1'h1):(1'h1)])))
            begin
              reg115 <= $unsigned($signed(($unsigned((&wire99)) ?
                  $unsigned($unsigned(reg101)) : $unsigned(reg111))));
              reg116 <= $signed((~$signed($unsigned((-(8'hb2))))));
              reg117 <= (reg115[(2'h3):(2'h2)] && $unsigned(((((8'haf) ~^ wire100) ?
                      (~^reg116) : $signed((8'hba))) ?
                  wire52 : wire53[(4'hd):(3'h7)])));
              reg118 <= ((((reg103 ? (wire58 ? reg115 : wire55) : wire60) ?
                      (!(^wire52)) : $unsigned({wire99, (8'ha2)})) ?
                  (8'had) : (((reg102 ? reg115 : reg113) ?
                      reg104[(1'h1):(1'h1)] : $unsigned(wire99)) > (^~(reg104 ?
                      wire56 : wire58)))) < {($unsigned($unsigned(reg107)) ?
                      reg102 : wire59[(3'h4):(1'h0)])});
            end
          else
            begin
              reg115 <= (((~&{$signed(reg116),
                      (reg105 << reg112)}) << (({reg105, wire55} ?
                      (wire54 * reg116) : (7'h43)) >> reg106)) ?
                  $unsigned($unsigned((8'hbe))) : {wire55[(1'h0):(1'h0)],
                      (&($signed(wire98) << reg110[(2'h3):(2'h3)]))});
              reg116 <= $unsigned(wire52);
              reg117 <= (^$unsigned((+(~(&wire55)))));
              reg118 <= (reg113[(4'h9):(1'h0)] ?
                  ($unsigned($signed(wire60[(4'h9):(1'h0)])) >>> reg112) : wire52);
              reg119 <= {(((~|(reg105 ?
                          wire57 : reg117)) ~^ {reg109[(3'h6):(1'h1)],
                          reg101[(4'hd):(4'hb)]}) ?
                      ((-{reg107}) ? reg110 : $signed((~reg113))) : wire54),
                  ($signed($signed(((8'hba) * reg105))) ?
                      wire100 : (wire53 ?
                          (-$unsigned((8'hbc))) : (+{reg109, (8'ha0)})))};
            end
          reg120 <= ((($unsigned($signed(wire52)) ?
                  $signed(wire98) : ($signed(wire58) ^ (~reg117))) <<< wire98) ?
              ((8'hb5) ?
                  (^wire96[(2'h2):(1'h0)]) : ((|(wire98 != reg114)) ?
                      ((wire53 > wire54) <<< (reg117 != wire59)) : reg101)) : $signed((^reg108)));
          reg121 <= $unsigned(wire56);
        end
      else
        begin
          reg113 <= ($signed({(7'h43)}) && reg115);
        end
      reg122 <= (reg109[(1'h1):(1'h1)] ?
          (((&((8'ha4) ? reg113 : reg103)) < ($unsigned(wire58) ?
                  wire59 : reg111)) ?
              $unsigned(reg110[(3'h4):(1'h1)]) : (-reg120[(1'h1):(1'h1)])) : $signed($signed(wire54[(3'h6):(3'h6)])));
    end
  assign wire123 = ((8'hb4) >>> $signed((^~wire59)));
  assign wire124 = (!{$unsigned(reg106)});
  assign wire125 = (8'hae);
  assign wire126 = ({((8'hab) * ($signed(reg120) ?
                               (|(8'hb1)) : wire58[(3'h5):(1'h1)])),
                           $signed(((&reg106) ?
                               (wire56 <= wire123) : wire98))} ?
                       $signed(wire53) : ((&reg101[(3'h5):(2'h3)]) ?
                           reg120 : (reg105[(3'h7):(3'h7)] ?
                               ($signed(wire54) || reg102[(3'h4):(2'h3)]) : reg109[(4'hf):(4'h8)])));
  assign wire127 = reg105[(3'h5):(1'h0)];
  assign wire128 = (8'hbe);
  assign wire129 = (wire57[(1'h1):(1'h1)] ?
                       reg107[(4'h8):(1'h1)] : $signed($unsigned($signed((8'hbd)))));
  assign wire130 = ((&($unsigned(reg102[(3'h7):(1'h1)]) ?
                           (8'ha6) : $unsigned(wire127))) ?
                       $unsigned(wire126[(1'h1):(1'h0)]) : (-$unsigned((&(+(8'ha2))))));
  assign wire131 = (~$signed($unsigned($signed($unsigned((8'hbf))))));
  assign wire132 = $signed((8'hb2));
  assign wire133 = $signed(reg107);
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire10;
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire16,
                 wire15,
                 wire10,
                 reg18,
                 reg17,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = $signed((wire5 << (&$signed((-wire9)))));
  always
    @(posedge clk) begin
      reg11 <= $signed(($signed((wire8[(3'h4):(1'h0)] ?
          (wire9 ? wire6 : wire7) : wire5)) + $signed(wire10[(4'h8):(2'h3)])));
      reg12 <= ($signed(wire5[(4'hf):(4'hf)]) ?
          ($signed(wire5[(2'h3):(2'h3)]) ?
              $signed({(wire5 <<< wire7),
                  reg11}) : $unsigned($signed(wire9[(1'h0):(1'h0)]))) : ($unsigned({{wire9}}) ?
              (((|wire7) << $unsigned(wire8)) ?
                  (~|(wire6 < reg11)) : $signed((wire6 ?
                      wire10 : wire9))) : ($unsigned(wire10[(3'h6):(2'h3)]) ?
                  wire9 : (wire9 ? $signed(wire10) : $unsigned(wire6)))));
      reg13 <= reg12[(5'h11):(4'ha)];
      reg14 <= (~^(wire9[(4'h9):(1'h0)] <<< (!((wire7 ? reg12 : wire7) ?
          wire8 : reg12[(2'h2):(1'h1)]))));
    end
  assign wire15 = {$unsigned($signed($signed(reg14)))};
  assign wire16 = wire7;
  always
    @(posedge clk) begin
      reg17 <= $unsigned((&$unsigned(({wire5} >= $signed(wire9)))));
      reg18 <= $signed($unsigned(($signed(wire15) ?
          (8'hbf) : (&wire15[(4'h8):(3'h6)]))));
    end
  assign wire19 = (((|$unsigned((reg12 > wire15))) ?
                          ((((8'hb1) >>> reg18) ?
                              ((8'hbb) >= (8'hb3)) : $unsigned(reg14)) ^ (!(reg13 ^ wire5))) : wire16) ?
                      ($unsigned($signed($unsigned(wire6))) ?
                          (-((~&wire9) ?
                              (wire8 >>> wire15) : ((8'hb1) >> reg14))) : wire8) : $unsigned(wire7));
  assign wire20 = wire16[(4'ha):(3'h6)];
  assign wire21 = (|(^~(($signed(wire15) <<< reg13[(1'h1):(1'h0)]) ?
                      $signed(wire15) : $unsigned((|wire15)))));
endmodule

module module61
#(parameter param95 = {(^((~|(^~(8'had))) ? {(|(7'h43))} : {((8'hbf) ? (8'hac) : (8'haf))})), (8'hab)})
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire65;
  input wire signed [(4'hd):(1'h0)] wire64;
  input wire signed [(3'h6):(1'h0)] wire63;
  input wire signed [(3'h6):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire66;
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire66,
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
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = ($unsigned((wire65 ?
                      {(~|(8'hb3)), (wire64 ^~ (8'hac))} : $unsigned((wire64 ?
                          (8'had) : wire65)))) == (~&$unsigned(wire62[(3'h5):(3'h4)])));
  always
    @(posedge clk) begin
      reg67 <= wire63[(3'h4):(2'h3)];
      reg68 <= {(wire65[(4'ha):(2'h3)] <<< (((~^reg67) ?
              (^reg67) : (reg67 ?
                  wire65 : wire64)) <= (|wire64[(4'hc):(3'h5)]))),
          (($unsigned($signed(wire65)) ?
              {(wire66 || reg67)} : reg67) - (+$signed((wire63 <<< wire65))))};
      reg69 <= {{$unsigned($signed($signed(wire66))), $unsigned(wire66)}};
      reg70 <= reg67[(2'h3):(2'h3)];
    end
  assign wire71 = reg68[(3'h6):(2'h2)];
  assign wire72 = ({(~^$signed((8'ha1))), reg68} ?
                      wire63 : $unsigned(((~^wire62[(2'h3):(1'h1)]) ~^ wire63[(1'h0):(1'h0)])));
  assign wire73 = {wire62[(2'h2):(2'h2)]};
  assign wire74 = wire64[(3'h6):(3'h6)];
  assign wire75 = {(wire66 != (wire63 * $unsigned(wire74)))};
  assign wire76 = $unsigned(((reg68 & $signed((^wire74))) ?
                      wire75 : (~^$signed((wire62 ? wire65 : wire73)))));
  assign wire77 = wire71[(5'h10):(2'h3)];
  assign wire78 = wire77;
  assign wire79 = {(($signed((8'hb8)) ? {wire74, (8'hbf)} : wire72) ?
                          $signed({(+wire62)}) : wire72),
                      reg68[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      reg80 <= {$signed($signed((reg67[(1'h1):(1'h0)] && wire75))), (~&reg67)};
      reg81 <= ($unsigned($signed((~|(wire78 ?
          wire74 : wire74)))) > (^wire77[(4'hb):(4'h9)]));
      if ($signed(wire78[(1'h0):(1'h0)]))
        begin
          reg82 <= $unsigned(({(~wire78[(3'h4):(3'h4)])} ?
              reg69 : {wire73[(3'h6):(2'h2)], {(8'hab)}}));
        end
      else
        begin
          reg82 <= ($signed(wire79) ?
              wire62 : $signed((~&wire76[(4'h8):(1'h0)])));
          reg83 <= (wire62 ?
              (!(wire78[(3'h7):(3'h4)] && (wire66[(4'ha):(1'h1)] < wire73[(2'h2):(1'h0)]))) : ({(wire76[(3'h5):(3'h5)] ?
                      {wire63, wire79} : reg82),
                  (wire62 ?
                      $signed((8'h9f)) : $signed(wire75))} << $signed((~^(wire73 ?
                  wire71 : wire76)))));
          if ((~wire63[(3'h6):(1'h0)]))
            begin
              reg84 <= {wire63[(2'h3):(2'h2)]};
              reg85 <= (&reg82[(2'h3):(1'h0)]);
              reg86 <= ($unsigned({wire63}) ^ ((8'hb8) < {wire66[(3'h4):(1'h0)],
                  (&$unsigned(reg81))}));
              reg87 <= ($signed(reg81[(1'h0):(1'h0)]) | (8'hb9));
            end
          else
            begin
              reg84 <= $signed($unsigned(wire78));
              reg85 <= wire78[(3'h6):(2'h3)];
            end
        end
      reg88 <= (((~(&$unsigned(reg67))) ? wire78 : wire78) ?
          (-$signed((8'hbb))) : reg86);
      if ((reg85[(3'h5):(1'h1)] ?
          $unsigned(((-(~^reg80)) ?
              $signed((wire64 ?
                  reg70 : reg84)) : wire63[(3'h6):(3'h4)])) : wire73[(3'h6):(1'h1)]))
        begin
          reg89 <= (reg70 <<< (8'hba));
          reg90 <= $signed(reg83[(1'h0):(1'h0)]);
          if ((reg70 >= wire71))
            begin
              reg91 <= $signed(($unsigned($unsigned(wire74)) == ((~&reg68) >>> $unsigned(reg83))));
              reg92 <= {(^~(+$unsigned((wire75 >> reg81))))};
            end
          else
            begin
              reg91 <= (wire65[(5'h10):(1'h1)] >> (wire66 ?
                  {($signed(reg82) ?
                          (wire66 <<< wire73) : (~reg88))} : $signed($signed(wire75))));
              reg92 <= $unsigned(((($unsigned(wire65) << wire66) ?
                      ((wire75 << (8'hb1)) | (~^(8'ha3))) : (|$unsigned(reg69))) ?
                  ({{(8'h9d), wire78}} ?
                      ((8'ha4) >> $unsigned(wire63)) : ($signed(reg83) != $signed(wire63))) : (~wire75[(3'h6):(3'h5)])));
              reg93 <= (^$signed((8'hbe)));
            end
          reg94 <= $signed(reg67[(1'h1):(1'h1)]);
        end
      else
        begin
          reg89 <= (~^{((wire64[(3'h5):(2'h2)] ?
                      $signed(reg70) : (wire65 ? wire75 : reg69)) ?
                  ((reg82 ? reg83 : wire62) ?
                      ((7'h44) == reg68) : wire64) : (reg87 ?
                      reg93[(2'h3):(1'h1)] : (~&(8'h9c)))),
              $unsigned($unsigned($unsigned(reg67)))});
          reg90 <= ($unsigned((($signed(reg68) >> (reg88 == reg80)) >> wire77)) * reg92[(4'h8):(2'h2)]);
          if (reg93)
            begin
              reg91 <= {($unsigned($signed($signed(reg81))) < $signed(((wire75 >>> wire79) ?
                      (~|reg91) : $signed((7'h44))))),
                  wire76[(4'hf):(4'hb)]};
              reg92 <= (~&wire75);
            end
          else
            begin
              reg91 <= ($unsigned($unsigned(wire63)) ?
                  $unsigned(($unsigned((reg67 != reg69)) <<< ($unsigned(reg93) & reg84))) : (wire71[(5'h10):(2'h3)] ?
                      wire63[(1'h1):(1'h0)] : wire73));
            end
          reg93 <= $signed(reg70);
          reg94 <= {(^~(~reg67)),
              (wire73[(3'h4):(2'h2)] ~^ (($signed(reg88) <= $unsigned(reg90)) ?
                  (+(~wire66)) : ($unsigned((8'hbc)) ?
                      $unsigned(wire63) : wire74)))};
        end
    end
endmodule
