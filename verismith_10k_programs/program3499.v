module top
#(parameter param89 = ((8'hb8) ? (((~^(+(7'h43))) == (((8'hb5) ? (8'haa) : (8'haa)) >> {(8'haf)})) ? (8'ha0) : (^~(((8'hb2) ^~ (8'had)) ? ((8'ha2) >> (8'hb0)) : ((8'hb6) ? (7'h40) : (8'hb9))))) : ({(((8'had) >>> (8'hbd)) ? ((8'hb7) + (8'haa)) : (|(8'ha3)))} | ((+(!(8'ha5))) <<< ((+(8'hb7)) ? ((8'ha5) ? (8'hae) : (8'hb0)) : ((7'h40) ? (8'hb7) : (8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire85;
  assign y = {wire88, wire87, wire70, wire4, wire72, wire73, wire85, (1'h0)};
  assign wire4 = wire3[(3'h5):(2'h3)];
  module5 #() modinst71 (wire70, clk, wire4, wire1, wire0, wire3, wire2);
  assign wire72 = wire0;
  assign wire73 = wire1;
  module74 #() modinst86 (wire85, clk, wire1, wire72, wire4, wire0, wire3);
  assign wire87 = wire3[(4'h8):(1'h1)];
  assign wire88 = $unsigned(wire0[(5'h10):(4'h8)]);
endmodule

module module74  (y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire79;
  input wire signed [(5'h13):(1'h0)] wire78;
  input wire [(5'h14):(1'h0)] wire77;
  input wire signed [(4'he):(1'h0)] wire76;
  input wire [(5'h11):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  assign y = {wire84, wire83, wire82, wire81, wire80, (1'h0)};
  assign wire80 = (!$signed($unsigned($signed((^wire77)))));
  assign wire81 = wire78[(4'he):(2'h3)];
  assign wire82 = $unsigned((!{$unsigned(wire77[(2'h2):(2'h2)])}));
  assign wire83 = $unsigned(wire77[(3'h5):(1'h0)]);
  assign wire84 = $unsigned($unsigned((-$unsigned((wire77 < wire82)))));
endmodule

module module5
#(parameter param69 = (~|(((((8'h9f) <<< (8'hbb)) == (8'hb4)) << {((8'ha0) || (8'hb4)), (&(8'hbc))}) ? (~&(7'h42)) : ((~^((8'h9e) <= (7'h41))) >= (((8'haf) ? (8'h9c) : (8'ha8)) != ((8'h9e) * (8'haa)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire67;
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire16,
                 wire19,
                 wire67,
                 reg18,
                 reg17,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire6;
      reg12 <= $unsigned(((($signed(wire8) ^ $signed(wire6)) ?
              wire7[(3'h4):(2'h2)] : ($signed(wire6) ?
                  wire7[(2'h3):(1'h1)] : ((8'hb8) || reg11))) ?
          ($signed($signed((7'h40))) & $signed(wire6)) : ((|(|wire10)) ?
              wire9 : wire8)));
      reg13 <= reg12[(4'h9):(3'h7)];
      reg14 <= reg12;
      reg15 <= (^$signed($signed((~&$signed(reg14)))));
    end
  assign wire16 = $unsigned(($signed({reg13}) & ({reg11[(3'h6):(3'h4)],
                      (reg15 ?
                          reg12 : (8'ha3))} << ($signed(wire7) && $unsigned(wire9)))));
  always
    @(posedge clk) begin
      reg17 <= (reg14 ?
          (8'hac) : (wire8 & ({wire8[(5'h11):(5'h11)]} ?
              $unsigned((wire10 && wire8)) : ($signed((7'h40)) - (reg12 ?
                  (8'ha3) : (8'hb5))))));
    end
  always
    @(posedge clk) begin
      reg18 <= wire10;
    end
  assign wire19 = $unsigned({$signed($unsigned({wire6, reg15}))});
  module20 #() modinst68 (wire67, clk, wire9, reg13, reg18, reg12, reg14);
endmodule

module module20
#(parameter param66 = (^~(8'hbd)))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire signed [(4'h8):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
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
                 reg28,
                 (1'h0)};
  assign wire26 = wire23;
  assign wire27 = $unsigned($signed(wire25[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg28 <= ({wire26,
              (($unsigned(wire26) ^~ wire26[(1'h0):(1'h0)]) || wire24)} ?
          $signed($signed($unsigned((~&wire27)))) : (wire24[(3'h6):(3'h4)] ?
              (wire26 ^ $unsigned((^wire21))) : wire24[(3'h5):(3'h4)]));
    end
  assign wire29 = $unsigned($unsigned((~$signed((8'ha9)))));
  assign wire30 = wire26;
  always
    @(posedge clk) begin
      if ((+$signed($signed((~&$unsigned(wire23))))))
        begin
          reg31 <= $unsigned(((wire21[(2'h3):(1'h0)] < (wire25 <<< $signed((8'ha3)))) ?
              {$signed($unsigned((7'h42))),
                  $unsigned((8'h9c))} : wire22[(3'h6):(3'h6)]));
          if (wire30[(4'he):(4'hd)])
            begin
              reg32 <= ((wire29 ?
                  wire22[(1'h1):(1'h0)] : $unsigned({wire21[(4'h8):(1'h1)]})) < wire25);
              reg33 <= $unsigned(((8'h9d) ?
                  wire22[(2'h3):(2'h2)] : wire23[(4'h9):(2'h3)]));
              reg34 <= (+$unsigned((~^{((8'hb0) ? (8'hbb) : wire27),
                  {wire25, reg32}})));
            end
          else
            begin
              reg32 <= ({(($unsigned((8'ha4)) & {wire25,
                      reg32}) * ($unsigned(wire24) ?
                      ((8'ha2) >>> (8'haf)) : (8'hb5)))} && $unsigned(wire26));
              reg33 <= ($unsigned($unsigned($unsigned($signed((8'hb2))))) * wire22[(1'h1):(1'h1)]);
              reg34 <= $unsigned(((~reg33) < ((+wire30[(3'h6):(3'h4)]) ?
                  wire29[(2'h3):(1'h1)] : (+(wire21 ? wire26 : (8'hbf))))));
            end
          if (wire22)
            begin
              reg35 <= $unsigned({((8'ha5) > (reg34 ?
                      wire22[(1'h1):(1'h0)] : $signed(reg33)))});
            end
          else
            begin
              reg35 <= (!($signed($unsigned((reg33 ~^ wire29))) >> ($unsigned((wire24 || wire21)) ?
                  (-(reg28 * reg34)) : ({reg32, reg34} ?
                      reg34 : ((8'hb7) & wire25)))));
              reg36 <= (wire24 ?
                  $signed({$signed((reg31 ? wire30 : wire29)),
                      $unsigned({(7'h42)})}) : wire27);
              reg37 <= reg28[(1'h0):(1'h0)];
              reg38 <= $signed(reg37[(3'h7):(3'h7)]);
            end
          if ((((($unsigned(reg32) & (reg31 <<< reg28)) <<< $unsigned((8'ha2))) << reg38[(3'h6):(3'h6)]) >= $unsigned(((~&$unsigned(reg32)) ?
              (((8'hb3) ? wire26 : reg33) ?
                  $unsigned(reg36) : $unsigned(reg36)) : $signed($signed(reg32))))))
            begin
              reg39 <= reg33[(3'h4):(3'h4)];
              reg40 <= wire29[(2'h2):(1'h1)];
              reg41 <= $signed($signed(wire30[(5'h15):(3'h5)]));
              reg42 <= wire24;
            end
          else
            begin
              reg39 <= reg41[(5'h14):(5'h12)];
              reg40 <= {reg41,
                  ($unsigned(((-wire29) <<< $unsigned(wire26))) ?
                      reg40 : (!$signed(wire22)))};
              reg41 <= reg35[(1'h1):(1'h1)];
              reg42 <= ((-$signed(($unsigned(wire23) ^~ {wire30, wire29}))) ?
                  ((((reg31 ? reg32 : wire23) ?
                          $signed(reg35) : wire22[(2'h2):(1'h1)]) ?
                      (~&(&reg32)) : (reg42 >= (wire21 && reg37))) <<< reg32[(2'h3):(1'h1)]) : (({(reg38 ?
                              (8'ha2) : wire21)} ~^ ({wire22} ?
                          $signed(reg35) : (|reg39))) ?
                      ((wire26 ?
                          reg34 : (reg32 ?
                              wire29 : wire27)) <<< $signed(reg40)) : $unsigned({(wire22 ?
                              reg41 : reg38)})));
              reg43 <= (-$signed(wire26));
            end
          reg44 <= (reg34 + (~&((~&(-reg36)) ?
              wire27[(1'h0):(1'h0)] : $signed(reg31[(3'h4):(2'h2)]))));
        end
      else
        begin
          reg31 <= $signed((|reg28));
        end
      if ((((-reg37[(3'h7):(3'h7)]) ?
              (~|wire26[(1'h1):(1'h1)]) : $unsigned((|(reg36 ?
                  reg42 : reg31)))) ?
          (wire26[(1'h0):(1'h0)] ?
              (((wire30 << reg44) ?
                  $signed(reg39) : (8'hb4)) == (|$unsigned(reg35))) : ($unsigned($signed(reg40)) ?
                  (8'ha6) : reg28[(3'h4):(1'h1)])) : {(&(((8'ha4) ?
                  (8'hb8) : (8'hba)) + {reg38})),
              $unsigned(wire21)}))
        begin
          if (($unsigned(wire24[(1'h0):(1'h0)]) ^~ $signed(((|$signed(reg43)) >= (wire30[(5'h11):(3'h7)] ?
              wire29[(2'h3):(2'h2)] : $signed(reg40))))))
            begin
              reg45 <= wire27;
              reg46 <= ($unsigned(({$signed(wire22)} ?
                  ($unsigned((7'h42)) ^ (^wire21)) : (wire22 ~^ (|(8'hb8))))) >>> $unsigned((($unsigned(wire26) ?
                      ((8'had) ~^ reg43) : $signed(reg33)) ?
                  ({reg45} == {reg37}) : reg45[(3'h7):(2'h2)])));
            end
          else
            begin
              reg45 <= (+$signed(((reg44 ?
                      (reg45 ? reg32 : wire24) : (reg35 - reg43)) ?
                  ({reg43, (8'hac)} <<< reg34[(4'ha):(2'h2)]) : {$signed(reg44),
                      reg46[(1'h0):(1'h0)]})));
              reg46 <= (^reg44[(2'h2):(1'h0)]);
              reg47 <= $unsigned(reg34);
            end
          if (reg35)
            begin
              reg48 <= reg43[(3'h4):(1'h0)];
            end
          else
            begin
              reg48 <= $signed(($unsigned(wire25[(3'h5):(3'h5)]) ?
                  (reg44 - wire27[(1'h0):(1'h0)]) : (~|{$signed(reg38)})));
              reg49 <= wire25;
              reg50 <= (({(wire26 ? {(8'hb5)} : $unsigned(reg32)), reg36} ?
                  reg28 : $signed((((8'hbd) & reg36) ?
                      $unsigned(reg41) : reg48[(3'h6):(3'h4)]))) | ((((reg28 < reg33) ^ reg40[(4'h9):(1'h0)]) ?
                      ($signed(reg47) ?
                          reg42 : wire21[(2'h2):(1'h0)]) : $signed((!wire23))) ?
                  ($unsigned((wire23 ?
                      reg45 : reg40)) || (+wire23[(2'h3):(2'h2)])) : {($unsigned(reg35) ?
                          {reg46} : (reg47 ? reg48 : wire27))}));
              reg51 <= (reg37[(5'h11):(4'h9)] == wire29);
              reg52 <= reg49;
            end
          reg53 <= reg32;
        end
      else
        begin
          reg45 <= (reg49[(3'h5):(1'h0)] ?
              {reg52,
                  (($signed(reg50) >> $signed(wire25)) ?
                      reg36 : reg31[(2'h2):(2'h2)])} : reg53);
          if ((wire23[(3'h6):(3'h5)] < reg35[(2'h2):(1'h0)]))
            begin
              reg46 <= (~&((reg43 <<< ($signed(reg42) <= reg32)) >= (((^(8'ha9)) ?
                  reg28 : (reg39 ? (7'h43) : reg39)) || reg46[(1'h0):(1'h0)])));
              reg47 <= (+$unsigned(reg38));
              reg48 <= reg46;
              reg49 <= {(^reg33[(2'h2):(2'h2)]),
                  $unsigned((wire30[(4'hc):(2'h3)] ?
                      (~|(-reg47)) : wire25[(2'h2):(1'h0)]))};
            end
          else
            begin
              reg46 <= (reg53[(3'h5):(1'h1)] ?
                  reg51[(1'h0):(1'h0)] : reg52[(4'h8):(1'h0)]);
              reg47 <= reg31;
              reg48 <= (&reg41[(4'hc):(4'h9)]);
              reg49 <= $unsigned(reg41);
              reg50 <= (+$unsigned((!($unsigned(reg46) >>> $signed(reg51)))));
            end
        end
      reg54 <= reg42[(1'h0):(1'h0)];
      reg55 <= reg46;
      reg56 <= (~&(+$unsigned(((reg47 <= reg31) ?
          wire22[(2'h2):(1'h1)] : $unsigned(reg53)))));
    end
  assign wire57 = ((8'ha2) != $signed(({(reg33 ~^ reg36)} ^ (+reg50))));
  assign wire58 = reg46[(2'h3):(2'h2)];
  assign wire59 = {(^(+reg51))};
  assign wire60 = {$unsigned(reg48[(3'h7):(1'h0)]),
                      (wire30[(5'h12):(4'he)] | (!reg28[(4'hb):(3'h4)]))};
  assign wire61 = $signed($signed($unsigned(({reg31,
                      reg56} ^~ $signed(wire60)))));
  assign wire62 = reg45;
  assign wire63 = ((!reg35) ?
                      (-$signed($signed({reg37,
                          wire59}))) : (($unsigned(reg50[(1'h0):(1'h0)]) && $signed((~reg43))) <<< {$unsigned((-reg28))}));
  assign wire64 = $unsigned(reg33);
  assign wire65 = (wire64[(1'h0):(1'h0)] >> ({(^~((8'ha2) + (8'h9d)))} ?
                      (wire22 < (8'ha4)) : (-reg33)));
endmodule
