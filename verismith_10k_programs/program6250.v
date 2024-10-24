module top
#(parameter param83 = (&((((~&(8'hb8)) ? ((8'hb9) ~^ (8'ha3)) : ((8'ha0) >= (8'ha0))) ? (((8'hb9) ? (8'hb5) : (8'hb4)) > ((8'ha7) ? (8'hbf) : (8'hba))) : ((+(8'ha5)) + {(8'hbb), (8'hb1)})) ? (((8'ha2) ? ((8'hb8) - (7'h42)) : ((8'hab) ? (8'ha7) : (8'hb9))) > (((8'haf) ? (8'hbe) : (8'ha9)) ? ((7'h40) << (8'ha4)) : (^~(8'h9c)))) : (~^(-(8'hbb))))), 
parameter param84 = (~|((((param83 ? param83 : param83) ? param83 : param83) ? (~|(param83 ? param83 : param83)) : (7'h40)) ? (param83 ? (~^param83) : ((param83 ^ param83) ? param83 : {(8'hb4)})) : (((param83 << param83) ? param83 : {param83, (8'had)}) < (~^{param83, param83})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (wire2 && wire2[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg5 <= $signed((wire2[(1'h0):(1'h0)] ?
          (wire0 ? wire2 : (~&wire1[(1'h0):(1'h0)])) : $signed((8'ha4))));
      if (((wire1[(2'h3):(2'h3)] ?
          (7'h40) : wire2[(1'h1):(1'h0)]) * ($signed($signed(wire1)) && ((&(wire2 & (8'haf))) ?
          $unsigned(((8'hb8) >>> (8'hac))) : (reg5[(4'ha):(1'h1)] ?
              wire2[(2'h2):(2'h2)] : (wire0 ? wire2 : wire1))))))
        begin
          reg6 <= (-(^~((~^$unsigned(wire1)) <<< ((~^wire2) ?
              (wire1 > wire1) : {(8'hab)}))));
          reg7 <= $signed($signed(wire1));
          reg8 <= ((~&(-(reg7[(4'ha):(1'h0)] > (8'hbf)))) > $signed($signed((~$unsigned(wire4)))));
        end
      else
        begin
          reg6 <= $unsigned(wire0[(3'h6):(1'h1)]);
          reg7 <= (reg8[(4'hb):(3'h4)] ? (~|reg5) : reg6);
          if ((wire1 ~^ $unsigned(reg6[(3'h4):(1'h1)])))
            begin
              reg8 <= (^~(wire3 ? (reg6 ~^ (~^$unsigned((8'hb0)))) : wire3));
            end
          else
            begin
              reg8 <= $signed(wire4[(4'hb):(2'h3)]);
              reg9 <= wire0;
              reg10 <= ((reg5 > $signed((-{wire1}))) << (wire0 ?
                  (~^(!(~&wire3))) : (~&reg8[(1'h1):(1'h1)])));
              reg11 <= wire4;
              reg12 <= {$signed(reg7)};
            end
          reg13 <= $unsigned(((~{(reg6 ? reg8 : reg7),
              (8'ha3)}) ^ $unsigned(($unsigned(reg12) ?
              $unsigned((8'h9e)) : (wire0 ^~ reg7)))));
        end
      if ($signed(({reg7} ?
          ($unsigned((reg5 ? reg6 : reg7)) << ((8'hbe) ?
              {reg8, wire0} : $unsigned(reg6))) : (((reg13 ? reg8 : reg6) ?
                  $unsigned(reg12) : reg12[(4'ha):(1'h0)]) ?
              {(reg6 ? (7'h42) : reg13)} : $signed($signed(reg6))))))
        begin
          reg14 <= $unsigned($unsigned(reg12[(4'h8):(3'h5)]));
          reg15 <= ((~^(8'ha4)) ? reg7[(3'h7):(1'h0)] : reg10[(3'h4):(1'h1)]);
          if ($signed($unsigned(reg13[(3'h4):(2'h3)])))
            begin
              reg16 <= (8'hbc);
              reg17 <= $signed($unsigned((~^$signed({wire2, reg5}))));
              reg18 <= reg16;
            end
          else
            begin
              reg16 <= reg7;
              reg17 <= $signed($signed({wire4[(3'h6):(2'h2)]}));
            end
          reg19 <= $signed(reg18[(1'h0):(1'h0)]);
        end
      else
        begin
          reg14 <= {wire3};
          if (reg18)
            begin
              reg15 <= $signed($unsigned({{$unsigned((8'hb8)), (!reg9)}}));
              reg16 <= (+((~^({reg14} ?
                  (reg14 > reg15) : reg14[(4'hc):(2'h3)])) ^ $signed($unsigned((^wire1)))));
            end
          else
            begin
              reg15 <= reg11;
            end
          if ((~($unsigned((+$signed(reg9))) | wire2)))
            begin
              reg17 <= {reg16};
            end
          else
            begin
              reg17 <= wire3;
            end
        end
    end
  module20 #() modinst79 (wire78, clk, reg8, reg7, reg9, reg14);
  assign wire80 = $signed({(+reg10[(1'h0):(1'h0)])});
  assign wire81 = (&$unsigned(reg18));
  assign wire82 = {$unsigned($signed(reg15[(2'h2):(2'h2)])),
                      (wire0[(4'h9):(1'h1)] ?
                          ($signed($unsigned(reg16)) & wire1) : reg18)};
endmodule

module module20
#(parameter param76 = ((((-((7'h44) == (8'haf))) & (((8'hb6) != (8'haa)) > ((8'hb1) <= (7'h41)))) ? (~&(~|((8'hb5) ^~ (8'haf)))) : ((~&((8'hb1) && (8'hb8))) ? (((8'ha2) ? (8'h9c) : (8'haa)) ? ((8'hb2) ? (8'h9e) : (8'ha6)) : {(8'hbb), (8'hba)}) : (((8'ha5) ? (8'ha6) : (8'hb8)) || ((8'haf) || (8'hb7))))) < ((8'ha3) ? (8'hab) : {(~|(8'h9e))})), 
parameter param77 = ({param76, (param76 ^ param76)} >>> param76))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  assign y = {wire75,
                 wire59,
                 wire58,
                 wire38,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire25 = (wire23 ? $unsigned((8'hb2)) : wire23);
  assign wire26 = $unsigned((wire24[(3'h6):(3'h6)] ? (+wire25) : (8'h9f)));
  assign wire27 = (^$unsigned(((&(wire26 ? wire21 : wire23)) << ({wire23,
                      wire24} | wire24))));
  assign wire28 = $unsigned((wire27[(3'h7):(3'h7)] ?
                      $signed(wire24) : {$unsigned((~&(8'ha5)))}));
  assign wire29 = (8'ha6);
  assign wire30 = $unsigned(wire28);
  assign wire31 = wire26;
  assign wire32 = wire27[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg33 <= wire24[(4'hc):(3'h7)];
      reg34 <= $unsigned(wire29[(2'h3):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg35 <= (8'ha5);
      reg36 <= wire24[(2'h2):(1'h0)];
      reg37 <= ((wire27 ?
          reg36 : $unsigned($signed((8'ha1)))) & $unsigned((wire29[(2'h2):(1'h1)] && reg35)));
    end
  assign wire38 = wire22[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      reg39 <= $signed(($signed({(wire38 != wire29)}) ?
          ({(^~wire26)} ?
              (wire27[(3'h7):(1'h0)] ?
                  $signed(reg33) : (wire26 ?
                      wire21 : (8'ha3))) : wire32[(1'h0):(1'h0)]) : $unsigned($signed(wire23))));
      reg40 <= $signed((~&((wire24 ? (wire26 ? wire24 : wire32) : (^wire28)) ?
          reg35 : $unsigned((wire25 ~^ wire32)))));
      if ($signed(wire21))
        begin
          reg41 <= reg39[(4'h8):(2'h2)];
          reg42 <= $unsigned(reg35);
          if ($unsigned(($signed((8'haf)) ^ (reg35 & ((8'hb5) <<< (8'hbd))))))
            begin
              reg43 <= wire24[(4'h8):(3'h7)];
              reg44 <= (-((wire28 * {(&reg43), (wire30 ? reg35 : reg42)}) ?
                  (reg33 ^~ (wire24 >>> $signed(wire22))) : $signed($signed({wire23,
                      (8'ha6)}))));
              reg45 <= ({reg44} ?
                  (-wire29[(1'h1):(1'h0)]) : $signed($signed(wire26[(1'h0):(1'h0)])));
              reg46 <= (~^reg36[(3'h7):(3'h5)]);
              reg47 <= $signed($unsigned(((|(wire21 ?
                  reg34 : reg44)) ~^ $unsigned(((7'h41) ? reg41 : wire25)))));
            end
          else
            begin
              reg43 <= (((($signed(wire30) ? (~|reg34) : $signed((8'hb2))) ?
                          wire30[(2'h3):(1'h1)] : (~|wire28)) ?
                      wire28[(3'h6):(2'h3)] : ($signed(reg33) ?
                          {$signed(reg33)} : ({reg37,
                              wire30} && $signed(wire30)))) ?
                  $signed(((~wire32) < (^~reg35[(4'ha):(2'h2)]))) : $signed(reg45));
            end
          reg48 <= reg35[(5'h12):(1'h0)];
        end
      else
        begin
          if (reg33[(1'h0):(1'h0)])
            begin
              reg41 <= wire30[(2'h3):(1'h1)];
              reg42 <= wire31;
              reg43 <= (($signed(($unsigned(wire30) >= ((8'ha4) < wire28))) < $unsigned((wire21 << wire32))) == ($unsigned($unsigned({wire23,
                      wire21})) ?
                  (~(reg37[(3'h6):(3'h6)] & $signed(reg44))) : reg42[(2'h2):(1'h1)]));
            end
          else
            begin
              reg41 <= ($unsigned($signed({(reg34 | wire23)})) ?
                  $unsigned($signed({$unsigned(reg47)})) : (reg44[(2'h2):(1'h0)] >>> ((reg46[(1'h1):(1'h1)] ?
                      reg40[(3'h7):(3'h5)] : $signed(reg40)) >>> wire26)));
              reg42 <= reg37;
            end
          if ($signed($signed($signed($unsigned((-(8'hac)))))))
            begin
              reg44 <= {$unsigned(reg48), reg39};
              reg45 <= (+$unsigned(wire32));
              reg46 <= (~&reg41[(2'h2):(1'h0)]);
              reg47 <= (reg37 ?
                  wire30[(2'h2):(2'h2)] : (reg36 && $unsigned(wire28)));
            end
          else
            begin
              reg44 <= $signed(wire26);
              reg45 <= $unsigned((reg45 ?
                  reg43[(4'h8):(3'h6)] : (|$unsigned(reg48[(4'h8):(4'h8)]))));
              reg46 <= $signed($unsigned((reg36[(2'h3):(1'h1)] << {((8'hba) ?
                      (8'h9d) : (8'ha4))})));
            end
          reg48 <= wire24[(3'h7):(2'h2)];
          if (wire31[(4'h8):(1'h1)])
            begin
              reg49 <= wire22[(4'hb):(3'h7)];
              reg50 <= ((!wire28[(4'hd):(4'hb)]) ?
                  {(wire22 ?
                          {$signed(wire26)} : {$unsigned(wire27),
                              {wire22, wire31}})} : ((wire24 ?
                          $unsigned(reg49) : ({reg49} == (8'hb1))) ?
                      reg49 : wire29));
              reg51 <= (~|$signed(($signed(reg36[(2'h2):(2'h2)]) ?
                  (reg37[(4'ha):(3'h5)] & ((8'ha3) ? reg46 : reg33)) : reg40)));
              reg52 <= (!({$unsigned((wire32 ?
                      (8'had) : wire21))} & {(~&(reg36 < (8'hbf))),
                  {wire21, (~&reg48)}}));
              reg53 <= $unsigned((!wire26[(2'h2):(1'h1)]));
            end
          else
            begin
              reg49 <= reg50;
              reg50 <= reg46;
              reg51 <= $signed($signed((&(wire28[(4'hf):(3'h4)] >> $signed((8'hb9))))));
              reg52 <= $signed($unsigned($signed($unsigned((wire28 ?
                  wire22 : wire38)))));
              reg53 <= {((~(8'ha1)) > reg43)};
            end
          if (($signed(reg34[(3'h4):(3'h4)]) ?
              $unsigned((~&({wire22,
                  reg33} + (8'haf)))) : $signed($unsigned(reg33))))
            begin
              reg54 <= $signed((reg43[(3'h6):(2'h2)] ?
                  (~|reg52[(4'h9):(3'h5)]) : (-((^~reg41) < $unsigned(wire27)))));
              reg55 <= $unsigned(wire26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg54 <= ((^~wire24[(3'h7):(3'h7)]) ^~ $signed({$signed($signed(wire25)),
                  ($signed(wire23) ?
                      wire24[(4'hf):(2'h2)] : $unsigned(reg47))}));
              reg55 <= reg33[(3'h4):(3'h4)];
            end
        end
      reg56 <= (wire21[(2'h2):(1'h0)] >> reg49[(1'h1):(1'h0)]);
      reg57 <= $signed($unsigned(reg35[(5'h10):(2'h3)]));
    end
  assign wire58 = wire29;
  assign wire59 = (({$unsigned((8'hbd)),
                      ({(8'hae),
                          reg44} && $signed(wire25))} == wire31[(4'hf):(4'he)]) == $signed((($unsigned(reg55) ?
                      reg56 : wire32[(3'h6):(3'h5)]) <<< $unsigned((8'hba)))));
  always
    @(posedge clk) begin
      reg60 <= {reg36,
          (({$unsigned(reg40)} ^ ($signed(wire28) ?
              $signed(reg33) : {(8'ha2), reg36})) >> (8'hb5))};
      if (reg56[(4'hb):(4'h9)])
        begin
          reg61 <= reg41[(3'h7):(1'h1)];
          reg62 <= ($unsigned((|(+(reg49 ?
              (7'h41) : reg48)))) != $signed((~(~|reg49[(1'h0):(1'h0)]))));
          reg63 <= wire58;
          reg64 <= $unsigned(($signed((~&$unsigned(wire23))) ?
              $signed((8'hbc)) : wire22));
        end
      else
        begin
          reg61 <= (reg60[(4'h9):(3'h6)] ?
              ($unsigned($signed($signed(reg48))) ?
                  reg39[(4'h9):(4'h8)] : (wire28[(2'h2):(2'h2)] <<< reg48)) : {reg64,
                  {$signed(wire22),
                      ((reg61 ? (7'h42) : reg61) ?
                          (wire21 ? reg62 : wire26) : $unsigned(reg36))}});
          reg62 <= reg43;
          reg63 <= $signed($unsigned(reg41[(3'h5):(1'h0)]));
        end
      reg65 <= $signed($signed((reg41[(4'ha):(3'h5)] + $unsigned((7'h40)))));
      reg66 <= ($signed((!$unsigned($signed((8'hb2))))) - ($unsigned((!(reg57 ?
              reg57 : reg42))) ?
          (($unsigned((8'haf)) ? $signed(wire30) : (reg39 >> reg33)) ?
              (+(^reg48)) : wire28) : {reg33, $unsigned({reg43})}));
      if ($signed($unsigned((^~(~|$signed(reg47))))))
        begin
          reg67 <= (~|(&reg33));
          reg68 <= wire26[(1'h1):(1'h1)];
          if ($unsigned(wire24[(2'h2):(2'h2)]))
            begin
              reg69 <= reg45;
              reg70 <= $unsigned(((reg68 ?
                  reg56[(3'h7):(1'h1)] : reg49) <= ((~|$signed(reg40)) ?
                  $signed(reg47) : reg62[(3'h7):(3'h4)])));
              reg71 <= ({$unsigned((-reg60[(3'h7):(2'h3)]))} >= reg33[(1'h1):(1'h0)]);
            end
          else
            begin
              reg69 <= reg33;
              reg70 <= reg68;
              reg71 <= (reg71[(3'h7):(3'h5)] ^ $unsigned(reg35));
            end
          if (wire23[(2'h2):(1'h1)])
            begin
              reg72 <= (reg61 ? reg53[(3'h6):(1'h0)] : $signed(reg54));
              reg73 <= (~^(reg50 && (wire31[(3'h4):(2'h2)] ?
                  reg44 : $signed((reg54 <= wire59)))));
              reg74 <= {reg72, reg48};
            end
          else
            begin
              reg72 <= wire29;
              reg73 <= $signed((~&reg50[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg67 <= ($signed((reg33[(1'h1):(1'h1)] ?
              $signed(reg69[(2'h3):(2'h3)]) : $signed((8'ha0)))) + (((wire31[(4'hb):(2'h3)] ?
              (reg57 >>> reg49) : {reg51,
                  (8'ha5)}) == $unsigned($unsigned(reg36))) ^ wire27));
        end
    end
  assign wire75 = (-(((&wire31[(3'h6):(1'h0)]) - $unsigned(reg42)) - ({(8'hbf)} > $signed($unsigned((8'hab))))));
endmodule
