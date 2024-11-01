module top
#(parameter param200 = (((((8'hb5) ? (+(8'hb3)) : ((8'haf) ? (8'h9e) : (8'ha7))) != (((8'h9e) + (8'hb8)) < ((8'ha4) ^ (8'hb2)))) < ((((8'hac) >> (8'ha8)) > (~|(8'hbb))) <= (((8'ha1) ? (8'hb8) : (7'h40)) & (^~(8'hb7))))) ? ((((~|(8'ha2)) ? {(8'hbf)} : (|(8'hbc))) >= (((8'ha4) | (8'hb0)) - (^~(8'hb3)))) ^ (~^((^(8'ha7)) ^ ((7'h42) ? (8'hac) : (7'h44))))) : (~^(~^((|(8'hbd)) ? ((7'h42) << (8'h9e)) : ((8'hbd) || (8'hb9)))))), 
parameter param201 = {(param200 ? param200 : (~|(param200 >> param200))), param200})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire199;
  wire signed [(4'ha):(1'h0)] wire198;
  wire signed [(4'hf):(1'h0)] wire197;
  wire signed [(2'h2):(1'h0)] wire193;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire191;
  reg signed [(5'h15):(1'h0)] reg196 = (1'h0);
  reg [(2'h3):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire193,
                 wire5,
                 wire191,
                 reg196,
                 reg195,
                 reg194,
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
  assign wire5 = wire2[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= wire4[(3'h7):(1'h1)];
      reg7 <= {($unsigned(($signed(wire0) ?
                  $signed(wire3) : ((8'haa) ? wire4 : wire1))) ?
              $unsigned(((-wire5) <= (wire0 ?
                  wire2 : wire3))) : ($signed(((8'hbb) ? wire0 : reg6)) ?
                  (8'ha8) : $unsigned($unsigned(wire2))))};
      reg8 <= $unsigned(wire1[(2'h3):(2'h3)]);
      if ($signed(wire0))
        begin
          reg9 <= (+{((~&reg8[(3'h5):(3'h4)]) ?
                  ((wire4 ?
                      wire0 : wire4) == (wire2 ~^ (8'h9d))) : (^~$signed((8'h9c)))),
              ($signed(wire4[(3'h4):(1'h0)]) >>> {(reg7 || wire1), wire3})});
          reg10 <= wire0;
          reg11 <= (wire1[(3'h4):(1'h0)] & (-reg6[(1'h1):(1'h1)]));
          reg12 <= $signed((({reg9} ?
                  reg11[(3'h6):(3'h6)] : (~|(wire2 ? reg10 : wire4))) ?
              ((!wire2[(3'h4):(1'h0)]) >= $signed((reg9 ?
                  wire0 : reg8))) : $unsigned((^~(8'hbc)))));
        end
      else
        begin
          reg9 <= $signed(wire5[(4'h9):(4'h9)]);
          if (($signed(reg11) ?
              (({$signed(wire5)} ?
                  (reg6[(1'h0):(1'h0)] ?
                      $signed(wire4) : $signed(wire5)) : (!{wire1})) >>> ((wire4[(4'h8):(3'h5)] ^ (wire3 ^ reg11)) ?
                  $unsigned($signed(reg8)) : wire0)) : reg8))
            begin
              reg10 <= {($unsigned(($signed(wire2) >> $signed(reg9))) ?
                      $signed((~|reg8[(1'h1):(1'h1)])) : (+(8'hb6)))};
            end
          else
            begin
              reg10 <= ({(($signed(wire1) ? reg8 : (wire1 ? reg12 : reg7)) ?
                          $unsigned($signed(reg8)) : ($unsigned(reg8) >> $signed(reg8))),
                      $unsigned(reg12[(3'h5):(3'h4)])} ?
                  $unsigned($signed((reg6 >> (8'hb0)))) : wire3[(4'ha):(2'h3)]);
              reg11 <= reg11;
              reg12 <= (reg6[(3'h6):(3'h5)] ?
                  ((($signed(wire5) ?
                          (wire1 ?
                              (8'ha6) : reg6) : reg9[(3'h6):(1'h0)]) & (8'hab)) ?
                      wire2 : {wire0, wire3[(3'h5):(1'h1)]}) : wire3);
              reg13 <= $signed(reg8);
              reg14 <= (+(&wire2));
            end
          reg15 <= ((-(~$signed($signed(wire1)))) <= (+($signed((+wire3)) <= {{wire5,
                  wire0},
              wire3[(2'h2):(1'h0)]})));
          reg16 <= $unsigned(wire2);
        end
    end
  module17 #() modinst192 (wire191, clk, wire5, reg10, reg16, reg6);
  assign wire193 = wire1;
  always
    @(posedge clk) begin
      reg194 <= $unsigned({wire0});
      reg195 <= (^wire3[(4'h8):(2'h2)]);
      reg196 <= (^~((^~reg15) ?
          $unsigned($unsigned(wire5)) : (^~$signed((8'ha1)))));
    end
  assign wire197 = ($signed(reg13) >= (!(8'ha1)));
  assign wire198 = wire1;
  assign wire199 = {reg11};
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire190;
  wire signed [(4'h8):(1'h0)] wire188;
  wire [(5'h15):(1'h0)] wire164;
  wire signed [(4'hc):(1'h0)] wire163;
  wire [(4'hd):(1'h0)] wire162;
  wire signed [(5'h10):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire158;
  wire [(4'hc):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire82;
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  assign y = {wire190,
                 wire188,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
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
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire18[(2'h3):(2'h3)]))
        begin
          reg22 <= ($signed((wire21 ?
              $signed((wire18 ?
                  wire20 : (8'hba))) : wire18[(1'h0):(1'h0)])) * wire19);
        end
      else
        begin
          if ((((wire18 ?
                  (|(+wire20)) : $unsigned((-wire18))) < (&$unsigned(reg22[(4'h9):(3'h5)]))) ?
              $unsigned({$unsigned((wire21 >= reg22))}) : (+(~^((wire21 ?
                      wire18 : wire20) ?
                  (wire21 ? wire20 : wire21) : $unsigned(wire19))))))
            begin
              reg22 <= (($unsigned(((^wire19) >> {wire21})) ?
                  $signed(((wire18 < wire21) & {wire21})) : $unsigned(wire19[(1'h1):(1'h0)])) - ($unsigned($unsigned((8'hbe))) ^~ (~&wire19)));
              reg23 <= wire20;
              reg24 <= (8'hb5);
            end
          else
            begin
              reg22 <= ((wire21 ?
                  ((~^$unsigned(wire19)) <= $unsigned(wire21)) : ($signed((wire20 >>> reg24)) ?
                      reg23 : (wire20[(1'h0):(1'h0)] == {reg22,
                          wire18}))) && (($signed((reg23 || (8'ha7))) & (wire18 <<< $signed((8'hb5)))) > ($signed(wire18[(4'h8):(3'h4)]) && wire21)));
              reg23 <= $signed($unsigned((($signed(reg22) ?
                      $unsigned(wire18) : wire20) ?
                  (wire19[(2'h2):(1'h0)] && ((8'hb2) >>> (8'haa))) : wire18[(4'h9):(3'h7)])));
              reg24 <= {(^wire20[(3'h5):(3'h4)])};
              reg25 <= ($signed((reg23[(1'h1):(1'h0)] & (8'ha5))) >> ($unsigned(((&(8'h9e)) | {reg24,
                      wire20})) ?
                  {$unsigned((reg24 == (8'hb1)))} : (~|$signed((wire19 ?
                      wire19 : wire19)))));
              reg26 <= $unsigned(wire19[(3'h6):(1'h1)]);
            end
          reg27 <= ($signed(((8'h9e) ? $signed($signed(wire20)) : (|reg25))) ?
              (wire20[(3'h7):(2'h3)] ?
                  reg22 : (|((wire18 ? reg24 : reg23) ?
                      (^~reg24) : wire20))) : $signed((({wire19} == ((8'hbe) ?
                      reg23 : wire21)) ?
                  (8'hae) : $unsigned({reg24}))));
          if ($unsigned(wire19))
            begin
              reg28 <= {wire18[(4'h9):(4'h8)], ($unsigned(wire21) >= wire18)};
              reg29 <= (~$signed(reg24));
              reg30 <= {{reg22}, wire21};
              reg31 <= ((-(-reg30[(4'ha):(2'h2)])) ?
                  reg25 : (($signed((reg26 ? reg27 : reg26)) ?
                          $signed(reg23) : $unsigned($unsigned((8'hb1)))) ?
                      {reg26, reg23} : $unsigned(wire21[(5'h12):(1'h0)])));
            end
          else
            begin
              reg28 <= $signed(reg25);
              reg29 <= ($unsigned($unsigned($unsigned((reg27 ~^ wire20)))) ?
                  (+((reg22[(3'h5):(1'h1)] ?
                      $signed(reg30) : $signed(wire18)) <<< (+(wire19 ?
                      (8'hb7) : (8'hab))))) : ((($signed(reg27) > (^~reg23)) ?
                      (wire19[(3'h6):(2'h2)] * reg25[(4'h8):(3'h4)]) : reg26) & {(((8'h9d) ^ wire21) ^ reg30),
                      (|reg22)}));
              reg30 <= {((reg23 == (~|$signed(wire19))) ?
                      $unsigned($unsigned($unsigned(reg31))) : wire19),
                  (reg22 ?
                      $unsigned((^$signed(reg23))) : ($signed((8'hbb)) ?
                          (reg31[(2'h3):(2'h2)] - $unsigned(wire21)) : ({wire18} ?
                              (reg31 ? reg29 : wire21) : $unsigned(reg28))))};
            end
        end
      if (($signed(((-(^~(8'h9e))) ?
              (-(~&wire20)) : {wire21, $signed((8'ha6))})) ?
          $unsigned($signed({$signed(wire18)})) : $unsigned((+reg24[(4'hb):(3'h6)]))))
        begin
          reg32 <= wire18;
          reg33 <= (((reg23 ? $unsigned({wire18, reg27}) : (8'h9e)) ?
              reg30 : $signed(reg31)) & ($unsigned((!reg22)) ^ (reg23[(4'hb):(4'hb)] ^~ $unsigned((reg27 >> reg28)))));
          reg34 <= (wire19[(2'h2):(2'h2)] << (8'hb7));
          if (($unsigned((~^reg29)) <= ($unsigned(reg27) ? reg34 : wire20)))
            begin
              reg35 <= {reg30[(4'he):(1'h1)]};
              reg36 <= $signed(((reg26 & reg35) ?
                  reg27[(3'h4):(1'h0)] : ($signed((~^reg30)) * reg34[(3'h4):(2'h3)])));
              reg37 <= $signed(reg28[(1'h1):(1'h1)]);
            end
          else
            begin
              reg35 <= $signed(wire19);
              reg36 <= (^reg34[(4'hb):(4'h9)]);
              reg37 <= $signed(reg34);
              reg38 <= ((~(-(reg36 & reg31))) ?
                  {reg33} : $signed((^~$signed(reg37))));
            end
        end
      else
        begin
          reg32 <= (reg29 ?
              {(reg29 ?
                      reg34[(4'hb):(4'h9)] : ((reg26 ?
                          (8'ha6) : reg38) ^ $signed((7'h44))))} : {$signed(reg26[(3'h4):(2'h2)]),
                  $unsigned((((8'had) ? reg37 : wire18) != (wire21 ?
                      wire18 : (8'hb3))))});
          reg33 <= $unsigned($unsigned((reg38 + ((|wire21) ?
              (7'h44) : $unsigned((8'hb2))))));
          reg34 <= (~&reg37);
          reg35 <= (reg26 ? reg32 : $unsigned(reg36));
          if (((8'ha9) + (+reg27)))
            begin
              reg36 <= (~&(^~(((reg33 && reg34) || (reg22 * reg31)) ?
                  $signed((reg26 << reg28)) : $unsigned($unsigned(wire19)))));
              reg37 <= (wire20[(3'h4):(2'h3)] ~^ reg35);
              reg38 <= {(((^(!wire18)) ?
                          reg22 : ((reg29 ? reg37 : reg30) ?
                              {reg36, wire21} : ((8'hb2) ? reg38 : reg29))) ?
                      {(((8'hb8) ? reg36 : wire21) ?
                              reg33 : (reg26 ^~ reg32))} : $unsigned($unsigned($signed(wire20))))};
              reg39 <= (((~|$signed((reg37 ? reg24 : reg34))) ?
                      (^{(reg25 ? reg32 : reg22),
                          (reg25 ? reg34 : reg37)}) : reg38) ?
                  reg23[(5'h12):(2'h2)] : reg35[(4'ha):(4'ha)]);
            end
          else
            begin
              reg36 <= reg24[(3'h5):(1'h0)];
            end
        end
      if ((|$signed(reg36)))
        begin
          if (($signed(wire19[(3'h6):(2'h2)]) << reg34))
            begin
              reg40 <= $signed((^(reg28[(1'h1):(1'h1)] < wire19)));
            end
          else
            begin
              reg40 <= $signed($unsigned((~wire20)));
            end
          if ((({reg34} ?
                  (+reg38[(4'he):(4'he)]) : (reg28 ?
                      $signed((|(8'ha2))) : (8'hb1))) ?
              (reg38[(5'h12):(1'h0)] ?
                  (8'hb8) : ($signed($signed((8'hbb))) ?
                      ({reg26, reg33} ?
                          reg23[(5'h11):(3'h6)] : reg33) : ((reg34 ?
                          reg29 : reg28) & $signed(reg22)))) : reg30[(1'h0):(1'h0)]))
            begin
              reg41 <= {(((wire20 ?
                          $unsigned(reg28) : (wire21 ?
                              (8'hb1) : reg33)) < ($unsigned(reg29) <<< $unsigned((8'hbf)))) ?
                      reg31 : reg32[(2'h2):(2'h2)])};
              reg42 <= reg38[(3'h4):(1'h1)];
            end
          else
            begin
              reg41 <= reg27;
              reg42 <= reg31[(2'h2):(2'h2)];
              reg43 <= wire20[(2'h3):(1'h0)];
              reg44 <= $unsigned(((!$signed(reg35)) < (($unsigned(reg26) * $unsigned(reg36)) <<< ((reg36 < wire21) ?
                  $unsigned(reg35) : (wire21 ? (8'hb0) : reg26)))));
            end
          reg45 <= reg34;
          reg46 <= (~|reg44[(3'h5):(1'h0)]);
        end
      else
        begin
          reg40 <= reg37[(3'h4):(3'h4)];
          if ({(~&(~&($unsigned(reg24) ? $signed(reg38) : (reg23 < (8'hb0))))),
              (|{(reg33 ^ reg30), $unsigned($unsigned(reg24))})})
            begin
              reg41 <= {(^~reg30[(4'hc):(2'h3)])};
              reg42 <= reg31;
            end
          else
            begin
              reg41 <= ($unsigned(($signed((reg29 - reg33)) ^~ reg45[(3'h7):(3'h5)])) ?
                  $signed((&((reg45 ? reg31 : reg27) >>> (reg31 ?
                      reg24 : reg37)))) : ((reg24[(4'hb):(3'h4)] >>> $signed(reg41[(1'h0):(1'h0)])) ?
                      $unsigned((+reg32)) : {reg32, $unsigned(reg29)}));
              reg42 <= ($unsigned($signed((reg26[(4'hd):(4'hd)] << (^wire20)))) ?
                  (~&reg24) : (&(!(reg27 ? reg39 : (wire19 >= reg46)))));
              reg43 <= ($signed((reg23[(5'h11):(5'h10)] ?
                  reg23 : reg41)) | $signed($unsigned(reg44[(4'h8):(3'h6)])));
              reg44 <= reg44;
              reg45 <= $signed($unsigned({reg29[(3'h5):(1'h0)]}));
            end
          reg46 <= {reg35};
          reg47 <= (^reg28[(2'h3):(2'h2)]);
        end
      reg48 <= ((+reg38[(5'h11):(3'h5)]) << $signed({(|(reg38 ? reg40 : reg34)),
          $unsigned((reg28 ? wire21 : wire21))}));
    end
  module49 #() modinst83 (wire82, clk, reg45, reg43, reg47, reg27, reg40);
  assign wire84 = $unsigned($signed($unsigned($unsigned(wire18[(4'ha):(4'h9)]))));
  assign wire85 = (reg47[(3'h4):(2'h3)] <= {($unsigned((reg37 - reg26)) * reg46[(1'h1):(1'h0)])});
  assign wire86 = $signed((~^reg33));
  assign wire87 = (($signed(($signed(wire20) << reg36[(2'h2):(1'h1)])) != ($unsigned((reg38 ?
                          reg42 : reg26)) > wire18)) ?
                      reg25 : $unsigned(wire86));
  module88 #() modinst153 (wire152, clk, reg44, reg31, reg35, reg37, reg40);
  assign wire154 = (reg44[(2'h2):(1'h0)] ?
                       ($signed((reg43 ^ wire21[(4'h9):(3'h4)])) != wire87[(4'h9):(3'h6)]) : {$signed($signed(reg29[(3'h4):(2'h3)]))});
  assign wire155 = reg40[(5'h11):(3'h7)];
  assign wire156 = {(^wire154), $signed($unsigned((^~$unsigned(reg30))))};
  assign wire157 = (^~(reg47 ?
                       $signed({reg24,
                           (^~reg29)}) : (reg29[(1'h1):(1'h1)] <<< wire154)));
  assign wire158 = reg34;
  assign wire159 = ($unsigned($unsigned(reg47)) < reg42[(4'h8):(3'h7)]);
  assign wire160 = $signed((reg48[(2'h2):(2'h2)] ?
                       reg40 : (~(~|$signed(wire159)))));
  assign wire161 = $unsigned($unsigned(reg37));
  assign wire162 = $unsigned($signed(($signed((wire87 ?
                       wire155 : reg44)) && ((8'ha7) && (|wire18)))));
  assign wire163 = (reg43 + $signed((~^reg31)));
  assign wire164 = (|($signed(reg36) >>> {(8'hbd)}));
  module165 #() modinst189 (wire188, clk, reg46, reg35, wire20, wire160);
  assign wire190 = {$unsigned(wire19[(3'h6):(1'h0)])};
endmodule

module module165  (y, clk, wire169, wire168, wire167, wire166);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire169;
  input wire signed [(2'h2):(1'h0)] wire168;
  input wire signed [(3'h4):(1'h0)] wire167;
  input wire [(2'h2):(1'h0)] wire166;
  wire signed [(2'h2):(1'h0)] wire187;
  wire [(3'h7):(1'h0)] wire186;
  wire [(4'hf):(1'h0)] wire185;
  wire [(5'h10):(1'h0)] wire184;
  wire [(4'hc):(1'h0)] wire183;
  wire signed [(4'h9):(1'h0)] wire182;
  wire [(3'h4):(1'h0)] wire170;
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg180 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(5'h10):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg172 = (1'h0);
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire170,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  assign wire170 = ($signed($signed((+wire166[(2'h2):(1'h0)]))) ?
                       (+((!wire169[(3'h7):(1'h0)]) ?
                           (((8'hb7) ^~ wire169) ^~ $signed((8'h9c))) : (^$signed(wire167)))) : (^wire166));
  always
    @(posedge clk) begin
      reg171 <= (8'ha7);
      reg172 <= reg171[(2'h2):(1'h0)];
      reg173 <= $signed((wire170 ?
          $unsigned(($unsigned(reg172) ^~ ((8'hbf) < (8'hbe)))) : $unsigned($unsigned((wire167 + (7'h40))))));
      if ($signed({($signed(((8'ha7) ^ wire170)) ^~ {{reg171, reg172}})}))
        begin
          reg174 <= wire168;
          if ($unsigned(wire170))
            begin
              reg175 <= $unsigned(reg171);
              reg176 <= wire166[(1'h0):(1'h0)];
            end
          else
            begin
              reg175 <= (8'h9e);
              reg176 <= (({$signed((reg173 - wire167)),
                  wire169[(3'h7):(3'h7)]} >= reg176) < (reg171 != reg173[(2'h3):(2'h3)]));
              reg177 <= (^~$unsigned((^((wire169 ? wire166 : (8'hba)) ?
                  {reg174} : {reg172}))));
            end
          reg178 <= $signed({$unsigned(((wire170 | reg173) + reg177)),
              reg173[(1'h0):(1'h0)]});
          reg179 <= wire167;
          reg180 <= $signed((((^~$signed(reg171)) - {(reg177 ?
                      wire168 : reg179)}) ?
              $signed($signed((~(8'ha5)))) : wire168[(2'h2):(1'h1)]));
        end
      else
        begin
          if (((~$unsigned((^(^(7'h40))))) + $unsigned(((7'h43) ?
              $signed(reg179[(4'h9):(1'h0)]) : {(reg179 << reg171), wire169}))))
            begin
              reg174 <= ((^~({wire168} != {(reg172 ? wire167 : reg176)})) ?
                  $signed(reg179) : ($unsigned(wire168) ?
                      reg180 : $signed(((|(7'h44)) && (&wire168)))));
              reg175 <= (+reg174[(4'h9):(1'h0)]);
              reg176 <= ({(~|{wire169, reg171[(3'h7):(1'h1)]}), (~&reg175)} ?
                  $signed($unsigned(((^reg173) >= (reg178 ?
                      (8'h9c) : wire170)))) : reg172[(1'h0):(1'h0)]);
              reg177 <= (reg173[(2'h3):(1'h0)] - reg174[(3'h4):(1'h1)]);
            end
          else
            begin
              reg174 <= $signed((((&(wire169 ? wire170 : reg172)) ?
                  $signed(reg172) : $unsigned((reg179 + wire166))) >= reg174));
              reg175 <= reg179;
            end
        end
      reg181 <= {{(((^reg174) >> (+(8'hb8))) == reg173[(1'h0):(1'h0)])}};
    end
  assign wire182 = {reg176[(3'h5):(2'h3)],
                       $unsigned(((~^$unsigned(reg174)) + $signed(((8'hb8) | wire168))))};
  assign wire183 = (~|reg180[(3'h4):(2'h3)]);
  assign wire184 = reg171[(4'he):(3'h7)];
  assign wire185 = $signed((($signed((wire167 ? reg181 : (8'hb8))) ?
                           $unsigned($unsigned(reg171)) : reg177) ?
                       reg178[(4'h8):(1'h0)] : (reg181 ?
                           reg180 : ((^(8'ha1)) ?
                               reg173 : wire170[(3'h4):(3'h4)]))));
  assign wire186 = $unsigned((+(reg174 < reg177[(1'h0):(1'h0)])));
  assign wire187 = (wire182[(2'h2):(1'h0)] ?
                       $signed(((~^$signed(wire182)) ?
                           $unsigned($unsigned((8'hbb))) : (((8'hbb) && wire185) ^~ reg174[(1'h0):(1'h0)]))) : (reg176[(4'hd):(4'hd)] & $unsigned({(reg175 > reg176),
                           reg180[(1'h0):(1'h0)]})));
endmodule

module module88
#(parameter param150 = {((!(((8'hb2) <<< (8'ha3)) ? (^(8'ha0)) : {(8'hb8)})) <<< ({{(8'h9c)}} != ({(8'ha4)} << ((8'h9f) ? (8'h9c) : (8'ha0))))), (((~^(~&(8'hbb))) * {((8'ha3) && (8'ha9)), ((8'h9f) ? (8'hb8) : (8'ha6))}) ? ((((8'hb6) >> (8'hbe)) ? {(7'h42)} : ((8'haa) ? (8'hae) : (8'hbc))) ^ ((~(7'h42)) ? (+(8'ha1)) : ((8'ha1) ? (7'h44) : (8'ha0)))) : {(!(~(7'h44))), (((8'hb3) > (8'hb2)) ~^ (~&(8'hb5)))})}, 
parameter param151 = (({(8'hae), (param150 * (|(8'ha1)))} == (~^(param150 ? (param150 != param150) : {param150}))) >= (((8'hbd) <= (~(+param150))) ? (((param150 ? param150 : param150) <<< (-param150)) ~^ (^~{(8'hae)})) : (8'hb7))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h287):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire93;
  input wire [(5'h12):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  input wire [(3'h4):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg [(3'h6):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  assign y = {wire149,
                 wire134,
                 wire118,
                 wire117,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
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
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
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
                 (1'h0)};
  assign wire94 = $signed($unsigned(wire91[(1'h1):(1'h0)]));
  assign wire95 = (wire93[(4'hf):(3'h4)] ?
                      (wire90 < {wire92[(1'h0):(1'h0)]}) : (wire90 ?
                          $signed({wire91[(5'h11):(1'h0)],
                              $unsigned(wire91)}) : wire94[(2'h2):(2'h2)]));
  assign wire96 = ((wire93 ?
                      wire95 : wire91) > (wire93[(4'hf):(4'h9)] + ((|{wire89}) ?
                      (wire91[(5'h10):(3'h7)] ?
                          (^wire89) : (wire92 ?
                              wire92 : wire94)) : $unsigned(wire89[(2'h3):(2'h2)]))));
  assign wire97 = wire94;
  always
    @(posedge clk) begin
      reg98 <= ($unsigned((wire89[(4'hf):(2'h3)] ?
              $signed($unsigned(wire91)) : (wire94[(1'h1):(1'h0)] ^ $signed(wire89)))) ?
          (((wire92[(3'h7):(2'h2)] <<< $signed((8'ha7))) ^ ($signed(wire93) ?
                  {wire89, wire97} : (&wire97))) ?
              (((^~wire91) ?
                  $unsigned((8'hb6)) : (wire96 >>> wire91)) != {(wire95 != wire95),
                  wire91}) : $unsigned($unsigned((wire95 & (8'hb4))))) : wire94);
      if ($signed($signed(reg98)))
        begin
          reg99 <= (($unsigned(wire97) <= (wire95 & (((8'hb1) == wire94) >>> (|wire97)))) != ({$unsigned(reg98),
                  $unsigned($signed(reg98))} ?
              $unsigned(wire93) : $signed(wire91[(5'h10):(3'h5)])));
          if ($signed((+(~{wire96, wire95[(4'hf):(3'h5)]}))))
            begin
              reg100 <= (((-(((8'hbb) ? reg98 : wire90) ?
                  (wire92 <<< reg98) : wire97)) | (~^wire91[(2'h2):(1'h1)])) ~^ reg99[(4'hb):(4'hb)]);
              reg101 <= ($signed((7'h44)) ^ wire94);
            end
          else
            begin
              reg100 <= $signed($unsigned($signed((wire92[(5'h11):(1'h1)] < (~&wire94)))));
              reg101 <= wire90;
            end
          reg102 <= $signed((($signed((-reg101)) ?
              (wire94[(1'h0):(1'h0)] - $unsigned(reg101)) : (reg101 ?
                  {reg99} : (!(8'hb8)))) == wire91[(5'h11):(5'h10)]));
          reg103 <= $unsigned($signed(reg102));
          reg104 <= ((wire92 == ((wire95[(4'he):(4'hc)] == wire92[(4'hb):(1'h1)]) ?
              {wire92, wire89} : {(^~wire94),
                  $unsigned(reg98)})) + {$unsigned(((7'h40) - {reg100})),
              $unsigned($signed($unsigned(reg101)))});
        end
      else
        begin
          if (($unsigned(wire96) ?
              (reg103[(3'h4):(1'h1)] ?
                  ((reg102[(5'h11):(1'h1)] ^~ (wire97 ? wire93 : (8'hbb))) ?
                      wire92 : ($signed(reg98) ?
                          (reg103 ?
                              reg98 : (8'hb7)) : wire97[(5'h11):(4'h8)])) : $signed(($signed(reg101) ?
                      wire94 : $signed(wire92)))) : ((8'haa) == (wire95 - (!reg98)))))
            begin
              reg99 <= (8'hab);
              reg100 <= ($signed({($signed(wire92) ^ (^~(8'ha6))), wire92}) ?
                  (|$unsigned($unsigned(((8'hb5) == wire92)))) : $unsigned(($unsigned((|reg101)) <= (reg104[(4'h9):(3'h5)] ?
                      (~^reg103) : $unsigned((8'haf))))));
              reg101 <= {($signed({reg103}) | ($unsigned({reg98, wire94}) ?
                      $signed($signed(wire90)) : ($unsigned((8'hbf)) && (wire97 < reg99)))),
                  $signed(reg99)};
              reg102 <= (^(reg99[(4'hc):(3'h7)] <= $signed(wire94[(4'hd):(1'h1)])));
            end
          else
            begin
              reg99 <= ({$signed(wire94[(4'h8):(3'h4)])} == $signed((reg98 > (~|{(8'hba)}))));
            end
          reg103 <= (-$unsigned((~|(8'ha4))));
          reg104 <= wire97;
          reg105 <= (8'hbd);
          reg106 <= ({$unsigned($unsigned($signed(reg105))),
              wire89} + reg104[(4'h8):(2'h2)]);
        end
      reg107 <= reg102[(4'ha):(3'h5)];
      if (wire94[(3'h7):(3'h6)])
        begin
          if (reg104)
            begin
              reg108 <= (($signed((|(~|(8'hac)))) ?
                      wire93[(5'h13):(2'h2)] : $signed(reg103)) ?
                  ((~^(!{wire97})) ^~ $signed(((~&reg102) ?
                      $unsigned(reg107) : {reg102, (8'hab)}))) : wire91);
            end
          else
            begin
              reg108 <= $unsigned(wire92);
              reg109 <= $unsigned($unsigned((((reg102 ?
                      reg104 : reg107) * reg98[(3'h7):(3'h5)]) ?
                  {(-reg105)} : $signed($unsigned(reg98)))));
              reg110 <= ($unsigned(reg108) < ({(reg107 >>> (reg99 ?
                      wire97 : wire89))} >>> $unsigned($signed((reg106 <= reg105)))));
            end
          reg111 <= reg103[(1'h0):(1'h0)];
          if ($unsigned(($unsigned(({reg104, wire94} ?
                  (+wire92) : (reg108 | reg110))) ?
              reg105 : ({$unsigned((8'h9f)), $unsigned((8'ha6))} ?
                  reg104[(3'h5):(2'h2)] : $unsigned($signed((8'ha3)))))))
            begin
              reg112 <= ((reg111 ?
                  wire94 : $signed({reg98, wire97})) && (($unsigned(wire90) ?
                      (reg100[(2'h3):(2'h2)] << (^reg107)) : reg103[(2'h3):(2'h3)]) ?
                  $signed(($signed(reg103) | reg111)) : {reg108[(1'h1):(1'h0)],
                      reg98}));
              reg113 <= reg98;
            end
          else
            begin
              reg112 <= reg99[(4'ha):(2'h3)];
              reg113 <= ({wire95} ^ ($signed($signed((!reg101))) > $signed(({wire96,
                  reg105} >> (8'ha1)))));
              reg114 <= (&reg109[(5'h11):(3'h6)]);
              reg115 <= $unsigned($unsigned(($unsigned(wire96[(3'h7):(3'h4)]) ?
                  $signed((!reg113)) : (reg113[(1'h1):(1'h0)] ~^ reg103))));
            end
        end
      else
        begin
          reg108 <= ((~|(!$signed((wire89 - wire92)))) ?
              (wire97 ? $signed(wire91) : $signed(reg108)) : reg110);
          reg109 <= $unsigned(reg107);
        end
      reg116 <= (^~wire89[(3'h5):(1'h0)]);
    end
  assign wire117 = reg112;
  assign wire118 = ($unsigned((reg111 > ($signed(reg110) << (|reg106)))) >> ({$unsigned((reg100 ?
                           wire96 : reg106))} ~^ (&$signed((reg111 ?
                       reg105 : wire92)))));
  always
    @(posedge clk) begin
      reg119 <= wire92;
      if ($unsigned((8'hb4)))
        begin
          reg120 <= $unsigned(((~$unsigned($signed(reg103))) ?
              $signed(($signed(reg114) ?
                  $signed(reg114) : (8'ha6))) : $unsigned($unsigned(reg105))));
          reg121 <= (~|(($signed((wire117 <<< reg101)) ?
              reg107[(3'h5):(3'h4)] : $unsigned($unsigned(wire94))) >>> ($signed(wire96[(4'hb):(4'h8)]) ?
              wire92[(5'h10):(4'h8)] : {((7'h41) ^ reg114), {(8'hba)}})));
          reg122 <= $unsigned((8'hb5));
          reg123 <= $signed((+reg99));
        end
      else
        begin
          reg120 <= reg111[(3'h5):(3'h4)];
          reg121 <= {((7'h43) == (+wire95[(1'h0):(1'h0)])),
              $signed((reg103[(4'h8):(1'h0)] ? reg106 : (8'h9d)))};
          reg122 <= $signed((!{(&(~|wire89))}));
          reg123 <= (~{(reg103[(2'h3):(1'h1)] >> (|(reg120 ?
                  (8'hb5) : reg102))),
              $signed($signed($unsigned(wire92)))});
        end
      if ((reg101[(3'h5):(1'h0)] >= (&(&((reg109 + reg122) ?
          (wire92 <= wire91) : (reg114 + wire91))))))
        begin
          reg124 <= reg106;
          if ((reg108 >= $signed($unsigned(wire93))))
            begin
              reg125 <= ((reg115[(4'hc):(1'h0)] | (($signed(reg111) ?
                  (+(8'haf)) : (8'ha7)) >= $unsigned(wire96))) & $unsigned({$unsigned(reg116[(3'h5):(3'h5)])}));
              reg126 <= (reg110[(2'h3):(1'h0)] + $signed(((wire117 ?
                  (reg124 && reg113) : (reg120 - wire90)) || (|$unsigned(wire91)))));
            end
          else
            begin
              reg125 <= $signed($unsigned($unsigned(reg110[(1'h1):(1'h1)])));
            end
          reg127 <= reg102[(3'h5):(3'h4)];
        end
      else
        begin
          reg124 <= reg112[(3'h6):(3'h4)];
          reg125 <= reg107;
          reg126 <= $unsigned($unsigned((|wire94)));
          reg127 <= reg100;
        end
      reg128 <= $unsigned(reg110[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg129 <= reg101[(1'h1):(1'h0)];
      reg130 <= $unsigned((wire91[(1'h0):(1'h0)] ?
          wire96 : ($unsigned(wire90) > $signed($unsigned((8'hb4))))));
      reg131 <= reg130;
      reg132 <= $unsigned($unsigned($unsigned(reg106)));
      reg133 <= ($unsigned(reg108[(1'h1):(1'h0)]) ?
          $unsigned(reg107) : ((reg112[(2'h3):(1'h1)] ~^ ($signed(reg115) <= (^~wire94))) ?
              (7'h42) : (~&{(!reg119), {wire117, wire90}})));
    end
  assign wire134 = reg114[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      if ((wire93 & (wire95[(4'hc):(1'h0)] >>> wire95)))
        begin
          reg135 <= (^({(reg126 ? $signed((8'hb4)) : reg126)} ?
              (reg113[(4'ha):(3'h7)] ?
                  (((7'h41) ?
                      reg129 : reg133) != (reg116 > reg124)) : reg123[(2'h3):(2'h3)]) : reg129[(4'hc):(2'h3)]));
          if ($unsigned($signed(wire134[(2'h3):(1'h0)])))
            begin
              reg136 <= $signed($signed({($signed(reg110) > (~reg113)),
                  $unsigned(((8'hb7) ? reg114 : wire97))}));
            end
          else
            begin
              reg136 <= reg120;
              reg137 <= reg112;
            end
          if ((8'h9e))
            begin
              reg138 <= ($unsigned({reg115, $signed(reg130[(2'h2):(1'h0)])}) ?
                  ($unsigned({(~(7'h42))}) ?
                      $signed((^{reg98})) : (8'hbc)) : {$signed(reg113),
                      reg107});
              reg139 <= $unsigned((-(~^wire90)));
              reg140 <= (((-(8'had)) && reg133) <<< wire89[(3'h4):(2'h3)]);
              reg141 <= (reg99 && reg137);
              reg142 <= reg109[(2'h2):(1'h0)];
            end
          else
            begin
              reg138 <= reg114;
            end
        end
      else
        begin
          reg135 <= $unsigned($unsigned(($unsigned((reg105 ^ reg103)) ^~ (8'hbb))));
        end
      if ($signed({reg137,
          ((+(reg125 ? reg108 : reg105)) & {(wire96 >>> wire92)})}))
        begin
          if ($signed(((&$signed($signed(wire89))) > (&$unsigned((reg142 ?
              reg139 : reg112))))))
            begin
              reg143 <= {$unsigned(({{reg105}} == ((~|reg137) << $unsigned(reg135)))),
                  $signed(reg126)};
              reg144 <= $signed(reg140[(3'h7):(3'h6)]);
              reg145 <= wire118;
              reg146 <= wire93[(3'h5):(1'h0)];
            end
          else
            begin
              reg143 <= reg98[(2'h2):(1'h1)];
              reg144 <= {reg112[(3'h7):(1'h1)], reg135[(2'h3):(2'h2)]};
            end
          reg147 <= $signed((|($signed((^(7'h41))) ?
              ({reg135} == reg122) : $signed((reg110 ? reg104 : wire92)))));
        end
      else
        begin
          reg143 <= $signed(reg146[(4'ha):(1'h0)]);
        end
      reg148 <= (~{($unsigned($signed(reg145)) ?
              (!(~^(8'h9e))) : ((reg100 ?
                  (8'ha8) : reg137) | (wire96 == reg138))),
          (~|$unsigned((-wire91)))});
    end
  assign wire149 = wire117;
endmodule

module module49
#(parameter param80 = ((((~&{(7'h44)}) ? (^(~^(8'ha2))) : (((7'h44) ? (8'hba) : (8'hb5)) ? ((8'hbd) ? (8'hba) : (8'hac)) : ((7'h42) < (8'ha4)))) ^ ((((8'hb2) <= (8'hb7)) << (!(8'hbb))) ? ((^(8'ha2)) <<< {(8'ha1), (8'haa)}) : (((8'haa) >= (8'ha4)) ? ((8'ha7) ? (8'hb3) : (8'hba)) : (8'ha6)))) ? (((((8'hb8) ? (8'ha4) : (8'hbf)) <<< ((8'ha4) + (8'hbf))) - (8'ha6)) != (({(8'hb8), (8'ha7)} ? ((8'hb7) ? (8'ha6) : (8'ha6)) : {(8'ha6), (8'had)}) ? (((8'ha1) ? (8'h9c) : (8'hb8)) ? ((8'hba) * (7'h41)) : {(8'hae)}) : (((7'h43) ? (8'hb0) : (8'hbf)) ? (!(8'hb1)) : (^~(7'h44))))) : (~^({((8'hae) ? (8'ha2) : (8'hb1)), (|(8'ha2))} && {(!(8'had)), ((8'hbe) ? (8'hbb) : (8'hbd))}))), 
parameter param81 = param80)
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire54;
  input wire [(4'ha):(1'h0)] wire53;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire55;
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire55,
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
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire55 = $signed($unsigned(wire54));
  always
    @(posedge clk) begin
      reg56 <= $signed($signed(wire51));
      reg57 <= (wire54[(1'h1):(1'h0)] ?
          $unsigned({($unsigned(wire50) ?
                  wire54[(3'h7):(3'h6)] : {wire53})}) : (^~wire52));
      reg58 <= reg56[(1'h0):(1'h0)];
    end
  assign wire59 = $signed(reg56);
  assign wire60 = ($unsigned((^~((reg58 ^ (8'hb0)) ? (8'h9c) : (^wire54)))) ?
                      (reg58 < $signed(wire52)) : wire51[(3'h5):(1'h1)]);
  assign wire61 = ($unsigned(reg58[(2'h2):(1'h0)]) << ($signed(wire52) ?
                      (($signed(wire52) & (wire51 ^~ (8'hbb))) ?
                          (reg58 >>> (~(8'hab))) : ((wire51 ? wire50 : wire51) ?
                              $signed(reg57) : $signed((8'hb3)))) : (+(&{wire50}))));
  assign wire62 = reg57;
  assign wire63 = ((~&($unsigned($unsigned(wire53)) ^~ $unsigned(reg56))) ?
                      ($unsigned((reg56 & wire55)) ^ $signed((&wire54[(4'h8):(3'h4)]))) : $signed(($unsigned($signed(wire59)) ?
                          reg58 : {(wire59 ? wire61 : wire52)})));
  assign wire64 = $signed(({(reg56 ?
                          (-reg57) : reg58[(2'h3):(2'h3)])} < $unsigned(wire53)));
  assign wire65 = $unsigned(wire63[(1'h0):(1'h0)]);
  assign wire66 = (($signed(((wire54 <= (8'hbf)) ?
                          wire55[(4'h9):(3'h4)] : $signed(wire63))) ?
                      reg57[(1'h0):(1'h0)] : reg56[(3'h4):(2'h3)]) >>> wire65);
  assign wire67 = $signed(((8'hab) ?
                      $unsigned((8'haf)) : $signed($signed($unsigned(wire61)))));
  assign wire68 = (&wire59);
  assign wire69 = $signed((+($signed(wire51) != (8'ha1))));
  always
    @(posedge clk) begin
      if ((~^(reg57 ? wire62 : $signed(wire55))))
        begin
          reg70 <= $unsigned((&($signed($signed(wire68)) ?
              (((8'ha7) ?
                  wire61 : wire54) != (wire69 != wire61)) : wire67[(3'h6):(1'h0)])));
          reg71 <= (^~(|(8'haa)));
          if ({(+(^~$signed($signed(wire51))))})
            begin
              reg72 <= wire68[(4'h9):(3'h5)];
              reg73 <= (|wire68[(1'h0):(1'h0)]);
              reg74 <= ({$unsigned($signed($signed(reg70))),
                      $signed((wire52[(1'h0):(1'h0)] ?
                          (+wire63) : (reg70 >> wire66)))} ?
                  (($unsigned((-wire50)) <= $unsigned($unsigned((8'hbf)))) ?
                      (^~(&wire52)) : ({reg56[(2'h3):(1'h0)]} ^~ $unsigned($signed(wire55)))) : (reg73 ?
                      (|$unsigned((wire55 ?
                          reg70 : wire52))) : wire53[(3'h7):(1'h1)]));
              reg75 <= wire63[(3'h6):(3'h5)];
              reg76 <= $signed($signed($unsigned($signed((~^reg71)))));
            end
          else
            begin
              reg72 <= wire53;
              reg73 <= (|$signed((|wire59[(4'h8):(1'h1)])));
              reg74 <= $signed((wire65 >>> (reg73[(4'he):(4'hd)] ?
                  (!(^reg56)) : (~^((8'haf) ? wire61 : wire65)))));
              reg75 <= wire64[(1'h0):(1'h0)];
              reg76 <= wire52;
            end
          if ((reg71 ?
              reg73[(2'h2):(1'h1)] : (wire64 ?
                  wire67[(2'h3):(1'h1)] : $unsigned(wire63))))
            begin
              reg77 <= ((|(wire63[(1'h0):(1'h0)] <= ($signed(wire53) ?
                      (7'h44) : {wire50, wire52}))) ?
                  ((~|$unsigned(wire60)) - $unsigned($unsigned(wire53[(3'h6):(3'h5)]))) : $signed((reg58 >> $unsigned((8'hba)))));
              reg78 <= $unsigned($signed(($unsigned((reg72 ?
                  (8'hb9) : (7'h44))) < reg56)));
            end
          else
            begin
              reg77 <= (^wire61);
              reg78 <= wire66;
            end
          reg79 <= wire65;
        end
      else
        begin
          if ((8'hb3))
            begin
              reg70 <= wire61[(3'h4):(3'h4)];
              reg71 <= ((({(~|reg78)} ~^ (reg72[(4'hc):(4'h8)] ?
                          (-(8'h9e)) : {reg56})) ?
                      (^~(!reg57[(3'h4):(2'h2)])) : reg76[(3'h4):(1'h1)]) ?
                  $signed(wire51) : {(&($unsigned(reg76) ?
                          reg73[(1'h1):(1'h1)] : {reg75, reg70})),
                      reg74});
              reg72 <= (^wire69);
            end
          else
            begin
              reg70 <= $unsigned({reg79[(2'h2):(2'h2)]});
              reg71 <= reg57[(3'h5):(1'h1)];
            end
        end
    end
endmodule
