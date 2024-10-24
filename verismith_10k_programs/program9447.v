module top
#(parameter param70 = ((~^(((-(8'hb0)) ? ((7'h44) ? (8'hab) : (8'hba)) : (|(8'ha5))) ? ((~&(8'hb9)) ? ((8'h9c) ? (8'hb6) : (8'hac)) : ((8'hb0) ? (8'hb4) : (8'hb0))) : ((!(8'hb0)) ? {(8'h9f), (8'ha6)} : ((8'hbe) ? (8'ha2) : (8'ha1))))) ? (((8'hb8) ^~ (~((8'hbd) + (8'hb6)))) | ((((8'hb4) <= (8'ha6)) ? ((8'ha8) ~^ (8'hb6)) : ((8'hab) <<< (8'ha3))) & (!{(7'h41)}))) : ((({(8'hb0)} & (+(8'hb5))) ? ({(8'hb2), (8'hbd)} ? ((8'had) ? (8'had) : (8'hab)) : (~(8'ha6))) : ((-(8'had)) ? (&(8'hb9)) : ((8'hbd) ? (8'ha7) : (8'hbb)))) ? {{((8'h9f) + (8'h9c))}} : ({((8'hb5) || (8'hbb)), ((8'hb3) ? (7'h44) : (8'hbd))} | (((8'haf) ? (8'haa) : (8'ha1)) < ((8'hbb) <<< (8'hb1)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire64;
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  assign y = {wire67, wire66, wire4, wire64, reg69, reg68, (1'h0)};
  assign wire4 = {$unsigned($signed((+wire1[(4'hc):(3'h7)]))),
                     $signed((!((wire1 ? wire3 : (8'hb5)) + $signed(wire3))))};
  module5 #() modinst65 (wire64, clk, wire1, wire4, wire0, wire2, wire3);
  assign wire66 = wire3;
  assign wire67 = wire64[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg68 <= wire66;
      reg69 <= ((~wire1[(1'h0):(1'h0)]) ?
          (wire66 * $signed((wire2[(5'h11):(4'h9)] ?
              (^~wire67) : (7'h40)))) : wire0);
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  assign y = {wire62, wire13, wire12, wire11, (1'h0)};
  assign wire11 = {$unsigned(wire6[(2'h2):(1'h1)])};
  assign wire12 = wire6;
  assign wire13 = $signed((wire7 <<< $signed(wire10[(2'h3):(1'h0)])));
  module14 #() modinst63 (wire62, clk, wire7, wire12, wire13, wire6);
endmodule

module module14
#(parameter param61 = ((8'h9d) ? (((8'hba) << (&((7'h43) ? (8'haa) : (8'hab)))) ? {(~&{(7'h40), (8'hae)}), (((8'ha4) >= (8'haf)) ? {(8'hb9)} : {(8'hbc), (8'hb4)})} : ((~^((8'hba) && (8'ha0))) <<< (((7'h43) ? (8'hab) : (8'hab)) ? (~|(8'hba)) : ((8'ha7) ? (7'h41) : (8'hbb))))) : (({((8'hbc) ? (8'h9c) : (8'h9c))} ? {(~|(8'ha0))} : (~|((8'hb9) ? (8'ha8) : (8'ha3)))) * (|(((8'h9d) ? (7'h41) : (7'h40)) + (~&(8'hb9)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire54,
                 wire37,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg55,
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
                 reg38,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire19 = ((wire17 <= (((wire16 ?
                          wire16 : wire15) | $unsigned((8'hb7))) ?
                      ((wire17 >>> wire16) << wire15[(2'h3):(2'h2)]) : wire18[(1'h0):(1'h0)])) <<< (wire18[(4'h8):(2'h3)] ?
                      (~^$signed($unsigned(wire16))) : wire15));
  assign wire20 = (wire17[(3'h6):(1'h0)] ?
                      $unsigned(((-(~&(8'hbc))) ?
                          $unsigned(wire17) : $signed($signed(wire17)))) : wire15);
  assign wire21 = ((+{(~(wire18 << (8'hbe))),
                          ((wire16 ? wire16 : (8'ha0)) ?
                              (~^wire18) : (wire18 << wire15))}) ?
                      (wire17 ?
                          ((~^wire16) ?
                              $signed((wire20 ?
                                  wire19 : wire19)) : (|$unsigned(wire16))) : (8'hb8)) : (8'hae));
  assign wire22 = (~^(^$unsigned((wire20 ?
                      $unsigned((8'hb9)) : wire19[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg23 <= wire15;
      reg24 <= (($signed($unsigned($unsigned(wire22))) ?
              reg23[(1'h1):(1'h1)] : $signed((8'hba))) ?
          wire18 : wire21);
      reg25 <= (8'h9d);
    end
  assign wire26 = wire18[(3'h6):(2'h3)];
  assign wire27 = $signed(reg23[(3'h5):(1'h1)]);
  assign wire28 = (wire16 ?
                      (wire22[(1'h1):(1'h1)] ?
                          (8'ha6) : (8'hba)) : ($unsigned($signed({reg25})) ?
                          reg24[(3'h6):(3'h4)] : ($signed($unsigned((8'ha7))) >> ({wire18} < ((8'had) ?
                              wire17 : wire18)))));
  assign wire29 = (^wire20[(2'h2):(2'h2)]);
  assign wire30 = (~$signed({reg25, $unsigned(wire18)}));
  assign wire31 = (^~(wire21 ?
                      (-wire20[(1'h0):(1'h0)]) : {wire21[(1'h1):(1'h1)],
                          $signed($unsigned(wire28))}));
  assign wire32 = $signed((($signed((~reg23)) ?
                      $signed({reg23}) : wire18[(3'h6):(1'h1)]) <<< ($signed(wire16) | {wire16[(1'h0):(1'h0)],
                      $unsigned(wire31)})));
  always
    @(posedge clk) begin
      reg33 <= wire20[(1'h0):(1'h0)];
      reg34 <= ((~^{((~reg33) ? ((8'had) ? wire22 : wire32) : reg25),
              (~$unsigned(wire31))}) ?
          (wire16 ?
              ($signed(wire21) != {$unsigned(wire27)}) : wire22) : wire22);
      reg35 <= (8'hb9);
      reg36 <= wire27[(2'h2):(1'h0)];
    end
  assign wire37 = wire18;
  always
    @(posedge clk) begin
      reg38 <= wire21;
      reg39 <= ($unsigned(((wire30 & (-wire18)) ?
          wire22[(4'ha):(4'ha)] : (^~(~|reg23)))) && ($signed(($signed(reg38) <<< wire32)) ~^ $signed(($unsigned(wire26) ?
          wire32 : {(8'hb7)}))));
      reg40 <= reg34[(2'h3):(2'h2)];
      reg41 <= (((wire19 + {(reg23 >> reg33),
          wire21}) & $unsigned(reg36)) ^ $unsigned(wire26[(5'h10):(4'hd)]));
      if ($signed((((wire21 ? (~|(8'hbf)) : (wire17 + wire15)) ?
              ((-wire27) ?
                  $signed(wire20) : {wire18, wire28}) : $unsigned((reg33 ?
                  wire16 : reg24))) ?
          ((-$unsigned(reg34)) && ({wire19} <= reg33)) : (($unsigned(wire15) ?
              reg40[(2'h3):(2'h2)] : $unsigned(wire17)) ^ wire17))))
        begin
          reg42 <= (reg39 != (7'h42));
          reg43 <= ({(((wire21 == (8'hb4)) && wire15) + reg35[(1'h0):(1'h0)])} * reg42[(4'he):(4'he)]);
          if ((~|wire19[(2'h2):(2'h2)]))
            begin
              reg44 <= ($unsigned(reg41[(2'h3):(2'h2)]) ?
                  $signed(($unsigned($unsigned(wire37)) != $unsigned((8'ha0)))) : $unsigned((!reg39[(4'he):(3'h4)])));
              reg45 <= $signed((wire20 & (~(reg43[(1'h0):(1'h0)] != (reg36 & wire29)))));
              reg46 <= (8'ha4);
            end
          else
            begin
              reg44 <= (-(~|$signed({(wire15 == reg43), {wire17, reg36}})));
              reg45 <= wire17;
              reg46 <= $unsigned(((wire32 ^~ $signed($signed(reg34))) * ($signed((wire28 ?
                      wire19 : reg34)) ?
                  reg45[(2'h2):(1'h0)] : ({wire21} ?
                      (+wire21) : $signed(wire21)))));
            end
          reg47 <= $signed((~{$signed((~reg43)), reg44[(1'h1):(1'h1)]}));
        end
      else
        begin
          if ((($unsigned(wire26[(4'hc):(4'ha)]) + (~&$signed((wire15 && wire20)))) ?
              ((wire20[(1'h1):(1'h0)] ?
                  reg35 : reg43[(1'h0):(1'h0)]) & $unsigned((~|reg47[(4'h9):(3'h4)]))) : $signed(reg34)))
            begin
              reg42 <= $signed(($unsigned($signed((wire17 > wire30))) ?
                  (~$unsigned($unsigned(wire31))) : reg25[(4'h9):(2'h3)]));
              reg43 <= $unsigned((wire20 >> (reg33[(1'h1):(1'h1)] ?
                  (reg41 + (wire16 <= wire32)) : ($signed(reg46) ?
                      (reg34 ? wire27 : wire21) : (~&wire29)))));
              reg44 <= $signed((~|wire22));
              reg45 <= $unsigned((~|$signed(({reg42} ?
                  wire18[(3'h7):(3'h5)] : wire17[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg42 <= ({$unsigned(({wire20, wire16} ?
                      $signed((8'hb1)) : $unsigned(wire26)))} == ($signed(reg23[(1'h1):(1'h0)]) ^ $signed($signed(((8'ha0) < reg33)))));
              reg43 <= wire28[(2'h3):(2'h3)];
              reg44 <= wire27;
            end
          reg46 <= $unsigned(((~^$signed(wire18)) ?
              reg34[(3'h6):(2'h2)] : reg41));
          reg47 <= (({(~wire16[(3'h5):(2'h3)]),
              (&$unsigned(reg46))} << reg45) || {wire28[(4'h8):(3'h7)],
              $signed($signed($signed(wire15)))});
          if ((-{(&($signed((8'hb3)) ? (8'ha4) : reg35[(5'h10):(3'h7)])),
              (8'h9f)}))
            begin
              reg48 <= (+(~{(reg47 ? (7'h41) : (wire37 - (8'ha3))),
                  wire29[(4'hf):(2'h3)]}));
              reg49 <= wire30;
            end
          else
            begin
              reg48 <= ($signed((reg36 * {{wire30}})) < reg46);
              reg49 <= (+(($signed(wire32) << wire26[(3'h6):(1'h1)]) ?
                  (reg34[(2'h2):(1'h0)] != {(^~reg41)}) : reg25));
              reg50 <= (~|reg44);
              reg51 <= (($signed((!$signed(reg43))) < reg23[(1'h1):(1'h0)]) ?
                  (|reg36[(2'h3):(1'h1)]) : ({(~wire28)} ?
                      (wire32[(4'h9):(3'h7)] ?
                          {$unsigned((7'h43)),
                              $unsigned(wire18)} : $unsigned(((8'hb0) * reg50))) : reg23[(4'ha):(4'h9)]));
              reg52 <= $unsigned($unsigned($unsigned(wire22[(4'hb):(4'ha)])));
            end
          reg53 <= wire37[(1'h0):(1'h0)];
        end
    end
  assign wire54 = ($unsigned($unsigned((|$unsigned(reg25)))) ?
                      reg48 : $signed(reg25[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      reg55 <= {(reg33 >= {reg38[(4'ha):(3'h6)], (^~((8'hbe) + wire30))}),
          (~^$signed((8'hab)))};
    end
  assign wire56 = (reg23[(1'h0):(1'h0)] - (-(($signed(reg39) ~^ {reg42}) ?
                      reg38 : reg36)));
  assign wire57 = reg35[(4'h9):(2'h2)];
  assign wire58 = $signed($signed(reg41));
  assign wire59 = wire27;
  assign wire60 = (((-{reg48[(2'h3):(1'h0)]}) ?
                      reg47 : reg35[(5'h14):(2'h2)]) == (($signed(reg40[(1'h0):(1'h0)]) == (&$signed(wire54))) >> {((wire29 * wire54) ?
                          wire22[(4'hd):(4'hd)] : (|reg45)),
                      (reg36 - ((8'hbc) ? reg53 : wire19))}));
endmodule
