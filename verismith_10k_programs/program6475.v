module top
#(parameter param111 = {(~&((^{(8'hbc), (8'ha6)}) <= {(+(8'ha0))}))}, 
parameter param112 = (8'ha6))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire96;
  wire [(4'hc):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire93;
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire4,
                 wire5,
                 wire15,
                 wire21,
                 wire22,
                 wire93,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire4 = ((wire3 * {(!((8'ha2) ?
                         wire1 : wire3))}) ^~ wire0[(4'h8):(3'h6)]);
  assign wire5 = ({(wire2 | $unsigned((wire2 || wire1))), (8'ha4)} ?
                     ($unsigned({$signed((8'ha9)), wire0[(5'h12):(4'hf)]}) ?
                         wire1 : $signed($unsigned((wire3 && wire0)))) : (~wire1[(4'ha):(3'h6)]));
  always
    @(posedge clk) begin
      reg6 <= (!({(|$unsigned(wire0)),
          (|wire4[(4'ha):(3'h4)])} << wire1[(4'h9):(3'h7)]));
      if (wire2)
        begin
          if ($unsigned(($signed(wire0[(5'h13):(2'h3)]) ?
              $unsigned($signed($signed((8'hb3)))) : (wire4 ?
                  {(8'hb7)} : ($unsigned(wire1) ? {reg6} : $unsigned(wire3))))))
            begin
              reg7 <= wire5[(1'h1):(1'h0)];
            end
          else
            begin
              reg7 <= ((((~^(|(8'hab))) ?
                      ((wire5 ? wire2 : reg7) ?
                          (!wire3) : wire3) : $signed($unsigned(wire3))) | $unsigned(wire0[(4'h8):(1'h0)])) ?
                  (wire0 ^~ (-wire2[(4'ha):(1'h1)])) : (+(-((8'hae) ?
                      $unsigned(wire3) : reg6[(2'h3):(1'h1)]))));
              reg8 <= $signed((&$unsigned(wire0)));
            end
          reg9 <= (~^$unsigned(wire1[(1'h0):(1'h0)]));
          reg10 <= reg8[(3'h4):(3'h4)];
          reg11 <= $signed($unsigned((wire5 ?
              $signed($unsigned((8'hb2))) : wire3)));
        end
      else
        begin
          reg7 <= reg8;
        end
      reg12 <= ((-(((reg8 ? wire2 : wire3) << (reg11 >>> wire0)) ?
              $signed(wire4) : wire5)) ?
          $signed(wire2[(4'hb):(2'h3)]) : wire1);
      reg13 <= (^~wire4[(1'h1):(1'h1)]);
      reg14 <= $signed((+((reg9[(1'h0):(1'h0)] ?
          (-(8'hb0)) : $signed(wire0)) ^~ reg11)));
    end
  assign wire15 = {reg8[(3'h5):(1'h0)],
                      $signed($unsigned($unsigned({wire5, wire1})))};
  always
    @(posedge clk) begin
      reg16 <= wire15[(4'h9):(3'h6)];
      reg17 <= wire3[(4'he):(1'h0)];
      reg18 <= wire3;
      reg19 <= (wire15 ? reg12 : reg7[(2'h3):(2'h2)]);
      reg20 <= reg10;
    end
  assign wire21 = reg12[(4'hd):(4'h9)];
  assign wire22 = $signed(wire21);
  module23 #() modinst94 (.wire24(wire2), .wire27(reg13), .clk(clk), .wire25(reg8), .y(wire93), .wire26(reg18));
  assign wire95 = wire4;
  assign wire96 = reg9[(2'h2):(1'h1)];
  assign wire97 = $unsigned(reg11);
  assign wire98 = {(^((+$unsigned(reg11)) - (|wire1)))};
  assign wire99 = wire0;
  assign wire100 = reg8[(3'h5):(2'h3)];
  assign wire101 = wire5[(3'h4):(2'h2)];
  assign wire102 = (&(~^{wire5, (~{wire15})}));
  always
    @(posedge clk) begin
      reg103 <= wire101[(2'h3):(2'h2)];
      reg104 <= wire4;
      reg105 <= ((-$signed(reg103)) ^ ((+(wire96[(2'h2):(2'h2)] & wire102[(1'h0):(1'h0)])) ?
          (((reg17 ? wire101 : wire98) ?
              (reg18 ?
                  (8'ha6) : (8'hb1)) : wire102[(3'h5):(2'h2)]) | (((8'h9c) ?
              (8'hab) : reg16) > {reg10})) : {(wire95 ?
                  (wire100 != (7'h44)) : {(8'had), (8'hbd)}),
              ($signed(reg6) >= (~&reg9))}));
      if ($unsigned(((-$unsigned((8'hb2))) << $unsigned(((reg12 + wire95) >= (~reg16))))))
        begin
          reg106 <= reg7;
          reg107 <= reg6;
          reg108 <= $signed($unsigned(reg12));
          reg109 <= wire4;
        end
      else
        begin
          reg106 <= ((~&wire100) * $signed(reg104));
        end
    end
  always
    @(posedge clk) begin
      reg110 <= (^$unsigned(wire95[(3'h4):(2'h3)]));
    end
endmodule

module module23
#(parameter param92 = ((^({((8'hb6) ? (8'hb2) : (8'hb0)), {(8'h9c)}} ^~ {((8'had) ? (8'hb5) : (8'h9f))})) - (~((-(8'hb3)) < (((8'hae) && (8'hb5)) ? ((8'hbf) <<< (8'hab)) : (&(8'ha4)))))))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire26;
  input wire signed [(2'h3):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire90;
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  assign y = {wire49,
                 wire63,
                 wire65,
                 wire66,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire90,
                 reg67,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= (-$unsigned(({$signed(wire26)} ?
          $signed((wire24 | wire25)) : wire25[(1'h1):(1'h0)])));
      if ({((+wire25[(2'h2):(1'h1)]) ? wire27[(2'h2):(2'h2)] : wire26)})
        begin
          if (wire25[(3'h5):(2'h3)])
            begin
              reg29 <= (~($signed($signed($signed(wire27))) ~^ ((-((7'h40) >>> reg28)) < (+wire25))));
              reg30 <= ((!reg28[(3'h6):(1'h0)]) ~^ (((!$signed(wire27)) < (wire24 ?
                      $signed(reg28) : $signed(wire27))) ?
                  $unsigned(($unsigned(wire26) <= (wire25 ?
                      (8'hbf) : wire25))) : $signed((~&$unsigned(wire26)))));
              reg31 <= (({wire27} ?
                  ((+reg28) ?
                      ($signed(wire24) << (reg30 || wire26)) : {$unsigned(reg29),
                          $signed(wire24)}) : (wire26[(2'h2):(1'h1)] < (reg28 || $unsigned(reg29)))) <<< $unsigned({$unsigned((wire25 & wire26)),
                  reg30[(2'h3):(1'h1)]}));
              reg32 <= wire26[(2'h2):(1'h0)];
              reg33 <= $signed({$unsigned((&(wire27 ? reg28 : reg32))),
                  $signed(((wire27 + reg31) ?
                      (reg32 ? reg32 : wire25) : $signed(reg32)))});
            end
          else
            begin
              reg29 <= (wire25 ?
                  ((^~$unsigned($unsigned(reg33))) ^ wire25[(3'h4):(2'h2)]) : $signed({(8'ha8)}));
              reg30 <= $unsigned(wire27[(2'h2):(1'h1)]);
            end
          if (reg32)
            begin
              reg34 <= ($unsigned($unsigned($signed($unsigned((8'ha0))))) != ($signed($unsigned($unsigned(wire25))) & ($signed((!wire24)) > ((|reg33) ?
                  (wire26 ? wire25 : reg31) : (7'h42)))));
              reg35 <= (wire25 ? reg29 : reg34[(1'h1):(1'h1)]);
              reg36 <= $unsigned(($signed((+$unsigned(reg32))) <= {((^~(8'ha0)) - (reg34 ?
                      reg28 : reg35))}));
            end
          else
            begin
              reg34 <= $unsigned((reg36[(4'h8):(2'h3)] ?
                  $signed((((8'hbc) ?
                      reg29 : reg36) >= $unsigned(wire26))) : reg34[(4'h8):(3'h4)]));
              reg35 <= {reg32, $signed({(!wire26[(1'h0):(1'h0)])})};
              reg36 <= $signed(reg29);
              reg37 <= $unsigned(reg28[(2'h3):(1'h1)]);
            end
          if (($unsigned(reg29[(1'h1):(1'h0)]) == $unsigned((($unsigned(wire27) ?
                  wire24[(5'h10):(4'h9)] : $unsigned(wire25)) ?
              (8'ha0) : reg28))))
            begin
              reg38 <= $signed(reg37);
              reg39 <= (8'hb5);
              reg40 <= $unsigned(reg35);
            end
          else
            begin
              reg38 <= $signed((reg31 ?
                  (((reg38 <<< reg31) ? (&wire26) : (reg40 ? reg35 : reg35)) ?
                      (-(~|reg33)) : $signed(wire25)) : reg33));
              reg39 <= $unsigned((reg35 < $unsigned((((8'haa) ^~ reg29) >> (reg40 ?
                  wire25 : reg34)))));
              reg40 <= reg35[(4'hf):(4'ha)];
            end
          reg41 <= wire25[(3'h6):(1'h0)];
        end
      else
        begin
          reg29 <= $signed($unsigned(((^(+reg29)) ?
              ((&reg41) & reg33[(4'h9):(3'h4)]) : reg41)));
        end
      reg42 <= ($unsigned(({$unsigned(wire27),
          ((8'h9d) << (8'hab))} * {$unsigned(reg34)})) ^~ ((^~$signed((reg33 ?
              reg29 : wire26))) ?
          $signed((8'h9c)) : reg37[(4'hb):(1'h1)]));
      if ((-$signed(reg29)))
        begin
          reg43 <= {$signed(reg35)};
          reg44 <= $signed((wire26[(1'h1):(1'h0)] ?
              $unsigned($signed($unsigned(reg40))) : ((reg37[(4'ha):(3'h6)] <<< $signed(wire24)) && ({reg40,
                      (8'had)} ?
                  {reg33, reg35} : (wire25 ? wire24 : reg32)))));
        end
      else
        begin
          reg43 <= $unsigned(($unsigned((!{reg33})) ?
              (~(-$signed((8'hb6)))) : reg44[(3'h6):(1'h0)]));
          reg44 <= $unsigned(($unsigned($unsigned(reg35[(3'h4):(1'h1)])) ?
              (^~reg39) : {reg31[(4'hf):(4'hb)]}));
          reg45 <= (!(({reg42[(5'h14):(5'h13)]} ?
                  ({(8'ha9), reg35} ?
                      reg32 : (8'hb5)) : $signed($unsigned(reg38))) ?
              {(8'ha5), wire25} : (+{$signed(reg34)})));
          reg46 <= $signed(reg29);
          reg47 <= (($unsigned($unsigned($signed(reg29))) + $signed($signed((^~reg45)))) ~^ wire27[(2'h3):(1'h1)]);
        end
      reg48 <= $unsigned(((~(8'hac)) ?
          {({reg37, (8'hb4)} ^ reg35[(2'h2):(2'h2)]),
              $unsigned((~|wire26))} : reg28));
    end
  assign wire49 = ((&($unsigned((-reg41)) >>> $signed(((8'ha5) || reg34)))) ?
                      ((-reg41) ?
                          ((+wire27[(2'h2):(1'h1)]) * ((reg31 ? reg32 : reg38) ?
                              $unsigned(reg46) : reg46)) : (+(+(reg44 << reg45)))) : (8'hbe));
  module50 #() modinst64 (wire63, clk, reg33, reg30, reg48, reg47, reg35);
  assign wire65 = (~&($signed({reg47, $signed((8'h9f))}) ?
                      reg46 : (-($signed((8'hb7)) || (reg38 >>> reg39)))));
  assign wire66 = wire26;
  always
    @(posedge clk) begin
      reg67 <= $unsigned(wire26[(1'h1):(1'h1)]);
    end
  assign wire68 = (~^(({$signed((8'hbf))} >= reg36) + ({reg34, {reg67, reg36}} ?
                      (~^$unsigned(reg67)) : {((8'hbe) ? (8'hbb) : (8'hb5))})));
  assign wire69 = (-($signed($unsigned({reg67})) ?
                      {reg33[(4'hb):(4'h8)],
                          ($signed(reg44) ^ reg46)} : wire24[(4'hc):(4'h9)]));
  assign wire70 = (~wire63);
  assign wire71 = (({({(8'hba)} >= (reg67 ?
                          reg45 : (7'h43)))} <= {reg31}) >> {reg46});
  module72 #() modinst91 (wire90, clk, wire65, wire70, wire25, wire27, wire71);
endmodule

module module72
#(parameter param88 = {(((((7'h43) ? (8'h9c) : (8'h9c)) ? (~^(8'h9f)) : ((8'ha8) != (8'haa))) != (((7'h44) ? (7'h44) : (8'hb5)) & {(8'h9f), (8'ha8)})) ? (({(8'hba), (8'hbf)} * (^(8'ha6))) ? (((8'h9e) ? (8'ha1) : (7'h42)) == ((8'hb2) ? (8'ha9) : (8'hb1))) : (((8'hb5) ? (8'hae) : (8'hb7)) ? ((8'hb5) && (8'hbb)) : ((7'h42) >= (8'hb9)))) : ((8'ha0) ? (((8'ha4) <= (8'h9d)) & ((8'ha4) <= (8'ha9))) : (8'hae))), (~((^((8'hb8) ? (8'had) : (8'haf))) ? (!((8'h9d) != (8'hbe))) : (((8'hba) < (8'ha1)) ^ ((8'ha3) ? (8'ha1) : (8'hab)))))}, 
parameter param89 = (((((~&param88) ? (param88 < (8'ha4)) : (8'ha7)) ? ((~param88) >= (param88 ~^ param88)) : {{param88, param88}}) >> (+((8'ha0) ? ((8'hb6) >> param88) : (&param88)))) ? ((((param88 ? param88 : param88) & param88) ? param88 : param88) >= param88) : {(((param88 ? param88 : (8'hb9)) ? (~&param88) : (param88 <<< param88)) ? (param88 * (param88 ? param88 : param88)) : param88)}))
(y, clk, wire77, wire76, wire75, wire74, wire73);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire77;
  input wire [(5'h11):(1'h0)] wire76;
  input wire [(3'h6):(1'h0)] wire75;
  input wire [(2'h3):(1'h0)] wire74;
  input wire signed [(2'h2):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire79,
                 wire78,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire78 = wire75[(2'h2):(1'h1)];
  assign wire79 = ((&$unsigned((wire73[(2'h2):(2'h2)] >> wire73))) << ((+wire75) ^~ ({(~^(8'ha6))} ?
                      (~&(wire78 ?
                          wire73 : wire77)) : ((wire78 >= wire77) > (~&wire76)))));
  always
    @(posedge clk) begin
      reg80 <= $unsigned($signed((((wire79 ? wire78 : wire77) ?
          $signed(wire73) : wire76[(5'h10):(3'h4)]) + (~&$unsigned((8'ha2))))));
      reg81 <= (|(~^(^$signed((wire78 ? wire75 : wire74)))));
      reg82 <= (^~(^~wire76));
      reg83 <= (~|(wire77[(3'h6):(2'h3)] ?
          (8'hba) : ($signed($unsigned(wire75)) ?
              ((wire78 ^ wire78) ?
                  $signed(wire76) : $signed(wire74)) : wire78)));
    end
  always
    @(posedge clk) begin
      reg84 <= (|wire78);
    end
  assign wire85 = wire75[(1'h0):(1'h0)];
  assign wire86 = (~|$signed(((~^(wire77 ? wire79 : wire77)) >> ((reg81 ?
                      (8'hbd) : wire73) * wire73))));
  assign wire87 = reg81;
endmodule

module module50
#(parameter param61 = {(((~|{(8'h9f)}) <<< ({(8'hb3)} == (~&(8'had)))) == ((~&(~(8'hbe))) * (((8'haa) ? (8'haa) : (8'ha7)) ? (!(8'haa)) : ((8'ha8) ? (8'hab) : (7'h40))))), (^~(({(8'hab)} && (|(8'ha8))) ? ((~|(7'h43)) ? ((8'hb8) << (8'hac)) : (^(8'ha4))) : ((+(8'hbf)) ? ((8'ha5) - (8'ha1)) : ((8'hb8) ? (8'hb7) : (8'ha5)))))}, 
parameter param62 = (((({param61} ? {param61} : (+param61)) ? (8'hb0) : param61) ? (((param61 & param61) || {param61, param61}) >>> param61) : (&(8'ha4))) - param61))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire55;
  input wire signed [(4'ha):(1'h0)] wire54;
  input wire signed [(5'h10):(1'h0)] wire53;
  input wire signed [(4'ha):(1'h0)] wire52;
  input wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire56;
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  assign y = {wire59, wire58, wire57, wire56, reg60, (1'h0)};
  assign wire56 = $unsigned((|$signed(wire52)));
  assign wire57 = ((~^(~^(~|wire52))) ?
                      $signed(((wire51[(4'h9):(3'h5)] ?
                          (^wire53) : (~wire52)) <= ($unsigned(wire52) ?
                          $unsigned(wire54) : (wire55 > wire51)))) : $signed({($unsigned(wire51) & $signed((8'hb0)))}));
  assign wire58 = (($signed({wire56, (!wire55)}) ?
                      wire56 : wire51[(2'h3):(1'h1)]) < $unsigned((~^wire53[(4'hc):(4'h9)])));
  assign wire59 = $signed(wire52[(4'ha):(4'h8)]);
  always
    @(posedge clk) begin
      reg60 <= {wire53[(1'h1):(1'h1)],
          $unsigned((($unsigned(wire53) <= wire52[(3'h7):(1'h1)]) ?
              $signed(wire53[(5'h10):(2'h2)]) : ((8'ha6) ?
                  (wire56 >= wire57) : (7'h41))))};
    end
endmodule
