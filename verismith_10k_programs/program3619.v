module top
#(parameter param113 = ({((8'hbb) <<< ((+(8'hb4)) ? (~^(7'h40)) : ((8'hb9) ? (7'h42) : (8'hbf)))), (|(~^((8'h9c) >= (8'ha1))))} > ((8'ha1) != ((((8'ha2) <= (8'h9f)) != (!(8'haf))) ? (((8'hb7) ? (8'ha8) : (8'hbf)) >>> ((7'h44) ^~ (8'ha5))) : ((~|(8'haf)) * ((8'hbe) << (8'hb0)))))), 
parameter param114 = param113)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire112;
  wire signed [(4'hd):(1'h0)] wire110;
  wire [(3'h6):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire112,
                 wire110,
                 wire16,
                 wire15,
                 wire14,
                 wire5,
                 wire4,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = {$unsigned(wire2[(2'h2):(1'h1)])};
  assign wire5 = $unsigned($unsigned(wire4[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg6 <= (-(|(~($unsigned((8'hb9)) ? ((8'hba) >= wire4) : wire5))));
      reg7 <= ((wire5 ?
              $unsigned((^$unsigned(wire3))) : (($unsigned(wire4) ?
                      {wire3, wire5} : wire1[(4'h8):(4'h8)]) ?
                  {wire2, (wire4 * (8'ha8))} : $signed((wire0 ?
                      wire2 : wire3)))) ?
          $unsigned((wire5[(3'h5):(3'h5)] * wire3[(2'h2):(1'h1)])) : (~&{($unsigned((8'hb1)) ?
                  {(8'hb4), wire5} : (wire3 ? (8'hb8) : reg6))}));
      reg8 <= $unsigned($signed($signed((~&$signed(wire3)))));
      reg9 <= $signed(wire1);
      if (reg9)
        begin
          reg10 <= wire4[(3'h5):(2'h3)];
          reg11 <= (wire1 ?
              (^$signed(reg7[(4'hc):(4'h8)])) : (wire4 && $unsigned((reg9[(4'hb):(2'h2)] ?
                  (reg10 ? wire0 : wire1) : {(8'hbc), wire1}))));
          reg12 <= wire1;
        end
      else
        begin
          reg10 <= ((+(wire0 <<< ($unsigned(wire5) ?
              $signed(wire3) : (~|reg7)))) & (~^$signed(($signed((8'h9f)) == reg7))));
          reg11 <= (reg8[(4'hc):(3'h5)] && (8'h9f));
          if (reg8)
            begin
              reg12 <= $signed($unsigned(wire0));
              reg13 <= $signed($unsigned($unsigned((8'ha0))));
            end
          else
            begin
              reg12 <= (reg11 ? reg8 : $signed(reg7[(3'h7):(1'h0)]));
              reg13 <= $signed((+reg8));
            end
        end
    end
  assign wire14 = (!(!wire2));
  assign wire15 = reg8;
  assign wire16 = wire4;
  module17 #() modinst111 (.clk(clk), .wire21(wire14), .wire20(reg9), .wire19(reg13), .wire18(wire4), .y(wire110));
  assign wire112 = $signed($unsigned($unsigned($signed($signed(reg8)))));
endmodule

module module17
#(parameter param109 = ((^~(|(((8'haf) ? (8'hb5) : (8'hae)) ? (~&(8'ha2)) : (^~(8'hbd))))) + ({(-(~&(8'hbb))), (8'hb2)} < ((~((8'ha6) ^ (8'hb3))) != ((!(8'haf)) ? (8'hbb) : ((8'ha7) ^~ (8'hae)))))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire108;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire105;
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire54,
                 wire36,
                 wire34,
                 wire22,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire105,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
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
                 (1'h0)};
  assign wire22 = wire18[(2'h2):(1'h1)];
  module23 #() modinst35 (.wire26(wire18), .clk(clk), .wire24(wire22), .wire25(wire20), .wire27(wire21), .y(wire34));
  assign wire36 = $signed(wire20[(2'h3):(1'h0)]);
  module37 #() modinst55 (.wire41(wire34), .clk(clk), .wire40(wire36), .wire38(wire20), .wire42(wire21), .y(wire54), .wire39(wire19));
  always
    @(posedge clk) begin
      reg56 <= $signed(wire22);
      reg57 <= {(wire54 * (~(+wire22[(3'h4):(1'h1)])))};
      reg58 <= ((!reg56) ?
          $signed($signed(((wire36 > reg56) ?
              (~wire34) : (wire21 ?
                  wire34 : wire18)))) : ($unsigned((~^(wire36 && wire22))) ?
              {$unsigned((wire54 ^ wire21)),
                  ($unsigned((8'ha1)) ?
                      (|wire18) : wire19)} : (!wire22[(2'h2):(1'h0)])));
      reg59 <= ($signed(((-$unsigned(wire19)) & reg56[(1'h1):(1'h1)])) ?
          $signed(((8'hbe) ^ wire18)) : wire54);
      reg60 <= (reg59 ~^ (wire20[(1'h1):(1'h0)] < (wire36 ?
          {$signed(wire36), ((8'hb4) ^ reg57)} : (8'haf))));
    end
  always
    @(posedge clk) begin
      reg61 <= $signed((wire19 <<< reg60[(1'h0):(1'h0)]));
      reg62 <= {$unsigned((8'ha2))};
      if ($unsigned(wire34[(3'h4):(1'h0)]))
        begin
          if ($unsigned({(((^~reg61) ?
                  {wire19, reg58} : (reg60 >> wire54)) | (^~(wire18 ?
                  (8'ha0) : wire20)))}))
            begin
              reg63 <= reg62;
              reg64 <= $unsigned(({$unsigned((reg61 || (8'hbf))),
                      (wire19[(4'hc):(4'ha)] ?
                          wire18[(1'h1):(1'h0)] : $unsigned(wire19))} ?
                  reg58[(1'h0):(1'h0)] : {$signed($unsigned(wire20))}));
              reg65 <= (~&(wire21 & reg57));
              reg66 <= $signed(($signed(({wire18} && (|(7'h43)))) & ((~$signed(wire34)) ?
                  wire20 : ((~&reg62) >= $unsigned(wire20)))));
            end
          else
            begin
              reg63 <= {(reg56 * $signed($signed($unsigned(reg62)))),
                  (($unsigned(((8'h9c) ? wire34 : reg56)) ?
                          reg59 : $unsigned($unsigned((8'haf)))) ?
                      ({$unsigned(wire20),
                          $signed(reg62)} <= (^reg63[(3'h5):(3'h4)])) : $signed({(reg64 && wire18)}))};
            end
        end
      else
        begin
          reg63 <= {$signed(((reg61[(4'he):(4'hc)] ?
                  (wire22 ? reg66 : reg64) : $signed(reg61)) & ((wire19 ?
                  (8'haf) : reg62) ^~ (wire19 ? wire18 : reg64))))};
          reg64 <= ({(((wire22 | reg56) || $signed(wire22)) ?
                      $signed($signed((8'hbb))) : (^wire34[(3'h4):(1'h1)]))} ?
              $signed($signed($signed($unsigned(reg60)))) : ($signed(wire22) - (({reg62} ?
                  (wire22 ?
                      wire19 : reg58) : wire21[(3'h7):(2'h3)]) + (~reg58[(1'h0):(1'h0)]))));
        end
    end
  assign wire67 = ((($unsigned({reg65}) * $unsigned($unsigned(wire36))) ?
                      $unsigned(wire54[(4'hc):(4'hb)]) : {$unsigned(((8'ha4) ^~ reg58))}) > $signed((^(wire54[(2'h2):(2'h2)] ?
                      wire54[(4'hd):(1'h0)] : $signed(reg56)))));
  assign wire68 = (8'hb8);
  assign wire69 = ((^~$signed((~^reg58[(2'h2):(1'h0)]))) ?
                      $unsigned($signed(reg66)) : wire67[(1'h1):(1'h1)]);
  assign wire70 = (!(wire19 ? {(8'haa)} : wire21[(4'h8):(2'h2)]));
  always
    @(posedge clk) begin
      reg71 <= $signed((($signed((~&wire70)) * $signed({reg64,
          wire69})) >> $unsigned($unsigned((wire18 >>> reg58)))));
      reg72 <= {(8'hac),
          (({(reg65 >>> reg56)} ? (~&(^reg66)) : reg58[(1'h1):(1'h0)]) ?
              (!reg57) : {((wire19 ? wire34 : wire22) ^ (wire69 == reg57)),
                  {{wire34, reg71}}})};
      if ($signed($unsigned(wire18)))
        begin
          if ((8'hbf))
            begin
              reg73 <= wire20[(1'h0):(1'h0)];
            end
          else
            begin
              reg73 <= wire19;
            end
          reg74 <= wire54[(4'h9):(4'h8)];
          reg75 <= wire22[(2'h3):(2'h3)];
          reg76 <= $signed((!($signed($unsigned((8'h9d))) ?
              $unsigned($unsigned((8'hb5))) : $unsigned(wire54[(4'h8):(1'h1)]))));
          reg77 <= $signed((reg64[(4'he):(3'h6)] >> $unsigned($unsigned($unsigned(reg72)))));
        end
      else
        begin
          reg73 <= ((reg65[(3'h6):(1'h1)] ?
              {{(~&(8'ha9)), $unsigned(reg60)}} : ($unsigned({reg75}) ?
                  $unsigned(reg77) : $signed((wire69 ?
                      wire67 : reg59)))) > ($unsigned(wire34) ?
              $signed(($unsigned(reg59) ?
                  reg77 : wire69[(4'he):(2'h2)])) : $signed($signed(((8'hb4) >> wire69)))));
          reg74 <= {((^$signed($signed(reg56))) ?
                  reg62[(1'h1):(1'h1)] : $signed((reg66 ?
                      ((8'hb2) ? reg75 : wire21) : $unsigned(reg58))))};
          reg75 <= reg63[(2'h3):(1'h0)];
        end
      if (wire69[(4'hd):(4'ha)])
        begin
          reg78 <= reg64;
          reg79 <= (+reg71[(1'h1):(1'h0)]);
          reg80 <= $unsigned($unsigned(reg75[(3'h5):(2'h3)]));
        end
      else
        begin
          reg78 <= (!((+$signed(wire54)) ?
              $unsigned(((8'ha9) <<< (~wire22))) : $unsigned((~|reg79[(2'h2):(2'h2)]))));
          reg79 <= $signed($unsigned($unsigned({(~|(7'h41)), wire21})));
          if ($unsigned((~(^~wire69[(1'h0):(1'h0)]))))
            begin
              reg80 <= reg66;
              reg81 <= wire22[(3'h7):(3'h5)];
              reg82 <= (~|($unsigned(reg65[(2'h2):(1'h1)]) ^ $signed(reg76[(1'h1):(1'h1)])));
              reg83 <= reg73;
              reg84 <= reg71;
            end
          else
            begin
              reg80 <= $unsigned(($unsigned((reg71[(3'h4):(2'h3)] ?
                      reg78[(1'h0):(1'h0)] : reg82)) ?
                  wire69 : reg60));
              reg81 <= $unsigned(wire34[(4'hf):(4'h8)]);
              reg82 <= {wire36};
              reg83 <= ((^((reg78 <<< (wire22 && (8'hac))) ?
                      ($unsigned(reg72) ?
                          reg66 : ((8'hbc) == wire54)) : {{reg58, reg71}})) ?
                  ($unsigned($signed((reg72 ? reg73 : reg75))) ?
                      ((8'hb1) ?
                          $signed((reg58 ?
                              wire18 : reg82)) : wire18[(1'h1):(1'h0)]) : ((~^wire21[(4'hd):(4'hc)]) == reg83[(2'h3):(2'h2)])) : ($unsigned(wire69) >= {(8'hb8)}));
            end
        end
    end
  module85 #() modinst106 (.clk(clk), .wire89(wire18), .y(wire105), .wire90(reg79), .wire88(reg75), .wire87(reg65), .wire86(reg76));
  assign wire107 = $signed($signed(($signed(reg56[(3'h6):(1'h1)]) | $unsigned((reg81 ?
                       wire21 : wire70)))));
  assign wire108 = reg65[(4'hb):(3'h4)];
endmodule

module module85
#(parameter param103 = (~&((({(8'hae)} ? ((8'hb7) ~^ (8'ha3)) : ((8'ha5) ? (8'hae) : (8'h9d))) ? ((&(8'ha0)) ? {(8'hb3), (8'hbd)} : {(8'hae), (7'h44)}) : (~&(~^(8'ha7)))) ? (~^(((8'h9c) ? (8'hae) : (8'hbe)) ? ((8'hab) && (8'ha3)) : (!(8'ha9)))) : ((~&((8'hb4) << (8'haa))) ? {((7'h43) | (8'hb4))} : (((8'ha7) << (7'h40)) ? {(7'h43), (8'hab)} : ((8'hb7) << (8'hae)))))), 
parameter param104 = ((^~((param103 ? param103 : param103) + param103)) * param103))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire90;
  input wire signed [(5'h13):(1'h0)] wire89;
  input wire [(5'h12):(1'h0)] wire88;
  input wire [(4'hb):(1'h0)] wire87;
  input wire [(3'h4):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire91;
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  assign y = {wire97,
                 wire91,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire91 = wire88[(4'hf):(4'h9)];
  always
    @(posedge clk) begin
      if (((wire88 <= wire87[(3'h6):(1'h0)]) ?
          wire91 : (($unsigned(wire86) >= $signed({wire90})) + wire88)))
        begin
          reg92 <= wire91[(1'h0):(1'h0)];
          reg93 <= {({wire86[(3'h4):(2'h3)]} ^ (($signed((8'hba)) != $signed(wire88)) ?
                  ((^reg92) ?
                      ((8'h9c) <= (8'ha8)) : wire91[(2'h3):(1'h0)]) : (~$signed(wire91)))),
              (~|$unsigned((7'h42)))};
        end
      else
        begin
          if (wire90[(2'h2):(1'h0)])
            begin
              reg92 <= (($unsigned($signed($unsigned(wire86))) > (((wire90 & (8'hba)) ?
                          ((8'hb2) ^ wire91) : wire87[(3'h7):(3'h6)]) ?
                      (8'hb0) : wire89)) ?
                  $signed(({(wire86 * wire89)} ?
                      (reg92[(1'h0):(1'h0)] || wire87) : {(wire91 << reg93)})) : (($signed({reg92,
                          (8'hb0)}) ?
                      $unsigned($signed(wire87)) : reg92) > (wire90 ?
                      {wire91, wire88[(4'h8):(1'h0)]} : $unsigned((reg93 ?
                          reg93 : reg92)))));
              reg93 <= (wire89[(4'hf):(4'h8)] >> wire90[(3'h4):(1'h1)]);
              reg94 <= $signed(((((!(8'hbd)) && (^~wire89)) & ($signed(wire90) <= $signed((8'ha2)))) == (-{$unsigned((8'hae)),
                  wire91})));
              reg95 <= (8'h9e);
              reg96 <= ((reg94 ?
                  (&$signed((8'hbc))) : wire87[(1'h1):(1'h0)]) | wire86[(2'h2):(2'h2)]);
            end
          else
            begin
              reg92 <= {(wire86[(3'h4):(1'h1)] - (~(7'h44)))};
              reg93 <= $unsigned(wire87);
              reg94 <= (^~wire89);
            end
        end
    end
  assign wire97 = wire88[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg98 <= $signed((8'ha6));
      reg99 <= (($unsigned((reg92[(3'h5):(2'h3)] ?
              {wire86, reg92} : $signed((8'h9c)))) ?
          $unsigned({{reg98,
                  wire91}}) : ($unsigned($signed(reg93)) || ($signed(wire87) - ((8'had) * wire87)))) < reg98);
      reg100 <= $unsigned(((reg93 ?
          (&reg98[(3'h5):(3'h5)]) : (~{(8'hbc)})) && (8'hbd)));
    end
  always
    @(posedge clk) begin
      reg101 <= $signed(reg94[(1'h0):(1'h0)]);
      reg102 <= (~|wire89[(5'h11):(3'h7)]);
    end
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire signed [(5'h11):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  assign y = {wire47,
                 wire46,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= (8'h9e);
      reg44 <= {$unsigned(reg43[(2'h3):(2'h3)])};
      reg45 <= wire42[(4'hc):(4'h8)];
    end
  assign wire46 = (wire41 > (8'ha2));
  assign wire47 = wire41;
  always
    @(posedge clk) begin
      reg48 <= (((reg43[(3'h4):(2'h3)] ?
              wire46[(4'hf):(1'h1)] : wire39[(4'hd):(3'h7)]) ?
          wire39[(2'h3):(2'h3)] : wire47) != ({wire47[(3'h5):(1'h1)],
              {{(8'hb0), wire38}, wire42}} ?
          $unsigned(((~|wire42) * wire40[(2'h2):(2'h2)])) : (~&$signed((wire46 || reg44)))));
      reg49 <= $unsigned(reg44);
      reg50 <= wire40;
      if ((reg44[(1'h1):(1'h0)] ?
          (wire41 ?
              wire38 : (wire38[(2'h2):(1'h1)] >>> reg44)) : wire38[(1'h1):(1'h1)]))
        begin
          reg51 <= reg45[(1'h0):(1'h0)];
          reg52 <= (^~((($unsigned(reg49) <<< reg48[(3'h4):(3'h4)]) - (&{wire41})) ?
              ((!$signed(wire39)) <= (8'ha9)) : (((wire40 ? (8'ha0) : reg49) ?
                  wire40[(3'h4):(1'h0)] : {reg43, (8'hb4)}) << wire41)));
          reg53 <= (+((!$unsigned((wire46 != reg49))) ?
              wire40[(2'h3):(1'h1)] : $unsigned({$unsigned(reg49),
                  (reg44 >> wire46)})));
        end
      else
        begin
          reg51 <= {{$unsigned(reg48[(4'h9):(3'h5)]), (^(~$signed(reg52)))}};
        end
    end
endmodule

module module23
#(parameter param32 = (({(((8'hb4) ? (7'h40) : (8'hb5)) == ((8'hb7) || (8'hbe)))} + {(((8'haa) ? (8'hb8) : (8'haa)) >> (^(8'h9d))), (~(~&(8'h9e)))}) <= (((~|(~&(8'hab))) ? ((^~(8'hb0)) ? {(8'ha6), (8'ha7)} : {(8'hb8)}) : {((8'ha5) != (8'hbe))}) >>> {(((8'hb7) >= (8'haa)) ? {(7'h42), (8'hbc)} : ((8'hbf) ? (7'h41) : (8'hb4))), (((8'ha3) <<< (8'hba)) * ((8'had) <<< (8'hb8)))})), 
parameter param33 = {(((^{param32, param32}) != ((~|(8'hb6)) ? param32 : param32)) >>> param32)})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  assign y = {wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = (~&(!{$unsigned($unsigned(wire24)), {$signed((8'hb3))}}));
  assign wire29 = $unsigned(($signed(wire27[(3'h5):(3'h4)]) ?
                      (wire27 ^ $unsigned($unsigned(wire25))) : {wire24,
                          (wire26 <<< $signed((8'ha8)))}));
  assign wire30 = $signed($signed($signed(((wire26 + wire25) | (wire25 ?
                      wire28 : wire28)))));
  assign wire31 = $signed(($unsigned($unsigned((wire27 ? wire27 : wire27))) ?
                      wire27 : $unsigned((-wire24))));
endmodule
