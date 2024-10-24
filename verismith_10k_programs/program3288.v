module top
#(parameter param176 = (((8'hab) ? (~&{{(8'hab)}}) : ((((8'h9d) + (8'hab)) ? ((8'hba) ? (8'h9c) : (8'had)) : ((8'hae) ? (8'ha4) : (8'ha7))) ? {(+(8'ha6))} : (((8'ha7) - (7'h41)) >>> (-(8'hab))))) * ((((|(8'hb8)) != (~^(8'hb8))) && (+((8'hbc) * (8'ha2)))) ? (^(((8'ha0) ? (8'h9c) : (8'ha9)) ? ((8'hbf) ? (8'had) : (8'hba)) : ((8'ha6) >= (8'hba)))) : {{(-(8'hbf)), ((8'hba) || (8'hba))}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire [(5'h15):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire170;
  wire signed [(3'h6):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire168;
  wire [(3'h5):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire151;
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(4'hf):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 wire156,
                 wire155,
                 wire74,
                 wire22,
                 wire21,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire151,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire4 = {wire2,
                     (wire0[(2'h2):(1'h1)] ?
                         wire1[(2'h2):(1'h0)] : (wire1[(1'h1):(1'h1)] ?
                             $unsigned($signed(wire3)) : (~^wire0[(3'h7):(1'h1)])))};
  assign wire5 = (((~&$unsigned(wire2)) ?
                         $signed($signed($signed(wire2))) : wire1[(1'h1):(1'h1)]) ?
                     ($unsigned((wire1 ^~ (wire0 ? wire3 : wire0))) ?
                         wire3[(2'h2):(2'h2)] : (wire4[(1'h0):(1'h0)] | ({(8'hba),
                             wire4} ~^ wire1))) : $unsigned($unsigned((wire0 < {wire4}))));
  assign wire6 = ((((wire2[(2'h3):(2'h3)] >>> $signed(wire2)) ?
                             $signed($signed(wire3)) : wire4) ?
                         wire0[(4'hc):(4'hc)] : wire3) ?
                     (wire0 + ((!wire0) || ((-wire1) ?
                         wire4 : {wire1}))) : wire1);
  assign wire7 = ((($unsigned({wire6}) ?
                         wire0 : ((+wire4) ?
                             (wire5 ? wire2 : wire2) : (!(8'hb9)))) <<< wire4) ?
                     $signed(wire3[(3'h5):(3'h5)]) : wire2[(2'h2):(1'h0)]);
  assign wire8 = ((|(~|((wire2 + wire5) * $unsigned(wire4)))) + ((8'hbe) ?
                     ($unsigned((wire1 ? wire4 : wire3)) ?
                         (-(wire4 - wire1)) : $signed((wire2 != wire2))) : wire7[(4'h9):(4'h9)]));
  module9 #() modinst20 (wire19, clk, wire8, wire2, wire4, wire5);
  assign wire21 = $unsigned($unsigned(wire8[(4'hc):(4'h8)]));
  assign wire22 = wire3[(4'h8):(3'h4)];
  module23 #() modinst75 (.wire27(wire1), .clk(clk), .wire26(wire22), .wire25(wire21), .wire24(wire7), .y(wire74), .wire28(wire8));
  module76 #() modinst152 (.clk(clk), .wire81(wire5), .wire77(wire19), .y(wire151), .wire80(wire21), .wire78(wire3), .wire79(wire1));
  always
    @(posedge clk) begin
      reg153 <= (wire19 ?
          (((wire8[(2'h3):(1'h0)] ?
                  (wire8 ? wire5 : (8'hbb)) : $unsigned(wire22)) ?
              $unsigned(wire74[(2'h3):(2'h3)]) : ((wire4 ?
                  wire151 : wire5) >> (^~wire2))) | (8'hbb)) : (({(wire2 + wire2),
                  (wire0 ? wire4 : (8'ha4))} ?
              wire74[(2'h2):(2'h2)] : (wire19[(4'hb):(1'h1)] ?
                  (wire4 != wire22) : $unsigned((7'h40)))) < ((~|(wire151 ?
              wire151 : wire3)) || wire19)));
      reg154 <= wire7;
    end
  assign wire155 = ({reg154} ?
                       (reg154[(3'h5):(3'h4)] ?
                           wire74[(2'h2):(1'h0)] : (wire7 == $signed((wire1 != wire151)))) : ((^$unsigned((~reg154))) ?
                           (+wire74) : (((wire4 ? wire8 : (8'h9f)) ?
                                   $signed(wire3) : (reg153 ? wire1 : wire19)) ?
                               ((reg154 * (7'h43)) ?
                                   wire1 : (wire74 ?
                                       (8'ha9) : wire1)) : ($unsigned(wire1) ?
                                   (wire0 ?
                                       reg153 : wire0) : $unsigned(wire7)))));
  assign wire156 = wire74;
  always
    @(posedge clk) begin
      if ((reg153[(3'h6):(2'h3)] ?
          wire151 : {((8'ha3) || $unsigned((&wire6)))}))
        begin
          reg157 <= ((wire7[(3'h4):(2'h2)] > (wire19[(4'hb):(4'ha)] ?
                  ((8'ha5) + $signed(wire4)) : ($signed(wire7) ?
                      {wire2, wire1} : wire151))) ?
              wire8[(4'hb):(4'h9)] : (~|$unsigned(wire156)));
          if ($unsigned($signed(($signed(wire21) ?
              $signed(((8'hbe) || wire3)) : wire7))))
            begin
              reg158 <= wire1[(3'h6):(1'h1)];
            end
          else
            begin
              reg158 <= reg154;
              reg159 <= {({wire6[(4'hd):(4'h9)]} && $unsigned($unsigned({wire3})))};
              reg160 <= {((8'hae) == (wire151[(3'h4):(2'h2)] ?
                      wire8[(4'ha):(4'h9)] : {wire3}))};
              reg161 <= ($signed(({$signed(wire0)} ?
                      wire151[(1'h1):(1'h0)] : ($signed(wire2) >>> $signed(reg159)))) ?
                  $unsigned((8'ha4)) : (wire1[(4'hc):(3'h4)] ?
                      wire8[(4'h9):(4'h8)] : {(!$signed(wire19))}));
              reg162 <= {(~|((~&(7'h44)) ~^ wire5[(4'hb):(3'h4)])), (7'h43)};
            end
          reg163 <= $unsigned(($signed((reg154[(3'h7):(3'h4)] - ((8'haa) ?
                  wire6 : (8'hbb)))) ?
              ($signed(reg160[(3'h6):(3'h5)]) + wire151[(1'h1):(1'h0)]) : ($unsigned(wire156) ~^ ((wire22 ?
                  wire2 : wire21) <<< $signed(reg153)))));
          reg164 <= $unsigned({(-$signed(((8'hb0) >>> (8'had))))});
          reg165 <= wire19[(4'hb):(1'h0)];
        end
      else
        begin
          reg157 <= (8'hb7);
          reg158 <= $unsigned($signed((reg160[(3'h7):(3'h6)] ?
              (&{(8'h9c), reg160}) : {(wire4 ? reg158 : reg159)})));
          if (reg160)
            begin
              reg159 <= ((^(^(~^$unsigned(reg153)))) ?
                  wire74[(4'h8):(3'h7)] : (wire22[(1'h1):(1'h1)] & (^(^wire74[(1'h0):(1'h0)]))));
              reg160 <= ({(wire22[(4'h8):(3'h5)] <<< (8'h9c)),
                      ((~^reg153) ^~ (^$signed(reg164)))} ?
                  wire19[(1'h0):(1'h0)] : (wire1 ? $unsigned(wire22) : wire19));
              reg161 <= ({($unsigned($signed((8'hba))) ~^ {reg157}),
                  wire7} != wire2);
              reg162 <= $unsigned($signed($unsigned(wire156)));
              reg163 <= ((((reg159 << reg162) ?
                  $unsigned($unsigned(reg165)) : $unsigned(wire7)) + ((~^$signed((7'h40))) || $signed((reg153 ?
                  reg161 : wire5)))) >> ((wire151[(1'h0):(1'h0)] ^ (wire6 >> $unsigned(reg163))) - (!(|reg164))));
            end
          else
            begin
              reg159 <= wire5;
              reg160 <= (!{wire4});
              reg161 <= $unsigned({(^$signed({(8'ha6)})), (reg165 ~^ wire22)});
              reg162 <= wire5[(3'h7):(3'h7)];
            end
          reg164 <= {$unsigned(wire155[(1'h1):(1'h0)])};
          reg165 <= (reg162[(4'he):(1'h0)] ?
              (!reg153) : ((^reg159[(1'h0):(1'h0)]) ?
                  ($unsigned((^~(8'ha3))) && (~(wire5 ?
                      reg158 : reg153))) : wire22[(3'h6):(3'h6)]));
        end
    end
  module76 #() modinst167 (wire166, clk, wire4, wire5, wire8, reg164, wire21);
  assign wire168 = (reg163[(2'h2):(2'h2)] && wire74[(4'h8):(2'h2)]);
  assign wire169 = wire0[(5'h11):(1'h0)];
  module76 #() modinst171 (wire170, clk, reg159, wire2, wire74, wire22, wire7);
  assign wire172 = $unsigned({$signed(((reg157 ? wire2 : wire8) ?
                           (wire0 != wire169) : reg157)),
                       (|$unsigned((wire168 < reg159)))});
  assign wire173 = reg158[(1'h1):(1'h0)];
  assign wire174 = (reg162[(3'h4):(1'h0)] ?
                       $signed((wire2[(2'h2):(2'h2)] | reg163[(1'h1):(1'h0)])) : $unsigned(reg161[(1'h0):(1'h0)]));
  assign wire175 = ($signed($signed((^~(8'ha2)))) <<< $unsigned(($signed($signed(wire22)) ?
                       $unsigned(wire170[(4'hd):(1'h0)]) : (|wire22))));
endmodule

module module76
#(parameter param149 = ((~|(({(8'hae), (8'hbe)} ? (~(8'hac)) : (8'ha9)) ? ((~(8'ha8)) ? ((8'h9d) ^~ (8'h9e)) : ((8'hac) ? (7'h43) : (8'hac))) : (8'hb8))) < {((~((7'h40) ? (8'had) : (8'hb8))) ? (&((8'hb6) + (8'haf))) : (~^((8'hbf) ? (8'had) : (8'ha3)))), ((^((8'hb9) - (8'haf))) ? (-(&(8'ha6))) : {((8'hb5) ? (8'hb3) : (8'hbe)), (-(8'hbf))})}), 
parameter param150 = ({(((|param149) ? param149 : (8'ha3)) < (|{param149}))} >= {(~|((~^param149) ? ((8'h9e) | param149) : {param149, param149})), {param149, (param149 <<< (&param149))}}))
(y, clk, wire77, wire78, wire79, wire80, wire81);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire77;
  input wire signed [(4'hc):(1'h0)] wire78;
  input wire signed [(5'h12):(1'h0)] wire79;
  input wire [(3'h4):(1'h0)] wire80;
  input wire signed [(3'h6):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire148;
  wire signed [(3'h5):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(5'h15):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire144;
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire96,
                 wire97,
                 wire98,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire144,
                 reg99,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg82 <= wire81[(3'h5):(3'h5)];
      reg83 <= ((!(wire81 | (!(wire78 - reg82)))) ?
          wire79[(1'h0):(1'h0)] : ($signed({$unsigned(wire78)}) ?
              $signed($unsigned((wire77 ?
                  wire80 : wire79))) : (~reg82[(4'hd):(4'h8)])));
      reg84 <= (|$unsigned((^~({reg82} ? {reg83} : (reg82 > reg82)))));
      if ((-{((&$unsigned(wire77)) << wire80)}))
        begin
          reg85 <= {$signed((({(8'hb9)} ?
                  wire80[(3'h4):(2'h2)] : $signed(reg82)) ^~ reg84))};
          if (wire78[(3'h7):(3'h5)])
            begin
              reg86 <= $unsigned((!$unsigned((~&(wire78 ?
                  (8'h9e) : (8'ha5))))));
              reg87 <= reg82[(4'hf):(3'h7)];
              reg88 <= reg86[(4'ha):(4'h8)];
            end
          else
            begin
              reg86 <= $unsigned($unsigned((-(8'ha2))));
            end
        end
      else
        begin
          reg85 <= wire78;
          if (($signed(wire79[(4'ha):(4'h8)]) | ($unsigned(reg86[(4'hb):(4'h9)]) != $unsigned(((reg87 ?
              wire79 : wire77) - (&reg87))))))
            begin
              reg86 <= ($signed($unsigned(($signed(wire80) ?
                  $signed(wire79) : (^~wire78)))) & wire78[(3'h7):(2'h3)]);
              reg87 <= $signed(reg87[(2'h3):(2'h2)]);
              reg88 <= reg88[(3'h4):(3'h4)];
            end
          else
            begin
              reg86 <= $signed((+(8'hbf)));
              reg87 <= (!$signed(reg85));
            end
          reg89 <= reg82;
          reg90 <= $signed(wire81[(3'h5):(2'h3)]);
          if ({$unsigned((-wire79))})
            begin
              reg91 <= reg89[(2'h2):(1'h1)];
              reg92 <= $signed(reg82[(5'h12):(1'h0)]);
              reg93 <= ((reg88 ^ ({reg91} ?
                      ($unsigned(wire77) ?
                          {reg85} : $signed((8'hb9))) : $unsigned((reg84 <<< wire81)))) ?
                  reg86 : (wire77 ?
                      $signed(reg91[(2'h2):(1'h0)]) : ($signed($signed((8'hb4))) ?
                          reg86[(4'hb):(3'h4)] : $signed($signed(reg91)))));
            end
          else
            begin
              reg91 <= (wire78 || $unsigned(({{wire79, wire79},
                      $unsigned(reg92)} ?
                  (wire80[(2'h2):(1'h1)] == (~|reg92)) : reg85[(3'h5):(1'h1)])));
              reg92 <= {(reg90 ?
                      $unsigned(((&reg85) ? (!reg90) : reg86)) : reg84)};
              reg93 <= (^((8'hb8) ?
                  $unsigned($signed(reg92)) : $unsigned((~(reg89 + reg85)))));
              reg94 <= $signed(reg86);
            end
        end
      reg95 <= wire79;
    end
  assign wire96 = $signed($signed(wire79[(4'hc):(3'h7)]));
  assign wire97 = wire78[(4'h9):(2'h3)];
  assign wire98 = wire78[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg99 <= reg90[(2'h2):(1'h0)];
    end
  assign wire100 = $signed({(~$signed($unsigned(reg84)))});
  assign wire101 = {{$unsigned((wire98 + (+reg93))),
                           $unsigned({(-wire80), reg92})}};
  assign wire102 = (~(((!wire78) ?
                           {(reg82 ? (8'hac) : reg92), (~reg99)} : (8'hba)) ?
                       (($unsigned(reg89) >> wire97[(3'h6):(2'h3)]) ?
                           $unsigned((reg99 + reg95)) : (reg95[(3'h5):(2'h2)] != $signed((7'h42)))) : $unsigned($unsigned(wire78[(2'h2):(2'h2)]))));
  assign wire103 = $signed((|((&((8'ha0) ? reg92 : reg95)) ?
                       wire102[(3'h6):(3'h4)] : $unsigned({wire97, reg86}))));
  module104 #() modinst145 (.wire107(reg94), .wire108(reg89), .wire105(reg84), .clk(clk), .wire109(wire97), .wire106(reg90), .y(wire144));
  assign wire146 = $signed({(reg90[(1'h1):(1'h0)] ?
                           (|$unsigned(reg95)) : $unsigned(wire79)),
                       $unsigned((wire96[(4'ha):(1'h0)] + (wire79 ?
                           reg94 : wire80)))});
  assign wire147 = $unsigned($unsigned({(8'hac), $signed((wire103 - wire78))}));
  assign wire148 = $unsigned({$signed(wire78), $signed(reg86)});
endmodule

module module23
#(parameter param72 = (!(&((+(8'hb9)) ? (8'haa) : (((8'hb8) <= (8'ha4)) ? (~(7'h44)) : (|(8'hb3)))))), 
parameter param73 = {((((param72 ? param72 : param72) ? (param72 ? param72 : (8'haa)) : (param72 > (8'hbd))) != (!(param72 ? param72 : param72))) > ((~&{param72, param72}) ? {(param72 >= param72)} : ((~^param72) - (param72 ~^ param72))))})
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire28;
  input wire [(3'h5):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  assign y = {wire67,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 reg71,
                 reg70,
                 reg69,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire29 = (((!(&{wire26})) ?
                      {((^~wire27) <= (|wire24))} : wire28[(4'h8):(3'h6)]) && $unsigned(($unsigned(wire28) >= wire27)));
  assign wire30 = (~&((-((~^wire24) ~^ wire29)) && ((wire25 || $unsigned(wire29)) ?
                      (^$signed((7'h41))) : ($signed((8'haf)) ?
                          $unsigned(wire26) : (wire24 ? wire28 : wire28)))));
  always
    @(posedge clk) begin
      reg31 <= (($signed($signed((wire24 + wire29))) && $signed(wire24)) ?
          (({(7'h40)} < wire25) <<< wire29[(1'h0):(1'h0)]) : $signed(wire27[(1'h1):(1'h0)]));
      reg32 <= $unsigned(({$unsigned(wire27[(1'h1):(1'h1)]),
          $unsigned(wire24[(3'h6):(1'h1)])} > ($unsigned($unsigned(reg31)) ?
          ((reg31 ? reg31 : reg31) ?
              (wire29 != wire27) : wire25[(3'h7):(2'h3)]) : wire25)));
    end
  assign wire33 = $unsigned($signed(((-wire26) <= wire28[(4'he):(3'h6)])));
  assign wire34 = ($unsigned($signed({(wire30 ~^ reg31), reg32})) ?
                      (((&$unsigned(wire27)) >> $unsigned((^~wire30))) == $unsigned(wire29[(1'h0):(1'h0)])) : wire30);
  assign wire35 = $signed((^reg32[(3'h4):(2'h3)]));
  assign wire36 = $signed($signed(wire27[(2'h3):(2'h2)]));
  assign wire37 = wire29[(2'h2):(1'h1)];
  assign wire38 = wire26;
  assign wire39 = reg31;
  always
    @(posedge clk) begin
      reg40 <= $signed(reg32);
      if ((^~{{wire28}, $signed((8'hbb))}))
        begin
          reg41 <= ($signed((((reg40 ? reg40 : reg40) >= reg31) ?
              (~(&wire26)) : (~(^(8'ha2))))) + $unsigned((wire26 ^~ ($unsigned(wire39) ?
              wire36[(3'h5):(2'h2)] : (^~wire30)))));
        end
      else
        begin
          if ({((((wire37 <<< wire37) >> (wire29 ? wire29 : wire27)) ?
                  $signed($signed(wire39)) : $unsigned((wire25 < wire36))) * (((+wire27) ?
                  (~^wire28) : (-(8'ha0))) == (((8'hbe) < reg40) <= wire34[(2'h2):(2'h2)])))})
            begin
              reg41 <= reg31;
              reg42 <= wire35;
              reg43 <= (+(~($unsigned((~|wire25)) ?
                  reg32[(2'h2):(1'h1)] : ((wire36 ^~ wire30) ^ wire24))));
            end
          else
            begin
              reg41 <= {$signed(($signed(wire28) ?
                      $signed((wire24 ?
                          reg32 : reg41)) : reg31[(3'h6):(1'h0)]))};
            end
          reg44 <= reg42[(3'h5):(2'h2)];
        end
    end
  module45 #() modinst68 (wire67, clk, wire39, reg32, reg31, wire36);
  always
    @(posedge clk) begin
      reg69 <= (~|$signed(($signed((wire33 ? wire25 : wire37)) ?
          $unsigned($unsigned(wire38)) : wire38[(2'h3):(1'h0)])));
      reg70 <= (^~reg44);
      reg71 <= $signed(wire38);
    end
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  assign y = {wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = $unsigned((^$unsigned($unsigned(wire13[(4'hd):(4'h8)]))));
  assign wire15 = (({(~wire11[(4'hd):(4'ha)])} + $signed(($unsigned(wire11) * wire12[(2'h2):(1'h1)]))) && ({(|wire11[(3'h5):(2'h2)]),
                      $signed((wire10 ?
                          wire14 : wire13))} && ($unsigned(wire13[(3'h4):(1'h1)]) ?
                      (-(wire11 ^~ wire14)) : wire11)));
  assign wire16 = ({wire10[(2'h2):(2'h2)]} > wire12[(4'h9):(3'h7)]);
  assign wire17 = (8'ha1);
  assign wire18 = $signed(wire12);
endmodule

module module45  (y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire signed [(2'h3):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire52,
                 wire51,
                 wire50,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire50 = $unsigned({($signed(wire48[(1'h0):(1'h0)]) - ($signed((8'hbe)) && $unsigned((8'ha2))))});
  assign wire51 = wire50;
  assign wire52 = $unsigned($unsigned(wire47));
  always
    @(posedge clk) begin
      reg53 <= $signed(wire50[(3'h4):(2'h3)]);
      reg54 <= ((($unsigned((-wire50)) ?
              $signed((wire50 ?
                  wire47 : (8'ha2))) : wire48[(1'h0):(1'h0)]) & $unsigned(({wire46} ?
              {(8'ha0), reg53} : wire51))) ?
          (~&$unsigned(((wire49 ? wire47 : reg53) ?
              {wire47, reg53} : (7'h41)))) : $signed({((wire48 ?
                      wire46 : wire47) ?
                  (-wire50) : $signed((8'h9f)))}));
      reg55 <= wire50;
      if (wire50[(4'he):(4'hb)])
        begin
          reg56 <= {$unsigned(((+$signed(reg54)) | {(wire46 ?
                      wire47 : wire47)}))};
          reg57 <= ({$signed(((wire50 ? (8'h9e) : wire52) ?
                  (~reg56) : (wire52 ^ wire49))),
              (reg56 ? (8'ha9) : wire51)} + (wire46[(3'h5):(3'h5)] ?
              wire49[(3'h7):(3'h6)] : ($signed(wire49[(2'h2):(2'h2)]) <= $signed((wire50 ?
                  reg56 : wire47)))));
          reg58 <= reg56[(2'h2):(1'h0)];
          reg59 <= reg57;
        end
      else
        begin
          reg56 <= wire48;
          reg57 <= reg59;
        end
    end
  assign wire60 = ($unsigned((($signed(wire47) << $signed((8'hae))) <= (^~wire47[(2'h2):(1'h0)]))) ?
                      ($unsigned(($unsigned(reg57) >>> wire49)) << ((8'hbd) > $unsigned($unsigned(wire47)))) : $unsigned({reg59,
                          wire47[(1'h0):(1'h0)]}));
  assign wire61 = $signed({wire47[(1'h1):(1'h1)],
                      $unsigned(((&reg56) ?
                          (wire52 < wire49) : (reg59 ? wire60 : reg55)))});
  assign wire62 = wire52;
  assign wire63 = ($unsigned((reg53[(1'h0):(1'h0)] <= $unsigned({wire49}))) >> ($signed(wire60[(3'h5):(1'h0)]) || $unsigned((wire52 ?
                      (~|(8'hba)) : {wire62, wire48}))));
  assign wire64 = $unsigned((-($unsigned($unsigned(wire61)) < {$signed(wire51)})));
  assign wire65 = (((|(^wire62[(1'h1):(1'h1)])) ?
                      wire47 : wire64[(2'h2):(1'h0)]) & (~|$signed(wire52)));
  assign wire66 = (+wire52);
endmodule

module module104  (y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h15c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire109;
  input wire signed [(5'h13):(1'h0)] wire108;
  input wire signed [(5'h11):(1'h0)] wire107;
  input wire signed [(5'h10):(1'h0)] wire106;
  input wire [(5'h11):(1'h0)] wire105;
  wire signed [(2'h2):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(4'hc):(1'h0)] wire137;
  wire [(4'he):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire [(4'h8):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire116,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg143,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg115,
                 (1'h0)};
  assign wire110 = wire107;
  assign wire111 = $unsigned({wire108});
  assign wire112 = $unsigned(wire108);
  assign wire113 = wire106[(3'h7):(3'h6)];
  assign wire114 = $unsigned(wire110[(3'h6):(3'h5)]);
  always
    @(posedge clk) begin
      reg115 <= wire109[(2'h2):(1'h1)];
    end
  assign wire116 = $signed(wire114[(4'he):(1'h1)]);
  always
    @(posedge clk) begin
      reg117 <= (~^(wire111 >>> $unsigned((wire105[(3'h7):(3'h5)] ?
          reg115[(3'h4):(2'h2)] : $signed(wire105)))));
      if (wire109[(2'h2):(2'h2)])
        begin
          reg118 <= ((8'ha9) - (~|(~&(~&(wire111 ? wire108 : (8'ha8))))));
          reg119 <= (~(((reg117 ? $unsigned(wire114) : $unsigned((8'ha9))) ?
                  $signed(reg117) : ((-wire107) ?
                      wire111[(4'ha):(4'ha)] : (-wire107))) ?
              (+wire109) : (^~$unsigned($unsigned(wire113)))));
          reg120 <= (wire112 ?
              (wire111[(4'hd):(4'h8)] >= {(wire108 ^~ reg117)}) : wire109);
          if (wire109)
            begin
              reg121 <= $signed(wire114);
              reg122 <= ((($signed($signed(reg121)) == (wire116 ?
                      (wire116 ?
                          wire116 : (8'hab)) : (^reg120))) || {$unsigned((~&(8'ha0))),
                      wire113[(2'h3):(2'h2)]}) ?
                  (((reg115 || $signed(wire112)) ?
                          $unsigned((reg118 ?
                              wire107 : reg121)) : wire113[(3'h7):(3'h6)]) ?
                      ((wire111[(4'hc):(4'hc)] | wire108[(5'h10):(4'hf)]) ?
                          reg115[(1'h0):(1'h0)] : ((reg117 & reg120) ?
                              (^wire113) : reg119[(4'h9):(3'h6)])) : (~&$unsigned(wire111))) : $signed(wire105[(4'h8):(1'h1)]));
            end
          else
            begin
              reg121 <= wire112;
              reg122 <= (8'hb7);
              reg123 <= reg115[(1'h1):(1'h1)];
              reg124 <= ((~^(^~(~wire112))) << (-{($signed(wire105) || wire112)}));
            end
        end
      else
        begin
          reg118 <= reg124[(1'h1):(1'h1)];
          reg119 <= wire112;
          reg120 <= reg115;
        end
    end
  assign wire125 = reg120[(4'h9):(3'h5)];
  assign wire126 = $unsigned({{$signed(wire105)}});
  assign wire127 = wire111;
  assign wire128 = (&$unsigned((reg118 > $unsigned($signed((8'hbb))))));
  assign wire129 = reg119;
  assign wire130 = $signed(reg123[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg131 <= (-((&$unsigned({reg123, wire114})) < reg122[(3'h4):(2'h3)]));
      reg132 <= ($unsigned($signed(wire105[(4'ha):(1'h0)])) && $signed(((8'h9f) ?
          wire112[(2'h2):(1'h1)] : reg120[(3'h5):(2'h3)])));
      reg133 <= (wire125 - reg117);
      if ($signed($unsigned({wire128[(3'h4):(1'h0)], wire113})))
        begin
          reg134 <= ((^$unsigned($unsigned($signed(reg131)))) - (wire106[(1'h1):(1'h0)] ?
              ((&(wire114 * (8'hba))) ?
                  {$signed(wire126),
                      reg117} : $signed((!wire107))) : reg122[(3'h7):(1'h1)]));
        end
      else
        begin
          reg134 <= wire116[(1'h1):(1'h1)];
          reg135 <= ((8'hb7) ? reg117 : $unsigned(reg120));
        end
    end
  assign wire136 = ({(8'ha9),
                       (((reg117 ? wire113 : wire112) ^~ $unsigned((8'ha1))) ?
                           (^{wire127,
                               wire125}) : (~|(^reg121)))} ^ $signed(($unsigned((~^reg135)) == (8'hb6))));
  assign wire137 = {$unsigned(($unsigned((8'ha8)) ?
                           ((reg115 ?
                               wire127 : reg120) ~^ wire130) : (|(reg118 ?
                               reg115 : wire116))))};
  assign wire138 = ($unsigned((wire137[(3'h6):(2'h3)] || $signed((+reg122)))) <= $unsigned((reg117[(3'h6):(3'h4)] < (reg118 ?
                       $signed((8'hb6)) : $signed(wire127)))));
  assign wire139 = $signed($signed($unsigned(reg121[(2'h2):(1'h0)])));
  assign wire140 = $signed(reg120);
  assign wire141 = reg133;
  assign wire142 = (((&(^~wire130)) && reg135) <= {wire107});
  always
    @(posedge clk) begin
      reg143 <= wire105;
    end
endmodule
