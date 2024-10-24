module top
#(parameter param115 = ((((((8'ha6) ^~ (8'hbc)) ? ((8'ha4) ? (8'ha1) : (8'ha7)) : ((8'hb9) ? (8'h9d) : (8'hbe))) * (((8'ha8) > (8'h9c)) ? (&(8'hbc)) : ((8'hb1) ? (8'ha8) : (8'hb2)))) ? ((((8'h9e) > (8'hbf)) * ((8'ha0) ? (8'hbc) : (7'h44))) != ((7'h41) || ((8'hbf) ? (8'hb4) : (8'hb2)))) : {(8'hbc)}) >>> (~&(((~(8'hb2)) ? ((8'h9d) | (8'h9d)) : ((8'hb9) & (8'ha4))) ? {(^(8'ha0)), {(8'ha3), (8'ha4)}} : (8'ha1)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire113;
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire113,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (~^($unsigned({{wire1, wire2}, wire2[(3'h4):(3'h4)]}) ?
                     $unsigned($unsigned(wire3[(1'h1):(1'h0)])) : $signed((+(wire2 ?
                         wire1 : wire0)))));
  assign wire6 = {(wire0 ?
                         $signed((|(wire4 << wire2))) : $unsigned($signed((wire3 ?
                             wire2 : wire4))))};
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire0[(3'h5):(1'h0)]);
      if ($unsigned(wire6[(4'h8):(4'h8)]))
        begin
          if ((^~$signed((wire2[(2'h3):(2'h2)] ?
              reg7[(3'h4):(2'h3)] : (((8'hbd) ? wire4 : reg7) ?
                  $unsigned((8'h9c)) : $signed(wire1))))))
            begin
              reg8 <= (+{(|$signed((8'hbc))), {(8'hb1)}});
              reg9 <= wire4[(4'h9):(4'h9)];
              reg10 <= (~^$signed($signed((8'ha4))));
              reg11 <= wire4[(4'h8):(4'h8)];
              reg12 <= ($signed(((|$signed((8'haf))) ?
                      ($signed(wire0) ?
                          $signed(reg9) : reg9[(4'h8):(2'h2)]) : (!(wire3 ?
                          (8'ha0) : wire4)))) ?
                  $signed(wire5) : wire0);
            end
          else
            begin
              reg8 <= (reg9[(5'h10):(1'h1)] ?
                  $signed((~|{(reg10 >> (8'hb9))})) : ((reg12[(1'h1):(1'h0)] ?
                      ({reg9} ? (8'hac) : ((8'had) ^ wire3)) : ((!reg7) ?
                          wire3 : (8'haa))) - wire5[(3'h4):(2'h3)]));
            end
          reg13 <= reg7;
          reg14 <= reg7;
        end
      else
        begin
          if ((-$unsigned(reg13)))
            begin
              reg8 <= ((((~^reg12[(2'h2):(1'h1)]) != $signed({wire6})) <= ((!{wire0,
                      reg10}) <= ($unsigned(reg8) | (wire6 ?
                      (8'ha8) : wire0)))) ?
                  (~|(reg9[(4'h9):(3'h4)] >= $signed((!wire2)))) : (-wire6));
              reg9 <= wire5;
              reg10 <= ($signed(wire5) ?
                  $unsigned(wire2[(4'he):(4'ha)]) : wire0[(4'hb):(4'hb)]);
              reg11 <= $signed(wire0);
              reg12 <= wire4[(3'h6):(3'h6)];
            end
          else
            begin
              reg8 <= wire0;
              reg9 <= reg10;
              reg10 <= {($signed(wire2) < {reg9})};
              reg11 <= reg12;
            end
          if ((({(^~$signed(wire0))} ?
                  reg7 : ((reg9 <<< wire0) + wire3[(1'h0):(1'h0)])) ?
              $signed(reg12[(2'h2):(2'h2)]) : (($unsigned($signed((8'hbb))) ?
                  (((7'h42) >= wire4) ?
                      (wire0 * (8'hb0)) : (reg9 ?
                          wire5 : wire0)) : wire6[(4'h8):(4'h8)]) ^ reg8[(1'h1):(1'h1)])))
            begin
              reg13 <= (wire1[(1'h1):(1'h1)] ?
                  ({reg13[(1'h0):(1'h0)],
                          (((8'h9d) * wire6) + $signed(wire0))} ?
                      reg11[(2'h2):(1'h1)] : $signed($signed(reg8))) : reg9[(4'hb):(3'h5)]);
              reg14 <= (($unsigned($unsigned((reg7 <= wire3))) ?
                      (-(^~(~^(8'had)))) : ({$unsigned(wire3),
                          $unsigned(wire1)} | ((&reg11) ?
                          reg14 : wire0[(3'h6):(2'h3)]))) ?
                  {$signed(($signed(reg10) ?
                          $unsigned(reg12) : (reg8 ? reg11 : reg13))),
                      $signed({wire5[(2'h2):(1'h1)]})} : $signed(($unsigned((~&reg10)) ?
                      $unsigned((8'hb3)) : reg11)));
            end
          else
            begin
              reg13 <= (~|{((^~(~|wire2)) ^ $signed((wire1 ?
                      wire2 : (8'hb8))))});
              reg14 <= $unsigned((!$unsigned($signed((wire5 == wire3)))));
            end
          reg15 <= reg13[(2'h2):(2'h2)];
        end
    end
  assign wire16 = {($signed((|$unsigned((8'hbf)))) ?
                          {(+(reg10 ?
                                  wire0 : wire1))} : (~^{(reg7 ^~ (8'h9d))}))};
  assign wire17 = ((($unsigned(reg13) ?
                              reg7 : (wire1 ~^ wire2[(1'h1):(1'h1)])) ?
                          (reg15 ?
                              (wire16 == $unsigned(reg14)) : reg11) : $signed($signed(reg14))) ?
                      (wire4[(3'h6):(1'h1)] & {reg12[(1'h0):(1'h0)],
                          ($signed(wire5) != (~reg8))}) : ($signed(wire2[(3'h7):(2'h3)]) ^~ wire1[(2'h3):(1'h1)]));
  assign wire18 = ((+$unsigned({(~&wire6)})) ?
                      ($unsigned($unsigned(reg13[(2'h3):(1'h0)])) ?
                          $signed(wire6[(3'h4):(1'h0)]) : (!(~&$signed(wire1)))) : $unsigned((^~(~|((8'hbc) ?
                          reg11 : reg13)))));
  assign wire19 = {wire17};
  module20 #() modinst114 (.wire22(wire3), .y(wire113), .clk(clk), .wire23(reg12), .wire25(reg7), .wire24(wire5), .wire21(wire6));
endmodule

module module20  (y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire21;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire93;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire91;
  reg signed [(5'h15):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire26,
                 wire27,
                 wire42,
                 wire91,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg94,
                 (1'h0)};
  assign wire26 = $unsigned(((^~wire23) ?
                      {$signed((^~wire24))} : (($unsigned(wire21) ?
                              {(8'ha1), wire25} : $unsigned(wire22)) ?
                          $unsigned((wire22 | (8'hbd))) : $signed(((7'h43) ^~ wire25)))));
  assign wire27 = wire25;
  module28 #() modinst43 (wire42, clk, wire24, wire21, wire25, wire23);
  module44 #() modinst92 (.y(wire91), .wire49(wire27), .wire46(wire23), .wire48(wire25), .wire45(wire21), .wire47(wire22), .clk(clk));
  assign wire93 = $signed(($signed(wire25) >>> ({wire24,
                      wire26} >= wire21[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg94 <= (~|(wire23[(4'h9):(3'h7)] ?
          ({wire26} ?
              ((wire27 ^ wire23) ^ (&wire23)) : wire91) : (wire25[(3'h7):(2'h3)] * $unsigned((8'hb4)))));
    end
  assign wire95 = ($unsigned(wire91) ?
                      wire25[(3'h5):(1'h0)] : $unsigned({(~|$signed(wire93)),
                          $signed($signed((7'h44)))}));
  assign wire96 = ((~^$unsigned({(reg94 ? (7'h42) : wire91),
                      wire27[(3'h5):(3'h4)]})) != wire21);
  assign wire97 = ((((((8'hae) ? wire93 : wire91) <= $unsigned(wire93)) ?
                          ($signed((8'ha6)) ?
                              (8'h9e) : wire21) : wire42[(1'h0):(1'h0)]) + (~^$signed(((7'h41) < (8'hb4))))) ?
                      (wire23[(4'hb):(3'h5)] ?
                          $unsigned(wire22[(2'h2):(2'h2)]) : (wire93 ?
                              wire23 : wire26[(1'h1):(1'h0)])) : $unsigned({$signed((~wire42)),
                          ((8'hb2) + $signed((7'h42)))}));
  assign wire98 = ((+$signed((wire95[(1'h1):(1'h0)] ?
                      {wire96} : $signed(wire93)))) <= $signed(wire26[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if (wire91[(3'h6):(3'h5)])
        begin
          reg99 <= ($signed(($signed(wire91) ?
                  wire27[(4'h8):(4'h8)] : (~(|(8'h9d))))) ?
              (&(($unsigned(wire98) ?
                  (^~wire26) : wire21[(1'h0):(1'h0)]) + (|(wire42 <<< wire26)))) : ((8'hbe) < $unsigned((reg94[(2'h2):(2'h2)] <= $unsigned(wire22)))));
          reg100 <= (!(&wire98[(3'h4):(3'h4)]));
        end
      else
        begin
          reg99 <= (($signed($signed($unsigned(wire91))) > reg94[(5'h10):(2'h2)]) < ($signed(wire26) == (~$signed(wire98))));
          reg100 <= wire25;
          reg101 <= (($signed({reg100[(5'h14):(1'h1)]}) & (-wire98[(4'h9):(3'h5)])) ~^ (8'hb1));
          reg102 <= {wire98[(2'h2):(2'h2)]};
          reg103 <= reg101[(5'h15):(4'hc)];
        end
      if (((reg103 ?
              reg100 : (-(wire24[(5'h13):(5'h11)] << (reg103 <= wire27)))) ?
          (reg103[(2'h2):(1'h1)] ?
              $signed(($signed(wire96) ?
                  $unsigned(wire96) : $unsigned(wire93))) : reg99) : wire95))
        begin
          reg104 <= wire25;
          reg105 <= ((~^(wire22 ?
              (~|(|reg99)) : (~&(|(8'hbb))))) > ({((8'h9d) << (wire23 || reg101)),
                  ((wire95 ? reg104 : wire98) ?
                      wire98[(3'h7):(3'h4)] : {wire91, wire93})} ?
              $unsigned(wire97[(4'hb):(4'hb)]) : {{reg104,
                      reg104[(4'he):(4'ha)]}}));
          reg106 <= ($signed(wire23[(3'h5):(2'h3)]) ?
              $unsigned((-wire97)) : (^~wire96));
          if (($signed($signed($signed($signed((8'hb0))))) > {$signed($unsigned((wire98 < (8'hbe))))}))
            begin
              reg107 <= wire95[(4'h8):(3'h5)];
              reg108 <= (-reg104);
              reg109 <= reg103[(2'h3):(1'h0)];
            end
          else
            begin
              reg107 <= (reg99[(4'hb):(1'h1)] ?
                  reg102 : (~|reg108[(4'ha):(4'ha)]));
            end
        end
      else
        begin
          reg104 <= {$unsigned($unsigned(reg107[(4'h9):(1'h1)]))};
          reg105 <= (reg105[(4'hc):(4'hc)] ?
              ((^(+$signed((8'hbf)))) ?
                  $unsigned(($signed(reg94) >> $unsigned(wire97))) : (&(|{wire98,
                      reg106}))) : wire93);
          reg106 <= (reg107[(4'hf):(2'h3)] == (wire24 || reg104[(5'h12):(4'he)]));
          reg107 <= reg104;
          reg108 <= $unsigned($signed(((!wire22) ?
              $signed(wire22[(1'h1):(1'h0)]) : $signed((wire91 ?
                  reg94 : wire25)))));
        end
      reg110 <= $unsigned((^~(wire98[(1'h1):(1'h1)] ? wire27 : {wire96})));
    end
  assign wire111 = ((((reg94 * {wire42}) ~^ ((^(8'hbe)) ^~ (wire22 ?
                           wire25 : reg94))) >= $signed(((~&wire24) ^~ {wire25}))) ?
                       $unsigned(($unsigned($signed((8'ha2))) ^ $signed($unsigned(reg110)))) : (($signed($signed((7'h44))) ?
                           $signed($signed(reg100)) : ((8'hb0) >>> (wire97 ?
                               reg109 : wire42))) || $unsigned((!reg104[(4'h9):(3'h4)]))));
  assign wire112 = reg101;
endmodule

module module44
#(parameter param90 = (-(~(((7'h40) ? ((8'hb6) ? (8'ha8) : (8'ha0)) : {(7'h43), (8'hba)}) >>> ({(8'h9c), (8'hba)} ? {(7'h42), (8'had)} : ((8'hbb) ? (7'h42) : (7'h40)))))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire49;
  input wire signed [(4'he):(1'h0)] wire48;
  input wire [(2'h2):(1'h0)] wire47;
  input wire [(4'h8):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire50;
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire50,
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
                 reg51,
                 (1'h0)};
  assign wire50 = ((8'hb7) - (!wire46[(4'h8):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire47)
        begin
          reg51 <= $signed(wire46[(1'h1):(1'h1)]);
          reg52 <= $unsigned((($signed((~^wire48)) | (^$signed(wire47))) < (($signed(wire46) ?
              wire48[(3'h7):(1'h1)] : (wire50 ?
                  (8'hbc) : wire49)) & (wire46 && $unsigned((8'hb6))))));
          reg53 <= (7'h44);
        end
      else
        begin
          reg51 <= (~($signed(((&(8'h9f)) | (!wire45))) ?
              $signed({wire47}) : $signed(reg53[(3'h5):(2'h3)])));
        end
      reg54 <= $unsigned(wire50[(4'ha):(4'h8)]);
      if ($unsigned((~{((^~(8'hae)) >= wire47[(1'h1):(1'h1)])})))
        begin
          reg55 <= (wire45 & $unsigned({$signed((~(8'ha0)))}));
          if (reg54)
            begin
              reg56 <= reg51[(2'h3):(2'h3)];
            end
          else
            begin
              reg56 <= ((~|{(((8'hb8) ?
                          wire47 : reg52) <<< reg52[(2'h3):(1'h0)]),
                      wire50}) ?
                  $signed((wire50[(4'h9):(4'h8)] >= (reg52 ?
                      wire48[(4'he):(4'ha)] : reg53[(4'ha):(3'h4)]))) : ((wire48 ?
                      (~&reg55[(3'h4):(1'h0)]) : ((reg51 >= wire45) ?
                          ((8'haa) ? wire45 : wire49) : wire47)) >= wire50));
              reg57 <= $unsigned((^(~reg51[(3'h6):(3'h5)])));
              reg58 <= (~&{reg57[(3'h4):(1'h0)]});
              reg59 <= ((~{(wire49[(1'h1):(1'h0)] ?
                          reg54[(3'h5):(1'h0)] : (!reg56)),
                      reg52}) ?
                  reg57[(3'h7):(1'h1)] : {$signed(wire47),
                      ($unsigned(reg51) ?
                          $signed(wire49[(1'h0):(1'h0)]) : ($unsigned(wire46) ^~ (-reg54)))});
            end
          reg60 <= ((|((&(reg55 > reg56)) ?
                  $unsigned($unsigned(wire49)) : (~(reg58 ? wire45 : reg56)))) ?
              $unsigned(reg58[(1'h1):(1'h0)]) : (reg59 <= $unsigned((~|(^~reg52)))));
          reg61 <= (reg57 ?
              wire45[(3'h7):(3'h6)] : {(^({wire47, reg53} ?
                      (reg55 ~^ wire50) : (reg60 && (8'hb1)))),
                  reg57[(2'h2):(1'h1)]});
        end
      else
        begin
          reg55 <= $signed((~^$unsigned(reg57[(3'h7):(1'h0)])));
          reg56 <= wire45[(4'h9):(3'h6)];
          reg57 <= (wire47 | reg52[(1'h0):(1'h0)]);
          reg58 <= ($unsigned((((-reg61) ?
                      reg52 : ((7'h40) ? wire48 : wire49)) ?
                  ((!reg53) ?
                      (reg52 ?
                          wire46 : reg60) : reg60[(5'h12):(4'ha)]) : (reg57 >= $signed(reg59)))) ?
              ((($unsigned((8'h9e)) ~^ wire45[(3'h6):(3'h5)]) ?
                      (-(-wire45)) : $unsigned((reg60 << reg61))) ?
                  $unsigned((^~$unsigned(reg53))) : $unsigned(($unsigned(reg55) ?
                      (wire47 <= reg51) : $signed((8'hb1))))) : reg60[(4'hb):(3'h7)]);
        end
    end
  always
    @(posedge clk) begin
      if ((7'h40))
        begin
          reg62 <= wire48[(4'h9):(1'h1)];
          if (reg54[(4'h8):(1'h0)])
            begin
              reg63 <= (reg51[(2'h3):(2'h3)] ?
                  $signed((({reg60} != wire49[(2'h2):(2'h2)]) ?
                      ((reg62 < wire49) <<< (reg54 ?
                          wire48 : wire49)) : reg59)) : ($unsigned(({wire46,
                          wire49} != (reg54 & reg60))) ?
                      (!reg51) : ($signed((+wire50)) && $unsigned((reg54 ?
                          reg58 : reg56)))));
              reg64 <= ((reg62 == $signed(reg61[(1'h1):(1'h0)])) != {($unsigned(reg51) ^ $unsigned($signed(reg57)))});
              reg65 <= reg54;
            end
          else
            begin
              reg63 <= (reg63[(3'h6):(3'h4)] > $unsigned((^$signed($unsigned((8'h9c))))));
              reg64 <= reg61;
              reg65 <= $signed(reg62[(1'h0):(1'h0)]);
              reg66 <= ((~|(reg56 ? reg65 : $unsigned((reg53 - reg60)))) ?
                  $signed(wire49[(1'h1):(1'h1)]) : (!({reg59, (8'hb8)} ?
                      reg53 : wire49)));
            end
        end
      else
        begin
          reg62 <= $unsigned(reg63);
          reg63 <= $signed($unsigned($unsigned(reg55[(4'hf):(4'he)])));
        end
      if (reg55)
        begin
          reg67 <= $signed(reg59[(1'h0):(1'h0)]);
          reg68 <= reg53[(4'hc):(2'h3)];
          if ((({$signed((^~wire48))} ^ wire48[(3'h4):(2'h2)]) ?
              reg59[(2'h3):(1'h1)] : reg53))
            begin
              reg69 <= {(~$unsigned((&(+reg64)))),
                  $signed({((reg56 != reg53) >= (wire48 || reg60))})};
              reg70 <= ((reg59[(3'h5):(3'h5)] ?
                  reg57[(4'h8):(2'h2)] : {(^reg61)}) >> ((+reg57) ?
                  (reg58[(1'h0):(1'h0)] ?
                      ($unsigned((8'hb1)) >>> (~reg62)) : {(reg56 != reg57),
                          ((8'hbe) ?
                              reg56 : reg57)}) : $unsigned(wire46[(4'h8):(1'h0)])));
              reg71 <= (^~$unsigned((^~(+reg60))));
            end
          else
            begin
              reg69 <= {$signed(reg51[(3'h6):(1'h0)]), (!(|reg52))};
              reg70 <= {reg55, reg51};
              reg71 <= reg53[(4'hf):(4'ha)];
              reg72 <= (({$signed({reg58}),
                      reg66[(2'h2):(1'h0)]} <= (^~(~^(!reg58)))) ?
                  ((!reg58) + ({(&reg57)} ?
                      reg70[(2'h2):(2'h2)] : ($unsigned(reg56) ?
                          reg53[(4'h8):(1'h0)] : wire46))) : ((~&(reg63 ?
                      ((8'hbd) & reg59) : $signed(reg51))) + (((reg52 ?
                          reg63 : reg62) && reg59[(3'h5):(1'h1)]) ?
                      wire47[(1'h0):(1'h0)] : (wire50 ?
                          wire50[(4'h9):(4'h8)] : wire49))));
            end
          reg73 <= ($signed(($signed(reg51) && (reg58 ?
              reg56[(1'h1):(1'h1)] : wire47))) >= $unsigned({reg51[(3'h4):(2'h3)],
              (~^(7'h44))}));
        end
      else
        begin
          reg67 <= (~(-$unsigned(((reg62 ? reg71 : reg56) ?
              ((7'h44) ? (8'hbc) : (8'ha0)) : {reg70}))));
          reg68 <= (reg53 ?
              (reg60[(1'h1):(1'h0)] | reg67[(3'h4):(2'h2)]) : wire50[(3'h6):(3'h5)]);
          reg69 <= ((8'hb7) ?
              (~|$signed($unsigned((|reg67)))) : (($signed((wire45 ~^ reg62)) ?
                  ((reg63 ? (8'hac) : reg55) ?
                      $unsigned(wire45) : $signed(reg55)) : ((&reg51) != (~&reg65))) ^~ $signed((wire48 ?
                  $signed(reg56) : (wire45 ? reg60 : reg72)))));
          reg70 <= (~&{reg71});
        end
      if (reg53[(3'h5):(2'h2)])
        begin
          reg74 <= ($signed(reg71) ? (8'ha3) : (~(8'ha8)));
          reg75 <= $unsigned($unsigned($signed((-(reg69 | reg58)))));
        end
      else
        begin
          if ({(reg56[(5'h12):(4'hf)] || $unsigned((-$signed(reg73))))})
            begin
              reg74 <= ({$unsigned((!$unsigned(reg54))), reg51} ?
                  ((8'hba) != $signed($unsigned($unsigned(reg53)))) : $signed(((8'hba) >>> reg54)));
            end
          else
            begin
              reg74 <= $unsigned(($signed((wire50[(3'h5):(3'h5)] ?
                      (reg68 >= reg56) : ((8'hbb) ? reg72 : reg53))) ?
                  {$unsigned($unsigned(wire47)), {$signed((8'hab))}} : wire48));
              reg75 <= $unsigned((^(~reg64[(4'hb):(4'hb)])));
              reg76 <= $unsigned((~|wire46));
              reg77 <= (((&$unsigned({reg76})) << $signed(reg64[(1'h0):(1'h0)])) == (^~(wire49[(1'h0):(1'h0)] << $signed((reg51 < reg70)))));
              reg78 <= reg52[(3'h6):(2'h3)];
            end
          if ($signed({(($unsigned((8'hb7)) <<< {reg56}) ?
                  wire48[(4'hd):(3'h4)] : ($unsigned(reg60) ?
                      (reg68 == reg58) : {reg72}))}))
            begin
              reg79 <= (wire50[(1'h1):(1'h1)] && ($signed($signed((8'hb7))) ?
                  reg59[(3'h5):(2'h3)] : $unsigned({(^~wire49), (~|(8'ha9))})));
              reg80 <= reg53;
            end
          else
            begin
              reg79 <= (((~|$unsigned((~|wire47))) ?
                      (reg80 ?
                          $signed((+reg61)) : reg76) : $unsigned($unsigned((reg57 || reg59)))) ?
                  ($signed($signed(reg70)) ?
                      (reg57 ?
                          $unsigned(reg75) : (~|reg74[(1'h1):(1'h1)])) : (8'h9d)) : {(($signed(reg70) ^ reg71) << (reg70 >>> $unsigned(reg77)))});
              reg80 <= (8'hae);
              reg81 <= ({(wire46[(3'h7):(2'h3)] ?
                      reg68[(5'h10):(2'h2)] : ((reg68 > reg54) == wire46)),
                  ($unsigned((reg73 ?
                      reg66 : reg74)) >> $signed(((8'h9f) <<< wire47)))} == ({($unsigned(reg72) * (reg54 ?
                      reg68 : reg60)),
                  $signed(reg64)} * wire46[(2'h3):(1'h0)]));
              reg82 <= (reg77 + reg79);
            end
          reg83 <= (($unsigned((~$signed(reg52))) && $unsigned(reg55)) ?
              reg78 : reg54);
          reg84 <= (($signed(wire45[(2'h3):(1'h1)]) ?
                  reg62 : (((-reg65) << (~^reg78)) && ((!wire50) ?
                      $signed(reg66) : (^(8'hbc))))) ?
              $signed($unsigned((-(wire48 ?
                  reg51 : reg68)))) : $unsigned($unsigned(((!reg64) > {reg55}))));
        end
      reg85 <= (!$unsigned({((reg81 ? reg69 : reg74) >>> (reg70 ^~ reg81))}));
      reg86 <= reg69;
    end
  always
    @(posedge clk) begin
      reg87 <= (~{$signed(($signed((8'ha7)) ^ (reg80 ? reg69 : wire46)))});
    end
  assign wire88 = reg76[(3'h7):(3'h5)];
  assign wire89 = $unsigned((|(~|(8'hb0))));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire32;
  input wire signed [(4'h9):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(3'h4):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = $signed(wire31);
  assign wire34 = (~^(($unsigned(wire33) >>> $unsigned((+wire30))) <= wire29));
  assign wire35 = $signed(wire33[(3'h7):(2'h3)]);
  assign wire36 = $signed($signed($signed({$unsigned(wire30)})));
  assign wire37 = (wire33[(4'he):(1'h0)] ? (8'ha6) : (&(8'hb4)));
  assign wire38 = $signed(($unsigned(((wire30 ? wire31 : wire33) ?
                      (wire37 ?
                          wire36 : wire34) : $signed(wire35))) == wire31[(4'h9):(4'h9)]));
  assign wire39 = (~&$signed($unsigned($signed((wire37 ? wire32 : wire37)))));
  assign wire40 = (((^~wire31) ?
                      wire39 : (($unsigned((7'h43)) > $unsigned((8'hae))) ?
                          (+(wire39 ?
                              wire31 : wire29)) : wire31[(2'h2):(1'h1)])) ~^ ($unsigned((~|$unsigned(wire36))) && (wire38[(2'h3):(2'h2)] >>> $signed($unsigned(wire33)))));
  assign wire41 = $unsigned((~|(~|((wire35 ?
                      wire37 : wire34) == wire30[(1'h0):(1'h0)]))));
endmodule
