module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire165;
  wire [(2'h2):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire148;
  wire [(4'hc):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire signed [(5'h12):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg163 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg161 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire165,
                 wire150,
                 wire148,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire22,
                 wire21,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (($signed((~^(8'ha1))) ?
                     wire0[(3'h4):(1'h1)] : wire0[(3'h6):(3'h6)]) <<< wire1);
  assign wire5 = $unsigned(((&(^~$unsigned(wire3))) ?
                     (~&wire0[(4'hf):(3'h6)]) : wire0));
  assign wire6 = $unsigned({wire5[(4'h8):(3'h5)],
                     ($unsigned($unsigned(wire4)) && ((^wire0) ?
                         (wire1 & wire0) : $unsigned(wire0)))});
  assign wire7 = wire0[(3'h7):(3'h6)];
  assign wire8 = wire2[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg9 <= (~wire3[(1'h0):(1'h0)]);
      reg10 <= (($signed($signed({wire1, wire2})) ?
              $signed($signed($signed(wire4))) : wire0[(4'hf):(4'hd)]) ?
          wire5 : wire0[(5'h10):(4'he)]);
      reg11 <= (8'ha5);
      if (wire0[(2'h3):(2'h2)])
        begin
          if (wire8[(1'h1):(1'h1)])
            begin
              reg12 <= $unsigned((8'ha0));
              reg13 <= $signed($signed((($unsigned(wire6) ~^ $signed(wire0)) ?
                  (~|{(8'hac)}) : ((^~(8'ha9)) ? $signed(reg12) : wire1))));
              reg14 <= $unsigned({(wire5[(4'hd):(1'h0)] * {((8'ha2) | wire5)}),
                  (&(^~{wire3, (8'hb5)}))});
              reg15 <= ($signed($signed(($unsigned(reg10) - (^reg11)))) ?
                  ((7'h42) || (!((wire4 ? wire8 : (8'hb5)) ?
                      {wire1,
                          (8'hbd)} : $unsigned(reg11)))) : $unsigned({$signed($signed(reg14)),
                      ($signed(reg13) || $unsigned(wire6))}));
              reg16 <= {$signed((7'h43)), wire6[(4'h8):(1'h0)]};
            end
          else
            begin
              reg12 <= {$signed((8'hbd)), (8'hbf)};
              reg13 <= reg9;
              reg14 <= $unsigned({({wire5} ?
                      ((reg13 ~^ wire8) ?
                          wire5[(2'h3):(2'h3)] : ((8'ha0) || (8'hb4))) : reg13[(4'hc):(4'hc)]),
                  reg11});
              reg15 <= $signed($signed($signed((reg13 << $signed((8'hb6))))));
            end
          if ($signed(reg13))
            begin
              reg17 <= ($unsigned(((!(~|wire5)) << {wire3, (|reg11)})) ?
                  $signed($unsigned(({wire3} >>> (reg14 ?
                      wire6 : (8'hba))))) : $signed((!(8'ha6))));
              reg18 <= $signed($unsigned((~$signed(reg15))));
              reg19 <= reg9[(3'h4):(2'h2)];
              reg20 <= (reg16 ?
                  reg11[(4'ha):(4'ha)] : $signed(((-$unsigned(wire7)) && (8'hb2))));
            end
          else
            begin
              reg17 <= {(($unsigned({wire2, reg20}) ?
                      $unsigned(wire6[(2'h3):(1'h1)]) : $unsigned((8'ha0))) ~^ ($unsigned((reg20 ?
                      reg15 : (8'hbd))) && $unsigned((reg16 ?
                      (7'h42) : reg20)))),
                  reg11};
              reg18 <= (wire8[(1'h1):(1'h0)] ?
                  (|(^wire0)) : wire6[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          reg12 <= ((reg11 <= {(~{reg19, wire8})}) >> (~&($unsigned({reg19}) ?
              ($unsigned((8'ha4)) ?
                  $signed((7'h43)) : (~|reg17)) : {(reg19 && wire4),
                  {(8'h9e)}})));
        end
    end
  assign wire21 = $unsigned($signed(reg17));
  assign wire22 = $signed($signed(wire5[(1'h1):(1'h0)]));
  module23 #() modinst132 (.wire27(wire3), .y(wire131), .wire24(reg17), .wire25(wire7), .clk(clk), .wire26(reg16));
  assign wire133 = {wire6};
  assign wire134 = (wire0[(3'h7):(2'h3)] ?
                       wire131[(2'h3):(2'h3)] : reg16[(4'h9):(3'h7)]);
  assign wire135 = $signed($unsigned(wire3[(3'h7):(2'h2)]));
  assign wire136 = (~&((~wire4) ?
                       reg19[(2'h2):(1'h0)] : $signed($signed((8'ha3)))));
  module137 #() modinst149 (wire148, clk, reg12, reg17, reg15, reg19);
  assign wire150 = ($unsigned($unsigned(((~|reg18) ?
                       (|(8'ha6)) : $unsigned((8'hbe))))) + $unsigned((wire135 ?
                       {$unsigned(wire0)} : (wire6 ?
                           ((8'hb3) & reg10) : wire21))));
  always
    @(posedge clk) begin
      if ((^~(^~(({wire21, reg15} ^ $unsigned(reg18)) ?
          wire133 : wire135[(1'h1):(1'h1)]))))
        begin
          reg151 <= reg18[(1'h0):(1'h0)];
          reg152 <= (wire135 ?
              (7'h43) : (+(((~|wire131) ?
                      (wire135 >= wire131) : wire0[(3'h5):(2'h2)]) ?
                  (~^((8'ha2) > reg11)) : {$signed(reg12)})));
        end
      else
        begin
          if ((^~{{{(reg13 ? wire148 : wire21), $signed(wire1)},
                  (+((8'hac) ? (7'h42) : reg19))},
              ((~$signed(wire5)) >>> (^{reg12}))}))
            begin
              reg151 <= ($signed($unsigned(({wire7} ?
                  $unsigned((7'h40)) : $unsigned(reg151)))) + (reg13 ?
                  ((^{wire6, wire3}) ?
                      $unsigned(wire3) : $signed(reg152[(3'h4):(1'h1)])) : $unsigned({reg15})));
            end
          else
            begin
              reg151 <= (~$signed(wire2));
              reg152 <= $signed((^~$signed($signed((+reg9)))));
            end
          reg153 <= (+wire133[(3'h7):(1'h1)]);
          if ((reg12 ?
              (((~&$signed(reg10)) ^ $unsigned($signed(wire3))) ?
                  $signed(reg14) : {(wire3[(3'h5):(2'h2)] + wire4[(4'h9):(4'h9)]),
                      {(+wire135),
                          ((8'ha1) ?
                              reg19 : wire136)}}) : ((-$signed(reg20[(1'h1):(1'h0)])) ^ {reg11,
                  (&$unsigned(reg9))})))
            begin
              reg154 <= {((8'h9c) ~^ (^~(wire2 << wire0[(4'hc):(2'h3)])))};
              reg155 <= wire150;
              reg156 <= (wire148[(2'h3):(1'h1)] - reg18);
            end
          else
            begin
              reg154 <= {($signed($unsigned(reg9[(1'h0):(1'h0)])) ?
                      ($unsigned((wire148 << wire3)) >>> reg153[(3'h7):(1'h1)]) : (^~($signed(wire135) > {reg19,
                          reg9})))};
              reg155 <= $signed($signed(reg14[(1'h1):(1'h1)]));
              reg156 <= wire150[(1'h0):(1'h0)];
            end
          reg157 <= $unsigned(wire134);
        end
      reg158 <= $signed((&((reg11 >>> (reg14 ?
          wire5 : wire21)) <<< $signed(((8'hbf) ? wire8 : (8'hb6))))));
      if ({$unsigned(($unsigned({reg19, wire136}) ?
              wire7[(4'ha):(4'ha)] : (&(wire5 << wire2))))})
        begin
          if (wire131[(1'h0):(1'h0)])
            begin
              reg159 <= ({{(+$signed(reg151))},
                      (~|$signed(((8'h9f) >>> reg151)))} ?
                  (reg158[(2'h2):(1'h0)] == reg157[(4'h8):(3'h4)]) : reg14[(2'h2):(2'h2)]);
              reg160 <= ($unsigned({(reg15 | {(8'ha0), reg9}),
                  $unsigned(wire6)}) || ((&($signed(reg153) + $signed(reg17))) ?
                  (~^{$signed((8'hbc))}) : $unsigned(((^reg10) ?
                      (wire131 ? (7'h42) : wire2) : $unsigned(wire6)))));
            end
          else
            begin
              reg159 <= (~^reg154);
              reg160 <= $signed($signed((&(~&{wire6, wire148}))));
              reg161 <= (^(reg154 != (wire6[(1'h1):(1'h0)] ?
                  ((~|reg159) * (^reg20)) : wire2[(1'h1):(1'h0)])));
              reg162 <= reg18;
            end
          reg163 <= $unsigned(($unsigned($signed(wire133)) ?
              reg10 : ({$unsigned(reg12), (7'h43)} > (~&(~&wire21)))));
        end
      else
        begin
          reg159 <= (7'h40);
          reg160 <= (~&{$unsigned(((reg9 ^~ wire148) > (wire2 ?
                  reg157 : (8'hbf))))});
        end
      reg164 <= {(wire134[(3'h6):(1'h1)] << wire6[(2'h3):(1'h0)]), wire5};
    end
  assign wire165 = reg10[(1'h0):(1'h0)];
endmodule

module module137
#(parameter param146 = (~^((((~|(8'hba)) ? ((8'hba) ? (8'ha1) : (8'h9c)) : (!(8'hbd))) ? {(~|(8'hac))} : ((~&(8'hb4)) ? (^(8'haa)) : ((8'ha5) ^~ (8'ha9)))) ? ({((8'hab) <<< (8'ha3)), {(8'hb6), (8'ha1)}} << (((8'haa) > (8'hbc)) ? ((8'ha5) ? (8'hb3) : (8'ha8)) : ((7'h43) ? (8'ha6) : (8'had)))) : (&(((8'hb3) < (8'had)) ? ((7'h41) ? (8'ha6) : (8'haf)) : {(7'h40)})))), 
parameter param147 = (^~(({(8'h9c), param146} - (param146 ? (param146 ? param146 : param146) : (param146 ~^ param146))) ? (((^param146) ? (param146 * param146) : (-param146)) + param146) : ({(&param146), (^~param146)} ? ((param146 <<< param146) ? param146 : (!param146)) : (-(param146 ? param146 : param146))))))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire141;
  input wire signed [(3'h6):(1'h0)] wire140;
  input wire [(4'hb):(1'h0)] wire139;
  input wire signed [(5'h13):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire145;
  wire [(4'he):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  assign y = {wire145, wire144, wire143, wire142, (1'h0)};
  assign wire142 = {$unsigned($signed(wire141[(1'h1):(1'h1)]))};
  assign wire143 = $unsigned({$unsigned($unsigned((~&wire141)))});
  assign wire144 = ((-(-(~^((8'hab) ? wire143 : wire138)))) == (8'haa));
  assign wire145 = wire143[(3'h6):(3'h4)];
endmodule

module module23
#(parameter param129 = {(((((8'haa) ^~ (8'had)) ? ((7'h44) && (8'ha4)) : {(7'h40)}) ? (&((7'h43) ? (8'ha3) : (8'had))) : {{(8'hbc)}}) <= (((8'hb7) ? ((8'hb5) >= (8'hb4)) : ((8'ha9) ? (7'h43) : (8'ha4))) & {((7'h44) ? (8'ha7) : (8'had)), {(8'haa)}})), (~&((8'haf) ? ((~|(8'ha4)) ? ((8'hb7) ? (8'h9e) : (8'hbe)) : ((8'ha1) ? (7'h43) : (8'hb9))) : (+(~^(8'ha7)))))}, 
parameter param130 = (~param129))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire24;
  input wire [(4'ha):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire128;
  wire [(5'h10):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire95;
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire121,
                 wire98,
                 wire97,
                 wire40,
                 wire41,
                 wire95,
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
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire25);
      reg29 <= {(((wire24[(4'h8):(3'h5)] ?
              (reg28 ? wire25 : (8'hb9)) : (wire25 ?
                  wire26 : wire27)) << $signed($signed(wire24))) < reg28[(4'hc):(4'hb)])};
      reg30 <= (~^(&$unsigned($signed((reg28 ^ (8'hab))))));
      if ((~^$signed(($unsigned($signed(wire24)) ?
          (8'hac) : $unsigned((wire24 * wire24))))))
        begin
          reg31 <= reg29;
          reg32 <= {(-(~^$signed((reg28 * reg28)))),
              (($signed((|reg29)) > $signed($unsigned((8'ha8)))) ?
                  $signed(reg31[(2'h3):(2'h2)]) : reg28)};
          reg33 <= ($signed(reg28[(1'h0):(1'h0)]) || reg29[(4'hb):(3'h6)]);
          reg34 <= {$unsigned((!($signed(reg29) ?
                  (reg28 | (8'h9e)) : {wire26, wire24})))};
          if ({{(wire26[(3'h5):(3'h5)] ?
                      $unsigned((&wire24)) : $signed($unsigned(reg30))),
                  (reg31[(3'h6):(3'h4)] | ((8'ha4) >= $signed(reg31)))}})
            begin
              reg35 <= (8'hbe);
              reg36 <= reg35;
            end
          else
            begin
              reg35 <= wire25[(1'h0):(1'h0)];
              reg36 <= (($unsigned(reg34) << $signed({reg35[(2'h3):(2'h2)],
                      reg31})) ?
                  wire26 : $signed((!(^~wire27))));
              reg37 <= (~($unsigned(reg36) ?
                  ({wire26[(3'h4):(2'h2)]} ?
                      $signed({(8'ha5),
                          (8'hb9)}) : $unsigned(reg36[(1'h1):(1'h0)])) : $unsigned({$signed(reg36),
                      {reg35}})));
              reg38 <= ({($signed(reg35[(5'h12):(4'h9)]) >= ((wire26 ?
                          reg36 : (8'ha2)) != ((8'ha7) ? (8'ha9) : reg37))),
                      (((wire26 ? wire26 : reg32) - (-reg32)) ?
                          reg31[(1'h1):(1'h1)] : wire27)} ?
                  ({(reg33[(3'h6):(3'h6)] ?
                              (reg36 ? reg35 : (8'ha8)) : $unsigned(reg28))} ?
                      $unsigned(($unsigned(wire26) ?
                          $unsigned(reg35) : $signed(wire26))) : ($signed({reg37}) <<< (((7'h44) ?
                              reg30 : reg34) ?
                          $unsigned(reg33) : $unsigned(reg34)))) : (~^wire25));
            end
        end
      else
        begin
          reg31 <= $signed((8'hb4));
          reg32 <= $signed({($unsigned((~(8'hb5))) ? reg30 : reg36)});
          reg33 <= (|(($unsigned(reg31[(2'h2):(1'h1)]) ?
              (reg33 ^ $signed((8'hb1))) : (&$signed(reg30))) <= (reg31[(2'h3):(1'h1)] <<< (reg38 ~^ (reg38 ?
              reg32 : reg35)))));
        end
      reg39 <= (~wire27);
    end
  assign wire40 = (&{reg36[(3'h4):(2'h2)]});
  assign wire41 = $signed((reg38[(1'h0):(1'h0)] ?
                      ((~&reg30[(5'h14):(5'h12)]) ?
                          (wire25[(3'h7):(2'h2)] ?
                              (-(8'ha6)) : $unsigned(reg39)) : (7'h41)) : reg31));
  always
    @(posedge clk) begin
      reg42 <= $unsigned($signed(wire26));
      reg43 <= wire25[(1'h0):(1'h0)];
      reg44 <= ($unsigned($unsigned($signed(reg28))) <= wire27);
      reg45 <= reg39;
    end
  module46 #() modinst96 (wire95, clk, reg43, reg34, reg44, reg33, wire41);
  assign wire97 = $signed({$unsigned(wire95)});
  assign wire98 = wire24[(5'h13):(4'h9)];
  module99 #() modinst122 (.wire102(reg35), .wire104(reg28), .clk(clk), .wire100(wire27), .wire103(reg29), .y(wire121), .wire101(wire97));
  assign wire123 = reg31;
  assign wire124 = wire121;
  assign wire125 = (+reg39);
  assign wire126 = $unsigned($signed($signed((|$unsigned(reg31)))));
  assign wire127 = $signed($signed((reg44 | (|{wire98, wire125}))));
  assign wire128 = (&($unsigned($signed((8'ha0))) ?
                       reg43[(4'hb):(1'h0)] : $unsigned(($signed((7'h41)) ?
                           (reg39 ? reg36 : wire26) : (|reg42)))));
endmodule

module module99
#(parameter param119 = ((((^((8'hb7) + (8'hae))) >> (~(8'h9c))) <<< ((^((8'h9c) * (8'ha3))) ? (~((8'ha5) ? (8'hb7) : (8'ha2))) : (((8'hb9) & (8'hae)) ? ((8'hb2) ? (8'had) : (8'hb2)) : ((8'hba) ? (8'hb0) : (8'ha4))))) || ({(8'hb7), (^((8'hbc) >>> (7'h41)))} ? (~^(((7'h41) ? (8'h9d) : (8'had)) >> (&(8'hae)))) : (~{((8'h9c) >>> (8'hb5))}))), 
parameter param120 = (-{param119, (^((param119 ^ param119) ^~ param119))}))
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire104;
  input wire [(5'h12):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire102;
  input wire signed [(3'h6):(1'h0)] wire101;
  input wire signed [(4'hd):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire106,
                 wire105,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire105 = wire100[(1'h0):(1'h0)];
  assign wire106 = wire101[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg107 <= {($signed(wire106) ?
              (wire106 ?
                  wire105 : (wire102 ^~ (wire102 <<< wire103))) : $signed($signed((-(8'ha9))))),
          ((((wire105 ^~ wire103) ? $signed((8'ha1)) : $unsigned(wire100)) ?
              (!$unsigned((8'hb4))) : wire105) == $signed($unsigned(wire100[(1'h0):(1'h0)])))};
      if ($signed(wire104))
        begin
          if (wire105[(3'h5):(3'h4)])
            begin
              reg108 <= (~^(8'hb3));
            end
          else
            begin
              reg108 <= $unsigned(wire104);
              reg109 <= (!(($signed($unsigned(reg108)) ?
                  $signed($unsigned((8'hbf))) : $unsigned($unsigned((8'hb9)))) == reg107[(2'h3):(1'h1)]));
            end
          reg110 <= wire102;
          if ($unsigned($unsigned((|$signed((reg107 ? wire105 : reg109))))))
            begin
              reg111 <= wire106[(4'h8):(3'h7)];
              reg112 <= $unsigned(((+wire102) ?
                  $signed(wire104) : $unsigned(wire101)));
            end
          else
            begin
              reg111 <= $unsigned(wire103[(4'hc):(4'hb)]);
              reg112 <= $unsigned((^((|reg108) ?
                  $unsigned((wire104 ?
                      wire100 : (8'hbc))) : $unsigned($unsigned(reg111)))));
              reg113 <= {(wire100 || {$unsigned(wire102),
                      wire106[(4'h9):(3'h7)]}),
                  reg107[(3'h4):(2'h2)]};
            end
          reg114 <= (^$unsigned(((wire103[(4'hd):(2'h3)] >>> $signed(wire101)) ~^ ({(8'ha7)} ?
              (wire103 << wire101) : $unsigned((8'hb6))))));
        end
      else
        begin
          if (reg114[(3'h4):(3'h4)])
            begin
              reg108 <= wire104[(3'h7):(3'h5)];
              reg109 <= $unsigned((|(-wire102)));
              reg110 <= (!$signed($unsigned(((~&wire103) << $unsigned(reg113)))));
            end
          else
            begin
              reg108 <= reg114;
              reg109 <= {$signed((((wire104 ^~ wire105) ?
                      (wire106 & reg113) : $unsigned(wire105)) > ({reg114} ?
                      reg107 : ((8'ha7) ^~ wire102))))};
              reg110 <= (((wire104 ?
                  (~(~^wire100)) : $unsigned((wire105 <<< wire104))) >= $unsigned((reg114[(4'h8):(3'h6)] || $signed(reg108)))) >>> $signed({(~&$signed((8'h9d)))}));
              reg111 <= (wire100[(3'h6):(3'h5)] >= $signed((~|$signed(wire106[(4'hc):(4'ha)]))));
              reg112 <= (reg109 ?
                  {$unsigned((!wire105[(3'h4):(1'h0)]))} : reg108);
            end
          reg113 <= $signed($unsigned(wire100));
        end
    end
  always
    @(posedge clk) begin
      reg115 <= (8'h9f);
    end
  assign wire116 = (+wire104);
  assign wire117 = (~&reg109[(3'h5):(2'h2)]);
  assign wire118 = (8'h9d);
endmodule

module module46
#(parameter param94 = ((((!((8'ha2) | (8'had))) < ((^(7'h41)) < ((8'hac) ? (8'hb7) : (8'h9e)))) != (8'hba)) << (8'hbc)))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h20a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire signed [(3'h6):(1'h0)] wire49;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire [(3'h6):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire [(4'hc):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire52;
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire52,
                 reg81,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire52 = wire51;
  always
    @(posedge clk) begin
      if (wire50[(3'h6):(1'h1)])
        begin
          reg53 <= $signed((~^wire49[(1'h1):(1'h0)]));
          reg54 <= ((8'hbc) ? wire52[(3'h7):(3'h4)] : wire52);
          if ($unsigned(wire47))
            begin
              reg55 <= (+(^~wire49));
              reg56 <= wire48[(2'h3):(1'h1)];
              reg57 <= $signed($signed(($unsigned(reg55[(4'hb):(1'h1)]) ?
                  $unsigned($signed(wire49)) : {reg53})));
            end
          else
            begin
              reg55 <= $unsigned({wire48[(2'h3):(2'h2)]});
              reg56 <= (reg57[(1'h1):(1'h0)] ~^ (~&$signed(reg53[(4'ha):(4'ha)])));
              reg57 <= ({$unsigned(((-wire49) & (8'hba)))} ?
                  $unsigned(reg55[(3'h7):(3'h6)]) : wire52);
              reg58 <= $signed((((!reg54[(3'h6):(2'h3)]) ?
                  $unsigned((wire48 ?
                      reg55 : wire48)) : (~(reg53 && wire50))) >> reg57[(3'h5):(2'h3)]));
            end
          if (((reg57[(2'h3):(1'h0)] ?
              $signed(wire50) : $signed(($signed(reg57) | (wire52 ?
                  (7'h40) : wire47)))) > reg55))
            begin
              reg59 <= reg58[(4'h9):(4'h9)];
              reg60 <= $signed((8'h9d));
              reg61 <= (-$signed($signed((~^wire49[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg59 <= ((((~^reg56[(5'h10):(4'hf)]) >> $unsigned((wire47 ?
                  wire48 : reg56))) == wire51) ^ $unsigned((^~(-$unsigned(reg57)))));
              reg60 <= reg54;
              reg61 <= reg54[(4'h9):(3'h4)];
              reg62 <= ($unsigned({wire52[(2'h3):(1'h1)],
                  wire49[(1'h0):(1'h0)]}) << (&wire50));
            end
        end
      else
        begin
          if ((8'ha7))
            begin
              reg53 <= reg60[(1'h0):(1'h0)];
              reg54 <= reg58[(2'h2):(1'h0)];
              reg55 <= ({reg62[(4'he):(4'ha)]} ?
                  ($unsigned($unsigned(reg58[(3'h7):(1'h0)])) << (~|$unsigned(wire48))) : (~&({reg60[(4'ha):(3'h7)],
                      (wire49 ? reg58 : reg55)} + wire48[(1'h1):(1'h0)])));
            end
          else
            begin
              reg53 <= wire52;
            end
        end
      if ((((~^((-wire47) & reg55)) ?
          {reg54[(5'h10):(4'he)]} : {($unsigned(wire50) <<< (reg59 != reg61)),
              (reg62 + {wire51})}) > $unsigned((reg58 <<< $signed((wire52 ?
          reg57 : reg56))))))
        begin
          reg63 <= {((wire48 <<< (^reg62[(3'h4):(2'h2)])) != ($signed((!wire50)) < reg54)),
              $signed(reg56)};
          reg64 <= reg59[(3'h7):(3'h6)];
          reg65 <= $unsigned((((reg59[(4'h8):(3'h6)] ?
                  $signed((8'hbe)) : $unsigned(reg64)) || $unsigned($signed((8'ha8)))) ?
              (reg62 ?
                  $unsigned($signed(reg53)) : (8'hac)) : reg58[(3'h5):(2'h2)]));
          if ((|(wire49 ? (-$unsigned({reg64})) : (|reg54))))
            begin
              reg66 <= (!reg57[(3'h6):(3'h4)]);
              reg67 <= ((^~reg59) < (wire52 ?
                  $unsigned((~$signed(wire51))) : (reg58[(3'h4):(1'h0)] ~^ (~^reg54))));
              reg68 <= reg53[(3'h6):(2'h3)];
              reg69 <= (~^((~reg67[(3'h5):(2'h3)]) ?
                  wire51 : $unsigned($signed(reg68[(4'h9):(4'h9)]))));
            end
          else
            begin
              reg66 <= {{$unsigned((|reg67[(2'h2):(1'h0)]))},
                  $unsigned($unsigned((reg61 >>> $signed(reg60))))};
              reg67 <= (~(~&{wire50[(3'h7):(1'h0)]}));
            end
          reg70 <= (($unsigned($signed(((8'h9e) == reg59))) >= $signed(((reg53 ?
                      wire47 : (8'h9c)) ?
                  (!reg62) : reg55))) ?
              $signed(((^$unsigned(reg67)) ?
                  ($signed(wire47) & (|(8'had))) : $unsigned((-(8'hb8))))) : (((wire51[(4'h8):(3'h4)] ~^ {(8'hae)}) ?
                      reg57 : (+(wire50 ^ reg69))) ?
                  ({reg61[(4'ha):(1'h1)]} || $signed((reg67 > reg68))) : $unsigned(((wire47 ?
                          wire51 : reg55) ?
                      (reg68 <= reg68) : {wire51, (8'haf)}))));
        end
      else
        begin
          reg63 <= $unsigned($unsigned($unsigned($unsigned((8'h9e)))));
          reg64 <= (reg59[(1'h1):(1'h1)] ?
              ({(8'haa), reg67} || wire49[(2'h2):(1'h1)]) : reg62);
          reg65 <= wire52;
          if ((wire50 ^~ (wire52[(3'h6):(1'h0)] > (reg63[(3'h4):(1'h0)] ?
              $signed($signed((8'hae))) : {wire49, (wire48 * wire47)}))))
            begin
              reg66 <= (&{(-($unsigned(wire47) ?
                      wire50[(1'h0):(1'h0)] : (reg63 & reg61)))});
              reg67 <= (~&($unsigned((^~(reg59 ?
                  wire50 : reg66))) << ($unsigned($unsigned(reg64)) ?
                  {(8'hb4)} : (wire49[(1'h1):(1'h0)] & reg53))));
            end
          else
            begin
              reg66 <= $signed({(((reg64 ?
                      reg70 : wire48) | $unsigned(reg63)) && ((wire52 >>> (8'h9f)) ?
                      reg69 : $unsigned(reg64))),
                  $unsigned($signed(reg61[(4'hc):(4'hb)]))});
              reg67 <= $signed((~&($signed(((8'ha8) ? reg67 : reg61)) ?
                  $unsigned((7'h41)) : reg67[(1'h0):(1'h0)])));
              reg68 <= $signed({(reg58 ?
                      ((8'haf) ? {reg68, reg68} : {reg55, reg61}) : reg70)});
            end
          if ((^~(+$signed((~&{wire52})))))
            begin
              reg69 <= reg59;
              reg70 <= wire49;
              reg71 <= $unsigned((+$unsigned(($signed(wire47) != {reg55,
                  reg62}))));
            end
          else
            begin
              reg69 <= {$signed((reg59 ?
                      $unsigned(reg55[(2'h3):(2'h2)]) : ($unsigned(reg69) ?
                          (7'h42) : {reg58}))),
                  $signed((8'hac))};
            end
        end
      if ($signed(reg59[(3'h7):(1'h0)]))
        begin
          reg72 <= reg58[(2'h3):(1'h0)];
          reg73 <= (reg62 ?
              ($signed(reg57) ?
                  ({(wire50 << reg53), (reg66 >= wire48)} ?
                      (+$unsigned((8'ha4))) : $unsigned({reg59,
                          reg70})) : wire52) : (!(~^($unsigned(reg61) | (+wire50)))));
        end
      else
        begin
          reg72 <= {(reg68[(4'h8):(3'h6)] ?
                  wire50[(3'h4):(1'h0)] : ((+(wire52 ?
                      reg62 : reg67)) < reg68))};
          reg73 <= reg56[(4'he):(4'ha)];
          reg74 <= (wire51[(3'h7):(3'h5)] ?
              reg68 : ($unsigned(wire47) ?
                  reg65[(1'h1):(1'h1)] : (^reg53[(4'ha):(4'h8)])));
          reg75 <= (({(^~$unsigned(reg54))} > wire50) && $signed(reg71[(3'h7):(1'h1)]));
        end
      reg76 <= (~&($unsigned(((reg63 < reg75) ?
          wire48 : $signed(reg60))) || (~&($unsigned(reg69) ~^ reg66[(2'h2):(1'h1)]))));
    end
  assign wire77 = reg69[(3'h7):(1'h0)];
  assign wire78 = reg62;
  assign wire79 = (!$unsigned((|((reg65 ? reg75 : wire51) ?
                      $signed(reg63) : (reg69 & reg63)))));
  assign wire80 = reg59[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      reg81 <= $signed((&({$signed(reg53), $signed(reg65)} == {(~&wire77)})));
    end
  assign wire82 = reg56;
  assign wire83 = $signed($unsigned(reg71[(1'h1):(1'h1)]));
  assign wire84 = reg54[(4'h9):(3'h6)];
  assign wire85 = ((($signed({(8'hae), reg65}) ?
                          {$signed(reg64),
                              $signed(reg56)} : (8'h9c)) < ($unsigned((-reg64)) ?
                          $signed(((8'ha7) ?
                              reg61 : reg61)) : ($signed(wire79) ?
                              (~(8'hb3)) : $unsigned(reg69)))) ?
                      (((wire79[(1'h1):(1'h1)] ?
                          $signed(wire50) : (8'haa)) <<< (wire79[(3'h4):(2'h3)] ?
                          reg71[(2'h2):(2'h2)] : $signed(reg59))) | {$signed($unsigned(wire80)),
                          {(reg62 ? reg59 : reg76),
                              (wire48 || (8'ha7))}}) : $unsigned((wire82 & ($unsigned(reg58) + $signed((8'h9f))))));
  assign wire86 = reg56[(3'h6):(1'h0)];
  assign wire87 = $signed({((8'hba) ? reg73 : $signed((reg62 >= (8'ha8))))});
  assign wire88 = (&(((8'hb2) > $unsigned((~&wire82))) ?
                      {(8'hb0)} : $unsigned((+$signed(wire49)))));
  assign wire89 = (reg76[(2'h3):(1'h1)] >> $unsigned((^~wire80)));
  assign wire90 = reg75[(5'h11):(3'h4)];
  assign wire91 = wire78[(2'h2):(1'h1)];
  assign wire92 = $unsigned(((8'ha0) ?
                      (-$signed((^wire83))) : {(^~$signed(reg66)),
                          $signed($unsigned((8'ha2)))}));
  assign wire93 = ({(-$signed($signed(wire92))),
                      reg73[(1'h1):(1'h1)]} < $signed((^~$unsigned(wire83))));
endmodule
