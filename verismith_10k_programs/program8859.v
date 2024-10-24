module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire162;
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire162,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire5 = $unsigned(($unsigned(wire4[(3'h7):(2'h3)]) <<< (wire2[(4'hb):(2'h3)] || ({wire4} && wire2[(4'h8):(2'h2)]))));
  assign wire6 = wire4[(2'h3):(2'h3)];
  assign wire7 = $unsigned({(($unsigned(wire5) || wire0) ?
                         {$unsigned(wire1)} : wire4)});
  always
    @(posedge clk) begin
      if (((|$signed((wire2 <= $signed(wire0)))) ?
          (~$signed($unsigned((~^wire4)))) : $signed($signed($unsigned($signed(wire1))))))
        begin
          if ($signed($signed(((-{(8'h9c), wire0}) ?
              ((wire6 <= wire5) ?
                  (wire5 ?
                      wire0 : wire7) : (wire1 ^~ (8'ha5))) : $signed((~wire7))))))
            begin
              reg8 <= wire4;
              reg9 <= wire3;
              reg10 <= (~|$signed($unsigned((^~$signed(wire5)))));
            end
          else
            begin
              reg8 <= (^(reg10 ?
                  wire7[(2'h3):(1'h0)] : $signed((reg8 <= ((8'hb0) ?
                      wire5 : reg10)))));
              reg9 <= (-wire4[(3'h7):(1'h0)]);
              reg10 <= reg10[(2'h2):(1'h0)];
            end
          reg11 <= $signed($signed(wire0[(1'h1):(1'h0)]));
          if ((wire7 >> $signed((8'h9f))))
            begin
              reg12 <= (!reg8);
              reg13 <= ((($signed((reg8 >> (8'ha4))) ?
                          (((8'ha4) + reg11) <= (wire2 || wire6)) : wire4[(2'h3):(1'h1)]) ?
                      wire1 : wire2[(4'ha):(2'h2)]) ?
                  wire1[(1'h1):(1'h0)] : (wire5 + ($unsigned($signed(wire7)) ?
                      (8'hb6) : $signed((-wire5)))));
              reg14 <= ((&$signed(wire2)) - $unsigned(wire4[(2'h3):(2'h2)]));
              reg15 <= $unsigned(($signed($unsigned((reg12 ?
                  (8'haa) : reg9))) ^~ wire0[(1'h1):(1'h0)]));
              reg16 <= ($signed($signed($signed((reg14 ?
                  reg9 : reg15)))) == (^~wire2[(4'h8):(2'h2)]));
            end
          else
            begin
              reg12 <= $unsigned($signed((reg11 ^ wire5[(2'h3):(2'h2)])));
              reg13 <= reg14[(1'h1):(1'h1)];
              reg14 <= $unsigned(($unsigned((~(wire7 - (8'ha3)))) ?
                  (wire1 ? wire4 : reg12[(3'h6):(2'h3)]) : $signed(reg15)));
              reg15 <= $signed($unsigned(({(|reg16)} && wire3)));
            end
          reg17 <= $unsigned($unsigned(reg8[(1'h0):(1'h0)]));
          reg18 <= {(8'hb0),
              ($unsigned((reg14 >>> wire4[(3'h7):(1'h1)])) >>> $signed({reg13,
                  $unsigned(wire4)}))};
        end
      else
        begin
          reg8 <= reg12[(4'h8):(1'h0)];
          reg9 <= (~|wire0[(1'h1):(1'h1)]);
          reg10 <= (~($unsigned({(8'hbe)}) ?
              $signed((reg8 ?
                  (reg14 > wire4) : $signed(reg16))) : (($unsigned(wire4) <= (^~reg11)) ^~ ((~^reg13) ?
                  $signed((8'ha7)) : (~&reg18)))));
          reg11 <= ((reg16 << ({$signed((8'hbf))} & (^{reg17,
              (8'ha2)}))) + reg14);
        end
    end
  assign wire19 = reg12[(4'h8):(4'h8)];
  assign wire20 = {(reg8 << {$unsigned((!reg8))}), wire1[(1'h0):(1'h0)]};
  assign wire21 = ($signed($unsigned({$unsigned(reg12)})) ?
                      wire7 : ((($unsigned(reg18) ?
                          reg16 : (wire0 ? reg8 : reg16)) < ($signed((7'h44)) ?
                          (8'h9f) : $signed(wire2))) - (|(^$unsigned(wire4)))));
  assign wire22 = {reg12[(2'h3):(1'h1)],
                      ($signed((8'hab)) ?
                          reg13[(3'h6):(3'h6)] : $unsigned(reg10[(2'h3):(1'h1)]))};
  assign wire23 = $unsigned(($signed((reg14[(1'h1):(1'h1)] & $signed(reg18))) <= {{$signed((8'hb1)),
                          (reg18 >= reg10)},
                      reg13[(4'h8):(4'h8)]}));
  assign wire24 = wire6;
  assign wire25 = $unsigned($unsigned($unsigned((reg13[(3'h5):(2'h2)] ~^ (8'ha7)))));
  always
    @(posedge clk) begin
      if ((($unsigned((~$unsigned(reg17))) * $unsigned(reg15[(3'h4):(1'h0)])) ?
          $signed(wire21) : (~&(~&($signed((8'ha7)) && reg14)))))
        begin
          reg26 <= reg8[(2'h3):(1'h0)];
          reg27 <= $unsigned({(((~wire20) ?
                  $signed(reg17) : (reg15 * wire7)) < (reg15[(1'h0):(1'h0)] ~^ $unsigned(reg9)))});
          reg28 <= $unsigned((wire6[(4'he):(4'h9)] + reg12));
          reg29 <= $unsigned(wire3[(3'h5):(1'h0)]);
          reg30 <= wire19[(1'h0):(1'h0)];
        end
      else
        begin
          reg26 <= (8'hb2);
          if (((reg8[(1'h1):(1'h0)] > ($unsigned((~^wire5)) ?
              wire0 : ((|reg8) ^~ wire1))) + $signed((((^~reg17) ?
              (wire5 >> reg29) : wire23) ^~ (!(8'hb6))))))
            begin
              reg27 <= $unsigned(($signed($unsigned((wire4 ?
                  reg11 : (8'hb9)))) ^~ ((wire6 ? (reg27 >= wire4) : wire22) ?
                  $unsigned((wire25 ? wire20 : wire24)) : {(-(8'h9c))})));
              reg28 <= {(wire4 ?
                      (({wire3} >= (wire19 ? reg14 : reg16)) ?
                          ($signed(reg17) + reg10[(3'h4):(1'h1)]) : ($unsigned(wire21) ^ $signed(wire19))) : reg18[(1'h0):(1'h0)]),
                  ((reg12[(3'h5):(3'h4)] | reg11) ?
                      (^~(reg26[(2'h3):(2'h3)] >>> (|wire20))) : reg30[(2'h2):(1'h0)])};
              reg29 <= wire7;
            end
          else
            begin
              reg27 <= ((~$signed(((reg26 >>> reg8) >>> reg27))) ?
                  wire25[(4'hc):(2'h3)] : wire23[(1'h1):(1'h1)]);
              reg28 <= ((|$unsigned(($signed(wire19) ?
                      {wire24} : $unsigned(wire4)))) ?
                  $signed(wire24) : (-wire24));
              reg29 <= wire25[(4'ha):(2'h2)];
              reg30 <= wire25[(2'h3):(2'h3)];
            end
          if (($signed(reg28) ?
              ($signed((reg11 * reg14)) ?
                  $unsigned((wire1[(1'h0):(1'h0)] ^~ (reg27 + reg27))) : $unsigned((!$signed((8'hb5))))) : ((reg26 ?
                      (reg8 ~^ (-wire6)) : $signed((^~(7'h43)))) ?
                  reg18 : {reg26[(3'h4):(1'h1)],
                      $signed(wire5[(3'h7):(3'h7)])})))
            begin
              reg31 <= wire2;
              reg32 <= ($signed((wire4 >> (wire7 ? (wire3 && reg17) : reg30))) ?
                  (~|(((~wire24) ?
                          $unsigned(reg16) : ((7'h43) ? reg26 : wire24)) ?
                      reg10 : $unsigned(reg26[(1'h1):(1'h1)]))) : (reg18 && {{(~|reg18),
                          $signed(reg12)}}));
            end
          else
            begin
              reg31 <= $unsigned(reg29);
            end
        end
    end
  always
    @(posedge clk) begin
      reg33 <= (wire6 < (&($unsigned(reg11) ?
          reg27[(5'h13):(4'hc)] : wire19[(3'h7):(3'h5)])));
      reg34 <= wire4;
      reg35 <= (wire19 && {$signed(($signed(wire1) ? reg9 : (reg28 >= wire7))),
          wire6[(1'h0):(1'h0)]});
      reg36 <= ($unsigned((+(&$unsigned(reg9)))) >= (reg30 ?
          $unsigned(reg28) : (($unsigned((8'ha6)) ?
              (^~(8'hbc)) : reg16[(4'hb):(3'h7)]) >> reg27)));
      reg37 <= {$unsigned($unsigned(reg27))};
    end
  assign wire38 = $unsigned((reg8[(2'h2):(1'h1)] ?
                      {({reg13} == (^reg37))} : $signed(reg29[(4'hb):(4'h9)])));
  assign wire39 = wire5[(2'h2):(2'h2)];
  assign wire40 = {((~|reg14[(2'h3):(2'h2)]) ?
                          $signed((wire25 * (&reg13))) : reg30[(1'h1):(1'h1)]),
                      {({(wire3 + wire22)} == $unsigned(reg15[(2'h2):(2'h2)]))}};
  assign wire41 = (reg14 ?
                      (&((^~$signed(reg32)) ^~ (~^(~|wire6)))) : wire19[(1'h0):(1'h0)]);
  assign wire42 = reg18;
  module43 #() modinst163 (.wire48(wire6), .wire47(wire42), .wire45(reg36), .wire44(wire0), .wire46(reg35), .clk(clk), .y(wire162));
  assign wire164 = (-$unsigned(reg14));
  assign wire165 = (wire23 ? reg14 : $unsigned($unsigned((+$unsigned(reg36)))));
  assign wire166 = (^~$signed(((~^((8'hbc) ? wire162 : wire20)) ?
                       (|wire165) : (^~{reg11}))));
  assign wire167 = ($unsigned(reg17[(4'he):(4'he)]) ?
                       wire39[(1'h1):(1'h1)] : $signed(($unsigned(((8'ha7) >>> wire22)) + wire39[(4'h8):(1'h1)])));
endmodule

module module43
#(parameter param160 = {{((8'ha6) ? {(8'haa)} : {(~(8'h9d))}), ((((8'hab) ^ (8'ha3)) == (&(8'hb5))) >= ((-(8'hae)) ? ((8'hb5) >>> (8'hbf)) : ((8'had) << (7'h44))))}, ({(((8'hac) <= (8'ha3)) ? (-(8'hb9)) : ((8'hb8) == (8'hab))), ((+(8'hb8)) ? ((8'haf) < (8'h9e)) : ((8'hb0) <= (7'h44)))} ? {{((8'had) ? (7'h43) : (8'ha3)), (^(7'h44))}} : (((|(8'h9c)) ? ((8'hb5) >>> (8'hac)) : ((8'hb3) ^ (8'hb5))) ? (|(+(8'ha9))) : (8'ha4)))}, 
parameter param161 = param160)
(y, clk, wire44, wire45, wire46, wire47, wire48);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire44;
  input wire [(5'h14):(1'h0)] wire45;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire158;
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  assign y = {wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire65,
                 wire66,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire116,
                 wire158,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire49 = wire48[(3'h4):(2'h2)];
  assign wire50 = wire45[(3'h4):(2'h2)];
  assign wire51 = $unsigned(((~|(wire46[(3'h4):(1'h1)] ?
                      ((8'ha0) != wire50) : wire46[(3'h7):(3'h7)])) && {((wire50 <<< wire49) ?
                          (wire47 >> wire48) : ((8'hbf) ?
                              (8'hab) : (8'ha0)))}));
  assign wire52 = $unsigned(wire51);
  assign wire53 = ((+(wire52 | ((|wire45) << wire44[(4'h8):(2'h3)]))) ?
                      (~^wire46) : (&{$signed(((8'ha5) ? wire48 : wire49))}));
  assign wire54 = wire46;
  assign wire55 = $unsigned(wire53);
  assign wire56 = ((($unsigned((~^(8'ha7))) || wire44[(3'h7):(1'h0)]) ?
                          wire48 : $unsigned({(wire44 & wire44),
                              $unsigned((8'hbe))})) ?
                      (-wire48[(1'h1):(1'h1)]) : $signed((wire48[(1'h1):(1'h0)] ?
                          $unsigned({wire46, wire54}) : (-wire46))));
  always
    @(posedge clk) begin
      reg57 <= $signed($unsigned(wire49));
      reg58 <= (wire50 ?
          ($signed((((8'ha6) + (8'ha4)) ?
              wire48 : $unsigned(wire45))) != wire56) : $unsigned(wire53));
      reg59 <= $unsigned({(((wire50 * wire49) ?
              $signed(wire56) : (wire52 || (8'ha9))) >= ((wire49 & wire55) && $signed(wire48)))});
      if ((+wire50[(3'h4):(1'h1)]))
        begin
          reg60 <= $unsigned($unsigned((($unsigned((7'h41)) ?
              (wire51 ? wire44 : wire47) : (8'hab)) && wire48)));
          if ((!$signed((wire53[(1'h1):(1'h0)] ? wire52 : reg57))))
            begin
              reg61 <= wire44;
              reg62 <= $signed((((&{reg61, wire46}) ?
                      $unsigned($unsigned(wire49)) : (!$unsigned(wire55))) ?
                  wire55[(2'h2):(1'h0)] : $unsigned(wire47)));
            end
          else
            begin
              reg61 <= reg60[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg60 <= (~wire50[(3'h5):(1'h0)]);
          reg61 <= $unsigned(reg62[(2'h3):(2'h3)]);
          reg62 <= (~^$signed(($unsigned(wire52[(4'hd):(1'h1)]) ?
              (reg60 ? {wire50, wire55} : $unsigned(wire52)) : wire52)));
          reg63 <= $unsigned(wire49);
          reg64 <= wire55;
        end
    end
  assign wire65 = (+wire56);
  assign wire66 = $unsigned({(wire65 ?
                          {(wire46 ?
                                  wire56 : wire45)} : $unsigned((wire54 >>> reg61)))});
  assign wire67 = (8'ha0);
  assign wire68 = (($unsigned($signed($signed((8'hbf)))) ?
                      $unsigned($unsigned($signed(wire67))) : (~|wire65)) >> ((~|reg61) <= (!((^~reg57) ?
                      wire53[(1'h1):(1'h1)] : $signed(reg63)))));
  assign wire69 = $unsigned((7'h43));
  assign wire70 = wire51;
  assign wire71 = $unsigned($unsigned($unsigned((+$signed(reg60)))));
  assign wire72 = (~|((-wire66[(5'h12):(4'hb)]) ~^ {wire68[(4'hb):(1'h0)]}));
  assign wire73 = wire47;
  assign wire74 = wire66[(5'h12):(4'hd)];
  assign wire75 = $unsigned(wire52);
  assign wire76 = (((($signed((8'hbf)) >>> (wire53 > wire69)) != wire72) == {(|(wire53 ?
                          wire48 : wire56))}) * ($unsigned((wire47 ?
                      (wire71 ?
                          reg61 : reg60) : (+reg58))) ^~ {($signed((8'hb9)) == (~wire48))}));
  module77 #() modinst117 (.y(wire116), .wire78(wire68), .wire81(wire76), .wire80(wire50), .wire79(wire67), .clk(clk));
  module118 #() modinst159 (.clk(clk), .wire119(wire67), .wire123(wire66), .wire121(wire47), .wire120(wire50), .y(wire158), .wire122(wire71));
endmodule

module module118
#(parameter param156 = ((-((((8'hb8) * (7'h43)) ? ((8'hb5) == (8'hbb)) : ((8'ha5) * (8'hbc))) ? (+((8'hb6) ? (7'h40) : (8'hac))) : (((8'hab) <= (8'hb2)) ? ((7'h41) >> (7'h41)) : ((8'ha3) <= (8'hae))))) ? (~|({((8'h9f) ? (8'hbf) : (8'ha2))} >>> (((8'hb0) << (8'ha2)) ? ((8'hae) ? (8'ha0) : (7'h44)) : ((8'hbc) ? (8'hb3) : (8'hb9))))) : {(({(8'ha6)} ? ((7'h42) == (8'ha4)) : ((8'ha7) + (8'hb1))) || ({(8'hb4)} ~^ (!(8'h9e)))), ((((8'h9c) != (7'h40)) ? ((8'ha3) ? (7'h44) : (8'hb2)) : (^(8'h9e))) == (+((8'hab) + (8'haa))))}), 
parameter param157 = (^param156))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire123;
  input wire signed [(3'h4):(1'h0)] wire122;
  input wire signed [(5'h14):(1'h0)] wire121;
  input wire [(3'h7):(1'h0)] wire120;
  input wire signed [(3'h5):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire155;
  wire [(3'h6):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(3'h5):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire [(3'h5):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire132;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  reg [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(2'h3):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire126,
                 wire125,
                 wire124,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire124 = {($unsigned($unsigned(wire119)) << (~(wire122 ?
                           (wire122 ^ wire122) : (~wire121)))),
                       (~&$signed((&{wire121})))};
  assign wire125 = wire121;
  assign wire126 = (~&$unsigned((wire122[(2'h3):(1'h1)] ?
                       $unsigned(wire123[(5'h10):(4'hb)]) : $signed(wire119))));
  always
    @(posedge clk) begin
      reg127 <= (~^($signed(((wire126 ? wire120 : (8'hac)) ?
          (+wire120) : (wire124 * wire121))) - wire119));
      reg128 <= $signed({wire121});
      reg129 <= {wire123[(4'hc):(1'h0)]};
      reg130 <= $signed($unsigned(wire120));
      reg131 <= $signed($unsigned((|((reg129 != wire126) & $signed(wire125)))));
    end
  assign wire132 = ((($unsigned(wire119) >>> reg131[(1'h1):(1'h1)]) + ((&$signed(wire121)) ?
                       wire120[(1'h1):(1'h1)] : ((&reg129) >>> reg127))) & $unsigned(((&(~&reg129)) ?
                       {wire120[(2'h2):(2'h2)]} : wire123[(4'he):(3'h5)])));
  assign wire133 = (!(wire119 ?
                       {$unsigned((reg129 > reg129)),
                           $unsigned((-reg129))} : reg127[(3'h5):(3'h4)]));
  assign wire134 = $unsigned(($signed($unsigned($signed(wire119))) || wire125[(4'h8):(3'h4)]));
  assign wire135 = ((^reg131) ? (^~$signed(wire124)) : {wire125});
  always
    @(posedge clk) begin
      reg136 <= (~^(wire125 ? $unsigned((~^(wire119 >>> wire125))) : wire135));
      if ((wire135 ^~ (wire120[(3'h4):(1'h1)] == ((8'hb5) ?
          $signed((wire124 ? reg131 : (7'h41))) : wire119[(3'h5):(1'h0)]))))
        begin
          reg137 <= (wire120[(1'h1):(1'h1)] & ((~wire134) > wire135[(3'h6):(1'h1)]));
          reg138 <= $unsigned($signed(wire120));
          reg139 <= $signed((~^reg137[(4'hc):(2'h3)]));
          reg140 <= ($unsigned(wire126) < wire132[(2'h3):(1'h0)]);
        end
      else
        begin
          reg137 <= ({reg140[(4'ha):(1'h0)],
              $unsigned(wire121)} & $signed(reg140[(5'h12):(3'h4)]));
          reg138 <= ($signed((reg136 << $unsigned($unsigned(wire126)))) == reg136);
        end
      reg141 <= $unsigned($signed(wire133));
      reg142 <= $unsigned((!reg137));
    end
  assign wire143 = {wire120,
                       ($unsigned($unsigned((reg139 ?
                           wire133 : reg138))) < wire121[(4'hb):(3'h6)])};
  assign wire144 = (wire120[(3'h7):(1'h0)] * wire132[(3'h6):(2'h3)]);
  assign wire145 = {$unsigned(wire122)};
  assign wire146 = (({wire124[(3'h7):(1'h1)]} || wire124) == $signed($signed(((8'ha4) << reg127[(3'h7):(2'h3)]))));
  assign wire147 = (wire133[(1'h0):(1'h0)] * ($signed(wire144[(1'h0):(1'h0)]) ?
                       (wire123 & ((~|wire132) <<< wire143[(2'h3):(2'h3)])) : reg140[(5'h11):(3'h6)]));
  assign wire148 = (wire125 & $signed(wire132));
  assign wire149 = ({{wire126[(3'h7):(3'h4)]}} >> $unsigned({$signed($unsigned(wire119)),
                       $signed((!wire134))}));
  assign wire150 = $unsigned($unsigned((!wire124[(3'h6):(2'h3)])));
  assign wire151 = $unsigned((-(((wire144 ? wire133 : wire133) ?
                           $signed(wire120) : (~^wire120)) ?
                       wire150[(2'h2):(1'h0)] : $signed($unsigned((8'hab))))));
  assign wire152 = $unsigned({{$unsigned(wire123)}});
  assign wire153 = reg136[(2'h3):(2'h3)];
  assign wire154 = $unsigned($unsigned((8'hab)));
  assign wire155 = $unsigned(wire126);
endmodule

module module77
#(parameter param115 = ({(((8'hac) ? {(8'h9f)} : ((8'hbb) ? (8'haa) : (8'hae))) ? (~|(8'ha0)) : ({(8'hb6)} ? {(8'hb9)} : (~&(8'hb8)))), (~^(((7'h42) <= (8'haf)) ^ {(8'hb9), (8'h9c)}))} + {((((8'hbe) ? (8'haa) : (8'hbf)) ? (^(8'had)) : ((7'h41) ^~ (7'h41))) & (~^((8'hb3) ? (8'hbc) : (7'h42)))), (((~&(8'hab)) ? (&(8'haf)) : ((8'ha2) == (8'h9f))) || (((8'ha5) <= (8'ha2)) ? {(7'h40)} : ((8'hbf) + (8'h9f))))}))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire81;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire [(4'he):(1'h0)] wire79;
  input wire [(4'ha):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  assign y = {wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire90,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg113,
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
                 reg93,
                 reg92,
                 reg91,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire82 = wire79[(4'hd):(3'h5)];
  assign wire83 = wire80[(3'h6):(2'h2)];
  assign wire84 = wire79;
  assign wire85 = wire79[(2'h2):(2'h2)];
  assign wire86 = $unsigned({({$unsigned(wire81), $unsigned(wire84)} ?
                          ($signed(wire79) ?
                              $unsigned(wire78) : wire79[(4'hc):(2'h3)]) : {$signed(wire80),
                              (~wire79)})});
  assign wire87 = (^~(|wire79));
  always
    @(posedge clk) begin
      reg88 <= (wire81[(4'hc):(3'h6)] >> wire84[(3'h4):(2'h2)]);
      reg89 <= (~&(((+$unsigned(wire85)) >= ({wire80} ?
          (wire82 ? wire78 : wire84) : (wire80 ?
              wire84 : wire84))) <<< wire81));
    end
  assign wire90 = wire83[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg91 <= ((8'h9c) > (^wire81));
      reg92 <= ((({((8'hb6) ? wire86 : wire78)} ?
                  ($signed((8'haf)) ^~ reg91) : ({wire90, wire90} ?
                      wire81[(1'h1):(1'h0)] : (reg89 ? wire85 : wire90))) ?
              $unsigned(wire78[(4'h8):(3'h5)]) : (($unsigned(wire82) ?
                  $unsigned((8'hb1)) : wire85[(2'h3):(2'h3)]) & $signed(wire78))) ?
          (wire81 || (^$unsigned((wire90 & wire79)))) : (~|(^$unsigned((+wire78)))));
      if ((+(-(wire87[(4'h8):(3'h5)] >>> wire84[(4'h9):(4'h9)]))))
        begin
          reg93 <= $signed(wire85[(5'h11):(4'hd)]);
          if ({{wire83[(3'h6):(2'h3)], wire81[(4'h8):(3'h6)]}})
            begin
              reg94 <= ($unsigned({{(&(8'h9c))}}) ?
                  reg91[(4'h8):(4'h8)] : ($unsigned({wire83[(3'h4):(1'h0)]}) ~^ ((~^$unsigned(wire82)) != ((reg93 ^ wire85) || {wire81}))));
              reg95 <= reg93[(4'hb):(4'h8)];
              reg96 <= {($unsigned(reg93[(4'h9):(1'h1)]) & $signed(((wire90 ?
                          (8'hac) : reg88) ?
                      (wire85 ? wire85 : wire90) : $signed(reg92)))),
                  ($signed($unsigned(wire78)) && reg94)};
            end
          else
            begin
              reg94 <= (!($signed($signed(wire80)) ?
                  $signed((reg92 >> reg92)) : $signed((|$unsigned((7'h41))))));
              reg95 <= wire80;
              reg96 <= (~(8'ha8));
            end
        end
      else
        begin
          reg93 <= $signed({$signed($unsigned($unsigned(reg92))),
              wire78[(3'h7):(3'h4)]});
          reg94 <= reg93[(4'hb):(3'h6)];
          if ($signed(wire78))
            begin
              reg95 <= wire80[(1'h1):(1'h0)];
              reg96 <= {{$signed((((8'hb4) + reg93) ?
                          wire80[(3'h5):(1'h0)] : $signed(wire86)))},
                  wire83[(3'h7):(2'h3)]};
            end
          else
            begin
              reg95 <= (+(($signed((wire78 ? (8'ha8) : wire90)) ?
                      wire79[(1'h1):(1'h0)] : (wire80 ^ $unsigned(wire86))) ?
                  {reg96[(4'he):(3'h4)]} : $signed((^~(wire86 ?
                      reg94 : reg88)))));
              reg96 <= $signed((!((-$unsigned((8'haa))) ?
                  wire84 : (reg89 == $signed(reg94)))));
              reg97 <= wire79[(2'h3):(1'h0)];
              reg98 <= (reg93[(4'h8):(3'h4)] ?
                  $unsigned($signed(reg93)) : $signed($signed({{wire83},
                      $unsigned(reg94)})));
              reg99 <= wire86;
            end
          if ($unsigned(wire90))
            begin
              reg100 <= reg99[(1'h1):(1'h0)];
              reg101 <= reg88[(3'h4):(3'h4)];
            end
          else
            begin
              reg100 <= reg96;
              reg101 <= wire80[(4'hf):(4'hb)];
              reg102 <= (~|reg91);
              reg103 <= $signed(wire84[(4'h9):(3'h6)]);
            end
        end
      reg104 <= $unsigned((|($unsigned((-wire78)) ?
          $signed((reg88 ^~ reg93)) : (7'h43))));
      reg105 <= reg89;
    end
  assign wire106 = (wire87 ?
                       wire78[(3'h5):(1'h1)] : (+($unsigned({wire82,
                           wire79}) ^ reg98)));
  assign wire107 = $unsigned({$unsigned(wire85[(3'h4):(2'h2)])});
  assign wire108 = reg88;
  assign wire109 = (8'h9e);
  assign wire110 = (^$unsigned((8'hb0)));
  assign wire111 = $unsigned((^~reg102));
  assign wire112 = $unsigned(wire80);
  always
    @(posedge clk) begin
      reg113 <= (reg96 ?
          $unsigned(reg103[(2'h2):(1'h0)]) : (^~(wire86[(4'hd):(3'h5)] == ((~^reg99) ?
              $signed(wire79) : (8'hbb)))));
    end
  assign wire114 = (^~(wire112[(3'h5):(1'h1)] ?
                       wire106[(2'h2):(1'h1)] : ($unsigned((~|wire87)) * $unsigned($signed(reg101)))));
endmodule
