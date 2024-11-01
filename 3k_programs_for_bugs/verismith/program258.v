module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire218;
  wire signed [(5'h10):(1'h0)] wire217;
  wire signed [(4'hb):(1'h0)] wire207;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire205;
  reg [(4'hb):(1'h0)] reg216 = (1'h0);
  reg [(2'h3):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg213 = (1'h0);
  reg [(5'h11):(1'h0)] reg212 = (1'h0);
  reg [(4'ha):(1'h0)] reg211 = (1'h0);
  reg [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(2'h3):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  assign y = {wire218,
                 wire217,
                 wire207,
                 wire5,
                 wire7,
                 wire8,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire18,
                 wire90,
                 wire92,
                 wire93,
                 wire94,
                 wire121,
                 wire123,
                 wire205,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg6,
                 reg9,
                 reg10,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire5 = (~wire3);
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned((~&(8'ha2))));
    end
  assign wire7 = $unsigned(wire0);
  assign wire8 = {($unsigned(wire1) ? (8'haf) : reg6[(4'hb):(2'h2)])};
  always
    @(posedge clk) begin
      reg9 <= (wire1 * (-$signed(wire4[(4'ha):(4'ha)])));
      reg10 <= $signed(wire5[(4'hf):(2'h2)]);
    end
  assign wire11 = $unsigned($signed({$signed((reg6 >= wire4))}));
  assign wire12 = $unsigned({($unsigned(reg6) << (~^(wire4 ^~ wire0))),
                      wire2[(4'h9):(2'h3)]});
  assign wire13 = wire11[(3'h7):(3'h7)];
  assign wire14 = {($unsigned($unsigned($signed(reg6))) << wire3),
                      (~^$unsigned(($signed(reg9) + wire8[(4'h8):(3'h4)])))};
  always
    @(posedge clk) begin
      reg15 <= (wire2[(3'h6):(3'h4)] ? $signed((+wire4)) : (7'h42));
      reg16 <= $unsigned(reg9);
      reg17 <= (((wire12[(2'h2):(1'h1)] ?
          ($signed(wire3) ? (^~(8'hb5)) : reg16) : (8'hb4)) ~^ ((~(wire12 ?
          wire4 : wire3)) <<< reg10)) & (wire0 ?
          $signed((~^(^wire11))) : ((~^{reg15}) ?
              $signed((^~reg9)) : wire3[(4'ha):(4'ha)])));
    end
  assign wire18 = (!reg15[(4'h8):(3'h5)]);
  module19 #() modinst91 (wire90, clk, wire3, reg17, wire14, reg15);
  assign wire92 = (^{$signed(reg16), (|$signed(reg15))});
  assign wire93 = (+(!{(~(wire0 ? wire13 : reg15))}));
  assign wire94 = (wire14[(3'h7):(3'h4)] ?
                      (-{$unsigned(reg16[(2'h3):(2'h3)]),
                          reg9}) : (~&$unsigned((~|(reg6 ^~ reg10)))));
  module95 #() modinst122 (.wire99(wire90), .wire97(reg10), .wire96(wire13), .wire98(reg6), .clk(clk), .y(wire121));
  assign wire123 = wire5[(1'h0):(1'h0)];
  module124 #() modinst206 (wire205, clk, wire12, wire11, reg15, wire121);
  assign wire207 = ((((wire94[(3'h4):(1'h0)] | (~reg17)) ?
                       wire1[(1'h1):(1'h0)] : reg17) & ((^~reg15) ?
                       reg6 : (~(wire7 || wire4)))) * (+wire7[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg208 <= {reg9,
          (wire8[(3'h4):(2'h3)] ?
              reg6[(3'h4):(1'h1)] : ((^(wire4 ?
                  wire207 : reg17)) & {(reg9 >>> reg9)}))};
      if (wire2)
        begin
          reg209 <= (~&($unsigned((^(~(8'hbd)))) ?
              (wire14 >>> {(8'haa)}) : $unsigned((wire0[(4'hc):(3'h4)] + {(8'hb0)}))));
        end
      else
        begin
          if ((~|$signed($signed(wire0))))
            begin
              reg209 <= $signed(wire14);
              reg210 <= (8'hbe);
              reg211 <= (reg9 && $signed($signed(((wire18 ? wire5 : reg10) ?
                  $signed(wire7) : reg9))));
              reg212 <= wire13;
              reg213 <= wire123;
            end
          else
            begin
              reg209 <= ((!(($signed(wire3) || wire11) ?
                      $unsigned($unsigned((8'hb2))) : wire8[(3'h4):(3'h4)])) ?
                  ((~|(wire92[(2'h2):(1'h0)] & (reg9 >= (8'h9e)))) << (~|($signed(reg210) ?
                      (wire7 <<< reg211) : {wire5}))) : reg211[(2'h3):(1'h0)]);
            end
          reg214 <= (~|(wire18 ?
              (-$signed($signed(wire1))) : $unsigned(($signed(wire3) < (wire93 ?
                  wire205 : wire3)))));
        end
      reg215 <= reg212;
      reg216 <= $signed($unsigned(wire2[(4'h8):(3'h7)]));
    end
  assign wire217 = $signed($signed($unsigned({wire93, (wire92 & wire2)})));
  assign wire218 = reg15;
endmodule

module module124
#(parameter param203 = (((((&(8'ha0)) ^~ ((8'hb8) ? (8'h9e) : (7'h41))) ? {{(8'ha9), (7'h41)}, ((8'hbe) ? (8'hab) : (8'h9e))} : (8'hb3)) ^~ (|(&((8'h9d) && (8'ha0))))) != (&(~&(~^(^(8'hab)))))), 
parameter param204 = {param203, ((((&(8'hbe)) <<< param203) ? ({param203} ? (param203 ? param203 : param203) : {param203, param203}) : (~^(param203 << (8'haa)))) ? ((param203 ^ (param203 + param203)) ? ((param203 ? param203 : param203) || (param203 ^~ param203)) : ((param203 <= param203) ? (~&param203) : (^~param203))) : (param203 ? param203 : ((param203 >>> (8'hb1)) ? (param203 * param203) : param203)))})
(y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire128;
  input wire [(4'h8):(1'h0)] wire127;
  input wire signed [(3'h5):(1'h0)] wire126;
  input wire [(4'hd):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire202;
  wire signed [(4'he):(1'h0)] wire201;
  wire signed [(2'h2):(1'h0)] wire200;
  wire [(5'h15):(1'h0)] wire189;
  wire signed [(4'hb):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  reg [(4'hc):(1'h0)] reg199 = (1'h0);
  reg [(5'h15):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg signed [(4'he):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire189,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 (1'h0)};
  assign wire129 = (8'h9e);
  assign wire130 = ($signed({wire125}) ^ (wire125[(4'h9):(3'h7)] <<< (8'hbf)));
  assign wire131 = $unsigned((~(~&wire130)));
  assign wire132 = ((~&($signed((~&wire128)) ?
                           (wire129 <<< (wire127 ?
                               wire130 : (8'hab))) : (+(wire125 | wire130)))) ?
                       {(wire128 ^~ $unsigned({wire130, wire128})),
                           (8'hb6)} : $signed(($unsigned($unsigned(wire127)) ?
                           (7'h44) : $unsigned($unsigned(wire128)))));
  assign wire133 = (~^((|($signed(wire126) ^~ $signed(wire126))) != (wire130[(3'h6):(2'h2)] ?
                       $signed(wire129[(1'h0):(1'h0)]) : $signed(wire126[(3'h5):(3'h5)]))));
  module134 #() modinst190 (.wire138(wire128), .wire136(wire127), .wire137(wire133), .clk(clk), .y(wire189), .wire135(wire125));
  always
    @(posedge clk) begin
      reg191 <= $signed(wire132[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg192 <= wire129[(1'h1):(1'h0)];
      reg193 <= {$signed($unsigned(wire128[(1'h1):(1'h0)])),
          $signed((!$unsigned((8'ha3))))};
      if ({({wire132[(2'h2):(1'h0)],
              (wire132 ?
                  (8'ha4) : $unsigned(wire128))} && wire128[(5'h14):(3'h4)]),
          (reg193 ? wire133 : (&($signed((8'hbc)) > (~&reg192))))})
        begin
          reg194 <= (-(^~reg193[(5'h12):(2'h3)]));
          reg195 <= (({{$unsigned(wire127)},
              $unsigned($signed(wire126))} < (&(^wire125[(3'h4):(3'h4)]))) > (^($signed((reg191 ?
              wire133 : reg193)) ^~ (|wire133[(4'h9):(4'h8)]))));
          reg196 <= ($unsigned(wire133[(4'h9):(1'h0)]) ?
              wire131[(2'h2):(1'h0)] : $unsigned($signed(($signed(wire127) ?
                  $signed(reg194) : ((8'ha5) ^ wire131)))));
        end
      else
        begin
          if (((wire127[(4'h8):(3'h6)] ?
                  $signed($unsigned((~&wire128))) : {((wire132 ?
                              wire128 : (8'ha2)) ?
                          {reg194} : $unsigned(wire130))}) ?
              wire129[(3'h5):(1'h1)] : $unsigned((^wire131[(1'h1):(1'h0)]))))
            begin
              reg194 <= ((^~(wire130 ?
                  $unsigned($signed(wire189)) : wire132)) > $unsigned((~$unsigned((!wire125)))));
              reg195 <= {{(wire128[(2'h3):(1'h0)] + wire132[(2'h2):(1'h0)])}};
              reg196 <= $signed(({(-wire132)} ?
                  $unsigned(({(8'hbe)} ?
                      $unsigned(wire130) : $unsigned(wire133))) : ($signed(wire128[(5'h10):(3'h5)]) ^~ ({wire125,
                      wire128} <= reg195))));
              reg197 <= (reg191[(1'h1):(1'h0)] > $signed($unsigned({reg192[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg194 <= ((+wire126[(3'h4):(2'h3)]) & $signed($signed(wire131)));
              reg195 <= $unsigned((($signed($signed(wire131)) ?
                      (wire125 ?
                          (wire132 != wire126) : (-reg191)) : ($unsigned(wire128) ?
                          $unsigned(reg194) : (wire130 >> reg194))) ?
                  ($unsigned((8'hb2)) ?
                      wire126 : reg192) : $signed((|$unsigned(wire125)))));
              reg196 <= reg196[(2'h2):(1'h0)];
              reg197 <= $unsigned(wire129);
            end
        end
      reg198 <= ((~^($unsigned($unsigned(reg193)) ?
          reg196 : {(wire132 > (8'ha2)),
              $signed(wire127)})) * $unsigned((wire127 >>> (8'h9e))));
      reg199 <= wire128;
    end
  assign wire200 = wire127[(4'h8):(4'h8)];
  assign wire201 = (&{wire131, (8'ha0)});
  assign wire202 = ($signed(((&$unsigned(wire125)) ?
                           $signed($unsigned(wire131)) : (^~$unsigned(wire128)))) ?
                       reg198[(5'h13):(1'h0)] : $signed(($signed((^wire129)) > $unsigned((+reg191)))));
endmodule

module module95
#(parameter param119 = {(((((8'hb3) - (8'ha3)) || (|(8'ha6))) ? ((!(8'ha9)) ? {(8'ha9)} : ((8'hae) >= (8'haa))) : (((8'h9c) ? (8'hb3) : (8'ha9)) != ((8'hbc) <= (8'hbc)))) ? ((((8'hbe) ? (8'ha6) : (7'h43)) ? (8'hb8) : {(8'hb5)}) <= (-((8'h9e) ? (8'ha8) : (8'ha2)))) : (-(~|((8'ha0) ? (8'ha1) : (8'ha9)))))}, 
parameter param120 = (param119 << (8'h9e)))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire99;
  input wire [(3'h6):(1'h0)] wire98;
  input wire signed [(5'h12):(1'h0)] wire97;
  input wire [(5'h11):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
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
                 (1'h0)};
  assign wire100 = {$unsigned(wire97[(4'h8):(3'h5)])};
  assign wire101 = ($signed(wire100) ? wire96[(1'h0):(1'h0)] : wire100);
  assign wire102 = (~^(&(8'hbc)));
  assign wire103 = (8'ha1);
  always
    @(posedge clk) begin
      reg104 <= wire98;
      reg105 <= (8'haa);
      if ($signed($signed((8'hb0))))
        begin
          reg106 <= wire100[(1'h0):(1'h0)];
          reg107 <= ((wire103[(4'hd):(4'hc)] != $unsigned($signed(wire100))) == wire102[(4'he):(4'h9)]);
          reg108 <= $unsigned((($signed($signed(reg105)) > ($signed(reg105) ?
              ((8'hb2) ? wire99 : wire102) : {wire103,
                  wire98})) & $signed(wire99[(2'h3):(1'h1)])));
          reg109 <= reg108[(1'h0):(1'h0)];
        end
      else
        begin
          if (((~|wire97[(4'hc):(3'h5)]) >>> $unsigned($signed((reg108 ?
              reg106 : $unsigned((8'ha7)))))))
            begin
              reg106 <= {wire101, $unsigned(wire101[(1'h1):(1'h1)])};
              reg107 <= reg104;
              reg108 <= $signed((~^wire96[(5'h11):(2'h2)]));
              reg109 <= reg109[(4'h8):(3'h5)];
              reg110 <= $signed((^~wire100));
            end
          else
            begin
              reg106 <= $signed((!(^$unsigned((~wire103)))));
            end
        end
      reg111 <= reg105;
      reg112 <= $signed(reg111);
    end
  always
    @(posedge clk) begin
      reg113 <= {wire100};
      reg114 <= {wire96,
          ($unsigned(($signed(wire98) ? $unsigned(wire97) : wire102)) ?
              {($unsigned(wire101) ? $signed(reg105) : reg113)} : {{reg106}})};
      reg115 <= (reg113[(2'h3):(2'h2)] ~^ ($unsigned(wire96) ^ $unsigned(reg104)));
      reg116 <= reg112[(4'hf):(4'h9)];
    end
  assign wire117 = $signed($signed(wire102));
  assign wire118 = $signed($signed(wire101[(3'h5):(3'h4)]));
endmodule

module module19
#(parameter param88 = (~^(&(((8'hb2) ? (~|(8'ha8)) : (~&(7'h40))) ? ({(8'hae), (8'hb5)} < ((8'hb4) <= (8'hbc))) : (&((8'hba) ^ (8'hb7)))))), 
parameter param89 = ({(~{(param88 ? param88 : param88)})} | {{({param88} | {param88})}}))
(y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire64;
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire66,
                 wire24,
                 wire36,
                 wire37,
                 wire64,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire24 = ((wire21 ?
                          $unsigned($unsigned((wire22 ^~ wire21))) : ((+(wire21 & wire21)) ?
                              (&$signed(wire23)) : ($signed(wire22) * $signed((8'hba))))) ?
                      wire23[(2'h2):(1'h1)] : $unsigned(wire21));
  always
    @(posedge clk) begin
      reg25 <= $unsigned(wire22[(3'h7):(3'h5)]);
      reg26 <= {wire24};
      reg27 <= (&$unsigned(reg26[(3'h4):(2'h3)]));
      if (($unsigned(($unsigned((8'hbb)) ?
              (reg26 ? wire23[(4'hc):(4'ha)] : (~&wire23)) : (+(7'h42)))) ?
          {$signed((wire21[(3'h5):(3'h5)] + $unsigned((8'hb8)))),
              {wire23, reg26}} : (wire21 ? (-$unsigned(reg26)) : wire24)))
        begin
          reg28 <= (reg25[(1'h0):(1'h0)] && reg26[(3'h6):(1'h0)]);
        end
      else
        begin
          if ((^$unsigned($unsigned($unsigned((8'hbd))))))
            begin
              reg28 <= {(({wire22, (wire24 ? (8'haa) : wire22)} >>> wire21) ?
                      wire20[(1'h0):(1'h0)] : ($signed(((7'h43) ?
                          wire21 : reg27)) && $unsigned(wire20[(1'h1):(1'h0)]))),
                  (reg26 ?
                      {wire22[(4'h8):(1'h1)],
                          wire20} : (wire24 > reg27[(5'h11):(4'hd)]))};
              reg29 <= reg28;
              reg30 <= reg28;
              reg31 <= reg25[(1'h0):(1'h0)];
            end
          else
            begin
              reg28 <= {(reg31[(2'h2):(1'h0)] ^~ $unsigned((~|wire20[(3'h4):(1'h1)]))),
                  wire21[(1'h0):(1'h0)]};
              reg29 <= $unsigned((^reg28[(4'hf):(1'h1)]));
              reg30 <= $unsigned($signed(reg25));
            end
          reg32 <= reg31[(1'h1):(1'h0)];
          reg33 <= $unsigned($unsigned(wire21));
          reg34 <= reg29;
        end
      reg35 <= ($signed((($unsigned(wire21) <<< $signed(reg28)) ?
          $unsigned($signed(wire20)) : (reg28[(4'hc):(3'h7)] ?
              (~reg25) : (^reg32)))) < {$signed(reg28[(4'hc):(4'ha)])});
    end
  assign wire36 = (($unsigned($unsigned($signed(reg31))) || $unsigned({(&reg31)})) >>> $signed((~|wire23[(4'hf):(2'h3)])));
  assign wire37 = {($signed($signed((~|reg34))) ^~ $unsigned(reg26[(4'h9):(3'h6)]))};
  module38 #() modinst65 (.wire42(reg27), .clk(clk), .wire39(wire36), .y(wire64), .wire40(reg25), .wire41(reg31));
  assign wire66 = wire22[(3'h5):(2'h3)];
  module67 #() modinst86 (wire85, clk, reg34, reg31, wire22, wire64);
  assign wire87 = (~|(&(^reg33[(3'h5):(3'h5)])));
endmodule

module module67
#(parameter param84 = {({(~^((8'had) ? (8'hbc) : (8'ha7)))} ? ((~&{(8'ha0), (8'hbd)}) ? ({(7'h42), (8'hb1)} ? {(8'had), (8'ha0)} : (~|(8'haa))) : (((7'h41) < (8'hba)) >> (^(8'h9f)))) : ({(8'hb9), (!(8'hb2))} ? ((~(8'hab)) < ((8'h9f) | (8'hb9))) : (-(8'ha2)))), (^(|((+(7'h42)) >> ((8'hbb) < (8'h9d)))))})
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire74,
                 wire73,
                 wire72,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire72 = wire69[(2'h3):(2'h3)];
  assign wire73 = wire68[(2'h3):(2'h2)];
  assign wire74 = ($signed((^wire71[(4'hf):(2'h3)])) | $signed(($signed(wire72[(1'h1):(1'h1)]) ?
                      {wire68[(1'h1):(1'h1)]} : $unsigned($unsigned(wire68)))));
  always
    @(posedge clk) begin
      reg75 <= ((wire74[(4'hb):(3'h5)] ~^ ($signed((-(8'hb5))) > ((wire73 ?
                  wire72 : wire69) ?
              $unsigned(wire72) : $signed(wire73)))) ?
          $signed($signed(wire68)) : ($unsigned((+(wire71 <= (7'h44)))) ?
              $unsigned(wire72[(4'h9):(3'h4)]) : ({(^~wire72),
                  wire69[(1'h0):(1'h0)]} >= ($unsigned(wire73) + (wire68 >> wire71)))));
      reg76 <= $unsigned(($unsigned($signed($unsigned(wire70))) >= wire72[(3'h6):(3'h6)]));
    end
  assign wire77 = (-wire72);
  assign wire78 = (((reg76 ?
                              wire77[(4'h9):(2'h3)] : $signed($unsigned(wire71))) ?
                          wire73[(2'h2):(2'h2)] : reg75) ?
                      $signed($signed((~&((8'hb4) && wire77)))) : $signed((!((wire71 | wire68) ?
                          (wire68 ? wire77 : (8'hb9)) : reg76))));
  assign wire79 = ((~^$unsigned($unsigned($signed(reg76)))) >> wire68);
  assign wire80 = (7'h40);
  assign wire81 = (((wire77[(4'ha):(2'h3)] ^ {{wire74, wire78}}) ?
                      $signed($unsigned({wire68})) : wire68) << $unsigned(wire73[(1'h0):(1'h0)]));
  assign wire82 = ($signed((&{wire79})) ?
                      wire78 : {{((wire71 ? wire74 : wire69) ?
                                  wire73[(4'ha):(3'h6)] : $signed(reg76)),
                              wire79[(1'h0):(1'h0)]}});
  assign wire83 = (8'haf);
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire42;
  input wire signed [(3'h6):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  input wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  assign y = {wire61,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg63,
                 reg62,
                 reg60,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~|(($unsigned((8'hb1)) ~^ (|wire41)) ^ wire41[(1'h0):(1'h0)])) | $signed((8'ha0))))
        begin
          reg43 <= (($signed(((wire39 << wire42) * wire39[(2'h3):(2'h2)])) ?
                  (&wire42) : (wire39[(2'h2):(1'h0)] >> $signed(wire41))) ?
              wire39[(5'h13):(3'h7)] : $unsigned($signed($unsigned($unsigned(wire40)))));
          if (reg43)
            begin
              reg44 <= $signed(wire41[(2'h3):(1'h0)]);
              reg45 <= (&((-$signed(reg43[(3'h6):(3'h5)])) ^ wire40[(3'h5):(3'h4)]));
            end
          else
            begin
              reg44 <= (reg44 >= {$unsigned(reg43)});
              reg45 <= $signed((^~wire39[(3'h6):(2'h2)]));
              reg46 <= $signed(($signed({$signed(wire39), {(8'hb5)}}) ?
                  $unsigned((&reg45[(3'h5):(2'h2)])) : (^$signed(((8'hbf) ?
                      wire40 : reg43)))));
            end
          reg47 <= ((+$unsigned($signed((reg45 ^ wire39)))) ?
              (((8'h9f) >= (8'hb1)) ?
                  wire39[(2'h2):(1'h0)] : $signed((8'hb4))) : (wire40[(4'he):(4'hc)] ?
                  ((~&(|wire39)) >= (^~wire41[(3'h5):(1'h0)])) : $unsigned((-(wire41 ?
                      wire42 : reg46)))));
          if (($signed($signed(((^~wire42) ?
                  reg44[(3'h4):(2'h3)] : (~|reg46)))) ?
              reg44 : wire42[(1'h1):(1'h1)]))
            begin
              reg48 <= reg44[(4'ha):(3'h4)];
              reg49 <= {(!($signed(((8'hac) <= reg45)) ?
                      $unsigned(wire41[(2'h2):(1'h0)]) : reg45)),
                  ($unsigned(($unsigned(wire42) + (wire41 ?
                      reg46 : wire40))) * $unsigned($unsigned((reg47 ?
                      (8'hb2) : wire39))))};
              reg50 <= $signed($signed($unsigned(($unsigned(wire41) ^ $unsigned(reg49)))));
            end
          else
            begin
              reg48 <= (^((((reg44 <<< reg44) ^ wire41[(2'h3):(2'h3)]) ?
                  $signed((+wire39)) : (8'hac)) ^ wire42[(1'h0):(1'h0)]));
            end
          if (($signed(wire39) << ((8'haf) ? {$signed(wire40)} : reg50)))
            begin
              reg51 <= ($signed($signed((reg47[(2'h3):(1'h0)] ?
                  (reg50 * wire39) : (reg46 == reg43)))) ^~ ({$signed(reg43[(2'h3):(2'h2)]),
                      reg45} ?
                  ($unsigned($unsigned(reg49)) >>> ((~&(7'h43)) ^~ reg46[(3'h5):(1'h1)])) : wire42));
              reg52 <= $unsigned({reg43[(4'ha):(2'h3)]});
              reg53 <= ((((^reg51[(2'h3):(1'h0)]) <= reg45) ^ {$unsigned(wire41[(3'h4):(2'h2)]),
                  reg47}) << reg48[(1'h0):(1'h0)]);
              reg54 <= $signed((+$unsigned((reg51[(3'h6):(1'h0)] ?
                  wire39 : (^reg48)))));
            end
          else
            begin
              reg51 <= $unsigned(wire40[(4'h8):(3'h4)]);
              reg52 <= (($unsigned(reg49) << reg46[(4'h9):(2'h2)]) ?
                  (reg47 || reg49[(2'h2):(1'h1)]) : ((7'h40) - (((reg51 ?
                              reg52 : reg54) ?
                          reg51 : {(8'haa), reg47}) ?
                      ({reg43} < ((8'hb8) ? (8'ha2) : wire42)) : {(+(8'hbd)),
                          (-wire42)})));
            end
        end
      else
        begin
          reg43 <= reg54[(4'he):(3'h6)];
          reg44 <= reg44;
          reg45 <= (^$unsigned((~^{$unsigned(wire39), wire42[(1'h0):(1'h0)]})));
          reg46 <= $unsigned(((wire42[(2'h2):(1'h1)] <= (wire40 ?
                  $signed(reg43) : $unsigned(reg47))) ?
              {($signed((8'hba)) ? (reg46 >> reg51) : $signed(wire40)),
                  ((~reg50) ?
                      wire39[(5'h13):(1'h0)] : {wire41,
                          wire42})} : {(^wire39[(4'he):(4'hd)])}));
          reg47 <= reg50[(3'h5):(2'h2)];
        end
    end
  assign wire55 = ($signed(reg46[(4'ha):(2'h2)]) > (~(^reg51[(1'h0):(1'h0)])));
  assign wire56 = $unsigned($signed((($unsigned(wire40) * reg47[(2'h3):(1'h0)]) <= $signed({reg50,
                      reg46}))));
  assign wire57 = $signed(reg48[(1'h1):(1'h0)]);
  assign wire58 = $signed(reg44);
  assign wire59 = (^~reg50[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg60 <= ($unsigned((&$signed(wire58))) | wire56);
    end
  assign wire61 = (wire41 <<< (reg47 ?
                      $unsigned(({wire58,
                          wire41} <= ((8'hab) * wire58))) : ({(reg60 && reg54),
                              (-reg45)} ?
                          $signed($signed(reg52)) : (wire57[(2'h2):(2'h2)] ?
                              {reg44, (8'hbc)} : (wire58 ? reg54 : (8'ha6))))));
  always
    @(posedge clk) begin
      reg62 <= (($unsigned(wire58[(2'h2):(1'h0)]) ?
              ((~|(!reg54)) ?
                  {reg54} : reg46) : $unsigned({(reg49 << reg49)})) ?
          $unsigned((8'hab)) : $unsigned($signed((wire42 ^ (!(8'hab))))));
      reg63 <= reg46;
    end
endmodule

module module134
#(parameter param188 = (({(((8'hb3) ? (7'h40) : (8'hbd)) ^~ {(8'hbb), (8'hb1)})} ? (~&(((8'hb8) ? (7'h40) : (8'had)) == (&(8'hae)))) : (-(((8'hb5) | (8'ha1)) ? (&(8'hbf)) : (~^(8'h9d))))) || (8'h9e)))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h235):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire138;
  input wire signed [(3'h7):(1'h0)] wire137;
  input wire [(2'h2):(1'h0)] wire136;
  input wire signed [(4'h8):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire187;
  wire [(4'he):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire170;
  wire [(3'h6):(1'h0)] wire169;
  wire signed [(2'h2):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire167;
  wire [(4'ha):(1'h0)] wire166;
  wire [(4'h8):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(4'hc):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire139;
  reg [(3'h5):(1'h0)] reg185 = (1'h0);
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg181 = (1'h0);
  reg [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire156,
                 wire153,
                 wire145,
                 wire144,
                 wire143,
                 wire139,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg155,
                 reg154,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg142,
                 reg141,
                 reg140,
                 (1'h0)};
  assign wire139 = ((wire135 ?
                       wire135[(3'h6):(3'h5)] : $unsigned(wire138)) >= $signed(wire136[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg140 <= wire135;
      reg141 <= (8'hbe);
      reg142 <= $unsigned($signed((((wire137 << reg141) != reg140[(5'h13):(4'hc)]) ?
          {$signed(wire138),
              wire138[(2'h2):(1'h0)]} : (wire136[(1'h0):(1'h0)] | (~&wire137)))));
    end
  assign wire143 = $signed(({({reg140, wire135} <<< (reg142 | reg141)),
                       (^~{reg140})} ~^ $unsigned((reg142 << $signed(reg141)))));
  assign wire144 = ({((wire135 <= (wire139 ? wire138 : wire143)) ?
                           (wire139 ?
                               (&wire139) : {wire139}) : $signed($signed(wire136))),
                       $signed(wire135[(3'h4):(2'h2)])} & $signed(((((7'h42) >>> wire139) ?
                       wire135 : (~^wire139)) << $unsigned((wire143 != wire135)))));
  assign wire145 = (wire143 ~^ wire136);
  always
    @(posedge clk) begin
      reg146 <= (~($unsigned((^~(wire145 <<< wire137))) ?
          $signed($signed(wire144)) : (~&wire144[(4'hc):(3'h7)])));
      reg147 <= $unsigned(wire143[(3'h4):(1'h0)]);
      reg148 <= wire137;
    end
  always
    @(posedge clk) begin
      reg149 <= wire145[(3'h5):(1'h1)];
      reg150 <= reg141[(4'hb):(4'h9)];
      reg151 <= (($unsigned(reg142) ^ (8'haa)) ?
          $unsigned($unsigned(((reg146 >> wire136) >= reg141))) : reg149[(4'h8):(1'h0)]);
      reg152 <= wire138;
    end
  assign wire153 = (($unsigned(wire137) ?
                       $signed((((8'ha7) ?
                           wire137 : (8'ha1)) & wire143[(3'h4):(3'h4)])) : (wire136[(1'h1):(1'h1)] < $signed($unsigned(wire145)))) + ((8'hb2) & (wire137[(2'h2):(1'h1)] | wire143)));
  always
    @(posedge clk) begin
      reg154 <= {wire143};
      reg155 <= reg148;
    end
  assign wire156 = ((~{((|reg142) ^~ ((8'ha6) ? wire136 : reg148)),
                           (~^$unsigned(wire137))}) ?
                       (-(($unsigned(wire143) ?
                           $unsigned((8'h9d)) : $unsigned((8'ha0))) || reg152)) : $unsigned((^~$signed((^wire144)))));
  always
    @(posedge clk) begin
      if ($signed($signed((($signed((8'hb3)) - (wire145 >>> reg154)) <= {$unsigned((8'hb4)),
          wire145[(1'h1):(1'h0)]}))))
        begin
          reg157 <= $unsigned(reg149);
          reg158 <= $unsigned($signed(reg148));
          reg159 <= {((($unsigned(wire139) <<< (+(8'hb9))) ?
                      (~(reg150 || reg140)) : $signed($unsigned(reg157))) ?
                  $unsigned((((8'hb7) ?
                      reg147 : wire139) ^~ reg146)) : (&{$signed(wire136)})),
              reg152};
          reg160 <= ((8'hb8) ?
              (~&(wire144[(4'hc):(3'h5)] ?
                  {reg155[(2'h3):(1'h1)]} : reg149)) : reg141[(4'ha):(3'h5)]);
        end
      else
        begin
          reg157 <= (wire145[(4'ha):(2'h2)] ?
              (-{reg159[(5'h12):(2'h2)]}) : (reg159 ?
                  reg160[(3'h6):(2'h3)] : $unsigned($signed({reg151}))));
          reg158 <= reg148[(4'hd):(3'h6)];
          reg159 <= $unsigned((|reg157));
          reg160 <= ($signed($signed((^~(wire156 ? reg159 : reg150)))) ?
              ((reg142 | wire144) << (!{wire138[(2'h2):(1'h0)]})) : $unsigned(reg142[(3'h4):(3'h4)]));
          reg161 <= $unsigned($signed((~&reg147[(1'h1):(1'h1)])));
        end
      reg162 <= (7'h41);
    end
  always
    @(posedge clk) begin
      reg163 <= wire153[(3'h6):(2'h3)];
      if ($unsigned(({$signed({wire156}), $signed({(8'h9e)})} ?
          $signed(((reg148 ? reg162 : reg155) ?
              $signed(reg147) : (reg149 ?
                  (8'hba) : (8'hb5)))) : (($signed(reg160) ?
              $unsigned(reg154) : {wire144}) | (8'hb9)))))
        begin
          reg164 <= reg152;
        end
      else
        begin
          reg164 <= $signed((reg154 ?
              $signed($signed($signed((8'ha2)))) : (&($unsigned(reg162) - (8'hbe)))));
        end
      reg165 <= reg152[(2'h2):(1'h1)];
    end
  assign wire166 = (reg151[(2'h3):(2'h2)] <= (wire144 ?
                       $unsigned(((+wire153) ?
                           $signed(reg146) : $signed(reg152))) : wire145[(3'h6):(3'h5)]));
  assign wire167 = reg151[(1'h1):(1'h0)];
  assign wire168 = reg154;
  assign wire169 = {reg154};
  assign wire170 = reg152[(2'h2):(1'h0)];
  assign wire171 = ((-reg154) ^ (8'hb6));
  always
    @(posedge clk) begin
      reg172 <= (~{{reg157}, $unsigned(reg154[(1'h1):(1'h0)])});
      reg173 <= {$unsigned((($signed(reg157) ?
              (wire136 ^~ wire137) : (8'hbf)) != $unsigned((~^wire139))))};
      if ((&((-({(8'hb0)} | reg173)) ?
          reg160[(4'hf):(2'h2)] : $signed($signed(reg147)))))
        begin
          reg174 <= (wire139 ^ (wire137[(2'h3):(1'h1)] ~^ (7'h44)));
          if ({wire171,
              (({(wire169 ? wire137 : wire137)} ?
                  $signed($unsigned(reg172)) : ($unsigned((8'hbc)) ?
                      $unsigned(reg173) : $signed(reg142))) <= $signed(wire145[(1'h0):(1'h0)]))})
            begin
              reg175 <= reg148[(4'h8):(1'h1)];
              reg176 <= reg149[(3'h6):(3'h4)];
              reg177 <= $unsigned({wire156,
                  (wire153 > (-wire153[(1'h0):(1'h0)]))});
              reg178 <= ((~&$signed(($unsigned((8'hac)) < ((8'ha8) ?
                  reg160 : wire139)))) || (-({$unsigned((8'hb2)),
                  $signed(reg158)} <= reg148)));
              reg179 <= (^~$unsigned((~|(&(reg140 != reg146)))));
            end
          else
            begin
              reg175 <= wire145;
              reg176 <= ($unsigned({$unsigned((~(8'h9f))),
                  $signed({reg163})}) & (((8'hba) ?
                      $signed((reg160 <<< reg141)) : ({wire145} >>> $unsigned(wire169))) ?
                  reg152 : {$unsigned((wire135 ? (8'hac) : reg146)),
                      (|(reg154 ? (8'hb9) : (8'hb6)))}));
              reg177 <= $signed(wire168);
              reg178 <= $signed($signed($unsigned(((reg164 ? wire143 : reg162) ?
                  (reg150 ? wire166 : reg152) : wire170[(5'h15):(1'h1)]))));
            end
          reg180 <= ((((^$signed(reg151)) && $signed({wire166,
              reg173})) << reg157[(1'h1):(1'h0)]) < $unsigned(wire137[(1'h0):(1'h0)]));
          if ((8'ha2))
            begin
              reg181 <= reg141[(3'h6):(3'h5)];
              reg182 <= ($signed(reg179) >= $unsigned({$signed($unsigned((8'ha7))),
                  ((~reg179) >>> (~&reg160))}));
              reg183 <= reg140[(5'h10):(4'h8)];
            end
          else
            begin
              reg181 <= $signed(wire166);
              reg182 <= wire143[(2'h3):(1'h0)];
              reg183 <= reg182;
              reg184 <= $unsigned(reg174[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          reg174 <= ($signed(($unsigned(wire144) ?
                  (~&wire153[(4'ha):(4'h9)]) : {reg180[(2'h3):(1'h0)],
                      (^reg159)})) ?
              reg183[(2'h3):(2'h3)] : wire137[(3'h7):(1'h0)]);
          if ($signed(($signed($unsigned((|reg180))) + (((8'ha4) ?
              $signed(wire168) : reg148[(4'he):(3'h5)]) * wire139))))
            begin
              reg175 <= $signed($signed($signed(((~|(8'hb4)) ?
                  (reg160 > reg146) : $signed(reg178)))));
              reg176 <= $signed(wire169[(3'h4):(3'h4)]);
              reg177 <= $unsigned($signed((~|($signed((8'h9c)) ?
                  (wire145 >>> reg163) : (reg140 ? reg174 : wire136)))));
              reg178 <= (~($unsigned({$unsigned(reg160), $unsigned(reg141)}) ?
                  $signed($unsigned($signed(wire139))) : $signed($unsigned((^~reg165)))));
            end
          else
            begin
              reg175 <= ($unsigned(wire136[(1'h0):(1'h0)]) ?
                  ((($signed(wire138) ^ {reg152,
                          wire156}) != {$unsigned((8'hbc)), {wire166}}) ?
                      (7'h42) : (($unsigned(wire139) * (wire143 ?
                          wire170 : (8'h9e))) > $signed((reg177 ~^ reg152)))) : $unsigned((+$signed($unsigned(wire137)))));
              reg176 <= (&{(+(reg173 ? $unsigned(reg147) : $signed(wire153))),
                  ((~^$signed(wire144)) ?
                      (((7'h44) ?
                          wire136 : reg163) > reg147[(3'h4):(1'h1)]) : (&$unsigned(wire153)))});
              reg177 <= $unsigned(reg165);
              reg178 <= wire137[(3'h5):(1'h1)];
            end
          reg179 <= wire167;
          reg180 <= reg141;
          reg181 <= ($signed(reg161) ?
              $signed(reg141[(4'hc):(1'h0)]) : $unsigned($unsigned($signed((wire137 > reg163)))));
        end
      reg185 <= $signed((~|reg141[(4'he):(4'h9)]));
    end
  assign wire186 = ({(reg161 >> $unsigned(wire139)),
                       (reg182[(3'h4):(2'h2)] ~^ reg158)} * $signed(reg183));
  assign wire187 = reg151;
endmodule
