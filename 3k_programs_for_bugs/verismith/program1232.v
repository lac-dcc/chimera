module top
#(parameter param169 = ({((((8'ha5) ~^ (8'ha2)) + ((8'ha7) ? (8'hab) : (8'hb6))) ? (((8'haa) ? (8'hb3) : (8'hab)) ? {(8'hb3)} : ((8'hab) ? (7'h42) : (8'hb6))) : ({(8'hbc)} & ((8'h9c) ? (8'hbf) : (8'ha7))))} <<< (({(~&(8'h9e))} * {{(7'h42), (8'hbd)}}) << (((^~(8'h9d)) ? ((8'ha3) >> (7'h42)) : ((8'h9d) ? (8'hbd) : (8'ha7))) < (-(8'hb5))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire166;
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire168,
                 wire4,
                 wire5,
                 wire6,
                 wire30,
                 wire31,
                 wire166,
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
                 (1'h0)};
  assign wire4 = (wire3[(2'h3):(2'h3)] ?
                     {(wire0[(4'hb):(4'h8)] >>> $unsigned($signed((8'ha2)))),
                         $unsigned(($signed(wire1) ?
                             (~&(8'haf)) : wire3))} : {wire3,
                         wire0[(4'hc):(2'h2)]});
  assign wire5 = (~|($signed(wire2) ?
                     $signed((~^$unsigned(wire2))) : wire2[(1'h1):(1'h0)]));
  assign wire6 = {((!wire3) ?
                         $signed($unsigned($unsigned(wire1))) : $signed(wire1[(1'h1):(1'h1)]))};
  always
    @(posedge clk) begin
      reg7 <= ($unsigned(((~|{(8'ha7)}) && wire2)) + (&(^$unsigned((wire3 ?
          wire2 : wire5)))));
      reg8 <= (!(wire6[(2'h3):(1'h0)] ?
          $signed($unsigned($signed((7'h40)))) : wire2[(5'h12):(4'hd)]));
      reg9 <= ((^~wire5[(4'hc):(4'hb)]) ?
          $signed(wire0[(4'hf):(4'he)]) : wire4);
      reg10 <= reg8;
    end
  always
    @(posedge clk) begin
      reg11 <= (~^$signed((&$unsigned(((8'hb0) >= wire6)))));
      reg12 <= $signed(wire4[(4'hb):(2'h2)]);
      if ($unsigned($unsigned((^~$unsigned((~^(8'ha8)))))))
        begin
          reg13 <= wire0[(5'h10):(3'h6)];
          if (((($unsigned($unsigned((8'hbf))) ? (+wire2) : (&$signed(wire4))) ?
                  $unsigned($unsigned((reg7 ? reg13 : (8'hb0)))) : {(((8'hb1) ?
                              reg11 : (8'h9e)) ?
                          $signed(reg11) : $unsigned(wire2))}) ?
              $signed($signed((wire6[(2'h2):(1'h0)] ?
                  (reg7 << wire3) : wire4[(3'h7):(3'h6)]))) : {(~&$unsigned((reg7 < (8'hba)))),
                  {reg12, $signed($unsigned((8'hb9)))}}))
            begin
              reg14 <= reg8;
              reg15 <= (($signed(reg10[(3'h4):(1'h1)]) ?
                  $unsigned(((~&wire4) ?
                      ((8'hb5) ^ reg7) : (reg12 + reg9))) : {((!wire4) | wire6[(1'h0):(1'h0)]),
                      reg10[(3'h5):(2'h3)]}) == reg12);
              reg16 <= reg14;
              reg17 <= wire1[(4'hb):(3'h6)];
            end
          else
            begin
              reg14 <= {(~&(~|reg7)),
                  {(wire3[(3'h7):(3'h6)] ?
                          (^~reg12[(4'hc):(1'h0)]) : $unsigned($signed(wire2))),
                      reg9}};
              reg15 <= $signed($signed($signed(wire6)));
            end
          if (($unsigned((wire0 != ((reg13 ?
              wire5 : reg14) || (!wire1)))) * $signed(reg15[(3'h5):(3'h4)])))
            begin
              reg18 <= (8'hbb);
            end
          else
            begin
              reg18 <= (reg14 ?
                  ((wire6 ? $signed((|reg9)) : reg17[(1'h1):(1'h0)]) ?
                      (7'h40) : $unsigned(($signed(reg9) ?
                          reg12 : (reg12 ?
                              wire3 : wire2)))) : (^~{$unsigned((wire1 >>> (8'hbf))),
                      $signed((!reg15))}));
              reg19 <= $unsigned($unsigned(reg11[(3'h4):(1'h0)]));
            end
          if ($unsigned({$unsigned((wire4[(1'h0):(1'h0)] && $unsigned((8'hb3)))),
              reg9}))
            begin
              reg20 <= (8'ha8);
              reg21 <= ((^wire0[(4'hd):(2'h2)]) ?
                  reg16[(3'h4):(2'h3)] : ($signed($unsigned(reg10)) ?
                      ($signed(wire6) ?
                          {(wire6 ?
                                  wire2 : reg9)} : $unsigned(reg17)) : (^~($signed(wire6) ?
                          reg11 : {reg15, wire4}))));
              reg22 <= wire6[(2'h2):(2'h2)];
              reg23 <= (wire6[(1'h1):(1'h0)] == $unsigned((wire2[(2'h2):(1'h0)] ?
                  ($signed((8'hb4)) ?
                      (reg20 <<< reg22) : wire5) : $unsigned(reg15[(1'h1):(1'h1)]))));
              reg24 <= {{reg15}};
            end
          else
            begin
              reg20 <= $unsigned(($signed(((8'hb6) >= reg14)) ?
                  ($unsigned((reg21 || reg19)) ?
                      reg24 : reg19[(4'hc):(1'h0)]) : reg8[(4'ha):(3'h4)]));
              reg21 <= $unsigned(reg12);
            end
          if ((|{(|(reg14[(4'h9):(4'h8)] ? $signed(reg23) : {reg13}))}))
            begin
              reg25 <= (($signed(((reg22 - wire0) ?
                      reg24[(4'h9):(1'h0)] : reg7[(2'h3):(1'h1)])) == (($unsigned(reg13) > $signed(reg23)) ?
                      ({reg12,
                          wire6} - wire3[(4'h8):(2'h2)]) : ($signed(reg19) ?
                          $signed(wire6) : (wire6 >> reg20)))) ?
                  $signed((!reg12[(2'h3):(2'h2)])) : reg23);
              reg26 <= $unsigned($unsigned(wire3[(3'h4):(1'h1)]));
              reg27 <= {(-{reg16})};
              reg28 <= ({{(|(reg25 && reg12))},
                  reg8[(3'h7):(1'h0)]} >= $unsigned((reg8 ^ (-$unsigned(reg24)))));
            end
          else
            begin
              reg25 <= {$unsigned((8'hbb)),
                  {$unsigned(reg16[(2'h3):(1'h1)]), reg17}};
              reg26 <= ((!wire3[(4'h9):(1'h1)]) ?
                  (-(((reg8 ? (8'h9d) : (8'hb4)) & ((8'ha3) ?
                      reg28 : reg13)) < $unsigned($unsigned((8'ha9))))) : (8'ha3));
              reg27 <= $unsigned(($signed((~$unsigned(reg24))) * reg16));
            end
        end
      else
        begin
          if ($unsigned((^~(wire6[(2'h2):(1'h0)] ?
              $signed(reg20) : $unsigned((~|wire6))))))
            begin
              reg13 <= reg7[(2'h3):(1'h0)];
              reg14 <= ({($unsigned((reg26 != reg20)) ?
                      ((reg9 > reg27) ?
                          (8'hbb) : ((8'ha8) ?
                              reg28 : reg24)) : reg17[(2'h2):(1'h0)])} >> {$signed((((8'ha2) <<< reg13) ?
                      $signed(reg18) : reg9[(3'h6):(2'h2)]))});
              reg15 <= ((^$unsigned($unsigned($signed(reg24)))) ?
                  ($signed((((8'hbb) ?
                      wire6 : reg19) - $signed(reg23))) + (~|(((8'hba) ?
                      reg11 : (8'haf)) ^~ reg16))) : wire6[(1'h0):(1'h0)]);
            end
          else
            begin
              reg13 <= ((~reg11) ?
                  (&{reg16}) : (((&(+wire6)) ?
                      $signed($unsigned((8'hbf))) : ($signed(reg24) ^~ {reg14,
                          wire2})) && reg26[(4'h8):(1'h1)]));
              reg14 <= ($signed({$unsigned(reg19),
                      ((-wire6) > ((8'hb7) && reg8))}) ?
                  wire0[(2'h2):(1'h0)] : ($signed($signed(wire0)) ?
                      reg18[(3'h6):(1'h1)] : ((7'h44) ?
                          reg15 : ($signed((8'ha4)) ?
                              $unsigned(reg16) : reg22[(1'h1):(1'h1)]))));
            end
        end
      reg29 <= wire6;
    end
  assign wire30 = reg29[(1'h1):(1'h0)];
  assign wire31 = ((^(8'ha2)) >= ($unsigned(reg24[(5'h11):(1'h1)]) ?
                      (-wire2[(4'h8):(1'h1)]) : $signed(($signed(wire3) ?
                          (reg18 ? (8'hbc) : reg15) : $unsigned(reg26)))));
  module32 #() modinst167 (.wire35(wire3), .y(wire166), .wire36(wire0), .clk(clk), .wire33(wire5), .wire34(reg22));
  assign wire168 = ({reg26[(1'h1):(1'h0)],
                           $signed(((reg20 | (7'h43)) ^~ ((8'hac) ^ reg13)))} ?
                       wire31[(3'h4):(3'h4)] : (!(-$signed((8'ha3)))));
endmodule

module module32
#(parameter param164 = (((^~((8'ha5) <<< (~&(8'had)))) ? ((^~((8'hb1) ? (8'hbd) : (8'haa))) * ((~(8'ha3)) && ((8'ha4) ? (8'hb4) : (8'hb3)))) : (~^(^~(8'hbe)))) || {((((8'ha8) ? (8'haa) : (8'hba)) ? ((8'ha4) ? (7'h42) : (8'hbb)) : (!(8'h9f))) ? ((~(8'hb6)) ? ((7'h40) ? (7'h41) : (8'ha9)) : ((8'h9e) ^~ (8'hb9))) : ((~&(8'haa)) <= (~(8'ha9)))), (~|((|(8'h9f)) ? {(8'hba), (8'ha8)} : ((7'h44) && (8'hbd))))}), 
parameter param165 = ((~((8'hb3) ? (8'haa) : (~^(param164 ? param164 : param164)))) && ((^~{(param164 * param164)}) ? ((^~param164) + ((param164 ? param164 : param164) - {param164})) : {(param164 ? (!(8'hb7)) : param164), param164})))
(y, clk, wire33, wire34, wire35, wire36);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire signed [(4'ha):(1'h0)] wire34;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(3'h4):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire148;
  wire [(3'h6):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire118;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire116;
  reg [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  assign y = {wire148,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire37,
                 wire38,
                 wire116,
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
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  assign wire37 = (8'ha5);
  assign wire38 = ({(wire33 | {{wire34}, wire37})} ?
                      $signed((+(&$unsigned(wire37)))) : $signed(wire35));
  always
    @(posedge clk) begin
      reg39 <= $unsigned((((^~{wire37, wire33}) ? wire37 : (^~wire35)) ?
          wire34[(4'h9):(1'h1)] : {(7'h44)}));
      if ((~|$unsigned($unsigned((wire35[(2'h3):(2'h2)] >>> (wire38 <= wire37))))))
        begin
          if ($signed(wire33))
            begin
              reg40 <= (|$unsigned($unsigned(($unsigned(wire36) ?
                  wire38[(1'h1):(1'h1)] : $signed(wire37)))));
              reg41 <= (($signed(wire35) ?
                  {(((8'hbe) ? (8'hb7) : wire38) == (reg40 && wire33)),
                      ({(8'hb6), wire38} ?
                          (~wire36) : wire34)} : reg40[(4'hc):(4'h8)]) >> wire33);
              reg42 <= ((&(($signed(wire38) ?
                  (reg39 ?
                      wire34 : reg40) : $unsigned(reg40)) > reg41[(3'h5):(1'h0)])) << (^~reg39[(1'h1):(1'h1)]));
              reg43 <= $signed(({($unsigned(reg42) ?
                          wire35[(3'h4):(1'h0)] : (reg39 ? (8'hbc) : reg41)),
                      ($unsigned(reg40) + (reg41 ? wire33 : wire38))} ?
                  (&((+wire36) ?
                      (^wire38) : $signed((7'h40)))) : ($unsigned((wire33 << (8'ha5))) ~^ (reg41 ?
                      (!(8'hba)) : reg40[(2'h3):(1'h1)]))));
              reg44 <= (~(&((wire35 >> (~|wire36)) < ({(8'hb3)} <<< $signed(wire36)))));
            end
          else
            begin
              reg40 <= ($signed(wire36) ?
                  (7'h41) : ($unsigned(reg44[(2'h3):(1'h1)]) ?
                      $unsigned($unsigned(reg40)) : reg39[(2'h2):(1'h1)]));
              reg41 <= (($signed($signed(wire37)) & wire36) ?
                  ($unsigned(wire38) >= (~&((+wire36) | (reg41 != (8'hb6))))) : $unsigned($signed(reg40[(4'h9):(4'h9)])));
              reg42 <= wire33;
            end
        end
      else
        begin
          reg40 <= reg39[(4'ha):(3'h7)];
          reg41 <= ((reg41 ?
              (~^$signed(reg39)) : $unsigned({reg41})) >>> (!$signed((reg43 ?
              (wire36 & (8'hb0)) : (reg39 >= reg42)))));
          reg42 <= ((~|reg41) || $signed(wire38));
          reg43 <= $signed($unsigned(reg39[(3'h4):(3'h4)]));
          if ($unsigned({{$signed($unsigned(wire38)), (~^wire37)},
              {$unsigned(wire36)}}))
            begin
              reg44 <= reg40;
            end
          else
            begin
              reg44 <= $unsigned(reg39[(4'h9):(3'h4)]);
            end
        end
      reg45 <= $signed(((-((reg44 < reg44) ?
              ((8'hb0) ? wire37 : reg42) : $unsigned(reg39))) ?
          reg41 : ({$unsigned(reg39),
              $signed(reg41)} ^ ((|(8'ha6)) != (-wire35)))));
    end
  module46 #() modinst117 (wire116, clk, reg41, reg40, wire35, reg45);
  assign wire118 = ($unsigned(((~$unsigned(wire33)) ?
                           ($unsigned(reg42) - $signed(wire35)) : $signed($signed(wire38)))) ?
                       reg39 : (~({$unsigned(reg44),
                           $unsigned(wire35)} - (&(wire116 >> (8'ha0))))));
  assign wire119 = $signed(((^~{$signed(wire35),
                       (!(8'haf))}) << (~(-(~|reg42)))));
  assign wire120 = $signed(((~|(-(|wire38))) ? reg39 : reg45));
  assign wire121 = (~&reg45[(2'h3):(1'h0)]);
  assign wire122 = $unsigned((~|({(reg44 ? (8'h9d) : wire36),
                           (wire35 << reg39)} ?
                       {$unsigned(wire34)} : reg41)));
  module123 #() modinst149 (wire148, clk, wire119, reg43, wire118, reg39);
  always
    @(posedge clk) begin
      reg150 <= (^($unsigned({$signed(reg40), (~wire122)}) || (((wire148 ?
          wire122 : wire34) & reg43) ^~ ($signed(reg42) ?
          (-wire120) : (wire148 ? wire38 : wire36)))));
      reg151 <= (-{(($signed((8'hba)) ?
              (wire38 ?
                  wire37 : wire119) : $signed(wire36)) <<< ($unsigned((8'had)) * (~wire118)))});
      reg152 <= $unsigned(reg40);
      if ($signed({reg42[(5'h10):(4'hb)], (~$signed((|reg150)))}))
        begin
          reg153 <= reg42[(4'h9):(3'h4)];
        end
      else
        begin
          if ($signed($signed((^$unsigned((~&reg39))))))
            begin
              reg153 <= wire119;
              reg154 <= $signed($unsigned((({wire38} ?
                  ((8'hbb) > reg39) : (~&wire35)) >> wire118)));
              reg155 <= $unsigned($signed((&($unsigned(wire122) ?
                  $unsigned(reg42) : reg40))));
            end
          else
            begin
              reg153 <= (~&$signed($signed($unsigned((reg40 | reg44)))));
              reg154 <= (reg150[(3'h6):(2'h2)] ?
                  $unsigned($unsigned((8'ha7))) : $signed($unsigned((reg153 | (~^wire122)))));
              reg155 <= (-((~(~|$unsigned(wire34))) != ({$signed(wire34),
                      $signed(reg45)} ?
                  ({wire34} * (wire148 ? reg42 : wire35)) : ((reg40 ?
                          wire37 : wire120) ?
                      {reg151, reg155} : $unsigned((7'h42))))));
              reg156 <= reg39;
            end
          reg157 <= reg39;
          reg158 <= (~&{reg43[(3'h4):(3'h4)],
              ($signed(wire119) ? $signed($signed(reg157)) : (+{wire38}))});
        end
      if (reg150[(5'h13):(4'h8)])
        begin
          reg159 <= ((($signed(reg39) <= reg40) ?
              (^(^$signed(wire116))) : (wire34[(3'h4):(3'h4)] + (wire34 > (^~wire121)))) ~^ ((($signed(wire33) >>> {reg154,
              reg150}) * (8'haa)) ~^ ((~&(reg44 ? wire38 : reg40)) ?
              ($unsigned(wire148) ^~ reg43) : wire35[(2'h2):(2'h2)])));
          reg160 <= (~^$signed(wire118));
          reg161 <= reg159[(4'h9):(3'h4)];
        end
      else
        begin
          if (($signed(wire36) ?
              wire148[(2'h2):(1'h1)] : (($unsigned(wire33[(3'h6):(3'h6)]) > ($unsigned(reg159) < $unsigned(reg161))) <= ($unsigned($unsigned(reg44)) == $signed(reg151[(4'h8):(2'h2)])))))
            begin
              reg159 <= $unsigned(((~&(wire33 > (!(8'hae)))) & (&wire38[(2'h2):(2'h2)])));
              reg160 <= {{wire33}, reg153[(3'h4):(3'h4)]};
              reg161 <= (reg150[(3'h7):(2'h2)] ?
                  wire120[(3'h7):(2'h3)] : $unsigned((($signed(reg45) ?
                      $signed(reg161) : $signed((8'hb3))) != $signed((reg151 && reg157)))));
              reg162 <= reg45;
            end
          else
            begin
              reg159 <= (((-$unsigned((reg40 >> (8'hab)))) >= $unsigned(reg161[(2'h2):(1'h0)])) + (&$unsigned($signed($signed(wire120)))));
            end
          reg163 <= (~&(reg43[(4'ha):(4'h8)] << $unsigned(reg159)));
        end
    end
endmodule

module module123
#(parameter param147 = (8'ha3))
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire127;
  input wire [(4'hb):(1'h0)] wire126;
  input wire signed [(5'h11):(1'h0)] wire125;
  input wire signed [(3'h7):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire [(5'h14):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire128;
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire128 = wire127[(3'h5):(1'h1)];
  assign wire129 = $unsigned($unsigned((((+wire128) ?
                       wire127[(3'h4):(3'h4)] : wire128) << $signed(wire126))));
  assign wire130 = wire129[(2'h2):(1'h1)];
  assign wire131 = wire130;
  assign wire132 = $unsigned(wire128[(4'hd):(4'h9)]);
  assign wire133 = ($signed((({(8'h9f), (8'h9d)} ?
                       wire124[(3'h6):(2'h3)] : $signed(wire132)) >= {$unsigned(wire129)})) & ($unsigned(wire126[(3'h7):(3'h5)]) <= ((~wire130[(1'h0):(1'h0)]) <= $signed((&wire132)))));
  assign wire134 = $unsigned(wire125[(4'hd):(3'h7)]);
  assign wire135 = (-(((~^wire128) ^ $unsigned((^~wire126))) <<< wire124[(3'h4):(1'h0)]));
  assign wire136 = (~|(~^(^$unsigned((wire128 ~^ wire135)))));
  always
    @(posedge clk) begin
      reg137 <= wire136;
      reg138 <= wire130[(1'h0):(1'h0)];
      reg139 <= wire127[(2'h3):(1'h1)];
    end
  assign wire140 = $unsigned({{(reg138 * $signed(wire131))}});
  assign wire141 = wire131[(2'h2):(1'h1)];
  assign wire142 = (^~((((!wire126) >> wire131) + {((8'hb6) ~^ wire130),
                           (wire125 <<< wire134)}) ?
                       $signed($signed((wire128 >>> wire133))) : $unsigned({(~|wire125),
                           (wire125 << reg138)})));
  assign wire143 = $signed(wire132[(1'h1):(1'h1)]);
  assign wire144 = ((~wire134) ?
                       wire129[(3'h4):(2'h3)] : {wire136[(1'h0):(1'h0)],
                           ($unsigned($unsigned(wire129)) ?
                               (~|(~^wire131)) : ((8'ha7) != ((8'had) ?
                                   wire133 : wire141)))});
  assign wire145 = wire126;
  assign wire146 = wire130[(2'h3):(1'h1)];
endmodule

module module46  (y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h2e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire [(4'he):(1'h0)] wire48;
  input wire signed [(2'h2):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(3'h5):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  assign y = {wire115,
                 wire89,
                 wire88,
                 wire87,
                 wire81,
                 wire80,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
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
                 reg92,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire51 = $unsigned(((!(((8'ha5) || wire50) > (wire49 ~^ wire48))) << {((wire49 ?
                          wire48 : wire47) ^~ wire47[(2'h2):(2'h2)]),
                      (|(~wire47))}));
  assign wire52 = (wire48[(3'h5):(3'h5)] == ({(wire48[(1'h0):(1'h0)] ?
                          wire51 : (+wire51)),
                      wire48} ^~ wire48));
  assign wire53 = $unsigned((~&$signed((7'h43))));
  assign wire54 = (wire50[(2'h3):(2'h2)] ?
                      wire53[(1'h1):(1'h0)] : $signed($unsigned($signed((8'hb4)))));
  assign wire55 = (~&(^wire53[(3'h5):(3'h4)]));
  assign wire56 = $unsigned((wire47[(2'h2):(1'h1)] == ({$signed((8'hb8)),
                          (|wire48)} ?
                      (-$signed(wire50)) : (^~(~&wire53)))));
  assign wire57 = $unsigned($unsigned((({wire50, wire49} - (wire47 > (8'ha1))) ?
                      $signed((8'hb6)) : ($unsigned((8'hb1)) > $signed(wire51)))));
  assign wire58 = wire57[(4'hf):(4'ha)];
  assign wire59 = (~^wire52[(1'h0):(1'h0)]);
  assign wire60 = {wire49[(3'h4):(2'h2)]};
  assign wire61 = ({{((~^(8'ha0)) >> {wire59, wire52}), (wire51 ^~ (~&wire59))},
                          wire58[(2'h3):(1'h0)]} ?
                      ($unsigned($unsigned($signed(wire48))) ?
                          (wire58 ?
                              $unsigned((wire53 ?
                                  (7'h42) : (8'ha8))) : (~(wire51 ?
                                  wire55 : (8'ha8)))) : $signed((+(wire53 ?
                              wire55 : wire60)))) : $signed({wire54,
                          ((wire49 * (8'hb1)) ?
                              $signed(wire47) : (wire49 ? wire55 : wire52))}));
  always
    @(posedge clk) begin
      if (wire48[(4'he):(4'h9)])
        begin
          if (wire50)
            begin
              reg62 <= {(wire59 ?
                      wire60[(3'h6):(1'h0)] : wire57[(4'h8):(2'h3)])};
              reg63 <= $unsigned((($signed({wire52}) ?
                      {wire56[(1'h1):(1'h1)],
                          $unsigned(wire54)} : (~^(-wire59))) ?
                  $unsigned((~&wire58[(2'h2):(1'h1)])) : (8'h9f)));
              reg64 <= $signed(($signed(wire47) ?
                  wire53[(2'h3):(2'h2)] : $signed($unsigned((~&wire56)))));
            end
          else
            begin
              reg62 <= (-$signed(wire54));
              reg63 <= (~$unsigned(wire56));
              reg64 <= (7'h42);
            end
          if ((~(!{{(wire56 | wire60), ((8'ha1) ? (8'hb8) : reg64)}})))
            begin
              reg65 <= ($signed($signed($signed(wire51[(3'h7):(2'h3)]))) * wire52[(1'h1):(1'h0)]);
              reg66 <= (($signed((~&(^~wire56))) ?
                  wire60 : ($signed($unsigned(wire53)) ?
                      wire51 : ((~|reg63) ^~ $unsigned(wire60)))) >> (~|{wire55}));
              reg67 <= $signed($unsigned((reg65 <= wire56[(2'h2):(1'h0)])));
              reg68 <= $unsigned((~|$signed(((^wire58) * $signed((8'h9d))))));
              reg69 <= $signed(($signed((wire56[(2'h3):(1'h0)] + (^wire56))) + $signed(($unsigned(reg62) ?
                  reg68[(3'h7):(3'h4)] : $signed(wire49)))));
            end
          else
            begin
              reg65 <= (wire47 ? (~|wire48) : (~|wire59[(1'h0):(1'h0)]));
            end
          reg70 <= (($unsigned(wire53) ?
              (wire47 >= ($signed(reg62) ?
                  ((8'hb4) ?
                      wire52 : wire60) : $signed(wire54))) : (reg65[(4'ha):(3'h4)] << reg65)) - $unsigned($signed($signed(reg64[(2'h3):(1'h1)]))));
          reg71 <= reg65;
        end
      else
        begin
          reg62 <= {(~$unsigned((+(wire48 ? reg71 : wire53))))};
          reg63 <= $unsigned(reg70);
          reg64 <= (((+wire47) + $unsigned({$unsigned(wire58)})) ?
              reg63 : $unsigned(($unsigned(wire57) ~^ ($signed(reg71) == (+(8'hbb))))));
        end
      reg72 <= (wire51 ^~ reg64);
      reg73 <= {($unsigned($signed($unsigned(wire49))) != ($signed(wire48) <<< ((reg65 & wire48) - (8'ha4)))),
          wire55};
      reg74 <= wire59;
    end
  always
    @(posedge clk) begin
      reg75 <= $unsigned({reg64});
      reg76 <= $signed((((|$signed(wire48)) <<< wire50) ?
          (wire55[(2'h3):(2'h2)] ?
              {(+(8'ha5)), (wire60 < wire47)} : (~&$signed(reg66))) : ((8'ha4) ?
              reg65[(4'hd):(2'h2)] : $unsigned($unsigned((8'hbc))))));
      reg77 <= ({$unsigned(reg64[(4'ha):(2'h2)])} ?
          $signed(((^(wire58 ? wire56 : wire53)) >> ((^wire57) ?
              reg69 : (~wire55)))) : {$unsigned(((^~reg65) ?
                  (reg70 + wire54) : {wire50}))});
      reg78 <= reg71;
      reg79 <= {$signed($unsigned($unsigned(reg71))),
          $unsigned(({$unsigned((8'hba)),
              $signed(wire55)} ~^ (|$signed(wire52))))};
    end
  assign wire80 = wire57;
  assign wire81 = (+$unsigned(wire51[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg82 <= (~|{(reg65[(1'h1):(1'h0)] ?
              ((reg68 || reg68) ?
                  (reg63 & reg63) : (wire47 ?
                      (8'haa) : reg68)) : ($signed(wire53) ?
                  $unsigned(wire58) : wire80)),
          ((+((8'ha8) < reg76)) ? $signed($signed(wire54)) : wire58)});
      if (wire59[(3'h4):(3'h4)])
        begin
          if ({((7'h40) > (((8'hba) ^~ $unsigned(wire52)) || ({wire59,
                  reg76} == $unsigned(reg67)))),
              wire81[(3'h5):(3'h5)]})
            begin
              reg83 <= (~^reg72);
              reg84 <= reg72[(1'h0):(1'h0)];
            end
          else
            begin
              reg83 <= reg65[(2'h2):(1'h1)];
              reg84 <= ($unsigned($signed((wire81[(4'h8):(2'h2)] ^~ wire61))) | wire80);
              reg85 <= wire48;
              reg86 <= wire80[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg83 <= reg69[(3'h7):(2'h3)];
          reg84 <= ((reg72 ?
              (reg69 ?
                  $unsigned((wire56 << reg63)) : $unsigned({wire81,
                      reg70})) : (reg83 && (~(~|(7'h42))))) >>> reg85[(4'h9):(3'h6)]);
        end
    end
  assign wire87 = (8'ha3);
  assign wire88 = $signed({(((~^reg64) ? {reg84, reg73} : {wire53, reg67}) ?
                          reg68 : ((reg70 ? reg62 : reg86) ?
                              $unsigned(wire80) : (reg64 ? wire59 : (8'ha9)))),
                      reg71[(1'h1):(1'h1)]});
  assign wire89 = $unsigned(($signed($unsigned(reg79[(5'h13):(4'hd)])) ?
                      $signed($unsigned((wire80 * wire87))) : $signed(($unsigned(wire58) << reg68))));
  always
    @(posedge clk) begin
      if (wire58[(3'h6):(2'h3)])
        begin
          reg90 <= wire53;
          reg91 <= {$signed($signed($unsigned((wire61 ^~ reg86)))),
              ($signed($signed((reg90 == (8'h9c)))) ?
                  ($unsigned($signed(wire57)) >= (~^(reg66 ?
                      reg63 : (8'hbd)))) : wire55[(2'h3):(2'h3)])};
          if (($unsigned((8'hb1)) ?
              (+reg63[(4'he):(4'he)]) : $signed(wire51[(5'h12):(3'h6)])))
            begin
              reg92 <= (^(((reg83 ^ (wire55 * reg73)) >= (~|$signed(reg70))) ?
                  $signed($signed(reg62)) : $signed($unsigned((~wire58)))));
              reg93 <= reg65[(4'h8):(1'h0)];
              reg94 <= $signed((-(($signed(reg78) - $signed(reg68)) && ((|wire53) ?
                  ((8'ha5) ? reg62 : reg71) : ((8'ha3) ? (8'had) : wire48)))));
              reg95 <= $signed({$unsigned($signed((wire88 ? reg91 : reg73))),
                  {reg93}});
            end
          else
            begin
              reg92 <= reg77;
              reg93 <= wire53[(1'h1):(1'h0)];
              reg94 <= (reg79[(5'h13):(3'h4)] ^ (+reg82[(3'h4):(3'h4)]));
              reg95 <= ({($unsigned(wire59[(3'h7):(3'h4)]) ?
                          ((!wire87) ^ wire61[(1'h0):(1'h0)]) : ({wire61,
                                  wire48} ?
                              $unsigned(reg90) : wire81))} ?
                  (wire52[(2'h3):(1'h0)] > $signed(wire80)) : (~&$unsigned(reg73)));
              reg96 <= (|(((~(~^wire48)) ?
                      reg95[(1'h0):(1'h0)] : (((8'ha9) ?
                          reg70 : reg77) ~^ (+reg95))) ?
                  ((+(!reg68)) >= $unsigned((^~wire57))) : reg66[(4'hb):(3'h5)]));
            end
          reg97 <= wire87[(3'h4):(3'h4)];
          if ($unsigned((wire89 ?
              {$unsigned(wire59),
                  (~|wire53[(3'h6):(2'h3)])} : ((((7'h43) || wire47) <<< {reg68,
                      wire56}) ?
                  wire60[(3'h4):(1'h1)] : $unsigned($unsigned((8'ha8)))))))
            begin
              reg98 <= reg96;
            end
          else
            begin
              reg98 <= (((~^{reg67[(1'h1):(1'h0)]}) ?
                      wire61[(1'h0):(1'h0)] : {wire81}) ?
                  reg75[(5'h13):(5'h13)] : {(^($unsigned(reg79) ?
                          (wire47 ? wire88 : reg62) : wire81[(4'h9):(2'h3)]))});
              reg99 <= $unsigned({$unsigned(reg95[(3'h5):(2'h2)]),
                  ($unsigned(wire87[(2'h3):(1'h1)]) > (reg67 ?
                      $unsigned(wire49) : $unsigned(reg85)))});
            end
        end
      else
        begin
          reg90 <= ($unsigned({$unsigned($signed(reg83)),
                  (reg93[(5'h11):(4'hf)] - (wire81 ? wire58 : reg67))}) ?
              {(~&reg96),
                  $unsigned(($signed(wire87) ^ $signed(reg71)))} : $unsigned(({$signed(wire87)} ?
                  $unsigned($signed(wire58)) : (8'hbe))));
          reg91 <= $signed($signed($unsigned(({reg93, wire52} >>> reg76))));
        end
      reg100 <= (($signed($unsigned((wire88 & wire48))) && $unsigned(reg65)) & (+(^(~|((8'h9c) || wire53)))));
      if ($unsigned($signed(reg86)))
        begin
          reg101 <= {reg69};
          if (((&$signed($signed(wire89))) * $signed(reg74)))
            begin
              reg102 <= wire47;
              reg103 <= reg63[(5'h10):(4'h8)];
            end
          else
            begin
              reg102 <= reg82[(3'h4):(3'h4)];
              reg103 <= {(reg91 & reg83)};
              reg104 <= reg79;
              reg105 <= $signed((!({$signed(wire54),
                  $unsigned(reg101)} + $signed({reg68, reg66}))));
              reg106 <= {(reg101[(5'h10):(4'h8)] * ({$unsigned(wire55),
                      reg65} * reg66[(3'h4):(1'h0)]))};
            end
          reg107 <= $unsigned((~^(~({reg105, reg78} && {(7'h41), reg75}))));
          reg108 <= $unsigned($unsigned({reg70[(3'h6):(1'h0)]}));
        end
      else
        begin
          if ((-reg97))
            begin
              reg101 <= ((wire89 ?
                  wire59[(4'h8):(2'h3)] : (~|(((8'hac) && wire53) ?
                      wire88 : (!(8'hb1))))) || {(8'hb1)});
              reg102 <= reg90[(4'h9):(3'h6)];
              reg103 <= wire59[(3'h7):(3'h4)];
            end
          else
            begin
              reg101 <= $unsigned({$signed(reg77),
                  $unsigned($signed((reg105 ? wire47 : wire88)))});
              reg102 <= reg64;
            end
          if ({(+({$signed((7'h44))} ?
                  (reg90 + $signed(reg72)) : ((wire89 ? reg90 : reg71) ?
                      reg63 : $signed(wire80)))),
              ($signed({(wire49 == reg69), (wire58 + wire48)}) ~^ reg76)})
            begin
              reg104 <= $signed(reg68);
              reg105 <= $signed((8'hbc));
            end
          else
            begin
              reg104 <= $signed(reg83[(4'ha):(1'h1)]);
            end
          if (reg86[(4'h9):(3'h4)])
            begin
              reg106 <= (((8'hba) ^~ $unsigned(reg97)) <<< reg76[(3'h6):(2'h2)]);
              reg107 <= $unsigned($unsigned((reg84 ?
                  ($signed(reg65) ?
                      wire55[(2'h3):(1'h0)] : (^~reg104)) : $unsigned(reg106[(3'h4):(1'h1)]))));
            end
          else
            begin
              reg106 <= reg102;
              reg107 <= (reg70[(4'he):(1'h0)] << $unsigned(($unsigned({reg75}) ?
                  $signed((+reg103)) : ($signed(reg76) ?
                      $unsigned(reg99) : reg97[(3'h6):(3'h6)]))));
              reg108 <= {$signed($unsigned(reg77)),
                  $unsigned(wire56[(3'h4):(2'h3)])};
            end
          if ((^~(!$unsigned((~&reg70)))))
            begin
              reg109 <= $unsigned((reg82[(4'h8):(3'h6)] & reg102));
              reg110 <= (~|wire47);
              reg111 <= ((~$unsigned(reg71[(1'h0):(1'h0)])) ?
                  wire80 : reg93[(5'h13):(4'h9)]);
              reg112 <= (~(^wire81[(2'h3):(2'h3)]));
            end
          else
            begin
              reg109 <= $unsigned((reg106[(1'h0):(1'h0)] > wire56[(2'h2):(2'h2)]));
              reg110 <= wire55[(3'h5):(1'h1)];
              reg111 <= ((reg104[(3'h5):(2'h2)] ?
                      $unsigned($signed((reg63 ?
                          reg105 : (7'h40)))) : {((reg69 ? wire58 : reg69) ?
                              reg75[(1'h0):(1'h0)] : (+reg77)),
                          $signed($unsigned(reg96))}) ?
                  $signed(($unsigned((wire60 ?
                      reg85 : reg73)) <= wire81)) : (reg70 ?
                      (((~|wire87) + (wire55 >>> reg68)) * $unsigned(reg85)) : reg79[(1'h1):(1'h1)]));
            end
          reg113 <= ((8'hbe) ^~ ($unsigned(((-reg97) ?
                  $signed(reg96) : $unsigned(wire59))) ?
              $signed((((8'h9c) ?
                  reg106 : (8'hb9)) - reg82)) : {(((8'hb1) ~^ wire54) + (|wire88)),
                  ($signed(wire52) && reg65)}));
        end
      reg114 <= (&$signed((($unsigned(reg110) ^~ wire50) ?
          ((wire53 | reg97) ?
              $unsigned(wire80) : ((8'hb5) ?
                  reg85 : reg86)) : $unsigned($unsigned(reg62)))));
    end
  assign wire115 = (-reg107);
endmodule
