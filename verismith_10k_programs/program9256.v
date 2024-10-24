module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire82;
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire82,
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
                 (1'h0)};
  assign wire4 = $signed(wire3[(1'h1):(1'h0)]);
  assign wire5 = ((8'ha0) ?
                     $signed($signed($unsigned(((8'hb7) | wire0)))) : wire3);
  assign wire6 = (8'hbc);
  assign wire7 = (wire3 ?
                     wire4 : $unsigned($signed($signed(wire4[(4'h8):(3'h6)]))));
  assign wire8 = {(($unsigned($signed(wire3)) ?
                         $unsigned(wire5) : (8'haa)) < (~wire7[(3'h5):(3'h5)])),
                     (!$signed($signed(wire7)))};
  always
    @(posedge clk) begin
      if ($signed(($signed($signed(wire2[(2'h2):(1'h1)])) ?
          wire3[(1'h0):(1'h0)] : $unsigned({$unsigned(wire4)}))))
        begin
          reg9 <= wire0[(4'ha):(3'h6)];
          reg10 <= (({$unsigned({(8'hb9)}),
              wire7[(2'h2):(2'h2)]} > (~|$signed($unsigned(wire5)))) == wire4);
          reg11 <= {wire5[(1'h0):(1'h0)]};
          reg12 <= (8'ha1);
        end
      else
        begin
          reg9 <= (|((^~reg9) + ($signed($signed((8'h9f))) < $signed($unsigned(reg11)))));
          reg10 <= reg12;
        end
      reg13 <= $unsigned($signed(wire1));
      reg14 <= wire0;
    end
  always
    @(posedge clk) begin
      reg15 <= ((($unsigned($unsigned(reg10)) | {$signed(wire8),
              (wire4 ^ reg14)}) - (8'ha5)) ?
          $signed({wire6}) : reg11[(4'h9):(3'h6)]);
      reg16 <= wire8[(2'h2):(1'h1)];
      reg17 <= $unsigned(((((~&(8'hb0)) >>> (^~wire4)) & ($signed(reg9) ^~ {reg11,
              reg9})) ?
          reg9 : reg9));
      reg18 <= reg13[(4'h9):(2'h3)];
    end
  module19 #() modinst83 (.clk(clk), .wire23(reg18), .y(wire82), .wire21(wire6), .wire22(reg12), .wire20(reg15));
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire62;
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  assign y = {wire81,
                 wire66,
                 wire64,
                 wire62,
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
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 (1'h0)};
  module24 #() modinst63 (wire62, clk, wire20, wire22, wire23, wire21);
  assign wire64 = $unsigned((-(((-wire22) ?
                          $signed(wire62) : wire21[(2'h2):(1'h0)]) ?
                      wire62 : (wire23 != wire22[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg65 <= ((^wire62) ?
          {wire22} : $unsigned(((wire21[(4'h9):(4'h8)] ?
              wire23 : $signed(wire23)) ^~ (-(wire64 != (8'hb6))))));
    end
  assign wire66 = (7'h40);
  always
    @(posedge clk) begin
      if (((~^($unsigned(wire20[(1'h1):(1'h1)]) | ($signed(wire64) ?
          $unsigned(reg65) : (wire23 ?
              wire22 : wire62)))) | wire23[(1'h0):(1'h0)]))
        begin
          if (reg65)
            begin
              reg67 <= (!(~^$signed((!(!wire23)))));
              reg68 <= {wire22[(3'h6):(2'h2)]};
              reg69 <= ((((|(wire21 ?
                          reg67 : wire21)) - ($unsigned((7'h44)) < $unsigned(wire23))) ?
                      {wire21} : {{(wire21 ? wire22 : wire21), $signed(wire62)},
                          $unsigned(wire66)}) ?
                  wire62[(4'h8):(3'h4)] : $unsigned((({(7'h43),
                      wire21} != $signed(wire21)) << ((&wire64) >> (wire21 << reg67)))));
            end
          else
            begin
              reg67 <= ($signed($unsigned($unsigned($unsigned(reg68)))) ?
                  (&$unsigned(({(8'had)} ?
                      (wire21 != (8'ha6)) : reg67[(4'he):(3'h7)]))) : wire23);
              reg68 <= {($signed(wire20[(3'h5):(2'h2)]) * {(reg68[(4'hb):(4'h8)] && $unsigned(wire66)),
                      ({wire22} << {wire64})})};
              reg69 <= ((~&($unsigned(wire66) != (^(wire20 ?
                  (7'h42) : reg69)))) & $signed(($unsigned((8'hb1)) ?
                  (8'hbc) : (-wire23))));
              reg70 <= (wire20[(1'h1):(1'h0)] << {reg69, reg67[(3'h4):(1'h0)]});
              reg71 <= {(~^({(&reg70), (wire64 ? reg68 : reg67)} ?
                      wire20 : {(wire64 ^ (8'h9e)), {(8'hbb)}}))};
            end
          reg72 <= wire22[(4'hf):(3'h4)];
          reg73 <= (((reg67[(4'hc):(2'h3)] ?
                  $signed($unsigned(reg70)) : (reg65 ?
                      reg71 : $signed(reg68))) << reg72) ?
              wire62 : ({({reg72, wire20} >> (~|wire22)),
                      ($signed((8'h9d)) < (reg67 ~^ wire22))} ?
                  (reg68[(1'h0):(1'h0)] ?
                      reg65 : reg72[(3'h5):(1'h0)]) : ($signed($unsigned(wire62)) | $unsigned(reg65))));
          if ((~^reg65[(4'h8):(3'h6)]))
            begin
              reg74 <= wire66[(5'h12):(4'ha)];
              reg75 <= $signed((^(($unsigned(wire64) << $unsigned(reg69)) & (7'h44))));
            end
          else
            begin
              reg74 <= ((+$signed((8'hb9))) ?
                  (^~{(+reg69[(4'hb):(3'h5)]),
                      ($unsigned(reg69) ?
                          (^wire64) : (reg73 <= reg70))}) : reg67[(2'h2):(2'h2)]);
              reg75 <= (reg74 ?
                  ((+((^~(8'hb8)) || $unsigned(reg69))) ?
                      (~^{(~|reg69),
                          (wire64 + reg75)}) : $signed((!(reg71 | (8'hb4))))) : $signed((^(reg69 <= (|reg68)))));
              reg76 <= (8'hba);
              reg77 <= {({$unsigned((reg68 ~^ (8'h9f))), wire21} ?
                      ($unsigned((~&reg75)) ?
                          (wire23 >>> $unsigned(reg71)) : (((8'ha0) ?
                                  wire21 : reg74) ?
                              reg65[(4'he):(1'h1)] : (wire66 + (8'h9f)))) : {((reg67 ?
                              wire23 : (8'hb9)) * ((8'ha5) << (8'h9d)))})};
              reg78 <= (wire20[(3'h5):(2'h2)] | reg76[(2'h3):(1'h0)]);
            end
          reg79 <= (reg78[(3'h4):(3'h4)] ?
              {(~&reg65)} : $unsigned($signed(((wire22 ^~ reg74) ?
                  $signed(reg70) : (reg67 >>> wire21)))));
        end
      else
        begin
          reg67 <= {{wire66[(2'h3):(2'h2)]}, reg70[(1'h0):(1'h0)]};
          reg68 <= reg78[(3'h4):(2'h2)];
          reg69 <= wire22;
          reg70 <= (-(((reg74 ? (^wire62) : (-reg74)) ?
                  (^~{reg67, wire22}) : ((|(8'had)) ^~ $unsigned(wire22))) ?
              $unsigned($signed(((8'h9f) ? reg67 : wire20))) : ((reg76 ?
                      (&reg71) : $signed(wire22)) ?
                  reg65 : $unsigned((reg79 >= reg69)))));
          reg71 <= $unsigned($signed((wire62 ?
              $unsigned($signed((8'h9c))) : (~^(reg72 * reg67)))));
        end
      reg80 <= wire64;
    end
  assign wire81 = reg74;
endmodule

module module24
#(parameter param61 = (~^(({(~&(8'haa))} & (((7'h42) << (8'hab)) || ((8'hbc) == (8'hab)))) ? {(~|((8'ha5) ? (8'hbc) : (8'hb1))), ({(8'hbd)} == {(7'h43), (8'h9e)})} : ((((8'hba) ? (7'h40) : (8'hb6)) ? ((8'haa) ? (7'h44) : (7'h44)) : ((8'hbc) ? (8'haf) : (8'hbb))) >>> ({(8'ha4)} ? ((8'hb1) > (8'hac)) : {(8'hab), (7'h42)})))))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire28;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire60,
                 wire45,
                 wire35,
                 wire33,
                 wire30,
                 wire29,
                 reg59,
                 reg58,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg34,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire29 = (wire27[(3'h4):(3'h4)] ?
                      $unsigned((({(8'haa), wire27} ?
                              ((8'had) ? wire28 : wire27) : {wire28, wire26}) ?
                          wire28 : {(wire28 >>> (8'ha6))})) : ((({wire28,
                              wire28} >>> (-(8'hb4))) ?
                          ((wire26 | wire27) ?
                              $unsigned((7'h43)) : $signed(wire26)) : wire27[(4'ha):(4'h8)]) >>> (wire28 * {$signed((8'hb7))})));
  assign wire30 = wire25;
  always
    @(posedge clk) begin
      reg31 <= {wire27, $unsigned($signed($signed((8'ha6))))};
      reg32 <= $signed($unsigned({(+(wire28 ? wire25 : (8'hb4)))}));
    end
  assign wire33 = reg31;
  always
    @(posedge clk) begin
      reg34 <= reg31[(2'h3):(2'h3)];
    end
  assign wire35 = wire28;
  always
    @(posedge clk) begin
      reg36 <= ((^~(((wire26 - reg31) ?
              $signed(wire26) : $signed(wire30)) <<< ($signed(wire26) ?
              wire27[(4'he):(4'h8)] : $unsigned(wire30)))) ?
          (+$signed($unsigned(reg32))) : reg34[(3'h4):(1'h1)]);
      if (reg36[(1'h1):(1'h1)])
        begin
          reg37 <= (wire29[(3'h7):(3'h5)] ?
              reg32[(1'h0):(1'h0)] : $signed($unsigned($signed($signed((8'hac))))));
          reg38 <= $signed($unsigned(wire27[(4'hd):(4'hc)]));
          if (reg36)
            begin
              reg39 <= {(reg36[(3'h7):(3'h4)] ?
                      (wire26[(1'h1):(1'h1)] >>> (-{reg34,
                          (8'hbe)})) : wire26[(2'h3):(1'h1)]),
                  {($signed($unsigned(wire35)) && reg34[(3'h6):(3'h6)])}};
              reg40 <= wire28;
              reg41 <= reg32[(1'h1):(1'h0)];
              reg42 <= $unsigned(reg37);
            end
          else
            begin
              reg39 <= ({$unsigned($signed($signed(reg38))),
                      $unsigned($signed((reg37 <= wire33)))} ?
                  reg34 : wire25[(1'h0):(1'h0)]);
              reg40 <= ((reg36[(2'h2):(1'h1)] ?
                      {(^wire29),
                          (~^(8'hbe))} : ((((8'hbe) ^~ reg36) <<< reg39) < (((8'hbc) + wire35) == (reg38 == wire30)))) ?
                  (^~(reg36[(4'ha):(2'h3)] - wire29[(3'h5):(2'h3)])) : ($unsigned((&{wire33,
                      (8'ha6)})) >> (-(8'ha1))));
              reg41 <= $unsigned($signed({$unsigned((reg32 ?
                      (8'hb6) : reg39))}));
              reg42 <= {(reg39 ?
                      reg39[(3'h4):(3'h4)] : $unsigned(($unsigned(reg38) << ((8'ha3) & wire27)))),
                  $unsigned(reg42)};
            end
          reg43 <= wire29;
          reg44 <= (wire35 ?
              (((~((8'hb9) != wire29)) ?
                      $unsigned($signed((8'h9d))) : (+(reg37 ^~ wire29))) ?
                  reg32 : reg37) : ($unsigned(((wire29 << wire26) ?
                      reg40 : wire27)) ?
                  (|reg41[(4'ha):(4'h9)]) : reg31));
        end
      else
        begin
          reg37 <= (+$signed((-($unsigned(reg36) != (8'ha7)))));
          if (reg34)
            begin
              reg38 <= $unsigned({($unsigned((~|(8'hbf))) << {(wire35 ?
                          reg42 : reg42)}),
                  $unsigned($unsigned(reg31[(3'h7):(3'h4)]))});
              reg39 <= reg40;
            end
          else
            begin
              reg38 <= wire35[(3'h6):(3'h4)];
              reg39 <= ((~^(~^wire33[(5'h12):(4'he)])) && {$unsigned(({wire30} ?
                      (~&(8'hb3)) : wire29)),
                  wire25[(2'h3):(1'h0)]});
              reg40 <= wire33;
              reg41 <= reg40[(3'h4):(1'h1)];
              reg42 <= $unsigned((^~reg34[(1'h1):(1'h0)]));
            end
        end
    end
  assign wire45 = {reg42[(3'h4):(2'h3)],
                      (wire25 < {(wire30[(2'h2):(1'h1)] ?
                              (reg43 + reg44) : (wire30 ? reg44 : (8'h9e))),
                          (8'hbc)})};
  always
    @(posedge clk) begin
      reg46 <= ($unsigned(wire45) ~^ $unsigned((~&$unsigned(wire27[(4'ha):(3'h7)]))));
      reg47 <= ({$signed(($unsigned((8'ha5)) ? reg31 : (reg31 - wire30))),
          $unsigned($unsigned((^(8'hbe))))} && {(wire29 && (reg44 * reg43[(3'h7):(3'h5)]))});
      reg48 <= (8'hb7);
      if ((~|({(8'haf), (~&(wire33 ? reg41 : wire28))} < reg44[(4'hb):(1'h1)])))
        begin
          reg49 <= ($unsigned(wire45) ^ $signed((({reg32} ?
              reg44[(4'he):(3'h6)] : (~|reg32)) << reg46[(3'h5):(2'h2)])));
          reg50 <= reg42[(2'h2):(2'h2)];
        end
      else
        begin
          reg49 <= (&reg31);
          reg50 <= $signed((|(+reg34[(1'h1):(1'h1)])));
          reg51 <= ((|{wire45[(1'h0):(1'h0)], $unsigned($signed((8'ha1)))}) ?
              ((reg34 <= (~^$unsigned(reg36))) ~^ ((reg37 ?
                      $signed(wire29) : reg48) ?
                  (+{wire33,
                      wire27}) : ($signed(reg46) & $signed(wire26)))) : reg41[(4'h9):(3'h6)]);
          reg52 <= ((wire29 | (((reg51 || reg48) + (reg41 ?
              reg49 : reg34)) + $signed((reg42 ^ (8'ha6))))) & reg49);
        end
      if ((reg50[(1'h1):(1'h1)] >= ((~$signed($unsigned(reg47))) == $signed($unsigned((wire26 >>> reg31))))))
        begin
          reg53 <= ((((~^wire30[(2'h2):(1'h1)]) ?
              $signed((-wire35)) : ((wire27 <<< wire25) & (reg31 ?
                  reg43 : wire33))) >> (~reg47)) <<< ({(+{(8'hb0), reg41}),
              $unsigned(reg47[(2'h3):(1'h0)])} < $unsigned(((|reg34) != (^~wire29)))));
          reg54 <= $unsigned(wire30);
        end
      else
        begin
          reg53 <= (wire26[(3'h5):(2'h3)] ?
              $unsigned((^$unsigned((reg51 ?
                  wire33 : wire26)))) : wire27[(4'h9):(2'h2)]);
          reg54 <= (((((^~reg39) << (reg49 == wire30)) - ($signed(wire35) ?
                  (~&wire33) : (~|(8'had)))) ?
              (-wire45) : (8'had)) << ((&$signed(wire30[(4'h8):(2'h2)])) >= $unsigned(((&reg42) ?
              (wire30 && reg53) : (-reg42)))));
          if ((reg34 ? reg31 : reg44))
            begin
              reg55 <= $unsigned(((reg43 ?
                  wire29[(3'h7):(2'h3)] : reg53[(4'hb):(3'h7)]) >= reg40));
              reg56 <= ((reg49 ?
                  ({{reg46, reg40}, reg36[(2'h2):(1'h0)]} ?
                      (~^(!reg49)) : (wire33[(5'h11):(4'hd)] ?
                          $unsigned(wire27) : (-(8'had)))) : {(-reg52)}) <= reg46);
              reg57 <= (|wire28[(2'h2):(1'h1)]);
              reg58 <= $signed(wire25);
              reg59 <= {(+(-(reg38[(3'h5):(3'h5)] <<< wire26[(2'h2):(2'h2)]))),
                  reg42};
            end
          else
            begin
              reg55 <= reg55[(1'h1):(1'h0)];
              reg56 <= $signed(wire28);
              reg57 <= (!$signed(reg42));
              reg58 <= wire27;
            end
        end
    end
  assign wire60 = (~reg50);
endmodule
