module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire99;
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire101,
                 wire5,
                 wire20,
                 wire99,
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
  assign wire5 = $signed((((wire1 ? {wire2} : (!wire0)) ?
                         (wire4[(2'h3):(2'h2)] ?
                             $signed(wire0) : (wire4 ?
                                 wire1 : wire3)) : (~&wire0)) ?
                     (!((wire0 >> wire1) ~^ wire0[(4'ha):(3'h4)])) : (~&($unsigned(wire1) ?
                         wire4[(3'h6):(2'h3)] : wire1[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire1[(1'h1):(1'h1)])
        begin
          reg6 <= $signed(wire1[(1'h1):(1'h1)]);
          reg7 <= $unsigned(({$unsigned(wire2)} == $unsigned($unsigned(wire2[(4'hd):(2'h2)]))));
          reg8 <= $unsigned((~^{(8'ha5), {$unsigned(wire1)}}));
          reg9 <= wire1[(1'h0):(1'h0)];
          reg10 <= wire2[(3'h5):(3'h4)];
        end
      else
        begin
          if (($unsigned(($unsigned((reg7 | reg9)) < {wire3})) - {$unsigned(wire1)}))
            begin
              reg6 <= ((($unsigned(((8'hb7) >> (8'had))) == {(wire4 >= reg6),
                      $unsigned(reg9)}) ?
                  (reg9 ?
                      ($unsigned(reg6) != wire5) : reg10[(4'h9):(3'h6)]) : {$signed($signed(reg7)),
                      reg9}) & $unsigned(reg7));
              reg7 <= ((^~{reg9[(1'h1):(1'h1)],
                  (~^((8'hb4) ?
                      wire5 : reg7))}) + (wire2[(4'h9):(3'h5)] << {(~wire5),
                  wire2[(3'h5):(3'h4)]}));
              reg8 <= (~|((~&wire0[(2'h3):(1'h1)]) || $signed(({reg10, wire2} ?
                  reg8 : reg8))));
              reg9 <= wire3[(2'h2):(1'h1)];
              reg10 <= (reg10[(4'hb):(4'h8)] && ($signed($unsigned((wire3 >= (8'hab)))) | (8'ha0)));
            end
          else
            begin
              reg6 <= $signed($signed($signed(($unsigned(wire3) ?
                  (reg9 && reg6) : (reg7 + wire4)))));
            end
          reg11 <= wire0[(3'h5):(3'h5)];
          if ((((~$signed((+wire0))) && ($unsigned($signed(wire0)) > wire5)) ?
              reg6 : {(^~(8'ha2)),
                  ((^(wire5 ? wire2 : reg9)) < (reg7 | {wire5}))}))
            begin
              reg12 <= (~&(wire0[(2'h2):(1'h1)] * reg9));
            end
          else
            begin
              reg12 <= wire5[(4'h8):(2'h3)];
              reg13 <= $unsigned(((|($signed(wire5) ?
                  ((8'hb8) ?
                      reg10 : reg6) : (~|(8'h9f)))) != ($unsigned($signed((8'hb5))) == $unsigned((reg6 ?
                  wire3 : wire2)))));
              reg14 <= {reg11[(4'hd):(4'hb)]};
              reg15 <= {(reg7[(3'h6):(3'h6)] <= reg14[(1'h0):(1'h0)]),
                  $unsigned(((wire0[(3'h6):(3'h6)] * reg11[(4'hd):(4'hb)]) >= (~|$unsigned(wire0))))};
            end
          reg16 <= (~^(~$unsigned($signed({reg7}))));
        end
      reg17 <= wire2;
      reg18 <= reg10[(5'h11):(4'h8)];
      reg19 <= reg6[(1'h1):(1'h0)];
    end
  assign wire20 = (^reg14);
  module21 #() modinst100 (wire99, clk, reg13, reg9, reg11, reg8, wire20);
  assign wire101 = (((^((wire2 + wire0) ?
                       $signed(reg12) : (reg17 ?
                           wire99 : reg19))) > $signed(({reg7,
                       wire2} | reg17))) != $unsigned((~^(wire1[(1'h1):(1'h1)] ~^ wire99))));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire [(4'he):(1'h0)] wire23;
  input wire [(3'h5):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire47,
                 wire46,
                 wire29,
                 wire28,
                 wire27,
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
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  assign wire27 = (((wire25[(2'h3):(1'h1)] ?
                              $signed($unsigned(wire22)) : $unsigned(wire26[(5'h11):(1'h1)])) ?
                          ($signed($signed(wire25)) ?
                              $unsigned($signed(wire25)) : ((8'hb2) > $unsigned(wire24))) : wire22) ?
                      $signed($unsigned({(~|wire22),
                          wire25[(4'ha):(3'h6)]})) : $signed((wire25 ?
                          $signed(wire23) : wire26[(4'ha):(3'h4)])));
  assign wire28 = wire26[(4'h9):(3'h5)];
  assign wire29 = wire27;
  always
    @(posedge clk) begin
      if (wire26[(5'h10):(4'h8)])
        begin
          if (wire27)
            begin
              reg30 <= $signed((($signed($unsigned(wire26)) ?
                  wire29[(5'h11):(4'hd)] : $signed($unsigned(wire28))) >>> $signed(((-wire29) ~^ wire26))));
              reg31 <= (^{$signed((wire29[(4'hb):(3'h6)] > $unsigned(wire29)))});
              reg32 <= ((-(8'ha3)) > (wire29[(4'hc):(4'ha)] ?
                  (wire26[(4'hc):(4'hc)] < ((8'hb4) * wire23[(4'hd):(3'h6)])) : {($unsigned(wire23) ?
                          (~^wire26) : $signed(reg30))}));
              reg33 <= (~^(8'h9c));
            end
          else
            begin
              reg30 <= reg33;
              reg31 <= $unsigned((wire29[(1'h0):(1'h0)] * (((8'ha8) ?
                  reg32 : $signed(reg30)) >= (^~(reg33 <= wire26)))));
              reg32 <= (wire28 ?
                  $unsigned(((^~(reg30 ?
                      wire27 : wire23)) ^~ ($unsigned(reg30) != $unsigned(wire27)))) : reg30);
              reg33 <= reg31[(4'hb):(3'h7)];
            end
          reg34 <= ($signed($signed(wire25)) ?
              wire24[(4'ha):(2'h3)] : (|(((wire26 ?
                  (7'h42) : wire28) - reg32[(1'h0):(1'h0)]) <<< reg31)));
          reg35 <= ((&(wire23[(4'h9):(3'h7)] >> (((8'ha8) && reg33) ?
                  wire26 : ((7'h41) ? wire27 : (8'ha6))))) ?
              (reg31[(1'h1):(1'h0)] <= (^wire28)) : (reg32 ?
                  $signed({$unsigned(reg32), reg30}) : $signed(wire22)));
          reg36 <= $signed(($signed(wire24) && ((^(~&reg35)) ~^ {$signed((8'hb8)),
              reg34[(4'hb):(3'h4)]})));
          if (($signed(reg30) ?
              $signed({$unsigned({wire29, reg30})}) : wire24[(3'h5):(3'h5)]))
            begin
              reg37 <= $unsigned(($unsigned($signed({reg31, wire24})) ?
                  $signed(($signed(wire26) ?
                      $unsigned(wire22) : $unsigned(wire22))) : ((!wire26) ?
                      reg33 : ($unsigned(wire28) ?
                          $unsigned(reg35) : (wire28 >>> wire25)))));
              reg38 <= $signed($unsigned(reg32[(3'h5):(1'h0)]));
              reg39 <= wire28;
              reg40 <= (&((^(+(~wire25))) ?
                  ((8'hbf) ?
                      wire24 : (reg39[(1'h0):(1'h0)] ?
                          {(8'hb8),
                              reg30} : (~^(7'h41)))) : reg35[(4'hf):(2'h2)]));
            end
          else
            begin
              reg37 <= ($unsigned((+(reg37[(3'h5):(1'h1)] && {(8'hbc)}))) ?
                  {reg40} : reg40);
              reg38 <= $unsigned((($unsigned((8'ha6)) | $unsigned($signed(reg36))) ?
                  (7'h40) : wire29));
            end
        end
      else
        begin
          if (reg33)
            begin
              reg30 <= {(+wire27[(2'h3):(1'h0)]),
                  (|({(reg40 ? wire23 : reg34)} ?
                      wire29 : ($unsigned((8'ha6)) ?
                          $signed(wire28) : (~&wire29))))};
              reg31 <= reg32;
            end
          else
            begin
              reg30 <= reg37[(3'h4):(1'h0)];
              reg31 <= $signed(($unsigned(($unsigned(wire22) >> reg36)) ~^ wire25[(3'h5):(3'h4)]));
            end
          reg32 <= $signed(reg40[(3'h4):(3'h4)]);
        end
      reg41 <= $signed((~&((8'hb1) ? $unsigned((^(8'h9c))) : reg38)));
      reg42 <= reg34[(4'hd):(4'h9)];
      if (wire23[(4'ha):(3'h7)])
        begin
          reg43 <= wire29[(3'h4):(1'h0)];
          reg44 <= wire23[(4'he):(3'h5)];
        end
      else
        begin
          if ($unsigned($signed((~|({wire28, reg41} ?
              reg35[(2'h2):(2'h2)] : reg44)))))
            begin
              reg43 <= reg40;
              reg44 <= wire28;
              reg45 <= {(-reg32),
                  {(~|(reg43 - reg31)), (|$signed(reg31[(4'hc):(4'ha)]))}};
            end
          else
            begin
              reg43 <= (8'h9f);
            end
        end
    end
  assign wire46 = $unsigned(({($signed(reg34) ~^ (wire25 ? wire26 : reg40))} ?
                      reg32 : {(wire29[(5'h11):(4'hf)] >= (^wire24))}));
  assign wire47 = {wire22[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg48 <= reg40;
      reg49 <= (reg39[(1'h1):(1'h0)] > (reg41 && $unsigned((8'ha9))));
      if ($signed((^~{($unsigned(wire22) < (reg41 ? (8'hb9) : reg49)),
          $signed(wire24)})))
        begin
          if ($unsigned($unsigned($unsigned(wire47))))
            begin
              reg50 <= (reg48 < (reg49 ?
                  (+$signed(reg37)) : reg35[(4'hc):(4'h8)]));
              reg51 <= $signed(($unsigned((|(wire22 ? reg36 : reg48))) ?
                  (!(wire28[(2'h2):(2'h2)] ?
                      $unsigned(reg38) : (wire46 - reg32))) : {wire23,
                      {{reg40}}}));
              reg52 <= ($unsigned(($unsigned({wire27}) >>> (wire28[(1'h0):(1'h0)] >>> reg51[(3'h4):(1'h0)]))) ?
                  (((~(reg48 ? wire29 : reg38)) ?
                      (8'hae) : ((reg39 ^~ reg38) ?
                          (reg49 ?
                              reg37 : reg31) : $signed(reg48))) < $signed($unsigned(((8'hbb) << (8'hbb))))) : reg34[(3'h4):(1'h0)]);
              reg53 <= ((({reg52[(1'h0):(1'h0)]} - (^~(8'hae))) != reg34) ?
                  ($unsigned({reg30[(1'h1):(1'h0)]}) ?
                      (~|$signed((|reg43))) : (~(wire22[(1'h0):(1'h0)] ?
                          $unsigned(wire28) : $signed(reg35)))) : (~$unsigned({((8'h9c) >> reg52),
                      (8'ha0)})));
              reg54 <= (8'haa);
            end
          else
            begin
              reg50 <= (~(reg52 ?
                  (^$signed(wire25[(4'h9):(4'h8)])) : (wire27 ?
                      ((wire25 >= reg44) ?
                          (wire24 - reg52) : (reg30 ?
                              (8'ha8) : reg50)) : ((wire46 ? reg35 : wire23) ?
                          wire28[(2'h2):(1'h1)] : reg52[(2'h2):(1'h0)]))));
              reg51 <= wire22;
              reg52 <= ($signed($signed($signed(reg41[(4'h8):(3'h4)]))) ?
                  (reg31[(4'hb):(3'h5)] <<< reg48) : ((((wire22 ?
                                  reg38 : reg35) ?
                              reg32[(3'h4):(1'h1)] : ((8'h9d) < reg52)) ?
                          wire28[(1'h1):(1'h0)] : $unsigned(reg39[(1'h0):(1'h0)])) ?
                      wire25 : reg37));
            end
          reg55 <= (&{(reg50 & ({reg50} >>> (^~reg52)))});
          reg56 <= {$signed($signed((-{reg32}))),
              $signed(((&reg31[(4'h9):(4'h9)]) <<< reg44[(2'h2):(1'h1)]))};
          if (reg32)
            begin
              reg57 <= (wire27[(1'h1):(1'h0)] ?
                  $signed(((|(wire46 >> reg31)) ?
                      $signed({reg32,
                          reg44}) : $signed((reg40 <<< reg34)))) : reg34);
              reg58 <= $signed(($unsigned((reg35 ?
                  $signed(wire25) : (+reg51))) >= $signed(reg48)));
            end
          else
            begin
              reg57 <= (($unsigned((reg41[(1'h0):(1'h0)] > {reg49})) ?
                  (((^~reg37) ? {reg39, reg42} : (reg48 ? reg56 : wire29)) ?
                      $unsigned({wire28}) : ((wire25 ? reg40 : wire46) ?
                          reg32 : (~|reg41))) : ({$unsigned(reg58),
                          reg43[(4'hb):(1'h0)]} ?
                      $unsigned($signed((8'hb9))) : reg43)) >>> $signed(($unsigned(reg43) ?
                  wire27[(2'h3):(1'h0)] : (reg30 >> $signed(reg54)))));
            end
          reg59 <= ($unsigned({reg30}) >= (~reg40));
        end
      else
        begin
          reg50 <= {($unsigned((reg56[(4'hd):(4'h8)] ?
                      (+wire23) : (reg55 ? wire27 : reg36))) ?
                  reg34 : $unsigned((~((8'ha9) ? reg32 : wire28)))),
              reg50[(2'h3):(2'h3)]};
          reg51 <= reg34[(4'h9):(3'h7)];
          reg52 <= (-($signed({(+(8'ha5))}) ?
              $signed((reg35 < {reg53, reg53})) : reg40[(4'ha):(4'h9)]));
          if ($unsigned($unsigned((~&reg58[(1'h0):(1'h0)]))))
            begin
              reg53 <= (8'ha5);
              reg54 <= ((reg57[(4'hc):(4'hb)] >> (reg52 ?
                      {(reg45 ? reg40 : (8'hb1))} : ((~|(8'hae)) != (reg57 ?
                          reg43 : reg38)))) ?
                  (wire47 - wire22) : $signed(reg51[(3'h6):(3'h5)]));
              reg55 <= (($unsigned($unsigned(reg51[(4'h8):(1'h0)])) >= $unsigned(reg40[(4'hd):(2'h3)])) <<< reg56[(3'h6):(1'h1)]);
            end
          else
            begin
              reg53 <= ((-$signed(($signed(reg39) ? reg51 : $signed(wire23)))) ?
                  $unsigned($signed(wire47)) : $signed($signed($signed(reg53))));
            end
          if ($signed((+{{$signed(reg36)}})))
            begin
              reg56 <= $unsigned(wire23[(4'hd):(4'hd)]);
              reg57 <= {reg59,
                  $signed((((reg38 ? reg40 : wire28) || (!reg34)) ~^ wire47))};
              reg58 <= $signed(wire26);
            end
          else
            begin
              reg56 <= ($signed(({$unsigned(reg54), reg56} ?
                  (reg35[(4'h9):(3'h4)] ?
                      $unsigned(reg55) : {reg32}) : (8'hbe))) || {reg42,
                  reg40});
              reg57 <= {reg33[(1'h1):(1'h1)], {(|(|(wire28 & reg41)))}};
              reg58 <= ($unsigned(((wire22 ?
                  (wire26 ~^ reg54) : reg59[(3'h4):(1'h0)]) - reg34)) < ($signed($signed(reg56)) ^ $unsigned($signed({(8'ha7)}))));
            end
        end
      reg60 <= (reg30 == ((-{reg41[(2'h3):(2'h2)]}) || reg59));
    end
  module61 #() modinst87 (.wire66(reg59), .wire64(reg35), .wire63(reg51), .wire65(wire27), .clk(clk), .wire62(wire46), .y(wire86));
  assign wire88 = reg33;
  assign wire89 = $signed((&($unsigned(reg37) - reg38[(1'h0):(1'h0)])));
  assign wire90 = (wire22[(2'h2):(2'h2)] ?
                      ($signed(($signed(wire27) ?
                              (reg59 ? wire86 : reg49) : $unsigned((8'hb0)))) ?
                          ($signed($signed(wire25)) ?
                              (reg32[(3'h6):(1'h0)] ?
                                  {reg50, (8'ha8)} : (~&(8'hac))) : ((reg32 ?
                                      reg33 : wire29) ?
                                  $unsigned(reg32) : (wire89 ^ reg36))) : (reg53[(3'h6):(2'h3)] ?
                              {(reg42 + wire24)} : $unsigned((wire22 == (7'h40))))) : {(8'hb9),
                          (((reg33 ? reg44 : wire23) ^ $signed(wire89)) ?
                              wire46 : reg53[(4'h8):(3'h6)])});
  assign wire91 = $unsigned($signed($unsigned($unsigned((^reg44)))));
  assign wire92 = (^(|wire86[(3'h7):(3'h4)]));
  assign wire93 = reg55;
  assign wire94 = ((reg36[(1'h1):(1'h0)] <<< (((8'hbc) ?
                          $signed(wire46) : (reg32 ?
                              (8'hb4) : wire92)) > reg49)) ?
                      (reg53 << ((~&wire86[(2'h3):(2'h2)]) >= (((7'h44) > reg48) + (^~reg57)))) : reg30);
  assign wire95 = ((($signed(((8'haa) * reg31)) ?
                          $signed($signed(wire86)) : $unsigned($signed((8'haf)))) ?
                      wire25[(4'h9):(3'h7)] : ((&(8'h9c)) < $signed($signed(wire94)))) <<< $unsigned((+((reg60 && reg49) ?
                      $signed(wire28) : $signed(reg30)))));
  assign wire96 = (!(+$unsigned(reg41[(1'h0):(1'h0)])));
  assign wire97 = reg51[(4'h8):(2'h3)];
  assign wire98 = $unsigned($unsigned((wire97[(4'hb):(4'ha)] ?
                      ($unsigned((8'ha9)) ?
                          reg37 : wire88) : (+$signed(wire22)))));
endmodule

module module61
#(parameter param85 = {(^~((~&(^(7'h43))) ? (((7'h42) ? (7'h41) : (8'ha1)) ? (~|(8'h9c)) : {(8'ha1)}) : (~&((8'hbd) ? (8'hbe) : (8'h9c))))), {({((8'ha7) ^~ (8'ha5)), ((8'hb9) ~^ (8'hac))} ? (8'hbb) : {((7'h42) ? (8'h9c) : (8'hb8))})}})
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(3'h6):(1'h0)] wire65;
  input wire [(3'h6):(1'h0)] wire64;
  input wire [(3'h7):(1'h0)] wire63;
  input wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(((~&wire64[(3'h6):(3'h5)]) ?
          (!wire66[(5'h12):(5'h11)]) : wire66)))
        begin
          reg67 <= $signed($signed($signed(wire66)));
          reg68 <= wire65;
          reg69 <= $unsigned(wire66);
          if ($unsigned($signed((reg67[(4'h9):(1'h0)] ~^ reg67))))
            begin
              reg70 <= $unsigned($unsigned((wire63[(3'h5):(3'h5)] <<< reg67)));
              reg71 <= $signed($signed({$unsigned(reg70[(4'hc):(2'h3)])}));
              reg72 <= $unsigned(reg70[(4'hc):(3'h5)]);
              reg73 <= (~&$signed((wire65[(3'h4):(3'h4)] ?
                  (^~(|reg71)) : reg70[(4'hb):(3'h5)])));
              reg74 <= $signed(((~|{reg73[(4'hf):(1'h0)],
                  (-(8'hb9))}) != (^~($signed(reg73) <= $unsigned((8'ha5))))));
            end
          else
            begin
              reg70 <= reg71;
              reg71 <= ((((+((7'h41) * wire66)) + $signed({(8'hb9)})) ?
                  (!$signed((~&wire66))) : (reg74 ?
                      $signed(wire66[(4'hb):(4'ha)]) : wire64)) <= (!{((reg67 ?
                      reg70 : reg69) - (reg72 ^~ reg71))}));
              reg72 <= {{($signed((reg74 != reg70)) ?
                          ($unsigned((7'h42)) ?
                              wire65[(1'h1):(1'h0)] : ((8'hb2) != reg72)) : {$signed(reg72)})},
                  reg72[(3'h5):(1'h0)]};
              reg73 <= ($unsigned($unsigned($unsigned($unsigned(wire63)))) ^~ ((wire63[(1'h0):(1'h0)] - wire65) == $signed({wire62[(5'h10):(4'h9)]})));
              reg74 <= {$unsigned(($unsigned($signed((8'ha7))) ?
                      (~&$signed(reg71)) : ((|wire64) ?
                          (!wire65) : (reg67 ? wire63 : reg74)))),
                  (!$signed($unsigned($unsigned(wire65))))};
            end
          if ($unsigned(wire62[(5'h11):(5'h11)]))
            begin
              reg75 <= ($unsigned($unsigned(((reg73 >= reg71) << $signed(wire65)))) ?
                  ((reg72 ^ reg73) && (^~reg73)) : wire64[(3'h4):(1'h0)]);
              reg76 <= reg70;
              reg77 <= {(reg69[(4'he):(3'h5)] & (wire63[(3'h4):(1'h0)] ?
                      {(wire65 ?
                              (8'ha6) : wire62)} : (wire65[(1'h1):(1'h0)] & (-(7'h42)))))};
              reg78 <= $unsigned((-$unsigned((^~reg67))));
              reg79 <= (wire62 + $signed($signed(reg67[(4'h8):(3'h5)])));
            end
          else
            begin
              reg75 <= (8'hab);
              reg76 <= $signed($signed(($signed(wire62) || wire62)));
              reg77 <= (reg72[(3'h6):(3'h5)] - (wire62[(2'h2):(2'h2)] ?
                  (^~$unsigned((^(8'h9c)))) : (($signed((7'h43)) ?
                      (reg72 ? reg73 : reg73) : (reg76 + reg72)) ^~ reg72)));
              reg78 <= reg72[(3'h4):(3'h4)];
            end
        end
      else
        begin
          if ($signed(((8'ha4) ?
              {$signed((wire64 >= (8'ha4)))} : $unsigned(((8'hb2) ?
                  (reg70 ? wire62 : reg78) : reg68)))))
            begin
              reg67 <= wire65;
              reg68 <= reg69;
              reg69 <= $unsigned(($signed($signed($unsigned(reg68))) ?
                  (-(wire66[(4'h8):(3'h7)] & reg68[(3'h5):(1'h1)])) : {(reg75[(4'hc):(3'h5)] == $unsigned(wire65)),
                      reg76[(1'h1):(1'h1)]}));
              reg70 <= $signed(reg74[(2'h2):(2'h2)]);
              reg71 <= $unsigned(reg71);
            end
          else
            begin
              reg67 <= (({$unsigned(reg69[(4'hb):(3'h7)]),
                          {{reg72, reg71}, (reg76 ? reg71 : (8'h9c))}} ?
                      ((8'haa) <<< (8'ha3)) : $unsigned((+(7'h41)))) ?
                  reg70[(3'h6):(3'h6)] : (wire65[(3'h5):(1'h1)] && reg73[(2'h2):(1'h0)]));
              reg68 <= reg70;
              reg69 <= ((({(reg78 ? reg78 : reg77),
                      $signed(reg77)} != reg71[(4'h8):(1'h0)]) < (~$unsigned((~^reg75)))) ?
                  {{($unsigned(wire66) || reg74[(2'h3):(1'h1)])},
                      reg67} : reg73);
              reg70 <= reg72[(3'h7):(3'h4)];
            end
        end
    end
  assign wire80 = wire63[(3'h7):(3'h6)];
  assign wire81 = ((|(|(~|(reg69 & reg75)))) ?
                      $signed($unsigned(((+reg74) << {wire63,
                          (8'hbd)}))) : reg75);
  assign wire82 = (~((+(reg76[(1'h1):(1'h1)] ? ((7'h44) << reg72) : wire64)) ?
                      ($unsigned(reg71[(1'h1):(1'h0)]) <<< $signed({reg77,
                          (8'h9d)})) : $signed({$signed(wire81)})));
  assign wire83 = reg77[(3'h4):(2'h3)];
  assign wire84 = (({wire62, $unsigned(reg69)} ?
                          $unsigned((((8'hbc) < reg77) != {(7'h42)})) : {reg73[(4'hc):(4'h8)]}) ?
                      reg70 : $signed($unsigned(reg72)));
endmodule
