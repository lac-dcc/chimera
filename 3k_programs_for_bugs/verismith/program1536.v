module top
#(parameter param69 = {(((8'hb3) <<< ((~^(8'ha0)) ^~ ((8'ha2) ? (8'haf) : (7'h42)))) ? (((~^(8'ha9)) ^~ {(8'hb9)}) ? ((8'hb4) ^ (!(8'haa))) : (((8'hb2) ? (8'hab) : (8'hae)) ? {(8'haf), (8'ha7)} : ((8'hae) | (8'haf)))) : (|(8'ha9))), (|{(((7'h44) ? (8'hb2) : (8'hac)) & ((8'hb4) ? (8'hac) : (8'hbb))), (((8'hbe) <<< (8'ha8)) > ((8'h9e) ? (7'h43) : (8'ha7)))})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire59;
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  assign y = {wire68,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  module4 #() modinst60 (wire59, clk, wire3, wire0, wire1, wire2, (8'ha5));
  assign wire61 = (wire3 != wire2[(3'h5):(3'h4)]);
  assign wire62 = wire3[(1'h0):(1'h0)];
  assign wire63 = $unsigned({($signed($unsigned(wire0)) << {wire0[(1'h1):(1'h1)]})});
  assign wire64 = ((((wire61 ?
                          {wire3, (8'haf)} : (wire59 ?
                              wire61 : wire1)) && {$unsigned(wire61),
                          (wire3 ? wire1 : wire0)}) ?
                      (!((!wire59) != {wire1,
                          wire62})) : wire0[(3'h6):(3'h5)]) * (((|(wire63 * wire59)) ?
                          (~|$signed(wire62)) : ((^~wire0) && (wire62 != wire62))) ?
                      (~&$unsigned((wire62 ? wire1 : wire0))) : wire63));
  always
    @(posedge clk) begin
      reg65 <= ((wire63[(5'h10):(3'h7)] >>> $signed(wire64)) * (($signed({wire2,
                  wire62}) ?
              ((wire0 ^~ wire0) == wire63[(3'h5):(3'h4)]) : ((!wire2) ?
                  $signed(wire1) : $unsigned(wire61))) ?
          (!wire59[(2'h2):(1'h1)]) : ($signed((wire2 ^ wire59)) && wire59[(3'h4):(2'h3)])));
      reg66 <= (|wire2);
      reg67 <= ($unsigned(($unsigned(wire0) ?
              reg66[(1'h0):(1'h0)] : (|(7'h43)))) ?
          wire62[(3'h5):(1'h0)] : (8'ha4));
    end
  assign wire68 = $signed(wire63[(5'h10):(3'h7)]);
endmodule

module module4
#(parameter param57 = ((((^~((8'hb3) ? (8'haf) : (8'hb1))) > (((7'h44) ? (7'h44) : (8'ha1)) ? {(8'hb6), (8'hb4)} : ((8'h9d) & (8'hb2)))) != ((8'hb2) ? (8'ha9) : ({(8'h9d)} ? ((8'ha6) ? (7'h41) : (8'hb3)) : (8'hb4)))) ? {(^~(((8'hbd) ? (8'ha3) : (8'hb5)) ? ((8'hae) ? (8'ha1) : (7'h41)) : (8'hb2)))} : {(((8'h9c) + ((8'hbc) ^~ (8'hb6))) ? {{(8'hbc), (8'ha9)}, (+(8'hae))} : ((!(8'h9c)) && ((8'h9f) >>> (8'hbc)))), (~^((-(8'hbc)) <= (+(8'hb1))))}), 
parameter param58 = {(+{((param57 & param57) ? (~^param57) : {param57, param57}), {(param57 ? param57 : param57)}}), param57})
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire6;
  input wire [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire10;
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire56,
                 wire38,
                 wire19,
                 wire18,
                 wire17,
                 wire10,
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
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = $unsigned({(((wire5 <<< wire9) < (wire7 != wire9)) == $signed(((8'ha9) >= wire5)))});
  always
    @(posedge clk) begin
      if (({wire10,
              ((8'had) ? {wire6, (wire9 ? wire7 : wire5)} : $unsigned(wire7))} ?
          (wire10 <= (+((wire9 ? wire10 : (8'hb9)) ?
              wire5 : $unsigned(wire7)))) : $signed(wire7)))
        begin
          reg11 <= $unsigned(wire6[(1'h0):(1'h0)]);
          reg12 <= ((8'hb7) + ($signed(wire6) >>> wire10[(2'h2):(2'h2)]));
        end
      else
        begin
          reg11 <= wire8[(3'h4):(2'h2)];
          if ((($signed($unsigned((~&reg11))) ?
                  $unsigned($signed($unsigned(wire10))) : wire7[(2'h3):(2'h3)]) ?
              $unsigned($unsigned($signed((~&(8'h9f))))) : $signed($signed({(~^wire7)}))))
            begin
              reg12 <= $signed({{{(reg11 >> wire9)}}});
              reg13 <= ((wire6[(1'h0):(1'h0)] ?
                      wire7[(4'hb):(3'h7)] : ($signed(wire5) ?
                          $unsigned((wire6 != wire6)) : wire7[(3'h6):(3'h5)])) ?
                  $signed((^wire8[(3'h5):(3'h4)])) : (^~$signed(((~reg12) ?
                      wire10[(2'h2):(1'h1)] : $signed(wire7)))));
            end
          else
            begin
              reg12 <= $signed(reg13);
              reg13 <= wire10[(1'h0):(1'h0)];
              reg14 <= $unsigned((&(wire6[(2'h3):(2'h3)] >= $unsigned((reg13 ?
                  (8'ha1) : wire10)))));
            end
          reg15 <= (wire6 <= (~&(((wire10 ^ wire5) ?
                  (~wire10) : (reg14 ? wire7 : wire7)) ?
              $unsigned((wire5 <<< wire6)) : wire8[(3'h5):(2'h3)])));
        end
      reg16 <= $signed((wire10[(1'h0):(1'h0)] ?
          wire6[(2'h3):(2'h2)] : {$signed((wire6 ? reg12 : reg12))}));
    end
  assign wire17 = reg14[(4'ha):(4'h8)];
  assign wire18 = ($unsigned((!((wire5 ?
                      (8'ha7) : wire17) - $unsigned(reg13)))) <<< $signed((({reg12,
                              (8'hbd)} ?
                          wire6[(2'h2):(1'h0)] : (reg11 * wire5)) ?
                      $signed($unsigned((8'ha0))) : (&{wire5}))));
  assign wire19 = wire8;
  always
    @(posedge clk) begin
      reg20 <= wire7[(2'h2):(1'h1)];
      if ($signed((((-((8'hb5) ? wire7 : wire19)) >>> wire5[(5'h15):(5'h11)]) ?
          (+reg13) : $unsigned(($signed((8'h9d)) ^ {wire6})))))
        begin
          reg21 <= ($unsigned({wire9[(3'h4):(2'h2)], wire6}) ? wire6 : reg20);
          reg22 <= (-(8'hbb));
          reg23 <= (wire8 < (wire18 ?
              wire10[(1'h0):(1'h0)] : $signed(((&reg11) >>> $unsigned(reg21)))));
        end
      else
        begin
          if (($signed($unsigned(reg14)) ^~ (wire18 ?
              (~^{$signed(wire7)}) : reg16)))
            begin
              reg21 <= $signed($signed(((reg15[(3'h4):(3'h4)] ?
                  (reg23 ?
                      reg20 : wire6) : ((8'hab) ~^ wire19)) != (wire10[(1'h1):(1'h1)] ~^ (-reg15)))));
              reg22 <= {(~^$unsigned(((reg21 ? reg23 : reg21) ?
                      (wire17 <<< reg22) : (wire7 & (8'ha9))))),
                  $unsigned((wire5 ?
                      {wire8[(1'h1):(1'h1)]} : ((8'ha9) ?
                          wire5 : $signed(wire9))))};
              reg23 <= $unsigned(reg22);
            end
          else
            begin
              reg21 <= reg23[(2'h2):(1'h0)];
              reg22 <= $unsigned($signed(reg15));
              reg23 <= (&((-$unsigned((~reg11))) ?
                  $unsigned(wire19) : ((-$signed(reg13)) >= reg16)));
              reg24 <= $unsigned((($unsigned({wire17}) + $signed($unsigned(reg11))) ?
                  ($signed($signed(wire5)) <<< ($signed((8'hbc)) ?
                      {reg11} : (wire7 >>> reg14))) : (($signed((7'h40)) ?
                          wire17[(3'h4):(1'h1)] : (~&wire7)) ?
                      {reg21[(3'h7):(2'h3)], $signed(wire18)} : (reg22 ?
                          (wire6 ? reg16 : reg22) : {(8'hb4)}))));
            end
        end
      reg25 <= ({{reg13[(4'h9):(3'h6)]},
              $unsigned($signed(((8'hab) ? reg11 : wire6)))} ?
          (reg23[(1'h1):(1'h0)] ?
              (7'h43) : ($signed(wire17) << $unsigned((reg14 >>> wire6)))) : ((($unsigned(reg22) ^ wire10) ?
                  wire6 : ($signed(wire6) ?
                      (wire8 ? reg15 : reg13) : $signed(wire17))) ?
              {(!(^~wire10))} : (+(~|(reg24 != reg11)))));
      if ((&(reg11 ?
          $unsigned($unsigned($unsigned(reg12))) : $signed(wire18[(4'he):(4'hc)]))))
        begin
          reg26 <= (~|(^reg12));
          reg27 <= ((|$unsigned(reg26[(3'h4):(3'h4)])) >>> wire7);
          reg28 <= (8'hb9);
          reg29 <= ({((&(~wire10)) ~^ ({reg24} ? {reg25} : (~^(8'hb0))))} ?
              $signed($unsigned(((reg20 ?
                  reg22 : wire19) || $unsigned(reg24)))) : ($unsigned(((&wire8) ?
                  ((8'hb3) ? reg11 : reg14) : (~&wire19))) + {{wire19,
                      {(8'hb6), (8'hbe)}},
                  (wire5 && (^reg15))}));
        end
      else
        begin
          if ((-(&reg20)))
            begin
              reg26 <= reg21[(1'h0):(1'h0)];
              reg27 <= ($signed((^~$signed($unsigned(reg20)))) || ({$signed((reg27 * reg25)),
                  $signed($signed(reg24))} >= ((!{reg22}) >= $unsigned(reg22[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg26 <= (8'hbb);
              reg27 <= $signed((+$unsigned((((8'ha5) ? wire9 : wire18) ?
                  wire9[(3'h4):(2'h2)] : wire19[(1'h1):(1'h0)]))));
            end
          if ((((~&reg11[(5'h12):(2'h2)]) ?
              ((+reg13) >>> $unsigned($signed(wire6))) : ($unsigned((reg20 > reg20)) ~^ (reg15 - (~reg26)))) ~^ wire7[(3'h4):(1'h1)]))
            begin
              reg28 <= (((8'hbc) && wire10) ?
                  (^$signed($signed((8'hb4)))) : {{(&$signed(wire17))}});
            end
          else
            begin
              reg28 <= $signed(wire18[(4'hf):(4'hb)]);
              reg29 <= reg25;
              reg30 <= ($signed((wire7[(2'h2):(1'h1)] >> $signed((reg21 ?
                  (8'hb6) : wire8)))) == $signed((+wire9[(1'h0):(1'h0)])));
            end
          reg31 <= ($signed((-($unsigned((8'ha4)) ?
              (reg12 ?
                  reg15 : wire5) : $signed(reg12)))) * ((-{reg20[(1'h0):(1'h0)],
                  $signed(reg30)}) ?
              wire18[(3'h5):(1'h0)] : (reg14[(4'he):(4'ha)] ?
                  reg22 : ((reg14 >= wire9) ? (~^wire8) : $signed(reg14)))));
          reg32 <= ($unsigned($signed($signed(reg22[(1'h1):(1'h1)]))) ?
              ($signed(reg23) >= (reg30[(2'h2):(2'h2)] ?
                  reg23 : reg24)) : reg15);
          reg33 <= $signed(wire8);
        end
      if (((^~$signed({{reg25}})) ?
          (reg21 ?
              (((+reg33) ? $signed(reg28) : (~&reg23)) ?
                  ($unsigned(reg20) ^~ {wire8,
                      reg31}) : reg20) : ((8'haa) & (&$unsigned(reg33)))) : wire10))
        begin
          if (($signed(reg13[(4'h9):(3'h5)]) ?
              reg27 : ((&(7'h42)) > $unsigned(($signed(reg20) ?
                  reg33[(4'he):(4'hb)] : reg13[(4'he):(4'h9)])))))
            begin
              reg34 <= wire9;
            end
          else
            begin
              reg34 <= {$signed((wire7[(3'h5):(1'h1)] | ($unsigned(reg14) ?
                      $unsigned(wire19) : $unsigned(reg11))))};
            end
          reg35 <= reg33[(4'hb):(2'h2)];
          reg36 <= wire7;
        end
      else
        begin
          reg34 <= reg20[(2'h2):(1'h0)];
          reg35 <= (^~$signed($unsigned((reg26[(2'h3):(1'h0)] < (wire5 <<< reg16)))));
          reg36 <= {($unsigned({(reg36 - (8'h9f))}) ?
                  $signed(($unsigned(reg23) <= reg36)) : $signed(($signed(reg33) ^~ $unsigned(reg33)))),
              $signed((({reg12} >= (reg20 ?
                  wire8 : reg26)) != $unsigned(reg29)))};
          reg37 <= $signed(wire7[(2'h3):(1'h1)]);
        end
    end
  assign wire38 = ((~|wire19) ?
                      $unsigned($signed(wire8[(2'h2):(2'h2)])) : $unsigned($signed((wire6[(2'h2):(1'h0)] & (reg35 ?
                          reg25 : wire18)))));
  always
    @(posedge clk) begin
      if ((~^((wire9 | (((8'hb0) ^ (8'ha4)) ~^ ((8'ha0) || reg34))) >> (reg24 <= (reg24 + reg32)))))
        begin
          reg39 <= wire38[(1'h0):(1'h0)];
          if ((($signed((^$unsigned(reg15))) ?
                  (reg27 ?
                      $signed(reg24) : {reg30[(4'h9):(3'h4)]}) : $unsigned($signed(((8'hb5) ^~ (8'hb5))))) ?
              reg29[(4'ha):(3'h4)] : reg24))
            begin
              reg40 <= ($unsigned(reg24) ^~ $unsigned(reg28));
            end
          else
            begin
              reg40 <= reg27[(4'hd):(1'h1)];
            end
        end
      else
        begin
          reg39 <= (|{$signed($signed($signed(reg27))), reg32[(3'h6):(2'h3)]});
          reg40 <= $unsigned((reg32[(4'h8):(2'h2)] ?
              (^~$unsigned(wire8)) : $signed($signed((reg40 ?
                  reg30 : wire19)))));
        end
    end
  always
    @(posedge clk) begin
      reg41 <= ($signed(wire8[(1'h0):(1'h0)]) ?
          $signed(reg22[(1'h1):(1'h1)]) : reg11[(4'h9):(3'h6)]);
      reg42 <= wire6;
      reg43 <= (+reg36);
    end
  always
    @(posedge clk) begin
      reg44 <= $unsigned({$unsigned(($signed(reg43) >= (reg43 & wire6))),
          (((reg34 ? (8'hab) : reg26) ? wire5[(4'h8):(3'h4)] : wire38) ?
              {reg36[(4'hc):(3'h4)]} : $signed((!reg22)))});
      if ((!($signed((^~(reg34 ? reg39 : reg26))) ?
          (($signed(reg43) < (+(8'hae))) ?
              {(8'hb5),
                  $unsigned((8'hb7))} : (~reg37)) : reg14[(2'h3):(2'h3)])))
        begin
          reg45 <= $unsigned($signed(reg22[(2'h3):(2'h2)]));
          if (({{((wire10 ? (8'hab) : reg15) ?
                          reg42[(4'hf):(1'h1)] : ((8'hb2) ? wire5 : wire6))},
                  wire38} ?
              reg44 : reg12[(1'h0):(1'h0)]))
            begin
              reg46 <= reg42[(4'ha):(4'h8)];
              reg47 <= ((^~reg41) * ({(reg16[(3'h5):(1'h0)] | reg32),
                      ((reg21 ? reg11 : (8'haa)) <= {reg46, reg39})} ?
                  reg32[(4'hb):(1'h0)] : wire5));
            end
          else
            begin
              reg46 <= ($signed($signed({reg30})) ?
                  {$unsigned((((7'h40) ? wire18 : (8'hae)) ?
                          reg23[(3'h6):(1'h1)] : $unsigned((8'h9f))))} : $unsigned((|reg32[(1'h1):(1'h1)])));
              reg47 <= wire7[(4'h8):(3'h7)];
              reg48 <= $signed(($unsigned($signed((~|reg32))) ?
                  ((reg34 ?
                      (reg28 ?
                          reg31 : reg42) : reg24[(3'h4):(2'h3)]) < $unsigned($unsigned(wire18))) : reg44[(4'hf):(2'h2)]));
            end
        end
      else
        begin
          reg45 <= (8'h9c);
          if ((-{$signed(($signed((7'h41)) ? (reg21 || reg28) : {reg11}))}))
            begin
              reg46 <= reg45;
            end
          else
            begin
              reg46 <= (^reg22[(4'h9):(1'h0)]);
              reg47 <= reg35;
              reg48 <= (~^$signed((+reg26[(2'h3):(2'h2)])));
              reg49 <= $unsigned(reg35);
            end
          if ({$unsigned((reg21 ?
                  ($signed(reg47) ?
                      reg25[(4'h9):(4'h8)] : $unsigned(reg48)) : (&(~^reg40))))})
            begin
              reg50 <= reg13;
              reg51 <= reg49[(4'h9):(2'h3)];
              reg52 <= {$signed(reg37[(5'h13):(4'h9)]),
                  $unsigned($unsigned((8'ha8)))};
              reg53 <= ((reg33 ?
                      (($unsigned(reg47) | $unsigned(reg37)) ?
                          $unsigned((8'hbc)) : $signed($unsigned((8'ha3)))) : $unsigned((^~(7'h43)))) ?
                  (reg22[(1'h0):(1'h0)] <<< {(~^reg45)}) : $signed((~$unsigned($unsigned(reg29)))));
            end
          else
            begin
              reg50 <= (^reg22);
              reg51 <= (^~{reg27});
              reg52 <= (~&$signed((!((reg12 ? reg37 : wire9) & (reg22 ?
                  (7'h44) : (8'ha6))))));
            end
          if (($signed(reg49[(4'hd):(3'h6)]) ? reg32 : $unsigned({(!(8'hb7))})))
            begin
              reg54 <= $signed({(reg41[(2'h2):(1'h1)] ?
                      wire7[(3'h7):(3'h7)] : $unsigned((~reg42)))});
              reg55 <= reg24;
            end
          else
            begin
              reg54 <= (($unsigned((^$signed(reg20))) ^ reg39[(4'hc):(2'h2)]) && $signed(reg46[(3'h4):(2'h2)]));
              reg55 <= (8'hb3);
            end
        end
    end
  assign wire56 = wire7[(3'h4):(2'h3)];
endmodule
