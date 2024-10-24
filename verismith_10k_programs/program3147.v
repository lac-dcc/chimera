module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h255):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire122;
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire122,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= {$unsigned(wire1),
          (|(($signed(wire2) ^~ $signed(wire3)) ?
              $unsigned($unsigned(wire4)) : {(&wire3)}))};
      reg6 <= wire3;
      if (({$unsigned(wire2)} >>> reg5))
        begin
          reg7 <= ((($signed(reg6[(4'ha):(2'h3)]) ?
                  wire0 : ((reg5 != wire2) - wire3)) - $signed((~^{(7'h42)}))) ?
              wire2 : (^($unsigned(wire1[(4'h8):(2'h2)]) || (8'h9e))));
          reg8 <= $signed({(8'hb4), $signed(wire4[(1'h1):(1'h1)])});
          reg9 <= $unsigned(wire4[(1'h1):(1'h1)]);
          reg10 <= ({(wire3 <= ((|(8'ha0)) << $signed(reg9))),
              reg8[(1'h0):(1'h0)]} || $signed(reg9));
        end
      else
        begin
          if (wire4[(1'h1):(1'h1)])
            begin
              reg7 <= {$unsigned((~&wire3[(4'ha):(4'h8)]))};
            end
          else
            begin
              reg7 <= (8'h9e);
            end
          if ($signed((8'hb7)))
            begin
              reg8 <= $unsigned(reg6);
              reg9 <= ((reg9 ?
                      {{reg10[(1'h1):(1'h0)], $signed(reg8)},
                          reg10[(3'h5):(3'h4)]} : reg6) ?
                  ((~|$signed(wire3[(2'h2):(1'h1)])) * wire3) : $signed($signed(((|reg5) == ((8'hbb) & wire1)))));
              reg10 <= reg10[(1'h0):(1'h0)];
              reg11 <= (reg9[(3'h5):(2'h2)] ?
                  (~$signed($signed(reg10))) : ((reg5 || $signed($unsigned(reg6))) ?
                      reg9 : ({wire2[(5'h14):(4'hf)]} ~^ ($signed(reg10) ?
                          (8'hb2) : (wire1 ? (8'ha7) : reg5)))));
            end
          else
            begin
              reg8 <= $signed($unsigned($signed(wire4)));
            end
          reg12 <= ({reg6,
              {wire1[(1'h1):(1'h1)],
                  $unsigned((reg5 ? wire4 : wire1))}} | ({(~|{(8'ha9), reg7}),
              $signed($signed(reg11))} + reg6[(1'h1):(1'h0)]));
          reg13 <= reg10;
        end
      reg14 <= wire4;
      if ($signed(((~|(&(8'haf))) ? wire2[(4'hb):(2'h2)] : $unsigned(reg12))))
        begin
          if ((^(^~$unsigned(reg9[(3'h4):(1'h1)]))))
            begin
              reg15 <= (~^$signed(reg13[(4'ha):(1'h1)]));
              reg16 <= (~^($signed((wire1[(1'h1):(1'h0)] & $unsigned(reg12))) ?
                  (($unsigned(reg7) <= (wire0 != reg9)) && $unsigned($signed((8'ha3)))) : reg15[(4'h9):(2'h2)]));
              reg17 <= reg16[(1'h0):(1'h0)];
              reg18 <= (|($unsigned({(^reg6)}) ?
                  reg9[(1'h1):(1'h0)] : $signed(((wire4 + reg8) ?
                      (reg10 ? wire0 : (8'hbf)) : wire0))));
              reg19 <= reg15[(4'he):(1'h0)];
            end
          else
            begin
              reg15 <= $signed($unsigned((reg15 ?
                  reg16[(2'h3):(1'h1)] : $signed((|reg14)))));
            end
          reg20 <= reg18;
          reg21 <= ((^~(reg6 == $unsigned($signed(wire3)))) ^ (~^{$unsigned((!reg6)),
              $signed({wire0, reg18})}));
          if ((^(($unsigned((8'ha0)) | ($signed(wire3) ?
              (~reg10) : (!reg17))) <<< (reg13 ^~ ($unsigned((8'hb8)) ~^ (wire2 ?
              reg14 : reg8))))))
            begin
              reg22 <= ({($signed((reg13 < reg8)) >> ((^reg15) ?
                          reg8[(4'h8):(3'h4)] : reg7[(1'h0):(1'h0)])),
                      reg6} ?
                  (reg18 ?
                      reg11 : (~|$unsigned($signed(reg5)))) : $signed(reg9[(2'h2):(1'h0)]));
              reg23 <= (~(^~$unsigned((~|(wire3 ? reg21 : reg19)))));
              reg24 <= (~|reg19[(1'h1):(1'h1)]);
            end
          else
            begin
              reg22 <= (~|$unsigned(($signed({wire0}) ?
                  reg6 : reg22[(2'h2):(1'h1)])));
              reg23 <= ($signed(({(^wire1), (~reg20)} ?
                  $signed($unsigned(reg14)) : reg22[(5'h10):(3'h7)])) && (~{(reg10 | reg8[(3'h4):(2'h2)]),
                  reg21[(3'h6):(2'h2)]}));
              reg24 <= ($unsigned((8'h9d)) & $signed(($signed(reg7[(2'h3):(1'h0)]) ^ (wire3[(3'h4):(1'h0)] | reg8[(4'h9):(4'h9)]))));
              reg25 <= (8'hb5);
              reg26 <= {(($unsigned((-reg8)) ?
                          reg8 : ((-reg8) ?
                              ((8'hae) - reg22) : $signed(reg12))) ?
                      wire2 : reg18)};
            end
        end
      else
        begin
          reg15 <= ({((^reg21) ?
                      $signed(reg10) : ((reg25 || reg13) ? reg6 : reg15)),
                  $signed((wire0[(3'h6):(2'h2)] ? $signed(reg18) : reg13))} ?
              $signed(reg21[(3'h5):(2'h2)]) : reg16);
        end
    end
  assign wire27 = reg14[(1'h0):(1'h0)];
  assign wire28 = (^reg15[(4'h8):(1'h0)]);
  assign wire29 = ({{wire4}} ?
                      ({$unsigned((wire27 || wire2)),
                          ($unsigned((8'hb7)) || {wire3})} <= reg9[(1'h1):(1'h0)]) : reg21);
  assign wire30 = $signed(reg10[(3'h5):(3'h4)]);
  assign wire31 = reg16;
  assign wire32 = (wire3[(3'h5):(1'h1)] != ((^reg19[(3'h7):(1'h1)]) ?
                      reg8[(2'h2):(1'h1)] : $signed($unsigned((reg10 != reg15)))));
  module33 #() modinst123 (wire122, clk, reg13, wire27, reg11, reg12, reg18);
  always
    @(posedge clk) begin
      if ($unsigned((((reg5 ?
          $signed(reg10) : {reg10, reg6}) | $unsigned(wire28)) != (+(8'had)))))
        begin
          reg124 <= {($unsigned($signed((-wire31))) ?
                  reg17[(2'h2):(2'h2)] : (reg10[(2'h2):(2'h2)] < reg6[(3'h6):(2'h3)]))};
        end
      else
        begin
          reg124 <= wire4;
          if (reg13)
            begin
              reg125 <= $unsigned((reg24 ~^ ($signed((&wire1)) ?
                  (reg10[(2'h2):(1'h1)] == (reg25 < (8'hb8))) : (-$signed((8'hbc))))));
              reg126 <= (|reg26[(2'h2):(1'h1)]);
              reg127 <= reg17;
            end
          else
            begin
              reg125 <= {$signed((|(reg8 | (reg125 > reg127)))),
                  $signed(wire28[(4'hd):(2'h2)])};
              reg126 <= {((reg5[(5'h10):(4'hc)] ?
                      reg26[(3'h5):(3'h4)] : ($signed(wire122) || (wire2 < reg26))) << ($unsigned(wire0[(2'h2):(1'h1)]) >= {((7'h41) ?
                          reg10 : wire30)}))};
              reg127 <= {reg13[(4'h8):(3'h5)]};
              reg128 <= ((~|reg22[(5'h12):(2'h3)]) <= (reg26[(4'h8):(3'h6)] ~^ $unsigned($signed(reg12[(3'h5):(1'h1)]))));
            end
          reg129 <= $signed({(&($signed(reg16) ?
                  reg13 : (reg6 ? wire0 : (7'h41))))});
          reg130 <= reg125;
          reg131 <= (~|{({wire4[(1'h1):(1'h0)],
                  reg130} >= $unsigned((!reg129)))});
        end
      reg132 <= $unsigned($signed($unsigned(reg17)));
      reg133 <= reg14[(4'h8):(1'h1)];
      reg134 <= $unsigned((((~wire122[(3'h6):(3'h4)]) >>> reg126) ?
          ((-wire122[(4'h8):(2'h2)]) * ({wire2, (8'hb5)} ?
              $unsigned(wire3) : $signed(reg10))) : (wire30 ~^ $unsigned((^reg10)))));
      reg135 <= ($unsigned(wire122[(3'h7):(3'h7)]) ?
          ((8'ha7) ^ (~&(reg26[(2'h2):(1'h1)] ?
              (8'h9c) : reg21[(2'h2):(2'h2)]))) : $signed($signed(reg19)));
    end
  assign wire136 = $signed((({(wire27 * reg126),
                           (reg22 ? (8'ha1) : reg15)} <= ($unsigned(reg17) ?
                           reg9 : (~wire4))) ?
                       (((reg14 ?
                           reg6 : reg126) || (reg7 ~^ reg9)) << ((8'hac) || $unsigned(wire2))) : $unsigned($unsigned($unsigned(reg11)))));
  assign wire137 = ($signed(wire27[(5'h10):(3'h4)]) ?
                       $unsigned((8'haa)) : ($signed((-(|reg26))) || (((~reg18) != wire28[(4'hc):(4'h9)]) ?
                           $signed(reg130[(4'hf):(2'h2)]) : $signed((reg127 ?
                               reg17 : reg22)))));
  assign wire138 = reg130[(5'h14):(4'h8)];
  assign wire139 = $signed($signed($signed(($signed(reg132) ?
                       (reg124 ? reg135 : reg129) : ((7'h43) ?
                           wire4 : reg24)))));
  assign wire140 = wire32[(3'h7):(2'h2)];
  assign wire141 = reg23[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg142 <= $signed((reg24[(1'h0):(1'h0)] ^~ (!($unsigned((8'hb6)) == (wire28 ^ reg130)))));
      reg143 <= wire141[(3'h4):(1'h1)];
      reg144 <= wire122;
      reg145 <= (+(((~|(!reg21)) ?
              ((~|reg18) ? (wire122 ~^ reg11) : $signed((8'ha9))) : ((reg16 ?
                  reg25 : wire32) <<< (!reg128))) ?
          (&(^~(wire32 ^~ (8'ha1)))) : $unsigned(wire2[(2'h3):(1'h0)])));
    end
endmodule

module module33
#(parameter param120 = ((&((8'hb6) >>> (-(-(8'hae))))) < (~(((|(7'h42)) <= ((8'ha7) >> (8'hae))) - (((8'hba) == (8'hb4)) | (8'ha9))))), 
parameter param121 = (({((~^param120) || (param120 ? (8'ha6) : param120)), ({param120, param120} >> {param120, param120})} ? param120 : (((~|param120) <= (~^param120)) <= (^~(param120 ? (8'hb2) : param120)))) | (8'h9f)))
(y, clk, wire34, wire35, wire36, wire37, wire38);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire signed [(4'h8):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire113;
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  assign y = {wire119,
                 wire116,
                 wire115,
                 wire39,
                 wire40,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire67,
                 wire113,
                 reg118,
                 reg117,
                 reg41,
                 reg42,
                 (1'h0)};
  assign wire39 = $signed({($unsigned(wire38) >= wire34[(4'h9):(3'h6)]),
                      wire36});
  assign wire40 = wire36[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg41 <= wire34;
      reg42 <= $unsigned((($unsigned((|wire40)) ?
          ((wire39 ? (8'hac) : wire34) ?
              wire37[(2'h2):(1'h1)] : $unsigned(wire39)) : $signed(reg41)) == $signed((~^$unsigned(wire36)))));
    end
  assign wire43 = ({(8'hbb)} ?
                      (wire37[(1'h1):(1'h1)] < $unsigned(((wire39 ?
                          wire39 : wire39) != (reg42 ?
                          (8'hae) : (8'hab))))) : wire35);
  assign wire44 = (~(($unsigned(((8'hb7) << wire43)) ?
                          wire35 : (wire43 ? (wire35 | (8'hb5)) : (~&wire40))) ?
                      (!wire37[(1'h1):(1'h1)]) : (reg41[(2'h3):(1'h0)] ?
                          {(wire38 ? wire36 : wire40)} : ($unsigned(wire36) ?
                              wire43[(4'ha):(2'h2)] : (wire43 ?
                                  reg41 : wire40)))));
  assign wire45 = $signed(wire40);
  assign wire46 = $unsigned($unsigned($unsigned(wire43[(3'h5):(1'h0)])));
  module47 #() modinst68 (wire67, clk, wire45, wire46, reg42, wire43, wire39);
  module69 #() modinst114 (wire113, clk, wire34, wire35, wire37, wire46, wire43);
  assign wire115 = reg42[(2'h3):(2'h3)];
  assign wire116 = (((wire34 ?
                           {wire39} : wire36[(1'h1):(1'h0)]) + $unsigned($unsigned($unsigned(wire38)))) ?
                       wire34 : (~wire36[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg117 <= wire45;
      reg118 <= $unsigned(wire39[(1'h0):(1'h0)]);
    end
  assign wire119 = {$unsigned((wire45 + (wire67 <<< (wire39 ?
                           wire36 : reg41)))),
                       wire35};
endmodule

module module69
#(parameter param112 = {(((((8'hba) ~^ (8'had)) != ((8'ha6) ? (8'ha7) : (7'h43))) ~^ (((8'hba) >= (8'had)) || ((8'haf) ^ (8'hbd)))) == (+{{(8'ha2), (8'haf)}, ((8'ha3) == (8'ha4))})), ((((|(8'hb9)) ? (+(8'had)) : ((8'ha4) ? (8'hbe) : (8'h9e))) ? (8'ha1) : ({(8'hbc), (7'h44)} ? ((8'hb7) ~^ (8'hb8)) : {(8'haf), (7'h43)})) ? (((~^(8'ha5)) ? (!(8'hbe)) : (~^(8'hb4))) & (~((8'hba) != (8'ha0)))) : (~{(~|(7'h44)), (~|(8'ha0))}))})
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire74;
  input wire signed [(5'h15):(1'h0)] wire73;
  input wire signed [(4'h8):(1'h0)] wire72;
  input wire signed [(4'ha):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire103,
                 wire102,
                 wire98,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg101,
                 reg100,
                 reg99,
                 reg97,
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
                 (1'h0)};
  assign wire75 = (wire71[(3'h7):(1'h0)] + wire71);
  assign wire76 = $unsigned($signed(wire71[(3'h6):(1'h0)]));
  assign wire77 = ((((8'ha4) < (^~(wire70 == wire74))) ?
                      (^~((~&wire76) ?
                          $signed(wire72) : $signed(wire70))) : $unsigned($signed($signed(wire73)))) + $signed((~&((-wire74) ?
                      (8'hb3) : wire70[(5'h11):(1'h1)]))));
  assign wire78 = $unsigned((wire73 >>> wire76[(3'h5):(3'h5)]));
  assign wire79 = $signed((^~({(wire70 ?
                          wire78 : wire76)} >>> wire70[(4'he):(3'h7)])));
  assign wire80 = wire77;
  assign wire81 = $signed(wire76[(4'he):(4'h9)]);
  assign wire82 = $unsigned(((wire78 <<< $signed(wire72)) ?
                      $unsigned(wire77) : {wire78,
                          ($signed(wire77) ^ wire78[(3'h5):(1'h0)])}));
  assign wire83 = ((~|wire73[(4'hc):(3'h7)]) * wire79[(2'h3):(1'h0)]);
  assign wire84 = $unsigned((((wire81 << (wire75 ?
                          wire72 : wire81)) && $signed((wire82 ^ wire72))) ?
                      (wire82 > ((wire78 ?
                          wire75 : (8'hb2)) && wire80)) : $unsigned({wire75})));
  always
    @(posedge clk) begin
      if ((~|wire75[(2'h3):(1'h1)]))
        begin
          reg85 <= ((wire72 ?
              wire78 : wire83[(2'h2):(1'h1)]) || $unsigned({($unsigned(wire75) ?
                  (wire76 >= wire81) : wire75)}));
        end
      else
        begin
          reg85 <= $unsigned($signed({$unsigned($unsigned(wire84)),
              $unsigned((-wire74))}));
          if ($signed(wire75[(1'h0):(1'h0)]))
            begin
              reg86 <= wire71;
            end
          else
            begin
              reg86 <= (~&($signed($unsigned($signed(wire77))) << $unsigned(wire70)));
              reg87 <= wire79[(3'h6):(3'h4)];
              reg88 <= $signed((+(&wire76)));
              reg89 <= {wire76, $signed(wire72)};
              reg90 <= (&((wire80 || $unsigned((&wire79))) ?
                  (^$signed((reg85 || (8'hb8)))) : $unsigned((|((7'h42) != wire78)))));
            end
          if ((8'hb2))
            begin
              reg91 <= $signed(wire83);
            end
          else
            begin
              reg91 <= reg85;
              reg92 <= $unsigned(wire77[(4'ha):(1'h0)]);
              reg93 <= ($signed(wire78) ^~ (|(~|$signed(wire75))));
              reg94 <= reg91[(1'h1):(1'h0)];
              reg95 <= wire80;
            end
          reg96 <= {((((reg85 ? reg94 : wire80) ?
                      reg92 : $unsigned(reg93)) != (~^$unsigned(wire75))) ?
                  (&reg95[(2'h2):(1'h0)]) : ($unsigned({reg90,
                      reg87}) >> (~^wire84)))};
        end
      reg97 <= $signed(wire82[(1'h0):(1'h0)]);
    end
  assign wire98 = $signed($signed(reg96[(4'hb):(4'ha)]));
  always
    @(posedge clk) begin
      reg99 <= ($signed(wire73) ?
          (~(^$signed((reg88 ?
              wire98 : reg93)))) : $signed(((wire75[(4'h8):(1'h1)] != reg96[(5'h12):(3'h5)]) != ($signed(wire82) >>> reg95))));
      reg100 <= (wire70[(4'h9):(4'h8)] != wire76[(5'h12):(4'h8)]);
      reg101 <= $signed({$signed((((8'hbd) ? reg97 : wire82) - (~|wire81)))});
    end
  assign wire102 = reg95;
  assign wire103 = ((!(8'ha0)) << (((^((8'hb1) >>> reg88)) ?
                           reg100[(4'hd):(4'h9)] : $signed(wire79)) ?
                       $unsigned((~|{wire82})) : (~|(wire83 << $signed(wire75)))));
  always
    @(posedge clk) begin
      reg104 <= (reg99[(1'h0):(1'h0)] | {$unsigned(($unsigned((7'h40)) != (~reg90)))});
      reg105 <= ((!$unsigned((^(reg94 ? wire77 : reg96)))) << reg86);
      reg106 <= wire84[(2'h2):(1'h0)];
      reg107 <= (~^reg90[(4'h8):(1'h0)]);
    end
  assign wire108 = ((wire71 << $unsigned((~&wire75))) <= (+{wire74}));
  assign wire109 = $unsigned($signed(((^~$signed((8'ha5))) ?
                       reg89[(3'h6):(1'h0)] : wire74[(4'hd):(3'h4)])));
  assign wire110 = ((^$signed(wire82[(3'h5):(1'h1)])) ~^ $signed($unsigned($unsigned(wire108))));
  assign wire111 = $unsigned($unsigned((+((reg87 ? wire109 : reg91) ?
                       $signed(wire78) : (wire83 ? wire83 : wire81)))));
endmodule

module module47
#(parameter param65 = ((8'haa) ^ ((8'hbf) ? {((~(8'ha7)) ? ((8'ha8) ? (7'h43) : (8'ha9)) : ((8'hbf) > (8'ha4)))} : {(8'hbf), (+((8'h9d) ? (8'hb9) : (8'haf)))})), 
parameter param66 = ((({{param65}} ? (~^(~|(8'hbc))) : param65) ? (param65 ? ((param65 | param65) == (param65 <= param65)) : ((param65 << param65) - ((8'hb5) <= (8'h9f)))) : {(((8'hb2) - param65) <= (param65 != param65))}) ? (~^param65) : (param65 * param65)))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire52;
  input wire [(4'hb):(1'h0)] wire51;
  input wire [(3'h5):(1'h0)] wire50;
  input wire [(3'h4):(1'h0)] wire49;
  input wire signed [(3'h4):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire53;
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 reg61,
                 reg60,
                 reg59,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = $unsigned($unsigned(wire49));
  always
    @(posedge clk) begin
      reg54 <= $unsigned(((&(wire52[(4'hb):(3'h4)] ?
          $signed(wire48) : wire53)) + (~wire50[(3'h4):(1'h0)])));
      reg55 <= $signed(wire50[(1'h0):(1'h0)]);
    end
  assign wire56 = wire52;
  assign wire57 = wire52[(3'h6):(3'h4)];
  assign wire58 = ((|wire48[(1'h0):(1'h0)]) ?
                      ((|((-(8'hb7)) ? (8'ha7) : (wire50 ? wire50 : wire48))) ?
                          (wire50[(2'h2):(1'h1)] ?
                              reg54[(2'h3):(1'h0)] : $signed($signed(wire48))) : $signed((~|wire57))) : (~$signed(((wire57 ?
                              wire49 : wire57) ?
                          {wire52, (7'h42)} : (^~(8'ha4))))));
  always
    @(posedge clk) begin
      reg59 <= wire48[(2'h3):(1'h1)];
      reg60 <= ($signed((|(wire53 == wire48[(1'h0):(1'h0)]))) ?
          reg54 : $unsigned($unsigned(reg59)));
    end
  always
    @(posedge clk) begin
      reg61 <= (reg55[(4'h8):(2'h2)] ?
          ($signed((~&{(8'ha0)})) * wire48) : (reg55[(2'h3):(1'h1)] ?
              {$signed((-wire58))} : ($signed($signed(wire58)) ?
                  ($signed(reg54) & $signed((8'ha1))) : reg55)));
    end
  assign wire62 = $signed(wire52[(3'h4):(2'h2)]);
  assign wire63 = wire57[(4'hc):(3'h4)];
  assign wire64 = (wire57[(3'h7):(3'h4)] ~^ ((wire50 <= (-wire51)) <= $signed(reg55)));
endmodule
