module top
#(parameter param98 = ({{(((8'ha7) >>> (8'hbe)) ? ((8'ha5) ~^ (8'hbf)) : (+(8'hb6))), (((8'hb1) ? (8'h9c) : (8'ha3)) ? {(7'h41), (8'h9f)} : (^~(8'hb6)))}, (((|(8'hac)) ? {(8'ha5), (8'ha7)} : {(8'hb9)}) + {(8'h9d)})} ? (((&{(8'had)}) >> (^~((8'hba) ? (8'ha1) : (8'hbf)))) ^ {(((8'hae) <<< (8'hb2)) ^ (~^(8'ha1))), {(8'h9f)}}) : (!(-({(8'hb0), (8'hb2)} ? ((8'hb1) <<< (8'ha4)) : ((8'hb9) && (8'ha6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire96,
                 wire27,
                 wire26,
                 wire19,
                 wire6,
                 wire5,
                 wire4,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
                 (1'h0)};
  assign wire4 = (~{wire0[(2'h2):(1'h1)],
                     {wire0[(3'h7):(3'h4)], wire0[(4'hc):(3'h5)]}});
  assign wire5 = ((!({(wire4 ? wire4 : wire3)} ?
                         $unsigned($signed((8'h9e))) : wire1)) ?
                     $unsigned((~|((wire0 ? wire1 : (8'hb3)) ?
                         $signed(wire0) : (wire2 & wire1)))) : (~^(($unsigned(wire3) ^~ (8'hab)) ^~ $unsigned((wire4 ?
                         wire0 : wire0)))));
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      reg7 <= $signed(wire1);
      reg8 <= wire5[(1'h1):(1'h1)];
      if ({((-((^wire6) ? (~&wire0) : reg7)) == wire2)})
        begin
          if ((&$signed((+wire1))))
            begin
              reg9 <= $signed(reg7);
              reg10 <= $unsigned($unsigned((reg9[(2'h3):(2'h2)] > wire5)));
              reg11 <= (8'hb2);
            end
          else
            begin
              reg9 <= ((~|$unsigned(wire3[(3'h7):(3'h6)])) >>> $unsigned(wire5));
              reg10 <= $signed((wire5 ?
                  (~&($unsigned(reg9) < reg10)) : $signed(wire2[(3'h5):(2'h3)])));
              reg11 <= (~^(!(~&(8'ha0))));
              reg12 <= $signed(reg7);
            end
          if ($signed(($unsigned(wire3[(3'h7):(1'h1)]) ^ {(~(~(8'ha5))),
              (+{reg7})})))
            begin
              reg13 <= $unsigned(((~|(wire5[(5'h11):(4'ha)] ?
                  $signed(reg7) : (^reg11))) << (((wire1 ?
                      wire3 : reg12) >>> $unsigned(reg7)) ?
                  ($unsigned((8'hb0)) ?
                      (8'hae) : $signed(reg7)) : wire6[(4'h8):(2'h3)])));
              reg14 <= {(8'ha8), wire6[(3'h7):(3'h6)]};
              reg15 <= (!$signed((~^wire6[(2'h2):(2'h2)])));
            end
          else
            begin
              reg13 <= reg9[(4'hd):(1'h1)];
              reg14 <= (~$signed($unsigned(((wire2 ? reg13 : reg8) ?
                  (wire4 ? reg8 : reg11) : wire0[(3'h4):(2'h2)]))));
              reg15 <= $unsigned(wire5[(2'h3):(1'h0)]);
            end
          if ($unsigned(reg12))
            begin
              reg16 <= ((|($signed((reg8 > wire2)) ?
                  $unsigned(((7'h43) || (8'hba))) : (reg7[(2'h2):(2'h2)] > $signed(wire0)))) ^ $signed((~|$signed(wire6))));
              reg17 <= (($signed(wire4) ?
                      (!wire2[(5'h12):(5'h11)]) : wire6[(3'h5):(2'h2)]) ?
                  $signed($signed($signed(reg15[(2'h2):(1'h0)]))) : (($unsigned((reg12 == wire1)) | ($signed(wire6) ^ {reg8})) ^ {((wire3 ?
                              reg8 : reg14) ?
                          reg12[(1'h1):(1'h0)] : (+(8'ha6)))}));
            end
          else
            begin
              reg16 <= ((((~|(+reg11)) ? $signed($signed(wire6)) : wire0) ?
                      (^~$signed((reg12 ?
                          wire4 : wire3))) : reg11[(1'h1):(1'h0)]) ?
                  (wire3[(1'h1):(1'h0)] ?
                      $unsigned((+(8'haa))) : $signed($signed((wire4 ?
                          reg11 : wire0)))) : $signed(reg8[(1'h1):(1'h1)]));
            end
          reg18 <= $signed((reg11 ?
              (~(reg9 ?
                  $unsigned((8'haa)) : (reg7 >> (8'ha9)))) : (wire5[(4'hd):(2'h3)] ?
                  ({wire6} ?
                      (reg13 <<< wire1) : $unsigned(wire5)) : $signed(reg13))));
        end
      else
        begin
          if ($unsigned($signed(reg11[(1'h0):(1'h0)])))
            begin
              reg9 <= {($signed(reg15[(1'h1):(1'h1)]) ?
                      wire0 : (((wire5 & reg18) ?
                          reg14[(3'h4):(1'h0)] : reg11) < $unsigned($signed(reg7)))),
                  $unsigned(reg7[(3'h6):(3'h5)])};
              reg10 <= reg10;
              reg11 <= reg11;
              reg12 <= reg11[(2'h2):(1'h0)];
              reg13 <= (8'ha4);
            end
          else
            begin
              reg9 <= reg8[(4'ha):(4'h8)];
              reg10 <= reg17;
              reg11 <= ((~|{reg12[(1'h1):(1'h0)],
                  ({(8'hb0),
                      reg17} >= $unsigned(reg15))}) && (reg8[(4'hb):(4'ha)] || $unsigned($signed((8'hba)))));
              reg12 <= reg11[(2'h2):(1'h1)];
              reg13 <= wire3;
            end
          reg14 <= (reg9 ?
              $unsigned({reg9,
                  $signed((wire1 ? wire1 : reg17))}) : $unsigned(((^wire0) ?
                  (~$signed(reg9)) : $unsigned(wire3[(3'h5):(3'h5)]))));
          reg15 <= reg17;
        end
    end
  assign wire19 = ($unsigned($signed((~wire6))) >= {wire0,
                      $unsigned($unsigned(reg12))});
  always
    @(posedge clk) begin
      if ($unsigned(((~^(!(wire19 ?
          reg15 : reg16))) | (^~$signed($unsigned(wire2))))))
        begin
          reg20 <= (^wire3);
          reg21 <= wire0;
        end
      else
        begin
          reg20 <= reg9;
          reg21 <= wire4[(4'hb):(4'ha)];
          if ($signed(wire0[(4'hb):(1'h1)]))
            begin
              reg22 <= (reg14 ?
                  reg10[(3'h6):(3'h5)] : $unsigned((^$signed(wire19[(4'h8):(3'h7)]))));
              reg23 <= ({(((reg22 ? wire0 : wire0) ?
                      reg8 : {reg14}) & (((7'h44) ?
                      reg22 : reg16) ~^ reg17[(2'h3):(2'h3)])),
                  wire2[(3'h5):(2'h3)]} & (8'hab));
            end
          else
            begin
              reg22 <= (~^reg14);
            end
        end
      reg24 <= $signed((^reg11));
      reg25 <= $unsigned(((&wire2[(4'hb):(3'h4)]) ?
          (({reg16} ? $unsigned(wire3) : (&wire2)) ?
              (~^$unsigned(reg21)) : (+{wire19})) : reg24[(3'h4):(1'h0)]));
    end
  assign wire26 = ($signed($unsigned((~|reg7[(1'h0):(1'h0)]))) <= $unsigned((reg24 ?
                      wire3 : reg11[(1'h0):(1'h0)])));
  assign wire27 = reg8[(4'hf):(3'h5)];
  module28 #() modinst97 (.wire29(wire26), .wire31(wire27), .wire30(reg23), .y(wire96), .wire32(reg15), .clk(clk));
endmodule

module module28  (y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire89;
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  assign y = {wire33,
                 wire34,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire89,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = (^~$signed(($unsigned({wire29}) ?
                      (~|$unsigned((8'ha9))) : $signed($unsigned(wire29)))));
  assign wire34 = $signed(wire33[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg35 <= wire31[(2'h2):(1'h0)];
      reg36 <= (wire30[(4'hb):(2'h3)] ? $unsigned(wire32) : (!wire32));
      reg37 <= wire30;
      reg38 <= $unsigned((8'ha3));
    end
  assign wire39 = (wire30[(4'h8):(3'h5)] << (wire30[(5'h13):(2'h3)] ?
                      (($unsigned(wire31) ?
                              $signed((8'h9d)) : $unsigned(reg37)) ?
                          (-$unsigned(wire34)) : ((~&wire29) ?
                              wire30 : (reg37 <<< wire32))) : (reg36 ?
                          $signed($unsigned(reg36)) : $unsigned((^~wire34)))));
  assign wire40 = (~&(~&(&wire34[(4'he):(4'h9)])));
  assign wire41 = $unsigned($unsigned($unsigned((reg37 >= reg38))));
  assign wire42 = (-{$signed(reg37), (-$unsigned((|(8'hbd))))});
  assign wire43 = (((8'h9f) < (8'h9d)) ?
                      $signed(wire34) : (~|reg37[(3'h4):(2'h2)]));
  assign wire44 = {$unsigned((wire43 ?
                          ($unsigned((8'hb6)) != (reg38 + (8'had))) : wire41[(2'h3):(1'h1)]))};
  module45 #() modinst90 (wire89, clk, wire42, reg38, reg36, wire43, wire39);
  always
    @(posedge clk) begin
      reg91 <= ((((8'hb0) ?
          {(wire43 ? wire32 : reg37),
              (|reg37)} : $unsigned(reg38[(4'hb):(4'h8)])) * ($unsigned($unsigned(wire33)) ?
          ($unsigned(reg36) ?
              $unsigned(wire43) : $signed(wire39)) : $unsigned((8'ha8)))) ^~ (($unsigned(wire41[(2'h2):(1'h1)]) >= ({(8'hb2)} ?
          $unsigned(reg37) : wire42[(1'h0):(1'h0)])) | wire30));
      reg92 <= (8'h9c);
    end
  always
    @(posedge clk) begin
      reg93 <= (8'ha0);
      reg94 <= (8'hb9);
      reg95 <= wire44[(3'h4):(2'h2)];
    end
endmodule

module module45
#(parameter param87 = {((7'h44) >>> ((~^(~|(7'h43))) < ((^(7'h42)) ? (!(8'h9f)) : (~^(8'hbd)))))}, 
parameter param88 = (~((((param87 ? (8'hae) : param87) != param87) > (|(param87 ? param87 : param87))) <<< param87)))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  input wire [(5'h15):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire51;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  assign y = {wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 wire64,
                 wire63,
                 wire62,
                 wire52,
                 wire51,
                 reg85,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg72,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire51 = $unsigned(((~|($unsigned(wire48) ?
                      (wire50 || wire48) : (wire50 ?
                          wire46 : wire46))) || $signed((^~$signed(wire47)))));
  assign wire52 = wire51;
  always
    @(posedge clk) begin
      if ($signed(wire48))
        begin
          reg53 <= {(wire48[(5'h11):(3'h5)] ?
                  (~&$signed((~^wire52))) : {{{wire50, wire51},
                          wire47[(3'h4):(2'h2)]}}),
              ($signed(wire47[(3'h4):(1'h1)]) ?
                  $signed(((wire49 ~^ wire46) ?
                      $signed(wire48) : $signed(wire51))) : ({(8'ha2)} & (+(!wire46))))};
          if (($unsigned($unsigned($signed(wire49))) ?
              (wire47[(1'h1):(1'h1)] >> {((wire49 ? wire48 : wire50) ?
                      wire46[(3'h6):(3'h6)] : $unsigned((7'h40)))}) : wire46))
            begin
              reg54 <= $signed(wire46[(3'h5):(3'h4)]);
              reg55 <= $unsigned($signed($signed((+$signed(wire48)))));
              reg56 <= (wire47 ?
                  $signed((($signed(wire49) ?
                          $unsigned(reg53) : wire50[(1'h0):(1'h0)]) ?
                      (reg54 ?
                          (reg53 ? reg53 : reg53) : (reg54 ?
                              (8'hae) : (8'hb5))) : ($unsigned(wire52) + reg54[(4'hc):(3'h7)]))) : ($signed($signed((7'h43))) ?
                      wire52 : $unsigned({wire50[(2'h3):(2'h3)]})));
              reg57 <= $signed((reg55 ?
                  $signed($signed((wire47 & wire50))) : $signed(($unsigned(reg55) < (8'ha2)))));
              reg58 <= (wire49[(4'he):(4'hb)] || $unsigned(({$signed(wire47)} ?
                  $signed($unsigned(wire50)) : ($signed((8'hbc)) ?
                      $unsigned(wire48) : reg56))));
            end
          else
            begin
              reg54 <= ((-((-reg57) ?
                  $unsigned(wire51[(4'hd):(4'h9)]) : $unsigned(wire48[(3'h4):(3'h4)]))) ^ $unsigned((^~wire48[(2'h3):(1'h1)])));
              reg55 <= wire48[(5'h11):(2'h2)];
              reg56 <= (8'h9d);
              reg57 <= {$unsigned((({wire48} ?
                      $signed(wire47) : $unsigned(reg57)) >> reg53)),
                  reg55};
            end
          reg59 <= wire47;
          reg60 <= {wire49[(5'h10):(3'h4)]};
        end
      else
        begin
          reg53 <= $signed(({(reg60[(2'h3):(1'h0)] ?
                  (reg55 - wire49) : (wire50 ? wire47 : (8'hb3))),
              (8'ha8)} ^ ({wire52[(3'h4):(2'h3)]} ? reg54 : wire46)));
          reg54 <= (~&(|reg57[(4'hb):(4'hb)]));
          reg55 <= $signed($unsigned({($unsigned(reg57) <<< (+(8'ha5))),
              (8'had)}));
          reg56 <= reg60;
          if ((^reg59))
            begin
              reg57 <= (^~$unsigned(wire48[(4'h8):(3'h5)]));
            end
          else
            begin
              reg57 <= $unsigned(wire51[(3'h4):(2'h2)]);
              reg58 <= ($signed(wire50) ?
                  (~{$unsigned($signed(reg59))}) : $unsigned(reg58));
              reg59 <= wire50;
              reg60 <= wire47[(2'h3):(1'h1)];
            end
        end
      reg61 <= (~|{(wire50[(2'h3):(2'h2)] && $unsigned({reg60}))});
    end
  assign wire62 = (reg57[(3'h4):(1'h1)] >> $signed(reg53));
  assign wire63 = wire62[(1'h0):(1'h0)];
  assign wire64 = (((((reg58 ? (7'h43) : (7'h42)) ?
                          wire47 : reg55) && $unsigned($signed(reg53))) ?
                      (((wire62 || reg56) ?
                              (reg57 ? (7'h40) : (8'hba)) : $signed(reg60)) ?
                          ((~&(8'hac)) ?
                              wire63 : (reg58 ?
                                  reg57 : reg56)) : $signed(((8'ha7) == (8'h9d)))) : $unsigned($unsigned((wire48 << reg56)))) != (~&(|$signed((reg60 <= (8'hb4))))));
  always
    @(posedge clk) begin
      reg65 <= $signed(reg59[(3'h5):(2'h2)]);
      reg66 <= ((wire50 ?
              {{wire49[(4'hf):(1'h1)], $signed(reg59)},
                  ($unsigned((8'haa)) == (8'hb2))} : (!$signed((~(8'h9e))))) ?
          $signed($signed(wire49)) : {reg56});
      reg67 <= wire46[(4'hd):(4'hd)];
      reg68 <= $unsigned($signed((reg54[(4'h9):(2'h2)] ~^ $signed((~wire62)))));
    end
  assign wire69 = (|(reg58 * wire64));
  assign wire70 = reg56[(1'h1):(1'h0)];
  assign wire71 = ((~(|$unsigned($signed(reg60)))) != (((reg57[(4'hb):(4'h8)] ^ (wire47 ?
                      (7'h42) : (8'ha4))) + ((8'ha8) < $unsigned(wire69))) ~^ $signed(((reg61 ?
                          (8'hbc) : wire52) ?
                      (reg54 >= reg54) : (wire52 ? reg67 : reg59)))));
  always
    @(posedge clk) begin
      reg72 <= reg60[(1'h0):(1'h0)];
    end
  assign wire73 = {{reg65[(1'h0):(1'h0)]}, $unsigned({(8'ha4)})};
  assign wire74 = reg67;
  assign wire75 = (+$unsigned((($signed((8'hbc)) ^ (wire63 ?
                          (8'h9e) : wire52)) ?
                      reg53[(4'h9):(4'h9)] : ($signed(wire46) ?
                          reg61[(4'hb):(1'h1)] : (wire62 ? reg68 : reg65)))));
  always
    @(posedge clk) begin
      reg76 <= wire48[(4'h8):(2'h2)];
      reg77 <= ({$unsigned({reg65})} > $signed((8'ha4)));
      reg78 <= (wire51[(4'ha):(1'h0)] != reg56);
      reg79 <= $unsigned(($signed(reg61[(1'h0):(1'h0)]) ?
          $signed(wire71) : ($signed(((8'hae) - wire47)) ? (8'hb8) : wire75)));
    end
  assign wire80 = $unsigned((~|reg68));
  assign wire81 = (+($signed($signed(wire52)) ?
                      $unsigned(reg68) : (reg57[(3'h4):(2'h2)] * reg60)));
  assign wire82 = $signed(((~|wire80[(1'h0):(1'h0)]) + ((|(wire80 ?
                      reg59 : wire51)) ^~ reg77)));
  assign wire83 = $signed(wire64[(1'h0):(1'h0)]);
  assign wire84 = (~^$signed(((|wire47[(2'h2):(2'h2)]) <<< (^$unsigned((8'hab))))));
  always
    @(posedge clk) begin
      reg85 <= $unsigned((-wire49[(4'ha):(3'h6)]));
    end
  assign wire86 = ((8'ha8) ?
                      ((($unsigned(wire73) ?
                          {(8'hb4),
                              wire64} : $signed(reg57)) ~^ ((^reg85) || wire50)) >>> ((&$signed(wire63)) ?
                          ((~|reg77) == (^reg59)) : {$unsigned(reg55),
                              $signed(wire50)})) : (-$unsigned($signed((~&wire81)))));
endmodule
