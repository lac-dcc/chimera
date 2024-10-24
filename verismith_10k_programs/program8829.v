module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire192;
  wire [(4'h8):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire189;
  wire [(5'h14):(1'h0)] wire188;
  wire signed [(3'h7):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire181;
  reg [(4'h9):(1'h0)] reg190 = (1'h0);
  reg [(5'h14):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire189,
                 wire188,
                 wire183,
                 wire20,
                 wire21,
                 wire181,
                 reg190,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg4,
                 reg5,
                 reg6,
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
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire0 >> ($unsigned(wire3) ?
          $unsigned(((wire0 ?
              (8'hbe) : wire1) ~^ $signed(wire1))) : {(!wire3[(4'hf):(2'h3)]),
              wire3}));
      reg5 <= {{(+(~&(8'hbb)))}, $signed($signed(wire2[(2'h3):(2'h2)]))};
      reg6 <= (($unsigned((+wire1)) ?
              wire3 : (((wire1 ? wire3 : wire1) ?
                  $unsigned(reg5) : $signed(wire0)) << ($signed(reg5) ?
                  $signed(reg5) : wire3[(3'h5):(1'h1)]))) ?
          wire3 : (wire0[(2'h2):(1'h1)] ?
              reg5 : (((wire1 ? wire3 : (8'hbb)) ?
                  reg5[(3'h7):(1'h0)] : $signed((8'haf))) || (|$signed(wire0)))));
      if (((~(wire3 ? $signed((reg4 ? wire3 : reg5)) : reg6[(1'h1):(1'h1)])) ?
          $unsigned($signed((wire0 | (reg6 + (8'hb6))))) : (&((|$signed(wire1)) ^~ $unsigned($unsigned((7'h42)))))))
        begin
          reg7 <= reg6;
          reg8 <= wire1;
          if ((-reg4[(2'h2):(2'h2)]))
            begin
              reg9 <= $signed($unsigned(((reg5 || (&reg4)) ?
                  wire0 : reg6[(1'h1):(1'h1)])));
              reg10 <= $signed(reg9[(1'h0):(1'h0)]);
              reg11 <= (reg9 >= ($signed(((wire3 - reg4) ?
                  wire3 : (^~reg8))) >= $signed((reg10 + (reg8 >>> reg9)))));
            end
          else
            begin
              reg9 <= $unsigned($signed((+(^(reg4 && reg5)))));
              reg10 <= {reg8,
                  $unsigned(((-wire2[(5'h10):(5'h10)]) ?
                      (8'hb5) : $unsigned((wire2 ? reg8 : wire3))))};
              reg11 <= ($signed((|reg10)) ? wire3 : $signed(wire1));
              reg12 <= $unsigned((!$unsigned((~(~&wire0)))));
            end
          if ($signed({(~wire3[(5'h12):(2'h2)])}))
            begin
              reg13 <= reg12[(5'h13):(3'h7)];
              reg14 <= $unsigned(({(reg11[(4'he):(3'h6)] <= (wire0 ?
                          wire1 : reg12)),
                      reg6} ?
                  ({$signed(reg11), (wire0 - wire3)} ?
                      ((!reg12) != $unsigned(reg4)) : ($signed((8'hb7)) > $unsigned(wire3))) : $unsigned(wire2)));
              reg15 <= wire1;
            end
          else
            begin
              reg13 <= (8'hbd);
              reg14 <= $signed(reg15);
              reg15 <= ($unsigned(($signed((reg15 ? reg8 : (8'haa))) - {(reg5 ?
                      reg15 : wire1)})) ~^ $signed(reg4[(1'h1):(1'h0)]));
              reg16 <= (($signed((+reg5[(3'h7):(2'h3)])) >> $signed(((|wire3) > (wire0 ?
                      (7'h42) : (8'hbb))))) ?
                  (+(reg6 ?
                      reg13 : (((8'hb5) ? reg14 : (8'haf)) >= ((8'hba) ?
                          reg8 : reg10)))) : ((8'hb7) ?
                      (((wire1 ? reg14 : reg13) ~^ reg5) ?
                          reg8[(1'h1):(1'h1)] : $signed($signed(reg13))) : (~&$unsigned(((8'hba) ?
                          reg5 : reg12)))));
            end
          if ($signed(reg7[(3'h5):(1'h1)]))
            begin
              reg17 <= {$signed($unsigned(((wire0 << reg7) & reg12[(2'h2):(2'h2)]))),
                  wire0[(1'h0):(1'h0)]};
              reg18 <= (wire3[(4'ha):(3'h4)] > {(((~&reg13) ?
                          (~|reg12) : $signed(reg9)) ?
                      reg15 : ($signed((8'hb7)) && reg10[(3'h6):(1'h1)]))});
            end
          else
            begin
              reg17 <= ({(^~({wire1, (8'hbe)} >>> $unsigned(reg12)))} ?
                  ($signed($signed($unsigned((7'h43)))) * $unsigned($unsigned({reg17,
                      reg13}))) : $signed((reg14[(3'h6):(3'h5)] ^ $signed(reg9[(1'h1):(1'h0)]))));
              reg18 <= reg16;
              reg19 <= reg6[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg7 <= reg19[(3'h6):(3'h5)];
          if (reg9)
            begin
              reg8 <= $unsigned({($signed(((8'hae) ?
                      (8'ha6) : reg10)) << ((+wire1) ?
                      $unsigned(wire2) : (wire1 || wire0))),
                  $signed(wire0[(3'h6):(2'h3)])});
              reg9 <= (!reg17[(1'h0):(1'h0)]);
              reg10 <= $signed($unsigned(reg9[(3'h6):(2'h3)]));
              reg11 <= wire2[(1'h0):(1'h0)];
            end
          else
            begin
              reg8 <= ((((-$unsigned(reg6)) >= (((8'hac) ? reg7 : reg6) ?
                      wire0 : wire1)) ?
                  (^~(wire1 ?
                      (wire1 >>> reg18) : reg4[(2'h3):(2'h2)])) : $signed(({wire2,
                          reg10} ?
                      {(8'ha0), reg19} : {reg17}))) && wire1);
              reg9 <= reg4;
              reg10 <= reg5;
              reg11 <= $unsigned((reg5[(2'h3):(1'h1)] ?
                  $signed($unsigned($signed((8'haa)))) : reg11));
            end
          reg12 <= $unsigned(reg12[(4'h8):(2'h3)]);
        end
    end
  assign wire20 = (8'ha1);
  assign wire21 = $unsigned($unsigned({wire1}));
  module22 #() modinst182 (.clk(clk), .wire26(reg10), .wire23(reg18), .wire24(wire0), .wire25(reg11), .y(wire181));
  assign wire183 = (7'h43);
  always
    @(posedge clk) begin
      reg184 <= ($unsigned(wire183) ?
          ({$unsigned($unsigned(reg12))} ~^ (($signed(wire1) && (reg13 ?
                  wire2 : reg19)) ?
              ((^wire21) ? {wire21} : reg12) : reg7)) : (~|({(reg9 >= reg17),
              $signed(wire0)} || ($unsigned((8'hbf)) ?
              (+wire1) : $signed((8'haf))))));
      reg185 <= wire1;
      reg186 <= ((wire3 ^ $unsigned(reg6)) ?
          {(&$signed(reg16))} : {((8'ha2) * (^reg9))});
      reg187 <= (!(~reg17));
    end
  assign wire188 = $signed((reg5 <<< reg4[(2'h3):(2'h3)]));
  assign wire189 = (-($signed(reg12) ?
                       reg187[(4'he):(4'h8)] : wire181[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg190 <= reg14;
    end
  assign wire191 = $unsigned(reg187);
  assign wire192 = reg190;
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire [(5'h13):(1'h0)] wire24;
  input wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire180;
  wire signed [(2'h3):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire177;
  wire [(2'h3):(1'h0)] wire172;
  wire signed [(4'h9):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire172,
                 wire170,
                 wire157,
                 wire155,
                 wire112,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire59,
                 wire39,
                 wire38,
                 wire28,
                 wire27,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire27 = $unsigned($signed((~|((wire26 ? wire26 : wire24) ?
                      (wire25 * wire23) : $signed(wire24)))));
  assign wire28 = $signed($unsigned(wire24[(4'hd):(4'ha)]));
  always
    @(posedge clk) begin
      reg29 <= (($unsigned((^(8'h9e))) ?
              (((~wire25) ?
                  (wire27 ?
                      (8'h9d) : wire23) : wire26[(1'h1):(1'h0)]) > (wire23[(4'hb):(4'h9)] | $unsigned(wire24))) : (({wire25,
                  wire26} < (~|wire24)) > $unsigned((wire26 ?
                  (8'haf) : wire23)))) ?
          $signed(wire25) : (8'ha4));
      if (wire25)
        begin
          reg30 <= (8'haa);
          reg31 <= wire26;
          reg32 <= $signed(((&reg29) ?
              $signed((reg29 <<< (wire25 ?
                  (8'haf) : (8'ha3)))) : $unsigned(wire25)));
        end
      else
        begin
          reg30 <= wire26[(3'h5):(3'h5)];
          if ((-$unsigned($signed($signed((wire23 ? wire23 : reg32))))))
            begin
              reg31 <= $signed($unsigned(wire23));
              reg32 <= wire28[(3'h5):(2'h3)];
              reg33 <= $unsigned(((reg32 ?
                      (!(wire25 ? (8'hbf) : wire24)) : (8'ha2)) ?
                  ((wire25[(4'ha):(3'h4)] ?
                      $signed(reg32) : wire25[(5'h13):(2'h3)]) | {reg29[(5'h11):(3'h7)],
                      {(8'hb9)}}) : $unsigned((!(reg29 == wire24)))));
              reg34 <= ((~$unsigned($signed(wire27[(5'h12):(5'h10)]))) > (!$signed(($signed(reg32) + (+reg31)))));
              reg35 <= (reg33[(4'hd):(4'ha)] ?
                  reg33 : $signed({(8'hbf),
                      $unsigned((reg33 ? (8'ha0) : (8'ha7)))}));
            end
          else
            begin
              reg31 <= $signed(reg30);
              reg32 <= (wire23[(3'h6):(2'h2)] < ((~wire25[(4'hb):(2'h2)]) >= ((wire23 && ((8'hb3) + wire23)) != (reg32[(2'h3):(2'h3)] ?
                  $unsigned(wire27) : (reg32 && wire24)))));
              reg33 <= (wire23 ? $signed(wire24) : (reg34 ^~ wire24));
              reg34 <= (~^reg29[(4'hb):(4'h8)]);
            end
          reg36 <= (wire24[(4'hc):(1'h1)] ?
              $signed(($unsigned(wire26[(1'h1):(1'h0)]) + $unsigned((8'ha2)))) : wire27[(5'h15):(3'h5)]);
          reg37 <= $signed($signed((((~&wire26) ? {reg29} : (8'ha9)) ?
              $signed(reg33[(4'h8):(1'h0)]) : wire27)));
        end
    end
  assign wire38 = ((~^(8'ha9)) != (wire23 ?
                      $signed(reg29) : {$unsigned($signed(reg30))}));
  assign wire39 = (reg36 >= $unsigned((~^{$signed(wire38), wire23})));
  module40 #() modinst60 (.wire42(wire38), .y(wire59), .wire44(wire26), .clk(clk), .wire43(wire24), .wire41(reg30), .wire45(wire25));
  module61 #() modinst97 (.clk(clk), .wire66(wire24), .wire65(reg36), .wire62(wire27), .wire64(reg34), .y(wire96), .wire63(reg30));
  assign wire98 = wire26;
  assign wire99 = (~&wire24);
  assign wire100 = ((wire98[(4'h9):(1'h0)] ?
                           (^~reg35) : (($unsigned((8'ha2)) + reg31) ?
                               $unsigned((~|wire99)) : $signed(reg37[(2'h3):(2'h2)]))) ?
                       $unsigned(wire23) : (({$unsigned(wire98),
                               reg29[(4'hc):(4'hc)]} && (wire24 ?
                               wire24 : (|reg35))) ?
                           $unsigned(((|wire27) * wire27[(4'hc):(4'hc)])) : $unsigned((~&(wire23 + wire24)))));
  always
    @(posedge clk) begin
      if (wire28[(1'h0):(1'h0)])
        begin
          reg101 <= $signed({$signed(((8'hbb) ? $signed((8'hb3)) : wire27))});
          reg102 <= ($signed($unsigned((-$signed(wire25)))) > reg30[(5'h12):(3'h4)]);
          if ($signed((|{($unsigned(reg34) ?
                  (wire96 ? (8'hb1) : wire98) : (!wire98))})))
            begin
              reg103 <= wire26;
            end
          else
            begin
              reg103 <= wire98[(3'h5):(1'h0)];
              reg104 <= ((^$unsigned(((reg103 <<< wire28) | (wire23 ?
                      wire26 : reg103)))) ?
                  (reg102[(4'h9):(3'h5)] ?
                      $unsigned($signed(wire27)) : wire25[(5'h10):(3'h4)]) : (wire100 ?
                      (8'hb9) : (^reg32[(1'h1):(1'h0)])));
            end
          reg105 <= $unsigned($unsigned(((((8'hb0) <<< (8'hab)) ~^ wire98) ?
              reg31 : ({reg31} ? reg101 : (+reg32)))));
        end
      else
        begin
          reg101 <= ((reg33[(4'he):(4'he)] ? reg29 : $signed($signed(reg35))) ?
              wire98 : (+(wire59 ? (reg105 <<< (-wire98)) : wire27)));
          reg102 <= wire38;
          reg103 <= (reg29 ? (!reg32) : wire98[(4'hc):(1'h0)]);
          reg104 <= $signed((reg104 ? reg29 : $signed((~^$unsigned(reg37)))));
        end
      reg106 <= {$signed((^~{$unsigned(reg29)}))};
      if ($signed(($signed({((8'hb1) << wire99)}) - (wire96 ?
          reg104 : wire96[(5'h13):(5'h10)]))))
        begin
          reg107 <= wire25;
          reg108 <= (reg35 || (8'ha0));
        end
      else
        begin
          reg107 <= ((((&(reg35 == reg102)) ?
                  $signed($signed(reg106)) : {(wire96 ? reg31 : reg103),
                      wire38}) + {(-reg35[(4'hd):(3'h4)])}) ?
              reg104[(4'hd):(3'h7)] : {((-{reg31}) ?
                      {$signed(reg29),
                          ((8'hb7) ~^ wire59)} : ($unsigned(reg102) ?
                          reg33 : reg104[(4'hf):(4'he)])),
                  (wire26 >= (((7'h42) == (8'ha0)) ?
                      $signed(reg105) : (|(7'h44))))});
          reg108 <= (|((~(wire26[(3'h5):(2'h2)] - ((8'h9d) || reg103))) ?
              reg35 : {wire27[(2'h2):(2'h2)], (wire99 ? wire96 : (-wire26))}));
          reg109 <= wire39;
          reg110 <= $signed((~&(($signed(reg32) ?
                  (wire98 <<< reg103) : $unsigned(reg33)) ?
              reg106[(3'h5):(1'h0)] : wire96[(5'h10):(2'h2)])));
          reg111 <= reg34[(3'h4):(2'h2)];
        end
    end
  assign wire112 = $unsigned({reg105});
  module113 #() modinst156 (.wire115(wire25), .clk(clk), .y(wire155), .wire118(wire23), .wire116(wire98), .wire114(wire28), .wire117(reg37));
  assign wire157 = $signed({{$unsigned((&(8'h9d))), (reg29 + (~wire59))},
                       {$unsigned(wire99),
                           ({wire25, wire23} ? (~&(8'hac)) : (^wire96))}});
  module158 #() modinst171 (.wire160(wire100), .clk(clk), .y(wire170), .wire159(wire157), .wire161(wire39), .wire162(wire98));
  assign wire172 = (((wire99 > (~|(&wire100))) == {{$signed(reg33)},
                       wire23[(1'h1):(1'h1)]}) || reg109[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire98)
        begin
          reg173 <= wire28[(1'h0):(1'h0)];
          if ($unsigned((~^($signed(wire28) ?
              reg31 : (|reg104[(3'h4):(2'h2)])))))
            begin
              reg174 <= reg102;
            end
          else
            begin
              reg174 <= reg111;
              reg175 <= wire99;
              reg176 <= reg110[(3'h6):(3'h6)];
            end
        end
      else
        begin
          reg173 <= ({reg102} ?
              $signed(((&$unsigned((8'ha6))) ?
                  (-{wire172,
                      wire112}) : ((wire28 >= wire172) + $unsigned(wire96)))) : $unsigned($unsigned(($signed(reg103) <<< $signed((7'h41))))));
          reg174 <= wire23;
        end
    end
  assign wire177 = wire99;
  assign wire178 = reg110[(3'h7):(2'h2)];
  assign wire179 = reg110;
  assign wire180 = $unsigned({$signed($signed((^~wire96))),
                       wire98[(5'h15):(1'h1)]});
endmodule

module module158
#(parameter param168 = (-({(((8'hb9) ? (8'ha1) : (8'h9d)) ? (!(8'hb5)) : ((8'ha8) <<< (8'ha0)))} <= ({(~|(8'hb9)), ((7'h41) >>> (8'hbf))} == (((8'hb2) != (8'hb2)) ? ((8'hb5) ? (8'hac) : (8'ha1)) : ((8'hb7) >> (7'h44)))))), 
parameter param169 = {(({(param168 ? (7'h40) : param168)} ? (^~param168) : ({param168, (8'hbc)} ? (param168 | param168) : (param168 ? param168 : param168))) >> ((~(8'hbc)) ? param168 : (7'h42)))})
(y, clk, wire162, wire161, wire160, wire159);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire162;
  input wire [(4'hb):(1'h0)] wire161;
  input wire signed [(5'h13):(1'h0)] wire160;
  input wire [(4'h8):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire163;
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  assign y = {wire166, wire165, wire164, wire163, reg167, (1'h0)};
  assign wire163 = ((~wire160[(5'h10):(5'h10)]) ?
                       ((wire162 + (~|$signed(wire160))) || (^({(8'haf)} ^ wire160[(4'h9):(1'h0)]))) : (~&wire162[(4'hc):(4'hc)]));
  assign wire164 = $signed(wire161[(2'h3):(2'h2)]);
  assign wire165 = (wire159[(3'h7):(2'h2)] <<< ($signed(wire160[(3'h7):(3'h5)]) | $signed({(~&wire163),
                       $signed(wire163)})));
  assign wire166 = wire163[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg167 <= wire161;
    end
endmodule

module module113
#(parameter param153 = (^(-(((8'hab) ? (|(8'ha8)) : ((7'h42) ? (8'ha2) : (8'h9f))) ? (((8'h9e) ? (8'hbc) : (8'ha4)) ? (^~(8'ha8)) : ((8'ha5) & (7'h43))) : {((8'ha8) <<< (8'hb8)), {(8'h9c)}}))), 
parameter param154 = (((^~(|(param153 - param153))) ? param153 : param153) - {(~&{(param153 ? param153 : (8'ha1))}), (^~{{param153}, (~param153)})}))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire118;
  input wire signed [(3'h5):(1'h0)] wire117;
  input wire signed [(3'h4):(1'h0)] wire116;
  input wire [(4'he):(1'h0)] wire115;
  input wire signed [(5'h10):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire [(4'hb):(1'h0)] wire149;
  wire signed [(2'h3):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire145;
  wire [(4'h8):(1'h0)] wire144;
  wire [(2'h2):(1'h0)] wire119;
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire119,
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
                 (1'h0)};
  assign wire119 = (((wire117[(1'h1):(1'h0)] ? (8'hb0) : $signed({wire114})) ?
                           (wire117[(1'h1):(1'h0)] || (|wire116[(1'h0):(1'h0)])) : (((wire114 ?
                                   wire116 : wire115) ?
                               (wire116 ~^ wire117) : $unsigned(wire117)) + $signed((wire114 ?
                               wire117 : wire117)))) ?
                       wire114[(3'h4):(2'h2)] : wire117[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg120 <= wire115;
      reg121 <= {(|$signed((|((8'hae) ~^ wire119)))), (|$unsigned({wire119}))};
      reg122 <= $signed($signed((wire117 ?
          $unsigned($signed((8'hbc))) : $unsigned((wire115 >> wire116)))));
      reg123 <= (wire118 ?
          $signed($unsigned(((wire119 << wire118) * $unsigned(wire117)))) : wire119);
      reg124 <= (8'had);
    end
  always
    @(posedge clk) begin
      reg125 <= wire115[(1'h1):(1'h0)];
      if ((wire119[(2'h2):(1'h1)] == reg122))
        begin
          reg126 <= {{reg122}, ($signed((~&$signed(wire115))) ^ (8'ha7))};
          reg127 <= reg126[(3'h6):(2'h3)];
          if (((8'hb3) ~^ (($signed(wire117) ?
              reg124 : (^{reg127})) > $signed((~(wire118 <= reg123))))))
            begin
              reg128 <= (wire115[(1'h0):(1'h0)] && (($unsigned(((7'h43) ?
                          reg124 : reg125)) ?
                      wire116[(1'h0):(1'h0)] : ((~reg120) ?
                          (reg122 << wire115) : $unsigned(reg120))) ?
                  (($unsigned(wire116) ?
                      {reg125} : $signed(wire118)) ~^ ((~reg120) ?
                      (wire119 < (8'hbb)) : (reg124 ^~ reg125))) : (~(~(wire114 ?
                      wire115 : reg123)))));
              reg129 <= $signed(reg121[(3'h7):(3'h4)]);
              reg130 <= ($unsigned(reg124) ?
                  wire116[(3'h4):(1'h1)] : (reg120[(4'ha):(4'h9)] ?
                      {wire116[(2'h3):(1'h1)],
                          (reg128 ^~ (wire115 != (7'h43)))} : ((~^(+(8'ha3))) ?
                          $unsigned({reg128}) : (reg121[(4'ha):(2'h3)] > reg122[(5'h13):(3'h4)]))));
              reg131 <= $unsigned((+((reg122[(3'h6):(3'h5)] >> (-reg130)) & (7'h40))));
            end
          else
            begin
              reg128 <= ((reg130[(2'h2):(2'h2)] ?
                  {((reg122 ? reg123 : reg131) ?
                          (reg131 + (8'had)) : $signed(reg126))} : wire117) ~^ ((((reg125 ?
                          reg120 : reg130) ?
                      (wire119 < (8'hb8)) : reg131[(3'h4):(1'h1)]) ?
                  reg121 : reg120) >> $signed(reg125[(2'h2):(2'h2)])));
              reg129 <= wire118;
            end
          reg132 <= ($unsigned(wire117) ?
              reg121 : (^~($unsigned(wire114[(4'h8):(3'h5)]) ?
                  reg120[(4'h9):(2'h2)] : (reg127 ?
                      reg131[(2'h3):(2'h3)] : (wire114 ? (8'ha6) : reg124)))));
        end
      else
        begin
          reg126 <= ((&reg127) * (($unsigned(wire117[(3'h5):(3'h5)]) ?
                  reg120[(1'h1):(1'h1)] : (^reg125)) ?
              wire119 : {$signed($unsigned(wire119)),
                  ($unsigned(reg127) < wire119[(1'h0):(1'h0)])}));
          reg127 <= reg122[(2'h2):(1'h0)];
          if (reg129[(3'h5):(1'h0)])
            begin
              reg128 <= wire117;
              reg129 <= (+($unsigned($unsigned(((8'haa) | wire114))) ?
                  (wire118 ?
                      (reg122[(4'he):(1'h1)] <= reg126) : (|reg127)) : (reg130 ?
                      wire119 : $signed(reg122))));
              reg130 <= $unsigned(({(((8'h9f) ?
                      (8'hbf) : reg122) & wire116)} && ((^wire119) ^~ {{wire117},
                  reg124})));
            end
          else
            begin
              reg128 <= reg123[(3'h7):(3'h5)];
              reg129 <= reg127;
              reg130 <= reg125;
              reg131 <= wire114[(5'h10):(4'he)];
            end
        end
      reg133 <= ({$signed({(reg131 ? reg126 : reg125),
              (wire115 ^ reg126)})} ^~ {{reg126}});
    end
  always
    @(posedge clk) begin
      reg134 <= (((~|({wire117} ? {reg130} : (wire115 ? wire114 : (8'ha5)))) ?
          {{((8'haf) != wire118)}} : wire119[(1'h0):(1'h0)]) | {reg125});
      if ($signed((reg131 ^ wire114)))
        begin
          reg135 <= reg126[(1'h1):(1'h0)];
          reg136 <= {{(&(8'hbd))}};
          reg137 <= reg124;
          reg138 <= ((wire117 ?
                  {{(reg124 ? wire118 : reg134), {wire116}},
                      {$unsigned(reg128)}} : (reg132 >>> $unsigned($unsigned(reg125)))) ?
              (~&($unsigned((reg123 ? wire114 : wire115)) ?
                  (reg122 ?
                      (reg124 || reg126) : reg125) : reg135)) : $unsigned((wire115 != (reg124[(1'h0):(1'h0)] < {(8'ha7)}))));
        end
      else
        begin
          reg135 <= $unsigned((^$unsigned(reg123)));
          reg136 <= $unsigned(((!wire116) ?
              $signed(reg120) : (-$unsigned($signed(reg137)))));
        end
      if ($unsigned((wire119 <= $signed(reg137))))
        begin
          reg139 <= reg137[(1'h1):(1'h1)];
        end
      else
        begin
          if ((8'hba))
            begin
              reg139 <= reg123[(1'h0):(1'h0)];
              reg140 <= reg130[(1'h1):(1'h0)];
            end
          else
            begin
              reg139 <= wire114;
              reg140 <= (((~|reg125) != ($signed((wire117 ?
                      reg136 : reg139)) && ((reg138 && reg135) != (+(8'h9f))))) ?
                  reg138[(2'h2):(1'h0)] : reg134[(2'h3):(2'h2)]);
              reg141 <= wire116;
              reg142 <= reg123;
              reg143 <= {(reg122 & (~&reg127)),
                  $signed({$signed((&reg128)),
                      (&(reg124 ? wire118 : reg139))})};
            end
        end
    end
  assign wire144 = $unsigned((&(~&($unsigned((8'hb1)) ?
                       reg138[(1'h0):(1'h0)] : (~|reg131)))));
  assign wire145 = (~|reg133);
  assign wire146 = (~|($unsigned($signed(reg130[(1'h1):(1'h0)])) && ($signed(((8'hba) <= reg141)) & (|((7'h44) ?
                       reg139 : (8'ha0))))));
  assign wire147 = ($signed($unsigned($signed($signed((8'hbf))))) <= reg143);
  assign wire148 = wire145;
  assign wire149 = $signed($signed((((^reg124) >> (reg123 <= (8'hae))) ?
                       reg128[(5'h10):(4'hb)] : $unsigned({reg121, wire147}))));
  assign wire150 = $unsigned($signed(wire117[(3'h4):(1'h1)]));
  assign wire151 = reg122;
  assign wire152 = ($unsigned({$signed({(8'hab), reg137}),
                           ((~^(8'ha5)) ? wire151 : $unsigned((8'ha7)))}) ?
                       $signed(reg133[(3'h6):(3'h4)]) : (reg135 ?
                           wire117[(3'h4):(2'h2)] : (reg132 >>> wire145[(3'h4):(2'h2)])));
endmodule

module module61
#(parameter param94 = (((^~(~&(~|(8'ha9)))) ? {(((8'hb7) ? (8'hb3) : (7'h43)) ? (^(8'h9e)) : {(8'hbc), (8'hb2)}), ((!(8'hae)) ? ((8'hbc) ? (7'h44) : (8'hb0)) : {(8'hbb)})} : ((8'hb5) << (^~(&(8'hba))))) ? ((({(8'ha0), (8'hab)} ? ((8'ha5) != (8'hae)) : (~|(8'ha0))) + (^((8'hb5) ? (8'hb2) : (8'hb1)))) ? (8'hb3) : ((-((8'hbc) && (8'ha0))) ? ((-(8'hbb)) ? {(8'hb3), (8'hb5)} : (-(8'h9e))) : ((~|(8'hb1)) ? (8'h9c) : (~|(8'hbc))))) : (((7'h42) || (8'haa)) >> (~^(!(&(7'h42)))))), 
parameter param95 = (8'hbc))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire66;
  input wire [(4'hc):(1'h0)] wire65;
  input wire signed [(4'hc):(1'h0)] wire64;
  input wire signed [(4'he):(1'h0)] wire63;
  input wire [(4'hd):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~^($signed($unsigned({wire62, wire63})) ?
          wire63[(4'hd):(3'h4)] : ($signed((wire65 > wire64)) ?
              $unsigned({wire62}) : {wire64}))))
        begin
          if ($signed($signed(wire64)))
            begin
              reg67 <= (8'haa);
              reg68 <= $signed($unsigned($unsigned((+wire62))));
              reg69 <= ($unsigned(($unsigned((wire65 > wire63)) < (^~$unsigned(wire65)))) ?
                  ($signed((wire65 ? wire63 : reg68[(1'h0):(1'h0)])) ?
                      $unsigned($unsigned((~&wire62))) : ((^~wire64[(3'h5):(2'h2)]) ?
                          ((wire66 - wire65) || (reg68 >> wire64)) : wire65[(4'ha):(3'h7)])) : wire63[(1'h1):(1'h1)]);
              reg70 <= reg67[(3'h4):(2'h3)];
            end
          else
            begin
              reg67 <= (($unsigned((!$signed(wire64))) ?
                      $signed(((wire65 ? reg68 : (8'hb2)) ?
                          reg67[(2'h2):(1'h1)] : $unsigned(reg69))) : wire65[(3'h7):(1'h1)]) ?
                  {(^~$unsigned(reg70))} : wire63);
              reg68 <= ({$unsigned((~&(wire64 >= reg70))), wire64} ?
                  reg69 : (~|$unsigned($signed((reg68 ? reg69 : reg67)))));
              reg69 <= wire66;
              reg70 <= ($signed($signed($unsigned((wire63 < reg68)))) || $signed(wire62));
              reg71 <= wire62[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg67 <= ({($unsigned($signed((8'hb0))) ?
                      ($unsigned(reg69) ?
                          reg68[(2'h3):(2'h2)] : (reg69 < reg67)) : wire62)} ?
              wire63[(3'h4):(2'h2)] : reg67[(3'h5):(2'h2)]);
          reg68 <= (wire62 ?
              ($unsigned((reg69 ? (^~reg70) : reg71[(2'h2):(1'h1)])) ?
                  reg67[(2'h3):(2'h2)] : (reg67[(2'h3):(2'h2)] ?
                      wire62[(4'hc):(1'h0)] : (!$unsigned(reg67)))) : wire66);
          reg69 <= $unsigned($signed((~($signed(wire66) && (8'ha6)))));
          if ((+{($unsigned(reg67) == $signed((wire65 >>> reg71)))}))
            begin
              reg70 <= reg69;
              reg71 <= ($unsigned(((~|$unsigned(wire65)) ?
                      ($unsigned(wire63) >= $unsigned((8'ha6))) : (8'hb1))) ?
                  $signed(reg67) : $unsigned(reg69));
              reg72 <= (|$signed((reg68[(2'h3):(1'h0)] & reg71[(1'h0):(1'h0)])));
              reg73 <= reg69;
              reg74 <= (~|(+($signed(wire63[(4'hc):(4'h9)]) ?
                  (&(+reg67)) : $unsigned(reg67))));
            end
          else
            begin
              reg70 <= reg69;
              reg71 <= wire64;
              reg72 <= $unsigned((|((~^(~(8'hba))) ?
                  $signed((wire66 ? reg67 : reg68)) : {(~&reg68),
                      $signed(wire66)})));
              reg73 <= ($signed((((~^wire66) >= $signed(wire65)) >>> (reg68 | reg71[(3'h4):(2'h2)]))) - ((^~wire64[(1'h0):(1'h0)]) ?
                  (+$unsigned((!reg72))) : reg69[(1'h1):(1'h0)]));
              reg74 <= $signed($unsigned((~&(|reg67))));
            end
        end
      if ($unsigned(reg74[(4'hd):(1'h1)]))
        begin
          if ((~|((reg71[(2'h3):(2'h2)] ?
              (~&$unsigned(reg72)) : $signed(reg72)) > $signed(((reg72 && wire64) ?
              (-wire66) : ((7'h40) ^ (8'ha8)))))))
            begin
              reg75 <= $signed((((^(+reg73)) <<< reg68) ?
                  (($signed(wire65) ?
                      $signed(wire65) : $unsigned(reg74)) != {$unsigned(wire64)}) : $unsigned($unsigned($unsigned(wire63)))));
              reg76 <= wire63[(3'h7):(2'h3)];
              reg77 <= reg71[(1'h0):(1'h0)];
              reg78 <= (~^$signed((~^wire64[(4'h8):(1'h0)])));
            end
          else
            begin
              reg75 <= (($unsigned((8'ha6)) ?
                  (!(^~(^~reg77))) : $signed((|(reg77 ?
                      reg77 : reg69)))) ^~ (((wire62 ?
                      $signed((8'hab)) : (reg74 < (7'h41))) >> $signed($unsigned(reg68))) ?
                  wire64 : reg69[(3'h4):(3'h4)]));
              reg76 <= $signed((reg70 ? (8'hb6) : $unsigned(wire66)));
              reg77 <= ({(~&wire66)} ?
                  {$signed(reg75),
                      {$unsigned($unsigned(wire63)),
                          ($signed((8'had)) ?
                              (wire65 ^~ reg68) : $signed(reg75))}} : wire62[(4'hd):(4'hc)]);
            end
        end
      else
        begin
          reg75 <= wire66[(1'h1):(1'h1)];
          reg76 <= ({(&$signed((wire66 ?
                  (8'hb0) : (8'ha2))))} | ($unsigned($unsigned($unsigned(reg69))) | $unsigned($unsigned($unsigned(reg72)))));
          reg77 <= (($signed((~&$unsigned(reg77))) ?
              (reg69[(4'ha):(2'h3)] ?
                  (~|(wire64 ^~ reg72)) : (~|(wire62 & reg67))) : (((!reg78) ?
                      (!reg68) : ((8'haf) - (8'hb7))) ?
                  $unsigned(wire62[(3'h4):(2'h2)]) : (wire66[(1'h1):(1'h0)] >= (wire66 ?
                      reg75 : reg76)))) ^ $signed({{{reg73, reg67}}}));
          reg78 <= $signed($signed($unsigned((^~((7'h40) > reg71)))));
        end
      reg79 <= reg68[(2'h2):(1'h0)];
    end
  assign wire80 = $unsigned(($signed(reg77[(3'h4):(1'h0)]) ?
                      ($unsigned(wire63) ?
                          reg77[(4'hd):(3'h4)] : $unsigned($unsigned(reg70))) : $unsigned({$unsigned(reg70),
                          reg76[(2'h3):(1'h0)]})));
  assign wire81 = ($signed(($unsigned(reg76[(4'hc):(4'hb)]) || wire62)) ?
                      wire64 : (((~reg74) ?
                          (~|((8'hb4) && reg72)) : $signed({wire62,
                              (8'had)})) & $signed($unsigned((reg67 ?
                          reg68 : wire80)))));
  assign wire82 = (8'hac);
  assign wire83 = reg78[(1'h1):(1'h0)];
  assign wire84 = $unsigned((wire82[(4'h9):(2'h3)] ^~ reg74[(3'h6):(1'h0)]));
  assign wire85 = (-wire84);
  assign wire86 = wire82[(3'h4):(2'h3)];
  assign wire87 = ($signed($signed(wire85)) && reg71);
  assign wire88 = (-$signed(reg74));
  assign wire89 = $unsigned(reg67);
  assign wire90 = ({$signed($signed((wire88 == reg70))),
                      $unsigned(($signed(wire63) != reg73[(2'h2):(2'h2)]))} < ({((~|(8'h9d)) ^ (^~wire82))} <= ((~|wire66) >> reg76[(2'h2):(1'h0)])));
  assign wire91 = (reg71 >= (+$signed({(^wire84)})));
  assign wire92 = reg71[(1'h1):(1'h1)];
  assign wire93 = $unsigned(((((-(8'ha7)) ?
                              (reg74 - reg74) : (wire92 >>> (8'hbd))) ?
                          reg79 : ($signed(wire85) ?
                              (^~reg72) : (wire82 ? wire80 : reg69))) ?
                      wire84 : (wire81 ?
                          $signed($signed((8'hae))) : $unsigned(wire82))));
endmodule

module module40
#(parameter param58 = (8'h9e))
(y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire45;
  input wire [(3'h4):(1'h0)] wire44;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire [(5'h14):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(2'h2):(1'h0)] wire46;
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg51,
                 (1'h0)};
  assign wire46 = $unsigned((+wire43[(4'h8):(2'h2)]));
  assign wire47 = $signed(((wire42[(3'h5):(2'h2)] | (|(8'h9e))) && (($unsigned(wire44) >> (wire45 ?
                      wire43 : wire44)) ^ (+wire46[(1'h0):(1'h0)]))));
  assign wire48 = wire47[(1'h1):(1'h1)];
  assign wire49 = $signed(wire42);
  assign wire50 = wire45;
  always
    @(posedge clk) begin
      reg51 <= {(wire42 <<< $unsigned(wire44[(1'h1):(1'h1)])), (8'hbb)};
    end
  assign wire52 = (^~wire44[(1'h0):(1'h0)]);
  assign wire53 = (reg51[(4'ha):(2'h2)] | {$unsigned($unsigned({wire49})),
                      ($signed(wire44) ?
                          (|$unsigned(wire52)) : (~{wire47, wire44}))});
  assign wire54 = wire50;
  assign wire55 = wire53[(1'h0):(1'h0)];
  assign wire56 = {{{wire55[(1'h1):(1'h0)], reg51[(1'h1):(1'h1)]},
                          ((~(~wire52)) && (wire42 != (-(8'ha1))))}};
  assign wire57 = wire50;
endmodule
