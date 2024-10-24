module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire186;
  wire [(4'ha):(1'h0)] wire185;
  wire signed [(4'hc):(1'h0)] wire181;
  wire signed [(5'h13):(1'h0)] wire179;
  wire signed [(4'ha):(1'h0)] wire177;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire101;
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire181,
                 wire179,
                 wire177,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire101,
                 reg184,
                 reg183,
                 reg182,
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
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire4 = ((~^$unsigned($signed(((8'ha5) && wire0)))) ?
                     {wire0[(2'h2):(2'h2)]} : wire3);
  assign wire5 = (&{((wire4[(4'hc):(3'h7)] << (~^(8'hae))) * $unsigned((^~wire0)))});
  assign wire6 = wire1[(4'ha):(3'h4)];
  assign wire7 = (((~|wire1) ?
                     ((8'h9d) || wire2) : $signed(((-wire0) ?
                         (wire5 ?
                             wire5 : (8'hb6)) : $unsigned((8'hb5))))) && (wire1[(2'h2):(1'h1)] ?
                     ((wire4[(1'h0):(1'h0)] ?
                             (wire3 ^ wire2) : wire5[(3'h6):(3'h5)]) ?
                         (+wire6) : (~^{wire5, wire2})) : $signed(((~&wire6) ?
                         {wire6} : $unsigned(wire2)))));
  assign wire8 = $unsigned(({$unsigned({wire5, wire0}),
                         $signed($unsigned(wire2))} ?
                     (wire4 + $unsigned($unsigned(wire4))) : {wire3[(4'he):(4'he)],
                         $signed((wire7 ? wire7 : wire2))}));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed($unsigned($signed(wire7))))))
        begin
          if ((&wire4))
            begin
              reg9 <= (&$unsigned((wire3 ? $unsigned($signed(wire7)) : wire4)));
            end
          else
            begin
              reg9 <= (wire1 & $unsigned($unsigned($unsigned($unsigned(wire4)))));
              reg10 <= wire0;
              reg11 <= $signed((wire3[(3'h6):(3'h5)] | {((~^wire6) * $signed((8'ha9))),
                  (wire5 >>> (wire0 >>> wire8))}));
              reg12 <= (+(wire1[(5'h13):(3'h5)] ~^ (-(8'had))));
              reg13 <= {(8'ha5), wire3[(4'hf):(2'h2)]};
            end
          if ($unsigned(wire2[(4'ha):(4'h8)]))
            begin
              reg14 <= $unsigned((~&$signed((8'ha4))));
              reg15 <= ((wire3 ?
                      ($signed(reg10) ^ reg14[(4'he):(4'hd)]) : reg11) ?
                  (~|(8'hab)) : $signed($signed(((~^(8'ha7)) ?
                      (wire8 ? reg12 : wire0) : (wire7 ? wire1 : reg14)))));
              reg16 <= ({{$unsigned((~wire8))}, reg14[(4'hc):(4'hc)]} ?
                  (reg10[(1'h0):(1'h0)] ?
                      (({reg14, wire0} ^ (+reg13)) || {(^~reg12),
                          (+wire2)}) : reg9) : $signed(($unsigned((reg12 <<< wire1)) ^~ $unsigned(reg12[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg14 <= $signed(reg15[(2'h3):(2'h3)]);
              reg15 <= reg15[(3'h4):(2'h2)];
            end
          reg17 <= (8'hb4);
          reg18 <= (^wire8[(4'hc):(2'h3)]);
        end
      else
        begin
          reg9 <= ($signed($unsigned(wire6[(1'h0):(1'h0)])) ?
              (~^(($unsigned(reg13) ?
                  reg11[(2'h2):(1'h1)] : (~|reg14)) <= $signed($unsigned(reg10)))) : (((~wire8[(2'h2):(2'h2)]) ?
                      {$signed(reg18)} : reg9[(4'he):(3'h7)]) ?
                  (($signed(wire6) ?
                      $unsigned(reg15) : (wire3 || reg16)) << $signed($signed(reg14))) : (~^reg18[(4'hf):(4'hb)])));
          if (reg12)
            begin
              reg10 <= $unsigned(((~^wire5) ? reg16 : reg10));
            end
          else
            begin
              reg10 <= (~&(8'hb6));
              reg11 <= $unsigned($signed(wire2));
              reg12 <= ((^(^~(~&{(8'h9e)}))) ?
                  $unsigned(((reg9 ? (wire4 << reg14) : reg10) ?
                      (wire3[(2'h3):(2'h3)] ?
                          reg17 : {(8'hb4)}) : wire2)) : ($signed(reg10[(2'h3):(2'h3)]) ?
                      $signed(((reg9 < wire2) ?
                          $unsigned(reg18) : wire0)) : $signed(wire2[(2'h2):(1'h1)])));
              reg13 <= wire8;
              reg14 <= reg17;
            end
          reg15 <= {(reg15[(1'h0):(1'h0)] || $signed((+(wire4 ?
                  reg16 : reg9))))};
        end
    end
  always
    @(posedge clk) begin
      reg19 <= wire3[(4'hd):(4'h9)];
      if (reg19[(3'h7):(3'h5)])
        begin
          reg20 <= (~&{wire7[(4'hb):(2'h2)]});
        end
      else
        begin
          reg20 <= $signed($signed($unsigned(reg12)));
        end
      reg21 <= $signed($signed(reg12[(2'h2):(1'h1)]));
    end
  module22 #() modinst102 (wire101, clk, reg11, reg14, wire5, reg19);
  assign wire103 = reg14[(3'h6):(3'h5)];
  assign wire104 = ($unsigned(reg10[(4'ha):(3'h4)]) | wire6[(3'h7):(3'h4)]);
  assign wire105 = $unsigned(wire101[(4'h9):(4'h9)]);
  assign wire106 = (~&(~|{(~^reg15), (^~$signed((8'ha8)))}));
  module107 #() modinst178 (.wire112(wire2), .wire111(wire101), .clk(clk), .wire108(reg11), .y(wire177), .wire109(reg9), .wire110(reg18));
  module107 #() modinst180 (wire179, clk, reg10, wire4, reg13, wire2, reg18);
  assign wire181 = ($signed(wire0[(1'h0):(1'h0)]) ?
                       $unsigned((~|$signed((wire106 ?
                           reg16 : wire1)))) : $signed((reg10[(4'h8):(2'h3)] < reg13[(5'h11):(4'ha)])));
  always
    @(posedge clk) begin
      reg182 <= ({$signed((^wire179[(3'h6):(1'h1)])),
              (reg9[(4'hb):(4'hb)] ?
                  ((8'ha1) ? (^~wire2) : (reg17 <<< reg10)) : (wire105 ?
                      $signed(wire6) : ((8'ha5) ? wire101 : wire4)))} ?
          wire6 : $signed($signed($signed(wire177[(2'h3):(2'h3)]))));
      reg183 <= (~&wire101[(1'h1):(1'h1)]);
      reg184 <= ($signed((~^wire5[(1'h0):(1'h0)])) * wire105);
    end
  assign wire185 = ((~wire5) ?
                       wire8[(5'h10):(4'hb)] : $unsigned(wire2[(5'h13):(4'hb)]));
  assign wire186 = wire181;
  assign wire187 = $unsigned(wire0[(3'h5):(3'h4)]);
endmodule

module module107
#(parameter param176 = (((+(|(~^(8'haf)))) ? ((~((8'hb1) + (8'ha7))) ? (((8'h9c) ? (8'hb6) : (8'hab)) & (8'ha7)) : (&{(8'ha0)})) : (~^(~^(&(8'ha1))))) ~^ {(^(((8'hbc) ? (8'ha7) : (8'h9d)) ? (+(8'ha4)) : ((8'ha4) ? (8'hb9) : (8'h9d)))), ((&((7'h40) ^~ (8'ha5))) ? {((8'haa) ? (8'hbd) : (8'hac)), (~^(7'h40))} : ((7'h40) ? (8'hba) : ((8'hb0) > (8'hb2))))}))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire112;
  input wire [(4'hb):(1'h0)] wire111;
  input wire signed [(5'h12):(1'h0)] wire110;
  input wire signed [(5'h14):(1'h0)] wire109;
  input wire [(4'hf):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire135;
  wire [(5'h15):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(5'h13):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire174;
  assign y = {wire135,
                 wire115,
                 wire114,
                 wire113,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire174,
                 (1'h0)};
  assign wire113 = $unsigned(($signed((&$signed(wire108))) ?
                       (wire112 ?
                           (~^(wire110 - wire108)) : wire110[(3'h4):(1'h1)]) : (wire110[(4'he):(3'h5)] ?
                           $unsigned((!wire108)) : {$signed(wire111),
                               wire108})));
  assign wire114 = (($unsigned($unsigned((wire111 ?
                       wire113 : wire113))) ^~ wire112) == (~(-{(wire111 ?
                           wire110 : wire108)})));
  assign wire115 = $signed($signed(((&(|wire111)) ?
                       $signed((wire114 ?
                           wire111 : wire109)) : (!$unsigned((8'hb2))))));
  module116 #() modinst136 (.y(wire135), .wire119(wire108), .wire117(wire114), .clk(clk), .wire118(wire115), .wire121(wire112), .wire120(wire109));
  assign wire137 = (^~(wire109 >= $unsigned(($unsigned(wire114) && (+wire112)))));
  assign wire138 = wire110;
  assign wire139 = $unsigned(((~&wire111[(4'ha):(3'h6)]) ?
                       ($signed((wire137 ?
                           wire138 : wire109)) >> ((wire108 || wire111) ?
                           $unsigned(wire138) : $signed(wire110))) : (wire113[(1'h0):(1'h0)] << wire112[(4'hd):(3'h5)])));
  assign wire140 = {(+wire109),
                       ((wire112 * ((wire109 && wire109) ?
                           (wire113 ?
                               wire113 : wire139) : (wire111 < wire113))) <<< wire110[(5'h12):(4'ha)])};
  module141 #() modinst175 (wire174, clk, wire139, wire138, wire111, wire137, wire115);
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire26;
  input wire [(4'h9):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  input wire [(3'h4):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire77,
                 wire46,
                 wire45,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 (1'h0)};
  assign wire27 = wire25[(3'h4):(2'h3)];
  assign wire28 = (7'h40);
  assign wire29 = wire27[(3'h6):(2'h3)];
  assign wire30 = ($unsigned((wire28[(3'h5):(2'h2)] ?
                      (((8'hbf) & wire25) * (~&wire24)) : wire25)) + $signed((^(+(wire25 ?
                      (8'hb9) : wire24)))));
  always
    @(posedge clk) begin
      reg31 <= wire26;
      reg32 <= wire24;
      if (wire27[(2'h2):(1'h0)])
        begin
          reg33 <= ($signed($signed(reg31)) != ((($unsigned(reg32) != (^~(8'hbf))) ?
                  ((wire30 ? reg31 : wire25) ~^ {wire29,
                      wire25}) : $signed(((8'hbd) == (8'ha8)))) ?
              $unsigned({(wire24 << reg32)}) : (~(-wire27))));
          reg34 <= $signed(wire23);
          reg35 <= wire30[(3'h7):(3'h7)];
        end
      else
        begin
          reg33 <= $signed((&(8'hbd)));
        end
      if (((^~$signed({$unsigned(reg35)})) ?
          ($unsigned((((8'had) ? wire23 : reg32) ?
              $unsigned(wire27) : $signed((8'hb3)))) < ((^(&(8'hbb))) != reg31)) : $unsigned((^~(-(reg33 ?
              (8'hb7) : wire23))))))
        begin
          reg36 <= $unsigned($unsigned(reg34[(2'h2):(1'h0)]));
          if (reg36[(4'hd):(3'h7)])
            begin
              reg37 <= $unsigned($signed($unsigned($unsigned($signed(wire27)))));
              reg38 <= ((((|(-wire27)) <<< ((~^wire28) >>> {wire30, wire28})) ?
                      {$signed(wire27)} : (8'h9f)) ?
                  reg36[(3'h7):(2'h3)] : wire27);
              reg39 <= $signed((((reg31 ? wire26[(4'hb):(4'h9)] : wire24) ?
                  $signed((^~reg38)) : (8'hbc)) >> $unsigned(wire26[(4'ha):(4'ha)])));
              reg40 <= ((~|(($signed(wire29) ? reg37 : {reg34, (8'hbb)}) ?
                      ({wire26,
                          reg31} ^~ (~^wire29)) : ((reg34 + wire25) == (wire24 >>> reg34)))) ?
                  wire28[(3'h6):(1'h0)] : (($unsigned((reg36 >= reg31)) ?
                      reg39 : {$signed(reg35)}) >>> ($unsigned(reg36[(4'ha):(3'h7)]) * wire26)));
            end
          else
            begin
              reg37 <= wire27[(4'hd):(4'hd)];
              reg38 <= (reg38[(1'h0):(1'h0)] ?
                  (8'hb4) : $unsigned($unsigned({$unsigned((8'ha6)), wire27})));
              reg39 <= wire23;
            end
          if ((|(+(7'h40))))
            begin
              reg41 <= reg32;
              reg42 <= wire24;
              reg43 <= reg41;
            end
          else
            begin
              reg41 <= $signed(wire26[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          reg36 <= ($unsigned(reg34[(5'h13):(4'ha)]) | (~^$unsigned((8'had))));
          if (wire27)
            begin
              reg37 <= (~&((+(reg34[(5'h14):(4'he)] >= (7'h40))) ?
                  reg36[(1'h1):(1'h0)] : (wire26[(3'h5):(1'h0)] ?
                      wire30 : wire24)));
            end
          else
            begin
              reg37 <= reg41;
              reg38 <= ((~&$unsigned($unsigned(wire28))) < (wire24[(2'h2):(1'h0)] - {$signed($unsigned(reg40)),
                  $unsigned((8'hac))}));
              reg39 <= ({$unsigned($signed($unsigned(reg38))),
                      reg43[(3'h6):(3'h6)]} ?
                  $unsigned({(!(reg36 <= wire28)),
                      (wire23 ?
                          $unsigned(wire29) : wire25[(4'h9):(3'h7)])}) : reg34[(3'h6):(2'h2)]);
            end
          reg40 <= (|(~|$unsigned((8'h9f))));
          reg41 <= reg37[(2'h2):(1'h0)];
          reg42 <= ((($signed((reg34 ?
              reg36 : (8'h9e))) * reg32[(3'h5):(1'h0)]) == $signed((+(wire24 ?
              reg38 : reg38)))) >> $unsigned({wire23, wire28}));
        end
      reg44 <= reg39;
    end
  assign wire45 = (7'h40);
  assign wire46 = ((-(+($signed((8'ha2)) <= (wire24 ? wire28 : reg37)))) ?
                      $unsigned(($signed(reg37) ?
                          (!(reg33 ^ reg37)) : $signed({reg41}))) : (reg43[(1'h0):(1'h0)] ?
                          (8'hb8) : (8'hb0)));
  module47 #() modinst78 (.clk(clk), .wire50(reg41), .wire51(wire24), .y(wire77), .wire49(wire26), .wire52(reg38), .wire48(reg32));
  module79 #() modinst97 (.wire82(wire30), .wire80(wire26), .y(wire96), .wire81(reg41), .wire83(reg32), .clk(clk));
  assign wire98 = (wire46[(3'h4):(1'h1)] ?
                      ($signed(reg31) >> ($signed(wire26[(4'h9):(4'h9)]) ~^ $signed(wire96[(3'h5):(2'h2)]))) : $signed({(~&reg37[(3'h5):(3'h4)]),
                          $signed((reg39 ? reg39 : wire26))}));
  assign wire99 = (&$signed(wire98));
  assign wire100 = (!((!$signed((reg44 ? wire45 : wire25))) ?
                       ((^~wire23) ?
                           (-((8'ha0) ?
                               reg43 : reg32)) : $unsigned($signed(reg37))) : $signed($unsigned($unsigned(wire98)))));
endmodule

module module79  (y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire83;
  input wire signed [(5'h12):(1'h0)] wire82;
  input wire [(3'h4):(1'h0)] wire81;
  input wire [(4'h8):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire signed [(3'h5):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire84 = $unsigned(wire82[(4'h9):(2'h3)]);
  assign wire85 = (~|({$signed($unsigned((7'h40))),
                          ($unsigned((8'hb4)) ?
                              wire80 : (wire82 ? wire81 : wire80))} ?
                      (wire84 <= ((&(8'ha0)) | ((7'h40) ^ wire82))) : wire82));
  assign wire86 = wire85[(3'h4):(1'h0)];
  assign wire87 = {{$signed(wire83[(2'h2):(2'h2)])}, (~^wire82)};
  assign wire88 = (wire83 ? (~|$signed((8'ha0))) : wire84[(2'h2):(1'h0)]);
  assign wire89 = ((((&(wire87 ? wire82 : wire81)) != $unsigned((wire80 ?
                      wire80 : (8'ha5)))) & ($unsigned((wire80 && (8'hbd))) ?
                      wire81[(1'h1):(1'h1)] : $signed((&(8'hb4))))) >>> (8'ha9));
  assign wire90 = $unsigned(wire87[(3'h6):(1'h0)]);
  assign wire91 = $signed((({wire90, (wire85 || wire85)} ?
                      $signed((^wire83)) : wire85[(1'h0):(1'h0)]) * (&($unsigned((8'h9e)) >> $unsigned(wire89)))));
  always
    @(posedge clk) begin
      reg92 <= (wire84[(2'h3):(1'h1)] <<< (~^wire91[(4'h9):(3'h7)]));
      reg93 <= (8'ha8);
      reg94 <= $signed(wire88[(2'h2):(2'h2)]);
      reg95 <= wire91;
    end
endmodule

module module47
#(parameter param76 = (({(((8'hae) ? (8'hb5) : (8'ha9)) == {(7'h40), (8'had)})} ? ((~&(^~(8'ha9))) ~^ (-(8'hb4))) : (({(8'h9c)} >= ((8'h9d) & (8'had))) ? (~^((8'hbd) == (8'ha6))) : ((~^(8'h9d)) ? (+(8'hb3)) : ((8'hac) ^ (8'ha8))))) ? (8'ha9) : ((((8'ha2) ? ((8'hb7) ? (8'hbb) : (8'hbb)) : ((8'h9f) ? (8'haa) : (8'ha7))) ? ((&(7'h41)) ^ ((8'ha8) ? (7'h43) : (7'h42))) : (((8'ha0) ? (8'ha8) : (8'ha5)) ? {(8'haa)} : (~&(7'h44)))) ? (({(8'h9f)} ? (!(8'had)) : ((8'hbd) ? (8'haf) : (8'ha0))) <<< {((8'h9e) >= (8'ha7)), ((8'ha5) + (8'hbc))}) : ((((7'h40) ? (8'hb5) : (8'ha1)) ? ((7'h40) ~^ (8'ha7)) : ((8'h9c) ? (8'ha1) : (8'ha9))) & (((8'hbb) ~^ (8'hb5)) > (~&(8'hba)))))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire52;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire [(5'h15):(1'h0)] wire50;
  input wire [(4'h9):(1'h0)] wire49;
  input wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg75,
                 reg74,
                 reg73,
                 reg64,
                 (1'h0)};
  assign wire53 = ((($unsigned((+wire50)) ?
                      $unsigned((wire52 ^~ (8'haf))) : wire50[(5'h15):(4'hb)]) ^~ ({$signed(wire51)} ?
                      ((~wire50) != wire52[(3'h5):(3'h4)]) : (!(wire48 ?
                          wire51 : wire48)))) <<< $signed((wire49[(4'h9):(1'h1)] * (wire48 ?
                      (^wire50) : $signed((8'h9d))))));
  assign wire54 = $signed((^(wire53[(3'h5):(2'h3)] ?
                      wire52[(3'h4):(2'h2)] : (!wire49))));
  assign wire55 = {wire50,
                      (wire52[(1'h0):(1'h0)] ?
                          wire48[(5'h12):(4'hf)] : (wire54[(4'h8):(1'h1)] ?
                              {{wire49, wire51}} : wire48))};
  assign wire56 = $unsigned(($signed((^~wire49)) & wire55[(3'h4):(1'h1)]));
  assign wire57 = {wire54[(2'h2):(1'h1)]};
  assign wire58 = (+wire55[(4'h8):(1'h0)]);
  assign wire59 = $signed(wire50);
  assign wire60 = (~^wire58[(2'h2):(1'h1)]);
  assign wire61 = $signed(((wire55 ~^ $unsigned(wire54)) - ($signed($unsigned(wire51)) != ((wire51 ?
                          wire54 : wire50) ?
                      $unsigned(wire59) : $signed(wire50)))));
  assign wire62 = $signed($signed(wire58[(2'h2):(1'h0)]));
  assign wire63 = wire54[(4'h9):(4'h8)];
  always
    @(posedge clk) begin
      reg64 <= (|$signed($unsigned(((~&wire50) ?
          wire56[(2'h2):(1'h0)] : wire48))));
    end
  assign wire65 = (wire48 && wire51[(1'h1):(1'h1)]);
  assign wire66 = $unsigned($unsigned(wire54[(2'h2):(1'h0)]));
  assign wire67 = (wire56 ?
                      {wire48} : ($signed((-reg64[(1'h0):(1'h0)])) ?
                          (wire48 ?
                              wire65[(4'h8):(3'h7)] : (8'haf)) : ($unsigned((wire62 >>> wire49)) >= {(reg64 ?
                                  wire61 : wire66),
                              $unsigned(wire62)})));
  assign wire68 = $signed((wire66 ^ (~wire55[(2'h3):(1'h0)])));
  assign wire69 = ($unsigned($unsigned($unsigned((wire66 >> wire59)))) >>> (wire50[(4'hf):(2'h3)] ?
                      (((reg64 ? wire65 : wire49) << $unsigned(wire52)) ?
                          wire60[(3'h6):(1'h1)] : (wire59 >= $signed(wire50))) : wire54));
  assign wire70 = ((8'hac) >> ((&(|(wire54 != wire57))) >>> $unsigned(wire59[(1'h0):(1'h0)])));
  assign wire71 = wire55[(2'h2):(1'h1)];
  assign wire72 = wire55[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg73 <= $unsigned(($unsigned($signed((&wire68))) & (((wire58 ?
              wire55 : (8'ha5)) << wire58) ?
          wire58[(1'h0):(1'h0)] : $signed(wire48[(2'h3):(2'h3)]))));
    end
  always
    @(posedge clk) begin
      reg74 <= $signed(((~(~^(wire65 * wire62))) ?
          $unsigned((|(wire60 << wire57))) : $unsigned($unsigned((8'hb9)))));
      reg75 <= wire71;
    end
endmodule

module module141
#(parameter param173 = (((~&(((8'hb4) ? (8'hb5) : (7'h42)) ? ((8'h9c) & (7'h42)) : ((8'hb3) ? (8'ha8) : (8'hb6)))) ? (({(8'ha5)} ^~ (^~(8'had))) >> {((8'h9f) && (7'h41)), ((8'ha8) <<< (8'ha5))}) : ((~^{(8'hac), (8'had)}) ? (8'had) : (((8'ha5) ? (8'hbe) : (8'haa)) ? (8'hb8) : (^~(8'had))))) ? ({{((8'hb3) | (8'hbe)), ((8'hb9) ? (8'hb1) : (8'ha1))}, (^~((8'hae) == (8'ha5)))} ? (^~(^((8'ha8) & (8'hb3)))) : ((+((8'haa) ? (8'hae) : (8'h9e))) | (~&((8'h9d) << (8'ha7))))) : ({(~&((8'hb2) ? (8'h9f) : (8'hbf))), (((7'h43) > (8'hbd)) ? {(8'hae)} : ((8'hb9) ? (8'ha3) : (8'h9c)))} ~^ ({((8'ha9) >> (8'hb6)), (&(8'ha6))} << ((~&(7'h40)) ? ((8'hab) <<< (8'ha0)) : ((8'ha8) >>> (8'hb6)))))))
(y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire146;
  input wire signed [(4'hd):(1'h0)] wire145;
  input wire [(4'ha):(1'h0)] wire144;
  input wire signed [(3'h7):(1'h0)] wire143;
  input wire [(2'h3):(1'h0)] wire142;
  wire [(4'hc):(1'h0)] wire172;
  wire [(4'he):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire [(2'h3):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire167;
  wire signed [(5'h14):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire158;
  wire [(2'h3):(1'h0)] wire157;
  wire [(2'h2):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire147;
  reg signed [(5'h12):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire147,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire147 = ((-(((|wire143) * wire144[(3'h6):(3'h5)]) << $unsigned((~|wire144)))) << wire144[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg148 <= wire146;
      reg149 <= wire144[(2'h2):(2'h2)];
      reg150 <= $signed((!wire142[(1'h0):(1'h0)]));
    end
  assign wire151 = reg150;
  assign wire152 = (((wire147 & reg149) * wire142) ?
                       {{wire143,
                               ($unsigned((8'ha1)) ?
                                   {(8'ha3),
                                       reg149} : wire151[(4'he):(2'h2)])}} : (reg149 && wire143[(1'h1):(1'h0)]));
  assign wire153 = $signed(wire145);
  assign wire154 = wire146;
  assign wire155 = wire147[(3'h5):(2'h2)];
  assign wire156 = (wire144[(2'h3):(2'h3)] >>> wire143);
  assign wire157 = wire144[(4'h8):(3'h4)];
  assign wire158 = $signed((~&(($signed((8'haf)) == {wire157}) ~^ (&(wire155 <<< wire155)))));
  assign wire159 = $signed(((^~$signed({wire155,
                       (8'ha5)})) ^~ ($signed((&reg149)) ?
                       wire147 : reg148[(2'h3):(1'h0)])));
  assign wire160 = (~^wire151);
  always
    @(posedge clk) begin
      reg161 <= (8'hbf);
      reg162 <= (reg149[(2'h3):(2'h2)] || {($unsigned($unsigned(reg161)) <<< $signed((-reg150)))});
      reg163 <= $unsigned(wire155[(2'h3):(2'h3)]);
      reg164 <= wire151[(4'hc):(3'h7)];
      reg165 <= $signed((wire152 || $signed($signed($unsigned((8'ha5))))));
    end
  assign wire166 = $unsigned(wire155);
  assign wire167 = (|wire142);
  assign wire168 = {{(~&{wire144[(1'h0):(1'h0)]})},
                       $unsigned(((+$signed(wire167)) ?
                           ((wire160 ? wire167 : reg165) ?
                               (wire155 << wire154) : $unsigned(wire156)) : (~{reg165,
                               wire157})))};
  assign wire169 = (^~(wire152[(3'h7):(3'h6)] ?
                       $signed(wire151[(3'h6):(3'h4)]) : wire153[(5'h12):(4'h8)]));
  assign wire170 = ($unsigned({(8'ha5)}) * ((reg161 ?
                           $unsigned((wire168 ?
                               wire169 : reg165)) : wire143[(3'h5):(3'h5)]) ?
                       reg162[(3'h7):(3'h4)] : ((~&(wire168 ?
                           reg150 : wire152)) >>> reg164)));
  assign wire171 = wire155[(1'h0):(1'h0)];
  assign wire172 = (^$unsigned({$unsigned((^~wire144))}));
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire121;
  input wire [(5'h14):(1'h0)] wire120;
  input wire signed [(4'hb):(1'h0)] wire119;
  input wire signed [(5'h15):(1'h0)] wire118;
  input wire [(3'h5):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  assign y = {wire129,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire122 = $unsigned(wire117);
  assign wire123 = $unsigned((&wire118[(4'hb):(3'h4)]));
  assign wire124 = $unsigned($signed({wire118[(2'h3):(2'h3)],
                       wire120[(4'h8):(1'h0)]}));
  assign wire125 = wire124;
  assign wire126 = $signed({wire123,
                       ($signed((8'ha7)) >= wire120[(3'h5):(1'h0)])});
  always
    @(posedge clk) begin
      reg127 <= (((~|wire122) ?
          {((^~wire122) ?
                  $unsigned(wire117) : {wire118})} : wire124[(2'h3):(2'h3)]) <= (+wire121));
      reg128 <= wire117;
    end
  assign wire129 = (8'hba);
  always
    @(posedge clk) begin
      if (wire119)
        begin
          reg130 <= (wire118 * wire123[(2'h2):(1'h1)]);
          reg131 <= ((~^(8'ha7)) | $unsigned({wire129[(3'h7):(2'h2)],
              (8'ha3)}));
          reg132 <= (($signed(($signed(wire119) ~^ wire119)) ?
              $signed(($signed(reg127) ?
                  $signed(reg128) : $unsigned((8'ha1)))) : (+(wire119 ?
                  (wire118 >> wire119) : wire119))) > reg128[(2'h3):(2'h2)]);
          if (reg128)
            begin
              reg133 <= (~^wire123);
            end
          else
            begin
              reg133 <= $unsigned($unsigned((reg132 == $signed((~wire123)))));
              reg134 <= (wire123[(1'h1):(1'h1)] > wire120);
            end
        end
      else
        begin
          reg130 <= wire129;
          if (($unsigned((reg133[(4'h9):(4'h8)] | reg131)) ?
              $unsigned(wire117[(3'h4):(2'h2)]) : ((|$signed($unsigned(wire119))) ?
                  $signed($signed((reg130 && wire126))) : reg127[(4'hb):(4'ha)])))
            begin
              reg131 <= wire129[(4'ha):(2'h2)];
              reg132 <= ((8'hbd) ?
                  $unsigned(wire121[(4'he):(4'ha)]) : ($signed(({wire119} ?
                      $unsigned(wire124) : reg127)) && (((wire123 ?
                      reg132 : wire118) >>> (reg132 ?
                      (8'ha0) : (8'hbc))) < wire119[(3'h4):(3'h4)])));
            end
          else
            begin
              reg131 <= wire118;
            end
        end
    end
endmodule
