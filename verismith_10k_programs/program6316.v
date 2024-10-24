module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire170;
  wire [(5'h11):(1'h0)] wire169;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire167;
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  assign y = {wire170,
                 wire169,
                 wire5,
                 wire27,
                 wire29,
                 wire167,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire5 = {(|$signed(wire3[(1'h1):(1'h0)])),
                     $signed((wire0 <= ($unsigned((8'hbb)) - (-wire1))))};
  always
    @(posedge clk) begin
      if ((~^wire3[(1'h1):(1'h1)]))
        begin
          reg6 <= wire1[(4'ha):(2'h2)];
          reg7 <= (|wire5);
          reg8 <= wire4;
          reg9 <= $unsigned($signed(($unsigned((reg6 ^ wire3)) >= ({wire2} | (wire1 >= wire1)))));
        end
      else
        begin
          reg6 <= $unsigned((+reg8));
        end
      reg10 <= wire2[(4'h8):(1'h1)];
      reg11 <= (wire4 << (((reg9[(2'h2):(1'h1)] ? (+wire0) : reg10) >= ((wire2 ?
                  reg10 : wire3) ?
              (reg9 ? reg10 : reg7) : ((8'ha9) ? wire5 : reg8))) ?
          reg7 : $signed($unsigned($signed(wire1)))));
      reg12 <= {(~$signed(((~^wire3) || ((8'hba) ? (8'ha8) : wire4))))};
    end
  module13 #() modinst28 (.wire17(reg10), .y(wire27), .clk(clk), .wire14(wire5), .wire16(wire4), .wire15(reg9));
  assign wire29 = (^~((!((reg11 >= reg12) ?
                          (reg12 ? wire4 : reg7) : $unsigned((8'hae)))) ?
                      $signed($unsigned($signed(wire4))) : wire3));
  module30 #() modinst168 (wire167, clk, wire27, wire29, reg7, wire2);
  assign wire169 = $unsigned(reg12);
  assign wire170 = ($unsigned(wire5) ?
                       (wire4[(4'h8):(3'h7)] != $unsigned($unsigned((~|reg9)))) : $signed((reg10 ?
                           wire169[(3'h7):(2'h3)] : $signed(wire5))));
endmodule

module module30
#(parameter param165 = (((({(8'ha9)} ^~ ((8'ha2) ? (8'hb3) : (8'hbe))) ? {{(8'hbc)}, ((7'h41) - (8'ha7))} : {(~|(8'ha6)), ((8'ha1) ? (8'hae) : (8'hb3))}) ~^ ((|(-(8'h9f))) ? (!(&(7'h44))) : (((8'hb1) ? (8'haa) : (8'hac)) ^ (^~(8'hbe))))) | ((+(((8'ha9) * (8'hac)) ? (8'h9c) : (^~(8'hb6)))) ? ({(~&(8'hb8))} ? (((8'hb8) >>> (8'hb2)) ? (^~(8'hb6)) : (~(8'hae))) : ((^~(8'hbe)) ? ((8'ha1) ? (8'hbe) : (8'h9c)) : {(8'hb4), (8'ha7)})) : ((((8'hae) < (8'hb1)) && ((8'ha2) ? (8'ha8) : (7'h41))) ? (((7'h44) ~^ (8'ha8)) ? (^~(8'ha5)) : ((8'hba) ? (8'hb9) : (8'hb1))) : (((8'hbb) > (8'hac)) || ((8'ha8) ? (8'haf) : (8'ha2)))))), 
parameter param166 = (param165 ? (~^param165) : (8'h9e)))
(y, clk, wire31, wire32, wire33, wire34);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire31;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(3'h4):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire122;
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire164,
                 wire162,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire107,
                 wire84,
                 wire83,
                 wire39,
                 wire81,
                 wire109,
                 wire110,
                 wire122,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg35 <= (~|(~|wire31[(1'h0):(1'h0)]));
      reg36 <= {wire33[(3'h5):(2'h2)], $unsigned((^~wire34))};
      if ($signed($signed($signed(reg36))))
        begin
          reg37 <= ((($signed((|wire31)) - reg36) ?
              ($signed($unsigned(reg36)) || wire31[(1'h1):(1'h1)]) : $unsigned($signed(reg35[(2'h2):(1'h0)]))) ^~ $signed((((wire31 ?
                  (8'hb4) : wire31) ~^ (wire34 ? wire34 : (8'ha7))) ?
              (!(wire33 - wire33)) : wire34[(2'h2):(2'h2)])));
        end
      else
        begin
          reg37 <= $signed({$unsigned($unsigned((wire32 ? wire32 : wire31))),
              $signed((reg36[(1'h0):(1'h0)] & $signed(wire33)))});
        end
      reg38 <= reg35[(2'h2):(2'h2)];
    end
  assign wire39 = wire31;
  module40 #() modinst82 (.wire44(wire34), .wire42(wire31), .y(wire81), .wire41(wire33), .wire43(reg37), .clk(clk));
  assign wire83 = reg35;
  assign wire84 = $signed((~&wire39));
  module85 #() modinst108 (wire107, clk, wire33, reg38, wire31, wire81, reg37);
  assign wire109 = $signed($unsigned((~^$unsigned($signed(wire31)))));
  assign wire110 = $unsigned($unsigned(wire34[(2'h3):(1'h0)]));
  module111 #() modinst123 (.wire115(reg35), .clk(clk), .wire112(wire31), .y(wire122), .wire114(wire109), .wire116(wire84), .wire113(reg36));
  assign wire124 = reg38;
  assign wire125 = $unsigned((8'hbe));
  assign wire126 = ((!(~|{{wire33}, $signed(reg37)})) <= (({reg37, wire39} ?
                           (!{wire84}) : ({wire32,
                               wire109} == $signed(wire110))) ?
                       {wire83[(2'h2):(1'h1)]} : (((reg38 ? wire32 : wire39) ?
                           (8'ha4) : $signed(reg37)) | $signed(((8'hba) ?
                           wire107 : reg36)))));
  assign wire127 = (^(~$signed(wire122[(3'h5):(2'h3)])));
  module128 #() modinst163 (.y(wire162), .wire130(wire81), .wire129(wire126), .wire132(reg35), .clk(clk), .wire133(wire84), .wire131(wire32));
  assign wire164 = wire110;
endmodule

module module13
#(parameter param25 = (8'hae), 
parameter param26 = (param25 ? (param25 ? ((^~{param25}) <= ((~param25) ? (^~param25) : (-param25))) : ({(param25 ? param25 : param25), ((8'had) ^~ (8'hb6))} | param25)) : param25))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  assign y = {wire24, wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = (~(wire17 != ((&wire14) + $unsigned(((8'ha6) ?
                      wire16 : wire15)))));
  assign wire19 = (wire15[(2'h2):(1'h1)] ?
                      (wire14[(3'h7):(3'h4)] ?
                          $unsigned(((wire17 ?
                              (8'h9d) : wire17) | $unsigned(wire14))) : $unsigned(wire17)) : (wire17 * $unsigned((7'h44))));
  assign wire20 = (-$unsigned(((~^wire18) ?
                      wire17[(3'h7):(3'h7)] : $signed(wire19[(2'h2):(1'h1)]))));
  assign wire21 = ($signed(wire15) ?
                      $signed(($signed(((8'ha4) <= (8'ha4))) <<< $unsigned((8'hb7)))) : $unsigned((($unsigned(wire16) ?
                              (wire15 ? wire17 : (8'hba)) : wire18) ?
                          $signed($unsigned(wire18)) : wire15[(2'h3):(2'h2)])));
  assign wire22 = wire17;
  assign wire23 = (~&{$signed($unsigned({wire15})),
                      $signed({$signed(wire17), wire15})});
  assign wire24 = (^wire16[(1'h1):(1'h0)]);
endmodule

module module128
#(parameter param160 = {((((^~(8'hbb)) ? ((8'ha9) >>> (8'had)) : (-(8'hbd))) ~^ (~^{(8'hb9)})) || ({((8'hbf) ? (8'hba) : (8'h9f))} || {((8'ha1) || (8'had)), ((8'hb6) == (8'hb5))}))}, 
parameter param161 = ((&((param160 ? param160 : (param160 & param160)) >>> (8'h9d))) > ((((param160 < (8'hac)) ? {param160, param160} : param160) || (~(|(8'ha6)))) < param160)))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire133;
  input wire [(4'hc):(1'h0)] wire132;
  input wire [(5'h14):(1'h0)] wire131;
  input wire [(4'hb):(1'h0)] wire130;
  input wire signed [(5'h10):(1'h0)] wire129;
  wire signed [(4'he):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire signed [(5'h14):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(3'h7):(1'h0)] wire142;
  wire signed [(2'h2):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire134;
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire153,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire135,
                 wire134,
                 reg156,
                 reg155,
                 reg154,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg137,
                 (1'h0)};
  assign wire134 = (wire132 <<< $unsigned(wire129[(5'h10):(4'hc)]));
  assign wire135 = ($signed(wire129) ?
                       (+({(wire131 ? wire129 : wire129),
                           (wire132 ?
                               wire132 : wire133)} ^ (+(^~wire132)))) : (((wire134 ?
                           $unsigned(wire133) : wire131[(5'h11):(2'h3)]) ~^ (((8'hbb) ?
                               wire131 : wire129) ?
                           wire133 : (~|wire131))) >= wire133[(3'h6):(1'h1)]));
  assign wire136 = $signed(wire131);
  always
    @(posedge clk) begin
      reg137 <= wire129;
    end
  assign wire138 = (^~(($signed($signed((8'hbe))) ?
                           ((|wire133) ?
                               $signed(wire135) : ((8'hb0) ?
                                   wire131 : (8'hbf))) : $unsigned($unsigned(wire131))) ?
                       wire133[(5'h12):(2'h3)] : $signed($signed((wire131 ?
                           reg137 : (8'hbb))))));
  assign wire139 = wire132[(1'h1):(1'h1)];
  assign wire140 = $unsigned($signed(((~^$unsigned(wire132)) ?
                       (!$signed(wire133)) : (~^(wire129 ?
                           wire133 : wire131)))));
  assign wire141 = ($signed($signed(wire140)) ?
                       reg137[(5'h14):(5'h11)] : reg137);
  assign wire142 = (~|$signed(wire134));
  assign wire143 = {$signed($unsigned(reg137))};
  always
    @(posedge clk) begin
      reg144 <= (($signed(wire135) && $unsigned($unsigned($signed(reg137)))) < (|$signed($signed(((8'hb8) ?
          (8'hab) : wire143)))));
      if ({(^(-$unsigned((wire132 >> (8'ha8))))), $signed(wire136)})
        begin
          reg145 <= $signed((8'h9c));
          reg146 <= ($signed((~|(~&wire129))) ?
              (!($signed({reg145}) ?
                  {{wire135, wire141},
                      (wire139 >>> wire138)} : $signed($signed(wire133)))) : (8'hb5));
          reg147 <= $unsigned(wire138[(4'hc):(3'h4)]);
          reg148 <= $signed(($unsigned(((!wire141) && $unsigned(wire141))) ?
              ($unsigned((wire134 ?
                  wire141 : wire129)) >> (~^(wire130 << (8'h9f)))) : ((^~wire130) ?
                  (&(wire129 & wire134)) : (-$signed(wire139)))));
          if ($signed(((+{wire136}) ?
              reg147 : ($signed({wire142, wire134}) ?
                  reg147[(2'h2):(1'h0)] : (wire142[(3'h4):(2'h2)] ?
                      $unsigned(wire136) : $unsigned(wire131))))))
            begin
              reg149 <= $unsigned($unsigned((!$unsigned(((8'ha9) ^~ reg148)))));
              reg150 <= $signed($signed((~^{(^wire136)})));
            end
          else
            begin
              reg149 <= (^$unsigned((($signed(wire143) <= reg149) ?
                  reg144[(1'h0):(1'h0)] : (8'ha5))));
            end
        end
      else
        begin
          reg145 <= reg149;
          reg146 <= ((8'ha2) ?
              $unsigned((($unsigned(wire143) ^ wire138[(4'hb):(1'h0)]) != ((reg137 ^~ reg145) >> (wire141 == wire134)))) : (7'h40));
        end
      reg151 <= wire138[(4'hb):(3'h4)];
      reg152 <= ((+(wire142[(1'h0):(1'h0)] ?
          (wire131[(3'h4):(2'h3)] ?
              (reg144 ?
                  wire141 : (8'hba)) : (reg144 >> reg146)) : reg137[(1'h1):(1'h0)])) < reg146[(1'h1):(1'h0)]);
    end
  assign wire153 = wire141[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg154 <= ($signed((^$signed((reg150 ?
          wire132 : reg147)))) >>> $signed({(&{reg144}), wire143}));
    end
  always
    @(posedge clk) begin
      reg155 <= wire131[(5'h13):(5'h13)];
      reg156 <= $signed((~|wire136));
    end
  assign wire157 = (~&((-(reg154 || $signed(reg145))) ?
                       $unsigned((&(~&reg147))) : $unsigned($unsigned($signed(wire139)))));
  assign wire158 = $signed(wire135);
  assign wire159 = ($signed({(reg144[(2'h3):(1'h0)] << (wire131 * wire141))}) + reg147[(1'h0):(1'h0)]);
endmodule

module module111
#(parameter param121 = {(((((7'h43) ? (8'hb0) : (8'hb2)) >= {(8'hb7), (8'ha5)}) ? {((8'haa) ? (8'hb2) : (8'hb5))} : (|((8'ha9) ? (8'h9d) : (8'hb2)))) ^ ((^((8'hac) ? (8'ha2) : (8'ha1))) << (^~(-(8'hb8)))))})
(y, clk, wire116, wire115, wire114, wire113, wire112);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire116;
  input wire [(3'h6):(1'h0)] wire115;
  input wire signed [(3'h4):(1'h0)] wire114;
  input wire signed [(2'h3):(1'h0)] wire113;
  input wire signed [(2'h3):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  assign y = {wire120, wire119, wire118, wire117, (1'h0)};
  assign wire117 = wire115;
  assign wire118 = (wire112 > {wire114});
  assign wire119 = wire118[(1'h1):(1'h0)];
  assign wire120 = wire115[(2'h2):(2'h2)];
endmodule

module module85
#(parameter param106 = ((+({((7'h41) <<< (8'ha7))} & (^~{(8'haf)}))) <<< ((8'hb9) >= (^(~{(8'haf)})))))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire [(4'h9):(1'h0)] wire89;
  input wire signed [(4'hd):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  input wire signed [(2'h2):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg97,
                 (1'h0)};
  assign wire91 = (((8'ha0) ? (8'ha6) : $signed(wire87)) ?
                      $unsigned((wire89[(4'h9):(3'h6)] != wire86[(1'h0):(1'h0)])) : ((!$signed(wire87)) ^~ $unsigned(((wire89 ?
                          wire89 : wire87) << (wire90 ? wire86 : wire86)))));
  assign wire92 = wire89;
  assign wire93 = ({({wire92[(2'h2):(1'h1)], $unsigned(wire86)} ?
                          wire89 : (wire88 & $signed(wire92))),
                      (+$signed($signed((8'ha8))))} + wire88);
  assign wire94 = wire86[(1'h0):(1'h0)];
  assign wire95 = ($unsigned(wire94) & $unsigned({$signed(wire89)}));
  assign wire96 = ({(wire86 ?
                              $signed((~(8'hbb))) : ((wire92 | wire86) ?
                                  (wire94 * wire93) : ((8'ha4) ?
                                      wire95 : wire88)))} ?
                      $unsigned($unsigned({$unsigned(wire95)})) : $unsigned($unsigned((~$unsigned(wire92)))));
  always
    @(posedge clk) begin
      reg97 <= wire91[(3'h4):(3'h4)];
    end
  assign wire98 = {($unsigned((8'hac)) <<< wire96[(3'h4):(1'h0)])};
  assign wire99 = wire90;
  assign wire100 = wire96[(3'h6):(1'h0)];
  assign wire101 = $unsigned({wire94});
  assign wire102 = (^$unsigned((wire86 - wire98[(2'h3):(1'h1)])));
  assign wire103 = wire93;
  assign wire104 = $signed($signed(wire95[(4'hf):(4'ha)]));
  assign wire105 = $unsigned($unsigned(((wire96 ?
                           (wire102 ? wire104 : (8'haf)) : (8'ha7)) ?
                       wire101[(5'h10):(4'he)] : wire93[(3'h5):(3'h4)])));
endmodule

module module40
#(parameter param79 = ((((-((8'ha0) < (8'hb3))) ? (!{(7'h40), (8'ha8)}) : {{(8'hbd), (8'hb2)}}) <<< ({((7'h41) < (7'h41))} != {{(8'ha7)}})) && (^~{{(&(8'hb1)), (-(8'hba))}, (((8'hb8) ? (8'hb4) : (8'h9d)) <= {(8'hae), (8'ha7)})})), 
parameter param80 = param79)
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire44;
  input wire [(4'h9):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire45;
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire56,
                 wire52,
                 wire51,
                 wire49,
                 wire45,
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
                 reg57,
                 reg55,
                 reg54,
                 reg53,
                 reg50,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  assign wire45 = ($signed($unsigned((((8'hbc) ? wire43 : wire42) ?
                          wire43[(3'h7):(1'h0)] : wire43[(3'h6):(3'h6)]))) ?
                      $signed((~|wire43[(4'h8):(4'h8)])) : wire41[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      reg46 <= wire45[(2'h3):(2'h3)];
      reg47 <= $unsigned(wire42);
      reg48 <= wire42;
    end
  assign wire49 = (($unsigned(((wire43 ? reg48 : (8'ha7)) > $signed(wire41))) ?
                      {(^~wire44)} : (~((^~wire43) ?
                          (wire45 >= wire43) : reg48[(3'h5):(3'h5)]))) & ($unsigned($signed(wire41[(3'h5):(3'h4)])) && ((-{(8'hbd),
                          reg46}) ?
                      {(8'hbd), $unsigned(wire41)} : {(-(8'hbe)),
                          $unsigned(reg48)})));
  always
    @(posedge clk) begin
      reg50 <= wire42[(4'hc):(3'h7)];
    end
  assign wire51 = (&$signed(($unsigned(wire45) | (^~(8'hbc)))));
  assign wire52 = (reg48 != (^~(wire45 ^~ $signed((~wire44)))));
  always
    @(posedge clk) begin
      reg53 <= (|wire42);
      reg54 <= wire44[(2'h2):(1'h1)];
      if (((reg48[(4'h9):(3'h7)] ?
              {wire52,
                  $signed((reg47 ? wire52 : wire42))} : (wire49[(4'h9):(3'h5)] ?
                  {reg54} : (^~$signed(wire51)))) ?
          reg48[(4'h9):(4'h8)] : {(&(reg48 ?
                  (wire52 ? (7'h44) : reg48) : (wire52 || wire49)))}))
        begin
          reg55 <= {wire51[(3'h4):(2'h2)], reg54[(2'h3):(1'h1)]};
        end
      else
        begin
          reg55 <= reg46[(2'h2):(1'h1)];
        end
    end
  assign wire56 = reg48[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg57 <= $unsigned((wire51 ?
          {(^~$signed((8'hab))),
              (reg46 >= $unsigned(wire52))} : ((wire49[(3'h4):(2'h2)] ?
              wire56 : (&wire43)) * wire49[(2'h2):(2'h2)])));
      reg58 <= reg54[(4'hc):(3'h5)];
      reg59 <= wire41;
      if ((({{(reg57 ? wire43 : reg47)}} ?
              $signed((^~reg50[(3'h6):(1'h1)])) : (reg47 > $unsigned((reg59 * wire41)))) ?
          ($signed({(wire43 ? reg50 : wire41), reg58}) ?
              reg48 : ({(reg46 ?
                      reg58 : (8'hbe))} < ($signed(reg47) + $signed(reg54)))) : (8'ha6)))
        begin
          reg60 <= wire52;
          if ($unsigned($unsigned(((reg46 == (&reg53)) <<< $unsigned((7'h41))))))
            begin
              reg61 <= $signed($unsigned((^~{(reg50 ? wire56 : wire42)})));
              reg62 <= (((wire43 ?
                      ($signed((8'had)) ^~ (reg60 - wire49)) : $signed(reg58[(3'h6):(1'h0)])) ?
                  {(8'hbf)} : reg57) >> reg53[(3'h4):(3'h4)]);
              reg63 <= reg53;
              reg64 <= $signed((((-reg50) ?
                      reg61[(1'h0):(1'h0)] : ((reg48 ^ wire52) ?
                          (reg55 * wire49) : wire56[(4'hb):(3'h5)])) ?
                  $signed($signed((reg50 * reg57))) : $signed((&wire43[(2'h2):(1'h1)]))));
              reg65 <= $signed($signed(reg64[(4'h9):(3'h6)]));
            end
          else
            begin
              reg61 <= {($unsigned((~^((8'ha1) > wire43))) ?
                      ((|(8'hac)) >>> (7'h42)) : (reg58 >> ((reg57 >= reg54) ?
                          (+(8'hb4)) : (reg62 ? reg47 : wire44)))),
                  reg48[(3'h4):(2'h3)]};
              reg62 <= reg64;
              reg63 <= (|((reg47[(3'h5):(2'h3)] ?
                  (^wire56) : reg55) >= $unsigned({(reg53 >>> wire42)})));
              reg64 <= ((~&$signed(($unsigned(reg58) ?
                  ((8'haf) && reg64) : {wire41}))) < ($signed(((reg59 ?
                          reg60 : reg64) ?
                      wire56[(1'h0):(1'h0)] : (8'ha1))) ?
                  $signed(reg64[(4'hb):(4'h8)]) : (reg61[(1'h0):(1'h0)] - {$unsigned(reg60)})));
            end
          reg66 <= $unsigned(($unsigned((+reg53[(3'h4):(1'h0)])) ?
              $signed(reg48) : $unsigned(($unsigned((8'hb7)) * $unsigned(reg58)))));
          reg67 <= {(8'hac)};
          if ($signed((~&({(reg54 | reg65)} ?
              reg63 : ($signed(wire42) ? (~|wire52) : wire44)))))
            begin
              reg68 <= {reg67[(3'h6):(2'h2)]};
              reg69 <= reg64[(4'hc):(1'h1)];
              reg70 <= $signed($signed((wire45[(3'h5):(1'h0)] ?
                  ((reg68 >= wire51) ?
                      reg55[(1'h0):(1'h0)] : (wire42 ?
                          wire52 : wire56)) : ((&reg46) ?
                      {wire52} : (reg62 - (8'hba))))));
            end
          else
            begin
              reg68 <= $unsigned($unsigned((reg67 ?
                  ((reg66 ~^ reg60) + $unsigned(reg58)) : (~&$signed(wire41)))));
              reg69 <= ($unsigned($signed($signed((reg58 ?
                  reg69 : wire42)))) << ($signed(reg50[(5'h13):(2'h3)]) ?
                  (8'hb1) : $unsigned(reg57)));
              reg70 <= $signed($unsigned($signed(wire52)));
            end
        end
      else
        begin
          reg60 <= ($unsigned(reg66) ?
              $unsigned($signed((((8'hb5) ?
                  reg62 : reg57) + reg67[(4'h8):(1'h0)]))) : reg53);
        end
      if ((+((((^wire45) * (~reg48)) << (~|reg62)) ?
          (^~(reg64 ? reg46[(4'h9):(4'h9)] : (~|reg62))) : (~&((reg55 ?
                  reg46 : reg60) ?
              $unsigned(reg55) : $signed(reg63))))))
        begin
          reg71 <= wire45;
          reg72 <= $unsigned(reg53[(1'h0):(1'h0)]);
          reg73 <= (~^reg64);
          reg74 <= $signed(($unsigned(((wire49 ? wire42 : (8'ha0)) ?
                  $signed(wire42) : wire41[(2'h2):(1'h1)])) ?
              (($signed(wire51) ^ {reg68}) & wire43[(1'h1):(1'h0)]) : (reg73 << {reg55[(2'h2):(2'h2)]})));
        end
      else
        begin
          reg71 <= $signed(((!reg62) != $signed((~|(!reg60)))));
          reg72 <= ($unsigned(wire42[(3'h6):(2'h2)]) | (!reg74));
          reg73 <= reg74[(1'h0):(1'h0)];
          reg74 <= $signed($signed(((~&(reg66 + (8'ha5))) * $signed($signed(reg55)))));
        end
    end
  assign wire75 = ($signed($unsigned($signed(((8'hb9) ?
                      reg67 : (8'hb8))))) >= reg68[(3'h7):(3'h4)]);
  assign wire76 = {{reg55},
                      ($signed((&{wire45})) < (($signed(wire56) ?
                          (8'hae) : {reg63, wire51}) | reg50[(5'h12):(4'h8)]))};
  assign wire77 = reg48;
  assign wire78 = wire45;
endmodule
