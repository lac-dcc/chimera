module top
#(parameter param161 = (((({(8'h9f)} ? (~&(8'haf)) : (~(8'ha0))) || (((8'h9c) ? (8'ha3) : (8'hbf)) <<< ((8'hba) >>> (8'hae)))) & (8'ha2)) ? ({(((8'haa) != (8'hbf)) ? {(8'hb2), (8'hb8)} : (^~(8'hac))), (((8'h9c) <<< (8'ha0)) ? (+(7'h41)) : ((8'ha4) ? (8'haf) : (8'haa)))} ? (~^{(8'h9f)}) : ({((8'hb0) & (8'h9c))} & (((7'h40) - (8'h9e)) ? (8'hb4) : (~^(8'ha6))))) : (^((((7'h44) > (8'hb4)) ~^ ((8'ha4) >>> (8'hb1))) ? (((8'had) <<< (8'hb6)) ? (&(8'hb3)) : (^~(8'hb5))) : ({(8'hb0), (7'h42)} >> {(8'hb1), (8'hac)})))), 
parameter param162 = (~^((param161 <<< (param161 && (!param161))) ? (~&((!param161) ? (8'h9f) : (^~param161))) : param161)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire159;
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire8,
                 wire9,
                 wire10,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire159,
                 reg11,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned(wire2[(2'h3):(1'h1)]);
  assign wire6 = ($unsigned($signed((wire0 ?
                         (wire1 ? wire5 : wire5) : wire5))) ?
                     ($unsigned($unsigned($signed(wire4))) | wire5[(2'h3):(1'h0)]) : (((wire2 ?
                             $unsigned(wire5) : $signed(wire4)) << $signed((wire1 <= wire2))) ?
                         wire1[(1'h1):(1'h0)] : (wire5 ?
                             (+wire1) : $signed((8'hbe)))));
  always
    @(posedge clk) begin
      reg7 <= {wire0};
    end
  assign wire8 = ($signed((wire4 < ({wire5, (8'hb2)} ^~ wire2))) ?
                     ($signed({(^~wire3)}) ^ $unsigned(wire4)) : $unsigned((&({wire5,
                             reg7} ?
                         $unsigned(wire0) : (reg7 > (8'hba))))));
  assign wire9 = reg7[(4'he):(3'h7)];
  assign wire10 = $unsigned(wire6);
  always
    @(posedge clk) begin
      reg11 <= $unsigned((-(^wire5)));
    end
  assign wire12 = (wire10[(2'h2):(1'h1)] ?
                      (((wire9[(4'he):(4'ha)] << $unsigned(wire9)) ^ $signed((wire6 & (8'hab)))) ?
                          (wire0[(3'h4):(2'h3)] << ((wire8 ? wire6 : wire10) ?
                              $signed(wire6) : reg7)) : $unsigned($signed({wire0,
                              wire0}))) : wire3[(2'h2):(2'h2)]);
  assign wire13 = wire4;
  assign wire14 = ($unsigned((|$signed((wire2 ? wire3 : wire1)))) ?
                      (~|wire4) : wire1[(2'h2):(1'h1)]);
  assign wire15 = wire8[(3'h6):(3'h6)];
  assign wire16 = reg11;
  assign wire17 = $signed((wire8 >= $unsigned({wire14[(1'h1):(1'h0)],
                      (^~wire12)})));
  assign wire18 = wire16[(1'h0):(1'h0)];
  assign wire19 = (^$unsigned((8'ha5)));
  assign wire20 = (+(~^wire19[(2'h2):(2'h2)]));
  assign wire21 = ((^wire16) <= ((^~((reg7 ? wire10 : wire2) ?
                      (wire17 ? wire18 : wire20) : (wire1 ?
                          wire13 : wire18))) * (8'ha8)));
  assign wire22 = {((~wire19) ?
                          (~^$signed(wire10)) : {(+$signed(wire18)),
                              ($unsigned(wire9) - {wire8})}),
                      wire8[(3'h7):(3'h7)]};
  assign wire23 = wire0;
  assign wire24 = (-$signed(wire8));
  module25 #() modinst160 (wire159, clk, wire12, wire22, wire1, wire20, wire2);
endmodule

module module25
#(parameter param158 = ((~^(^~((-(8'hb3)) ? ((8'hb8) >= (8'ha6)) : ((8'hb7) ? (8'h9f) : (8'ha2))))) || ((8'ha4) ? {(8'hb6), (~((8'ha0) ^ (7'h44)))} : ((&(&(8'h9f))) != {((8'hae) >>> (8'hbf))}))))
(y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire157;
  wire [(4'hb):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire155;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire153;
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire119,
                 wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire153,
                 (1'h0)};
  module31 #() modinst84 (wire83, clk, wire27, wire26, wire28, wire29, wire30);
  assign wire85 = (wire30[(3'h7):(3'h4)] >> wire29);
  assign wire86 = {wire28,
                      ($unsigned((8'hbc)) ?
                          {(((8'ha1) ? wire28 : wire83) ?
                                  wire85[(4'h8):(3'h5)] : wire83[(2'h2):(2'h2)]),
                              ($signed(wire28) ?
                                  wire29 : wire85[(3'h6):(2'h2)])} : (($signed(wire27) ?
                                  wire26 : wire26[(3'h7):(3'h4)]) ?
                              ($signed(wire26) ?
                                  wire26[(1'h0):(1'h0)] : $unsigned(wire85)) : $signed({(8'ha2)})))};
  assign wire87 = ((|wire86) >>> (($signed(wire26[(1'h0):(1'h0)]) ?
                          $unsigned((~^wire26)) : $unsigned((wire83 + (8'ha0)))) ?
                      ((~&{wire86}) < wire26[(2'h3):(1'h1)]) : (wire30[(4'hd):(4'h9)] ?
                          {(~&wire86)} : (^~(!wire86)))));
  module88 #() modinst120 (.y(wire119), .wire92(wire30), .wire89(wire85), .wire90(wire87), .wire91(wire29), .wire93(wire28), .clk(clk));
  assign wire121 = (~$unsigned((|(~&$signed(wire83)))));
  assign wire122 = ($signed((((8'haf) ? (8'haf) : $unsigned(wire28)) ?
                       (wire119 >= (wire30 < wire119)) : $unsigned(wire26[(3'h4):(2'h2)]))) * wire30);
  assign wire123 = wire87[(4'hb):(4'ha)];
  assign wire124 = $unsigned({wire85[(4'h8):(1'h1)], $unsigned(wire83)});
  module125 #() modinst154 (.clk(clk), .y(wire153), .wire130(wire87), .wire128(wire29), .wire129(wire121), .wire126(wire27), .wire127(wire122));
  assign wire155 = wire86;
  assign wire156 = $unsigned(({(wire155[(3'h6):(1'h0)] ?
                               wire28[(1'h1):(1'h0)] : wire122),
                           ((wire122 > wire27) ?
                               (wire83 | wire124) : ((8'hb1) ?
                                   wire30 : (8'ha7)))} ?
                       (&$signed(wire27[(3'h6):(3'h4)])) : wire119[(3'h7):(3'h6)]));
  assign wire157 = $signed(wire155[(3'h7):(3'h4)]);
endmodule

module module125
#(parameter param151 = ({(((8'ha2) ^ (+(8'hb4))) ? (^((8'hb0) >= (8'ha3))) : ({(8'hbb)} ^~ (8'hb8)))} || ((({(8'hbe)} && {(7'h41), (8'ha3)}) ? {(^~(8'had)), {(8'haf), (8'h9c)}} : ({(8'hb0), (8'h9e)} ? {(8'h9e)} : ((8'hb7) && (8'ha7)))) <<< (~^(+(-(8'hbd)))))), 
parameter param152 = (+param151))
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire130;
  input wire [(5'h13):(1'h0)] wire129;
  input wire [(3'h7):(1'h0)] wire128;
  input wire [(4'ha):(1'h0)] wire127;
  input wire [(5'h13):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire150;
  wire [(5'h15):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire143;
  wire signed [(4'hf):(1'h0)] wire142;
  wire signed [(3'h7):(1'h0)] wire141;
  wire signed [(2'h2):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire139;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(3'h7):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire131;
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire131 = {((~|wire126[(3'h6):(3'h5)]) == wire129[(4'he):(3'h6)])};
  assign wire132 = $unsigned($signed(wire127));
  assign wire133 = $unsigned((-($unsigned((!wire132)) ?
                       (~$signed(wire130)) : {wire132[(4'h8):(1'h1)],
                           wire126[(3'h5):(2'h3)]})));
  assign wire134 = (~^$signed((($signed(wire133) * (wire127 ?
                           (8'h9f) : wire128)) ?
                       $unsigned({wire129}) : (|(wire129 + wire127)))));
  assign wire135 = {wire133,
                       (wire126[(2'h2):(1'h1)] ?
                           (!{$signed(wire130)}) : ({$unsigned(wire132),
                               $signed(wire128)} <= ((wire130 ?
                                   wire130 : wire133) ?
                               (wire131 ? wire133 : wire130) : (wire132 ?
                                   wire133 : wire131))))};
  assign wire136 = (|wire132[(1'h0):(1'h0)]);
  assign wire137 = wire135;
  assign wire138 = wire132;
  assign wire139 = (~&wire136[(3'h4):(1'h1)]);
  assign wire140 = (~$signed(wire135));
  assign wire141 = ((+$unsigned((wire129 >> $signed(wire139)))) >= $signed(($signed((wire135 >= wire138)) ?
                       (^wire128[(3'h7):(2'h2)]) : ($signed(wire133) & wire138[(2'h3):(2'h2)]))));
  assign wire142 = ((~&$unsigned((^$unsigned(wire126)))) ?
                       ({(wire135[(1'h0):(1'h0)] ?
                                   (^~(8'hba)) : (wire135 != wire138))} ?
                           $signed(((wire136 ?
                               wire131 : wire127) == $unsigned(wire140))) : wire127[(2'h3):(1'h1)]) : $signed((&$unsigned((wire133 || wire139)))));
  assign wire143 = ($signed({($signed(wire136) ?
                           $signed(wire130) : $unsigned(wire128)),
                       $unsigned(wire128)}) >>> $unsigned((|wire137[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg144 <= ((~$signed($signed($signed(wire139)))) ?
          wire136[(3'h4):(2'h3)] : (wire138 > wire126));
      reg145 <= $signed(wire135[(3'h5):(1'h0)]);
      reg146 <= wire133[(1'h1):(1'h0)];
      reg147 <= (($signed(wire131) ?
          $unsigned((+(!reg145))) : wire131) < ($signed($unsigned(reg146[(3'h4):(1'h1)])) ?
          wire127[(4'h9):(4'h8)] : $signed($unsigned(wire132))));
      reg148 <= $unsigned((($unsigned(wire143[(1'h1):(1'h1)]) && (^$signed(wire142))) ?
          {reg146, $signed(wire141)} : $signed($signed((-wire140)))));
    end
  assign wire149 = wire136;
  assign wire150 = wire136[(1'h1):(1'h0)];
endmodule

module module88  (y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire93;
  input wire [(5'h12):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  input wire [(4'h9):(1'h0)] wire90;
  input wire signed [(4'h8):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire94 = (8'h9e);
  assign wire95 = (((!({wire89, (8'hb2)} ?
                          (wire93 ? wire89 : wire89) : {(8'hbd),
                              wire93})) & (~|$unsigned($signed(wire89)))) ?
                      ((wire91[(3'h5):(3'h5)] < {{wire92}}) == $signed(wire93[(4'h9):(3'h7)])) : (($signed((wire91 & wire91)) >>> $signed((~|wire94))) ?
                          wire92[(5'h11):(1'h1)] : $signed(($unsigned(wire91) << (8'ha5)))));
  assign wire96 = ((^~wire90[(3'h7):(3'h5)]) * (wire89 ?
                      wire92[(4'h8):(2'h3)] : (+wire94[(1'h1):(1'h0)])));
  assign wire97 = (~|(({((8'ha9) & wire93),
                      $unsigned(wire94)} != $unsigned($unsigned(wire96))) + (~^(wire96 ?
                      $unsigned(wire91) : $signed(wire91)))));
  assign wire98 = $unsigned(((~|$unsigned(wire96[(3'h6):(3'h6)])) ?
                      (-$unsigned((wire95 ?
                          wire90 : (8'hb2)))) : $unsigned(((wire94 - wire94) ?
                          $signed(wire93) : (wire90 ? wire90 : wire97)))));
  always
    @(posedge clk) begin
      if ({((&wire95) ?
              {((wire93 ? wire97 : (7'h40)) | $unsigned(wire90)),
                  $unsigned($signed(wire95))} : {((wire91 ? wire91 : wire97) ?
                      wire90 : (wire98 <<< wire93)),
                  $signed($unsigned(wire98))})})
        begin
          reg99 <= (((+wire96[(2'h3):(2'h3)]) ^~ (-wire94)) ?
              ((wire95 >>> wire95[(5'h13):(4'h8)]) ?
                  $signed($unsigned(wire92[(4'hd):(4'hd)])) : wire93[(2'h2):(1'h1)]) : $unsigned((^wire98[(1'h0):(1'h0)])));
          reg100 <= wire91;
          if ({(((8'ha1) & {wire96[(4'h9):(2'h3)]}) ?
                  wire95 : ($unsigned(wire91) <= ({wire89} ?
                      {wire91, wire97} : $signed(wire89)))),
              ($signed(wire95[(4'ha):(1'h0)]) ~^ reg100)})
            begin
              reg101 <= (wire96[(2'h3):(1'h0)] ?
                  (((~(wire91 ? wire97 : wire89)) ?
                          (wire97 > wire95[(4'h8):(4'h8)]) : (~&$signed(wire93))) ?
                      (|wire91) : (($unsigned(wire95) - ((8'ha1) || wire97)) << $signed(reg99))) : $unsigned($unsigned({(wire96 ?
                          wire96 : wire91)})));
              reg102 <= wire89[(1'h0):(1'h0)];
              reg103 <= (wire96 ?
                  {(&$signed(((8'hb1) ? wire92 : wire95))),
                      (((wire93 > wire89) + $unsigned((8'hb1))) * $unsigned((wire95 ?
                          reg99 : wire93)))} : $signed({wire98[(1'h0):(1'h0)],
                      ((8'hb2) ? {wire93} : $signed(wire92))}));
              reg104 <= wire93;
              reg105 <= ((wire89 << (~&$unsigned(wire98))) ?
                  (wire93 ?
                      $signed((wire93 ?
                          (!reg99) : $signed(wire91))) : $unsigned((wire97 > {wire96,
                          wire98}))) : (~|((~$unsigned(reg101)) & wire91[(2'h2):(1'h0)])));
            end
          else
            begin
              reg101 <= (^~reg100[(4'h8):(3'h7)]);
            end
        end
      else
        begin
          reg99 <= $unsigned((wire91[(1'h1):(1'h1)] << (~&wire91[(1'h1):(1'h1)])));
          reg100 <= $signed($signed((&{(reg101 || (8'ha2)),
              $unsigned((8'ha0))})));
          reg101 <= (({($unsigned(wire98) ^ (wire94 - reg103)),
                  {reg105, reg100}} ~^ wire90) ?
              (^(wire98[(2'h2):(1'h1)] ?
                  reg104 : (~wire89))) : {($unsigned(wire90) || ((reg99 >> reg101) ?
                      reg99 : $signed(reg104)))});
          reg102 <= wire98[(1'h1):(1'h0)];
        end
      reg106 <= {wire98[(1'h1):(1'h0)],
          (~^(reg99[(4'hd):(4'hc)] - $unsigned(reg102[(1'h1):(1'h1)])))};
      reg107 <= reg103;
    end
  assign wire108 = (~&(reg103 ?
                       $signed(($unsigned(reg103) ~^ wire96)) : ((~&wire91) ?
                           ({reg104} >>> reg102[(2'h3):(1'h0)]) : reg106)));
  assign wire109 = wire95;
  assign wire110 = $unsigned(wire97[(1'h1):(1'h0)]);
  assign wire111 = $signed(wire108[(1'h0):(1'h0)]);
  assign wire112 = wire109;
  assign wire113 = wire96;
  assign wire114 = (-($unsigned((~(wire98 ? wire96 : (8'hb3)))) ?
                       $unsigned((8'hab)) : {($signed((8'hbc)) + (reg101 ?
                               wire98 : wire110))}));
  assign wire115 = (wire108 - (!$signed(wire90)));
  assign wire116 = (~|(8'hb7));
  assign wire117 = $signed($signed($signed($signed(reg102[(3'h4):(2'h2)]))));
  assign wire118 = (!(^wire113[(2'h2):(1'h1)]));
endmodule

module module31
#(parameter param81 = (~|(~^(((~&(8'ha8)) <= ((8'ha7) ? (8'ha5) : (8'hbc))) ~^ (((8'ha5) >>> (8'haf)) ? (+(8'hb2)) : (|(8'hac)))))), 
parameter param82 = (!{(param81 ? param81 : (~(param81 ? (8'ha4) : param81))), ((param81 ? (8'hb2) : (!param81)) ? ((param81 ? param81 : param81) ? param81 : (param81 ~^ (8'hb1))) : (param81 >> param81))}))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire signed [(4'h8):(1'h0)] wire35;
  input wire [(4'hf):(1'h0)] wire34;
  input wire signed [(5'h11):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h4):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire37 = {wire35[(3'h7):(3'h4)], $signed(wire32)};
  assign wire38 = wire34;
  assign wire39 = $unsigned($signed((-$signed(wire33))));
  assign wire40 = {(wire39[(1'h0):(1'h0)] && $unsigned($unsigned((wire33 >> wire37)))),
                      $signed((~&(|{wire38})))};
  assign wire41 = wire36[(3'h6):(3'h5)];
  assign wire42 = (^$unsigned($signed(wire40)));
  assign wire43 = $signed($signed(wire34));
  assign wire44 = wire41[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg45 <= ((+wire36) ? (-$unsigned({(wire42 * wire36)})) : wire34);
      reg46 <= $unsigned(wire43);
      if (wire35[(3'h7):(3'h4)])
        begin
          reg47 <= wire41[(2'h2):(2'h2)];
          reg48 <= wire36;
          reg49 <= $signed({wire44[(3'h4):(1'h0)], wire43});
          reg50 <= ((($unsigned({wire43,
              wire35}) >> $unsigned(wire44)) ^ reg46[(4'ha):(3'h4)]) || $unsigned($unsigned(({reg46} * wire44))));
          reg51 <= ($unsigned(wire33) ?
              ((~|{((7'h43) ? wire40 : wire32), (wire39 ? reg49 : wire41)}) ?
                  wire35 : (8'hbf)) : $unsigned($unsigned((^~(~|wire33)))));
        end
      else
        begin
          reg47 <= {$signed($signed(wire37)), wire34[(3'h5):(3'h5)]};
          reg48 <= (7'h43);
          reg49 <= wire37;
          reg50 <= $unsigned($signed(reg51[(3'h4):(2'h3)]));
        end
    end
  always
    @(posedge clk) begin
      reg52 <= (!($signed(((reg51 ?
          reg48 : wire32) & {wire35})) > reg51[(2'h3):(2'h2)]));
    end
  assign wire53 = reg47[(3'h4):(1'h0)];
  assign wire54 = $unsigned(wire44);
  assign wire55 = $unsigned($signed({$signed(reg50)}));
  assign wire56 = (~(&(($unsigned(wire38) <<< $signed(wire35)) ?
                      {wire53[(4'h9):(4'h9)],
                          reg49} : $unsigned($signed(wire53)))));
  assign wire57 = (~^(-{$unsigned(reg45[(4'ha):(2'h2)]), $signed({reg51})}));
  assign wire58 = wire43;
  assign wire59 = {wire54[(2'h3):(1'h1)]};
  always
    @(posedge clk) begin
      reg60 <= $unsigned($unsigned(((|(wire36 ? wire54 : wire55)) ?
          reg46 : wire41)));
      reg61 <= wire59;
      reg62 <= $signed(wire54[(2'h3):(2'h2)]);
      reg63 <= (~&wire37);
      if ($signed(($unsigned(((&wire57) ? $unsigned(wire42) : wire44)) ?
          (~&reg63[(4'hf):(4'he)]) : (^wire42[(2'h3):(1'h1)]))))
        begin
          reg64 <= $signed((-wire42[(1'h0):(1'h0)]));
          reg65 <= ({$signed((^(reg61 <<< (8'hb2)))), wire54[(1'h0):(1'h0)]} ?
              $signed(reg46[(1'h0):(1'h0)]) : $unsigned(wire34));
          reg66 <= (^~$signed((|((+wire43) ?
              (wire57 ? reg48 : reg63) : $signed(reg65)))));
          reg67 <= (((^~($signed(reg48) ?
                  (~|(8'hb1)) : ((8'haa) ? wire38 : reg63))) ?
              $unsigned((~^{(7'h44),
                  reg61})) : $signed($signed((8'hb6)))) | $unsigned(({$signed(wire32),
              $signed(wire56)} ^~ (~|((7'h44) > reg52)))));
          reg68 <= $signed((+reg67));
        end
      else
        begin
          reg64 <= reg46;
          reg65 <= ({((^~$signed(reg63)) ^~ wire34)} ?
              {wire34} : (wire37[(3'h6):(1'h1)] ?
                  ((+(reg45 >= reg60)) >= $signed((reg49 ?
                      wire56 : reg64))) : (wire54[(1'h0):(1'h0)] ?
                      wire36 : ((wire33 & wire40) ?
                          (|reg67) : $signed((8'ha8))))));
          reg66 <= (!((($signed(reg52) <= (+reg67)) >>> ((~|wire59) ?
              (reg66 != wire43) : wire43)) + $signed(wire55)));
        end
    end
  assign wire69 = wire38[(1'h1):(1'h1)];
  assign wire70 = {(~&$signed(wire39))};
  assign wire71 = (wire43[(1'h1):(1'h0)] << $signed(($signed(wire56) == (|(wire35 || wire44)))));
  assign wire72 = $unsigned(wire55[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned((^~$signed($unsigned((wire71 << wire58))))))
        begin
          reg73 <= wire42[(3'h5):(2'h3)];
          reg74 <= $unsigned($unsigned(wire39));
          reg75 <= $signed(($unsigned({(8'hba)}) ?
              (!$unsigned($signed(wire42))) : (|((8'haa) > $unsigned(reg50)))));
          if (reg48)
            begin
              reg76 <= $unsigned($signed($unsigned($unsigned(reg46))));
              reg77 <= $signed((!wire69[(3'h4):(2'h3)]));
              reg78 <= $signed(((reg48[(2'h3):(1'h0)] >> wire57) > {(-((8'hb4) - reg74))}));
              reg79 <= $unsigned((~^wire33));
              reg80 <= (&(8'hb9));
            end
          else
            begin
              reg76 <= wire43[(3'h7):(3'h6)];
              reg77 <= (~|(~(((wire33 && reg76) || reg61[(1'h0):(1'h0)]) >> ((^~(8'hab)) <= $signed(wire33)))));
              reg78 <= $unsigned(reg61[(1'h1):(1'h1)]);
              reg79 <= wire34;
            end
        end
      else
        begin
          reg73 <= (($unsigned($signed((~&(8'ha3)))) ?
                  $unsigned(wire56) : $unsigned((|(reg73 ? reg61 : wire59)))) ?
              $unsigned(wire59) : (|$signed($signed($unsigned(wire54)))));
          reg74 <= (8'ha0);
          reg75 <= $signed((!(~|{{wire44, reg62}, reg62})));
          reg76 <= (&$signed({wire37, $unsigned($signed(wire57))}));
        end
    end
endmodule
