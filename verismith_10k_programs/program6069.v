module top
#(parameter param115 = (-((&((~&(8'h9c)) >> (!(7'h41)))) ? ((~&{(8'ha2), (8'ha8)}) ? (+((8'hb6) ? (8'h9c) : (8'hb3))) : ({(8'hb9)} ? ((8'hb4) ? (8'h9c) : (8'hab)) : (&(8'ha1)))) : (((^~(8'ha9)) ? ((8'hb4) ? (8'hbc) : (8'hbe)) : ((8'hb0) ? (8'hb7) : (8'hbb))) & (8'hbb)))), 
parameter param116 = (^(param115 >>> {param115, (-(param115 + param115))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire signed [(3'h5):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire114,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire34,
                 wire33,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg36,
                 reg35,
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
                 reg19,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((+{{(!((8'hbc) ? wire0 : wire0))},
          (wire4 << ((^wire4) | (wire1 <= wire0)))}))
        begin
          reg5 <= $unsigned((-((^~$signed(wire3)) ?
              wire4[(3'h5):(1'h0)] : $unsigned(((8'hab) ~^ wire1)))));
          if ((^reg5))
            begin
              reg6 <= (wire3 ?
                  (wire2[(4'hf):(4'hd)] < $unsigned((-$signed(wire4)))) : (+wire1[(2'h3):(1'h0)]));
            end
          else
            begin
              reg6 <= {($signed(wire1) & wire2[(4'hd):(3'h6)])};
              reg7 <= wire4[(1'h0):(1'h0)];
              reg8 <= $unsigned($unsigned(wire0[(3'h7):(1'h0)]));
              reg9 <= $signed(($unsigned(reg8) ^~ ({(reg7 || (8'ha7))} ?
                  ((reg7 ?
                      reg5 : reg7) && (reg5 * reg8)) : $signed(wire2[(4'hf):(2'h3)]))));
            end
          if ($signed((({$unsigned((8'ha9)),
                  $unsigned(reg6)} >> ((+reg6) >>> (reg7 ? (7'h43) : reg7))) ?
              {$signed((reg9 ? reg8 : reg8)),
                  ($unsigned(reg8) && $signed(wire4))} : wire4)))
            begin
              reg10 <= (($unsigned((^~{wire0, (8'h9e)})) ?
                      (wire1[(1'h0):(1'h0)] * $unsigned(((8'ha7) > (8'hb1)))) : $unsigned(wire3[(4'hd):(4'hd)])) ?
                  (+(|$signed((~(8'h9e))))) : $unsigned((wire0[(1'h0):(1'h0)] > reg7)));
              reg11 <= (reg5 <<< ((~^((+wire4) ? (8'h9d) : $signed(reg9))) ?
                  ((|$unsigned((8'hbd))) ?
                      $signed(reg7[(3'h4):(2'h3)]) : {(wire0 ? (8'hac) : reg6),
                          (reg7 ?
                              reg6 : reg6)}) : (wire1 >> ($unsigned(wire0) <= $unsigned(wire0)))));
              reg12 <= $unsigned((|{((reg9 + reg9) ?
                      ((8'hb3) ? wire2 : wire3) : {reg5, reg11}),
                  reg11}));
              reg13 <= ((8'hb6) ?
                  (((reg9 ? (reg7 - wire3) : (^~reg7)) ?
                          (wire4[(3'h6):(1'h0)] >>> (-reg9)) : reg7) ?
                      reg6 : $signed((~^$signed(reg8)))) : $unsigned(wire2[(2'h3):(1'h1)]));
            end
          else
            begin
              reg10 <= ($unsigned(reg6) ? reg5[(2'h2):(1'h1)] : (8'hb0));
              reg11 <= reg13[(4'h9):(3'h6)];
            end
        end
      else
        begin
          reg5 <= reg12[(4'he):(4'h8)];
          reg6 <= $unsigned({(~^((reg10 ^ wire3) - (reg10 ? wire1 : wire2))),
              (~|(((8'hbd) ? reg13 : wire1) ? (^reg10) : $unsigned(wire2)))});
          reg7 <= $signed($signed(({$unsigned((8'hb6)), reg8} ?
              ((wire3 ? reg12 : reg7) ?
                  $unsigned(reg9) : {wire3, reg5}) : reg6[(2'h2):(2'h2)])));
          reg8 <= (^~((&$unsigned((reg8 >> reg10))) != ($unsigned(reg10) ~^ wire2)));
          reg9 <= reg7;
        end
      reg14 <= reg10[(4'h9):(4'h9)];
    end
  assign wire15 = ((~^reg14) ?
                      wire1[(2'h3):(2'h3)] : ($unsigned(wire0) >>> reg8));
  assign wire16 = (&$unsigned((~^(~&(8'haa)))));
  assign wire17 = (~&(&reg10[(4'hd):(2'h3)]));
  assign wire18 = wire17[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg19 <= (^~(8'ha8));
      if ($signed(((reg10 * reg7) && $signed((~^wire15[(4'h8):(3'h7)])))))
        begin
          if (((~|$signed(reg10)) <<< (|$signed(((8'ha4) >> reg9[(2'h3):(1'h1)])))))
            begin
              reg20 <= (($signed(($unsigned((8'hbb)) ?
                  (wire2 ?
                      reg14 : wire0) : (wire3 <= wire2))) != {$unsigned($signed(wire4))}) ^~ $unsigned(reg6));
              reg21 <= (!wire3[(1'h0):(1'h0)]);
            end
          else
            begin
              reg20 <= reg7;
              reg21 <= reg19;
              reg22 <= $unsigned(reg19[(1'h0):(1'h0)]);
              reg23 <= ($signed(reg14) ? reg14 : $unsigned(reg12));
            end
          reg24 <= $signed((wire15 ? {(&{wire18, reg8}), wire16} : {reg21}));
          reg25 <= reg8;
          if ($unsigned(reg19[(1'h0):(1'h0)]))
            begin
              reg26 <= {wire1};
              reg27 <= $unsigned($signed(reg21));
            end
          else
            begin
              reg26 <= (8'ha7);
              reg27 <= $signed($unsigned($unsigned(($signed((8'hae)) ?
                  {reg20, reg12} : $signed(wire18)))));
              reg28 <= (wire2 || (($signed($signed(wire17)) <<< $signed((^wire15))) ?
                  wire15[(1'h0):(1'h0)] : (!wire16)));
            end
          reg29 <= ((reg5 || {{$signed(reg26)},
              reg24}) ^ (($unsigned(wire4[(2'h3):(1'h1)]) ~^ reg14) ^~ reg24));
        end
      else
        begin
          reg20 <= $signed($unsigned((~$unsigned((^wire18)))));
          reg21 <= (((!(wire17 < $unsigned(reg23))) != $signed((&reg28))) ?
              $signed((reg7 ?
                  (8'hbd) : reg13[(4'hc):(1'h0)])) : $unsigned(($signed(reg14) <= {$signed(reg6)})));
          reg22 <= reg19;
          if ((wire2[(4'hc):(4'hb)] - {(^wire1)}))
            begin
              reg23 <= {(8'hb9),
                  {($signed(reg10) >> ((wire1 ? reg12 : (8'ha4)) ?
                          reg22[(4'ha):(2'h3)] : (wire17 ? reg28 : (8'hb2))))}};
              reg24 <= (wire4 | $unsigned(reg13[(4'h8):(1'h1)]));
              reg25 <= $signed((&(&wire15[(1'h0):(1'h0)])));
              reg26 <= $signed(((8'h9f) ?
                  (8'hac) : (reg25[(4'h8):(3'h7)] & reg27[(4'h9):(1'h1)])));
              reg27 <= ($unsigned($signed(wire17)) << $signed((reg9[(2'h2):(2'h2)] ?
                  ((wire15 ? reg5 : reg14) * (8'hac)) : (~|{wire16}))));
            end
          else
            begin
              reg23 <= ((wire0[(3'h4):(2'h2)] & reg6) ?
                  ($signed(($signed(wire2) | reg5[(3'h7):(1'h1)])) <= ((8'h9f) ?
                      $signed((wire17 ? (8'hae) : reg29)) : (wire1 ?
                          $signed(reg19) : wire2))) : $signed($unsigned((wire1 ?
                      (reg7 != reg25) : $unsigned(reg20)))));
              reg24 <= reg13[(4'hb):(3'h7)];
            end
          if (reg24[(2'h3):(2'h3)])
            begin
              reg28 <= wire2[(4'hd):(4'hb)];
              reg29 <= ({$signed(reg7[(3'h4):(1'h0)])} ?
                  (~&reg10[(3'h5):(2'h2)]) : reg8);
            end
          else
            begin
              reg28 <= $unsigned((7'h44));
              reg29 <= (-reg5);
              reg30 <= (~^{(8'ha0), wire4});
            end
        end
      reg31 <= $unsigned(reg6);
      reg32 <= $unsigned(wire3);
    end
  assign wire33 = (~|$signed(((~&reg5[(2'h3):(2'h3)]) ?
                      (reg10[(5'h14):(5'h10)] >>> wire3[(4'he):(4'he)]) : (+$unsigned(reg24)))));
  assign wire34 = (wire33[(3'h4):(2'h2)] + (^{reg26, reg9}));
  always
    @(posedge clk) begin
      reg35 <= ($signed($unsigned(reg22)) ?
          wire2 : $unsigned(((!{reg7}) ?
              $signed((reg14 & (8'h9e))) : (!(+wire4)))));
      reg36 <= ((~&reg12) < reg35);
    end
  module37 #() modinst97 (.clk(clk), .wire40(reg12), .y(wire96), .wire39(reg35), .wire38(wire0), .wire41(wire33));
  assign wire98 = $unsigned($signed({((reg14 * wire96) <= {(8'hb1)})}));
  assign wire99 = $unsigned(wire17[(3'h4):(2'h2)]);
  assign wire100 = $signed(reg28[(1'h0):(1'h0)]);
  assign wire101 = ((((8'hba) ? {$signed(reg5)} : wire17[(2'h2):(1'h1)]) ?
                           {$signed({reg5})} : reg25[(4'he):(2'h2)]) ?
                       reg7 : (!$unsigned($unsigned({wire3}))));
  always
    @(posedge clk) begin
      reg102 <= $unsigned(((~($signed((7'h41)) ?
          reg23[(2'h3):(1'h0)] : reg11[(3'h5):(3'h4)])) << wire98[(2'h2):(1'h0)]));
      if ({($unsigned(wire3[(4'hb):(4'ha)]) ?
              ($unsigned((reg28 ^ reg12)) + ((wire99 ?
                  wire0 : wire18) < $signed(wire96))) : (reg31 ?
                  $unsigned((!reg25)) : reg6[(3'h4):(2'h2)]))})
        begin
          reg103 <= (~&$unsigned((-(~&(reg25 != wire15)))));
        end
      else
        begin
          if ($signed($unsigned($signed((~{wire101, reg31})))))
            begin
              reg103 <= {(!wire18)};
              reg104 <= (((wire100 >>> (!$unsigned((7'h43)))) ?
                      {$unsigned(reg25)} : (+wire15)) ?
                  reg21[(4'he):(3'h5)] : $unsigned((reg5 ?
                      reg7[(1'h0):(1'h0)] : $unsigned(wire18))));
              reg105 <= $signed({($signed($signed(reg36)) || (!reg35)),
                  (wire1 > $signed((reg10 | reg24)))});
              reg106 <= reg14[(3'h7):(3'h5)];
              reg107 <= reg9;
            end
          else
            begin
              reg103 <= wire2;
              reg104 <= reg107[(3'h6):(3'h4)];
            end
        end
      if ((|wire2))
        begin
          reg108 <= (({(~|$signed(reg19))} != (~^$signed((&reg31)))) ?
              (+((reg30[(4'h9):(3'h5)] & $signed(wire2)) >= $signed((~&wire17)))) : ((~&$signed($signed(reg20))) ?
                  wire16 : $signed(({wire101, reg8} + {wire4, wire17}))));
          reg109 <= $unsigned($signed((-($unsigned(wire3) ?
              ((7'h40) ? reg30 : wire34) : (wire33 ? reg107 : wire18)))));
        end
      else
        begin
          if (reg8)
            begin
              reg108 <= (+(^~($unsigned(reg102) != ((^~wire15) ?
                  $signed(wire34) : ((8'ha2) ? reg35 : wire17)))));
              reg109 <= (!(!{$unsigned({reg106, reg13})}));
            end
          else
            begin
              reg108 <= {{(reg13 ?
                          reg108[(3'h7):(2'h3)] : {(wire96 ^~ reg29),
                              $unsigned(reg103)})},
                  $unsigned(((8'h9e) <<< $signed((reg29 && (8'hb3)))))};
              reg109 <= (~&reg11);
              reg110 <= (((wire100 <<< ($unsigned(reg7) ?
                  $signed(reg6) : wire33)) ^~ (^~$signed(reg13[(3'h7):(3'h6)]))) & wire99);
              reg111 <= ((8'hbd) ?
                  ({$unsigned(reg108[(1'h0):(1'h0)])} > wire98) : ({($unsigned((8'hbd)) ?
                          (wire98 ? reg20 : reg26) : (wire17 ? reg108 : reg7)),
                      {$unsigned(reg102)}} && {($unsigned(reg21) && $signed(reg32)),
                      reg105}));
              reg112 <= reg5[(3'h4):(2'h3)];
            end
          reg113 <= ((-(((reg103 + reg8) < $signed((8'hbe))) ?
              (~reg20[(4'h8):(3'h5)]) : {(wire34 <= (8'hb6))})) != {$unsigned($signed((reg107 >= reg19)))});
        end
    end
  assign wire114 = $signed((wire1[(1'h0):(1'h0)] ? reg12 : reg5));
endmodule

module module37
#(parameter param95 = {((!(((8'had) ^~ (8'hbb)) ^ ((8'hb0) ? (8'haa) : (7'h43)))) ? ((((8'hbc) ? (8'ha7) : (8'h9f)) >>> (~(7'h44))) ? ((-(8'hbf)) != ((8'hac) || (7'h41))) : (((8'hb3) ^~ (8'ha2)) ? ((8'hbf) ? (8'h9f) : (8'ha8)) : ((8'hbe) * (8'haa)))) : (((+(8'hbd)) ? {(8'hb7)} : (-(8'hb3))) ? (~^((8'hae) == (8'ha1))) : (8'hb8)))})
(y, clk, wire38, wire39, wire40, wire41);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire [(5'h13):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire79;
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire89,
                 wire88,
                 wire87,
                 wire42,
                 wire43,
                 wire79,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire42 = wire40;
  assign wire43 = ($unsigned($unsigned($unsigned(wire38[(1'h0):(1'h0)]))) & wire38);
  module44 #() modinst80 (wire79, clk, wire38, wire40, wire39, wire41, wire43);
  always
    @(posedge clk) begin
      if (($unsigned($signed($signed($unsigned(wire41)))) < (wire43 * $unsigned($unsigned($unsigned(wire42))))))
        begin
          reg81 <= $signed((8'hbc));
        end
      else
        begin
          if ($unsigned((wire79[(3'h7):(2'h2)] ?
              (wire43[(3'h5):(2'h3)] ?
                  (wire39[(1'h0):(1'h0)] ?
                      (wire39 << wire38) : {wire42,
                          wire42}) : (reg81[(2'h3):(2'h2)] ?
                      (wire41 < (8'hb4)) : (wire40 ?
                          wire41 : wire43))) : (!((wire38 != reg81) << (wire40 ?
                  wire42 : (8'hba)))))))
            begin
              reg81 <= $signed($unsigned(($signed((wire43 ~^ wire39)) - wire42[(2'h3):(1'h1)])));
              reg82 <= ($signed(((~|(8'ha1)) ?
                      (~^wire42) : $unsigned((wire39 ? reg81 : wire43)))) ?
                  reg81[(1'h1):(1'h0)] : (((wire43 >>> $signed(wire39)) ?
                          wire42 : $unsigned((7'h40))) ?
                      $signed({((8'hb7) ?
                              wire38 : wire41)}) : (wire39 ^ {$signed((8'ha1))})));
              reg83 <= $signed($unsigned((~&wire41[(4'hf):(2'h3)])));
              reg84 <= $unsigned($unsigned(((reg82[(3'h7):(3'h4)] || {reg83}) >> $signed({reg82}))));
            end
          else
            begin
              reg81 <= {$signed(wire79)};
              reg82 <= (&$signed($signed((wire79 ?
                  $unsigned(wire40) : $unsigned(reg84)))));
              reg83 <= wire42;
            end
        end
      reg85 <= wire43;
      reg86 <= (($signed(reg84[(3'h4):(2'h3)]) ?
          reg83[(4'he):(4'hd)] : (({wire41} ? (-reg82) : (|(8'hac))) ?
              (((8'hb8) ? reg83 : reg85) ?
                  (^~wire40) : $signed(reg83)) : (wire79 * wire41[(2'h2):(1'h0)]))) >= (wire38[(5'h12):(5'h11)] ?
          ((!$signed(reg85)) >= $signed((wire38 ?
              reg81 : wire38))) : $unsigned((wire38 ?
              wire38[(4'ha):(1'h0)] : {reg81, wire41}))));
    end
  assign wire87 = (wire79[(2'h2):(1'h1)] ?
                      ($signed({$signed((8'hae))}) ?
                          wire41[(5'h11):(3'h4)] : $signed($signed({wire40,
                              wire40}))) : wire79);
  assign wire88 = {(~|reg84)};
  assign wire89 = ((^(~|wire88)) < (&$signed($signed(reg86[(4'hf):(1'h1)]))));
  always
    @(posedge clk) begin
      reg90 <= (reg81 == ({(^~(wire39 ? wire88 : reg83)), reg85} ?
          (^{(wire88 <<< (8'ha7))}) : wire87));
      reg91 <= ($unsigned(reg81) < (reg90[(4'h8):(1'h0)] ?
          reg84[(4'h8):(1'h0)] : (&$signed($signed((8'hae))))));
    end
  assign wire92 = ((~^$signed((^((7'h41) ? wire79 : wire89)))) ?
                      $signed((((~&reg81) ?
                          (|wire41) : (&reg83)) ~^ $unsigned((reg82 >>> wire41)))) : wire42);
  assign wire93 = ((~|reg81[(2'h2):(1'h0)]) & reg83);
  assign wire94 = wire89;
endmodule

module module44
#(parameter param77 = (~&((8'hbf) ? (((~(8'hb3)) ? {(7'h42), (8'hbc)} : ((8'ha8) | (8'h9f))) ? ({(7'h42)} ? (!(8'hb7)) : ((8'hbb) ? (8'h9e) : (8'hb8))) : (^~((8'hbe) ? (7'h42) : (8'ha7)))) : (+{{(7'h40)}, ((8'hb1) ^ (8'hb7))}))), 
parameter param78 = param77)
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire signed [(3'h7):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire51,
                 wire50,
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
                 reg52,
                 (1'h0)};
  assign wire50 = ((-(~|$unsigned($unsigned(wire49)))) ?
                      $signed({{(|wire47), $signed(wire47)},
                          ((!wire47) | $signed(wire45))}) : $unsigned(wire49[(1'h1):(1'h1)]));
  assign wire51 = wire48[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg52 <= wire50;
      reg53 <= ($unsigned(($unsigned($signed(wire48)) ^~ reg52)) ?
          wire51 : $unsigned({($signed((8'hab)) | $signed(wire46))}));
    end
  always
    @(posedge clk) begin
      if (wire51[(1'h0):(1'h0)])
        begin
          reg54 <= $signed((wire51[(2'h3):(1'h0)] | $unsigned($signed((&reg53)))));
          reg55 <= (((wire51[(3'h7):(2'h2)] * reg53[(4'hb):(3'h5)]) - wire48) <<< $unsigned($signed(({wire49} ?
              (wire50 == wire47) : (wire48 ? wire49 : wire47)))));
          reg56 <= wire50[(4'ha):(3'h7)];
          if ($unsigned(($signed($unsigned((!(8'hbb)))) ?
              wire46 : $unsigned(wire48))))
            begin
              reg57 <= reg56[(3'h7):(2'h2)];
              reg58 <= $signed($unsigned((reg57 ?
                  ((~|(7'h43)) * wire49) : (^$unsigned(reg54)))));
              reg59 <= $unsigned(((|$unsigned(wire50[(2'h2):(1'h0)])) ?
                  $unsigned(((wire47 ?
                      wire48 : wire47) + wire50)) : $signed(($signed((7'h42)) ?
                      $signed(reg53) : {wire51, reg54}))));
            end
          else
            begin
              reg57 <= ((|wire45) * wire47[(3'h6):(3'h5)]);
              reg58 <= reg59;
              reg59 <= $unsigned(((8'ha9) ?
                  {$signed($signed(reg53)),
                      $signed(wire48)} : ($signed($unsigned((8'hb4))) ?
                      wire45 : $signed($unsigned(wire47)))));
              reg60 <= $signed((wire49 && wire49));
            end
          if ((^reg54[(4'hd):(4'hd)]))
            begin
              reg61 <= (reg59[(1'h0):(1'h0)] ?
                  ((wire50 == {(^~wire49)}) - wire47[(2'h3):(1'h0)]) : wire49[(4'hc):(3'h7)]);
            end
          else
            begin
              reg61 <= ((wire49 ?
                  (wire49 ?
                      (~$signed((8'ha4))) : {reg61}) : (^($signed(wire48) ?
                      ((8'ha6) ^ reg59) : $unsigned(reg54)))) >= (wire45[(1'h0):(1'h0)] < $unsigned((~wire47))));
              reg62 <= (^~($unsigned({wire50,
                  {wire47}}) >> $unsigned($signed(reg53[(3'h5):(2'h2)]))));
              reg63 <= ((reg56 <<< (((~wire51) ? reg59 : {wire46, wire46}) ?
                  ($unsigned(reg59) > $unsigned(reg59)) : ((wire48 ?
                          reg62 : wire47) ?
                      (+(8'hb6)) : reg60[(3'h5):(2'h3)]))) ^ ($signed({$signed(wire51),
                  $unsigned(wire51)}) ^~ ((reg58[(4'h8):(2'h2)] ?
                      (~(8'hb6)) : wire48) ?
                  reg62[(1'h0):(1'h0)] : reg58[(3'h5):(3'h5)])));
              reg64 <= $unsigned(($unsigned((reg58[(4'h9):(1'h0)] > (reg58 >>> reg60))) ?
                  (reg52[(3'h4):(1'h0)] ?
                      ((&reg57) ^ wire48[(3'h5):(1'h1)]) : (~&(!reg56))) : ($signed($unsigned(reg57)) == $unsigned(reg58[(4'h9):(4'h9)]))));
              reg65 <= (8'ha1);
            end
        end
      else
        begin
          reg54 <= {reg54[(4'hb):(4'h9)]};
          reg55 <= ((reg63 >= (~&(-{reg58}))) <<< (-{($unsigned(wire46) ?
                  reg61[(4'h8):(2'h2)] : reg52),
              ($signed(wire46) ^ (wire49 ? reg61 : wire51))}));
          reg56 <= reg58;
          reg57 <= $signed((-(8'hb8)));
          if (reg53)
            begin
              reg58 <= $unsigned($unsigned(reg53[(2'h2):(1'h0)]));
              reg59 <= ($signed({wire49[(5'h12):(4'hf)],
                      reg58[(4'hd):(4'hb)]}) ?
                  {(-(~&(wire47 <<< (8'ha2))))} : ($signed((wire47 ?
                          $signed((8'had)) : reg56)) ?
                      (^{(^reg56),
                          (reg59 ? wire47 : wire50)}) : {$unsigned((reg62 ?
                              reg62 : (8'hb2)))}));
              reg60 <= $unsigned((~reg60[(4'h9):(2'h2)]));
              reg61 <= wire50;
            end
          else
            begin
              reg58 <= $unsigned(reg55);
              reg59 <= ((&(reg56[(4'h8):(3'h7)] ?
                  $unsigned((wire48 ?
                      reg59 : wire50)) : (~$unsigned(reg58)))) * reg65[(3'h4):(1'h0)]);
              reg60 <= $unsigned($unsigned($signed(reg59)));
              reg61 <= ($signed((~reg64[(3'h5):(2'h3)])) >= reg62[(2'h2):(1'h0)]);
              reg62 <= $unsigned($unsigned(reg54));
            end
        end
      reg66 <= ($unsigned($signed(reg55[(3'h4):(3'h4)])) ?
          (-$signed($signed({wire45, reg58}))) : reg52);
      reg67 <= reg58;
    end
  always
    @(posedge clk) begin
      reg68 <= reg61[(1'h0):(1'h0)];
      reg69 <= reg61;
    end
  assign wire70 = {wire49[(4'he):(1'h1)], reg54};
  assign wire71 = wire46;
  assign wire72 = ({$unsigned({reg64[(4'he):(3'h6)]})} && reg65);
  assign wire73 = (-reg56);
  assign wire74 = ($signed(reg60[(3'h7):(3'h4)]) < (~&reg66[(4'hb):(2'h2)]));
  assign wire75 = wire71;
  assign wire76 = (reg60 ? $signed(reg61) : reg52[(3'h4):(2'h3)]);
endmodule
