module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire124;
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  assign y = {wire86,
                 wire95,
                 wire96,
                 wire124,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 (1'h0)};
  module4 #() modinst87 (.clk(clk), .wire8(wire2), .wire5(wire0), .y(wire86), .wire7(wire3), .wire6(wire1));
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg88 <= $signed(wire2[(2'h2):(1'h0)]);
          reg89 <= reg88;
          if ((reg88[(3'h5):(1'h0)] ?
              (wire2 ?
                  (^~$unsigned({wire1})) : $unsigned($unsigned(wire3[(5'h12):(4'ha)]))) : ((wire86[(1'h0):(1'h0)] >> (^~wire3[(3'h6):(2'h2)])) == {$unsigned((!reg88)),
                  $signed($unsigned(wire0))})))
            begin
              reg90 <= (!$unsigned((~^($unsigned(wire3) ?
                  reg89[(4'he):(3'h6)] : ((7'h41) ? (8'hbb) : wire3)))));
              reg91 <= reg89[(4'hd):(1'h1)];
            end
          else
            begin
              reg90 <= (8'h9e);
            end
          reg92 <= {$unsigned(($unsigned((8'hbf)) ?
                  reg90 : reg91[(2'h3):(2'h3)])),
              (wire1 ?
                  $unsigned(reg90[(1'h1):(1'h1)]) : (($unsigned((8'ha3)) ?
                      wire0 : $unsigned(wire0)) >= (~&$unsigned(wire1))))};
        end
      else
        begin
          reg88 <= $signed(reg89[(5'h14):(5'h10)]);
          reg89 <= reg90[(3'h7):(1'h1)];
          reg90 <= {{reg88},
              ($signed($signed((reg89 ? wire1 : reg92))) ?
                  wire3[(4'hb):(3'h4)] : {wire0[(4'ha):(2'h2)],
                      (wire86 && (|reg88))})};
        end
      reg93 <= (!reg90);
      reg94 <= wire0;
    end
  assign wire95 = reg90[(3'h4):(1'h1)];
  assign wire96 = $signed(reg88);
  always
    @(posedge clk) begin
      reg97 <= {$unsigned(wire96[(3'h7):(3'h7)]),
          $signed(reg90[(2'h3):(2'h2)])};
      reg98 <= (!reg91);
      reg99 <= reg93[(3'h6):(1'h0)];
      if (((wire1 ?
          (~|$signed((reg99 >= reg92))) : (wire0 >= ((8'ha8) ?
              reg88[(1'h1):(1'h0)] : wire1))) * (($signed($signed(reg93)) != (|(-wire3))) ^~ (8'h9d))))
        begin
          reg100 <= $signed((~^(^$signed(wire86[(3'h4):(2'h3)]))));
          reg101 <= $unsigned(({{((8'hbd) - reg90)},
              {{reg97, reg91}, reg100[(4'hb):(3'h4)]}} >= reg89));
          reg102 <= ((($signed((-wire96)) ?
              ({wire1} * (reg99 ? wire2 : wire96)) : ((reg92 ? reg101 : reg90) ?
                  $unsigned(reg101) : (wire0 ^~ reg92))) && ((&$unsigned(wire1)) | (~^(reg97 ?
              reg92 : (8'ha7))))) <= reg92);
          if (reg92)
            begin
              reg103 <= $signed(wire2);
              reg104 <= (&(~{wire2[(2'h2):(1'h1)]}));
              reg105 <= (($signed(($signed((8'haf)) - (8'hac))) & reg93) ?
                  reg98[(3'h5):(1'h1)] : $unsigned((reg102 ?
                      $signed(reg98[(1'h1):(1'h1)]) : ((wire0 >= reg102) ?
                          $unsigned((7'h43)) : reg100[(4'he):(4'hb)]))));
              reg106 <= {(~|(^$signed((reg91 ? reg103 : reg105))))};
            end
          else
            begin
              reg103 <= (8'h9c);
              reg104 <= (^{{reg91, reg105[(1'h0):(1'h0)]}});
            end
        end
      else
        begin
          reg100 <= {$unsigned(reg93[(4'hc):(1'h1)]), wire3};
        end
    end
  module107 #() modinst125 (.wire108(wire3), .clk(clk), .wire111(reg90), .wire110(reg102), .wire109(reg105), .y(wire124));
endmodule

module module107
#(parameter param123 = (8'ha0))
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire111;
  input wire [(4'hb):(1'h0)] wire110;
  input wire signed [(5'h10):(1'h0)] wire109;
  input wire signed [(4'h8):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire119;
  wire [(5'h14):(1'h0)] wire112;
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg113 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire112,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire112 = $unsigned((!(^wire109)));
  always
    @(posedge clk) begin
      if (wire109[(3'h4):(2'h2)])
        begin
          reg113 <= wire112[(5'h12):(5'h10)];
        end
      else
        begin
          if (wire111)
            begin
              reg113 <= (+$signed(wire111[(4'ha):(3'h6)]));
              reg114 <= (8'h9f);
              reg115 <= (7'h40);
              reg116 <= $signed($signed((((wire110 ?
                      wire112 : reg115) >> ((7'h44) + (8'h9d))) ?
                  $signed(wire108) : (7'h41))));
            end
          else
            begin
              reg113 <= ($unsigned({$signed({reg116, reg116}),
                      ($signed(wire109) - wire108[(2'h3):(1'h0)])}) ?
                  wire112[(5'h13):(2'h3)] : $unsigned({(~^wire111)}));
              reg114 <= $signed($signed(($signed(reg116[(1'h0):(1'h0)]) & reg115)));
              reg115 <= reg115[(3'h4):(1'h0)];
              reg116 <= ($signed(($signed($unsigned((8'h9f))) > $unsigned(wire109))) ?
                  $unsigned(((8'hbd) & $signed(reg113[(4'h9):(3'h4)]))) : $unsigned($unsigned(((reg115 << reg116) ?
                      reg113 : {(8'ha2)}))));
            end
          reg117 <= $signed($unsigned((((reg116 ? reg116 : wire110) ?
              (+(7'h40)) : $signed(wire110)) >> $signed(reg114))));
          reg118 <= reg114;
        end
    end
  assign wire119 = $unsigned((^((&wire108) * $unsigned((reg116 >= reg117)))));
  assign wire120 = reg116;
  assign wire121 = $signed($signed(reg118));
  assign wire122 = $signed(wire119);
endmodule

module module4
#(parameter param85 = ((|(7'h41)) * (((((7'h41) >= (8'hb3)) ^~ (|(8'hb9))) | (((8'hba) ? (8'ha1) : (8'hab)) ? ((8'hb6) ^ (8'ha1)) : (~(8'hbb)))) ? ({((8'hbe) ^ (8'hb9))} ? (((8'haa) >> (8'hae)) ? ((8'hbc) << (8'ha1)) : ((8'hbb) ? (7'h43) : (8'hb4))) : (8'ha8)) : (((8'hb0) ? (~(8'ha0)) : (~(8'hb1))) & {(+(8'h9f))}))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire84;
  wire [(5'h13):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire9;
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire30,
                 wire29,
                 wire20,
                 wire19,
                 wire9,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire9 = (^~wire8);
  always
    @(posedge clk) begin
      if ((wire7 > $unsigned($signed(wire6[(3'h5):(2'h3)]))))
        begin
          reg10 <= (~&wire5[(1'h0):(1'h0)]);
          reg11 <= {$unsigned({(&(wire6 >> wire5))})};
          reg12 <= $unsigned((wire8 != (~&(reg11 == wire5))));
          reg13 <= {(8'hbd)};
          reg14 <= $unsigned($signed({((!wire5) ^ wire5[(2'h3):(2'h2)])}));
        end
      else
        begin
          reg10 <= ({({((7'h41) << reg10)} ?
                      reg10[(3'h4):(2'h2)] : $unsigned({wire5, reg13})),
                  wire9[(3'h4):(1'h0)]} ?
              (!$unsigned(wire9)) : $unsigned(reg13));
          reg11 <= (~^$signed(((|reg13[(1'h1):(1'h1)]) >> wire5)));
        end
      if (wire8)
        begin
          reg15 <= wire9[(3'h7):(2'h3)];
          reg16 <= $signed((&{{$signed(reg12), reg14}, reg12[(3'h4):(3'h4)]}));
          reg17 <= $signed($signed(($signed($unsigned((7'h41))) ^ {(reg10 ?
                  reg16 : reg15),
              (~^wire5)})));
        end
      else
        begin
          reg15 <= wire8[(2'h3):(1'h1)];
          reg16 <= reg11;
          reg17 <= wire8;
        end
      reg18 <= $signed((reg13[(1'h1):(1'h0)] && reg16));
    end
  assign wire19 = ((($unsigned((8'hae)) ?
                          {$signed(reg14), $unsigned(reg15)} : ((wire7 ?
                              reg12 : wire9) < $signed(reg18))) ?
                      $signed({(~|reg13), wire9[(4'hd):(4'hb)]}) : (((^~reg11) ?
                              reg12[(3'h4):(2'h3)] : wire6[(4'h9):(3'h4)]) ?
                          (reg17[(3'h7):(3'h7)] & (reg17 ?
                              reg14 : reg17)) : reg14)) < (&$signed(((!reg13) ?
                      (&(8'ha4)) : (~&(8'ha9))))));
  assign wire20 = ((^~$unsigned(reg13[(1'h1):(1'h1)])) || (~wire6));
  always
    @(posedge clk) begin
      reg21 <= ((^($unsigned((reg11 ?
          wire20 : wire9)) >= (~((8'ha7) > wire20)))) <= $unsigned(reg12));
      reg22 <= reg10[(2'h3):(1'h1)];
      reg23 <= (wire8 ? $signed($unsigned((^$signed(reg12)))) : reg22);
    end
  always
    @(posedge clk) begin
      reg24 <= $signed(reg13[(2'h3):(2'h3)]);
      reg25 <= $signed(((~((wire5 * wire5) <<< (^~reg10))) ^ ((~&reg12[(1'h0):(1'h0)]) ?
          $signed(wire6[(2'h2):(2'h2)]) : (((7'h42) | wire19) <= (^~reg17)))));
    end
  always
    @(posedge clk) begin
      reg26 <= (^(-(($signed(reg10) || (^(8'ha3))) ^~ (7'h41))));
      reg27 <= $signed(reg23);
      reg28 <= $unsigned($signed(reg15[(2'h2):(1'h0)]));
    end
  assign wire29 = $unsigned((~|({{wire19}} ?
                      $signed(reg10[(1'h0):(1'h0)]) : ({reg27} + (reg16 ?
                          reg28 : wire5)))));
  assign wire30 = $signed(($unsigned($unsigned($signed(reg22))) <<< (|reg25)));
  module31 #() modinst79 (wire78, clk, reg22, reg13, reg21, reg10);
  assign wire80 = ({reg14,
                          ($unsigned(reg25) << $unsigned($unsigned((8'ha6))))} ?
                      (wire78[(1'h0):(1'h0)] ?
                          reg23[(2'h2):(1'h0)] : {$unsigned(wire5),
                              $unsigned(reg17)}) : $unsigned($unsigned({reg10[(4'h8):(2'h2)],
                          (reg13 ? wire30 : wire5)})));
  assign wire81 = wire6[(3'h4):(3'h4)];
  assign wire82 = (~&$signed((&reg12[(3'h7):(1'h0)])));
  assign wire83 = (({$signed(reg13[(3'h4):(2'h3)]),
                          $signed($signed(reg13))} <<< $unsigned(((8'hb3) * ((8'ha4) ?
                          reg18 : wire81)))) ?
                      $signed($signed({(&wire8),
                          (~wire5)})) : ({$unsigned(wire6),
                          (wire30[(4'hc):(4'hc)] ?
                              reg14[(3'h4):(2'h2)] : (~reg26))} <<< reg18));
  assign wire84 = $signed(reg28[(2'h2):(1'h0)]);
endmodule

module module31
#(parameter param77 = (((|{(|(8'ha9)), ((8'h9d) ? (8'ha5) : (8'hb2))}) ? (|(((7'h41) ? (8'hac) : (8'ha5)) >> {(8'ha4)})) : (8'hb3)) ? (~&((+((7'h40) || (8'hba))) & ((8'hb6) != (-(8'haa))))) : {{((^~(7'h41)) - ((8'ha4) >= (8'ha8)))}}))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire35;
  input wire signed [(2'h3):(1'h0)] wire34;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire54,
                 wire53,
                 wire52,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg36 <= wire35[(4'ha):(3'h5)];
    end
  always
    @(posedge clk) begin
      if (reg36[(4'h8):(2'h3)])
        begin
          if (wire33[(4'hd):(1'h1)])
            begin
              reg37 <= wire35;
              reg38 <= $unsigned($signed((^~((reg36 + wire32) << (wire34 ?
                  reg37 : reg36)))));
              reg39 <= ($unsigned((((!wire33) ?
                      (reg37 <<< (8'h9c)) : (-wire35)) ^~ wire35)) ?
                  (($unsigned($unsigned(reg38)) ?
                          $signed(wire33[(3'h4):(2'h3)]) : {$signed((8'hba)),
                              $signed((8'ha5))}) ?
                      $signed($signed($signed(wire33))) : (-((wire32 <= reg37) ?
                          wire34 : reg37))) : reg38);
              reg40 <= $unsigned(((reg37 ?
                  reg38[(1'h0):(1'h0)] : {$unsigned((8'hac))}) > reg36));
            end
          else
            begin
              reg37 <= $signed(wire33[(4'hc):(4'h8)]);
              reg38 <= (&reg40[(3'h4):(2'h2)]);
              reg39 <= (~&$signed(wire32));
              reg40 <= $unsigned({$signed($unsigned($signed(wire33)))});
              reg41 <= wire35;
            end
        end
      else
        begin
          reg37 <= ($unsigned((&({wire32} ?
                  (reg39 ? reg40 : reg39) : (~^reg37)))) ?
              $unsigned(({(^wire34)} ?
                  (|(&reg39)) : {(+reg39)})) : $signed(($signed(((7'h42) ?
                  (7'h43) : reg38)) << (+(reg36 ? (8'h9e) : wire32)))));
          reg38 <= wire33[(2'h2):(1'h1)];
          reg39 <= reg36;
          reg40 <= (^{$signed(reg41)});
        end
      if (reg39)
        begin
          reg42 <= $unsigned($signed({reg36, (8'haa)}));
          reg43 <= (~&(^~(|(~^(reg41 && reg38)))));
          reg44 <= ($signed($signed({$signed(reg43)})) ?
              $signed($unsigned({(+reg39), wire32})) : reg37[(2'h3):(2'h3)]);
        end
      else
        begin
          reg42 <= $unsigned((7'h41));
          if ($signed({$unsigned($signed((^reg39)))}))
            begin
              reg43 <= (wire33[(4'ha):(3'h7)] ?
                  $unsigned(({(reg42 ? reg41 : reg41)} ?
                      wire34[(1'h1):(1'h1)] : reg38[(2'h3):(2'h2)])) : $unsigned(wire34[(1'h1):(1'h0)]));
              reg44 <= (($unsigned({$signed((8'hbf)),
                  reg37}) << $unsigned(reg42[(1'h1):(1'h1)])) >> reg44);
              reg45 <= $unsigned($signed(reg38));
              reg46 <= reg37;
              reg47 <= ((~|(({reg45} ~^ reg44[(3'h4):(3'h4)]) ?
                  $signed($unsigned(reg43)) : $signed((~|(8'ha2))))) ^~ ($signed((8'ha1)) ?
                  (-(8'hab)) : (wire34[(2'h2):(1'h1)] ?
                      $unsigned((reg41 ? (8'hb2) : reg37)) : wire32)));
            end
          else
            begin
              reg43 <= $signed(($unsigned((-(^(8'ha8)))) <= ((reg42 - $signed(reg44)) + ((reg36 & wire35) != (8'hb6)))));
              reg44 <= (((~&reg47[(1'h0):(1'h0)]) * (|$unsigned($signed((8'hb1))))) ?
                  (~|$signed(((reg38 ? reg36 : reg43) ?
                      reg39[(4'hb):(3'h5)] : reg47[(2'h3):(1'h1)]))) : (&reg44[(4'hd):(4'ha)]));
              reg45 <= reg46;
            end
          reg48 <= (((8'hab) ?
                  $unsigned(((!(8'hae)) != ((8'h9c) ?
                      reg45 : reg46))) : {reg45[(2'h2):(1'h1)]}) ?
              $unsigned(reg37) : (reg46[(2'h2):(1'h1)] <= {{wire33[(4'ha):(3'h5)],
                      (~|reg40)}}));
          reg49 <= $signed($unsigned($signed({reg40[(1'h1):(1'h1)],
              reg42[(4'h9):(3'h6)]})));
        end
      if ({$signed({reg36[(3'h5):(2'h2)], (8'ha5)})})
        begin
          reg50 <= $unsigned($unsigned((reg42 ?
              (|reg47[(2'h3):(2'h2)]) : ($unsigned(reg40) ?
                  reg41 : $signed(wire34)))));
          reg51 <= $unsigned($unsigned((reg49[(1'h1):(1'h0)] == reg46)));
        end
      else
        begin
          reg50 <= $unsigned(($signed($signed((reg37 ^ reg46))) ?
              $unsigned(reg41) : {(~&(reg46 && wire34))}));
          reg51 <= (&((reg40 == (-(reg39 ? (8'hbc) : reg43))) ?
              {reg41[(1'h1):(1'h0)], reg38} : ($unsigned(reg41) ?
                  ((+reg49) ?
                      (reg42 >> (8'ha2)) : ((7'h43) ?
                          reg38 : reg47)) : reg48)));
        end
    end
  assign wire52 = $unsigned((reg40[(2'h2):(1'h1)] >>> (({reg49} ?
                          (&reg42) : $signed(reg51)) ?
                      $unsigned(reg42) : ({reg38} == {reg38, wire32}))));
  assign wire53 = reg50;
  assign wire54 = $unsigned(reg44[(4'hb):(3'h5)]);
  always
    @(posedge clk) begin
      reg55 <= $unsigned((^~((^(reg36 ~^ reg44)) ?
          reg51 : $unsigned((wire33 ? wire32 : wire35)))));
      reg56 <= ((reg49 ?
              (reg46[(1'h1):(1'h0)] ?
                  $signed(reg51) : reg40[(2'h3):(1'h0)]) : ($unsigned((!reg43)) ?
                  $signed(wire32) : $unsigned(reg38))) ?
          reg51[(5'h11):(3'h6)] : ($signed((wire32[(4'h8):(1'h0)] ?
              $unsigned(reg55) : wire53[(1'h1):(1'h1)])) | $signed({((8'hbd) ?
                  wire33 : reg44)})));
      if (((-$unsigned(reg40[(3'h4):(2'h2)])) ?
          $unsigned((((~|reg38) ?
              (reg47 ?
                  reg37 : wire35) : (&reg41)) <<< reg41[(1'h1):(1'h0)])) : (|$signed($unsigned({(8'hb6)})))))
        begin
          if (reg40[(1'h0):(1'h0)])
            begin
              reg57 <= ($signed($unsigned(reg46[(1'h1):(1'h1)])) ?
                  reg41[(3'h7):(3'h5)] : {(($signed(reg47) != $signed(reg40)) ?
                          wire53 : reg44[(3'h6):(2'h2)])});
              reg58 <= ($signed((wire32[(5'h11):(5'h11)] && reg57[(1'h1):(1'h0)])) ?
                  {$unsigned(reg46)} : (reg49 ?
                      reg39[(2'h2):(2'h2)] : reg55[(2'h3):(1'h0)]));
              reg59 <= (!(reg39[(1'h0):(1'h0)] >> (^~{wire54[(1'h0):(1'h0)],
                  (reg38 ? reg39 : reg42)})));
              reg60 <= {$signed((8'hae))};
            end
          else
            begin
              reg57 <= ({$signed($signed(reg59[(1'h0):(1'h0)])),
                      (({reg47} ?
                          reg58[(1'h0):(1'h0)] : reg60[(1'h0):(1'h0)]) - ((~(8'ha8)) > (reg59 ?
                          wire35 : (7'h42))))} ?
                  reg58[(3'h7):(2'h3)] : $signed($unsigned(reg39[(2'h2):(1'h0)])));
              reg58 <= reg51;
              reg59 <= reg60[(1'h1):(1'h1)];
              reg60 <= reg38;
              reg61 <= ({({(reg48 * reg58), $signed(wire35)} ?
                      reg51 : {(~^reg45)}),
                  (^~((^~reg47) ?
                      $signed((8'ha6)) : (7'h40)))} ~^ (~^reg36[(3'h7):(3'h4)]));
            end
          reg62 <= (~$signed(((+reg60) >= $signed($signed(reg39)))));
          if ((&$signed((^~reg36))))
            begin
              reg63 <= (-(($unsigned($signed(reg43)) ? (8'hae) : reg42) ?
                  {($unsigned(reg61) >>> (wire52 ? reg56 : (7'h42))),
                      {wire52[(3'h5):(3'h4)]}} : reg40[(1'h1):(1'h1)]));
              reg64 <= ($signed((~&{reg40[(1'h1):(1'h1)],
                      reg47[(1'h1):(1'h0)]})) ?
                  (8'hb7) : ($signed({(8'hb0)}) <<< {$signed({reg59}),
                      $unsigned(((8'haf) ^ reg48))}));
            end
          else
            begin
              reg63 <= $signed(reg56);
              reg64 <= {reg41};
              reg65 <= wire32[(4'ha):(3'h7)];
              reg66 <= {(8'hb3)};
            end
          reg67 <= reg65;
        end
      else
        begin
          if (($signed((!((!(8'hb0)) <= reg47[(1'h0):(1'h0)]))) ?
              $unsigned(($unsigned((&reg51)) << ((-reg66) ?
                  (reg49 == reg55) : reg46[(3'h5):(1'h0)]))) : reg50[(5'h10):(3'h5)]))
            begin
              reg57 <= ($signed({{(reg36 ~^ reg46), $signed(reg66)},
                  $signed((8'ha1))}) ~^ wire33);
              reg58 <= {(reg43[(3'h4):(1'h1)] && $signed($signed($signed(reg46))))};
              reg59 <= $unsigned((~^($signed($signed((8'hb8))) ?
                  $signed($signed(reg62)) : {(reg36 ? wire33 : reg64)})));
            end
          else
            begin
              reg57 <= ($unsigned($signed(wire32[(4'h8):(3'h5)])) ?
                  $signed((~|(^~$unsigned(reg43)))) : {reg44});
              reg58 <= wire54[(2'h3):(2'h3)];
            end
          reg60 <= {reg63};
          reg61 <= $unsigned({(wire34[(2'h2):(2'h2)] < reg47)});
          if (reg66[(4'hb):(1'h1)])
            begin
              reg62 <= ($signed($unsigned((reg60[(1'h0):(1'h0)] || (wire35 == (8'ha5))))) + reg65[(2'h2):(1'h0)]);
            end
          else
            begin
              reg62 <= reg47[(1'h0):(1'h0)];
              reg63 <= $signed(reg36);
              reg64 <= reg60;
              reg65 <= $unsigned((&$signed($unsigned($unsigned((8'hb2))))));
              reg66 <= (~(|reg41[(1'h1):(1'h1)]));
            end
        end
      reg68 <= reg59[(1'h0):(1'h0)];
    end
  assign wire69 = $signed($signed((8'ha0)));
  assign wire70 = $unsigned((^(^$signed(((8'hbc) << (8'hbd))))));
  assign wire71 = ((~^(~^$signed(reg39))) >> (!{$signed(reg62[(2'h2):(2'h2)]),
                      reg43}));
  assign wire72 = {(($unsigned((reg63 ?
                              wire52 : reg63)) && $signed((wire35 << wire69))) ?
                          wire35 : {wire70})};
  always
    @(posedge clk) begin
      reg73 <= ((&(+({reg65} ?
          ((8'haf) >= (8'ha6)) : reg64[(2'h3):(2'h2)]))) >> {(!(reg42 >= $unsigned(wire53))),
          (wire53[(3'h4):(3'h4)] ? $unsigned($signed(reg63)) : reg41)});
      reg74 <= $unsigned((reg68 <= reg42[(3'h7):(1'h1)]));
      reg75 <= reg62;
      reg76 <= {{(^{$unsigned(reg39)})}};
    end
endmodule
