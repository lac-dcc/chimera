module top
#(parameter param109 = (^((!(((8'ha8) ? (8'ha9) : (8'hae)) ^ ((8'hbb) << (8'h9c)))) ^ (8'hb8))), 
parameter param110 = (!((&param109) ? (((param109 <<< param109) != (param109 ? param109 : param109)) * param109) : ((~&param109) ? param109 : ((param109 ? param109 : (8'ha4)) <= (param109 ? param109 : param109))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire105,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(({wire0} ? (8'ha9) : {({wire2} < wire2)}));
      reg5 <= $signed((8'hba));
      reg6 <= wire2[(4'he):(3'h4)];
    end
  assign wire7 = ($signed($signed((~(reg4 | (8'ha2))))) ?
                     $signed({$unsigned($signed(reg6)),
                         $unsigned((reg5 << wire3))}) : $signed(reg5));
  assign wire8 = (wire3[(5'h11):(2'h2)] + $unsigned($signed($unsigned((8'hb7)))));
  assign wire9 = wire8[(4'h9):(3'h5)];
  assign wire10 = {$unsigned({(reg6 ? {(8'hb7), wire3} : {reg4}),
                          $unsigned((^(8'ha0)))}),
                      $signed($unsigned(wire1[(3'h5):(3'h4)]))};
  assign wire11 = $signed({(^((wire9 >>> wire8) ?
                          {wire3, wire1} : $signed((8'ha6)))),
                      (((wire9 >> wire9) ?
                          (wire3 ^ wire1) : {wire1,
                              wire7}) || $signed((wire10 <<< wire8)))});
  assign wire12 = $signed(wire9[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg13 <= wire8;
      reg14 <= ((~reg6) ?
          $signed(wire1[(2'h2):(2'h2)]) : (wire7[(4'he):(4'h9)] ?
              wire2 : {{$signed(wire7), $unsigned(wire12)},
                  (~$signed(wire12))}));
      reg15 <= $signed((~^$unsigned((~|(reg4 ? wire12 : wire8)))));
    end
  assign wire16 = (!(~(wire3 ?
                      {(wire3 != (7'h41)),
                          (wire7 > reg14)} : (reg6[(2'h2):(1'h0)] ~^ (wire11 | wire2)))));
  assign wire17 = (((^($unsigned((8'hbc)) ?
                      (wire10 ?
                          wire12 : reg4) : (reg13 | reg5))) & (8'hae)) && $signed(wire12[(1'h0):(1'h0)]));
  assign wire18 = ((8'hb9) ?
                      ($unsigned(((wire10 ? wire10 : wire11) ?
                          $unsigned((8'h9d)) : reg13)) * (wire7[(1'h1):(1'h0)] > (~&reg15[(4'h8):(2'h3)]))) : (-(~reg14)));
  assign wire19 = (~{(wire9 ?
                          $signed((wire1 ? wire11 : reg14)) : ({reg6, wire0} ?
                              (wire3 <<< (8'ha3)) : reg4))});
  always
    @(posedge clk) begin
      if ($unsigned(($signed($signed($unsigned((8'hae)))) || {((~&wire0) <= (wire19 ?
              wire9 : wire18))})))
        begin
          if ((-$unsigned((~^wire11))))
            begin
              reg20 <= wire2[(1'h1):(1'h1)];
            end
          else
            begin
              reg20 <= ((((reg13[(1'h0):(1'h0)] ?
                          wire7 : $signed(wire12)) - wire19) ?
                      wire18 : wire3[(4'ha):(4'h9)]) ?
                  reg15[(1'h0):(1'h0)] : $unsigned({wire17[(1'h0):(1'h0)]}));
              reg21 <= $unsigned($signed($unsigned($signed(wire19[(4'ha):(3'h5)]))));
              reg22 <= (8'hbf);
              reg23 <= ($signed((($signed(wire17) ?
                      (reg20 ? reg13 : reg15) : (wire18 ?
                          wire17 : reg22)) ~^ ((wire3 >>> wire3) ?
                      $unsigned(wire11) : (|reg20)))) ?
                  {$unsigned(reg13[(4'hf):(3'h4)])} : ((8'had) ?
                      (~&(8'ha0)) : reg21[(5'h11):(5'h11)]));
              reg24 <= (|($signed(wire11) ?
                  ((reg21 ? (~^wire17) : (wire8 ? reg13 : reg13)) ?
                      (reg6 - $signed(reg23)) : $unsigned((&reg5))) : $signed($signed($signed((8'hb9))))));
            end
          reg25 <= (((~^(wire8 ?
              $unsigned((8'haa)) : wire17[(2'h3):(2'h2)])) <<< (^~$unsigned($unsigned(reg6)))) == $unsigned(($signed((~|reg21)) ?
              ($unsigned((8'ha9)) ^~ $signed(wire0)) : ((reg13 ?
                  wire17 : reg15) + $unsigned(wire7)))));
          reg26 <= wire19;
        end
      else
        begin
          reg20 <= wire19[(3'h6):(2'h2)];
          reg21 <= $signed($signed(wire9[(3'h7):(2'h2)]));
        end
      reg27 <= $signed($signed(wire19[(4'hc):(2'h3)]));
      reg28 <= (~&wire17);
    end
  module29 #() modinst106 (.wire32(reg25), .wire31(wire9), .clk(clk), .wire30(wire7), .wire33(reg20), .y(wire105));
  assign wire107 = wire1[(2'h2):(1'h1)];
  assign wire108 = ((~&$signed((!reg26[(2'h3):(2'h3)]))) > $signed(((~|$unsigned(reg14)) - ((^~(8'h9e)) ?
                       (wire2 ? reg15 : wire10) : $signed((8'h9d))))));
endmodule

module module29
#(parameter param103 = {((&(^~{(8'hb6), (8'ha1)})) & (!(((8'hbe) + (8'hb7)) ^~ (~(8'h9e))))), (|(8'hb5))}, 
parameter param104 = {(((~^param103) < ((8'ha7) + (param103 ? param103 : param103))) & (~param103)), ((~&(&(|param103))) ^ (({param103} < param103) ? ((param103 ? (8'ha0) : param103) ? (param103 << (8'ha8)) : ((8'h9c) ? param103 : param103)) : ((~|param103) ? {param103, param103} : (^param103))))})
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h249):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire33;
  input wire [(3'h4):(1'h0)] wire32;
  input wire [(4'h9):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire65;
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire65,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg46,
                 reg47,
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
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg34 <= ((((&{wire30, wire31}) ?
              wire30[(2'h2):(1'h0)] : ({wire30} ?
                  {wire30, wire32} : $signed(wire32))) >> $unsigned((&(wire32 ?
              wire32 : wire32)))) ?
          $unsigned(wire32) : (wire30[(4'h9):(4'h8)] >= $signed($signed((&wire33)))));
      if ((-wire33))
        begin
          if ({wire30, reg34[(3'h4):(1'h1)]})
            begin
              reg35 <= ($signed($unsigned(((wire32 >= wire32) & $unsigned(wire32)))) ?
                  ($unsigned($unsigned((8'hbf))) <<< (wire30[(4'he):(4'h8)] ?
                      ((wire32 & wire30) || (wire30 ?
                          wire32 : (8'hbe))) : $unsigned((~^wire33)))) : wire31);
              reg36 <= $unsigned(($unsigned(wire33[(4'h9):(3'h4)]) ?
                  reg35 : (reg34 ?
                      {(wire32 ? wire32 : reg34),
                          (wire32 ? wire31 : wire32)} : (wire30[(3'h4):(1'h1)] ?
                          (+(8'hbb)) : (~^wire32)))));
            end
          else
            begin
              reg35 <= wire33;
              reg36 <= wire33[(1'h0):(1'h0)];
              reg37 <= ($unsigned(reg35[(2'h3):(2'h3)]) ?
                  {(8'ha2)} : wire30[(5'h12):(4'he)]);
              reg38 <= (^~reg37[(4'h9):(4'h8)]);
            end
          if ($unsigned(((|$unsigned(wire33)) <<< wire32)))
            begin
              reg39 <= (wire31[(3'h5):(2'h3)] == (-(8'ha5)));
              reg40 <= $unsigned($signed($unsigned(wire30[(4'hd):(2'h3)])));
              reg41 <= reg36;
              reg42 <= {reg41[(3'h5):(2'h3)]};
              reg43 <= $unsigned(reg41[(4'hd):(4'hb)]);
            end
          else
            begin
              reg39 <= {$signed((!reg41[(2'h2):(1'h0)])), reg39};
              reg40 <= ($unsigned(reg39[(4'h9):(1'h0)]) || reg42[(1'h1):(1'h1)]);
            end
          reg44 <= $signed(reg37);
          if ($signed(((8'h9f) <<< {((8'ha1) << $signed(reg42)),
              ({wire33} ? (reg38 ? wire33 : reg40) : $signed(reg39))})))
            begin
              reg45 <= {((reg37[(3'h5):(2'h3)] * $signed(reg38[(3'h4):(1'h0)])) <<< ((~(&reg41)) + (8'hb0))),
                  reg44};
              reg46 <= $unsigned($unsigned($signed((^((8'ha9) ?
                  reg40 : (7'h43))))));
            end
          else
            begin
              reg45 <= reg43;
            end
          reg47 <= {$unsigned(reg40[(1'h1):(1'h1)]),
              ((|$signed($unsigned(reg39))) ?
                  $signed(($signed(wire32) ~^ reg45[(2'h3):(2'h3)])) : reg43[(2'h2):(1'h1)])};
        end
      else
        begin
          reg35 <= reg44;
          reg36 <= $unsigned($signed(reg36[(1'h0):(1'h0)]));
        end
      if ((^reg39[(5'h10):(4'ha)]))
        begin
          if ($unsigned(reg35))
            begin
              reg48 <= reg37;
              reg49 <= $unsigned((~^reg42[(4'ha):(2'h2)]));
              reg50 <= wire31;
              reg51 <= (^~(-$unsigned(reg50[(3'h5):(2'h2)])));
            end
          else
            begin
              reg48 <= ($unsigned($unsigned($unsigned($signed((8'hb8))))) ?
                  reg36[(2'h3):(2'h3)] : ($unsigned(reg46) ?
                      $unsigned({(-reg48)}) : ($unsigned((reg50 ?
                          (8'hba) : wire30)) ^~ $signed((-reg48)))));
              reg49 <= wire30[(3'h7):(2'h3)];
              reg50 <= $signed((reg49[(4'he):(3'h5)] ?
                  ($unsigned($signed(reg47)) ?
                      ((+wire32) ?
                          $unsigned(reg34) : $signed((8'hb4))) : (!(|(8'hb5)))) : (($signed(reg42) ?
                          {wire30} : $signed(reg41)) ?
                      wire33 : reg39)));
              reg51 <= (~^(~^$unsigned((reg36[(3'h4):(1'h0)] ?
                  $signed(reg37) : (wire31 == reg34)))));
            end
          if ($unsigned(($unsigned(reg35[(4'hd):(3'h7)]) * (reg45 == $signed($signed(reg48))))))
            begin
              reg52 <= (-{(($signed(wire31) ^ (~(8'ha8))) ~^ ($signed(reg34) & (~^reg36)))});
              reg53 <= $signed(reg48);
              reg54 <= wire32[(3'h4):(1'h0)];
              reg55 <= (reg37[(3'h5):(2'h2)] ?
                  (-{(&(wire31 ^ reg50))}) : {$unsigned($signed((~&reg52))),
                      wire32});
              reg56 <= $signed($signed($signed((wire31 ?
                  $unsigned(reg51) : reg54))));
            end
          else
            begin
              reg52 <= $unsigned($signed($unsigned($signed((reg42 ?
                  reg42 : reg36)))));
              reg53 <= (8'hbf);
              reg54 <= $unsigned($unsigned(reg46));
              reg55 <= reg49;
              reg56 <= (reg38 || $signed($unsigned(reg46)));
            end
        end
      else
        begin
          reg48 <= (reg44 ? (-reg56[(1'h0):(1'h0)]) : reg34[(2'h2):(2'h2)]);
          reg49 <= $signed({wire31[(4'h9):(3'h5)]});
          if ({reg49[(2'h2):(1'h0)],
              $signed((reg44 ?
                  $unsigned(((8'hb6) ?
                      wire33 : reg43)) : $signed((wire30 != reg43))))})
            begin
              reg50 <= (reg39[(4'ha):(1'h1)] < $signed(reg39[(3'h6):(3'h5)]));
              reg51 <= reg50[(4'he):(1'h1)];
              reg52 <= $signed($unsigned(wire32[(3'h4):(1'h1)]));
              reg53 <= reg48;
              reg54 <= (-reg38[(4'h8):(1'h0)]);
            end
          else
            begin
              reg50 <= ($signed((((reg35 <= reg39) << reg38) > ((wire31 ?
                          reg40 : reg49) ?
                      ((8'hb4) >= reg49) : ((8'h9f) == reg47)))) ?
                  reg42[(3'h7):(3'h5)] : reg37[(2'h3):(1'h1)]);
              reg51 <= wire30[(4'h8):(2'h2)];
            end
          reg55 <= {reg34,
              ((^~(-{reg49, (7'h42)})) ?
                  (^((reg40 != reg48) ?
                      $signed(reg48) : {reg51,
                          reg41})) : wire31[(2'h2):(2'h2)])};
          reg56 <= {$unsigned(reg37[(3'h6):(1'h1)]), reg56};
        end
      if (reg44)
        begin
          reg57 <= $unsigned(((+(&reg49)) ~^ $signed(reg41[(2'h2):(1'h0)])));
          if (($signed((~|{reg46[(3'h5):(2'h2)], $unsigned(reg52)})) ?
              (((((8'h9e) ? reg51 : wire31) <= (reg38 ^ reg56)) ?
                      reg45 : reg56[(4'hd):(2'h2)]) ?
                  $unsigned({$unsigned(reg34),
                      $unsigned(reg57)}) : ((~|(wire32 ?
                      reg41 : (8'ha7))) * (+$signed((8'hb6))))) : reg36))
            begin
              reg58 <= (8'ha8);
              reg59 <= wire31[(2'h2):(1'h1)];
            end
          else
            begin
              reg58 <= (($signed({(wire33 ? wire32 : reg40),
                      (!reg49)}) || $unsigned($signed((reg37 == reg44)))) ?
                  reg52[(1'h0):(1'h0)] : {(^~$unsigned($unsigned(reg52))),
                      reg36});
              reg59 <= ($signed(($signed($unsigned(reg57)) != {(reg49 * reg34)})) ?
                  (8'hbf) : reg38);
            end
          reg60 <= {((8'hab) ? reg59 : reg52),
              ({((8'ha8) * reg50[(3'h6):(1'h1)])} ?
                  $unsigned($signed((~^reg39))) : {((^~reg47) <<< $signed((8'haf))),
                      reg50})};
          if ($unsigned(reg39[(4'h9):(4'h9)]))
            begin
              reg61 <= $unsigned((reg47[(2'h2):(1'h1)] ~^ wire32[(1'h0):(1'h0)]));
            end
          else
            begin
              reg61 <= ((reg38 ?
                  reg47[(1'h0):(1'h0)] : ((^reg42[(1'h1):(1'h0)]) ~^ {{wire31,
                          reg36}})) * $signed(reg47[(3'h4):(3'h4)]));
              reg62 <= reg38[(1'h1):(1'h0)];
              reg63 <= $unsigned(({$unsigned((reg44 ? wire31 : reg44)),
                      {reg40, $unsigned(reg43)}} ?
                  (~&((-reg37) ?
                      $unsigned(reg54) : reg53)) : ((~$unsigned(wire33)) ?
                      $signed((+reg43)) : $signed((&reg54)))));
            end
        end
      else
        begin
          reg57 <= reg39;
          reg58 <= (reg34[(3'h5):(2'h2)] + (~({(reg43 ? reg48 : reg56),
              (!reg39)} >= $unsigned(reg45[(2'h2):(1'h0)]))));
          reg59 <= (^~(($signed($signed((8'hac))) ?
              (reg46 <<< {reg42}) : ((wire32 << reg59) ?
                  reg60[(4'h9):(1'h0)] : (reg34 - reg63))) < ($unsigned(reg56) ?
              $unsigned(reg53[(3'h7):(1'h1)]) : (+(reg41 ? wire33 : reg39)))));
          reg60 <= (((^($unsigned(reg34) + $signed(reg60))) - reg36[(4'h9):(2'h3)]) ?
              $signed(reg55) : (+$unsigned((^~(~|(8'h9c))))));
        end
      reg64 <= reg47[(2'h2):(1'h0)];
    end
  assign wire65 = {reg40,
                      ($unsigned(($signed(reg55) ?
                          $unsigned(reg38) : {reg39})) == ($signed($unsigned(reg61)) & ((reg48 ?
                          reg42 : reg46) ^~ reg44[(5'h11):(2'h2)])))};
  module66 #() modinst87 (wire86, clk, reg51, reg35, reg40, reg38, reg36);
  assign wire88 = (($signed((7'h44)) ?
                          $unsigned((reg62[(2'h3):(1'h0)] <<< ((8'hb9) & wire86))) : $signed($unsigned((reg34 ?
                              reg51 : reg57)))) ?
                      (((reg44[(5'h11):(3'h5)] && (8'ha2)) & (-reg46[(4'h8):(1'h0)])) ?
                          (~((+reg61) & $signed(reg50))) : ($signed((reg38 ?
                                  reg37 : reg63)) ?
                              (reg61 ?
                                  (!(8'hae)) : reg55[(1'h0):(1'h0)]) : $unsigned(reg53))) : reg37);
  assign wire89 = reg49[(4'ha):(3'h5)];
  assign wire90 = $unsigned($unsigned(((~|(wire31 ? reg57 : wire30)) ^ reg45)));
  assign wire91 = ($unsigned($signed($signed((reg51 == reg55)))) | (|reg40[(3'h7):(3'h4)]));
  always
    @(posedge clk) begin
      if (reg53)
        begin
          reg92 <= (($unsigned((-(wire89 != reg38))) ?
                  (~{$unsigned((8'hb3)),
                      (reg56 > wire31)}) : reg41[(2'h2):(1'h0)]) ?
              (reg37 > reg53) : (reg39 << wire86[(2'h3):(1'h0)]));
          reg93 <= {$signed((^$signed($unsigned(reg57))))};
          reg94 <= reg59[(3'h7):(3'h4)];
          reg95 <= ($signed(reg92[(2'h2):(1'h1)]) <<< $unsigned(reg56));
        end
      else
        begin
          reg92 <= (reg94[(3'h7):(3'h6)] ^~ ($unsigned(wire89) <= (&($signed(wire31) ?
              $signed((8'hb0)) : $unsigned(reg55)))));
          reg93 <= $unsigned(wire90);
          reg94 <= {reg48};
          reg95 <= reg43[(1'h1):(1'h0)];
          reg96 <= (reg34[(3'h4):(2'h2)] ?
              reg95 : $unsigned((reg62[(1'h1):(1'h0)] ?
                  ({reg40, reg46} ?
                      (~|(8'h9c)) : (wire30 <<< reg50)) : reg40)));
        end
      reg97 <= (|reg51);
      reg98 <= (+$signed($unsigned({((8'hbf) || (8'ha1)),
          ((8'ha4) ? reg63 : wire91)})));
      reg99 <= $signed($unsigned(reg62));
    end
  assign wire100 = reg57[(4'ha):(3'h6)];
  assign wire101 = reg58[(3'h4):(1'h0)];
  assign wire102 = {$signed(reg61[(4'hf):(4'hb)])};
endmodule

module module66
#(parameter param85 = {((-(~|(+(8'hb7)))) <= (((|(8'ha8)) < ((8'hb9) ? (8'hab) : (8'ha2))) ? ((!(8'hb3)) << ((8'h9e) || (8'hb2))) : (^((8'hb6) ? (8'hab) : (7'h41)))))})
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire71;
  input wire signed [(5'h10):(1'h0)] wire70;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire72 = ((~^($signed((!wire69)) ?
                          ({wire70} >> (wire67 ^~ wire71)) : (8'hb0))) ?
                      $signed((8'hb5)) : (|wire70));
  assign wire73 = ($unsigned(wire69[(2'h2):(1'h0)]) < ($unsigned($signed((~&wire70))) ?
                      ($signed(wire69) ? (&wire67) : wire70) : (^(-(wire68 ?
                          wire67 : wire69)))));
  assign wire74 = $signed($unsigned((wire69[(2'h2):(1'h1)] ?
                      (((7'h44) ? wire70 : wire67) ?
                          $unsigned(wire67) : $unsigned(wire73)) : {wire69})));
  assign wire75 = $unsigned((wire73[(2'h3):(1'h0)] - (^$unsigned(((8'hae) && wire74)))));
  always
    @(posedge clk) begin
      reg76 <= wire71[(2'h2):(1'h0)];
      reg77 <= wire72[(2'h2):(2'h2)];
      reg78 <= wire75;
      reg79 <= ((wire71[(1'h1):(1'h1)] > $unsigned(reg76)) ?
          $signed(($unsigned((-wire72)) != wire73)) : (^~{(((8'hbe) || wire69) >> {wire73,
                  wire67})}));
      reg80 <= (8'hb0);
    end
  assign wire81 = (|$signed({(wire75 >>> {wire70, reg77}), (8'hbb)}));
  assign wire82 = ((({$signed(reg79)} < (+(wire73 ? wire72 : wire73))) ?
                          ($unsigned({reg79}) >>> $unsigned((wire70 && wire74))) : wire74[(4'he):(3'h7)]) ?
                      reg77[(3'h4):(3'h4)] : $signed($unsigned({$signed(wire73),
                          (wire70 == wire69)})));
  assign wire83 = (reg78[(5'h12):(4'h8)] ?
                      (((^$unsigned(wire75)) <= wire82) ?
                          (!({wire72,
                              reg78} ^ wire70[(3'h6):(2'h2)])) : $signed($signed(reg77[(4'h9):(2'h2)]))) : $unsigned(($unsigned(wire70) ?
                          ($signed(wire69) + wire68) : ($signed(wire71) ?
                              (|wire74) : {reg76, wire67}))));
  assign wire84 = ((wire83 ?
                      {($unsigned(wire81) ?
                              wire67[(4'he):(4'hd)] : $unsigned(reg79)),
                          {reg80}} : $signed($unsigned($unsigned(reg78)))) ~^ ($unsigned($signed(reg79[(1'h1):(1'h0)])) ^ (-wire71[(1'h1):(1'h1)])));
endmodule
