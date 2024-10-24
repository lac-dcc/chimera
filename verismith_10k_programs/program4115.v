module top
#(parameter param169 = ({(8'ha0), {(((7'h41) != (8'ha1)) ? (^(7'h43)) : ((8'ha9) ? (7'h40) : (8'ha3)))}} ? (({((8'hb5) ? (8'h9c) : (8'hb5))} ? (^((8'h9e) ? (7'h42) : (8'hbe))) : (~&(8'hb7))) ? (({(8'hb8)} < (+(8'hae))) ? {((8'ha8) ? (8'hb1) : (8'hb1))} : ({(8'ha1), (8'hb6)} ? ((8'ha2) <<< (8'hb5)) : {(8'hba), (8'haf)})) : (({(8'haa), (8'hb3)} ^~ ((8'hbf) < (8'hac))) > ({(7'h44), (8'hbd)} == ((8'h9e) * (8'hbd))))) : {(({(8'hb6)} ~^ (^(8'haf))) || ((&(8'had)) >> {(8'hb8), (8'ha2)})), (~(~^((8'haa) ? (8'hb0) : (8'hab))))}), 
parameter param170 = ((|param169) ? {(param169 ? (!(param169 ? param169 : param169)) : (((8'ha1) ? param169 : param169) || (param169 ? param169 : param169)))} : param169))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h385):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire168;
  wire signed [(5'h12):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire137;
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(3'h5):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire5,
                 wire6,
                 wire28,
                 wire52,
                 wire53,
                 wire54,
                 wire137,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
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
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  assign wire5 = $unsigned((wire1[(4'hd):(4'h8)] < wire0[(1'h0):(1'h0)]));
  assign wire6 = $signed(wire1);
  always
    @(posedge clk) begin
      reg7 <= (^~wire2);
      if (($signed({($signed(wire3) ? $unsigned(wire3) : wire3),
          $unsigned(wire5[(3'h6):(2'h2)])}) <<< (wire1[(4'h8):(1'h0)] ?
          reg7[(3'h7):(3'h4)] : {(^{(8'had), wire5}), {wire3}})))
        begin
          if (($unsigned(($unsigned((~^wire0)) ?
                  $unsigned(((8'h9c) ?
                      wire1 : (8'hb8))) : $signed(reg7[(4'hd):(3'h4)]))) ?
              (wire0 ^ ($signed((wire0 & reg7)) ?
                  (!(8'h9f)) : {(wire3 <<< (8'hac))})) : ($unsigned($unsigned((~^wire2))) > wire5[(4'hb):(4'h9)])))
            begin
              reg8 <= (7'h40);
              reg9 <= wire2[(2'h3):(2'h3)];
              reg10 <= {(wire5 ?
                      $unsigned(((reg7 != wire5) != ((8'ha7) ?
                          (8'ha1) : wire2))) : (~&reg7))};
            end
          else
            begin
              reg8 <= reg10[(5'h10):(3'h5)];
              reg9 <= $unsigned((8'h9c));
              reg10 <= wire5[(3'h5):(2'h3)];
              reg11 <= {reg7[(3'h5):(1'h1)]};
            end
          reg12 <= $unsigned(wire6);
          reg13 <= ((reg8 ?
                  $unsigned((!((8'hac) > (8'ha1)))) : reg12[(2'h2):(1'h0)]) ?
              $unsigned((-$signed((reg12 & reg9)))) : reg10);
        end
      else
        begin
          reg8 <= (&$unsigned((~^(reg8[(4'hd):(4'h9)] ?
              (wire6 ? reg10 : wire6) : ((8'hba) <= reg12)))));
          if (($signed(wire3[(5'h12):(3'h5)]) ? wire2 : (8'ha3)))
            begin
              reg9 <= $unsigned(($unsigned(((reg7 ? wire2 : reg7) ?
                      $unsigned(reg8) : (wire5 || reg13))) ?
                  $unsigned((&(^~wire4))) : reg9[(1'h0):(1'h0)]));
              reg10 <= (-$signed($signed((+$signed(reg11)))));
              reg11 <= $unsigned((&$unsigned(((-reg10) <<< (~^wire2)))));
            end
          else
            begin
              reg9 <= wire3[(4'hb):(4'hb)];
              reg10 <= $signed((^~($unsigned(wire4[(4'ha):(3'h6)]) > ((~reg13) >> reg13))));
              reg11 <= ($signed(($signed($signed((8'hbf))) ?
                      ((wire1 << reg12) | (+wire6)) : {(~wire5),
                          (wire0 && wire2)})) ?
                  reg9[(2'h3):(2'h2)] : $signed((wire0 & $signed({wire3}))));
              reg12 <= (|$unsigned(($signed($signed(reg11)) ?
                  $signed({(8'h9e)}) : ({wire2, (8'ha4)} & (7'h42)))));
            end
          reg13 <= ((^(wire1 <= $signed((8'hb4)))) * ($unsigned({{reg7}}) ^ $signed($signed($unsigned(reg7)))));
        end
      if ((^~((~&$signed(wire3[(5'h12):(4'h9)])) ?
          $signed(reg12) : (wire3 <<< (&$signed((8'hae)))))))
        begin
          if ({(-(~^(-reg7))), wire5})
            begin
              reg14 <= wire3;
            end
          else
            begin
              reg14 <= ((^~wire6[(1'h1):(1'h0)]) & $unsigned($unsigned(reg10[(2'h3):(2'h3)])));
              reg15 <= $signed(((~&((reg11 ? wire0 : wire2) ?
                      (reg10 && (8'h9d)) : (!reg9))) ?
                  {(!wire1)} : (($unsigned(reg14) <= (reg12 ?
                      wire3 : reg9)) == $signed({reg8, (8'hb0)}))));
              reg16 <= $unsigned($unsigned((reg14[(3'h5):(3'h5)] ?
                  reg15 : $unsigned(((7'h43) & wire0)))));
              reg17 <= reg13[(2'h3):(1'h1)];
              reg18 <= wire0[(5'h11):(1'h1)];
            end
          reg19 <= (+((~^{$signed(reg15)}) ?
              (wire6 ?
                  ((~|reg9) ?
                      (reg9 ?
                          reg13 : wire5) : (+wire1)) : reg8) : wire3[(4'hf):(4'he)]));
          reg20 <= ($unsigned($signed((reg19[(4'h8):(1'h1)] ?
              {reg9} : wire1[(4'h9):(2'h2)]))) <= reg13[(3'h5):(1'h1)]);
        end
      else
        begin
          if (wire5)
            begin
              reg14 <= (~|reg20);
              reg15 <= (wire3[(4'h8):(3'h4)] ? reg19 : reg19[(1'h1):(1'h0)]);
              reg16 <= (wire1[(1'h0):(1'h0)] ~^ reg7[(5'h12):(1'h0)]);
              reg17 <= (wire3 ?
                  (&(wire0[(5'h13):(4'hb)] ?
                      $signed({reg11}) : (wire4[(3'h7):(3'h4)] ^ $unsigned(wire0)))) : $unsigned($signed({((8'hac) ?
                          reg19 : (8'hb1)),
                      $signed(reg9)})));
              reg18 <= ({reg13, (&(+(|wire6)))} ?
                  ({$unsigned((~|wire4))} - ({$signed(reg11)} ?
                      wire3[(4'h9):(3'h5)] : reg13)) : (reg7[(4'h8):(2'h3)] ?
                      {{reg11},
                          $signed(reg11)} : (~|($unsigned(reg15) != reg13[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg14 <= reg15;
              reg15 <= ($unsigned($signed($unsigned(reg20))) >>> $unsigned(($signed((+reg9)) ?
                  ((reg11 ^~ wire5) ?
                      (reg7 > (8'ha2)) : $unsigned((8'ha1))) : reg20)));
              reg16 <= $unsigned($unsigned({{$signed(wire4)},
                  ((reg20 ? (8'hb9) : reg16) ^~ {wire4, wire0})}));
              reg17 <= ($signed(((&reg15[(3'h4):(1'h1)]) + (+(~&reg19)))) >> wire2);
              reg18 <= $signed(reg19);
            end
          reg19 <= ({(reg11 ?
                      $signed(reg15) : ((wire5 ? reg12 : reg19) ?
                          $unsigned(wire1) : $unsigned((7'h42))))} ?
              reg10 : ((wire1[(3'h6):(3'h6)] <<< reg18) ?
                  reg12[(3'h5):(2'h2)] : (&$signed(wire1[(4'h8):(3'h7)]))));
          reg20 <= reg19;
          if ($signed(reg17[(4'hf):(4'hb)]))
            begin
              reg21 <= {wire6[(1'h1):(1'h1)], reg10};
              reg22 <= (($unsigned(reg11[(3'h4):(2'h3)]) ?
                      (^wire2) : (((&reg15) ?
                          reg15[(3'h4):(1'h1)] : (+reg16)) ~^ $unsigned(reg11))) ?
                  reg12[(3'h4):(1'h0)] : wire1[(4'he):(4'hd)]);
              reg23 <= reg16;
              reg24 <= $signed(($signed($signed((&wire4))) ?
                  (&reg8) : reg15[(1'h1):(1'h1)]));
              reg25 <= $unsigned($signed((((8'hb9) <<< (8'hb5)) ?
                  reg10[(4'hf):(3'h7)] : (!(wire1 ? reg15 : (8'hbe))))));
            end
          else
            begin
              reg21 <= ($unsigned(reg25) ?
                  $signed(reg12[(3'h5):(3'h4)]) : $unsigned($signed({reg10[(4'h8):(3'h6)]})));
            end
          reg26 <= {(~^(reg25 ?
                  ((^(8'ha1)) << wire2) : $unsigned({reg9, wire0}))),
              $signed((+wire6[(1'h0):(1'h0)]))};
        end
      reg27 <= (reg7 == reg8);
    end
  assign wire28 = {($unsigned({reg22[(4'hf):(2'h3)]}) ?
                          $signed($unsigned(reg22[(3'h4):(3'h4)])) : wire2[(2'h2):(2'h2)])};
  always
    @(posedge clk) begin
      reg29 <= $signed((reg25[(3'h7):(3'h5)] ?
          reg7[(5'h12):(4'hc)] : (reg9[(4'h9):(4'h9)] <= ((reg17 == reg20) ?
              (reg19 ? wire0 : reg8) : $unsigned(reg16)))));
      reg30 <= ((+((~|(~^reg23)) ?
          (|(wire5 * wire1)) : $signed((~^reg14)))) != (8'ha5));
      if (({(|$signed($signed(wire5)))} ^ (^(&$unsigned(reg29[(4'hc):(4'h8)])))))
        begin
          if ({reg22[(4'he):(3'h4)], {(^~wire5)}})
            begin
              reg31 <= $signed($unsigned($unsigned(($unsigned(reg22) ?
                  wire2[(1'h0):(1'h0)] : (reg8 ? (8'hbb) : wire1)))));
              reg32 <= (8'hb9);
            end
          else
            begin
              reg31 <= wire5[(2'h2):(1'h1)];
              reg32 <= $unsigned((~&$unsigned(reg12)));
              reg33 <= ((~^$unsigned(reg24[(3'h6):(3'h4)])) | reg8);
            end
          reg34 <= ($signed(({reg33} & $unsigned((!wire3)))) ? {reg18} : reg20);
          reg35 <= {(({(8'ha1)} ?
                  (|$unsigned(reg32)) : ((reg30 ?
                      reg21 : (8'hab)) < (|(8'hbd)))) > {$signed(reg11)})};
          if (reg17[(4'hf):(1'h0)])
            begin
              reg36 <= {{reg30, reg13[(3'h4):(1'h0)]}};
            end
          else
            begin
              reg36 <= ((((~|(^~wire4)) ?
                          $signed(wire2[(2'h2):(1'h0)]) : ((reg18 >= reg32) ~^ reg22)) ?
                      wire2 : {{(reg25 ? reg11 : reg9)}}) ?
                  $unsigned(($unsigned($unsigned(reg9)) ?
                      reg29 : ({reg12,
                          wire4} ^~ reg15))) : (!(($signed((8'haa)) >= (~&reg27)) < ({wire4} ?
                      (reg21 >> (8'hbb)) : $unsigned(wire2)))));
              reg37 <= ($signed($unsigned(((reg32 ? reg12 : reg11) | (reg16 ?
                      reg8 : wire5)))) ?
                  ({$unsigned((reg11 <= reg10))} ?
                      ($signed(reg10) ?
                          $unsigned((reg35 ?
                              reg31 : wire2)) : $signed(reg16[(5'h12):(3'h5)])) : $signed(reg8)) : wire3[(5'h11):(2'h3)]);
              reg38 <= (({(+(wire28 ? reg14 : reg26)), reg31} * reg16) ?
                  reg34[(1'h0):(1'h0)] : ((((-wire0) ?
                          reg35[(4'h8):(3'h4)] : reg15) ~^ ((reg32 ?
                          (8'ha1) : wire5) || reg27)) ?
                      $unsigned(((^~reg33) && (8'hbd))) : reg21));
              reg39 <= (((~^(!reg19)) ?
                  $unsigned(((reg24 ?
                      reg33 : reg23) >= (~^reg13))) : wire0) && {reg29[(5'h10):(4'hd)]});
              reg40 <= reg10[(3'h4):(2'h2)];
            end
          reg41 <= $signed($signed(reg8));
        end
      else
        begin
          if (reg21)
            begin
              reg31 <= $signed(wire0);
              reg32 <= $signed((~^((+(&(8'h9d))) ?
                  (~^reg20[(2'h3):(1'h0)]) : ((+reg9) ~^ $signed(reg34)))));
              reg33 <= (reg36 ?
                  reg32[(3'h7):(3'h7)] : ((reg37 >= reg35[(3'h6):(1'h1)]) ?
                      (reg8[(2'h2):(1'h1)] ^ (~reg25[(3'h4):(2'h2)])) : (reg39[(1'h1):(1'h0)] - ($signed(reg13) ?
                          (~&reg40) : (&(8'ha4))))));
              reg34 <= reg25;
              reg35 <= (^~$unsigned({reg20, reg14}));
            end
          else
            begin
              reg31 <= reg35[(1'h1):(1'h0)];
              reg32 <= (-((-(^{reg13, reg41})) ?
                  $unsigned((^~$unsigned(reg12))) : reg26[(1'h1):(1'h0)]));
              reg33 <= wire1;
            end
          reg36 <= wire1;
          if (reg32[(4'hd):(1'h1)])
            begin
              reg37 <= $unsigned((&{(^~{reg12})}));
            end
          else
            begin
              reg37 <= ((|(^reg39[(3'h5):(2'h3)])) ^ reg23);
              reg38 <= (((+$signed(reg37[(2'h2):(1'h0)])) ? reg9 : wire0) ?
                  wire3[(4'hc):(4'ha)] : reg17[(3'h4):(1'h0)]);
              reg39 <= reg36;
              reg40 <= reg21[(1'h1):(1'h0)];
            end
          if ((+reg11))
            begin
              reg41 <= ({($signed((&(7'h44))) ?
                      {((7'h43) ? reg18 : reg11)} : ($signed(reg15) ?
                          reg17 : $unsigned((8'hbb))))} - (~($signed((reg35 ?
                  reg15 : (7'h41))) ^ reg36[(4'h9):(3'h6)])));
              reg42 <= (~reg14[(3'h7):(1'h1)]);
              reg43 <= $unsigned($signed(wire6));
              reg44 <= $signed((reg25 ? $signed((8'ha6)) : $unsigned(reg15)));
              reg45 <= $signed(reg7);
            end
          else
            begin
              reg41 <= ($signed(((8'h9f) ?
                      reg34[(4'h8):(3'h5)] : ($unsigned(reg36) ?
                          {reg42, reg26} : (reg12 ? reg37 : reg43)))) ?
                  ($unsigned((~|reg27)) != (((~^reg36) ?
                      (~^reg36) : ((7'h42) ?
                          reg14 : reg42)) == {$unsigned(reg31)})) : ($unsigned($unsigned((wire5 ^ reg39))) >>> (reg10 == $signed(wire5[(4'hf):(4'hb)]))));
              reg42 <= (+reg14[(1'h1):(1'h0)]);
              reg43 <= (((reg18[(3'h6):(3'h5)] <= $signed($unsigned(reg13))) ^~ reg10) ?
                  reg19 : $signed((reg8 >= {$signed(reg24)})));
            end
        end
      reg46 <= reg39;
      if (reg43[(4'hb):(2'h2)])
        begin
          reg47 <= wire5;
          reg48 <= reg46;
        end
      else
        begin
          reg47 <= reg27;
          reg48 <= (reg22 ?
              (wire3[(4'hf):(4'hc)] ?
                  $signed({$signed(reg27),
                      (reg13 ?
                          reg11 : wire6)}) : $unsigned((-(^reg29)))) : ($unsigned($signed((~reg12))) ?
                  $signed({reg30[(1'h0):(1'h0)], {reg30}}) : {(reg38 ?
                          reg18 : (8'ha1))}));
          reg49 <= (^($signed($unsigned($signed(reg20))) ?
              reg22[(3'h4):(3'h4)] : $unsigned(wire1)));
          reg50 <= $unsigned(((+wire3) ?
              (!reg15[(1'h1):(1'h1)]) : ((8'h9f) ?
                  {$unsigned((8'ha0))} : $signed($unsigned(reg14)))));
          reg51 <= (reg38 + $unsigned(((wire28[(2'h3):(1'h0)] ^~ $unsigned(reg22)) ?
              $unsigned(reg47[(2'h2):(1'h1)]) : (-reg17))));
        end
    end
  assign wire52 = $signed(((~&(((8'hb7) | (8'hb0)) ?
                      $unsigned(reg18) : wire1)) > (~&(|$unsigned((8'ha0))))));
  assign wire53 = (($unsigned(($signed(reg35) >= (reg39 <= (8'had)))) * $signed(reg35)) ?
                      $signed({(~|reg9)}) : (reg19[(1'h1):(1'h1)] ?
                          reg18 : ($signed($signed(wire4)) < {$signed(reg22),
                              {wire5}})));
  assign wire54 = (($signed($signed($signed(wire3))) || $unsigned({(reg14 ?
                              wire52 : reg15)})) ?
                      (7'h40) : $signed($signed($signed({(8'ha1)}))));
  module55 #() modinst138 (wire137, clk, reg47, reg10, reg50, wire3);
  always
    @(posedge clk) begin
      reg139 <= ($unsigned($unsigned($signed($signed((8'hb2))))) >= {(reg7 ^ (reg15[(1'h0):(1'h0)] ?
              reg19 : reg20)),
          (((8'ha5) >>> reg8[(4'h8):(3'h6)]) - (reg17 - reg27))});
      if (reg7)
        begin
          reg140 <= $unsigned({(reg22[(4'hc):(3'h6)] ?
                  {wire5} : (reg30 ? (wire53 ? wire53 : wire6) : (+reg51))),
              $signed($signed((wire137 ? reg19 : wire54)))});
          reg141 <= reg13[(3'h7):(1'h0)];
          if ((reg9 ?
              (($unsigned($signed(reg42)) ?
                  reg15 : (^(reg10 + reg42))) ~^ reg38[(2'h2):(2'h2)]) : $unsigned(reg10[(4'hd):(4'h8)])))
            begin
              reg142 <= ((((~^$signed(reg140)) ? reg47 : (~|reg22)) ?
                  reg27[(4'hb):(3'h5)] : reg7) != reg7[(4'hf):(4'hb)]);
              reg143 <= (~(^$signed((^wire52[(4'hc):(4'h8)]))));
            end
          else
            begin
              reg142 <= $unsigned(wire6[(1'h1):(1'h1)]);
              reg143 <= wire137[(1'h0):(1'h0)];
              reg144 <= reg36[(2'h2):(1'h0)];
              reg145 <= (wire53 < reg45[(3'h7):(3'h4)]);
            end
          reg146 <= (|(&(reg14[(1'h1):(1'h0)] && (8'hb9))));
          reg147 <= $signed(reg35[(4'ha):(2'h2)]);
        end
      else
        begin
          reg140 <= (!$signed($signed($unsigned((!(8'hb5))))));
          reg141 <= reg22;
          reg142 <= reg139[(2'h3):(1'h1)];
          reg143 <= $unsigned((wire53 ?
              $unsigned(reg20) : ($signed((wire6 ?
                  wire52 : reg143)) != wire52[(4'h8):(2'h3)])));
          reg144 <= ((({((8'hae) ^~ reg8)} ?
                  {reg33[(3'h6):(1'h1)]} : (reg147[(4'he):(3'h4)] <<< (reg45 ?
                      reg8 : reg29))) < $signed(reg44[(2'h2):(1'h0)])) ?
              (8'haf) : (($unsigned($signed(reg49)) ?
                  ((reg42 ? reg36 : wire3) << (reg40 ?
                      (8'hba) : reg34)) : $signed((wire1 > reg16))) << wire0[(3'h4):(2'h3)]));
        end
      if ($unsigned(wire52[(4'hf):(1'h0)]))
        begin
          reg148 <= {(~&reg42[(2'h3):(2'h3)])};
          reg149 <= wire137;
          if ($signed(((((reg8 ? (8'hba) : (7'h42)) ?
                      $unsigned(reg21) : {reg48}) ?
                  reg7 : (~reg26[(2'h2):(1'h0)])) ?
              reg143 : ($unsigned(reg10) ^~ reg18[(4'h8):(3'h6)]))))
            begin
              reg150 <= reg142[(1'h0):(1'h0)];
              reg151 <= ({(|(&(8'hb3)))} >= (reg46[(2'h3):(1'h1)] ?
                  $unsigned((-(^~reg34))) : reg50[(4'ha):(3'h7)]));
            end
          else
            begin
              reg150 <= ((|$signed({(reg14 ? wire52 : wire4), wire137})) ?
                  {$unsigned((reg29[(1'h0):(1'h0)] ?
                          (reg141 ?
                              (8'h9e) : reg141) : {wire2}))} : $signed((($unsigned((8'h9f)) ?
                      {reg48} : reg12) ^ reg14)));
            end
        end
      else
        begin
          reg148 <= reg8;
        end
      if (reg32)
        begin
          if ((8'ha8))
            begin
              reg152 <= $unsigned($unsigned((reg139[(3'h4):(3'h4)] <<< ((~|reg22) ?
                  reg26[(2'h3):(1'h0)] : (reg49 | wire2)))));
              reg153 <= reg141[(3'h5):(2'h2)];
            end
          else
            begin
              reg152 <= wire5[(4'hb):(3'h6)];
              reg153 <= $unsigned(reg21[(3'h4):(2'h3)]);
              reg154 <= ((+(-reg10[(3'h7):(1'h1)])) ?
                  (reg39 ?
                      $signed($unsigned((reg8 ?
                          reg146 : reg49))) : reg11[(4'hc):(4'hc)]) : $unsigned($signed((8'ha5))));
              reg155 <= $unsigned((~^$unsigned({(reg21 ? (8'h9c) : reg150)})));
            end
          reg156 <= reg145;
          reg157 <= $signed({$signed(reg145[(1'h1):(1'h0)]), (8'ha3)});
          reg158 <= $signed({$unsigned(($unsigned((8'ha7)) <= (reg47 == reg32)))});
          reg159 <= (&$unsigned(reg29[(4'hc):(4'hb)]));
        end
      else
        begin
          if (wire4[(4'hd):(2'h3)])
            begin
              reg152 <= ((reg48[(1'h1):(1'h0)] ?
                      $unsigned(($unsigned((7'h40)) ?
                          $signed(reg14) : reg29)) : $signed((+(wire53 ?
                          (8'hbe) : (8'hac))))) ?
                  (~|reg40) : wire52[(1'h0):(1'h0)]);
              reg153 <= reg43;
              reg154 <= reg155;
              reg155 <= (^~((({(7'h42)} == (reg142 ? reg149 : reg27)) ?
                  ((reg24 ?
                      wire137 : reg149) - (&reg32)) : (((8'ha1) ^~ reg139) != $signed(reg23))) <= ($signed((8'ha5)) ?
                  ($signed((8'h9e)) >= (reg152 ?
                      reg10 : wire3)) : $signed({reg43}))));
              reg156 <= (|(8'hbc));
            end
          else
            begin
              reg152 <= $unsigned($signed(($unsigned((+reg154)) + reg11[(2'h2):(1'h1)])));
              reg153 <= reg149;
              reg154 <= $unsigned((reg146[(3'h5):(3'h5)] <= ($unsigned({reg9,
                      reg149}) ?
                  $unsigned((reg46 ? reg33 : reg153)) : (^$unsigned(reg15)))));
              reg155 <= $unsigned((|reg150));
              reg156 <= reg154[(2'h2):(1'h1)];
            end
          reg157 <= $signed((reg144 ?
              (~|{$unsigned(reg29)}) : $unsigned((^(reg43 || reg19)))));
          if (($signed({(-(reg146 ^ reg7))}) ?
              {wire53[(2'h3):(1'h1)]} : $unsigned((!$signed((reg33 >= reg43))))))
            begin
              reg158 <= $unsigned(reg18[(3'h4):(1'h0)]);
              reg159 <= $signed((reg157 ?
                  ((!reg19) + ((reg31 ?
                      reg17 : reg20) & $signed(reg150))) : (8'h9e)));
              reg160 <= reg45[(4'h9):(3'h4)];
            end
          else
            begin
              reg158 <= reg12[(1'h1):(1'h0)];
              reg159 <= (-reg147[(4'h8):(1'h0)]);
              reg160 <= reg8;
              reg161 <= (~&(^(-reg31)));
            end
          reg162 <= reg27;
          if ({(&((reg35[(3'h5):(3'h4)] ?
                  reg158 : reg161) ~^ reg37[(3'h4):(2'h3)]))})
            begin
              reg163 <= wire52;
              reg164 <= (~wire52[(2'h2):(1'h0)]);
            end
          else
            begin
              reg163 <= reg152;
              reg164 <= (+reg48[(2'h2):(2'h2)]);
              reg165 <= (|reg164);
              reg166 <= ((((reg46 ?
                          reg156[(2'h3):(1'h1)] : (reg139 ? reg42 : reg39)) ?
                      (^~(|reg11)) : ($unsigned(reg165) ?
                          reg18 : (reg155 ? (8'hbc) : reg165))) < reg26) ?
                  (^({(reg22 <= reg49)} > ((wire53 ~^ wire4) * {wire5}))) : reg142);
            end
        end
    end
  assign wire167 = reg143[(2'h2):(1'h0)];
  assign wire168 = (reg21[(1'h1):(1'h0)] <= $unsigned($signed(reg47)));
endmodule

module module55
#(parameter param136 = ((8'ha3) ? (^((^~{(7'h43), (7'h40)}) ? (&((7'h44) != (8'hb2))) : (|(|(8'ha5))))) : ((((~^(8'hae)) ? (~(8'ha6)) : ((8'ha7) ? (8'hbf) : (7'h43))) ^~ (~&((7'h42) ^ (8'ha8)))) ? ((!((8'hb9) <<< (7'h41))) ? (^(^(8'hb3))) : (&((8'ha8) ? (8'hab) : (8'ha0)))) : (~^(((8'ha1) ^~ (8'ha0)) == {(8'hb3)})))))
(y, clk, wire56, wire57, wire58, wire59);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire56;
  input wire signed [(4'hf):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire58;
  input wire [(5'h13):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire [(4'hd):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire126;
  reg [(4'ha):(1'h0)] reg135 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire86,
                 wire88,
                 wire89,
                 wire126,
                 reg135,
                 (1'h0)};
  module60 #() modinst87 (.wire61(wire57), .clk(clk), .wire62(wire56), .wire64(wire59), .wire63(wire58), .y(wire86));
  assign wire88 = $signed($unsigned($unsigned($unsigned($signed(wire58)))));
  assign wire89 = (($signed($unsigned(wire59[(1'h1):(1'h0)])) >= wire58) << ($signed(((wire58 ?
                              wire57 : wire57) ?
                          $signed(wire88) : wire86[(4'h9):(1'h1)])) ?
                      (wire59[(3'h5):(1'h1)] ?
                          wire58[(2'h3):(2'h3)] : {wire59[(4'hb):(1'h0)],
                              (wire86 ?
                                  wire59 : wire58)}) : {(wire58[(1'h1):(1'h1)] ?
                              (wire59 ?
                                  wire59 : (8'hae)) : wire57[(4'he):(3'h6)]),
                          {wire56[(4'h8):(2'h2)]}}));
  module90 #() modinst127 (.wire95(wire56), .wire94(wire58), .y(wire126), .wire91(wire88), .wire92(wire57), .wire93(wire89), .clk(clk));
  assign wire128 = wire126;
  assign wire129 = $signed(wire89);
  assign wire130 = ($unsigned(($unsigned((wire86 != wire88)) ?
                           {$signed(wire89)} : ((wire57 ?
                               (8'ha4) : wire58) >>> $signed(wire57)))) ?
                       wire57[(2'h2):(1'h0)] : (~&(^wire57)));
  assign wire131 = $unsigned($signed((($unsigned(wire89) | (wire130 <<< wire128)) <<< wire57[(4'hb):(2'h3)])));
  assign wire132 = wire58[(3'h7):(3'h6)];
  assign wire133 = wire89[(1'h1):(1'h1)];
  assign wire134 = (^~(&(~|((wire131 * wire89) >= (|wire133)))));
  always
    @(posedge clk) begin
      reg135 <= $signed(wire126);
    end
endmodule

module module90
#(parameter param125 = {(~(-(((7'h40) ? (8'ha3) : (8'hb4)) ? (8'ha0) : (&(8'hb3)))))})
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire95;
  input wire [(5'h14):(1'h0)] wire94;
  input wire [(5'h15):(1'h0)] wire93;
  input wire signed [(4'hd):(1'h0)] wire92;
  input wire signed [(5'h13):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  reg [(3'h4):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire105,
                 wire104,
                 wire102,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
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
                 reg103,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire96 = (~^$unsigned(wire91));
  assign wire97 = $signed({wire91[(5'h11):(4'h9)], wire96});
  assign wire98 = $unsigned((wire96 ~^ $signed(wire94)));
  assign wire99 = wire93;
  always
    @(posedge clk) begin
      reg100 <= ((^~$unsigned($signed($signed(wire95)))) ?
          wire95[(3'h6):(3'h6)] : wire94[(3'h7):(3'h4)]);
      reg101 <= (^(((^wire98[(2'h3):(1'h1)]) >>> (^~(wire97 >>> wire99))) > ($unsigned($unsigned(wire91)) & $unsigned({(8'ha4)}))));
    end
  assign wire102 = ($unsigned((wire99 * ((reg101 ?
                       wire94 : (7'h43)) << wire91[(4'he):(4'he)]))) | wire91[(4'ha):(3'h7)]);
  always
    @(posedge clk) begin
      reg103 <= (!$unsigned((wire98 ?
          (wire95 ? $signed((8'ha0)) : wire94) : (+{wire102, wire93}))));
    end
  assign wire104 = $signed(wire94[(3'h7):(3'h6)]);
  assign wire105 = wire104[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg106 <= wire98[(1'h1):(1'h1)];
      reg107 <= (((~(8'hbe)) != wire98) ?
          ({$signed(wire105[(4'he):(2'h2)]), reg103[(2'h3):(1'h1)]} ?
              $signed((wire95[(3'h4):(2'h3)] >= (reg100 - wire93))) : ($unsigned((wire92 || wire99)) ?
                  $signed($signed(reg103)) : (wire94[(2'h3):(2'h2)] && wire98[(1'h0):(1'h0)]))) : $unsigned(((wire102 ?
                  wire102[(1'h0):(1'h0)] : wire96) ?
              reg103[(1'h1):(1'h0)] : {$unsigned(wire94), wire91})));
      if (wire92[(3'h6):(2'h3)])
        begin
          if (wire97)
            begin
              reg108 <= {$unsigned({reg100, $unsigned((wire98 + wire102))}),
                  $unsigned(reg107[(5'h14):(2'h3)])};
              reg109 <= ((wire91[(5'h11):(5'h10)] & $unsigned(((wire97 > wire95) || wire95))) ?
                  ({wire104, (~|(|wire99))} ?
                      (reg100 * ((~&wire97) ?
                          (8'hae) : reg101)) : $signed(wire95[(4'h8):(3'h6)])) : wire94);
              reg110 <= wire99[(3'h6):(1'h1)];
              reg111 <= ({$signed($signed($unsigned((8'ha4))))} ?
                  ((wire97[(2'h2):(1'h1)] | ($unsigned(reg100) ?
                          $unsigned(wire99) : ((8'ha3) ? wire97 : wire92))) ?
                      wire97[(1'h0):(1'h0)] : $signed({(|wire97)})) : (wire93[(2'h3):(2'h3)] < (~|(wire95 << wire95))));
              reg112 <= (^$unsigned((reg108[(1'h0):(1'h0)] ?
                  (((8'ha7) ~^ wire104) ?
                      $signed(reg101) : (reg103 ?
                          reg111 : (7'h43))) : wire102[(2'h2):(2'h2)])));
            end
          else
            begin
              reg108 <= $signed(((7'h44) && ((^$signed(reg100)) ?
                  (8'hbe) : reg112[(4'h9):(3'h4)])));
              reg109 <= $signed(((&{reg106[(2'h2):(1'h0)],
                  wire99[(4'h9):(4'h9)]}) == reg100));
              reg110 <= ($unsigned($signed(reg103[(2'h2):(2'h2)])) || reg106[(3'h4):(3'h4)]);
              reg111 <= wire99;
              reg112 <= $unsigned((($signed(reg108) ?
                      ((wire96 ? reg100 : wire102) ?
                          wire95 : (reg107 ^ reg107)) : $unsigned(reg111)) ?
                  wire98 : wire99[(4'h9):(3'h6)]));
            end
          reg113 <= $signed((^$signed($unsigned((reg106 != wire104)))));
          reg114 <= reg111;
          reg115 <= reg113[(3'h6):(1'h0)];
          reg116 <= $unsigned(reg100[(1'h1):(1'h0)]);
        end
      else
        begin
          reg108 <= wire95;
          reg109 <= wire102[(1'h0):(1'h0)];
        end
      reg117 <= wire96;
      reg118 <= reg103;
    end
  assign wire119 = {(!$unsigned((~|(wire92 && reg117)))),
                       reg107[(4'hb):(1'h1)]};
  assign wire120 = $unsigned((reg117[(3'h6):(2'h3)] ?
                       wire102[(1'h0):(1'h0)] : reg107));
  assign wire121 = {$unsigned(($unsigned($unsigned(reg117)) ~^ (wire105[(4'hd):(4'h9)] ?
                           (^reg111) : $signed(reg117)))),
                       wire97};
  assign wire122 = $unsigned(reg112);
  assign wire123 = ((7'h40) << $unsigned((^~wire98)));
  assign wire124 = ({$signed((~$signed((8'hbc))))} ~^ ({wire122[(2'h3):(2'h2)]} ?
                       (|(~|((8'hb9) ?
                           wire121 : reg109))) : ((~$unsigned(wire122)) ^ $unsigned((|wire104)))));
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire64;
  input wire [(3'h6):(1'h0)] wire63;
  input wire [(5'h10):(1'h0)] wire62;
  input wire [(4'hf):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire65;
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire65,
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
                 (1'h0)};
  assign wire65 = (8'ha5);
  always
    @(posedge clk) begin
      if (wire62)
        begin
          if ((+wire64))
            begin
              reg66 <= wire64;
              reg67 <= $signed($signed((reg66 ?
                  $signed((wire62 ? wire61 : wire65)) : (8'haf))));
            end
          else
            begin
              reg66 <= ((&(^~($signed(wire64) <= $signed((8'had))))) << $signed($signed({(~wire63)})));
            end
          if ({(|wire65)})
            begin
              reg68 <= {{$unsigned((^~$signed((8'hb7))))}};
              reg69 <= (~^$signed($signed((~^((7'h43) + reg66)))));
              reg70 <= ($unsigned({({reg69} ? {reg67} : $signed(wire64))}) ?
                  (wire61[(2'h2):(1'h1)] ?
                      $unsigned(wire65[(2'h3):(2'h2)]) : (($signed(wire65) ~^ $unsigned(reg68)) + $signed((reg69 <= (8'ha4))))) : ((((|wire65) ~^ wire63[(2'h2):(1'h1)]) < $signed(((8'hbd) ?
                          wire64 : wire64))) ?
                      (|reg69[(4'he):(4'hb)]) : $unsigned((8'hb7))));
              reg71 <= (reg68[(3'h5):(2'h3)] >> (reg70[(4'hf):(4'he)] ?
                  ((~&(wire64 ? wire64 : wire64)) ?
                      wire63[(2'h3):(2'h3)] : $signed($signed(reg67))) : (($signed((8'hb1)) != {wire62,
                          reg69}) ?
                      reg66 : ($unsigned((8'hb8)) ?
                          $unsigned((8'ha9)) : (reg69 & reg69)))));
            end
          else
            begin
              reg68 <= reg66[(1'h0):(1'h0)];
              reg69 <= $signed($unsigned((((8'haf) ?
                  wire65 : $signed(reg67)) > $signed((wire61 || reg71)))));
              reg70 <= (($signed((!(-reg66))) ?
                      (({(7'h44)} >>> (reg67 ?
                          wire63 : wire63)) - reg66) : $unsigned($unsigned((reg69 ?
                          reg70 : reg67)))) ?
                  (wire61 >= reg68) : $signed(reg71[(3'h6):(3'h5)]));
              reg71 <= reg67;
              reg72 <= wire61;
            end
        end
      else
        begin
          reg66 <= ((^reg72[(2'h2):(1'h0)]) ?
              $unsigned((|(8'hba))) : $signed($signed(($signed(reg68) ?
                  $unsigned(wire64) : (reg71 ? wire62 : wire61)))));
          if ((7'h40))
            begin
              reg67 <= wire65[(3'h5):(1'h0)];
              reg68 <= reg66[(1'h1):(1'h1)];
              reg69 <= (({$unsigned(reg67),
                  ($signed((8'hbe)) >> (reg72 ?
                      reg72 : wire62))} & {{(^~reg70)}}) * reg69[(4'h8):(1'h0)]);
              reg70 <= wire61;
              reg71 <= ((-wire64) ?
                  wire62[(4'hd):(1'h1)] : ((((^~reg68) ?
                              $unsigned(wire63) : (~&wire63)) ?
                          {$unsigned(reg69)} : {reg66, (~^(8'hb6))}) ?
                      ($signed($signed(reg66)) ?
                          reg66 : $unsigned((~wire63))) : (8'h9f)));
            end
          else
            begin
              reg67 <= $unsigned(((reg67 ^ reg68) << reg72));
              reg68 <= (wire65 ?
                  reg66 : $signed((^~{$signed(wire61), $unsigned(reg70)})));
              reg69 <= reg70[(2'h2):(1'h1)];
            end
          reg72 <= (wire62[(4'hc):(3'h4)] ?
              ((8'h9d) > ((~|{reg69}) ?
                  wire64 : reg67[(4'he):(4'ha)])) : (wire62[(4'h9):(3'h6)] <= reg66[(1'h0):(1'h0)]));
          reg73 <= ((($unsigned((!wire64)) ~^ ($signed(reg72) | $unsigned((8'hbd)))) ?
              {({reg67} - reg72[(2'h2):(2'h2)]),
                  {reg72[(1'h1):(1'h1)]}} : wire63[(3'h5):(1'h0)]) * {(!(|wire65[(5'h12):(4'ha)])),
              (((reg67 ? reg71 : reg67) && (~^wire64)) ^ (8'ha6))});
          reg74 <= reg68[(3'h6):(2'h3)];
        end
      reg75 <= $unsigned(reg73);
      reg76 <= ($unsigned(($unsigned((reg71 | wire62)) | (-$signed(reg69)))) > (reg69 ^ {(-$unsigned(wire61))}));
      reg77 <= wire62[(4'he):(4'hb)];
      reg78 <= wire63;
    end
  assign wire79 = ((($signed((reg74 | wire63)) ?
                      ($signed(reg77) ?
                          reg71[(4'ha):(3'h5)] : (reg75 ?
                              reg73 : reg71)) : (|$signed(reg77))) != $unsigned($signed($signed(reg70)))) - reg75);
  assign wire80 = $signed($unsigned($signed((((7'h42) >> reg67) >= $signed(wire62)))));
  assign wire81 = ($signed(wire63) < reg78[(2'h2):(1'h0)]);
  assign wire82 = (+$signed({$unsigned(reg72), (^~(wire65 ^ wire64))}));
  assign wire83 = $signed(($unsigned(reg72[(1'h1):(1'h1)]) * (($unsigned(wire64) ?
                      (wire81 ?
                          reg78 : wire79) : (wire61 <<< (8'hb9))) | (+{reg74}))));
  assign wire84 = $unsigned(wire63[(2'h3):(1'h1)]);
  assign wire85 = (~&$signed(wire84[(4'hb):(4'hb)]));
endmodule
