module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire signed [(5'h14):(1'h0)] wire151;
  wire signed [(2'h2):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire77;
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire95,
                 wire81,
                 wire80,
                 wire79,
                 wire4,
                 wire5,
                 wire6,
                 wire10,
                 wire77,
                 reg9,
                 reg8,
                 reg7,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 (1'h0)};
  assign wire4 = wire1[(2'h2):(2'h2)];
  assign wire5 = wire4[(2'h2):(2'h2)];
  assign wire6 = (8'hb6);
  always
    @(posedge clk) begin
      reg7 <= $signed((~{$unsigned(wire3), wire3}));
      reg8 <= $unsigned($signed((wire6 >>> wire6[(4'hc):(2'h2)])));
      reg9 <= wire1;
    end
  assign wire10 = {$unsigned(reg7)};
  module11 #() modinst78 (.wire15(reg7), .wire12(wire10), .wire14(wire5), .wire13(wire3), .y(wire77), .clk(clk));
  assign wire79 = $signed((^(8'haf)));
  assign wire80 = $unsigned((wire2 <<< wire3));
  assign wire81 = wire80[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg82 <= wire77;
      reg83 <= $unsigned((($unsigned($unsigned(wire2)) ?
          (~&(wire5 <= reg7)) : ($signed((8'hae)) ?
              (^wire81) : wire4[(4'hc):(1'h1)])) && (($signed(wire77) ?
              wire4 : (wire5 ? wire3 : wire77)) ?
          $signed(wire79[(4'hb):(4'hb)]) : wire77)));
      if ((reg8[(4'h8):(3'h4)] ?
          wire4 : ($signed(($signed((8'h9c)) < (~&reg8))) - (-$signed((~reg83))))))
        begin
          reg84 <= wire5[(3'h6):(2'h3)];
          reg85 <= $signed(wire3[(4'hc):(3'h7)]);
        end
      else
        begin
          reg84 <= {(($signed((~^reg8)) & reg84[(3'h7):(2'h3)]) ?
                  (((wire3 <= reg7) != reg7) > $signed((!wire6))) : $signed($unsigned({(7'h42)}))),
              (reg82 ? wire80 : (wire5 <<< (^~(wire2 ? wire0 : wire4))))};
          reg85 <= (reg7 ?
              (&{$unsigned((wire77 <= wire2)),
                  (wire77 >> (reg8 ?
                      wire81 : reg84))}) : $unsigned(($unsigned($signed(reg84)) ?
                  (reg8 ?
                      wire10[(2'h2):(1'h0)] : ((8'h9c) <= wire81)) : wire5)));
          reg86 <= $unsigned(($signed($unsigned((wire77 ?
              wire77 : reg82))) <<< reg85[(2'h2):(1'h1)]));
          reg87 <= (wire79 * reg9[(3'h6):(1'h1)]);
          if (wire77[(5'h11):(4'hb)])
            begin
              reg88 <= (((($signed((8'ha5)) > $signed(reg85)) ^~ $signed($signed(wire10))) <<< wire77) ?
                  wire81[(1'h1):(1'h0)] : $unsigned(reg84));
              reg89 <= ($unsigned($signed($signed($unsigned((8'hb1))))) >>> (-$unsigned((8'ha9))));
              reg90 <= ((wire81 ?
                      $unsigned((wire5[(4'ha):(1'h1)] <= reg88)) : ($signed((^~reg8)) ?
                          reg82 : (~|reg82[(4'hb):(1'h1)]))) ?
                  {reg8} : (~^$signed((reg82 ?
                      (reg83 == reg87) : $unsigned(reg8)))));
              reg91 <= (~&((wire6 ?
                  wire6 : reg9[(4'ha):(3'h6)]) ^ (~(wire81[(3'h5):(1'h0)] ?
                  reg85[(1'h0):(1'h0)] : {reg85, wire1}))));
            end
          else
            begin
              reg88 <= $unsigned({(($unsigned(reg90) + (reg89 ?
                      reg7 : wire6)) >> wire3[(3'h5):(3'h4)]),
                  (+wire3[(4'h9):(2'h3)])});
              reg89 <= $signed((~$signed((^(wire3 ? reg87 : reg86)))));
              reg90 <= ((+(-wire2)) ?
                  ((reg9 ?
                          {$unsigned((8'haf))} : ($signed((8'hb6)) ?
                              ((8'haa) ? (7'h42) : wire1) : {wire6})) ?
                      $unsigned({(wire4 << (7'h44))}) : $signed($signed(wire10[(4'h9):(4'h9)]))) : $unsigned((((8'hab) | (wire3 ?
                          reg84 : wire4)) ?
                      wire80 : wire80)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg92 <= (!(({$signed(wire3), (wire81 | reg83)} ?
          (wire77 << (~|reg91)) : (^wire2)) && reg7));
      reg93 <= (($signed(wire80) <= $signed(($unsigned(reg9) == (wire6 ?
          wire1 : wire4)))) + wire2);
      reg94 <= $signed($unsigned(wire3[(4'he):(2'h3)]));
    end
  assign wire95 = ((wire1 ?
                          ((~^(reg85 | reg7)) == (^~(wire77 & (8'hab)))) : $signed(reg7)) ?
                      ($unsigned({(reg9 <= wire77)}) ?
                          $unsigned($unsigned($signed(reg90))) : ($unsigned(((8'hb3) >> reg87)) ?
                              ($unsigned(reg91) >= reg87) : (|$unsigned(wire3)))) : (~^$unsigned($signed($signed(wire80)))));
  module96 #() modinst148 (wire147, clk, reg94, wire95, wire0, reg91, reg89);
  assign wire149 = (wire6 <<< wire2[(1'h0):(1'h0)]);
  assign wire150 = ((!{($signed(reg9) == ((8'hb1) == wire77)),
                       $unsigned(wire149)}) ~^ (|$unsigned($unsigned((wire147 ?
                       reg87 : reg9)))));
  assign wire151 = wire81[(1'h1):(1'h0)];
  assign wire152 = {wire151[(4'hc):(3'h5)], reg8[(3'h7):(3'h7)]};
  assign wire153 = $signed(wire95);
  assign wire154 = ($signed(reg87) <<< {$unsigned($unsigned($signed(reg89)))});
  assign wire155 = (|(wire152[(4'h8):(3'h7)] || $unsigned(reg91)));
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire101;
  input wire signed [(4'hf):(1'h0)] wire100;
  input wire [(2'h2):(1'h0)] wire99;
  input wire [(3'h7):(1'h0)] wire98;
  input wire signed [(5'h14):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire146;
  wire [(4'he):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire102;
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire142,
                 wire114,
                 wire113,
                 wire106,
                 wire102,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire102 = $signed($unsigned(wire99[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg103 <= {wire97[(4'hc):(1'h0)]};
      reg104 <= (wire100[(4'hc):(3'h4)] ?
          $signed(((((8'hb1) >= wire98) ?
              (&wire98) : (~^reg103)) == (wire97[(3'h6):(1'h1)] ^ (wire98 <= wire97)))) : (8'h9c));
      reg105 <= ((&(-(^~(&reg104)))) - wire98[(3'h6):(2'h3)]);
    end
  assign wire106 = ((-$signed(wire102)) <= (|wire102));
  always
    @(posedge clk) begin
      if (($signed((~$signed($unsigned(wire98)))) <= (+(wire100 ?
          $signed((|wire99)) : {(+reg105), $signed((8'ha6))}))))
        begin
          reg107 <= (reg103 <= ((-(~|{wire106, wire106})) ?
              (+(~(~|wire98))) : (~(^~$signed(wire106)))));
          reg108 <= (^(^~$signed((8'hbb))));
          reg109 <= ((^~wire106[(2'h2):(1'h1)]) ?
              wire99 : wire99[(2'h2):(2'h2)]);
          if (({(~^$signed($signed(wire100)))} ^ wire100))
            begin
              reg110 <= ({wire106[(1'h1):(1'h0)],
                  reg109[(3'h6):(3'h5)]} << (reg105 ?
                  reg108 : reg108[(1'h0):(1'h0)]));
            end
          else
            begin
              reg110 <= ((^~$unsigned(reg104)) ?
                  wire99[(1'h1):(1'h1)] : wire100[(1'h0):(1'h0)]);
              reg111 <= wire97;
              reg112 <= (+reg104[(4'hc):(4'hc)]);
            end
        end
      else
        begin
          reg107 <= $unsigned(reg109);
          reg108 <= $signed((wire101 ?
              reg110[(1'h0):(1'h0)] : $unsigned(reg110[(2'h2):(2'h2)])));
          reg109 <= (-reg108);
        end
    end
  assign wire113 = ($unsigned(reg109[(3'h4):(1'h0)]) ?
                       wire102 : ((reg110 ?
                           (wire106[(3'h4):(1'h0)] && (wire98 ^~ reg112)) : {{reg105,
                                   wire97}}) ^ $unsigned(((reg107 > wire100) <<< $unsigned(reg109)))));
  assign wire114 = $unsigned(reg111[(2'h3):(2'h3)]);
  module115 #() modinst143 (wire142, clk, reg112, reg110, wire97, wire113);
  assign wire144 = wire98[(3'h4):(2'h2)];
  assign wire145 = ({(((wire142 >> reg110) ?
                               reg107[(4'hf):(3'h5)] : $unsigned(reg109)) ?
                           $signed((~&wire99)) : ($unsigned(reg104) ?
                               (reg107 ? wire100 : reg107) : (^wire101))),
                       $unsigned(reg105[(1'h1):(1'h0)])} != (-(((wire144 ?
                               wire113 : wire113) ?
                           (wire106 + wire113) : (reg108 == wire100)) ?
                       $unsigned((~|reg105)) : reg103)));
  assign wire146 = $unsigned($signed((8'hb3)));
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire42;
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire45,
                 wire44,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire42,
                 (1'h0)};
  assign wire16 = wire13;
  assign wire17 = $unsigned($unsigned(wire12[(2'h3):(2'h3)]));
  assign wire18 = wire16;
  assign wire19 = wire16[(4'hf):(2'h2)];
  module20 #() modinst43 (wire42, clk, wire13, wire17, wire15, wire18, wire19);
  assign wire44 = wire14;
  assign wire45 = (8'ha4);
  module46 #() modinst73 (.wire47(wire17), .clk(clk), .wire50(wire19), .wire48(wire45), .y(wire72), .wire49(wire13));
  assign wire74 = wire42;
  assign wire75 = $unsigned((7'h42));
  assign wire76 = $unsigned($signed($unsigned($signed(wire44[(4'he):(3'h6)]))));
endmodule

module module46
#(parameter param70 = ((~|(!(|(~^(8'hb2))))) * ((((~(8'hb6)) == ((8'ha7) ^ (8'hbc))) ? (8'hb3) : ((~&(8'hbe)) ? ((8'hb5) ^~ (8'hba)) : {(8'hb7), (8'hb8)})) + {({(8'ha8), (8'hba)} ~^ (8'hbe))})), 
parameter param71 = {({((8'had) + (8'hb8)), (~(~(8'h9c)))} ^ (({param70} ? (param70 ? param70 : param70) : param70) > {(param70 ^ param70)})), param70})
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(4'hd):(1'h0)] wire49;
  input wire signed [(4'he):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
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
  always
    @(posedge clk) begin
      reg51 <= $signed($unsigned({$signed($signed(wire49)),
          wire47[(3'h5):(1'h1)]}));
      reg52 <= wire50[(2'h3):(2'h2)];
      reg53 <= $unsigned(({$signed($unsigned(wire50))} ?
          {{(|wire47), reg51}, $unsigned((wire49 > wire50))} : reg52));
      if ($unsigned(({(&wire48)} ? reg53 : $unsigned((~&(+(8'ha1)))))))
        begin
          if ($unsigned(($signed($unsigned($unsigned(reg53))) <= wire50)))
            begin
              reg54 <= $signed(($signed(wire50) || (^$signed((reg52 ^ (8'ha8))))));
              reg55 <= reg51[(4'ha):(3'h4)];
            end
          else
            begin
              reg54 <= ({(wire47[(2'h3):(2'h3)] * $unsigned(wire48)),
                      wire47[(2'h3):(2'h3)]} ?
                  (((wire48 != (wire50 ? wire48 : wire47)) < ($signed(reg51) ?
                      (wire47 == wire47) : wire49)) >>> $signed({wire47,
                      {(8'hb1), wire50}})) : reg51[(2'h2):(2'h2)]);
              reg55 <= ({reg52, wire49} ?
                  wire47 : $signed(reg54[(3'h4):(3'h4)]));
              reg56 <= reg54;
              reg57 <= wire49[(4'h8):(3'h4)];
              reg58 <= reg57[(4'h8):(1'h1)];
            end
          reg59 <= ($signed(($signed($signed((8'had))) ?
                  wire49[(4'ha):(3'h6)] : $unsigned(((8'h9c) ?
                      wire50 : reg51)))) ?
              $signed($signed((^(8'ha7)))) : ((reg55[(3'h5):(2'h2)] ~^ $signed(reg58[(2'h3):(1'h0)])) ?
                  reg51[(3'h7):(3'h4)] : ({reg52[(1'h0):(1'h0)],
                      $signed(reg56)} - wire49)));
          if (reg55)
            begin
              reg60 <= (($signed($signed(wire50)) ?
                      {reg58[(3'h4):(2'h2)]} : reg52) ?
                  $unsigned(reg58) : (~^(reg52[(1'h0):(1'h0)] * reg58[(5'h10):(3'h6)])));
            end
          else
            begin
              reg60 <= (~((+reg60[(3'h5):(3'h4)]) > ((reg53[(3'h5):(2'h3)] ?
                  wire48 : $signed(reg57)) * $signed({reg57}))));
            end
          if ($unsigned((&$unsigned($unsigned(reg59)))))
            begin
              reg61 <= reg54;
              reg62 <= ((({(reg54 && reg51), $unsigned(wire48)} ?
                  (+$unsigned(wire47)) : ((~&(8'hab)) ?
                      {reg61, reg58} : (reg54 ?
                          reg58 : reg61))) >= reg55) <= (~^((!{reg54,
                  (8'ha8)}) < ((reg56 ? wire50 : reg53) ?
                  reg51[(1'h0):(1'h0)] : reg56[(4'h9):(2'h3)]))));
              reg63 <= (wire48[(3'h6):(1'h0)] >= (reg52[(1'h1):(1'h1)] ^ wire47));
              reg64 <= ((reg60 ?
                  wire49[(3'h7):(2'h2)] : (!(~^$unsigned(reg60)))) << $signed({$signed((wire49 >> reg56)),
                  (reg55[(2'h3):(1'h0)] ? (reg61 ? reg59 : reg51) : reg61)}));
              reg65 <= $signed(reg56[(3'h5):(3'h5)]);
            end
          else
            begin
              reg61 <= wire49[(3'h6):(1'h1)];
              reg62 <= $unsigned(($unsigned({$signed(reg64)}) <= ($unsigned((reg65 + reg51)) | reg64)));
              reg63 <= {reg56[(3'h5):(2'h2)],
                  {(reg52 ? reg51 : $signed($signed(reg54)))}};
            end
        end
      else
        begin
          reg54 <= {$signed(reg53)};
          reg55 <= (~^reg53[(1'h1):(1'h1)]);
          if (({(reg57[(4'hc):(3'h5)] ?
                  $signed(reg59[(1'h0):(1'h0)]) : $signed($signed(reg61)))} & $signed((($unsigned((8'ha5)) ?
                  $signed(wire50) : ((7'h44) ? reg61 : wire47)) ?
              ((8'hb5) ?
                  (reg64 && reg61) : $unsigned(reg55)) : ($signed(reg64) & reg58)))))
            begin
              reg56 <= $signed($unsigned($unsigned(reg56[(3'h5):(2'h3)])));
              reg57 <= (!(({reg55[(1'h0):(1'h0)]} ?
                      reg62[(4'he):(1'h1)] : $unsigned($unsigned(reg60))) ?
                  reg59[(2'h2):(1'h1)] : $signed($signed((~|reg53)))));
              reg58 <= $signed((reg64 ?
                  {((reg65 ? reg51 : reg55) ?
                          (|wire49) : $signed(reg63))} : $unsigned(((-reg57) >= wire50))));
              reg59 <= $signed(((7'h42) ? (8'ha3) : (|{$unsigned(reg51)})));
              reg60 <= (reg63 ?
                  (wire49 ?
                      $signed((reg56 ?
                          (^(8'hbf)) : $unsigned(reg58))) : reg56) : reg60[(2'h2):(2'h2)]);
            end
          else
            begin
              reg56 <= ((reg64 + ($unsigned(reg59) * $unsigned({reg53,
                      (8'hb3)}))) ?
                  (|$unsigned(((reg60 || wire47) ^~ wire49[(2'h2):(2'h2)]))) : ((wire49[(3'h5):(2'h2)] && $unsigned($unsigned(reg61))) == $signed(reg64)));
              reg57 <= reg62;
              reg58 <= (wire49[(3'h4):(1'h0)] ?
                  ($signed((^~(~^reg62))) ?
                      reg51[(3'h7):(3'h7)] : reg63[(2'h3):(1'h1)]) : $unsigned($signed((reg64 || reg63[(2'h2):(2'h2)]))));
              reg59 <= (-(8'ha9));
              reg60 <= (~^reg51[(2'h3):(1'h0)]);
            end
          reg61 <= reg59;
        end
    end
  assign wire66 = (+reg57);
  assign wire67 = (~^$signed($unsigned({{reg57}})));
  assign wire68 = (wire66[(3'h5):(2'h2)] ^~ (~&wire49[(4'hb):(3'h6)]));
  assign wire69 = reg56;
endmodule

module module20
#(parameter param41 = ((+((((8'haf) == (8'hb7)) <<< {(8'ha9)}) ? ((^(8'h9e)) >> {(8'hb9)}) : ({(8'hba), (8'hbf)} ? (~|(8'hb3)) : ((8'hba) == (8'hbb))))) ? (8'ha5) : ((+({(8'h9c), (8'hab)} ? ((8'hb9) ? (8'haf) : (8'hb6)) : (-(8'ha8)))) | (((!(8'hb4)) ? ((8'hb1) ? (8'hbd) : (8'had)) : {(8'hb6), (7'h40)}) < (((8'hb1) ? (8'hb1) : (8'h9d)) ? ((8'haa) * (8'hb2)) : ((8'hb4) || (8'hb6)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire signed [(3'h5):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire22;
  input wire signed [(3'h7):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire26 = $signed(wire25[(3'h5):(3'h5)]);
  assign wire27 = wire23;
  assign wire28 = wire22[(1'h1):(1'h0)];
  assign wire29 = wire21;
  assign wire30 = ((((~|$unsigned((8'hbb))) ?
                          $signed({wire28}) : wire22[(1'h1):(1'h1)]) ?
                      (~$signed((wire21 ?
                          wire23 : wire23))) : {$unsigned((wire24 << wire29))}) <<< (~&$unsigned((-(wire24 | wire29)))));
  assign wire31 = ((~|((~|wire22[(1'h1):(1'h1)]) == ({wire27} ?
                      (wire22 >>> (8'hbc)) : $unsigned(wire25)))) <= $unsigned($signed(wire23[(4'hc):(3'h7)])));
  assign wire32 = (~wire21[(2'h2):(1'h0)]);
  assign wire33 = (wire28 & $unsigned($unsigned((wire22 != (wire25 && wire25)))));
  always
    @(posedge clk) begin
      reg34 <= (wire33[(1'h1):(1'h1)] + $unsigned(wire33));
      reg35 <= (reg34 ?
          $signed(((~&$unsigned(wire23)) ?
              $unsigned((wire31 ? wire31 : wire29)) : (~(+reg34)))) : wire28);
      reg36 <= (~({wire22[(1'h0):(1'h0)]} || (($signed(reg35) ~^ (~|wire21)) ?
          (~wire26) : $signed((wire25 ? wire32 : wire29)))));
    end
  assign wire37 = (((!(wire22 >= $signed(reg35))) ?
                          wire24 : ((!$unsigned((8'ha6))) ?
                              ((|wire24) ?
                                  $signed(wire23) : (wire22 ?
                                      (8'hbd) : wire31)) : $signed((wire25 ?
                                  wire32 : wire21)))) ?
                      wire27[(3'h4):(2'h2)] : (~$unsigned(wire25)));
  assign wire38 = wire28;
  assign wire39 = $signed($signed((^$unsigned((~^(8'haa))))));
  assign wire40 = {{($signed(wire26[(4'h9):(4'h9)]) > ((reg34 ?
                              wire33 : wire21) - $signed(reg35))),
                          wire37},
                      (8'hba)};
endmodule

module module115  (y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire119;
  input wire [(5'h13):(1'h0)] wire118;
  input wire signed [(4'hf):(1'h0)] wire117;
  input wire signed [(4'hb):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire135;
  wire [(5'h13):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg122 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire130,
                 wire127,
                 wire121,
                 wire120,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg129,
                 reg128,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire120 = $unsigned({($unsigned($unsigned(wire116)) >>> ($unsigned(wire119) ~^ (wire118 ?
                           wire118 : wire118)))});
  assign wire121 = $unsigned(((((wire117 ? wire119 : wire117) ?
                           {(7'h43)} : $unsigned((7'h42))) ?
                       $signed($unsigned((7'h41))) : ($signed(wire116) ?
                           (wire120 ?
                               wire117 : wire116) : wire116)) > {(wire117[(4'he):(1'h0)] & $unsigned(wire118))}));
  always
    @(posedge clk) begin
      reg122 <= ((8'hab) ?
          {($signed(wire121[(3'h7):(2'h2)]) ?
                  wire119[(4'hb):(3'h5)] : (wire119 ?
                      wire119 : $signed(wire118))),
              wire119} : wire121);
      if ($unsigned(wire116))
        begin
          reg123 <= $unsigned($signed((!{$signed(wire120),
              (wire119 ? (8'hb7) : wire120)})));
          reg124 <= wire119;
          reg125 <= reg123[(2'h2):(1'h1)];
          reg126 <= ($unsigned((&(!$unsigned((8'ha1))))) + wire121);
        end
      else
        begin
          reg123 <= reg122[(4'hf):(4'hf)];
          reg124 <= (~^reg123);
        end
    end
  assign wire127 = (8'hb9);
  always
    @(posedge clk) begin
      reg128 <= wire127[(2'h3):(2'h3)];
      reg129 <= ($signed($signed($signed(wire118))) <<< $unsigned(wire119[(4'hc):(4'hb)]));
    end
  assign wire130 = reg129;
  always
    @(posedge clk) begin
      reg131 <= {(wire127[(1'h1):(1'h0)] ?
              reg129[(2'h2):(2'h2)] : $signed($signed($unsigned(wire120))))};
      reg132 <= $signed(((~&(8'ha8)) ?
          $signed($signed(wire116[(3'h4):(1'h0)])) : (wire117[(2'h3):(2'h3)] << (wire119 ?
              (wire127 <<< reg129) : reg131[(3'h7):(3'h4)]))));
      reg133 <= (!$signed(wire117));
      reg134 <= ($unsigned($signed({(reg132 ? reg126 : reg128),
              (wire127 ? reg128 : wire130)})) ?
          $signed(reg131[(3'h6):(1'h0)]) : reg132);
    end
  assign wire135 = $signed((~|{(reg124[(4'h9):(3'h7)] - {wire118}), reg134}));
  assign wire136 = $unsigned({reg123[(3'h5):(1'h0)],
                       $signed((|$unsigned(wire135)))});
  assign wire137 = (-wire135[(1'h0):(1'h0)]);
  assign wire138 = wire118;
  assign wire139 = wire120;
  assign wire140 = (($unsigned($signed(reg122[(4'he):(4'he)])) ?
                           $signed(wire118[(4'hf):(4'hb)]) : ((&(-wire135)) ?
                               wire135[(3'h5):(3'h5)] : ((wire136 ?
                                       reg128 : reg124) ?
                                   (|reg128) : $signed(wire117)))) ?
                       wire117 : $signed(reg128));
  assign wire141 = ((((wire120 ?
                           ((8'ha6) ?
                               wire120 : (8'haa)) : $signed(wire139)) & reg123) ?
                       {($unsigned(wire137) ?
                               wire120[(4'h8):(3'h4)] : {reg124})} : (|(~$unsigned(wire117)))) ^~ $unsigned($unsigned($signed(reg122[(2'h2):(1'h1)]))));
endmodule
