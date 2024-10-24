module top
#(parameter param160 = ({((^((8'ha6) ? (8'hb5) : (8'hae))) ? (8'hb4) : {(^~(8'hb1)), ((8'hb2) ^ (8'ha8))})} ? (~(&(((8'hb9) ? (8'ha5) : (8'hbe)) ^~ ((8'hba) ? (8'hac) : (8'hbe))))) : (((!(!(8'hbd))) ? (-{(8'h9f)}) : (~^((8'hbd) - (8'hae)))) ? ({((8'hb1) ? (8'hb2) : (8'ha2))} ^~ {((8'hbf) >= (8'hb4))}) : ({((8'hae) >> (7'h43)), (!(8'ha0))} == (|((7'h40) ? (7'h40) : (8'ha4)))))), 
parameter param161 = param160)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h378):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  wire signed [(4'h9):(1'h0)] wire141;
  wire [(3'h5):(1'h0)] wire140;
  wire signed [(5'h13):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire118;
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(5'h10):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire120,
                 wire5,
                 wire18,
                 wire19,
                 wire31,
                 wire32,
                 wire33,
                 wire118,
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
                 reg135,
                 reg134,
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
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
  assign wire5 = $unsigned({wire2});
  always
    @(posedge clk) begin
      reg6 <= wire2;
      reg7 <= $unsigned(($unsigned((!$signed((8'hb1)))) ?
          {{wire2[(4'hb):(4'h9)], (|wire0)}} : wire5));
      if ({wire0[(3'h7):(3'h5)], {wire4}})
        begin
          reg8 <= wire3[(1'h0):(1'h0)];
          reg9 <= (&(~^(($unsigned((8'hb8)) ? $signed(wire1) : wire3) ?
              wire3[(3'h5):(2'h3)] : $unsigned($signed(wire3)))));
          reg10 <= $unsigned({((~|{reg6, (8'hba)}) ?
                  reg6 : $signed($signed(reg7)))});
        end
      else
        begin
          reg8 <= reg10[(2'h3):(2'h3)];
          reg9 <= wire5[(3'h5):(1'h1)];
          reg10 <= (($unsigned((!(reg8 != reg9))) + wire0[(3'h4):(3'h4)]) || reg7);
          reg11 <= {reg9};
          if (reg9[(1'h1):(1'h0)])
            begin
              reg12 <= ((reg11 == reg8[(3'h5):(3'h5)]) ?
                  $unsigned((($signed(reg11) >>> wire0[(3'h6):(3'h6)]) ?
                      $signed((^reg9)) : (~|(^reg11)))) : (+$signed((wire5 <<< (wire0 + wire0)))));
              reg13 <= $signed(wire4);
              reg14 <= ({(-{reg6})} ?
                  wire4[(1'h1):(1'h1)] : ($signed((reg6 <= (!reg11))) ?
                      reg11 : $unsigned((reg13[(3'h6):(1'h0)] ?
                          (reg10 ? (8'ha8) : reg8) : reg12))));
            end
          else
            begin
              reg12 <= ($unsigned((~|(7'h41))) ?
                  $signed(reg7) : ($signed(((reg11 ?
                          reg8 : wire4) & (wire5 ^~ reg10))) ?
                      $signed((wire3[(3'h5):(3'h5)] & (wire2 || reg10))) : (reg6 != (^reg12[(2'h2):(1'h1)]))));
              reg13 <= (-reg10);
              reg14 <= ($signed((((reg10 ^ (8'hb0)) ?
                  (^wire4) : (wire1 ? reg14 : wire5)) ^ {((8'hbf) >= reg13),
                  {reg6, wire4}})) == ($signed(((!reg13) * (wire0 ?
                  (8'hbc) : reg9))) && $unsigned(((!wire2) >> $unsigned(wire0)))));
              reg15 <= (&{wire1, $signed(reg12)});
            end
        end
      reg16 <= reg15[(4'hf):(4'hc)];
      reg17 <= {$signed({((~&wire5) < reg16[(3'h5):(1'h0)]),
              $unsigned((reg10 > wire0))})};
    end
  assign wire18 = $signed(reg17);
  assign wire19 = {$unsigned(reg6[(4'hc):(1'h1)]), reg8[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      if ($unsigned(wire3))
        begin
          if ($unsigned(wire5))
            begin
              reg20 <= $unsigned($signed({((reg16 && (8'ha9)) >>> $unsigned(wire5)),
                  (-wire2[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg20 <= ((reg8 ? $signed(wire18) : {reg6}) ?
                  (-$signed({reg12[(3'h5):(1'h0)],
                      wire2})) : $unsigned(($unsigned($signed(reg14)) << (reg14[(2'h2):(2'h2)] ?
                      (reg17 ^ reg15) : ((8'hbf) ? reg10 : (8'hb6))))));
            end
          reg21 <= ($unsigned(reg11) << reg13);
          reg22 <= $unsigned({(reg10[(3'h6):(2'h3)] > $unsigned({reg6, wire1})),
              $unsigned((!(|wire0)))});
          reg23 <= reg16;
          reg24 <= reg21[(3'h5):(1'h0)];
        end
      else
        begin
          if (($unsigned({reg6,
              (reg10[(1'h1):(1'h0)] ?
                  $signed(reg20) : $unsigned(reg23))}) >> $signed(reg20)))
            begin
              reg20 <= wire0[(3'h4):(1'h1)];
              reg21 <= reg9;
              reg22 <= ((|reg20[(1'h0):(1'h0)]) | wire3);
              reg23 <= $unsigned((8'haf));
              reg24 <= wire2[(3'h5):(1'h0)];
            end
          else
            begin
              reg20 <= {reg12[(3'h5):(1'h0)]};
              reg21 <= ((~|((^(7'h42)) ?
                  reg6[(2'h3):(2'h3)] : ((&wire18) ?
                      $signed(reg10) : reg11[(1'h1):(1'h0)]))) <= $unsigned({($signed((8'ha8)) ?
                      (8'ha3) : (8'hb4)),
                  {(reg20 ? wire5 : wire3), reg15}}));
            end
          reg25 <= {(!wire18)};
          reg26 <= $unsigned(reg16[(3'h4):(2'h3)]);
          if ($signed(reg15))
            begin
              reg27 <= reg15;
              reg28 <= (7'h41);
              reg29 <= (^(wire0[(3'h6):(3'h4)] ?
                  reg16 : $unsigned(((!wire0) ^~ (wire2 ? reg9 : reg11)))));
            end
          else
            begin
              reg27 <= wire2;
              reg28 <= (reg12[(3'h6):(1'h0)] ?
                  $signed(wire0[(3'h5):(3'h4)]) : $signed(((~&$signed(reg23)) ?
                      reg27[(2'h2):(1'h1)] : ((reg6 ?
                          reg23 : (8'hbe)) && $signed((8'haa))))));
            end
          reg30 <= ($unsigned($unsigned((reg28[(4'h9):(2'h2)] + wire0[(3'h4):(1'h0)]))) >> $signed(((!wire0[(2'h3):(2'h2)]) ^~ {(reg13 >> reg6)})));
        end
    end
  assign wire31 = ($signed($signed($signed($signed(reg7)))) < (-(reg26 || reg6[(1'h1):(1'h0)])));
  assign wire32 = (($unsigned($signed((wire5 ? wire4 : reg9))) <<< (+reg8)) ?
                      $unsigned($unsigned({$signed(reg29)})) : wire3[(2'h2):(2'h2)]);
  assign wire33 = $signed(wire2[(4'ha):(1'h0)]);
  module34 #() modinst119 (wire118, clk, reg24, reg17, reg23, reg29, wire33);
  assign wire120 = (^((wire32[(3'h7):(1'h1)] <<< $unsigned((wire33 < wire4))) && $unsigned(wire33[(4'hc):(1'h1)])));
  always
    @(posedge clk) begin
      if (reg21)
        begin
          if ($unsigned((~((8'ha0) ?
              reg28[(4'ha):(4'ha)] : (~|(wire5 ^ reg25))))))
            begin
              reg121 <= {$unsigned($signed(reg16))};
            end
          else
            begin
              reg121 <= (($unsigned((|(~|reg9))) ?
                      $unsigned(reg28[(1'h1):(1'h0)]) : reg27[(5'h13):(2'h2)]) ?
                  $signed((8'hb3)) : ((reg9[(3'h7):(2'h3)] || (~^(wire33 >> reg26))) ?
                      wire2 : (($signed(wire3) ?
                          reg8 : wire3[(2'h3):(1'h0)]) << {$unsigned(reg26)})));
            end
        end
      else
        begin
          reg121 <= $signed(reg21[(1'h0):(1'h0)]);
          reg122 <= {reg12[(4'h9):(3'h5)]};
        end
      if ({{(~&$unsigned({reg7})), wire120[(2'h2):(2'h2)]}})
        begin
          reg123 <= wire33;
          if ($unsigned(wire120))
            begin
              reg124 <= (~^(|reg17[(4'h8):(4'h8)]));
              reg125 <= $signed($signed((8'ha1)));
              reg126 <= wire118[(4'h9):(3'h4)];
            end
          else
            begin
              reg124 <= reg6;
              reg125 <= (reg15 ?
                  (($unsigned({wire3}) ?
                      $unsigned(reg123) : $unsigned((^~reg10))) >>> $signed((reg17[(1'h1):(1'h0)] ?
                      wire118 : $unsigned(reg126)))) : reg122[(4'h8):(3'h6)]);
              reg126 <= $unsigned(((|$signed(reg124)) | $signed((8'hb6))));
              reg127 <= (^~($signed(($unsigned(reg122) || {reg10,
                  reg14})) ^ (($unsigned(wire118) >> (&wire1)) <= $signed($unsigned(reg15)))));
            end
          if (($unsigned({(^(wire4 ? (8'hb4) : reg26))}) || reg26))
            begin
              reg128 <= reg16[(2'h3):(2'h3)];
              reg129 <= $unsigned($signed(wire4));
            end
          else
            begin
              reg128 <= ((~reg23) ? reg128 : $unsigned(reg123[(2'h3):(2'h3)]));
              reg129 <= (8'ha2);
              reg130 <= (^~({(-$signed(reg28))} ?
                  $signed($unsigned((~wire118))) : (|((reg24 ?
                      reg126 : reg11) - {wire3, (8'h9d)}))));
            end
          if ((8'hba))
            begin
              reg131 <= $unsigned(((wire120[(3'h7):(2'h3)] << ($unsigned(wire33) & $unsigned(reg8))) ?
                  (~reg29[(1'h1):(1'h0)]) : reg6[(4'h9):(1'h1)]));
              reg132 <= ($signed({wire33[(3'h6):(3'h6)],
                  (~&reg8[(3'h4):(2'h2)])}) & reg131[(4'he):(4'hb)]);
            end
          else
            begin
              reg131 <= ($signed((~&wire0[(1'h1):(1'h1)])) ?
                  {(reg21 ? reg129 : reg130)} : (8'hb7));
              reg132 <= $signed(reg132);
              reg133 <= (~|(($signed(((8'ha8) - wire1)) ?
                      $signed((~|reg124)) : reg24[(4'h8):(2'h2)]) ?
                  {((reg123 || (8'ha5)) ~^ (reg127 + wire4)),
                      {{(8'hac)}, wire1}} : (~&((wire3 ? reg11 : wire0) ?
                      {(8'hb4)} : $unsigned(wire32)))));
              reg134 <= ((|reg25[(3'h7):(3'h4)]) ?
                  $unsigned($unsigned($unsigned({wire4}))) : (^$signed((reg13 != wire1))));
              reg135 <= (reg134[(4'ha):(3'h7)] ?
                  $signed((wire3[(1'h0):(1'h0)] <= (reg13 ?
                      (reg16 ?
                          (8'ha3) : reg13) : reg133))) : (~^((~$signed(reg128)) & {$signed((8'hbf)),
                      reg125})));
            end
        end
      else
        begin
          reg123 <= $signed($signed((~^$signed($unsigned(reg123)))));
          if ((reg24[(3'h4):(1'h1)] ?
              $signed((wire2[(1'h0):(1'h0)] ?
                  $unsigned(reg135[(2'h2):(2'h2)]) : (~|wire4))) : ((~(^$signed(reg23))) ?
                  {$unsigned($signed((8'ha4))),
                      ($unsigned(wire32) ?
                          $unsigned(reg22) : reg7)} : (~&(~^reg6[(2'h3):(1'h0)])))))
            begin
              reg124 <= reg132;
              reg125 <= {(!$signed($signed((+reg134))))};
              reg126 <= $unsigned((^reg30));
              reg127 <= reg23;
            end
          else
            begin
              reg124 <= ($unsigned((+(~|wire19[(4'hf):(3'h7)]))) ?
                  ($unsigned(((reg124 ? reg20 : reg25) <= (reg12 ?
                      wire120 : reg131))) < reg6[(3'h6):(3'h6)]) : {(^~$unsigned((^~wire1)))});
              reg125 <= (&(~^(^~reg17)));
            end
          reg128 <= (!$unsigned($unsigned($unsigned({wire33}))));
          if (((^reg12) & (reg14 ?
              $signed((wire19[(3'h4):(1'h1)] ?
                  (~&reg9) : $signed(wire120))) : reg135)))
            begin
              reg129 <= reg25;
            end
          else
            begin
              reg129 <= reg133[(1'h1):(1'h0)];
            end
          reg130 <= $signed($signed(reg27[(4'hf):(2'h2)]));
        end
    end
  assign wire136 = reg24[(4'ha):(4'ha)];
  assign wire137 = $signed($unsigned($signed((8'hae))));
  assign wire138 = (reg16[(4'h8):(3'h4)] ~^ (!$unsigned(($signed(reg6) ?
                       (8'hb1) : wire3[(2'h2):(2'h2)]))));
  assign wire139 = ({(({reg125, (8'hac)} ?
                               reg30 : reg23[(4'hf):(4'he)]) >= $unsigned((reg29 ?
                               wire18 : wire118))),
                           $signed(reg134)} ?
                       (+{$signed(reg123)}) : wire120);
  assign wire140 = (((~&wire0[(3'h7):(2'h3)]) + ($unsigned($signed(reg17)) ?
                       ($unsigned(reg29) ?
                           (!reg20) : (~wire138)) : (!(wire137 + reg26)))) == reg29);
  assign wire141 = (!$signed($unsigned((&$signed(reg14)))));
  always
    @(posedge clk) begin
      reg142 <= reg13[(4'hc):(2'h2)];
      reg143 <= {(+$unsigned({$unsigned(reg26), (~^reg122)}))};
      if (((reg132[(4'h8):(3'h5)] && (+$signed((wire31 >>> (7'h44))))) && $signed({$signed((~|reg124))})))
        begin
          if ($unsigned(((wire3 ? $signed($unsigned((8'ha7))) : (~^{(8'h9e)})) ?
              wire5[(1'h0):(1'h0)] : $unsigned((reg126 != wire32[(1'h0):(1'h0)])))))
            begin
              reg144 <= wire0[(4'h8):(2'h3)];
            end
          else
            begin
              reg144 <= ($unsigned($signed(wire19)) ?
                  $signed(reg21[(4'ha):(3'h6)]) : (($unsigned((^wire138)) >>> $unsigned((wire0 <<< reg22))) ?
                      reg131 : (wire120 - (~^$signed(reg23)))));
              reg145 <= (wire4[(2'h2):(2'h2)] ?
                  reg23 : (&$unsigned(wire140[(2'h2):(2'h2)])));
              reg146 <= $signed((~|reg130[(3'h7):(2'h2)]));
              reg147 <= {(8'hb2),
                  (((+reg14) ?
                          ((wire2 ^ wire0) ?
                              $unsigned(reg15) : $unsigned((8'hb9))) : (~|$unsigned(wire3))) ?
                      reg21 : $signed(((!reg144) >= {wire120})))};
            end
        end
      else
        begin
          reg144 <= reg8;
          reg145 <= reg133;
        end
      reg148 <= (!$signed(reg9));
      if (reg25)
        begin
          reg149 <= (wire31[(1'h1):(1'h0)] <<< reg130[(5'h13):(5'h10)]);
          if ($signed(reg123))
            begin
              reg150 <= (^~(wire0 ?
                  reg12 : ($signed($signed(reg17)) ?
                      $unsigned($unsigned(reg147)) : $signed(((8'hab) ?
                          reg124 : wire1)))));
              reg151 <= ((+$unsigned(reg125)) == wire18[(3'h4):(1'h1)]);
              reg152 <= (+($unsigned((~&(reg144 ? reg28 : reg148))) ?
                  $unsigned(reg11[(2'h2):(1'h0)]) : {$signed((reg6 & wire139)),
                      $unsigned(reg146)}));
              reg153 <= $signed($unsigned(($signed($signed(reg145)) << reg143[(1'h1):(1'h1)])));
              reg154 <= $signed($unsigned(((^$unsigned((8'hb4))) & $unsigned((-reg25)))));
            end
          else
            begin
              reg150 <= ((reg16 < $signed((reg132[(5'h13):(1'h0)] ?
                  (reg121 ?
                      reg23 : reg133) : reg143[(1'h0):(1'h0)]))) <<< reg150[(3'h4):(2'h3)]);
              reg151 <= wire5;
              reg152 <= $unsigned(wire120[(2'h3):(1'h1)]);
              reg153 <= wire141;
              reg154 <= wire31[(4'h8):(3'h4)];
            end
        end
      else
        begin
          reg149 <= reg143[(2'h2):(1'h0)];
          if ((reg128[(1'h1):(1'h0)] ?
              $unsigned({wire4[(2'h3):(2'h2)],
                  reg150}) : (!((reg125[(3'h5):(3'h4)] + reg24) ?
                  reg9 : $signed($signed(reg122))))))
            begin
              reg150 <= reg21[(3'h4):(2'h2)];
              reg151 <= $unsigned(wire118[(3'h5):(2'h2)]);
              reg152 <= $signed(((reg134[(4'hd):(3'h6)] & reg142[(4'ha):(4'h9)]) ?
                  reg22[(3'h7):(3'h4)] : $unsigned(reg10[(1'h1):(1'h1)])));
              reg153 <= (~&(8'ha9));
            end
          else
            begin
              reg150 <= reg23[(4'he):(1'h1)];
            end
          reg154 <= ($unsigned(reg145[(3'h5):(2'h3)]) << ({(^(-wire18))} >>> reg122));
          reg155 <= $signed(reg7[(4'hb):(4'h9)]);
          reg156 <= reg7[(3'h6):(3'h5)];
        end
    end
  assign wire157 = reg29[(4'h9):(3'h4)];
  assign wire158 = $unsigned({(reg14[(4'hd):(2'h2)] ?
                           (+{reg150, (8'ha0)}) : reg27)});
  assign wire159 = $unsigned($unsigned($unsigned(((&reg132) ?
                       (wire138 != reg148) : (wire140 ? reg135 : reg17)))));
endmodule

module module34  (y, clk, wire35, wire36, wire37, wire38, wire39);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(3'h5):(1'h0)] wire36;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire116;
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  assign y = {wire40,
                 wire82,
                 wire84,
                 wire85,
                 wire116,
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
                 reg52,
                 reg53,
                 (1'h0)};
  assign wire40 = $unsigned(((wire38[(5'h13):(3'h6)] ?
                      (wire39[(3'h5):(2'h2)] == $signed(wire35)) : (~&wire35[(1'h1):(1'h1)])) || (~&wire36[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      if ((^wire37))
        begin
          reg41 <= ((wire37[(2'h2):(1'h0)] ?
                  wire38 : (+(wire36[(1'h0):(1'h0)] ?
                      $signed(wire38) : $unsigned(wire40)))) ?
              $unsigned(wire35[(1'h1):(1'h1)]) : wire36);
          if ($signed((wire40 ? {wire36} : (|$signed(wire35[(4'ha):(3'h7)])))))
            begin
              reg42 <= ((wire39 ?
                  wire39 : wire38[(3'h4):(2'h2)]) ^~ ($unsigned((reg41[(3'h4):(1'h0)] < (wire35 >>> wire38))) + $unsigned({(wire37 ?
                      wire36 : wire40),
                  $signed(wire37)})));
              reg43 <= reg42;
              reg44 <= (8'hb2);
              reg45 <= $signed((~|reg41));
              reg46 <= (~(reg45 > (((8'had) + $signed(wire40)) < $signed((reg41 < wire37)))));
            end
          else
            begin
              reg42 <= (({{{reg43, wire35}, (reg43 ? reg46 : wire35)},
                      $signed({wire38})} || (-reg45)) ?
                  reg45 : wire35[(3'h4):(2'h3)]);
              reg43 <= (+(wire40[(3'h4):(1'h0)] ?
                  reg41 : (!$signed(((8'hb5) == wire37)))));
            end
        end
      else
        begin
          reg41 <= ((($signed((reg43 >> wire35)) < $signed(reg42[(2'h2):(1'h1)])) ?
                  reg41 : {{((8'hb1) ? wire39 : wire40),
                          (reg43 ? wire39 : wire35)},
                      reg46[(2'h2):(1'h0)]}) ?
              $signed((&{(|reg46)})) : (|{wire36[(3'h5):(3'h5)]}));
          reg42 <= {(8'hab)};
        end
      if (($unsigned($signed(wire35[(3'h6):(1'h1)])) <= (^~$unsigned((wire38[(5'h13):(5'h10)] ?
          $signed((8'h9e)) : (+reg45))))))
        begin
          reg47 <= (reg43[(3'h7):(2'h2)] ^~ (($signed(reg42) ?
                  wire38[(3'h5):(2'h3)] : $signed(reg43)) ?
              wire35[(2'h3):(2'h3)] : ((!(wire36 ? wire38 : wire38)) ?
                  ({wire38} ? (-wire36) : (|reg44)) : ((|reg45) != {wire38}))));
          reg48 <= wire36[(2'h2):(1'h1)];
        end
      else
        begin
          reg47 <= reg46[(1'h0):(1'h0)];
          reg48 <= reg43;
        end
      reg49 <= wire37[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg50 <= $signed((|(8'hb8)));
      reg51 <= reg42;
      reg52 <= (($signed(wire36) ?
              $signed(((reg41 ? wire36 : reg47) ?
                  (wire40 ~^ wire40) : {(8'h9f)})) : (wire39 ^ {(reg51 || reg42),
                  {reg44}})) ?
          reg43[(3'h7):(3'h4)] : reg45[(1'h1):(1'h1)]);
      reg53 <= (&($unsigned(($signed(reg42) >> $unsigned(wire35))) ?
          $unsigned(((+wire39) ?
              reg48[(2'h2):(1'h0)] : $unsigned((7'h42)))) : ((8'hae) > reg48[(5'h13):(1'h1)])));
    end
  module54 #() modinst83 (.y(wire82), .wire57(wire39), .clk(clk), .wire58(reg46), .wire56(reg49), .wire55(reg48), .wire59(wire37));
  assign wire84 = (!({($signed(reg50) < (reg43 <= wire35)),
                          $unsigned(reg48[(4'h9):(4'h8)])} ?
                      $signed(($signed(reg50) >= (-wire37))) : reg48[(3'h6):(3'h5)]));
  assign wire85 = $unsigned(wire35[(4'hd):(4'ha)]);
  module86 #() modinst117 (wire116, clk, reg44, reg52, reg47, reg51, wire85);
endmodule

module module86
#(parameter param114 = ({(!{((8'ha6) ? (8'ha3) : (8'hb7))})} > (({{(8'hae), (8'hbd)}} <= ((~^(8'haf)) ? {(7'h42), (8'hbb)} : ((8'ha1) ? (8'h9c) : (7'h44)))) < ((((8'hb4) ? (7'h44) : (8'ha0)) ~^ (|(7'h43))) ? ((~&(8'ha6)) ? ((8'ha0) >>> (8'hb4)) : ((8'hbe) < (7'h44))) : ((!(8'h9e)) ? (^~(8'ha0)) : ((8'hb0) * (7'h44)))))), 
parameter param115 = (((~|((param114 ? param114 : param114) <= (param114 ? param114 : param114))) ? ((|(!param114)) > ({(8'ha1), param114} ? ((8'ha1) ? param114 : (7'h44)) : (param114 ? param114 : param114))) : (((param114 ? param114 : (8'hb4)) <= {param114, param114}) ? (^~(param114 - param114)) : ((param114 > param114) ^ (param114 ? (8'hae) : param114)))) != param114))
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire91;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire [(5'h13):(1'h0)] wire89;
  input wire signed [(3'h4):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire104;
  wire [(4'he):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg95 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire94,
                 wire93,
                 wire92,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire92 = $signed({$unsigned(($unsigned(wire90) ?
                          (~&(8'hb3)) : wire88[(2'h2):(2'h2)]))});
  assign wire93 = (~wire87);
  assign wire94 = wire87;
  always
    @(posedge clk) begin
      reg95 <= (+$signed($signed($signed((~wire94)))));
      reg96 <= (wire88[(1'h0):(1'h0)] ? (8'ha3) : wire92);
      reg97 <= (($unsigned($unsigned($signed(reg96))) ?
          ((8'hb1) >>> wire90[(1'h1):(1'h1)]) : (+$unsigned(wire93))) <= (^~wire94[(3'h5):(2'h2)]));
      reg98 <= wire94[(3'h6):(3'h5)];
    end
  assign wire99 = $unsigned(($unsigned(((wire92 || wire94) < (8'hbf))) && (((-wire92) ?
                          reg98[(2'h3):(2'h3)] : wire92[(1'h0):(1'h0)]) ?
                      wire87[(4'h8):(3'h6)] : ((wire89 ?
                          wire87 : reg96) != (wire88 <<< wire88)))));
  assign wire100 = $unsigned(((((wire99 * wire93) ?
                       $signed(wire99) : (7'h44)) <= ((wire94 ?
                       wire99 : wire94) * (8'ha7))) >> (reg96[(3'h7):(2'h3)] || (~&reg98[(2'h3):(2'h3)]))));
  assign wire101 = ({{(8'h9c)}} << ((reg98 ?
                       (^$signed(wire92)) : (~(|(8'ha8)))) >> ((wire92 ^ {wire91}) >>> wire92[(3'h4):(3'h4)])));
  assign wire102 = $signed((~^wire88[(2'h3):(1'h1)]));
  assign wire103 = (reg98 ? (^~{wire90[(3'h7):(3'h7)]}) : wire92);
  assign wire104 = $signed(reg95);
  always
    @(posedge clk) begin
      reg105 <= $signed((reg95[(3'h5):(3'h4)] <<< $signed((wire92[(3'h5):(3'h4)] && (wire100 ?
          wire100 : wire87)))));
    end
  always
    @(posedge clk) begin
      if (wire93[(3'h6):(1'h1)])
        begin
          reg106 <= $unsigned((-((&(reg95 >= wire103)) ^ ($unsigned(wire87) >> wire94[(3'h7):(2'h3)]))));
          reg107 <= $signed((-(&($unsigned(wire104) || wire88[(2'h3):(1'h0)]))));
          reg108 <= (((((reg107 == (8'ha1)) >= (wire100 ? wire89 : reg95)) ?
                  (8'ha4) : $signed((8'hbf))) ?
              $signed($signed(reg98[(3'h6):(2'h3)])) : $signed(reg95)) == ($signed(reg98[(1'h1):(1'h0)]) ?
              wire99 : $signed(reg98)));
          reg109 <= {($signed(reg108) - ((((8'hb9) ? wire101 : wire101) ?
                      $unsigned(reg107) : wire93) ?
                  (reg108[(2'h2):(1'h0)] ?
                      wire88[(2'h2):(1'h0)] : (wire101 ^ reg98)) : $unsigned(wire102)))};
        end
      else
        begin
          reg106 <= $unsigned(wire88);
          reg107 <= $signed({(reg97[(1'h1):(1'h1)] ?
                  $signed(((8'ha8) | wire103)) : {wire93})});
          reg108 <= reg98;
          reg109 <= (!reg109);
        end
      reg110 <= (!(wire100[(3'h5):(1'h0)] << reg106[(3'h4):(2'h2)]));
    end
  assign wire111 = (wire87 <= $signed((wire88[(3'h4):(1'h1)] * ((wire87 + wire101) ?
                       reg98[(1'h1):(1'h0)] : $signed((8'hab))))));
  assign wire112 = $signed(({({wire88} * (wire94 ? reg110 : reg105)),
                       (reg105[(2'h3):(2'h2)] && wire101[(3'h4):(1'h0)])} - ($signed((wire103 == wire102)) << $signed({reg106}))));
  assign wire113 = ($signed((~^$unsigned($signed(wire91)))) ^ reg98);
endmodule

module module54
#(parameter param81 = ((-{(~^((8'hbc) != (8'hb9)))}) >>> {(~^{{(8'hb5), (8'hb6)}, ((8'ha9) ? (7'h40) : (8'h9e))})}))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire59;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  input wire signed [(4'h9):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire60;
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire73,
                 wire72,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg75,
                 reg74,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire60 = {(wire57 ?
                          (wire58 ?
                              (~^$signed(wire55)) : $signed(wire55)) : wire58[(3'h4):(2'h3)]),
                      {(8'hbd),
                          (^((wire58 != wire57) ?
                              (8'hb2) : (wire58 ? wire55 : wire57)))}};
  assign wire61 = wire60[(1'h1):(1'h1)];
  assign wire62 = $signed(({(8'had), (^{wire59})} ?
                      {wire56, wire59} : {(-wire60), (!$unsigned(wire59))}));
  assign wire63 = {$signed($signed((wire56 ?
                          (wire56 < wire62) : ((8'ha3) << wire57))))};
  assign wire64 = $signed(wire63[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg65 <= wire55[(2'h2):(2'h2)];
      reg66 <= $signed(((($unsigned(wire60) ?
              reg65[(2'h3):(1'h0)] : wire59[(3'h7):(2'h2)]) ?
          ((8'hba) - wire64) : {(^wire58)}) ^ ((~^wire57[(1'h0):(1'h0)]) ?
          ((wire62 << (8'hbb)) ?
              wire61[(1'h0):(1'h0)] : $unsigned(wire56)) : $unsigned($signed(wire57)))));
      reg67 <= wire64;
      reg68 <= wire57;
    end
  always
    @(posedge clk) begin
      reg69 <= $unsigned(((((wire64 > wire62) * $signed(reg66)) >>> (wire57 == $unsigned(wire64))) || $unsigned((^(^wire60)))));
      reg70 <= wire58[(5'h12):(4'he)];
      reg71 <= ($signed($unsigned(((~&wire55) ?
          (reg68 ? reg65 : wire57) : {wire55,
              reg68}))) & {wire62[(1'h0):(1'h0)]});
    end
  assign wire72 = $unsigned($signed($signed((~reg71))));
  assign wire73 = {reg71[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg74 <= $signed({wire59[(3'h5):(2'h3)]});
      reg75 <= (|({{reg68[(3'h7):(2'h2)], (wire64 ? reg69 : wire59)},
              (reg67 <= (reg70 ? reg68 : (8'hbb)))} ?
          wire63 : (($signed(wire56) | $unsigned(wire61)) <= reg71[(1'h1):(1'h1)])));
    end
  assign wire76 = reg69[(4'he):(1'h1)];
  assign wire77 = (wire73 ?
                      $signed($signed((^~$unsigned(reg66)))) : wire60[(1'h1):(1'h1)]);
  assign wire78 = $signed($unsigned(reg68));
  assign wire79 = reg70;
  assign wire80 = $unsigned({$unsigned($unsigned(wire62)),
                      ((~&(^~wire61)) ?
                          {$signed(reg70)} : $unsigned($unsigned(reg68)))});
endmodule
