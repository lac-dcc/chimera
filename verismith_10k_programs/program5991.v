module top
#(parameter param169 = (7'h40), 
parameter param170 = param169)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h31f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire154;
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  assign y = {wire168,
                 wire5,
                 wire6,
                 wire30,
                 wire31,
                 wire32,
                 wire44,
                 wire45,
                 wire154,
                 reg167,
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
                 reg28,
                 reg29,
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
                 (1'h0)};
  assign wire5 = (^$signed($signed($unsigned(wire1))));
  assign wire6 = (wire1[(4'hc):(1'h0)] ?
                     wire4[(2'h2):(1'h1)] : (($unsigned($signed(wire3)) ?
                         $signed((wire2 >>> wire1)) : (8'haa)) > (~^$unsigned((wire0 ?
                         wire3 : wire4)))));
  always
    @(posedge clk) begin
      reg7 <= (wire2[(2'h2):(1'h1)] ?
          $signed((wire4[(1'h0):(1'h0)] ?
              wire2 : ($signed(wire0) <= wire3[(4'he):(2'h2)]))) : (({wire0,
                  (wire6 ? wire2 : wire6)} ?
              (8'hac) : $signed($signed((8'h9e)))) || wire5[(2'h2):(1'h0)]));
      if ((wire5 ?
          $unsigned($unsigned({(wire5 << (7'h42)),
              (wire3 ? wire0 : wire5)})) : (~(-((wire0 ? wire0 : wire3) ?
              (wire2 * (8'ha5)) : (wire4 ? (8'hb5) : wire3))))))
        begin
          reg8 <= $unsigned(((-$unsigned(wire6[(3'h5):(3'h5)])) + (~&(reg7[(5'h13):(1'h1)] ?
              ((8'hbb) && reg7) : wire0))));
          reg9 <= wire4[(1'h1):(1'h1)];
          reg10 <= {$unsigned($signed(wire0))};
          if ((~&wire1[(3'h7):(1'h1)]))
            begin
              reg11 <= $unsigned((((~|wire2) <<< {wire1[(2'h2):(1'h0)],
                  (~reg9)}) >>> reg9[(5'h12):(4'ha)]));
            end
          else
            begin
              reg11 <= $unsigned({(~&(~^{wire5})),
                  $unsigned(reg11[(2'h3):(1'h1)])});
              reg12 <= wire4[(2'h2):(1'h1)];
              reg13 <= wire1[(4'hd):(1'h0)];
            end
          reg14 <= {({{wire2[(1'h0):(1'h0)], (wire2 ? wire0 : reg12)},
                  ((8'h9f) ? {wire2, wire0} : $signed(reg8))} <<< wire6)};
        end
      else
        begin
          reg8 <= reg7[(3'h6):(2'h2)];
          reg9 <= $unsigned(reg11);
          if (({wire3,
              wire4[(2'h2):(1'h0)]} != ($signed((wire4[(1'h1):(1'h0)] <= (-wire1))) | reg7)))
            begin
              reg10 <= {wire6[(3'h4):(1'h0)],
                  $unsigned({{(reg11 != reg8), (wire4 ? wire5 : wire2)},
                      (|wire1[(3'h4):(1'h1)])})};
            end
          else
            begin
              reg10 <= wire3[(3'h5):(2'h3)];
              reg11 <= $unsigned($unsigned($signed(({wire4,
                  wire5} ^~ wire3[(5'h12):(5'h12)]))));
              reg12 <= (wire4 ?
                  $unsigned(reg9) : ((reg11 ?
                      (reg9[(5'h10):(2'h3)] ?
                          (~&reg13) : reg12) : {$signed(reg8)}) <<< {(wire3 ?
                          (reg7 || reg14) : $unsigned((8'ha4)))}));
            end
          if (((reg7[(5'h10):(4'he)] ?
              $signed((wire6[(1'h1):(1'h1)] ?
                  (~&reg7) : reg11)) : $signed(((wire4 ?
                  reg10 : reg13) >>> ((8'hb4) * (8'haa))))) > reg7[(1'h1):(1'h1)]))
            begin
              reg13 <= reg14[(4'h9):(4'h8)];
              reg14 <= (wire1[(2'h3):(1'h1)] ?
                  ($signed($unsigned((-reg9))) != (wire6 == $signed((7'h41)))) : wire2[(4'ha):(3'h5)]);
              reg15 <= (wire6[(3'h5):(2'h3)] != wire5);
            end
          else
            begin
              reg13 <= reg9;
              reg14 <= {{$unsigned($signed(wire4[(2'h2):(1'h0)])),
                      ({((7'h40) ^~ wire1)} * wire6[(4'h8):(3'h4)])}};
              reg15 <= $unsigned({reg10, {reg12, $unsigned((&wire3))}});
            end
        end
      if ($signed(($unsigned((reg10[(1'h1):(1'h0)] ?
              $unsigned(reg7) : {reg13})) ?
          (^~$signed((reg15 * reg10))) : $signed($unsigned($unsigned(reg9))))))
        begin
          if (wire2)
            begin
              reg16 <= (((~^(8'ha5)) ^ wire0) << $signed((+wire4[(1'h0):(1'h0)])));
              reg17 <= reg14[(1'h0):(1'h0)];
              reg18 <= (+({($unsigned(reg12) >>> $signed(reg15)),
                  ({wire6} <= wire2[(3'h5):(1'h1)])} * wire1));
              reg19 <= (~(reg9 <= reg13));
              reg20 <= $unsigned(reg15);
            end
          else
            begin
              reg16 <= reg8[(2'h3):(1'h0)];
              reg17 <= (~wire0);
              reg18 <= (^wire6[(2'h2):(1'h1)]);
              reg19 <= $signed(wire5);
            end
          reg21 <= $signed(((8'ha5) == reg10[(3'h5):(3'h4)]));
          if ((~^$unsigned({wire5[(3'h5):(2'h2)]})))
            begin
              reg22 <= (^~($signed($unsigned((reg16 * wire1))) ?
                  wire2[(1'h1):(1'h1)] : {$unsigned(wire1)}));
            end
          else
            begin
              reg22 <= (reg18[(4'h8):(2'h3)] ? wire0 : reg9);
              reg23 <= $signed((reg11[(4'hc):(4'h8)] + (($signed((8'hb8)) ?
                      (reg19 ? reg18 : reg21) : $signed(wire5)) ?
                  (reg7 ? (wire2 ? wire2 : (8'hbb)) : (|reg18)) : (&{wire4,
                      wire2}))));
              reg24 <= ((!$unsigned(($signed((8'h9c)) ?
                  {(8'ha8)} : (wire2 ? reg19 : (7'h41))))) >> reg10);
            end
          if (reg7[(4'ha):(3'h6)])
            begin
              reg25 <= (&(reg23 || $signed(($unsigned((8'hb0)) ?
                  $signed(reg8) : (reg16 > (7'h43))))));
              reg26 <= ($signed((-$signed((~wire1)))) <= $unsigned(wire4));
            end
          else
            begin
              reg25 <= ($signed($unsigned(((-reg23) ?
                      $unsigned(reg26) : ((7'h43) ^ reg12)))) ?
                  ((8'hb2) || (~&reg16[(1'h0):(1'h0)])) : reg19[(5'h12):(1'h1)]);
              reg26 <= wire3;
              reg27 <= reg15[(3'h7):(2'h3)];
            end
          reg28 <= wire4[(2'h2):(1'h0)];
        end
      else
        begin
          reg16 <= reg23[(1'h0):(1'h0)];
          reg17 <= reg21[(2'h2):(1'h1)];
          reg18 <= (($unsigned(reg24) > (8'hb0)) | (&$signed(($unsigned(reg20) <<< (+reg11)))));
          reg19 <= (8'haa);
        end
      reg29 <= (((^~((~(8'ha8)) ?
              (|reg14) : reg16)) >= $signed($unsigned(reg17))) ?
          (~(reg24 >= $signed((!reg7)))) : (8'hb9));
    end
  assign wire30 = $unsigned(($signed(({wire0, reg20} ?
                      reg27[(3'h5):(1'h0)] : $unsigned((8'hb3)))) ^~ reg25[(3'h4):(3'h4)]));
  assign wire31 = $signed((8'ha5));
  assign wire32 = (reg25[(1'h1):(1'h0)] || reg13);
  always
    @(posedge clk) begin
      if ((reg22 ? reg7 : reg26))
        begin
          reg33 <= reg17;
        end
      else
        begin
          reg33 <= ({$signed(reg19[(5'h12):(4'hf)])} ?
              reg11[(4'hb):(3'h4)] : $signed($unsigned(wire5[(4'h9):(4'h9)])));
        end
      if ((reg7 ^~ $signed({(reg19 ^ $signed(wire31)),
          ((reg18 >= reg16) ?
              (reg20 ? reg21 : reg20) : (reg28 ? reg8 : (8'haf)))})))
        begin
          reg34 <= ((8'haf) == ((~($unsigned(wire30) ?
              wire4 : $unsigned((7'h43)))) & ((wire5 ?
                  {wire3, reg10} : ((8'hac) ? reg19 : wire4)) ?
              (~|(7'h43)) : ({reg9, reg12} < (&reg17)))));
        end
      else
        begin
          if ($unsigned($signed($unsigned($unsigned({reg22, reg28})))))
            begin
              reg34 <= ($unsigned((^reg21[(3'h4):(1'h0)])) >> reg16);
            end
          else
            begin
              reg34 <= $signed(($signed(reg24) ^~ (((wire0 == reg28) == $signed(reg13)) || wire1[(4'hc):(2'h3)])));
              reg35 <= $unsigned((wire32[(2'h3):(1'h1)] ?
                  $signed(((reg25 ? reg14 : wire30) ^ wire0)) : {((wire6 ?
                          (8'hb9) : reg8) >>> (reg22 ? wire32 : wire2))}));
            end
          reg36 <= (~^$signed(($unsigned(((8'ha5) == wire31)) * reg23[(1'h0):(1'h0)])));
          if ((wire32[(4'h8):(4'h8)] <<< (^~(reg11[(3'h6):(3'h6)] ?
              wire4 : (+(wire0 - (8'hb0)))))))
            begin
              reg37 <= (wire1 ?
                  reg22[(2'h2):(1'h1)] : {(((|wire31) ^~ wire4[(2'h3):(2'h2)]) ?
                          $unsigned(reg29) : $signed((+reg13)))});
              reg38 <= reg17;
            end
          else
            begin
              reg37 <= ($unsigned((|{$unsigned(wire3)})) != reg37);
              reg38 <= wire5[(3'h7):(3'h5)];
              reg39 <= $signed(wire6);
            end
          reg40 <= ((reg15 ?
              reg24 : {reg17[(3'h5):(1'h0)],
                  ((reg17 ? wire4 : reg9) ?
                      {(8'ha8)} : reg27[(3'h5):(3'h5)])}) == $signed($unsigned($signed(wire30))));
        end
      reg41 <= $unsigned((reg12 >> $unsigned(({wire32, reg17} ?
          (reg37 ? reg19 : wire6) : {reg40}))));
      reg42 <= reg9[(2'h3):(2'h2)];
      reg43 <= reg23[(1'h0):(1'h0)];
    end
  assign wire44 = (8'h9e);
  assign wire45 = reg27;
  always
    @(posedge clk) begin
      if ($signed(reg18))
        begin
          reg46 <= (reg12[(3'h5):(2'h2)] * {($unsigned((~reg20)) <<< ((reg9 ?
                      reg17 : reg35) ?
                  reg11[(4'hb):(1'h0)] : (reg29 <<< (8'hbb))))});
          reg47 <= reg43;
          reg48 <= (~^reg11);
        end
      else
        begin
          reg46 <= (reg19 ?
              $signed({reg42[(3'h4):(1'h0)],
                  $unsigned({(8'hbb), reg19})}) : (($signed((~|reg37)) ?
                      (8'hbd) : (~&(reg17 ? wire45 : reg21))) ?
                  {((wire30 <<< wire1) > wire2)} : $signed(wire1[(4'ha):(2'h3)])));
          reg47 <= reg16[(3'h7):(1'h0)];
          reg48 <= (reg29 ^ {($signed($signed(reg19)) * reg20),
              $signed($signed((~&reg27)))});
          reg49 <= (!$unsigned(reg29));
          reg50 <= ($signed($signed(reg43[(3'h4):(2'h2)])) >= ($unsigned((((8'hbd) & reg12) ?
              {reg28} : (+(8'ha3)))) & (8'h9d)));
        end
      if ((^((wire32[(4'h9):(4'h8)] < reg15[(3'h5):(1'h1)]) ?
          reg28 : reg34[(1'h1):(1'h0)])))
        begin
          reg51 <= $unsigned(reg27);
          reg52 <= (reg43[(2'h3):(1'h0)] >= {({reg14} ?
                  {{reg47, reg26}} : ($unsigned(reg50) ^~ (!reg11)))});
        end
      else
        begin
          reg51 <= (8'had);
        end
      if ($unsigned(reg23[(1'h1):(1'h1)]))
        begin
          reg53 <= (((wire45 ?
              {{reg18,
                      reg52}} : $signed($unsigned(reg15))) ~^ ($signed($unsigned(reg42)) >> $signed(wire2))) << (({(~&reg13),
                  (-wire31)} ?
              $signed((wire2 * reg27)) : ((reg34 ?
                  reg9 : (8'ha1)) * $signed((8'hbd)))) == {$unsigned(((8'hae) << reg49)),
              reg11[(4'h9):(4'h9)]}));
          reg54 <= (8'h9f);
        end
      else
        begin
          reg53 <= (reg35 ~^ ($signed($signed($signed(wire6))) || ($signed((|reg22)) ?
              (^(reg53 ? reg47 : reg22)) : wire31)));
        end
      reg55 <= (^($unsigned((^~$unsigned(reg24))) ?
          ((^~(~|(8'hae))) && reg37) : (~((~|wire32) & (^(8'hb1))))));
      reg56 <= (((wire2 | (+reg48)) >= {wire1[(4'h9):(1'h1)],
              ((~^reg42) ? ((7'h44) == wire44) : (reg51 ? reg23 : reg12))}) ?
          reg23 : wire5);
    end
  module57 #() modinst155 (wire154, clk, reg48, reg50, wire45, reg17);
  always
    @(posedge clk) begin
      reg156 <= reg41;
      if ($unsigned($signed(($signed((wire4 ^~ reg54)) > reg156))))
        begin
          reg157 <= $unsigned($unsigned((!reg46)));
          reg158 <= ($signed($signed($signed((|reg16)))) ?
              (~{wire0,
                  {reg23[(1'h1):(1'h0)],
                      $signed(reg21)}}) : ((reg12 && ((reg33 || reg29) & reg43[(2'h3):(1'h1)])) && ((~reg48) ?
                  reg156 : (&(reg43 != reg49)))));
          reg159 <= ($signed((wire31 ^~ $unsigned($signed(reg8)))) >> $signed($unsigned(($signed(reg33) ?
              reg40[(4'hd):(3'h7)] : (reg39 ? reg14 : wire2)))));
          reg160 <= ((($signed((reg17 <<< reg52)) ?
                  ((^~reg33) >= (reg47 ?
                      (8'ha3) : reg22)) : reg43[(4'h9):(3'h4)]) ^~ (^$signed({reg50,
                  reg8}))) ?
              reg20[(3'h5):(1'h0)] : (wire30[(2'h3):(2'h3)] ?
                  $unsigned(((reg7 ? reg9 : reg53) >= (^reg38))) : {({reg7,
                          wire0} >= (wire0 * reg27)),
                      wire32[(4'hb):(3'h7)]}));
        end
      else
        begin
          reg157 <= $signed($unsigned(reg26[(2'h2):(2'h2)]));
          reg158 <= reg16[(4'hc):(4'h8)];
          reg159 <= reg42;
          reg160 <= wire1[(4'ha):(3'h6)];
          reg161 <= {({wire45[(3'h7):(3'h6)],
                  (reg34 <<< ((8'haf) | reg33))} >> (((~reg17) ?
                      {(8'hb6)} : {(8'haf), wire45}) ?
                  ($signed(wire5) ?
                      reg16[(3'h4):(3'h4)] : (reg18 <<< reg25)) : wire44[(3'h6):(1'h1)]))};
        end
      if ((+$signed((^~reg52[(4'ha):(4'h9)]))))
        begin
          if ($unsigned(($signed((~&(~|wire154))) ?
              $signed($signed((reg38 >> reg156))) : $unsigned((!reg42)))))
            begin
              reg162 <= (~&reg17);
              reg163 <= $unsigned($signed(({$signed(reg26)} ~^ reg34[(3'h5):(1'h1)])));
              reg164 <= {wire0};
              reg165 <= reg41;
            end
          else
            begin
              reg162 <= (~|(reg54 ?
                  ($signed($signed(reg156)) ?
                      $unsigned({reg53, reg56}) : ((~|wire32) ?
                          (reg20 - (8'hb4)) : (|wire6))) : ($signed((reg50 >> wire32)) >> reg19)));
              reg163 <= ($unsigned($unsigned($unsigned(((8'hb2) >> wire30)))) ?
                  ($unsigned(reg159[(1'h0):(1'h0)]) >>> reg37) : ({{$signed((8'hbb))}} < $signed($signed((8'ha9)))));
              reg164 <= reg27;
              reg165 <= $unsigned(reg13[(4'h9):(1'h1)]);
            end
          reg166 <= ((reg25 ?
                  ({$signed(wire154),
                      ((8'ha9) | reg51)} == $signed((~^reg15))) : ($signed(((8'ha8) ~^ wire44)) ?
                      {(|reg22)} : reg14[(4'h8):(2'h2)])) ?
              $signed(((-reg36[(2'h3):(2'h2)]) + reg23[(1'h0):(1'h0)])) : (&((reg17[(4'ha):(3'h7)] ?
                  reg54[(3'h6):(1'h0)] : (reg36 ? wire45 : wire3)) <= ((reg43 ?
                  (8'ha1) : (8'hb8)) | {reg25}))));
          reg167 <= ((!reg52[(3'h4):(1'h0)]) & ((($signed(reg21) ?
              wire44[(4'hf):(1'h0)] : {(8'hb6)}) <= (reg33[(4'hc):(2'h2)] ?
              (~^reg7) : {reg47, reg17})) ~^ reg166[(2'h3):(2'h3)]));
        end
      else
        begin
          reg162 <= (~&(&$unsigned(reg159)));
          reg163 <= (wire1[(4'hc):(1'h1)] ?
              $signed(((8'ha6) | $unsigned($signed(wire45)))) : (((^(&reg35)) ?
                      wire154 : (~(|(8'hb0)))) ?
                  (reg33[(5'h12):(3'h7)] != (((7'h43) ? wire30 : reg158) ?
                      reg7 : ((8'hba) == wire31))) : $unsigned($signed(((8'hb8) << (8'h9f))))));
          reg164 <= $signed({reg15, $signed(((&wire154) >> $unsigned(reg15)))});
        end
    end
  assign wire168 = reg50;
endmodule

module module57  (y, clk, wire58, wire59, wire60, wire61);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire59;
  input wire signed [(5'h14):(1'h0)] wire60;
  input wire [(5'h10):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire139;
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire143,
                 wire142,
                 wire141,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire67,
                 wire139,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 (1'h0)};
  assign wire62 = $unsigned(wire61[(3'h5):(1'h0)]);
  assign wire63 = ($unsigned((~^{(wire61 || wire60)})) ?
                      ($signed(wire62) ?
                          $unsigned(wire58[(5'h10):(2'h3)]) : ((~$unsigned(wire60)) ?
                              (+(wire61 ?
                                  wire58 : wire62)) : (8'hbd))) : (8'ha4));
  assign wire64 = {$signed($signed((~^{(8'hbc), (8'hac)}))), (8'ha5)};
  assign wire65 = wire61;
  assign wire66 = wire58;
  assign wire67 = ($unsigned((+(8'hb9))) ?
                      {wire59, $signed(wire62)} : wire63[(4'he):(4'he)]);
  module68 #() modinst140 (.clk(clk), .y(wire139), .wire72(wire61), .wire73(wire58), .wire71(wire60), .wire69(wire63), .wire70(wire66));
  assign wire141 = wire66[(3'h6):(2'h3)];
  assign wire142 = wire60[(4'hd):(4'hb)];
  assign wire143 = ((^~$signed({wire141, $unsigned(wire67)})) ?
                       {wire142} : {(^(|wire67[(3'h7):(3'h7)]))});
  always
    @(posedge clk) begin
      if (((($unsigned((wire142 ? wire142 : wire63)) * {$unsigned(wire63),
              (~|wire62)}) || (!($signed(wire141) ?
              (wire61 ? wire65 : wire64) : $signed(wire66)))) ?
          $unsigned($unsigned(wire142)) : wire142))
        begin
          reg144 <= ((8'h9d) >> (8'hbf));
          reg145 <= (~|{$signed({(wire65 || wire60), wire58[(1'h0):(1'h0)]})});
          reg146 <= (wire66[(1'h1):(1'h1)] != wire60[(4'h8):(3'h6)]);
          reg147 <= ({{(~wire139)},
              ($unsigned(wire65) && wire67)} * $signed((wire65 >> (-reg146[(3'h5):(3'h4)]))));
          if (reg144)
            begin
              reg148 <= ((({(&(8'hb2))} ? (8'hbe) : {{(8'hac), (8'ha4)}}) ?
                  $unsigned(wire60) : wire139) == (reg145[(3'h6):(1'h1)] | (wire60[(1'h0):(1'h0)] && ((wire61 ?
                  wire141 : (8'hb3)) > wire58))));
              reg149 <= $signed(reg147[(1'h1):(1'h1)]);
            end
          else
            begin
              reg148 <= (8'hb5);
              reg149 <= reg149;
              reg150 <= ($unsigned(reg147[(1'h0):(1'h0)]) ?
                  ($unsigned((|(wire63 ?
                      wire59 : reg147))) && $unsigned($unsigned((+wire58)))) : ((8'hb8) * $unsigned(wire66)));
            end
        end
      else
        begin
          reg144 <= $signed($unsigned($unsigned(wire143[(4'hd):(4'ha)])));
          reg145 <= wire60;
          reg146 <= reg146[(3'h7):(2'h2)];
        end
      reg151 <= (wire67[(2'h3):(2'h3)] & (&(wire60[(5'h11):(4'he)] ?
          $unsigned($unsigned(wire64)) : $unsigned($signed(wire143)))));
    end
  assign wire152 = $signed($unsigned($signed(($signed((7'h42)) ?
                       (wire58 > wire59) : wire61[(4'hc):(4'h8)]))));
  assign wire153 = reg145[(3'h6):(1'h1)];
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h2c8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire signed [(5'h11):(1'h0)] wire70;
  input wire [(4'hf):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire [(5'h12):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(5'h15):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire95,
                 wire94,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg121,
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
                 reg93,
                 reg92,
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
                 reg78,
                 (1'h0)};
  assign wire74 = wire71;
  assign wire75 = $signed(wire71[(5'h14):(1'h1)]);
  assign wire76 = wire69;
  assign wire77 = wire71;
  always
    @(posedge clk) begin
      if ($unsigned((wire77 ?
          $signed(wire71) : (wire76 ?
              {((8'ha8) == (8'hb4)),
                  ((8'hab) ? wire75 : wire76)} : wire70[(3'h7):(3'h7)]))))
        begin
          if ($unsigned(wire72[(1'h1):(1'h1)]))
            begin
              reg78 <= ((^wire76[(3'h7):(1'h1)]) ?
                  (wire71[(4'he):(4'hd)] ?
                      $signed($signed(wire70)) : wire75) : wire73[(3'h7):(3'h4)]);
              reg79 <= $unsigned(($unsigned(wire70[(5'h10):(4'ha)]) >>> wire74[(3'h4):(2'h3)]));
              reg80 <= wire71[(3'h5):(2'h2)];
              reg81 <= (+$unsigned($signed(wire76)));
            end
          else
            begin
              reg78 <= wire70;
            end
          if ($signed((($signed(reg80) ? $unsigned(reg78) : $unsigned(reg78)) ?
              wire72 : (({reg78, reg80} + $unsigned(wire71)) ?
                  $signed($unsigned(wire71)) : reg79[(2'h2):(1'h1)]))))
            begin
              reg82 <= (wire69 ?
                  ($unsigned({$signed(wire77), $unsigned(reg79)}) ?
                      (~|(!$signed(wire70))) : wire76) : wire71[(2'h2):(1'h1)]);
              reg83 <= reg79;
            end
          else
            begin
              reg82 <= (8'hac);
              reg83 <= (8'hb4);
              reg84 <= ($signed((^(-$unsigned(wire69)))) > (($signed(wire70[(1'h1):(1'h1)]) ?
                      $signed(((8'hb3) ?
                          reg82 : wire73)) : reg81[(1'h0):(1'h0)]) ?
                  reg81[(1'h0):(1'h0)] : (!(+wire76))));
              reg85 <= reg81[(2'h3):(1'h0)];
            end
          if ((~(8'hb3)))
            begin
              reg86 <= {wire69};
              reg87 <= wire70[(4'ha):(4'h8)];
            end
          else
            begin
              reg86 <= wire77[(4'ha):(3'h7)];
              reg87 <= (~$signed((wire69 || $unsigned((!reg81)))));
            end
          if ($signed($unsigned(reg78[(1'h1):(1'h1)])))
            begin
              reg88 <= ($signed(((^~reg78[(1'h0):(1'h0)]) + (~&reg84[(5'h11):(4'he)]))) ?
                  ((|reg82[(3'h5):(1'h1)]) ?
                      ({(&(8'hbf)),
                          (reg81 >>> (8'hb7))} & $signed((reg86 ^ reg79))) : reg83) : $unsigned((8'ha0)));
              reg89 <= wire73;
              reg90 <= $unsigned($signed(reg80));
              reg91 <= reg78;
            end
          else
            begin
              reg88 <= {$signed($signed(($unsigned(reg83) ? reg87 : reg82))),
                  reg84};
              reg89 <= reg79[(3'h4):(1'h0)];
            end
          reg92 <= (!reg85);
        end
      else
        begin
          reg78 <= $unsigned((($signed((reg91 <<< reg79)) ?
              (7'h44) : (^reg89)) | wire74));
        end
      reg93 <= reg90[(4'h8):(1'h0)];
    end
  assign wire94 = reg86[(3'h5):(1'h0)];
  assign wire95 = (wire75[(1'h0):(1'h0)] ? reg82 : reg83[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg96 <= $unsigned($unsigned(wire75[(4'he):(3'h7)]));
      reg97 <= $unsigned(wire76[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg98 <= $unsigned($unsigned($unsigned(reg89[(1'h0):(1'h0)])));
      if (($signed(reg85) ?
          ($unsigned($unsigned((wire95 & reg80))) ?
              ($unsigned((^reg93)) ?
                  (|reg80) : $signed((~|(8'hbb)))) : $unsigned(wire73)) : (-(wire95[(2'h2):(1'h1)] ?
              (reg84[(3'h7):(2'h3)] >= $signed(reg84)) : (reg93[(2'h2):(2'h2)] ?
                  (8'h9c) : reg90[(3'h5):(1'h1)])))))
        begin
          reg99 <= wire72;
          if ((+(reg97[(1'h1):(1'h1)] ?
              ($unsigned((wire76 < reg84)) + {reg98[(4'h9):(4'h8)],
                  (wire75 ? reg87 : reg96)}) : $signed($signed((reg90 ?
                  reg80 : reg81))))))
            begin
              reg100 <= reg79;
            end
          else
            begin
              reg100 <= $unsigned(($unsigned(((~&reg81) >> (reg80 ?
                      (8'ha9) : (8'ha6)))) ?
                  $signed($unsigned(reg89[(3'h6):(3'h6)])) : ((reg93 & wire72) ?
                      $signed((&wire69)) : wire77[(3'h4):(1'h1)])));
              reg101 <= $signed($signed({$unsigned(reg85)}));
              reg102 <= (reg88[(4'ha):(4'ha)] != $signed({(8'ha6)}));
              reg103 <= (7'h43);
            end
          if ($unsigned({((reg102 >>> wire94) < {(!reg101),
                  reg85[(3'h7):(3'h6)]}),
              $signed(((wire70 ^~ reg93) ? $signed(reg101) : reg83))}))
            begin
              reg104 <= $signed(reg92[(3'h7):(3'h4)]);
              reg105 <= $signed(reg79);
            end
          else
            begin
              reg104 <= reg90[(3'h7):(3'h6)];
              reg105 <= reg102[(2'h2):(1'h1)];
              reg106 <= (reg88 & {$unsigned({{wire74, reg78}}),
                  (^wire95[(1'h1):(1'h1)])});
            end
        end
      else
        begin
          if ($unsigned(wire74))
            begin
              reg99 <= (((8'hba) ?
                      reg106[(1'h1):(1'h1)] : (((~|wire94) ?
                              reg100 : $unsigned((8'hb4))) ?
                          ((+reg78) - (reg91 ?
                              reg98 : (8'hae))) : ($signed(reg97) ?
                              (reg87 && reg103) : (~^(7'h40))))) ?
                  ((&{wire74[(4'ha):(2'h2)], (reg80 ? reg104 : reg80)}) ?
                      {reg87[(3'h7):(2'h2)], reg97} : $signed(((~|reg104) ?
                          wire70 : (reg84 ? (8'h9e) : reg103)))) : (^~reg97));
              reg100 <= reg104[(2'h2):(1'h1)];
              reg101 <= ({((7'h41) <= reg86[(3'h6):(3'h4)]), (~^wire73)} ?
                  (|(-$unsigned(reg91))) : $signed((~^reg97[(2'h2):(2'h2)])));
              reg102 <= wire71[(3'h6):(3'h5)];
              reg103 <= ($unsigned((8'had)) | (&($signed((7'h41)) != reg88)));
            end
          else
            begin
              reg99 <= $unsigned(({wire71,
                  (+wire71[(2'h3):(1'h1)])} != $signed(((+(8'hb7)) || $unsigned(wire74)))));
              reg100 <= reg102[(1'h1):(1'h1)];
            end
          reg104 <= (($unsigned({{wire73}, $unsigned(reg93)}) ?
                  {((!wire94) ?
                          (^~reg93) : (&reg84))} : ($signed(reg97[(1'h0):(1'h0)]) ?
                      reg85 : {((8'ha6) || reg79), (wire72 ^ reg86)})) ?
              wire72 : reg84);
        end
    end
  always
    @(posedge clk) begin
      if ((~&((~&wire72) ? wire75[(4'h8):(4'h8)] : wire77[(5'h12):(1'h1)])))
        begin
          reg107 <= ((!$signed(({reg106} ?
              {reg79} : $unsigned(wire71)))) - (8'hb0));
          if ($unsigned(($signed(wire94) >= wire94)))
            begin
              reg108 <= ((~|reg103[(3'h4):(3'h4)]) || ({{(~^reg101),
                      wire75[(3'h5):(3'h4)]},
                  (8'ha8)} & (-(+{reg106}))));
            end
          else
            begin
              reg108 <= (^~(reg93 >> {(reg83[(2'h3):(2'h3)] <<< reg96),
                  reg91}));
              reg109 <= ((|reg93) > $unsigned($signed(($signed((7'h42)) || $unsigned(wire73)))));
              reg110 <= {$unsigned((^~((+wire76) ~^ (reg104 ?
                      reg102 : wire70))))};
              reg111 <= reg86[(3'h4):(1'h1)];
              reg112 <= (((~&$unsigned((reg108 ? reg96 : wire71))) ?
                      ($unsigned((!reg88)) > $signed(((8'hbf) ?
                          reg83 : wire75))) : (wire95[(2'h2):(1'h0)] ?
                          ((reg100 ^ reg105) == $signed(reg105)) : (~&((8'hb6) <= reg88)))) ?
                  $signed(($unsigned((reg109 | wire69)) ?
                      ($unsigned(wire75) >> (^reg79)) : (&(reg105 - reg80)))) : (($unsigned($unsigned(wire72)) == ({wire71,
                              reg101} ?
                          wire72 : reg107)) ?
                      reg82 : $unsigned($unsigned((~^reg107)))));
            end
        end
      else
        begin
          reg107 <= reg102;
          reg108 <= reg81[(2'h3):(2'h2)];
          reg109 <= $signed((-$signed((8'hb7))));
          reg110 <= $unsigned(((-(reg108 ?
              reg109 : {wire95})) && (^~$unsigned($unsigned(reg93)))));
        end
      reg113 <= (&reg93[(3'h5):(1'h1)]);
      if (($signed($signed((~|$signed((8'hb3))))) ? reg88 : reg103))
        begin
          if ($signed(reg100))
            begin
              reg114 <= $unsigned((!(((wire73 ? (8'ha9) : reg106) ?
                      $signed(reg89) : $signed(reg82)) ?
                  (~|(|wire72)) : wire69[(4'he):(1'h1)])));
              reg115 <= ($signed($signed(wire94)) ? reg89 : reg81);
              reg116 <= ((!{((reg112 ? reg79 : (8'hbc)) ?
                          reg80 : reg87[(4'hf):(4'he)])}) ?
                  reg83[(2'h2):(1'h0)] : $unsigned({$unsigned((+reg106))}));
              reg117 <= reg82;
              reg118 <= $signed($signed(reg96[(3'h5):(3'h4)]));
            end
          else
            begin
              reg114 <= $unsigned({(reg83 ? reg98 : reg110)});
              reg115 <= $signed(($signed(reg114[(2'h2):(1'h1)]) - $signed((8'hbc))));
              reg116 <= wire70;
            end
          reg119 <= wire74[(4'hf):(1'h1)];
        end
      else
        begin
          reg114 <= wire77[(4'h9):(2'h3)];
          reg115 <= wire69;
          reg116 <= ($unsigned(reg118) | {wire95[(1'h0):(1'h0)]});
          reg117 <= reg115[(4'ha):(2'h3)];
        end
      reg120 <= {((({wire75, reg84} ? ((8'h9e) ? reg81 : reg91) : (8'hbd)) ?
              reg82[(1'h1):(1'h0)] : $unsigned(reg88)) || $signed(((-reg78) ?
              (reg99 ? reg112 : wire95) : reg112[(3'h5):(2'h2)]))),
          ((+((reg88 ? reg113 : reg111) ?
                  {(8'ha5)} : ((8'hab) ? reg105 : reg117))) ?
              {((+reg102) ? reg114[(2'h3):(1'h0)] : (^wire77)),
                  reg109[(1'h0):(1'h0)]} : $signed(reg116))};
      reg121 <= reg107;
    end
  assign wire122 = reg90[(2'h3):(1'h1)];
  assign wire123 = $unsigned((~^((reg79[(3'h5):(3'h5)] < wire74[(4'hf):(3'h7)]) || $unsigned($unsigned(wire94)))));
  assign wire124 = reg98;
  assign wire125 = ((~^{$signed({reg84})}) ?
                       $signed((8'hba)) : $unsigned((($signed(reg90) ?
                           $signed(wire73) : (wire72 - reg111)) && (8'ha2))));
  assign wire126 = (^reg93);
  always
    @(posedge clk) begin
      reg127 <= reg102;
      reg128 <= {reg81[(2'h2):(1'h0)]};
      reg129 <= reg108;
      reg130 <= {(reg91[(1'h1):(1'h1)] ?
              ($signed($signed(reg103)) ?
                  $unsigned(((8'ha5) != reg114)) : $unsigned($unsigned(reg92))) : ($unsigned({reg79,
                  reg115}) | ((reg83 >= wire73) ? {reg88} : (-reg81))))};
      if (reg89[(2'h2):(2'h2)])
        begin
          reg131 <= ((reg113 ?
              (|((-reg79) ?
                  (~reg81) : reg87[(4'hf):(4'he)])) : (&reg78[(1'h1):(1'h0)])) >>> $unsigned(((((8'hae) ?
                      wire71 : wire71) ?
                  (reg116 ^~ wire73) : (~&reg127)) ?
              ((~reg129) ?
                  reg108 : {reg116, reg91}) : $signed($unsigned(wire95)))));
        end
      else
        begin
          if ($signed(reg119))
            begin
              reg131 <= (~wire94);
              reg132 <= (^~reg87[(1'h1):(1'h1)]);
            end
          else
            begin
              reg131 <= (reg105 >> reg78[(2'h2):(2'h2)]);
              reg132 <= reg131;
              reg133 <= reg87[(3'h4):(1'h0)];
              reg134 <= (^~(~^(8'h9c)));
              reg135 <= {reg127};
            end
          reg136 <= reg115;
        end
    end
  assign wire137 = $unsigned(($signed(wire76[(3'h7):(1'h1)]) ~^ reg89[(4'ha):(1'h1)]));
  assign wire138 = $unsigned((8'haa));
endmodule
