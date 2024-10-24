module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire191;
  wire [(5'h15):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire126;
  wire signed [(3'h5):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire123;
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire193,
                 wire191,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire13,
                 wire14,
                 wire15,
                 wire36,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire123,
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
      reg4 <= (~^(~&$unsigned($signed(wire3[(2'h3):(2'h2)]))));
      reg5 <= wire0[(3'h4):(1'h1)];
      reg6 <= (+{reg5});
      reg7 <= (wire3 ? (wire3 <= wire3) : (wire1 ? reg6 : $unsigned(reg4)));
      if ({$unsigned(($signed(((8'h9e) ? wire2 : reg5)) ?
              wire1 : ($signed((7'h40)) ? $signed(wire0) : (!wire0))))})
        begin
          reg8 <= {{$unsigned(reg6[(4'h9):(2'h2)]), (~reg7)},
              wire1[(3'h5):(3'h4)]};
        end
      else
        begin
          if ($signed($signed($unsigned((~(&reg5))))))
            begin
              reg8 <= $unsigned($unsigned(reg6));
              reg9 <= reg6[(4'hc):(3'h4)];
              reg10 <= wire0[(2'h3):(2'h2)];
              reg11 <= {(^wire2)};
              reg12 <= $unsigned(((reg6 <<< (~|wire2)) ?
                  {$signed($signed(wire0)),
                      reg8[(3'h4):(2'h2)]} : (reg8 && $signed(reg4[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg8 <= ({(reg6 ^ {$unsigned((8'hab)), (wire3 >= wire0)})} ?
                  $signed({(reg5 & $signed(wire3))}) : $signed($unsigned(((!wire2) ?
                      $unsigned(reg11) : wire3))));
              reg9 <= ($unsigned($unsigned($signed(((8'ha1) && reg4)))) ?
                  reg11[(1'h0):(1'h0)] : {(reg9 >= $unsigned(wire0)), reg8});
              reg10 <= $signed({wire0[(2'h3):(2'h3)]});
              reg11 <= $signed(reg11);
              reg12 <= ($signed((!(wire2[(2'h2):(1'h0)] ?
                      $signed((8'hb6)) : $unsigned(wire0)))) ?
                  {reg12} : $signed((^(|(reg8 ? (8'ha8) : (8'hba))))));
            end
        end
    end
  assign wire13 = (~|(~|reg11));
  assign wire14 = (|(wire13[(3'h4):(3'h4)] ?
                      (wire1 ?
                          $unsigned($unsigned((8'hb2))) : (|$signed(reg8))) : (7'h43)));
  assign wire15 = reg9[(5'h14):(4'hb)];
  module16 #() modinst37 (.wire18(reg4), .wire21(reg5), .y(wire36), .wire20(wire0), .clk(clk), .wire17(wire15), .wire19(reg11));
  assign wire38 = ({($unsigned((8'hbe)) ?
                          ((reg9 ^ reg5) ?
                              reg8[(3'h7):(1'h1)] : $unsigned(wire13)) : (~|(wire0 & wire36)))} < $signed(reg5));
  assign wire39 = $signed(reg8);
  assign wire40 = $signed(reg11);
  assign wire41 = ({(reg10 ^~ reg7[(1'h0):(1'h0)]), (^reg4)} & reg4);
  assign wire42 = reg9[(4'hd):(2'h2)];
  module43 #() modinst124 (.wire47(wire2), .clk(clk), .wire46(reg5), .y(wire123), .wire44(wire40), .wire45(wire36));
  assign wire125 = (8'h9f);
  assign wire126 = $signed(wire125);
  assign wire127 = (wire2[(4'hf):(4'h9)] ?
                       (&(~|wire1[(4'h8):(2'h2)])) : {((&wire41[(2'h2):(1'h1)]) - $unsigned(wire39[(5'h11):(4'hb)])),
                           (($signed(reg8) >= (~(8'ha9))) ?
                               wire2 : (^$signed((8'hb9))))});
  assign wire128 = wire15;
  assign wire129 = $signed(({{reg9[(5'h14):(5'h10)]},
                           ((+(8'hb3)) ^ (wire2 ? wire0 : wire1))} ?
                       (wire123[(3'h4):(1'h1)] ?
                           $signed(wire0[(1'h0):(1'h0)]) : (7'h43)) : wire126));
  assign wire130 = reg12[(4'h9):(2'h3)];
  assign wire131 = {((~^($unsigned(wire126) ^~ (wire125 << (8'hb4)))) ?
                           (({wire39, wire3} ? (^~reg5) : {wire0}) ?
                               ((~^(8'hb6)) ?
                                   {(8'hb5), reg4} : (~&wire123)) : {(wire41 ?
                                       wire126 : wire39),
                                   (!reg10)}) : {{wire38[(1'h1):(1'h1)],
                                   (reg9 ? wire129 : wire3)},
                               (~&wire42)}),
                       (((wire14[(5'h12):(3'h4)] ?
                               (wire3 - reg12) : $unsigned((8'hbc))) <= reg5[(1'h0):(1'h0)]) ?
                           reg5[(3'h5):(1'h0)] : (^$signed({wire1, reg7})))};
  assign wire132 = wire131[(3'h5):(3'h5)];
  module133 #() modinst192 (.clk(clk), .y(wire191), .wire134(reg4), .wire137(wire36), .wire135(wire132), .wire136(reg12));
  assign wire193 = reg10;
endmodule

module module133
#(parameter param189 = ((((((8'hbb) >= (8'hac)) ? {(8'ha9)} : ((8'haa) >> (8'ha8))) ? (((8'hb1) ? (8'ha0) : (8'hbb)) ? ((8'ha6) ? (8'hb3) : (8'ha0)) : ((8'hbd) ? (8'had) : (8'hba))) : ((~(7'h42)) >= (8'ha9))) >>> {{((7'h42) > (8'hbf)), ((8'hb3) ? (8'ha9) : (8'hab))}}) ? (+(((&(8'hb3)) ? ((8'hb5) >= (8'hb4)) : ((8'ha5) ? (8'hbe) : (8'hb5))) >> (8'hab))) : (~|((((8'ha0) >> (8'h9f)) ^~ (8'had)) ? (((7'h41) ? (8'hb1) : (8'h9d)) >= ((8'hb6) || (8'hbf))) : ((+(8'ha0)) == ((7'h42) >>> (7'h40)))))), 
parameter param190 = {param189, (((+(^~param189)) == (~(|param189))) ? param189 : (((param189 ? param189 : (8'ha3)) ? (~|(8'hbf)) : {param189, param189}) ^~ ({param189} ? param189 : (-param189))))})
(y, clk, wire134, wire135, wire136, wire137);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire134;
  input wire [(5'h15):(1'h0)] wire135;
  input wire signed [(3'h6):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire186;
  wire [(4'h8):(1'h0)] wire185;
  wire signed [(5'h13):(1'h0)] wire184;
  wire [(5'h11):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire182;
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire138,
                 wire139,
                 wire140,
                 wire182,
                 reg188,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 (1'h0)};
  assign wire138 = $unsigned((^~$signed($unsigned((wire137 + wire136)))));
  assign wire139 = $signed($unsigned(wire135));
  assign wire140 = ((~((((8'ha0) * wire138) ? ((8'hbf) < wire139) : wire139) ?
                       ($signed(wire138) <<< (~&(8'hb5))) : $unsigned((~&(8'hab))))) + (wire139[(1'h0):(1'h0)] + wire138[(4'hb):(3'h5)]));
  always
    @(posedge clk) begin
      reg141 <= (~&$unsigned((~$unsigned((wire140 | wire139)))));
      reg142 <= wire139;
      reg143 <= (wire137 ?
          (wire137 ^~ {{wire134[(1'h1):(1'h0)]},
              (((8'hbd) ? reg142 : wire134) ?
                  reg141 : (!wire135))}) : wire140[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg144 <= $unsigned(((wire136 ~^ wire138) ?
          (wire138[(4'hc):(1'h1)] - ({wire134} * ((8'hbd) < wire135))) : (wire136 ?
              ({wire138} ?
                  $signed(wire140) : (^~reg142)) : wire140[(1'h1):(1'h1)])));
      if (reg143[(5'h12):(4'hc)])
        begin
          reg145 <= wire136;
        end
      else
        begin
          if ((+$unsigned({(~|(~|wire135)),
              (reg143[(5'h10):(5'h10)] ?
                  wire138 : (wire137 ? reg143 : (8'ha6)))})))
            begin
              reg145 <= $unsigned({$unsigned(($unsigned((8'hb9)) ?
                      $unsigned((8'hb6)) : (wire137 >>> (8'h9d)))),
                  $unsigned((^~$signed(wire139)))});
              reg146 <= (&({wire135[(2'h3):(1'h1)]} ^ (~|reg142)));
            end
          else
            begin
              reg145 <= reg146;
              reg146 <= ((reg142 ?
                  $signed((~reg142[(3'h7):(3'h7)])) : (({wire134,
                      wire135} ^~ reg142) << wire135[(2'h3):(2'h2)])) >>> $signed((&($signed((8'hb8)) || (!wire140)))));
              reg147 <= (wire138 ?
                  $signed($unsigned($signed({reg144}))) : wire137);
            end
          reg148 <= ((reg142[(4'h8):(4'h8)] ~^ wire138[(2'h3):(1'h1)]) <= ($unsigned(($unsigned((8'hbf)) ?
              $signed(wire139) : ((8'ha6) < reg141))) & (((reg147 ?
                      reg143 : wire140) ?
                  (reg142 >= wire140) : $signed(reg141)) ?
              reg145 : (^reg145))));
        end
      reg149 <= wire139;
      if (reg141)
        begin
          if (((8'hac) != (~^(+$signed({wire140})))))
            begin
              reg150 <= reg143[(4'he):(3'h6)];
            end
          else
            begin
              reg150 <= $unsigned($unsigned(wire137));
              reg151 <= $signed({(((7'h43) ?
                      reg145 : (~&(8'ha1))) >> (+(^(8'ha0)))),
                  $signed(wire138)});
            end
          if ((wire140 ? reg151 : wire134[(3'h4):(2'h3)]))
            begin
              reg152 <= reg143;
            end
          else
            begin
              reg152 <= reg142;
              reg153 <= (wire140[(3'h5):(1'h1)] != $signed({(7'h43),
                  (wire140 != (wire140 ? reg148 : wire140))}));
            end
        end
      else
        begin
          reg150 <= (-(($unsigned(reg149[(3'h6):(3'h6)]) & ({reg151} ?
              $signed(reg147) : (wire140 ? wire135 : reg149))) <= (7'h42)));
          reg151 <= $signed(reg151);
          if (reg141[(2'h2):(1'h0)])
            begin
              reg152 <= (&(~^reg148[(2'h3):(2'h2)]));
              reg153 <= (+reg141);
            end
          else
            begin
              reg152 <= (wire134 ?
                  ((wire135 || $unsigned({reg150, wire138})) ?
                      $unsigned($unsigned((reg141 ?
                          reg152 : wire135))) : {$unsigned({reg151, wire137}),
                          $unsigned($unsigned((7'h40)))}) : {{$unsigned(reg150[(3'h4):(2'h3)]),
                          (((8'hb5) ? (8'hae) : reg147) ?
                              {reg152, reg153} : (+reg144))}});
              reg153 <= (-{$signed(($unsigned(wire137) && reg144[(1'h1):(1'h0)])),
                  {(^~{wire138}), $signed((wire139 ? reg148 : (8'had)))}});
              reg154 <= $unsigned(($unsigned((~|$signed(reg145))) ?
                  (&reg150[(2'h3):(2'h3)]) : $signed((!(8'hb5)))));
            end
          reg155 <= reg152[(1'h0):(1'h0)];
        end
    end
  module156 #() modinst183 (.wire157(reg141), .wire160(reg145), .y(wire182), .wire158(reg142), .wire159(wire135), .clk(clk));
  assign wire184 = ((($unsigned((wire135 ?
                           (8'hb0) : (8'ha6))) != $unsigned((reg154 || wire182))) || $unsigned($unsigned($signed(reg153)))) ?
                       ($unsigned(((-reg145) ?
                           (reg147 ?
                               (8'hb7) : wire182) : wire135)) >> $signed($signed({(8'hbe)}))) : (^(wire139 == wire134)));
  assign wire185 = wire134;
  assign wire186 = {($unsigned(reg151) ^~ (((reg147 ?
                           reg146 : wire139) ^~ wire140[(3'h5):(3'h4)]) - reg148)),
                       reg151};
  assign wire187 = (wire185 | reg141[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg188 <= ($signed($unsigned(((!wire138) ?
          reg142[(2'h3):(1'h1)] : wire187))) <= ((($unsigned(reg150) ~^ (8'ha9)) ?
          ((reg151 ? reg141 : reg145) ?
              (8'hb3) : (wire186 ^ reg154)) : $unsigned(wire184)) == $unsigned((8'haa))));
    end
endmodule

module module43
#(parameter param121 = ((^{(^((8'ha5) || (8'h9f))), (^{(8'haf)})}) ? (8'hb3) : {(-(~(8'hbe))), (^~(((8'ha5) == (8'hb3)) ? ((8'ha7) ? (8'hb8) : (8'hb8)) : ((8'ha6) < (7'h40))))}), 
parameter param122 = (((param121 ? ((param121 ? param121 : param121) ? (param121 + param121) : (!param121)) : param121) >>> (-(|{param121, param121}))) ? ((((param121 ^~ param121) ? ((8'ha3) == param121) : (~param121)) << ((|param121) != (|param121))) + {{param121, param121}}) : param121))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire47;
  input wire [(5'h11):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  input wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire88;
  assign y = {wire120, wire119, wire117, wire88, (1'h0)};
  module48 #() modinst89 (wire88, clk, wire45, wire44, wire47, wire46);
  module90 #() modinst118 (.clk(clk), .wire92(wire46), .wire93(wire44), .wire94(wire47), .wire91(wire88), .y(wire117));
  assign wire119 = (~$unsigned(wire47[(5'h10):(4'he)]));
  assign wire120 = (8'hac);
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire [(2'h3):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire22 = $unsigned({wire18[(1'h1):(1'h1)]});
  assign wire23 = wire17;
  assign wire24 = (wire19[(3'h4):(1'h1)] ?
                      (($unsigned((~^wire17)) ^~ ({wire20, wire20} ^~ ((8'h9d) ?
                              wire18 : wire20))) ?
                          (!$signed($signed(wire20))) : $signed(($signed((7'h44)) ?
                              wire20 : $unsigned(wire23)))) : $signed((($signed((8'hba)) | (wire22 <<< wire19)) < ((wire21 << wire20) << $signed(wire17)))));
  assign wire25 = wire22;
  assign wire26 = wire24[(4'ha):(2'h3)];
  assign wire27 = wire24;
  assign wire28 = $signed((({(wire27 <<< wire20),
                      wire19[(4'ha):(1'h0)]} ^ wire20[(4'h8):(3'h4)]) & (($signed(wire19) ?
                      ((8'hae) ? wire27 : wire25) : wire21) && wire22)));
  always
    @(posedge clk) begin
      reg29 <= (wire21 <<< (~($unsigned(wire17) > wire19)));
      reg30 <= (~^(!$signed((~&wire26[(5'h11):(4'hf)]))));
      reg31 <= $signed((^(~&reg29[(1'h1):(1'h1)])));
    end
  assign wire32 = $signed(wire27[(4'ha):(3'h5)]);
  assign wire33 = ($unsigned(wire25) ?
                      $signed(wire23) : $unsigned($unsigned(wire32[(4'ha):(4'ha)])));
  assign wire34 = reg30[(1'h0):(1'h0)];
  assign wire35 = (wire24[(3'h4):(3'h4)] || wire21);
endmodule

module module90
#(parameter param115 = (&(((^((7'h40) ? (8'hb0) : (8'haa))) ? ((^~(8'hb5)) || ((8'hbf) <= (7'h42))) : ({(8'hac)} ? ((8'haf) ? (8'haa) : (8'haa)) : (~^(8'ha0)))) ? (^(((8'hb1) ? (8'ha5) : (8'haf)) || (|(8'hb5)))) : ((|((8'ha8) & (8'ha1))) < (((8'hac) ? (8'hbd) : (8'h9f)) >> ((8'h9c) <= (7'h43)))))), 
parameter param116 = (((((param115 ? param115 : param115) >>> (~param115)) ? (((8'ha3) << param115) <<< param115) : (^param115)) ? (((param115 || param115) ? {param115, param115} : (~|param115)) ^ param115) : (+(param115 ? ((7'h40) ^ param115) : (param115 ? param115 : param115)))) >= ((~|((8'hb5) != {param115, param115})) ~^ ({(^param115), {param115}} ? {(param115 ? param115 : (8'hbe))} : (!(param115 == (8'ha4)))))))
(y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire94;
  input wire signed [(4'ha):(1'h0)] wire93;
  input wire [(3'h5):(1'h0)] wire92;
  input wire [(5'h13):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(4'ha):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(4'hd):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire95 = ($unsigned(wire91) ?
                      wire93[(4'h9):(3'h5)] : wire92[(2'h3):(2'h3)]);
  assign wire96 = wire91;
  assign wire97 = {$signed($signed($signed(wire95)))};
  assign wire98 = wire96[(1'h1):(1'h0)];
  assign wire99 = wire92;
  always
    @(posedge clk) begin
      reg100 <= ($unsigned(($signed((wire93 ^ wire97)) <= {wire98[(3'h4):(1'h1)],
          {wire92, wire98}})) && (!{wire93}));
      if ($unsigned(wire92))
        begin
          reg101 <= (~^wire96[(2'h2):(1'h1)]);
          reg102 <= $signed(($signed(wire94) ?
              {$unsigned({(8'hae), wire98})} : wire92));
          reg103 <= (~^(wire93 <= wire96[(1'h1):(1'h0)]));
          reg104 <= wire96;
          reg105 <= wire99[(5'h13):(1'h0)];
        end
      else
        begin
          reg101 <= (^(8'h9c));
          reg102 <= $signed($signed((($unsigned(wire94) ?
              (wire91 ? wire95 : wire97) : {reg104, reg100}) + {(!reg101),
              $unsigned((8'hab))})));
        end
    end
  assign wire106 = wire91[(4'h8):(1'h0)];
  assign wire107 = wire98[(5'h11):(5'h10)];
  assign wire108 = reg100[(1'h1):(1'h1)];
  assign wire109 = $signed((-(7'h44)));
  assign wire110 = (-wire95);
  assign wire111 = wire97[(4'hc):(4'hc)];
  assign wire112 = wire95[(3'h6):(3'h6)];
  assign wire113 = $unsigned($unsigned((((~^(7'h41)) != $signed(wire98)) ^~ (((8'h9f) ?
                       wire99 : wire99) & (wire98 >= wire93)))));
  assign wire114 = $signed((-wire95[(4'hc):(2'h3)]));
endmodule

module module48
#(parameter param86 = ({(~|{((8'ha4) <<< (8'h9f)), (!(8'ha3))})} ? (~({{(8'haa), (8'ha0)}} ? {{(8'hb9), (8'hbf)}, (!(8'hb6))} : (&(^(8'hab))))) : ((({(8'hb6)} ? (8'hbd) : ((8'ha5) ? (8'hbe) : (8'ha6))) ? (&{(8'h9e)}) : (((8'haa) == (8'hba)) ? ((8'ha6) ^ (8'ha6)) : ((8'ha5) ? (8'hbc) : (7'h44)))) < (~&(((8'hb8) - (8'ha2)) ? {(8'hb6), (8'hac)} : ((7'h40) != (8'hba)))))), 
parameter param87 = {((param86 ? (+(param86 - param86)) : ((param86 != param86) ? (param86 ? param86 : param86) : param86)) ? (param86 ? (~|{param86}) : (~(param86 ? param86 : param86))) : (((^~param86) || param86) ? (param86 ? (param86 ? param86 : param86) : (param86 ? param86 : param86)) : (param86 ? (~|param86) : param86)))})
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire52;
  input wire [(3'h6):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire74,
                 wire73,
                 wire72,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg76,
                 reg75,
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
                 (1'h0)};
  assign wire53 = {wire51[(2'h2):(2'h2)], wire50};
  assign wire54 = $signed($signed((wire49[(3'h4):(2'h3)] ~^ wire51)));
  assign wire55 = ($unsigned((wire53 ~^ (wire50[(3'h4):(1'h1)] >> {wire49,
                      wire53}))) ^~ (~$unsigned((wire51[(2'h3):(1'h1)] ?
                      $signed(wire51) : $unsigned(wire50)))));
  assign wire56 = (wire53[(1'h0):(1'h0)] ?
                      wire52[(3'h5):(3'h4)] : ($unsigned($signed((wire49 ?
                              wire50 : (8'ha1)))) ?
                          (({wire52, (8'had)} ?
                                  {wire55, wire49} : ((8'hb7) >= wire51)) ?
                              {(8'hb9), {wire53}} : ($unsigned(wire54) ?
                                  wire50 : {wire51, (8'ha6)})) : (8'hb0)));
  assign wire57 = $unsigned(wire50[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      if (($unsigned(wire55) ?
          (~|($unsigned((~|(8'hb1))) ?
              wire50[(1'h0):(1'h0)] : wire50)) : wire53[(1'h1):(1'h0)]))
        begin
          reg58 <= ((~{$signed((wire49 ?
                  wire53 : wire50))}) > $signed($signed(($signed(wire49) ?
              $signed(wire57) : wire50))));
          reg59 <= $signed({(^~reg58)});
          reg60 <= ((~|(~{$unsigned(wire56),
              ((7'h42) ? (8'hb2) : wire56)})) >> $unsigned(wire55));
          reg61 <= ((reg60[(2'h3):(2'h2)] << wire50[(3'h7):(2'h3)]) >>> $unsigned(wire54[(3'h5):(3'h5)]));
        end
      else
        begin
          reg58 <= $unsigned($unsigned(reg58[(3'h6):(2'h3)]));
          reg59 <= $signed((!($signed(wire50[(4'ha):(3'h5)]) * $signed((-wire54)))));
          reg60 <= {$signed(wire54), wire56[(1'h1):(1'h0)]};
          if (wire54[(2'h3):(1'h1)])
            begin
              reg61 <= {(7'h43)};
            end
          else
            begin
              reg61 <= (reg61[(2'h2):(2'h2)] ?
                  wire55 : $signed(($signed($unsigned((8'h9f))) ?
                      wire51 : $signed($signed(wire56)))));
              reg62 <= (($unsigned(({(8'ha1)} << (~(7'h44)))) > (|(+(~|wire54)))) ?
                  ((wire49 ~^ (reg61[(1'h1):(1'h1)] ?
                          (wire52 ? wire55 : wire51) : (^wire55))) ?
                      $unsigned(((wire56 + (8'hac)) ?
                          (wire55 ~^ (8'h9e)) : ((7'h40) >>> wire50))) : $unsigned(((wire49 << wire55) ?
                          (wire53 ? wire57 : reg61) : (reg60 ?
                              wire54 : wire55)))) : $signed(((|$unsigned(wire50)) >> {(wire52 <<< wire56)})));
              reg63 <= wire49;
              reg64 <= $unsigned(wire52);
              reg65 <= $unsigned($signed((((reg60 || reg58) != (reg62 ?
                  wire55 : reg61)) | wire50[(4'hc):(3'h7)])));
            end
          reg66 <= $unsigned(wire55[(1'h0):(1'h0)]);
        end
      reg67 <= $unsigned($unsigned($unsigned($signed((wire54 || wire54)))));
    end
  always
    @(posedge clk) begin
      reg68 <= $unsigned((7'h42));
      reg69 <= {{((reg58 ? reg65 : (reg59 <<< (8'h9f))) ?
                  reg60 : $signed({reg58, reg67}))},
          (!$signed(($signed((8'hbf)) ? $unsigned(wire55) : (~^reg62))))};
      reg70 <= $signed((($signed((~^wire55)) ?
              wire50[(1'h0):(1'h0)] : (|(reg65 > wire51))) ?
          wire57 : $signed({$unsigned(wire54)})));
      reg71 <= (~^$unsigned($unsigned({{wire55, reg67}, wire51})));
    end
  assign wire72 = $signed((~reg69));
  assign wire73 = $signed((~^(reg65[(1'h1):(1'h0)] || (|(wire55 <<< wire57)))));
  assign wire74 = ($signed({(reg64 < (reg62 - (8'hb9))),
                          reg71[(3'h4):(1'h0)]}) ?
                      (wire72[(4'h8):(3'h6)] || {(8'hb0),
                          $unsigned((reg63 + (7'h42)))}) : $signed((7'h41)));
  always
    @(posedge clk) begin
      reg75 <= $signed({($unsigned($signed((8'ha6))) <<< $signed((reg69 ?
              reg67 : reg67)))});
      reg76 <= ((~$unsigned($unsigned((wire54 ? wire72 : reg59)))) ?
          (8'ha1) : ((((^~reg71) - $signed(reg63)) < $unsigned(wire49[(1'h0):(1'h0)])) << (|($unsigned(wire49) ?
              $unsigned(wire55) : (wire54 <<< reg75)))));
    end
  assign wire77 = (reg69[(1'h1):(1'h0)] - (((^~{reg64, (8'hbd)}) ?
                          reg65 : (wire56[(3'h7):(3'h6)] ?
                              (8'hac) : ((8'h9e) + wire50))) ?
                      wire52[(1'h0):(1'h0)] : reg64[(2'h2):(1'h1)]));
  assign wire78 = reg62;
  assign wire79 = ((wire51 ?
                      $unsigned((reg67 ?
                          $signed((8'ha9)) : (^~(8'hb0)))) : (&(+{reg68,
                          (8'hb6)}))) * (+($signed((~|reg62)) >>> (reg71[(4'ha):(4'ha)] <<< (wire56 ~^ reg59)))));
  assign wire80 = ($unsigned((8'ha7)) ?
                      (reg63 + (~^wire79[(2'h2):(2'h2)])) : reg63[(3'h6):(1'h1)]);
  assign wire81 = ((~wire49[(1'h1):(1'h0)]) + {($signed((reg70 + (8'hb5))) ?
                          (wire50[(4'hd):(4'hc)] ?
                              $unsigned((8'hb1)) : reg64[(3'h6):(3'h6)]) : (~|(^~reg67))),
                      reg64});
  assign wire82 = reg65;
  assign wire83 = ($signed(wire82) != ($signed(((wire73 <<< reg58) ?
                      wire57[(5'h10):(1'h0)] : (+reg60))) < wire52[(1'h0):(1'h0)]));
  assign wire84 = reg62[(3'h6):(3'h5)];
  assign wire85 = (|reg60);
endmodule

module module156
#(parameter param181 = (((+(+(+(8'hb0)))) != ((8'hbf) ? ({(7'h41)} <= ((8'had) ? (8'hab) : (8'hb6))) : ((!(8'ha7)) < ((8'ha2) >>> (8'hbb))))) ? (~|((&((8'hbc) - (7'h42))) <<< ((~&(8'hb1)) ? ((8'h9e) ? (8'had) : (8'ha7)) : ((8'hae) | (7'h44))))) : (((~|{(8'hb8)}) == (8'ha3)) > {(~((8'ha5) ? (8'hb0) : (8'ha1))), (((8'ha9) ? (7'h41) : (8'h9c)) ? ((8'hbf) ? (8'hb8) : (8'ha0)) : ((7'h40) ? (8'ha5) : (8'h9f)))})))
(y, clk, wire160, wire159, wire158, wire157);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire160;
  input wire signed [(5'h15):(1'h0)] wire159;
  input wire [(5'h11):(1'h0)] wire158;
  input wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire180;
  wire [(4'h9):(1'h0)] wire179;
  wire signed [(5'h12):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire [(5'h14):(1'h0)] wire172;
  wire signed [(3'h5):(1'h0)] wire171;
  wire [(4'hf):(1'h0)] wire170;
  wire [(5'h12):(1'h0)] wire169;
  wire [(5'h10):(1'h0)] wire168;
  wire signed [(3'h5):(1'h0)] wire167;
  wire [(4'hd):(1'h0)] wire166;
  wire signed [(4'he):(1'h0)] wire165;
  wire signed [(4'hd):(1'h0)] wire164;
  wire [(5'h12):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire161;
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  reg [(4'hf):(1'h0)] reg175 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 reg177,
                 reg176,
                 reg175,
                 (1'h0)};
  assign wire161 = wire158[(2'h3):(2'h3)];
  assign wire162 = ($signed(($signed((7'h40)) == $unsigned(wire157))) ?
                       wire161[(3'h7):(1'h1)] : (wire158 << wire158));
  assign wire163 = $signed(((-{(wire157 ? wire162 : wire158),
                       $signed(wire159)}) < (wire161 ?
                       wire157[(2'h3):(2'h2)] : {(~|(8'hb2)), wire159})));
  assign wire164 = (8'ha0);
  assign wire165 = (($signed($signed((wire161 > wire161))) > wire159) >= $signed({wire157}));
  assign wire166 = wire159[(3'h6):(3'h5)];
  assign wire167 = ((wire157[(4'h8):(2'h3)] ~^ wire164[(2'h2):(1'h0)]) >> (~|{wire161}));
  assign wire168 = wire165;
  assign wire169 = (-wire165[(4'hd):(4'hc)]);
  assign wire170 = $signed(wire157);
  assign wire171 = ($unsigned(wire169) >> (&($signed((~(8'hb2))) != (~(wire162 > wire164)))));
  assign wire172 = (wire167 ? wire168[(4'hf):(4'he)] : wire163[(4'hc):(3'h4)]);
  assign wire173 = $unsigned($unsigned({((8'ha7) >>> wire169[(4'hf):(4'hc)]),
                       wire171[(3'h4):(1'h0)]}));
  assign wire174 = wire166[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg175 <= ((|($signed(wire157) ?
              wire166[(4'hc):(2'h3)] : {(wire158 >> wire174),
                  wire163[(4'he):(3'h6)]})) ?
          (&$signed((8'hbb))) : {wire162[(3'h4):(1'h1)]});
      reg176 <= (+($signed($signed($unsigned(wire162))) ?
          (~|(~&$unsigned(wire166))) : (-wire164)));
      reg177 <= $signed($unsigned(wire160));
    end
  assign wire178 = wire159;
  assign wire179 = ($unsigned($signed(wire159)) >>> (({(^wire169)} != {reg176[(4'ha):(1'h0)]}) ?
                       ((|{wire160}) > $signed($signed((8'ha1)))) : (+wire157[(4'hb):(4'h9)])));
  assign wire180 = wire160;
endmodule
