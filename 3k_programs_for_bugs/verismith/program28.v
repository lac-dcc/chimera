module top
#(parameter param144 = (^((~|((~|(8'hbf)) || {(8'hb6)})) ? (^(((8'ha1) ? (8'hbd) : (8'haf)) >= ((7'h43) ? (8'hab) : (7'h43)))) : ((^~{(8'hbc), (7'h43)}) < (((8'hbc) ? (8'hb5) : (8'hac)) || ((8'ha5) * (8'hac)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire131;
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire133,
                 wire4,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire131,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg20,
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
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned({(8'ha3)}));
  always
    @(posedge clk) begin
      if ((&$unsigned((+((8'hbd) ? wire1 : (+wire0))))))
        begin
          if ((!(~^(wire4[(5'h11):(1'h1)] * $unsigned((wire0 == wire4))))))
            begin
              reg5 <= ((7'h42) ^~ {(wire2[(1'h1):(1'h1)] ?
                      $signed((!wire3)) : $signed((~wire3)))});
              reg6 <= ($signed(wire0[(1'h1):(1'h0)]) + $unsigned({$signed((wire3 ?
                      (8'ha3) : wire4))}));
              reg7 <= reg6;
            end
          else
            begin
              reg5 <= $unsigned((~&((~(wire4 == (8'hb5))) ?
                  $signed(((8'hbd) ^~ wire0)) : $signed((wire0 ?
                      wire1 : reg7)))));
              reg6 <= ((~&($unsigned(reg7) ? (!(~|wire0)) : $unsigned(reg5))) ?
                  $unsigned($signed($unsigned((reg5 ?
                      wire2 : wire0)))) : {wire4[(3'h5):(2'h2)]});
              reg7 <= wire4[(1'h0):(1'h0)];
              reg8 <= (^$unsigned({{wire4[(4'he):(1'h1)], (&wire2)}}));
            end
          reg9 <= ({$signed($signed($unsigned(reg8))), reg5} ?
              ((+$unsigned({reg8})) ?
                  (~wire2) : (!$unsigned(wire4))) : (reg6[(3'h7):(3'h6)] ?
                  wire1[(4'h9):(1'h0)] : (wire1 ?
                      $signed((!wire3)) : ((wire0 ? reg6 : reg5) + (7'h44)))));
          reg10 <= ({$signed((reg8[(2'h3):(2'h2)] ? (~(8'hb1)) : (8'h9f))),
              (8'h9d)} > (~|(-(reg6 && reg5[(1'h0):(1'h0)]))));
          reg11 <= $signed((((reg5[(1'h0):(1'h0)] ?
              $unsigned(wire4) : (^reg5)) * ((~&wire0) << {wire0,
              wire4})) ^~ reg10[(5'h12):(4'ha)]));
        end
      else
        begin
          if ((-reg10[(5'h14):(5'h13)]))
            begin
              reg5 <= (wire0 ?
                  (reg8 ? reg11 : (~^reg8[(3'h6):(3'h6)])) : wire1);
            end
          else
            begin
              reg5 <= ((reg7 < $signed(reg7)) ?
                  reg7 : (&({reg7} ? (8'hbb) : $signed($unsigned(reg5)))));
              reg6 <= $signed((((&{(8'ha1)}) ^~ $signed((~|reg5))) - reg8));
              reg7 <= wire2;
              reg8 <= $signed(wire0);
              reg9 <= ((~&(~&{wire1[(3'h4):(3'h4)],
                  $signed(wire1)})) != $unsigned($signed((reg8[(1'h0):(1'h0)] ?
                  (~&wire2) : {wire2}))));
            end
          reg10 <= {(&$signed({(wire2 ? reg11 : (7'h44))}))};
          if (reg5)
            begin
              reg11 <= ((reg5[(3'h7):(3'h7)] | (((reg6 ?
                      reg6 : reg7) != $signed(reg11)) ?
                  $unsigned(wire4) : (8'haa))) >= (reg9[(2'h2):(1'h0)] ?
                  (wire2[(1'h1):(1'h0)] ?
                      ($signed(wire4) + $unsigned(reg7)) : (reg11 ~^ (8'hab))) : (~(reg10[(4'h9):(1'h0)] ?
                      {(8'hae)} : $unsigned(reg11)))));
              reg12 <= (wire2 >>> (reg6 + reg5));
              reg13 <= $signed((reg10[(3'h7):(1'h0)] >= reg9));
              reg14 <= ($unsigned($unsigned($unsigned((reg12 ?
                      wire0 : reg6)))) ?
                  ((-wire2) ?
                      {({(8'ha5), reg5} ~^ {reg7})} : ($unsigned((~reg9)) ?
                          (reg12[(5'h13):(4'hb)] ?
                              {(8'hb0),
                                  reg8} : reg9[(3'h4):(1'h0)]) : $unsigned($unsigned(reg8)))) : ($signed($signed($signed(wire1))) ?
                      ($signed(((8'ha9) != reg10)) ?
                          ((+wire3) << (7'h40)) : reg7) : reg6));
              reg15 <= (~&reg11);
            end
          else
            begin
              reg11 <= $unsigned($unsigned((reg9[(3'h4):(3'h4)] <<< ((reg6 ?
                  reg13 : wire0) < (reg8 << (8'ha8))))));
            end
          reg16 <= $unsigned($unsigned($unsigned((!$unsigned((8'ha3))))));
        end
      reg17 <= $signed(reg13[(4'hf):(3'h5)]);
      reg18 <= reg5;
      reg19 <= $unsigned((8'ha0));
      reg20 <= (wire3 & wire2);
    end
  assign wire21 = reg20[(3'h5):(2'h3)];
  assign wire22 = reg5;
  assign wire23 = ((reg8 ^ $unsigned({reg20})) ?
                      ({reg14[(1'h0):(1'h0)],
                              ((reg8 ? reg20 : reg20) ? {wire0} : {reg7})} ?
                          {$unsigned((8'hbb))} : reg12[(1'h0):(1'h0)]) : (((reg11[(2'h2):(1'h1)] ?
                              reg15[(2'h3):(1'h1)] : (~reg14)) && (-reg13[(5'h13):(4'hd)])) ?
                          (~|($unsigned(reg11) ?
                              $signed(reg7) : {wire22,
                                  (8'hac)})) : (($unsigned((8'hbc)) ^ $unsigned(reg13)) ?
                              ((reg9 ?
                                  reg11 : reg13) + reg6[(1'h1):(1'h1)]) : (reg7[(1'h0):(1'h0)] ?
                                  reg16 : {reg12, reg18}))));
  assign wire24 = $signed((^$signed({{(8'h9f)}})));
  module25 #() modinst132 (wire131, clk, wire3, reg7, reg14, reg9, reg10);
  assign wire133 = wire0[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg134 <= $signed((~&(((|wire2) << wire24) ?
          {wire2[(1'h1):(1'h1)],
              reg9[(3'h5):(2'h2)]} : ({wire131} >>> reg17[(3'h6):(3'h4)]))));
      if (wire0[(2'h3):(2'h2)])
        begin
          reg135 <= $signed($signed(reg15));
          reg136 <= (^~(((wire21 >>> (reg6 * reg16)) != (-reg8[(3'h5):(3'h4)])) + $unsigned($signed(wire2[(1'h1):(1'h1)]))));
          reg137 <= (~^reg19);
          reg138 <= $signed(($signed((^((8'hab) ? reg20 : wire1))) ?
              $signed(reg134[(3'h7):(1'h1)]) : (reg12[(4'he):(1'h1)] < (|$unsigned(wire1)))));
        end
      else
        begin
          reg135 <= (~^reg8[(1'h1):(1'h0)]);
          reg136 <= wire23[(5'h10):(4'h9)];
          reg137 <= reg8[(3'h5):(3'h4)];
        end
      reg139 <= (-(8'hbe));
      reg140 <= $unsigned((^((~&(reg6 || wire0)) <<< $unsigned({reg11,
          wire22}))));
      reg141 <= $signed((~reg11));
    end
  assign wire142 = reg13;
  assign wire143 = (((wire4[(4'hf):(4'he)] <= $signed(wire1[(2'h2):(2'h2)])) ?
                           reg134[(4'h9):(1'h0)] : wire131[(1'h1):(1'h0)]) ?
                       (^{$unsigned((wire1 ^ wire21)),
                           ($unsigned(reg9) ~^ (reg18 ?
                               reg6 : reg134))}) : $unsigned($signed((reg9[(4'h8):(3'h6)] ?
                           wire142[(2'h3):(2'h3)] : reg137[(2'h2):(1'h1)]))));
endmodule

module module25  (y, clk, wire26, wire27, wire28, wire29, wire30);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire26;
  input wire [(4'hc):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire74;
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire130,
                 wire128,
                 wire102,
                 wire77,
                 wire76,
                 wire74,
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
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg31 <= (~&wire30);
    end
  module32 #() modinst75 (wire74, clk, wire26, wire29, reg31, wire30);
  assign wire76 = (wire28[(3'h4):(1'h1)] <<< (8'ha4));
  assign wire77 = (wire27 > $signed($unsigned(wire76[(4'h9):(3'h7)])));
  always
    @(posedge clk) begin
      reg78 <= $signed($signed(wire28[(1'h0):(1'h0)]));
      reg79 <= (wire26 != $unsigned(((8'hbb) ?
          wire76[(1'h1):(1'h1)] : wire27)));
      if (($unsigned($unsigned({reg79[(4'hb):(3'h5)],
              (reg79 ? reg79 : reg78)})) ?
          ($signed(reg31[(4'hd):(3'h5)]) ?
              {$unsigned(wire74[(4'h9):(2'h3)]),
                  ($signed(wire76) ?
                      (reg31 ?
                          wire76 : wire76) : wire29[(4'h9):(1'h0)])} : {{$unsigned((8'hbd))},
                  {(wire28 ~^ reg31), $signed(reg78)}}) : wire29))
        begin
          reg80 <= ((-wire77) ? wire28 : (~&wire27));
          reg81 <= (({reg79[(4'hb):(2'h3)],
                  reg79[(3'h4):(3'h4)]} & ((!(!wire29)) <= $unsigned($signed(wire76)))) ?
              {$signed((wire28 ? $signed(wire76) : (&wire30))),
                  (8'h9e)} : $signed(wire26));
          if (reg81)
            begin
              reg82 <= $signed((reg79 ^ (8'hba)));
              reg83 <= $unsigned((reg79 ?
                  wire27[(4'hc):(2'h3)] : $unsigned(((reg82 != wire76) & (|reg82)))));
              reg84 <= wire27;
              reg85 <= (wire74 && {wire76[(2'h3):(1'h1)],
                  (reg82[(3'h7):(2'h2)] < reg31[(3'h7):(3'h6)])});
            end
          else
            begin
              reg82 <= $signed((reg79 && reg85[(2'h2):(1'h1)]));
            end
          if ((8'ha7))
            begin
              reg86 <= $signed(wire74[(1'h1):(1'h0)]);
              reg87 <= $signed((~($signed({reg85}) >= $signed($unsigned(reg85)))));
              reg88 <= (((8'hab) ~^ $unsigned((reg81[(3'h4):(1'h1)] ?
                      (reg31 ? reg83 : reg31) : (~|reg78)))) ?
                  $signed(($signed($unsigned(reg81)) ?
                      (~|{(8'ha7), wire26}) : $signed((reg87 ?
                          wire77 : wire74)))) : (reg83 & (8'hbe)));
              reg89 <= $signed(wire74);
            end
          else
            begin
              reg86 <= (wire77 || (wire30[(3'h7):(3'h6)] ?
                  ($signed(reg82[(3'h5):(3'h5)]) | (^~$signed(reg88))) : reg81[(3'h6):(3'h4)]));
              reg87 <= reg85;
              reg88 <= $signed($unsigned(reg86[(4'h8):(1'h1)]));
            end
          reg90 <= (((((~reg81) | $unsigned((8'hab))) < {(wire26 ?
                      wire27 : reg31),
                  ((8'ha1) ? (8'hbb) : reg87)}) | wire74) ?
              wire77[(1'h0):(1'h0)] : ($signed($unsigned($unsigned(reg78))) != {reg88,
                  $signed((-(8'h9d)))}));
        end
      else
        begin
          reg80 <= {({($unsigned((8'hb4)) && reg78),
                  {(^~reg90), (wire26 ? wire74 : wire30)}} <= {(~|wire28),
                  reg88[(3'h4):(2'h2)]})};
          if ($signed(wire27[(4'hc):(4'h9)]))
            begin
              reg81 <= reg82[(2'h3):(2'h3)];
              reg82 <= $unsigned((~&$signed($signed(wire76))));
              reg83 <= (((reg87[(4'hb):(3'h6)] ?
                  reg85 : (~^reg90[(5'h12):(1'h1)])) - (|(^~(|reg87)))) < ($unsigned(wire26) ?
                  reg81[(3'h4):(2'h3)] : {((8'hab) ?
                          $unsigned(wire26) : (&reg85)),
                      ($unsigned(reg84) | reg89[(1'h0):(1'h0)])}));
              reg84 <= wire74[(4'ha):(1'h0)];
            end
          else
            begin
              reg81 <= {$signed({(~&(wire74 || wire74)),
                      (reg87 <= reg86[(4'hb):(4'h9)])}),
                  ({$unsigned((~reg85)), (7'h40)} ?
                      reg87 : ($signed({reg81, wire26}) | ((wire30 ?
                          reg89 : reg83) - (8'hb2))))};
              reg82 <= (~$signed((~|$signed($signed((8'hb2))))));
              reg83 <= $unsigned(reg78);
              reg84 <= {$unsigned($signed(({(8'hb2)} ?
                      $unsigned(reg80) : (&reg89)))),
                  $signed($unsigned($signed($unsigned((8'ha5)))))};
              reg85 <= ($signed((~(~&wire77[(1'h1):(1'h0)]))) ^~ {$signed({(reg82 ?
                          reg88 : reg80),
                      (reg80 ? wire27 : reg84)}),
                  $signed({reg81[(2'h3):(2'h2)], {reg87, reg87}})});
            end
          reg86 <= $unsigned((-($unsigned({reg31, wire28}) ?
              ($unsigned(wire29) ?
                  (reg86 ? wire30 : wire76) : (~wire27)) : ((reg79 ?
                      reg84 : reg79) ?
                  ((8'hb9) || (8'hae)) : (~^wire76)))));
          reg87 <= (+reg85[(4'hb):(3'h7)]);
        end
      reg91 <= (~^$unsigned((reg83[(1'h1):(1'h1)] ?
          (^reg78[(1'h0):(1'h0)]) : ((reg80 ? wire76 : reg87) >= (~|wire30)))));
      reg92 <= $signed(reg87[(4'h9):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ((-{reg88[(1'h1):(1'h1)], (8'h9e)}))
        begin
          reg93 <= (reg83 ?
              $unsigned(((((8'hb6) ? (7'h44) : (8'haf)) ?
                      $unsigned(wire74) : wire76[(4'hd):(4'h8)]) ?
                  reg31 : ($unsigned(wire30) ?
                      reg86 : {reg92}))) : (+$unsigned((~reg89))));
          reg94 <= ((~|wire26) < wire77);
          reg95 <= wire29[(2'h2):(2'h2)];
          reg96 <= $unsigned($unsigned(((reg88 ?
                  wire76[(1'h0):(1'h0)] : (wire28 ^~ wire77)) ?
              (reg92 > $unsigned(reg87)) : $signed(wire26))));
        end
      else
        begin
          if (reg84)
            begin
              reg93 <= reg96[(3'h5):(2'h2)];
            end
          else
            begin
              reg93 <= $signed({(((|(8'hb7)) ? (reg79 > reg88) : (+reg94)) ?
                      (((8'hb2) == reg88) <= $signed(reg94)) : (^(reg95 ?
                          reg89 : wire28)))});
            end
          reg94 <= reg84;
          if ((((~|$signed(wire29)) != reg81) ?
              reg90 : (reg94[(1'h0):(1'h0)] ?
                  (wire26 ^~ wire26[(4'hb):(4'ha)]) : $unsigned(($unsigned(reg31) ?
                      $signed(reg96) : reg89)))))
            begin
              reg95 <= $unsigned((~|((|$unsigned(reg80)) ?
                  ((^~(8'hb8)) >> ((8'hbd) <<< wire77)) : ($signed(reg95) << reg86))));
              reg96 <= (reg92 != (~$unsigned({reg87[(3'h6):(3'h5)]})));
            end
          else
            begin
              reg95 <= $unsigned((+{(reg31 != $unsigned(wire29))}));
              reg96 <= ($signed(reg78[(4'hb):(3'h7)]) ?
                  (($signed($unsigned(wire30)) ?
                          reg87 : (reg78[(4'hd):(2'h2)] || wire29)) ?
                      $unsigned(reg82) : $unsigned((^~(~|reg96)))) : $unsigned({reg84,
                      (reg80 ? (~^wire76) : $unsigned(reg84))}));
              reg97 <= reg86[(3'h7):(1'h0)];
              reg98 <= wire26[(3'h6):(1'h0)];
            end
        end
      reg99 <= (reg87[(4'hd):(3'h4)] ?
          {(reg96 & $unsigned(wire30[(4'he):(4'hb)]))} : $unsigned(((+(reg94 ?
                  reg81 : reg93)) ?
              (reg93[(4'hd):(3'h7)] | reg97[(5'h11):(3'h7)]) : ((~^reg88) ?
                  $unsigned(reg80) : (~|reg80)))));
      reg100 <= ((reg91 ?
              (($unsigned(wire74) ?
                  (wire76 ? reg78 : wire28) : (reg31 ?
                      reg79 : reg97)) - ($signed(reg97) != $signed(wire29))) : reg82[(1'h0):(1'h0)]) ?
          ((reg95[(1'h0):(1'h0)] ^~ ({reg80} ?
              (|reg95) : {reg84})) | $signed((8'ha9))) : reg98);
      reg101 <= (reg100 < $unsigned($signed({(~^reg79)})));
    end
  assign wire102 = (~((reg99 >= reg95) < ($unsigned(reg88[(3'h6):(3'h5)]) && {$unsigned(reg99),
                       wire77})));
  module103 #() modinst129 (.clk(clk), .y(wire128), .wire107(reg87), .wire106(reg79), .wire105(reg97), .wire104(reg90));
  assign wire130 = reg94[(4'ha):(3'h7)];
endmodule

module module103
#(parameter param127 = (~^(({((7'h41) & (8'h9d)), (^~(8'ha5))} ^~ {((8'hb8) ? (8'ha5) : (8'hae))}) ? (((^(8'hb7)) * (8'hb5)) ^ (!((8'h9d) ? (8'ha8) : (8'hb4)))) : (-({(8'hbd)} ? ((7'h44) >>> (8'ha9)) : (^(8'hab)))))))
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire107;
  input wire signed [(5'h12):(1'h0)] wire106;
  input wire signed [(5'h15):(1'h0)] wire105;
  input wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire126;
  wire [(3'h5):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire108;
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire122,
                 wire121,
                 wire108,
                 reg124,
                 reg123,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire108 = (wire107 ?
                       wire104[(4'hd):(4'hd)] : ({{(wire104 ?
                                       wire106 : wire106)}} ?
                           $signed(wire107) : $signed((-(^~wire104)))));
  always
    @(posedge clk) begin
      if (wire105)
        begin
          reg109 <= (~|(^~{$unsigned(((8'hac) ? wire104 : wire107))}));
          if (wire106[(3'h4):(2'h3)])
            begin
              reg110 <= ((8'ha7) ?
                  $unsigned($signed((~^(wire106 & wire108)))) : $signed((reg109 ?
                      $unsigned(wire107[(3'h4):(1'h0)]) : wire107)));
              reg111 <= $unsigned(({(~^$unsigned(reg109))} ?
                  reg109[(3'h4):(3'h4)] : wire107[(2'h3):(1'h0)]));
            end
          else
            begin
              reg110 <= {wire106};
              reg111 <= (8'h9c);
              reg112 <= reg109;
              reg113 <= (&wire107);
              reg114 <= $signed($unsigned((-$unsigned((+(8'hb0))))));
            end
          reg115 <= (8'ha9);
          reg116 <= ($signed($signed({wire104[(3'h4):(2'h2)],
              $unsigned(wire105)})) << ($unsigned(reg111[(5'h10):(3'h4)]) != (((reg114 ?
                  (7'h43) : reg115) >> $signed((8'hbf))) ?
              ((!reg115) ? (&reg114) : {reg111}) : reg110[(1'h1):(1'h0)])));
          if ($signed((reg110 ?
              $signed(((~reg115) ?
                  $unsigned(reg116) : (~&reg115))) : wire107[(4'he):(3'h7)])))
            begin
              reg117 <= $signed((~$unsigned(($signed(reg113) ?
                  $signed((8'haa)) : (wire108 ? reg111 : reg111)))));
              reg118 <= reg115[(4'h9):(2'h2)];
              reg119 <= ({(&(^~wire108[(2'h3):(1'h0)])),
                  $unsigned(($unsigned(reg115) < {reg112}))} == reg115[(4'hb):(4'ha)]);
              reg120 <= {{$signed($signed((reg114 ? reg113 : reg112)))},
                  $unsigned(((reg116[(4'h8):(4'h8)] ?
                      $signed(reg114) : $unsigned(reg118)) <= wire108[(4'h8):(3'h5)]))};
            end
          else
            begin
              reg117 <= $signed({$signed({reg117, reg109[(3'h5):(2'h3)]}),
                  {(~&wire106), reg119[(3'h6):(1'h1)]}});
              reg118 <= $unsigned(({$unsigned($signed((7'h41))), reg115} ?
                  {((wire106 ? reg116 : reg111) ?
                          reg119 : (wire107 ? wire108 : reg116)),
                      reg116[(3'h6):(2'h3)]} : reg111[(5'h10):(1'h1)]));
            end
        end
      else
        begin
          reg109 <= reg120[(5'h10):(4'h8)];
        end
    end
  assign wire121 = (-reg109[(4'hc):(3'h6)]);
  assign wire122 = (+reg109);
  always
    @(posedge clk) begin
      reg123 <= reg116[(4'h9):(4'h9)];
      reg124 <= (^wire122);
    end
  assign wire125 = reg118[(3'h5):(2'h3)];
  assign wire126 = $unsigned(reg116);
endmodule

module module32
#(parameter param73 = ({((~((8'ha4) ? (8'h9c) : (8'ha8))) ? {((8'hbb) ? (7'h44) : (8'hac)), ((8'haf) ? (8'haa) : (8'hb4))} : {(!(7'h40))}), (~^(((8'haf) ? (7'h44) : (8'hbf)) < (^~(7'h44))))} & (8'ha5)))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire36;
  input wire [(4'ha):(1'h0)] wire35;
  input wire [(5'h10):(1'h0)] wire34;
  input wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire37;
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire37,
                 reg68,
                 reg67,
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
                 (1'h0)};
  assign wire37 = ((({$signed((7'h40))} ?
                      $unsigned((~^wire33)) : (-$unsigned(wire34))) || {$signed($signed((8'hab)))}) <= wire33[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg38 <= (&wire33);
      if ((wire33[(3'h4):(3'h4)] | wire34[(2'h2):(1'h1)]))
        begin
          reg39 <= ((7'h41) ~^ wire36);
          reg40 <= ((^reg38) ?
              $signed(($unsigned((wire37 ? wire36 : wire35)) ?
                  $unsigned((wire37 <<< reg38)) : wire34[(4'ha):(3'h7)])) : (wire33 ?
                  (wire35[(4'h8):(4'h8)] - (wire33[(2'h2):(1'h0)] < {wire37,
                      wire34})) : wire37[(4'ha):(1'h1)]));
          reg41 <= (^(8'hb8));
          reg42 <= {wire36[(3'h6):(2'h2)],
              {(!reg41[(4'ha):(3'h7)]),
                  (-(wire33[(3'h6):(3'h6)] | (|(8'hb1))))}};
        end
      else
        begin
          reg39 <= {((~|reg40[(3'h4):(2'h2)]) <= reg40)};
          reg40 <= (($signed($unsigned((wire33 >= reg41))) + $unsigned($unsigned((^~reg41)))) ?
              (~&$unsigned((^(wire35 < (8'ha5))))) : (reg38 ?
                  $unsigned(wire35[(4'h9):(2'h2)]) : {(8'hb7)}));
          reg41 <= $unsigned(((8'ha5) | ((+$unsigned(wire36)) ?
              wire36[(2'h2):(2'h2)] : (reg39 ? $unsigned(wire35) : reg38))));
        end
      reg43 <= (wire33[(3'h4):(1'h1)] >>> (reg41[(1'h0):(1'h0)] ^~ wire36));
      reg44 <= (-(|({reg42[(1'h1):(1'h0)]} >>> ((wire33 + reg41) ?
          (reg41 > reg43) : reg41))));
      reg45 <= {(^~(reg44[(2'h3):(2'h2)] & reg42)),
          {$unsigned($signed((reg41 >>> reg39)))}};
    end
  always
    @(posedge clk) begin
      if ((({$unsigned((reg44 ? (8'hbf) : reg38)), reg39[(4'hd):(1'h0)]} ?
              wire36 : $signed($unsigned((wire36 ^ reg40)))) ?
          wire37[(3'h6):(2'h3)] : (!((~|(reg45 >>> wire35)) ?
              $signed((reg44 ^ (8'h9c))) : (wire33 + $signed(wire35))))))
        begin
          if (reg41[(4'hc):(3'h4)])
            begin
              reg46 <= ($unsigned(wire37[(3'h4):(3'h4)]) >> $signed($unsigned($unsigned((reg38 ?
                  wire35 : wire36)))));
              reg47 <= ($unsigned((7'h40)) ?
                  reg39 : (($signed((reg46 ?
                      wire35 : reg45)) >> wire36) ^ $signed((^~(wire36 ?
                      reg41 : wire36)))));
            end
          else
            begin
              reg46 <= {$signed($signed(wire35[(2'h2):(1'h1)])), (|wire33)};
              reg47 <= wire37[(4'hf):(2'h2)];
              reg48 <= ((($signed(reg47[(4'hc):(3'h4)]) ?
                  ((8'h9c) ?
                      (reg39 ? reg47 : wire36) : (reg44 ?
                          (7'h43) : wire34)) : (reg38 && wire34[(1'h1):(1'h1)])) || reg45[(4'hd):(1'h0)]) && $unsigned((8'hb5)));
            end
          reg49 <= wire33;
          reg50 <= ($unsigned($unsigned((+reg38))) ?
              (reg39[(5'h15):(3'h4)] ?
                  $unsigned((wire34 >>> $unsigned(wire36))) : (|({wire34} < $unsigned(reg43)))) : ((&$unsigned((reg45 > (8'ha2)))) ~^ {wire36[(1'h1):(1'h0)],
                  {$signed(wire36), $signed(wire34)}}));
        end
      else
        begin
          if ((({$signed((wire33 | reg49))} <= wire33) >>> $signed(wire36[(4'h8):(3'h6)])))
            begin
              reg46 <= (reg46 ? $signed(reg49) : reg50);
              reg47 <= $signed({{{{(8'haf)}}, reg40}});
            end
          else
            begin
              reg46 <= $unsigned($signed($signed({reg43[(2'h3):(1'h1)]})));
              reg47 <= (((!reg38) - reg45) ?
                  (reg40 + $signed(reg40)) : $unsigned(wire35[(4'ha):(4'h8)]));
              reg48 <= ($signed($unsigned($signed(wire34))) ?
                  $signed(reg41) : $unsigned($unsigned((reg43 && (reg47 ?
                      wire36 : reg47)))));
              reg49 <= $signed(reg48);
              reg50 <= reg45;
            end
          reg51 <= (((~|(&(wire33 ?
                  reg41 : reg47))) != ((wire34 * $unsigned(reg45)) + (wire37[(4'h9):(4'h8)] && $unsigned(reg48)))) ?
              $signed((reg50[(3'h4):(2'h2)] <<< reg50[(2'h3):(2'h3)])) : ((wire33 ?
                  (~|$unsigned(reg47)) : $signed((wire33 > reg45))) >> (reg41 || ({reg45} >>> $unsigned(reg41)))));
          reg52 <= reg50[(2'h3):(2'h2)];
          reg53 <= reg45[(1'h1):(1'h0)];
          reg54 <= reg50;
        end
      if (wire37[(4'h9):(2'h3)])
        begin
          reg55 <= ($unsigned($signed((|reg42[(4'hc):(1'h0)]))) ~^ ((wire36 > ({wire33,
                  reg47} || $signed((8'ha9)))) ?
              ((&$unsigned(reg46)) ?
                  reg40 : $unsigned((reg44 <= (8'h9f)))) : (($signed(wire36) ?
                      $unsigned(reg44) : (reg49 + wire37)) ?
                  reg40 : reg47)));
          reg56 <= (((~|reg51) << {reg54}) <= (reg55 ^~ reg50[(3'h4):(1'h0)]));
          reg57 <= (reg44 == (wire37 ? (&reg41) : reg40));
        end
      else
        begin
          reg55 <= (8'hbb);
          reg56 <= ((($unsigned(reg42[(3'h6):(3'h5)]) ?
              $signed($unsigned(reg50)) : $unsigned(reg50[(2'h3):(2'h3)])) + reg51[(4'h9):(1'h0)]) == reg44[(3'h5):(1'h1)]);
          reg57 <= $unsigned(reg50[(1'h1):(1'h1)]);
          reg58 <= $unsigned($unsigned((^~$unsigned($unsigned((8'hb4))))));
          reg59 <= $signed({($unsigned((~|reg55)) << (reg48[(3'h4):(2'h2)] << $signed(reg51)))});
        end
      reg60 <= reg49[(3'h7):(2'h2)];
      reg61 <= ($signed(reg44[(3'h4):(1'h0)]) >> (^$signed((~|reg50))));
    end
  assign wire62 = ({$signed((^~reg41[(4'h9):(4'h9)])), {wire37}} ?
                      (~^(^~(~&reg50))) : (((reg49[(3'h7):(1'h0)] ?
                          reg38 : ((8'hb0) ?
                              (8'hb4) : wire35)) >= wire37[(4'hb):(3'h6)]) - (~^{reg58[(3'h7):(3'h6)],
                          (reg47 ? (8'ha8) : reg46)})));
  assign wire63 = reg51;
  assign wire64 = $signed($unsigned($unsigned(reg41[(2'h2):(1'h0)])));
  assign wire65 = reg46;
  assign wire66 = $unsigned(reg39[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg67 <= reg48[(3'h6):(3'h5)];
      reg68 <= $signed({{{$unsigned(wire64)}}});
    end
  assign wire69 = $signed($unsigned($unsigned($unsigned($signed(reg42)))));
  assign wire70 = $unsigned(((+reg57[(4'hc):(4'h8)]) == $signed(wire35[(2'h2):(1'h1)])));
  assign wire71 = $unsigned(reg56);
  assign wire72 = (reg40[(3'h4):(2'h3)] < reg56);
endmodule
