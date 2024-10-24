module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire147;
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire37,
                 wire7,
                 wire6,
                 wire5,
                 wire39,
                 wire40,
                 wire41,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire97,
                 wire99,
                 wire147,
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
                 reg42,
                 (1'h0)};
  assign wire5 = (($signed($signed((wire3 ?
                         wire3 : wire4))) != $unsigned(wire2)) ?
                     {(|(8'hbc))} : (($signed($signed(wire3)) ?
                             (~|$signed(wire1)) : wire3) ?
                         (~^wire4) : wire1));
  assign wire6 = (wire5 << $unsigned(wire0[(3'h4):(1'h0)]));
  assign wire7 = $unsigned(($signed((((7'h44) ?
                     (8'hbc) : wire3) + (~|wire4))) == $unsigned(wire6[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg8 <= ({$signed($unsigned(wire4[(4'hb):(3'h6)])),
              $unsigned(({wire0} ?
                  wire3[(1'h1):(1'h0)] : (wire1 ? wire7 : wire2)))} ?
          ({(~&(!wire1))} != {$unsigned((wire0 || wire2)),
              $signed(wire3)}) : (&({(8'ha4), (-wire7)} ?
              wire5[(4'h9):(4'h8)] : (8'ha7))));
      if ($signed($unsigned(wire6)))
        begin
          if ((-($signed($unsigned((&(8'hae)))) ^~ (^~(!{reg8, wire7})))))
            begin
              reg9 <= $unsigned((-$signed((^$unsigned(wire1)))));
            end
          else
            begin
              reg9 <= (-$unsigned(wire2[(4'ha):(3'h5)]));
              reg10 <= ((reg8 ? wire3 : wire4[(5'h10):(3'h6)]) ?
                  wire6[(4'h8):(3'h5)] : (+(($signed((8'ha5)) >= $signed(reg8)) ?
                      wire3 : $unsigned($unsigned(wire4)))));
              reg11 <= ({{wire2}} - ((^~(wire5 ?
                      $unsigned(reg10) : (^~(7'h44)))) ?
                  wire4[(3'h4):(2'h3)] : (reg8 >= wire4)));
              reg12 <= ($signed($unsigned((~|(wire0 ^~ (8'hb6))))) ?
                  $unsigned($unsigned(reg10[(2'h3):(1'h1)])) : reg11);
              reg13 <= (|$unsigned((((|wire0) ?
                      wire6[(4'ha):(3'h5)] : $signed(reg11)) ?
                  wire1 : (7'h40))));
            end
          if ((~&$unsigned((^~($unsigned(reg12) ~^ reg10[(4'h8):(1'h0)])))))
            begin
              reg14 <= wire1;
            end
          else
            begin
              reg14 <= (8'hb2);
              reg15 <= (~|$signed(({$unsigned(reg8),
                  (reg14 ? (8'hba) : reg14)} >= $signed((wire4 ^~ wire3)))));
              reg16 <= reg15[(1'h1):(1'h0)];
              reg17 <= $unsigned((8'hb0));
              reg18 <= {{$signed(wire7[(4'h8):(1'h1)])},
                  (reg14[(1'h0):(1'h0)] ?
                      ((^~reg10) ?
                          ((wire3 ? reg9 : reg15) ?
                              (!wire5) : (reg11 * wire3)) : ($signed((8'h9f)) && (^~(8'ha6)))) : wire3)};
            end
        end
      else
        begin
          if (reg8[(4'hd):(3'h7)])
            begin
              reg9 <= {wire5,
                  $signed(((~^$signed((8'h9e))) ?
                      $unsigned((~reg18)) : $signed(reg16)))};
              reg10 <= wire6[(4'h9):(3'h7)];
            end
          else
            begin
              reg9 <= ($signed($signed({$unsigned(reg16)})) ?
                  reg16 : (&$unsigned(((wire3 ? wire5 : reg17) >> (wire3 ?
                      reg11 : (8'hb8))))));
              reg10 <= ($unsigned(reg16) - $unsigned(reg8[(5'h14):(3'h5)]));
            end
          if ((+$unsigned(({wire3[(3'h4):(2'h2)]} > reg18))))
            begin
              reg11 <= reg13;
              reg12 <= (wire4 ?
                  $signed(((((8'hb6) + wire1) ?
                      (reg17 ?
                          wire5 : reg14) : $unsigned(wire0)) >>> ($signed(reg13) ?
                      (&(8'ha0)) : reg12[(3'h7):(1'h1)]))) : ((~&{(wire7 > wire0),
                      wire0}) & wire1[(2'h3):(2'h3)]));
              reg13 <= reg15;
              reg14 <= {wire2[(4'hb):(3'h7)]};
              reg15 <= (($signed((reg13[(4'hb):(2'h2)] ?
                      ((8'ha3) ? reg16 : wire5) : (reg12 ?
                          wire4 : wire3))) != $signed((~^(wire4 == wire5)))) ?
                  ($signed($unsigned((^reg12))) >>> reg17[(4'h9):(2'h3)]) : $signed($signed($unsigned(((8'h9d) ?
                      wire3 : (7'h40))))));
            end
          else
            begin
              reg11 <= {$unsigned((~|{{reg11, reg13}})),
                  ((8'hbf) ?
                      $unsigned(reg15) : ((^~(reg8 > wire2)) <<< $unsigned(reg13)))};
              reg12 <= (reg15 ?
                  $signed($signed((-{reg16, wire4}))) : $unsigned(wire3));
              reg13 <= (({((|reg13) && $signed(wire6)),
                      $signed((!(8'hb7)))} >= $unsigned((reg10[(4'hc):(4'hb)] ?
                      (8'hbc) : (reg10 ? (8'hbf) : wire5)))) ?
                  $unsigned(wire0[(2'h2):(2'h2)]) : reg8[(5'h14):(5'h13)]);
            end
        end
      if ((!reg11))
        begin
          reg19 <= $signed($signed((($unsigned(wire6) ?
              $unsigned(reg13) : wire7) ~^ reg12[(4'ha):(2'h2)])));
        end
      else
        begin
          reg19 <= $unsigned($unsigned((&((8'hbd) <<< (reg10 >> wire3)))));
        end
    end
  module20 #() modinst38 (.wire23(wire5), .wire22(wire7), .wire24(wire3), .clk(clk), .y(wire37), .wire21(reg12));
  assign wire39 = ({reg12} ?
                      $unsigned(($signed($signed(wire0)) ?
                          (~|wire5[(1'h1):(1'h0)]) : ($unsigned(reg13) ?
                              (8'haa) : $unsigned(reg11)))) : ($signed((reg10 <= $unsigned(wire7))) ?
                          $signed($signed(reg9)) : ((8'hb0) << $signed(wire6))));
  assign wire40 = (($unsigned((^~{reg9})) * $unsigned(({wire1, reg12} ?
                          reg14 : ((8'ha8) <<< wire6)))) ?
                      reg13 : wire7[(4'he):(4'hd)]);
  assign wire41 = $unsigned($signed((~|reg12)));
  always
    @(posedge clk) begin
      reg42 <= ((&$signed((~|{wire7}))) ?
          (!$signed($unsigned(wire4[(1'h0):(1'h0)]))) : reg19[(2'h2):(1'h1)]);
    end
  assign wire43 = {reg18[(4'h9):(3'h5)], wire2[(3'h6):(3'h5)]};
  assign wire44 = (|reg42[(2'h3):(1'h1)]);
  assign wire45 = $signed(reg12);
  assign wire46 = ((~&($signed((~wire5)) << (~^$signed(wire2)))) && $unsigned(wire2[(5'h10):(2'h3)]));
  module47 #() modinst98 (.y(wire97), .wire52(reg10), .wire50(wire46), .clk(clk), .wire48(reg16), .wire49(wire41), .wire51(reg17));
  assign wire99 = ({$signed(($signed(wire3) >> wire5))} ^~ wire40[(4'h9):(3'h6)]);
  module100 #() modinst148 (.wire102(wire7), .wire101(wire1), .wire104(reg10), .clk(clk), .wire103(wire4), .y(wire147), .wire105(reg12));
  assign wire149 = $signed($unsigned($unsigned(wire97)));
  assign wire150 = wire44;
endmodule

module module100
#(parameter param145 = {((8'ha2) << ((((8'hbf) ? (8'hb1) : (8'hb7)) ? ((8'ha9) * (8'had)) : ((8'hab) == (8'hae))) && ({(8'hba), (8'hb8)} * ((8'hb1) ? (7'h41) : (8'ha1)))))}, 
parameter param146 = param145)
(y, clk, wire101, wire102, wire103, wire104, wire105);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire101;
  input wire [(5'h11):(1'h0)] wire102;
  input wire [(2'h3):(1'h0)] wire103;
  input wire [(4'hc):(1'h0)] wire104;
  input wire signed [(4'hc):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire144;
  wire [(3'h7):(1'h0)] wire143;
  wire signed [(4'ha):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire111;
  wire signed [(5'h10):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire141;
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire106,
                 wire107,
                 wire108,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire141,
                 reg109,
                 (1'h0)};
  assign wire106 = wire105;
  assign wire107 = $signed((((~^wire102) ?
                           $unsigned(wire101) : (wire104[(2'h3):(1'h1)] >>> $unsigned(wire106))) ?
                       (!(~(^(8'h9c)))) : ($signed($unsigned(wire101)) ?
                           (~^$unsigned(wire103)) : (&(!wire101)))));
  assign wire108 = (&(wire104 - (8'hb8)));
  always
    @(posedge clk) begin
      reg109 <= $unsigned($unsigned($signed(((-(8'hb7)) << (wire105 && wire102)))));
    end
  assign wire110 = $signed(({$unsigned($signed((8'hae))),
                       ((wire101 ? wire105 : wire102) ?
                           (wire106 != wire104) : wire103[(2'h3):(2'h2)])} >> reg109[(4'hb):(2'h3)]));
  assign wire111 = wire105;
  assign wire112 = $unsigned($unsigned((!reg109[(3'h4):(1'h0)])));
  assign wire113 = $signed({(($signed(wire105) ?
                           (^~wire112) : (reg109 ?
                               wire102 : wire112)) || wire112),
                       $signed((wire104 >>> $signed(wire107)))});
  module114 #() modinst142 (wire141, clk, wire112, reg109, wire106, wire104);
  assign wire143 = (wire110 && $unsigned((wire108 ?
                       reg109[(5'h12):(4'hb)] : wire104)));
  assign wire144 = {{(^wire113[(4'h8):(3'h4)]), $unsigned(wire113)}};
endmodule

module module47
#(parameter param95 = (^~((~^(((8'ha5) ? (8'hb8) : (8'hb7)) > (+(8'hb2)))) ? (~^(((8'hb6) ? (8'ha1) : (7'h42)) <<< (8'ha7))) : (((^(7'h44)) > (8'h9f)) + {(!(8'h9c))}))), 
parameter param96 = param95)
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire52;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire signed [(5'h14):(1'h0)] wire50;
  input wire [(5'h15):(1'h0)] wire49;
  input wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire53;
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire79,
                 wire77,
                 wire57,
                 wire56,
                 wire53,
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
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = wire48;
  always
    @(posedge clk) begin
      reg54 <= {wire51[(3'h6):(3'h6)]};
      reg55 <= wire52;
    end
  assign wire56 = $signed($signed($signed(reg54)));
  assign wire57 = (((^wire56) ?
                      reg55[(3'h4):(2'h3)] : {$unsigned(wire50[(4'hb):(4'hb)]),
                          $unsigned($signed(wire50))}) && {(wire49[(4'hd):(3'h5)] + ($signed(reg54) ^ (|(8'haf)))),
                      $unsigned((^wire48[(4'hb):(1'h0)]))});
  module58 #() modinst78 (.wire59(wire49), .clk(clk), .wire61(wire52), .y(wire77), .wire60(wire50), .wire62(wire48));
  assign wire79 = wire53;
  always
    @(posedge clk) begin
      if (wire53)
        begin
          if (($signed(wire49[(3'h6):(3'h6)]) * (^~($signed($signed(wire77)) ?
              ($unsigned(wire79) ? (8'hb5) : wire56) : wire56))))
            begin
              reg80 <= (+$unsigned(((wire49 ?
                      wire51[(3'h7):(3'h5)] : (wire57 & wire49)) ?
                  ($signed((8'hac)) && $signed(wire79)) : ($unsigned(wire79) * $signed((7'h42))))));
              reg81 <= ((!$signed({$unsigned((8'hb6)), {wire51, reg80}})) ?
                  wire49[(3'h6):(3'h6)] : ((+(7'h42)) && wire51[(2'h2):(2'h2)]));
              reg82 <= $unsigned(wire52);
            end
          else
            begin
              reg80 <= wire50[(5'h10):(3'h6)];
              reg81 <= $unsigned($signed($signed((wire51 ?
                  (|reg82) : wire50[(5'h13):(4'he)]))));
            end
          if (wire50[(1'h1):(1'h1)])
            begin
              reg83 <= (|wire53[(4'hc):(2'h3)]);
              reg84 <= reg81;
              reg85 <= {$unsigned($unsigned(({(8'haf),
                      wire49} & reg55[(3'h7):(2'h2)]))),
                  wire51};
              reg86 <= (-$unsigned($unsigned($unsigned((~^wire52)))));
              reg87 <= $unsigned(reg86[(3'h4):(1'h0)]);
            end
          else
            begin
              reg83 <= (({$signed({wire48}),
                  $unsigned((~wire50))} || (-$signed((wire57 ?
                  wire56 : wire56)))) != $unsigned($unsigned(reg54[(1'h0):(1'h0)])));
              reg84 <= reg54[(4'hd):(1'h1)];
              reg85 <= (-((|((-wire77) + (^~reg84))) ? (-reg86) : reg84));
              reg86 <= (~wire57[(1'h1):(1'h0)]);
            end
          if (reg54[(3'h4):(2'h3)])
            begin
              reg88 <= (((wire51[(1'h0):(1'h0)] ?
                  (-$unsigned(reg55)) : $unsigned(wire57)) >>> $unsigned(($unsigned(reg85) ?
                  (8'hae) : $unsigned(reg83)))) ^ wire56[(4'hb):(3'h5)]);
            end
          else
            begin
              reg88 <= reg55[(3'h4):(2'h3)];
              reg89 <= $unsigned($unsigned(($unsigned((~&reg82)) + wire77)));
            end
          reg90 <= reg80;
        end
      else
        begin
          reg80 <= wire57;
          reg81 <= $signed((reg89[(3'h5):(2'h2)] >>> $signed(wire53[(3'h6):(3'h5)])));
          reg82 <= $unsigned((wire49 ?
              $signed(wire48[(4'h8):(3'h4)]) : wire77[(1'h1):(1'h0)]));
        end
    end
  always
    @(posedge clk) begin
      reg91 <= reg90;
    end
  assign wire92 = $signed(((($signed(reg85) < $unsigned(reg85)) ?
                      {$signed((8'hb5)),
                          (!wire53)} : $unsigned(((8'hac) + wire79))) >> wire51[(2'h2):(2'h2)]));
  assign wire93 = $unsigned($unsigned(($unsigned((reg86 ? wire92 : wire56)) ?
                      wire51[(2'h2):(2'h2)] : {(reg90 ? wire48 : wire51),
                          (^~wire53)})));
  assign wire94 = $unsigned(wire92[(3'h6):(2'h2)]);
endmodule

module module20
#(parameter param35 = {(+{(|(~^(8'ha7)))})}, 
parameter param36 = (~|((~^(((8'hae) ^ (8'hb2)) ? param35 : (param35 ? param35 : param35))) && (((param35 - (8'ha0)) ? (param35 < param35) : {param35, param35}) ? {(param35 ? param35 : param35), (param35 + param35)} : {(param35 << param35), (+(7'h44))}))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(2'h2):(1'h0)] wire23;
  input wire [(4'hc):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 (1'h0)};
  assign wire25 = (($signed($unsigned(wire21[(4'hf):(4'ha)])) ?
                      (-$unsigned((wire22 ?
                          wire22 : wire24))) : ($unsigned(wire24[(1'h1):(1'h0)]) | (~|(8'hb3)))) * wire23);
  assign wire26 = (8'hae);
  assign wire27 = (wire25[(4'hf):(2'h3)] * $signed($unsigned((wire23 ?
                      $unsigned(wire26) : $signed((8'hb1))))));
  assign wire28 = (wire22[(1'h0):(1'h0)] ^ (wire25 * wire22[(3'h6):(1'h0)]));
  assign wire29 = wire27[(4'hd):(3'h5)];
  assign wire30 = (~{$signed(((~|wire27) << (~^wire27))),
                      (wire26 < $signed($signed(wire29)))});
  assign wire31 = ((&(~|(^~{(8'hb3)}))) ?
                      wire21[(4'hd):(4'hc)] : (~&wire21[(3'h7):(3'h7)]));
  assign wire32 = ($signed(((&wire23) ?
                      wire29 : (wire24[(4'hb):(2'h2)] ?
                          wire30 : wire31[(1'h1):(1'h1)]))) - wire29[(2'h3):(1'h0)]);
  assign wire33 = $signed((~^wire24));
  assign wire34 = wire33;
endmodule

module module58  (y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire62;
  input wire [(4'h9):(1'h0)] wire61;
  input wire [(3'h6):(1'h0)] wire60;
  input wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire63 = $signed((^wire62[(4'hc):(4'hb)]));
  assign wire64 = (^$signed(wire63[(2'h2):(2'h2)]));
  assign wire65 = $signed((|(~^wire62)));
  assign wire66 = (+$unsigned((wire65 == (8'ha6))));
  always
    @(posedge clk) begin
      if (wire61)
        begin
          reg67 <= wire66[(1'h0):(1'h0)];
        end
      else
        begin
          reg67 <= ((wire61 ?
              {$unsigned((wire65 ? wire61 : wire63)),
                  $signed({wire64})} : ({(~|wire59), wire62} ?
                  ((wire61 <= wire59) ?
                      $signed((8'hb4)) : wire59[(2'h3):(1'h0)]) : wire65[(3'h4):(1'h1)])) == $unsigned({($signed((8'ha2)) ?
                  $signed(reg67) : wire66[(2'h3):(2'h3)]),
              wire60}));
          reg68 <= wire60;
          reg69 <= (+(&(wire59 ? (8'had) : wire64)));
        end
      reg70 <= ((!wire59[(5'h12):(4'he)]) ?
          {(~$unsigned((wire59 ? wire65 : wire59))),
              ($signed((|wire61)) >= $signed((!wire61)))} : ((&((wire64 << wire60) >> (&wire59))) < (((wire60 == (8'hbb)) && ((8'hb7) ?
                  wire60 : (8'ha5))) ?
              ({wire61,
                  reg68} - wire64[(3'h5):(2'h3)]) : wire62[(2'h2):(1'h0)])));
      reg71 <= (8'ha8);
      reg72 <= $unsigned((~|{reg69[(4'h9):(2'h3)], $unsigned(wire62)}));
      reg73 <= $signed($signed(($signed($unsigned(wire64)) && $signed(reg70[(3'h5):(3'h5)]))));
    end
  assign wire74 = ($unsigned({(((8'hb2) & reg68) ?
                          ((8'hbd) >= reg72) : (reg70 ? wire66 : wire61)),
                      $unsigned(((8'hb7) << wire60))}) < (-$unsigned({$unsigned(wire65),
                      (-reg67)})));
  assign wire75 = ($unsigned(((~|((8'h9e) != reg69)) || wire65)) ?
                      (!reg69) : {(!$unsigned((wire74 << wire62)))});
  assign wire76 = $unsigned(($unsigned((+wire74[(3'h7):(3'h6)])) ?
                      ((!reg68) ?
                          $signed($signed(wire65)) : $signed(wire60)) : $unsigned((~|$unsigned(wire74)))));
endmodule

module module114
#(parameter param139 = ((&(+((~^(8'hb7)) >>> ((8'hae) ? (8'ha4) : (8'h9f))))) <= ((((~|(8'hb4)) ? ((8'hb8) ? (8'hb5) : (8'hb2)) : ((8'hb1) ? (8'h9c) : (8'hac))) ? (~&((7'h40) ? (8'hbe) : (8'ha9))) : ({(8'ha9)} & ((7'h42) >> (8'h9e)))) - ((7'h44) >>> (-((7'h41) ? (8'hb6) : (8'hb0)))))), 
parameter param140 = (^param139))
(y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'h11a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire118;
  input wire signed [(5'h10):(1'h0)] wire117;
  input wire [(4'ha):(1'h0)] wire116;
  input wire [(2'h2):(1'h0)] wire115;
  wire signed [(5'h14):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(4'ha):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire126;
  wire [(4'h8):(1'h0)] wire125;
  wire signed [(4'he):(1'h0)] wire120;
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire120,
                 reg133,
                 reg132,
                 reg131,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg119,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg119 <= wire117;
    end
  assign wire120 = {wire115, (!wire116)};
  always
    @(posedge clk) begin
      reg121 <= $unsigned($signed((^{$unsigned(wire117),
          wire120[(3'h6):(1'h1)]})));
      reg122 <= reg119;
    end
  always
    @(posedge clk) begin
      reg123 <= (8'haa);
      reg124 <= (+reg121);
    end
  assign wire125 = $signed((&$signed(({reg122,
                       reg122} && reg122[(4'ha):(2'h2)]))));
  assign wire126 = $unsigned((~&$signed(reg119)));
  assign wire127 = $signed($unsigned($unsigned(((reg123 ?
                       reg123 : reg124) ^ wire115[(1'h1):(1'h1)]))));
  assign wire128 = reg124;
  assign wire129 = ($signed(({(wire115 ? reg121 : reg119)} ?
                           reg121[(3'h4):(1'h1)] : ($signed(wire115) >> (~&wire116)))) ?
                       reg123 : ({reg119} ?
                           (~&(reg123 - (~|wire117))) : reg124));
  assign wire130 = $unsigned({(!(~&(8'hbc)))});
  always
    @(posedge clk) begin
      reg131 <= ($unsigned(wire117[(4'h8):(3'h6)]) ?
          (reg121[(3'h6):(3'h5)] ?
              wire130[(1'h0):(1'h0)] : ((~reg124) < wire115)) : reg119[(2'h3):(1'h1)]);
      reg132 <= wire127[(3'h7):(3'h5)];
      reg133 <= {$signed({(&$unsigned(wire130))})};
    end
  assign wire134 = wire126;
  assign wire135 = $unsigned((8'ha3));
  assign wire136 = $unsigned((-wire128));
  assign wire137 = $unsigned($unsigned(wire116[(4'h8):(4'h8)]));
  assign wire138 = wire117[(1'h1):(1'h1)];
endmodule
