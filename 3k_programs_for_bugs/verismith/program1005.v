module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire162,
                 wire160,
                 wire31,
                 wire30,
                 wire28,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg4,
                 reg9,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
    end
  assign wire5 = wire1;
  assign wire6 = wire0;
  assign wire7 = wire6[(3'h4):(1'h0)];
  assign wire8 = ((($unsigned(wire5[(3'h4):(1'h1)]) ? reg4 : (~^reg4)) ?
                     reg4[(3'h7):(2'h2)] : wire6) != (~^(~|wire0)));
  always
    @(posedge clk) begin
      reg9 <= $unsigned((^~(((8'hae) != (~^wire5)) ?
          $unsigned({wire3}) : wire6[(3'h5):(3'h5)])));
      reg10 <= ((~^reg4[(1'h0):(1'h0)]) > (-(|((wire1 <= (7'h41)) ?
          ((8'ha6) ? (8'ha2) : wire6) : (&wire0)))));
    end
  assign wire11 = (~$signed((reg10 ?
                      ((!(8'hb8)) ^ (wire1 ? wire6 : wire5)) : (8'hb9))));
  assign wire12 = ($unsigned($unsigned((8'hb5))) ?
                      ((wire11[(3'h6):(1'h1)] - $signed((&wire8))) ?
                          ($unsigned({wire0,
                              wire1}) ^ $signed(wire3)) : wire2) : {($unsigned((!(8'h9c))) ^ $unsigned($unsigned(wire5)))});
  assign wire13 = (~|$signed($signed(wire0)));
  module14 #() modinst29 (.wire15(wire2), .y(wire28), .wire16(wire6), .wire17(wire0), .wire18(wire5), .clk(clk));
  assign wire30 = (+wire11[(4'h8):(3'h4)]);
  assign wire31 = ((~wire1[(4'h9):(3'h5)]) == $signed({(^~wire3[(4'ha):(2'h3)]),
                      (!(reg4 * reg4))}));
  module32 #() modinst161 (wire160, clk, wire2, wire0, wire12, wire31, reg4);
  assign wire162 = wire28[(4'ha):(4'ha)];
endmodule

module module32
#(parameter param158 = {((((&(8'haf)) <<< (~(8'hb2))) ? ((^(8'had)) != ((8'h9e) ? (8'hb2) : (8'hb8))) : ((8'hbb) - ((8'haa) ? (8'haf) : (8'ha6)))) == {((&(8'ha1)) + (8'h9c)), {((8'hb0) & (7'h40))}})}, 
parameter param159 = param158)
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire37;
  input wire signed [(4'hd):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire [(5'h11):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire87;
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire51,
                 wire53,
                 wire54,
                 wire87,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg95,
                 reg96,
                 reg97,
                 (1'h0)};
  module38 #() modinst52 (.wire40(wire34), .wire43(wire33), .wire39(wire37), .y(wire51), .wire41(wire35), .wire42(wire36), .clk(clk));
  assign wire53 = $unsigned(($unsigned(wire33) ?
                      $unsigned((wire33[(4'hb):(1'h0)] ?
                          $unsigned(wire37) : wire37)) : ($unsigned((wire37 ^~ wire34)) ?
                          (~wire36[(3'h7):(2'h3)]) : wire51)));
  assign wire54 = wire37;
  module55 #() modinst88 (.wire59(wire34), .wire60(wire35), .y(wire87), .wire58(wire54), .wire57(wire33), .clk(clk), .wire56(wire36));
  assign wire89 = (&(~&{$unsigned({wire33}),
                      ({wire53, (8'hba)} ?
                          wire35[(4'hd):(3'h5)] : (~^wire35))}));
  assign wire90 = $signed(wire87);
  assign wire91 = $unsigned(($unsigned(wire53[(3'h5):(2'h3)]) | (wire37 ?
                      $signed((8'hab)) : (wire33[(3'h4):(1'h0)] ~^ wire89))));
  assign wire92 = (8'ha6);
  assign wire93 = wire33;
  assign wire94 = wire93[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg95 <= $unsigned(wire35);
      reg96 <= (^~reg95[(1'h0):(1'h0)]);
      reg97 <= (~|(wire54[(3'h5):(1'h0)] ? wire93 : wire89));
    end
  module98 #() modinst130 (.y(wire129), .wire99(wire35), .wire103(wire94), .wire100(wire87), .wire102(wire92), .wire101(reg97), .clk(clk));
  assign wire131 = $signed($signed($signed($signed(reg95[(4'h9):(3'h6)]))));
  assign wire132 = $unsigned($signed($signed({((8'hb8) ? wire93 : wire129)})));
  assign wire133 = wire36;
  always
    @(posedge clk) begin
      if ((wire132[(4'hd):(3'h5)] < {(~$signed(wire34[(3'h5):(1'h0)])),
          {($signed((8'hbd)) ? {wire93} : (wire94 ? reg97 : reg96))}}))
        begin
          reg134 <= wire89;
        end
      else
        begin
          if ((^~((wire132 == $unsigned((wire89 ? reg134 : wire133))) | {wire51,
              $signed({wire129})})))
            begin
              reg134 <= (8'hbf);
              reg135 <= (-(wire33 << ($signed(wire54[(1'h0):(1'h0)]) ?
                  ($signed(wire36) + wire37[(2'h2):(1'h0)]) : wire87[(4'hd):(3'h6)])));
              reg136 <= reg135;
              reg137 <= wire131[(3'h5):(2'h2)];
            end
          else
            begin
              reg134 <= wire54;
              reg135 <= {$unsigned(({wire53} != (+(wire94 ?
                      wire51 : wire34))))};
              reg136 <= $signed(reg134[(2'h2):(1'h0)]);
              reg137 <= (+wire133);
            end
          reg138 <= wire129[(1'h0):(1'h0)];
          if (wire53)
            begin
              reg139 <= wire54;
            end
          else
            begin
              reg139 <= ((&(~^$unsigned(((7'h43) ?
                  reg138 : (7'h44))))) & $signed((8'hbd)));
              reg140 <= $signed($unsigned(($signed(wire53) >> (+(wire133 ?
                  wire131 : wire94)))));
              reg141 <= (((((wire90 > wire53) ?
                      (wire92 - (8'hb8)) : wire89[(3'h7):(1'h1)]) ~^ reg136[(1'h0):(1'h0)]) ?
                  (^((reg135 ? wire91 : wire94) ~^ {reg95,
                      (7'h41)})) : reg139[(4'h9):(3'h6)]) | $signed(((!(reg139 ?
                  (8'hbc) : reg135)) ^ ((reg139 ?
                  (7'h40) : (7'h42)) < $signed(wire37)))));
              reg142 <= reg138;
            end
        end
      if (wire87)
        begin
          reg143 <= ($signed(reg135[(4'hd):(2'h3)]) & ($signed($unsigned((reg142 ?
              wire36 : wire129))) - $unsigned(((wire35 ?
              wire90 : reg142) << wire132))));
          reg144 <= (($signed(((wire91 ? wire94 : wire34) ?
                      $unsigned(reg142) : wire36)) ?
                  $unsigned($signed($signed(reg140))) : (8'hb5)) ?
              $unsigned($unsigned($unsigned((8'haf)))) : {(+$unsigned((wire34 ?
                      wire94 : reg96)))});
          reg145 <= ((~|$unsigned($unsigned(wire87[(3'h4):(1'h0)]))) != reg140[(3'h5):(2'h2)]);
          if ((+(&$signed(wire34))))
            begin
              reg146 <= $signed($unsigned((^$unsigned((wire33 ?
                  reg139 : (8'ha9))))));
              reg147 <= wire34[(1'h1):(1'h1)];
              reg148 <= ((8'hbf) ?
                  ($unsigned((8'hbf)) ?
                      (((reg143 ? (8'ha7) : wire36) >> (wire33 - wire36)) ?
                          reg135 : {$unsigned((8'hba)),
                              (wire94 ?
                                  reg146 : reg135)}) : (-$unsigned({(7'h41),
                          reg141}))) : {{$unsigned($unsigned(wire131)),
                          (reg147[(2'h2):(1'h1)] * wire89[(3'h5):(1'h1)])},
                      {($unsigned(reg134) <= (reg134 * (8'hbc))),
                          ($unsigned(wire132) && reg138[(1'h1):(1'h0)])}});
              reg149 <= (~&$signed($signed((reg138[(3'h4):(2'h3)] && (~(8'hb7))))));
              reg150 <= (~((($unsigned(wire37) ^ reg135) < ($signed((7'h41)) ?
                      (reg139 & wire129) : wire133)) ?
                  (({reg139} ? wire90[(1'h1):(1'h0)] : $unsigned(reg137)) ?
                      (~&(wire53 >>> wire90)) : ($unsigned(reg148) ?
                          reg148[(3'h4):(3'h4)] : $signed(wire37))) : $signed($signed($signed(wire33)))));
            end
          else
            begin
              reg146 <= wire35;
              reg147 <= (+((reg140 ?
                      wire89 : ((reg141 ? wire93 : wire54) || (~&(8'hb8)))) ?
                  (reg141[(1'h0):(1'h0)] ~^ {$signed(reg149)}) : (~|(~|{reg144,
                      wire131}))));
              reg148 <= wire37;
              reg149 <= reg137;
              reg150 <= (reg143[(3'h4):(3'h4)] >= (reg141 ?
                  $signed(((wire87 > wire36) ?
                      $unsigned(reg148) : (&reg95))) : reg144));
            end
          reg151 <= ({$unsigned($signed(reg95[(4'h8):(2'h3)])),
              $signed(reg141[(3'h6):(3'h6)])} > ((|$signed($signed(wire129))) ?
              (wire94[(3'h6):(3'h5)] + wire90) : reg96));
        end
      else
        begin
          reg143 <= (&(^~((^$signed(reg144)) - {wire132[(4'he):(2'h2)],
              reg150[(4'hc):(3'h5)]})));
        end
      reg152 <= ((reg149 ?
          reg141 : (reg148 ?
              (reg147[(4'h8):(1'h1)] ?
                  wire92 : $signed((8'h9e))) : $unsigned((~|reg97)))) ~^ (!wire89));
      reg153 <= (~(wire93[(3'h5):(3'h5)] > $unsigned(reg136)));
      if ({$unsigned(reg149[(2'h2):(1'h0)])})
        begin
          reg154 <= wire129[(1'h0):(1'h0)];
        end
      else
        begin
          reg154 <= $unsigned($unsigned((((^reg135) & (wire37 ?
                  reg143 : reg141)) ?
              (+(^~wire129)) : (8'hba))));
          if (wire35[(3'h5):(3'h5)])
            begin
              reg155 <= (-reg149);
              reg156 <= ($signed({(8'h9c),
                      ((reg140 ? reg95 : (8'h9d)) > $unsigned((8'haf)))}) ?
                  reg152 : (|(7'h44)));
            end
          else
            begin
              reg155 <= (reg134 & reg146[(3'h6):(3'h6)]);
              reg156 <= (reg153[(3'h4):(3'h4)] && wire35[(5'h12):(4'h8)]);
            end
          reg157 <= (8'hbb);
        end
    end
endmodule

module module14
#(parameter param26 = ((+((((8'ha4) ? (8'h9f) : (8'hab)) >> (8'hbe)) << (((8'haf) ? (8'h9c) : (8'ha9)) ? (|(8'had)) : {(8'haa)}))) || (({{(7'h43)}} > ((|(8'hb1)) || (-(7'h44)))) ? ((8'hbb) ? (-((8'ha5) ? (8'ha8) : (7'h43))) : ({(8'hb6), (8'h9c)} - ((8'ha8) ? (8'h9d) : (8'ha8)))) : (&(~^((8'ha6) << (8'h9c)))))), 
parameter param27 = {((!({param26} * param26)) ? param26 : (!param26))})
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  assign y = {wire25, wire24, wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = wire17[(3'h4):(3'h4)];
  assign wire20 = wire16;
  assign wire21 = (~^(((8'haf) > $signed($unsigned(wire18))) & wire17[(2'h3):(2'h3)]));
  assign wire22 = ((^$signed(((8'hbb) ~^ $signed(wire17)))) ?
                      wire19 : (~(~&$unsigned((wire20 ? wire17 : wire19)))));
  assign wire23 = ((^~(wire22[(3'h7):(2'h2)] - ((wire16 ?
                      (8'h9e) : wire18) != wire16[(1'h1):(1'h1)]))) << (wire19 <<< $signed($unsigned($unsigned((8'ha2))))));
  assign wire24 = wire17;
  assign wire25 = ({(wire18[(2'h3):(1'h0)] | {(wire15 ^ wire21)}),
                      (($unsigned(wire22) ?
                              $unsigned(wire22) : wire15[(2'h2):(1'h0)]) ?
                          ($unsigned(wire23) > $signed(wire18)) : (~$signed(wire18)))} << (~|wire17[(3'h4):(3'h4)]));
endmodule

module module98
#(parameter param127 = (+{((8'hb2) ? (|{(8'hab), (8'h9d)}) : {((8'ha8) ? (8'hbd) : (8'hbc)), ((8'ha9) ^ (8'hb8))})}), 
parameter param128 = ((((~|(^(8'haf))) ? ((param127 < param127) ? {(8'hbe)} : param127) : (8'hb0)) - (8'ha8)) & ((((param127 ? (8'haa) : param127) ~^ (8'ha7)) - ((!(8'hb9)) ? param127 : (param127 ? param127 : (8'hb1)))) ? (^{(~&param127), param127}) : (((7'h41) ? {param127, param127} : (param127 << param127)) - (~^(param127 ? param127 : (8'hbc)))))))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire103;
  input wire signed [(2'h3):(1'h0)] wire102;
  input wire signed [(5'h14):(1'h0)] wire101;
  input wire signed [(5'h11):(1'h0)] wire100;
  input wire signed [(4'h9):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(4'h9):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire104;
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire105,
                 wire104,
                 reg122,
                 reg121,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire104 = (+(wire99 ?
                       (^(^~((8'haa) >>> wire101))) : $signed($unsigned({wire99}))));
  assign wire105 = ($unsigned((!$unsigned($unsigned((8'hbb))))) ?
                       $unsigned((&wire104[(2'h3):(2'h3)])) : $signed($unsigned(((wire99 >>> wire101) ~^ (wire104 ^ wire102)))));
  always
    @(posedge clk) begin
      reg106 <= $unsigned(wire103);
      reg107 <= wire100[(3'h4):(1'h1)];
      reg108 <= (~&reg106);
      reg109 <= $unsigned((8'ha0));
      reg110 <= reg108[(1'h1):(1'h1)];
    end
  assign wire111 = (({(wire105 * (wire102 >> wire99)),
                       (~&reg108[(1'h0):(1'h0)])} == ($unsigned(reg110) > $signed((|reg109)))) == {$signed($signed({reg107})),
                       reg107});
  assign wire112 = (7'h41);
  assign wire113 = (wire112[(4'ha):(3'h7)] >= $signed({$signed({reg108,
                           wire99}),
                       $signed($unsigned(wire104))}));
  assign wire114 = wire112;
  assign wire115 = wire100;
  assign wire116 = reg106;
  assign wire117 = ($unsigned(((~^$signed(reg108)) >> $signed((-wire111)))) > (($unsigned($unsigned(reg109)) ?
                           (wire103 ?
                               $unsigned(wire104) : $signed((8'hb4))) : ($unsigned(wire102) ?
                               (^~wire112) : wire116[(3'h6):(3'h5)])) ?
                       $signed(wire99) : (~|reg110[(2'h3):(1'h0)])));
  assign wire118 = ((-(reg109 ? $signed(wire100) : (|{wire113, wire103}))) ?
                       (wire114 ?
                           {({(8'hbe)} ? wire105[(2'h3):(1'h1)] : (|wire116)),
                               reg107} : ((~|$signed(wire105)) >> $signed((&wire100)))) : wire117);
  assign wire119 = $signed((wire102[(2'h2):(1'h0)] >>> wire103));
  assign wire120 = wire117[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg121 <= (reg106 ?
          (reg110 ?
              wire100 : (wire114 & (-(wire112 ?
                  wire99 : wire114)))) : (((^wire101[(5'h12):(5'h12)]) == {(wire100 | wire112)}) ?
              (wire104[(2'h3):(2'h2)] ?
                  ((^~wire112) >> (wire120 ?
                      wire114 : wire105)) : {(~^wire111)}) : $signed(reg110)));
      reg122 <= {{(wire116[(1'h1):(1'h0)] || reg109),
              ((!((7'h41) < wire116)) ^ ($unsigned(wire116) ?
                  $unsigned(reg109) : (reg109 ? reg110 : wire114)))},
          $signed((wire104[(2'h2):(1'h1)] >= $signed((wire114 << (8'ha1)))))};
    end
  assign wire123 = ($signed((-$unsigned((reg106 ? (8'ha9) : (7'h42))))) ?
                       (8'ha6) : ((reg106[(2'h2):(2'h2)] ?
                               reg122 : (^(reg121 & wire113))) ?
                           ($signed({reg122,
                               reg110}) + wire101) : ($signed($signed((7'h42))) ?
                               ({wire116, reg109} - ((8'ha5) ?
                                   wire119 : wire103)) : $unsigned(wire116))));
  assign wire124 = wire104;
  assign wire125 = reg122;
  assign wire126 = $unsigned(($signed((|((8'ha4) ? wire115 : wire105))) ?
                       ($unsigned((wire119 ?
                           wire117 : wire103)) & {(8'haa)}) : wire104));
endmodule

module module55  (y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire60;
  input wire [(5'h10):(1'h0)] wire59;
  input wire [(3'h4):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  input wire [(2'h2):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire69,
                 wire68,
                 wire67,
                 wire62,
                 wire61,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire61 = wire58[(3'h4):(1'h0)];
  assign wire62 = ($signed($unsigned((~^wire59[(3'h6):(2'h3)]))) == $signed(wire57));
  always
    @(posedge clk) begin
      reg63 <= wire62;
      reg64 <= {(^~(!wire58)), $signed(wire60[(3'h5):(1'h1)])};
      reg65 <= wire59;
      reg66 <= $unsigned((reg65[(4'ha):(4'ha)] - {(|(wire57 <= reg65))}));
    end
  assign wire67 = (8'hab);
  assign wire68 = $unsigned(($signed($unsigned($unsigned(wire61))) ?
                      {($unsigned(wire62) < $signed(wire56)),
                          wire56[(1'h1):(1'h1)]} : ($signed((wire61 >> wire61)) & $signed((wire62 || (8'haf))))));
  assign wire69 = $signed(wire57);
  always
    @(posedge clk) begin
      if ($signed($signed({reg65[(3'h4):(2'h3)], reg66})))
        begin
          reg70 <= ((&wire56[(2'h2):(2'h2)]) & reg65[(3'h4):(2'h2)]);
        end
      else
        begin
          if ({reg70})
            begin
              reg70 <= wire56[(1'h1):(1'h1)];
              reg71 <= wire61[(2'h2):(1'h1)];
            end
          else
            begin
              reg70 <= $signed(reg63[(2'h2):(1'h1)]);
              reg71 <= wire60[(3'h7):(3'h6)];
              reg72 <= $signed($signed(wire59[(4'h8):(3'h4)]));
              reg73 <= $unsigned(((((reg65 ? wire61 : (8'hae)) ?
                      {reg63, wire56} : wire59) ~^ $unsigned({wire59,
                      wire56})) ?
                  (($signed(wire60) | reg66) == $unsigned(reg72[(3'h4):(2'h3)])) : (8'hae)));
              reg74 <= (|({(~|$signed((8'h9d))),
                  wire62[(1'h0):(1'h0)]} || reg73));
            end
          reg75 <= reg65[(4'hd):(4'h9)];
          reg76 <= $unsigned(($unsigned($signed({wire62, wire57})) ?
              ($unsigned((~^wire69)) || wire56) : (7'h42)));
          if ((((+$signed($signed((8'ha3)))) == $signed((^(|wire67)))) ?
              (($unsigned(reg76[(4'h8):(2'h3)]) ?
                  (reg66[(3'h7):(1'h0)] << $signed(wire59)) : $unsigned((7'h44))) || (&(8'hab))) : (wire57 ?
                  (8'h9f) : (!({reg73} ?
                      (reg74 ? (8'hb2) : wire56) : (^wire59))))))
            begin
              reg77 <= reg75[(3'h4):(1'h0)];
              reg78 <= wire68[(1'h0):(1'h0)];
              reg79 <= (^(8'ha6));
            end
          else
            begin
              reg77 <= reg64;
              reg78 <= (~|((~^wire69[(4'hc):(3'h4)]) ?
                  $unsigned(((wire60 ^~ reg66) ?
                      (wire69 ^ wire57) : ((8'ha4) ?
                          reg65 : reg63))) : (~&reg65)));
              reg79 <= reg63[(1'h1):(1'h1)];
              reg80 <= $unsigned($signed(reg79));
            end
        end
      reg81 <= (-reg77);
      reg82 <= (|($unsigned(({reg71} ?
          {reg77, reg78} : $unsigned(wire58))) < reg71[(1'h1):(1'h0)]));
    end
  assign wire83 = (8'haa);
  assign wire84 = (!(wire69 ?
                      ((!wire59) ?
                          ($unsigned((8'ha6)) * $signed((8'hbf))) : ((reg74 ?
                              reg79 : wire69) <<< $signed(reg79))) : (reg79 * $signed(wire58[(2'h3):(2'h2)]))));
  assign wire85 = $unsigned({(reg82[(5'h10):(3'h6)] ?
                          $unsigned((wire67 ?
                              wire68 : wire56)) : $unsigned(wire69[(2'h3):(2'h2)]))});
  assign wire86 = reg74[(2'h2):(1'h0)];
endmodule

module module38
#(parameter param50 = ({(^{{(8'h9f), (8'hab)}})} < ({(((8'hb7) >>> (8'haa)) < (-(8'ha0))), ((^~(8'haf)) | {(7'h44), (7'h44)})} ? (8'hbf) : ((((8'ha8) ? (8'ha5) : (8'ha0)) * ((8'ha8) ? (8'hb7) : (8'hbc))) < (^((8'h9c) ^ (8'hbb)))))))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire43;
  input wire [(4'hd):(1'h0)] wire42;
  input wire signed [(3'h5):(1'h0)] wire41;
  input wire [(2'h3):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire44;
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  assign y = {wire49, wire48, wire44, reg47, reg46, reg45, (1'h0)};
  assign wire44 = wire43[(4'hc):(4'h9)];
  always
    @(posedge clk) begin
      reg45 <= (~^((!wire44[(1'h0):(1'h0)]) >>> {wire40[(2'h3):(1'h0)]}));
      reg46 <= ($signed($unsigned($unsigned((wire39 | (8'hbe))))) ?
          (8'had) : ($unsigned(reg45[(3'h5):(2'h3)]) ^~ (wire42[(4'h9):(3'h6)] ^ (wire39 ?
              wire39 : $signed((8'hbc))))));
      reg47 <= $unsigned(($unsigned({wire42}) && ($signed(wire42) >= $unsigned($unsigned(wire43)))));
    end
  assign wire48 = (^$unsigned($unsigned(({wire41,
                      wire39} ~^ wire40[(2'h2):(1'h0)]))));
  assign wire49 = reg45;
endmodule
