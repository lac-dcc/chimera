module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire58;
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire140,
                 wire138,
                 wire19,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire58,
                 reg20,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire1[(4'ha):(1'h0)]))
        begin
          if ((~&wire3[(4'ha):(1'h1)]))
            begin
              reg4 <= wire0[(1'h0):(1'h0)];
              reg5 <= {(^~$signed(wire3))};
              reg6 <= wire0;
              reg7 <= ((wire3[(5'h13):(2'h3)] ?
                  ((~(wire1 || wire1)) ?
                      $unsigned({(8'hbf),
                          wire3}) : ((!reg6) > reg6[(2'h3):(1'h1)])) : wire0) == reg6[(3'h4):(2'h3)]);
              reg8 <= (!$unsigned((wire0[(3'h4):(2'h2)] ?
                  ($signed(reg7) ?
                      wire1[(2'h3):(1'h0)] : (wire1 + wire1)) : reg7[(2'h3):(1'h0)])));
            end
          else
            begin
              reg4 <= $unsigned({wire1[(1'h1):(1'h0)], wire1});
              reg5 <= (({reg6, $unsigned(reg6)} < ($signed($signed((8'ha3))) ?
                      $unsigned(wire3) : $unsigned((reg5 ? (7'h40) : wire0)))) ?
                  (7'h41) : (~|(8'ha9)));
              reg6 <= {reg4[(4'h9):(3'h5)], (8'h9d)};
              reg7 <= (8'h9f);
              reg8 <= (!(8'hba));
            end
          if (((reg8[(2'h3):(2'h3)] ~^ wire2) | (reg5 >>> reg4)))
            begin
              reg9 <= reg8;
              reg10 <= ($signed($signed($unsigned($signed(reg4)))) ?
                  (8'ha8) : $unsigned((~^$unsigned((wire1 == reg6)))));
              reg11 <= (wire3 ?
                  reg6[(1'h1):(1'h1)] : (($signed((reg4 && reg6)) * $signed(reg6)) && reg8));
              reg12 <= (wire2 ? $signed(wire0) : $unsigned(reg9));
            end
          else
            begin
              reg9 <= $signed(($signed($signed($unsigned(reg11))) ?
                  wire3[(1'h0):(1'h0)] : (!$signed($signed(wire0)))));
              reg10 <= ((~|wire0[(1'h1):(1'h0)]) ?
                  ($signed($signed((reg4 ?
                      reg8 : (8'h9e)))) & (~^$signed(reg4))) : $unsigned($signed((8'hbc))));
              reg11 <= ($unsigned($unsigned($unsigned($signed(reg4)))) ?
                  (reg11 ^~ (8'ha3)) : (+(!((reg4 << reg6) ?
                      (~&(8'hb9)) : $unsigned(reg12)))));
              reg12 <= ((reg8 ~^ reg12[(4'he):(3'h5)]) ?
                  (($signed((reg4 * reg9)) == ($unsigned(reg12) >>> ((7'h40) - reg7))) ?
                      reg6 : $signed(reg10[(5'h10):(3'h7)])) : ($unsigned({{reg9,
                          reg5},
                      ((8'ha0) | (8'hbd))}) < $unsigned({(reg4 ~^ (8'hb3)),
                      (wire2 ? reg10 : reg8)})));
            end
        end
      else
        begin
          reg4 <= ((reg10 ? {(~^(8'ha3))} : wire3[(1'h1):(1'h1)]) >= reg8);
          reg5 <= {reg6};
          reg6 <= $signed(((8'h9d) <<< (reg8[(2'h2):(1'h1)] ?
              ($unsigned(reg8) | wire2) : reg9)));
          if (reg12[(4'he):(2'h2)])
            begin
              reg7 <= (^($signed((~(reg7 & wire1))) - reg9));
              reg8 <= reg12;
            end
          else
            begin
              reg7 <= ((~|((&reg12[(4'hf):(2'h3)]) ?
                  reg5[(3'h5):(1'h1)] : wire0)) & ($signed(((reg10 ?
                          reg6 : wire1) ?
                      (~&(7'h44)) : {reg11})) ?
                  reg4 : (reg8 <= wire0)));
              reg8 <= (!reg4[(4'hf):(4'ha)]);
              reg9 <= wire1[(3'h7):(2'h2)];
            end
          reg10 <= $unsigned(reg7);
        end
      reg13 <= $signed($signed($signed(reg8[(1'h0):(1'h0)])));
      reg14 <= (&wire1[(3'h6):(3'h4)]);
      reg15 <= ($unsigned({($unsigned(wire3) ?
              reg14[(3'h5):(1'h1)] : wire1[(1'h0):(1'h0)]),
          reg11}) >> ({{(wire1 | reg6)}, (reg8[(1'h1):(1'h0)] - (^~reg10))} ?
          ((8'ha8) >> reg8[(1'h0):(1'h0)]) : $unsigned({((8'ha4) > (8'h9d))})));
      reg16 <= $signed(((+(&$signed(reg7))) ?
          (($unsigned(wire0) ? (~|reg10) : reg13[(5'h11):(4'hf)]) ?
              $signed((reg14 + reg9)) : ((reg10 >>> reg9) - $signed((8'hba)))) : (7'h40)));
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned(((reg7[(4'hc):(3'h6)] | reg9[(4'h9):(2'h2)]) && ({$signed(reg14),
          reg10[(3'h5):(2'h3)]} <= (~|{reg15, reg14}))));
      reg18 <= ((((reg17 > reg9) - ($signed(reg14) ^ (reg5 == reg11))) & (~&reg13)) && $signed(reg7[(2'h3):(1'h1)]));
    end
  assign wire19 = $unsigned($signed(reg16[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg20 <= reg6[(4'h9):(3'h5)];
    end
  assign wire21 = (($unsigned({$unsigned(reg16), (8'ha3)}) >> $signed(wire2)) ?
                      ((((reg9 < reg11) ?
                              {reg11} : reg7[(3'h6):(2'h2)]) < (~|$unsigned(wire1))) ?
                          ($unsigned(reg17[(3'h7):(1'h0)]) == wire1[(1'h0):(1'h0)]) : reg11[(1'h1):(1'h1)]) : reg17);
  assign wire22 = $unsigned($signed((^($unsigned(reg16) ? reg4 : reg18))));
  assign wire23 = wire22[(3'h6):(3'h5)];
  assign wire24 = reg11;
  module25 #() modinst59 (.clk(clk), .wire28(reg9), .wire27(reg20), .y(wire58), .wire30(reg12), .wire26(wire21), .wire29(reg8));
  module60 #() modinst139 (wire138, clk, reg12, reg11, reg13, reg17);
  assign wire140 = wire58[(2'h2):(1'h1)];
endmodule

module module60
#(parameter param136 = (((~&(~((8'hba) ? (8'hb6) : (8'hab)))) >>> {((-(8'hb5)) ? {(8'ha6), (8'haa)} : (8'ha7))}) != {{(~&((8'hbb) && (8'ha2)))}, (8'hbb)}), 
parameter param137 = (param136 && (!(~(^(param136 ? param136 : param136))))))
(y, clk, wire61, wire62, wire63, wire64);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire signed [(4'hf):(1'h0)] wire63;
  input wire signed [(5'h15):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire133;
  assign y = {wire135, wire65, wire82, wire84, wire85, wire133, (1'h0)};
  assign wire65 = $signed((!(($unsigned(wire62) >> (wire61 << wire64)) >> wire61)));
  module66 #() modinst83 (.wire70(wire62), .y(wire82), .wire69(wire61), .wire68(wire64), .clk(clk), .wire67(wire63));
  assign wire84 = (^($unsigned(wire65) == (wire65 ?
                      $signed($unsigned(wire65)) : $unsigned((^~wire61)))));
  assign wire85 = (~^wire63);
  module86 #() modinst134 (.y(wire133), .wire91(wire63), .wire88(wire85), .wire87(wire82), .clk(clk), .wire90(wire64), .wire89(wire62));
  assign wire135 = {(~(~(|$unsigned(wire64)))),
                       {(wire64[(5'h14):(5'h12)] <= $signed((!wire133)))}};
endmodule

module module25
#(parameter param56 = (^~(~{(~&((8'ha2) >>> (8'ha6))), (((8'ha3) <= (8'ha5)) ? (^~(7'h43)) : ((8'ha7) ? (7'h40) : (8'hb0)))})), 
parameter param57 = ((-((~&(&param56)) > (&param56))) >= param56))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(4'h8):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  assign y = {wire55,
                 wire51,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire31 = $signed({wire29,
                      ($signed(wire30[(4'hd):(3'h5)]) ?
                          (-(wire30 | wire28)) : $signed({wire27}))});
  assign wire32 = ($signed($signed({wire26[(4'h8):(3'h5)],
                          ((8'hac) == wire28)})) ?
                      (8'hbf) : $unsigned((~|($signed(wire26) ?
                          (wire29 + wire27) : wire27))));
  assign wire33 = (!wire29);
  assign wire34 = (~&(^$unsigned(wire29)));
  module35 #() modinst52 (.clk(clk), .y(wire51), .wire36(wire29), .wire39(wire31), .wire37(wire28), .wire38(wire33));
  always
    @(posedge clk) begin
      reg53 <= wire51;
      reg54 <= $signed(($unsigned(((wire33 ? wire32 : wire51) - wire32)) ?
          {wire27[(3'h6):(2'h3)],
              wire26[(4'h8):(3'h6)]} : $signed(((wire34 ^~ wire30) * $signed(wire31)))));
    end
  assign wire55 = (~{($unsigned((^~(8'ha1))) | $signed($signed(wire29))),
                      ((^~wire33) <<< wire51[(4'ha):(3'h6)])});
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire38;
  input wire signed [(5'h14):(1'h0)] wire37;
  input wire signed [(4'he):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire37))
        begin
          reg40 <= (&$signed($unsigned(wire38[(4'h8):(1'h0)])));
          reg41 <= ((wire38 >>> (-wire39[(1'h1):(1'h0)])) ?
              $unsigned((wire38 ? (8'ha2) : wire39)) : wire38[(5'h12):(3'h6)]);
          reg42 <= ($unsigned((((wire37 || (8'had)) ? $signed(reg40) : wire39) ?
              reg40 : (^~$signed(wire38)))) << wire38[(4'hc):(4'h8)]);
        end
      else
        begin
          reg40 <= ((-$signed(($unsigned(wire37) ?
              $unsigned(wire38) : (~&wire38)))) <<< wire38);
          reg41 <= $signed(wire39[(3'h6):(1'h0)]);
          reg42 <= (^{wire38, $unsigned(reg40)});
          reg43 <= (&((wire39[(4'hd):(1'h0)] ?
                  (^~wire36[(3'h7):(3'h4)]) : (7'h44)) ?
              $signed(reg41) : (wire37 != $unsigned((wire38 >> reg42)))));
          reg44 <= {$unsigned(wire36)};
        end
    end
  assign wire45 = ({(8'hbe), $unsigned($unsigned((reg41 ? reg42 : reg44)))} ?
                      $signed(($signed($unsigned(reg42)) | $signed($signed(wire38)))) : (((!$signed(reg40)) ?
                              (8'haf) : (~|(wire39 - reg40))) ?
                          {($unsigned(reg43) ?
                                  wire37 : (8'hbc))} : $signed(({reg43} >> {reg40}))));
  assign wire46 = $unsigned($unsigned($unsigned($signed(wire38))));
  assign wire47 = reg44[(3'h7):(1'h0)];
  assign wire48 = reg40;
  assign wire49 = $unsigned((&((|(reg40 ? wire37 : (8'ha4))) ?
                      ($unsigned(reg40) ?
                          (!wire47) : reg44) : (^$signed(wire39)))));
  assign wire50 = (-(!$signed((((8'haa) ? wire45 : reg41) ?
                      ((7'h44) ? reg43 : wire49) : $signed(wire37)))));
endmodule

module module86
#(parameter param132 = (!((~((-(8'ha4)) ? ((8'h9d) ? (7'h44) : (8'hbf)) : (8'haf))) | (|{((8'hb9) ? (8'hb9) : (8'hac)), ((8'hae) ? (8'hbb) : (8'hb1))}))))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire89;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire [(5'h14):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(3'h6):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  reg [(4'hc):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  assign y = {wire131,
                 wire117,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
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
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire92 = $signed((wire90[(2'h2):(1'h1)] < (wire91 + (|{wire91,
                      wire89}))));
  assign wire93 = wire87[(5'h11):(2'h3)];
  assign wire94 = (~|(($signed((wire88 || wire90)) ?
                          {(!wire90), (wire88 ? wire92 : wire91)} : wire88) ?
                      $signed({(~^wire90),
                          (|(8'hb9))}) : wire91[(4'ha):(3'h7)]));
  assign wire95 = wire91[(4'h9):(1'h1)];
  assign wire96 = ($signed({$unsigned(wire94[(4'ha):(4'h8)]), wire94}) ?
                      wire91 : wire90);
  assign wire97 = $signed(wire93);
  assign wire98 = wire96;
  assign wire99 = ((!(8'hb7)) ?
                      {wire98[(1'h0):(1'h0)]} : $unsigned(wire87[(4'hc):(4'hc)]));
  assign wire100 = wire99;
  assign wire101 = (-(+$unsigned((wire99[(1'h0):(1'h0)] ?
                       ((7'h41) ? wire97 : wire90) : (wire92 ?
                           wire96 : wire95)))));
  assign wire102 = (|{wire100, wire87[(3'h5):(2'h3)]});
  assign wire103 = $signed(wire95[(3'h7):(1'h0)]);
  assign wire104 = (~(8'haf));
  assign wire105 = wire88[(2'h3):(1'h0)];
  assign wire106 = (wire93 ?
                       ((wire103 ? wire102[(3'h4):(1'h0)] : wire92) ?
                           $unsigned(({(8'had)} ?
                               (wire103 < wire95) : wire92)) : $unsigned($unsigned((~wire102)))) : ($unsigned({((8'hb2) ?
                               (8'haa) : wire90),
                           wire91}) * (|wire102)));
  assign wire107 = (&(&wire103[(4'hc):(1'h1)]));
  assign wire108 = wire95[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg109 <= wire103;
      reg110 <= wire94[(3'h5):(2'h2)];
      reg111 <= (+wire88[(3'h4):(1'h0)]);
      if ($signed(wire89))
        begin
          reg112 <= ((^~(~|wire100[(2'h2):(1'h1)])) && (wire90[(4'h8):(1'h0)] >> wire95[(4'hc):(4'hb)]));
          reg113 <= ((wire94[(1'h0):(1'h0)] - (~reg109)) ?
              wire106[(1'h1):(1'h1)] : (~&wire87[(4'hf):(4'ha)]));
          reg114 <= {{$unsigned(((&(7'h40)) ? {reg109} : wire90)), wire102},
              $signed(($unsigned(reg110[(5'h12):(3'h5)]) * (8'h9d)))};
          reg115 <= (^~(($unsigned($unsigned(wire98)) ?
                  (&wire92) : ($signed(reg113) ?
                      (wire102 ^~ wire90) : ((8'ha6) ? wire107 : wire94))) ?
              $signed({(~^wire102)}) : ($signed((wire106 * wire99)) ?
                  $signed($signed(wire105)) : (8'hba))));
          reg116 <= ((wire94[(1'h1):(1'h0)] ?
              ((wire88[(2'h2):(1'h0)] ?
                  wire95[(4'hc):(2'h3)] : (wire92 && wire105)) && (!(~&(8'ha1)))) : (~&wire87[(5'h13):(4'h8)])) || $signed(reg112[(3'h4):(2'h3)]));
        end
      else
        begin
          reg112 <= wire91;
          reg113 <= wire95;
        end
    end
  assign wire117 = $unsigned((^reg109));
  always
    @(posedge clk) begin
      reg118 <= wire98;
      reg119 <= $unsigned(wire104[(3'h6):(3'h4)]);
      if (wire106)
        begin
          reg120 <= ((-(reg116 > (reg109 ? wire88 : (wire95 && wire101)))) ?
              wire98 : reg116[(4'h8):(2'h3)]);
          reg121 <= wire92[(4'h8):(2'h3)];
          reg122 <= (8'hb9);
        end
      else
        begin
          reg120 <= wire96[(5'h11):(3'h5)];
          if (reg114[(5'h12):(3'h7)])
            begin
              reg121 <= wire99[(1'h0):(1'h0)];
            end
          else
            begin
              reg121 <= wire100[(2'h2):(1'h0)];
              reg122 <= $signed((~^reg121));
              reg123 <= (~(^~((^$signed(wire107)) > wire117)));
              reg124 <= (&(reg113 ?
                  ($signed(reg119) ?
                      ((wire91 ? (8'hbe) : reg118) ?
                          $signed((8'haa)) : $signed(wire93)) : (8'hb3)) : (wire92[(5'h12):(1'h0)] ?
                      ($unsigned(reg119) <<< (reg119 ^~ wire92)) : $unsigned(wire91[(4'h8):(3'h5)]))));
            end
          reg125 <= {wire102[(3'h4):(2'h3)]};
          if ((+(-((|reg112) ?
              (reg115[(3'h4):(2'h2)] ^ wire101) : $unsigned((8'hbe))))))
            begin
              reg126 <= (&((((wire99 ^~ wire88) ?
                      {wire102} : $unsigned(reg114)) >= $unsigned({reg115})) ?
                  wire88[(1'h0):(1'h0)] : $unsigned({(wire105 & reg118)})));
              reg127 <= wire99;
              reg128 <= wire108;
              reg129 <= ((~$signed((&(|reg122)))) ^~ reg126[(3'h7):(3'h5)]);
            end
          else
            begin
              reg126 <= {wire89};
              reg127 <= ({(($unsigned(reg128) ^~ (reg124 <<< wire92)) ?
                      $unsigned(reg118) : {$signed(reg109),
                          $signed(wire117)})} + (((wire96[(5'h12):(2'h2)] ?
                          {reg118, wire99} : reg122[(3'h5):(3'h5)]) ?
                      {(wire97 ?
                              (8'hac) : reg109)} : ((wire102 ^~ wire103) <= $unsigned(reg110))) ?
                  $unsigned($signed($signed(wire106))) : wire93[(3'h6):(1'h1)]));
              reg128 <= (!($unsigned(reg122) ?
                  (~$unsigned((8'hbd))) : $signed(wire89)));
              reg129 <= reg111;
              reg130 <= reg121[(4'h9):(4'h9)];
            end
        end
    end
  assign wire131 = $unsigned((~&$unsigned(reg109[(2'h2):(2'h2)])));
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire [(5'h10):(1'h0)] wire68;
  input wire signed [(4'h9):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg78,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire71 = $unsigned(wire68);
  assign wire72 = ($signed(((~|wire71[(5'h15):(5'h15)]) ~^ wire70[(3'h7):(3'h6)])) >= wire71[(5'h15):(5'h10)]);
  assign wire73 = wire71;
  assign wire74 = (((~^$unsigned(wire71)) ?
                          $signed((~&(wire71 ^ wire67))) : {$unsigned((+wire71))}) ?
                      wire68[(3'h6):(1'h1)] : $unsigned((wire71 > (wire72[(4'h9):(3'h6)] >> ((8'h9f) ?
                          wire70 : wire68)))));
  always
    @(posedge clk) begin
      if ($signed((wire69[(1'h1):(1'h0)] * wire70)))
        begin
          reg75 <= wire74[(1'h1):(1'h0)];
          reg76 <= $signed(($signed(reg75[(5'h12):(4'ha)]) || (wire74[(3'h7):(2'h2)] ?
              reg75[(4'h9):(3'h6)] : $unsigned($signed(wire68)))));
        end
      else
        begin
          reg75 <= (&(wire71 | $unsigned(($unsigned(wire74) ?
              (~wire68) : $signed(wire69)))));
        end
    end
  assign wire77 = (+(wire69[(1'h0):(1'h0)] - (-((reg75 && reg75) ?
                      {wire70} : reg75[(4'h9):(3'h5)]))));
  always
    @(posedge clk) begin
      reg78 <= ($unsigned(($unsigned((wire77 ?
              wire68 : wire71)) > {(wire68 <<< wire68)})) ?
          (~&({wire69, (^~wire72)} - (8'hbb))) : wire73);
    end
  assign wire79 = wire72;
  assign wire80 = $signed((wire68[(4'h8):(4'h8)] ?
                      ({$signed(reg78), {wire70}} ?
                          $signed({wire73}) : wire70[(3'h7):(3'h7)]) : $signed(wire74)));
  assign wire81 = (7'h42);
endmodule
