module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire166;
  wire [(5'h12):(1'h0)] wire164;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire166,
                 wire164,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (~&$signed((~&$signed({(8'haa), wire2}))));
  always
    @(posedge clk) begin
      reg6 <= (wire5 ?
          (((~&$unsigned(wire4)) ?
              (^$signed((8'hb3))) : {wire0[(1'h1):(1'h0)],
                  wire2}) == $signed((-wire1))) : wire3);
      if (((^~($signed($signed(wire3)) ?
          {$unsigned(wire2)} : (~&$signed(wire2)))) && {(&wire0)}))
        begin
          reg7 <= wire3[(2'h3):(2'h3)];
          if (reg6[(4'h9):(1'h0)])
            begin
              reg8 <= $signed({($unsigned(wire3[(3'h5):(1'h0)]) - {wire2[(2'h3):(2'h2)],
                      wire3}),
                  {wire1[(3'h4):(1'h1)]}});
              reg9 <= (~^($unsigned(wire5) ?
                  wire3 : (!$signed((wire5 ? wire5 : wire4)))));
            end
          else
            begin
              reg8 <= (reg8[(3'h4):(1'h1)] - $signed((|wire4)));
              reg9 <= reg8;
              reg10 <= (&(wire3 + reg6));
            end
        end
      else
        begin
          reg7 <= (~^wire0);
          reg8 <= wire1;
          if ((8'hab))
            begin
              reg9 <= (($unsigned((wire4[(3'h4):(2'h2)] << (8'hb0))) ?
                  $signed(((reg7 >> reg7) ?
                      wire3 : (wire3 - reg9))) : $unsigned(wire1)) >>> $unsigned($signed(((wire3 ?
                      wire4 : reg10) ?
                  (wire4 ? wire3 : reg8) : (|wire3)))));
              reg10 <= (wire2[(3'h7):(3'h4)] >= $unsigned($signed(reg9[(3'h5):(1'h1)])));
              reg11 <= (-$signed(((((8'hbb) + wire3) == wire1) ?
                  wire3[(4'hb):(1'h1)] : (~&(~|(8'h9c))))));
              reg12 <= $unsigned((~&reg10[(2'h3):(2'h2)]));
              reg13 <= reg12;
            end
          else
            begin
              reg9 <= (({$signed($signed(reg7)),
                      $signed(reg12[(1'h0):(1'h0)])} - reg11) ?
                  (^~(-(wire2 >> reg9))) : {$signed(reg9),
                      $signed(((8'haf) ? $unsigned(wire1) : (reg13 < wire3)))});
              reg10 <= reg9[(1'h1):(1'h0)];
              reg11 <= ((((+$unsigned(reg6)) <<< reg9[(2'h3):(1'h0)]) ?
                      (^~$signed((reg10 | reg13))) : (reg11 + (wire3 <<< $signed(wire0)))) ?
                  $unsigned($signed((|(wire0 ?
                      wire2 : wire2)))) : (reg11 >= {reg6}));
            end
        end
      reg14 <= $signed($unsigned(wire2[(4'h8):(3'h6)]));
      reg15 <= ($unsigned($unsigned((reg13[(1'h1):(1'h0)] ?
          wire2[(3'h4):(2'h3)] : ((8'hb9) ?
              reg8 : reg8)))) != $unsigned(((^reg7[(4'hb):(1'h1)]) && (reg11 ?
          reg10[(3'h5):(1'h0)] : ((8'haf) ? reg12 : wire0)))));
    end
  module16 #() modinst165 (wire164, clk, wire4, wire0, reg7, reg13, reg10);
  assign wire166 = $unsigned(reg13);
endmodule

module module16
#(parameter param163 = ((({(~|(8'ha1)), ((8'hb0) ? (8'ha1) : (8'ha6))} ? ({(8'hab)} ? ((8'hb0) == (8'hb1)) : (-(8'hb9))) : (~((8'ha3) >= (7'h41)))) | ((((8'hbe) - (8'ha0)) ? ((8'hbc) ? (7'h42) : (8'ha1)) : ((8'haf) | (8'ha1))) ^ (|((8'ha1) <<< (7'h41))))) + ((8'h9c) ? {(((7'h42) ? (8'h9c) : (8'hbe)) ^~ ((8'hac) ? (8'hab) : (8'hb8)))} : (^(((7'h44) ? (8'ha4) : (8'hb9)) <<< ((8'hae) << (7'h42)))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h256):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire162;
  wire signed [(5'h12):(1'h0)] wire161;
  wire signed [(4'ha):(1'h0)] wire57;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire159;
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire57,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire59,
                 wire115,
                 wire117,
                 wire128,
                 wire129,
                 wire130,
                 wire159,
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
                 reg134,
                 reg133,
                 reg132,
                 reg131,
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
                 (1'h0)};
  assign wire22 = (wire19[(2'h3):(2'h2)] == (8'ha1));
  assign wire23 = $signed({($unsigned($signed(wire18)) >>> ({wire19} ^ wire17))});
  assign wire24 = (8'hab);
  assign wire25 = $unsigned(wire20);
  assign wire26 = wire25;
  always
    @(posedge clk) begin
      reg27 <= (wire22[(2'h3):(1'h1)] >= (8'hbc));
      reg28 <= wire25;
      if (reg28[(4'h8):(3'h5)])
        begin
          reg29 <= ((|(-$signed($unsigned(wire26)))) != reg27);
          if (wire19)
            begin
              reg30 <= $signed((((reg28 ? {wire21, wire24} : (!wire23)) ?
                      (~{wire26}) : ($unsigned(wire18) ?
                          $unsigned(wire17) : (wire26 ? reg28 : reg28))) ?
                  $signed((wire19 ?
                      $signed(wire23) : (+wire23))) : ((!$unsigned((8'hb2))) ?
                      (|wire17[(4'hb):(3'h7)]) : wire20)));
            end
          else
            begin
              reg30 <= $signed(((~^$unsigned($signed(wire23))) > wire18));
              reg31 <= {(|wire26), $signed($signed($signed($signed(reg29))))};
              reg32 <= $signed($signed(reg28));
              reg33 <= ($unsigned($unsigned(((wire19 + wire17) == (-(8'ha4))))) ?
                  (($signed((reg28 ?
                      wire17 : wire17)) && (~^(reg31 + reg29))) <= ($signed((^~reg27)) ?
                      ($signed(wire25) ?
                          reg27[(1'h1):(1'h1)] : (wire17 << reg29)) : (~^$unsigned(wire24)))) : (((wire22 ?
                          $unsigned((8'hb4)) : (wire19 ? (8'hae) : wire20)) ?
                      wire18[(2'h3):(2'h2)] : wire18) - (-reg29[(3'h7):(2'h3)])));
              reg34 <= wire20;
            end
          reg35 <= wire17[(3'h4):(3'h4)];
        end
      else
        begin
          reg29 <= ($signed($unsigned($unsigned((wire26 + reg28)))) != $unsigned(wire26[(3'h7):(3'h6)]));
          reg30 <= ($unsigned((^~((reg32 + (8'ha1)) << (reg32 ?
              (7'h44) : wire23)))) + $signed(({{reg30, wire18}} * reg31)));
          reg31 <= wire22[(1'h0):(1'h0)];
          reg32 <= (^{$signed(($unsigned(reg29) ?
                  (wire17 ? wire18 : (8'hbe)) : (wire25 ~^ reg30)))});
          if (wire21)
            begin
              reg33 <= {reg30[(3'h4):(2'h3)], reg28};
              reg34 <= {(((wire20 ^ $unsigned(wire23)) ?
                      wire26 : (reg27[(2'h3):(1'h1)] ?
                          (reg27 + wire25) : $unsigned(reg30))) == reg33[(1'h1):(1'h1)])};
              reg35 <= wire18;
              reg36 <= ($unsigned(wire26[(3'h7):(1'h0)]) ?
                  ((((~|wire25) <= (^(8'haa))) < (((8'hb5) ? (8'haf) : wire21) ?
                          reg30[(2'h3):(1'h0)] : $unsigned((8'hb6)))) ?
                      wire22[(1'h1):(1'h0)] : $unsigned(($unsigned(reg28) != $signed(reg30)))) : {(~^{wire18[(3'h4):(2'h3)]}),
                      $unsigned(((reg30 + wire23) > $unsigned(wire21)))});
            end
          else
            begin
              reg33 <= $signed(reg31[(4'ha):(3'h4)]);
              reg34 <= (8'hb2);
            end
        end
    end
  module37 #() modinst58 (.clk(clk), .wire40(reg28), .wire41(reg30), .wire38(reg32), .wire39(wire19), .y(wire57));
  assign wire59 = wire17[(3'h4):(2'h3)];
  module60 #() modinst116 (.wire63(wire26), .wire62(reg31), .y(wire115), .clk(clk), .wire61(wire20), .wire64(reg28));
  assign wire117 = ((^reg29[(4'ha):(4'h8)]) ^ {(^~($unsigned(reg31) >= wire25))});
  always
    @(posedge clk) begin
      if ((((($signed(wire20) ? (reg28 <= wire24) : (^~wire18)) == ((wire24 ?
              (8'h9d) : wire24) & (reg35 ? wire26 : reg30))) ?
          (8'hb3) : reg30) ^ (8'h9d)))
        begin
          reg118 <= (~&wire57[(3'h6):(2'h2)]);
          reg119 <= ((~&({$signed(reg34)} >>> (^reg36))) > reg30);
          reg120 <= $unsigned((^~$unsigned($unsigned($unsigned(reg36)))));
        end
      else
        begin
          reg118 <= (wire19 ?
              $unsigned(((^~((7'h44) ? wire17 : wire23)) ?
                  reg31 : (8'ha5))) : $unsigned((^~$signed({wire23,
                  (8'ha8)}))));
          if ((~|(-(~&wire26))))
            begin
              reg119 <= (~{(reg35 ?
                      $signed($unsigned((8'hb0))) : ((wire19 ^~ reg30) ?
                          {wire117} : (8'h9f)))});
              reg120 <= (wire18 != (~|(^$unsigned({(8'hb0), reg118}))));
              reg121 <= $unsigned(wire117);
              reg122 <= (reg29 ?
                  (wire59 ?
                      ($signed((wire18 * wire25)) ?
                          reg118[(4'he):(4'ha)] : (|$signed(wire115))) : {$signed((8'ha7)),
                          reg118[(4'hb):(3'h4)]}) : $unsigned(wire57[(2'h2):(2'h2)]));
              reg123 <= (wire17 <<< wire115[(3'h4):(2'h3)]);
            end
          else
            begin
              reg119 <= $signed(reg30);
              reg120 <= $unsigned(reg35);
              reg121 <= wire23;
              reg122 <= (|$signed($signed(wire23)));
              reg123 <= ((((|(reg118 ? (8'ha5) : wire24)) ?
                  (8'hb5) : (~wire26)) > $unsigned(($signed(wire26) == {reg30,
                  (8'hab)}))) && reg28[(4'h9):(4'h8)]);
            end
          reg124 <= (((8'h9c) * wire22) ^ $unsigned(($unsigned($signed((8'hac))) ?
              reg34[(1'h0):(1'h0)] : wire24)));
          if ($unsigned((^$signed((^reg34[(2'h3):(1'h0)])))))
            begin
              reg125 <= wire19[(3'h5):(3'h4)];
              reg126 <= wire24[(1'h1):(1'h1)];
            end
          else
            begin
              reg125 <= ($signed($signed(((&wire24) ?
                  reg122 : $unsigned(wire22)))) ^ ((wire18 ?
                      reg34 : wire57[(3'h7):(1'h0)]) ?
                  ((~^$signed((8'hb8))) <<< ((wire115 && (8'ha1)) & reg121[(3'h4):(1'h0)])) : $unsigned($signed((reg33 ?
                      reg28 : reg119)))));
              reg126 <= (~^$signed(reg124));
              reg127 <= (reg33 >>> (~reg121));
            end
        end
    end
  assign wire128 = (($unsigned($unsigned($unsigned(reg28))) && {(reg123[(2'h3):(1'h0)] & $signed(reg118))}) ?
                       $unsigned(($signed((8'ha3)) * reg119)) : wire59[(2'h2):(1'h0)]);
  assign wire129 = (reg29[(4'hd):(2'h3)] ?
                       (wire20[(4'ha):(4'h9)] >= $signed((~|(wire57 ?
                           reg126 : (8'ha8))))) : reg121);
  assign wire130 = $signed(reg124);
  always
    @(posedge clk) begin
      reg131 <= ($signed({(^wire23[(1'h0):(1'h0)]),
          ($unsigned((8'ha9)) ?
              (wire26 ? wire19 : wire115) : (reg119 ?
                  reg27 : reg31))}) >> $unsigned(($signed(((7'h43) * wire117)) < reg123[(4'h9):(1'h0)])));
      reg132 <= (reg119 ?
          (reg28[(1'h1):(1'h0)] ?
              (|(reg126[(4'ha):(4'h8)] || ((8'ha8) ?
                  wire115 : (8'hbc)))) : {(((7'h43) ?
                      wire57 : (7'h40)) != (&wire21))}) : $signed((wire59 ?
              reg122[(3'h6):(2'h2)] : (~&wire115))));
      reg133 <= wire17[(4'he):(4'he)];
      if ((wire18[(1'h1):(1'h0)] || $signed(reg119)))
        begin
          if ((8'hbb))
            begin
              reg134 <= reg32[(3'h5):(1'h1)];
            end
          else
            begin
              reg134 <= (&((reg126[(4'h9):(1'h0)] || reg29) ?
                  $signed(reg126) : (((reg34 ?
                      reg132 : reg124) >= $signed(reg34)) ^ (+(^(7'h42))))));
              reg135 <= $unsigned(wire128);
              reg136 <= (^~(&(8'ha8)));
              reg137 <= (~wire25[(5'h12):(3'h6)]);
              reg138 <= reg122;
            end
          if (($signed(wire24[(1'h1):(1'h0)]) & (~^(&$signed((wire59 ?
              (8'hbe) : wire22))))))
            begin
              reg139 <= (^~reg36);
              reg140 <= wire20[(2'h2):(1'h0)];
            end
          else
            begin
              reg139 <= $signed(((|{$signed(wire20)}) ^ $signed(reg33)));
              reg140 <= reg125;
              reg141 <= wire23[(4'he):(2'h3)];
              reg142 <= wire21;
              reg143 <= (~^(8'ha2));
            end
          reg144 <= reg30[(4'h8):(3'h4)];
        end
      else
        begin
          reg134 <= $unsigned($unsigned($signed({$unsigned(reg127)})));
          reg135 <= wire17;
          reg136 <= reg31[(3'h4):(2'h3)];
          if (($signed((((wire19 ? (7'h42) : (8'h9e)) ?
                  (~reg122) : (reg122 & (8'hae))) ?
              (~|(reg121 || (8'ha8))) : ((wire130 ?
                  wire20 : wire57) > reg27))) <<< ($unsigned(((reg127 * (8'ha3)) ?
              (reg28 ?
                  (8'haf) : wire17) : (reg120 * (8'hab)))) >>> reg135[(1'h0):(1'h0)])))
            begin
              reg137 <= (-wire24);
              reg138 <= $unsigned($signed($unsigned($unsigned($unsigned(reg27)))));
              reg139 <= ($signed($signed((^$unsigned((8'haa))))) < (&reg35));
              reg140 <= wire128[(4'hd):(3'h5)];
              reg141 <= reg141[(2'h2):(1'h0)];
            end
          else
            begin
              reg137 <= (~&(~$signed($unsigned((~&reg31)))));
            end
          reg142 <= wire23;
        end
      reg145 <= $unsigned(reg118);
    end
  module146 #() modinst160 (wire159, clk, wire59, reg127, reg136, reg133, reg143);
  assign wire161 = ({$unsigned((+$signed(reg35))), (~^(~|(reg141 >= reg125)))} ?
                       (^~$signed(($signed(wire22) ?
                           $unsigned(wire17) : $signed(reg132)))) : reg140);
  assign wire162 = (reg136[(4'hf):(1'h0)] ?
                       ($unsigned(((reg120 < wire17) | (reg122 ?
                           reg122 : wire128))) >>> $unsigned(reg34[(4'h9):(1'h0)])) : {({(wire17 <= reg35),
                                   reg140[(3'h4):(2'h3)]} ?
                               ({reg136, reg125} ?
                                   ((8'hbf) >> reg132) : {reg145,
                                       reg32}) : reg35)});
endmodule

module module146
#(parameter param158 = (^~(^~((8'ha3) >> (!(~|(8'hbe)))))))
(y, clk, wire151, wire150, wire149, wire148, wire147);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire151;
  input wire signed [(3'h7):(1'h0)] wire150;
  input wire signed [(5'h13):(1'h0)] wire149;
  input wire signed [(4'hc):(1'h0)] wire148;
  input wire [(4'hc):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  assign y = {wire157, wire156, wire154, wire153, wire152, reg155, (1'h0)};
  assign wire152 = (((((wire147 ? wire149 : wire147) ?
                                   ((8'hb2) - wire150) : (~|wire147)) ?
                               wire149[(1'h0):(1'h0)] : (wire147 || wire150[(1'h0):(1'h0)])) ?
                           (~|$unsigned($signed(wire147))) : $unsigned((+wire147))) ?
                       (($unsigned((-wire148)) == ($signed(wire147) || (wire147 != wire148))) ?
                           $unsigned($signed((~|(8'haa)))) : wire149) : ($signed((~&wire148)) <= wire150));
  assign wire153 = ((|wire152[(2'h3):(2'h3)]) << $signed(wire148[(4'h8):(2'h2)]));
  assign wire154 = wire150[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg155 <= wire153[(1'h0):(1'h0)];
    end
  assign wire156 = wire148[(3'h5):(2'h2)];
  assign wire157 = $signed(wire150);
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire64;
  input wire [(4'ha):(1'h0)] wire63;
  input wire [(5'h15):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire88;
  wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire90,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
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
                 reg89,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 (1'h0)};
  assign wire65 = (8'ha2);
  assign wire66 = $signed(($unsigned(wire61[(1'h1):(1'h0)]) ?
                      (|(wire61 + $unsigned(wire62))) : wire65[(2'h2):(2'h2)]));
  assign wire67 = ($signed(({(wire66 != wire61), {wire64}} ?
                          $signed((+wire65)) : $signed(wire66))) ?
                      $signed(wire62) : $unsigned(({((8'hac) << wire64)} ?
                          wire66[(1'h0):(1'h0)] : ($signed(wire62) <<< wire64))));
  assign wire68 = wire67;
  assign wire69 = ((^({$signed(wire63), $unsigned(wire66)} ? wire65 : wire65)) ?
                      $unsigned(wire62[(4'he):(3'h5)]) : (($unsigned($signed((8'hbb))) ?
                          (~^wire62) : (&(wire67 ?
                              (8'ha0) : wire63))) & (wire65[(5'h11):(3'h6)] < ($signed(wire64) <<< (wire66 | wire64)))));
  always
    @(posedge clk) begin
      reg70 <= (8'hbb);
      if ($unsigned({wire68[(3'h6):(1'h1)]}))
        begin
          reg71 <= (wire65[(5'h10):(4'hd)] ?
              (^~{{$unsigned(wire63), $signed((8'h9c))}}) : wire65);
          if ((8'ha9))
            begin
              reg72 <= (8'hac);
              reg73 <= reg72;
              reg74 <= $unsigned(($signed((&(&reg71))) <<< wire61[(1'h1):(1'h0)]));
              reg75 <= (~^(~|((~^wire61[(1'h0):(1'h0)]) ?
                  (8'ha2) : (~wire61))));
              reg76 <= (wire69 ?
                  $signed(wire67[(2'h3):(2'h2)]) : (wire61[(1'h0):(1'h0)] && $signed({$unsigned(wire62),
                      $unsigned(reg70)})));
            end
          else
            begin
              reg72 <= ($signed($signed($unsigned(wire68))) ?
                  ($unsigned($unsigned(wire67)) ?
                      ($signed(wire62) ?
                          ($signed(reg71) >> {(8'ha3),
                              wire69}) : ($signed(wire64) < wire63[(4'h8):(3'h7)])) : wire61[(1'h0):(1'h0)]) : wire67);
              reg73 <= reg72[(3'h5):(1'h1)];
            end
        end
      else
        begin
          if (($signed(reg73[(4'hf):(3'h6)]) ?
              wire68 : $unsigned(reg76[(2'h3):(2'h3)])))
            begin
              reg71 <= ($unsigned(wire65[(5'h12):(4'h9)]) ^ $signed((8'hbd)));
              reg72 <= (wire62 ? wire62 : reg74[(4'h8):(4'h8)]);
              reg73 <= $signed(reg75[(2'h3):(1'h0)]);
              reg74 <= (-$unsigned(((-$signed(wire65)) << reg72[(1'h0):(1'h0)])));
            end
          else
            begin
              reg71 <= wire69[(2'h3):(2'h2)];
            end
          reg75 <= wire62;
        end
      reg77 <= ($signed($signed($unsigned(reg76[(3'h6):(1'h1)]))) && $signed(reg71));
      reg78 <= {(reg71[(4'ha):(1'h1)] > $signed(wire63)),
          (~^(reg72[(3'h6):(2'h2)] ?
              ($signed(wire68) ?
                  (!reg73) : (wire67 ?
                      wire64 : (7'h40))) : $unsigned((wire69 < wire62))))};
      reg79 <= reg72;
    end
  always
    @(posedge clk) begin
      reg80 <= $signed($unsigned($signed((8'hb8))));
      if (reg72[(1'h0):(1'h0)])
        begin
          if (($unsigned((wire61 ?
              reg72 : {reg72})) >> $signed($unsigned((+((8'ha0) && reg77))))))
            begin
              reg81 <= (($unsigned(($unsigned((7'h44)) <= reg71)) ?
                  $unsigned(((~wire64) ?
                      (wire62 ?
                          (8'ha8) : reg76) : (reg79 & reg73))) : (^wire68[(1'h0):(1'h0)])) | (~^(!(+(wire62 ?
                  wire61 : reg80)))));
              reg82 <= $unsigned(reg78);
              reg83 <= $signed($unsigned(reg70[(2'h2):(1'h0)]));
              reg84 <= reg72[(2'h3):(1'h0)];
            end
          else
            begin
              reg81 <= ($unsigned((reg79[(1'h1):(1'h0)] & (((8'ha9) ?
                      (8'h9e) : reg75) ?
                  (reg70 == reg84) : reg73[(3'h7):(1'h1)]))) < (^$unsigned(((+reg80) != $unsigned(reg71)))));
              reg82 <= $unsigned(reg78[(3'h6):(1'h1)]);
              reg83 <= (((wire69 - $signed((reg83 ? wire66 : wire66))) ?
                      {$signed(reg77),
                          $unsigned($signed(reg80))} : (+$signed($signed(reg83)))) ?
                  $signed($signed({(8'hb3),
                      (reg73 ?
                          (8'hae) : (8'hbf))})) : $unsigned((reg81 && ($unsigned(reg76) ?
                      $unsigned(reg83) : {(8'hb3), reg80}))));
            end
        end
      else
        begin
          reg81 <= $unsigned(reg78[(4'hb):(1'h1)]);
          reg82 <= $signed(reg79[(3'h4):(1'h1)]);
          reg83 <= reg79;
          reg84 <= ($unsigned(reg81[(4'hf):(4'hc)]) ?
              {wire65[(4'he):(4'h9)],
                  (reg73 <= ((wire69 ? (8'hab) : wire64) ?
                      ((8'hac) ^ wire63) : wire69[(5'h13):(3'h4)]))} : reg75[(4'h8):(1'h1)]);
        end
    end
  assign wire85 = reg79[(3'h4):(2'h3)];
  assign wire86 = wire67[(2'h2):(1'h0)];
  assign wire87 = $unsigned($unsigned({(~wire69), reg84[(1'h1):(1'h0)]}));
  assign wire88 = $signed(wire61[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg89 <= reg77;
    end
  assign wire90 = $unsigned((((~^(reg80 <= wire62)) ?
                          $unsigned(wire61) : wire68[(1'h1):(1'h1)]) ?
                      ($unsigned(wire68) >> ((wire86 >> reg76) - $signed(wire86))) : wire86[(4'he):(2'h3)]));
  always
    @(posedge clk) begin
      if ((((^~reg77) < {$unsigned($signed(reg70)), $unsigned((^~wire64))}) ?
          $unsigned($signed($signed(reg75[(3'h7):(3'h7)]))) : (~(reg81[(4'hb):(2'h2)] << (|wire66)))))
        begin
          reg91 <= (+(-(~&$unsigned($signed((8'haa))))));
          if (($unsigned(((+((8'hb0) ? reg81 : wire61)) && {(wire88 ?
                      reg74 : reg80),
                  reg70[(4'h9):(3'h6)]})) ?
              $signed(reg72) : $unsigned(wire68)))
            begin
              reg92 <= wire61[(1'h0):(1'h0)];
              reg93 <= $unsigned(({$unsigned(wire61[(1'h1):(1'h1)])} ?
                  (~(8'ha8)) : (((reg75 ? (8'hba) : (8'ha1)) ?
                          (+wire85) : (reg73 ? wire68 : reg72)) ?
                      reg81 : (wire66 & $unsigned(wire85)))));
              reg94 <= {$unsigned({($signed((8'ha4)) >> $signed((8'ha3))),
                      $signed(wire86)}),
                  (wire90[(4'h8):(4'h8)] ?
                      $unsigned($unsigned((wire61 ? reg81 : reg78))) : reg93)};
              reg95 <= $signed((+reg92[(3'h7):(2'h2)]));
              reg96 <= wire64;
            end
          else
            begin
              reg92 <= ((($signed($unsigned(wire62)) ?
                      $signed($signed(reg92)) : (reg75[(2'h3):(2'h3)] ?
                          (reg96 ?
                              reg70 : reg82) : $signed(reg78))) <= reg93[(3'h5):(1'h0)]) ?
                  reg78 : (reg72[(3'h4):(1'h0)] ?
                      ({$signed(wire86),
                          (wire86 ?
                              wire63 : reg91)} * ($unsigned(wire62) < $unsigned(reg96))) : wire69));
            end
          reg97 <= reg95;
        end
      else
        begin
          reg91 <= $unsigned((^~wire66));
          reg92 <= $unsigned((wire63 <= {((&wire61) ?
                  $signed(reg79) : ((8'hac) ? reg79 : reg73)),
              (|(+reg84))}));
          reg93 <= (+(~^{($signed(reg94) ?
                  reg74[(4'hf):(1'h1)] : reg89[(2'h2):(2'h2)])}));
          reg94 <= reg93[(4'hd):(1'h0)];
          reg95 <= {$unsigned((8'h9e)),
              $signed($unsigned(reg83[(3'h5):(1'h0)]))};
        end
      reg98 <= wire68;
      reg99 <= $unsigned($signed($signed($signed(reg77[(4'ha):(2'h2)]))));
      reg100 <= wire86;
    end
  always
    @(posedge clk) begin
      if ((!reg100))
        begin
          reg101 <= {reg80[(4'hc):(3'h4)]};
          reg102 <= $unsigned(($unsigned((((8'h9d) ? reg99 : reg75) ?
              (~^reg99) : (reg101 ? wire64 : wire63))) & $signed(((^~wire61) ?
              $signed(reg71) : wire90[(4'h8):(1'h0)]))));
          reg103 <= (!(+($unsigned((wire67 ? reg97 : (8'ha9))) ^~ {{(8'ha1),
                  reg82}})));
          reg104 <= (|(-(-(8'h9f))));
          reg105 <= reg97[(5'h11):(4'h9)];
        end
      else
        begin
          reg101 <= (((|$unsigned((reg102 ? reg81 : reg79))) ?
                  (^~$signed((~wire62))) : ($signed((-wire85)) ~^ {{reg76,
                          reg82}})) ?
              {$signed($unsigned($signed(wire85))), reg96} : wire88);
          reg102 <= reg97[(4'h8):(3'h5)];
          reg103 <= (8'had);
          if ((^$signed($unsigned({reg103}))))
            begin
              reg104 <= $signed((8'hae));
            end
          else
            begin
              reg104 <= $signed($signed($signed(reg94)));
              reg105 <= (reg74[(3'h6):(2'h3)] ?
                  $unsigned({$signed((wire85 < (8'hac))),
                      ((|reg103) <= reg89[(2'h3):(2'h2)])}) : (~^$unsigned((-$unsigned((8'hb4))))));
              reg106 <= wire68[(5'h10):(5'h10)];
              reg107 <= $unsigned(wire62[(2'h3):(1'h0)]);
            end
          reg108 <= $signed($unsigned((8'hab)));
        end
      reg109 <= (($unsigned((~|$unsigned(wire69))) == $unsigned((~$signed((8'h9f))))) ?
          (reg98 ^ $signed($signed($signed(wire61)))) : (reg80[(4'hb):(4'ha)] != {({(7'h41)} ?
                  $signed((8'h9e)) : (reg106 <<< reg102))}));
      reg110 <= $unsigned({(~|reg95[(4'hd):(1'h1)])});
    end
  assign wire111 = ((^~({$unsigned(reg81)} ?
                       reg94[(4'hc):(3'h4)] : (~^$signed(reg73)))) <= (($signed({reg83,
                           reg103}) == ($signed(reg84) ?
                           reg99 : (reg72 ? reg81 : reg102))) ?
                       reg99 : $unsigned(reg104[(2'h3):(1'h1)])));
  assign wire112 = $signed((-reg103[(2'h2):(2'h2)]));
  assign wire113 = (({{wire112, reg79[(3'h4):(2'h2)]},
                           (^~(~^reg98))} >= (reg96 & (8'hb1))) ?
                       $unsigned($signed((|reg79))) : $unsigned($signed({wire66[(3'h4):(2'h2)]})));
  assign wire114 = wire86[(3'h7):(3'h4)];
endmodule

module module37
#(parameter param55 = ((((~((8'hab) ? (7'h40) : (8'h9e))) && (((8'h9c) > (8'ha9)) <= ((8'hb0) >> (8'haf)))) ~^ {(8'ha2)}) * ({(8'hae)} * (~|(+{(8'ha9), (8'ha9)})))), 
parameter param56 = (((param55 ? param55 : param55) ? (({param55} == param55) <= (!(param55 <= param55))) : (-param55)) ^ (((-((7'h42) ? param55 : param55)) + ((param55 ? param55 : param55) ? (^~param55) : param55)) ^~ param55)))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire [(4'hc):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire46;
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire46,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= $signed((|$signed(wire40[(4'ha):(1'h0)])));
      reg43 <= wire40[(3'h4):(1'h0)];
      reg44 <= ((~|$unsigned((-$unsigned(reg43)))) ?
          (wire41[(4'hb):(1'h0)] ?
              $unsigned((8'hb3)) : {$signed((wire39 ? reg42 : wire39)),
                  {(wire41 > reg42),
                      $signed(wire40)}}) : $signed({(&(&(8'haf))),
              (~^(wire38 ? wire38 : (7'h43)))}));
      reg45 <= ((~&(|reg42)) <= (($signed(wire39) ?
              wire40 : {(reg44 ? wire40 : reg44), $signed(wire41)}) ?
          $signed($signed(wire38[(1'h1):(1'h1)])) : ($unsigned(wire41[(3'h4):(1'h1)]) ?
              wire40 : wire39[(4'hf):(3'h5)])));
    end
  assign wire46 = ((wire40[(4'ha):(1'h1)] ?
                          (((reg44 ^~ wire41) >> (reg45 & reg42)) == {{wire39,
                                  reg45},
                              reg43[(3'h7):(3'h5)]}) : $unsigned(((^reg44) | (reg44 ?
                              wire40 : wire38)))) ?
                      reg45[(4'h9):(3'h7)] : (8'hb1));
  always
    @(posedge clk) begin
      reg47 <= wire46[(3'h7):(2'h3)];
      reg48 <= (^~$signed($unsigned($signed($unsigned((8'ha7))))));
      reg49 <= (8'ha2);
      reg50 <= reg49[(4'ha):(3'h4)];
      reg51 <= (wire39 << reg50);
    end
  assign wire52 = reg44;
  assign wire53 = reg48;
  assign wire54 = $signed(wire46);
endmodule
