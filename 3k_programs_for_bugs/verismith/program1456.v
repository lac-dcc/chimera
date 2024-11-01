module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire188;
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire100,
                 wire19,
                 wire18,
                 wire188,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
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
      if ((~&wire1[(2'h2):(1'h1)]))
        begin
          reg4 <= ($signed((+wire3)) ?
              ($unsigned(((wire3 ? wire0 : wire3) ?
                      {(7'h44)} : wire2[(3'h7):(1'h1)])) ?
                  wire0 : (-$signed(wire2[(1'h0):(1'h0)]))) : wire0);
          if (((|wire0[(2'h2):(1'h0)]) ?
              wire1[(2'h2):(2'h2)] : wire3[(3'h4):(2'h2)]))
            begin
              reg5 <= $signed((($unsigned($signed(wire2)) ?
                  wire3[(2'h2):(2'h2)] : $unsigned(wire1)) ^ (^~$signed($signed(reg4)))));
              reg6 <= wire2;
              reg7 <= $signed($unsigned(($signed(((8'hbb) ?
                  wire1 : wire2)) & $signed((wire1 ? reg6 : wire0)))));
              reg8 <= $signed(wire3[(1'h1):(1'h1)]);
              reg9 <= (-$unsigned((+(^~(|wire1)))));
            end
          else
            begin
              reg5 <= reg9;
              reg6 <= $signed(wire2[(1'h0):(1'h0)]);
              reg7 <= $unsigned(wire1);
              reg8 <= wire2[(2'h2):(1'h1)];
            end
          if ((~reg7[(3'h5):(1'h0)]))
            begin
              reg10 <= wire2;
              reg11 <= $signed($unsigned(((+(~^reg7)) & ($signed(reg9) ?
                  {reg8} : reg9[(4'hd):(1'h0)]))));
              reg12 <= ($signed(($unsigned((+(8'ha2))) ?
                  ($unsigned(wire3) < $unsigned(reg5)) : ((~&wire2) ?
                      (wire2 ? reg7 : (8'hb9)) : $signed(reg10)))) && {reg7,
                  {$unsigned(wire0[(2'h2):(1'h1)]), $signed(reg4)}});
              reg13 <= $unsigned(wire3[(4'ha):(4'h8)]);
            end
          else
            begin
              reg10 <= ((^~((~$signed(reg12)) ?
                  {(|reg4)} : reg9[(3'h4):(2'h2)])) <<< ($signed($unsigned(reg7)) ^~ wire0[(3'h7):(1'h0)]));
            end
        end
      else
        begin
          if ((~|wire1))
            begin
              reg4 <= $signed($signed({(8'ha4)}));
              reg5 <= {reg9[(5'h10):(2'h3)]};
              reg6 <= {(&((wire2 ? {reg5, reg10} : wire0) ?
                      ($unsigned(reg7) ^ {wire3,
                          reg11}) : (reg13[(3'h6):(1'h0)] << reg13[(4'hd):(3'h4)]))),
                  wire2[(1'h1):(1'h0)]};
              reg7 <= ((+$unsigned($unsigned((wire3 ?
                  wire2 : (8'haa))))) ^~ {{{$signed(reg13)},
                      ((8'hbe) >> $unsigned(reg9))},
                  (8'hb9)});
              reg8 <= $signed($signed(({wire2[(3'h4):(2'h2)]} ?
                  reg5 : reg5[(4'hc):(4'h9)])));
            end
          else
            begin
              reg4 <= reg10[(1'h0):(1'h0)];
              reg5 <= ($unsigned(wire3[(3'h7):(1'h1)]) < ((|(reg13 ?
                      $unsigned(reg5) : reg6[(2'h3):(1'h1)])) ?
                  wire3 : $signed(((reg7 ? wire3 : reg11) ?
                      (reg10 < reg9) : (reg10 != wire2)))));
            end
          if (wire0[(4'h9):(3'h4)])
            begin
              reg9 <= $signed(reg7);
              reg10 <= reg13;
            end
          else
            begin
              reg9 <= ($signed((((reg9 ? reg10 : (8'h9e)) ?
                      $unsigned(wire1) : $signed(reg12)) | $signed((|wire1)))) ?
                  $unsigned((!(^~(wire1 ?
                      wire3 : (8'hb7))))) : reg7[(3'h5):(1'h1)]);
              reg10 <= $unsigned((reg9[(4'ha):(3'h6)] >> {wire3[(4'h9):(1'h0)]}));
            end
          if ((8'hbc))
            begin
              reg11 <= $signed($unsigned((8'hb3)));
            end
          else
            begin
              reg11 <= (reg9[(4'he):(4'hb)] == {$signed($signed($unsigned((8'ha2)))),
                  (~wire2[(3'h7):(1'h1)])});
              reg12 <= $unsigned($unsigned($unsigned(reg4[(4'h9):(3'h7)])));
              reg13 <= $signed($unsigned($signed(reg13)));
            end
        end
      reg14 <= (wire1[(1'h1):(1'h0)] == $unsigned(reg4[(4'h8):(3'h7)]));
      reg15 <= (reg13 ?
          $signed(($unsigned($unsigned(reg6)) > reg10[(2'h2):(1'h1)])) : (reg6 ?
              wire3[(3'h6):(3'h4)] : ($unsigned(reg10) ^~ reg12)));
      reg16 <= $signed(reg10[(2'h2):(1'h1)]);
      reg17 <= $signed($unsigned(($unsigned(wire0) ?
          $unsigned((reg11 <= (7'h41))) : (~|$unsigned(reg5)))));
    end
  assign wire18 = $signed(((+(~&((8'hb6) && (8'ha9)))) > (^((~^reg6) != $unsigned(reg14)))));
  assign wire19 = reg16[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg20 <= (~|(~(reg15[(3'h4):(3'h4)] <<< (-$unsigned(reg11)))));
      reg21 <= {(reg7 >> $signed($signed($unsigned(reg16))))};
    end
  module22 #() modinst101 (wire100, clk, reg15, reg11, reg10, reg16, wire3);
  module102 #() modinst189 (.clk(clk), .wire105(reg10), .y(wire188), .wire107(reg16), .wire106(wire100), .wire103(wire0), .wire104(wire1));
endmodule

module module102
#(parameter param186 = (+{(({(8'ha6)} ? ((8'hb2) >> (8'hbc)) : (|(8'hb4))) >> {((8'hba) ^~ (8'ha5))})}), 
parameter param187 = (param186 ? {((~&param186) != {param186, param186})} : ((~&(param186 >> param186)) || ({(param186 ? param186 : param186), (param186 ? param186 : param186)} ~^ (param186 != param186)))))
(y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire107;
  input wire signed [(5'h10):(1'h0)] wire106;
  input wire [(4'hd):(1'h0)] wire105;
  input wire [(5'h15):(1'h0)] wire104;
  input wire signed [(5'h10):(1'h0)] wire103;
  wire [(4'hf):(1'h0)] wire184;
  wire [(5'h11):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire164;
  wire [(5'h12):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  assign y = {wire184,
                 wire166,
                 wire164,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire109,
                 wire108,
                 reg111,
                 (1'h0)};
  assign wire108 = ((8'hae) ^ wire103[(4'hf):(3'h6)]);
  assign wire109 = $signed((((wire104 ^ {wire108, wire105}) ?
                           $unsigned($signed(wire108)) : (+(wire108 & wire106))) ?
                       $signed({wire107, (8'hbc)}) : wire107[(1'h1):(1'h0)]));
  assign wire110 = wire109;
  always
    @(posedge clk) begin
      reg111 <= ($signed($signed(($unsigned(wire106) ?
          wire107 : $signed(wire104)))) <= (wire105 && $signed((-wire108[(1'h0):(1'h0)]))));
    end
  assign wire112 = (!$unsigned($unsigned($signed(wire104))));
  assign wire113 = wire108[(3'h4):(1'h1)];
  assign wire114 = (wire103 ?
                       reg111 : {({(wire107 && wire113),
                               wire107} ~^ {wire112[(1'h1):(1'h0)],
                               $signed(wire113)})});
  assign wire115 = (~&$signed(wire109[(2'h2):(1'h0)]));
  assign wire116 = (^~(8'hb5));
  assign wire117 = {((~|$unsigned((wire107 << wire108))) ?
                           {$unsigned(wire113[(4'h9):(3'h6)]),
                               ($unsigned(wire114) ?
                                   (~&wire105) : $signed((8'ha1)))} : (wire114 != $signed((wire104 | wire108))))};
  module118 #() modinst165 (wire164, clk, wire106, wire109, wire104, wire108);
  assign wire166 = wire112;
  module167 #() modinst185 (wire184, clk, wire166, wire105, wire113, wire114);
endmodule

module module22  (y, clk, wire23, wire24, wire25, wire26, wire27);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire90;
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire28,
                 wire29,
                 wire90,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire28 = (wire23[(4'hd):(4'h9)] ?
                      {((~|wire24) ?
                              {wire26} : ($signed(wire25) ?
                                  {wire25, wire26} : (wire24 ?
                                      (8'hbd) : wire23)))} : (~^$unsigned((wire27[(2'h2):(2'h2)] ?
                          (wire23 ? wire23 : wire23) : {wire25, wire27}))));
  assign wire29 = $signed($signed($signed(({wire27} ?
                      wire28 : wire28[(4'ha):(4'h9)]))));
  module30 #() modinst91 (wire90, clk, wire24, wire29, wire23, wire27, wire28);
  assign wire92 = (wire23 ?
                      $unsigned(wire27[(3'h6):(1'h1)]) : ($unsigned(((wire26 >>> wire29) ?
                          {wire29} : wire25)) > $signed(wire28[(5'h13):(4'hd)])));
  assign wire93 = (($unsigned(wire26[(1'h1):(1'h1)]) << wire92) & (~|wire23));
  always
    @(posedge clk) begin
      if ($signed({(^~wire93)}))
        begin
          reg94 <= (~&((7'h42) ? $unsigned(wire25[(4'h8):(1'h1)]) : wire90));
          reg95 <= wire24;
        end
      else
        begin
          reg94 <= $signed($signed($signed(reg95[(1'h1):(1'h0)])));
          reg95 <= $signed((8'hae));
        end
      reg96 <= (wire26[(4'he):(3'h6)] <= wire90);
      if (wire90)
        begin
          reg97 <= $unsigned(wire93);
          reg98 <= (+($signed(wire24) >> (wire25[(4'h8):(4'h8)] && $signed((|reg96)))));
        end
      else
        begin
          reg97 <= ((8'hb3) ? $unsigned({$signed(reg94)}) : wire26);
          reg98 <= (-(wire25[(4'h8):(3'h7)] || wire27[(3'h6):(1'h0)]));
        end
      reg99 <= ((($unsigned(reg95) ?
                  (((8'hbe) - wire26) >> ((8'ha2) ?
                      reg98 : wire23)) : (^~wire23)) ?
              ($signed({wire26, reg96}) ?
                  ($signed((8'hb2)) ~^ (wire27 ?
                      reg95 : reg96)) : wire28) : reg96[(4'h8):(1'h0)]) ?
          (&{$unsigned((wire92 ?
                  reg95 : wire27))}) : $unsigned((wire29 >= wire24[(3'h5):(1'h0)])));
    end
endmodule

module module30
#(parameter param88 = ((&{((~&(8'ha2)) ? ((8'hba) ? (8'hb4) : (8'hbc)) : ((8'hb7) > (8'hba)))}) ? (~&(~^(((8'hb7) + (7'h43)) ? (~^(7'h43)) : (!(8'ha3))))) : (^~(^{((8'hb0) ? (8'ha4) : (8'hbb)), {(8'hbf), (8'ha1)}}))), 
parameter param89 = ((((-param88) ? {(8'h9d)} : ({param88, param88} * {param88, param88})) << (param88 ? {(param88 ? (8'ha8) : param88)} : (param88 >>> (|param88)))) ? param88 : ((param88 + param88) ? ((^{param88}) <= (8'ha3)) : ({(-param88), (!param88)} << param88))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire35;
  input wire signed [(4'hb):(1'h0)] wire34;
  input wire [(5'h10):(1'h0)] wire33;
  input wire signed [(3'h6):(1'h0)] wire32;
  input wire [(3'h6):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire73,
                 wire65,
                 wire64,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire36 = (+$unsigned({wire33[(2'h3):(2'h2)],
                      ($unsigned(wire33) ~^ (wire35 ? wire31 : (8'hbe)))}));
  assign wire37 = wire33[(5'h10):(4'he)];
  assign wire38 = (($unsigned(((wire32 != (8'hbb)) ?
                          wire33[(2'h3):(1'h1)] : $signed(wire32))) ?
                      wire34 : {(wire37 & wire35[(4'hd):(4'h9)]),
                          {(wire34 ? wire33 : wire34),
                              $unsigned(wire34)}}) <<< wire32[(1'h0):(1'h0)]);
  assign wire39 = (wire31[(2'h2):(1'h0)] ? (^~(8'ha4)) : wire38[(4'h9):(3'h5)]);
  assign wire40 = wire32[(3'h6):(2'h3)];
  assign wire41 = $unsigned((~{{wire32}, $unsigned({wire31})}));
  always
    @(posedge clk) begin
      reg42 <= ($signed((wire34 ?
          $signed($unsigned(wire35)) : (~^((7'h42) + wire37)))) ^ wire38[(3'h7):(3'h6)]);
      reg43 <= wire38;
      reg44 <= reg43;
      reg45 <= $signed($signed(($unsigned((~&wire36)) ?
          $signed((+reg44)) : wire35)));
    end
  assign wire46 = $signed((~|wire34));
  assign wire47 = {$signed(($signed(wire34[(1'h1):(1'h1)]) ?
                          ((reg43 ? (8'hab) : wire32) ?
                              (~&wire35) : (~^wire31)) : reg43[(1'h1):(1'h0)])),
                      ((-$unsigned(((8'ha1) > reg45))) || (~|wire33))};
  assign wire48 = wire36;
  assign wire49 = (+$signed((7'h41)));
  assign wire50 = wire34[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg51 <= ((8'hb0) ? {$signed(wire39)} : wire31);
      reg52 <= $signed($unsigned($unsigned(wire36[(1'h1):(1'h1)])));
      if ((+reg44))
        begin
          reg53 <= $unsigned(wire38);
        end
      else
        begin
          reg53 <= ((~&$unsigned(reg43)) ?
              (wire31[(2'h3):(1'h0)] ?
                  $unsigned(((wire48 ? (8'h9c) : wire46) ?
                      wire41 : wire48)) : (7'h41)) : $unsigned(reg52));
          reg54 <= (wire35[(4'h9):(2'h2)] <= (^{($unsigned(wire38) ?
                  $signed(wire49) : $unsigned(reg43))}));
          if ((wire37[(4'hb):(3'h5)] >= $unsigned(($signed($unsigned(wire34)) | $signed((wire37 ?
              wire49 : (8'hab)))))))
            begin
              reg55 <= $signed((~^($signed($unsigned(wire38)) + {((8'h9c) ?
                      wire37 : reg54)})));
              reg56 <= (((~{wire32}) + ($unsigned((wire38 ?
                      wire49 : (8'hb7))) < wire46[(2'h3):(1'h1)])) ?
                  {$signed($unsigned(wire50)), reg51} : wire50[(1'h0):(1'h0)]);
            end
          else
            begin
              reg55 <= $unsigned((^~(~wire32)));
              reg56 <= (|$unsigned(({wire41[(2'h3):(2'h2)]} + ($unsigned(reg55) ?
                  $signed(wire47) : $unsigned(reg55)))));
              reg57 <= wire31[(3'h6):(2'h2)];
            end
        end
      reg58 <= ((~^(((reg44 * reg56) ?
                  $signed(reg57) : (reg56 ? wire37 : reg55)) ?
              ({wire47, reg51} ?
                  $signed(reg42) : wire47[(4'hf):(4'h8)]) : (reg55 ?
                  (-reg42) : (-reg43)))) ?
          (~|$unsigned(reg55[(1'h1):(1'h1)])) : $signed(reg57));
    end
  always
    @(posedge clk) begin
      reg59 <= ((($signed(wire48) ?
              ((~^reg44) ?
                  (-wire32) : (reg52 ?
                      reg43 : reg43)) : (~|wire31)) & (+{reg51})) ?
          (7'h41) : wire41[(2'h2):(1'h1)]);
      reg60 <= (wire39[(1'h0):(1'h0)] >= (~($unsigned($signed(reg52)) & ((^~(8'ha5)) + (wire40 << reg57)))));
      reg61 <= (wire46 < (^($unsigned($signed(reg45)) - ((~|(8'had)) == $signed(wire38)))));
      reg62 <= (~&$unsigned($signed($signed($unsigned(wire31)))));
      reg63 <= $unsigned($signed((^$signed(reg45))));
    end
  assign wire64 = (8'ha7);
  assign wire65 = (wire37[(5'h10):(4'he)] ?
                      $unsigned((((wire37 ?
                          wire32 : wire46) == (wire48 << reg54)) << (reg55[(2'h2):(1'h0)] & reg45[(4'h9):(4'h9)]))) : wire34[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg66 <= $signed(reg45);
      if ((reg56 * reg66[(1'h0):(1'h0)]))
        begin
          if ((reg45 ?
              $unsigned(((+wire32) - $unsigned($unsigned(reg58)))) : (($unsigned($signed((8'hb4))) >>> ($signed(reg57) <<< wire65)) == $signed(wire33[(2'h3):(1'h0)]))))
            begin
              reg67 <= $signed(wire38);
              reg68 <= ({($signed($unsigned(wire46)) ?
                      $unsigned(reg63) : ((~|(8'hbe)) & (&reg57)))} ~^ $signed((~(8'hbb))));
              reg69 <= wire35;
              reg70 <= reg51[(3'h4):(2'h3)];
              reg71 <= (-(!wire49[(3'h5):(2'h3)]));
            end
          else
            begin
              reg67 <= {wire31, wire50};
            end
        end
      else
        begin
          reg67 <= (wire41[(2'h3):(2'h3)] + {{reg42[(1'h1):(1'h1)]}});
          reg68 <= reg60[(4'hf):(3'h4)];
          reg69 <= $unsigned(reg51[(3'h5):(2'h3)]);
        end
      reg72 <= {reg56[(5'h14):(5'h12)]};
    end
  assign wire73 = reg62[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if (($signed(wire32[(2'h3):(1'h0)]) && (8'hbb)))
        begin
          if (wire40)
            begin
              reg74 <= (((-$unsigned((wire50 >> reg57))) ?
                      (($unsigned(wire41) ? $unsigned((8'hac)) : reg52) ?
                          wire48 : {(wire35 ?
                                  reg67 : wire41)}) : $unsigned(($signed(wire35) ?
                          $unsigned(reg72) : (~reg57)))) ?
                  wire41 : ($unsigned(wire46[(2'h2):(2'h2)]) != reg69));
              reg75 <= $unsigned({((+$unsigned(wire40)) ^~ (&$signed(reg63)))});
              reg76 <= $unsigned(((~&wire40[(2'h3):(2'h2)]) ?
                  (reg59 & (~&(-reg68))) : (+((wire34 << reg68) ?
                      (reg68 + reg62) : reg58[(1'h0):(1'h0)]))));
              reg77 <= ((((~{reg72, wire37}) != $signed(reg69)) ?
                  $unsigned({(reg72 ^~ reg72),
                      wire65}) : reg71[(1'h1):(1'h0)]) >>> $signed($signed(wire46)));
            end
          else
            begin
              reg74 <= ((wire41[(2'h3):(2'h2)] || (((^~reg58) + {reg44,
                      reg72}) == ((reg63 ? wire39 : (8'hb2)) <<< {reg43}))) ?
                  ($unsigned($signed(reg75)) ?
                      wire73 : ((reg71[(1'h1):(1'h0)] ?
                          $unsigned((7'h42)) : (|wire41)) >>> (reg45 && wire39))) : reg63);
              reg75 <= {(^~$signed($signed((^~reg54)))),
                  $unsigned($signed($signed($signed(wire31))))};
              reg76 <= wire48;
              reg77 <= $unsigned(wire50[(1'h1):(1'h0)]);
              reg78 <= (reg60[(5'h12):(4'hf)] ?
                  ($unsigned((~^{wire73})) ?
                      ($signed($signed(reg69)) ?
                          reg44[(2'h2):(1'h0)] : reg76) : {(~|wire34)}) : $signed($unsigned(reg44)));
            end
        end
      else
        begin
          reg74 <= $signed(({((wire35 == (8'hb0)) ?
                      ((8'hae) <= reg67) : (^reg55)),
                  $signed((reg77 ? wire37 : (8'h9f)))} ?
              reg63 : {$signed({(8'hb7), wire46})}));
          reg75 <= (|reg60);
          reg76 <= ((reg75 - ($signed((wire34 & wire36)) ?
                  (|(reg43 < reg70)) : $signed((reg70 ^ wire34)))) ?
              (reg63 ?
                  $signed(((wire41 != reg68) ?
                      $unsigned(reg56) : $unsigned(wire39))) : wire33[(3'h7):(1'h1)]) : reg78[(1'h1):(1'h1)]);
          reg77 <= $unsigned(reg45[(3'h5):(3'h4)]);
        end
      reg79 <= ((^~((reg76 <<< wire37) ? $unsigned(reg72) : $signed(wire65))) ?
          (~&((~^(reg67 << reg76)) ?
              reg72[(3'h5):(1'h1)] : (|(reg72 ?
                  wire39 : reg71)))) : reg44[(3'h4):(2'h3)]);
      if (reg43[(4'he):(4'hb)])
        begin
          if ((~^(reg58[(3'h4):(1'h0)] ?
              (wire31[(3'h6):(1'h1)] ?
                  wire31[(1'h0):(1'h0)] : ((~&reg67) ?
                      {reg55, wire50} : $unsigned(reg55))) : ((+(wire36 ?
                  reg79 : reg75)) ^ reg66[(2'h3):(1'h1)]))))
            begin
              reg80 <= reg45[(4'ha):(2'h2)];
              reg81 <= (reg78 ^ ($unsigned($unsigned($signed(reg74))) - (wire48 <= $signed(reg60[(4'he):(1'h0)]))));
              reg82 <= $signed(reg75);
              reg83 <= $signed({{$signed((reg76 ? reg57 : reg76))},
                  {reg70[(2'h2):(1'h1)], ($signed(wire46) - $signed(reg44))}});
            end
          else
            begin
              reg80 <= (^~((|({(8'hb1), reg56} ?
                      $unsigned(wire33) : ((7'h43) ? reg66 : reg58))) ?
                  {reg83[(3'h4):(1'h1)]} : ((|(reg51 >> reg72)) + reg45[(4'h8):(3'h5)])));
              reg81 <= $signed(wire73[(1'h1):(1'h1)]);
              reg82 <= (-(8'hb4));
            end
          reg84 <= (&$unsigned((-(reg53 ?
              $unsigned((8'h9f)) : $unsigned(reg59)))));
          reg85 <= reg82;
          reg86 <= wire47;
          reg87 <= ($unsigned((&$signed((reg63 + wire73)))) ?
              $signed(reg70) : reg42);
        end
      else
        begin
          reg80 <= (~reg87);
          reg81 <= (8'h9f);
          reg82 <= $unsigned(($signed(((reg67 >>> reg79) ?
                  reg75 : {reg74, reg69})) ?
              {reg55[(3'h4):(2'h3)],
                  ((reg86 >= reg62) | reg54[(5'h10):(1'h1)])} : $signed($signed(reg78))));
        end
    end
endmodule

module module167
#(parameter param182 = ((&(^~{((8'ha7) >>> (8'had)), ((7'h42) ? (8'hb3) : (8'hb4))})) ? (+({(^(7'h41))} ? {(-(8'ha9))} : (((8'hac) ? (7'h42) : (8'ha4)) >= (-(8'ha3))))) : ((((~^(8'hb1)) ^~ ((8'hbe) || (8'hae))) ? (~((8'hab) ^~ (8'hb0))) : (|((8'h9f) ^ (8'ha0)))) ? (~(((8'hb9) ? (8'hb5) : (7'h40)) ? (&(8'hbf)) : ((8'ha1) ? (7'h43) : (8'ha2)))) : ((~&{(7'h40)}) | (!(^(8'hbb)))))), 
parameter param183 = (param182 > (~^(-({(8'hbe)} != param182)))))
(y, clk, wire171, wire170, wire169, wire168);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire171;
  input wire [(4'ha):(1'h0)] wire170;
  input wire [(3'h4):(1'h0)] wire169;
  input wire [(4'hb):(1'h0)] wire168;
  wire [(3'h6):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire180;
  wire [(4'h8):(1'h0)] wire172;
  reg [(5'h12):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire172,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire172 = (~^(wire170[(4'ha):(3'h6)] - {wire170}));
  always
    @(posedge clk) begin
      if (wire172)
        begin
          reg173 <= wire169[(2'h2):(2'h2)];
          reg174 <= (wire168[(1'h1):(1'h0)] ?
              ($signed($signed($unsigned(wire170))) ?
                  $signed((wire171[(4'ha):(3'h7)] ?
                      {wire170} : (wire170 ?
                          reg173 : (8'hb2)))) : (~(wire171[(1'h1):(1'h1)] + $unsigned(wire168)))) : $signed(wire172[(3'h4):(2'h3)]));
        end
      else
        begin
          if (reg173[(4'h9):(2'h2)])
            begin
              reg173 <= $unsigned(wire168[(3'h5):(1'h0)]);
              reg174 <= {wire172};
              reg175 <= (~^wire172[(2'h2):(1'h0)]);
              reg176 <= $unsigned(reg175);
              reg177 <= {$signed($signed($signed(reg173)))};
            end
          else
            begin
              reg173 <= ((!{(wire168 ? (8'ha0) : ((8'hb2) ? wire172 : reg176)),
                  (^~reg174[(4'hc):(3'h6)])}) >> $signed({$unsigned($signed(reg174))}));
              reg174 <= $unsigned(((8'hbb) || reg174[(4'h8):(3'h7)]));
              reg175 <= (&$unsigned(reg173[(2'h3):(1'h0)]));
              reg176 <= {(({$unsigned((8'haa)),
                          {wire172}} || wire168[(4'h8):(3'h7)]) ?
                      (~&reg177) : $unsigned((reg175[(2'h3):(2'h3)] <<< $signed(reg173))))};
              reg177 <= wire169[(2'h3):(1'h1)];
            end
          reg178 <= $unsigned(((~((reg173 - wire170) ? reg177 : (|wire171))) ?
              (~&$signed((wire169 ? wire168 : (8'haf)))) : ($unsigned(wire171) ?
                  wire168[(4'h9):(2'h3)] : (wire171[(2'h2):(1'h1)] + $unsigned(reg175)))));
        end
      reg179 <= wire168;
    end
  assign wire180 = (~&(~&($unsigned((wire172 ?
                       reg178 : reg174)) != ($unsigned(reg179) ?
                       $unsigned(reg173) : ((7'h40) > reg179)))));
  assign wire181 = ((~^(8'ha7)) ?
                       ({($unsigned((8'h9f)) ? $unsigned(wire171) : {wire168}),
                               {(reg174 ? wire169 : wire180)}} ?
                           (~|wire180) : (~|wire170[(2'h3):(1'h1)])) : ((+reg179) >> $unsigned(({wire172} | $unsigned(reg177)))));
endmodule

module module118
#(parameter param162 = ((((((8'hbf) + (8'hb1)) ? (~&(8'ha2)) : ((8'hbe) ? (8'ha8) : (7'h44))) ? {((7'h44) >= (8'ha8))} : ({(8'ha0)} - (!(8'haa)))) != ((((8'hbd) > (8'h9e)) ? ((8'hae) ? (7'h42) : (8'h9d)) : (~&(7'h44))) ? (((8'hac) ? (7'h44) : (8'hba)) ? ((8'hb3) * (8'haf)) : (~(8'hb1))) : ({(8'haf)} ? ((8'hb4) >>> (7'h43)) : ((8'h9c) ? (8'ha5) : (8'hbf))))) ? (+((((8'had) ? (8'hbf) : (8'h9c)) == ((8'hbe) ? (8'hba) : (8'hb2))) ^~ (!((8'ha6) ~^ (8'had))))) : (~^(!(~^(8'haf))))), 
parameter param163 = param162)
(y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire122;
  input wire signed [(5'h15):(1'h0)] wire121;
  input wire [(5'h15):(1'h0)] wire120;
  input wire [(2'h2):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire152;
  wire signed [(3'h7):(1'h0)] wire151;
  wire signed [(4'hc):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire123;
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire123,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
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
                 reg133,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire123 = wire120[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg124 <= (-(wire119[(1'h1):(1'h1)] ?
          (wire120[(4'hc):(3'h7)] ~^ (-wire120)) : wire121));
      reg125 <= {$signed(((((8'h9e) ? (8'hb7) : (8'hb5)) ^~ (wire123 ?
              wire119 : wire119)) < $signed(reg124[(4'h8):(3'h5)])))};
      reg126 <= ((reg124[(3'h5):(1'h1)] ?
              ((8'hb8) ?
                  (8'h9d) : {$signed(wire120),
                      (wire122 ?
                          wire120 : wire119)}) : $unsigned($unsigned((wire123 ?
                  wire120 : (8'hba))))) ?
          (&$signed((^wire122))) : $unsigned(((8'ha0) >> ($unsigned(wire119) ?
              reg125[(4'hd):(4'h9)] : $unsigned(wire123)))));
    end
  assign wire127 = ((^$signed(((-wire120) & $signed(reg125)))) <= ((wire120 >>> $unsigned((reg124 != wire123))) && {(|(8'hb5))}));
  assign wire128 = $signed((wire121[(4'hf):(4'ha)] >> $unsigned((^~$unsigned((8'hb1))))));
  assign wire129 = $unsigned({($signed((~&wire127)) ?
                           (~((8'ha6) & wire128)) : wire121[(4'he):(2'h2)])});
  assign wire130 = reg124;
  assign wire131 = (~(-({wire130} <= $unsigned((reg126 >= (8'hb2))))));
  assign wire132 = $unsigned($unsigned(wire128[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      if (({($signed($unsigned(reg126)) ?
              $signed(reg124) : $signed(wire129[(4'hf):(4'hb)])),
          ({(wire119 ?
                  wire129 : wire121)} ^~ wire131[(3'h4):(1'h0)])} != {(^{wire130[(1'h0):(1'h0)]})}))
        begin
          reg133 <= wire127;
          if (reg125[(4'hb):(1'h1)])
            begin
              reg134 <= (^wire129[(2'h2):(1'h1)]);
              reg135 <= ((reg134 ?
                  $signed($signed(reg126)) : $signed(((wire129 * wire120) - (reg126 ?
                      reg124 : wire127)))) && reg124);
              reg136 <= (^{wire128[(3'h6):(3'h6)]});
            end
          else
            begin
              reg134 <= $unsigned($unsigned(wire130));
              reg135 <= $unsigned((+reg133));
            end
          reg137 <= $signed({({$unsigned(reg126)} + $signed((wire127 ?
                  wire131 : reg124))),
              $signed($unsigned($signed(wire122)))});
          reg138 <= ((~$signed(wire119[(2'h2):(2'h2)])) ?
              (+$unsigned((+(+reg125)))) : wire119[(1'h0):(1'h0)]);
          reg139 <= (8'had);
        end
      else
        begin
          reg133 <= wire121;
        end
      if ($signed({wire129, ((&$signed(wire132)) < reg139[(4'hf):(3'h4)])}))
        begin
          reg140 <= reg124[(3'h7):(2'h2)];
          reg141 <= (|reg137);
          if ({($signed(wire123) ? {wire129, $unsigned((|reg135))} : reg137)})
            begin
              reg142 <= wire131;
            end
          else
            begin
              reg142 <= ((reg124[(3'h6):(1'h1)] ?
                  (+(-((8'hb4) ? wire129 : reg126))) : (&((reg137 ?
                          reg138 : wire131) ?
                      (~wire120) : wire132[(3'h7):(3'h4)]))) >> {(-(~^wire120)),
                  ({{(8'hb8)}} ?
                      (wire121[(2'h3):(2'h2)] << (~|reg133)) : (reg142[(3'h6):(2'h3)] ?
                          (reg140 ? reg138 : wire120) : (wire121 ?
                              wire132 : reg140)))});
              reg143 <= (8'hbc);
            end
        end
      else
        begin
          reg140 <= {(wire131[(1'h1):(1'h0)] ?
                  (&(8'hbb)) : ({$signed(wire121)} || (reg139[(4'he):(1'h0)] & reg126[(2'h3):(1'h0)])))};
          if ($unsigned((reg137[(2'h3):(2'h2)] ?
              (-reg142[(1'h1):(1'h0)]) : wire128)))
            begin
              reg141 <= $unsigned(reg125[(3'h4):(2'h2)]);
            end
          else
            begin
              reg141 <= $signed(wire128);
              reg142 <= ({(~|$signed(reg136[(1'h0):(1'h0)]))} ?
                  $signed((reg137 ?
                      (wire128[(1'h1):(1'h1)] ~^ (reg134 ?
                          reg141 : wire120)) : (~&(reg140 ?
                          reg141 : wire132)))) : wire131[(2'h2):(2'h2)]);
              reg143 <= $unsigned($unsigned($unsigned((^(!wire131)))));
              reg144 <= (($signed({{wire127},
                      (reg125 ? wire127 : reg133)}) || $signed({(&wire127)})) ?
                  {($unsigned((reg141 < reg124)) ?
                          $unsigned((reg134 ?
                              wire121 : wire130)) : (&(reg142 ^~ reg141))),
                      reg136} : (wire129 ?
                      ($unsigned((!reg140)) ?
                          (wire123[(1'h0):(1'h0)] >> reg125[(3'h7):(1'h1)]) : reg124[(1'h1):(1'h1)]) : (8'h9e)));
              reg145 <= reg124;
            end
        end
      reg146 <= $unsigned(reg137);
    end
  always
    @(posedge clk) begin
      if (reg135[(1'h0):(1'h0)])
        begin
          reg147 <= (~&(wire131 > ((((8'ha8) || reg126) > $unsigned(reg126)) <= (&$unsigned(reg139)))));
          reg148 <= wire121;
          reg149 <= $signed((-wire123[(2'h3):(1'h0)]));
        end
      else
        begin
          reg147 <= $signed($signed(($unsigned(reg146[(5'h12):(4'ha)]) ?
              wire122[(3'h4):(2'h3)] : {(reg145 ? wire123 : reg133)})));
          reg148 <= (wire128[(1'h1):(1'h0)] <= $unsigned((reg125 > reg144)));
        end
    end
  assign wire150 = wire119;
  assign wire151 = ($unsigned(wire131) - wire150);
  assign wire152 = (reg143[(4'ha):(4'ha)] || $unsigned((8'haf)));
  assign wire153 = {$signed(reg134[(1'h1):(1'h1)])};
  always
    @(posedge clk) begin
      if ($unsigned($signed({$unsigned((|wire122))})))
        begin
          if ({(!reg124)})
            begin
              reg154 <= wire151[(1'h1):(1'h0)];
              reg155 <= wire128;
              reg156 <= $unsigned(wire119[(1'h1):(1'h1)]);
            end
          else
            begin
              reg154 <= {((^reg124) <= reg137[(1'h1):(1'h0)])};
            end
          reg157 <= (~^(~($signed({wire131}) ?
              (wire152[(3'h6):(3'h4)] <= (reg142 < wire129)) : wire131[(1'h1):(1'h0)])));
          reg158 <= reg137[(2'h2):(2'h2)];
          reg159 <= $signed(($unsigned(wire130[(2'h3):(2'h3)]) > wire151));
          reg160 <= reg154;
        end
      else
        begin
          reg154 <= $unsigned((reg140 ?
              $unsigned($unsigned($signed(reg137))) : ((8'ha7) >> $signed($signed(reg155)))));
          reg155 <= (((~&wire128) ?
                  reg125[(3'h5):(3'h4)] : (~(reg147[(4'h8):(3'h4)] <= $unsigned(reg138)))) ?
              (~^$unsigned((-(reg134 + reg124)))) : ($signed((reg145[(2'h3):(1'h0)] ?
                  $unsigned(reg143) : (8'hba))) & (reg140[(2'h3):(1'h1)] ?
                  $signed((reg158 ?
                      (8'hae) : reg146)) : (reg135[(4'ha):(4'h8)] ?
                      (|wire128) : $signed((8'ha3))))));
        end
      reg161 <= reg133[(1'h0):(1'h0)];
    end
endmodule
