module top
#(parameter param45 = (((((~|(7'h41)) ~^ (~(8'h9f))) & (((8'ha3) ? (8'hb0) : (8'haf)) <= ((7'h43) ? (8'ha4) : (7'h40)))) ? (((~&(8'hb8)) ? {(7'h43), (8'hac)} : {(8'hb6), (8'hba)}) ? {((8'hb6) == (8'h9e)), ((8'hbc) >> (8'haa))} : {((8'hac) ? (7'h41) : (7'h42)), ((8'hbd) ? (8'hae) : (8'hb8))}) : ((~&(^~(7'h43))) != ({(8'haa), (8'ha9)} - (-(8'h9d))))) < {({(~&(8'h9e))} ? (~^((8'h9e) << (8'ha9))) : (8'ha1))}), 
parameter param46 = (param45 >= {(param45 ? (+(param45 & param45)) : ((param45 ? param45 : (8'ha1)) ? (&param45) : (param45 ? param45 : param45)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(2'h2):(1'h0)] reg4 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire29,
                 wire28,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((($signed(wire3) ?
              ($signed(wire2) ?
                  ((wire2 <= (8'ha0)) <<< (wire1 ?
                      wire0 : (8'hb6))) : ({wire2} ?
                      $signed(wire1) : wire2)) : (((|wire3) ?
                      (wire0 ? wire3 : (8'h9c)) : {wire0, wire1}) ?
                  $unsigned((wire3 ?
                      wire2 : wire2)) : ($signed(wire2) && {wire0, wire0}))) ?
          $unsigned((^$unsigned((wire3 ?
              wire3 : wire3)))) : (!$unsigned({(~&wire3), (-wire2)}))))
        begin
          reg4 <= {((8'hb1) ?
                  wire3[(3'h4):(3'h4)] : ($signed($signed((8'hb5))) ^ (-wire0)))};
          reg5 <= wire3[(5'h10):(4'he)];
        end
      else
        begin
          reg4 <= $unsigned($signed(($unsigned($unsigned(wire0)) ~^ (+(wire2 > reg4)))));
          reg5 <= reg4[(1'h1):(1'h1)];
          reg6 <= $unsigned($unsigned(((!wire2[(4'ha):(3'h4)]) ?
              $signed((wire1 ? (8'hb0) : reg5)) : wire1[(3'h6):(1'h0)])));
          reg7 <= ($unsigned(wire1[(3'h7):(3'h5)]) ?
              $unsigned((($unsigned((8'hac)) < (~&wire1)) ?
                  ($signed(reg6) ? wire0[(4'he):(3'h5)] : {wire3}) : ((wire1 ?
                      wire3 : wire0) >= (wire1 ? reg4 : reg6)))) : ((reg5 ?
                  reg6[(3'h6):(3'h4)] : ($unsigned((8'hb5)) ~^ (8'haa))) + (~$signed($signed(reg5)))));
          reg8 <= {(^reg5)};
        end
      reg9 <= reg4[(1'h1):(1'h1)];
      if ({wire3,
          ((~($unsigned(reg5) > (8'hba))) >> $unsigned($signed(reg6[(1'h0):(1'h0)])))})
        begin
          if (($signed((&((~^(8'hb5)) ?
              wire1[(4'h9):(2'h2)] : wire3))) >> wire0[(3'h6):(3'h4)]))
            begin
              reg10 <= ((~&(reg8[(3'h6):(1'h0)] ?
                  $signed((reg5 ? reg6 : reg4)) : (|$signed(wire0)))) ^~ wire1);
            end
          else
            begin
              reg10 <= $unsigned(reg6[(3'h4):(2'h2)]);
              reg11 <= reg5[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg10 <= ((($signed(((8'hbe) == wire2)) < $unsigned($signed(wire3))) ^ $unsigned(reg8[(3'h7):(2'h2)])) << reg5[(3'h4):(3'h4)]);
          reg11 <= (~^wire3[(5'h15):(3'h7)]);
          if (({reg5, reg5[(3'h6):(3'h5)]} ?
              $unsigned(reg4[(2'h2):(1'h0)]) : ($signed(($signed(wire0) <<< $signed(reg7))) ?
                  $unsigned(reg9[(4'ha):(3'h5)]) : $unsigned((8'hb5)))))
            begin
              reg12 <= ($unsigned(wire3[(4'h8):(3'h4)]) >>> $unsigned($signed(reg9[(3'h6):(1'h0)])));
              reg13 <= reg10;
              reg14 <= $unsigned(reg10[(4'hd):(2'h2)]);
              reg15 <= {$unsigned($signed((reg11[(3'h5):(1'h1)] ?
                      reg6 : $unsigned(reg10))))};
            end
          else
            begin
              reg12 <= $signed($signed($signed(wire1)));
              reg13 <= (8'hb5);
              reg14 <= reg11[(4'hb):(4'h8)];
            end
          reg16 <= (reg14 >>> (!reg12[(2'h2):(1'h0)]));
          if ((reg10[(3'h5):(2'h2)] ?
              (~&(reg16[(2'h3):(1'h1)] ?
                  reg11 : reg4[(2'h2):(1'h1)])) : (|(reg6[(3'h6):(2'h3)] ?
                  $unsigned($signed(reg4)) : {(wire1 ? reg15 : reg12)}))))
            begin
              reg17 <= reg6[(2'h3):(1'h0)];
              reg18 <= (reg8[(4'h8):(2'h3)] ?
                  (((~^(+reg13)) ^~ $unsigned((^~reg15))) ?
                      reg8[(3'h4):(3'h4)] : $unsigned(reg14[(4'hd):(3'h6)])) : $signed(((|{wire3}) ?
                      reg6 : ((~&reg11) ?
                          (reg14 ? reg5 : reg17) : (~&(8'haa))))));
            end
          else
            begin
              reg17 <= (reg14[(4'hd):(4'hc)] + ((~|(reg14[(4'hb):(3'h4)] ^~ $unsigned(reg14))) >>> {$signed(((8'hbc) ^~ reg10)),
                  (((7'h44) ^ (8'hba)) ? $signed(reg15) : (+(8'ha6)))}));
              reg18 <= (wire2[(2'h2):(1'h1)] != (-reg5[(3'h5):(3'h4)]));
              reg19 <= reg5[(3'h6):(3'h4)];
            end
        end
      if ($signed($signed($signed((&(reg4 ? wire1 : (8'hb4)))))))
        begin
          reg20 <= $signed(reg16[(4'hb):(3'h7)]);
          if (wire3)
            begin
              reg21 <= $signed((reg6[(1'h0):(1'h0)] ?
                  reg8[(1'h1):(1'h1)] : reg19));
              reg22 <= $unsigned($signed(reg5));
              reg23 <= $signed(reg13[(3'h7):(2'h2)]);
            end
          else
            begin
              reg21 <= {$unsigned(({(reg20 > reg9), {reg10, reg19}} < reg14))};
              reg22 <= {$signed(reg22)};
              reg23 <= $unsigned(reg20[(3'h5):(3'h4)]);
              reg24 <= $signed(((^~((wire2 ? wire2 : reg9) > (reg16 ?
                      reg22 : reg9))) ?
                  {$unsigned(wire1),
                      {$unsigned(wire3),
                          ((8'ha5) ~^ reg4)}} : $unsigned(reg19)));
            end
          reg25 <= (~&(&$unsigned(reg14[(4'h8):(3'h4)])));
          reg26 <= ({((8'h9f) ? ((~&reg23) + (8'hae)) : (!(reg10 & reg10)))} ?
              wire2 : reg12[(3'h5):(1'h0)]);
        end
      else
        begin
          reg20 <= reg11;
          reg21 <= ((&$signed(reg25)) ?
              $unsigned($unsigned(((reg25 ? reg19 : reg23) < reg12))) : reg17);
        end
      reg27 <= ((((((8'ha5) ? reg11 : reg8) ?
              (reg4 | reg21) : $signed(reg20)) ~^ $unsigned((reg15 || (8'haf)))) ?
          $signed((reg23[(3'h5):(3'h4)] ?
              $unsigned(reg25) : (+wire3))) : $signed($signed(wire0))) && {$signed((!reg17[(4'h8):(4'h8)]))});
    end
  assign wire28 = ((+(reg24 ?
                          ($unsigned(reg11) - reg25[(3'h4):(1'h0)]) : reg12)) ?
                      (reg4 && ($unsigned((|(8'ha3))) * $signed(reg13[(4'h8):(2'h2)]))) : (reg26 ~^ reg9[(3'h7):(3'h7)]));
  assign wire29 = wire2[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ({(~|(|wire0)), (reg5 & (^~$signed(reg21[(3'h5):(3'h4)])))})
        begin
          reg30 <= (!(($unsigned((reg10 || wire0)) ?
              wire0[(1'h1):(1'h0)] : (8'hb6)) >> (reg23 + reg11[(3'h7):(1'h1)])));
          if ($unsigned(($signed($unsigned((!(8'hbb)))) ?
              reg24 : ((!(+(8'ha7))) ?
                  ($unsigned(wire28) - reg4) : ((reg10 > reg21) ?
                      reg4 : $signed(wire2))))))
            begin
              reg31 <= reg8;
              reg32 <= ($signed(reg19[(3'h4):(2'h3)]) || ((^~((~^reg22) == {wire3})) ?
                  (((wire0 ?
                      reg30 : (8'haa)) << $unsigned(reg17)) ~^ (|(~^reg6))) : reg14[(3'h6):(3'h6)]));
              reg33 <= (((8'hb6) ?
                  reg32 : (((reg11 < reg20) - $signed(reg26)) ?
                      (~$unsigned(wire0)) : $unsigned($unsigned(reg32)))) && $unsigned((8'ha5)));
              reg34 <= $signed(reg17[(4'h9):(4'h8)]);
            end
          else
            begin
              reg31 <= ($unsigned($unsigned(reg31[(4'h8):(3'h5)])) ^~ wire0[(4'ha):(4'h9)]);
              reg32 <= (reg13 ?
                  reg22[(3'h6):(1'h0)] : $unsigned((reg30[(5'h12):(5'h12)] >> (^~(8'ha9)))));
              reg33 <= reg33;
              reg34 <= ((~|$signed(((+reg25) + reg4[(1'h0):(1'h0)]))) ?
                  {reg33[(3'h5):(1'h1)], reg16} : (+{($signed(reg23) ?
                          (wire3 != reg17) : (reg17 ^ reg25))}));
              reg35 <= $unsigned($unsigned($unsigned(((reg4 ~^ reg15) ?
                  (reg9 <= wire0) : reg15))));
            end
          reg36 <= reg4[(1'h0):(1'h0)];
        end
      else
        begin
          reg30 <= (^wire3);
        end
    end
  assign wire37 = {{{((reg33 ? reg31 : wire2) ?
                                  $unsigned(wire28) : (wire29 > reg24)),
                              {(|(8'haf)), $signed(reg27)}},
                          ($signed({(8'ha1), reg9}) != ((reg13 ?
                                  (8'ha7) : (8'ha7)) ?
                              $unsigned(wire0) : (8'ha3)))},
                      (reg12 ?
                          $unsigned(($signed(reg26) <= reg5[(1'h1):(1'h1)])) : {$signed(reg19[(1'h0):(1'h0)]),
                              reg32})};
  assign wire38 = wire29[(3'h5):(1'h1)];
  assign wire39 = {($unsigned(((~^reg19) * (reg35 >>> (8'ha5)))) ?
                          wire1 : $unsigned(reg9))};
  assign wire40 = wire28[(1'h1):(1'h0)];
  assign wire41 = (+(((|(wire28 <= (8'hbd))) | reg13) ?
                      (($unsigned((8'haf)) ?
                          $unsigned(reg6) : {(8'ha1),
                              wire1}) == reg14[(3'h4):(2'h2)]) : wire29));
  assign wire42 = wire41[(2'h2):(1'h0)];
  assign wire43 = ({wire37[(4'h8):(3'h7)]} ?
                      (((((8'haa) ? wire2 : reg15) ^~ (wire39 <= (8'ha1))) ?
                          ((~wire29) ?
                              $unsigned(reg8) : reg13[(1'h1):(1'h0)]) : ($unsigned(reg31) <<< {(8'hb8)})) > ($unsigned(((8'h9d) ?
                          (8'haf) : wire38)) * ({reg7} ^ (reg16 == reg6)))) : ($unsigned((reg22 ?
                          (^reg12) : ((8'hbd) ?
                              wire41 : wire40))) <<< reg17[(3'h5):(3'h5)]));
  assign wire44 = $signed(wire38);
endmodule
