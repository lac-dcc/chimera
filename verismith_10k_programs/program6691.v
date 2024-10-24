module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire183;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire101;
  wire signed [(5'h13):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire181;
  reg signed [(5'h11):(1'h0)] reg196 = (1'h0);
  reg [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(2'h2):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(3'h7):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg189 = (1'h0);
  reg [(3'h7):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg184 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire183,
                 wire23,
                 wire24,
                 wire98,
                 wire100,
                 wire101,
                 wire102,
                 wire181,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
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
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~$signed(wire2)))
        begin
          reg5 <= $signed(wire0);
          reg6 <= wire0;
          if ($unsigned(((~|$signed($signed(wire1))) ~^ wire1)))
            begin
              reg7 <= (^$unsigned((($signed(wire1) >>> (wire4 & wire0)) ?
                  (+wire3) : ({reg5} || $signed(wire0)))));
              reg8 <= ($unsigned(((wire0[(3'h6):(1'h1)] ~^ wire3) == ((wire3 ?
                      reg6 : reg5) ?
                  (7'h40) : (~|reg7)))) << reg7[(5'h13):(4'ha)]);
              reg9 <= (|(~&reg8[(1'h0):(1'h0)]));
              reg10 <= $signed(((^((8'ha5) ?
                  $unsigned(reg8) : (^(8'hb2)))) * (8'hbd)));
              reg11 <= ($unsigned(((^~reg6[(4'h9):(4'h8)]) - reg8[(1'h0):(1'h0)])) ?
                  $unsigned({reg8[(2'h2):(2'h2)],
                      $unsigned((reg9 ?
                          reg5 : reg6))}) : (+(~&(reg8[(2'h2):(1'h0)] ?
                      (~reg8) : (!wire1)))));
            end
          else
            begin
              reg7 <= wire1;
              reg8 <= {(reg6 ^ $unsigned((((8'haa) ?
                      wire0 : (8'ha5)) > $signed(reg6)))),
                  $unsigned(($unsigned((&wire0)) == reg10[(2'h2):(1'h0)]))};
              reg9 <= $signed(wire0);
            end
          if ($unsigned($signed(({reg7} + $unsigned((+wire2))))))
            begin
              reg12 <= (((($signed(wire4) >> $unsigned(wire0)) + $signed({reg10})) ?
                      (^(!(~reg9))) : (($signed(reg10) ?
                          (^~wire2) : (^(8'hbd))) >>> (wire2[(4'he):(4'h8)] ?
                          $unsigned((8'haa)) : (reg11 ? reg6 : (8'ha7))))) ?
                  $signed(($unsigned(reg11[(4'hb):(4'h9)]) <<< ({(8'hbf),
                          wire0} ?
                      (reg11 ?
                          (8'hb1) : reg10) : $signed((8'ha3))))) : (~|$unsigned((reg11 ?
                      (~&wire1) : $signed(wire2)))));
            end
          else
            begin
              reg12 <= wire2;
              reg13 <= $signed(reg11[(4'ha):(3'h4)]);
              reg14 <= $unsigned({($unsigned($unsigned(reg8)) <<< reg9)});
            end
          reg15 <= (~^$unsigned(reg7[(4'h9):(4'h9)]));
        end
      else
        begin
          reg5 <= ($unsigned($signed(({reg14} == $signed(reg15)))) ?
              $unsigned(($unsigned(reg15[(3'h6):(3'h5)]) ?
                  reg14[(2'h2):(2'h2)] : reg8)) : reg9[(4'hb):(3'h6)]);
          reg6 <= ($unsigned((~&reg12)) ?
              wire2[(4'he):(3'h4)] : {((~^(+wire3)) ?
                      wire0[(1'h0):(1'h0)] : wire1)});
          if (reg5)
            begin
              reg7 <= (-wire0[(4'hd):(2'h3)]);
            end
          else
            begin
              reg7 <= reg9;
              reg8 <= $unsigned(reg12);
            end
        end
      if (reg11)
        begin
          reg16 <= (reg11 + (reg14 == $signed($signed(wire0))));
          reg17 <= wire0;
          reg18 <= (($signed((((8'hbe) >= reg14) && (!wire0))) ?
                  (~^reg13) : reg8[(1'h1):(1'h0)]) ?
              $unsigned((!($unsigned((8'hac)) ?
                  (~&wire3) : wire0))) : $unsigned(reg15));
          reg19 <= $signed({reg5[(4'h8):(3'h7)]});
        end
      else
        begin
          reg16 <= reg12[(1'h1):(1'h1)];
          reg17 <= $unsigned((reg11 ?
              $signed($unsigned($signed(reg14))) : $unsigned((+(-wire2)))));
        end
      reg20 <= $signed(wire3);
      reg21 <= (|reg17);
      reg22 <= $unsigned(((&{$signed(wire3)}) ?
          {((reg6 ? reg14 : (7'h43)) << (reg17 ? (8'hb4) : wire2))} : reg7));
    end
  assign wire23 = reg12;
  assign wire24 = (8'hbc);
  module25 #() modinst99 (wire98, clk, reg6, reg21, reg14, reg5, reg10);
  assign wire100 = reg5[(4'he):(3'h5)];
  assign wire101 = ((8'ha1) ?
                       ((wire100[(4'he):(3'h7)] ^ $unsigned($signed(wire100))) ?
                           reg6 : (!((wire2 ? reg19 : (8'hba)) ?
                               wire2 : $unsigned(reg8)))) : reg8);
  assign wire102 = {(wire100[(3'h5):(2'h2)] + (8'ha0)),
                       $signed((!(reg8[(1'h0):(1'h0)] ?
                           (reg12 <= reg18) : $signed(wire4))))};
  module103 #() modinst182 (.wire104(reg9), .wire105(reg11), .clk(clk), .wire108(reg14), .wire107(wire100), .y(wire181), .wire106(reg19));
  assign wire183 = reg14[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ((wire2 ? (+reg10) : $signed($signed(reg12))))
        begin
          reg184 <= $unsigned(($signed(((reg7 ?
              wire1 : reg16) && $signed(reg9))) << wire1));
          if (reg9[(3'h4):(1'h1)])
            begin
              reg185 <= (-($signed($signed(reg15)) ?
                  $unsigned(((8'ha7) ^~ (!wire0))) : (!$unsigned({wire24}))));
              reg186 <= reg15[(4'ha):(4'ha)];
            end
          else
            begin
              reg185 <= $unsigned($signed($signed($unsigned((reg5 ?
                  reg19 : reg22)))));
              reg186 <= $unsigned($signed(($unsigned($unsigned(reg184)) && ((+(8'had)) ?
                  wire0 : {reg185}))));
              reg187 <= (&{reg7[(4'hf):(4'he)], wire23});
              reg188 <= ((wire98 ? wire1 : reg184) ?
                  ($unsigned($unsigned(wire24[(5'h10):(4'hc)])) ?
                      reg22[(1'h0):(1'h0)] : wire2[(4'hc):(4'h9)]) : $signed($signed({reg5[(4'h8):(1'h1)],
                      {reg14, reg18}})));
              reg189 <= (reg6[(4'hf):(4'ha)] ?
                  ((+(-wire181)) ?
                      ((!$signed(reg188)) ?
                          $signed($unsigned((8'hab))) : wire181) : (reg188[(3'h5):(2'h2)] ?
                          (wire3[(4'he):(2'h3)] <<< reg188[(3'h5):(2'h2)]) : $unsigned($signed(wire183)))) : $unsigned($unsigned((~&{wire1,
                      reg12}))));
            end
          if ($unsigned(reg185[(3'h6):(3'h4)]))
            begin
              reg190 <= ({(reg8[(1'h0):(1'h0)] ?
                      reg11[(4'hc):(4'ha)] : reg6[(5'h10):(3'h7)])} - reg18);
              reg191 <= wire0[(2'h3):(1'h0)];
              reg192 <= (8'hbd);
              reg193 <= ({reg15} >>> wire3);
            end
          else
            begin
              reg190 <= $unsigned($signed((($unsigned(reg15) ?
                  reg8 : (8'h9e)) - (wire181[(1'h1):(1'h0)] ?
                  (8'ha4) : reg10))));
              reg191 <= reg14[(2'h3):(2'h2)];
              reg192 <= {$signed(reg9)};
            end
        end
      else
        begin
          reg184 <= $unsigned((+{{{reg184}},
              $signed((reg6 ? wire101 : wire4))}));
          reg185 <= $signed((reg191[(4'ha):(3'h6)] - {(8'ha8), reg22}));
          reg186 <= {(-(~&reg191[(3'h7):(3'h5)])), $signed(reg19)};
          reg187 <= reg19[(4'hf):(4'hb)];
        end
    end
  always
    @(posedge clk) begin
      reg194 <= ((~|$signed(reg10[(3'h5):(2'h2)])) ~^ reg11);
      reg195 <= wire24;
      reg196 <= wire24;
    end
endmodule

module module103
#(parameter param180 = (((((&(8'hbc)) ? ((8'hbb) ? (8'hbb) : (8'h9e)) : ((8'hb8) ? (8'hbb) : (8'hbd))) ? ({(8'hbd), (8'haf)} * (^~(8'ha4))) : {((8'hb9) ? (8'hb3) : (8'hb5)), ((8'hae) ? (8'ha5) : (8'hae))}) ? {(((8'hbf) ? (8'hb7) : (8'ha6)) ? (+(8'haf)) : (7'h42)), ((&(8'h9c)) ^~ {(8'hab), (8'ha3)})} : (!{(~^(8'ha6))})) ^ ({(((7'h43) == (8'hb9)) ? ((8'h9e) ~^ (8'ha7)) : ((8'ha2) ? (8'h9c) : (7'h40))), (((8'ha2) ? (8'hae) : (8'h9c)) ? (&(8'hb9)) : (|(8'ha1)))} <<< ((((8'hac) ? (8'hb1) : (8'hbf)) ? ((8'hbe) ? (7'h43) : (8'ha6)) : ((7'h43) ? (8'ha4) : (8'hb7))) - (((8'hab) != (8'h9e)) + (~^(8'ha8)))))))
(y, clk, wire104, wire105, wire106, wire107, wire108);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire105;
  input wire [(5'h12):(1'h0)] wire106;
  input wire signed [(4'ha):(1'h0)] wire107;
  input wire [(4'hb):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire176;
  wire [(4'h8):(1'h0)] wire155;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(4'h9):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire150;
  assign y = {wire179,
                 wire178,
                 wire176,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire109,
                 wire150,
                 (1'h0)};
  assign wire109 = (!$unsigned(({$unsigned(wire108)} ?
                       ((wire108 > wire105) ?
                           wire106[(3'h4):(2'h3)] : wire106) : {(!wire108)})));
  module110 #() modinst151 (wire150, clk, wire108, wire104, wire106, wire105, wire107);
  assign wire152 = wire105;
  assign wire153 = {(((~$signed((8'hb7))) ?
                               ((|wire152) ?
                                   $unsigned(wire107) : (wire108 >> wire109)) : (-$signed((8'hbd)))) ?
                           ($signed(wire107[(2'h2):(1'h1)]) >= ({wire107,
                                   wire109} ?
                               (wire104 > wire107) : {wire150,
                                   wire106})) : (!wire152)),
                       (|($unsigned($signed(wire104)) ?
                           (wire109 ~^ (wire109 ?
                               (8'ha4) : wire152)) : ((wire152 ?
                               wire152 : wire105) <<< $unsigned(wire152))))};
  assign wire154 = (+((~^((~|wire106) ?
                       (wire107 < wire152) : (wire150 ?
                           (7'h43) : wire152))) >> wire153[(3'h5):(3'h4)]));
  assign wire155 = wire153;
  module156 #() modinst177 (wire176, clk, wire107, wire153, wire104, wire108);
  assign wire178 = wire104;
  assign wire179 = ({($signed((wire153 ? wire153 : wire106)) & (~&wire178))} ?
                       $signed(((^wire154[(1'h1):(1'h1)]) << $unsigned(wire154[(4'h8):(2'h2)]))) : (8'ha7));
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire [(5'h12):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire58,
                 wire33,
                 wire32,
                 wire31,
                 reg93,
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
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  assign wire31 = (((^$unsigned($signed(wire28))) | (~&(&(wire29 ?
                          wire27 : wire27)))) ?
                      (wire30 ?
                          $signed($signed((~^wire27))) : $signed($signed((|wire28)))) : wire26);
  assign wire32 = (~|$signed($signed(wire30)));
  assign wire33 = {$unsigned(wire32[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      reg34 <= ((~(wire30 ?
              ($signed((7'h40)) ?
                  (wire33 ?
                      wire32 : wire31) : $signed((8'haa))) : $signed(wire32[(4'hb):(4'h8)]))) ?
          (({{wire30, wire29},
                  ((8'ha8) ? (8'ha9) : wire27)} - wire33[(4'ha):(4'ha)]) ?
              wire28 : (-(7'h44))) : wire33);
      if (($signed(reg34) & ((wire32[(4'he):(4'ha)] ?
              (^{reg34}) : (wire30 | ((8'ha0) == wire26))) ?
          $signed(({(8'h9e)} > (reg34 ?
              wire33 : wire33))) : (wire27 != (&(wire27 << (8'ha1)))))))
        begin
          if (wire31[(5'h10):(4'h9)])
            begin
              reg35 <= (|({((~&wire28) ? $signed(reg34) : (8'hb9)),
                  wire30} == (wire32[(3'h6):(3'h5)] ?
                  wire26 : wire28[(1'h1):(1'h0)])));
              reg36 <= $signed(($signed((~|{wire28, wire27})) <= (!(~((8'h9f) ?
                  (8'hba) : wire26)))));
              reg37 <= $signed($unsigned(($unsigned({reg34, wire29}) ?
                  wire27[(3'h7):(3'h5)] : wire28)));
              reg38 <= $unsigned(($signed({{reg36, (7'h43)},
                  wire31}) - (|((^wire26) ?
                  (reg35 ? wire30 : wire28) : (wire30 ? (8'hb0) : wire30)))));
            end
          else
            begin
              reg35 <= $signed(wire31);
              reg36 <= {$signed(wire33), $unsigned(wire30)};
              reg37 <= reg35;
            end
          reg39 <= (8'hb5);
          reg40 <= ($signed((({wire33} ? (8'h9f) : (wire30 - wire28)) ?
                  reg34 : $unsigned(wire26))) ?
              wire31[(3'h6):(2'h2)] : (wire29 ?
                  $signed(wire30) : ((!{reg34, reg35}) ~^ (wire33 >= wire32))));
          if ((&wire32))
            begin
              reg41 <= wire29[(4'ha):(1'h0)];
              reg42 <= ($unsigned($signed(((^wire31) <<< (8'h9e)))) ?
                  $signed($unsigned(reg35[(1'h0):(1'h0)])) : reg36);
            end
          else
            begin
              reg41 <= $signed(reg35[(1'h1):(1'h1)]);
              reg42 <= ((-(((~^wire26) * (~reg35)) ?
                      (~|(wire29 ? (8'hbe) : reg35)) : {(reg39 ^~ reg42),
                          $unsigned(wire33)})) ?
                  $signed((&{$signed(reg34),
                      wire32})) : $unsigned((wire31[(4'hb):(4'h9)] && $unsigned((reg35 - wire31)))));
              reg43 <= $signed(wire30);
              reg44 <= (reg34[(3'h6):(2'h3)] ?
                  ($signed((~$signed(reg36))) ?
                      {(^~$signed(reg36)),
                          ($unsigned((8'hbb)) >>> $signed(reg36))} : (-$signed((wire30 ?
                          wire27 : reg37)))) : reg37);
            end
          reg45 <= (-$signed(reg44));
        end
      else
        begin
          if (wire28[(1'h1):(1'h0)])
            begin
              reg35 <= {({((reg39 ? reg38 : reg40) & {reg35, reg39})} ?
                      (~&(reg45[(4'hd):(4'hc)] ?
                          {wire26} : wire30)) : (|{{wire28, reg39},
                          $unsigned(reg35)}))};
              reg36 <= wire29[(4'hb):(1'h1)];
              reg37 <= {($unsigned(wire33[(4'hc):(3'h5)]) >= {reg34, reg34})};
            end
          else
            begin
              reg35 <= (!(~|(($signed(reg41) >> $signed(wire29)) ?
                  reg36[(4'ha):(1'h1)] : (wire30[(3'h5):(3'h4)] ?
                      reg37[(3'h5):(3'h5)] : wire26[(5'h10):(4'ha)]))));
              reg36 <= ((reg43[(2'h3):(2'h3)] >= ($signed(reg36) + reg38[(1'h1):(1'h0)])) ?
                  reg42[(4'h9):(4'h9)] : reg37);
              reg37 <= (~|(8'hbf));
            end
          reg38 <= reg41;
          reg39 <= ($signed((!wire26[(3'h7):(3'h7)])) | $signed($unsigned(wire29[(1'h0):(1'h0)])));
          reg40 <= $unsigned((wire26 || $signed({$signed(wire29),
              (reg37 | (8'h9e))})));
          reg41 <= reg38;
        end
      if (reg34)
        begin
          reg46 <= $unsigned($unsigned($signed($signed(reg42))));
          reg47 <= (($signed(reg35) - {((&wire26) >= (reg46 ?
                      wire32 : (8'had))),
                  wire27[(4'hd):(2'h2)]}) ?
              wire32[(4'hb):(1'h1)] : {$signed({(8'hac)})});
          reg48 <= $signed(wire28);
          if (reg44[(4'hd):(4'h9)])
            begin
              reg49 <= (~$signed(($signed(reg36[(3'h6):(3'h5)]) ?
                  $unsigned(reg40[(1'h0):(1'h0)]) : $signed((reg34 <<< reg47)))));
              reg50 <= reg39;
              reg51 <= $unsigned((reg45[(3'h4):(1'h1)] ?
                  $unsigned((~|reg39)) : (&wire30[(4'ha):(3'h4)])));
            end
          else
            begin
              reg49 <= $signed((-reg39));
              reg50 <= $signed(reg44[(4'hd):(4'hb)]);
              reg51 <= {$unsigned(reg45[(4'h9):(4'h8)])};
              reg52 <= (wire31[(4'hb):(3'h5)] ^ $unsigned({$signed($signed(reg40)),
                  $signed(reg37)}));
            end
          if ($unsigned(wire32))
            begin
              reg53 <= (reg37[(2'h2):(1'h1)] ? reg49 : reg41);
              reg54 <= reg44[(4'he):(3'h6)];
              reg55 <= $unsigned(reg49[(5'h12):(3'h7)]);
              reg56 <= reg48;
              reg57 <= (({reg34[(1'h1):(1'h0)]} ?
                  (reg45 ?
                      (~^$signed(reg37)) : {$signed(reg35)}) : (reg40 > (^~(reg55 || (8'hb7))))) | reg37[(1'h1):(1'h0)]);
            end
          else
            begin
              reg53 <= (~&(~$unsigned(($signed(reg50) ?
                  (8'had) : (wire31 << wire33)))));
              reg54 <= $signed($unsigned(reg49));
            end
        end
      else
        begin
          reg46 <= (((reg45 ?
                  reg49[(4'hb):(3'h5)] : wire26) + $signed(((reg56 ~^ (7'h44)) * $unsigned(reg56)))) ?
              $signed((+{reg55[(3'h4):(2'h3)],
                  (wire31 ~^ reg47)})) : {$unsigned((reg41 ?
                      $unsigned(reg57) : reg36[(5'h10):(2'h2)])),
                  $signed({wire30[(3'h6):(1'h1)], $signed(reg40)})});
          if (reg50)
            begin
              reg47 <= wire27[(4'ha):(2'h3)];
              reg48 <= reg48;
              reg49 <= (8'hb6);
              reg50 <= reg37;
              reg51 <= $unsigned($unsigned((wire28[(1'h0):(1'h0)] ?
                  $unsigned($signed(reg50)) : ((reg40 * reg56) ?
                      (reg50 ^ reg37) : (reg41 << reg56)))));
            end
          else
            begin
              reg47 <= (&$signed(reg55[(2'h2):(1'h0)]));
              reg48 <= {$signed($signed(reg54)),
                  (-$unsigned($signed($signed(reg36))))};
              reg49 <= $signed(reg36);
              reg50 <= wire27[(3'h4):(2'h2)];
            end
        end
    end
  assign wire58 = $signed(reg36);
  module59 #() modinst87 (wire86, clk, reg44, wire31, reg43, wire33, reg36);
  assign wire88 = (8'hab);
  assign wire89 = (~&((reg44[(2'h3):(1'h1)] != wire32) || $signed(((wire32 + (8'hba)) ?
                      reg54[(1'h1):(1'h1)] : (-wire27)))));
  assign wire90 = $signed(reg55[(4'hf):(4'hc)]);
  assign wire91 = ((~&($unsigned($unsigned(reg52)) ?
                      reg36[(4'he):(3'h6)] : wire29[(3'h6):(3'h6)])) && reg35);
  assign wire92 = $signed(((wire33 ?
                          (^$unsigned((8'hb4))) : $signed(wire28[(1'h1):(1'h1)])) ?
                      $signed((^~$signed(reg49))) : wire88[(3'h7):(3'h6)]));
  always
    @(posedge clk) begin
      reg93 <= reg52[(4'hf):(3'h6)];
    end
  assign wire94 = ($signed(((~&(reg45 ? (8'hb6) : reg54)) ?
                          ($signed(reg50) ?
                              reg35[(2'h2):(1'h1)] : {wire89,
                                  reg54}) : reg50)) ?
                      $signed($unsigned($signed((^~reg57)))) : (8'ha9));
  assign wire95 = ((&$signed(wire90)) | (~|(!(^((8'hb4) ? reg44 : reg37)))));
  assign wire96 = $unsigned((~|(wire33[(2'h3):(1'h0)] ?
                      (-{reg48}) : (^$signed((8'hac))))));
  assign wire97 = (reg38[(3'h6):(1'h1)] ?
                      $signed((!(wire29 && (reg54 | reg43)))) : ($unsigned((reg54 & {(8'hba)})) ?
                          ($signed($signed(reg40)) || $signed(wire26[(5'h10):(3'h5)])) : reg35[(1'h1):(1'h1)]));
endmodule

module module59
#(parameter param84 = (((~((8'hae) ? ((8'hbe) ? (8'hb6) : (8'haa)) : (|(8'hb1)))) >> {({(8'ha2)} * ((7'h42) ? (8'hb3) : (8'hb2))), (&((8'hbe) ? (8'ha4) : (7'h41)))}) >> ((~&(^(&(8'hba)))) ? (7'h43) : (~|{((8'hb9) + (8'ha5))}))), 
parameter param85 = (param84 * (param84 ~^ param84)))
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire64;
  input wire [(4'he):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire62;
  input wire [(3'h7):(1'h0)] wire61;
  input wire [(2'h3):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire76,
                 wire75,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire65 = ($signed($unsigned(((wire64 != (8'hb6)) != $unsigned(wire64)))) < wire63);
  assign wire66 = ($unsigned(((8'hbb) <<< $unsigned({wire65}))) ?
                      ($unsigned((|wire63)) <<< $signed($unsigned((wire63 ?
                          wire65 : wire62)))) : (wire62[(3'h6):(2'h3)] ?
                          $unsigned((wire60 <<< wire63[(3'h4):(1'h0)])) : {(wire62 - wire63[(4'hb):(4'hb)])}));
  assign wire67 = $signed((|wire63[(4'hb):(4'ha)]));
  assign wire68 = $unsigned((|(8'hae)));
  assign wire69 = (((((8'hb0) ~^ $signed(wire66)) ^~ $signed(wire60)) ?
                          (&(+(~|wire67))) : (~$unsigned((wire64 ^~ wire61)))) ?
                      ($signed(wire61) ?
                          {wire65[(4'h8):(3'h4)],
                              wire66} : (!wire60[(1'h0):(1'h0)])) : $signed((~^wire64[(3'h4):(1'h1)])));
  assign wire70 = ($signed(((~wire67) << $signed($unsigned(wire69)))) ?
                      wire67[(4'h8):(3'h7)] : wire68);
  always
    @(posedge clk) begin
      reg71 <= $unsigned(($signed((wire60[(2'h3):(1'h1)] ?
              wire62 : $signed(wire60))) ?
          (^($signed(wire64) ?
              wire68[(3'h4):(3'h4)] : (wire63 != (8'hb0)))) : (wire64 <= wire70)));
      reg72 <= ({(8'hb5)} ?
          $unsigned(((&(wire64 ?
              wire70 : reg71)) <= wire66)) : $unsigned($unsigned((^$signed((8'hab))))));
      reg73 <= $unsigned(reg72[(3'h6):(3'h5)]);
      reg74 <= wire65[(4'h9):(3'h5)];
    end
  assign wire75 = (wire62 ? wire69[(4'hd):(2'h2)] : (~|wire66));
  assign wire76 = (8'hba);
  always
    @(posedge clk) begin
      reg77 <= $unsigned($signed((((8'ha4) ^~ (~|wire61)) <<< wire60)));
      reg78 <= wire61[(2'h2):(2'h2)];
      reg79 <= $signed($unsigned((reg77[(2'h3):(2'h2)] ?
          reg71[(2'h3):(1'h1)] : $signed((wire62 >= wire75)))));
      reg80 <= ($signed($unsigned($signed(wire65[(4'ha):(3'h7)]))) ?
          $signed(wire62[(5'h11):(3'h5)]) : wire64[(3'h4):(2'h3)]);
      reg81 <= (^~wire63[(1'h1):(1'h1)]);
    end
  assign wire82 = (8'ha2);
  assign wire83 = $unsigned(((wire76 ?
                      reg73[(2'h3):(1'h0)] : reg78[(2'h2):(1'h1)]) < reg71));
endmodule

module module156  (y, clk, wire160, wire159, wire158, wire157);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire160;
  input wire [(3'h6):(1'h0)] wire159;
  input wire [(3'h6):(1'h0)] wire158;
  input wire signed [(4'h8):(1'h0)] wire157;
  wire [(4'hb):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire174;
  wire signed [(4'hc):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire171;
  wire signed [(3'h5):(1'h0)] wire170;
  wire [(3'h5):(1'h0)] wire169;
  wire signed [(5'h11):(1'h0)] wire163;
  wire [(4'ha):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg166 = (1'h0);
  reg [(4'hc):(1'h0)] reg165 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg164 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire163,
                 wire162,
                 wire161,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire161 = wire158;
  assign wire162 = (|wire159);
  assign wire163 = $unsigned($unsigned({(~{(7'h43), wire158})}));
  always
    @(posedge clk) begin
      reg164 <= wire158[(3'h5):(3'h4)];
      reg165 <= wire161;
      reg166 <= (8'ha1);
      reg167 <= $signed(((&$unsigned((reg164 ? reg165 : wire160))) ?
          $signed(reg166[(3'h5):(3'h5)]) : wire157));
      reg168 <= (|$signed($signed(wire162)));
    end
  assign wire169 = (^(!((((8'hb4) ? wire159 : (8'ha2)) ?
                           $signed(wire159) : $signed((7'h43))) ?
                       ($unsigned(wire158) ?
                           $unsigned(wire157) : (reg167 != wire160)) : (~&reg167[(3'h5):(1'h1)]))));
  assign wire170 = ($unsigned(((&(+reg166)) < (((8'h9c) >>> reg168) ?
                       (wire169 ? reg164 : wire163) : {(7'h44)}))) - wire159);
  assign wire171 = {$signed({wire169,
                           ((wire163 <= wire162) ?
                               (wire161 ?
                                   reg166 : wire169) : $unsigned(reg167))})};
  assign wire172 = ($signed((~((wire171 ?
                           wire158 : wire163) ^~ $unsigned(reg166)))) ?
                       {$unsigned(((8'h9e) + (^wire158)))} : wire161);
  assign wire173 = wire161[(4'h8):(4'h8)];
  assign wire174 = reg168;
  assign wire175 = {$unsigned(wire160)};
endmodule

module module110
#(parameter param148 = (((8'hbe) | ({((8'ha1) ? (8'hba) : (8'h9d)), ((8'ha0) ? (8'h9e) : (8'ha0))} ? ({(8'ha9), (8'ha7)} ^ ((8'hb0) ? (8'h9e) : (8'hb6))) : ((~^(8'hba)) ? ((8'hbe) == (8'ha2)) : ((8'ha2) - (8'hb7))))) != (!((~((8'hae) ? (8'hb3) : (7'h42))) ^ ({(8'ha0), (8'ha8)} ~^ (8'hb3))))), 
parameter param149 = (param148 ? {(param148 ? ((~|param148) > (~param148)) : param148), ((^~((8'hb8) > param148)) || ((param148 ? param148 : param148) ^ (|param148)))} : (((param148 >>> param148) ? ((|param148) & (|(8'hbd))) : {(param148 ? (8'hb5) : param148)}) << (^~(~^(param148 < param148))))))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire115;
  input wire [(5'h14):(1'h0)] wire114;
  input wire signed [(2'h3):(1'h0)] wire113;
  input wire [(5'h13):(1'h0)] wire112;
  input wire [(2'h3):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire [(4'hd):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire [(5'h13):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire signed [(3'h4):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire116;
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg121 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
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
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire116 = ((~wire114[(4'ha):(3'h5)]) <<< (~&(~&$signed($signed(wire113)))));
  assign wire117 = (~&(^($unsigned((wire112 ? wire111 : (8'hac))) || (8'ha2))));
  assign wire118 = ((($signed((wire112 ? wire116 : wire117)) > (!(wire114 ?
                               wire114 : wire111))) ?
                           {{$signed(wire116)}} : $unsigned(wire115[(2'h2):(1'h0)])) ?
                       (~|wire116[(2'h3):(2'h3)]) : {((-$signed(wire116)) || (~|(~wire112))),
                           ($signed((wire111 ? wire114 : (8'hbf))) ?
                               wire113[(2'h3):(1'h1)] : wire116)});
  assign wire119 = (~(!(($signed(wire116) ?
                       wire111 : $unsigned(wire115)) != ((8'ha7) ?
                       (wire114 < wire112) : $unsigned(wire115)))));
  assign wire120 = {$unsigned((~$unsigned({wire115}))),
                       (^wire118[(1'h1):(1'h0)])};
  always
    @(posedge clk) begin
      if ((^~$unsigned((+$signed((&(8'ha5)))))))
        begin
          reg121 <= (^~(^~{$unsigned({wire113}),
              ((wire119 ? wire114 : wire119) < (wire111 * wire118))}));
        end
      else
        begin
          reg121 <= wire116[(3'h5):(1'h0)];
          reg122 <= ({(wire120[(1'h0):(1'h0)] ?
                      $unsigned($unsigned((8'hbe))) : wire120)} ?
              ((~($signed(wire111) > (~&wire118))) ?
                  $signed($unsigned(wire115)) : ($unsigned((wire116 ?
                          wire114 : (8'hab))) ?
                      ((wire112 ?
                          wire116 : wire113) * (wire111 >> (8'ha0))) : $unsigned((reg121 | wire112)))) : wire113);
        end
      reg123 <= {{(|reg122), wire113}, (~&$unsigned((~&((8'hbc) ^ wire114))))};
    end
  assign wire124 = $signed((^~$unsigned($signed((wire120 >= reg123)))));
  assign wire125 = wire124[(3'h5):(3'h4)];
  assign wire126 = $signed($unsigned((((wire114 ? wire115 : reg123) ?
                       reg123[(1'h0):(1'h0)] : (~|(8'hbb))) >= wire116)));
  assign wire127 = reg121[(3'h5):(1'h1)];
  assign wire128 = $unsigned(wire111);
  always
    @(posedge clk) begin
      if ($unsigned((7'h43)))
        begin
          reg129 <= (-$unsigned((wire118 ?
              wire127[(2'h2):(1'h1)] : $signed((!wire111)))));
          if (wire113)
            begin
              reg130 <= $unsigned(wire114);
              reg131 <= $unsigned($unsigned((($unsigned(wire119) && $unsigned(wire124)) ?
                  $unsigned((wire127 && wire118)) : (wire113 ?
                      (wire127 ?
                          wire124 : reg122) : wire112[(5'h11):(3'h7)]))));
              reg132 <= ($unsigned(reg129) | ((8'hb1) ?
                  {(&{wire118, reg121}),
                      (^~wire124[(3'h4):(2'h2)])} : ({wire125[(3'h6):(1'h0)]} ?
                      wire114[(4'he):(4'he)] : {$unsigned((8'hba)),
                          wire112[(4'hb):(4'h9)]})));
              reg133 <= $signed({(^$signed(wire124[(1'h1):(1'h0)])),
                  (|$unsigned($signed(wire124)))});
            end
          else
            begin
              reg130 <= wire111;
              reg131 <= {$signed(($signed(((8'h9f) ? (7'h42) : (8'hb8))) ?
                      $unsigned(reg133) : reg129)),
                  (&(7'h44))};
              reg132 <= wire119[(2'h2):(1'h1)];
              reg133 <= (~|{$signed(((reg121 != wire125) ?
                      (reg129 ? wire126 : wire126) : $signed(wire119))),
                  (((wire115 * wire112) >> {wire112, wire113}) ?
                      wire119 : ($signed((8'ha0)) ?
                          wire116[(2'h3):(2'h3)] : reg130[(3'h6):(3'h4)]))});
            end
          reg134 <= (~&(($signed(wire119) ?
              (wire111 ? $unsigned(reg121) : (reg132 != reg130)) : ((wire117 ?
                      wire115 : reg123) ?
                  (reg133 ^~ (8'ha4)) : {wire120,
                      reg121})) || (($signed(wire128) ?
                  (wire118 ? reg121 : wire118) : ((8'h9d) ?
                      wire112 : wire118)) ?
              ((~&wire124) ?
                  reg133 : (8'hbf)) : $unsigned(wire120[(1'h1):(1'h1)]))));
          reg135 <= (^~(~(-($unsigned(wire116) ?
              (wire111 ? reg129 : reg134) : (~^(8'hb7))))));
          reg136 <= $signed(wire114[(5'h11):(4'hb)]);
        end
      else
        begin
          reg129 <= ($unsigned(reg121[(4'h9):(3'h6)]) != (wire115[(2'h3):(1'h0)] ?
              (wire126[(3'h4):(1'h1)] ?
                  reg130[(2'h2):(1'h1)] : wire124) : reg134));
          if (wire115)
            begin
              reg130 <= wire128;
              reg131 <= reg134;
              reg132 <= {($signed($unsigned(reg133)) == $signed($signed($signed((8'ha9))))),
                  ({((|wire117) <= wire128)} ?
                      reg129 : (!(~&$signed(wire117))))};
              reg133 <= reg123;
            end
          else
            begin
              reg130 <= ({(~^$unsigned($unsigned(reg136)))} ?
                  $signed(reg135[(3'h4):(3'h4)]) : ($unsigned({wire112[(4'hd):(3'h6)]}) && ($signed($unsigned(wire115)) + ($signed(wire115) ?
                      (wire125 >>> wire119) : reg136))));
              reg131 <= (wire127[(2'h2):(1'h0)] ?
                  wire117 : wire120[(1'h0):(1'h0)]);
              reg132 <= $unsigned({(reg129[(3'h7):(1'h0)] ?
                      (~{reg135}) : wire116[(4'h9):(1'h1)]),
                  $unsigned(($signed(wire124) + $signed(wire124)))});
            end
          reg134 <= $unsigned($unsigned(wire127));
          reg135 <= reg130;
        end
      reg137 <= wire117;
      reg138 <= $signed(reg132[(2'h2):(1'h0)]);
    end
  assign wire139 = $unsigned((reg129[(5'h13):(3'h5)] >> wire113));
  assign wire140 = {(~(($unsigned(wire126) > $unsigned(wire125)) ?
                           wire128 : (((8'hb5) ? reg135 : wire128) ?
                               ((7'h41) ^ wire112) : (wire118 ^~ reg131))))};
  assign wire141 = (~(wire115 >= {wire112, $unsigned(wire113)}));
  assign wire142 = $signed({(({wire113} - wire113) ?
                           (8'ha7) : reg138[(1'h0):(1'h0)])});
  assign wire143 = reg132[(2'h3):(1'h1)];
  assign wire144 = {($signed(wire120) ?
                           reg135[(2'h3):(2'h2)] : (&$unsigned(reg136))),
                       wire128};
  assign wire145 = $unsigned({((^~$signed(wire112)) ?
                           $signed((wire114 ? wire112 : wire113)) : wire111)});
  assign wire146 = ((wire141[(5'h13):(3'h4)] ?
                       (($unsigned(reg138) ? wire142 : $unsigned(wire124)) ?
                           (~&(-(8'haa))) : (!(~(7'h42)))) : $signed(($signed(wire139) ?
                           $signed((8'had)) : (~&(8'haf))))) - $signed((~|(+((8'ha3) ?
                       reg132 : wire114)))));
  assign wire147 = {reg138,
                       (reg133 >= $unsigned($signed((reg133 >>> wire116))))};
endmodule
