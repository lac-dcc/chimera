module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h206):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire [(2'h2):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire156;
  reg signed [(3'h4):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire26,
                 wire27,
                 wire45,
                 wire46,
                 wire156,
                 reg162,
                 reg161,
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
                 reg23,
                 reg24,
                 reg25,
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
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 (1'h0)};
  assign wire4 = (wire2 ? ($unsigned((~^$signed(wire2))) >> wire0) : wire3);
  assign wire5 = ($unsigned($unsigned(wire1[(3'h7):(2'h3)])) > $unsigned(({wire4} | wire3[(2'h2):(1'h1)])));
  assign wire6 = (~&$unsigned(wire2[(4'hd):(1'h1)]));
  assign wire7 = wire2[(4'hd):(3'h5)];
  assign wire8 = wire3[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ((wire8 ~^ (wire6[(3'h4):(3'h4)] & ($signed({wire7, wire6}) ?
          $signed((wire3 != wire8)) : (~&$signed(wire4))))))
        begin
          if ((8'hac))
            begin
              reg9 <= (+(-$unsigned((8'ha3))));
              reg10 <= $unsigned({(wire5[(2'h3):(1'h0)] == ({wire6, wire1} ?
                      wire1 : (~wire7))),
                  ((wire6 ~^ wire8) << $signed(wire3[(2'h3):(1'h0)]))});
              reg11 <= {($signed(wire8) ?
                      ((8'hab) ?
                          wire0[(2'h3):(1'h1)] : ((wire7 >= wire4) ?
                              $unsigned(wire4) : (reg9 ?
                                  wire4 : wire7))) : reg10)};
              reg12 <= wire3;
              reg13 <= wire7[(3'h7):(3'h4)];
            end
          else
            begin
              reg9 <= $signed(reg13[(2'h2):(1'h0)]);
            end
          reg14 <= ((wire3[(3'h4):(2'h2)] ?
                  wire3[(3'h4):(1'h1)] : $signed($signed((^~wire4)))) ?
              (~^wire7[(5'h11):(4'hc)]) : wire4);
          reg15 <= (!({$unsigned($unsigned((8'h9e)))} ^ (reg14 >> wire4)));
          reg16 <= $signed((reg11[(4'hb):(2'h2)] ?
              $signed((-$signed(wire6))) : (^{$signed(reg13)})));
        end
      else
        begin
          reg9 <= $unsigned((wire5 ?
              {(~|$unsigned(wire4))} : (({(8'hb9), wire3} ~^ $signed(reg11)) ?
                  ((wire1 == reg16) < (8'h9d)) : (~reg11[(4'hb):(4'hb)]))));
          if ($signed(reg15[(2'h3):(1'h0)]))
            begin
              reg10 <= wire4[(1'h0):(1'h0)];
              reg11 <= ($signed(reg12[(3'h4):(1'h0)]) <<< $signed($signed(reg10[(1'h1):(1'h0)])));
              reg12 <= wire1[(3'h5):(2'h3)];
            end
          else
            begin
              reg10 <= $unsigned($unsigned($signed(((7'h43) ?
                  wire3[(2'h2):(1'h1)] : (reg15 < (8'hbb))))));
              reg11 <= (&(!reg16));
              reg12 <= ({{((wire7 << wire3) || $signed((7'h41))),
                      $signed(reg11[(4'hb):(1'h0)])},
                  ($unsigned(wire7) <<< wire8)} ~^ $unsigned(($unsigned((wire8 ?
                      reg13 : reg14)) ?
                  (wire5[(2'h3):(1'h0)] ? reg9 : $signed(reg11)) : wire2)));
              reg13 <= wire7;
              reg14 <= (!(&(((+reg10) << {wire2}) ?
                  wire0 : {$unsigned(reg15)})));
            end
          reg15 <= (reg11[(4'hb):(4'hb)] | (|$unsigned($unsigned($signed(reg10)))));
          reg16 <= ((|(~&reg16)) ?
              reg16[(3'h7):(3'h5)] : $signed($unsigned((~|wire3))));
          reg17 <= $unsigned((reg15 ?
              ($signed($unsigned(wire6)) ?
                  (~&(wire1 ?
                      (7'h40) : wire4)) : $signed(wire7)) : ($unsigned((|wire8)) ?
                  (^(reg14 ? wire4 : wire6)) : (7'h43))));
        end
      if ((-($signed($unsigned((reg16 * wire8))) - (^($unsigned(wire1) ?
          (&wire4) : $unsigned(wire6))))))
        begin
          reg18 <= {{$signed(((wire8 + wire2) ?
                      wire6[(1'h0):(1'h0)] : $signed(wire0)))},
              $unsigned($signed(wire0[(3'h4):(1'h1)]))};
          reg19 <= $signed(((^~reg11) > $unsigned(((wire7 ? (7'h43) : reg14) ?
              $unsigned(wire7) : ((8'haa) < wire0)))));
        end
      else
        begin
          reg18 <= (8'hac);
          reg19 <= (8'h9d);
          if ({{((~(-wire8)) <<< wire4[(1'h1):(1'h1)])},
              ((($unsigned((8'hb9)) * (|reg13)) != reg12) * $unsigned(((^wire6) ?
                  (wire1 == (7'h42)) : (^~wire6))))})
            begin
              reg20 <= wire6[(2'h3):(2'h3)];
              reg21 <= wire0;
            end
          else
            begin
              reg20 <= (~^(($signed($unsigned(wire7)) < ((~(8'hb3)) - (reg21 ?
                      (8'hac) : reg21))) ?
                  (wire2[(4'hb):(3'h6)] && ((reg17 ?
                      reg19 : wire5) >= (reg10 < (8'ha7)))) : (~$signed((wire8 | wire1)))));
              reg21 <= wire2[(1'h1):(1'h1)];
              reg22 <= $unsigned((+(reg15[(3'h5):(2'h3)] ?
                  $unsigned((+(8'h9d))) : {reg14, {reg13}})));
              reg23 <= (8'hac);
            end
          reg24 <= $unsigned(((~^(-(reg9 > wire7))) ?
              $signed(wire7[(2'h2):(2'h2)]) : $unsigned({reg18[(3'h5):(1'h0)],
                  (wire1 ? reg20 : wire2)})));
          reg25 <= $signed(wire8[(1'h0):(1'h0)]);
        end
    end
  assign wire26 = $signed(reg12);
  assign wire27 = ({reg20} ? wire7 : reg15);
  always
    @(posedge clk) begin
      reg28 <= $unsigned(((8'h9f) ?
          (((reg18 & reg19) ? reg10 : $unsigned(reg11)) ?
              (reg21 ?
                  $signed(wire8) : wire4[(2'h2):(1'h1)]) : reg11) : $unsigned($signed((^~reg14)))));
      if ((reg18 & $signed(reg9)))
        begin
          reg29 <= $signed((wire1[(3'h4):(2'h2)] >= ((reg14[(3'h5):(1'h1)] <= wire5) ?
              reg24[(2'h2):(1'h1)] : $unsigned($signed(reg16)))));
          reg30 <= ((({(reg17 ? reg25 : reg16),
              (reg14 ? reg20 : reg17)} && ($unsigned(reg13) ?
              wire3 : reg25[(3'h5):(1'h0)])) <<< $unsigned((((8'hb5) ~^ wire8) >= ((8'h9d) >= reg15)))) ^ ($signed($signed($unsigned(wire6))) || (+$signed(((8'hb8) ?
              reg9 : reg9)))));
          reg31 <= $unsigned(reg21);
          reg32 <= $unsigned(reg25);
          if (({reg31, reg9[(1'h0):(1'h0)]} ?
              (reg29 || (reg14 <= reg32[(2'h3):(1'h0)])) : reg12))
            begin
              reg33 <= wire7[(4'h9):(3'h5)];
              reg34 <= ((~&($unsigned((wire2 ~^ (8'h9c))) ?
                  $unsigned(reg21[(4'h8):(2'h2)]) : (reg9 >= (reg20 ?
                      reg28 : (7'h40))))) >= (8'hbf));
              reg35 <= {(wire2[(4'ha):(2'h2)] ?
                      ($signed($signed(wire4)) > reg9[(1'h1):(1'h0)]) : (-($signed(reg18) >>> wire4)))};
            end
          else
            begin
              reg33 <= $unsigned(wire0);
              reg34 <= ($unsigned((wire5 ?
                      {reg21, {reg31, reg28}} : ((reg14 ?
                          reg23 : wire8) >> $signed(wire4)))) ?
                  $signed(((8'hac) ?
                      $unsigned((reg22 || reg23)) : ($signed(reg31) & (reg28 || reg30)))) : reg21[(3'h4):(2'h3)]);
              reg35 <= {wire4, ({wire26[(2'h3):(1'h1)]} * reg25)};
            end
        end
      else
        begin
          reg29 <= (reg12 ? reg17 : $signed((!(~^$unsigned((8'h9d))))));
          reg30 <= (|reg18);
        end
      reg36 <= $signed((reg33[(1'h0):(1'h0)] ?
          $signed(reg34) : {(8'hbb), $signed({wire6, reg32})}));
      if (((8'ha3) - ({(!$signed(reg9))} ?
          ($unsigned((reg19 ? reg36 : reg16)) == reg17) : wire8)))
        begin
          reg37 <= (-(-reg11[(4'hd):(4'hd)]));
          reg38 <= $signed(($signed(reg12[(4'h9):(4'h8)]) <<< (reg24 * $signed($signed(reg36)))));
        end
      else
        begin
          reg37 <= (|$signed($signed(wire5[(4'hf):(1'h1)])));
          reg38 <= ((($signed((wire26 ? reg35 : reg37)) ?
              $unsigned($signed((8'h9e))) : $signed((~|wire27))) | $unsigned(reg9)) <= ((({(8'hb7)} <<< $signed((7'h40))) & reg24[(1'h1):(1'h1)]) <<< reg33[(3'h4):(1'h0)]));
          if (reg20)
            begin
              reg39 <= (((reg17[(4'ha):(4'h8)] ?
                  reg30 : ((reg18 ? reg13 : reg14) ?
                      (^reg31) : reg21[(3'h4):(1'h1)])) > (-$signed({(8'hb9),
                  reg12}))) & ({$unsigned($unsigned(reg34)),
                  (+(reg25 ?
                      wire0 : wire0))} ~^ ($signed(reg21[(3'h4):(3'h4)]) ?
                  (~|reg34) : reg12)));
              reg40 <= (~|reg11[(2'h3):(1'h1)]);
              reg41 <= (wire7[(3'h4):(2'h2)] ?
                  reg22 : (($unsigned(reg29) ?
                          (~$unsigned(reg25)) : $unsigned(wire4)) ?
                      $signed($signed($unsigned(wire27))) : ({$unsigned((8'ha9)),
                              (!reg21)} ?
                          $unsigned($signed(reg15)) : {reg12[(3'h6):(2'h3)],
                              $unsigned(reg34)})));
              reg42 <= (^~reg39);
            end
          else
            begin
              reg39 <= reg15;
              reg40 <= {(^~{reg32}),
                  (($unsigned($signed(reg36)) ?
                      $unsigned((reg42 | reg29)) : ($signed((8'haa)) >>> $signed((8'hb6)))) - ($unsigned((wire6 ?
                      (8'ha5) : reg31)) || ((reg39 ~^ reg25) ?
                      ((7'h40) ? reg39 : wire26) : reg23)))};
              reg41 <= $unsigned((((^reg16[(2'h3):(2'h2)]) ?
                      (~reg13[(1'h0):(1'h0)]) : (~|$signed(reg23))) ?
                  reg14[(3'h5):(3'h5)] : wire3[(2'h2):(2'h2)]));
              reg42 <= ((!reg22[(2'h3):(2'h2)]) ?
                  ((reg16 * ({reg10,
                      reg24} || (-wire5))) == reg37) : reg17[(5'h12):(2'h2)]);
              reg43 <= (reg24 & (~($signed({reg39}) >= wire4)));
            end
          reg44 <= $signed(wire2[(4'h8):(2'h3)]);
        end
    end
  assign wire45 = {$unsigned($signed((^~{(8'ha1)}))),
                      (&($unsigned((-reg28)) ?
                          reg21 : (((8'h9c) ? (8'hb2) : reg31) ?
                              (reg42 ? reg19 : wire4) : (~&reg36))))};
  assign wire46 = reg25[(3'h5):(1'h1)];
  module47 #() modinst157 (wire156, clk, wire7, reg23, reg35, reg17);
  assign wire158 = (8'ha9);
  assign wire159 = reg29;
  assign wire160 = reg11[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg161 <= ({(^~$unsigned(wire26))} ?
          (~&$signed(($signed((8'ha3)) ?
              reg34 : reg29))) : ($unsigned(({wire5} ?
                  wire158 : $signed(reg9))) ?
              $unsigned($unsigned($signed((8'ha4)))) : (&$signed((reg24 ?
                  wire159 : wire26)))));
      reg162 <= {(((^~((8'ha9) ?
              (8'hbc) : reg9)) || reg35) > {((reg23 | wire7) ^~ (reg15 ?
                  (8'ha2) : (8'hbf))),
              wire156[(3'h6):(3'h5)]}),
          (~|(~^(((8'hb2) ^ reg36) != $signed((8'hab)))))};
    end
endmodule

module module47
#(parameter param155 = (~((8'hb3) ? ((((8'hb4) ^~ (8'ha7)) ? ((8'ha1) ? (8'ha7) : (8'hb5)) : ((7'h40) ? (8'ha4) : (8'hb4))) * (((8'ha3) ? (8'ha5) : (8'h9e)) ? ((7'h43) ? (8'ha8) : (8'hbd)) : (+(8'hb7)))) : ({((7'h43) <<< (8'hbc)), (8'hbd)} ? (((8'hb3) ? (8'hbe) : (8'h9c)) << (^~(7'h40))) : ({(8'hbf)} && ((8'hab) ~^ (8'hae)))))))
(y, clk, wire48, wire49, wire50, wire51);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire [(4'he):(1'h0)] wire49;
  input wire signed [(3'h4):(1'h0)] wire50;
  input wire [(5'h10):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire154;
  wire signed [(2'h2):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire148;
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire70,
                 wire90,
                 wire91,
                 wire92,
                 wire148,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(wire48[(3'h4):(1'h1)]) < $unsigned(((~&((8'h9c) <= wire51)) ?
          (^~$signed((8'ha1))) : $unsigned($signed(wire48))))))
        begin
          reg52 <= wire51[(3'h4):(1'h1)];
          reg53 <= (~^$signed((|$signed(wire49[(3'h4):(2'h2)]))));
          reg54 <= {(wire48 < $unsigned({{reg53, wire50},
                  ((8'hba) <<< reg53)}))};
        end
      else
        begin
          reg52 <= (-$signed(({wire50[(2'h2):(1'h1)]} - $unsigned($unsigned(wire49)))));
          if (wire50[(2'h2):(1'h1)])
            begin
              reg53 <= $signed((|(~&(~|$signed(reg52)))));
              reg54 <= wire51[(1'h1):(1'h1)];
            end
          else
            begin
              reg53 <= wire49[(3'h4):(2'h2)];
              reg54 <= {($unsigned((~^(8'haf))) >>> $unsigned($signed((wire50 <= reg53))))};
              reg55 <= wire49[(2'h2):(1'h1)];
              reg56 <= {$signed((((wire50 ? wire49 : reg54) ?
                      (wire49 >>> wire48) : $unsigned(reg53)) + (^~(|wire49)))),
                  $unsigned((((wire49 ? wire51 : wire48) ?
                          (reg55 ? (8'ha0) : wire50) : wire49[(3'h5):(1'h1)]) ?
                      $unsigned((wire48 ? reg52 : wire48)) : {{wire49,
                              wire48}}))};
              reg57 <= wire51;
            end
          if (wire50)
            begin
              reg58 <= (reg56[(4'h8):(3'h5)] ?
                  ({reg54, reg53[(3'h7):(3'h7)]} ?
                      $unsigned((~&$unsigned(wire48))) : $unsigned(((&wire51) <= wire48))) : ((reg57 + wire51) * reg54[(3'h7):(2'h3)]));
              reg59 <= ({$unsigned(reg56)} ?
                  ((reg55[(1'h0):(1'h0)] ?
                          $unsigned($unsigned(reg58)) : $signed(wire48[(1'h1):(1'h1)])) ?
                      (^~wire51) : ({(+(8'ha3))} ?
                          $unsigned((8'hb9)) : (reg54[(3'h5):(2'h2)] << (reg53 - reg55)))) : (&$signed(((reg54 ?
                          wire50 : reg57) ?
                      wire50 : $signed((8'hb7))))));
              reg60 <= reg52[(1'h1):(1'h0)];
              reg61 <= $unsigned(($signed(wire48[(1'h1):(1'h1)]) * $signed($unsigned($unsigned(reg55)))));
            end
          else
            begin
              reg58 <= (^~wire49[(3'h5):(2'h3)]);
              reg59 <= ((wire51[(5'h10):(1'h1)] ?
                  {(((8'ha0) ? (8'hba) : wire48) - wire50[(2'h2):(1'h0)]),
                      reg61[(3'h7):(2'h3)]} : (reg56[(3'h5):(3'h5)] ?
                      ((reg53 != reg57) <= $signed(reg54)) : $unsigned((~^reg61)))) > {reg53});
              reg60 <= ({$signed($unsigned(reg55[(2'h2):(1'h0)]))} ?
                  ($signed(reg54) >>> ((reg60 ?
                      (reg53 ? reg53 : reg54) : wire48) - ((reg53 ?
                          (8'hb3) : wire49) ?
                      (reg55 ?
                          reg59 : (8'ha7)) : $signed((8'ha3))))) : reg54[(1'h1):(1'h1)]);
              reg61 <= reg57;
            end
          reg62 <= $unsigned($signed(reg61[(3'h5):(3'h5)]));
          reg63 <= wire51[(4'hd):(1'h1)];
        end
      reg64 <= (8'hb8);
      if (reg59[(5'h13):(2'h3)])
        begin
          reg65 <= ($unsigned(reg59) ?
              reg61[(1'h0):(1'h0)] : $signed((reg64 ?
                  $unsigned(wire51[(4'he):(3'h6)]) : $signed(reg54))));
          reg66 <= reg58[(3'h6):(1'h0)];
          reg67 <= reg62;
        end
      else
        begin
          reg65 <= (&$signed(reg52[(4'hb):(4'hb)]));
          reg66 <= $signed($unsigned(reg63));
          reg67 <= $signed($unsigned(reg67[(1'h1):(1'h0)]));
          reg68 <= reg53[(1'h0):(1'h0)];
        end
      reg69 <= reg61;
    end
  assign wire70 = ((-reg58) - (reg53 ?
                      $signed(reg67[(2'h3):(2'h3)]) : (((reg67 ?
                              (8'ha6) : wire49) ?
                          (reg69 != wire51) : (reg53 + (7'h41))) >= (^$signed((7'h41))))));
  always
    @(posedge clk) begin
      reg71 <= ($signed($unsigned((|(8'ha2)))) & (reg58 ?
          ($signed((^~(8'hbd))) ^~ (-$unsigned((8'ha5)))) : {wire49,
              ((wire48 ? reg53 : reg62) <<< reg52[(4'he):(3'h6)])}));
      if (reg68)
        begin
          reg72 <= reg66[(3'h4):(2'h3)];
          reg73 <= (8'ha8);
          reg74 <= ((^reg65) ? $signed($signed(reg64)) : $unsigned(reg52));
          reg75 <= (~^(~^((~|$unsigned(reg57)) >>> wire48[(1'h1):(1'h1)])));
        end
      else
        begin
          if ((reg55 != ((({reg58} - $signed((8'ha0))) ?
              (8'had) : reg73) >= ($signed({reg71, reg64}) ?
              reg72 : (~|(reg54 ? reg60 : reg53))))))
            begin
              reg72 <= (((((reg63 ~^ reg74) < reg61[(2'h3):(2'h2)]) ?
                  (&$unsigned(reg59)) : wire48[(2'h3):(1'h0)]) <= $signed(((reg74 <<< reg52) ?
                  $signed((8'hbe)) : (reg60 || reg59)))) != reg74);
              reg73 <= (reg56 ^~ ((reg59 << $signed((reg69 == wire50))) ?
                  reg66 : $unsigned(((reg64 != reg55) ?
                      (reg53 ? wire50 : reg67) : (reg66 ? wire50 : wire50)))));
              reg74 <= $unsigned($signed((^~reg62)));
            end
          else
            begin
              reg72 <= ($unsigned($signed(($unsigned(reg63) * reg53))) ?
                  $unsigned($signed((~reg75[(2'h3):(1'h1)]))) : ($signed(reg59[(3'h6):(2'h3)]) > $unsigned(((reg72 ?
                          (8'hac) : wire48) ?
                      $signed(reg72) : (reg60 ^~ reg72)))));
            end
          reg75 <= (reg73[(2'h2):(2'h2)] ? (^wire70) : reg75[(1'h0):(1'h0)]);
          reg76 <= $unsigned(((({reg56,
                  reg72} | $signed(reg59)) - $unsigned((8'hb1))) ?
              ({reg56[(2'h2):(1'h0)]} ^ $unsigned($unsigned(reg71))) : ((|reg54) ?
                  reg61 : (~|$signed(reg60)))));
          reg77 <= (((wire49[(1'h0):(1'h0)] & (8'hbd)) ?
              $unsigned(({wire50} ?
                  (reg62 >>> reg52) : $unsigned(reg61))) : (|({reg64, reg62} ?
                  $unsigned(reg67) : reg60[(4'h8):(2'h3)]))) << ($signed(reg72) ?
              $signed($signed(reg72[(1'h0):(1'h0)])) : ($signed((reg73 ?
                  (8'ha7) : reg59)) && (!reg66))));
          if ($signed($unsigned(($signed($unsigned((7'h44))) ?
              ($unsigned((8'hb3)) | reg56) : ((wire51 ? reg65 : reg52) ?
                  (reg65 >= wire49) : {reg54})))))
            begin
              reg78 <= reg55;
              reg79 <= $unsigned(($unsigned({wire70, $unsigned(reg58)}) ?
                  $unsigned($signed($unsigned(reg74))) : ((!$signed(reg73)) <= $signed($unsigned(reg69)))));
              reg80 <= $unsigned(reg73);
            end
          else
            begin
              reg78 <= (reg68 ? reg55 : (reg60 ~^ reg74));
            end
        end
      reg81 <= $signed(($signed(({reg56} ?
          reg80[(1'h0):(1'h0)] : reg78[(3'h7):(2'h3)])) * (reg72 ^~ $signed((reg58 >> reg52)))));
      if ((reg56 & (&$signed((~^reg56[(1'h0):(1'h0)])))))
        begin
          reg82 <= (($unsigned($unsigned($signed(reg62))) ?
              (|$signed((|reg79))) : reg75) > wire51[(4'h8):(3'h4)]);
          reg83 <= {$unsigned(reg59), reg72};
          reg84 <= (reg75 ? {wire50[(3'h4):(3'h4)]} : reg65[(3'h4):(2'h3)]);
          reg85 <= (&reg53[(2'h2):(2'h2)]);
        end
      else
        begin
          reg82 <= (8'ha7);
          if ((reg78 * {((8'hbf) ?
                  {(~^wire51)} : ($signed(reg65) > (reg64 ? reg71 : (8'hbf)))),
              (~&$unsigned($unsigned((8'hb8))))}))
            begin
              reg83 <= reg66;
              reg84 <= reg67;
              reg85 <= reg54[(1'h0):(1'h0)];
              reg86 <= reg74;
              reg87 <= (wire48 | $signed($signed(reg62)));
            end
          else
            begin
              reg83 <= (~|(8'h9d));
              reg84 <= $signed({$signed(wire49)});
              reg85 <= $unsigned(reg58);
              reg86 <= $signed(wire49);
            end
          reg88 <= $signed($unsigned(wire51[(4'hd):(4'hc)]));
          reg89 <= ((~^(^$unsigned($signed(reg82)))) ?
              reg85[(2'h2):(1'h1)] : ((((reg54 != reg72) - reg80[(2'h3):(1'h0)]) == ((~reg83) ?
                  reg88[(3'h4):(2'h3)] : $signed(reg76))) >= $signed($unsigned(reg72))));
        end
    end
  assign wire90 = $unsigned(wire50);
  assign wire91 = ((~^reg62[(4'hd):(4'h8)]) ?
                      reg52 : $signed($unsigned($unsigned($signed(wire50)))));
  assign wire92 = $signed((-(^~$signed((&(8'hb1))))));
  always
    @(posedge clk) begin
      if (reg62[(1'h0):(1'h0)])
        begin
          reg93 <= (((8'hb7) || reg62[(2'h3):(2'h2)]) ?
              {{(reg79[(4'h9):(2'h2)] & (reg71 >= wire48))},
                  reg75[(2'h3):(2'h2)]} : wire90[(2'h3):(1'h0)]);
          if ((((($unsigned((8'hab)) ?
                  $signed((8'hb3)) : (reg54 << wire91)) & $signed(((8'hae) ?
                  reg63 : reg72))) ?
              (wire92[(1'h1):(1'h1)] ?
                  reg69[(4'hb):(1'h0)] : reg52) : ($signed($unsigned(reg52)) ?
                  (reg54[(2'h3):(1'h1)] || wire90) : reg73[(4'hd):(3'h6)])) <<< ($unsigned($signed($unsigned(reg80))) ?
              ((~|$unsigned(reg81)) ?
                  (&(8'ha2)) : $unsigned(wire70)) : (reg60 - reg73))))
            begin
              reg94 <= (&{($signed((8'hbc)) + ($unsigned(wire92) && reg81[(1'h0):(1'h0)]))});
              reg95 <= reg59;
            end
          else
            begin
              reg94 <= (~|(^$unsigned($unsigned((reg72 >= (8'hac))))));
              reg95 <= {{reg80}, $signed(reg58[(2'h2):(1'h1)])};
            end
          reg96 <= (-{reg86[(1'h0):(1'h0)], $signed(reg64[(1'h1):(1'h0)])});
          reg97 <= (~reg74);
        end
      else
        begin
          reg93 <= (($signed((wire49 ?
              {reg52, reg96} : (^reg68))) * {(reg97[(5'h10):(4'hb)] ?
                  reg80 : $unsigned(wire92))}) > reg83[(2'h2):(1'h1)]);
          reg94 <= $signed(reg73);
          reg95 <= (+$signed((((^~reg93) | (reg63 || reg78)) ? reg64 : reg80)));
          reg96 <= $unsigned(reg88[(3'h6):(1'h1)]);
        end
      reg98 <= {(&$unsigned($signed({reg94}))),
          (+(|(~&wire51[(4'h8):(4'h8)])))};
    end
  module99 #() modinst149 (.wire102(wire90), .wire100(reg69), .wire103(reg83), .wire101(reg81), .clk(clk), .wire104(reg64), .y(wire148));
  assign wire150 = reg59[(4'h9):(3'h7)];
  assign wire151 = ($unsigned((($signed(reg64) ?
                       (-reg61) : $signed(reg62)) | {$signed(reg52),
                       wire150[(4'hf):(3'h6)]})) & $unsigned($signed(((reg93 == wire70) << (reg63 > reg66)))));
  assign wire152 = $unsigned(wire151[(4'hc):(3'h5)]);
  assign wire153 = ($signed(reg75[(2'h2):(1'h0)]) - $signed(wire48));
  assign wire154 = reg82;
endmodule

module module99
#(parameter param146 = ((+(({(8'h9c), (8'h9c)} >= ((8'ha0) ? (8'hbc) : (8'hb8))) ~^ (((8'hac) ? (8'hba) : (8'hb4)) != ((8'hbd) ? (8'hba) : (8'ha0))))) ? ((((^~(8'h9f)) ? (|(8'ha3)) : ((8'hb1) ? (7'h44) : (7'h44))) >= ({(8'ha7)} ? {(8'hb4)} : ((8'hb5) ? (8'hba) : (8'h9e)))) ? (((+(8'hba)) ? (^~(8'ha6)) : ((8'ha4) == (8'hab))) ? (8'ha3) : (((7'h43) | (8'hb4)) ? (+(8'had)) : (~|(8'h9e)))) : (+(((8'hb6) ? (8'hb3) : (8'ha7)) ? {(8'ha6), (8'haf)} : ((8'hb1) ? (8'haf) : (8'hbe))))) : ({(((8'ha6) ? (8'hbd) : (8'ha1)) || (~^(8'hb9)))} ? (({(8'hb8)} ? (^~(8'hbe)) : {(8'hb0)}) ? (&((8'ha6) - (8'hbe))) : (7'h44)) : (^(!(&(7'h44)))))), 
parameter param147 = ((+({param146} * param146)) ? ({((~param146) ? param146 : (param146 ? param146 : param146))} ? ((~&((8'hb9) ? param146 : param146)) | ((~^param146) ? (param146 ? param146 : (8'hbb)) : (param146 ? param146 : param146))) : param146) : (~((!(+param146)) * (~|param146)))))
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire104;
  input wire [(3'h7):(1'h0)] wire103;
  input wire signed [(2'h3):(1'h0)] wire102;
  input wire [(3'h7):(1'h0)] wire101;
  input wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(2'h2):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  reg signed [(4'h9):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire131,
                 wire115,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 reg132,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire105 = $signed((wire100 ?
                       $unsigned($unsigned((wire104 ?
                           wire101 : wire104))) : $signed($signed($unsigned(wire104)))));
  assign wire106 = wire101;
  assign wire107 = (~|$unsigned($unsigned((!(wire102 - wire104)))));
  assign wire108 = ($unsigned(wire104[(1'h0):(1'h0)]) * (~^{((wire107 ?
                           wire107 : (8'had)) <= wire100[(5'h11):(4'hc)]),
                       wire103[(2'h3):(2'h2)]}));
  assign wire109 = (((((wire107 ?
                               wire101 : wire104) ~^ ((8'hbf) ^ wire107)) > wire105[(3'h4):(2'h3)]) ?
                           (($unsigned((8'hbf)) ?
                               (8'h9f) : (wire103 ?
                                   wire104 : wire102)) && ((7'h44) ?
                               $unsigned((8'ha2)) : $signed(wire108))) : {{wire102[(2'h3):(1'h0)]},
                               {(~|wire104), $signed(wire102)}}) ?
                       (^(7'h41)) : wire104);
  always
    @(posedge clk) begin
      reg110 <= {{wire101[(3'h5):(1'h0)]}};
      reg111 <= ((wire105 ? $unsigned(wire108) : reg110) ?
          $unsigned({((wire108 << wire101) ?
                  $unsigned((8'hba)) : (wire102 ?
                      wire109 : (8'h9e)))}) : $unsigned(($signed($signed((7'h41))) ?
              wire109[(2'h2):(2'h2)] : ($signed(reg110) ?
                  (wire102 << wire109) : wire102))));
      reg112 <= $signed((^$signed($unsigned({(8'had), (8'hb9)}))));
      reg113 <= (wire100 ? $unsigned(reg111[(3'h4):(2'h2)]) : wire100);
      reg114 <= $signed({(!(wire102 ? {wire104} : (&reg111))),
          {((!(8'had)) ? (wire103 ? wire105 : wire103) : (~|(8'ha3))),
              ((wire106 ? wire106 : wire103) <= (wire103 ?
                  wire100 : reg111))}});
    end
  assign wire115 = ((wire108 && wire109) >> wire107[(3'h6):(3'h5)]);
  always
    @(posedge clk) begin
      reg116 <= (~&$signed($unsigned((&$unsigned(wire109)))));
      reg117 <= wire106;
      reg118 <= wire101[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg119 <= $signed($signed((wire107 & (8'hb0))));
      reg120 <= (reg114[(4'h9):(2'h2)] ?
          reg116[(3'h7):(1'h0)] : $unsigned(wire101[(2'h2):(2'h2)]));
      reg121 <= ((reg114 * ((!(^wire107)) ?
          wire102[(1'h0):(1'h0)] : reg112)) << reg117);
      if ($signed(reg114))
        begin
          reg122 <= {reg117, (reg117 != wire100[(4'he):(2'h2)])};
          if (reg119)
            begin
              reg123 <= $signed(wire103);
              reg124 <= (&(($unsigned((reg122 ? wire108 : reg111)) ?
                  reg113[(2'h2):(1'h1)] : $unsigned($unsigned(wire115))) >= $signed(({wire104,
                  reg121} != (wire104 > reg113)))));
            end
          else
            begin
              reg123 <= $unsigned((8'ha0));
              reg124 <= (~^{reg111, reg122});
            end
          if (((8'ha0) < wire115))
            begin
              reg125 <= wire115[(4'hc):(4'h9)];
              reg126 <= $unsigned((~|$unsigned($signed($signed(wire103)))));
              reg127 <= {(~&($signed((^~reg124)) * $unsigned(wire100[(4'hc):(4'h9)]))),
                  wire105};
              reg128 <= (|wire103);
            end
          else
            begin
              reg125 <= (~|(-{{(7'h44)}, $unsigned(reg116[(3'h4):(1'h1)])}));
              reg126 <= reg112[(4'he):(4'ha)];
              reg127 <= $signed(($signed((^~wire106)) ?
                  $unsigned((!(!reg112))) : reg121));
              reg128 <= $signed((8'hb4));
              reg129 <= reg120;
            end
          reg130 <= $signed(($signed({(reg123 <= reg113)}) * reg129));
        end
      else
        begin
          reg122 <= ((~|$unsigned({{reg127, (8'hb0)},
              $signed(wire101)})) && $unsigned(($signed((wire106 <= reg111)) ?
              $unsigned({wire108, reg121}) : ((reg110 ?
                  reg120 : wire106) * $signed(reg126)))));
          reg123 <= $unsigned($unsigned((~|reg118[(4'h9):(3'h7)])));
          reg124 <= (((reg129[(4'h8):(1'h1)] ?
                      (~&wire106[(4'ha):(3'h7)]) : {reg118[(4'hd):(2'h3)]}) ?
                  (~(|$signed(reg129))) : (^(~reg125))) ?
              reg113 : $unsigned($unsigned(((reg112 != reg119) & $signed(reg119)))));
          reg125 <= $unsigned($unsigned(($signed((reg120 ?
              reg116 : reg117)) | reg121[(1'h1):(1'h0)])));
        end
    end
  assign wire131 = wire107[(4'h8):(1'h0)];
  always
    @(posedge clk) begin
      reg132 <= (+reg111[(5'h12):(3'h7)]);
      reg133 <= reg126[(1'h0):(1'h0)];
      reg134 <= wire107[(3'h7):(3'h6)];
      if ({wire103, {reg134[(2'h3):(2'h3)]}})
        begin
          reg135 <= ((((reg129 ? (reg119 >> wire108) : wire105) ?
                  $signed((!wire102)) : wire107[(4'he):(3'h7)]) ?
              (reg111 <<< $unsigned(wire103[(2'h2):(1'h1)])) : reg127) == ($unsigned($unsigned($signed(wire106))) <<< $unsigned(wire105[(3'h6):(1'h0)])));
          reg136 <= (reg123[(3'h6):(1'h0)] >= (($unsigned($signed(reg126)) && ((reg129 || (8'hb3)) ?
                  (wire105 < reg134) : $signed(reg127))) ?
              $signed((reg134[(1'h1):(1'h1)] ?
                  (reg118 ?
                      reg114 : reg124) : reg121[(2'h3):(1'h1)])) : (~^reg128)));
          if (($signed($unsigned($signed($signed(reg119)))) * reg136))
            begin
              reg137 <= wire108;
              reg138 <= reg127;
            end
          else
            begin
              reg137 <= wire115;
              reg138 <= ($signed(($unsigned({reg119,
                      reg121}) == reg117[(1'h1):(1'h1)])) ?
                  wire109 : (((~^(reg137 >>> reg138)) ?
                          $signed((reg113 ?
                              (8'ha6) : reg135)) : $unsigned((reg128 ?
                              reg112 : reg121))) ?
                      $unsigned((reg112[(1'h1):(1'h1)] << {reg134})) : $unsigned((!(wire109 >= reg122)))));
            end
          reg139 <= wire108;
        end
      else
        begin
          reg135 <= ($signed((^~$signed($signed((8'hb3))))) ?
              $signed($unsigned($unsigned($signed((8'ha5))))) : $signed($signed($signed($signed(reg128)))));
          if (((~|((8'haa) ?
              (reg117[(2'h3):(2'h2)] == reg130[(3'h5):(2'h3)]) : ($unsigned(reg121) ?
                  {reg129} : {reg111}))) && (8'hbf)))
            begin
              reg136 <= wire102[(2'h3):(2'h3)];
              reg137 <= (~|(($unsigned($signed(reg123)) & {$unsigned((8'hbd)),
                  (~(8'h9e))}) <<< reg113));
            end
          else
            begin
              reg136 <= reg123;
              reg137 <= $signed(reg114);
              reg138 <= $signed({wire107[(4'hf):(4'hc)],
                  ($signed(reg133[(3'h5):(1'h0)]) && (^~(reg120 ?
                      reg136 : wire109)))});
              reg139 <= ($unsigned(reg123[(3'h5):(3'h5)]) ?
                  ((wire101 * (&reg110[(4'hd):(3'h5)])) ?
                      reg136[(2'h2):(1'h1)] : (-reg125)) : reg132);
              reg140 <= reg120[(1'h1):(1'h1)];
            end
          reg141 <= (($unsigned($unsigned((-reg117))) ?
                  reg118 : ((-(reg119 ? (7'h44) : reg134)) ?
                      (8'h9f) : (-(!reg129)))) ?
              ((8'hbb) ^ reg138) : reg132);
          reg142 <= (reg141 ^ $unsigned($unsigned(((-reg119) ?
              (~^reg110) : reg132[(5'h10):(4'h9)]))));
          reg143 <= (~|{reg135[(4'hc):(1'h0)], (|reg116)});
        end
    end
  assign wire144 = (reg124 ?
                       $unsigned((&$unsigned((wire105 - reg139)))) : {{$unsigned(reg143[(3'h5):(3'h5)]),
                               ((wire131 == (8'had)) ?
                                   (reg111 ?
                                       reg138 : (8'hb8)) : $unsigned(reg127))}});
  assign wire145 = ($unsigned(wire100) > $signed((~|(&(&(8'hbf))))));
endmodule
