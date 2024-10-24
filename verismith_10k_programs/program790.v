module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire signed [(4'ha):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire125,
                 wire105,
                 wire6,
                 wire5,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire4[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg7 <= wire6;
      reg8 <= $signed($signed({wire4}));
      reg9 <= ((($signed((wire3 ?
              wire6 : wire4)) + wire3) <= ($signed($unsigned(wire0)) | $unsigned($unsigned(wire5)))) ?
          wire5[(2'h2):(1'h0)] : {{$signed(wire5), wire5[(1'h1):(1'h1)]}});
      reg10 <= wire3[(4'ha):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg11 <= wire0[(2'h2):(1'h0)];
      if (((|reg9[(2'h3):(1'h1)]) ^~ ($unsigned((8'haa)) ?
          ((&$unsigned(wire0)) ?
              ($unsigned(reg11) ~^ ((8'ha1) ~^ reg9)) : $unsigned(wire4[(2'h2):(1'h1)])) : (~|($signed((8'ha0)) + $unsigned((8'had)))))))
        begin
          reg12 <= (wire0[(4'he):(4'ha)] >> {{((reg7 ? reg11 : reg10) ?
                      wire4 : ((8'ha2) ? wire0 : wire5))},
              wire3});
          reg13 <= ((~($unsigned((~reg10)) ?
              ((reg9 ?
                  (8'hb2) : reg7) == (wire0 && reg8)) : $signed(reg8[(4'ha):(2'h3)]))) <= wire5[(1'h0):(1'h0)]);
          reg14 <= $unsigned(((&reg13) << ({$signed(wire1),
              wire5[(2'h2):(1'h1)]} & {(8'hba)})));
          reg15 <= $unsigned(($signed((8'hb6)) <= wire2[(2'h2):(1'h0)]));
          reg16 <= wire1;
        end
      else
        begin
          reg12 <= (reg13[(3'h4):(2'h3)] ?
              ((^(^~reg13[(2'h3):(2'h2)])) >= reg10) : (|(reg14 ~^ {{(8'ha4),
                      (8'hbf)}})));
        end
    end
  module17 #() modinst106 (.wire21(reg14), .y(wire105), .wire18(reg9), .wire19(reg7), .clk(clk), .wire20(reg8));
  module107 #() modinst126 (.wire108(reg13), .y(wire125), .wire111(reg12), .wire112(wire2), .wire110(wire4), .wire109(reg7), .clk(clk));
  assign wire127 = (|{reg16});
  assign wire128 = $signed(((-(^wire127[(1'h0):(1'h0)])) ?
                       wire3[(4'h9):(1'h0)] : (+$signed(wire1))));
  assign wire129 = reg14[(4'hf):(4'he)];
  assign wire130 = (8'h9e);
  assign wire131 = wire129;
  assign wire132 = $signed(wire130[(4'h9):(4'h9)]);
  assign wire133 = (wire132 >= ((($unsigned((7'h43)) >> {reg12, wire132}) ?
                           wire127 : $unsigned($signed(reg16))) ?
                       $signed(($unsigned(wire1) <= {reg11})) : {reg7[(4'h9):(3'h7)],
                           wire4[(3'h5):(3'h4)]}));
endmodule

module module107
#(parameter param123 = ((~|((^((8'hab) ? (8'ha1) : (8'ha5))) ? {((8'hbe) ? (8'hbe) : (8'h9f)), {(8'hb8), (8'hbf)}} : (~(&(8'hb6))))) >> ((~^(((8'h9c) ? (8'ha7) : (8'ha4)) & (~(8'ha6)))) ? (((8'hb8) >>> ((8'ha9) ^~ (8'ha3))) > (~((8'hb9) ? (8'hb3) : (8'h9e)))) : ((!{(8'hb8)}) ? ((~^(8'h9f)) ? {(8'hbd)} : ((8'ha0) ? (8'ha8) : (8'hb9))) : (~|(&(8'hb6)))))), 
parameter param124 = param123)
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire112;
  input wire signed [(4'h9):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  input wire signed [(3'h5):(1'h0)] wire109;
  input wire [(4'hd):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire signed [(4'h8):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire [(2'h2):(1'h0)] wire113;
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire113,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire113 = ($unsigned(wire108[(3'h5):(3'h5)]) ?
                       (wire110[(2'h3):(2'h2)] & wire109[(3'h5):(1'h1)]) : wire108);
  always
    @(posedge clk) begin
      reg114 <= wire110[(2'h2):(1'h0)];
      reg115 <= (-$unsigned($unsigned($unsigned(wire110))));
      reg116 <= (!(wire112 < (!{$unsigned(wire108)})));
      reg117 <= wire109[(3'h5):(1'h1)];
    end
  assign wire118 = $signed((reg115 << {(wire109 | (-wire111)),
                       (^~$unsigned(reg116))}));
  assign wire119 = $unsigned(wire118[(1'h0):(1'h0)]);
  assign wire120 = $unsigned($unsigned({$signed(wire108[(1'h1):(1'h1)])}));
  assign wire121 = {wire119[(4'hd):(4'hd)], wire118[(4'hf):(4'hc)]};
  assign wire122 = wire113;
endmodule

module module17
#(parameter param104 = (|({(~(^~(8'hbf))), {(!(8'h9c))}} ~^ (({(8'hb8), (8'hab)} ? {(7'h43), (8'hb2)} : ((8'hb6) ? (8'ha1) : (8'h9d))) ? ((^(8'hbe)) ? (&(8'ha6)) : {(7'h42)}) : (~&(~(8'hbc)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  assign y = {wire103, wire102, wire100, wire24, wire23, wire22, (1'h0)};
  assign wire22 = $signed({$unsigned(wire20[(2'h2):(1'h0)])});
  assign wire23 = (((($signed((8'hbc)) << $unsigned(wire21)) ~^ {{wire19}}) | (wire21[(1'h0):(1'h0)] ?
                          ($unsigned(wire20) | (wire20 ?
                              wire18 : wire19)) : (^~$unsigned(wire19)))) ?
                      (&$unsigned($signed((wire20 ^~ (8'hb2))))) : (^wire19));
  assign wire24 = wire21[(3'h5):(3'h4)];
  module25 #() modinst101 (wire100, clk, wire22, wire21, wire24, wire19);
  assign wire102 = wire19[(2'h2):(1'h0)];
  assign wire103 = ($unsigned((8'hb3)) ?
                       ($signed((((8'hbe) ? wire18 : wire18) ?
                               (wire24 + (7'h42)) : $signed(wire24))) ?
                           (~^({wire23} ?
                               (!wire100) : (wire100 ~^ (8'hb0)))) : (wire23 ?
                               (^~{wire23,
                                   wire22}) : wire20[(2'h2):(1'h1)])) : wire102[(2'h3):(1'h0)]);
endmodule

module module25
#(parameter param99 = {{(~((^(8'hb3)) * ((8'hb3) ? (8'h9d) : (8'hbd)))), (~&(^(+(8'hba))))}})
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h33c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire [(2'h3):(1'h0)] wire27;
  input wire [(4'hc):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire30;
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire83,
                 wire82,
                 wire81,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire30,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire30 = (wire27[(2'h3):(1'h0)] | ($signed(((wire28 + wire27) ?
                      (~&wire26) : $signed(wire28))) ^~ wire28));
  always
    @(posedge clk) begin
      reg31 <= (~&wire29);
      reg32 <= $unsigned({$unsigned($unsigned($unsigned(wire27))),
          $signed(wire28[(4'ha):(2'h3)])});
      reg33 <= $unsigned($signed(reg32));
      if (((((reg31 ? wire28[(3'h6):(2'h2)] : wire30[(3'h4):(2'h2)]) ?
              (-(reg33 ? wire29 : wire28)) : wire30[(1'h1):(1'h1)]) ?
          reg33 : wire26) ~^ ($unsigned(((!(8'haa)) ?
          {wire29, wire28} : wire30)) ^~ reg31[(2'h3):(1'h0)])))
        begin
          reg34 <= wire28[(4'he):(2'h2)];
          reg35 <= wire30[(3'h4):(1'h0)];
        end
      else
        begin
          reg34 <= reg31;
          reg35 <= reg31;
          reg36 <= $unsigned((reg34[(1'h0):(1'h0)] + (~|wire29[(4'h8):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg37 <= wire27[(2'h2):(1'h0)];
      reg38 <= $signed($signed(reg32));
      reg39 <= $unsigned(wire26);
      reg40 <= {reg34,
          (reg35[(3'h4):(2'h3)] ? wire28 : $unsigned($unsigned(reg35)))};
    end
  always
    @(posedge clk) begin
      reg41 <= ($signed((~|(reg35[(3'h5):(3'h5)] ?
          (wire27 | reg38) : (reg36 ?
              (8'hba) : reg34)))) != (^~(($signed(wire28) ?
          (~&reg37) : $signed((7'h41))) & ((reg37 <<< reg38) ?
          reg34[(2'h3):(1'h0)] : $signed(wire30)))));
      if ({($unsigned((reg35[(1'h0):(1'h0)] << $signed((8'ha9)))) <= (^~(reg41[(4'hb):(3'h7)] ?
              reg31 : wire30[(3'h6):(1'h0)])))})
        begin
          if (((wire27 ? reg35[(4'hb):(4'ha)] : (+wire27[(2'h2):(2'h2)])) ?
              (+(wire29[(4'h9):(1'h0)] ?
                  reg33 : ($unsigned(reg33) ?
                      $signed(reg34) : (reg32 | reg37)))) : $unsigned((~|(~&(8'hac))))))
            begin
              reg42 <= (~|(wire29[(3'h6):(3'h4)] | wire26));
              reg43 <= reg36;
              reg44 <= {(($signed(reg40[(2'h3):(1'h0)]) + (reg33[(1'h0):(1'h0)] | $unsigned(reg38))) | $unsigned($signed(wire27[(2'h2):(1'h1)])))};
              reg45 <= {(8'hba)};
              reg46 <= (~&($unsigned({(wire28 ? reg34 : (8'hb0)),
                      (reg41 ? reg39 : (8'hb6))}) ?
                  $signed({$unsigned(reg36)}) : $unsigned($unsigned(reg43[(5'h10):(3'h7)]))));
            end
          else
            begin
              reg42 <= (reg35[(4'h8):(2'h3)] ^ $unsigned((reg40 - ((reg39 ?
                      reg31 : reg31) ?
                  $signed(reg33) : (^reg31)))));
              reg43 <= (~^reg33);
            end
          if (((wire27[(1'h1):(1'h0)] ?
              (~^$signed((reg46 ? reg37 : reg42))) : (reg45 ?
                  wire29[(4'hd):(4'ha)] : ($unsigned(reg33) ?
                      (~|reg41) : {(8'ha4)}))) ~^ $signed(reg32[(2'h2):(1'h1)])))
            begin
              reg47 <= (8'ha8);
              reg48 <= (7'h44);
            end
          else
            begin
              reg47 <= $signed((((|reg47) * $signed($unsigned(reg47))) + $signed(reg46)));
              reg48 <= $unsigned(reg40);
              reg49 <= $unsigned(reg43[(4'hb):(2'h2)]);
              reg50 <= (reg33 ~^ {reg40, $unsigned(wire28[(3'h7):(1'h0)])});
            end
          reg51 <= (-((($signed(reg48) ?
                  reg44 : (reg46 ^~ reg46)) > $unsigned($signed((8'ha3)))) ?
              $signed($unsigned(reg40[(1'h0):(1'h0)])) : ((|(-reg35)) + reg35[(4'ha):(4'h8)])));
        end
      else
        begin
          reg42 <= ((~^reg50[(4'ha):(3'h7)]) ?
              $unsigned((reg45 >> $unsigned((reg44 ?
                  reg45 : reg34)))) : $unsigned(reg47[(1'h0):(1'h0)]));
          reg43 <= reg42;
        end
      reg52 <= $unsigned((|(8'ha1)));
      reg53 <= reg50;
    end
  assign wire54 = reg47[(1'h1):(1'h0)];
  assign wire55 = (!wire29[(1'h0):(1'h0)]);
  assign wire56 = {$signed((reg32[(2'h3):(1'h0)] ?
                          ((|(8'hbd)) >>> (^(8'ha6))) : {{wire55, wire28}}))};
  assign wire57 = wire27[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed(($signed((+(wire55 - reg50))) != {(!$unsigned((8'ha4))),
          $signed((+(8'ha4)))})))
        begin
          if ({reg48, reg39})
            begin
              reg58 <= $signed(($signed(reg47[(1'h0):(1'h0)]) ^ reg31));
              reg59 <= reg45[(4'hc):(3'h6)];
            end
          else
            begin
              reg58 <= (wire28[(4'he):(2'h3)] > (&wire56[(3'h7):(2'h2)]));
              reg59 <= $signed(wire54);
            end
          reg60 <= wire29[(4'hb):(1'h0)];
          reg61 <= {reg35};
        end
      else
        begin
          reg58 <= reg58[(3'h4):(2'h3)];
          if ($signed($unsigned(reg53)))
            begin
              reg59 <= (((+$unsigned(reg46)) ^~ {reg61, reg45}) || (8'hbe));
              reg60 <= reg32[(1'h0):(1'h0)];
              reg61 <= reg47[(1'h1):(1'h0)];
              reg62 <= $unsigned((~|reg39));
            end
          else
            begin
              reg59 <= $unsigned($signed((~^$unsigned((reg39 <<< reg34)))));
              reg60 <= ($signed(reg33[(3'h4):(1'h0)]) >> reg48[(4'h8):(1'h0)]);
            end
          if ($signed((&$signed(wire27))))
            begin
              reg63 <= reg46[(4'hc):(4'ha)];
            end
          else
            begin
              reg63 <= $signed((^~((8'h9c) >>> $unsigned($signed(reg37)))));
              reg64 <= ((wire27[(1'h0):(1'h0)] ~^ (wire56 ?
                      ((reg62 ? wire30 : reg61) < {reg60,
                          reg32}) : (reg61 | (+reg38)))) ?
                  {$unsigned($signed($signed(reg35)))} : $unsigned(reg59[(4'hd):(3'h5)]));
              reg65 <= ({reg60} <<< $unsigned($signed(reg63)));
            end
        end
      if (reg47[(2'h2):(1'h0)])
        begin
          if (reg58[(1'h0):(1'h0)])
            begin
              reg66 <= ((8'hac) & ((reg52 >>> reg40[(3'h5):(2'h3)]) ?
                  (reg44[(1'h0):(1'h0)] ?
                      (reg49 <<< $signed((8'hb9))) : (+reg51)) : reg39[(4'hb):(2'h2)]));
              reg67 <= $unsigned(reg65[(5'h13):(3'h7)]);
              reg68 <= ((reg38 >= (reg39 >= (-wire30))) << {$signed(reg47[(1'h1):(1'h1)]),
                  $unsigned(({reg59, reg50} ?
                      $unsigned(reg37) : (reg49 ? reg62 : wire56)))});
              reg69 <= $signed(reg59[(4'he):(3'h5)]);
              reg70 <= (^~reg41[(4'he):(4'h8)]);
            end
          else
            begin
              reg66 <= {(8'had)};
              reg67 <= reg67;
              reg68 <= ((reg51[(2'h3):(2'h2)] ?
                      ((-$unsigned((8'ha1))) ?
                          $unsigned({reg31}) : ($signed(reg44) ?
                              $unsigned((8'hb5)) : $signed(wire27))) : ((reg44 >> (reg68 ?
                              wire26 : (8'hae))) ?
                          reg39[(3'h4):(2'h2)] : (^$signed(reg40)))) ?
                  ((+$signed(((8'ha4) ?
                      reg31 : reg47))) | reg37[(2'h2):(1'h0)]) : ($unsigned({(-reg67)}) >= reg36));
            end
        end
      else
        begin
          reg66 <= reg31;
          reg67 <= ($signed((-(8'ha9))) ? {reg32} : (^~{(|(reg70 <= reg63))}));
        end
      if ({({(reg47 ? $unsigned((8'hae)) : (wire54 ? reg40 : reg38)),
              $signed($unsigned(reg49))} != $unsigned({reg68, wire28}))})
        begin
          if (reg58[(4'h8):(4'h8)])
            begin
              reg71 <= (^~$signed(reg43));
              reg72 <= reg58[(3'h4):(2'h2)];
              reg73 <= reg31[(4'h9):(4'h8)];
              reg74 <= wire56[(3'h4):(2'h3)];
            end
          else
            begin
              reg71 <= $signed($unsigned(reg62));
              reg72 <= $unsigned($signed((+($unsigned(reg60) <= $signed(reg69)))));
              reg73 <= (((^$unsigned((reg73 ? reg39 : wire27))) ?
                  (reg50[(4'hb):(4'h9)] >>> (reg71 ?
                      reg36[(1'h0):(1'h0)] : (reg73 - reg70))) : wire29) > reg49[(4'h8):(3'h7)]);
              reg74 <= (~|(reg52[(4'hd):(4'ha)] && $unsigned({(reg38 << (8'hb5)),
                  $unsigned(reg64)})));
              reg75 <= ((8'had) ^ $signed((^~reg40[(3'h7):(3'h5)])));
            end
          reg76 <= reg38[(3'h6):(2'h3)];
          reg77 <= reg72;
          reg78 <= $signed(wire30[(1'h1):(1'h0)]);
        end
      else
        begin
          reg71 <= {$signed($signed((8'hbe)))};
          reg72 <= (^(((reg77 ?
                  reg41[(4'ha):(3'h5)] : reg31) < (reg62[(4'h8):(3'h6)] ?
                  (reg43 != reg69) : $signed(reg32))) ?
              ($signed({reg38,
                  reg73}) != wire57[(3'h7):(3'h4)]) : ($unsigned($unsigned(wire54)) ?
                  {(wire54 ?
                          (8'ha7) : reg78)} : $unsigned(reg73[(1'h1):(1'h1)]))));
          reg73 <= reg40;
        end
      reg79 <= (!(reg38[(2'h3):(2'h2)] ?
          ((reg38[(2'h2):(1'h1)] ?
                  $unsigned((8'ha0)) : (wire30 ? reg35 : reg68)) ?
              $signed((reg77 * reg50)) : $signed((~reg49))) : (8'ha6)));
      reg80 <= $unsigned(($signed({$unsigned((8'hb5))}) ?
          ($signed((|reg48)) || reg38) : (8'ha0)));
    end
  assign wire81 = reg43;
  assign wire82 = $unsigned($signed((^~(^~$signed(reg79)))));
  assign wire83 = ($unsigned((reg66 ?
                          reg38[(4'h8):(3'h6)] : reg62[(4'he):(4'h9)])) ?
                      (reg33 ?
                          ((&reg60[(1'h1):(1'h1)]) ?
                              (reg52 ?
                                  (8'hbd) : $signed(wire29)) : {reg49}) : reg66[(2'h3):(2'h3)]) : (~($signed(reg69) ?
                          $unsigned($signed((8'ha0))) : (^(|(8'ha4))))));
  always
    @(posedge clk) begin
      reg84 <= wire56;
      reg85 <= ((8'h9f) || {wire83});
      reg86 <= $unsigned((~&$unsigned((reg66 ? (~reg41) : reg67))));
      reg87 <= wire27;
    end
  assign wire88 = wire81[(1'h0):(1'h0)];
  assign wire89 = $signed($unsigned($signed($signed(((8'hb1) ?
                      reg46 : reg86)))));
  assign wire90 = (((~{(reg73 ? reg39 : reg86)}) >> (^~{(reg35 ?
                              reg75 : (8'ha3))})) ?
                      $unsigned(wire81) : (8'ha0));
  assign wire91 = $signed({(reg71 ?
                          $unsigned(wire90) : $signed((reg33 ?
                              reg42 : reg86)))});
  always
    @(posedge clk) begin
      if ($unsigned((wire81[(3'h6):(2'h2)] ?
          $signed(((wire83 ? (8'had) : reg52) ?
              $unsigned(reg87) : ((8'ha0) ? reg32 : reg41))) : reg76)))
        begin
          if ($signed($signed($unsigned($unsigned((wire55 <<< reg71))))))
            begin
              reg92 <= (~&(reg76 << ((|(~reg49)) && wire91)));
              reg93 <= {$unsigned((^~$signed($unsigned(wire83)))),
                  ($unsigned($unsigned($signed(reg67))) ?
                      (^~reg76[(2'h2):(1'h1)]) : $unsigned($signed($signed(reg48))))};
              reg94 <= $unsigned($unsigned({($unsigned(reg65) ?
                      (|reg53) : {reg76, wire83})}));
              reg95 <= $signed({$unsigned($unsigned(wire83[(2'h3):(2'h3)])),
                  $signed($signed((8'had)))});
            end
          else
            begin
              reg92 <= (8'hb7);
              reg93 <= (({(!((7'h44) ? reg73 : reg59))} + reg35) ?
                  {wire89} : $unsigned($unsigned($signed({wire29}))));
            end
        end
      else
        begin
          reg92 <= (~|reg52[(2'h3):(2'h2)]);
          reg93 <= reg70;
          reg94 <= (reg80 ? $unsigned((|reg35[(4'h9):(3'h7)])) : reg43);
        end
      reg96 <= reg68[(4'hc):(3'h6)];
      reg97 <= (+$signed(reg71[(4'hd):(3'h4)]));
      reg98 <= reg58[(3'h4):(1'h0)];
    end
endmodule
