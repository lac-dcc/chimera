module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire [(4'he):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire121;
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire17,
                 wire18,
                 wire121,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = ((8'hbd) * (((wire3 < (wire3 ^~ (8'h9c))) ?
                     wire3 : (~|wire3[(1'h1):(1'h0)])) | $signed($unsigned((wire0 ^~ wire3)))));
  assign wire5 = (({wire0} >>> wire1) ? wire1 : $signed($signed((!(+wire2)))));
  assign wire6 = $signed({$signed((wire4[(2'h2):(1'h0)] ^ (wire4 ?
                         (8'h9c) : wire5)))});
  assign wire7 = ({wire0[(1'h0):(1'h0)],
                     (wire3 ?
                         ((~|wire2) ?
                             $signed((8'hbe)) : $signed(wire1)) : ((wire2 ?
                             (8'hae) : wire5) != wire6[(1'h1):(1'h0)]))} + wire6);
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg8 <= (($signed((((8'ha4) ?
                  wire0 : wire6) <<< $signed(wire1))) || wire3) ?
              (wire1[(4'hc):(4'hc)] < (wire1 ?
                  wire5 : $signed(wire6))) : wire3[(5'h10):(2'h2)]);
          reg9 <= {reg8,
              $unsigned(((reg8[(4'ha):(3'h6)] ?
                  ((8'hb6) ?
                      wire2 : wire5) : (reg8 ^ wire2)) >= $unsigned($signed(wire2))))};
          if (wire1[(5'h11):(2'h3)])
            begin
              reg10 <= (reg8 < reg9[(1'h0):(1'h0)]);
              reg11 <= $signed((^~(!(^~reg8))));
              reg12 <= $unsigned($unsigned(reg11[(2'h3):(1'h1)]));
              reg13 <= $unsigned($unsigned((|$unsigned($unsigned(reg11)))));
              reg14 <= (($unsigned(wire6) ~^ $signed(wire7)) >= $unsigned((~&((^(8'haa)) >= (reg11 ~^ (8'hb2))))));
            end
          else
            begin
              reg10 <= ((^{reg9[(2'h2):(1'h1)]}) ?
                  $unsigned(({{(8'hb8)}, $unsigned(reg10)} ?
                      reg14[(2'h3):(2'h3)] : ((reg14 ? (8'haf) : reg12) ?
                          (reg14 ?
                              reg8 : reg9) : wire4[(2'h3):(2'h3)]))) : reg8);
              reg11 <= wire7;
              reg12 <= ($signed($unsigned(reg8)) > ((|wire7[(4'hc):(3'h5)]) >>> wire6[(1'h0):(1'h0)]));
              reg13 <= ((wire7 == {($unsigned(reg14) - (|reg9))}) ?
                  $signed((reg11[(2'h2):(1'h0)] ?
                      ({(8'hb2)} && $signed(wire0)) : $signed((reg14 || wire0)))) : (7'h40));
            end
        end
      else
        begin
          reg8 <= ($unsigned($unsigned(wire0)) * (~&reg8));
        end
      reg15 <= $unsigned(wire1);
      reg16 <= ((($signed((wire2 ? wire4 : (8'hbc))) ?
                  {{reg9},
                      reg10[(3'h4):(2'h2)]} : $unsigned((reg11 << reg10))) ?
              $signed($signed($unsigned(wire0))) : wire6[(2'h3):(2'h3)]) ?
          wire3 : {$signed(reg12)});
    end
  assign wire17 = {(~^($signed((reg16 ? (8'hb4) : reg16)) ^ reg10)), (8'hab)};
  assign wire18 = $signed(($unsigned((-{(7'h41),
                      wire4})) >>> wire5[(1'h1):(1'h0)]));
  module19 #() modinst122 (wire121, clk, wire18, wire0, wire5, reg11, reg15);
  assign wire123 = $unsigned(wire18[(4'he):(4'he)]);
  assign wire124 = ({wire1[(4'hc):(4'hb)], wire1[(4'h9):(2'h3)]} ?
                       $signed((+$unsigned((wire2 > wire18)))) : ((~^($unsigned((8'hbd)) == (wire121 ?
                           reg16 : wire1))) >= $signed(reg13)));
  assign wire125 = wire17;
endmodule

module module19
#(parameter param119 = (({{((8'hb1) * (8'ha3)), ((8'h9e) ? (8'hb0) : (8'hb9))}} ? {((^(8'ha4)) > ((8'hba) + (8'ha1)))} : (-((-(8'hbd)) <= ((7'h44) || (8'hbc))))) ? ((8'hb8) ? ((((8'h9f) ? (8'ha0) : (8'h9f)) ? {(8'hae)} : ((8'ha0) & (8'ha6))) <= (~|(7'h42))) : (^(((8'hb7) ? (8'hb5) : (8'had)) ? ((8'ha6) ? (8'h9e) : (8'h9e)) : (^(8'h9f))))) : ((((+(8'ha2)) ? ((8'h9c) ? (8'h9d) : (8'hbe)) : ((8'hb5) << (8'ha9))) ? (^(~&(8'hb9))) : (~{(8'hb4), (8'ha2)})) ? ({(|(8'ha0))} * (^(+(8'h9d)))) : ((8'hbf) ? (~&((8'hb8) ? (8'ha1) : (8'ha6))) : ((~(8'ha4)) ? ((8'ha1) >= (8'hb8)) : (^~(8'ha7)))))), 
parameter param120 = {{param119, param119}})
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire24;
  input wire [(4'hf):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire117;
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  assign y = {wire66,
                 wire27,
                 wire26,
                 wire25,
                 wire68,
                 wire117,
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
                 (1'h0)};
  assign wire25 = (((&((^wire22) ?
                          $signed(wire22) : (wire24 ?
                              (8'ha9) : wire22))) == (((wire21 > wire23) ?
                          (~^wire24) : (~^wire21)) >>> wire24)) ?
                      (&wire22) : $unsigned($unsigned(((^~wire21) ?
                          (wire24 ? wire21 : wire22) : {wire20, (8'hbe)}))));
  assign wire26 = (((wire23 ?
                          $unsigned({(8'ha4)}) : (~&wire22[(3'h6):(1'h1)])) ?
                      $unsigned({(~&wire23),
                          $signed(wire21)}) : $signed(($unsigned((8'ha4)) < (~|wire25)))) != (+$unsigned(wire24[(4'hc):(3'h6)])));
  assign wire27 = wire22;
  module28 #() modinst67 (wire66, clk, wire23, wire27, wire25, wire22, wire24);
  assign wire68 = wire26;
  always
    @(posedge clk) begin
      reg69 <= ((($signed({wire66}) & {(wire66 ? (8'hbf) : wire68)}) ?
          {wire24[(1'h1):(1'h1)],
              (~&$unsigned((7'h42)))} : (~|(wire26 > (wire66 ?
              wire20 : wire21)))) - ((-wire24) ?
          (((-wire26) + (wire66 != wire22)) + ((wire21 <= wire23) ^ (wire68 ?
              wire21 : wire27))) : $signed((wire26 ^ wire26))));
      reg70 <= (wire21 ?
          $signed(wire27[(2'h3):(1'h1)]) : wire25[(4'h9):(2'h3)]);
      if ($signed($signed(wire20[(1'h1):(1'h1)])))
        begin
          reg71 <= $unsigned($signed((wire22 ?
              wire20 : ((wire26 ? wire66 : wire25) ?
                  (wire68 << wire22) : (wire24 ? wire22 : (8'h9e))))));
        end
      else
        begin
          reg71 <= $unsigned(({$signed(reg69[(3'h5):(1'h1)])} * wire66));
          reg72 <= wire22[(4'hb):(1'h1)];
        end
      reg73 <= (wire27 < $signed($signed(((+wire66) > {wire23}))));
      if ((wire25 && wire27[(4'h8):(3'h6)]))
        begin
          reg74 <= (wire21[(1'h1):(1'h0)] == (~^$signed(((reg69 ?
              wire20 : wire26) + $unsigned(wire21)))));
          if (({{wire27[(2'h3):(1'h0)],
                  (^(wire22 ?
                      wire23 : reg72))}} >> (wire68[(2'h2):(2'h2)] <<< wire26)))
            begin
              reg75 <= wire23[(1'h1):(1'h1)];
              reg76 <= (+$unsigned($unsigned((wire25 < (~&reg69)))));
              reg77 <= $unsigned(wire24);
            end
          else
            begin
              reg75 <= {$signed(($signed(((7'h41) || (8'had))) ^~ (&(^reg77))))};
              reg76 <= $unsigned((^wire20));
              reg77 <= $signed($signed($signed($unsigned(((8'hab) ?
                  reg71 : (8'had))))));
              reg78 <= (+wire25);
              reg79 <= (wire66[(1'h1):(1'h0)] || (wire68 | reg77));
            end
          if ($unsigned((^~wire27[(1'h0):(1'h0)])))
            begin
              reg80 <= $unsigned((wire27[(1'h1):(1'h0)] < $signed($signed(reg70))));
              reg81 <= ($signed((+($unsigned(wire66) ?
                      (~&(8'hb0)) : (~&wire68)))) ?
                  $unsigned((|reg76)) : reg80[(3'h4):(1'h0)]);
              reg82 <= {(^~(|$signed((~^wire23)))),
                  (~$signed(((^reg75) ? (reg79 ^~ reg81) : reg77)))};
              reg83 <= (wire22[(1'h1):(1'h0)] & ($signed((~^$unsigned(reg80))) < ((wire23 < reg76) ?
                  (wire20[(4'he):(3'h7)] ?
                      (reg74 ?
                          wire68 : wire22) : (reg77 & wire25)) : $signed((!wire22)))));
            end
          else
            begin
              reg80 <= {wire20};
              reg81 <= $unsigned($signed(reg77[(4'hc):(3'h6)]));
              reg82 <= reg74;
              reg83 <= ((~&reg82) ?
                  reg78[(2'h2):(1'h1)] : reg80[(4'ha):(3'h5)]);
              reg84 <= ($signed(reg82[(2'h3):(1'h0)]) ?
                  $signed(($signed(wire25[(4'hc):(3'h4)]) ?
                      ((reg72 != reg71) & (reg79 ?
                          (8'hab) : reg72)) : (reg69[(4'ha):(4'ha)] ?
                          wire26 : (wire20 >= reg80)))) : (8'hab));
            end
          reg85 <= $unsigned($unsigned(wire27));
          reg86 <= $signed($unsigned((^~($unsigned(reg76) <= (wire23 > (8'hb7))))));
        end
      else
        begin
          if (reg71[(2'h3):(2'h3)])
            begin
              reg74 <= wire68;
              reg75 <= ($signed(((^~(reg74 >= wire20)) > {(wire68 ?
                          wire22 : wire27),
                      (^reg72)})) ?
                  $unsigned((($signed(reg72) ?
                          $signed(reg85) : (reg70 != wire66)) ?
                      reg73 : reg77)) : (({{wire66,
                              (8'hb3)}} >= (~&(reg71 >>> reg84))) ?
                      (-($unsigned((8'hb0)) ?
                          (^~wire26) : $unsigned(reg85))) : {wire25[(1'h0):(1'h0)]}));
              reg76 <= $unsigned({reg75[(4'h8):(3'h7)],
                  ($unsigned((&wire23)) && $unsigned(reg82[(4'hb):(3'h6)]))});
              reg77 <= (reg71 ?
                  (^~(~|((reg80 <= (8'ha4)) == (wire26 & reg72)))) : wire26[(3'h4):(1'h1)]);
            end
          else
            begin
              reg74 <= (~^reg84);
              reg75 <= $signed(reg73);
              reg76 <= (~&($signed(($signed(wire26) + {reg79, wire20})) ?
                  $unsigned(reg79) : ((^~(reg77 == reg80)) * $unsigned($unsigned(reg84)))));
              reg77 <= (^~(^(^~(~reg71[(2'h2):(2'h2)]))));
              reg78 <= reg79;
            end
        end
    end
  module87 #() modinst118 (wire117, clk, reg69, reg76, reg73, reg79, wire23);
endmodule

module module87
#(parameter param115 = (((8'hb6) < (((^(7'h40)) ? (~|(8'hab)) : ((8'hab) ? (8'ha3) : (8'h9f))) != (((8'hb7) & (8'hb0)) | {(8'ha9)}))) ? (({(~(8'h9e)), {(8'hb2)}} ? (((7'h40) >> (8'had)) ? {(7'h40)} : ((8'hbd) <<< (8'hae))) : {(+(8'hbd)), {(7'h44), (7'h41)}}) ? ((((8'hb7) * (8'ha3)) > ((8'h9f) == (8'ha6))) ? {(^~(8'ha7))} : (((8'ha0) ? (8'hb9) : (8'ha7)) ? ((8'h9e) ? (7'h44) : (8'h9c)) : ((8'hac) ? (8'haf) : (8'hb1)))) : {(-{(8'hb6)})}) : ((({(8'hb5), (8'hb3)} << ((7'h44) ? (8'hac) : (7'h42))) ? (((8'ha1) <<< (8'hac)) ? {(8'hbc)} : (!(8'hae))) : (((8'ha5) << (8'hbe)) ? (8'h9e) : (^(8'hab)))) ^~ ((!((7'h42) ? (8'hb0) : (8'haf))) ? (8'hab) : ((&(8'ha5)) & ((7'h44) ? (8'hac) : (8'hb9)))))), 
parameter param116 = {(({(~^param115), ((8'haf) <= (8'hba))} ? ((param115 ? param115 : param115) + (|param115)) : {(^~param115), {param115}}) <= (param115 > ((param115 ? param115 : param115) ? param115 : (param115 ? (8'ha8) : param115)))), {((!(param115 | param115)) ? (param115 ? param115 : (~|param115)) : param115)}})
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire92;
  input wire signed [(4'he):(1'h0)] wire91;
  input wire signed [(3'h6):(1'h0)] wire90;
  input wire signed [(4'he):(1'h0)] wire89;
  input wire [(4'hc):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= $unsigned(wire91);
      reg94 <= (&{(wire90 + (^wire91)),
          $unsigned(((^~(7'h44)) >>> $signed((8'ha6))))});
    end
  assign wire95 = wire91[(4'hc):(4'h8)];
  assign wire96 = (+(|(wire90[(1'h0):(1'h0)] + ($signed(wire88) >= $signed(reg93)))));
  assign wire97 = (&wire90);
  assign wire98 = ($signed((~^($signed(wire97) ?
                          $unsigned(wire91) : ((8'ha4) < wire89)))) ?
                      ((~|($signed((8'hae)) ?
                          {wire90} : (~&(8'haa)))) <= (wire89[(2'h2):(1'h1)] ?
                          (!$unsigned(wire89)) : $unsigned($signed(reg93)))) : $signed((~^($signed((8'hbe)) ?
                          ((8'hab) ? wire96 : wire91) : (wire90 ?
                              reg94 : (8'ha2))))));
  always
    @(posedge clk) begin
      reg99 <= (~^wire92);
      reg100 <= ($unsigned((|{wire96[(3'h4):(3'h4)]})) ?
          ($signed(((wire89 ? (8'ha8) : (8'hb3)) ?
              reg93[(3'h4):(2'h3)] : (wire95 ?
                  wire88 : wire98))) >= ($signed(wire88[(4'hb):(4'h9)]) << $signed(wire91))) : $signed(reg94[(2'h3):(2'h3)]));
      reg101 <= {wire89, wire88[(4'hc):(3'h7)]};
      reg102 <= $unsigned($unsigned((((~^reg93) ?
          $unsigned(reg100) : (|wire90)) <<< reg94[(4'hc):(3'h4)])));
      reg103 <= {$signed($signed($signed({wire92, reg93})))};
    end
  assign wire104 = ((~|reg94[(3'h4):(3'h4)]) && {wire91, (8'ha0)});
  assign wire105 = $unsigned(reg103);
  assign wire106 = $unsigned(reg93);
  assign wire107 = ((!(&(reg99 ?
                       (~^(7'h43)) : {wire95}))) + (-(!reg103[(4'h8):(1'h0)])));
  assign wire108 = $unsigned(wire92);
  assign wire109 = $signed({$unsigned(({(7'h40)} < (wire90 ? wire108 : reg99))),
                       {wire88[(3'h4):(2'h3)],
                           ((reg94 ? wire89 : (8'hb9)) ?
                               reg94[(4'hb):(4'h9)] : wire98)}});
  assign wire110 = $signed(wire89);
  assign wire111 = (wire106[(4'ha):(1'h1)] >> ($signed($unsigned($unsigned(wire96))) | reg102[(1'h0):(1'h0)]));
  assign wire112 = reg103[(1'h1):(1'h0)];
  assign wire113 = ({wire110[(2'h3):(1'h1)]} & (~^reg103[(3'h5):(1'h1)]));
  assign wire114 = $unsigned($signed($signed((reg100 ?
                       $signed(wire92) : (|wire105)))));
endmodule

module module28
#(parameter param65 = (-((!(8'h9c)) ? ({((8'hb1) ? (8'hae) : (8'hb0)), (^~(8'hbf))} >= (|(~|(8'had)))) : (+(~^{(8'h9c), (8'hb5)})))))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire64,
                 wire49,
                 wire48,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire34 = $signed(wire32);
  assign wire35 = $signed((^((^(wire30 ^ (8'hb8))) ?
                      $signed((~wire34)) : (wire34 == (^wire33)))));
  assign wire36 = (($unsigned(wire32) ?
                          $signed(((!wire34) - ((8'ha8) ?
                              (8'hae) : (8'ha2)))) : (+$signed((wire33 + wire31)))) ?
                      $unsigned($signed($unsigned($unsigned(wire30)))) : wire29[(1'h1):(1'h1)]);
  assign wire37 = $unsigned($unsigned(($unsigned((wire33 || wire29)) ?
                      (&(~wire35)) : {(wire31 << (8'hbc)),
                          (wire36 ? wire35 : wire36)})));
  assign wire38 = wire35[(4'hc):(3'h5)];
  always
    @(posedge clk) begin
      if (wire38)
        begin
          reg39 <= wire29;
        end
      else
        begin
          reg39 <= ((reg39 ?
                  $signed(wire29[(1'h1):(1'h0)]) : $signed(wire30[(4'ha):(4'ha)])) ?
              ($signed($signed($unsigned(wire35))) > wire34[(2'h3):(2'h2)]) : ($signed(reg39) ^ $unsigned(($signed(wire32) ?
                  $unsigned(wire36) : $signed(wire35)))));
          reg40 <= (~|(8'hb6));
          if (wire31)
            begin
              reg41 <= (8'hb4);
            end
          else
            begin
              reg41 <= (^{(^~wire30), wire34[(3'h5):(1'h0)]});
              reg42 <= (+wire36);
              reg43 <= $unsigned(($signed((!(wire32 != wire35))) <= $unsigned(((8'ha8) >= wire30))));
            end
        end
      reg44 <= wire35;
      reg45 <= $signed($signed((((~wire35) ^~ $signed((7'h40))) << (^(+reg43)))));
      reg46 <= (~^$signed(wire32));
      reg47 <= (~^wire37[(3'h7):(2'h2)]);
    end
  assign wire48 = wire35[(4'ha):(2'h3)];
  assign wire49 = $signed($unsigned((((wire30 ? reg40 : reg44) ?
                      (reg47 ? wire36 : reg42) : (+wire31)) + $signed((wire37 ?
                      reg47 : (8'ha6))))));
  always
    @(posedge clk) begin
      reg50 <= (wire38 ?
          ({$signed($unsigned((8'hb5)))} ?
              (((^~wire33) < $signed(wire35)) ?
                  ($signed(wire37) ?
                      reg39[(2'h3):(1'h1)] : (wire31 ~^ reg41)) : (~(reg40 ?
                      reg46 : reg43))) : wire35) : $signed((-$unsigned(reg46))));
      if (reg44)
        begin
          reg51 <= wire49[(4'h9):(3'h5)];
          reg52 <= ((wire32 == reg43) ^~ (((reg51[(2'h3):(1'h0)] ^ $signed((8'hb6))) >= (reg46 ?
                  (8'hb6) : (reg40 ? wire37 : wire36))) ?
              reg47[(1'h0):(1'h0)] : reg39));
          reg53 <= reg44[(3'h4):(2'h2)];
          reg54 <= $unsigned(((((!wire31) ^ $signed(reg39)) ?
              wire29[(1'h1):(1'h1)] : (reg53 < (~|(8'hbc)))) << {$unsigned({(8'hab)})}));
          reg55 <= wire29[(1'h0):(1'h0)];
        end
      else
        begin
          if ((&$unsigned((reg41 ^ wire36[(4'hd):(4'hc)]))))
            begin
              reg51 <= (((!wire49) ?
                      $signed(reg41) : $signed(((wire37 ? wire31 : reg39) ?
                          (wire32 ? reg52 : reg50) : (8'hb5)))) ?
                  (((7'h43) >>> (8'ha3)) << {$unsigned(wire48[(3'h5):(1'h0)])}) : $unsigned((8'hbf)));
              reg52 <= reg55;
              reg53 <= reg52[(1'h1):(1'h1)];
              reg54 <= $signed($signed(((~^(reg50 ~^ wire33)) ?
                  (-(-reg45)) : (&(wire31 ? wire36 : reg46)))));
              reg55 <= reg54;
            end
          else
            begin
              reg51 <= (-$unsigned(((~|$unsigned(reg44)) | $unsigned((wire37 ?
                  reg39 : reg51)))));
            end
        end
      reg56 <= wire48[(4'hb):(3'h6)];
      if (wire33)
        begin
          if (wire33[(3'h5):(3'h5)])
            begin
              reg57 <= wire36;
              reg58 <= reg40[(2'h2):(1'h0)];
              reg59 <= {($signed(((reg40 ? reg54 : (8'hb8)) ?
                          reg45[(3'h5):(2'h2)] : (|wire48))) ?
                      (&(wire37[(2'h3):(1'h1)] >> $signed(wire31))) : reg44),
                  (((8'h9f) ?
                      $unsigned({reg43, reg50}) : ($unsigned(wire30) != (reg44 ?
                          reg40 : (7'h41)))) * $unsigned({(reg44 < reg44)}))};
            end
          else
            begin
              reg57 <= (((wire49 ?
                      ($signed(reg52) * wire34[(1'h0):(1'h0)]) : {reg45,
                          reg39[(2'h2):(2'h2)]}) ?
                  $signed($signed(wire34[(1'h1):(1'h0)])) : $signed((wire49 <<< $unsigned(wire38)))) >= reg43[(2'h3):(2'h2)]);
              reg58 <= ($unsigned(reg40) ?
                  $signed(wire34[(2'h2):(1'h0)]) : $unsigned($unsigned($signed($signed(reg56)))));
            end
          reg60 <= ({$signed($unsigned(reg52))} ?
              (-(^reg56)) : {$unsigned($unsigned($unsigned(wire31))),
                  $signed($unsigned(reg46))});
          reg61 <= {$unsigned(reg40[(3'h5):(2'h3)])};
          reg62 <= ((wire38[(4'h8):(3'h5)] ~^ (reg41[(3'h5):(3'h4)] ?
              ({reg60} && (+reg46)) : wire36[(3'h5):(3'h4)])) != $signed(reg43));
          reg63 <= (reg51[(1'h0):(1'h0)] ?
              $signed(wire33) : reg47[(1'h0):(1'h0)]);
        end
      else
        begin
          reg57 <= reg62;
          reg58 <= wire48[(4'hd):(3'h5)];
          reg59 <= $unsigned(($unsigned(((^~wire30) | wire37[(2'h3):(1'h1)])) > ($signed(reg62[(2'h3):(2'h2)]) ?
              (8'ha5) : {$unsigned(reg57), (wire37 && wire49)})));
          reg60 <= reg51;
          reg61 <= $signed(reg57);
        end
    end
  assign wire64 = ($signed(reg42) != {$signed((^(!(8'ha2)))),
                      (wire29[(1'h1):(1'h1)] ^~ ($signed(wire38) & (~&reg53)))});
endmodule
