module top
#(parameter param154 = ((((((8'h9f) ? (8'hb5) : (8'ha7)) ^ (8'hbe)) <= (((8'haf) < (8'had)) ? ((8'hae) < (7'h41)) : ((8'hbf) > (7'h42)))) >= (~|(~(~^(8'hab))))) ? (((+((8'h9c) ? (8'h9d) : (8'haf))) | (((7'h42) ? (8'ha5) : (7'h42)) ? ((8'ha8) ? (7'h41) : (8'hb8)) : {(8'ha5), (8'ha7)})) ~^ {(&((8'ha3) ? (8'ha2) : (7'h42))), (((8'hae) * (8'hb4)) ? ((8'hbe) ? (8'h9c) : (8'ha7)) : ((8'hac) ? (8'hbb) : (8'ha0)))}) : ((((|(8'ha6)) ~^ (^(8'hb6))) ? ((&(8'hb4)) ~^ ((8'hab) ? (8'hb4) : (8'hb3))) : (((8'hba) * (8'hbb)) == (^~(8'ha0)))) ? ((+((8'hb6) || (7'h44))) ? ((^~(8'hb7)) ? (~(8'hb8)) : ((8'hb5) <= (8'hb7))) : (((8'ha4) <<< (7'h41)) >= ((8'hb6) ^ (8'hac)))) : ((&(!(8'hb5))) <<< (^((8'hb6) && (8'ha0)))))), 
parameter param155 = (((param154 >= {(8'hb8)}) << {(((8'h9c) >= param154) ? (~&param154) : (param154 ? param154 : param154))}) == param154))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire151;
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire153,
                 wire5,
                 wire6,
                 wire7,
                 wire16,
                 wire17,
                 wire151,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ($signed($unsigned((~&wire3[(1'h0):(1'h0)]))) ?
                     (wire1 ?
                         ($unsigned(wire2[(1'h0):(1'h0)]) && (((8'hb9) <<< wire4) ?
                             (wire2 || wire1) : (!(8'ha3)))) : $signed((((7'h41) ?
                                 wire4 : (8'hb8)) ?
                             {(7'h40),
                                 wire2} : wire3[(1'h0):(1'h0)]))) : wire1[(4'hd):(3'h5)]);
  assign wire6 = $unsigned((~$signed({(wire3 * wire2), (+wire5)})));
  assign wire7 = $signed((&{wire2[(4'hd):(4'hd)],
                     ($unsigned(wire5) ? ((8'hab) ? wire6 : wire3) : wire5)}));
  always
    @(posedge clk) begin
      reg8 <= (8'hb3);
      reg9 <= ((!reg8[(4'h9):(4'h9)]) ?
          wire3 : (wire6 ?
              {((wire2 ? wire6 : wire5) ?
                      reg8[(1'h0):(1'h0)] : wire1)} : wire5[(2'h2):(1'h1)]));
      reg10 <= (($signed($unsigned({wire5})) ?
          (wire1[(2'h2):(2'h2)] * ($signed(wire3) && $signed(wire4))) : {$signed($unsigned((8'hac)))}) <<< wire3[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      reg11 <= $unsigned((~($signed((wire5 - wire6)) ?
          $signed($signed((8'hae))) : $signed({wire2, (8'hb5)}))));
      reg12 <= $signed(wire5[(1'h1):(1'h0)]);
      reg13 <= $unsigned($signed($unsigned(wire1)));
      reg14 <= $signed($signed($signed((((7'h40) ? (8'h9f) : wire1) ?
          (^~wire5) : (8'ha1)))));
      reg15 <= (7'h41);
    end
  assign wire16 = ($signed({{$unsigned((8'had)), $signed(reg11)},
                          (&((8'hb4) ? reg9 : reg10))}) ?
                      ($signed((&(wire3 << (8'hab)))) ?
                          (+(~$unsigned(wire6))) : {((^~reg9) ?
                                  $signed(wire0) : {wire6, wire1})}) : (8'h9d));
  assign wire17 = (!wire1);
  module18 #() modinst152 (.wire21(wire3), .y(wire151), .wire19(reg9), .clk(clk), .wire23(wire2), .wire22(reg8), .wire20(wire16));
  assign wire153 = $signed({reg9, $unsigned($unsigned((~wire17)))});
endmodule

module module18
#(parameter param150 = (~|(~^(-((^~(8'ha7)) < ((8'haf) || (8'ha3)))))))
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h2a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire21;
  input wire [(2'h3):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire106;
  wire [(3'h5):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire147;
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  assign y = {wire149,
                 wire24,
                 wire25,
                 wire26,
                 wire62,
                 wire69,
                 wire87,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire147,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 (1'h0)};
  assign wire24 = $unsigned(wire23[(4'h8):(3'h7)]);
  assign wire25 = (~|$unsigned((!$signed((wire19 | wire20)))));
  assign wire26 = $unsigned(((^~wire22[(2'h3):(2'h3)]) ?
                      wire20 : (wire21[(3'h4):(1'h0)] - wire20[(2'h2):(1'h0)])));
  module27 #() modinst63 (wire62, clk, wire21, wire20, wire19, wire25);
  always
    @(posedge clk) begin
      reg64 <= $unsigned(wire21[(4'he):(4'hb)]);
      reg65 <= (^~$signed((($unsigned((8'ha8)) >>> (wire24 < wire22)) ?
          ((-wire22) * wire23) : $signed(reg64[(1'h1):(1'h1)]))));
      reg66 <= (&wire19);
      reg67 <= $signed($signed((|reg64)));
      reg68 <= $unsigned((-(($unsigned(reg66) == ((7'h40) + (8'hba))) <<< {(&wire25),
          (wire21 >>> reg65)})));
    end
  assign wire69 = (+wire22);
  always
    @(posedge clk) begin
      reg70 <= $unsigned(wire20);
      if ($signed(reg68))
        begin
          reg71 <= (8'hb2);
        end
      else
        begin
          reg71 <= $signed(((((reg66 ? wire23 : (8'hba)) ?
                  (wire19 ? wire22 : wire19) : (reg71 ? wire22 : (8'haa))) ?
              {$signed(reg67)} : $unsigned($signed(reg67))) & (~^$signed(wire24))));
          reg72 <= ($signed(reg68[(1'h1):(1'h1)]) != $unsigned({wire62,
              (~|(&reg67))}));
          if (((^(reg64 >= wire24)) ?
              (-$signed($signed((~(8'hb4))))) : ($unsigned($signed((wire20 ?
                  wire24 : reg67))) < $signed($unsigned((8'ha6))))))
            begin
              reg73 <= $signed(wire62[(4'hc):(1'h0)]);
              reg74 <= reg70[(3'h4):(2'h3)];
              reg75 <= reg66;
              reg76 <= wire62[(1'h1):(1'h1)];
            end
          else
            begin
              reg73 <= (8'hba);
              reg74 <= (8'ha8);
              reg75 <= $unsigned((~{wire21[(3'h6):(1'h1)]}));
              reg76 <= {reg68};
            end
          reg77 <= ((reg65[(4'ha):(3'h4)] ?
                  (($unsigned(reg64) ?
                          (reg67 ? wire21 : reg67) : (wire19 ?
                              wire69 : reg73)) ?
                      ({reg68, wire19} ?
                          ((8'ha3) ?
                              reg75 : wire19) : (-reg75)) : reg67[(1'h1):(1'h1)]) : (|$signed($unsigned(reg67)))) ?
              $signed(((((8'h9d) ? wire23 : wire26) ?
                  (8'hbd) : (wire20 ?
                      (8'hab) : reg67)) == {wire24[(4'hc):(1'h1)]})) : {{wire22[(2'h2):(1'h1)]}});
          reg78 <= (((~|(+reg74)) ? wire23 : (8'ha7)) | $unsigned(reg77));
        end
      if ($signed((&wire19)))
        begin
          reg79 <= (~^(8'h9c));
          reg80 <= ((wire62 ^ $unsigned($unsigned(reg68[(3'h7):(3'h4)]))) < $signed($unsigned($signed(((7'h41) | (8'ha1))))));
          reg81 <= $signed((wire22[(1'h1):(1'h1)] ?
              (((~|reg64) - wire22[(1'h0):(1'h0)]) ?
                  $unsigned(reg71) : $unsigned($unsigned(wire21))) : $unsigned(reg79)));
        end
      else
        begin
          reg79 <= (~|((+$signed((+reg64))) ?
              reg76 : {wire19, $unsigned((reg64 ? wire19 : wire24))}));
          if ($unsigned((~|$unsigned((reg77 ?
              (wire24 ? wire24 : wire21) : (reg81 ? wire62 : wire26))))))
            begin
              reg80 <= ((!$unsigned((+$unsigned(reg80)))) ?
                  (~&$signed($signed(reg76))) : reg79[(3'h4):(1'h0)]);
              reg81 <= reg78;
              reg82 <= ((8'hbb) ?
                  ($signed(({wire23} | $signed(reg78))) | (wire19[(1'h0):(1'h0)] ?
                      (8'hb3) : $signed(reg73[(2'h3):(1'h1)]))) : $unsigned(($signed($unsigned(reg77)) < (reg77 << (~|reg71)))));
              reg83 <= wire23[(2'h2):(2'h2)];
            end
          else
            begin
              reg80 <= $unsigned((reg74 != reg64[(1'h1):(1'h0)]));
              reg81 <= reg70[(2'h3):(2'h3)];
              reg82 <= wire23[(2'h2):(1'h1)];
            end
          reg84 <= reg72;
        end
      reg85 <= wire22[(2'h3):(2'h2)];
      reg86 <= reg78[(3'h6):(3'h4)];
    end
  assign wire87 = reg72;
  always
    @(posedge clk) begin
      if ($unsigned(({$unsigned((reg65 ?
              reg81 : reg79))} < (~&((wire22 == reg73) ?
          (^~wire69) : ((8'h9c) ? (8'h9d) : wire19))))))
        begin
          reg88 <= wire20;
          reg89 <= wire19[(4'hc):(1'h0)];
          reg90 <= (^((!{(8'hb8), wire21[(5'h11):(4'h9)]}) ?
              reg71[(4'hb):(3'h5)] : $signed(((wire24 ^~ reg75) ?
                  ((8'hb6) ? (8'hb7) : reg64) : {wire25}))));
          if ((({reg81[(2'h3):(2'h2)]} & reg80) <<< ((-{(wire20 ~^ wire87),
              (wire62 | (8'hae))}) * $signed((reg89 || reg65)))))
            begin
              reg91 <= $signed($unsigned(($unsigned({reg77}) ?
                  $signed((+(8'ha8))) : (reg70[(3'h4):(1'h1)] ?
                      (+reg76) : (reg76 + reg77)))));
            end
          else
            begin
              reg91 <= reg72;
              reg92 <= $unsigned({reg64[(1'h0):(1'h0)]});
              reg93 <= reg80;
            end
          reg94 <= (~$unsigned((reg68[(4'he):(2'h3)] ?
              $signed(reg74) : ((reg72 != wire23) ?
                  reg78 : (reg75 ? wire20 : wire87)))));
        end
      else
        begin
          if (({$signed($signed(reg78[(3'h5):(1'h0)])), (8'hb3)} ?
              $signed((~{(8'had), $signed(wire20)})) : $unsigned(((reg73 ?
                  wire21[(4'hd):(1'h1)] : $signed(wire26)) << ((reg83 || reg75) ?
                  (~reg64) : $unsigned((8'ha4)))))))
            begin
              reg88 <= {$signed($unsigned(((wire22 != wire21) ?
                      $signed(reg73) : $unsigned(reg94)))),
                  ($unsigned(($signed(reg70) >> {wire20})) + {(~(wire22 ?
                          wire69 : reg64))})};
              reg89 <= {reg91[(2'h3):(2'h2)]};
              reg90 <= $unsigned((&$unsigned(wire26)));
              reg91 <= reg90;
              reg92 <= $unsigned((-$signed($signed((~^wire19)))));
            end
          else
            begin
              reg88 <= $signed(($unsigned(reg66) && (reg78 >= (+(+reg91)))));
            end
          reg93 <= {(8'h9e)};
          if ($unsigned({(~^($unsigned(reg71) ?
                  reg68 : ((8'hb2) ? (8'ha7) : reg79)))}))
            begin
              reg94 <= reg91[(5'h10):(4'hc)];
              reg95 <= (reg84 * $unsigned(wire62));
              reg96 <= wire22;
              reg97 <= $signed(reg86);
            end
          else
            begin
              reg94 <= reg74[(4'hb):(2'h3)];
            end
        end
      if (wire23)
        begin
          if (reg89[(4'hb):(3'h4)])
            begin
              reg98 <= ($signed((8'hab)) ?
                  $signed((reg83[(3'h5):(2'h3)] >= ((reg68 ?
                      wire20 : wire25) ^ $signed(wire22)))) : (-{reg64[(1'h1):(1'h0)],
                      $signed((reg95 == reg79))}));
              reg99 <= wire24[(3'h4):(2'h2)];
              reg100 <= {reg67[(3'h7):(2'h2)],
                  ($signed(reg86) ?
                      ($signed($signed(reg72)) ?
                          reg71 : wire20) : ($signed((reg83 ?
                          wire62 : reg89)) <= $signed($unsigned(wire22))))};
              reg101 <= {$unsigned((&reg78))};
            end
          else
            begin
              reg98 <= (((!$unsigned($signed(reg98))) || ($signed((^wire20)) ?
                      (+$signed(wire20)) : $signed(wire87))) ?
                  $unsigned($unsigned(($unsigned(reg64) >>> (wire25 & reg65)))) : (+(wire22[(2'h2):(1'h0)] ?
                      $signed(wire62) : $unsigned(((8'h9f) << reg66)))));
              reg99 <= (reg86 ?
                  ($signed(reg79) ?
                      (reg100[(2'h3):(1'h1)] > $signed($unsigned(reg85))) : (+reg98[(4'h8):(1'h0)])) : (|wire25[(1'h1):(1'h1)]));
              reg100 <= reg94[(4'hd):(3'h5)];
              reg101 <= $signed(reg99);
              reg102 <= wire20[(5'h14):(4'hd)];
            end
          if ((~&$signed((|(reg79[(3'h6):(2'h3)] ~^ (-reg98))))))
            begin
              reg103 <= (-$signed((&wire21)));
            end
          else
            begin
              reg103 <= (!wire23);
              reg104 <= (($unsigned((~&(reg102 - reg64))) ?
                      reg100 : wire23[(3'h7):(2'h3)]) ?
                  (+$signed((reg67[(3'h7):(3'h7)] ^~ (reg84 ?
                      reg93 : reg94)))) : reg84[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg98 <= (reg73 & $signed((wire22[(1'h0):(1'h0)] + $unsigned((reg89 ?
              reg91 : reg73)))));
          if (reg77[(1'h0):(1'h0)])
            begin
              reg99 <= ($signed((($signed(reg95) <<< $unsigned(reg67)) >> (~(|wire21)))) ?
                  (^($signed(reg95) ?
                      $unsigned({reg82,
                          reg76}) : reg101[(3'h7):(3'h6)])) : $unsigned((~&reg82)));
              reg100 <= (((reg73[(2'h3):(1'h1)] ? (8'hae) : reg84) ?
                      $unsigned({wire24, (&reg72)}) : reg96) ?
                  ($unsigned(wire62[(3'h5):(2'h3)]) ?
                      $signed($signed(reg79)) : reg94) : ((~^($signed(reg99) >> {reg101})) >>> $unsigned(reg78)));
              reg101 <= (|$signed(((8'hbb) != $signed(reg88))));
            end
          else
            begin
              reg99 <= ((reg64 == $signed($unsigned(wire69[(4'h8):(2'h2)]))) == wire22[(1'h1):(1'h0)]);
              reg100 <= $signed($unsigned(reg68[(1'h1):(1'h0)]));
              reg101 <= reg71;
              reg102 <= (&reg95);
              reg103 <= reg91[(4'he):(2'h2)];
            end
          reg104 <= $signed($unsigned($signed($signed($unsigned(reg95)))));
        end
    end
  assign wire105 = $unsigned((reg103 ?
                       (reg102[(4'he):(3'h7)] >>> wire26) : ($signed($signed(reg67)) ?
                           {(wire19 ? wire25 : reg92),
                               reg94[(4'hc):(3'h4)]} : (reg92[(4'h9):(2'h2)] <<< ((8'hb8) == wire20)))));
  assign wire106 = $unsigned(reg71[(3'h6):(2'h2)]);
  assign wire107 = $signed((reg65[(4'hf):(2'h3)] ^~ {(|wire69)}));
  assign wire108 = reg76;
  assign wire109 = $unsigned(($unsigned((^reg97[(3'h5):(1'h1)])) ?
                       ($signed($signed(reg77)) && (~^reg96)) : $signed((&$unsigned(reg84)))));
  assign wire110 = ($signed((&reg96)) ?
                       ($unsigned({(reg86 ? reg79 : wire20)}) ?
                           reg97[(4'h9):(3'h5)] : (~^wire105)) : reg73);
  assign wire111 = ((+(($signed(wire21) >> ((8'h9e) == (8'hb9))) ?
                       $signed($signed(reg95)) : (reg76[(1'h1):(1'h0)] ?
                           reg72[(3'h4):(1'h1)] : (wire21 - reg82)))) - {((reg91 ~^ reg65) <<< $signed((reg93 ?
                           wire25 : wire25)))});
  assign wire112 = $signed(wire23);
  module113 #() modinst148 (.wire114(wire87), .wire115(reg73), .wire116(reg80), .clk(clk), .y(wire147), .wire117(reg89));
  assign wire149 = reg67;
endmodule

module module113
#(parameter param145 = {{(!{(~|(8'h9c))}), ((((8'ha3) * (8'ha1)) >> {(7'h40), (8'hb8)}) << ((&(8'ha7)) > ((8'hbf) ? (8'hb9) : (8'hac))))}}, 
parameter param146 = (param145 <<< ((((param145 ? (8'ha6) : param145) ? ((8'hbe) ? (8'hba) : param145) : (param145 ? param145 : param145)) >> (param145 ? (!param145) : (param145 && param145))) ? (!(param145 ? {(8'hba), (8'hbe)} : param145)) : {{(param145 ? param145 : param145)}, (param145 & {param145, param145})})))
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire117;
  input wire [(4'hd):(1'h0)] wire116;
  input wire [(3'h6):(1'h0)] wire115;
  input wire [(5'h13):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire129;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire126;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(3'h4):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire118;
  reg [(5'h11):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire129,
                 wire128,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg127,
                 (1'h0)};
  assign wire118 = $signed(wire114);
  assign wire119 = ((8'ha5) ?
                       $signed($signed(wire118)) : (wire115[(1'h0):(1'h0)] ?
                           wire115 : (wire118 ?
                               ((8'hb7) ?
                                   $unsigned(wire117) : $unsigned(wire118)) : (wire114[(4'hc):(3'h7)] ?
                                   wire116 : $unsigned((8'ha8))))));
  assign wire120 = $signed((+$signed(((wire116 * wire115) ?
                       {wire116} : (wire118 ? wire118 : wire118)))));
  assign wire121 = ((~|wire119[(5'h11):(2'h2)]) ?
                       ($signed(((~^wire114) == {wire114})) < {wire114[(3'h5):(2'h2)],
                           wire114[(1'h1):(1'h0)]}) : (wire114 >>> $signed($signed(wire117))));
  assign wire122 = (8'hbc);
  assign wire123 = $unsigned($signed(wire114));
  assign wire124 = $signed(({{(wire120 ? (8'ha6) : wire122), {wire118}},
                           ({wire119} && $signed(wire121))} ?
                       (8'hbb) : wire114));
  assign wire125 = (~^(((wire119 == $signed(wire122)) ?
                           $unsigned($unsigned(wire114)) : (~$signed(wire116))) ?
                       wire117[(3'h6):(3'h5)] : $signed(wire119[(5'h10):(4'hb)])));
  assign wire126 = wire117[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg127 <= $signed(($unsigned($signed((wire122 >= wire120))) ^ wire119));
    end
  assign wire128 = wire126[(4'hc):(4'h9)];
  assign wire129 = reg127[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg130 <= (-(~&$signed(wire122)));
    end
  always
    @(posedge clk) begin
      reg131 <= wire129[(3'h6):(3'h6)];
      if (wire123[(4'hb):(4'h8)])
        begin
          reg132 <= wire124[(3'h4):(2'h3)];
        end
      else
        begin
          reg132 <= ((reg127 | wire120) & $signed(($signed((wire128 ^ wire122)) <<< ($signed(wire126) ?
              reg127 : $unsigned(wire119)))));
          reg133 <= wire119[(3'h7):(1'h0)];
          reg134 <= ($unsigned((($signed(wire124) || (reg127 <= wire121)) | ($unsigned(wire115) << wire120[(2'h3):(1'h1)]))) == ((((~^wire120) | (~^wire116)) ?
                  (&(~^wire114)) : wire114) ?
              (^~wire114[(4'h8):(4'h8)]) : (&$signed($unsigned(wire117)))));
          if (((!((!(8'hba)) ? $unsigned((-reg127)) : wire117[(2'h2):(2'h2)])) ?
              wire126 : (~|(({wire122} ?
                  (~&wire116) : (wire122 <= (8'hb1))) || {(&wire129)}))))
            begin
              reg135 <= (wire125[(1'h1):(1'h1)] ?
                  $signed((({reg130} ?
                      $signed(wire115) : (wire119 && reg127)) || (&{wire128,
                      (8'h9d)}))) : $signed(($signed(wire118[(3'h6):(1'h1)]) ?
                      wire129[(5'h12):(4'hf)] : $unsigned($signed(reg132)))));
            end
          else
            begin
              reg135 <= {{(&reg134)}, (^wire114)};
              reg136 <= wire123;
              reg137 <= $signed($unsigned(((wire119 && $unsigned(wire118)) ?
                  $unsigned((~^reg134)) : (~|(8'hb7)))));
              reg138 <= $signed($unsigned(wire115));
              reg139 <= wire121;
            end
          reg140 <= $unsigned($signed($unsigned((&{reg127, reg127}))));
        end
    end
  assign wire141 = {($signed($unsigned((-wire128))) ^ (&(!$signed(wire129))))};
  assign wire142 = (reg138[(4'he):(4'he)] ^~ (8'h9d));
  assign wire143 = (^wire121[(1'h1):(1'h0)]);
  assign wire144 = {$unsigned((^~$unsigned(reg137)))};
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire signed [(4'ha):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg59,
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
                 reg37,
                 (1'h0)};
  assign wire32 = wire30;
  assign wire33 = (7'h41);
  assign wire34 = (wire33 ^ (~&$unsigned((^~(wire31 >>> wire31)))));
  assign wire35 = $unsigned($unsigned(wire33[(5'h11):(4'he)]));
  assign wire36 = ((8'ha3) ?
                      {$signed(($unsigned((7'h41)) <= $signed(wire32))),
                          wire29[(3'h4):(2'h3)]} : (!(wire32 | $unsigned((wire32 ?
                          (8'hbc) : wire32)))));
  always
    @(posedge clk) begin
      reg37 <= $unsigned((!wire32[(3'h4):(3'h4)]));
      if ((reg37[(4'hc):(4'h8)] ?
          (!({wire28, $unsigned(wire28)} ?
              (~&$signed(wire31)) : ($unsigned(wire34) ?
                  (wire31 ^ wire35) : reg37))) : wire36[(3'h4):(2'h3)]))
        begin
          if ($signed(wire32))
            begin
              reg38 <= $unsigned((^wire31[(3'h5):(3'h5)]));
              reg39 <= wire29[(4'hc):(3'h4)];
            end
          else
            begin
              reg38 <= wire33[(4'hc):(4'h8)];
            end
          reg40 <= (^~wire36);
          reg41 <= $unsigned($signed($unsigned($signed($unsigned(wire32)))));
          reg42 <= wire31[(3'h6):(2'h3)];
          reg43 <= wire30[(4'h9):(2'h2)];
        end
      else
        begin
          if ((wire36[(1'h0):(1'h0)] << $signed(wire31)))
            begin
              reg38 <= $signed((~|$unsigned($signed($unsigned((8'hb8))))));
            end
          else
            begin
              reg38 <= wire34;
            end
        end
      reg44 <= $unsigned($signed({$unsigned($signed(wire36)),
          ((wire33 ? (8'h9f) : reg37) & reg40[(4'hd):(4'h8)])}));
      if (({$signed($signed({reg39})), wire33} ^ wire28))
        begin
          reg45 <= reg40[(4'ha):(2'h3)];
          reg46 <= wire28[(2'h2):(2'h2)];
          reg47 <= $unsigned((8'haf));
          reg48 <= (8'ha4);
          reg49 <= (wire33 + wire29[(1'h1):(1'h1)]);
        end
      else
        begin
          reg45 <= ($signed(wire28[(2'h3):(1'h0)]) - ((~^(!wire34[(4'hb):(4'ha)])) >= reg48[(3'h7):(2'h3)]));
        end
    end
  assign wire50 = (((($signed(reg37) ?
                              wire33 : reg39[(1'h0):(1'h0)]) && ((reg48 ?
                                  (8'hbb) : wire35) ?
                              $unsigned(reg40) : (-reg47))) ?
                          {(&$signed(wire28)),
                              $unsigned($unsigned(reg40))} : $unsigned($unsigned((reg40 ?
                              reg41 : reg38)))) ?
                      (reg45 || $unsigned($signed(reg45))) : wire33);
  assign wire51 = $signed((((reg37[(3'h5):(3'h4)] ?
                          (^wire31) : (reg49 >>> reg47)) ?
                      $unsigned((^wire30)) : {(wire28 ? wire36 : reg45),
                          reg43}) | $signed((!$unsigned(reg44)))));
  assign wire52 = $unsigned($signed((&($signed(wire50) ?
                      reg42[(4'hd):(1'h0)] : {wire50, reg45}))));
  assign wire53 = $signed(($unsigned($unsigned($signed(wire28))) && (({reg49} ?
                      (reg49 ?
                          wire29 : wire52) : (reg47 < wire31)) >= (~|((8'h9d) ?
                      reg42 : wire32)))));
  assign wire54 = $unsigned(reg37);
  assign wire55 = ($unsigned($signed($signed($unsigned(reg37)))) > $signed(wire29));
  assign wire56 = (-$signed($signed((|wire30))));
  assign wire57 = $signed(wire51[(2'h3):(1'h1)]);
  assign wire58 = ($unsigned(wire32) ?
                      wire32 : (wire36 << {({wire50} + (wire54 ?
                              wire31 : wire53))}));
  always
    @(posedge clk) begin
      reg59 <= $signed(reg38[(2'h2):(2'h2)]);
    end
  assign wire60 = reg48[(3'h6):(3'h5)];
  assign wire61 = ($signed((^wire35[(2'h2):(1'h1)])) && $signed($unsigned(wire30[(4'hd):(2'h3)])));
endmodule
