module top
#(parameter param159 = (~^(((~&((8'hae) ? (8'haa) : (8'hab))) == (8'hb6)) ? (~^{{(8'hac)}}) : ({(&(8'h9e)), (^(8'haa))} ? (((8'hb2) <= (8'h9d)) >>> {(8'hb2), (8'haa)}) : ((~(8'hb1)) ? ((8'hbf) ? (8'hb2) : (8'h9d)) : (^~(8'hab)))))), 
parameter param160 = ((8'ha7) & param159))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire155;
  assign y = {wire158,
                 wire157,
                 wire19,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire152,
                 wire154,
                 wire155,
                 (1'h0)};
  module4 #() modinst20 (.wire8(wire1), .clk(clk), .wire6(wire0), .wire7(wire2), .wire5((8'h9d)), .wire9(wire3), .y(wire19));
  assign wire21 = wire1[(4'ha):(3'h6)];
  assign wire22 = (~^wire1);
  assign wire23 = wire0[(1'h1):(1'h1)];
  assign wire24 = {(wire0 != $unsigned(wire19[(4'h8):(4'h8)]))};
  module25 #() modinst153 (.wire26(wire2), .wire29(wire19), .y(wire152), .wire28(wire22), .clk(clk), .wire27(wire24));
  assign wire154 = (((((~|wire21) ? wire3[(2'h3):(1'h0)] : {(8'haa)}) ?
                           (&(wire21 - wire3)) : $unsigned((^~(8'hab)))) ?
                       (-(^~$signed(wire19))) : wire152[(3'h6):(2'h3)]) ^~ (wire2[(5'h12):(1'h0)] ?
                       ($unsigned($signed(wire22)) ?
                           $signed($unsigned(wire23)) : (((8'ha0) ?
                                   wire3 : wire2) ?
                               (wire21 & wire21) : {(8'hb2),
                                   (8'ha1)})) : wire2));
  module109 #() modinst156 (wire155, clk, wire22, wire21, wire19, wire1, wire152);
  assign wire157 = {$unsigned((+$signed(wire23[(4'hf):(1'h1)]))),
                       ((+$unsigned(((8'h9c) ? wire1 : wire152))) ?
                           ($unsigned(wire1) ?
                               ({(8'ha7),
                                   wire21} | $signed(wire19)) : wire152) : $signed($signed($unsigned(wire24))))};
  assign wire158 = (((((~|(8'hb0)) >> (wire154 + wire2)) ?
                           wire154[(3'h5):(2'h2)] : (((7'h44) ?
                                   (7'h40) : (8'hb0)) ?
                               (wire22 ^ wire154) : (^wire22))) ?
                       ((&(-wire155)) ?
                           $signed($unsigned(wire0)) : wire155[(1'h1):(1'h0)]) : $signed((~wire152))) >>> (~|wire155));
endmodule

module module25
#(parameter param150 = (8'ha6), 
parameter param151 = param150)
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire146;
  assign y = {wire149,
                 wire148,
                 wire106,
                 wire55,
                 wire30,
                 wire53,
                 wire108,
                 wire146,
                 (1'h0)};
  assign wire30 = (8'haa);
  module31 #() modinst54 (wire53, clk, wire30, wire27, wire28, wire26, wire29);
  assign wire55 = $signed($signed(wire26[(3'h6):(3'h5)]));
  module56 #() modinst107 (.wire57(wire29), .y(wire106), .clk(clk), .wire60(wire26), .wire61(wire28), .wire59(wire53), .wire58(wire27));
  assign wire108 = {{$unsigned((wire26[(4'h8):(3'h5)] >> (wire53 ?
                               wire29 : wire55)))},
                       $signed($unsigned($unsigned((&wire53))))};
  module109 #() modinst147 (.y(wire146), .wire110(wire26), .clk(clk), .wire114(wire30), .wire113(wire29), .wire112(wire53), .wire111(wire55));
  assign wire148 = wire55;
  assign wire149 = $unsigned($unsigned(((~&{wire148,
                       (8'h9f)}) > $signed($unsigned(wire106)))));
endmodule

module module4
#(parameter param18 = (~|(((((8'ha0) ? (8'had) : (8'ha7)) ? ((7'h42) ? (8'hac) : (8'h9c)) : ((8'hb3) ? (8'hb9) : (8'hbc))) ? ((+(8'h9f)) ? ((7'h40) ? (8'ha0) : (8'ha5)) : (~&(8'hb8))) : (&((8'ha6) ? (8'ha8) : (8'ha8)))) ? (^((~^(8'hb9)) ? ((8'ha7) <<< (8'hac)) : ((8'h9c) ^ (8'h9e)))) : {({(8'ha9), (8'had)} || (~|(8'ha9))), (((8'h9f) && (8'ha9)) ? ((8'hb7) ? (8'hba) : (8'ha7)) : ((8'ha4) ~^ (8'h9c)))})))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  input wire signed [(2'h3):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire10 = $signed($unsigned($unsigned($unsigned((~wire6)))));
  assign wire11 = (($unsigned(((-wire5) ~^ {wire8})) | $unsigned(((wire6 ?
                          wire9 : (8'ha5)) ~^ $unsigned(wire7)))) ?
                      (wire7[(2'h2):(1'h0)] <= (((8'hb6) ~^ wire5[(1'h0):(1'h0)]) ?
                          $unsigned(((8'hac) ?
                              wire9 : (8'hbe))) : ($signed(wire5) ?
                              (|wire9) : $unsigned(wire8)))) : wire6);
  assign wire12 = $unsigned($unsigned(wire10[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      reg13 <= ((($signed((|wire5)) >>> ((wire11 + wire8) ^~ $signed(wire10))) >> $unsigned((wire9 || $signed(wire8)))) >> $unsigned((+{(8'hb6)})));
      if ({(-wire12[(3'h4):(1'h0)]),
          (wire6[(1'h0):(1'h0)] & $unsigned(((wire8 ?
              (8'hbe) : wire11) || ((7'h44) ^~ (8'hac)))))})
        begin
          reg14 <= wire11;
          reg15 <= $signed($signed(reg14[(4'hb):(3'h4)]));
        end
      else
        begin
          reg14 <= reg13;
          reg15 <= $signed((wire9 ? $signed(wire7[(1'h0):(1'h0)]) : (8'haf)));
        end
      reg16 <= (reg14 <<< (($unsigned((reg15 ? wire9 : wire12)) ?
          (wire5 | (~wire6)) : $signed($unsigned(reg15))) + (((~^wire10) ?
              (wire6 ^~ reg13) : (!wire8)) ?
          ((reg14 ? wire5 : reg13) ?
              (wire12 << (7'h44)) : (reg14 | wire12)) : {wire8,
              reg14[(2'h2):(2'h2)]})));
      reg17 <= (~wire10[(4'h9):(3'h5)]);
    end
endmodule

module module109
#(parameter param145 = ({(8'hb8)} ? (8'hb1) : ((~((^~(8'ha3)) ^ {(8'hbd), (8'hbc)})) >> (|(&((8'hb9) ? (7'h43) : (8'hb4)))))))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire114;
  input wire signed [(3'h5):(1'h0)] wire113;
  input wire [(2'h3):(1'h0)] wire112;
  input wire [(3'h5):(1'h0)] wire111;
  input wire signed [(4'hd):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire118;
  wire [(5'h10):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire115;
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg119 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
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
                 (1'h0)};
  assign wire115 = {((($signed(wire111) <= $signed(wire111)) > $unsigned(((8'hb0) || wire112))) != ((wire110[(4'h8):(1'h0)] ?
                               $signed(wire111) : wire113[(1'h0):(1'h0)]) ?
                           wire111[(2'h2):(2'h2)] : wire110)),
                       (8'had)};
  assign wire116 = $unsigned((|(~|(7'h42))));
  assign wire117 = {(wire112 < (({wire115, wire115} != {(8'haa),
                           wire110}) ^ $signed((!wire113)))),
                       ($signed(wire111[(2'h2):(1'h1)]) ?
                           ((!wire116[(3'h5):(3'h4)]) >>> {$signed((8'ha6))}) : ({(wire113 ?
                                       wire115 : wire115),
                                   $signed(wire110)} ?
                               (((8'hbd) || wire111) ?
                                   wire113 : (~&(8'hb9))) : wire111[(3'h5):(2'h3)]))};
  assign wire118 = wire111;
  always
    @(posedge clk) begin
      reg119 <= ((!{$signed((&wire115))}) ?
          {wire112[(2'h3):(2'h2)]} : (^($unsigned(wire117[(1'h1):(1'h1)]) == $unsigned(((8'hb0) > (8'h9c))))));
      reg120 <= (-((wire116 ?
              (wire115[(3'h7):(1'h0)] == {wire113,
                  wire117}) : $unsigned($signed(wire114))) ?
          reg119 : (wire115 + (~^(~|(8'hac))))));
      reg121 <= ($unsigned((((8'hab) & (&wire117)) ^~ {{wire115}})) >= wire115);
      if ($unsigned(((~$unsigned((reg119 >= wire111))) && {wire117,
          (~|wire117)})))
        begin
          reg122 <= (~|(reg119[(3'h6):(2'h2)] ?
              (!{{wire112, wire114}}) : (wire112[(2'h2):(2'h2)] ?
                  (wire113[(3'h4):(2'h2)] ^~ ((8'h9d) ~^ wire114)) : (!$unsigned(wire116)))));
          if ((&wire114[(3'h4):(2'h2)]))
            begin
              reg123 <= ((8'ha6) >>> ($signed(($signed(wire111) ?
                      wire110[(4'ha):(1'h1)] : reg119)) ?
                  ($signed((~wire114)) ?
                      ((~^reg121) ?
                          $unsigned(wire118) : $signed(wire118)) : ((8'ha2) == $unsigned(wire114))) : (+$signed((^~(8'hb4))))));
            end
          else
            begin
              reg123 <= (~^$unsigned(reg123));
              reg124 <= wire113[(1'h0):(1'h0)];
            end
          reg125 <= $signed(wire113);
        end
      else
        begin
          if (((($signed((reg121 ? (8'hac) : wire112)) ?
                  ($signed(wire113) ?
                      (reg124 + wire112) : (~|(8'hbf))) : wire112[(1'h1):(1'h0)]) == ({wire116[(3'h5):(2'h3)],
                  (reg122 << wire118)} <= ($unsigned((8'hb1)) ?
                  wire114 : $unsigned((8'hbc))))) ?
              (~&$signed((-{wire116, reg121}))) : (8'hbe)))
            begin
              reg122 <= $signed(wire118[(2'h2):(2'h2)]);
              reg123 <= (|reg122);
            end
          else
            begin
              reg122 <= $signed($signed(reg124));
            end
          reg124 <= (-$signed((wire113[(1'h0):(1'h0)] ^~ (8'ha5))));
        end
      if ((^~reg119))
        begin
          reg126 <= $signed($unsigned(((((8'hbc) ? reg125 : (8'ha3)) ?
                  wire110[(4'h9):(3'h4)] : (reg124 ? wire112 : wire110)) ?
              $signed($signed((8'ha9))) : reg119[(2'h2):(1'h1)])));
          reg127 <= (-(-wire116[(3'h7):(3'h4)]));
          reg128 <= (reg123 & ($signed(($unsigned(reg121) ?
                  ((8'hb0) != reg125) : $signed(wire116))) ?
              (((wire111 ? (8'ha3) : reg123) ?
                      (reg127 + reg126) : (reg125 == reg123)) ?
                  reg119 : (^reg122[(2'h2):(1'h0)])) : reg121));
        end
      else
        begin
          reg126 <= wire118;
        end
    end
  assign wire129 = ($unsigned(($unsigned($unsigned(wire114)) <= $unsigned(reg126[(4'h9):(1'h0)]))) >>> (!reg125));
  assign wire130 = reg121;
  assign wire131 = ($signed(wire117) ^ ((^~(+$unsigned(wire130))) ?
                       (8'hac) : (wire130[(1'h1):(1'h0)] >> (^wire113[(1'h0):(1'h0)]))));
  assign wire132 = ($signed((reg127[(5'h10):(3'h5)] ?
                           wire131 : $unsigned(reg122[(3'h6):(1'h0)]))) ?
                       wire131[(4'h9):(3'h5)] : (((wire116 | {wire117}) == ((+reg121) ?
                               $signed(wire113) : (~(8'haa)))) ?
                           (reg126 ?
                               (reg123 + reg125) : (!wire111[(1'h0):(1'h0)])) : $unsigned({(wire114 != wire112)})));
  always
    @(posedge clk) begin
      reg133 <= $signed($signed(wire114));
      if ($signed(wire112[(1'h0):(1'h0)]))
        begin
          reg134 <= (reg127 ?
              {(&$signed(reg123))} : {(~reg127[(5'h12):(4'hf)])});
          reg135 <= $unsigned($unsigned($signed($unsigned((~|reg125)))));
          reg136 <= (!reg121[(2'h3):(2'h2)]);
          reg137 <= ($unsigned((((reg135 ?
                  (8'hbe) : wire117) - reg136) & (-(wire112 == (8'hbb))))) ?
              reg128[(3'h5):(3'h4)] : reg122[(2'h3):(1'h0)]);
          reg138 <= ($signed((-reg133[(4'he):(3'h7)])) ?
              $signed(($unsigned((reg125 ?
                  reg128 : reg124)) - ($unsigned(wire111) & $unsigned(reg128)))) : (|(reg126 ?
                  $signed((reg124 ? (8'hb6) : (7'h43))) : (~^(!reg122)))));
        end
      else
        begin
          reg134 <= $unsigned((wire118 >> reg138));
          reg135 <= {(~(($unsigned((8'hb1)) - $signed(reg134)) + ({wire114,
                  wire118} <<< wire114[(2'h2):(2'h2)])))};
          reg136 <= reg137[(2'h3):(2'h3)];
          reg137 <= wire132;
        end
    end
  assign wire139 = $signed({({reg136} != $signed((wire129 ?
                           wire129 : wire116))),
                       reg136});
  assign wire140 = wire131;
  assign wire141 = $unsigned(reg127[(4'h9):(1'h0)]);
  assign wire142 = wire118;
  assign wire143 = (|(^~((-(^~reg128)) ?
                       ({reg138} == {(8'ha0),
                           reg128}) : $signed($unsigned(wire129)))));
  assign wire144 = (~&(8'hb6));
endmodule

module module56
#(parameter param105 = (({(((8'hbd) ? (8'ha5) : (8'hbd)) ? (!(8'hb0)) : ((8'hba) != (8'hb7))), {((8'h9e) ^~ (7'h44))}} ? ((((8'ha5) >= (8'hb9)) - ((8'h9e) && (8'h9c))) ? (|(~&(8'ha8))) : ((^~(7'h44)) + (!(8'hb4)))) : (((+(8'had)) ? ((8'hb2) & (8'hb5)) : ((8'ha2) > (8'ha5))) ? ({(8'ha1), (7'h44)} ? ((8'hae) ? (8'hab) : (8'hae)) : ((8'ha7) ? (8'hb4) : (8'ha4))) : ({(8'ha2)} ? ((8'ha5) ? (8'hbf) : (8'ha0)) : ((8'hbf) ? (7'h41) : (8'hb7))))) ? (8'ha7) : (((+(+(8'h9f))) ? ((!(8'hba)) <<< (&(8'hb8))) : (8'hb1)) ^~ (~&(&((7'h43) ? (8'hb6) : (8'haf)))))))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire61;
  input wire [(4'hd):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire signed [(3'h7):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(4'hc):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg96,
                 reg95,
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
                 (1'h0)};
  assign wire62 = $signed((wire61[(2'h2):(2'h2)] * (8'hb7)));
  assign wire63 = (wire61[(1'h1):(1'h1)] + wire61);
  assign wire64 = (((~^((wire63 ? wire61 : wire60) ?
                      $signed(wire61) : (wire63 & (8'ha7)))) != $unsigned(((&wire63) ?
                      (wire63 & wire57) : (wire62 ?
                          (8'h9d) : wire60)))) == $unsigned(((~{wire63}) ^~ {$unsigned(wire61)})));
  assign wire65 = (+(^(~|$signed((wire60 ? wire59 : (7'h40))))));
  always
    @(posedge clk) begin
      if ((wire60 <= wire57))
        begin
          if ({(wire57[(4'h8):(3'h7)] <= (8'hb7)),
              {wire59[(3'h7):(3'h7)], $unsigned(wire62[(2'h3):(2'h3)])}})
            begin
              reg66 <= $unsigned((^(wire57 < wire62[(3'h4):(1'h1)])));
              reg67 <= (~wire65);
              reg68 <= ((wire62[(3'h4):(2'h2)] ^~ ((^(wire65 > wire65)) ?
                      ((reg66 ? wire61 : wire61) ?
                          (wire58 ?
                              wire59 : wire58) : {(8'hbb)}) : $signed((wire65 ^~ (8'hb3))))) ?
                  wire58[(1'h0):(1'h0)] : $signed($signed($signed((~wire65)))));
              reg69 <= $signed(($unsigned(wire61) & $signed($unsigned({reg66,
                  wire60}))));
              reg70 <= (reg68 >>> wire61[(1'h1):(1'h0)]);
            end
          else
            begin
              reg66 <= ((^wire59) ?
                  reg66[(3'h4):(1'h1)] : $signed(($signed(((8'hae) ?
                      wire65 : reg68)) <<< $unsigned({reg70}))));
              reg67 <= wire62[(1'h1):(1'h1)];
              reg68 <= (wire60 ^ ($unsigned(((^wire61) ?
                      reg70 : $unsigned(wire62))) ?
                  $unsigned((^~reg67[(2'h2):(1'h1)])) : $unsigned((((8'hbd) ~^ wire59) ~^ $unsigned((8'ha1))))));
              reg69 <= $unsigned(wire65[(1'h0):(1'h0)]);
            end
          reg71 <= (($unsigned(wire58) <<< $unsigned((~(wire58 >> (8'ha4))))) ~^ (-$signed((wire59[(4'h8):(1'h0)] ?
              $signed((8'ha0)) : $signed((7'h44))))));
          reg72 <= $unsigned((($unsigned((~^(8'hbd))) && $unsigned($unsigned(wire59))) ?
              wire65 : ((8'h9c) <= wire63)));
          reg73 <= $signed((~|reg70));
        end
      else
        begin
          reg66 <= wire57[(1'h0):(1'h0)];
        end
      reg74 <= $unsigned((((8'ha3) <<< ({wire60} ?
              reg71[(3'h7):(3'h6)] : $unsigned(wire59))) ?
          (8'ha1) : $unsigned(wire59[(4'he):(4'hd)])));
      reg75 <= $unsigned(wire60);
      reg76 <= {{$signed($unsigned((^wire62)))}, (|reg69[(3'h7):(3'h7)])};
      reg77 <= (8'ha0);
    end
  assign wire78 = $signed(wire62);
  assign wire79 = wire78[(1'h1):(1'h0)];
  assign wire80 = reg70[(3'h4):(1'h1)];
  assign wire81 = ({wire79, $signed((~reg75))} ?
                      (reg70[(3'h5):(3'h5)] < wire61) : wire60);
  assign wire82 = (8'hbf);
  assign wire83 = {{{((wire81 ? wire63 : wire61) && {(7'h40), wire63}),
                              ($signed(wire82) <= (~&reg70))},
                          wire82[(3'h5):(2'h2)]}};
  always
    @(posedge clk) begin
      if ($unsigned(reg69))
        begin
          reg84 <= ((^reg69[(4'hf):(4'ha)]) | (($signed((|(8'ha0))) + reg77[(2'h3):(2'h2)]) == wire63));
        end
      else
        begin
          if ({reg84, wire83[(2'h2):(2'h2)]})
            begin
              reg84 <= wire63[(4'hb):(1'h0)];
              reg85 <= reg67[(3'h4):(3'h4)];
            end
          else
            begin
              reg84 <= reg74[(4'hb):(1'h0)];
              reg85 <= ((reg75[(2'h2):(1'h0)] ?
                  ((^(~reg66)) ?
                      reg77 : ($unsigned(wire78) ~^ (~^reg85))) : (reg72[(2'h2):(2'h2)] ?
                      $signed((^wire80)) : wire82[(4'ha):(3'h6)])) > $signed(((reg68 >>> reg73) & {(reg66 <<< wire58),
                  (wire57 ? (8'hbd) : reg77)})));
            end
          if ((|$signed(({reg67, $signed((8'h9e))} ~^ reg74))))
            begin
              reg86 <= wire57[(4'h8):(2'h3)];
              reg87 <= (^({($unsigned((8'haf)) ^~ (wire78 ? wire79 : wire57)),
                  reg67[(2'h2):(2'h2)]} && (wire78[(1'h0):(1'h0)] * (reg71[(1'h0):(1'h0)] ?
                  reg69 : (wire63 ? (8'hbe) : reg70)))));
            end
          else
            begin
              reg86 <= $unsigned($signed((~$unsigned(wire58[(3'h6):(3'h5)]))));
              reg87 <= (8'hb4);
              reg88 <= $signed(wire63[(1'h0):(1'h0)]);
              reg89 <= $unsigned({wire80});
              reg90 <= $signed($signed((({(8'hb0),
                  wire63} <<< (!wire63)) ^ (reg86 ?
                  {(8'ha5), reg89} : $signed((8'ha0))))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg91 <= $signed((~$unsigned(((8'h9e) ?
          wire79[(3'h4):(3'h4)] : (wire65 <= wire78)))));
      if (wire62)
        begin
          reg92 <= (-({(!$unsigned(wire61))} || $signed(wire81[(4'hb):(2'h2)])));
          reg93 <= ((reg85 < (~^$signed((wire82 ? wire62 : (8'hb0))))) ?
              reg77[(3'h6):(2'h2)] : {reg74[(3'h4):(2'h2)]});
          if ((8'hb9))
            begin
              reg94 <= wire64;
              reg95 <= (($unsigned({$signed(wire81)}) << ($signed($unsigned(reg93)) <= reg86[(1'h0):(1'h0)])) > {wire58[(2'h3):(2'h2)],
                  $unsigned(wire78[(1'h0):(1'h0)])});
              reg96 <= reg85[(1'h0):(1'h0)];
            end
          else
            begin
              reg94 <= $signed($unsigned((($signed(wire58) ?
                  reg91[(2'h3):(2'h3)] : $signed(reg77)) * reg96[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg92 <= $unsigned(((wire60 ?
              $signed((reg72 + (8'h9e))) : wire62) + ($unsigned((!reg84)) > reg70)));
          reg93 <= (reg70[(3'h6):(3'h6)] ?
              (&(|$unsigned($signed(reg89)))) : reg72[(4'h8):(3'h4)]);
          reg94 <= ((8'hb1) ?
              $signed({(~&(wire83 >>> reg71)),
                  $unsigned((^wire59))}) : $unsigned($signed(wire78[(2'h2):(2'h2)])));
        end
    end
  assign wire97 = $signed($unsigned(({{wire79, wire79},
                      $signed(reg91)} ^~ $signed({(8'hb4)}))));
  assign wire98 = (~|$signed($unsigned(($signed(reg70) ?
                      (-wire82) : (+reg88)))));
  assign wire99 = (($signed({(reg95 != reg71)}) ^ {((wire82 <<< (8'hae)) ~^ (wire59 > (8'hb0))),
                          (~(reg70 || (8'hb9)))}) ?
                      reg74[(4'hd):(3'h4)] : (^wire62[(2'h2):(1'h0)]));
  assign wire100 = {$signed($unsigned({reg84})),
                       $signed($unsigned($unsigned((wire63 != wire62))))};
  assign wire101 = (wire83[(2'h3):(1'h1)] ?
                       (((|$unsigned(reg77)) ?
                               ({reg94, (8'hbd)} ?
                                   wire60 : $signed(reg91)) : (^reg89[(4'hb):(3'h7)])) ?
                           {reg73[(4'he):(4'hb)]} : $signed((wire65 ?
                               (!reg86) : (reg75 - (8'hbc))))) : wire65[(2'h3):(1'h1)]);
  assign wire102 = $signed(wire80);
  assign wire103 = ((reg93 ?
                           ($signed((reg89 > wire61)) ^~ $unsigned($unsigned(reg86))) : ((^(reg70 ?
                                   (8'hb3) : wire80)) ?
                               $unsigned(((8'ha7) ?
                                   wire80 : wire98)) : $unsigned(((8'ha1) <<< reg69)))) ?
                       (($signed($unsigned((8'ha6))) ?
                               ($signed(wire83) ?
                                   (reg87 ?
                                       reg69 : reg91) : $signed((8'ha0))) : (8'hb0)) ?
                           (~&$signed((wire98 - reg69))) : $signed((|$signed(wire63)))) : $unsigned(reg67));
  assign wire104 = $signed($unsigned(reg91[(1'h0):(1'h0)]));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  input wire [(4'he):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire33;
  input wire [(5'h13):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire37 = $unsigned($unsigned($signed(((^~wire35) >>> $unsigned(wire36)))));
  assign wire38 = $unsigned(wire33[(2'h2):(2'h2)]);
  assign wire39 = wire32;
  assign wire40 = $signed($signed(wire34));
  assign wire41 = (-((($signed(wire35) ?
                          wire35[(2'h3):(2'h2)] : $signed(wire36)) ?
                      $signed(wire33[(3'h5):(1'h1)]) : $signed(wire32[(3'h4):(2'h2)])) ^~ (((wire39 ?
                          wire37 : wire36) ~^ $signed(wire38)) ?
                      wire40[(3'h5):(3'h5)] : ((wire34 >>> wire37) ?
                          {wire37, wire37} : $unsigned(wire34)))));
  always
    @(posedge clk) begin
      reg42 <= (((((wire35 ? (8'h9e) : wire38) ? (&wire34) : $signed(wire33)) ?
          $unsigned(wire37) : $unsigned((wire40 ?
              wire41 : wire39))) ^~ wire32) ^~ $signed((wire40[(4'h8):(1'h0)] >>> $signed(wire37))));
      reg43 <= ((8'ha3) >= $signed((wire32[(2'h3):(2'h2)] ?
          {wire36[(4'h9):(1'h1)]} : $unsigned((wire33 >> (8'haa))))));
      reg44 <= ((&$signed($signed((^wire32)))) - wire33[(3'h4):(3'h4)]);
    end
  assign wire45 = $signed($unsigned(($signed((-wire32)) ~^ (^~wire40))));
  assign wire46 = wire35;
  assign wire47 = ({wire38} ?
                      $unsigned({(wire32 ~^ reg43[(2'h3):(2'h3)])}) : (^$signed((^wire34[(4'hc):(1'h1)]))));
  assign wire48 = (7'h44);
  assign wire49 = wire32[(3'h5):(3'h5)];
  assign wire50 = (($signed(wire47[(3'h6):(1'h1)]) ?
                          reg43[(3'h7):(2'h2)] : $signed($unsigned(wire45))) ?
                      $unsigned(wire36) : reg44);
  assign wire51 = $unsigned($unsigned((-wire47[(4'hf):(3'h4)])));
  assign wire52 = (^(wire33 != ($signed($signed(reg43)) >= wire47[(4'ha):(3'h4)])));
endmodule
