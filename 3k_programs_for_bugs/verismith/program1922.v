module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire92;
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire15,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire92,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg36,
                 reg35,
                 reg27,
                 reg26,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (($unsigned((wire2 ? wire4 : wire1)) ?
                     (wire2 * ({wire2,
                         wire0} * wire4[(4'h8):(4'h8)])) : (~|{(wire1 ?
                             wire2 : wire2)})) << (wire3 ?
                     (~&(~(+wire0))) : wire3));
  assign wire6 = $unsigned($signed(wire4));
  assign wire7 = {($unsigned((wire2 ?
                         wire5 : $signed(wire0))) + (~&($unsigned(wire0) ?
                         wire2[(1'h0):(1'h0)] : (-wire3)))),
                     ((wire3[(4'h9):(3'h6)] ?
                             $signed((&wire6)) : wire0[(4'hb):(4'hb)]) ?
                         ($signed($unsigned(wire5)) <= ((wire2 ?
                             (8'hb7) : wire6) >= $signed(wire2))) : (8'ha3))};
  assign wire8 = $signed((8'hab));
  assign wire9 = ($signed($unsigned(wire7[(2'h2):(1'h0)])) << wire0[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg10 <= $signed(($signed((~(wire0 && wire5))) ?
          $signed(wire9) : $unsigned(wire4)));
      reg11 <= $unsigned(({(~|wire6[(2'h2):(1'h0)]), wire8[(2'h2):(2'h2)]} ?
          (^$unsigned((wire7 ? (8'hb7) : wire4))) : ({((8'hbf) > wire7),
                  ((8'ha2) ? wire6 : reg10)} ?
              ((&wire9) ?
                  $unsigned(wire4) : $unsigned(wire0)) : $signed(wire8))));
      reg12 <= wire3;
      reg13 <= $signed((-$unsigned(($signed(wire9) ?
          $unsigned(wire2) : (~wire2)))));
      reg14 <= $unsigned({$signed(wire0[(1'h1):(1'h1)]),
          (((|wire8) >> (wire0 ? reg10 : wire7)) ? wire2 : $signed((8'hac)))});
    end
  assign wire15 = (wire5[(3'h5):(2'h3)] ^ reg12[(5'h11):(3'h5)]);
  always
    @(posedge clk) begin
      reg16 <= $unsigned(($unsigned((~|(reg10 * wire3))) >>> (((~&wire15) ?
          $unsigned(reg13) : wire1) + wire9)));
      reg17 <= {((~&($signed(reg14) ? (reg10 ? (8'ha0) : reg14) : (~&wire4))) ?
              ((wire6[(1'h0):(1'h0)] ~^ (^reg11)) ?
                  ({(8'ha9), wire15} ?
                      $unsigned(wire7) : $unsigned(wire2)) : $signed($signed(wire6))) : wire4)};
      reg18 <= wire6;
      reg19 <= $unsigned((&($signed(((8'hba) - wire7)) ^~ reg18)));
      if ((((reg18 ? $signed((reg10 >> (8'hb2))) : (~&(~|wire9))) ?
              ($unsigned(reg14[(4'ha):(3'h7)]) ?
                  (((8'ha0) < wire0) != $unsigned(reg10)) : $unsigned(reg17[(1'h1):(1'h1)])) : (!((8'h9c) ?
                  (reg13 ? wire15 : reg19) : $unsigned(reg19)))) ?
          (8'ha8) : $unsigned(({reg17[(2'h3):(2'h2)]} ~^ reg11[(4'ha):(4'h9)]))))
        begin
          reg20 <= $unsigned(($unsigned(((wire1 + (8'ha0)) || (wire4 * wire6))) ?
              reg11[(4'hf):(1'h0)] : $unsigned(({wire7} ? {wire7} : wire3))));
          reg21 <= wire1;
          if ($signed($signed($signed($signed((-reg20))))))
            begin
              reg22 <= {$unsigned((wire7[(4'h9):(2'h2)] | (wire7[(4'h8):(4'h8)] ?
                      reg18[(3'h5):(1'h0)] : $unsigned(wire5)))),
                  reg19[(1'h0):(1'h0)]};
            end
          else
            begin
              reg22 <= ($unsigned(($unsigned((wire15 ^~ wire0)) - ({reg17} ?
                      $signed(reg20) : wire15))) ?
                  ((-(wire6[(4'he):(4'he)] && (+reg21))) ?
                      $signed(reg21[(1'h1):(1'h0)]) : $unsigned(reg16[(3'h5):(2'h2)])) : wire2[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          if ((8'hb8))
            begin
              reg20 <= $signed($signed(({reg14} ?
                  (reg17[(2'h3):(1'h1)] ?
                      $signed(reg14) : {wire1}) : wire15[(4'hd):(1'h0)])));
              reg21 <= wire5[(3'h5):(3'h5)];
              reg22 <= $unsigned(($signed($signed($signed(reg12))) >= reg18[(2'h3):(2'h3)]));
              reg23 <= (|$unsigned(reg16[(2'h3):(1'h1)]));
            end
          else
            begin
              reg20 <= ((!$unsigned((reg21 ?
                      (!(7'h41)) : (reg19 ? reg11 : reg19)))) ?
                  $unsigned(($signed(wire8) ?
                      reg12 : $signed((+reg12)))) : $signed($signed(reg19[(2'h2):(2'h2)])));
              reg21 <= reg11[(4'hc):(4'hc)];
            end
          reg24 <= (~^((8'hb3) && reg13));
          reg25 <= ($signed(($unsigned((|reg16)) ?
                  (~(wire4 ? reg23 : reg19)) : reg23[(2'h2):(2'h2)])) ?
              $signed(($signed((reg14 ? (8'ha8) : wire8)) ?
                  $unsigned({reg18}) : reg19)) : ($signed(({(8'ha3), reg17} ?
                      (reg19 + reg21) : (~wire1))) ?
                  ((!$unsigned(wire9)) < ($unsigned(wire3) ?
                      $signed(wire4) : (~(8'ha4)))) : reg24));
          reg26 <= {($unsigned(wire15) * $signed((~|reg24[(1'h0):(1'h0)]))),
              (~|$signed(reg11[(4'hb):(4'ha)]))};
          reg27 <= $unsigned(($unsigned((wire5[(4'h9):(4'h8)] && reg24[(2'h2):(1'h1)])) || wire7[(4'h8):(2'h3)]));
        end
    end
  assign wire28 = $signed(((($signed(reg20) ?
                      reg23 : $signed(reg25)) != $signed((wire3 >> (8'hb7)))) ~^ reg23[(1'h0):(1'h0)]));
  assign wire29 = {(7'h42)};
  assign wire30 = wire15;
  assign wire31 = (8'hb3);
  assign wire32 = wire2[(2'h3):(2'h2)];
  assign wire33 = (reg17 ? reg13 : $unsigned((8'h9d)));
  assign wire34 = ((8'hb9) ^ reg17);
  always
    @(posedge clk) begin
      reg35 <= reg23[(1'h1):(1'h0)];
      reg36 <= (8'hab);
    end
  module37 #() modinst93 (.wire42(wire28), .clk(clk), .wire40(wire34), .wire41(reg26), .y(wire92), .wire39(wire2), .wire38(reg19));
  always
    @(posedge clk) begin
      if (wire28[(4'hf):(4'hd)])
        begin
          reg94 <= ((^($unsigned(wire32) ^~ $signed((8'hac)))) ?
              $unsigned(reg27[(2'h3):(1'h1)]) : $unsigned((((reg27 ?
                          wire31 : wire7) ?
                      reg19 : reg16[(1'h0):(1'h0)]) ?
                  reg18[(3'h6):(2'h3)] : reg12[(5'h10):(3'h4)])));
          if ($unsigned(({(^$unsigned((8'h9f)))} ?
              ((|(wire31 == reg19)) ~^ wire28[(4'hb):(1'h0)]) : $signed(reg12))))
            begin
              reg95 <= $signed($unsigned($unsigned((wire9 ?
                  $signed(wire9) : (~^reg18)))));
            end
          else
            begin
              reg95 <= ({(($unsigned((8'hbc)) ?
                      wire8 : $signed((8'hb4))) & (~^$unsigned(wire28))),
                  (~|($unsigned(wire28) ?
                      $unsigned((7'h41)) : ((8'ha6) ?
                          wire4 : reg16)))} << $signed((~&$unsigned((reg94 & wire0)))));
              reg96 <= $unsigned((^{($unsigned(reg23) + $signed(wire9))}));
              reg97 <= $signed($signed((reg18[(1'h0):(1'h0)] ?
                  $signed(wire34) : ((reg35 ?
                      reg35 : reg20) && $signed((8'ha5))))));
              reg98 <= (~({(|(wire3 <= wire33)), (^(reg11 ? reg21 : reg13))} ?
                  ($signed((reg25 * reg18)) ?
                      reg26[(1'h1):(1'h1)] : $signed((wire2 ?
                          wire28 : wire6))) : (reg96[(2'h2):(1'h0)] + (|$signed(reg35)))));
              reg99 <= (reg98[(3'h5):(3'h5)] ? reg26 : (^~reg11));
            end
          reg100 <= reg94[(1'h0):(1'h0)];
          reg101 <= ({$signed(((reg98 ? reg36 : (8'h9c)) ?
                  $signed(reg98) : $signed(wire28)))} == (wire4 ?
              wire15[(4'hd):(4'hb)] : $signed((wire1 >= reg99[(2'h3):(1'h1)]))));
        end
      else
        begin
          if (reg10)
            begin
              reg94 <= (($unsigned($unsigned((-reg16))) & $signed((reg17 <<< reg16))) - reg16);
              reg95 <= (reg11 ?
                  reg12 : (reg24[(3'h4):(2'h2)] && (^~reg20[(3'h4):(1'h1)])));
              reg96 <= {(|reg24), $signed((^~$signed($signed((8'ha2)))))};
              reg97 <= (wire7[(2'h2):(2'h2)] ?
                  $unsigned(wire30[(4'hb):(3'h5)]) : $signed($signed($signed($signed(reg26)))));
              reg98 <= ({reg10,
                  reg24[(1'h0):(1'h0)]} <<< (+(reg12[(3'h7):(3'h6)] ?
                  $signed({reg99}) : (-(wire28 ? reg96 : reg98)))));
            end
          else
            begin
              reg94 <= wire32;
              reg95 <= {$unsigned($unsigned({(wire15 && reg24)})),
                  $unsigned((8'ha9))};
              reg96 <= reg17;
              reg97 <= $signed($unsigned({$unsigned($unsigned(reg16)),
                  wire2[(5'h11):(3'h7)]}));
              reg98 <= ({reg25,
                  (~(wire1[(4'hb):(1'h1)] ?
                      reg18[(3'h6):(1'h0)] : ((8'hb6) ?
                          reg14 : reg20)))} && wire7);
            end
        end
      reg102 <= ($unsigned($unsigned(((reg12 >= reg98) <<< {reg20,
          reg26}))) ^~ reg23);
      if ((&(($unsigned({(8'haf),
          reg94}) + reg94) & ($unsigned((reg16 && wire5)) ?
          $unsigned(reg17[(1'h0):(1'h0)]) : ($signed(reg12) >= wire32)))))
        begin
          reg103 <= $signed((reg102 ?
              {((~wire30) ? $unsigned(wire92) : (reg94 * wire9)),
                  $signed({reg101,
                      reg101})} : $unsigned(reg23[(1'h0):(1'h0)])));
          if (($signed($signed((reg94 ?
              (reg25 | reg20) : (wire30 ?
                  wire92 : (8'ha1))))) >> wire28[(4'ha):(3'h4)]))
            begin
              reg104 <= $signed({$signed(reg12)});
              reg105 <= wire31[(4'hb):(3'h7)];
            end
          else
            begin
              reg104 <= {reg24[(1'h1):(1'h0)],
                  (|(&(((8'hb3) >>> wire0) ?
                      $signed(wire1) : wire7[(2'h3):(2'h2)])))};
              reg105 <= {(8'had),
                  $unsigned(((|$unsigned((8'h9f))) >>> $signed(reg17)))};
              reg106 <= $unsigned((|$signed($unsigned((~|(8'ha7))))));
              reg107 <= ({$unsigned(($unsigned(wire1) ?
                      (8'had) : reg24[(3'h7):(2'h3)])),
                  ((+(reg27 + reg11)) ?
                      (wire34 <<< (reg98 << (8'hb8))) : reg94[(1'h1):(1'h0)])} << (-$unsigned(wire9[(1'h0):(1'h0)])));
            end
          reg108 <= (^~(~^(wire3 < $signed(reg24))));
        end
      else
        begin
          reg103 <= $signed((reg95[(4'ha):(3'h6)] > ((wire32[(2'h2):(1'h1)] != (~(8'ha5))) - (~^{(8'ha7),
              reg35}))));
          if ({{{{$unsigned(reg27), (wire9 ? (8'ha2) : (8'ha5))},
                      ((|wire4) > $signed(wire2))},
                  $unsigned(($signed(reg105) ?
                      (reg99 ~^ (7'h40)) : (wire7 ? reg21 : reg12)))}})
            begin
              reg104 <= $unsigned($signed((8'ha7)));
            end
          else
            begin
              reg104 <= (8'hae);
              reg105 <= ($signed(wire28[(3'h6):(3'h5)]) ?
                  ($unsigned((~^(8'h9c))) ?
                      (~(((8'hbe) != (8'hb5)) > (reg26 - reg35))) : wire29) : {((8'hb0) ?
                          $signed(reg96[(1'h1):(1'h1)]) : {reg10[(4'h8):(3'h4)],
                              ((7'h41) ? reg100 : reg100)})});
            end
          reg106 <= reg17;
          reg107 <= (8'ha9);
        end
    end
  assign wire109 = {((($signed(wire8) >>> $unsigned(wire6)) ?
                               ($unsigned((8'hb5)) < $unsigned((8'ha1))) : $signed($signed(reg103))) ?
                           $unsigned($unsigned(((8'ha7) ?
                               reg96 : wire3))) : wire29)};
  assign wire110 = ((^wire1) != ((reg24[(3'h7):(3'h5)] & ({wire15,
                       (8'ha8)} + $unsigned(reg23))) >>> $signed((^~(wire1 == reg11)))));
  assign wire111 = (8'hbf);
  assign wire112 = wire6[(2'h3):(2'h2)];
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire42;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(5'h13):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire43;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = (|{$signed(wire39)});
  assign wire44 = $signed(wire43[(4'h9):(3'h4)]);
  assign wire45 = $unsigned(wire44[(3'h4):(2'h2)]);
  assign wire46 = ($signed(wire44) ? wire42 : wire43[(3'h6):(1'h0)]);
  assign wire47 = {(&$signed(wire41[(2'h3):(1'h0)]))};
  assign wire48 = $unsigned(wire38[(2'h2):(2'h2)]);
  module49 #() modinst83 (wire82, clk, wire42, wire39, wire41, wire48);
  assign wire84 = ($signed((-wire41)) + (~$unsigned({$unsigned(wire39),
                      $unsigned(wire39)})));
  assign wire85 = wire48;
  assign wire86 = (8'hb5);
  assign wire87 = (wire48 ~^ (~|wire39));
  assign wire88 = (8'hab);
  assign wire89 = $signed($signed(({(wire84 ^ wire43), (wire86 < wire47)} ?
                      $signed((^wire43)) : ({wire48} ?
                          (^~(8'ha6)) : $signed(wire85)))));
  assign wire90 = $signed((^wire42[(4'ha):(4'h9)]));
  assign wire91 = wire48[(1'h0):(1'h0)];
endmodule

module module49  (y, clk, wire53, wire52, wire51, wire50);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire53;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(4'h9):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
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
                 (1'h0)};
  assign wire54 = (($unsigned({$signed(wire50),
                      wire52[(3'h6):(2'h3)]}) ^ wire51) >= $signed($signed($unsigned($signed(wire52)))));
  assign wire55 = ((-wire51[(1'h0):(1'h0)]) << ($unsigned((&((7'h40) && wire53))) ?
                      wire51[(3'h4):(1'h1)] : wire53));
  assign wire56 = (wire52 & (wire51 || ((^~(~&(8'hbc))) - (|(~|wire52)))));
  assign wire57 = $signed(wire51[(2'h3):(1'h0)]);
  assign wire58 = $unsigned({((((8'hb2) && (8'ha6)) >>> {wire51}) ~^ $unsigned(wire55[(5'h13):(4'hd)])),
                      $signed(wire57[(2'h3):(2'h2)])});
  assign wire59 = {((|(wire58 << (^(8'hb5)))) >>> wire55)};
  always
    @(posedge clk) begin
      if (({wire58[(1'h0):(1'h0)]} == wire58))
        begin
          if (($unsigned(($signed($signed((8'hb3))) >>> $signed((~wire55)))) <<< (&$signed(wire51[(2'h2):(1'h1)]))))
            begin
              reg60 <= wire52;
              reg61 <= ($signed(($signed(reg60[(1'h0):(1'h0)]) || $signed({wire52}))) ?
                  (($unsigned($unsigned(wire50)) ?
                      (wire50 ?
                          (|(8'h9c)) : $unsigned(wire50)) : wire54[(1'h0):(1'h0)]) | ($unsigned(wire50) ?
                      wire50 : $signed($unsigned(wire55)))) : (!(wire58[(2'h2):(1'h1)] ?
                      (wire56[(2'h3):(2'h2)] ? wire53 : (+wire50)) : (wire57 ?
                          wire59[(3'h7):(3'h4)] : wire55[(1'h0):(1'h0)]))));
              reg62 <= wire55[(1'h0):(1'h0)];
              reg63 <= ((((!(wire54 || wire59)) < $unsigned($signed(reg60))) ?
                  $unsigned(wire51) : ($signed($signed(wire52)) << $unsigned((wire57 ?
                      wire59 : wire53)))) | wire50[(4'h8):(2'h3)]);
            end
          else
            begin
              reg60 <= wire51;
            end
          if ($signed(wire54[(3'h6):(3'h6)]))
            begin
              reg64 <= $unsigned($unsigned(wire52));
              reg65 <= (~^($unsigned($unsigned({reg63})) ?
                  (^((&(8'hbe)) & reg62[(4'h9):(4'h8)])) : (($unsigned(wire52) | ((8'hb7) * wire51)) ?
                      (wire56[(1'h0):(1'h0)] ?
                          (~&wire52) : wire54[(3'h4):(2'h2)]) : $unsigned(reg61))));
            end
          else
            begin
              reg64 <= $unsigned($unsigned((wire59[(4'hc):(4'h8)] + $unsigned((+reg60)))));
              reg65 <= $signed($unsigned((wire57 | wire56)));
              reg66 <= $signed(reg62);
              reg67 <= $signed(reg62);
              reg68 <= (~$signed(($unsigned((-wire52)) | $signed(reg62[(2'h3):(1'h1)]))));
            end
        end
      else
        begin
          reg60 <= $unsigned(($signed(wire52) >> (wire52 ?
              $unsigned((wire54 || wire55)) : {wire52})));
          reg61 <= reg68;
        end
      reg69 <= (((&$signed($signed(wire51))) ^~ (reg67[(4'hd):(4'ha)] ~^ ((~|wire53) > $unsigned(wire56)))) ?
          reg66[(3'h6):(1'h0)] : reg68[(4'h9):(1'h0)]);
      reg70 <= (|($unsigned((~^$signed(wire51))) ?
          (wire56[(2'h3):(1'h1)] <<< ((reg65 >>> wire58) ^~ (8'ha5))) : (((reg60 ?
                  reg61 : wire52) ?
              wire54[(1'h0):(1'h0)] : reg62) - $unsigned({wire56, reg68}))));
    end
  assign wire71 = (reg64[(1'h0):(1'h0)] ?
                      reg65[(3'h5):(2'h2)] : wire57[(2'h2):(1'h0)]);
  assign wire72 = $signed($unsigned((reg62[(2'h3):(1'h1)] ?
                      {(reg60 ~^ wire50)} : ((wire54 ?
                          reg62 : wire59) || wire52[(5'h10):(4'hf)]))));
  assign wire73 = reg63;
  assign wire74 = (~($signed(wire71[(1'h1):(1'h0)]) - (8'hb3)));
  assign wire75 = (8'hb2);
  assign wire76 = ((((reg69 ?
                              reg65[(2'h3):(2'h2)] : $unsigned(reg65)) & wire59[(1'h1):(1'h1)]) ?
                          wire59 : wire58) ?
                      (!reg67[(4'h9):(3'h6)]) : $signed(reg70[(4'h9):(1'h1)]));
  assign wire77 = (wire75 ?
                      {(~^reg64[(4'h9):(2'h2)]),
                          (wire50 ?
                              $signed((reg69 ?
                                  wire51 : wire76)) : $signed((wire76 ?
                                  wire55 : (8'ha6))))} : (8'hb8));
  assign wire78 = reg64[(5'h11):(5'h10)];
  assign wire79 = wire54[(3'h7):(3'h4)];
  assign wire80 = wire53[(3'h4):(3'h4)];
  assign wire81 = $unsigned($unsigned(($unsigned((~^wire77)) ?
                      ($signed(reg61) ?
                          (wire57 + wire76) : (wire73 ?
                              reg68 : (7'h42))) : (-reg69[(2'h2):(1'h0)]))));
endmodule
