module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire150;
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire39,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire41,
                 wire150,
                 reg7,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  assign wire5 = wire3[(2'h3):(2'h3)];
  assign wire6 = $unsigned((~|{$unsigned((~|(8'hbb)))}));
  always
    @(posedge clk) begin
      reg7 <= ($signed($unsigned(wire3[(3'h4):(1'h0)])) ^~ wire6[(2'h3):(1'h0)]);
    end
  assign wire8 = wire5[(1'h1):(1'h0)];
  assign wire9 = $signed(wire6[(1'h1):(1'h1)]);
  assign wire10 = wire4;
  always
    @(posedge clk) begin
      reg11 <= $unsigned((&wire5[(3'h6):(3'h4)]));
      reg12 <= (reg11 || ($unsigned($unsigned($signed(wire2))) ?
          reg11 : $unsigned($signed((wire5 ? (8'hb0) : wire8)))));
      reg13 <= wire3[(1'h1):(1'h1)];
      if (wire0)
        begin
          reg14 <= $signed(((8'hbd) - wire0[(4'hf):(4'hc)]));
          if ($signed($unsigned(wire6[(1'h1):(1'h0)])))
            begin
              reg15 <= reg13;
              reg16 <= $signed(wire5);
              reg17 <= ((-wire2) || (8'hac));
            end
          else
            begin
              reg15 <= reg14[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg14 <= $signed((8'haa));
          reg15 <= $signed($signed((~wire9[(5'h10):(2'h3)])));
          reg16 <= wire9;
        end
      reg18 <= $unsigned($unsigned(reg14));
    end
  module19 #() modinst40 (.wire22(wire9), .wire23(reg13), .wire21(wire1), .wire24(wire0), .y(wire39), .clk(clk), .wire20(reg17));
  assign wire41 = wire1[(3'h4):(3'h4)];
  module42 #() modinst151 (wire150, clk, wire10, reg12, wire5, wire4);
  assign wire152 = (8'ha1);
  assign wire153 = reg12[(3'h5):(1'h1)];
  assign wire154 = $signed((~^$unsigned(reg11)));
endmodule

module module42
#(parameter param148 = ((~&((-(-(8'h9d))) << {(&(8'hab))})) ^~ (^((((8'ha5) ^ (7'h41)) ^~ ((8'hb2) < (8'h9c))) ~^ (~&((8'h9f) ? (8'ha6) : (8'haf)))))), 
parameter param149 = (((param148 >>> param148) ^~ {(^param148)}) ? (({{(8'hb5)}, (~^param148)} ? {(param148 | param148), param148} : ((&param148) ? {param148} : (param148 ? (8'hac) : param148))) & ({(^(8'ha6)), (param148 ? param148 : param148)} < param148)) : param148))
(y, clk, wire43, wire44, wire45, wire46);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire43;
  input wire [(3'h5):(1'h0)] wire44;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire signed [(4'he):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire104;
  wire signed [(2'h2):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire90;
  reg [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire143,
                 wire141,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire92,
                 wire53,
                 wire54,
                 wire90,
                 reg145,
                 reg144,
                 reg95,
                 reg94,
                 reg93,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg47 <= ({$unsigned(wire44[(1'h0):(1'h0)])} ?
          (wire46 ? (~wire46[(3'h4):(2'h3)]) : (8'hac)) : (7'h42));
      if ((-$signed(((reg47 ?
          reg47 : wire43) >= $signed(wire45[(3'h5):(3'h5)])))))
        begin
          reg48 <= $signed(($unsigned(((!wire45) ~^ $signed(wire43))) >> $unsigned($signed((reg47 ?
              wire44 : (8'haa))))));
          reg49 <= reg48[(1'h0):(1'h0)];
          reg50 <= ($signed($signed($unsigned($signed(reg49)))) ?
              {(^~((reg47 | (8'ha4)) ?
                      (|wire46) : (wire46 ?
                          wire44 : wire45)))} : wire43[(3'h7):(1'h0)]);
          reg51 <= reg50;
          reg52 <= reg48[(2'h3):(1'h1)];
        end
      else
        begin
          reg48 <= ((reg49 | wire44[(1'h0):(1'h0)]) ?
              (!reg52[(4'hf):(4'hf)]) : ($unsigned(((reg50 >= wire43) ?
                  reg49 : reg49)) < (~^((reg52 ? reg48 : reg48) + wire45))));
          reg49 <= ((~|($unsigned($unsigned(wire43)) ?
                  {wire46[(1'h0):(1'h0)], {wire46}} : $unsigned(wire46))) ?
              (!reg48) : (8'hb1));
        end
    end
  assign wire53 = wire43[(4'he):(4'ha)];
  assign wire54 = (reg47[(5'h13):(4'he)] << reg50);
  always
    @(posedge clk) begin
      reg55 <= $unsigned({((|(8'hb3)) * $signed($signed(reg47)))});
      if ((~reg49))
        begin
          reg56 <= reg50;
        end
      else
        begin
          reg56 <= $unsigned(reg48[(1'h1):(1'h0)]);
          reg57 <= reg50[(4'h9):(3'h4)];
          reg58 <= wire46[(2'h2):(2'h2)];
          reg59 <= (wire44 <= reg55);
          if ($signed((^~reg55)))
            begin
              reg60 <= (&($signed((-reg49)) ?
                  (reg47 ? {(reg50 <= reg51)} : reg55) : wire54));
              reg61 <= $unsigned(wire45[(3'h7):(2'h2)]);
              reg62 <= reg59;
            end
          else
            begin
              reg60 <= wire53;
              reg61 <= $signed($signed(wire45));
              reg62 <= $signed((|reg59[(4'h8):(3'h7)]));
            end
        end
      reg63 <= (((reg60 - ((reg49 ?
              reg62 : reg47) == $unsigned(reg47))) <<< (!{(~reg62)})) ?
          $signed({($signed(wire54) >= (reg49 ^ (8'hba))),
              wire46[(4'h8):(3'h5)]}) : wire43[(5'h12):(2'h2)]);
      reg64 <= reg59[(3'h5):(2'h3)];
    end
  module65 #() modinst91 (.wire70(reg61), .wire66(reg50), .y(wire90), .clk(clk), .wire68(wire46), .wire67(wire45), .wire69(wire44));
  assign wire92 = (({$signed($unsigned(reg50)),
                          ((~reg52) ? wire46[(3'h6):(2'h2)] : reg63)} ?
                      $unsigned((~&(+reg60))) : (8'hbd)) & ({reg50[(1'h1):(1'h1)],
                          ((reg55 & reg62) | (8'haa))} ?
                      ((~|$unsigned(wire46)) ?
                          (!((8'hb4) ?
                              reg58 : (7'h42))) : {$unsigned(reg52)}) : $unsigned((((8'ha0) >> wire90) ?
                          reg48 : reg61))));
  always
    @(posedge clk) begin
      reg93 <= (reg51[(3'h7):(3'h5)] ?
          {{$unsigned((reg60 ? wire46 : wire92))}, reg58} : (8'hb6));
      reg94 <= (wire45 ?
          ({(~^(~^(8'ha8))), (reg56[(4'hf):(4'he)] | {(8'hb1), wire44})} ?
              (|(reg61 ?
                  $unsigned(reg52) : wire45)) : $unsigned(wire90)) : (|(({reg57,
              reg51} ^ wire45[(4'he):(1'h1)]) * (8'hbe))));
      reg95 <= reg52[(3'h7):(3'h7)];
    end
  assign wire96 = reg93;
  assign wire97 = (!$unsigned($unsigned((+wire53))));
  assign wire98 = $signed((($signed((wire46 ~^ reg47)) ?
                      ((~&reg55) < $signed(wire96)) : $unsigned((^wire46))) & ((~&(reg57 ?
                          reg49 : reg60)) ?
                      (wire90 <= {wire44}) : reg59)));
  assign wire99 = {$unsigned(({$unsigned(reg56),
                          reg94[(4'hd):(2'h3)]} <= (^$signed(reg51))))};
  assign wire100 = reg57;
  assign wire101 = (~|((+(wire53 >>> reg59)) <= (((^(8'hb6)) | reg59) * {(reg95 && wire99),
                       ((8'ha8) ? wire99 : wire53)})));
  assign wire102 = ((-wire100) ?
                       ((reg47[(5'h10):(4'hb)] * $unsigned($unsigned(reg64))) <<< $unsigned({wire101,
                           {reg50}})) : $unsigned((-((!wire43) ?
                           ((8'had) >> wire92) : $unsigned(reg52)))));
  assign wire103 = ((&(!(wire43 <= (wire98 ?
                       (7'h43) : wire101)))) <<< (wire102 <= (~&(8'h9e))));
  assign wire104 = wire46;
  module105 #() modinst142 (.clk(clk), .wire109(reg49), .y(wire141), .wire107(wire101), .wire106(reg62), .wire108(wire98));
  assign wire143 = (^$signed((wire101 ?
                       ($signed(reg58) >> reg49) : wire44[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg144 <= reg51;
      reg145 <= reg51;
    end
  assign wire146 = (~^$unsigned(wire44));
  assign wire147 = (reg51 ?
                       $signed((((-wire54) == (+wire143)) ?
                           reg47[(3'h6):(2'h2)] : (^$unsigned(wire44)))) : $unsigned((((wire96 | reg55) ?
                               reg94[(2'h2):(1'h1)] : $signed(reg145)) ?
                           reg55 : (~^$unsigned(reg93)))));
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire24;
  input wire [(2'h3):(1'h0)] wire23;
  input wire signed [(2'h2):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire25 = (wire21 ~^ wire20[(4'hd):(1'h0)]);
  assign wire26 = {$signed($signed((8'h9f))),
                      $unsigned((wire20[(4'ha):(2'h3)] * $unsigned(wire20)))};
  assign wire27 = wire21;
  assign wire28 = $unsigned({(wire25[(4'h8):(3'h5)] ?
                          $signed($signed(wire25)) : $unsigned(((8'haf) > wire26))),
                      wire27[(1'h1):(1'h1)]});
  assign wire29 = $unsigned(((((8'ha3) <= wire22) ?
                      (!(^wire25)) : $signed($unsigned(wire24))) ~^ $signed({wire26,
                      (wire25 >>> wire24)})));
  assign wire30 = ((-$unsigned($signed(wire27))) ?
                      $unsigned((wire21[(3'h7):(1'h1)] ?
                          (|$unsigned(wire29)) : wire27)) : wire22);
  always
    @(posedge clk) begin
      reg31 <= wire21;
      reg32 <= (~^wire21[(4'ha):(3'h7)]);
    end
  assign wire33 = ((wire20 ~^ {wire30,
                      $unsigned((reg32 ?
                          wire22 : wire21))}) >= $signed((8'hb1)));
  assign wire34 = $signed($signed((wire33 <<< (^~$unsigned(wire22)))));
  assign wire35 = wire21;
  assign wire36 = (7'h44);
  assign wire37 = $signed(wire21);
  assign wire38 = wire22[(1'h0):(1'h0)];
endmodule

module module105
#(parameter param139 = (({((!(8'hb7)) + ((8'hbe) - (8'hb3))), (-((7'h42) ^~ (8'hb8)))} < (~|({(8'h9c), (8'hbf)} <<< ((8'hbe) ? (7'h40) : (8'ha4))))) << ((({(8'ha5)} ? ((8'hbc) >>> (8'h9d)) : {(7'h44)}) << (~^{(8'hbc), (8'hb9)})) ? (8'h9d) : (^((~&(8'had)) ? ((8'ha4) >> (8'hb4)) : ((8'hab) || (8'hb7)))))), 
parameter param140 = ((-{param139}) << param139))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire109;
  input wire [(4'h8):(1'h0)] wire108;
  input wire [(4'hb):(1'h0)] wire107;
  input wire signed [(2'h2):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire110;
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire119,
                 wire118,
                 wire112,
                 wire111,
                 wire110,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire110 = (~{(-{wire106})});
  assign wire111 = (wire109 ?
                       wire109[(2'h2):(1'h1)] : ((~|(|$unsigned(wire106))) ?
                           $unsigned((wire108[(1'h0):(1'h0)] ?
                               $signed(wire110) : (wire107 ?
                                   wire110 : wire110))) : wire108));
  assign wire112 = (~{$signed($unsigned((&(8'h9c))))});
  always
    @(posedge clk) begin
      reg113 <= wire110[(4'hb):(1'h0)];
      if (wire109)
        begin
          reg114 <= ({(wire106[(2'h2):(1'h1)] ?
                      wire107[(3'h7):(3'h7)] : (!(reg113 * wire111)))} ?
              ({$unsigned(wire112[(2'h3):(2'h2)])} ?
                  (+(wire112[(4'h8):(3'h5)] && reg113[(2'h3):(1'h1)])) : ($unsigned(reg113[(2'h3):(1'h1)]) ?
                      (-$unsigned((8'hb6))) : ($signed(wire112) ^~ wire109[(2'h2):(2'h2)]))) : wire106);
        end
      else
        begin
          reg114 <= reg113;
          reg115 <= (((7'h44) & $signed(($unsigned(reg113) == (+(8'ha5))))) ~^ $signed(($signed((wire110 > (8'ha3))) + (~&$signed(reg113)))));
          reg116 <= ((^~{{reg114}, wire106[(2'h2):(2'h2)]}) > (reg115 ?
              $signed((^$signed(reg114))) : ($unsigned((wire110 << wire107)) ?
                  $unsigned(wire110) : reg115)));
          reg117 <= (|$unsigned((($signed(wire111) + $signed(wire112)) << (-$unsigned(wire108)))));
        end
    end
  assign wire118 = $signed($signed($signed((wire106 ?
                       (reg115 && reg115) : $unsigned(reg116)))));
  assign wire119 = reg114;
  always
    @(posedge clk) begin
      reg120 <= (^wire119[(4'h8):(3'h7)]);
      if (wire110[(4'hf):(4'h9)])
        begin
          reg121 <= (~(^~(reg120 ^~ (-(wire119 ? reg113 : (8'hbc))))));
          reg122 <= reg113;
        end
      else
        begin
          if (wire106)
            begin
              reg121 <= (!{((+wire108[(2'h2):(1'h1)]) ?
                      ($signed(reg115) == wire110) : (&(reg114 ?
                          reg116 : reg122)))});
              reg122 <= {(wire112 ?
                      $unsigned(((reg114 ?
                          wire108 : wire108) >>> $unsigned(wire119))) : ((((8'ha1) ?
                              wire106 : reg115) ?
                          reg122 : (wire112 ?
                              (8'hbd) : wire109)) & (wire109 - (!reg121))))};
              reg123 <= {$signed(wire119)};
              reg124 <= ({{reg116, (~|(8'haa))}} ?
                  $signed((reg122[(4'h9):(1'h1)] ~^ {(-wire106),
                      (reg120 ? reg122 : reg113)})) : wire108[(3'h5):(3'h5)]);
            end
          else
            begin
              reg121 <= $signed(wire106[(2'h2):(1'h1)]);
            end
          reg125 <= $signed((wire112 >>> (8'ha8)));
          reg126 <= $signed(((~^(-wire119)) >>> (wire109[(2'h2):(1'h0)] | (~(reg117 ?
              reg115 : wire118)))));
          reg127 <= $signed($unsigned($unsigned($unsigned(wire109[(1'h0):(1'h0)]))));
        end
      if (((~|$signed($unsigned({(7'h44)}))) >> ({(reg126[(4'hc):(3'h6)] ?
              (reg117 < wire111) : {wire112})} < $unsigned(($signed(wire112) ^ reg124)))))
        begin
          reg128 <= (^($unsigned((wire109[(1'h0):(1'h0)] ?
                  (wire111 && reg125) : (reg115 ? reg114 : (8'hac)))) ?
              ((~|((8'ha9) + wire118)) != (-wire119[(4'h9):(1'h1)])) : (-$unsigned(reg123))));
          reg129 <= reg117;
          if ({(reg121 ?
                  reg124 : ((reg114 ^~ reg121[(3'h4):(2'h2)]) ?
                      $unsigned((wire108 ?
                          reg128 : wire106)) : ($signed(reg120) + (wire112 ?
                          wire106 : reg117)))),
              $signed((((wire112 ^ reg116) & $unsigned(wire107)) ~^ $signed($signed(wire118))))})
            begin
              reg130 <= (8'h9d);
            end
          else
            begin
              reg130 <= wire119[(1'h0):(1'h0)];
              reg131 <= (&wire111[(1'h0):(1'h0)]);
              reg132 <= $signed(({$unsigned((reg131 ? reg116 : reg125)),
                      (reg131 ?
                          $unsigned(wire109) : (wire110 ? reg131 : (8'ha8)))} ?
                  (((+reg126) + (!reg117)) ?
                      {(reg129 ? (8'h9e) : (7'h43)),
                          (^(7'h44))} : wire106[(1'h0):(1'h0)]) : {$signed((~reg116))}));
              reg133 <= ((8'h9f) ?
                  {$signed(((reg126 == wire110) + reg115[(4'ha):(3'h5)]))} : wire110);
              reg134 <= (~&(^~reg130));
            end
        end
      else
        begin
          if (reg116[(2'h2):(1'h0)])
            begin
              reg128 <= reg124;
              reg129 <= wire107;
              reg130 <= (~reg124);
            end
          else
            begin
              reg128 <= (-($unsigned((~|$signed(reg133))) & (($unsigned(reg128) << (~wire111)) ^~ $unsigned({reg114,
                  reg116}))));
              reg129 <= {wire108, wire107[(4'h8):(4'h8)]};
              reg130 <= (7'h43);
            end
          reg131 <= wire118[(3'h5):(3'h5)];
          reg132 <= ((wire119[(2'h2):(1'h1)] ?
              reg125 : $signed($signed(wire119[(1'h1):(1'h1)]))) >> reg116);
          reg133 <= (wire106 ? reg114[(5'h15):(3'h5)] : reg115);
        end
      reg135 <= reg127[(3'h4):(1'h1)];
    end
  assign wire136 = $unsigned((~|(~|(~$signed(reg121)))));
  assign wire137 = (|wire112[(3'h5):(2'h3)]);
  assign wire138 = {((~^((reg134 < (8'hb6)) * wire108)) != ($unsigned((reg127 ?
                               reg116 : wire109)) ?
                           ({(8'hb4),
                               wire137} == reg131) : $signed($unsigned(reg124)))),
                       (reg114[(4'ha):(3'h7)] ^~ (({reg120, reg115} ?
                           ((8'ha4) * reg115) : $unsigned(reg123)) <<< (!(~reg135))))};
endmodule

module module65
#(parameter param88 = {(({(&(7'h41))} + ((^(8'ha0)) ? (8'hab) : ((8'hab) >> (8'h9c)))) > ((|(!(7'h40))) ? (~|((8'haf) ~^ (8'ha3))) : (((8'haa) ? (8'hbf) : (8'hb4)) <<< ((8'hb3) ? (7'h40) : (8'hb8)))))}, 
parameter param89 = param88)
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire signed [(3'h5):(1'h0)] wire69;
  input wire signed [(4'he):(1'h0)] wire68;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg77,
                 (1'h0)};
  assign wire71 = $unsigned(wire67[(2'h3):(1'h0)]);
  assign wire72 = wire67[(3'h4):(3'h4)];
  assign wire73 = wire68;
  assign wire74 = (wire72[(2'h3):(1'h1)] ?
                      wire72[(1'h1):(1'h0)] : ({(((8'hbf) ?
                              wire73 : (8'hb0)) ~^ wire71)} >> (~($unsigned(wire71) ?
                          $signed(wire66) : (|wire70)))));
  assign wire75 = wire69[(1'h0):(1'h0)];
  assign wire76 = (|wire70);
  always
    @(posedge clk) begin
      reg77 <= $unsigned(wire75);
    end
  assign wire78 = ($unsigned((8'ha3)) ?
                      (^((wire66 ? (-wire69) : (wire76 ^ wire69)) ?
                          (|$signed(wire72)) : $unsigned($signed(wire76)))) : wire73);
  assign wire79 = $unsigned((wire78 >> wire78[(4'h9):(3'h7)]));
  assign wire80 = $signed(wire68);
  assign wire81 = {((wire72[(2'h2):(1'h0)] || ($signed(reg77) || $signed((8'h9c)))) ?
                          $unsigned(wire66[(4'h9):(2'h2)]) : $unsigned((!$signed(reg77)))),
                      (~|$signed(wire68[(4'h9):(3'h5)]))};
  assign wire82 = ($unsigned($signed(($signed(wire66) ?
                      reg77 : $signed(wire74)))) != wire74[(3'h7):(1'h0)]);
  assign wire83 = ({$unsigned($unsigned(reg77)),
                      wire81[(1'h1):(1'h0)]} && {$signed(wire73), wire67});
  assign wire84 = (wire75[(3'h5):(2'h3)] ?
                      $unsigned($unsigned($signed((wire75 && wire74)))) : ((wire69[(1'h1):(1'h1)] ?
                              $unsigned($signed(reg77)) : (-$unsigned((8'had)))) ?
                          ($unsigned($unsigned(wire80)) >> (|((8'hbe) ?
                              wire78 : wire67))) : ($signed((wire79 > wire70)) ?
                              {(&(8'hb9)), wire71} : wire79[(4'he):(4'hc)])));
  assign wire85 = (8'hb2);
  assign wire86 = ((~|({(wire83 == wire85)} ?
                      wire79[(4'ha):(4'h9)] : $unsigned((wire78 <<< wire84)))) >> $signed((~^reg77)));
  assign wire87 = {(wire68 == $unsigned((wire82 ?
                          (wire69 << wire85) : (wire84 >= (7'h44)))))};
endmodule
