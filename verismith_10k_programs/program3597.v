module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire4 = $signed((7'h44));
  assign wire5 = ((^wire2[(3'h4):(3'h4)]) ?
                     $unsigned(($signed((wire2 ^~ (8'hbf))) < {$unsigned(wire2)})) : wire3[(3'h4):(2'h3)]);
  assign wire6 = $unsigned((~(^$signed($unsigned((8'ha2))))));
  assign wire7 = (wire4[(4'ha):(4'h8)] << $unsigned(wire3[(2'h2):(1'h1)]));
  assign wire8 = ($unsigned(((!wire1) >> $unsigned($signed(wire2)))) ?
                     wire2[(1'h1):(1'h1)] : $unsigned((wire7[(4'h9):(3'h4)] <<< wire6)));
  module9 #() modinst71 (.wire10(wire6), .wire12(wire7), .clk(clk), .wire13(wire8), .wire11(wire2), .y(wire70));
  assign wire72 = {wire5, (-wire0[(4'ha):(2'h3)])};
  assign wire73 = $unsigned((($unsigned({wire3,
                          wire3}) == {wire3[(1'h1):(1'h1)]}) ?
                      wire70[(4'ha):(2'h3)] : (((~(8'hb0)) == (~&wire6)) ?
                          wire70 : wire4)));
  assign wire74 = ((((&(wire5 ? wire70 : wire70)) && wire0[(4'h9):(2'h3)]) ?
                          wire6 : (((wire3 + wire0) != (7'h40)) ?
                              $unsigned($signed(wire73)) : wire70[(4'hd):(3'h5)])) ?
                      (~|$signed(wire1)) : $unsigned({wire2[(4'he):(1'h0)],
                          (|((8'hac) ^~ wire5))}));
  assign wire75 = (~^$signed(wire72[(1'h1):(1'h0)]));
  assign wire76 = (wire8[(1'h1):(1'h0)] & (~&$signed($unsigned(wire2[(1'h1):(1'h1)]))));
  assign wire77 = $signed(wire3);
  always
    @(posedge clk) begin
      reg78 <= ($signed(wire8[(1'h0):(1'h0)]) ?
          wire5[(1'h0):(1'h0)] : (wire4[(3'h6):(3'h6)] ?
              $signed($unsigned($unsigned(wire3))) : ((8'had) >> wire2)));
      reg79 <= reg78;
      if ((((|((^~wire70) < $unsigned(wire73))) ?
          reg79 : (($signed(wire0) ^ $signed(wire72)) <<< ((wire7 << (8'hab)) == (8'ha3)))) == wire8[(4'hb):(4'h8)]))
        begin
          reg80 <= $unsigned($unsigned((-(~^wire70[(4'hb):(2'h3)]))));
          if ($signed(($unsigned(wire76) >= $signed(($signed(wire77) < (wire72 ?
              (8'hb2) : (8'hbe)))))))
            begin
              reg81 <= reg79;
              reg82 <= ((~|($unsigned((reg81 != (8'hbf))) * wire5)) ?
                  wire7 : $unsigned({(((8'ha0) ?
                          (8'ha8) : wire0) + ((8'hb2) + wire74))}));
              reg83 <= ($unsigned(wire4) >>> wire0[(2'h3):(1'h1)]);
            end
          else
            begin
              reg81 <= {((&reg82[(4'hc):(2'h3)]) ?
                      (($unsigned(reg81) ?
                          $unsigned(wire76) : wire4[(4'hf):(4'he)]) - ((!wire76) ?
                          (wire72 * reg82) : (reg81 ?
                              reg78 : (8'h9d)))) : $signed(((wire75 ?
                              (8'ha6) : (8'hba)) ?
                          reg80 : (wire70 ? (8'ha7) : wire76))))};
              reg82 <= (~&$unsigned($unsigned($signed((~|wire73)))));
              reg83 <= $signed(wire5[(1'h0):(1'h0)]);
              reg84 <= (^~((reg80 ^~ (8'hb5)) ?
                  ((8'ha9) >= {wire72[(3'h5):(1'h0)],
                      $unsigned((8'h9c))}) : $unsigned(wire76[(3'h5):(3'h5)])));
            end
          if ((8'hb1))
            begin
              reg85 <= (^~$unsigned($signed(wire4[(2'h2):(1'h0)])));
            end
          else
            begin
              reg85 <= ({wire5[(2'h3):(1'h1)]} < (((+wire3[(3'h7):(3'h5)]) >= (&{reg79})) ~^ wire5));
              reg86 <= ({reg83[(4'hb):(2'h3)]} ?
                  (&reg79) : ((-wire70) ^ (|$unsigned(wire2[(4'hd):(3'h4)]))));
              reg87 <= reg80[(1'h0):(1'h0)];
              reg88 <= ($signed($unsigned((8'haa))) ?
                  $unsigned($unsigned((wire77 & ((8'hb8) ?
                      wire1 : reg87)))) : ((wire77 ?
                          (~|(~&wire1)) : wire77[(2'h2):(1'h0)]) ?
                      (!{wire70}) : reg78[(5'h14):(3'h5)]));
            end
          reg89 <= (reg87[(3'h4):(1'h0)] ?
              (wire3[(3'h6):(3'h5)] ?
                  (-((|wire8) <<< reg88[(4'hb):(2'h2)])) : wire1[(1'h1):(1'h0)]) : (($unsigned(reg85[(2'h2):(2'h2)]) != ($signed((8'hb0)) ?
                      (reg78 <<< wire2) : (-wire0))) ?
                  $signed((~^(~|wire77))) : ($signed({reg78}) ?
                      $unsigned((reg81 ? wire0 : reg79)) : ((reg83 ^~ reg87) ?
                          reg84[(1'h1):(1'h0)] : (~&wire5)))));
        end
      else
        begin
          reg80 <= reg83;
          reg81 <= $unsigned(wire76);
          reg82 <= wire2[(4'ha):(1'h0)];
          reg83 <= $unsigned((~{$unsigned((wire3 >> reg79)), wire0}));
        end
      reg90 <= ((8'ha1) | ($unsigned({{(8'hb0), wire77}}) ?
          ($unsigned((wire77 ? wire6 : reg87)) < wire2) : wire7));
      reg91 <= $signed(((wire77[(4'hc):(3'h7)] ?
          (+wire0[(4'h8):(1'h0)]) : wire3[(3'h5):(2'h3)]) >>> (+{$signed(reg89),
          wire0})));
    end
endmodule

module module9
#(parameter param68 = {{(^((&(8'had)) ? (^~(8'h9e)) : {(8'hba)}))}, (8'hbe)}, 
parameter param69 = param68)
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire59;
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (|$unsigned(($unsigned(wire13) ?
          ((~&wire13) > $unsigned(wire13)) : wire10)));
      reg15 <= (~|reg14);
      reg16 <= (-$signed({wire12[(4'h8):(3'h6)], (+(reg15 > reg14))}));
    end
  module17 #() modinst60 (.wire21(reg16), .clk(clk), .y(wire59), .wire20(wire11), .wire19(wire12), .wire18(reg15));
  assign wire61 = $signed((^(~&$unsigned($signed(reg15)))));
  assign wire62 = $unsigned({((reg15 ?
                          (wire12 || (8'ha2)) : {wire13,
                              reg14}) + $signed(wire10[(1'h0):(1'h0)])),
                      (^~((wire12 ?
                          (8'ha0) : wire59) <<< (wire12 ^~ (8'hb6))))});
  assign wire63 = reg14[(2'h3):(1'h1)];
  assign wire64 = (+wire11);
  assign wire65 = (wire62 ? $unsigned(wire64) : $signed(wire11[(3'h4):(3'h4)]));
  assign wire66 = (wire64 ?
                      (&{$unsigned($unsigned(reg15)),
                          wire65[(2'h2):(1'h1)]}) : wire59[(2'h2):(1'h0)]);
  assign wire67 = ($unsigned(wire59[(3'h6):(3'h6)]) ?
                      (7'h43) : wire12[(4'ha):(4'h9)]);
endmodule

module module17
#(parameter param58 = (^((&((~^(8'hb7)) ? ((8'hac) + (8'h9e)) : (+(8'haa)))) ? (8'had) : ((!((8'h9d) || (8'hb0))) ^ (~^(-(8'hb8)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = wire20[(4'ha):(3'h4)];
  assign wire23 = (wire22[(1'h1):(1'h1)] - wire19[(3'h5):(3'h4)]);
  assign wire24 = {($signed({((8'hb7) ? (8'hb5) : wire22),
                              (wire21 ^~ wire19)}) ?
                          (^$signed((7'h43))) : ($signed(wire19) ?
                              ((|wire21) ?
                                  {wire18,
                                      wire18} : wire23[(4'he):(4'he)]) : ($unsigned((7'h44)) ?
                                  (wire20 ? wire23 : wire22) : wire22))),
                      (-((~$unsigned((8'ha6))) ?
                          (8'hb5) : {((8'hbe) ? wire20 : wire18),
                              (wire19 - wire23)}))};
  always
    @(posedge clk) begin
      if (wire22[(1'h1):(1'h1)])
        begin
          reg25 <= $unsigned({((wire24 ? {wire18, wire18} : (wire21 | wire22)) ?
                  (~|{wire24}) : ((wire18 ? (8'hb7) : (8'had)) >= (8'hb7))),
              ({wire23[(4'h8):(1'h0)]} | wire20[(1'h1):(1'h1)])});
          reg26 <= (!(|(~(wire21 ? {wire20, wire21} : (wire19 >>> (8'ha1))))));
          reg27 <= (~(~|$unsigned(((wire20 + (8'hb5)) >= wire21[(1'h1):(1'h1)]))));
          reg28 <= (wire22[(1'h1):(1'h1)] ?
              ((+reg25[(4'hd):(4'h9)]) ?
                  (-wire20[(3'h7):(2'h2)]) : wire22) : $signed((~&(~^$unsigned(wire19)))));
          reg29 <= $signed((8'had));
        end
      else
        begin
          if ({(($unsigned(reg26[(5'h12):(4'hd)]) ?
                      wire20[(5'h10):(4'hb)] : $signed($unsigned(reg27))) ?
                  {$signed(reg26[(5'h11):(4'hf)])} : $signed(($signed((8'hb6)) != (-(8'ha3))))),
              (8'ha9)})
            begin
              reg25 <= wire24[(4'h8):(3'h7)];
              reg26 <= wire19;
              reg27 <= $unsigned(reg26);
              reg28 <= {((~|reg27) ?
                      ($unsigned($signed(reg25)) + $unsigned($signed(wire22))) : $signed($unsigned((|wire20)))),
                  $unsigned({$unsigned((wire24 || reg28)),
                      {wire22[(2'h2):(1'h1)]}})};
            end
          else
            begin
              reg25 <= {(&reg25)};
            end
        end
      reg30 <= (~wire22);
      reg31 <= ((~wire19) << $signed(($signed(wire18) < (~^((8'hbf) ?
          reg25 : reg28)))));
      reg32 <= (~|(&(+reg28[(2'h2):(1'h0)])));
      reg33 <= wire24[(1'h0):(1'h0)];
    end
  assign wire34 = reg33[(5'h12):(4'ha)];
  always
    @(posedge clk) begin
      reg35 <= (($unsigned(wire23) ?
          (reg26[(4'hb):(4'h9)] ?
              (7'h43) : (((7'h41) ?
                  reg32 : wire20) ^~ reg29)) : wire19) ^ wire34[(3'h7):(3'h7)]);
      reg36 <= ($signed((({wire18} && reg29) << wire23)) ?
          $signed($signed((~|$signed(wire34)))) : {wire23[(5'h10):(4'h8)],
              $unsigned($unsigned($unsigned(wire18)))});
      if ((reg25 ?
          ((^~reg35[(3'h4):(2'h2)]) * $signed((!(reg31 ?
              wire21 : (8'h9c))))) : $unsigned(wire22)))
        begin
          if ((reg25[(5'h12):(5'h11)] ?
              (^~reg28[(3'h6):(1'h0)]) : $unsigned($unsigned((!(wire21 ?
                  reg32 : wire20))))))
            begin
              reg37 <= $signed($unsigned((~&(wire22 ^~ (8'hb4)))));
              reg38 <= (($unsigned(((reg32 ? (8'hbd) : wire18) ?
                      (+(7'h41)) : {reg25, reg25})) ?
                  $signed($unsigned((wire21 && reg33))) : ($signed((reg31 ?
                          reg25 : reg35)) ?
                      reg30 : reg37)) ^~ $unsigned((~^(reg26 ?
                  (reg31 ^~ wire22) : (8'ha5)))));
              reg39 <= (!$unsigned((+(~&$signed(reg35)))));
            end
          else
            begin
              reg37 <= reg38[(1'h1):(1'h1)];
              reg38 <= (&(wire23[(1'h1):(1'h1)] ~^ (^{$unsigned(reg36),
                  (8'ha0)})));
              reg39 <= {(&$unsigned((reg25 ?
                      ((8'hae) ? reg35 : (8'hb4)) : (reg26 <<< reg26)))),
                  (((8'hb0) || wire21[(2'h2):(1'h0)]) ?
                      reg32 : $unsigned(wire18))};
              reg40 <= $unsigned(($signed($signed($unsigned(wire18))) <= (~((reg28 ?
                  reg30 : wire34) || {wire21}))));
              reg41 <= (((~&reg39[(4'ha):(3'h6)]) ~^ (8'hb5)) >> $signed($unsigned(($signed(wire18) <<< (reg32 ?
                  (8'hb0) : wire18)))));
            end
          if ($unsigned((reg31[(3'h5):(3'h5)] <<< $unsigned((|reg36[(1'h0):(1'h0)])))))
            begin
              reg42 <= reg29;
              reg43 <= (~&($unsigned(reg36) ~^ reg41));
              reg44 <= $unsigned($signed($unsigned($signed($unsigned(wire19)))));
              reg45 <= $signed($unsigned(reg31[(4'h8):(4'h8)]));
            end
          else
            begin
              reg42 <= (~|((reg26 ? wire34 : reg40) ?
                  $signed({reg28}) : reg41));
              reg43 <= ((~^(|$signed($unsigned(reg36)))) + (wire24 == ($unsigned((|(7'h42))) ?
                  reg45[(1'h1):(1'h0)] : wire34)));
              reg44 <= (~|((~|(reg32 ^ reg27[(3'h7):(1'h1)])) || ({$unsigned(reg35),
                  $signed(reg40)} <= $unsigned((reg35 | reg28)))));
              reg45 <= ((($unsigned($unsigned(wire22)) >= (~^reg33)) && reg32[(2'h2):(1'h1)]) ?
                  (reg35 ^ $signed(reg28)) : (~^$signed((~&reg25[(4'h8):(3'h7)]))));
              reg46 <= ($unsigned(($unsigned(reg41) ?
                  (^~((8'ha7) && (8'ha0))) : {{reg45},
                      $unsigned(reg41)})) & ($unsigned(wire21[(1'h0):(1'h0)]) == reg40));
            end
        end
      else
        begin
          reg37 <= ((wire34[(2'h2):(2'h2)] <= reg30[(4'h9):(3'h4)]) ?
              ($signed((reg39 <<< (!reg36))) ~^ $signed(reg44)) : $unsigned((((~|reg44) ?
                      (-reg39) : (~wire19)) ?
                  reg38[(4'ha):(3'h7)] : (reg25[(4'hd):(2'h2)] == $unsigned((8'had))))));
          reg38 <= reg39[(4'hd):(1'h0)];
          reg39 <= reg39;
          reg40 <= (~&(({((8'hb9) ? reg26 : reg33)} ?
                  (&(-reg28)) : (~^(reg36 ~^ reg33))) ?
              (|(+$signed(reg32))) : wire24));
          if (wire20[(5'h10):(4'hf)])
            begin
              reg41 <= wire18[(4'hd):(4'hc)];
              reg42 <= $signed($unsigned((7'h44)));
              reg43 <= reg46;
              reg44 <= ($unsigned((reg39 || reg43)) ?
                  $signed(reg37) : (^wire34));
              reg45 <= reg29[(3'h6):(2'h3)];
            end
          else
            begin
              reg41 <= reg40;
              reg42 <= (((^~(8'haf)) ?
                      {reg36[(3'h4):(3'h4)]} : reg36[(4'he):(3'h4)]) ?
                  ((reg41[(3'h6):(3'h6)] * ((+reg42) ?
                      reg42 : ((8'hba) ?
                          reg42 : (8'hbd)))) ^ $signed((7'h40))) : (~^(8'ha9)));
              reg43 <= reg46[(4'hd):(3'h6)];
              reg44 <= reg45;
            end
        end
      reg47 <= (8'hae);
      if ((~&$signed($signed((^~$unsigned(reg40))))))
        begin
          reg48 <= reg28;
          reg49 <= $signed({(!((wire34 ?
                  reg44 : wire22) << reg39[(5'h10):(4'hd)])),
              {$signed({reg27})}});
          if (reg48)
            begin
              reg50 <= ((+$signed(($unsigned(reg37) ?
                  (~|reg45) : (reg36 ?
                      wire19 : reg48)))) || reg40[(1'h1):(1'h0)]);
            end
          else
            begin
              reg50 <= $signed(reg26);
              reg51 <= (^$unsigned((wire18 ?
                  $unsigned((reg37 ? (7'h42) : reg36)) : reg42)));
              reg52 <= $unsigned($unsigned(((8'hae) == ((reg39 ?
                      reg44 : (8'haf)) ?
                  reg42 : $signed((8'ha6))))));
              reg53 <= reg45;
              reg54 <= $unsigned((!reg51[(3'h5):(1'h1)]));
            end
          reg55 <= $unsigned((8'hb5));
        end
      else
        begin
          reg48 <= (8'hbb);
          reg49 <= {reg30[(4'hb):(3'h4)]};
          reg50 <= (((({reg42} ? $unsigned(wire21) : ((8'hb2) > reg54)) ?
                      (((8'ha4) >>> reg51) ?
                          {reg33} : (^(8'hb1))) : (~^((8'hab) || (8'ha6)))) ?
                  (^reg50[(2'h3):(2'h3)]) : ($signed((~&wire24)) <<< (^~((8'h9e) + reg37)))) ?
              $unsigned($signed((8'ha5))) : $unsigned($signed(wire21)));
        end
    end
  assign wire56 = reg42;
  assign wire57 = reg32[(2'h3):(1'h0)];
endmodule
