module top
#(parameter param143 = (({(~&(8'hb1))} ~^ {(((8'ha4) ? (8'hbc) : (8'hba)) ? {(8'ha2), (8'hae)} : ((8'hb0) ? (8'h9f) : (8'ha9))), ({(8'hbf)} * (~(8'hbb)))}) ? ((~{(|(8'hba))}) ? ((+(&(8'ha9))) ? (~((8'ha6) ? (8'hbb) : (8'ha8))) : (&((8'ha2) ? (8'hba) : (8'hba)))) : {((&(8'h9e)) ? ((8'h9c) ? (8'hbf) : (8'h9c)) : ((7'h41) != (8'ha6))), ((8'hb7) ? {(8'h9d), (8'ha2)} : ((8'hb1) ? (8'hbe) : (8'ha1)))}) : ((({(8'ha6), (8'hae)} ? ((8'h9c) != (8'ha2)) : ((8'hb5) ? (8'ha1) : (8'hb7))) ? (((8'hb3) ? (8'hb5) : (8'ha0)) ? ((8'hb1) ? (8'h9e) : (8'ha9)) : ((8'hbf) >>> (8'hb2))) : (-((8'ha0) >= (7'h44)))) ? ((((8'had) == (8'ha5)) <= ((8'hb5) ? (8'hb8) : (8'ha3))) || {((8'hb6) || (8'ha7)), ((8'h9c) + (8'ha7))}) : (((~&(8'had)) ? ((8'hbf) <<< (8'hae)) : ((7'h40) << (8'hb1))) ? (|((8'ha5) ? (8'hab) : (7'h41))) : (^(^(7'h42)))))), 
parameter param144 = (~|param143))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire36;
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire38,
                 wire4,
                 wire5,
                 wire36,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  assign wire4 = (wire1[(1'h1):(1'h1)] ?
                     $signed((wire0[(3'h4):(2'h2)] ?
                         wire0[(1'h1):(1'h1)] : (^wire2))) : ((&(((8'ha4) == wire2) || (wire0 ^~ wire1))) ?
                         {(~((8'ha1) <<< (8'h9d))),
                             (!$unsigned((8'h9f)))} : (~^$unsigned((|wire2)))));
  assign wire5 = {wire4[(2'h2):(1'h1)]};
  module6 #() modinst37 (wire36, clk, wire5, wire0, wire1, wire2, wire4);
  assign wire38 = wire4[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      reg39 <= wire4;
      reg40 <= wire5;
      reg41 <= $signed({(8'hac), $signed(wire5[(3'h4):(2'h2)])});
      if ((wire4[(5'h10):(1'h0)] && wire1[(4'hb):(1'h1)]))
        begin
          reg42 <= (~^wire36);
          reg43 <= (^(wire2 - (({wire2} ?
              (wire1 ?
                  wire1 : (8'haa)) : (~reg42)) != (!reg42[(4'hf):(3'h4)]))));
          reg44 <= $unsigned(wire2[(5'h10):(3'h4)]);
        end
      else
        begin
          reg42 <= $unsigned(($signed(((reg39 >= wire3) << (wire0 ?
              reg39 : reg41))) && $signed({(~|(8'ha1))})));
          reg43 <= ((7'h44) <<< (($unsigned(((8'ha5) ?
              reg40 : (8'haf))) < wire0[(3'h7):(2'h2)]) >> ($unsigned(wire0[(1'h0):(1'h0)]) ?
              ((^~(8'hb1)) ?
                  (wire4 ? reg43 : (7'h41)) : ((7'h44) ?
                      wire5 : reg43)) : (|$unsigned(wire36)))));
          reg44 <= (^(($unsigned(wire38) << (7'h40)) << reg40[(4'h9):(4'h9)]));
          reg45 <= $unsigned($signed(wire1[(2'h2):(1'h1)]));
          if (wire2[(4'hb):(1'h1)])
            begin
              reg46 <= (reg39[(1'h0):(1'h0)] == (($unsigned($unsigned(reg41)) ?
                      reg39[(2'h3):(1'h0)] : reg45) ?
                  ((8'ha1) < ((reg41 ? wire1 : reg40) ?
                      $signed(wire5) : ((8'ha2) || wire3))) : {wire0}));
              reg47 <= wire3;
              reg48 <= $signed((&reg40[(3'h4):(1'h0)]));
              reg49 <= $signed({({{reg42, (8'hb2)}} ?
                      $unsigned($signed(reg41)) : $unsigned((reg42 ?
                          reg47 : reg48)))});
            end
          else
            begin
              reg46 <= reg41;
              reg47 <= wire2;
              reg48 <= wire38;
            end
        end
      reg50 <= reg46[(3'h4):(2'h2)];
    end
  module51 #() modinst137 (.wire56(reg45), .wire53(reg46), .wire55(reg47), .wire52(wire0), .wire54(wire38), .y(wire136), .clk(clk));
  assign wire138 = $signed(($signed(($unsigned(reg46) ?
                       (wire0 ? reg40 : reg47) : {wire36})) >> reg40));
  assign wire139 = $signed((^reg49[(2'h3):(1'h1)]));
  assign wire140 = $signed(reg44[(2'h2):(2'h2)]);
  assign wire141 = wire3;
  assign wire142 = (8'hb2);
endmodule

module module51
#(parameter param135 = {(-((((8'ha0) == (8'ha3)) ? ((8'h9c) - (8'hb8)) : ((8'ha9) ? (8'hbd) : (8'hb1))) ? {((8'hb6) ? (8'ha3) : (8'h9f))} : {{(7'h40), (7'h42)}})), (8'hb5)})
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire56;
  input wire [(4'hb):(1'h0)] wire55;
  input wire signed [(4'hb):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  input wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire57;
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  assign y = {wire134,
                 wire132,
                 wire114,
                 wire107,
                 wire105,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 (1'h0)};
  assign wire57 = wire56[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      if (wire52[(1'h0):(1'h0)])
        begin
          reg58 <= ((wire54[(3'h4):(1'h0)] ? wire56 : wire52[(3'h7):(2'h3)]) ?
              $signed(((wire54[(2'h2):(1'h0)] ?
                  (~&wire54) : $unsigned(wire53)) >>> (~|wire55[(3'h6):(3'h4)]))) : wire54);
          reg59 <= wire52;
          reg60 <= (wire54[(4'h9):(4'h8)] ?
              (((^wire57[(2'h2):(1'h1)]) ?
                  $unsigned($signed((8'hb8))) : ((wire56 | wire53) <<< wire57)) | wire56) : $signed(wire52[(1'h0):(1'h0)]));
        end
      else
        begin
          reg58 <= (reg58 ~^ ($unsigned(reg60) <= reg58[(3'h6):(2'h2)]));
          reg59 <= reg59;
        end
      reg61 <= (~&((^~$unsigned((|(7'h44)))) ?
          (reg58 > wire56[(2'h3):(2'h2)]) : reg60[(3'h7):(2'h2)]));
    end
  assign wire62 = $unsigned(wire57);
  assign wire63 = (((reg58 && reg58) + (~^wire57[(3'h5):(3'h4)])) ?
                      (wire54 < $signed(wire54)) : ({((~&wire55) == $unsigned((8'hb1)))} && ($unsigned(wire52) ?
                          (wire57 << (|(7'h40))) : wire57)));
  assign wire64 = (8'ha7);
  assign wire65 = ((($signed(wire64) && reg61) > reg58) < ($signed((~&(~^wire57))) + reg60));
  module66 #() modinst106 (wire105, clk, wire56, wire54, wire55, wire53);
  assign wire107 = wire53[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg108 <= ((-$signed((~|(wire55 & wire65)))) << ({(+(wire52 ?
              reg58 : reg58)),
          (|wire52[(3'h7):(3'h7)])} >> wire56[(3'h6):(2'h3)]));
    end
  always
    @(posedge clk) begin
      reg109 <= ((((~|(reg59 ? wire63 : wire64)) ?
              ($unsigned(reg61) ?
                  (wire52 ? wire107 : wire63) : wire63) : (wire54 ?
                  (+(8'hb4)) : wire65[(3'h4):(3'h4)])) ?
          $signed(reg59[(3'h4):(2'h3)]) : {$signed((reg61 ~^ wire64))}) & (wire105[(4'h9):(4'h9)] ?
          wire64 : (wire52[(2'h3):(1'h0)] ?
              reg59 : $unsigned(wire55[(3'h6):(1'h1)]))));
      reg110 <= $signed((8'hab));
      reg111 <= (|(wire63[(2'h3):(2'h2)] >>> {(8'ha1)}));
      reg112 <= {(((-(wire57 >>> wire56)) && (|reg108[(2'h3):(1'h1)])) ?
              reg59[(1'h1):(1'h1)] : (8'hb4)),
          {(^~$unsigned($unsigned(wire63))), reg110[(2'h2):(1'h1)]}};
      reg113 <= $unsigned((!(-wire107[(3'h6):(3'h6)])));
    end
  assign wire114 = wire65[(4'ha):(1'h1)];
  module115 #() modinst133 (wire132, clk, wire107, wire62, wire53, reg60, wire63);
  assign wire134 = ((reg110[(3'h5):(1'h1)] >> ((~&(wire52 > (8'hba))) == $signed($signed(wire64)))) ?
                       {$unsigned(((|reg60) ? $signed(wire55) : (^(8'hbe)))),
                           wire63} : {($unsigned(wire114) ~^ {(wire55 ?
                                   wire57 : reg112)})});
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire20,
                 wire14,
                 wire13,
                 wire12,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire12 = ((wire8 ?
                      (~^{wire10[(2'h3):(2'h2)]}) : $signed(wire10)) - wire11[(3'h4):(1'h1)]);
  assign wire13 = $unsigned($signed({wire7}));
  assign wire14 = (($unsigned((-{(8'hac)})) ?
                      wire9 : $signed(wire8)) && $unsigned(wire10[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg15 <= ((wire14 ? (!$signed(wire8)) : wire12) ?
          (&((&wire8) ^ (~^wire14[(3'h4):(3'h4)]))) : (~$unsigned(wire11)));
      reg16 <= ((^~wire10[(1'h0):(1'h0)]) ?
          wire13 : ((wire13 <= ((wire9 <= wire8) ?
              (wire10 && (8'h9c)) : (wire7 ?
                  reg15 : wire9))) < ($signed((wire9 ?
              (8'hb8) : (8'ha7))) | wire7)));
      reg17 <= $unsigned({(~^$signed((wire11 & wire14))),
          ($unsigned($signed(reg16)) ?
              (wire11 ? reg15 : (wire7 == wire7)) : ((|wire8) ?
                  (&(8'ha5)) : $unsigned((8'ha1))))});
      reg18 <= ($unsigned({(-(~|reg15)), {wire11, wire10}}) ?
          $unsigned(reg16) : {({(wire11 ? wire9 : (8'haf)), $unsigned(wire9)} ?
                  reg15[(1'h1):(1'h1)] : wire9[(4'hb):(3'h4)])});
      reg19 <= reg18[(3'h4):(3'h4)];
    end
  assign wire20 = $signed(reg15[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg21 <= wire8[(4'hf):(4'h9)];
    end
  assign wire22 = ($unsigned((((wire8 ? reg21 : wire9) ? wire13 : (^~(8'h9d))) ?
                      ((reg15 ? wire20 : wire7) ?
                          (~wire8) : (reg18 ?
                              wire9 : wire11)) : ($signed(wire13) ^ $signed((8'hb6))))) & ($signed((^~(~wire8))) <<< ((wire10 + (|reg18)) && $signed(reg18[(1'h0):(1'h0)]))));
  assign wire23 = (wire10[(2'h3):(1'h0)] ?
                      $signed($signed(wire20[(4'h9):(3'h7)])) : ((wire8[(3'h4):(3'h4)] ?
                          reg15 : ((8'ha3) == wire13)) >>> reg18[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg24 <= {$unsigned({((wire9 > wire10) < (wire8 ? wire22 : wire14))})};
      reg25 <= (((!(&reg24[(4'hb):(3'h7)])) ? wire13 : $unsigned((8'ha7))) ?
          {reg19} : ({wire9[(4'hb):(1'h1)]} << (reg17[(1'h0):(1'h0)] ?
              ($unsigned((7'h44)) ?
                  (reg18 ^~ wire11) : $signed(wire13)) : {$unsigned(wire23)})));
      reg26 <= reg18[(3'h5):(2'h3)];
      reg27 <= $signed((~|wire14[(4'h8):(3'h6)]));
      reg28 <= $signed({($unsigned({wire9}) - {reg15[(2'h2):(1'h0)],
              (wire7 <<< wire10)}),
          $unsigned(((reg17 >= reg16) ?
              (+(8'hb0)) : ((8'haf) ? reg24 : reg16)))});
    end
  assign wire29 = wire10;
  assign wire30 = $signed(wire12);
  assign wire31 = (8'ha5);
  always
    @(posedge clk) begin
      reg32 <= $signed((wire30 ^ ({$unsigned(wire14),
          $signed(reg15)} <= {(~wire13), (~&wire13)})));
      reg33 <= ($unsigned($signed(($signed(reg15) >> reg28))) <= ((|$signed(reg32[(5'h11):(5'h10)])) ?
          $unsigned((|{(8'had), reg26})) : $unsigned(($unsigned(reg17) ?
              (wire13 | reg24) : (reg27 + wire13)))));
    end
  always
    @(posedge clk) begin
      reg34 <= $unsigned($signed(reg28[(1'h0):(1'h0)]));
      reg35 <= wire14;
    end
endmodule

module module115
#(parameter param131 = (&({(~&((8'hac) ? (8'hb5) : (8'ha9)))} ? ({((8'hae) ? (8'hbf) : (8'hb3)), {(7'h41), (7'h42)}} ? ((&(7'h43)) >= ((8'ha3) != (8'h9f))) : (((7'h43) < (8'hbc)) ? (+(8'ha0)) : (~|(8'hb1)))) : (~|(8'had)))))
(y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire120;
  input wire [(5'h13):(1'h0)] wire119;
  input wire signed [(4'ha):(1'h0)] wire118;
  input wire signed [(2'h2):(1'h0)] wire117;
  input wire signed [(5'h12):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire125;
  wire signed [(4'h9):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire121;
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire121,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire121 = wire119;
  always
    @(posedge clk) begin
      reg122 <= $signed(wire117[(1'h0):(1'h0)]);
      reg123 <= ((((wire120 ?
              wire119 : wire117[(2'h2):(1'h1)]) - (^~(wire119 != wire116))) ?
          {($signed(wire121) || {wire119, (8'hbe)}),
              $unsigned(reg122)} : wire118) >= reg122);
    end
  assign wire124 = ({$signed((^~(~^reg122)))} - (|(wire117[(1'h0):(1'h0)] ?
                       $signed((reg122 ?
                           wire117 : reg123)) : wire121[(5'h12):(4'he)])));
  assign wire125 = $unsigned((-$signed((-$signed(wire116)))));
  assign wire126 = (~|wire125[(4'hd):(1'h0)]);
  assign wire127 = wire120[(4'he):(4'he)];
  assign wire128 = wire119;
  assign wire129 = reg123[(4'hb):(2'h3)];
  assign wire130 = wire119;
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire [(4'hb):(1'h0)] wire68;
  input wire [(5'h13):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire71 = wire67;
  assign wire72 = (wire67 ?
                      (wire68[(4'h8):(3'h5)] <= $signed($signed($signed(wire71)))) : wire67[(4'hd):(1'h1)]);
  assign wire73 = $unsigned($unsigned(({{(8'haf), (8'hbb)},
                          (wire67 <= wire70)} ?
                      wire71[(2'h3):(1'h0)] : wire70)));
  assign wire74 = (^{(wire71[(3'h5):(3'h4)] ?
                          {wire71[(2'h2):(1'h1)],
                              $unsigned(wire67)} : wire70[(4'ha):(4'h8)]),
                      (wire69 ? (~&$signed(wire68)) : wire67[(4'h8):(4'h8)])});
  assign wire75 = (wire71[(1'h1):(1'h0)] & {(~^wire72)});
  assign wire76 = (~|(+$signed(wire73)));
  assign wire77 = ($unsigned(wire67) ?
                      wire68[(3'h4):(1'h0)] : (~$unsigned(wire76)));
  always
    @(posedge clk) begin
      reg78 <= {wire67, {wire68[(4'ha):(3'h6)]}};
      if ((((({wire67} ?
          $signed(wire70) : wire71) <<< (!wire67)) && wire71[(1'h1):(1'h0)]) * (({{wire75,
                      wire75}} ?
              wire67[(3'h6):(2'h2)] : ((-wire68) ?
                  (wire68 - wire73) : (wire68 ? wire77 : wire76))) ?
          wire68 : wire74)))
        begin
          reg79 <= $signed($unsigned($signed({(wire70 - wire72),
              reg78[(2'h3):(1'h1)]})));
          reg80 <= $signed(($signed((|wire76)) ?
              wire68[(4'hb):(3'h6)] : ($signed($signed(wire74)) ?
                  (wire71 <= $unsigned(wire75)) : $unsigned($unsigned(wire76)))));
        end
      else
        begin
          if ((&((~|reg79) <<< ((~|wire67) ?
              wire76[(3'h4):(2'h2)] : {(wire72 ~^ wire75), {wire68}}))))
            begin
              reg79 <= $signed((~^(((wire75 >>> (8'hb8)) & (~reg78)) || ((8'had) ?
                  {wire70, wire68} : wire72))));
              reg80 <= (8'hbb);
              reg81 <= (^~reg80);
            end
          else
            begin
              reg79 <= $unsigned((|wire74));
            end
          reg82 <= (+(reg81[(3'h7):(2'h3)] ?
              wire70[(1'h0):(1'h0)] : wire71[(2'h2):(1'h0)]));
        end
      reg83 <= (^~$signed(((!reg82[(3'h5):(3'h5)]) <<< wire71)));
    end
  always
    @(posedge clk) begin
      reg84 <= reg80[(1'h1):(1'h0)];
      reg85 <= (((reg83[(1'h0):(1'h0)] ?
          $unsigned(wire71[(3'h4):(3'h4)]) : (((8'hb2) > wire75) ?
              (wire75 != (7'h43)) : $unsigned((8'ha9)))) ^~ ($signed((+wire75)) >> reg78[(5'h11):(5'h11)])) << reg80);
    end
  assign wire86 = {$unsigned(wire67), wire72[(4'h8):(2'h3)]};
  assign wire87 = ($unsigned({(^((8'hb7) ?
                          (8'h9c) : wire74))}) - ($signed($unsigned((reg84 | wire70))) ?
                      $signed(wire75) : reg79));
  assign wire88 = reg85;
  assign wire89 = (8'hbb);
  assign wire90 = {$signed(reg81)};
  assign wire91 = (^~reg78);
  assign wire92 = reg79[(4'hb):(4'h8)];
  assign wire93 = wire88;
  always
    @(posedge clk) begin
      if ((^(($unsigned({wire72}) > $unsigned({reg80})) ?
          (|$signed(wire68)) : wire72)))
        begin
          reg94 <= ($signed(($signed({wire87}) ?
              $unsigned(wire91[(3'h7):(2'h3)]) : $unsigned(reg79[(4'h8):(2'h2)]))) <= $unsigned((wire91 ^ reg80[(3'h4):(1'h0)])));
          if ((~{(~|{(8'hbc)})}))
            begin
              reg95 <= ($unsigned(((wire77[(4'h8):(4'h8)] ?
                  $unsigned((8'hb1)) : $signed(wire90)) >>> reg84)) < {wire86[(3'h5):(1'h1)]});
              reg96 <= reg95[(3'h6):(1'h1)];
              reg97 <= wire88[(2'h3):(1'h0)];
              reg98 <= ($unsigned($unsigned(wire91)) ?
                  wire90[(4'h8):(3'h4)] : reg80);
            end
          else
            begin
              reg95 <= $signed((^~(reg98[(2'h3):(2'h3)] - $signed((~&(8'hae))))));
              reg96 <= {reg84};
              reg97 <= (~|(({(wire68 ?
                      reg81 : (7'h40))} <<< ((+wire68) <<< {reg97})) ^ ((&(-wire88)) ~^ (~(~|reg98)))));
            end
          reg99 <= $signed($unsigned((~{(wire77 <<< wire88)})));
        end
      else
        begin
          reg94 <= $signed($unsigned((&(~wire69))));
          reg95 <= $unsigned($signed(($signed($signed(wire73)) >= (8'haa))));
          reg96 <= $signed((~&$unsigned(reg84)));
          reg97 <= (-(!wire68[(3'h5):(1'h1)]));
        end
      reg100 <= (~^(8'ha0));
    end
  always
    @(posedge clk) begin
      reg101 <= reg81[(1'h0):(1'h0)];
      reg102 <= {$signed(((reg96[(1'h0):(1'h0)] - reg81) ?
              {wire73[(2'h2):(1'h0)]} : ((reg78 ?
                  wire70 : (7'h40)) || (~|(8'ha2))))),
          $signed((((reg83 ? wire69 : wire77) ?
              wire86[(3'h5):(1'h1)] : reg98[(1'h0):(1'h0)]) + wire69[(2'h3):(2'h3)]))};
    end
  assign wire103 = ((({{wire88, wire70}, wire77} ?
                           {(8'ha4)} : $unsigned(reg80[(2'h2):(2'h2)])) + $unsigned($signed((reg100 ?
                           reg95 : (8'hbe))))) ?
                       $signed(((!{wire74, wire89}) * ($unsigned((8'hae)) ?
                           (reg98 ?
                               wire73 : wire71) : $signed(wire86)))) : (reg94[(2'h2):(1'h1)] >= reg82[(3'h6):(2'h2)]));
  assign wire104 = reg79[(3'h6):(2'h2)];
endmodule
