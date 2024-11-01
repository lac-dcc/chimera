module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h326):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire153;
  wire [(3'h4):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire151;
  wire signed [(3'h6):(1'h0)] wire150;
  wire [(4'hd):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire136,
                 wire43,
                 wire42,
                 wire41,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg168,
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
                 reg155,
                 reg154,
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
                 reg138,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({wire1[(3'h6):(1'h0)]})
        begin
          reg4 <= (((wire2[(3'h7):(3'h5)] && wire3) << $signed($signed($unsigned(wire0)))) && (~$signed((~|((8'hbb) < wire0)))));
          reg5 <= ($unsigned(wire3[(4'hb):(4'h9)]) - (wire2[(2'h2):(1'h0)] ?
              (8'hb8) : (reg4 ? wire0 : $unsigned(wire1))));
          reg6 <= {$unsigned((~&((+wire3) >= wire1))),
              ($unsigned({(reg5 ? wire0 : reg4),
                  $signed((8'h9d))}) | wire0[(5'h12):(4'he)])};
          reg7 <= $unsigned($signed((8'hb2)));
        end
      else
        begin
          reg4 <= ($signed((reg4[(4'h8):(4'h8)] != $unsigned((reg4 ?
                  reg7 : reg4)))) ?
              $signed($signed(((-wire3) ?
                  $unsigned(wire1) : $unsigned(reg5)))) : $unsigned($unsigned(wire2[(2'h3):(1'h1)])));
          if ((-({{(!wire3)},
              ((-reg4) != $unsigned(reg4))} ^~ wire2[(1'h1):(1'h0)])))
            begin
              reg5 <= reg6[(2'h2):(2'h2)];
              reg6 <= (($signed(wire2[(3'h5):(3'h4)]) ?
                  reg7 : {(|(wire3 == wire1))}) ^ (!$signed((reg4 ^ (reg4 ?
                  wire0 : wire2)))));
              reg7 <= (^reg4);
            end
          else
            begin
              reg5 <= ($signed((~^$unsigned(reg7))) ?
                  ($signed(reg5) ?
                      reg6 : (|wire2)) : $unsigned($unsigned((~^(^~wire2)))));
              reg6 <= reg5;
              reg7 <= {reg6[(2'h3):(2'h3)]};
              reg8 <= (reg5 < $unsigned(reg4[(4'ha):(4'h8)]));
            end
          if (wire2)
            begin
              reg9 <= ($unsigned(wire2) <= $unsigned({{reg6[(4'h9):(4'h9)]}}));
              reg10 <= (($unsigned($signed($signed(reg7))) | {reg6[(4'h9):(4'h9)]}) & $signed((~($unsigned(reg6) || (^reg5)))));
              reg11 <= $signed($signed(wire3[(4'h8):(1'h0)]));
              reg12 <= {reg8, wire2[(3'h5):(2'h2)]};
              reg13 <= $signed({reg8[(3'h6):(3'h6)], wire1[(3'h5):(3'h5)]});
            end
          else
            begin
              reg9 <= {$unsigned(($unsigned((!reg6)) ?
                      ($unsigned(reg4) ?
                          (reg5 ?
                              (8'hb4) : (8'hbc)) : reg7[(5'h13):(5'h11)]) : reg5)),
                  reg8};
              reg10 <= reg4[(3'h5):(3'h5)];
              reg11 <= wire2;
              reg12 <= ((^wire0) == $unsigned(({(reg7 >= (8'hac))} + ($signed(wire0) || $signed(reg7)))));
            end
          reg14 <= ((8'ha8) ? (8'h9f) : (~$unsigned((&$unsigned(reg12)))));
        end
    end
  assign wire15 = (!reg7);
  assign wire16 = (~$signed(reg5[(3'h4):(1'h1)]));
  assign wire17 = (~&{$signed(reg8[(4'hf):(1'h0)]), $unsigned(wire0)});
  assign wire18 = $unsigned(((~^reg5) ?
                      {((reg10 != wire15) ? (reg7 == reg14) : (reg8 > (8'hb5))),
                          (!wire15[(3'h6):(1'h1)])} : ((reg5 ?
                          (~&reg11) : $unsigned(reg10)) - {reg5[(1'h1):(1'h0)],
                          wire0})));
  assign wire19 = {(8'hb1)};
  assign wire20 = $signed((($signed(wire0[(5'h11):(3'h7)]) >> wire16) ?
                      (|(wire15[(3'h7):(3'h4)] ?
                          (reg8 | reg14) : $unsigned(wire16))) : (wire3 >> $signed((~reg8)))));
  assign wire21 = ({$unsigned(($unsigned(wire18) - reg7)),
                      (wire20 <= $unsigned((8'hbc)))} >> ($signed(((wire17 ?
                              wire18 : reg5) ?
                          reg4 : (~|reg14))) ?
                      $signed(reg12) : (reg6 ?
                          $signed($signed(reg8)) : reg4[(5'h11):(2'h2)])));
  assign wire22 = ({$signed($unsigned(wire0[(4'hf):(3'h7)]))} || {wire18[(1'h0):(1'h0)],
                      reg5[(1'h1):(1'h1)]});
  always
    @(posedge clk) begin
      reg23 <= wire19[(3'h6):(3'h6)];
      reg24 <= (($signed($signed(reg9)) ?
              ((wire17 ?
                  (reg8 - reg7) : {(7'h41)}) != ($unsigned((8'ha6)) <= $unsigned(wire15))) : (reg14 ?
                  wire19 : {wire0, ((8'hbd) << wire22)})) ?
          wire21 : reg12);
    end
  always
    @(posedge clk) begin
      if (reg14)
        begin
          reg25 <= ((!{$unsigned($signed(wire1)),
                  $signed(reg24[(2'h2):(1'h1)])}) ?
              $unsigned(((wire22 ? wire19 : (wire21 ? reg24 : wire21)) ?
                  ($unsigned(reg4) ^ ((8'hb0) + wire16)) : $signed(wire19[(1'h1):(1'h1)]))) : (wire18 * $signed((^~$unsigned(wire0)))));
          reg26 <= (|$unsigned(wire1));
          reg27 <= ((reg6[(2'h2):(1'h0)] && $unsigned(($signed(wire1) ?
              (reg13 != reg7) : {reg12}))) << {reg7});
        end
      else
        begin
          reg25 <= $unsigned((reg12 ?
              $signed(wire15[(3'h6):(2'h3)]) : ($signed((reg7 ?
                      wire22 : (8'ha0))) ?
                  reg23 : ((^(8'h9e)) ?
                      reg11[(3'h6):(3'h6)] : {reg11, reg9}))));
          if ({{$signed($signed((wire3 ? (8'hbf) : reg10)))}})
            begin
              reg26 <= {reg26[(1'h1):(1'h1)]};
              reg27 <= ($unsigned($unsigned($unsigned((wire1 ^ reg24)))) ?
                  wire18[(3'h4):(2'h2)] : (~|(-{reg27[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg26 <= reg24[(4'ha):(3'h5)];
            end
          if (reg9[(4'ha):(3'h7)])
            begin
              reg28 <= (|(~^wire20[(4'hc):(3'h6)]));
            end
          else
            begin
              reg28 <= reg28;
              reg29 <= ((wire21[(3'h6):(2'h2)] & (!$signed((!wire3)))) <= reg13[(4'h9):(3'h6)]);
              reg30 <= wire2[(2'h2):(1'h1)];
            end
        end
      reg31 <= ((((^(reg9 ? (8'haa) : wire16)) ?
              reg11 : (((8'ha6) ? reg7 : reg25) < (~&wire19))) ?
          (reg13[(2'h2):(2'h2)] >= ((~&wire21) != (wire3 ^ reg25))) : (reg13 >>> wire1)) << wire22);
      reg32 <= ($unsigned({(!$signed(wire16)),
          {{reg8}}}) < wire17[(1'h0):(1'h0)]);
      reg33 <= wire21;
      if (reg13[(3'h5):(1'h1)])
        begin
          reg34 <= ((^(reg5[(3'h4):(3'h4)] ?
              (!wire1) : ($unsigned(reg32) ?
                  ((8'hbd) ?
                      wire15 : (8'had)) : $signed(wire2)))) - $signed(wire18[(1'h0):(1'h0)]));
        end
      else
        begin
          if ((reg5[(1'h1):(1'h1)] ?
              $signed($signed($unsigned(reg13[(1'h0):(1'h0)]))) : ($signed((~^wire20)) & {(8'ha1)})))
            begin
              reg34 <= (&{$signed(wire2[(2'h3):(1'h0)]),
                  $unsigned({(reg11 & reg8), (reg13 ? reg28 : wire20)})});
              reg35 <= {reg25,
                  ((wire19 >= reg30[(2'h2):(1'h1)]) ?
                      $unsigned((reg30[(2'h2):(1'h1)] <<< (reg33 ?
                          reg33 : wire1))) : (~reg30))};
              reg36 <= reg33[(3'h4):(1'h0)];
              reg37 <= ($unsigned((wire19 ?
                      (reg8 ?
                          reg12[(2'h2):(2'h2)] : {reg14}) : reg30[(2'h2):(1'h0)])) ?
                  ({((reg5 << reg23) ?
                          (reg32 ?
                              reg4 : reg35) : $signed(reg30))} * wire19[(2'h3):(2'h3)]) : ({$unsigned((+reg33)),
                          {{wire16}, (reg10 ? wire16 : reg30)}} ?
                      (8'hae) : $unsigned((~reg31[(3'h4):(1'h1)]))));
              reg38 <= wire21;
            end
          else
            begin
              reg34 <= $signed((+((|(wire0 && wire0)) <= $signed($signed((7'h41))))));
              reg35 <= reg10;
              reg36 <= ($signed((^~$unsigned({reg8}))) | reg14[(5'h13):(4'h9)]);
              reg37 <= ({$signed((~|wire21[(3'h4):(2'h3)])),
                      $unsigned((&(wire22 <= (8'hb8))))} ?
                  $unsigned($unsigned((+(^~reg8)))) : $signed(reg28[(1'h0):(1'h0)]));
            end
          reg39 <= reg12[(1'h1):(1'h1)];
          reg40 <= reg10;
        end
    end
  assign wire41 = (reg13[(4'he):(4'hb)] >> wire3[(1'h0):(1'h0)]);
  assign wire42 = (^$unsigned(reg9));
  assign wire43 = $unsigned(((!($unsigned(wire2) ?
                      $signed((8'hac)) : reg35[(2'h3):(1'h0)])) << reg34));
  module44 #() modinst137 (.wire46(reg4), .wire49(reg8), .y(wire136), .wire45(reg28), .wire47(reg7), .clk(clk), .wire48(reg12));
  always
    @(posedge clk) begin
      reg138 <= (8'hb1);
      if ({(wire0 ?
              ($unsigned($signed(reg8)) ?
                  reg8 : (^wire17[(4'hc):(4'ha)])) : {($signed(reg27) ?
                      $unsigned((8'hb1)) : reg28[(4'hb):(1'h0)]),
                  wire41[(4'hf):(3'h5)]}),
          $signed(((8'ha7) * $unsigned((^reg30))))})
        begin
          reg139 <= $signed((($unsigned(reg7[(4'hd):(3'h6)]) || $signed((!reg14))) ?
              (~reg11[(3'h5):(2'h2)]) : $signed(reg11[(2'h3):(2'h2)])));
          reg140 <= ((($unsigned((reg23 ? wire22 : wire0)) ?
                  wire22 : reg40) & ($unsigned(wire3) ?
                  reg38 : reg27[(3'h4):(2'h3)])) ?
              (reg33 == ((8'h9d) >= ((~^wire17) >>> $signed(wire17)))) : reg10);
          if ($unsigned({(8'ha0)}))
            begin
              reg141 <= (^~$unsigned((|(|$signed(reg29)))));
            end
          else
            begin
              reg141 <= (reg141[(2'h2):(2'h2)] ?
                  ((-(8'hb6)) ?
                      ((-reg35[(1'h1):(1'h0)]) ?
                          (|$signed((8'haa))) : $signed({reg36})) : ({(reg6 != (8'hba))} ?
                          wire18 : (reg33 ^~ reg39))) : {reg33[(1'h0):(1'h0)],
                      $signed(reg14)});
            end
          reg142 <= reg9;
        end
      else
        begin
          reg139 <= {{wire18, wire17[(4'hb):(4'hb)]}};
          reg140 <= (+reg40);
          if (reg7[(4'he):(1'h1)])
            begin
              reg141 <= reg13;
              reg142 <= ((~&(~&(~|reg30[(3'h5):(3'h4)]))) ?
                  {(^~reg33)} : (^~$unsigned(wire18)));
              reg143 <= ({$signed({reg39, reg8})} ? reg7 : $unsigned(wire15));
              reg144 <= $unsigned($unsigned((reg34[(1'h0):(1'h0)] ?
                  ($signed(reg38) ~^ (reg7 ?
                      (8'hb2) : wire136)) : ($signed(wire17) ?
                      reg32 : (+reg30)))));
            end
          else
            begin
              reg141 <= (reg139 ^ $signed(reg30[(4'h9):(1'h0)]));
              reg142 <= reg36[(4'he):(3'h5)];
            end
          reg145 <= wire136;
          if (reg23)
            begin
              reg146 <= (^$signed({{(reg31 == reg9), (-reg8)}}));
            end
          else
            begin
              reg146 <= (^reg7[(4'h9):(3'h6)]);
              reg147 <= ((!(^((~^reg38) & wire17[(3'h4):(3'h4)]))) ?
                  (reg139[(2'h2):(1'h0)] | $unsigned(((reg145 + reg36) ?
                      $unsigned((8'haa)) : ((8'hb9) ?
                          reg40 : (8'hb9))))) : wire15[(2'h2):(1'h1)]);
              reg148 <= ({{($unsigned(reg144) == $unsigned(reg37)),
                      reg39}} ^~ wire43);
            end
        end
      reg149 <= reg31[(1'h1):(1'h1)];
    end
  assign wire150 = $signed(reg25);
  assign wire151 = {reg33[(2'h2):(1'h0)]};
  assign wire152 = (reg138[(2'h2):(1'h0)] <= wire22);
  assign wire153 = $signed($unsigned($signed($unsigned($signed(reg37)))));
  always
    @(posedge clk) begin
      if (((~&$unsigned(wire41[(4'h8):(3'h5)])) ?
          $signed($signed(reg7[(4'ha):(2'h2)])) : (|((~&(reg32 >= wire0)) ?
              reg34[(4'hb):(1'h0)] : $signed({reg5})))))
        begin
          reg154 <= (+reg24);
          reg155 <= (|(($signed((|reg38)) * reg144[(3'h4):(1'h0)]) || (reg39 | $unsigned(((8'ha5) ?
              wire20 : wire136)))));
          reg156 <= (reg24 + $signed((8'ha3)));
        end
      else
        begin
          if ($signed($unsigned((!(&(~reg12))))))
            begin
              reg154 <= reg23;
              reg155 <= (-(^~reg35));
              reg156 <= {reg5[(1'h1):(1'h1)]};
              reg157 <= (wire0[(5'h14):(4'h8)] ?
                  $signed($unsigned((~|(~wire3)))) : reg24[(3'h6):(2'h3)]);
            end
          else
            begin
              reg154 <= reg7[(5'h11):(4'h8)];
              reg155 <= reg14;
              reg156 <= (8'ha6);
            end
          reg158 <= reg30[(1'h1):(1'h0)];
          if ($unsigned(reg27[(4'ha):(4'h9)]))
            begin
              reg159 <= reg141;
              reg160 <= (($signed((reg13 >= $unsigned(wire22))) < (^~$unsigned($unsigned(wire3)))) >>> $unsigned($signed($signed(reg40[(1'h1):(1'h1)]))));
              reg161 <= $unsigned(reg27[(2'h2):(1'h0)]);
              reg162 <= reg157[(3'h4):(1'h0)];
              reg163 <= ($signed((((reg13 * wire41) || $signed(reg159)) && (&reg4))) ?
                  ((|$unsigned(reg149)) + reg24[(1'h1):(1'h0)]) : (+wire2));
            end
          else
            begin
              reg159 <= {(wire22[(2'h2):(2'h2)] ?
                      ($signed($unsigned(wire16)) + wire19) : reg138)};
            end
          reg164 <= $unsigned(reg40);
          if ((wire22[(1'h1):(1'h0)] ?
              $unsigned($signed($unsigned((8'hb0)))) : (|(reg29 << reg147))))
            begin
              reg165 <= wire19;
              reg166 <= $signed(wire15);
              reg167 <= wire0[(4'hb):(3'h7)];
              reg168 <= $signed(({($signed(reg161) ?
                          wire21[(1'h0):(1'h0)] : (-reg165))} ?
                  (!(^$signed(reg9))) : ({((8'h9f) ? reg161 : reg30),
                      reg156[(4'h8):(4'h8)]} == $unsigned($signed(reg138)))));
            end
          else
            begin
              reg165 <= reg143[(3'h5):(3'h4)];
              reg166 <= reg4[(4'hd):(3'h7)];
            end
        end
    end
endmodule

module module44
#(parameter param134 = {(((((8'haa) ? (8'ha3) : (8'hbf)) ? (~(8'hb0)) : {(8'hab)}) - (|((8'ha9) ? (8'hae) : (8'hbc)))) ^~ (-{(^(8'ha6)), ((8'hba) ? (8'ha6) : (8'ha7))})), (((((8'hb7) ? (8'h9d) : (8'h9e)) >= (~&(8'h9e))) ? ((~|(8'ha5)) * ((8'hb6) || (8'hb4))) : (-((8'hb5) <<< (8'hbc)))) ? ((~|{(8'ha5), (8'hb8)}) ? (((8'hb6) && (8'h9d)) >= ((7'h43) - (8'hab))) : (((8'had) + (8'haa)) == ((8'h9c) ? (8'h9c) : (8'hab)))) : (~&{((8'hb7) ? (7'h43) : (8'hab)), {(8'hbd)}}))}, 
parameter param135 = (|((param134 - ({(8'ha7)} ? (~^param134) : (|param134))) ? {param134, param134} : ((8'hb9) ? (param134 && param134) : (~&((8'hac) >= param134))))))
(y, clk, wire45, wire46, wire47, wire48, wire49);
  output wire [(32'h2bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(4'hc):(1'h0)] wire46;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire48;
  input wire [(5'h13):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire78;
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h13):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(4'hd):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire78,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 (1'h0)};
  assign wire50 = $signed({$unsigned(($unsigned(wire47) ?
                          (!wire46) : (wire46 ? wire49 : wire47)))});
  assign wire51 = (~wire47[(2'h2):(1'h0)]);
  assign wire52 = ($unsigned((wire47[(2'h2):(2'h2)] ?
                      (^$unsigned(wire49)) : $signed((~wire48)))) <<< ($unsigned(wire50) & wire48));
  assign wire53 = (({(wire45 ? {wire48, wire52} : (wire46 ? wire46 : wire47)),
                              (+(wire51 ? wire48 : wire49))} ?
                          ((~^wire50[(1'h1):(1'h1)]) ?
                              (&(wire47 ?
                                  (7'h44) : wire49)) : (8'ha7)) : wire48[(1'h0):(1'h0)]) ?
                      {$signed(((wire46 == wire50) ^ (wire51 ?
                              wire48 : wire48))),
                          (wire45[(3'h7):(3'h7)] ?
                              wire46 : $signed(wire52[(2'h3):(2'h3)]))} : ($signed(wire48[(3'h6):(2'h2)]) ?
                          (8'hb8) : (~&(wire46 ^~ $signed(wire52)))));
  assign wire54 = $unsigned($signed(wire48[(1'h0):(1'h0)]));
  module55 #() modinst79 (.wire60(wire48), .wire58(wire51), .wire57(wire53), .wire56(wire49), .clk(clk), .y(wire78), .wire59(wire54));
  assign wire80 = ((wire48 ?
                          wire50[(3'h4):(3'h4)] : (|((^(8'hbc)) ~^ (wire49 ?
                              wire46 : wire46)))) ?
                      ($signed(($unsigned(wire52) ?
                          (wire48 <= wire46) : $unsigned(wire54))) | $unsigned(wire54)) : (wire48[(3'h4):(1'h0)] ?
                          ((!wire45[(1'h1):(1'h1)]) ?
                              wire50[(1'h0):(1'h0)] : ((~|wire78) >> (wire49 ?
                                  (8'hba) : wire46))) : ($unsigned(wire50[(2'h2):(2'h2)]) * wire51[(3'h4):(1'h1)])));
  assign wire81 = wire50;
  assign wire82 = wire53;
  assign wire83 = wire51[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed((~|$signed({wire54, wire48[(5'h11):(3'h7)]}))))
        begin
          reg84 <= (|$signed((wire52[(1'h0):(1'h0)] < wire47)));
        end
      else
        begin
          reg84 <= (($unsigned((~|(wire81 && reg84))) ?
              ({$unsigned(wire53), $unsigned((8'h9f))} ?
                  (^(8'ha9)) : wire54[(5'h10):(4'h8)]) : $signed((~|(wire48 - wire49)))) ^~ (((!(wire50 ?
                  wire80 : wire50)) <= ($unsigned(wire50) ?
                  wire53 : (^~(8'ha7)))) ?
              {(wire49 ? wire49 : $unsigned((8'ha2))),
                  $signed((+wire50))} : $signed($signed($signed((8'hb8))))));
          if (((~((!$signed((8'hb1))) ^ {$signed(wire45)})) ?
              wire52[(4'h8):(1'h0)] : ($unsigned(wire48[(3'h4):(1'h1)]) ?
                  $unsigned(((^wire81) ?
                      $unsigned(wire51) : (~^wire45))) : wire80)))
            begin
              reg85 <= (7'h43);
              reg86 <= $unsigned(wire50[(1'h0):(1'h0)]);
              reg87 <= wire46;
              reg88 <= (wire46 ^~ wire82);
            end
          else
            begin
              reg85 <= ($unsigned(wire52[(4'h8):(2'h2)]) ?
                  ((-wire80[(1'h0):(1'h0)]) < wire82[(4'hf):(3'h4)]) : (wire50 ?
                      wire78 : $signed(reg85[(5'h13):(5'h11)])));
              reg86 <= (8'h9f);
              reg87 <= wire48;
              reg88 <= wire51[(2'h3):(1'h0)];
              reg89 <= ({(wire45[(4'h8):(3'h4)] ?
                          (wire47[(1'h0):(1'h0)] ^~ (wire50 & wire51)) : (!(8'h9e)))} ?
                  (((~^(~|reg84)) ?
                      (reg85 ?
                          wire50 : (wire53 + wire80)) : reg84[(3'h6):(2'h2)]) < (^$signed((wire48 <= reg85)))) : wire81[(4'ha):(4'ha)]);
            end
          reg90 <= ((wire82[(5'h13):(5'h10)] >>> (|$unsigned({reg88,
                  (8'hab)}))) ?
              {(8'h9c)} : (~wire83[(2'h3):(2'h3)]));
          reg91 <= (({($unsigned(reg90) ? $signed(reg87) : $signed(wire78)),
                  wire78[(4'ha):(1'h0)]} << (|$unsigned($signed(wire48)))) ?
              wire52 : wire47[(2'h2):(1'h1)]);
        end
      if (reg86[(4'hf):(2'h2)])
        begin
          if ($signed({((7'h44) == $unsigned((reg85 < reg91))), wire47}))
            begin
              reg92 <= $unsigned(reg90[(2'h2):(1'h0)]);
              reg93 <= $unsigned(wire49[(3'h6):(3'h6)]);
              reg94 <= $unsigned({$signed(((!(7'h44)) + reg89))});
              reg95 <= ((~^((~|{(8'h9f),
                      reg94}) ~^ $signed($unsigned((8'ha4))))) ?
                  reg94 : $unsigned($signed(wire83)));
              reg96 <= (^~((+$unsigned($unsigned(reg93))) + ((wire48 ?
                      wire53 : reg90[(1'h0):(1'h0)]) ?
                  reg90[(3'h4):(2'h2)] : $signed((wire78 ? reg95 : wire51)))));
            end
          else
            begin
              reg92 <= reg85[(5'h12):(5'h10)];
              reg93 <= wire54;
              reg94 <= ((~|((8'hb4) ?
                      ((8'hb1) ?
                          (8'ha8) : (wire78 && reg91)) : $unsigned(reg84[(4'h8):(3'h7)]))) ?
                  reg89 : (reg87[(2'h2):(1'h0)] ?
                      wire54 : {($unsigned((8'ha0)) * $signed(reg88))}));
              reg95 <= reg92[(5'h13):(5'h12)];
              reg96 <= (~$signed($unsigned($unsigned((^~wire47)))));
            end
          reg97 <= wire45[(3'h4):(2'h3)];
        end
      else
        begin
          if (($unsigned((!$unsigned(((7'h43) | reg84)))) ?
              $signed(wire80[(1'h1):(1'h1)]) : wire53))
            begin
              reg92 <= (((~|reg89[(4'hc):(1'h0)]) > $unsigned((^~$signed(reg92)))) ~^ $unsigned(reg88));
              reg93 <= (!wire47[(3'h4):(2'h2)]);
              reg94 <= (8'ha7);
            end
          else
            begin
              reg92 <= $signed(($signed(((reg92 >>> reg88) ^~ (reg88 ^ wire53))) ?
                  $unsigned((+(reg91 < (8'hb0)))) : (((reg92 ?
                      (8'hac) : reg89) <= $unsigned(reg88)) & (reg95 ?
                      $unsigned(wire78) : (8'hb8)))));
              reg93 <= wire81[(2'h2):(1'h0)];
              reg94 <= $unsigned(((wire46[(2'h3):(2'h2)] ?
                  $unsigned(wire78[(3'h7):(3'h6)]) : wire82) && wire50[(2'h3):(2'h3)]));
              reg95 <= $signed(wire50[(1'h0):(1'h0)]);
              reg96 <= {{((^~(+wire81)) ? (~&$signed(wire50)) : {(~&reg94)}),
                      {(wire83 << (reg84 <<< reg94))}}};
            end
        end
      reg98 <= (reg93[(4'hf):(4'ha)] >= ($signed({(wire83 ? wire83 : wire52)}) ?
          (+((reg91 ? wire45 : wire47) ?
              $signed(reg90) : wire54)) : ({{reg88}} ?
              (^~$signed((8'haa))) : ((~^(8'hac)) * $signed(wire83)))));
    end
  assign wire99 = (wire81 > wire80);
  assign wire100 = {(reg90[(3'h5):(1'h0)] ?
                           (7'h43) : ($unsigned($unsigned(reg90)) ~^ wire99[(4'h8):(3'h5)])),
                       (&(~($unsigned(reg85) << $unsigned(reg88))))};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned(wire45[(3'h6):(2'h2)]))))
        begin
          reg101 <= {$unsigned(((|reg86) ?
                  (~$unsigned(wire53)) : {$signed((8'hba))})),
              (+wire83)};
          reg102 <= (-(^~$unsigned($unsigned((^~(8'ha6))))));
          if ($unsigned((7'h40)))
            begin
              reg103 <= (+$signed($signed((wire48[(2'h3):(1'h1)] ?
                  (reg86 ? reg102 : wire52) : wire100[(3'h6):(3'h4)]))));
              reg104 <= ((&reg88[(1'h1):(1'h1)]) ?
                  $signed((($signed(wire47) ?
                      wire54[(5'h10):(4'hf)] : (&reg92)) && ((wire53 << wire54) ?
                      (8'ha2) : $signed(wire49)))) : reg97);
              reg105 <= reg88[(4'hb):(4'h8)];
            end
          else
            begin
              reg103 <= $signed($unsigned(wire50[(1'h0):(1'h0)]));
              reg104 <= reg85;
            end
          reg106 <= wire51;
        end
      else
        begin
          reg101 <= $signed(reg102);
        end
      reg107 <= ($unsigned(wire99[(3'h6):(1'h1)]) < wire100[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ($signed(wire99[(3'h6):(3'h6)]))
        begin
          reg108 <= reg107[(1'h0):(1'h0)];
          reg109 <= wire100[(3'h7):(3'h5)];
        end
      else
        begin
          reg108 <= (($unsigned(reg94[(4'ha):(1'h0)]) + ((8'h9c) ^ wire80)) || reg106);
          reg109 <= $signed({(reg92 > wire81)});
        end
      reg110 <= (~&(~|(+(+wire53[(4'h8):(3'h6)]))));
      if ($unsigned((^~reg97)))
        begin
          reg111 <= $unsigned({wire51, $signed(reg94)});
          reg112 <= reg84;
          reg113 <= wire80;
          reg114 <= reg103[(4'h8):(1'h1)];
          reg115 <= wire100[(4'h9):(1'h1)];
        end
      else
        begin
          reg111 <= (wire83 ?
              reg94[(2'h3):(2'h3)] : ($unsigned(((wire45 ? reg115 : reg109) ?
                      ((8'haa) > wire81) : $signed(reg91))) ?
                  $unsigned($signed({reg106})) : $signed((+reg90))));
          reg112 <= $signed(wire82);
          if (reg105[(1'h0):(1'h0)])
            begin
              reg113 <= $signed(((wire78 ?
                  $signed({reg94}) : $unsigned(wire45[(3'h4):(2'h3)])) << (($signed(reg84) <<< (^~reg110)) + ((reg87 ?
                  reg107 : (8'hbf)) << {wire78, reg86}))));
              reg114 <= ((~(|reg97)) <= $unsigned($unsigned(reg93)));
              reg115 <= $signed((~^reg107));
            end
          else
            begin
              reg113 <= (reg113 || (+(&reg109)));
              reg114 <= $signed($unsigned(($unsigned($unsigned((7'h41))) && (|((8'ha8) <<< reg90)))));
              reg115 <= wire48;
            end
          reg116 <= $unsigned(wire83);
          if ($signed((^~reg92[(1'h1):(1'h1)])))
            begin
              reg117 <= reg111[(5'h10):(4'h9)];
            end
          else
            begin
              reg117 <= $signed((^~($signed(wire50) ?
                  ((reg111 ? reg93 : reg107) ?
                      (~&reg117) : $signed(reg87)) : (wire100 | $signed(reg109)))));
              reg118 <= $signed($unsigned(wire99[(2'h3):(1'h0)]));
              reg119 <= ((-$signed($unsigned((8'hb7)))) || $signed($signed(($unsigned(reg86) ?
                  (~&reg92) : $signed(reg106)))));
            end
        end
      reg120 <= {(8'hab),
          ((($signed(wire53) <<< (^wire80)) <<< $signed(((8'hae) ^~ reg103))) ?
              $unsigned((^{reg111})) : $unsigned(wire46))};
    end
  always
    @(posedge clk) begin
      reg121 <= ($signed({(8'ha0)}) + reg88);
    end
  always
    @(posedge clk) begin
      if ($signed(($unsigned(((^~(7'h44)) << reg117[(3'h4):(2'h2)])) ?
          ($unsigned(wire50[(1'h1):(1'h0)]) << ((reg91 ?
              reg109 : reg93) == reg114)) : $unsigned({(reg96 << (8'hb5)),
              $unsigned(reg105)}))))
        begin
          reg122 <= (|(8'hb8));
          reg123 <= (~|((wire80[(1'h0):(1'h0)] ?
                  $signed({wire51}) : (reg98[(2'h2):(1'h0)] ?
                      $unsigned(reg84) : wire78)) ?
              {wire45} : ({$signed(reg94),
                  $unsigned(reg114)} < {wire54[(3'h4):(2'h3)]})));
          if (wire82[(4'hb):(2'h3)])
            begin
              reg124 <= (8'had);
              reg125 <= (~reg97[(4'ha):(4'h8)]);
              reg126 <= $unsigned(((reg125 ? reg112[(2'h2):(1'h0)] : reg125) ?
                  (reg121 & {$unsigned(wire53)}) : $signed(reg121[(4'hb):(4'h9)])));
              reg127 <= $unsigned(wire54[(4'hb):(3'h7)]);
            end
          else
            begin
              reg124 <= reg115[(4'h8):(3'h6)];
              reg125 <= wire54;
              reg126 <= reg90;
              reg127 <= ($signed(wire51) <<< ((((reg125 ?
                      reg111 : wire50) != ((8'h9e) ? reg119 : reg105)) ?
                  ($signed((8'haf)) ?
                      {wire82} : reg87[(1'h0):(1'h0)]) : (|(~reg88))) <<< reg91));
              reg128 <= (^((reg85[(5'h12):(2'h3)] ?
                      wire46[(1'h1):(1'h1)] : reg108[(4'hd):(4'h8)]) ?
                  reg94 : ({$signed(reg119)} ?
                      ((reg97 ? reg85 : reg111) ?
                          $signed(reg88) : reg127) : {wire47, (^reg126)})));
            end
          if (reg89)
            begin
              reg129 <= $unsigned((reg103[(3'h4):(2'h3)] ?
                  $unsigned(reg121) : wire51));
              reg130 <= (!(wire53 << $signed(reg129[(3'h5):(1'h0)])));
              reg131 <= reg104;
              reg132 <= reg122[(1'h1):(1'h0)];
            end
          else
            begin
              reg129 <= ((~&wire47[(2'h3):(1'h1)]) <= (8'hb4));
              reg130 <= ($signed({{((8'hbf) ? (8'hb2) : reg109),
                      (reg96 < wire45)}}) <= $unsigned($signed(((|reg119) ?
                  $signed(reg85) : (^(8'hb4))))));
              reg131 <= (7'h42);
            end
        end
      else
        begin
          if (reg118)
            begin
              reg122 <= ($signed($signed($unsigned($signed(reg117)))) ?
                  $unsigned(reg128) : reg127[(1'h1):(1'h0)]);
            end
          else
            begin
              reg122 <= (-(~&$unsigned(reg101)));
              reg123 <= reg130;
            end
          reg124 <= reg117;
        end
      reg133 <= $signed($signed(wire78));
    end
endmodule

module module55  (y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire60;
  input wire signed [(3'h4):(1'h0)] wire59;
  input wire signed [(2'h3):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  input wire signed [(2'h3):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire [(5'h12):(1'h0)] wire61;
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire61 = ((8'hb2) ?
                      $signed((&$unsigned($unsigned(wire59)))) : wire59[(3'h4):(1'h0)]);
  assign wire62 = wire61;
  assign wire63 = (({$unsigned({wire57, (8'hab)}), (~&$signed(wire60))} ?
                          (7'h42) : wire58[(2'h3):(2'h2)]) ?
                      {$signed($signed(((8'h9c) ? wire62 : wire58))),
                          (($unsigned(wire58) ?
                                  $unsigned(wire59) : (-(8'ha8))) ?
                              (wire58[(1'h1):(1'h0)] <= $unsigned(wire57)) : ($signed(wire61) ?
                                  wire60[(5'h12):(3'h7)] : (^~wire60)))} : wire62[(4'h8):(1'h1)]);
  assign wire64 = $unsigned($unsigned(wire62));
  assign wire65 = (|({($unsigned(wire61) >= wire63[(2'h3):(1'h0)])} ^~ $unsigned(((wire60 == (8'hb0)) ?
                      (wire61 != (7'h42)) : (~&wire61)))));
  assign wire66 = ($unsigned((((wire64 ? (7'h42) : wire59) ?
                              $unsigned(wire60) : {wire57, wire57}) ?
                          (wire59 ? wire56 : wire60) : wire64)) ?
                      wire65 : wire60);
  assign wire67 = ($unsigned(wire58) >> wire66);
  assign wire68 = wire60[(3'h7):(2'h2)];
  assign wire69 = $signed(wire60[(4'hc):(3'h6)]);
  always
    @(posedge clk) begin
      reg70 <= (~&$signed($signed(($unsigned(wire58) ?
          $signed((8'hbb)) : (8'hbf)))));
    end
  always
    @(posedge clk) begin
      reg71 <= $unsigned($unsigned($signed(($signed((8'h9c)) ?
          wire68[(3'h5):(3'h4)] : $unsigned((8'hbc))))));
      reg72 <= {(^~$unsigned((wire64 - wire62[(1'h0):(1'h0)]))), wire59};
    end
  assign wire73 = {{(({wire59} || $unsigned((8'hbf))) ^~ wire66[(3'h5):(1'h1)]),
                          ({(~wire66), wire63} - $signed((+reg72)))},
                      (~$unsigned($unsigned(wire66[(4'hb):(3'h6)])))};
  assign wire74 = (~^wire73);
  assign wire75 = reg70[(5'h11):(3'h7)];
  assign wire76 = $signed(reg71);
  assign wire77 = wire63;
endmodule
