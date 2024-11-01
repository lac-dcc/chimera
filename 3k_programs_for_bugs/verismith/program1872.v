module top
#(parameter param168 = ((^(|{((8'hae) >= (8'hbf))})) ? ({((8'hb8) && ((7'h40) ? (8'ha4) : (8'hbe))), ({(8'hb4)} ~^ ((8'ha0) <= (7'h44)))} ~^ (8'hb5)) : ((&((~^(8'hbb)) ? ((8'ha0) ? (8'hae) : (8'hbe)) : (&(8'h9c)))) & {((~^(8'haa)) ? (~^(8'ha1)) : ((8'ha7) ? (7'h44) : (8'ha2)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire143;
  wire [(3'h7):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(3'h5):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire153;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(5'h10):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire165;
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  assign y = {wire167,
                 wire121,
                 wire123,
                 wire136,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire144,
                 wire145,
                 wire146,
                 wire151,
                 wire152,
                 wire153,
                 wire154,
                 wire164,
                 wire165,
                 reg124,
                 reg138,
                 reg139,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 (1'h0)};
  module4 #() modinst122 (wire121, clk, wire0, wire3, wire2, wire1);
  assign wire123 = (7'h42);
  always
    @(posedge clk) begin
      reg124 <= {{$signed($unsigned((wire2 ? wire1 : wire123)))}};
    end
  module125 #() modinst137 (wire136, clk, wire3, wire2, wire1, wire0);
  always
    @(posedge clk) begin
      if ($unsigned(reg124))
        begin
          reg138 <= $unsigned(wire121[(4'ha):(3'h7)]);
        end
      else
        begin
          reg138 <= wire121[(4'h9):(2'h2)];
          reg139 <= wire136;
        end
    end
  assign wire140 = ({$signed((7'h42)),
                       $signed(((-reg138) ?
                           $signed((8'ha4)) : reg139))} * wire2[(5'h10):(2'h2)]);
  assign wire141 = $signed(wire3);
  assign wire142 = ($signed(reg139) & (~&(({wire121, reg139} ?
                           wire0[(4'hb):(4'ha)] : (|wire121)) ?
                       ((&(8'hae)) ?
                           wire141[(4'h8):(1'h0)] : (~^(8'hb0))) : ($unsigned(wire1) ?
                           {wire0} : reg138[(4'h8):(2'h2)]))));
  assign wire143 = $unsigned({($signed({(8'hbb)}) ?
                           $unsigned(wire3) : (!wire123))});
  assign wire144 = wire136;
  assign wire145 = $unsigned($signed({{(wire123 - reg138)}}));
  assign wire146 = $signed($signed((wire141 ?
                       {(wire123 < wire3),
                           (wire2 ?
                               (8'ha8) : wire123)} : $unsigned(wire0[(4'ha):(4'h9)]))));
  always
    @(posedge clk) begin
      reg147 <= $signed($signed(((&$signed(wire144)) - (^~wire145))));
      reg148 <= ($unsigned(((8'hbc) + wire144)) ?
          $unsigned((((reg147 ?
              wire142 : (8'hb7)) != (+(8'hbd))) + ($signed(wire123) ?
              (~^wire142) : (!wire146)))) : $unsigned(wire144[(2'h3):(1'h0)]));
      reg149 <= ((8'hb5) ?
          (~^$unsigned($unsigned(wire146[(4'ha):(3'h4)]))) : (reg148[(5'h12):(3'h7)] ?
              $signed(wire145) : $unsigned($unsigned($unsigned(wire3)))));
      reg150 <= $signed(((reg138[(4'hb):(2'h2)] >>> $signed($unsigned(reg147))) << (~^((wire141 ?
          wire1 : wire143) * (^~(8'haf))))));
    end
  assign wire151 = (~|((wire141[(4'h8):(4'h8)] & $signed({reg150, (8'ha9)})) ?
                       wire3 : reg147[(1'h0):(1'h0)]));
  assign wire152 = wire0;
  assign wire153 = $unsigned($signed(reg149[(5'h12):(2'h3)]));
  assign wire154 = {$signed(wire152), reg147[(4'hb):(4'h9)]};
  always
    @(posedge clk) begin
      reg155 <= wire142[(3'h5):(1'h0)];
      if (($unsigned($unsigned(((wire136 ? wire140 : wire143) ?
          wire1 : wire141))) & wire123))
        begin
          reg156 <= $unsigned($unsigned((-(~|wire153[(1'h0):(1'h0)]))));
          reg157 <= reg155[(5'h12):(1'h0)];
          reg158 <= $unsigned(reg150);
          reg159 <= wire144[(2'h3):(2'h3)];
          reg160 <= (wire123[(3'h5):(1'h1)] ^ ($signed(($signed(wire121) & reg149)) ?
              (wire136[(4'h9):(3'h4)] ^ wire123) : $signed(($unsigned((8'haa)) || (reg159 & wire145)))));
        end
      else
        begin
          if (reg149)
            begin
              reg156 <= reg156[(5'h12):(3'h7)];
              reg157 <= $signed(((~^$unsigned((!(7'h43)))) << (~(wire146 ?
                  $unsigned(wire142) : wire121))));
              reg158 <= (~wire140);
              reg159 <= (~&(($unsigned($unsigned((8'haf))) >> $signed((~reg138))) | ((^~(wire144 ^ reg155)) ?
                  wire2[(4'he):(4'hb)] : $signed($unsigned(reg156)))));
              reg160 <= wire1;
            end
          else
            begin
              reg156 <= ($unsigned((~&(reg148 ?
                  reg158[(2'h2):(1'h0)] : $unsigned(wire143)))) < ($signed(((wire123 ?
                  wire144 : wire152) && (~&reg150))) >> reg159[(4'h8):(3'h7)]));
              reg157 <= $signed(reg147[(4'h9):(3'h6)]);
              reg158 <= reg124;
              reg159 <= ({$unsigned($unsigned((reg138 ? wire144 : wire143))),
                  (((+reg138) ?
                      wire152[(3'h5):(3'h5)] : (wire142 + reg158)) >= reg147[(3'h4):(1'h0)])} != $unsigned((|wire136[(3'h5):(1'h0)])));
              reg160 <= reg149[(4'hf):(2'h2)];
            end
          reg161 <= ((|reg155[(3'h4):(1'h1)]) ?
              $signed(((wire141[(4'h9):(3'h6)] ?
                  (8'hba) : ((8'hb0) - wire1)) ~^ ((^wire0) | (~&wire142)))) : {reg156[(3'h6):(2'h3)]});
          reg162 <= (~&$signed(((wire145[(3'h4):(3'h4)] * (^wire154)) ?
              ((wire151 ^~ (8'ha7)) ?
                  (8'h9e) : $unsigned(reg150)) : $unsigned((reg150 ?
                  wire152 : (8'hb2))))));
        end
      reg163 <= (((-wire146) ? reg157 : reg158[(4'hb):(4'ha)]) ?
          wire146 : {($signed($signed((8'haf))) & ($signed(reg161) ?
                  (^(8'h9e)) : (wire144 ? reg124 : (8'ha3))))});
    end
  assign wire164 = reg159[(4'ha):(1'h1)];
  module4 #() modinst166 (.wire7(reg162), .wire6(wire136), .clk(clk), .y(wire165), .wire5(wire141), .wire8(wire3));
  assign wire167 = ((8'ha4) <= wire141[(4'hd):(4'hb)]);
endmodule

module module125  (y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire129;
  input wire signed [(3'h6):(1'h0)] wire128;
  input wire [(3'h6):(1'h0)] wire127;
  input wire [(3'h7):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire134;
  wire [(3'h5):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  assign y = {wire135, wire134, wire133, wire132, wire131, wire130, (1'h0)};
  assign wire130 = (wire127[(2'h2):(1'h1)] ? wire128 : wire126);
  assign wire131 = (wire129[(1'h0):(1'h0)] ^~ {wire130[(3'h4):(2'h2)]});
  assign wire132 = (($unsigned(wire131[(2'h2):(1'h0)]) ? (8'h9d) : (8'hb6)) ?
                       wire130[(4'h9):(3'h6)] : {wire130[(1'h0):(1'h0)],
                           $signed(wire128)});
  assign wire133 = (^(!(wire131 ?
                       ((wire127 | wire128) * (^~wire130)) : wire131)));
  assign wire134 = wire126;
  assign wire135 = wire128;
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire84;
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  assign y = {wire117,
                 wire115,
                 wire32,
                 wire16,
                 wire10,
                 wire9,
                 wire34,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire84,
                 reg120,
                 reg119,
                 reg118,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg35,
                 reg36,
                 reg44,
                 (1'h0)};
  assign wire9 = (!($signed((wire7 && (~wire5))) == $signed((-wire8[(3'h6):(1'h1)]))));
  assign wire10 = {$unsigned($signed(wire9[(3'h4):(3'h4)]))};
  always
    @(posedge clk) begin
      reg11 <= $unsigned(wire10);
      reg12 <= $signed((wire9 ? wire7 : wire6[(4'h8):(4'h8)]));
      reg13 <= (~^{($signed(wire9[(1'h0):(1'h0)]) > reg11)});
      reg14 <= (+wire6);
      reg15 <= (~^(~&wire7[(2'h2):(2'h2)]));
    end
  assign wire16 = wire8;
  module17 #() modinst33 (.y(wire32), .wire22(reg14), .wire19(reg15), .wire21(wire16), .wire20(wire9), .wire18(wire6), .clk(clk));
  assign wire34 = wire10;
  always
    @(posedge clk) begin
      reg35 <= $unsigned(((^{{wire16, wire9},
          $unsigned(wire5)}) > wire32[(2'h2):(1'h1)]));
      reg36 <= (((wire8 ?
          wire9 : (wire16[(1'h1):(1'h1)] ?
              $signed(reg14) : reg12[(1'h0):(1'h0)])) ^~ {((!reg11) ?
              reg12 : (wire10 ? wire9 : reg14))}) >>> wire9[(2'h2):(2'h2)]);
    end
  assign wire37 = (^~((((!reg12) ? ((8'h9e) >> (8'hb6)) : (~&reg15)) ?
                          $unsigned($unsigned(reg15)) : wire6) ?
                      $unsigned((((8'hb3) <<< (8'hba)) > (wire8 == (8'ha1)))) : reg14[(1'h1):(1'h0)]));
  assign wire38 = ($unsigned((($unsigned(wire6) ?
                              (^~(8'ha1)) : wire8[(4'h9):(4'h9)]) ?
                          ({wire32,
                              wire10} >> (wire9 < wire9)) : $signed(wire34))) ?
                      ($signed(((reg15 <= wire7) <= ((8'haa) ~^ wire32))) ?
                          ((~{wire10, wire8}) ?
                              wire6 : $unsigned((wire37 ^ reg35))) : wire6[(4'hb):(2'h2)]) : (~^(^wire8[(3'h5):(1'h0)])));
  assign wire39 = {($signed((&$unsigned(wire8))) * wire8),
                      {($signed((-reg13)) & $signed($unsigned((8'ha6))))}};
  assign wire40 = wire7;
  assign wire41 = reg15[(1'h1):(1'h0)];
  assign wire42 = wire6;
  assign wire43 = ($unsigned(wire9) ?
                      ($signed(((reg35 == wire37) != wire42[(1'h0):(1'h0)])) ?
                          $signed(reg36) : ((wire40[(4'ha):(4'ha)] * (reg36 <<< wire9)) >>> wire34)) : wire34[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg44 <= wire8[(3'h5):(3'h4)];
    end
  module45 #() modinst85 (.y(wire84), .clk(clk), .wire49(reg15), .wire47(wire34), .wire48(reg11), .wire46(reg35));
  module86 #() modinst116 (wire115, clk, reg36, reg15, reg12, reg13);
  assign wire117 = reg15[(4'hd):(2'h3)];
  always
    @(posedge clk) begin
      reg118 <= wire6;
      reg119 <= (reg15 ?
          (-$signed((~&$signed(wire8)))) : (^~wire42[(2'h2):(2'h2)]));
      reg120 <= ((wire84 <<< (wire6 || (reg13[(4'h8):(2'h3)] ?
          (reg36 ? (8'ha7) : (8'haf)) : {reg118}))) << reg12);
    end
endmodule

module module86
#(parameter param113 = (8'ha2), 
parameter param114 = (|param113))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire90;
  input wire [(4'he):(1'h0)] wire89;
  input wire signed [(4'he):(1'h0)] wire88;
  input wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire93,
                 wire92,
                 wire91,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire91 = (|(((wire89 > wire89[(4'hd):(4'hc)]) | wire87) >>> wire89[(3'h5):(2'h2)]));
  assign wire92 = ($unsigned($unsigned(wire88[(3'h5):(1'h1)])) ~^ wire90[(1'h1):(1'h0)]);
  assign wire93 = wire88[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg94 <= wire90[(1'h0):(1'h0)];
      reg95 <= $signed(($signed($signed(((8'hb3) - wire92))) ?
          $signed({(~|wire91)}) : ($unsigned(reg94[(3'h5):(1'h0)]) - wire92)));
      reg96 <= wire87;
      if (({wire90[(2'h2):(1'h0)]} ?
          reg96[(3'h4):(2'h2)] : (wire90 < {$unsigned($unsigned(reg96))})))
        begin
          reg97 <= {reg94[(3'h6):(1'h1)]};
          reg98 <= wire91;
        end
      else
        begin
          reg97 <= reg96[(4'hb):(1'h0)];
          reg98 <= $signed($unsigned({wire88[(1'h0):(1'h0)], wire90}));
        end
      if ($signed({((reg95[(3'h7):(3'h6)] + (wire90 ?
              reg97 : wire87)) >>> $unsigned($unsigned(reg96))),
          ((~$signed(wire93)) >= wire89[(1'h1):(1'h0)])}))
        begin
          reg99 <= ((wire88 == $signed(wire91[(3'h7):(2'h3)])) | reg95);
          reg100 <= (reg96[(4'he):(3'h7)] ?
              (|reg98) : ($signed($signed((!wire91))) ?
                  $signed($unsigned((&reg99))) : {{{(8'hbd)},
                          $signed(reg94)}}));
          reg101 <= {((((wire87 > wire88) ?
                  {wire87} : ((8'haa) ? wire90 : wire88)) > {reg99,
                  wire90[(1'h1):(1'h0)]}) >= (^((reg98 | (8'hbe)) ?
                  (~(8'ha7)) : (8'had)))),
              ({(wire93[(3'h5):(3'h5)] ?
                          $unsigned(reg100) : (reg98 ? wire87 : wire91)),
                      {$unsigned(wire91), (reg100 ? reg100 : reg95)}} ?
                  reg97 : $signed(($unsigned(reg100) ?
                      reg95 : $unsigned(reg94))))};
          reg102 <= (~&({wire88[(4'h9):(2'h3)],
              {((8'hba) ? reg97 : wire87),
                  wire88[(2'h2):(2'h2)]}} >>> $signed((reg100[(1'h1):(1'h1)] || (reg98 || wire87)))));
        end
      else
        begin
          reg99 <= $unsigned(reg99[(2'h2):(1'h1)]);
          if ((reg96[(4'h8):(1'h1)] || ($unsigned((~&(+reg94))) != $signed($signed($unsigned(wire88))))))
            begin
              reg100 <= $unsigned($unsigned($signed(wire93[(3'h4):(1'h1)])));
              reg101 <= wire93;
            end
          else
            begin
              reg100 <= wire93[(3'h4):(1'h1)];
              reg101 <= wire93[(1'h1):(1'h0)];
              reg102 <= ((~^((~|reg97[(4'ha):(4'h8)]) && reg95[(1'h1):(1'h1)])) ?
                  $signed((~^(~|reg102[(4'hc):(4'ha)]))) : ($unsigned({$signed(reg97),
                          (-reg102)}) ?
                      (wire87 <= ((reg102 >> (8'hb4)) + (reg98 >> wire93))) : $signed(((reg98 != reg97) ^ ((7'h43) ?
                          reg98 : (8'h9d))))));
            end
          if (wire87)
            begin
              reg103 <= ((~^wire90) ?
                  (reg94[(2'h2):(1'h1)] == reg100) : (~(+(~&(reg95 + reg97)))));
              reg104 <= (+(!wire92[(4'hb):(4'h8)]));
            end
          else
            begin
              reg103 <= (reg101[(1'h1):(1'h0)] < reg102);
              reg104 <= reg99;
            end
          reg105 <= $signed(((~|$unsigned(wire92[(2'h3):(1'h1)])) ?
              $signed($signed((reg103 <= (8'ha8)))) : {(&reg103[(3'h7):(3'h4)]),
                  $unsigned($unsigned(wire92))}));
        end
    end
  assign wire106 = (($signed((+(wire92 ~^ wire88))) ?
                       $unsigned(reg97[(4'ha):(3'h6)]) : $unsigned($unsigned(reg96[(1'h0):(1'h0)]))) != ($signed($signed(reg100)) ?
                       {{(wire88 ? wire91 : reg100)}} : (|({reg101, reg104} ?
                           $signed(wire87) : $signed(reg105)))));
  assign wire107 = $unsigned(wire106);
  assign wire108 = reg104[(3'h5):(2'h2)];
  assign wire109 = (~&($unsigned({reg99[(1'h0):(1'h0)]}) ?
                       {$signed(wire90[(1'h1):(1'h1)]),
                           wire93} : wire106[(2'h3):(2'h3)]));
  assign wire110 = (8'ha1);
  assign wire111 = {$unsigned((reg100[(2'h2):(1'h1)] ?
                           (8'hb8) : ((wire87 ? wire110 : wire88) ?
                               reg105[(2'h2):(1'h0)] : (wire107 | reg99)))),
                       ((&$signed((^~reg94))) == (((reg96 < reg98) ?
                               reg100 : $signed(reg96)) ?
                           $unsigned((reg102 ?
                               wire107 : (8'hb1))) : (wire90[(2'h2):(2'h2)] == (wire108 >> wire106))))};
  assign wire112 = $unsigned(({wire93[(3'h7):(3'h4)],
                       ($unsigned(reg100) & (reg103 ?
                           wire109 : (8'h9e)))} + reg103[(4'h8):(3'h6)]));
endmodule

module module45
#(parameter param82 = {((^~(((8'ha9) < (7'h41)) <<< (+(8'hb1)))) ? (((8'h9f) ? {(8'hb6)} : (7'h43)) && (((8'ha6) ? (7'h43) : (8'ha9)) ? (8'h9e) : {(8'hbb), (8'ha5)})) : (8'hb7)), {(8'hae)}}, 
parameter param83 = ((8'hbe) ? (~|((8'hbc) ? (^(param82 <<< param82)) : (!param82))) : (8'h9d)))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire50 = wire46[(1'h1):(1'h0)];
  assign wire51 = wire48[(1'h0):(1'h0)];
  assign wire52 = wire46[(3'h4):(3'h4)];
  assign wire53 = ({wire50[(4'ha):(1'h1)]} ?
                      ((((+wire51) ?
                              wire50[(4'ha):(2'h3)] : (~wire52)) ^ $signed((wire48 ^ wire52))) ?
                          (^~(8'hb4)) : $unsigned(wire47[(3'h5):(1'h1)])) : $signed(($signed((^~wire48)) ^~ ({wire50} ?
                          (wire46 ? wire48 : (8'hb3)) : (wire48 ?
                              wire50 : wire47)))));
  assign wire54 = $signed($signed((wire52 + wire47[(3'h5):(1'h1)])));
  assign wire55 = $signed({$signed(wire48[(1'h0):(1'h0)])});
  assign wire56 = wire49;
  always
    @(posedge clk) begin
      reg57 <= $unsigned(wire52);
      reg58 <= {wire50};
      reg59 <= (($unsigned(((~&wire47) ? (&(8'haf)) : (+wire52))) ^~ (({wire56,
                  wire47} >= $signed(wire54)) ?
              wire52[(4'h9):(3'h5)] : {$unsigned(wire48),
                  (wire47 ~^ wire46)})) ?
          ($unsigned((^$unsigned((8'ha1)))) ?
              wire46 : $unsigned($signed(wire47[(3'h5):(2'h2)]))) : reg58[(2'h3):(1'h1)]);
    end
  assign wire60 = $signed(({(~&(wire47 * wire48)),
                      $unsigned($unsigned(wire55))} >= wire55));
  assign wire61 = $signed({wire52, reg59[(4'hd):(4'hc)]});
  assign wire62 = (~{wire46, wire47[(3'h4):(2'h2)]});
  assign wire63 = wire53[(3'h5):(3'h5)];
  assign wire64 = (({($signed(reg59) ? reg57 : wire53),
                      wire47[(2'h3):(2'h3)]} <<< $unsigned($unsigned($signed(reg58)))) >>> (~{(((7'h43) ?
                              wire61 : (8'hab)) ?
                          (wire50 ? reg58 : reg57) : (&(8'hb5)))}));
  always
    @(posedge clk) begin
      reg65 <= wire55;
      reg66 <= {wire49};
      if (reg57[(1'h0):(1'h0)])
        begin
          if ({$unsigned((wire55 == $signed((wire54 ^ (8'h9f)))))})
            begin
              reg67 <= (~&reg58[(4'hb):(4'h8)]);
              reg68 <= $signed({($signed(wire51) ^ $unsigned(wire54)),
                  (~$signed($signed(wire52)))});
              reg69 <= reg65;
              reg70 <= $unsigned((wire55[(2'h3):(2'h3)] ?
                  $unsigned($unsigned($signed(wire61))) : (wire53 <= ($signed(wire62) + $signed(wire61)))));
              reg71 <= (reg58 <<< $unsigned(((^$unsigned(wire61)) ?
                  (wire50[(3'h4):(2'h3)] ?
                      reg65 : ((8'ha7) ?
                          reg57 : wire49)) : wire49[(1'h0):(1'h0)])));
            end
          else
            begin
              reg67 <= wire51[(2'h2):(1'h1)];
              reg68 <= $signed(($unsigned(wire48) >>> {(~|reg68[(2'h2):(1'h0)]),
                  ({(8'ha7)} == {wire52})}));
            end
          reg72 <= (8'ha7);
        end
      else
        begin
          reg67 <= ((reg58 > (8'ha8)) ? reg57 : (-reg72[(4'he):(4'hb)]));
          reg68 <= $signed($unsigned((^~($signed(wire49) != wire49))));
          reg69 <= ((wire61 ~^ ($signed({reg70}) ?
              $unsigned((wire62 > wire48)) : ((reg69 + reg58) * reg66[(1'h0):(1'h0)]))) <<< wire55);
          reg70 <= (~^(~$signed(((wire55 ? reg71 : (8'hac)) ?
              $signed(reg68) : wire61))));
        end
      reg73 <= {($unsigned((wire50[(2'h2):(1'h0)] ?
              wire54[(4'he):(3'h6)] : (wire48 ? reg68 : reg66))) & {{{reg58,
                      reg72}},
              ({reg58, reg71} ?
                  $signed((8'hba)) : (wire62 ? (8'hba) : reg69))}),
          $signed((^~$signed($signed((8'hbb)))))};
    end
  assign wire74 = reg72[(4'hf):(3'h4)];
  assign wire75 = (-((((wire74 >= wire53) ? wire54[(4'ha):(2'h2)] : wire47) ?
                      wire63 : $unsigned(reg59[(4'ha):(3'h7)])) >= (8'ha0)));
  assign wire76 = ((^~wire46) < (((~|$signed((8'h9f))) >>> (8'hac)) ?
                      $unsigned(((reg68 - wire56) ?
                          (|reg57) : wire60)) : $signed(reg73)));
  assign wire77 = (~reg59[(2'h3):(2'h3)]);
  assign wire78 = wire53;
  assign wire79 = wire54;
  assign wire80 = wire49;
  assign wire81 = (^~wire75);
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  input wire signed [(2'h2):(1'h0)] wire20;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = ($signed(($signed((wire18 ^ wire20)) <= wire19[(2'h3):(1'h1)])) >>> wire21[(3'h7):(2'h3)]);
  assign wire24 = $unsigned(wire19);
  assign wire25 = wire19;
  assign wire26 = $unsigned(wire25[(2'h3):(2'h3)]);
  assign wire27 = (|($signed(wire22[(1'h0):(1'h0)]) >>> $unsigned(wire19)));
  assign wire28 = {wire24[(4'h8):(2'h2)]};
  assign wire29 = (&wire28[(1'h1):(1'h1)]);
  assign wire30 = (wire18[(3'h4):(1'h0)] ?
                      $unsigned(wire26) : $unsigned(((~&(~wire26)) <= ((wire27 - wire21) >= (wire24 ^ wire18)))));
  assign wire31 = wire26[(4'ha):(2'h3)];
endmodule
