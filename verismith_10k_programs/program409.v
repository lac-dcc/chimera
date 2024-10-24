module top
#(parameter param91 = (!(~^{({(8'hbb), (8'hb2)} ? (8'ha7) : ((8'hbb) ? (7'h40) : (8'ha2)))})), 
parameter param92 = ((~^(8'hb0)) && param91))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire81;
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 (1'h0)};
  module4 #() modinst82 (.wire5(wire0), .clk(clk), .y(wire81), .wire8(wire1), .wire7(wire2), .wire6(wire3));
  assign wire83 = {wire2};
  assign wire84 = wire2[(3'h5):(2'h3)];
  assign wire85 = $signed((+($unsigned(wire84[(4'ha):(4'ha)]) + wire83[(4'h8):(2'h3)])));
  assign wire86 = (wire84[(4'ha):(3'h4)] >= wire0);
  assign wire87 = wire1[(4'hc):(1'h0)];
  assign wire88 = ({wire85[(4'hd):(4'hc)],
                      $signed(wire0[(1'h1):(1'h0)])} - (wire83 - (wire2[(4'ha):(4'h8)] >> ((wire2 ?
                          wire81 : wire2) ?
                      (~&(8'hb3)) : (wire83 ? wire1 : (8'h9f))))));
  assign wire89 = (8'hb1);
  assign wire90 = (!$unsigned((^~(8'hab))));
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  assign y = {wire79,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = ((-(^~($unsigned((8'ha0)) ?
                     wire8 : (wire7 << wire6)))) >> $signed(($unsigned($signed(wire8)) ?
                     (wire8 ? (8'haf) : wire7[(2'h2):(1'h1)]) : wire6)));
  assign wire10 = wire9;
  assign wire11 = (&(wire5[(1'h0):(1'h0)] ?
                      wire6 : ((&$signed(wire5)) - ($unsigned(wire5) > wire9))));
  assign wire12 = ({(($unsigned(wire6) >= wire5) ^~ (wire7[(3'h4):(3'h4)] >= wire11))} ?
                      $signed((8'ha4)) : wire9[(3'h6):(1'h0)]);
  assign wire13 = wire9[(4'hb):(3'h5)];
  assign wire14 = wire11;
  assign wire15 = $unsigned($unsigned((wire7 ?
                      wire11[(2'h2):(1'h1)] : $signed(((8'ha6) && wire13)))));
  module16 #() modinst80 (wire79, clk, wire14, wire15, wire5, wire13);
endmodule

module module16
#(parameter param77 = ((|((((8'hb6) + (8'ha2)) ? (~&(8'had)) : (~|(8'hb5))) < (^(~(8'hb9))))) >> (~&{(8'ha1)})), 
parameter param78 = (!param77))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h260):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire [(2'h2):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire64,
                 wire22,
                 wire21,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = (wire20[(3'h6):(1'h0)] ?
                      (wire19[(3'h7):(1'h0)] ? wire19 : wire20) : wire20);
  assign wire22 = (wire17 && (wire20[(3'h4):(3'h4)] ?
                      (wire20[(3'h5):(3'h4)] ^ ($signed(wire20) ?
                          (|(8'ha3)) : ((8'hbb) ?
                              wire21 : wire17))) : (($unsigned(wire17) ?
                          $unsigned(wire18) : $unsigned(wire17)) ^ (wire17[(2'h2):(2'h2)] ^~ wire19))));
  always
    @(posedge clk) begin
      reg23 <= (~(wire22[(3'h5):(1'h1)] ^ wire18));
      reg24 <= wire22[(3'h6):(1'h0)];
      if ((wire18[(2'h2):(1'h1)] << ($signed(wire19) ~^ wire22)))
        begin
          if (((&reg23[(3'h5):(3'h5)]) ?
              wire20 : $unsigned(($unsigned((wire18 ? wire17 : wire19)) ?
                  wire19 : (^{wire22, (8'had)})))))
            begin
              reg25 <= (-(wire17[(1'h1):(1'h0)] ^~ wire19));
              reg26 <= (wire17[(2'h2):(2'h2)] <<< $signed($signed((wire20 ?
                  $signed((8'h9f)) : $signed((8'hbf))))));
              reg27 <= $unsigned(($signed($signed(wire17[(1'h0):(1'h0)])) ?
                  $signed($signed(wire20[(1'h1):(1'h0)])) : ({$signed(reg26)} == wire17)));
              reg28 <= (^~wire21);
            end
          else
            begin
              reg25 <= {{($signed(reg24) ~^ {$signed(reg25),
                          (reg23 || wire20)})},
                  (^~$unsigned({(reg27 ? wire18 : reg23), (8'ha9)}))};
            end
          reg29 <= (8'hb9);
          reg30 <= (wire19 > wire22);
          reg31 <= $unsigned($unsigned(({((8'haa) ?
                  (8'hb8) : wire20)} < {(reg25 ? wire21 : reg27),
              $unsigned(reg25)})));
        end
      else
        begin
          if ({((($signed(wire19) ? reg31 : $signed(reg28)) & (|{reg27,
                      wire19})) ?
                  wire19[(4'he):(4'ha)] : $signed($unsigned({reg30, reg28})))})
            begin
              reg25 <= wire17[(1'h0):(1'h0)];
              reg26 <= (~|$signed((((&reg31) || $signed(reg29)) ~^ ((!(8'haa)) * reg27))));
            end
          else
            begin
              reg25 <= ($signed((+{reg26[(2'h3):(2'h2)]})) ~^ $unsigned(((~|((7'h42) ?
                  wire22 : reg23)) & {(reg27 < reg26)})));
              reg26 <= ($unsigned({$unsigned(reg24),
                  reg31[(1'h0):(1'h0)]}) << ($signed((reg30 ?
                  ((8'hbe) >>> (7'h41)) : wire19[(3'h7):(2'h2)])) ^~ reg25[(1'h0):(1'h0)]));
              reg27 <= reg31;
            end
          if (((reg29 && (8'ha8)) - ({wire17[(1'h0):(1'h0)]} == reg27)))
            begin
              reg28 <= (-(reg31[(4'h9):(2'h2)] | {wire17,
                  ($signed(reg31) >= wire19[(1'h0):(1'h0)])}));
              reg29 <= ((!{wire18,
                  reg29[(4'h8):(2'h2)]}) <= $signed(($signed($signed(wire22)) - $unsigned((+reg31)))));
            end
          else
            begin
              reg28 <= (wire18 ?
                  {reg27[(1'h0):(1'h0)]} : ($signed($signed((^(8'hba)))) ?
                      $signed(reg29[(1'h1):(1'h1)]) : (reg24 >>> reg26)));
              reg29 <= wire20;
              reg30 <= $unsigned($signed($unsigned(reg31[(1'h0):(1'h0)])));
            end
        end
      reg32 <= (-reg27);
      reg33 <= ($unsigned(reg31) ? wire19 : reg25[(1'h1):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if (($signed($unsigned(($signed(reg31) << (wire22 ^ reg33)))) >= ($signed($unsigned($unsigned(wire21))) ?
          $signed(($unsigned(reg28) << reg23[(1'h0):(1'h0)])) : reg33[(3'h7):(3'h5)])))
        begin
          reg34 <= ((^reg30) ?
              wire19 : {({reg29, $signed((8'ha4))} ?
                      {wire19[(3'h6):(2'h2)]} : (8'hbd))});
          if ((~^{(((wire20 ?
                  wire18 : reg29) & wire19[(5'h10):(3'h6)]) ~^ $unsigned($unsigned((8'hb9)))),
              (wire22[(1'h0):(1'h0)] ?
                  (&$unsigned(wire18)) : $unsigned(wire21))}))
            begin
              reg35 <= wire20;
              reg36 <= $signed(($signed(reg23[(2'h3):(1'h0)]) >>> reg28[(5'h11):(5'h11)]));
            end
          else
            begin
              reg35 <= reg27[(3'h4):(1'h0)];
              reg36 <= $signed($unsigned($unsigned($signed({reg32}))));
              reg37 <= $signed($signed(reg23));
            end
        end
      else
        begin
          reg34 <= (reg28[(4'he):(4'he)] < $unsigned((((reg23 | reg31) >>> {reg35}) ?
              $signed((wire21 ? wire20 : reg32)) : (reg31[(4'he):(4'hc)] ?
                  $unsigned(wire17) : reg34[(3'h6):(3'h6)]))));
          reg35 <= reg30[(3'h6):(3'h4)];
          reg36 <= reg30[(1'h0):(1'h0)];
          reg37 <= ((($unsigned(wire19) ?
                  $unsigned(reg31) : (8'hb0)) == $unsigned({(reg36 ?
                      (8'h9e) : reg24)})) ?
              ($unsigned(((^reg30) || $unsigned(reg33))) ^~ (+$unsigned(wire19[(5'h11):(1'h1)]))) : $signed($signed(((reg34 || reg34) ?
                  reg25[(2'h2):(2'h2)] : wire21))));
          reg38 <= $unsigned(($signed((!reg30[(3'h4):(2'h3)])) ^ $unsigned(reg34[(1'h0):(1'h0)])));
        end
      if (($unsigned(reg23) ?
          reg36 : $unsigned(({reg29[(1'h0):(1'h0)]} - $signed({(8'hb4),
              (8'hbd)})))))
        begin
          if ($unsigned(((|((!(8'ha4)) ? $unsigned(reg32) : $unsigned(reg34))) ?
              ($signed($signed(reg25)) ?
                  $signed((8'h9e)) : ($unsigned(wire19) ?
                      reg28[(3'h6):(1'h0)] : $signed((8'haf)))) : reg23)))
            begin
              reg39 <= $unsigned($signed($unsigned((reg28[(2'h3):(2'h3)] || wire19[(1'h0):(1'h0)]))));
              reg40 <= $signed(reg29);
              reg41 <= wire18;
            end
          else
            begin
              reg39 <= {$unsigned(($signed(reg40) ?
                      (((8'haf) ? (8'hb4) : wire20) ?
                          wire21[(1'h0):(1'h0)] : (reg35 ?
                              reg23 : reg38)) : reg41)),
                  wire22[(2'h2):(2'h2)]};
            end
          reg42 <= reg28;
          reg43 <= (!$signed((reg33[(2'h2):(1'h0)] ^~ (8'hb5))));
          reg44 <= $unsigned($unsigned((^wire19)));
          reg45 <= wire22;
        end
      else
        begin
          if ((reg44[(2'h2):(2'h2)] << ((^~(~(reg37 | reg42))) >>> ($signed(reg32) ?
              $unsigned((wire22 == wire21)) : {(reg30 ? (8'hab) : reg33)}))))
            begin
              reg39 <= (reg23 > ($unsigned($signed((!reg41))) ?
                  $unsigned(((7'h41) + (reg43 ?
                      (8'hbe) : reg27))) : reg33[(3'h7):(2'h2)]));
            end
          else
            begin
              reg39 <= $unsigned($unsigned((reg42 ? reg28 : reg37)));
              reg40 <= $signed(reg33);
              reg41 <= (^~reg26[(1'h0):(1'h0)]);
              reg42 <= $unsigned({($signed(reg40[(2'h3):(2'h2)]) ?
                      (((8'hab) ? (7'h44) : wire19) ?
                          (wire22 ?
                              wire20 : reg35) : (+wire21)) : reg26[(4'h9):(2'h3)]),
                  (((wire21 ? wire20 : reg42) < (8'hb5)) <= {reg36})});
            end
          reg43 <= ((~&$signed(($unsigned(reg33) * $signed(reg32)))) ?
              $unsigned((8'ha3)) : reg24[(4'h8):(1'h0)]);
          reg44 <= ((!reg26[(2'h3):(1'h0)]) ?
              (reg39[(4'h8):(2'h3)] ^ (wire19[(4'ha):(3'h5)] ?
                  reg30 : $unsigned((reg42 ?
                      (7'h41) : reg33)))) : reg25[(1'h0):(1'h0)]);
          reg45 <= wire21;
        end
    end
  always
    @(posedge clk) begin
      if ({reg33})
        begin
          if ((+(8'ha8)))
            begin
              reg46 <= ((^((wire18[(1'h0):(1'h0)] ?
                      $unsigned(reg38) : {(8'h9c), reg36}) ?
                  $signed((reg37 + reg42)) : (reg26 >>> reg27))) ^ {(-(~|reg44)),
                  reg30});
              reg47 <= reg23;
              reg48 <= reg36;
              reg49 <= wire20[(1'h0):(1'h0)];
              reg50 <= reg40[(1'h0):(1'h0)];
            end
          else
            begin
              reg46 <= reg30[(2'h2):(1'h0)];
              reg47 <= {reg42,
                  $unsigned((((reg45 ? (8'hb7) : reg43) && {reg34}) ?
                      (-reg23) : wire17[(2'h2):(2'h2)]))};
              reg48 <= ($signed($signed(reg28[(4'hf):(4'hd)])) | wire22);
              reg49 <= ($unsigned(($signed({reg37}) | $signed(reg49))) ?
                  (({reg37[(1'h0):(1'h0)],
                          wire17[(2'h2):(1'h0)]} >>> ($unsigned(reg27) ?
                          (~^reg32) : $signed(reg31))) ?
                      $unsigned($unsigned($unsigned(reg23))) : (wire21 ?
                          $unsigned($signed(reg34)) : (~|wire17))) : $signed(($unsigned(reg24) <= (reg29[(3'h6):(3'h6)] | (|(8'hac))))));
              reg50 <= $signed((reg41[(2'h2):(1'h0)] ?
                  $unsigned(($unsigned(reg30) | reg50[(1'h1):(1'h0)])) : $signed(((reg35 << reg32) >= reg23))));
            end
        end
      else
        begin
          reg46 <= (^$signed({$signed($unsigned(reg31)),
              $signed($signed(reg30))}));
          if (reg29)
            begin
              reg47 <= (reg37 <<< ($unsigned(($unsigned(wire19) ?
                  (&reg38) : ((8'ha1) ^~ wire19))) ^ (&wire19[(4'ha):(4'ha)])));
              reg48 <= (($signed($signed((+reg25))) ^~ reg36) + reg45);
              reg49 <= (reg24 ?
                  ($unsigned((~&reg36)) < ($unsigned((reg50 & reg24)) ?
                      wire18[(1'h1):(1'h1)] : reg47[(4'ha):(3'h6)])) : (wire18[(1'h1):(1'h0)] - (reg42[(3'h5):(1'h0)] >> wire19)));
              reg50 <= $signed({$signed((^{reg49})),
                  (reg40[(3'h4):(1'h1)] ?
                      reg30 : $signed($unsigned((8'hb4))))});
              reg51 <= wire19;
            end
          else
            begin
              reg47 <= {((^~$unsigned((+reg44))) ?
                      {($unsigned(wire20) << (reg51 ^~ (8'h9f)))} : reg43[(5'h10):(4'he)]),
                  (-{{{reg37, (8'hb2)}}, reg43})};
              reg48 <= $unsigned((&reg43[(3'h5):(2'h2)]));
              reg49 <= $signed((7'h43));
              reg50 <= $signed((((reg44[(3'h7):(2'h3)] == (|reg44)) | ({reg45} ?
                      reg30[(3'h5):(2'h2)] : reg41)) ?
                  reg24[(4'h9):(3'h7)] : $unsigned($signed(reg49))));
              reg51 <= $unsigned(reg41[(2'h3):(1'h0)]);
            end
          reg52 <= {$unsigned(({reg43, reg51} && ($signed(reg33) ?
                  $unsigned((8'hba)) : (reg47 <= reg50)))),
              ((^~$signed((8'hbb))) ?
                  {$unsigned($signed((8'hae)))} : $unsigned(reg48))};
        end
      reg53 <= reg31;
      reg54 <= $signed($unsigned((($signed((7'h44)) ?
              (reg42 ? reg28 : (8'hb5)) : (reg25 >>> reg44)) ?
          ((wire20 ? reg37 : reg26) | reg46) : $unsigned((|reg40)))));
      reg55 <= ($unsigned((({reg38, wire18} > reg51) ?
              ((reg36 ? (8'hb3) : reg26) ?
                  reg51 : ((8'ha8) ?
                      reg49 : wire20)) : reg43[(5'h13):(3'h6)])) ?
          (reg50[(1'h0):(1'h0)] & reg47[(4'h8):(2'h3)]) : ($unsigned((^(wire21 <= wire19))) > reg27));
      if (reg28)
        begin
          reg56 <= (-$unsigned(reg23));
          if (reg37)
            begin
              reg57 <= (~|(reg38 ?
                  (|(-$unsigned((8'ha8)))) : wire17[(2'h2):(1'h0)]));
              reg58 <= reg45[(2'h2):(1'h1)];
              reg59 <= $unsigned($signed(($unsigned((reg36 || wire18)) ?
                  ((reg36 ? (8'hb7) : reg57) ?
                      (reg37 && reg26) : (+reg37)) : reg34)));
              reg60 <= wire18;
            end
          else
            begin
              reg57 <= ({$unsigned($signed((reg42 ? reg48 : reg27))),
                  reg30} | {((reg46 << ((8'hbf) ? reg60 : wire22)) ?
                      (-$signed(reg57)) : {((8'hb2) | reg48)}),
                  $signed((^~$signed((8'ha1))))});
              reg58 <= (reg50[(3'h4):(2'h2)] == (reg51 ?
                  ((^~(reg60 == reg60)) ?
                      {(reg24 * reg56), ((7'h44) ? reg42 : (8'hbf))} : (reg43 ?
                          {wire22} : reg58[(3'h6):(1'h0)])) : (({reg50, reg48} ?
                      $unsigned((8'ha6)) : $signed(reg34)) < $unsigned((reg58 ?
                      reg36 : reg49)))));
              reg59 <= {reg58,
                  ((($unsigned((8'hb8)) ?
                          wire19 : ((7'h41) ~^ reg44)) | reg36) ?
                      (reg34 > $unsigned($unsigned(reg45))) : $unsigned(($unsigned(reg44) & (reg57 + reg42))))};
            end
          reg61 <= (~&(reg33[(3'h6):(2'h3)] ^~ $signed(((~|reg48) ?
              reg50[(3'h4):(3'h4)] : {(8'ha3), reg41}))));
          reg62 <= $signed({$unsigned(reg37[(3'h5):(3'h4)]),
              {$signed((reg47 ^~ reg46)), (reg33 >= (wire17 != reg54))}});
          reg63 <= (reg35 ~^ ($signed(reg49) ?
              ((+reg30) ?
                  $unsigned(((8'had) ?
                      (8'ha1) : reg27)) : $signed((8'hbd))) : $unsigned(reg35)));
        end
      else
        begin
          reg56 <= ({$unsigned(reg53)} && (|$signed({$signed(reg51)})));
        end
    end
  assign wire64 = $signed($unsigned((reg58 ?
                      $unsigned((^~reg49)) : $signed($signed(reg24)))));
  always
    @(posedge clk) begin
      if ($unsigned(reg61))
        begin
          reg65 <= ($unsigned(reg59) ?
              ((^reg63) ?
                  {({reg40} ? (-(8'ha6)) : reg25[(2'h2):(1'h1)])} : ((((8'ha6) ?
                              reg43 : reg27) ?
                          $unsigned(reg37) : (^reg24)) ?
                      (reg26[(5'h12):(2'h2)] ?
                          $unsigned(reg33) : (reg51 || (8'hab))) : reg34[(2'h2):(2'h2)])) : wire21[(5'h11):(4'h8)]);
          reg66 <= $unsigned(((({reg49} ^ reg39[(4'hb):(3'h4)]) ?
                  (wire18 ?
                      $unsigned(reg38) : reg48[(1'h0):(1'h0)]) : $signed($unsigned(reg25))) ?
              reg48[(1'h0):(1'h0)] : $unsigned({$unsigned(reg53)})));
        end
      else
        begin
          reg65 <= reg63[(4'h8):(3'h7)];
        end
      reg67 <= $signed(((reg36[(2'h3):(1'h0)] > (reg59[(1'h1):(1'h0)] ^~ (reg39 - reg55))) ?
          (reg37 ?
              wire22 : (((8'h9f) - reg57) ^ (reg49 >= reg39))) : reg48[(2'h2):(2'h2)]));
      reg68 <= ((~&($signed(reg44[(4'h9):(3'h4)]) ?
              $signed((!reg33)) : $signed($signed(reg51)))) ?
          $unsigned($signed(($unsigned((8'ha6)) | (reg67 ?
              wire19 : reg48)))) : reg23[(3'h6):(3'h4)]);
    end
  assign wire69 = $unsigned(reg56);
  assign wire70 = $signed({((^{reg26}) <= {wire18[(1'h0):(1'h0)]}),
                      reg56[(1'h0):(1'h0)]});
  assign wire71 = (8'haa);
  assign wire72 = $signed((&((~|$unsigned(reg45)) ?
                      wire64[(4'hc):(4'hc)] : (8'hb5))));
  assign wire73 = (reg35[(4'hc):(4'h8)] > reg65[(2'h3):(1'h1)]);
  assign wire74 = wire20;
  assign wire75 = ($signed(((^~$signed(wire72)) ?
                          (((7'h42) > reg39) | (reg41 ?
                              reg55 : reg35)) : reg36[(2'h2):(1'h1)])) ?
                      ({$unsigned((reg53 ?
                              reg52 : reg23))} << (8'h9e)) : $signed(reg46));
  assign wire76 = (^~(^$unsigned(($unsigned(reg68) && {wire19}))));
endmodule
