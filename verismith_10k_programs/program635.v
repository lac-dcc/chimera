module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire140;
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  assign y = {wire142,
                 wire93,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire95,
                 wire96,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire140,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 (1'h0)};
  module5 #() modinst52 (.wire6(wire0), .clk(clk), .y(wire51), .wire9(wire1), .wire10(wire4), .wire7(wire2), .wire8(wire3));
  assign wire53 = (wire51[(4'h8):(3'h4)] ?
                      {wire2[(3'h6):(1'h1)]} : $unsigned(wire51));
  assign wire54 = (~(wire51 | wire3[(3'h6):(2'h3)]));
  assign wire55 = wire0[(5'h10):(1'h1)];
  assign wire56 = (!(^wire53[(4'hc):(4'hc)]));
  module57 #() modinst94 (wire93, clk, wire51, wire55, wire56, wire0, wire1);
  assign wire95 = wire54;
  assign wire96 = (+(((wire1 && (wire0 ~^ wire0)) * (wire0 ?
                          wire95 : wire93[(1'h0):(1'h0)])) ?
                      (((~|wire53) >> (wire3 ? wire2 : wire3)) ?
                          ((wire93 <= wire3) ?
                              wire53[(2'h3):(2'h3)] : $signed(wire54)) : wire93) : ($signed({wire0,
                          wire4}) ~^ wire55)));
  always
    @(posedge clk) begin
      reg97 <= $signed({wire1[(2'h3):(1'h1)]});
      if ((~$unsigned({{$unsigned(wire55), reg97[(2'h3):(2'h2)]},
          {(&wire95), (wire51 >> wire56)}})))
        begin
          reg98 <= wire54[(5'h13):(4'hb)];
          if (($signed(wire55) ? wire53 : ($unsigned((~&{wire51})) >> wire56)))
            begin
              reg99 <= {$signed(wire1[(4'ha):(2'h3)])};
              reg100 <= (&$signed($unsigned((^~$signed(wire1)))));
              reg101 <= (+$signed(reg100[(3'h7):(1'h1)]));
            end
          else
            begin
              reg99 <= (wire1 | wire93);
            end
          reg102 <= ($unsigned(reg98) > wire51[(4'ha):(1'h0)]);
          reg103 <= $unsigned(wire93[(2'h2):(1'h1)]);
        end
      else
        begin
          if (((+$signed($signed(wire96))) ?
              (^~($signed((wire0 ? wire0 : reg103)) ?
                  ((wire1 == wire4) ?
                      $signed(wire3) : (wire55 ?
                          wire2 : wire4)) : reg98[(3'h4):(1'h0)])) : {{wire4[(5'h13):(3'h4)]},
                  ($unsigned({wire4}) || $unsigned((wire3 ?
                      reg103 : reg101)))}))
            begin
              reg98 <= (-((((|reg99) | ((8'hb7) ?
                      wire95 : wire0)) << $signed((wire96 <= reg103))) ?
                  ((wire55[(1'h0):(1'h0)] ?
                      $unsigned(wire95) : $signed(wire51)) && ($signed(wire96) ?
                      (wire96 ~^ reg97) : wire1[(4'hb):(3'h6)])) : $signed($unsigned((wire0 ~^ reg103)))));
            end
          else
            begin
              reg98 <= {$signed((reg99[(4'h9):(2'h2)] >>> $unsigned(((8'hb2) ?
                      (8'h9e) : reg101))))};
              reg99 <= (8'ha7);
              reg100 <= (|(wire3[(1'h0):(1'h0)] ?
                  $signed((~&wire54)) : ((((8'hbe) ?
                          (8'hae) : reg98) > $unsigned(wire56)) ?
                      wire2 : (reg98 ?
                          $unsigned((8'hab)) : ((8'had) ? wire95 : wire56)))));
            end
          reg101 <= (($unsigned(((~|reg101) ?
                  $signed(wire3) : (reg101 ? wire0 : reg100))) ?
              reg99 : $unsigned(((wire1 ? reg98 : reg102) ?
                  reg102 : (reg101 >> wire1)))) >> $signed($unsigned(((reg100 ?
              (8'hb9) : (8'hb3)) | (~&wire55)))));
        end
      reg104 <= wire53;
      reg105 <= (reg100[(3'h5):(2'h3)] || (+$unsigned($signed((^wire51)))));
    end
  always
    @(posedge clk) begin
      reg106 <= ($unsigned(reg100[(3'h5):(1'h1)]) ? (8'ha9) : reg101);
      reg107 <= (((reg99[(3'h4):(1'h0)] ? wire51 : wire54[(3'h6):(2'h2)]) ?
          (wire56[(5'h11):(3'h5)] ?
              reg99[(4'h9):(1'h1)] : $unsigned({wire53,
                  reg97})) : ($unsigned(reg97) && $unsigned(wire93[(3'h7):(1'h0)]))) >>> ((8'ha1) ?
          (reg100 ?
              (reg102[(1'h1):(1'h1)] + (wire0 ?
                  wire96 : reg97)) : (&reg99)) : $unsigned(((~|wire3) ?
              (!reg102) : (~^wire56)))));
      reg108 <= ((^(((~^wire51) ? (&wire54) : (reg99 & reg99)) ?
          wire51 : $unsigned((~wire95)))) * {(+(reg97[(3'h7):(3'h7)] << $unsigned(reg107))),
          (-$unsigned((reg107 ? wire56 : wire4)))});
      reg109 <= (~|(^~(8'ha1)));
      reg110 <= ((~|reg99[(4'h9):(1'h0)]) ?
          (^(|($unsigned(wire4) ?
              (reg108 ?
                  wire93 : (8'hb1)) : $signed(reg102)))) : ($signed((reg102[(3'h4):(1'h0)] ?
                  (wire2 | (8'haf)) : $unsigned(wire3))) ?
              {(~|(reg108 ? reg109 : (7'h42))),
                  ((!reg99) ? wire54 : {(8'hba)})} : wire0[(5'h11):(4'h9)]));
    end
  assign wire111 = $unsigned({reg106});
  assign wire112 = wire54;
  assign wire113 = reg108;
  assign wire114 = wire55[(3'h4):(2'h3)];
  assign wire115 = $unsigned(((^((wire111 & wire4) >> wire3[(4'h9):(2'h2)])) ?
                       wire96[(2'h2):(1'h1)] : $unsigned({$unsigned(wire54),
                           wire0[(2'h2):(2'h2)]})));
  assign wire116 = ($unsigned(wire54[(4'hf):(4'ha)]) ?
                       reg107 : {reg98[(1'h1):(1'h0)],
                           $signed((reg108[(4'ha):(3'h4)] ?
                               (~^wire1) : reg97[(4'h8):(3'h6)]))});
  module117 #() modinst141 (wire140, clk, reg108, wire115, reg107, reg99);
  assign wire142 = wire115[(1'h0):(1'h0)];
endmodule

module module117
#(parameter param139 = (&((8'hb9) ? (~|{(!(8'ha6))}) : (^{((8'hb2) == (8'h9f)), {(8'hb0), (8'hb7)}}))))
(y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire121;
  input wire signed [(3'h7):(1'h0)] wire120;
  input wire [(5'h15):(1'h0)] wire119;
  input wire signed [(4'ha):(1'h0)] wire118;
  wire [(2'h3):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  assign y = {wire138, wire136, wire123, wire122, (1'h0)};
  assign wire122 = wire120[(3'h7):(3'h7)];
  assign wire123 = ($signed(wire120) ~^ ($signed((wire118[(3'h6):(3'h6)] ?
                           (wire121 ?
                               wire121 : wire120) : wire122[(5'h13):(4'h8)])) ?
                       ((wire118 ~^ {wire118}) ?
                           (~|wire122) : $unsigned((8'hbd))) : wire119));
  module124 #() modinst137 (.clk(clk), .y(wire136), .wire128(wire122), .wire125(wire121), .wire126(wire123), .wire127(wire119));
  assign wire138 = ($unsigned(wire119) ^ ((~wire119[(1'h1):(1'h1)]) && {{$signed(wire118)},
                       wire136[(2'h3):(2'h2)]}));
endmodule

module module57
#(parameter param92 = ((8'ha4) == ({((~&(8'hbe)) >>> (&(8'ha5))), (((7'h42) ? (7'h42) : (8'hb0)) && (-(8'hbd)))} ? {(((8'hb8) ? (8'hab) : (8'h9f)) ? ((8'h9d) + (8'ha0)) : (&(8'had))), ((-(8'ha2)) ? ((8'ha0) ? (8'hab) : (8'hb1)) : ((8'ha8) >> (8'h9e)))} : ((((8'hba) ? (8'h9e) : (8'hb6)) ? ((8'hb7) | (8'ha5)) : {(8'ha9), (8'had)}) ? (-{(8'hab)}) : (((8'ha3) - (8'h9e)) >>> ((8'ha6) == (8'hb1)))))))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire62;
  input wire signed [(4'he):(1'h0)] wire61;
  input wire [(5'h15):(1'h0)] wire60;
  input wire [(5'h15):(1'h0)] wire59;
  input wire signed [(2'h3):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire63;
  assign y = {wire91, wire90, wire88, wire63, (1'h0)};
  assign wire63 = (~|$unsigned($unsigned((wire60 && (wire60 || wire62)))));
  module64 #() modinst89 (.wire68(wire62), .wire66(wire60), .clk(clk), .wire67(wire61), .y(wire88), .wire65(wire63));
  assign wire90 = wire61[(2'h3):(1'h0)];
  assign wire91 = $unsigned(wire62[(4'hb):(2'h2)]);
endmodule

module module5
#(parameter param50 = ((+((((8'hb6) ? (8'h9d) : (8'hab)) <<< ((8'ha0) ? (7'h44) : (8'hac))) ? (((8'haa) ? (8'haa) : (8'hb8)) ? {(7'h43), (8'h9d)} : ((8'hae) >>> (8'hae))) : ((&(8'hb4)) ? ((8'hb2) ? (8'hbb) : (8'ha6)) : (~|(8'hbb))))) ? (&((^~((8'hbe) & (8'ha0))) ^~ (((8'ha6) ? (8'ha1) : (8'hba)) ? ((7'h41) || (8'hb4)) : {(8'hb7)}))) : {(+(((8'hbc) ? (7'h40) : (8'hbd)) < ((8'hab) ? (8'hbd) : (8'hb5)))), ((((8'hb2) ? (8'haa) : (7'h40)) - {(8'ha6), (8'hba)}) ? {{(8'h9c)}} : (~(!(8'hb3))))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 reg13,
                 (1'h0)};
  assign wire11 = $signed(wire8);
  assign wire12 = ((((^~wire6) <= wire11[(2'h2):(1'h1)]) <= {((wire8 ^~ wire8) ?
                          {wire10} : ((8'hb3) ? wire7 : wire11)),
                      ({wire7, wire6} ?
                          $unsigned(wire7) : $signed(wire10))}) >> ((~|((~&wire9) ?
                      {wire11} : wire7)) >> {($unsigned(wire11) ?
                          $unsigned(wire8) : $signed(wire8)),
                      ((~^wire9) & $unsigned(wire8))}));
  always
    @(posedge clk) begin
      reg13 <= wire12[(5'h12):(5'h12)];
    end
  assign wire14 = (~|(8'h9e));
  assign wire15 = (((($signed(wire7) ^ (7'h43)) << $signed((8'hbb))) ?
                      $unsigned($signed($signed(wire7))) : (((wire12 ?
                                  wire10 : wire12) ?
                              wire6 : wire12[(3'h5):(2'h2)]) ?
                          wire10[(3'h4):(1'h1)] : wire8)) << {({$signed((8'hb7))} ^ wire6),
                      $unsigned(($unsigned(wire10) ? reg13 : (~&wire9)))});
  module16 #() modinst41 (wire40, clk, wire14, wire7, wire10, wire9);
  assign wire42 = $unsigned($unsigned((~&(+$signed(wire12)))));
  assign wire43 = wire8;
  assign wire44 = {(~|wire15[(3'h4):(2'h3)]),
                      ((|$signed((wire42 ? wire42 : wire8))) ?
                          $unsigned((wire11 >= {reg13,
                              (8'ha3)})) : (|$signed($signed(wire11))))};
  assign wire45 = ((8'ha1) - ({wire43,
                      {wire9[(2'h3):(1'h0)], wire7}} || (^{(&wire40),
                      ((8'ha9) >> wire10)})));
  assign wire46 = ((({(~^wire10), (wire15 ^ wire45)} | wire15) ?
                          $unsigned(({wire15} ?
                              wire44 : (wire10 << reg13))) : (wire43[(4'h8):(3'h7)] ?
                              (wire11[(1'h1):(1'h1)] ?
                                  $signed(wire8) : (wire6 ?
                                      (8'haf) : wire8)) : wire7[(3'h6):(3'h6)])) ?
                      (8'hbd) : $unsigned(wire9));
  assign wire47 = $unsigned($signed(wire7));
  assign wire48 = $unsigned(wire44[(3'h5):(2'h3)]);
  assign wire49 = ((((wire12 ?
                      ((8'ha5) * wire15) : wire40) * wire43[(2'h3):(2'h3)]) >= wire44) || wire47[(4'h9):(3'h4)]);
endmodule

module module16
#(parameter param38 = (~&(8'h9c)), 
parameter param39 = (({param38, (&param38)} & ((^~(param38 >> (8'h9f))) ? {((8'hb5) ? param38 : param38), (param38 && param38)} : (|(param38 || param38)))) << (((^~(~&param38)) ? {(~param38), (param38 || (8'ha4))} : (~^(param38 * param38))) ^~ ((8'hb8) ? ((param38 ^~ param38) ? (param38 << param38) : (param38 ? (8'hb3) : param38)) : (&(param38 ? param38 : param38))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire28,
                 reg32,
                 reg31,
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= $signed((^$signed(($signed(wire18) ^ $signed(wire18)))));
      reg22 <= wire19;
      reg23 <= {$unsigned({$unsigned($signed((8'h9d)))}),
          (reg22 ? wire18[(2'h2):(1'h0)] : (~^wire19[(2'h3):(2'h2)]))};
      reg24 <= (wire20 * $signed(((~^$unsigned(wire20)) ?
          reg21 : $unsigned(wire18[(1'h1):(1'h0)]))));
      if (wire20[(4'ha):(1'h1)])
        begin
          if (((reg21 + reg23) ?
              ((&(^~(reg21 || wire17))) != ((((8'hae) - reg23) ?
                  $signed(reg24) : $unsigned(reg21)) >= reg23)) : $signed($signed($signed($signed(reg23))))))
            begin
              reg25 <= ($signed((-(!wire19[(3'h5):(3'h4)]))) ?
                  wire17 : $unsigned(wire19));
              reg26 <= $unsigned(($unsigned(($unsigned(reg22) ?
                      (reg21 + wire18) : reg22[(2'h2):(1'h1)])) ?
                  reg22 : (reg25[(3'h4):(2'h2)] <<< (-wire19[(2'h2):(1'h1)]))));
              reg27 <= wire17;
            end
          else
            begin
              reg25 <= (-$signed((($unsigned(wire17) ?
                      (reg24 ? reg24 : (8'hb2)) : $unsigned(reg23)) ?
                  (^~(&reg21)) : $signed(((8'haa) ? wire20 : reg27)))));
            end
        end
      else
        begin
          reg25 <= $unsigned(reg27);
          reg26 <= {$signed(reg21[(3'h6):(2'h3)])};
        end
    end
  assign wire28 = (({$unsigned($signed((7'h44))),
                              {reg21, reg27[(3'h5):(3'h5)]}} ?
                          wire20[(3'h5):(3'h5)] : (|(!(reg25 ?
                              wire20 : wire18)))) ?
                      $signed($unsigned((~|(+wire17)))) : ((8'h9f) ?
                          (~($signed(wire20) ?
                              reg26 : wire18)) : ($signed((reg22 ?
                              reg21 : wire17)) ^~ wire19)));
  assign wire29 = ($signed((^~($signed(wire17) ?
                          (reg27 ? (8'ha3) : reg24) : reg25[(4'h8):(1'h1)]))) ?
                      ((($signed(reg22) < (-(8'hb3))) ?
                              (|reg21[(4'hd):(1'h0)]) : wire18) ?
                          (((reg27 <= (8'haa)) ? {reg23} : reg22) ?
                              ((~&reg22) << (~&wire20)) : reg22[(1'h0):(1'h0)]) : wire17[(3'h5):(2'h3)]) : ((~|$unsigned($signed(wire19))) ?
                          reg27 : (((~(8'h9f)) - (-reg25)) ?
                              ((reg21 << (8'hbf)) ~^ (wire19 << wire18)) : wire17)));
  always
    @(posedge clk) begin
      reg30 <= $unsigned((wire20[(3'h5):(3'h4)] ?
          (~^wire18) : (((wire19 ? wire28 : (8'ha5)) ?
                  $signed(reg23) : (wire28 ? wire29 : wire18)) ?
              reg25[(2'h3):(2'h3)] : wire19[(3'h7):(2'h3)])));
      reg31 <= reg23;
      reg32 <= (^~reg22);
    end
  assign wire33 = (8'hb5);
  assign wire34 = $signed((wire33[(2'h3):(2'h3)] ?
                      $unsigned(wire29[(3'h5):(3'h4)]) : ($signed((wire28 ?
                          (8'hb2) : (8'hbe))) - reg25)));
  assign wire35 = (8'haf);
  assign wire36 = reg30;
  assign wire37 = (~|((8'h9d) <<< $signed((~(|reg21)))));
endmodule

module module64
#(parameter param87 = ({((((8'hb9) ? (8'ha6) : (7'h44)) - ((8'haa) && (8'h9f))) >>> (((8'ha0) ? (8'ha1) : (8'ha7)) & ((8'ha6) ? (8'ha3) : (8'hba))))} ? (~&((8'ha2) ? (~|{(8'hb1)}) : ((!(8'hb1)) ^~ {(8'hae), (8'ha4)}))) : (((((8'h9d) ? (8'ha0) : (8'ha0)) & ((8'hb0) ? (8'hac) : (8'ha6))) ? {((8'ha5) || (8'ha0)), ((8'hbb) ? (8'hbb) : (8'hb4))} : {((8'hbb) - (8'hb3))}) <= ((~((8'ha2) ? (8'hb2) : (8'h9d))) >> (((8'hb5) ? (8'ha5) : (8'hb0)) ? (!(8'h9d)) : (~^(7'h44)))))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire68;
  input wire signed [(2'h2):(1'h0)] wire67;
  input wire [(5'h14):(1'h0)] wire66;
  input wire [(4'hf):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire69;
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire69,
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
                 (1'h0)};
  assign wire69 = $unsigned($unsigned((((&wire66) <= wire66[(3'h4):(1'h0)]) ?
                      wire68[(4'hb):(1'h1)] : $signed((~|wire66)))));
  always
    @(posedge clk) begin
      reg70 <= wire69;
      reg71 <= $signed({(wire68[(3'h6):(3'h5)] ?
              ($signed(wire69) ?
                  reg70[(1'h0):(1'h0)] : {wire69}) : wire69[(1'h1):(1'h1)]),
          ($signed($unsigned(wire69)) ?
              $unsigned(wire69[(2'h2):(2'h2)]) : wire67)});
      if ((wire68 ?
          ($signed((8'ha7)) ?
              ((^~(reg71 >>> wire65)) ?
                  (wire69 ?
                      (^~wire68) : wire66[(5'h11):(1'h0)]) : $unsigned((wire69 ^ wire65))) : (+wire69[(1'h1):(1'h0)])) : $signed($signed($signed((reg70 ^~ reg71))))))
        begin
          if (wire67)
            begin
              reg72 <= (((($signed(wire67) >= $signed(wire65)) ?
                      ((reg71 ? wire67 : reg70) ?
                          (wire65 == wire69) : (|wire68)) : (|((7'h40) == (8'hbd)))) && ({$signed(reg71)} << wire68[(2'h3):(1'h1)])) ?
                  $signed($signed((reg71 ?
                      wire69[(1'h0):(1'h0)] : (wire67 ?
                          (8'h9e) : reg71)))) : (((~$unsigned(reg71)) > (!(reg71 ?
                          wire68 : reg71))) ?
                      (-{$signed((8'h9d))}) : wire66[(2'h3):(2'h3)]));
              reg73 <= $signed(reg70);
              reg74 <= wire66;
              reg75 <= (^((wire67[(1'h1):(1'h0)] ?
                  ((8'ha6) ?
                      $unsigned(reg74) : wire67[(2'h2):(1'h1)]) : $unsigned($signed(reg73))) && reg73));
              reg76 <= wire66[(3'h7):(3'h4)];
            end
          else
            begin
              reg72 <= ($signed(wire68) ?
                  wire69[(1'h1):(1'h1)] : (($unsigned((wire67 ?
                      (8'hb2) : reg70)) > wire65) ^~ ((&(reg71 ?
                      reg71 : reg75)) ^~ ($signed(reg74) * $unsigned(wire68)))));
              reg73 <= {(reg74 ~^ $signed(((reg73 ^~ wire65) <= $unsigned(wire65))))};
            end
          reg77 <= (^~wire67[(2'h2):(1'h0)]);
          reg78 <= $unsigned(wire67);
          if (reg74[(5'h12):(1'h0)])
            begin
              reg79 <= $signed((!($unsigned((reg74 < reg71)) <<< {(-reg73)})));
            end
          else
            begin
              reg79 <= reg72;
              reg80 <= (reg72[(3'h6):(2'h3)] ?
                  $signed(reg76) : reg71[(1'h1):(1'h0)]);
              reg81 <= reg77[(4'he):(1'h0)];
              reg82 <= wire67[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg72 <= ({((8'hb7) ?
                      $unsigned(reg82[(5'h10):(3'h5)]) : $signed((wire67 != reg82))),
                  $unsigned(($signed(reg75) < (reg76 ? (8'h9f) : reg76)))} ?
              {$signed(((reg70 & reg77) << {wire65})),
                  (~&((!reg72) == (~|reg73)))} : $unsigned(reg79[(3'h7):(1'h1)]));
          reg73 <= (~^$unsigned((&((reg74 - reg77) ?
              (reg78 ? reg73 : reg70) : (reg74 ^~ (8'ha6))))));
          reg74 <= wire69;
          reg75 <= (+$signed($signed(((reg71 && reg74) ?
              $unsigned((8'hbf)) : wire67[(1'h1):(1'h1)]))));
        end
      reg83 <= $signed(reg77);
    end
  assign wire84 = wire69[(1'h0):(1'h0)];
  assign wire85 = reg73[(2'h3):(1'h0)];
  assign wire86 = (reg74 ? reg74[(5'h12):(4'h8)] : wire69);
endmodule

module module124  (y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire128;
  input wire signed [(5'h15):(1'h0)] wire127;
  input wire [(5'h12):(1'h0)] wire126;
  input wire signed [(3'h7):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  wire [(4'ha):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire [(5'h12):(1'h0)] wire129;
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 (1'h0)};
  assign wire129 = ((((|wire126[(4'hc):(2'h3)]) ?
                               $signed($unsigned(wire128)) : ({wire128} || wire125)) ?
                           $signed($unsigned($signed(wire127))) : ({$unsigned(wire126)} ~^ {$signed(wire128),
                               $signed(wire126)})) ?
                       wire128 : (wire125 ?
                           (~|(((8'hbe) ~^ wire125) ?
                               $unsigned(wire126) : wire127)) : (wire125 | ($unsigned(wire126) | wire126[(5'h12):(4'hf)]))));
  assign wire130 = ({$signed($signed((!wire126))),
                           (wire126 ?
                               (&{wire127}) : (wire125[(3'h6):(2'h3)] ^~ (~|wire126)))} ?
                       wire127[(4'hf):(4'h8)] : wire126);
  assign wire131 = $signed((wire125[(3'h5):(2'h3)] ?
                       wire127[(4'h8):(2'h3)] : (wire126 << $signed($signed(wire128)))));
  assign wire132 = wire131;
  assign wire133 = ((-$signed((~&$signed(wire125)))) ?
                       {(wire125 ?
                               $signed($unsigned(wire125)) : wire132[(4'h9):(3'h5)]),
                           (-wire131)} : (wire132[(1'h0):(1'h0)] >>> ((~|$unsigned(wire132)) ?
                           wire126[(5'h11):(4'h8)] : {wire132})));
  assign wire134 = ($unsigned($unsigned((~&$signed(wire130)))) + wire133[(4'hc):(3'h4)]);
  assign wire135 = ($signed(wire133[(4'he):(4'hc)]) > wire133);
endmodule
