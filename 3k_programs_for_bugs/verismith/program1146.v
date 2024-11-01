module top
#(parameter param176 = {({({(8'hbf), (8'ha4)} + ((8'ha2) != (8'ha2)))} + (&(~|(&(8'hb5)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire175;
  wire signed [(4'hd):(1'h0)] wire174;
  wire signed [(5'h14):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire signed [(4'hc):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire168;
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire5,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire168,
                 reg22,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (!((|(^~(wire4 ? wire4 : wire4))) >= $signed($signed({(8'haf),
                     wire2}))));
  always
    @(posedge clk) begin
      reg6 <= (((($signed((7'h44)) ^~ (wire4 ~^ (8'hbc))) <= $signed((~|wire3))) ?
              ($signed({wire0}) >> $signed((wire1 | wire2))) : wire5) ?
          (wire5[(2'h2):(2'h2)] ?
              (($unsigned(wire0) ?
                  (8'hb1) : wire2[(2'h2):(1'h0)]) != wire5[(3'h5):(1'h0)]) : {wire2[(3'h6):(3'h4)],
                  $signed(wire1[(1'h1):(1'h1)])}) : $unsigned({(~|wire0),
              ($signed((8'hb0)) ? $signed(wire2) : wire1[(4'hc):(1'h0)])}));
      reg7 <= $unsigned((((~&(wire0 ? wire4 : wire0)) - $signed((wire5 ?
              reg6 : wire3))) ?
          wire1[(4'hb):(4'h8)] : ((wire3 ^~ {wire2,
              reg6}) >= $signed(wire4[(2'h2):(1'h1)]))));
      reg8 <= wire0[(1'h0):(1'h0)];
      if ($unsigned($signed(($signed((+wire3)) ?
          wire1 : ((wire4 <= reg7) ? $unsigned(wire1) : wire0)))))
        begin
          reg9 <= (reg6 ?
              reg7[(1'h0):(1'h0)] : $unsigned(wire3[(4'hb):(3'h5)]));
          reg10 <= $signed((~|$unsigned(($signed(wire0) - reg8))));
          reg11 <= (wire3 ? {(+(~&(reg9 >> reg8)))} : (^reg6));
          reg12 <= $unsigned($unsigned($signed({(|(8'hb1)), $signed(wire0)})));
          reg13 <= wire2[(4'h9):(3'h7)];
        end
      else
        begin
          if ((!$signed($unsigned($signed($unsigned(reg8))))))
            begin
              reg9 <= (^wire0[(2'h3):(1'h1)]);
              reg10 <= (+$signed(reg11[(1'h0):(1'h0)]));
              reg11 <= (~|wire2);
              reg12 <= (&reg9[(4'h9):(1'h1)]);
              reg13 <= ((($unsigned({(8'ha4)}) ?
                      reg7[(4'hc):(3'h7)] : {(~^reg6)}) | reg13[(3'h5):(2'h2)]) ?
                  $signed((wire5 <= {wire0,
                      (~&wire2)})) : $unsigned(($unsigned((^reg8)) ?
                      $unsigned(((8'hb8) ? wire5 : wire5)) : wire0)));
            end
          else
            begin
              reg9 <= (~&(($unsigned($signed(reg12)) ?
                  $signed(wire2[(1'h1):(1'h1)]) : reg6) - $signed(((reg9 * reg8) ?
                  (~reg10) : (~|wire4)))));
              reg10 <= wire3[(3'h5):(1'h0)];
              reg11 <= $signed(reg13);
              reg12 <= {(((+reg6[(4'hd):(4'hc)]) ?
                          {wire3} : (+(wire1 ? reg12 : wire1))) ?
                      reg7 : {wire1[(4'hc):(1'h1)]})};
            end
        end
      reg14 <= reg7;
    end
  assign wire15 = $unsigned((+(|$signed(reg8[(3'h4):(1'h0)]))));
  assign wire16 = wire3;
  assign wire17 = wire2;
  assign wire18 = wire0;
  assign wire19 = reg6[(4'hd):(1'h1)];
  assign wire20 = ($unsigned(wire3[(3'h7):(3'h4)]) <= ($unsigned($signed(wire2[(4'h8):(1'h0)])) ?
                      $signed(($unsigned(wire4) ~^ (wire15 << wire3))) : {(|wire1[(3'h6):(3'h4)]),
                          (&wire3)}));
  assign wire21 = {{($unsigned(wire16) >>> wire3), reg14[(1'h1):(1'h1)]}};
  always
    @(posedge clk) begin
      reg22 <= ($signed(($unsigned(((7'h41) || wire21)) ?
              ((wire15 ~^ reg11) ? (reg6 ? reg10 : wire15) : reg14) : ((reg13 ?
                      wire2 : wire21) ?
                  $unsigned(reg6) : (wire4 < (8'ha7))))) ?
          reg9[(3'h7):(3'h5)] : reg13);
    end
  assign wire23 = (^~$signed({(!{reg11}), wire18[(1'h0):(1'h0)]}));
  assign wire24 = ($signed((~^reg6[(3'h6):(1'h0)])) >> {{(+(wire23 ?
                              (8'haf) : wire17))}});
  assign wire25 = wire18[(2'h3):(1'h1)];
  assign wire26 = reg6[(2'h3):(1'h1)];
  module27 #() modinst169 (wire168, clk, wire24, reg12, wire4, reg22, wire17);
  assign wire170 = $signed({reg8});
  assign wire171 = {reg9[(4'ha):(1'h1)], (&reg14[(2'h2):(1'h0)])};
  assign wire172 = $unsigned(($unsigned(reg13) ?
                       $unsigned((-$signed(wire170))) : (wire4[(4'h9):(4'h8)] ?
                           ((~&reg10) ?
                               wire18[(1'h1):(1'h1)] : (~wire15)) : (-(~^wire2)))));
  assign wire173 = wire17;
  assign wire174 = {{$signed($signed((~|wire5)))}};
  assign wire175 = $signed((($unsigned((wire25 ^ (8'ha4))) > ((wire15 >> reg10) ?
                       (+wire2) : wire1)) == $unsigned($signed((wire170 ?
                       wire18 : wire24)))));
endmodule

module module27
#(parameter param167 = (~&({(|((7'h43) ^ (8'hb5))), (((8'hb0) <= (8'hb0)) ? (~|(7'h43)) : ((8'ha2) || (8'hb0)))} * (({(8'ha6), (8'hb6)} <<< (~(8'ha5))) ^ (|((8'hab) ? (8'h9e) : (8'h9f)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(3'h7):(1'h0)] wire29;
  input wire [(3'h5):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire165;
  wire [(3'h4):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire129;
  wire [(5'h10):(1'h0)] wire128;
  wire [(4'hb):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  assign y = {wire165,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire122,
                 wire121,
                 wire119,
                 wire102,
                 wire100,
                 wire35,
                 wire34,
                 reg33,
                 reg123,
                 reg124,
                 reg125,
                 reg133,
                 reg134,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= (wire31 && ($unsigned($signed($signed(wire28))) ?
          ((&(wire31 ? wire32 : wire29)) ?
              $unsigned((wire29 + wire31)) : $signed((wire31 != wire31))) : (wire32 * wire28)));
    end
  assign wire34 = reg33;
  assign wire35 = wire28[(3'h5):(2'h2)];
  module36 #() modinst101 (.clk(clk), .y(wire100), .wire39(wire32), .wire40(wire35), .wire37(wire30), .wire38(wire34));
  assign wire102 = $signed(($signed(((wire31 ~^ (8'ha3)) ?
                       $signed((8'hb0)) : {wire100})) && {(wire32 == (|wire28)),
                       (|{wire29, wire29})}));
  module103 #() modinst120 (wire119, clk, wire100, wire30, wire31, wire102);
  assign wire121 = $unsigned(wire29[(1'h1):(1'h1)]);
  assign wire122 = {(wire34[(4'he):(4'ha)] ?
                           $signed({wire28[(1'h1):(1'h0)]}) : ((^~$unsigned(wire35)) && $unsigned((|wire32)))),
                       ((wire34 ?
                           (wire28[(2'h2):(1'h0)] && wire102) : $signed((wire29 ?
                               wire100 : wire28))) == (~|wire35[(3'h4):(2'h2)]))};
  always
    @(posedge clk) begin
      reg123 <= $signed(wire119);
      reg124 <= $signed(wire122);
      reg125 <= $unsigned(reg123);
    end
  assign wire126 = wire121[(4'ha):(1'h1)];
  assign wire127 = wire28[(3'h4):(2'h2)];
  assign wire128 = reg125[(4'ha):(3'h5)];
  assign wire129 = $unsigned(wire29);
  assign wire130 = wire100[(4'he):(2'h2)];
  assign wire131 = {($unsigned($unsigned((wire35 & wire126))) ~^ $signed(($signed(wire127) ?
                           (wire31 >> wire31) : ((8'haf) ? wire128 : reg124)))),
                       wire127[(1'h0):(1'h0)]};
  assign wire132 = (((reg124 != (wire128[(4'hf):(3'h6)] && {wire127,
                               wire131})) ?
                           (~&($signed((8'hb7)) >= (wire126 || (8'hb3)))) : ((|{wire130,
                               wire126}) >>> (+$signed(wire131)))) ?
                       $unsigned((((wire100 ?
                               (8'ha5) : wire121) <= $unsigned(wire100)) ?
                           (wire30[(4'ha):(4'h8)] ^ (wire30 ?
                               wire119 : reg123)) : (-$signed(wire29)))) : (-wire35));
  always
    @(posedge clk) begin
      reg133 <= wire35;
      reg134 <= wire119;
    end
  module135 #() modinst166 (wire165, clk, wire32, reg133, wire131, wire29, wire126);
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire140;
  input wire signed [(4'ha):(1'h0)] wire139;
  input wire [(5'h12):(1'h0)] wire138;
  input wire [(3'h7):(1'h0)] wire137;
  input wire signed [(5'h15):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire141;
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg142 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire141,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 (1'h0)};
  assign wire141 = {wire136[(4'hd):(3'h6)]};
  always
    @(posedge clk) begin
      if ((+((~|((wire140 ?
          (8'hba) : wire140) >>> (~wire138))) >= $unsigned(wire141[(5'h10):(3'h4)]))))
        begin
          reg142 <= wire141[(3'h4):(1'h0)];
          reg143 <= wire140[(5'h10):(4'hd)];
          reg144 <= (reg143 < ((&wire140) >> $signed($signed(wire138[(2'h3):(2'h3)]))));
          if ((~&reg143[(1'h1):(1'h0)]))
            begin
              reg145 <= wire136;
              reg146 <= $unsigned(wire137);
              reg147 <= $unsigned(wire139[(1'h1):(1'h1)]);
              reg148 <= (+wire141);
            end
          else
            begin
              reg145 <= ($unsigned((+{$unsigned(wire137),
                      (wire136 ? reg142 : wire136)})) ?
                  reg148 : $unsigned((8'hb6)));
              reg146 <= ((^~((wire139 ?
                  (reg147 <<< wire141) : (reg148 ~^ (8'hbe))) >>> $unsigned($unsigned(wire141)))) | wire137[(3'h4):(3'h4)]);
              reg147 <= wire138;
              reg148 <= ($unsigned($unsigned(wire141)) != wire141);
            end
        end
      else
        begin
          reg142 <= $unsigned(($unsigned((~|(wire140 ? reg146 : reg145))) ?
              reg142 : ((^$unsigned(reg146)) ?
                  (wire138 >>> (reg143 > reg144)) : (reg143[(3'h4):(1'h0)] * $unsigned(reg145)))));
          if ((7'h42))
            begin
              reg143 <= $unsigned(($signed((!(~|reg146))) ?
                  wire141[(4'hd):(4'hb)] : reg142[(3'h5):(1'h1)]));
              reg144 <= wire137[(3'h4):(2'h2)];
              reg145 <= reg144;
            end
          else
            begin
              reg143 <= ({(((reg145 ? wire136 : wire137) ?
                      $unsigned(wire139) : {reg143}) >>> $signed(reg148[(3'h7):(2'h3)])),
                  (~^(reg146 ? reg142[(3'h7):(3'h5)] : {(7'h40)}))} ^ reg146);
              reg144 <= $unsigned(reg142[(2'h2):(2'h2)]);
              reg145 <= $unsigned(wire136[(5'h15):(4'he)]);
              reg146 <= reg144;
            end
        end
      reg149 <= (-(~&$signed(({wire141, wire140} ?
          $signed(wire136) : (wire139 << wire136)))));
      reg150 <= ($unsigned({(reg149 && (!(8'ha3))), (|reg144)}) ?
          $signed({((~reg143) ?
                  $signed(reg147) : (!reg145))}) : $signed(((wire138 ?
                  (wire136 ? wire138 : reg147) : (~|wire137)) ?
              reg144 : $signed((8'hbf)))));
      if (((((wire141[(2'h3):(2'h2)] ^~ reg148[(1'h0):(1'h0)]) || reg149[(5'h13):(4'ha)]) ?
              wire137[(3'h4):(1'h1)] : $signed(wire141[(2'h2):(1'h1)])) ?
          (reg147 ?
              $signed($unsigned($signed(wire140))) : (wire136 ?
                  $unsigned(wire141) : (reg147[(1'h1):(1'h1)] != (~reg144)))) : $signed($signed($unsigned({reg142,
              wire140})))))
        begin
          reg151 <= (wire136[(2'h2):(1'h1)] <<< $signed($unsigned((~(reg147 ?
              (8'ha3) : reg149)))));
        end
      else
        begin
          reg151 <= (reg143 ?
              reg148 : ($signed(($unsigned((8'hbf)) ?
                  (reg146 << reg149) : $unsigned((8'hb1)))) ~^ $unsigned($signed($unsigned(wire140)))));
          reg152 <= reg144;
          reg153 <= (|((^$unsigned(wire138[(4'hd):(4'h9)])) ^~ $signed(($unsigned((8'hbe)) ?
              (wire138 ? wire140 : reg144) : (wire141 ? reg148 : (8'hbb))))));
          reg154 <= (($signed(($signed((8'hb5)) ?
                      (wire138 ? (8'hae) : wire138) : (reg147 ?
                          reg142 : reg150))) ?
                  reg153[(4'hd):(3'h5)] : (reg152 == (wire141 ?
                      {reg148, (8'h9e)} : $unsigned(reg151)))) ?
              (reg142[(3'h5):(1'h0)] > reg151) : reg145[(4'hb):(3'h4)]);
          reg155 <= reg148;
        end
    end
  assign wire156 = ($signed(reg143) ?
                       $signed((-$signed({reg143}))) : $signed(reg154));
  assign wire157 = (($unsigned({reg147}) ?
                       (-($signed((8'h9d)) < $unsigned(reg145))) : (~($unsigned(reg145) >= $unsigned(reg144)))) << ((^$unsigned((~^reg144))) ^ wire156));
  always
    @(posedge clk) begin
      reg158 <= $signed((~^wire140));
      reg159 <= wire136[(3'h6):(2'h3)];
      reg160 <= $unsigned((!reg144[(3'h4):(1'h1)]));
      if ((&((({wire138} <<< $unsigned(reg159)) ?
          (8'h9e) : ($signed((8'haf)) ?
              ((8'hbb) ? (8'ha1) : reg158) : (reg152 ^ reg147))) - reg148)))
        begin
          if ($signed(((wire141 ? (|reg159) : (-wire136)) + (-((&(8'hb3)) ?
              ((8'h9c) || wire156) : (reg151 || (7'h42)))))))
            begin
              reg161 <= reg154;
            end
          else
            begin
              reg161 <= {{(7'h42),
                      (|{$signed(wire157), ((8'ha2) ? reg160 : wire156)})},
                  {($unsigned({wire139, wire156}) >= reg142),
                      (((reg158 ?
                          reg154 : wire156) <= wire141[(5'h13):(4'ha)]) <= {$unsigned(reg150)})}};
              reg162 <= {reg158[(3'h4):(3'h4)], reg150};
            end
          reg163 <= $signed({$signed($signed((+reg146)))});
        end
      else
        begin
          reg161 <= ((~{$unsigned((wire137 ? reg150 : reg159))}) ?
              $signed({wire136,
                  (reg148 == (-reg144))}) : (^~$unsigned($signed((|wire136)))));
          reg162 <= (!(reg163 == $signed(((wire141 | reg146) ?
              (&reg148) : $signed((8'h9f))))));
        end
      reg164 <= $unsigned({{(wire137 ? {reg159} : $unsigned(wire136)),
              ({reg153} ? (reg144 ? wire139 : reg163) : $unsigned(reg151))},
          ($signed(reg150[(5'h10):(4'h9)]) + {wire138[(3'h6):(1'h1)]})});
    end
endmodule

module module103
#(parameter param117 = ((((~&((8'ha1) >> (8'hbf))) || (^~((8'hb8) ^ (8'hb6)))) ? (((&(8'hb2)) ? ((8'ha6) ? (8'ha1) : (8'ha9)) : ((7'h41) ? (8'hb4) : (8'haf))) ? (((8'ha9) ? (8'hb0) : (7'h41)) >>> (|(8'hb2))) : ((!(8'hbc)) && {(8'ha6), (8'ha9)})) : ((((7'h40) ? (7'h43) : (8'hac)) ? ((8'ha5) ? (8'hbe) : (7'h42)) : {(8'hb1), (8'ha3)}) | (((7'h42) ? (8'hae) : (8'hb3)) * {(7'h41)}))) != (~(|({(8'ha5)} ? (~^(8'ha6)) : (!(8'hbe)))))), 
parameter param118 = (|param117))
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire107;
  input wire signed [(4'ha):(1'h0)] wire106;
  input wire [(3'h4):(1'h0)] wire105;
  input wire signed [(3'h6):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire110,
                 wire109,
                 wire108,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire108 = (^wire106[(3'h4):(1'h0)]);
  assign wire109 = $unsigned((^~($signed($unsigned(wire104)) ?
                       ((wire104 ? wire105 : wire107) ?
                           $signed(wire107) : (8'hab)) : (wire108 ?
                           $signed(wire105) : $unsigned(wire105)))));
  assign wire110 = wire105[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg111 <= wire110;
      reg112 <= $signed($unsigned(wire106[(1'h1):(1'h0)]));
    end
  assign wire113 = $signed(wire104);
  assign wire114 = ((wire105[(3'h4):(3'h4)] >>> ((^~wire110[(4'hd):(4'hb)]) ?
                           (-(reg112 <= wire108)) : (wire106 ?
                               $signed(wire108) : (+wire106)))) ?
                       reg112[(2'h2):(1'h0)] : wire109[(3'h4):(2'h3)]);
  assign wire115 = ((~|(^$signed({wire107, (8'had)}))) ~^ ((7'h42) ?
                       $unsigned(($signed((8'hb3)) ?
                           (wire107 + wire105) : (reg111 != reg112))) : wire105));
  assign wire116 = $signed((-$signed((wire113[(3'h4):(3'h4)] ?
                       {wire108} : $unsigned(wire110)))));
endmodule

module module36
#(parameter param99 = (&(+(~^((^~(7'h43)) ? (^~(8'hb8)) : ((8'hbb) != (8'ha4)))))))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h260):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire [(5'h15):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire50,
                 wire49,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~&(((wire37 >>> {(8'had), wire37}) ~^ (|(~|(8'ha2)))) ?
          (((8'hb9) - (^wire37)) != $signed((wire37 < (7'h44)))) : wire37[(4'hd):(4'h8)])))
        begin
          if ($signed($signed(wire37[(3'h7):(1'h1)])))
            begin
              reg41 <= wire39[(4'hb):(3'h4)];
            end
          else
            begin
              reg41 <= (wire38 ? {(|wire37)} : $unsigned(reg41[(3'h5):(3'h4)]));
              reg42 <= reg41[(5'h12):(4'he)];
              reg43 <= (wire39[(1'h0):(1'h0)] == wire40);
              reg44 <= wire37;
              reg45 <= {(+wire40)};
            end
          reg46 <= ($unsigned(((-$signed(reg44)) ^ ($unsigned(reg43) <= ((8'hab) == wire39)))) || (&wire38));
          reg47 <= wire37[(5'h12):(4'hf)];
        end
      else
        begin
          if ((&((((reg43 ?
                  wire39 : reg46) == $unsigned(wire37)) > $unsigned($signed(reg41))) ?
              $unsigned(reg45) : $signed(reg46))))
            begin
              reg41 <= reg44[(4'hc):(4'h8)];
            end
          else
            begin
              reg41 <= wire40[(3'h5):(1'h1)];
              reg42 <= $signed(reg47[(4'hc):(4'ha)]);
              reg43 <= reg41;
            end
          if ({{{(reg47 ? $signed(reg47) : reg43)}, {(7'h44), {(8'hba)}}}})
            begin
              reg44 <= reg41;
              reg45 <= {({(~|reg41[(5'h11):(2'h3)])} ?
                      ($unsigned($signed(wire39)) >> (reg44[(1'h0):(1'h0)] ?
                          (wire39 >>> wire38) : $unsigned(wire40))) : $unsigned({reg41[(4'hf):(4'hf)]}))};
              reg46 <= $signed(reg41[(5'h13):(5'h13)]);
            end
          else
            begin
              reg44 <= {$unsigned(($unsigned((&reg46)) <= (!$signed(wire37))))};
              reg45 <= ({reg44} ?
                  $unsigned(({(reg46 ? reg47 : reg44),
                      ((8'hb3) ? (8'hb9) : reg41)} - ($unsigned(reg44) ?
                      reg41[(3'h4):(1'h0)] : $signed((8'hbd))))) : reg47[(2'h2):(1'h1)]);
              reg46 <= wire39;
              reg47 <= wire38[(4'ha):(3'h6)];
            end
        end
      reg48 <= wire37[(2'h2):(2'h2)];
    end
  assign wire49 = (-(8'hb2));
  assign wire50 = (~(~&wire49));
  always
    @(posedge clk) begin
      if (({$signed((+$unsigned((7'h40)))), reg47} ?
          $signed((&(-{reg44,
              reg45}))) : $signed($unsigned($signed((reg44 | reg41))))))
        begin
          reg51 <= $unsigned($signed(reg44[(2'h3):(2'h3)]));
        end
      else
        begin
          reg51 <= $unsigned($signed(($unsigned((wire37 ~^ reg48)) ?
              wire40 : ((8'ha2) ? wire37[(4'hc):(3'h4)] : (&wire49)))));
          if ($unsigned(((wire49[(2'h3):(2'h3)] != reg43) | $unsigned(wire49))))
            begin
              reg52 <= $unsigned(wire39);
            end
          else
            begin
              reg52 <= $unsigned($signed((~&wire38[(4'h8):(3'h7)])));
              reg53 <= $signed(wire39[(4'hc):(3'h4)]);
              reg54 <= reg53;
              reg55 <= $unsigned(wire38[(4'h8):(1'h0)]);
              reg56 <= (reg52[(1'h0):(1'h0)] ^ $signed((($signed((7'h40)) & $unsigned(reg44)) ?
                  ({wire49, reg46} * $unsigned((8'ha6))) : wire40)));
            end
          reg57 <= (!((!((&reg43) ?
              ((8'hbf) || (8'ha5)) : (&wire37))) + $signed(reg41[(5'h12):(4'ha)])));
          reg58 <= reg57[(2'h2):(1'h0)];
          reg59 <= $unsigned($signed($signed((|reg54[(4'h9):(3'h6)]))));
        end
      if (reg46)
        begin
          reg60 <= $signed((($unsigned((reg53 - reg41)) ?
                  $unsigned(wire49) : reg58) ?
              wire49 : (wire40[(2'h3):(2'h2)] <<< $unsigned($signed((8'ha3))))));
          reg61 <= $unsigned(reg48);
          reg62 <= (reg46[(4'h9):(2'h2)] ?
              ((~&(!(reg41 > reg54))) ^ (reg55 << ({reg61,
                  reg44} == (!reg52)))) : wire37[(2'h3):(1'h1)]);
          if (reg56[(3'h5):(1'h1)])
            begin
              reg63 <= $signed((-({$unsigned((8'hb6)), (reg61 <<< wire50)} ?
                  (!(reg60 >>> (8'hbe))) : $signed((!reg56)))));
            end
          else
            begin
              reg63 <= $unsigned(((&(8'hb0)) ?
                  wire37[(1'h1):(1'h0)] : reg59[(3'h5):(1'h1)]));
              reg64 <= (({wire38} < ($signed((reg44 ? (7'h43) : reg59)) ?
                  (8'hbc) : {(~|(8'hb0))})) >> $signed(reg43));
              reg65 <= wire39;
              reg66 <= (^reg41);
              reg67 <= $unsigned($signed((((~&reg54) + reg53) << ($signed(reg44) ?
                  (~^(8'haf)) : reg56[(3'h7):(3'h4)]))));
            end
        end
      else
        begin
          reg60 <= (($signed(((~&reg54) ? reg41[(4'hf):(4'he)] : reg47)) ?
              (reg47[(3'h5):(3'h4)] ?
                  (-(reg54 ? wire38 : reg41)) : ({reg58} - {wire38,
                      wire37})) : ((&(reg62 != reg64)) ?
                  {$unsigned(reg48),
                      wire38[(5'h11):(4'hf)]} : $unsigned($unsigned(reg64)))) ^ $unsigned($unsigned(reg46)));
        end
      if (($signed($unsigned(reg41)) ?
          $unsigned(wire38[(2'h2):(2'h2)]) : ($unsigned(((&reg61) <<< (reg55 ?
              reg48 : reg44))) >> reg51[(1'h1):(1'h0)])))
        begin
          reg68 <= (((reg61 >= wire40[(3'h6):(2'h3)]) ?
                  (!(reg67[(3'h4):(3'h4)] ?
                      (|(8'ha4)) : (reg67 ?
                          reg65 : wire50))) : $unsigned($signed((reg42 << wire38)))) ?
              $signed({($unsigned((8'hb4)) ?
                      {reg47} : (8'h9c))}) : (reg59 > (($unsigned(reg58) ^ (reg65 ?
                      reg52 : (8'hb6))) ?
                  (~&reg55) : wire38[(4'h9):(3'h5)])));
          reg69 <= $signed((+(8'ha9)));
          reg70 <= reg56;
        end
      else
        begin
          reg68 <= {$unsigned(reg60)};
          reg69 <= reg70[(4'h8):(3'h5)];
          reg70 <= reg70[(1'h0):(1'h0)];
          reg71 <= (~^(^($signed((~&(8'hac))) ? $unsigned((^reg69)) : reg62)));
        end
    end
  always
    @(posedge clk) begin
      reg72 <= ((wire38[(5'h13):(5'h13)] >>> wire50) ^~ (^~(~|({reg58} ?
          $unsigned(reg59) : (~&reg64)))));
      reg73 <= (~&(^($unsigned((reg43 > reg42)) == ((reg59 <= reg58) ?
          $signed(reg46) : (~^wire38)))));
    end
  assign wire74 = (&($unsigned((((8'hb1) & reg60) & (^(8'ha3)))) | {(reg71 > reg60[(3'h4):(1'h0)])}));
  assign wire75 = $signed((reg42[(1'h0):(1'h0)] >>> (~^{$unsigned(wire50),
                      $signed(reg41)})));
  assign wire76 = ({reg54[(5'h10):(1'h0)]} & ((~reg48[(3'h4):(2'h2)]) >> ((~&$signed((8'hbe))) ?
                      (~$signed(reg54)) : $signed($signed((8'hb8))))));
  assign wire77 = ((reg71[(1'h1):(1'h0)] ^~ $unsigned(($signed(reg46) ?
                          $unsigned(wire75) : ((8'haf) <= reg53)))) ?
                      (~|$unsigned((&reg57[(3'h4):(3'h4)]))) : (~^$unsigned((!(~|reg63)))));
  assign wire78 = reg43[(5'h12):(4'hd)];
  always
    @(posedge clk) begin
      reg79 <= wire78;
      if ((8'hb6))
        begin
          reg80 <= {reg47[(3'h6):(1'h0)]};
          reg81 <= $signed(wire49[(1'h0):(1'h0)]);
          reg82 <= ((!reg45) >= $unsigned(reg67));
          if ($unsigned(($unsigned(((reg57 ? reg67 : wire37) * (reg52 ?
              (8'hab) : reg65))) & reg52)))
            begin
              reg83 <= $signed($unsigned($signed($unsigned((|(7'h43))))));
              reg84 <= $signed(wire37[(3'h4):(3'h4)]);
              reg85 <= ($signed(reg79) + $signed((reg71 ?
                  (&(wire39 | reg80)) : ({wire77, wire74} ?
                      (~^(8'hac)) : (^reg54)))));
            end
          else
            begin
              reg83 <= $unsigned(({$unsigned(reg64)} ?
                  (|{$signed(reg68)}) : {((reg71 >= (8'haf)) & (reg44 ^ (7'h40))),
                      $signed($signed(reg58))}));
              reg84 <= wire38;
            end
        end
      else
        begin
          reg80 <= (({$unsigned($signed(reg53)),
              (&{wire39,
                  reg82})} ^~ $signed(($unsigned(reg68) >= (reg56 == (8'ha5))))) == reg46[(4'hb):(2'h2)]);
          reg81 <= reg85[(3'h5):(2'h3)];
          reg82 <= reg43;
          if (reg65[(2'h2):(1'h1)])
            begin
              reg83 <= ((wire78[(1'h0):(1'h0)] ?
                  ((wire38[(4'h8):(2'h2)] + $signed(reg44)) ?
                      (reg64 ?
                          $signed(reg68) : {reg55}) : (^~reg55)) : $signed(($unsigned(reg84) & reg42[(1'h1):(1'h0)]))) << wire76[(1'h0):(1'h0)]);
              reg84 <= reg62[(2'h3):(2'h3)];
              reg85 <= $unsigned((^~$signed(reg59[(1'h0):(1'h0)])));
              reg86 <= (^$signed(($signed($unsigned(wire50)) << ($signed(reg63) ?
                  (reg54 + reg81) : (wire77 ? reg81 : reg82)))));
            end
          else
            begin
              reg83 <= (~&(~^{reg83}));
              reg84 <= $unsigned((($signed((~^reg86)) ?
                  (reg59[(3'h5):(2'h2)] ^ {(8'hb1),
                      reg57}) : wire40[(3'h4):(3'h4)]) ^~ (reg71 | reg55)));
              reg85 <= $signed($unsigned(reg72[(1'h1):(1'h0)]));
            end
          reg87 <= reg64;
        end
    end
  assign wire88 = $signed(wire39);
  assign wire89 = ({((((8'hb9) ~^ reg43) ? {wire38, reg60} : $signed((7'h43))) ?
                          reg67[(3'h5):(2'h3)] : reg43),
                      {({reg56} >= $signed(reg53))}} << $signed($unsigned(reg79)));
  assign wire90 = (&reg57[(3'h5):(3'h4)]);
  assign wire91 = reg44;
  assign wire92 = ((8'ha2) ?
                      ((7'h42) * (wire74 > reg70[(3'h5):(3'h5)])) : $signed((8'hbd)));
  assign wire93 = ((((~|$unsigned(reg67)) >= (|(^~wire37))) ?
                      wire90[(1'h1):(1'h0)] : reg55[(2'h3):(1'h0)]) != (^{$unsigned(wire40),
                      $unsigned(reg66[(1'h0):(1'h0)])}));
  assign wire94 = (8'hae);
  assign wire95 = $signed(reg41);
  assign wire96 = (~^reg51);
  assign wire97 = ((~$unsigned((8'hbe))) && $unsigned((~&$signed((reg72 ?
                      (7'h44) : reg52)))));
  assign wire98 = $signed({$unsigned(wire96)});
endmodule
