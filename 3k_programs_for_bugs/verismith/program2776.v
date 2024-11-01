module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire [(3'h5):(1'h0)] wire128;
  wire [(3'h6):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  assign y = {wire134,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
                 reg133,
                 reg132,
                 reg131,
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
                 (1'h0)};
  assign wire4 = (((8'h9d) ?
                         ($unsigned($signed(wire0)) >>> (|$signed(wire1))) : $unsigned(wire0[(2'h2):(1'h1)])) ?
                     ($unsigned($unsigned((wire2 & wire3))) ?
                         wire2[(1'h1):(1'h1)] : $unsigned((!wire0))) : $signed((wire0 ?
                         $signed($unsigned(wire3)) : wire2[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg5 <= {{{$signed((wire2 || wire0)), (~&wire2[(2'h2):(1'h1)])}}};
      reg6 <= $unsigned(wire1);
      if ($signed((~&$signed({$unsigned(wire0), $signed(wire1)}))))
        begin
          if ($signed(({(~^(wire1 && reg6))} ?
              (wire3 ?
                  wire2 : ($signed(wire0) ?
                      $unsigned(wire0) : wire3)) : wire0[(4'he):(1'h1)])))
            begin
              reg7 <= wire3;
              reg8 <= $signed($signed($signed($signed(wire1))));
              reg9 <= {((reg8 ? reg7[(3'h5):(1'h1)] : wire0) ?
                      (^~$signed(wire2)) : $signed(($unsigned(wire1) ?
                          wire0[(1'h1):(1'h0)] : (wire0 ? (8'hba) : (8'ha0))))),
                  (&reg8)};
              reg10 <= reg9[(5'h10):(4'hb)];
            end
          else
            begin
              reg7 <= (~&(^(((wire3 || wire3) ?
                      wire1[(2'h2):(2'h2)] : $signed(wire1)) ?
                  reg7[(4'ha):(4'h9)] : ((wire0 != reg9) ?
                      wire4[(4'hb):(4'ha)] : $signed(wire4)))));
              reg8 <= $unsigned((~^((wire1 ?
                  ((7'h44) ? reg9 : wire2) : wire1) >>> {(reg6 | reg6)})));
              reg9 <= ($unsigned($signed(((wire2 << wire4) == reg6[(4'h8):(2'h3)]))) - reg8[(4'he):(1'h0)]);
              reg10 <= (((($unsigned(wire3) & ((8'ha5) >>> reg8)) ?
                      $unsigned($signed(reg5)) : ((~|reg9) >= (wire3 & reg5))) <<< (|($signed((8'ha7)) << (wire4 ?
                      reg9 : (8'hb8))))) ?
                  $signed($unsigned(reg6[(3'h4):(3'h4)])) : ($signed({(!reg9),
                      (+(8'hbe))}) < $signed((~^(~|wire1)))));
              reg11 <= reg7;
            end
          reg12 <= (($signed(reg8) ?
                  {reg10[(4'hb):(4'hb)]} : (^~(!reg7[(4'he):(4'hd)]))) ?
              reg10[(3'h7):(2'h3)] : wire1);
          reg13 <= wire1[(3'h7):(3'h7)];
          if ((~&$unsigned($signed($signed((8'hb4))))))
            begin
              reg14 <= $signed(wire3[(3'h4):(1'h0)]);
              reg15 <= $signed(wire2);
            end
          else
            begin
              reg14 <= ({(|{{reg11}, $signed(reg5)})} && (reg14[(3'h5):(3'h5)] ?
                  {($unsigned(reg7) * wire3),
                      $signed((reg15 ~^ reg6))} : {$signed((reg6 && reg8))}));
              reg15 <= ((~|$signed(({wire4} ?
                  (wire4 << reg7) : reg11))) ^~ wire4);
              reg16 <= (($unsigned((8'ha5)) <<< $unsigned($unsigned($unsigned(wire3)))) | $unsigned({$unsigned(((8'ha3) ?
                      reg15 : wire2)),
                  $unsigned($signed(wire1))}));
            end
        end
      else
        begin
          reg7 <= ($signed(($unsigned($unsigned(wire2)) ?
                  (reg8[(4'hb):(3'h7)] ~^ reg8[(3'h6):(1'h0)]) : $signed({reg14,
                      (8'ha5)}))) ?
              ($signed(reg13[(2'h2):(2'h2)]) != reg16) : reg12);
          reg8 <= wire0[(4'hb):(4'h9)];
          if ($signed({$unsigned(reg9), (&reg16)}))
            begin
              reg9 <= wire0;
              reg10 <= $signed(($signed($signed(reg15)) == (~&((reg9 ?
                  (7'h43) : reg10) & (reg5 & reg9)))));
              reg11 <= $unsigned($unsigned((((+wire4) ?
                      (reg15 <<< reg8) : $unsigned(reg5)) ?
                  ((^reg15) ?
                      {wire0,
                          wire0} : $unsigned(reg11)) : $signed($signed(reg9)))));
            end
          else
            begin
              reg9 <= ((!$signed($signed({reg7}))) + $unsigned(reg15));
            end
          reg12 <= ((($unsigned(reg5) ?
              {{reg8, wire1}, (-reg13)} : wire0) == {reg8[(4'h8):(3'h5)],
              $signed(wire1)}) ~^ reg5[(3'h7):(2'h2)]);
        end
    end
  assign wire17 = (&(&reg13));
  assign wire18 = reg9;
  assign wire19 = $unsigned((+wire3));
  module20 #() modinst127 (wire126, clk, reg6, reg14, wire18, wire4, reg9);
  assign wire128 = (~^$unsigned($signed(wire1[(1'h1):(1'h1)])));
  assign wire129 = (8'ha9);
  assign wire130 = ($signed($signed(((reg10 >>> wire2) ?
                       (8'h9c) : reg12))) * reg7[(4'ha):(4'ha)]);
  always
    @(posedge clk) begin
      reg131 <= wire17[(3'h6):(2'h3)];
      reg132 <= (+$signed((wire3 ?
          ((reg131 ? reg10 : wire2) ^ reg13) : ((~|(8'hac)) ?
              reg12[(4'hb):(3'h4)] : reg131))));
      reg133 <= $signed((~((+wire19[(3'h4):(1'h1)]) ?
          reg13 : $signed(wire3[(3'h4):(2'h2)]))));
    end
  assign wire134 = ($unsigned(wire1[(2'h2):(2'h2)]) ? reg10 : wire17);
endmodule

module module20  (y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire24;
  input wire [(5'h11):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire42;
  wire [(2'h3):(1'h0)] wire79;
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire122,
                 wire83,
                 wire82,
                 wire81,
                 wire41,
                 wire42,
                 wire79,
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
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((($unsigned($unsigned(wire22)) & {$unsigned(wire24), wire21}) ?
          $signed(wire22) : wire21) || {wire21}))
        begin
          reg26 <= $unsigned(({wire24[(5'h12):(4'hd)]} ?
              wire21[(3'h6):(3'h4)] : (wire25[(2'h2):(1'h1)] && $unsigned(wire21[(3'h6):(1'h1)]))));
          reg27 <= ({reg26} & (wire25[(5'h11):(4'h8)] ?
              $signed((8'hbe)) : ((+$unsigned(wire24)) ?
                  $signed((wire23 << (8'hb8))) : $signed((wire22 ?
                      reg26 : wire24)))));
        end
      else
        begin
          reg26 <= (8'h9e);
          if ({$signed(($signed((^~wire21)) >= wire22[(4'h8):(1'h1)]))})
            begin
              reg27 <= reg27;
              reg28 <= reg26[(4'h8):(2'h3)];
              reg29 <= ($unsigned((+{((8'ha5) ? reg28 : reg27),
                  (wire25 ?
                      reg28 : wire22)})) - {{((&reg28) || $signed(wire25)),
                      (wire22[(2'h3):(1'h0)] && $signed(wire25))}});
            end
          else
            begin
              reg27 <= (^$unsigned($signed((~(wire24 ? reg29 : wire21)))));
              reg28 <= (!($signed($signed((reg29 ? reg27 : reg26))) ?
                  wire25 : reg27[(1'h1):(1'h1)]));
              reg29 <= reg28;
              reg30 <= wire24[(5'h10):(4'he)];
            end
        end
      reg31 <= $signed((&$unsigned((~&{reg26}))));
      reg32 <= $signed(($unsigned({$signed(reg26),
          (reg29 ? wire24 : wire21)}) < $unsigned(({wire25} <= (wire21 ?
          (8'h9c) : reg29)))));
      if ({wire21})
        begin
          reg33 <= (^~(8'h9d));
          if (($unsigned({(^~reg32[(4'h8):(3'h7)]),
                  $signed($unsigned(reg27))}) ?
              ((~&reg30) ?
                  $unsigned($unsigned({wire24})) : ($unsigned((reg30 ?
                      reg33 : wire21)) & (~&$signed((7'h40))))) : reg31[(1'h0):(1'h0)]))
            begin
              reg34 <= {$unsigned($signed((8'ha3)))};
              reg35 <= ({reg27} ?
                  $signed($unsigned((~^(&reg27)))) : (+(|wire22[(4'hc):(4'hc)])));
              reg36 <= wire22;
            end
          else
            begin
              reg34 <= {$unsigned($unsigned(reg30)),
                  (-{$unsigned(reg28[(1'h1):(1'h1)])})};
              reg35 <= reg30[(5'h11):(4'hd)];
            end
          reg37 <= ({($signed((reg27 ?
                  reg30 : wire21)) && (reg32[(1'h0):(1'h0)] || {reg35})),
              {($signed(reg35) && $signed(wire25))}} * (&reg27));
          if (reg30)
            begin
              reg38 <= $unsigned(wire23);
              reg39 <= reg33;
            end
          else
            begin
              reg38 <= ($signed(wire21) ^ (~(~&((wire25 | reg27) ?
                  (reg38 << reg31) : reg35))));
            end
        end
      else
        begin
          reg33 <= (reg39[(3'h5):(2'h2)] ?
              $signed(((8'hb6) ? reg36 : (8'hb5))) : reg33);
        end
      reg40 <= (reg34 & $signed({reg27[(1'h1):(1'h1)], $unsigned((+reg31))}));
    end
  assign wire41 = {reg32[(3'h4):(1'h1)],
                      ((!$signed((-wire24))) >> ($signed($signed(reg39)) ?
                          reg37 : $signed((wire23 ? reg29 : reg30))))};
  assign wire42 = ({wire24[(5'h12):(4'he)]} >> reg31[(1'h0):(1'h0)]);
  module43 #() modinst80 (.wire47(wire23), .wire45(reg35), .wire48(wire24), .clk(clk), .wire44(wire42), .y(wire79), .wire46(reg27));
  assign wire81 = $unsigned(($signed($signed(((7'h41) ? wire22 : reg36))) ?
                      {(~^(reg39 ^~ wire24)), wire23[(3'h4):(2'h2)]} : reg35));
  assign wire82 = (&$signed(reg38));
  assign wire83 = $signed((-wire21[(3'h7):(1'h0)]));
  module84 #() modinst123 (.wire86(reg34), .wire85(wire21), .wire87(reg39), .clk(clk), .wire88(wire23), .y(wire122), .wire89(reg36));
  assign wire124 = $unsigned((reg27 ?
                       (~&$unsigned((-wire23))) : ((((8'h9e) ? reg37 : reg38) ?
                           reg34 : (~&(8'hbf))) < ($signed((8'hb0)) ?
                           (~reg30) : reg38[(2'h3):(1'h0)]))));
  assign wire125 = (({wire122} ?
                           reg29 : $unsigned({((8'hbf) ? wire81 : wire24),
                               (!(7'h40))})) ?
                       $unsigned((reg35 ?
                           $signed($unsigned((8'haf))) : reg38)) : wire83[(2'h2):(1'h1)]);
endmodule

module module84
#(parameter param120 = (^~(+{(7'h42), (~(^~(8'hb9)))})), 
parameter param121 = (({{{param120, param120}}, ({(8'hb8), param120} ? (~|param120) : (param120 ? param120 : param120))} >>> {((!param120) ? (param120 ? param120 : (8'hb4)) : (+param120))}) && (-((~{param120}) ^~ ((param120 & (8'ha9)) ? (|param120) : param120)))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire89;
  input wire signed [(4'h9):(1'h0)] wire88;
  input wire [(5'h12):(1'h0)] wire87;
  input wire [(5'h14):(1'h0)] wire86;
  input wire [(4'h9):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire102;
  wire [(4'he):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire [(5'h12):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  assign y = {wire119,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire90 = wire87[(4'hc):(4'h8)];
  assign wire91 = (&(8'hb8));
  assign wire92 = (wire90[(3'h4):(2'h3)] ^~ $signed((((7'h43) ~^ (&wire88)) >> (&$signed((8'haa))))));
  assign wire93 = wire86;
  assign wire94 = $unsigned((^~$signed(((~^(8'hb8)) || wire89[(3'h7):(3'h5)]))));
  assign wire95 = wire88;
  assign wire96 = $unsigned((($unsigned((~&wire94)) ?
                          (~(&wire94)) : $signed({wire88})) ?
                      $signed((wire86 | wire94)) : (|$unsigned($unsigned(wire90)))));
  assign wire97 = (wire95[(3'h4):(3'h4)] || wire91);
  assign wire98 = (((&wire96[(2'h3):(1'h1)]) != (wire91 <= ((wire91 - wire92) ?
                          $signed(wire94) : $unsigned(wire90)))) ?
                      {(wire88[(4'h8):(2'h3)] - {$signed(wire97)}),
                          (+wire85)} : $unsigned(wire97[(5'h12):(1'h1)]));
  assign wire99 = wire87;
  assign wire100 = $signed((7'h42));
  assign wire101 = ((wire99[(1'h0):(1'h0)] ?
                       $unsigned({{wire88, wire93},
                           (8'hae)}) : $signed(((^~wire93) < $signed(wire99)))) < wire85);
  assign wire102 = $unsigned((wire90[(2'h3):(2'h2)] ?
                       $signed(wire85) : $unsigned($signed((~&wire95)))));
  assign wire103 = ($unsigned(((wire102 ?
                           wire90 : $signed(wire87)) << ((8'ha8) ?
                           (~^wire100) : $signed(wire91)))) ?
                       $unsigned($signed((-(wire94 != wire96)))) : $signed($unsigned(($signed(wire89) ?
                           ((8'hba) > (8'haf)) : wire88[(1'h0):(1'h0)]))));
  assign wire104 = (|$unsigned($signed($unsigned(((8'h9f) <= wire85)))));
  assign wire105 = $unsigned((wire89 ?
                       (~&((wire88 << wire103) ?
                           wire94 : (wire97 ?
                               wire91 : wire87))) : (wire103 - wire87)));
  assign wire106 = (8'hba);
  assign wire107 = $signed($unsigned(wire100));
  always
    @(posedge clk) begin
      reg108 <= $unsigned((wire88[(4'h8):(3'h5)] >>> wire96[(3'h5):(3'h5)]));
    end
  always
    @(posedge clk) begin
      if ($signed($signed((|((wire85 > wire97) <= wire95[(3'h7):(3'h5)])))))
        begin
          reg109 <= wire85[(3'h6):(3'h4)];
          reg110 <= wire97;
        end
      else
        begin
          reg109 <= (wire85 | wire100);
        end
      reg111 <= wire85;
      if (wire93)
        begin
          reg112 <= wire86;
          if ({((((wire88 != wire86) + (wire106 ?
                      wire87 : reg111)) > (wire96 < $unsigned(wire85))) ?
                  ($unsigned(wire86) ?
                      $unsigned((wire107 ?
                          reg110 : wire86)) : (&(|wire94))) : $unsigned({wire95})),
              $unsigned((-wire88))})
            begin
              reg113 <= wire96[(2'h2):(1'h0)];
            end
          else
            begin
              reg113 <= $unsigned(wire104[(4'h9):(3'h6)]);
              reg114 <= ((8'ha1) ?
                  wire105[(4'hb):(4'h8)] : ($signed((8'hb9)) + $unsigned($signed(wire85[(3'h4):(3'h4)]))));
              reg115 <= $unsigned($unsigned({wire107, reg109[(1'h0):(1'h0)]}));
              reg116 <= $unsigned($unsigned(({wire88, wire85} ?
                  ((wire87 ?
                      wire98 : (7'h41)) + reg109[(4'h8):(1'h1)]) : (^~(|reg111)))));
              reg117 <= ((($signed($unsigned((8'had))) >= (^wire101[(4'h8):(1'h0)])) ^ (~(^{wire90,
                  (8'haa)}))) ^~ (((wire107 >>> (wire99 != (8'hbb))) ?
                      $unsigned(reg110[(4'ha):(3'h6)]) : $unsigned($unsigned(wire100))) ?
                  ({$signed(reg113)} ?
                      ((&reg113) ?
                          reg109[(3'h5):(3'h4)] : $signed((7'h42))) : ({wire94,
                          wire93} > reg114[(5'h10):(4'ha)])) : wire105));
            end
          reg118 <= {(&reg115)};
        end
      else
        begin
          reg112 <= wire91[(3'h4):(3'h4)];
          reg113 <= ($unsigned(((|reg111[(3'h7):(2'h2)]) + $unsigned($unsigned(wire89)))) || $signed(reg115));
          reg114 <= (wire105 ? wire104 : reg115);
          reg115 <= (wire87 ?
              $signed($signed(wire88[(2'h3):(2'h2)])) : ({$unsigned((wire99 ?
                      wire92 : (7'h41)))} <<< reg117));
        end
    end
  assign wire119 = ((~&wire107) ?
                       $unsigned((|reg110[(4'hf):(3'h6)])) : wire102);
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire48;
  input wire [(4'h8):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  input wire [(4'hb):(1'h0)] wire45;
  input wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire49 = $signed($unsigned(wire47));
  assign wire50 = ($unsigned((8'hb6)) ?
                      $signed((8'haf)) : (~($unsigned({wire44}) ?
                          ((wire45 ? wire48 : wire44) ?
                              (^~wire46) : (wire46 ?
                                  wire49 : wire45)) : (|(wire48 ?
                              wire48 : wire47)))));
  assign wire51 = (wire49 * {($unsigned((wire50 ? wire49 : wire44)) ?
                          $signed((wire50 ?
                              wire44 : wire44)) : ((^wire46) >> {wire48,
                              wire50})),
                      ((7'h44) ?
                          $signed($signed(wire45)) : (^~wire49[(3'h5):(2'h3)]))});
  assign wire52 = (^wire44[(3'h6):(3'h4)]);
  assign wire53 = $signed(({(+(~|wire45))} ^~ (|$signed(((8'hae) < wire49)))));
  assign wire54 = $unsigned(wire53[(1'h0):(1'h0)]);
  assign wire55 = $unsigned($unsigned(wire54[(2'h3):(1'h0)]));
  assign wire56 = wire50;
  always
    @(posedge clk) begin
      reg57 <= {wire56[(4'hc):(2'h2)]};
      reg58 <= (~^wire50[(3'h4):(2'h3)]);
      reg59 <= (wire55 >>> ((^~wire56[(3'h7):(1'h1)]) ?
          {$signed($signed(wire56)),
              (wire45[(4'h9):(1'h0)] ?
                  $unsigned(reg58) : {wire52})} : wire49[(1'h1):(1'h0)]));
      reg60 <= (8'h9e);
    end
  assign wire61 = (~&($signed(wire48[(3'h7):(2'h3)]) ?
                      ($signed(wire55) ?
                          wire53[(2'h2):(2'h2)] : (!$unsigned((8'haf)))) : ((^(!wire46)) ?
                          (wire44 ?
                              {wire52} : $signed(wire50)) : $signed($unsigned(reg58)))));
  assign wire62 = $unsigned($signed((((wire49 >> wire44) << $signed(reg58)) ?
                      wire47[(1'h0):(1'h0)] : $unsigned($signed(reg59)))));
  assign wire63 = $unsigned(reg57);
  assign wire64 = $signed({$signed($signed($unsigned(wire52))),
                      ($signed($unsigned(wire48)) | ({wire50, (8'ha0)} ?
                          wire47 : (|wire50)))});
  always
    @(posedge clk) begin
      reg65 <= ((|(wire64[(1'h1):(1'h1)] <<< $signed($unsigned((8'had))))) - wire51);
      if ((~^($signed((+(wire49 ?
          reg59 : wire46))) == (reg65[(4'h8):(2'h3)] << $unsigned((wire44 ?
          wire62 : wire63))))))
        begin
          reg66 <= $signed($unsigned((8'hae)));
          reg67 <= reg66;
          reg68 <= ($unsigned(wire53) ?
              (reg59[(1'h1):(1'h1)] ?
                  $signed((^reg60[(5'h12):(4'hd)])) : (wire51[(1'h1):(1'h0)] ?
                      $signed($unsigned(wire45)) : wire51[(1'h0):(1'h0)])) : (8'had));
          reg69 <= $unsigned(reg57);
          reg70 <= wire63[(4'h9):(3'h5)];
        end
      else
        begin
          reg66 <= reg66;
          reg67 <= wire46[(2'h3):(1'h1)];
          if (($unsigned(reg58[(2'h3):(1'h0)]) ?
              $unsigned((8'hbf)) : (((((8'hbe) <= reg60) ?
                          wire50[(4'h8):(1'h0)] : (wire49 ? wire53 : (8'ha5))) ?
                      (^~$unsigned(reg58)) : $signed({reg69})) ?
                  $unsigned(((^wire56) ?
                      (^~(8'ha4)) : $signed(wire62))) : $unsigned(wire47))))
            begin
              reg68 <= ({(reg57[(1'h1):(1'h0)] < ($unsigned(reg58) > (wire62 | (8'haa)))),
                      {wire55, (wire46 - (&wire44))}} ?
                  $unsigned($unsigned({(reg67 ?
                          wire62 : wire45)})) : reg60[(4'ha):(2'h2)]);
              reg69 <= wire63[(4'hb):(3'h7)];
              reg70 <= $signed((8'hb7));
            end
          else
            begin
              reg68 <= ((wire54[(4'hf):(4'hb)] ?
                      reg59 : $unsigned(($signed(reg69) << (7'h40)))) ?
                  wire56[(3'h5):(3'h5)] : wire64[(4'ha):(3'h5)]);
              reg69 <= $unsigned((reg58 ?
                  (((^wire64) - $signed((8'had))) <<< (wire47 == $signed(reg57))) : {$unsigned((wire53 ?
                          wire54 : reg69))}));
              reg70 <= $signed($signed({$unsigned((~|wire56))}));
              reg71 <= $signed($unsigned(((~|$signed(wire45)) ?
                  (8'h9e) : ((reg66 <= wire55) ?
                      (reg59 || (8'h9f)) : (8'ha2)))));
              reg72 <= $unsigned(($signed($unsigned((^reg67))) != reg69));
            end
          reg73 <= reg66[(1'h0):(1'h0)];
          reg74 <= ((~|{((wire55 == wire44) | (~^reg66))}) + (reg65[(4'h8):(2'h3)] ?
              wire53 : reg71));
        end
    end
  assign wire75 = $unsigned(((((reg73 ? reg72 : reg65) ?
                              $signed(reg68) : wire51) ?
                          $signed($unsigned(wire44)) : $signed(reg73)) ?
                      ($signed($unsigned(reg60)) <= $unsigned((~|wire51))) : $unsigned({(^reg68)})));
  assign wire76 = wire54;
  assign wire77 = (($signed(reg67[(1'h0):(1'h0)]) > reg66) < reg69);
  assign wire78 = wire52;
endmodule
