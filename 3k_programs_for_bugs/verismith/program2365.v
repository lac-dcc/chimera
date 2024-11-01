module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire123;
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire123,
                 reg127,
                 reg126,
                 reg125,
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
                 (1'h0)};
  assign wire4 = wire2[(3'h5):(2'h2)];
  assign wire5 = wire2;
  assign wire6 = {$unsigned((wire1[(3'h5):(3'h4)] ?
                         $signed((8'hbf)) : {{wire5}, $signed(wire2)})),
                     (wire2[(2'h2):(1'h0)] ?
                         $signed(((wire0 <<< wire4) ?
                             {wire4} : wire1)) : wire1[(3'h6):(3'h4)])};
  always
    @(posedge clk) begin
      reg7 <= ({$signed((+wire0[(4'h8):(3'h6)]))} >> $unsigned(((((8'had) | wire6) << {wire6,
              wire5}) ?
          $unsigned($signed(wire4)) : ($signed(wire1) ^~ $signed(wire0)))));
      reg8 <= (wire2[(3'h4):(2'h2)] ^~ (+$unsigned((wire0[(4'h9):(4'h9)] <<< $unsigned(reg7)))));
      reg9 <= (^~{$signed(((wire4 == wire1) ? (8'hbb) : $signed(reg8)))});
      reg10 <= {{(^((+wire5) ? $signed(wire0) : (~|(8'ha3))))}};
      if ((wire6[(4'hf):(4'hc)] ?
          ({(wire4[(1'h0):(1'h0)] != wire3[(3'h5):(1'h1)])} ?
              $signed($signed($unsigned((8'hae)))) : wire3[(4'he):(2'h2)]) : {{{wire1[(2'h2):(2'h2)]},
                  (~^(reg7 ? wire6 : wire4))}}))
        begin
          reg11 <= wire4;
          if ($signed((|wire6[(4'hb):(2'h2)])))
            begin
              reg12 <= reg7;
            end
          else
            begin
              reg12 <= {$signed(({wire3[(5'h13):(4'h9)]} > $signed((reg12 ?
                      (8'hb5) : wire2))))};
              reg13 <= reg11[(4'hc):(4'h8)];
              reg14 <= (~&$signed(reg11[(4'he):(2'h3)]));
              reg15 <= ($signed(reg12) ?
                  ((~reg8[(5'h12):(4'he)]) ?
                      ($unsigned((reg12 ? reg14 : reg9)) ?
                          $signed($signed(reg7)) : $unsigned((&reg11))) : (wire6 < {$unsigned(wire1)})) : (^(~|$signed((7'h44)))));
              reg16 <= ($signed($signed((wire5 ?
                      wire4 : reg8[(5'h12):(4'hc)]))) ?
                  {$signed(reg15),
                      ({(wire0 ?
                              reg11 : reg12)} >> (wire1[(3'h7):(2'h2)] >>> reg9[(3'h4):(1'h0)]))} : $unsigned((wire6 && ((reg10 ?
                      wire6 : wire2) >> {wire2}))));
            end
          reg17 <= ((reg14 ~^ (wire1 ? wire0 : wire1)) ?
              $unsigned(($signed($signed(wire2)) ^ ((reg9 ?
                  reg9 : (8'haf)) && $unsigned(reg7)))) : wire5);
        end
      else
        begin
          reg11 <= $unsigned($signed(wire0[(1'h1):(1'h1)]));
          reg12 <= (^$unsigned((reg13[(1'h0):(1'h0)] ?
              $signed((+reg13)) : (reg8 ?
                  wire5[(4'hb):(3'h6)] : reg11[(4'h9):(2'h2)]))));
          reg13 <= (wire3[(4'ha):(3'h7)] ? reg16 : reg15[(5'h14):(4'ha)]);
          reg14 <= reg15[(5'h14):(5'h11)];
          reg15 <= $signed($unsigned((wire5[(4'h8):(2'h3)] ?
              $unsigned({reg9}) : (^~reg15))));
        end
    end
  module18 #() modinst124 (.wire23(wire5), .wire21(reg9), .y(wire123), .wire19(wire6), .clk(clk), .wire20(wire1), .wire22(reg13));
  always
    @(posedge clk) begin
      reg125 <= wire5[(3'h5):(3'h5)];
      reg126 <= $signed(reg7[(3'h5):(1'h0)]);
      reg127 <= {(({reg7[(3'h6):(1'h1)],
              (wire0 == reg16)} || ($unsigned(reg7) >= $signed(reg8))) == (~|({wire4,
                  wire3} ?
              $signed(wire6) : $unsigned(reg125))))};
    end
endmodule

module module18
#(parameter param122 = ({(~|((&(8'hb6)) ? ((8'ha7) <<< (7'h44)) : (+(8'ha6)))), (((&(8'hb5)) ? ((8'hb9) >>> (8'ha6)) : ((8'hb4) ? (8'h9f) : (8'ha2))) - (&((8'hb5) ^~ (8'hb6))))} ? ((^{{(8'h9d), (7'h40)}, ((8'ha8) ? (8'ha3) : (8'ha6))}) == (({(8'ha0)} && (|(8'ha8))) + {(~(8'had))})) : (^~{(~(8'ha7))})))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire signed [(4'hb):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire112,
                 wire111,
                 wire110,
                 wire105,
                 wire25,
                 wire24,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire24 = (-{(7'h40)});
  assign wire25 = {({({wire21, wire24} ?
                              wire24[(4'hb):(2'h2)] : $unsigned(wire22))} + (~(wire20[(2'h2):(2'h2)] ?
                          $signed(wire22) : wire19))),
                      (^~$signed(($unsigned(wire23) ^~ wire24[(3'h7):(3'h5)])))};
  module26 #() modinst106 (wire105, clk, wire25, wire22, wire24, wire19);
  always
    @(posedge clk) begin
      reg107 <= {wire25[(1'h1):(1'h0)]};
      reg108 <= $signed((wire21 ^ (((+wire24) ?
          {wire24} : $signed((8'ha4))) || (8'hb0))));
      reg109 <= wire20;
    end
  assign wire110 = $signed($signed($unsigned(($unsigned(wire24) == wire23))));
  assign wire111 = reg107;
  assign wire112 = ($signed(reg108[(1'h0):(1'h0)]) < (wire111[(2'h2):(1'h0)] + {{(wire23 ^ (8'hb2))}}));
  always
    @(posedge clk) begin
      reg113 <= ((8'h9f) ?
          $signed(wire25[(1'h1):(1'h1)]) : wire21[(3'h5):(2'h3)]);
      reg114 <= wire22[(4'he):(3'h6)];
      reg115 <= ($signed($unsigned(reg108[(4'ha):(4'h9)])) ?
          (((((8'h9d) ? wire22 : wire23) ?
                  (^wire25) : (reg108 ? reg108 : wire23)) ?
              (wire25 <= (8'hb4)) : ($unsigned((8'hb3)) ?
                  $unsigned(reg109) : $signed(wire111))) >>> ((~&$signed(wire110)) ?
              reg107[(5'h12):(3'h7)] : ($unsigned(wire24) ?
                  (wire24 >= wire105) : wire20))) : reg113[(4'hf):(1'h0)]);
      if ($signed(((wire111 ~^ wire19[(1'h0):(1'h0)]) ?
          (-($unsigned(wire25) >> $unsigned(reg115))) : $unsigned(reg107[(4'hd):(4'hb)]))))
        begin
          reg116 <= ($signed($unsigned(($signed((8'hb6)) ?
              $unsigned(reg108) : (reg107 && reg107)))) >> (wire20 * ((~^$unsigned(wire24)) ?
              (+wire112) : reg113)));
        end
      else
        begin
          reg116 <= wire21[(4'ha):(2'h3)];
          reg117 <= (-{wire111[(2'h3):(1'h1)], reg107[(4'he):(3'h7)]});
        end
      reg118 <= ({$unsigned({reg108}),
          $unsigned((wire23[(5'h12):(4'hd)] ?
              (wire21 ? wire111 : reg109) : ((8'hba) ?
                  reg114 : wire23)))} == (|((^~$unsigned(reg113)) ?
          (8'hb9) : wire112[(2'h2):(1'h1)])));
    end
  assign wire119 = reg115;
  assign wire120 = {(|($signed(wire20) ? reg115 : reg109))};
  assign wire121 = $signed((($signed($unsigned(wire119)) >> (((7'h40) ?
                           wire120 : wire120) ?
                       ((8'hb6) | reg118) : (wire25 & wire119))) - wire24));
endmodule

module module26
#(parameter param104 = (-({(((8'ha9) ? (8'ha4) : (8'ha6)) ? (+(8'ha2)) : {(7'h43)})} ? (((8'hb4) ? (8'ha7) : (&(8'haf))) ? ((7'h43) >> (~(8'ha9))) : (8'hba)) : ({((8'ha7) << (8'hb5))} ? {(^(8'ha7))} : ((+(8'hb9)) != (-(8'ha6)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h361):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire29;
  input wire [(2'h3):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire80,
                 wire58,
                 wire57,
                 wire56,
                 wire33,
                 wire32,
                 wire31,
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
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire31 = $signed((wire30[(2'h3):(2'h3)] ~^ (|$unsigned((wire27 ?
                      wire28 : wire30)))));
  assign wire32 = wire31;
  assign wire33 = wire32[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      if (((~^$unsigned($signed($signed(wire30)))) ?
          wire29[(3'h4):(1'h0)] : wire32[(4'hd):(4'hb)]))
        begin
          reg34 <= ((wire33[(4'he):(1'h0)] ?
              (^~wire28) : $unsigned(wire31[(2'h3):(1'h0)])) <= (wire29[(2'h2):(1'h1)] > $unsigned((&(wire31 >> (8'hac))))));
          reg35 <= ($unsigned((&($unsigned(wire29) ?
                  $signed(wire30) : $unsigned(wire32)))) ?
              ((~&$signed(wire30[(2'h2):(1'h0)])) ?
                  wire29 : (-(~^$unsigned(wire31)))) : reg34);
          reg36 <= wire29;
        end
      else
        begin
          reg34 <= $unsigned(wire27);
          reg35 <= (-wire29[(3'h4):(1'h1)]);
          reg36 <= wire33;
        end
      if ((wire27[(1'h1):(1'h1)] ~^ wire33[(4'hd):(4'hd)]))
        begin
          reg37 <= (8'ha7);
          if ((8'hbd))
            begin
              reg38 <= {(&($unsigned($unsigned(wire32)) >> (wire33 + (wire28 ?
                      (7'h42) : reg37)))),
                  wire33};
              reg39 <= (8'ha0);
              reg40 <= (^~$signed(($signed($unsigned(wire27)) ^ ($signed(reg38) >>> $unsigned(wire33)))));
              reg41 <= (~((~^(wire29 <= wire31)) != $unsigned($signed($unsigned((8'hb9))))));
            end
          else
            begin
              reg38 <= (wire30 ?
                  (reg38[(3'h5):(2'h3)] ?
                      ({(reg40 ?
                              reg38 : reg37)} > reg34[(3'h7):(3'h5)]) : (reg41 ?
                          (reg39 + wire28[(1'h1):(1'h1)]) : reg37)) : (^$unsigned(((7'h44) ?
                      $unsigned((8'hab)) : (reg41 ? wire33 : wire30)))));
              reg39 <= reg37;
              reg40 <= wire32;
            end
        end
      else
        begin
          reg37 <= {wire30[(2'h2):(1'h1)]};
          if ((&(wire32 ? $signed(reg35[(2'h3):(2'h3)]) : reg39)))
            begin
              reg38 <= {reg36,
                  ({(reg38[(2'h2):(1'h1)] && (~wire28)),
                      {$unsigned((8'ha4)), wire32}} > wire28)};
              reg39 <= reg38;
              reg40 <= {reg37[(4'hb):(2'h3)], wire27[(2'h2):(1'h1)]};
              reg41 <= (($unsigned({wire27[(1'h0):(1'h0)]}) ?
                      wire28[(2'h3):(1'h0)] : $unsigned(wire31[(5'h12):(5'h11)])) ?
                  wire33[(1'h1):(1'h1)] : wire33[(4'he):(4'h9)]);
              reg42 <= wire31[(3'h7):(2'h2)];
            end
          else
            begin
              reg38 <= ($signed($unsigned($unsigned($unsigned(reg34)))) > wire31);
            end
          reg43 <= (-((reg40[(4'he):(4'hb)] ~^ $signed(reg34)) ?
              {($unsigned(reg38) > $unsigned(wire30)),
                  ((reg35 ? wire27 : reg41) ?
                      $signed(reg39) : (|reg36))} : wire31));
        end
      if ((((reg37[(4'he):(3'h4)] || wire28) ?
              (8'hba) : $unsigned({(reg34 ? wire33 : wire27), (^~wire31)})) ?
          reg39 : (8'hb2)))
        begin
          reg44 <= reg40;
        end
      else
        begin
          reg44 <= wire28;
        end
      if (reg43[(2'h3):(2'h2)])
        begin
          if ($signed(reg42))
            begin
              reg45 <= (reg35 ?
                  (8'haf) : $unsigned($unsigned(wire27[(2'h2):(1'h0)])));
            end
          else
            begin
              reg45 <= $unsigned($signed((^$signed({reg34, reg38}))));
            end
          reg46 <= reg36[(1'h1):(1'h0)];
          reg47 <= wire31;
          reg48 <= {reg44[(2'h2):(1'h1)],
              (wire29[(3'h7):(1'h1)] != (^((~^(8'ha2)) > reg42)))};
          reg49 <= {{{(^~$signed((8'ha7))), reg48[(3'h6):(3'h5)]},
                  (($unsigned(wire28) ? (+wire29) : (8'hb8)) ?
                      $signed($unsigned(reg40)) : reg45[(3'h5):(2'h3)])},
              $signed(reg44[(2'h3):(1'h1)])};
        end
      else
        begin
          reg45 <= $signed(reg39[(2'h2):(2'h2)]);
          reg46 <= (reg41[(3'h5):(2'h3)] > $signed(((wire33 >= {reg34}) ?
              (&(reg36 ? wire29 : wire27)) : $unsigned((reg35 ?
                  wire29 : reg48)))));
          if ((+$signed(({$unsigned(wire31),
              (reg36 | wire31)} <<< $unsigned({reg38, wire32})))))
            begin
              reg47 <= (+reg46);
              reg48 <= ({reg46[(4'hb):(4'hb)],
                  $signed(((reg46 ?
                      reg38 : wire30) << $signed(reg38)))} && $signed(wire33[(1'h0):(1'h0)]));
            end
          else
            begin
              reg47 <= ({(((-wire29) ^~ $signed((8'hb9))) < wire27)} != (-$signed(($signed(reg34) ?
                  $unsigned((8'ha9)) : $unsigned(reg36)))));
            end
          reg49 <= ((!(!reg35)) ?
              $signed($signed($signed($unsigned(reg38)))) : wire31);
          if ($unsigned(($signed(((reg47 + reg44) <<< (reg45 - wire29))) ?
              $unsigned($unsigned({reg48,
                  reg40})) : (($unsigned(reg35) > {reg46}) >>> (~&(~^reg46))))))
            begin
              reg50 <= (reg38[(2'h2):(2'h2)] ~^ (reg42 | reg47[(2'h2):(1'h0)]));
              reg51 <= wire31;
              reg52 <= $unsigned($unsigned({{(+wire28)},
                  $signed($unsigned(wire27))}));
            end
          else
            begin
              reg50 <= ($unsigned(wire33) > reg39);
              reg51 <= $signed({{(wire32[(2'h2):(1'h0)] ?
                          (reg44 << wire33) : (wire30 * wire30))}});
              reg52 <= $unsigned(((&(^$signed(wire30))) ^~ ((reg47 ~^ $signed(reg42)) ?
                  reg40 : (|(reg45 & wire27)))));
              reg53 <= {{(((&reg50) >= $unsigned(wire29)) ?
                          {$unsigned(reg49)} : $unsigned($unsigned(reg37))),
                      wire32[(4'h8):(3'h7)]},
                  wire28[(1'h1):(1'h0)]};
              reg54 <= ((reg40 ?
                  $signed($unsigned(reg44[(1'h0):(1'h0)])) : $signed((reg38 + (reg47 ?
                      reg40 : reg35)))) & (~^$unsigned(wire28[(1'h1):(1'h1)])));
            end
        end
      reg55 <= wire31[(1'h0):(1'h0)];
    end
  assign wire56 = (-reg34[(2'h3):(2'h2)]);
  assign wire57 = $unsigned((reg37[(3'h6):(2'h2)] ?
                      ($signed(reg34[(3'h6):(3'h6)]) ?
                          ((wire33 < wire28) ?
                              wire31 : ((8'ha2) != (8'haf))) : reg48) : ($unsigned($signed((8'haf))) ?
                          $signed(reg53[(2'h3):(1'h1)]) : reg55[(2'h3):(1'h0)])));
  assign wire58 = (|wire57[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      reg59 <= ($unsigned((wire32 ?
          reg52[(3'h6):(1'h1)] : $unsigned((reg36 ? reg40 : reg47)))) >> reg42);
      reg60 <= reg40[(3'h7):(1'h1)];
      if ($unsigned(reg60))
        begin
          if (((((&$unsigned(reg59)) << reg40) | reg38[(1'h0):(1'h0)]) ?
              wire29[(4'he):(1'h1)] : ((|(reg59 == reg47[(2'h2):(1'h1)])) << $signed($signed((~wire29))))))
            begin
              reg61 <= reg48[(4'ha):(3'h4)];
              reg62 <= reg48;
              reg63 <= (-((reg52 + wire29) | (({reg52, wire30} ?
                  $unsigned((8'hb7)) : $unsigned(wire30)) >> $unsigned((~reg45)))));
            end
          else
            begin
              reg61 <= reg63;
              reg62 <= $signed({((~|wire30) ~^ (-(wire32 <= reg38))),
                  wire29[(1'h0):(1'h0)]});
              reg63 <= ((wire29[(3'h5):(3'h5)] ?
                      wire29[(4'hf):(4'ha)] : ((wire56 && $signed(reg53)) ^~ (((8'hb6) ?
                              reg38 : reg37) ?
                          (reg35 >= reg62) : (wire29 ? reg44 : reg54)))) ?
                  (reg42[(4'h9):(3'h6)] ?
                      reg59 : (~^((!(8'hb2)) ?
                          (^reg43) : {wire30, reg45}))) : reg47[(2'h2):(1'h0)]);
              reg64 <= $unsigned(wire57[(3'h6):(3'h6)]);
            end
          reg65 <= reg41[(3'h5):(2'h2)];
        end
      else
        begin
          if ({$signed({(+$unsigned(reg38)), (~^reg40)})})
            begin
              reg61 <= $unsigned((wire57 != reg62[(3'h6):(2'h2)]));
              reg62 <= {reg53};
              reg63 <= reg60[(4'h8):(2'h3)];
            end
          else
            begin
              reg61 <= (-(~&reg55[(4'hd):(3'h6)]));
              reg62 <= $unsigned((reg48 ?
                  $signed({(reg42 <<< reg53)}) : ((reg59[(3'h6):(3'h4)] >> reg48[(4'hb):(4'h8)]) < ((reg60 ?
                      reg49 : reg39) && reg42))));
              reg63 <= wire58;
              reg64 <= reg63;
              reg65 <= reg54;
            end
        end
    end
  always
    @(posedge clk) begin
      if ({((wire28[(2'h3):(2'h3)] ?
              ((8'ha9) || (reg64 + wire57)) : ($signed(reg55) ?
                  (reg50 | reg42) : (reg46 + reg54))) && reg43)})
        begin
          reg66 <= {(reg62[(2'h2):(1'h1)] + $unsigned(((reg64 ?
                  wire27 : reg41) ~^ (~wire30)))),
              $signed($signed(($unsigned(reg36) ? reg42 : $signed(wire32))))};
          reg67 <= (~|reg47[(2'h3):(1'h1)]);
          if ((reg47 ?
              {wire56} : {$signed(((reg51 <<< reg42) ?
                      $unsigned(reg60) : (~^reg61))),
                  {(~|wire33), (reg48[(3'h4):(1'h0)] & (^reg41))}}))
            begin
              reg68 <= (({((reg37 ? wire32 : reg61) ? (^reg38) : (-reg35)),
                          reg61[(2'h3):(2'h3)]} ?
                      $signed(($signed(reg52) ?
                          (8'hb9) : (reg42 ? wire33 : reg46))) : {(|wire32)}) ?
                  {reg61,
                      (reg59[(2'h2):(1'h0)] >> reg66)} : {(((wire31 <= reg53) == (reg42 || wire29)) ?
                          {wire57[(4'h8):(2'h2)],
                              wire29[(3'h7):(3'h4)]} : reg63[(2'h2):(1'h0)])});
              reg69 <= reg45[(3'h4):(2'h3)];
              reg70 <= ({({(reg67 <<< wire58), wire28[(2'h3):(2'h2)]} ?
                      (wire58 ?
                          (-wire27) : $unsigned(wire30)) : reg37)} * $unsigned(($unsigned($unsigned(reg51)) ?
                  ({reg59} < wire33[(1'h1):(1'h0)]) : reg49)));
            end
          else
            begin
              reg68 <= (($signed((reg43[(3'h7):(3'h4)] ?
                      (&reg65) : $signed(reg52))) <= (($signed(reg55) ?
                          (8'hba) : reg51[(4'he):(4'hc)]) ?
                      (~|(reg54 & reg45)) : ((~^wire56) == reg68))) ?
                  (!(~&reg44[(1'h1):(1'h0)])) : ($signed(reg60[(3'h5):(3'h4)]) ?
                      (~|{$signed(reg34)}) : ($unsigned(reg54) <= {$unsigned(reg54)})));
              reg69 <= $unsigned(reg67[(1'h0):(1'h0)]);
              reg70 <= (~&$unsigned($unsigned(wire30[(3'h5):(3'h4)])));
              reg71 <= wire30;
              reg72 <= (wire28[(2'h3):(2'h3)] == $signed({$signed((reg69 ?
                      reg67 : reg39))}));
            end
          reg73 <= wire56[(1'h0):(1'h0)];
        end
      else
        begin
          reg66 <= $signed((((+(reg64 ? reg59 : (7'h43))) ?
                  ({reg50, reg46} ?
                      reg49 : $unsigned((8'hb4))) : reg53[(3'h5):(1'h1)]) ?
              $unsigned(($unsigned(wire57) ?
                  (wire58 >> reg69) : (^~(8'had)))) : reg44[(1'h0):(1'h0)]));
          reg67 <= $signed($unsigned((($unsigned(reg35) == $signed(reg54)) & reg44)));
          reg68 <= reg43[(3'h7):(3'h6)];
          if (wire27[(1'h1):(1'h0)])
            begin
              reg69 <= reg46[(3'h4):(3'h4)];
              reg70 <= (reg52[(2'h3):(1'h1)] >> $signed((^~reg54)));
              reg71 <= $unsigned(wire57[(4'h8):(3'h7)]);
            end
          else
            begin
              reg69 <= reg45;
            end
        end
      if ($unsigned((~$signed({(wire58 ? reg37 : wire57)}))))
        begin
          if (reg64[(5'h11):(4'hf)])
            begin
              reg74 <= reg50[(5'h11):(4'hc)];
              reg75 <= (+(((wire27 ^ (|reg47)) >>> wire33[(5'h12):(2'h2)]) ?
                  $unsigned((~^$unsigned(reg52))) : (|$signed($signed((8'haf))))));
            end
          else
            begin
              reg74 <= wire56;
              reg75 <= {reg42[(2'h2):(2'h2)], (8'hb5)};
              reg76 <= reg69[(4'hd):(3'h6)];
            end
          reg77 <= wire58;
          reg78 <= reg43;
          reg79 <= $unsigned(((^~$signed($signed(reg60))) ?
              (~reg36) : ((&$unsigned(reg45)) ?
                  (+(reg69 ? reg52 : reg54)) : reg35[(3'h6):(1'h0)])));
        end
      else
        begin
          reg74 <= $signed(({({(8'hb1), reg36} - $signed(reg45)), reg43} ?
              reg50[(5'h13):(4'he)] : $unsigned(wire29[(3'h6):(2'h3)])));
        end
    end
  assign wire80 = ((^~{reg72[(5'h11):(5'h11)]}) ?
                      ($signed(reg37[(1'h0):(1'h0)]) ?
                          $signed(reg62) : reg59[(3'h7):(1'h1)]) : reg47);
  always
    @(posedge clk) begin
      if ((wire28 & {reg79[(3'h6):(1'h0)],
          (wire30 ?
              $signed(wire28[(1'h1):(1'h0)]) : (reg76 ?
                  wire57 : (wire30 && reg35)))}))
        begin
          if ($unsigned($signed((&reg45))))
            begin
              reg81 <= wire58;
            end
          else
            begin
              reg81 <= reg69;
              reg82 <= reg66;
              reg83 <= (reg34 * $signed(((+(-reg45)) ?
                  {$unsigned(reg59),
                      (|reg69)} : $signed(reg52[(3'h4):(3'h4)]))));
              reg84 <= reg42[(4'h8):(3'h7)];
            end
          if (reg81[(2'h2):(2'h2)])
            begin
              reg85 <= $signed(($unsigned(reg48[(1'h1):(1'h1)]) != (^reg65[(5'h15):(1'h0)])));
              reg86 <= (((~|reg51[(4'hf):(2'h3)]) >>> (-((reg65 >> reg84) ^ (~|reg60)))) && {$unsigned((&$signed(wire58))),
                  (reg65 * (&$signed(wire29)))});
              reg87 <= $signed((-((7'h41) ^~ {((8'hbe) && reg54)})));
            end
          else
            begin
              reg85 <= reg37[(4'h8):(1'h0)];
              reg86 <= ((~^reg77) ?
                  reg87[(1'h1):(1'h1)] : {($signed((-reg78)) > (&{wire32})),
                      (reg77[(1'h0):(1'h0)] >= $unsigned((^~reg74)))});
              reg87 <= (^(+$unsigned($unsigned((reg40 ? reg45 : reg75)))));
              reg88 <= $signed((reg43[(3'h4):(1'h0)] > $signed($unsigned($signed(reg50)))));
              reg89 <= (|$signed(wire28));
            end
        end
      else
        begin
          reg81 <= (~^$signed($unsigned(((|(8'hb9)) >> reg55[(3'h6):(2'h3)]))));
          reg82 <= (8'haa);
          reg83 <= $unsigned($unsigned($signed(reg52[(3'h5):(3'h4)])));
          reg84 <= ((({(-wire29), (reg87 ? reg38 : reg73)} ?
                      $signed((wire58 ? wire30 : reg81)) : (&(8'ha8))) ?
                  (!(reg36[(4'he):(4'ha)] ?
                      $unsigned(reg78) : wire58)) : ((+wire28[(1'h1):(1'h1)]) ?
                      ($signed(reg39) ?
                          $unsigned((8'hb6)) : {reg76}) : wire80)) ?
              (8'ha9) : $signed(reg66));
          reg85 <= reg59;
        end
    end
  always
    @(posedge clk) begin
      reg90 <= reg85[(5'h10):(3'h6)];
      if ($signed((^(($signed(reg42) || $signed(wire29)) ?
          $unsigned($unsigned(reg84)) : ($signed((8'hb6)) ?
              $unsigned(reg77) : (reg60 ? reg38 : reg73))))))
        begin
          reg91 <= ((8'ha6) ?
              $unsigned(reg37[(4'he):(4'hd)]) : (^~$unsigned(wire30)));
          reg92 <= (reg35 | (($signed((|reg84)) ?
              $signed(((8'h9f) > reg86)) : (reg68[(3'h5):(3'h5)] <<< (reg50 <= (8'hb2)))) | {($signed(reg87) ?
                  reg48[(2'h2):(1'h0)] : reg52),
              (|$signed(reg69))}));
          reg93 <= (reg89[(2'h3):(2'h3)] << reg65[(4'hc):(3'h7)]);
          reg94 <= wire28;
        end
      else
        begin
          if ((!reg41))
            begin
              reg91 <= ($unsigned(($signed($unsigned(reg93)) ?
                      $unsigned($signed(reg65)) : $unsigned($signed((7'h44))))) ?
                  $signed($unsigned(((reg64 ?
                      reg51 : reg85) ~^ reg73))) : reg36);
            end
          else
            begin
              reg91 <= (8'hb7);
            end
          reg92 <= $unsigned((^~({(reg93 == reg70), $unsigned(reg47)} ?
              (&{wire58}) : ((wire31 > wire33) || {reg88, reg77}))));
        end
      if ((reg61[(4'h9):(3'h4)] - wire29))
        begin
          reg95 <= (~^reg94);
          reg96 <= (!$unsigned($unsigned(($unsigned(reg95) >> $unsigned(wire27)))));
          if ((&(reg52[(4'h8):(4'h8)] != ((^~reg42) ?
              reg61[(4'hf):(4'h9)] : reg39))))
            begin
              reg97 <= $unsigned($unsigned({((wire58 ? reg61 : reg49) ?
                      reg94[(5'h13):(5'h10)] : (-reg85)),
                  $unsigned($signed((7'h42)))}));
              reg98 <= $unsigned($unsigned(((8'hbf) ?
                  ($unsigned(reg77) ?
                      (&(8'ha0)) : reg39[(3'h4):(1'h0)]) : ($unsigned(reg96) ?
                      reg48[(1'h0):(1'h0)] : (reg97 >= reg41)))));
              reg99 <= (~&$signed({(~|reg77),
                  ($unsigned(reg96) && $signed(reg41))}));
              reg100 <= {(reg78 ? reg73 : reg75[(3'h7):(2'h3)])};
            end
          else
            begin
              reg97 <= $unsigned((({(wire29 ^~ reg71)} - reg61[(5'h12):(4'h9)]) ?
                  (wire58[(4'hc):(3'h5)] ?
                      ($unsigned(reg47) | $unsigned(reg73)) : ((reg82 ?
                              reg98 : reg51) ?
                          $signed((8'ha7)) : $signed(reg67))) : $unsigned(reg51[(4'h9):(2'h3)])));
              reg98 <= reg87;
              reg99 <= reg49;
              reg100 <= wire80;
            end
          reg101 <= ($unsigned($unsigned($unsigned($unsigned(reg72)))) * (reg100 ?
              reg52 : ($signed((reg76 ? reg90 : wire32)) < $signed((!reg53)))));
        end
      else
        begin
          reg95 <= $unsigned(wire30);
          reg96 <= $unsigned(($signed(reg89) + reg34));
          reg97 <= reg37;
        end
    end
  assign wire102 = $signed(reg90[(2'h3):(2'h2)]);
  assign wire103 = reg97;
endmodule
