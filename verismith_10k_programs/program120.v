module top
#(parameter param141 = (|(({((8'ha9) + (8'ha7))} ? (|((8'h9d) - (8'hb5))) : ({(8'ha1), (8'ha8)} + (~(8'hb0)))) ? (~|(~|(&(8'ha9)))) : (+(((7'h42) >>> (7'h40)) ? ((8'ha5) ? (8'hb5) : (8'ha7)) : ((8'hbd) ? (8'hbe) : (8'ha5)))))), 
parameter param142 = param141)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire signed [(3'h7):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire122;
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire4,
                 wire5,
                 wire11,
                 wire12,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire122,
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
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (8'hbd);
  always
    @(posedge clk) begin
      reg6 <= wire0[(3'h4):(1'h1)];
      reg7 <= reg6;
      reg8 <= wire5;
      reg9 <= (reg8 <<< ($unsigned(wire5) ?
          $unsigned(({wire3} >= (reg7 ?
              wire4 : reg7))) : $signed({$signed((8'hb9))})));
      reg10 <= reg8[(4'hb):(2'h3)];
    end
  assign wire11 = $signed($unsigned(((|((8'hb3) ?
                      reg6 : wire4)) >= $unsigned(wire4))));
  assign wire12 = $unsigned((wire3 ?
                      $signed($signed((!wire4))) : ((^$signed((8'hb1))) - $signed(((8'hac) ?
                          reg7 : wire5)))));
  always
    @(posedge clk) begin
      reg13 <= reg10;
      reg14 <= wire4;
      reg15 <= $signed($signed(((reg13[(1'h1):(1'h0)] ~^ (reg10 ?
              wire3 : reg8)) ?
          reg8[(4'h8):(3'h6)] : $unsigned((reg7 >> reg13)))));
    end
  assign wire16 = (7'h40);
  assign wire17 = (wire16 ?
                      $unsigned(($signed($unsigned(wire3)) ?
                          ((wire16 >>> wire3) << reg15) : $signed($signed(reg6)))) : wire11);
  assign wire18 = reg9;
  assign wire19 = $signed(wire5);
  module20 #() modinst123 (.wire23(wire5), .wire21(reg9), .clk(clk), .y(wire122), .wire22(wire1), .wire24(wire0));
  assign wire124 = (~^(8'h9f));
  assign wire125 = (8'hb3);
  assign wire126 = reg7[(4'hc):(3'h6)];
  assign wire127 = {(({(wire5 <<< wire122), (~reg9)} ?
                               (wire12 || (wire1 >> wire124)) : {$unsigned(reg6),
                                   (reg15 * wire11)}) ?
                           $unsigned(((wire4 ? wire11 : (8'hb9)) ?
                               (+reg13) : (^wire17))) : (!wire124))};
  assign wire128 = reg13[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg129 <= $unsigned((~wire128[(2'h3):(2'h3)]));
      reg130 <= ($unsigned(({wire122[(4'ha):(3'h7)]} ?
          (!((8'hb6) ?
              wire126 : wire12)) : wire126[(1'h0):(1'h0)])) == wire0[(1'h0):(1'h0)]);
      reg131 <= $signed((((wire18 << $signed(wire2)) ?
          (~|(8'hb4)) : {$unsigned(wire18)}) && wire124));
      if ((wire126 ?
          wire0[(3'h4):(3'h4)] : $unsigned(($unsigned(wire127) ?
              (wire19[(2'h2):(1'h0)] && wire5) : (~&(wire0 ?
                  wire16 : (8'ha1)))))))
        begin
          reg132 <= ($signed(($signed((~|reg130)) ?
                  ((8'hb4) ?
                      reg13[(4'h9):(3'h4)] : $unsigned(wire11)) : wire2[(4'h9):(2'h2)])) ?
              (!$signed(reg129[(4'hb):(4'ha)])) : $unsigned(((^~(~wire126)) ?
                  (^~((8'hbf) ?
                      wire124 : (8'hbc))) : ($unsigned(reg6) + $signed((8'hb3))))));
          if ($unsigned(wire122))
            begin
              reg133 <= wire17[(3'h7):(2'h2)];
              reg134 <= wire2;
              reg135 <= {({reg6[(2'h2):(1'h0)]} ?
                      ((reg13[(4'h9):(1'h1)] + wire122) ?
                          (^~(~&reg130)) : reg7) : (($signed(wire124) ^ wire18[(1'h0):(1'h0)]) <= ($unsigned(reg7) ?
                          (&wire12) : $signed(wire122))))};
              reg136 <= $unsigned(wire128);
              reg137 <= $signed(reg15);
            end
          else
            begin
              reg133 <= (~($unsigned((~|$signed((7'h43)))) ?
                  ($unsigned(((7'h40) ? wire126 : (8'ha0))) ?
                      (~&reg134[(4'hf):(3'h6)]) : (wire124 | (|reg129))) : $signed((wire0[(2'h3):(1'h0)] ?
                      wire18[(3'h4):(2'h2)] : {reg6}))));
            end
        end
      else
        begin
          reg132 <= (reg9 << {{(-wire5[(3'h6):(2'h2)])}});
          reg133 <= $unsigned(($unsigned((-$unsigned(wire122))) ~^ (8'hb9)));
        end
      reg138 <= (^~($signed($unsigned((reg130 - wire124))) <<< (|((!reg132) << wire18[(1'h0):(1'h0)]))));
    end
  assign wire139 = $signed((wire3[(4'h8):(2'h2)] > reg8[(1'h1):(1'h0)]));
  assign wire140 = reg136;
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h36c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire24;
  input wire signed [(4'ha):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  assign y = {wire121,
                 wire91,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire26,
                 wire25,
                 reg120,
                 reg119,
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
                 reg107,
                 reg106,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire25 = (8'ha5);
  assign wire26 = wire22;
  always
    @(posedge clk) begin
      reg27 <= (|($unsigned((+wire22)) ?
          ((~|(-wire23)) ?
              $unsigned((8'h9c)) : {$signed(wire22)}) : wire24[(4'h9):(3'h7)]));
      reg28 <= {(reg27 < ((^~(wire21 ? reg27 : reg27)) ?
              $unsigned((wire21 ?
                  wire21 : (7'h40))) : $unsigned($signed(wire22))))};
      reg29 <= (|((^~{$unsigned(reg27)}) ?
          ((~&$unsigned((8'ha5))) ?
              (~{wire25,
                  (8'haf)}) : wire26[(4'h9):(3'h4)]) : $unsigned($signed($unsigned(wire24)))));
      reg30 <= {wire26,
          (~|(wire22 ? $unsigned($unsigned(reg29)) : reg28[(4'hb):(2'h3)]))};
    end
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned($unsigned(wire26)) > $unsigned((wire24 ?
          wire24 : (8'hb5))))) << (^$signed(({wire23,
          reg30} >>> $unsigned(wire21))))))
        begin
          reg31 <= wire22[(4'h9):(3'h6)];
          reg32 <= (~|wire21);
          if (((7'h41) ?
              wire24 : ((|$signed(reg30[(4'h9):(1'h0)])) ?
                  $signed((|$unsigned(wire23))) : {$signed($unsigned(reg28)),
                      $signed($unsigned(wire22))})))
            begin
              reg33 <= {wire26};
              reg34 <= {(~^($signed((8'had)) ?
                      {((8'ha5) < wire24),
                          (wire25 ? reg30 : wire25)} : ((reg31 ?
                          reg29 : reg27) ^~ $unsigned(reg27)))),
                  reg32[(3'h5):(2'h3)]};
              reg35 <= $signed(reg29);
              reg36 <= (wire22[(4'hb):(4'ha)] ?
                  $signed(((~wire25) ?
                      reg31 : ($unsigned(reg30) & (reg33 ^~ wire21)))) : reg32);
              reg37 <= {reg33};
            end
          else
            begin
              reg33 <= $signed(reg31);
              reg34 <= (~|reg30);
              reg35 <= (^~$signed(reg33));
              reg36 <= ((wire21[(2'h2):(1'h0)] ?
                  ($signed(reg31[(4'h9):(3'h6)]) == $unsigned($signed(reg31))) : reg35) && $signed($signed((~^wire24))));
            end
          reg38 <= (((!(reg30[(4'he):(3'h7)] ? (8'h9f) : $signed(wire22))) ?
                  {reg37[(2'h3):(2'h2)],
                      ($signed(reg35) ? (^reg28) : {wire25})} : ({(reg29 ?
                              (8'hb8) : (7'h43))} ?
                      wire23[(2'h3):(1'h0)] : ($unsigned(wire24) << ((8'ha0) ^ reg36)))) ?
              (8'h9d) : $unsigned((8'h9c)));
        end
      else
        begin
          reg31 <= wire24[(1'h0):(1'h0)];
          reg32 <= $signed((!{$signed((!wire25))}));
          reg33 <= ($signed(({reg31,
              $unsigned(reg27)} | {wire23[(3'h5):(1'h0)]})) * (($unsigned(reg35[(1'h0):(1'h0)]) ?
                  reg36 : (~$unsigned(reg37))) ?
              (&{reg30[(4'h8):(3'h7)]}) : reg27[(3'h4):(2'h3)]));
          reg34 <= reg32;
          reg35 <= reg35;
        end
      if (reg31[(1'h0):(1'h0)])
        begin
          reg39 <= wire22[(4'ha):(3'h4)];
          reg40 <= (reg38 == ({$signed($unsigned(reg32))} || ($signed($unsigned(reg39)) | ((reg29 ^~ reg38) ?
              reg32 : $signed(reg36)))));
          reg41 <= $unsigned($signed($signed({(reg35 >> wire25), (~&reg31)})));
          if ($signed(reg37))
            begin
              reg42 <= ($unsigned(reg39[(2'h3):(2'h3)]) ?
                  (^~(^~($signed((8'hb7)) ?
                      ((8'hbc) ?
                          (8'hbd) : wire24) : $unsigned(wire22)))) : (&(reg41 * $signed($signed((7'h41))))));
              reg43 <= reg33;
              reg44 <= $unsigned({$unsigned(wire24), $unsigned(reg29)});
              reg45 <= (({((reg31 ? reg28 : wire26) >= $unsigned(wire26)),
                      (reg28[(4'he):(4'he)] > (reg42 >= wire21))} >> reg38) ?
                  ($unsigned({(8'hb2)}) == wire23) : {wire25[(4'he):(4'hd)],
                      reg32});
            end
          else
            begin
              reg42 <= {(!$signed((((7'h41) ^~ reg27) ?
                      (8'ha1) : (~|(8'ha0))))),
                  $signed(({reg44[(4'hc):(4'ha)], $signed(reg40)} ?
                      reg37 : ($unsigned(wire26) ?
                          ((8'h9d) ? reg39 : reg32) : $unsigned(reg38))))};
              reg43 <= (&{(reg41 ?
                      ($unsigned(reg41) & (8'h9d)) : reg33[(4'h8):(4'h8)])});
              reg44 <= ({$signed($unsigned((reg43 << wire21)))} >> $unsigned(reg43[(3'h4):(1'h0)]));
              reg45 <= (+{(wire26 ? reg36[(3'h7):(2'h3)] : $unsigned(reg44))});
              reg46 <= wire23[(2'h2):(1'h1)];
            end
          reg47 <= ({(^{$unsigned(reg28), wire22[(2'h2):(1'h1)]})} != reg29);
        end
      else
        begin
          reg39 <= wire25;
          if (((^~(wire25[(5'h12):(4'h9)] ?
              reg33 : ($signed(reg42) != reg40))) ~^ $unsigned($unsigned($unsigned((reg46 - reg32))))))
            begin
              reg40 <= (~|$signed(reg46[(2'h3):(1'h1)]));
              reg41 <= $signed(wire21);
              reg42 <= $signed(({reg34[(3'h7):(3'h6)]} ?
                  (((reg38 != reg31) >= {(8'ha1)}) ?
                      ($unsigned(wire21) ?
                          reg45[(3'h6):(3'h4)] : reg46) : ((reg33 ?
                              (8'h9f) : reg38) ?
                          $signed((7'h44)) : (~&(8'ha1)))) : (reg35[(3'h4):(2'h3)] ?
                      {$unsigned(reg31),
                          ((8'hab) ?
                              (8'hbf) : (8'hb2))} : reg45[(3'h4):(2'h3)])));
            end
          else
            begin
              reg40 <= (8'hb0);
              reg41 <= (~(~|($signed((!reg47)) * $signed(((8'hb8) | reg35)))));
            end
          if ((8'hba))
            begin
              reg43 <= (8'hac);
              reg44 <= $unsigned((+reg38[(1'h0):(1'h0)]));
              reg45 <= (^~$signed(((reg32 ?
                  $unsigned((8'h9d)) : reg35[(2'h2):(1'h1)]) >> (((8'h9d) ?
                  (8'hac) : reg44) <= (reg46 >> reg35)))));
              reg46 <= ((~^$signed((~|(reg28 ? reg38 : reg39)))) ?
                  {((8'ha9) + {$signed((8'hb6))}),
                      $unsigned($unsigned($signed(wire23)))} : (8'h9d));
            end
          else
            begin
              reg43 <= $unsigned($unsigned((!($unsigned(wire23) ?
                  $unsigned(reg39) : $signed(wire23)))));
              reg44 <= (~^(~&reg45));
              reg45 <= $unsigned($unsigned((reg37 ^ {(reg32 ?
                      reg39 : reg42)})));
              reg46 <= {(+$unsigned({(^~reg38)}))};
              reg47 <= reg29;
            end
          reg48 <= wire21;
        end
      reg49 <= $signed((($signed((reg37 == reg37)) * {(reg30 ? wire26 : reg46),
          (reg32 ^ reg36)}) && $signed(((reg41 <= reg48) * $unsigned(wire22)))));
      if ($signed(reg44[(3'h4):(2'h3)]))
        begin
          reg50 <= $unsigned({{$unsigned($unsigned(reg41))},
              $signed((~|(reg47 ? reg34 : wire26)))});
          if ((($unsigned($unsigned($signed(reg42))) >> ((|(^~reg45)) ?
              ($signed(wire26) < (reg40 ?
                  reg31 : reg40)) : $unsigned($unsigned(reg48)))) == $unsigned((8'had))))
            begin
              reg51 <= (8'ha9);
              reg52 <= {wire21[(2'h3):(2'h2)],
                  (~&((^(reg34 ? wire22 : (8'hac))) ^~ ($signed(reg33) ?
                      reg39 : ((8'ha3) ? wire21 : reg31))))};
              reg53 <= ((~^($signed(reg47) ?
                      reg39 : $signed($unsigned(reg42)))) ?
                  ({((+reg47) == $signed((8'haa))),
                      {(reg35 - reg46)}} <= (!reg37[(1'h0):(1'h0)])) : (!(reg40 > {{reg38,
                          reg33}})));
              reg54 <= {((reg37[(1'h0):(1'h0)] | (~{reg51, reg33})) ?
                      $unsigned($unsigned((~&reg51))) : $signed(wire24[(3'h4):(2'h3)])),
                  $unsigned((+reg48))};
              reg55 <= $unsigned(reg52[(2'h3):(1'h1)]);
            end
          else
            begin
              reg51 <= {(&{(8'haa),
                      ($signed(reg50) ?
                          $signed(reg47) : reg46[(4'hf):(4'hf)])})};
              reg52 <= $unsigned(wire21[(3'h5):(3'h5)]);
              reg53 <= {($unsigned((reg42 ?
                      $unsigned(reg40) : $unsigned(reg41))) | {$signed({reg49}),
                      $signed((wire21 ? reg53 : reg44))})};
              reg54 <= $unsigned(((+$signed((reg45 ? wire24 : wire26))) ?
                  $signed(reg46) : $unsigned(reg35)));
            end
        end
      else
        begin
          if (((~&(($signed(reg50) ? reg34 : (^reg46)) & {(wire21 ^ reg41),
                  (wire26 ? reg39 : reg41)})) ?
              reg34 : $signed({($signed(reg45) ? {(7'h44)} : $unsigned(reg30)),
                  $unsigned((wire25 ? reg47 : reg41))})))
            begin
              reg50 <= $signed((reg48 ?
                  ($unsigned(reg43[(3'h7):(2'h2)]) < (-wire25[(2'h2):(1'h0)])) : (~|wire26[(4'hb):(4'hb)])));
              reg51 <= reg31[(4'h8):(2'h2)];
              reg52 <= (^~(-reg46[(4'hf):(2'h2)]));
              reg53 <= {((~$unsigned((~&reg28))) ~^ $signed(((reg43 && reg44) & wire25))),
                  $unsigned(((-(reg30 ? wire23 : wire21)) ?
                      reg55 : reg37[(3'h5):(2'h2)]))};
            end
          else
            begin
              reg50 <= reg54;
              reg51 <= (~^(!(((reg35 >>> (8'h9f)) ^~ reg44) + reg36)));
            end
          reg54 <= wire22;
        end
      if ({$signed($unsigned(reg55[(3'h4):(3'h4)])),
          $signed($unsigned(reg27[(1'h1):(1'h1)]))})
        begin
          reg56 <= (wire22 ?
              $signed($signed((~&{reg34,
                  reg47}))) : $unsigned(($unsigned((8'hb3)) ?
                  reg55 : reg40[(4'h8):(3'h4)])));
        end
      else
        begin
          reg56 <= reg44;
          reg57 <= (wire21[(2'h3):(2'h3)] ~^ $unsigned($signed(wire22[(3'h5):(3'h5)])));
          reg58 <= ($unsigned(((reg56[(4'hb):(3'h7)] == $unsigned((8'hb4))) ?
              ({wire24, reg53} ? wire24 : {reg48}) : ($signed(reg27) ?
                  (reg39 >> reg54) : reg29[(3'h6):(3'h6)]))) * $signed((-({reg40} ?
              {wire22} : (reg27 == reg47)))));
          reg59 <= (^$unsigned({wire21}));
          reg60 <= $signed((8'hb5));
        end
    end
  assign wire61 = $signed((reg43[(3'h4):(1'h1)] ?
                      {$signed({(7'h42), reg57}),
                          $unsigned((^~(8'hba)))} : $unsigned(reg53[(2'h2):(1'h1)])));
  assign wire62 = reg52;
  assign wire63 = reg47[(2'h3):(1'h0)];
  assign wire64 = (8'hb7);
  assign wire65 = (!$unsigned($unsigned(wire23)));
  module66 #() modinst92 (.wire70(reg38), .wire68(reg44), .wire67(reg43), .y(wire91), .wire69(reg48), .clk(clk));
  always
    @(posedge clk) begin
      reg93 <= $unsigned(((wire65 ?
          reg43[(1'h0):(1'h0)] : reg52[(2'h2):(2'h2)]) <= reg32));
      reg94 <= $signed($signed(($unsigned((wire64 ^~ (8'ha9))) ?
          {reg57[(3'h4):(1'h0)]} : (~&reg45[(1'h1):(1'h1)]))));
    end
  always
    @(posedge clk) begin
      reg95 <= $signed(reg28[(3'h7):(3'h6)]);
    end
  always
    @(posedge clk) begin
      reg96 <= (reg32 ?
          $unsigned(((((7'h42) ? (8'h9f) : (8'h9e)) & $signed((8'hbb))) ?
              reg44 : ((-reg94) <<< reg49[(3'h4):(1'h0)]))) : reg45);
      if (wire64[(3'h4):(3'h4)])
        begin
          reg97 <= reg27;
          reg98 <= (+(|($signed($signed(reg35)) ?
              $signed((wire91 ? wire63 : reg93)) : (reg43[(1'h0):(1'h0)] ?
                  (wire91 <<< reg52) : wire65[(5'h12):(4'h8)]))));
        end
      else
        begin
          reg97 <= ((^$signed(reg48)) ?
              ((((+reg53) ? $unsigned(reg44) : ((8'hb6) ? reg31 : wire26)) ?
                  reg42 : $unsigned((7'h40))) & $unsigned(($unsigned((8'hb6)) << {(8'hba),
                  reg96}))) : reg98);
        end
      reg99 <= $unsigned(reg59[(1'h0):(1'h0)]);
      if (reg54)
        begin
          if ($signed(((reg34[(1'h1):(1'h1)] ?
                  reg28[(4'hf):(4'ha)] : {((8'ha0) ? wire25 : reg41),
                      (wire23 ? reg54 : reg56)}) ?
              $signed({$signed((8'ha2))}) : (reg42[(3'h4):(2'h2)] > ((+(8'ha2)) <= reg50)))))
            begin
              reg100 <= $signed((~|{reg39[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg100 <= ($unsigned(reg52[(2'h3):(1'h1)]) ?
                  {reg29[(3'h4):(1'h1)]} : reg30[(5'h10):(2'h3)]);
              reg101 <= ((((+reg30) || ((reg33 <<< wire63) ?
                  wire23 : (+reg44))) * reg41) < reg43[(3'h6):(1'h1)]);
              reg102 <= reg45[(2'h2):(1'h1)];
              reg103 <= reg31[(3'h7):(1'h1)];
            end
          reg104 <= $signed(reg54);
          reg105 <= (|(&{wire64}));
          reg106 <= $unsigned({$signed((8'hab))});
        end
      else
        begin
          if (reg101)
            begin
              reg100 <= reg40[(4'h8):(3'h4)];
              reg101 <= reg105[(1'h0):(1'h0)];
              reg102 <= ((((|reg45[(2'h3):(2'h2)]) ?
                      reg30 : reg28[(3'h4):(2'h2)]) & reg59[(5'h13):(4'h9)]) ?
                  wire62 : $unsigned({($signed(wire21) < reg30)}));
              reg103 <= $unsigned(reg28[(2'h3):(2'h2)]);
              reg104 <= (^~$unsigned((~reg42)));
            end
          else
            begin
              reg100 <= reg101;
              reg101 <= (8'haa);
              reg102 <= reg38[(3'h7):(2'h3)];
              reg103 <= reg37;
              reg104 <= reg96[(4'hb):(3'h7)];
            end
          if ({$unsigned(wire61),
              ($unsigned(reg106[(2'h3):(2'h2)]) ?
                  $signed($unsigned(reg46[(1'h1):(1'h1)])) : ($signed($unsigned(reg32)) ?
                      reg49 : (8'ha2)))})
            begin
              reg105 <= (reg100[(5'h10):(2'h2)] == wire64);
              reg106 <= wire22[(3'h5):(3'h4)];
              reg107 <= (|$unsigned((~^wire25[(4'hf):(4'h8)])));
              reg108 <= $unsigned(((reg36[(3'h4):(1'h0)] ?
                  {(^reg102)} : $unsigned(reg104)) || $unsigned(reg28[(3'h6):(2'h2)])));
            end
          else
            begin
              reg105 <= reg28;
              reg106 <= reg41;
            end
          reg109 <= $unsigned(reg46);
          reg110 <= $unsigned($signed((reg94[(4'hc):(2'h2)] ?
              ((reg45 - (7'h41)) ^~ (^(8'h9f))) : $signed($signed(wire65)))));
        end
      reg111 <= {reg100,
          (~&(reg27[(3'h4):(2'h2)] & ((reg36 ^~ reg29) ?
              (8'hb9) : (reg105 ? reg102 : wire21))))};
    end
  always
    @(posedge clk) begin
      reg112 <= ($signed((~^reg95[(3'h4):(1'h0)])) == (~&(reg107 | ((reg32 << reg51) <= $signed(reg48)))));
      if (((wire23 ?
              $signed($signed($unsigned(wire61))) : $signed(($signed(reg41) >>> ((7'h43) ?
                  reg37 : reg51)))) ?
          (^reg93) : {(~($unsigned(reg58) ? (-(7'h40)) : wire25)),
              (~&(8'ha8))}))
        begin
          if ($signed(wire26[(1'h0):(1'h0)]))
            begin
              reg113 <= reg43[(2'h2):(1'h1)];
              reg114 <= reg110[(5'h10):(4'h8)];
              reg115 <= $unsigned(reg31);
            end
          else
            begin
              reg113 <= reg40[(4'h9):(2'h3)];
              reg114 <= $signed(($signed(reg52[(1'h0):(1'h0)]) ?
                  (~|(reg35 ?
                      $unsigned(reg37) : reg113[(2'h3):(2'h2)])) : {reg49}));
              reg115 <= $unsigned(((reg57[(1'h0):(1'h0)] ?
                      $signed({(8'hab), reg96}) : wire21[(3'h5):(1'h0)]) ?
                  (~|$signed($unsigned(reg43))) : $signed(($unsigned((7'h41)) ?
                      $unsigned(reg40) : (wire23 ? reg115 : reg95)))));
              reg116 <= reg38[(3'h6):(2'h3)];
            end
          reg117 <= {({(reg96[(2'h2):(2'h2)] ?
                      $signed(wire21) : $signed(reg103))} > wire24)};
          reg118 <= reg43[(1'h1):(1'h0)];
          reg119 <= $signed((~|reg112));
          reg120 <= $unsigned((($signed(reg31) ?
                  reg102[(2'h2):(1'h1)] : (reg35[(1'h0):(1'h0)] * {reg47,
                      reg27})) ?
              reg54 : (~reg52[(2'h3):(1'h1)])));
        end
      else
        begin
          reg113 <= reg47[(5'h10):(4'h8)];
          if ($unsigned({$signed((reg46[(4'hb):(3'h4)] ?
                  reg116[(5'h13):(5'h11)] : $unsigned(reg49)))}))
            begin
              reg114 <= $signed($unsigned((&wire24[(3'h6):(1'h1)])));
              reg115 <= $unsigned(reg105[(3'h5):(1'h0)]);
              reg116 <= wire21;
              reg117 <= $unsigned(wire91);
            end
          else
            begin
              reg114 <= ((reg102 > ((wire64[(2'h3):(2'h2)] ?
                          reg100[(5'h11):(3'h6)] : (^~wire63)) ?
                      (!(reg93 ? reg32 : reg113)) : $signed((reg117 ?
                          reg119 : (8'hab))))) ?
                  (~|(!reg54[(1'h1):(1'h1)])) : (^~((~|(8'ha4)) & $signed(reg118))));
            end
          reg118 <= ({reg105[(3'h6):(3'h4)],
                  {(wire62 ? (reg109 > reg102) : (~&reg107))}} ?
              (reg28 >> reg29) : reg96);
        end
    end
  assign wire121 = ($signed($signed($signed((reg53 <= wire64)))) ?
                       $signed((~^reg28)) : $signed((({reg95, reg103} ?
                               reg34 : (reg34 ? reg40 : reg32)) ?
                           (~reg93) : $unsigned(reg97[(3'h7):(3'h7)]))));
endmodule

module module66
#(parameter param90 = (+((~&(~&(&(8'hab)))) ^ (((!(8'ha6)) ? {(7'h43), (8'hb1)} : (-(8'hab))) ? {((8'ha0) ? (8'hb9) : (8'h9f)), (~(8'ha3))} : (((8'haa) >= (8'hac)) ? ((7'h43) ? (8'hbc) : (7'h44)) : {(8'hbe), (8'hb6)})))))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  input wire signed [(4'h8):(1'h0)] wire68;
  input wire [(2'h2):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire71,
                 reg83,
                 reg82,
                 reg73,
                 (1'h0)};
  assign wire71 = ($unsigned(wire68[(2'h3):(1'h0)]) ?
                      wire69[(3'h4):(2'h2)] : wire69[(3'h4):(3'h4)]);
  assign wire72 = (wire70[(2'h2):(2'h2)] < wire68[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg73 <= {wire72[(4'hb):(3'h5)],
          {$unsigned(($unsigned(wire68) <<< wire71))}};
    end
  assign wire74 = (!{$unsigned($unsigned($signed(wire70)))});
  assign wire75 = (wire74[(4'ha):(2'h3)] ^~ $unsigned((((wire74 ?
                              wire68 : wire70) ?
                          $signed(wire72) : ((7'h40) != (8'hac))) ?
                      $signed((~wire69)) : (wire68 ^~ (-(8'ha9))))));
  assign wire76 = $signed($unsigned($unsigned(($unsigned(wire72) ~^ $unsigned(wire74)))));
  assign wire77 = (wire69[(3'h6):(3'h6)] ^~ ({{wire72}} > $unsigned(wire75)));
  assign wire78 = wire76;
  assign wire79 = wire74;
  assign wire80 = (wire77[(1'h1):(1'h1)] ?
                      $unsigned(((~^wire74) ?
                          (~(-wire72)) : $unsigned($signed(wire75)))) : $signed($signed($unsigned(wire69[(3'h7):(3'h7)]))));
  assign wire81 = {(~(wire79 ?
                          ($unsigned((8'hbb)) ?
                              (reg73 ?
                                  wire72 : wire75) : $signed(wire67)) : wire68[(3'h5):(3'h4)]))};
  always
    @(posedge clk) begin
      reg82 <= (^~wire78);
      reg83 <= $signed(wire70[(2'h2):(1'h1)]);
    end
  assign wire84 = wire78[(2'h3):(1'h1)];
  assign wire85 = $unsigned((8'h9f));
  assign wire86 = $signed($signed(wire75));
  assign wire87 = (wire72[(3'h7):(3'h4)] ?
                      (((8'hb2) ?
                              wire75[(5'h12):(1'h0)] : (((8'hb7) ?
                                  wire80 : (7'h41)) <= $signed(wire77))) ?
                          $unsigned(wire78[(4'h8):(3'h4)]) : $unsigned((~{wire79,
                              (8'hb2)}))) : ((~|$unsigned(wire72[(4'ha):(4'h8)])) ?
                          $unsigned(((^~wire70) ~^ (~|wire86))) : $signed(wire75[(3'h6):(3'h6)])));
  assign wire88 = ((wire84 ^~ wire71) ?
                      ({((wire86 ?
                              wire87 : (8'hbc)) != $unsigned(reg73))} >>> wire67[(1'h1):(1'h0)]) : (~wire84[(2'h3):(2'h2)]));
  assign wire89 = ($signed($signed(wire77[(2'h2):(1'h1)])) ?
                      (~&{(~|$unsigned(wire80))}) : (({{wire68, (8'hbf)},
                              $signed(reg83)} ?
                          ($unsigned((8'hb8)) != {wire77,
                              wire77}) : wire78) && $unsigned($signed($signed(reg82)))));
endmodule
