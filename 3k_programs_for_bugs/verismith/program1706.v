module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire116,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire10,
                 wire9,
                 wire5,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = {(((|$signed(wire2)) || ((8'hb6) ?
                             (wire4 ? wire2 : wire2) : ((7'h43) ?
                                 wire3 : wire4))) ?
                         wire2[(4'ha):(4'h8)] : {((wire3 ? wire1 : (8'hb4)) ?
                                 (-wire2) : (wire4 - wire1))}),
                     wire2};
  always
    @(posedge clk) begin
      reg6 <= {wire1[(4'ha):(2'h3)], (!(&(|(8'hbe))))};
      reg7 <= $unsigned((wire0[(4'hb):(2'h3)] * wire0[(3'h7):(3'h5)]));
      reg8 <= $unsigned(($unsigned($signed(reg7)) ?
          (-$unsigned($signed(wire3))) : ($signed((~^wire0)) ?
              $signed((~^wire2)) : reg7[(3'h7):(1'h0)])));
    end
  assign wire9 = (($unsigned($signed($signed(reg7))) ?
                     {((wire5 ? (8'ha6) : (8'hb3)) ?
                             (&reg7) : ((8'h9f) || reg8))} : $unsigned(wire5)) != {reg6});
  assign wire10 = $signed($signed({$unsigned($signed((7'h43))),
                      wire4[(4'hb):(4'h9)]}));
  always
    @(posedge clk) begin
      reg11 <= $unsigned(wire3);
      reg12 <= (!reg7[(4'h8):(2'h3)]);
      reg13 <= (reg11[(2'h2):(1'h1)] * (&wire1));
      reg14 <= wire2;
      if ($signed(wire3[(4'hd):(3'h5)]))
        begin
          if ((($signed($unsigned((!wire0))) ?
              (~^($signed(wire2) == wire0)) : {reg8[(3'h6):(3'h5)],
                  $unsigned($signed(reg8))}) <<< $signed($signed(((^reg7) > wire0[(3'h4):(1'h1)])))))
            begin
              reg15 <= (-wire0[(4'hc):(3'h7)]);
            end
          else
            begin
              reg15 <= (!wire2);
              reg16 <= wire0;
            end
          if ($signed((^~{$unsigned((wire3 ? wire0 : reg15)),
              (~^{wire3, (8'hbe)})})))
            begin
              reg17 <= (8'hbd);
              reg18 <= reg15;
              reg19 <= (~&reg13);
              reg20 <= {(((+(~reg11)) ? $signed((~^(8'hae))) : wire9) ?
                      $unsigned($signed($signed(wire2))) : $signed(($unsigned((8'ha1)) ?
                          $signed(wire3) : reg14))),
                  ((wire2 ?
                          $signed($signed(reg6)) : (reg6[(2'h2):(1'h0)] ?
                              wire10[(4'hf):(3'h5)] : reg17)) ?
                      $signed(reg11) : ((~&reg6) ?
                          reg11 : $unsigned((~&(8'ha1)))))};
            end
          else
            begin
              reg17 <= {wire10[(5'h11):(4'he)],
                  ($signed($unsigned((wire0 >= reg11))) > {(~|$unsigned(reg13))})};
              reg18 <= (^(!(8'ha5)));
              reg19 <= (^$signed($unsigned($signed((7'h43)))));
            end
          if ($signed($signed(reg6[(4'hb):(3'h7)])))
            begin
              reg21 <= reg11[(3'h6):(3'h4)];
              reg22 <= ($signed((+(((7'h40) ? reg18 : reg14) ~^ ((8'ha0) ?
                  wire1 : reg11)))) < reg14);
              reg23 <= ($unsigned((((&reg19) ?
                  wire10 : $unsigned(wire0)) <= $signed({wire10,
                  wire9}))) << $unsigned($unsigned((|{wire4}))));
              reg24 <= reg23[(3'h4):(2'h3)];
            end
          else
            begin
              reg21 <= reg13;
              reg22 <= $unsigned($signed($unsigned(wire3)));
              reg23 <= $unsigned($signed(reg15[(3'h5):(1'h0)]));
            end
          reg25 <= $unsigned($unsigned({$signed(wire4[(3'h6):(3'h4)])}));
        end
      else
        begin
          reg15 <= reg7;
          reg16 <= (reg24[(3'h5):(2'h2)] || $signed($unsigned({(|wire10),
              (wire0 ~^ wire10)})));
          if ((((~($unsigned(reg14) & wire4)) & {reg7,
                  ((reg6 ? reg25 : reg22) ? $signed(reg18) : $signed(reg25))}) ?
              ($signed(reg22) ?
                  {$signed((~^reg17)),
                      ($signed(reg22) ?
                          (reg15 ?
                              reg16 : wire1) : wire3[(5'h15):(4'hd)])} : reg15) : $signed((-{(reg12 ?
                      reg12 : wire9),
                  (^reg11)}))))
            begin
              reg17 <= {reg21, ((8'hb9) ? wire3[(5'h12):(4'hf)] : reg7)};
            end
          else
            begin
              reg17 <= {reg19};
            end
          if ($signed(reg6[(4'hb):(4'h8)]))
            begin
              reg18 <= (-reg12[(1'h1):(1'h0)]);
              reg19 <= ((8'hae) ?
                  $signed($signed(wire4)) : $signed($signed(({wire5} ?
                      (reg7 ? reg15 : reg20) : (~|(7'h43))))));
            end
          else
            begin
              reg18 <= ($signed((^(reg19 ?
                      $signed((7'h42)) : (wire5 ? reg19 : reg25)))) ?
                  $unsigned((|(wire9[(3'h5):(2'h3)] < $signed(wire2)))) : (((!(wire9 ?
                      reg24 : wire0)) && reg18[(2'h2):(2'h2)]) ^~ (reg24 ?
                      ((+wire2) ?
                          wire3[(5'h10):(1'h1)] : (reg21 ?
                              reg14 : reg20)) : (!(reg19 + reg24)))));
              reg19 <= (({($signed(wire4) < wire4[(4'he):(4'hb)])} * (&($signed(reg24) < (!reg21)))) + $signed((&reg13[(4'hb):(3'h7)])));
              reg20 <= (-(8'hbc));
            end
          reg21 <= wire2;
        end
    end
  assign wire26 = (8'hba);
  assign wire27 = reg15;
  assign wire28 = wire0;
  assign wire29 = {wire9};
  module30 #() modinst117 (wire116, clk, reg25, reg21, reg12, reg19);
endmodule

module module30
#(parameter param115 = ((((!(8'hbd)) ? (~^((7'h42) >> (8'hbd))) : {(8'ha5), (|(8'hb6))}) ? ((((8'ha2) ? (8'hac) : (7'h41)) ~^ (^(7'h43))) <= (!{(8'h9e)})) : ({(|(8'ha7)), (~&(8'hb0))} ? {((8'h9f) != (8'hac)), ((8'ha9) ? (8'h9d) : (8'h9e))} : (^~((8'ha3) ? (8'hb3) : (7'h42))))) <<< ((&((+(7'h41)) ? ((8'ha3) ? (8'h9d) : (8'haa)) : ((7'h42) <= (8'hb2)))) ~^ ((((8'hbb) ? (8'h9c) : (8'ha2)) <<< ((8'had) <= (8'h9e))) ? {((8'ha8) ? (8'hb7) : (8'hae)), ((8'hbf) ? (8'hb5) : (7'h40))} : ({(8'ha8)} ? {(8'haa)} : {(8'hb4), (8'hba)})))))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire [(4'hc):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire35;
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire93,
                 wire91,
                 wire40,
                 wire39,
                 wire35,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire35 = $unsigned((8'ha1));
  always
    @(posedge clk) begin
      reg36 <= ($unsigned((wire31[(3'h6):(2'h2)] ^ (~^{wire33}))) != (wire32[(1'h1):(1'h1)] ?
          {(+{wire32}), (&((8'hbd) >= wire35))} : (+{$unsigned((8'hb5))})));
      reg37 <= wire32[(2'h2):(2'h2)];
      reg38 <= ($signed({wire33[(4'hf):(2'h3)],
          ({reg36, wire33} > ((7'h41) << (8'hb7)))}) != wire35[(3'h6):(3'h5)]);
    end
  assign wire39 = reg38;
  assign wire40 = $signed($unsigned(wire33[(4'ha):(3'h5)]));
  module41 #() modinst92 (.wire44(reg38), .y(wire91), .wire43(reg37), .wire45(wire32), .wire42(wire35), .wire46(reg36), .clk(clk));
  assign wire93 = wire31[(1'h1):(1'h0)];
  module94 #() modinst111 (.clk(clk), .wire99(reg37), .wire98(wire40), .wire96(wire91), .y(wire110), .wire95(wire35), .wire97(wire93));
  assign wire112 = {(!wire35)};
  assign wire113 = (^~(reg36 ?
                       $signed({wire32[(2'h3):(2'h3)],
                           (reg36 ?
                               wire110 : wire39)}) : $signed(wire34[(2'h3):(1'h1)])));
  assign wire114 = $unsigned(wire39[(1'h1):(1'h0)]);
endmodule

module module94
#(parameter param109 = ((^~({(8'ha6), {(8'hbe), (8'ha1)}} - (^~{(8'h9d), (8'ha6)}))) ? (~&((^~((8'hba) * (7'h41))) || {((8'hb5) ? (8'ha4) : (8'had))})) : (((((8'ha0) <= (8'h9c)) ? {(8'hb5), (8'ha7)} : (^~(8'haa))) ? (^~((8'hbf) ? (8'ha6) : (8'hac))) : (8'hba)) < ((|(^~(8'hac))) + ({(8'hb4)} << ((8'ha8) ? (8'hac) : (8'hba)))))))
(y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire99;
  input wire [(3'h4):(1'h0)] wire98;
  input wire signed [(4'h9):(1'h0)] wire97;
  input wire [(2'h2):(1'h0)] wire96;
  input wire [(2'h3):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire108;
  wire signed [(4'hb):(1'h0)] wire107;
  wire [(2'h3):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire105;
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg100 <= wire96[(1'h1):(1'h1)];
      reg101 <= wire97;
      reg102 <= (({(~|$signed(wire96)), $signed((wire96 ? wire99 : wire97))} ?
          $unsigned($signed(wire95)) : wire98[(1'h1):(1'h0)]) || (-$signed($signed($signed(wire95)))));
      reg103 <= wire97[(3'h7):(3'h5)];
      reg104 <= (8'h9e);
    end
  assign wire105 = $unsigned($signed(wire99));
  assign wire106 = ({(^reg102[(3'h4):(1'h1)]),
                       wire105[(2'h3):(1'h0)]} + reg101[(1'h1):(1'h0)]);
  assign wire107 = reg103;
  assign wire108 = reg103;
endmodule

module module41
#(parameter param90 = (7'h40))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h205):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  input wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h11):(1'h0)] wire70;
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire71,
                 wire70,
                 reg84,
                 reg83,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
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
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~|wire46[(2'h3):(2'h2)]))
        begin
          reg47 <= ({((wire46[(4'hd):(4'hb)] > $signed(wire46)) ?
                      (~&(^wire44)) : {{wire45}, (wire46 ? wire45 : wire45)}),
                  ($signed($unsigned(wire44)) ?
                      wire45[(1'h0):(1'h0)] : (+(wire44 ? wire45 : (8'haa))))} ?
              wire45 : (($unsigned((^~wire46)) ?
                  $unsigned($signed(wire46)) : $signed((wire42 ^ wire43))) << wire44[(1'h1):(1'h1)]));
        end
      else
        begin
          reg47 <= {((8'hb9) ? wire43[(4'ha):(4'h8)] : $signed((-wire44)))};
          if ((wire45[(4'ha):(3'h5)] ?
              wire42[(5'h10):(3'h6)] : wire42[(2'h3):(1'h0)]))
            begin
              reg48 <= $unsigned(wire44);
            end
          else
            begin
              reg48 <= ($signed((((wire44 ? wire46 : wire46) ?
                      {(8'ha5)} : (wire42 + wire45)) >= wire42)) ?
                  $signed($unsigned($signed((reg47 ?
                      wire45 : reg47)))) : $signed(wire45));
              reg49 <= {wire43, $signed(wire46)};
              reg50 <= (((wire46 ?
                      reg49[(3'h5):(2'h3)] : $unsigned($signed(reg47))) < {{reg49[(1'h0):(1'h0)],
                          $unsigned(wire46)}}) ?
                  $unsigned({(reg49[(3'h4):(1'h0)] ?
                          (~^wire45) : wire42)}) : {(((wire46 ?
                                  wire44 : wire45) ?
                              wire45 : (reg47 ? wire46 : wire45)) ?
                          (~^(&wire45)) : (8'ha7))});
              reg51 <= reg50;
            end
        end
      if (((wire45[(4'h8):(3'h4)] == wire44[(2'h3):(1'h0)]) ?
          (~^((&$signed(wire46)) ?
              {$signed(reg49)} : (^~wire44))) : (+{(reg50 >> {wire42})})))
        begin
          reg52 <= (-$unsigned(wire46[(3'h4):(1'h0)]));
          if ((^(~^(+(|$signed(wire44))))))
            begin
              reg53 <= (~reg49);
            end
          else
            begin
              reg53 <= (~wire44);
            end
        end
      else
        begin
          if (reg48[(4'hb):(1'h0)])
            begin
              reg52 <= $signed($signed(((&(8'hb0)) & $signed($unsigned(reg52)))));
              reg53 <= ({reg48, reg48} >= ((7'h42) == $unsigned((~|(wire43 ?
                  (8'haa) : (8'hb3))))));
            end
          else
            begin
              reg52 <= reg53[(4'ha):(4'h8)];
              reg53 <= $unsigned({($signed($signed(reg50)) && reg52)});
              reg54 <= $unsigned(reg48[(4'hd):(3'h4)]);
              reg55 <= ((reg49[(3'h5):(2'h2)] ?
                      {$signed(reg52[(3'h6):(3'h4)])} : (|((-wire43) && (reg51 != wire46)))) ?
                  (^~{reg53[(2'h2):(1'h1)]}) : ((8'hac) ?
                      {(reg49 ? $signed(wire45) : $signed((8'ha1))),
                          {reg51[(1'h1):(1'h0)]}} : $signed($unsigned(reg47[(2'h3):(2'h2)]))));
              reg56 <= $unsigned(({$signed($unsigned(reg53)),
                  $unsigned({reg50,
                      wire45})} <<< (((wire44 | wire45) >> $signed(wire42)) ^~ (!((8'hb2) ?
                  reg52 : wire45)))));
            end
          reg57 <= ($unsigned(reg50) ?
              $unsigned(wire43[(3'h4):(3'h4)]) : ({$signed({reg50,
                      reg54})} >>> (8'hb3)));
          reg58 <= ((reg50[(2'h3):(1'h1)] < reg55) ?
              reg53[(2'h2):(1'h1)] : reg48);
          reg59 <= $signed(wire46);
          reg60 <= (~{reg53[(4'h9):(2'h3)]});
        end
      if ($signed($unsigned(reg60[(3'h7):(3'h4)])))
        begin
          if (reg51)
            begin
              reg61 <= reg52;
              reg62 <= (^~$signed($signed(wire42)));
            end
          else
            begin
              reg61 <= $unsigned((~^(~($signed(wire45) * (reg48 * wire43)))));
              reg62 <= ((-reg48[(4'hd):(2'h3)]) ? reg51 : reg53[(4'h8):(3'h7)]);
              reg63 <= $signed(($signed((&(reg52 <<< wire45))) < ({(reg49 >>> reg57),
                      (8'had)} ?
                  ($unsigned(wire45) ?
                      (+reg57) : $signed(reg58)) : reg47[(2'h3):(1'h1)])));
            end
          reg64 <= ($signed($unsigned(($unsigned(reg56) ?
                  ((8'ha0) ? reg61 : reg60) : (~&reg61)))) ?
              wire42[(5'h12):(2'h2)] : reg55);
          reg65 <= $unsigned(reg63);
          reg66 <= (((~reg62[(4'h9):(1'h1)]) ^ $unsigned((((8'hab) || reg53) ?
              $unsigned((8'hb1)) : {(8'ha1), reg63}))) ^ ((&$signed(reg61)) ?
              (reg51 ?
                  $unsigned((|reg52)) : {reg51[(3'h4):(3'h4)],
                      {(8'hb8)}}) : (-{((8'h9f) >= wire44)})));
        end
      else
        begin
          reg61 <= reg48;
          reg62 <= $signed($unsigned($unsigned(reg62[(4'hb):(2'h2)])));
          if ({$unsigned($unsigned(reg55[(2'h2):(1'h0)]))})
            begin
              reg63 <= $unsigned((7'h44));
              reg64 <= {reg61[(3'h5):(3'h4)]};
              reg65 <= reg64;
              reg66 <= {($signed($signed(reg47[(4'hb):(4'h8)])) && reg63[(4'ha):(3'h7)])};
            end
          else
            begin
              reg63 <= reg55[(2'h3):(1'h0)];
              reg64 <= $signed(reg48[(4'h9):(1'h1)]);
              reg65 <= ((reg47 ?
                      reg50 : $unsigned((reg54[(4'h8):(3'h4)] >> (reg51 + reg47)))) ?
                  reg65[(2'h2):(2'h2)] : reg55);
              reg66 <= wire44;
              reg67 <= $signed($unsigned(((-$unsigned(reg63)) & ((reg47 ?
                      (8'hba) : reg59) ?
                  (~reg49) : reg62[(3'h6):(1'h1)]))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg68 <= (~$signed($signed((^reg65[(1'h1):(1'h1)]))));
      reg69 <= {(+$unsigned(((+(8'hae)) ? $signed((8'hbb)) : $signed(reg54)))),
          $signed(reg62)};
    end
  assign wire70 = (reg54[(2'h2):(2'h2)] ?
                      $unsigned(reg47[(2'h2):(1'h1)]) : $unsigned(reg56));
  assign wire71 = $unsigned({{({reg49} <<< $signed(reg65)), reg52}});
  always
    @(posedge clk) begin
      reg72 <= reg61;
      reg73 <= ($signed($unsigned(wire43)) ?
          (^reg59[(3'h4):(2'h3)]) : (reg65[(1'h0):(1'h0)] ?
              wire71 : $signed({$signed(reg62), ((8'hab) ^~ (8'hb9))})));
      reg74 <= (!(((-(wire42 ? reg55 : reg60)) ?
              ({reg60, reg52} ^~ wire46[(4'ha):(4'h9)]) : reg61) ?
          $unsigned(wire42[(1'h1):(1'h1)]) : reg67));
      reg75 <= $signed(wire42);
      reg76 <= (reg57[(1'h1):(1'h0)] ?
          (reg69 || ($unsigned(wire42[(3'h4):(1'h1)]) || $unsigned((~|reg53)))) : $unsigned((&reg55)));
    end
  assign wire77 = (!(($unsigned((reg60 + (8'ha6))) * $signed((reg61 << (8'had)))) ?
                      (((reg76 ? wire70 : (8'hb4)) >>> $unsigned(wire43)) ?
                          (^~$signed(wire42)) : $signed($signed(reg48))) : (wire70 >= ($signed(reg47) ?
                          $signed(reg56) : (!reg56)))));
  assign wire78 = reg64[(4'h8):(2'h2)];
  assign wire79 = $unsigned(reg59[(2'h3):(1'h0)]);
  assign wire80 = (wire43 ?
                      $signed($signed({{reg53, (7'h44)},
                          (reg73 ?
                              reg68 : (8'h9f))})) : (reg74 << $signed((reg76 >>> reg64[(3'h4):(1'h1)]))));
  assign wire81 = reg72[(2'h3):(2'h3)];
  assign wire82 = $signed((8'hbb));
  always
    @(posedge clk) begin
      reg83 <= wire42;
      reg84 <= $signed(reg57);
    end
  assign wire85 = {reg73[(4'h9):(1'h0)]};
  assign wire86 = ({(&(^$signed(reg50))), reg62[(4'hc):(1'h1)]} ?
                      ($signed(((^wire44) ?
                          (reg52 ?
                              reg66 : reg61) : $unsigned(reg51))) ~^ reg54) : reg68[(2'h3):(2'h3)]);
  assign wire87 = (wire78 ?
                      {$signed($signed(reg64[(5'h10):(2'h3)])),
                          (^((reg62 ?
                              reg49 : wire44) && (reg83 ~^ (8'h9e))))} : ((&$signed(((8'hbc) ^~ wire79))) << $signed(reg72)));
  assign wire88 = ({$unsigned((&reg52))} ?
                      ((|($signed(wire71) || reg63)) ?
                          ((((8'hb5) & reg68) > $signed(wire86)) ?
                              $signed((~&reg76)) : wire43[(1'h1):(1'h0)]) : $signed($unsigned((&wire86)))) : ((~^$signed($signed(reg48))) && wire86));
  assign wire89 = ((-(+($signed((8'ha4)) ?
                      (reg64 ? reg62 : reg69) : {reg61}))) & (&wire80));
endmodule
