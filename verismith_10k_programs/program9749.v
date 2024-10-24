module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire143;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(4'he):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire164;
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  assign y = {wire61,
                 wire24,
                 wire6,
                 wire5,
                 wire63,
                 wire65,
                 wire141,
                 wire143,
                 wire144,
                 wire145,
                 wire146,
                 wire161,
                 wire163,
                 wire164,
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
                 reg64,
                 (1'h0)};
  assign wire5 = $signed({wire3, (!($signed(wire3) ^ (wire2 >> wire0)))});
  assign wire6 = {wire2[(1'h1):(1'h0)],
                     (!($signed($unsigned(wire2)) ?
                         wire4[(4'he):(1'h1)] : wire4))};
  always
    @(posedge clk) begin
      reg7 <= (!{wire6, wire0[(2'h2):(1'h0)]});
      reg8 <= {(!wire2)};
      reg9 <= $unsigned(reg7[(4'hb):(3'h5)]);
      if ($unsigned($signed($unsigned(($signed(wire4) & $signed(wire6))))))
        begin
          reg10 <= (wire4[(4'hf):(2'h3)] ?
              reg9[(5'h12):(1'h1)] : $signed((8'ha1)));
          reg11 <= reg9;
          reg12 <= (~reg8);
          reg13 <= wire0[(3'h4):(3'h4)];
          reg14 <= ((8'hba) ?
              {(((reg8 ? reg9 : reg13) + ((8'h9d) * reg7)) ?
                      (reg10[(3'h6):(1'h0)] + $signed(reg10)) : $signed((wire3 ?
                          reg11 : wire4)))} : (((~&{(8'ha3)}) ?
                  (~&(~&wire0)) : wire2) | $signed(reg7[(4'ha):(3'h6)])));
        end
      else
        begin
          reg10 <= reg7[(2'h3):(1'h0)];
          if ((8'h9e))
            begin
              reg11 <= (^~{(8'hb4)});
              reg12 <= (($signed(wire0[(3'h4):(2'h3)]) ?
                  (-(wire1 ?
                      (-wire2) : (~^wire4))) : (reg8[(2'h2):(1'h0)] || ((^(8'ha2)) ?
                      (reg10 | wire4) : (-reg12)))) - $unsigned({((reg12 ?
                          reg11 : reg9) ?
                      (wire2 == (8'hb7)) : (reg10 ^~ wire5)),
                  $unsigned(wire0[(1'h1):(1'h0)])}));
              reg13 <= $signed(wire3[(1'h1):(1'h0)]);
              reg14 <= $signed((($unsigned({(8'hb0),
                  (8'ha7)}) >= (~^reg14[(1'h0):(1'h0)])) <= ($unsigned((+wire0)) == ($unsigned(wire3) ?
                  $signed(wire0) : wire3[(3'h5):(1'h0)]))));
              reg15 <= $signed(($signed(((wire0 ?
                      reg11 : wire3) >>> $unsigned(wire2))) ?
                  reg8[(1'h1):(1'h1)] : ($signed({wire4}) != reg12[(2'h3):(1'h0)])));
            end
          else
            begin
              reg11 <= wire3[(2'h3):(1'h0)];
              reg12 <= $unsigned($signed(((8'hab) >> (~&{reg8}))));
            end
          reg16 <= $unsigned($unsigned(($unsigned($signed(wire1)) ?
              ((reg9 | (8'hb1)) ?
                  reg10 : ((8'haf) <<< reg8)) : reg11[(2'h2):(1'h1)])));
          if ({$unsigned($signed((reg14[(1'h0):(1'h0)] - $signed(wire0)))),
              (~$unsigned(($signed((8'haa)) ?
                  (wire6 ? wire0 : reg7) : (reg12 ? reg10 : reg11))))})
            begin
              reg17 <= (~&$unsigned({$unsigned($signed((8'ha3))), reg9}));
              reg18 <= $signed($signed(($unsigned((reg7 >> reg14)) ?
                  ((reg7 << wire4) != wire6[(3'h7):(1'h0)]) : ((&reg7) != ((8'h9d) ?
                      wire6 : reg11)))));
              reg19 <= $signed($unsigned(reg7));
              reg20 <= {$signed({$unsigned({reg15})}),
                  (~|reg18[(3'h6):(3'h6)])};
            end
          else
            begin
              reg17 <= {((+reg7) << $unsigned($signed($signed((8'hb2))))),
                  reg14};
              reg18 <= $unsigned((!reg11));
              reg19 <= $signed((reg11 - ((-$unsigned(reg20)) ?
                  (&(8'haf)) : ($unsigned(reg12) - (!reg16)))));
              reg20 <= $signed((($unsigned(((8'hb6) * reg20)) ?
                  (wire0 ?
                      wire6 : $unsigned(wire1)) : reg18) * (((wire1 ^~ reg18) <<< (reg19 ~^ reg11)) && ((^~reg10) & (reg15 ?
                  wire4 : reg18)))));
              reg21 <= ((reg12[(1'h0):(1'h0)] ? reg15 : reg9[(4'hf):(3'h7)]) ?
                  $signed($signed(reg8[(2'h2):(1'h1)])) : reg15);
            end
          reg22 <= (|reg11[(3'h4):(1'h1)]);
        end
      reg23 <= ((-$unsigned(((~|wire1) >> reg11[(1'h0):(1'h0)]))) ?
          reg7 : $unsigned((~$signed((~reg17)))));
    end
  assign wire24 = {(reg21[(5'h11):(4'hd)] ? $unsigned(reg13) : (7'h42)), reg7};
  module25 #() modinst62 (wire61, clk, reg22, reg10, wire5, reg21);
  assign wire63 = $signed(reg19[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg64 <= $unsigned(wire61[(4'h9):(1'h1)]);
    end
  assign wire65 = (reg16 << ((($signed(wire4) <<< {(7'h41),
                          reg19}) ^~ ((&(8'hbb)) ? {reg7, reg16} : reg64)) ?
                      reg19 : ($signed((wire1 ?
                          wire3 : reg17)) || $unsigned((wire3 + reg12)))));
  module66 #() modinst142 (wire141, clk, reg12, wire1, wire2, reg23, reg17);
  assign wire143 = (reg22[(3'h7):(3'h6)] < reg17[(2'h2):(2'h2)]);
  assign wire144 = (|(reg13 ?
                       (-(+{wire5})) : ($unsigned({wire24}) ?
                           $unsigned({wire61,
                               wire61}) : wire3[(3'h5):(1'h1)])));
  assign wire145 = reg20;
  assign wire146 = {reg19[(4'hf):(3'h5)],
                       ($signed({$signed(wire65)}) ?
                           $unsigned(reg17[(3'h4):(3'h4)]) : (8'ha3))};
  module147 #() modinst162 (wire161, clk, reg9, wire141, reg13, wire61);
  assign wire163 = ((7'h44) ?
                       $unsigned({$signed((reg9 ?
                               (8'hb0) : wire2))}) : ($signed((wire0 ^~ $unsigned(reg17))) ?
                           $signed(((reg12 ? reg22 : reg22) ?
                               $unsigned((8'h9c)) : (reg13 ?
                                   wire3 : (8'hb0)))) : $unsigned(($signed(reg9) <<< ((8'hb1) ~^ reg14)))));
  module66 #() modinst165 (.wire69(wire145), .wire67(wire163), .y(wire164), .wire68(reg12), .wire70(wire1), .wire71(reg22), .clk(clk));
endmodule

module module147  (y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire151;
  input wire [(3'h4):(1'h0)] wire150;
  input wire [(5'h15):(1'h0)] wire149;
  input wire signed [(5'h12):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire157;
  wire signed [(5'h12):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire152;
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 (1'h0)};
  assign wire152 = ((~&wire150) <= {$unsigned(({wire150} ?
                           {wire150, (8'ha5)} : (wire151 ?
                               wire149 : wire151)))});
  assign wire153 = wire150;
  assign wire154 = (($unsigned($signed((wire151 | wire149))) ?
                       (!((~|wire152) << (-(8'haa)))) : ($signed($signed((8'ha0))) ?
                           (^~(wire148 ?
                               wire153 : wire153)) : $unsigned(wire151[(4'hf):(4'h8)]))) >> wire151[(3'h6):(3'h6)]);
  assign wire155 = (wire153 ?
                       (~$signed((wire151 < wire151[(2'h3):(2'h3)]))) : (!(wire150 >> wire151[(4'ha):(4'h9)])));
  assign wire156 = $signed(wire149);
  assign wire157 = wire156[(4'h9):(4'h8)];
  assign wire158 = (7'h40);
  assign wire159 = {wire150[(2'h2):(1'h1)],
                       ((($unsigned(wire153) > wire154) | (~|(wire153 ^~ wire151))) << ($unsigned((~|wire154)) > wire148))};
  assign wire160 = (|(^$unsigned(({wire157} ?
                       $unsigned(wire149) : {(8'hac)}))));
endmodule

module module66  (y, clk, wire67, wire68, wire69, wire70, wire71);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire signed [(3'h7):(1'h0)] wire68;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire70;
  input wire [(5'h13):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire137;
  wire [(5'h11):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire119;
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire137,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire92,
                 wire93,
                 wire119,
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
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire72 = wire70;
  assign wire73 = wire68;
  assign wire74 = (+((~$unsigned($unsigned(wire67))) >> (+(((8'hb3) ?
                          wire67 : wire72) ?
                      (8'ha6) : wire69[(3'h7):(3'h4)]))));
  assign wire75 = wire73[(2'h3):(1'h1)];
  assign wire76 = $unsigned(({((^~wire73) ?
                          (wire69 + wire73) : (8'hbd))} & (($unsigned(wire71) ?
                      wire75 : ((8'h9d) ~^ wire74)) & wire74[(3'h4):(1'h1)])));
  assign wire77 = wire69[(4'hc):(4'h9)];
  assign wire78 = wire77;
  always
    @(posedge clk) begin
      reg79 <= (~(~$unsigned({$signed(wire69)})));
      reg80 <= $signed((({$unsigned(wire74), $signed((8'ha9))} ?
          (wire70[(2'h3):(1'h1)] << (~|wire67)) : $signed(wire71)) & {(8'hbf)}));
      if (wire76)
        begin
          reg81 <= {wire71, (!(~|($signed(wire75) * $signed(wire76))))};
          if (((({wire75[(4'he):(4'hb)],
              (^wire68)} & $unsigned($unsigned((7'h43)))) + wire74) - (-$unsigned((&(&wire75))))))
            begin
              reg82 <= wire74;
              reg83 <= (~{$unsigned(wire78[(1'h0):(1'h0)]),
                  ((^~$unsigned(wire73)) + (wire70[(3'h5):(1'h0)] && $signed(reg80)))});
              reg84 <= (-wire71[(3'h6):(2'h2)]);
              reg85 <= $signed(((8'had) >>> $signed((wire78 > $signed((8'ha2))))));
            end
          else
            begin
              reg82 <= {$signed(((8'ha3) ^ wire78[(2'h3):(2'h3)])),
                  (&wire78[(2'h3):(1'h0)])};
              reg83 <= wire67[(4'ha):(3'h6)];
              reg84 <= (8'hb4);
              reg85 <= (^$signed(((8'hab) << wire77[(3'h6):(1'h0)])));
              reg86 <= reg84[(4'h8):(2'h2)];
            end
          reg87 <= (~^(reg86 ? wire77 : (~|reg79)));
          reg88 <= ($signed($signed(wire70)) & {(^~$unsigned((wire75 > reg81)))});
          reg89 <= (((&{reg86}) - (~&$signed(reg83))) ?
              $unsigned(reg83[(1'h0):(1'h0)]) : {reg85[(1'h0):(1'h0)],
                  reg84[(3'h4):(3'h4)]});
        end
      else
        begin
          reg81 <= (|wire70[(3'h7):(3'h6)]);
        end
      reg90 <= (|$unsigned((reg86[(3'h7):(3'h4)] ?
          reg83[(1'h1):(1'h1)] : ((wire70 ^~ reg89) ?
              wire78[(1'h1):(1'h0)] : $signed(wire77)))));
    end
  always
    @(posedge clk) begin
      reg91 <= wire75;
    end
  assign wire92 = wire69;
  assign wire93 = ($signed(reg91[(1'h1):(1'h1)]) & reg91);
  module94 #() modinst120 (.wire95(wire74), .clk(clk), .wire97(reg80), .wire96(reg85), .y(wire119), .wire98(reg90));
  module121 #() modinst138 (wire137, clk, wire92, wire69, wire70, wire71, reg88);
  assign wire139 = wire137[(2'h2):(1'h0)];
  assign wire140 = $unsigned(({(wire73[(3'h4):(2'h2)] ?
                           $unsigned(wire77) : $signed(wire72))} <= (((8'haa) ?
                           {reg83, reg87} : wire137) ?
                       $unsigned((reg86 ?
                           wire70 : reg88)) : (wire119[(2'h2):(2'h2)] ?
                           ((8'hab) >>> reg83) : {wire139}))));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  assign y = {wire60,
                 wire58,
                 wire57,
                 reg59,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+($signed(wire27[(4'hf):(4'ha)]) ^ wire28)))
        begin
          if ($unsigned($signed($unsigned((~|{(8'haf)})))))
            begin
              reg30 <= $unsigned((8'ha7));
              reg31 <= wire27[(4'hc):(2'h2)];
            end
          else
            begin
              reg30 <= wire26;
              reg31 <= {{$signed($signed(reg30))}, wire27[(3'h5):(1'h1)]};
              reg32 <= $unsigned(wire27[(4'hb):(3'h6)]);
            end
        end
      else
        begin
          reg30 <= (^{reg32});
          reg31 <= (~$signed($unsigned(((~reg30) ?
              wire26[(5'h11):(4'hc)] : $unsigned((8'ha6))))));
          reg32 <= ($signed($signed(({reg31} >> reg32))) ?
              (wire27[(2'h2):(1'h1)] ?
                  reg31 : $signed($unsigned($unsigned(wire28)))) : {wire26});
          reg33 <= reg32[(3'h4):(2'h2)];
          if ((($unsigned(((^reg30) ? (wire28 * wire29) : (&(7'h43)))) ?
                  ((~&$signed(reg32)) ?
                      (~|$signed(reg33)) : wire26) : $signed((wire27 ?
                      wire26 : reg32))) ?
              wire26 : wire28))
            begin
              reg34 <= wire29;
              reg35 <= $unsigned((~|(~|($signed(reg33) ?
                  (reg31 ? reg33 : reg33) : {reg30, reg30}))));
              reg36 <= (&$signed($signed(($unsigned(reg31) ?
                  (reg32 == reg33) : (-reg30)))));
            end
          else
            begin
              reg34 <= ($unsigned((^~$signed($unsigned(reg31)))) ?
                  ($signed(({reg33, reg32} ?
                      (~reg33) : $unsigned((8'h9f)))) <<< ({(wire28 ?
                          (8'h9d) : reg33),
                      wire29[(2'h3):(2'h2)]} | (((7'h40) - reg32) - (reg35 >> reg31)))) : {reg35[(1'h0):(1'h0)],
                      reg36});
            end
        end
      if (reg35)
        begin
          reg37 <= ((|reg36[(1'h1):(1'h0)]) ?
              {$signed((-reg31))} : (reg35[(4'ha):(3'h5)] - (~^wire27)));
          reg38 <= ((($signed((wire26 ? reg31 : reg33)) ?
                      $unsigned(wire26) : $signed(reg30[(1'h1):(1'h0)])) ?
                  $unsigned($unsigned($unsigned(reg30))) : ($unsigned({(8'hbc)}) | wire28)) ?
              $unsigned(reg31[(1'h1):(1'h0)]) : $signed($signed(reg31)));
          reg39 <= ($signed((~|$signed($signed(reg36)))) ?
              $signed({reg32[(2'h3):(1'h1)]}) : ((reg31[(2'h3):(2'h2)] && ((reg37 >>> wire28) - (reg30 || reg35))) ?
                  reg38 : ((+(wire26 ? wire27 : reg30)) ?
                      ((reg33 <= wire28) ?
                          (~^wire29) : {(8'h9f),
                              (8'hb2)}) : reg34[(1'h1):(1'h1)])));
          reg40 <= (-(-$signed(($unsigned(wire28) ?
              $unsigned(reg32) : $unsigned(reg36)))));
          reg41 <= ((((reg39[(1'h0):(1'h0)] ^ wire29) ?
                  $unsigned(reg32[(3'h5):(2'h2)]) : (8'h9d)) == reg37) ?
              reg37[(3'h6):(3'h4)] : $unsigned($unsigned($unsigned($unsigned(reg40)))));
        end
      else
        begin
          reg37 <= reg37;
          if ($signed($signed(reg30[(2'h2):(2'h2)])))
            begin
              reg38 <= reg30[(2'h3):(2'h2)];
            end
          else
            begin
              reg38 <= ((reg33 >> $unsigned($unsigned((reg34 ?
                  wire28 : reg39)))) >= $signed($signed($unsigned((reg38 + (8'hb7))))));
              reg39 <= ((($unsigned({reg34}) ?
                          (reg37[(4'he):(4'hb)] >> (reg30 ?
                              wire26 : (8'hb1))) : (~|(wire27 && wire28))) ?
                      $signed(($unsigned(reg39) * (|reg30))) : {$unsigned($unsigned(reg31))}) ?
                  reg34[(2'h3):(1'h0)] : (|(+{reg41[(2'h3):(2'h2)]})));
            end
          reg40 <= ((|(wire28[(1'h0):(1'h0)] >= (8'ha9))) >= $unsigned($unsigned(wire28)));
          if (reg40[(3'h7):(3'h5)])
            begin
              reg41 <= (reg35 ? (7'h40) : (8'hab));
              reg42 <= ((~|(|reg36[(5'h12):(3'h6)])) ?
                  ($signed(reg32) ~^ {{(+(8'hb7))}}) : (!(~|reg38[(3'h4):(2'h2)])));
              reg43 <= $signed($signed($unsigned($unsigned({wire27}))));
              reg44 <= reg34[(4'hc):(4'ha)];
              reg45 <= reg41[(4'hc):(3'h6)];
            end
          else
            begin
              reg41 <= reg40;
            end
          reg46 <= $signed($unsigned(((reg32 ?
                  wire28[(2'h3):(2'h3)] : $unsigned(wire27)) ?
              ($unsigned(reg40) - (~&wire26)) : $unsigned($signed(reg34)))));
        end
      reg47 <= (((~wire28[(3'h5):(1'h1)]) & $unsigned(((~^reg40) && reg44))) * $signed($unsigned((~&$signed((7'h41))))));
      if (reg42)
        begin
          reg48 <= ((reg33 << reg38[(4'hb):(3'h5)]) ?
              $unsigned($signed((~^$unsigned(reg35)))) : reg37);
          if (((~reg42) ? reg41 : wire29[(1'h0):(1'h0)]))
            begin
              reg49 <= $signed(wire28[(3'h6):(1'h1)]);
              reg50 <= reg32[(3'h4):(2'h2)];
              reg51 <= $signed({reg41,
                  $unsigned(($signed(reg43) <<< (reg45 >> reg39)))});
              reg52 <= (-wire26);
              reg53 <= ($unsigned((~|$unsigned($unsigned(reg48)))) ?
                  reg43[(1'h1):(1'h1)] : $unsigned($signed($unsigned(((8'h9c) ^ (8'hac))))));
            end
          else
            begin
              reg49 <= ((reg49 ?
                      $unsigned(reg38[(4'hb):(3'h5)]) : $unsigned(reg53)) ?
                  reg44 : reg53[(3'h4):(1'h0)]);
              reg50 <= {reg44[(4'h9):(4'h8)], reg51[(4'hf):(4'he)]};
              reg51 <= {wire29[(2'h2):(2'h2)]};
              reg52 <= $signed(reg37[(4'hb):(2'h2)]);
              reg53 <= (reg32 ? wire28 : wire26);
            end
          reg54 <= (|((!$unsigned(reg31[(1'h0):(1'h0)])) << reg43[(4'h9):(1'h1)]));
          reg55 <= (reg52[(4'hc):(2'h2)] <<< $unsigned(((|$signed(reg53)) ?
              $signed((reg43 ? reg38 : reg53)) : reg35[(4'h9):(3'h4)])));
        end
      else
        begin
          reg48 <= $signed({$unsigned(((reg39 && reg35) ?
                  reg46[(1'h0):(1'h0)] : $signed(reg36))),
              $unsigned((reg55[(1'h0):(1'h0)] && (~reg41)))});
          reg49 <= $unsigned($signed(($signed(reg52[(2'h2):(1'h0)]) ?
              (reg44[(1'h1):(1'h1)] - $unsigned(reg30)) : $unsigned({reg44,
                  reg32}))));
          reg50 <= reg30[(2'h3):(2'h3)];
          if (reg44[(3'h6):(3'h5)])
            begin
              reg51 <= $signed(reg51[(4'hd):(3'h4)]);
              reg52 <= (^{$unsigned($signed(reg43[(1'h0):(1'h0)])),
                  (~|$signed(reg31))});
              reg53 <= reg35;
              reg54 <= reg39;
            end
          else
            begin
              reg51 <= $unsigned($unsigned((!(~reg31[(1'h1):(1'h0)]))));
              reg52 <= ((($unsigned({wire28}) && reg32[(2'h3):(2'h2)]) <<< ((8'haa) ?
                  reg37 : reg35)) >>> (reg37[(3'h7):(1'h0)] ?
                  (reg30 ?
                      ((reg55 || reg34) >> (~reg54)) : wire27) : (reg43[(1'h0):(1'h0)] ?
                      (~^(!reg48)) : ($signed(wire28) ?
                          wire29[(4'h9):(3'h5)] : {(7'h40)}))));
              reg53 <= (+(reg46 ?
                  $unsigned($unsigned($unsigned(reg50))) : $signed(reg34)));
              reg54 <= ((!{$signed(((8'hb1) >> reg31)),
                      (((8'hbd) ? reg41 : reg39) ?
                          (reg45 ~^ (7'h40)) : $signed(reg42))}) ?
                  $unsigned(reg49[(1'h1):(1'h1)]) : reg44);
            end
          reg55 <= $unsigned((+(&wire28)));
        end
      reg56 <= $signed((((^$signed(reg53)) ?
          $unsigned({reg54}) : {$signed((8'ha7))}) >= (reg30 == reg53[(3'h4):(3'h4)])));
    end
  assign wire57 = (reg52[(1'h0):(1'h0)] ? reg53 : wire27);
  assign wire58 = reg44[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg59 <= (reg36 ^~ {wire28,
          ((&(wire29 ^~ wire29)) >= $unsigned((wire27 >> reg45)))});
    end
  assign wire60 = reg46[(1'h1):(1'h1)];
endmodule

module module121  (y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire126;
  input wire [(4'h9):(1'h0)] wire125;
  input wire [(4'he):(1'h0)] wire124;
  input wire [(4'h8):(1'h0)] wire123;
  input wire signed [(5'h11):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire127;
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire127,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire127 = $signed((wire123 ?
                       wire124[(4'hd):(4'h8)] : (($signed(wire125) ?
                               (wire122 ^ wire125) : wire123[(2'h2):(1'h1)]) ?
                           wire122 : ((^wire125) * (wire124 ?
                               wire123 : wire124)))));
  always
    @(posedge clk) begin
      reg128 <= wire125;
      reg129 <= wire125[(2'h2):(1'h0)];
      reg130 <= (-$signed($unsigned(reg129)));
    end
  assign wire131 = {wire125, wire123};
  assign wire132 = wire126[(3'h4):(3'h4)];
  assign wire133 = $signed({{$signed($signed(wire124)),
                           {((8'h9d) ? wire132 : reg128),
                               reg130[(4'h9):(1'h1)]}}});
  assign wire134 = (wire125 ?
                       $signed({(7'h44),
                           ((wire131 < reg128) <<< (^(8'ha0)))}) : $signed($signed((&wire131[(1'h0):(1'h0)]))));
  assign wire135 = reg128[(2'h2):(1'h1)];
  assign wire136 = (^reg128[(1'h0):(1'h0)]);
endmodule

module module94
#(parameter param117 = {({{(~|(7'h43))}, ({(8'ha8)} ? ((8'hb1) ? (8'ha6) : (7'h44)) : (!(8'h9f)))} ? (((8'ha5) ? ((8'hb5) ^~ (8'ha1)) : ((8'ha4) & (8'ha6))) << ({(8'hbf), (8'hba)} ? ((8'ha3) && (8'hb3)) : {(8'hb0), (8'hbf)})) : (((~(7'h41)) >>> ((8'haa) ? (8'hbc) : (7'h43))) >= (((7'h44) ? (8'hbd) : (7'h43)) + ((8'hb3) ? (8'haa) : (8'hbd))))), (8'had)}, 
parameter param118 = (~^(~^(|((-(8'hb3)) ? param117 : param117)))))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire98;
  input wire [(5'h15):(1'h0)] wire97;
  input wire [(4'hb):(1'h0)] wire96;
  input wire [(4'h9):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  assign y = {wire114,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg116,
                 reg115,
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
                 (1'h0)};
  assign wire99 = $unsigned((wire97[(4'ha):(3'h6)] ?
                      $signed(($unsigned(wire96) << wire96)) : (($signed(wire96) <= $unsigned(wire95)) ?
                          (~^(wire97 ?
                              wire95 : wire97)) : $signed(wire97[(2'h3):(2'h3)]))));
  assign wire100 = ((8'ha3) ? wire96[(4'h8):(1'h0)] : wire98[(3'h6):(1'h1)]);
  assign wire101 = (8'ha5);
  assign wire102 = $signed(wire99[(2'h2):(1'h1)]);
  assign wire103 = (+(~^wire100[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg104 <= (~&wire98);
      reg105 <= ((+{wire96,
          {$signed(reg104),
              (|(8'hb7))}}) + {((~|$unsigned(wire100)) | (reg104[(2'h2):(2'h2)] ?
              $signed(wire95) : wire100)),
          wire97[(5'h12):(4'hd)]});
      if (((8'had) << $unsigned($signed(wire103[(3'h6):(3'h6)]))))
        begin
          reg106 <= wire102;
          reg107 <= wire96;
          reg108 <= $signed(wire97);
          reg109 <= ({reg108[(2'h3):(1'h1)],
                  (~^$unsigned($unsigned(wire100)))} ?
              {wire95} : $unsigned(wire101));
        end
      else
        begin
          reg106 <= (8'ha5);
          reg107 <= (((($unsigned((8'had)) ?
                      (reg108 ? reg106 : wire95) : (reg107 & reg106)) ?
                  ((wire98 >= wire102) && $unsigned(wire95)) : ((wire99 ?
                      wire99 : reg109) ~^ reg109)) ?
              reg107[(3'h4):(2'h2)] : reg109[(3'h4):(3'h4)]) | wire100[(2'h3):(1'h0)]);
          reg108 <= reg105[(2'h2):(2'h2)];
          reg109 <= (wire97 ?
              wire99[(1'h1):(1'h0)] : (^(((reg107 ? reg106 : (8'hae)) | {reg109,
                  reg105}) >>> $unsigned(wire102))));
          if (((8'ha4) ?
              ($signed((!$unsigned(reg106))) ?
                  (+reg106[(4'hb):(3'h7)]) : {wire96}) : ((($unsigned(wire103) | (~&(8'hba))) <= (&(wire98 & wire103))) ^ $unsigned($signed(reg107[(3'h5):(1'h1)])))))
            begin
              reg110 <= wire103[(4'ha):(1'h0)];
              reg111 <= wire95[(3'h5):(2'h3)];
              reg112 <= $signed((~|wire99));
            end
          else
            begin
              reg110 <= (^~((8'hbf) <<< reg108[(2'h3):(1'h0)]));
              reg111 <= (^~(~|wire100));
            end
        end
      reg113 <= reg107;
    end
  assign wire114 = wire101[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg115 <= wire103[(2'h2):(1'h1)];
      reg116 <= wire95;
    end
endmodule
