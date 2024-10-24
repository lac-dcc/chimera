module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire5;
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire57,
                 wire5,
                 reg78,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 (1'h0)};
  assign wire5 = {(&wire3[(3'h5):(2'h2)])};
  always
    @(posedge clk) begin
      if (wire2[(5'h12):(4'h8)])
        begin
          reg6 <= $signed({$signed(($unsigned(wire0) ? wire2 : {wire0})),
              wire2[(3'h7):(2'h3)]});
          if (($signed((~&(-(^(8'ha1))))) >= wire2[(4'h8):(3'h5)]))
            begin
              reg7 <= $unsigned({$signed({$signed(reg6), (^~wire0)}),
                  (~&wire0)});
              reg8 <= $signed({(!$signed({wire5, wire1})),
                  wire5[(3'h4):(3'h4)]});
            end
          else
            begin
              reg7 <= (~$unsigned((-(8'hbd))));
            end
        end
      else
        begin
          if ($signed((($signed((reg7 ? (8'hb7) : wire0)) ?
              $unsigned({wire1,
                  wire3}) : $unsigned($signed(reg6))) <= ((^(wire4 >= reg8)) <<< (wire2[(2'h2):(2'h2)] && (~|reg7))))))
            begin
              reg6 <= (reg7 ^~ $unsigned({reg7}));
              reg7 <= reg7[(4'hb):(4'hb)];
              reg8 <= reg6;
              reg9 <= wire1[(3'h5):(3'h4)];
            end
          else
            begin
              reg6 <= reg8;
              reg7 <= $signed(reg7);
              reg8 <= $unsigned(wire3);
              reg9 <= ((wire3 ^ $unsigned(wire1)) >>> (8'hbf));
              reg10 <= (&(|($unsigned($unsigned(wire3)) ?
                  ((reg6 >= (8'hb5)) ^~ $unsigned(wire4)) : $unsigned($unsigned(reg8)))));
            end
          reg11 <= reg8;
          if (((|(|$signed((^~(8'hb4))))) || reg8[(1'h0):(1'h0)]))
            begin
              reg12 <= wire5;
              reg13 <= $signed(((!reg12) < ($unsigned((^~reg7)) ?
                  wire3[(1'h0):(1'h0)] : wire5[(2'h3):(2'h3)])));
            end
          else
            begin
              reg12 <= wire2;
              reg13 <= $signed($signed(($signed(wire3[(2'h3):(2'h2)]) & (~^$signed(reg10)))));
              reg14 <= (reg8[(3'h7):(3'h6)] ^~ $signed((-(~&((7'h43) != wire1)))));
              reg15 <= {$unsigned(wire4[(2'h3):(1'h1)])};
              reg16 <= ($signed(((+(-reg13)) ?
                      $unsigned((+wire1)) : reg12[(1'h1):(1'h1)])) ?
                  (({$unsigned((8'h9e))} - wire3) ?
                      (|((reg15 ? (8'hae) : reg9) ?
                          $unsigned(reg8) : (reg9 ^ wire3))) : (~&$signed((reg15 ?
                          reg10 : reg6)))) : {wire2[(3'h5):(3'h5)],
                      (wire5 ^ (wire0 ?
                          reg10[(3'h5):(3'h4)] : $unsigned(wire5)))});
            end
        end
      reg17 <= $unsigned((&(reg14 ? $unsigned((~wire3)) : reg8)));
      if ($unsigned($unsigned(reg6[(3'h4):(2'h2)])))
        begin
          reg18 <= reg12;
          reg19 <= wire4;
          reg20 <= {{$signed(reg10)}};
          if ($unsigned((($unsigned($signed(reg10)) ?
              (-wire1) : wire0[(1'h1):(1'h0)]) * $signed((-(reg16 ?
              (8'ha0) : reg19))))))
            begin
              reg21 <= wire1;
              reg22 <= reg16[(5'h11):(2'h2)];
            end
          else
            begin
              reg21 <= reg14[(4'h8):(1'h0)];
              reg22 <= wire2;
              reg23 <= ((+$signed(($unsigned(reg9) ?
                      ((8'hbc) ? reg10 : wire4) : (&reg22)))) ?
                  $unsigned(($unsigned({reg11}) == (~^$signed(reg10)))) : ((~^(|(~reg8))) <= $unsigned(reg8)));
            end
        end
      else
        begin
          if ((8'ha9))
            begin
              reg18 <= $unsigned((reg11[(3'h5):(3'h4)] ?
                  {$signed((7'h41))} : ((^{wire2}) ?
                      (^$signed(reg18)) : {$unsigned(reg7)})));
            end
          else
            begin
              reg18 <= (~|wire2[(2'h2):(1'h1)]);
              reg19 <= $signed({(reg20 || reg13[(3'h4):(1'h1)])});
            end
          reg20 <= $signed(reg6[(2'h3):(1'h0)]);
        end
      reg24 <= $unsigned(wire4);
      if ((~^$unsigned($unsigned($signed($unsigned((8'hb3)))))))
        begin
          reg25 <= reg9[(1'h1):(1'h1)];
        end
      else
        begin
          reg25 <= (wire3 <<< $unsigned(((^$unsigned(reg15)) ?
              $unsigned((reg14 | reg16)) : ($signed(reg11) > reg19[(4'hb):(4'h8)]))));
        end
    end
  module26 #() modinst58 (wire57, clk, reg11, reg21, reg14, reg7);
  assign wire59 = reg23;
  assign wire60 = $unsigned($signed({reg14, $signed($unsigned((8'hb0)))}));
  assign wire61 = reg23[(3'h4):(1'h1)];
  assign wire62 = (^~($signed(($unsigned(wire61) >> reg12[(1'h1):(1'h0)])) + (!(reg10[(3'h5):(3'h4)] ?
                      wire4[(4'h9):(3'h5)] : (!wire4)))));
  always
    @(posedge clk) begin
      reg63 <= ($signed($signed(wire60)) <<< {wire61});
      if ($unsigned(($signed(wire57[(3'h7):(2'h3)]) & ((reg20[(3'h5):(2'h2)] & $unsigned(wire3)) ?
          {((8'ha0) ? wire62 : reg19)} : (|$unsigned(reg6))))))
        begin
          reg64 <= $signed(reg18);
          reg65 <= reg24;
          reg66 <= wire3;
        end
      else
        begin
          reg64 <= (reg16 & $unsigned(reg66[(3'h6):(1'h0)]));
          reg65 <= $signed((8'hb3));
          if ({(((+(reg15 ? (8'hb1) : reg17)) + ((reg18 && reg15) ?
                  wire4[(3'h4):(2'h3)] : wire3[(2'h2):(1'h0)])) + $signed((reg11[(4'ha):(2'h2)] ?
                  {reg66, wire62} : (reg19 ? (8'ha8) : reg8))))})
            begin
              reg66 <= (reg17 ? $signed(wire57[(3'h6):(3'h4)]) : reg13);
              reg67 <= (reg8[(4'h8):(4'h8)] ?
                  (reg64 ?
                      $unsigned(($signed(reg12) >= $unsigned(wire60))) : $unsigned(reg12[(2'h3):(1'h0)])) : $unsigned((reg24[(3'h6):(3'h4)] ?
                      (((8'hbc) > reg25) ^~ wire60) : reg9)));
              reg68 <= (&reg11);
              reg69 <= reg24[(3'h4):(1'h1)];
              reg70 <= $signed($unsigned($signed($unsigned((reg13 ?
                  wire3 : wire5)))));
            end
          else
            begin
              reg66 <= wire4[(4'he):(1'h0)];
              reg67 <= reg65[(1'h0):(1'h0)];
            end
          reg71 <= (&$unsigned($unsigned($signed(wire0))));
        end
    end
  assign wire72 = wire62;
  assign wire73 = reg24;
  assign wire74 = $unsigned((-reg63));
  assign wire75 = wire73[(4'he):(1'h1)];
  assign wire76 = ($unsigned(reg21[(3'h7):(3'h6)]) ?
                      $signed(reg67) : $unsigned((!reg69)));
  assign wire77 = (reg71[(2'h2):(1'h0)] == (wire2 ?
                      $signed({(wire61 ? wire62 : reg10)}) : (7'h44)));
  always
    @(posedge clk) begin
      reg78 <= ((&reg20[(4'hb):(4'h8)]) && (reg65 ?
          ({(reg16 ^ (8'hae)), $unsigned(reg69)} + (!((8'hb5) ?
              reg8 : wire57))) : $signed($unsigned(reg9[(1'h0):(1'h0)]))));
    end
  assign wire79 = (((wire72 >>> reg21) ?
                          (((&wire76) ? $signed(wire3) : {(8'h9f)}) ?
                              (^(reg22 << reg11)) : $unsigned((^reg70))) : $signed(({reg65,
                              reg13} ^ (~|reg22)))) ?
                      reg23 : (-(wire57 ?
                          ((wire2 ? reg25 : reg65) ?
                              reg17[(1'h0):(1'h0)] : wire62[(4'hd):(1'h1)]) : reg69)));
  assign wire80 = wire4;
  assign wire81 = (!$signed(wire2[(4'h9):(3'h5)]));
  assign wire82 = (reg22 ?
                      ((reg21[(3'h6):(3'h4)] >>> ($signed(reg9) ?
                              (~(8'ha9)) : $signed(wire4))) ?
                          {wire0,
                              ($signed(reg11) ?
                                  $unsigned(reg6) : reg63)} : $signed(reg69[(4'he):(2'h2)])) : $signed(wire4[(4'hc):(3'h5)]));
endmodule

module module26
#(parameter param55 = ({((((8'hbd) >> (7'h41)) != ((8'ha9) <<< (8'hb1))) - (((8'h9e) < (8'hae)) ? (8'hb3) : ((8'ha6) >= (8'hb3)))), {(((8'haf) * (8'ha0)) ? ((8'ha4) ? (8'h9f) : (8'hbb)) : {(8'ha0)}), (((8'ha9) ? (8'ha0) : (8'ha2)) >>> {(8'h9d), (7'h44)})}} ? (8'ha7) : {(~^(~((8'ha0) << (8'haf))))}), 
parameter param56 = (+{{param55}}))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
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
                 (1'h0)};
  assign wire31 = wire29;
  assign wire32 = (((~$signed($signed(wire30))) ?
                      (8'ha2) : ($signed((~^wire29)) << ($unsigned(wire28) ?
                          (wire31 ?
                              wire31 : (8'hbd)) : wire31[(5'h13):(5'h10)]))) >= wire27);
  assign wire33 = (wire29[(3'h6):(3'h6)] == (wire30 ?
                      $signed($unsigned((~|wire28))) : (($unsigned(wire29) >> wire28[(4'hc):(4'hb)]) ~^ (~(&(8'hbb))))));
  assign wire34 = wire28;
  always
    @(posedge clk) begin
      reg35 <= (wire30[(4'hc):(3'h6)] && $unsigned(wire28[(3'h7):(2'h3)]));
      reg36 <= ((($unsigned((wire31 ? reg35 : wire28)) >= wire27) ?
              wire33 : ($unsigned({wire30}) || wire31)) ?
          (~|wire27) : (wire29[(4'he):(4'hd)] & (wire28[(3'h7):(1'h0)] ?
              ((wire31 << (8'ha1)) ?
                  $unsigned(wire29) : ((8'h9c) ? wire32 : wire27)) : (+(wire33 ?
                  (8'ha2) : wire28)))));
      reg37 <= $unsigned($unsigned(({$signed(wire33), (wire27 == reg35)} ?
          wire34 : wire30[(2'h3):(1'h0)])));
      if ((~(+wire29)))
        begin
          if ({((8'ha3) ?
                  ($signed((reg35 ~^ (8'h9f))) ?
                      {$signed((8'ha6)),
                          (wire33 ? wire32 : wire30)} : ((7'h43) ?
                          wire27 : (reg37 >>> wire28))) : (($unsigned(reg35) ?
                          (wire32 ? wire34 : (7'h41)) : (reg37 ?
                              wire30 : (8'hb7))) ?
                      (8'hb5) : ((~^reg35) && wire30))),
              (wire29[(2'h2):(1'h0)] != ((wire34[(4'hf):(3'h7)] >> $unsigned(reg35)) ?
                  {(^~(8'hab))} : (wire33[(2'h3):(2'h3)] ?
                      $signed((8'ha0)) : (&reg35))))})
            begin
              reg38 <= (&({$signed(wire27[(1'h0):(1'h0)])} ?
                  wire32[(3'h7):(1'h1)] : ((|(reg37 ? wire31 : wire28)) ?
                      ($unsigned(wire30) ?
                          reg36 : reg37[(2'h2):(1'h1)]) : $unsigned((^reg37)))));
              reg39 <= $unsigned(wire29);
              reg40 <= reg35[(1'h0):(1'h0)];
              reg41 <= $signed(wire28);
              reg42 <= (~&$signed((~(~&(wire33 * wire34)))));
            end
          else
            begin
              reg38 <= wire31[(4'hf):(3'h7)];
              reg39 <= (((-$signed(wire29[(1'h1):(1'h1)])) << (~^($signed(reg42) + (reg40 << reg41)))) ?
                  (|(($signed((8'hba)) ?
                      (wire31 ?
                          (8'hb6) : reg40) : $unsigned(reg36)) && ($unsigned(wire30) == (8'hb7)))) : $unsigned($unsigned(wire31[(4'hc):(2'h2)])));
              reg40 <= $unsigned($unsigned({reg37[(2'h2):(1'h0)],
                  (wire29 ? wire33 : {wire32, wire31})}));
            end
          reg43 <= reg36;
          if (($unsigned(wire27[(4'h8):(2'h2)]) ?
              ((~|{$signed(reg35)}) > $unsigned($unsigned(wire29))) : (wire32[(3'h7):(1'h0)] & (+(reg43[(3'h6):(2'h2)] & {(7'h42)})))))
            begin
              reg44 <= (((~^$unsigned({reg40, reg35})) ~^ (8'hb2)) ?
                  wire31[(2'h2):(1'h0)] : (8'haa));
              reg45 <= (($unsigned(reg43[(1'h0):(1'h0)]) * (7'h44)) ~^ (+reg44[(1'h1):(1'h1)]));
            end
          else
            begin
              reg44 <= wire31[(3'h7):(2'h2)];
              reg45 <= reg40;
              reg46 <= (reg40 ?
                  (((reg44 ? (^~wire34) : wire29) ?
                      wire30[(5'h10):(1'h0)] : ((+(8'ha5)) | $unsigned(reg36))) ^ $unsigned(((reg36 ?
                      reg40 : wire29) ~^ $signed(reg35)))) : reg37);
              reg47 <= (($unsigned(reg38) ?
                      $unsigned($unsigned(reg41[(4'h9):(4'h9)])) : (((reg43 ^~ reg42) > {reg46}) ?
                          $unsigned($unsigned((8'had))) : ((wire33 ?
                              reg45 : reg40) * reg38[(4'hc):(2'h3)]))) ?
                  ($signed($signed((reg42 ^~ (8'hb0)))) ^ ($unsigned({reg46}) || (reg36[(4'hc):(3'h7)] << $signed(wire31)))) : $signed($unsigned($signed(wire34[(4'he):(1'h1)]))));
              reg48 <= $signed((((-(^(8'ha3))) <= (|reg39[(3'h6):(1'h0)])) ?
                  wire34[(3'h5):(3'h5)] : wire29[(4'hc):(4'h8)]));
            end
          reg49 <= $unsigned((8'ha9));
        end
      else
        begin
          reg38 <= $unsigned(($signed($signed(((8'ha0) != reg40))) < ((8'hb4) ?
              wire28 : $unsigned((wire31 ? reg40 : wire30)))));
          if (reg37[(2'h3):(1'h0)])
            begin
              reg39 <= $signed(wire29[(4'hb):(3'h5)]);
              reg40 <= $signed((8'hac));
              reg41 <= $signed((-(~((!reg37) ?
                  (wire29 ^~ wire30) : wire29[(3'h7):(2'h3)]))));
              reg42 <= wire28[(1'h0):(1'h0)];
              reg43 <= ($unsigned(reg35) ?
                  (reg37[(2'h3):(1'h0)] + $signed({reg46[(3'h7):(1'h0)]})) : (((+{reg45,
                              (7'h43)}) ?
                          $signed($signed(reg40)) : (reg46[(2'h2):(2'h2)] || $signed(wire33))) ?
                      $signed(wire32[(3'h5):(1'h0)]) : (reg39 ?
                          (+(8'hb9)) : reg38[(4'hb):(1'h1)])));
            end
          else
            begin
              reg39 <= $signed((8'haf));
              reg40 <= ($unsigned($unsigned((~|$signed(reg37)))) ?
                  ($signed({(wire34 >> reg36),
                      $signed(reg45)}) || reg38) : $unsigned((^~(reg37 > reg45[(1'h0):(1'h0)]))));
              reg41 <= (reg42[(2'h2):(1'h0)] == (^~$unsigned((reg46[(1'h1):(1'h0)] ?
                  (8'hb7) : (~|reg47)))));
              reg42 <= {reg48[(2'h2):(1'h1)]};
              reg43 <= $signed($signed({(~|(reg43 ? wire31 : (8'haa))),
                  (8'ha4)}));
            end
        end
      reg50 <= $unsigned($unsigned(($unsigned($unsigned(reg46)) ?
          ((wire30 ^ (8'h9d)) || $unsigned(wire29)) : {$signed(reg39),
              {reg43, wire31}})));
    end
  assign wire51 = reg36;
  assign wire52 = {wire30[(4'hd):(4'h8)],
                      $signed($unsigned(((~^reg45) > (8'ha4))))};
  assign wire53 = reg47[(3'h7):(1'h0)];
  assign wire54 = $signed(($unsigned(reg49) ?
                      (~^$signed((reg36 ?
                          reg35 : reg39))) : $unsigned($unsigned(reg39))));
endmodule
