module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire162;
  wire signed [(4'hd):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire163, wire162, wire160, wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed({wire1}) && ((wire0[(4'hc):(3'h7)] <<< {$signed(wire1),
              (wire3 ? wire0 : (8'ha9))}) ?
          wire2 : {wire2[(2'h3):(1'h0)]}));
    end
  assign wire5 = $signed($signed(wire0[(4'h9):(4'h8)]));
  assign wire6 = (reg4 || $unsigned((((wire2 || reg4) | wire2) ?
                     {(reg4 ? wire5 : wire0), wire1} : wire3[(1'h1):(1'h0)])));
  assign wire7 = $signed($unsigned($unsigned({wire5})));
  module8 #() modinst161 (.y(wire160), .clk(clk), .wire12(wire6), .wire9(wire0), .wire11(wire3), .wire10(reg4), .wire13(wire2));
  assign wire162 = $signed(wire6);
  assign wire163 = (-$unsigned(wire3));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h230):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire [(3'h7):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(4'hb):(1'h0)] wire45;
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg [(2'h2):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire159,
                 wire158,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire47,
                 wire18,
                 wire19,
                 wire20,
                 wire45,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= {((-$unsigned(((8'ha3) ?
              wire9 : wire12))) - (((-wire12) >= (wire11 ?
              wire10 : wire13)) && (~$signed(wire12))))};
      reg15 <= $unsigned((^~wire12[(1'h1):(1'h1)]));
      reg16 <= (!$signed($unsigned(wire12[(1'h1):(1'h1)])));
      reg17 <= reg15[(5'h13):(3'h4)];
    end
  assign wire18 = (reg15[(5'h11):(4'hc)] ?
                      wire12[(1'h0):(1'h0)] : $unsigned({wire12[(1'h1):(1'h0)],
                          ($signed(reg16) || (&(8'hb7)))}));
  assign wire19 = ((^$unsigned(reg15[(4'hf):(4'hf)])) ?
                      {$signed((~&$signed((8'hbb))))} : (wire10 ?
                          (({(7'h43)} ?
                              (~|wire10) : wire18[(4'h8):(3'h6)]) >>> $unsigned($signed(reg14))) : wire10));
  assign wire20 = (!((($unsigned((8'hba)) ?
                              (wire18 ? reg15 : wire19) : $signed(reg14)) ?
                          $signed(reg15[(4'he):(1'h0)]) : ((~|reg17) ?
                              wire18[(4'h9):(2'h2)] : (^~wire11))) ?
                      (|wire9[(2'h2):(1'h0)]) : ((~|(~&wire9)) && (((8'hb0) ?
                          reg15 : wire12) - (8'ha9)))));
  module21 #() modinst46 (.wire23(wire10), .y(wire45), .wire25(wire19), .clk(clk), .wire24(wire9), .wire22(reg17));
  assign wire47 = wire13[(3'h5):(2'h3)];
  module48 #() modinst96 (wire95, clk, wire19, reg16, wire13, reg15);
  assign wire97 = ($signed(wire95) <= (^($unsigned(((8'hb5) ? wire9 : reg15)) ?
                      (~^(reg17 || wire9)) : wire13[(4'h8):(1'h1)])));
  assign wire98 = {(~&(!(^~(&wire18))))};
  assign wire99 = ((^(wire98 ?
                          ({wire47, (7'h40)} ?
                              $unsigned(wire98) : {reg17,
                                  reg17}) : ((reg17 ^~ wire9) ?
                              (~|wire97) : $signed((8'hb6))))) ?
                      (wire10[(4'h8):(2'h3)] ?
                          (&wire11) : wire19[(4'ha):(4'h9)]) : wire11[(3'h4):(1'h0)]);
  assign wire100 = $unsigned((~$signed($unsigned((wire47 ^ wire97)))));
  assign wire101 = ($signed(({(wire20 ? wire18 : wire12),
                           $unsigned(wire45)} >>> {(|wire19)})) ?
                       wire13[(4'he):(4'h8)] : (wire99 >= {(wire47[(1'h1):(1'h1)] ?
                               $signed(wire95) : $signed(wire45)),
                           (reg15[(4'h8):(3'h4)] <= (wire18 < wire19))}));
  assign wire102 = $unsigned(({wire98, $unsigned(wire47)} ?
                       (^~wire10) : $unsigned(($unsigned(reg16) ?
                           $signed(wire12) : ((8'h9c) ? wire19 : (8'ha9))))));
  module103 #() modinst128 (.y(wire127), .clk(clk), .wire105(wire98), .wire106(wire13), .wire104(wire20), .wire107(wire11));
  assign wire129 = $unsigned((wire19[(2'h3):(1'h1)] + ($unsigned(wire99) != ((~|(8'hb0)) || wire10[(4'hc):(4'h8)]))));
  assign wire130 = wire102;
  assign wire131 = $signed((((reg16[(1'h1):(1'h1)] + reg16) <<< (!wire45[(4'ha):(1'h0)])) << $signed(({wire45,
                       wire127} <<< (reg17 ? wire99 : wire13)))));
  assign wire132 = {(~&{$signed($signed(wire95))}), (+(8'hbd))};
  assign wire133 = (~&{wire101[(3'h5):(2'h3)]});
  assign wire134 = $unsigned((wire45 ?
                       $signed(((!reg17) ?
                           wire131[(1'h0):(1'h0)] : $unsigned(wire95))) : $unsigned($signed((wire127 ?
                           wire9 : wire132)))));
  always
    @(posedge clk) begin
      reg135 <= ((~$unsigned((^~(!wire13)))) << {(wire130 <<< {$signed(reg17)}),
          (8'ha7)});
      if (wire127)
        begin
          if ((8'hb4))
            begin
              reg136 <= wire127;
            end
          else
            begin
              reg136 <= $unsigned({(~wire10[(5'h12):(4'h9)]),
                  wire97[(2'h2):(1'h0)]});
              reg137 <= ($unsigned(wire130[(1'h0):(1'h0)]) ?
                  ({{(reg15 || wire10), (&wire20)}} ?
                      (({wire129} ^~ $signed(reg14)) & {{(8'h9f)},
                          $signed(wire11)}) : (8'ha3)) : ($unsigned(wire101[(4'he):(4'ha)]) == wire98));
            end
          reg138 <= wire102;
          if ($signed((reg14 ?
              (($signed(wire47) <= $unsigned(wire99)) | (~&(wire18 && wire98))) : $signed($signed($unsigned(wire134))))))
            begin
              reg139 <= (wire133 >> {($signed(((8'hab) && wire19)) ?
                      ($unsigned(wire18) ?
                          (reg15 << reg137) : (~&wire19)) : $unsigned(wire98[(3'h5):(3'h5)])),
                  {($signed(wire9) ?
                          wire99[(1'h1):(1'h1)] : reg138[(3'h5):(1'h0)]),
                      ((reg136 ^ (8'hae)) ?
                          (~^wire12) : wire47[(2'h3):(1'h0)])}});
              reg140 <= $unsigned(($unsigned((~&wire45[(3'h7):(2'h3)])) ?
                  $signed(wire132[(2'h2):(1'h1)]) : (({wire133} < $unsigned((8'ha4))) & $signed($signed(wire18)))));
              reg141 <= reg138;
              reg142 <= reg17[(1'h1):(1'h1)];
              reg143 <= (((({reg136} ?
                  wire132 : $signed(wire97)) ^ $signed($signed(wire98))) != (8'ha4)) ^ ((!$signed(wire47[(1'h0):(1'h0)])) ?
                  wire9[(4'hc):(1'h1)] : wire19[(2'h2):(1'h0)]));
            end
          else
            begin
              reg139 <= $unsigned((wire45 - wire133[(2'h2):(1'h0)]));
              reg140 <= {reg140};
              reg141 <= $unsigned({(reg139[(3'h7):(1'h1)] ?
                      wire19[(4'hb):(3'h7)] : {(wire127 < wire18)}),
                  ($signed($signed(reg15)) ?
                      wire9 : ((reg16 - reg137) ^ $unsigned(reg141)))});
              reg142 <= (reg135[(2'h3):(1'h1)] == wire127);
              reg143 <= reg14;
            end
          reg144 <= (~^$signed($unsigned(reg141)));
          if (((wire99 ? wire132[(4'h9):(3'h4)] : (wire18 > reg15)) ?
              ($unsigned(($signed((7'h43)) ? (-wire11) : reg15)) ?
                  (8'haa) : (($unsigned((8'hb9)) && $unsigned(wire20)) - (reg135 >>> (8'h9d)))) : wire12[(1'h1):(1'h1)]))
            begin
              reg145 <= wire20[(1'h0):(1'h0)];
              reg146 <= wire20[(2'h3):(2'h3)];
              reg147 <= ({reg138[(3'h6):(1'h0)],
                  reg136[(4'hf):(4'ha)]} <= $signed((^reg146[(1'h1):(1'h0)])));
            end
          else
            begin
              reg145 <= (+((8'ha4) ?
                  reg14[(1'h1):(1'h1)] : $unsigned(wire100)));
              reg146 <= $unsigned(reg17[(4'hb):(3'h4)]);
              reg147 <= reg17[(4'hc):(3'h5)];
            end
        end
      else
        begin
          reg136 <= (~&(|wire47[(1'h1):(1'h1)]));
          reg137 <= {wire95};
          reg138 <= $signed($unsigned($unsigned($signed((wire13 << wire95)))));
          if ($signed(wire129))
            begin
              reg139 <= reg143[(3'h5):(2'h2)];
              reg140 <= ({reg144} ~^ reg145);
              reg141 <= reg14[(3'h4):(1'h1)];
            end
          else
            begin
              reg139 <= wire130;
              reg140 <= (!wire97[(2'h2):(1'h0)]);
            end
        end
      reg148 <= ((~&{$signed({wire127}), $signed((&wire11))}) ?
          (($unsigned((!(8'hb1))) ?
                  (wire127 ^ (~&reg145)) : ($signed(wire132) ?
                      $signed(wire13) : $signed(wire102))) ?
              (reg135 ?
                  (~$unsigned(wire132)) : (^wire18[(4'h8):(4'h8)])) : (~|$unsigned(wire45))) : ((($unsigned(reg145) < wire102[(3'h5):(1'h1)]) >= $unsigned((~|reg137))) ?
              (wire132 ? wire100 : $unsigned($unsigned((8'hbc)))) : (((8'hac) ?
                  (reg14 ?
                      (8'ha7) : reg16) : $unsigned(wire45)) ^~ ((^~wire97) <<< $signed(wire100)))));
      reg149 <= wire99;
      if ((!((reg146 < wire45) ?
          (($unsigned((7'h43)) >>> $signed(wire134)) <<< ((reg143 << (8'hbc)) ?
              reg146[(1'h0):(1'h0)] : $unsigned(wire11))) : (~^($unsigned(wire130) ^ (wire100 ?
              wire99 : reg136))))))
        begin
          reg150 <= $signed($signed(wire45));
          reg151 <= $signed((reg144[(1'h1):(1'h1)] && wire130[(3'h5):(3'h5)]));
          reg152 <= (~|reg141);
          if (($signed($unsigned(wire19[(4'hc):(4'ha)])) ?
              $signed({(&reg135[(2'h2):(2'h2)]),
                  ((wire13 >>> wire9) >= wire19[(3'h5):(2'h3)])}) : (wire97[(3'h7):(3'h4)] ?
                  (8'hb4) : wire9)))
            begin
              reg153 <= reg152;
              reg154 <= $signed((((((8'hb9) >= wire129) ?
                      $signed(wire20) : $signed(reg136)) ?
                  ((^reg151) > (!(8'hae))) : ({wire100, wire134} ?
                      (|wire20) : $signed(reg148))) != (((|reg153) ?
                  (^reg140) : $signed(reg138)) <<< (|$unsigned(wire95)))));
              reg155 <= $signed($signed((wire130[(2'h2):(1'h0)] * ($unsigned(wire12) ?
                  {wire11} : (~|wire101)))));
              reg156 <= (wire132[(4'h9):(2'h2)] >= (+($unsigned($signed(wire13)) ?
                  $signed(reg135[(1'h0):(1'h0)]) : reg154[(4'h8):(3'h7)])));
            end
          else
            begin
              reg153 <= ((&reg155) ?
                  ($unsigned({reg154}) ?
                      wire13 : reg15) : (+(&reg150[(4'hc):(4'h9)])));
              reg154 <= (~|wire13);
              reg155 <= $unsigned((^~wire10));
              reg156 <= (reg14[(2'h3):(2'h3)] == $unsigned((reg156 ?
                  ($signed(reg136) ?
                      $unsigned(reg147) : (reg138 ?
                          reg141 : reg137)) : ((|reg136) ~^ {wire127,
                      wire127}))));
              reg157 <= $unsigned(wire100[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          if ((reg151[(2'h2):(2'h2)] << reg139[(4'hc):(4'hb)]))
            begin
              reg150 <= (~^reg151);
              reg151 <= wire99;
              reg152 <= {wire100};
              reg153 <= reg14;
            end
          else
            begin
              reg150 <= $unsigned($signed((!$signed(reg138))));
            end
        end
    end
  assign wire158 = reg149;
  assign wire159 = reg156;
endmodule

module module103
#(parameter param125 = (~{(~^((!(8'ha1)) ? ((8'hba) | (8'haa)) : (~(8'hb1)))), (~(~(|(8'hab))))}), 
parameter param126 = ((((8'hb9) <= (8'hb9)) ~^ (((param125 ~^ param125) ^~ ((8'hac) ? param125 : param125)) ? (~^(param125 ? param125 : param125)) : param125)) ? param125 : {{(^~{param125}), ((8'ha0) ? {param125, param125} : {param125})}}))
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire107;
  input wire [(3'h5):(1'h0)] wire106;
  input wire signed [(4'hf):(1'h0)] wire105;
  input wire signed [(4'h9):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire124;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg110 = (1'h0);
  assign y = {wire124,
                 wire121,
                 wire120,
                 wire109,
                 wire108,
                 reg123,
                 reg122,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire108 = {($unsigned($unsigned($unsigned((8'hb5)))) ?
                           (wire105 ?
                               wire107 : $signed({wire107})) : (($signed(wire106) + (wire105 ?
                               wire106 : (8'hbb))) != (wire107[(1'h0):(1'h0)] ?
                               wire106 : (wire106 ? wire106 : wire104)))),
                       $signed((wire104 < ({wire107, wire107} << (^wire107))))};
  assign wire109 = wire107;
  always
    @(posedge clk) begin
      reg110 <= ({$signed($signed($unsigned((7'h42))))} ?
          ($unsigned((~$unsigned(wire109))) ?
              $unsigned($signed($unsigned(wire105))) : wire107) : ($signed($unsigned((wire109 ?
              wire108 : wire109))) && $signed(wire105)));
      reg111 <= (~&(^(((~^wire105) * (wire108 ?
          (8'hba) : wire107)) > $unsigned($signed(wire105)))));
      reg112 <= (-$unsigned(wire104[(1'h0):(1'h0)]));
      if ((({($signed(reg110) >> wire108[(3'h4):(2'h3)])} ?
          (~|{$unsigned(reg110),
              $unsigned(wire106)}) : reg111[(2'h3):(1'h0)]) + {$signed($signed((wire104 ?
              wire108 : wire107))),
          (wire104 ? reg110 : {(wire106 <<< wire107)})}))
        begin
          reg113 <= (~^wire107[(2'h2):(2'h2)]);
          reg114 <= (($unsigned(wire104) ?
              $unsigned(((8'haa) ?
                  reg112[(2'h3):(1'h0)] : $signed(wire107))) : ((((7'h41) & (8'ha8)) ?
                      reg110[(3'h6):(3'h4)] : $signed(wire104)) ?
                  $signed((7'h42)) : (~^$signed(wire105)))) > (!$unsigned(((^~reg111) ?
              $signed(reg113) : (^~(7'h40))))));
          reg115 <= ({$unsigned($signed(reg114)), reg112} ?
              $unsigned((((^~wire104) ?
                      wire104[(2'h3):(1'h0)] : {wire109, wire104}) ?
                  wire106 : wire104)) : ($unsigned(((^~reg110) ?
                      {(8'hbc)} : ((7'h43) >> wire106))) ?
                  $unsigned($signed((wire106 ?
                      (8'ha1) : wire106))) : (~|wire108[(5'h10):(4'ha)])));
          reg116 <= $signed($unsigned(($signed($unsigned(wire107)) + reg110)));
          reg117 <= reg115;
        end
      else
        begin
          reg113 <= ($unsigned((reg111[(2'h3):(2'h3)] > reg110[(1'h0):(1'h0)])) ?
              (~^((|reg111[(3'h6):(1'h1)]) * reg116[(1'h1):(1'h0)])) : (~((((8'ha2) || reg116) ?
                  reg111[(3'h7):(2'h2)] : $unsigned((8'h9e))) >> (^{wire104}))));
          reg114 <= (reg114 + reg114);
          reg115 <= {(reg117[(1'h1):(1'h1)] | ((wire109 ?
                  (~wire107) : reg116) | (~|wire108[(5'h14):(3'h4)])))};
          reg116 <= ((~&reg112) ?
              $signed({$unsigned((8'ha8)), reg115}) : wire107[(1'h1):(1'h1)]);
        end
      if (wire109[(4'hf):(4'h9)])
        begin
          reg118 <= $signed(reg114);
          reg119 <= $unsigned((8'ha2));
        end
      else
        begin
          reg118 <= reg115;
        end
    end
  assign wire120 = $signed(reg112[(4'hd):(2'h2)]);
  assign wire121 = reg111[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg122 <= (-wire106[(2'h2):(2'h2)]);
      reg123 <= $signed({reg118, wire104[(2'h2):(1'h0)]});
    end
  assign wire124 = (~^((8'ha2) ?
                       wire105[(2'h2):(2'h2)] : ((reg117[(2'h2):(1'h0)] ?
                               $signed(reg110) : (reg112 ? wire104 : wire108)) ?
                           reg118 : ((wire108 < wire104) >>> wire108))));
endmodule

module module48
#(parameter param93 = ((|((((8'ha6) ^~ (8'hb8)) ? (~(8'hb6)) : {(7'h43)}) * ((!(8'haa)) ? ((8'h9c) * (8'ha2)) : ((8'ha9) > (8'ha4))))) ? ((~&(((8'ha6) * (8'hba)) ? (+(8'ha4)) : {(8'hac)})) ? (+({(7'h41), (8'ha2)} ^ ((7'h40) && (8'ha6)))) : (~|(^(~|(8'hb9))))) : ({(-{(8'hb2), (8'hab)})} > ({((8'ha0) ? (8'hb8) : (8'hbc))} ? ((|(8'hbc)) ^ {(8'ha9), (8'haa)}) : (~|(!(8'ha1)))))), 
parameter param94 = param93)
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire52;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire [(3'h7):(1'h0)] wire50;
  input wire signed [(4'hd):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire78;
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire78,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg53 <= $signed((~|wire52[(3'h7):(1'h1)]));
      if (((+{(&$unsigned(wire51))}) ?
          (((^reg53[(3'h4):(2'h3)]) * ($unsigned((8'hba)) >= $signed(wire52))) ?
              $unsigned((reg53 | $unsigned(reg53))) : (~&wire50)) : {(&$signed((^wire52)))}))
        begin
          if ((reg53 & $unsigned((7'h42))))
            begin
              reg54 <= $unsigned((^~(wire49[(1'h1):(1'h1)] >>> ((wire52 >> wire51) & $signed(reg53)))));
              reg55 <= (~|$unsigned((+(~&{wire50, reg53}))));
              reg56 <= $signed((reg53[(3'h5):(1'h1)] * $signed($unsigned((wire51 ?
                  wire49 : wire50)))));
              reg57 <= (^(^~($signed(reg56[(2'h3):(2'h3)]) ?
                  ((~^wire50) << {reg56}) : (^~(reg54 ? wire49 : reg56)))));
              reg58 <= $unsigned((|wire49[(4'hd):(2'h2)]));
            end
          else
            begin
              reg54 <= (reg53 ?
                  (^~{($signed(reg54) | (8'hbd))}) : $unsigned(wire49));
              reg55 <= $signed((($signed((!reg58)) ?
                  $signed(wire49[(3'h7):(3'h6)]) : $unsigned((!(8'hbb)))) ^~ (8'hbf)));
            end
          reg59 <= $unsigned(reg57);
          reg60 <= (($unsigned({wire52}) ? wire51[(2'h3):(1'h1)] : wire50) ?
              $signed(reg59) : $unsigned(reg58[(1'h0):(1'h0)]));
          if ($signed({$signed((reg54[(1'h1):(1'h0)] ?
                  (reg54 ^ reg54) : (~reg57))),
              reg60}))
            begin
              reg61 <= $signed(wire49);
              reg62 <= reg60;
              reg63 <= {(reg62[(1'h0):(1'h0)] ?
                      $signed($signed((wire52 ?
                          wire50 : wire50))) : {reg60[(2'h3):(1'h1)], wire50}),
                  reg60[(3'h6):(3'h4)]};
              reg64 <= (^~$signed((reg56[(3'h4):(1'h0)] ?
                  ((-(8'ha0)) ?
                      wire51[(4'ha):(2'h3)] : $unsigned(wire49)) : $unsigned(reg59))));
            end
          else
            begin
              reg61 <= (8'ha6);
              reg62 <= $unsigned((wire50 ^~ {reg63[(5'h11):(4'h9)]}));
              reg63 <= $signed($unsigned(({(wire50 - reg58),
                  {wire49, wire51}} ^~ $signed($signed(reg63)))));
              reg64 <= {((~(8'hb5)) ?
                      (7'h42) : ($signed((reg64 * wire50)) >> $unsigned((wire51 || reg58)))),
                  reg53[(2'h2):(1'h0)]};
              reg65 <= (reg63 && {wire51});
            end
        end
      else
        begin
          reg54 <= wire52[(3'h7):(2'h3)];
          reg55 <= ($signed(reg61) ^ $unsigned((reg63[(2'h2):(1'h0)] < ($unsigned(wire49) ?
              (|reg56) : $signed(reg62)))));
          reg56 <= $signed(reg61);
          if (($signed(reg60[(3'h5):(1'h0)]) ?
              (^((~$signed(wire49)) << (~&(wire51 ?
                  reg53 : reg63)))) : (~((reg62 ?
                      (8'hac) : wire49[(3'h5):(2'h2)]) ?
                  $unsigned($unsigned(wire51)) : $unsigned(reg62)))))
            begin
              reg57 <= ((~&($signed(reg63) ?
                  (~|$signed(wire51)) : $signed($unsigned(reg65)))) || wire51);
              reg58 <= ($signed(wire49) == $unsigned(((!(reg53 ?
                      wire52 : wire52)) ?
                  reg63 : ((reg60 && wire52) >> (reg60 >> reg55)))));
              reg59 <= wire52;
              reg60 <= reg61[(4'ha):(1'h1)];
            end
          else
            begin
              reg57 <= $signed((!$unsigned((reg60[(2'h3):(1'h0)] ?
                  $unsigned(reg59) : reg62[(1'h1):(1'h0)]))));
              reg58 <= reg55;
              reg59 <= {$signed(wire50)};
              reg60 <= (~&$signed({$unsigned(reg58), reg62[(2'h2):(1'h0)]}));
              reg61 <= reg53[(4'h8):(4'h8)];
            end
        end
      reg66 <= ($signed((($signed(wire52) ? $unsigned((8'hb8)) : reg54) ?
              (^reg62) : $signed(reg55[(2'h2):(1'h1)]))) ?
          (^$unsigned(($unsigned(reg62) ?
              {reg54} : $unsigned(reg63)))) : (^~$unsigned({(~^(8'hb4))})));
      if ({(reg55 & $signed(wire50[(2'h3):(2'h2)]))})
        begin
          if ({$unsigned(reg65[(3'h4):(3'h4)])})
            begin
              reg67 <= reg62;
              reg68 <= $unsigned(wire51);
              reg69 <= ($signed(((!wire50[(1'h0):(1'h0)]) << {reg60,
                      reg64[(2'h3):(2'h2)]})) ?
                  $unsigned((8'ha2)) : reg65);
              reg70 <= reg62;
              reg71 <= $unsigned((~|({$signed(reg63)} ?
                  ((reg70 >= reg66) ?
                      {reg63, reg58} : reg70) : $signed((^~(8'hb6))))));
            end
          else
            begin
              reg67 <= ((((-$unsigned(reg57)) & (^~{reg65, reg62})) ?
                      (((|reg69) <= $signed(reg69)) <<< (|((8'h9e) <<< reg60))) : (~|reg67)) ?
                  ($signed($unsigned((~|reg63))) ?
                      reg67 : (~{(reg65 ? (8'hbb) : wire49),
                          reg57[(3'h4):(1'h1)]})) : wire50);
              reg68 <= (!$unsigned($unsigned($signed((reg66 || reg62)))));
              reg69 <= (~^reg53[(5'h10):(4'hf)]);
              reg70 <= reg65[(3'h5):(1'h0)];
              reg71 <= (&$signed(((reg60 <<< reg66) < $signed((reg56 ?
                  (7'h44) : reg62)))));
            end
          if ($signed(({(8'hb8), (((8'hbb) ? (8'ha0) : reg54) ^~ (~^reg70))} ?
              (reg67[(2'h3):(1'h0)] - reg60[(1'h1):(1'h0)]) : reg64)))
            begin
              reg72 <= reg70[(3'h6):(2'h2)];
              reg73 <= $signed({(8'ha2)});
              reg74 <= (8'h9e);
              reg75 <= reg70[(4'he):(4'ha)];
            end
          else
            begin
              reg72 <= reg61[(4'hd):(2'h2)];
              reg73 <= (^~reg69[(2'h3):(2'h2)]);
            end
          reg76 <= ($unsigned(reg74) ?
              $unsigned({$signed($unsigned(reg73)),
                  (~|{(7'h40)})}) : $signed(reg69[(4'hb):(1'h0)]));
        end
      else
        begin
          reg67 <= (reg68[(4'h9):(4'h9)] != (|$signed((&(reg53 > reg61)))));
          reg68 <= wire52;
          if (reg76)
            begin
              reg69 <= (((~^$unsigned($signed(reg69))) - $unsigned(reg55)) ?
                  ($unsigned(wire49) ?
                      {$signed($signed((8'hb4)))} : $signed($signed((reg74 ?
                          wire49 : reg72)))) : {(reg59[(1'h1):(1'h0)] | reg74)});
              reg70 <= $signed($unsigned((^$unsigned($unsigned(wire49)))));
              reg71 <= $signed($unsigned((8'hb6)));
              reg72 <= reg68;
            end
          else
            begin
              reg69 <= $unsigned(((~^reg63[(1'h0):(1'h0)]) ?
                  ($signed(reg76) ?
                      ($unsigned(reg53) ?
                          reg69 : (reg65 ?
                              reg63 : reg62)) : ((8'hb7) & ((8'hb1) >>> reg66))) : wire50[(3'h5):(3'h4)]));
              reg70 <= {((reg55 ?
                      (reg67 ?
                          ((8'hbb) ?
                              (8'hb9) : (8'hb2)) : $signed((8'hb2))) : (+reg55)) >> $unsigned($signed(reg61))),
                  (~^$signed($unsigned((&reg62))))};
            end
          reg73 <= (^$unsigned(reg65));
        end
      reg77 <= reg74;
    end
  assign wire78 = (wire50 >>> wire51[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg79 <= (&(^~reg62[(2'h3):(1'h1)]));
      reg80 <= (8'hb0);
      reg81 <= ($unsigned(reg73[(3'h4):(1'h1)]) ?
          wire50[(3'h6):(3'h6)] : $unsigned((~^$unsigned((~|reg61)))));
      reg82 <= ($unsigned(($unsigned(reg55) ?
              $unsigned($signed(reg61)) : (((8'hb0) ? (8'hbe) : (7'h41)) ?
                  $signed(reg56) : (reg69 || reg56)))) ?
          reg66[(3'h6):(3'h6)] : reg59[(4'h8):(3'h4)]);
    end
  assign wire83 = $signed(reg63[(3'h4):(1'h1)]);
  assign wire84 = wire51[(3'h7):(2'h2)];
  assign wire85 = ($unsigned($unsigned($signed({reg81}))) ?
                      ((8'hb8) && wire52) : (reg64 & $unsigned(($unsigned(reg75) ?
                          reg69[(4'hc):(4'h9)] : $unsigned(wire50)))));
  assign wire86 = (~|(8'hbc));
  assign wire87 = (~reg61);
  assign wire88 = reg73[(3'h6):(3'h4)];
  assign wire89 = reg80[(1'h1):(1'h0)];
  assign wire90 = $unsigned(reg53);
  assign wire91 = $unsigned($signed((reg59[(4'ha):(3'h5)] && wire51[(2'h3):(1'h0)])));
  assign wire92 = (((&({reg69} == $unsigned(reg56))) ? reg59 : {(!(8'ha1))}) ?
                      $unsigned({reg74[(1'h0):(1'h0)],
                          $unsigned((~^reg68))}) : (~($signed(reg55[(2'h2):(2'h2)]) ?
                          (((8'ha0) * reg69) ?
                              {wire88} : ((8'hac) ?
                                  reg58 : (8'h9c))) : (^(^~reg55)))));
endmodule

module module21
#(parameter param43 = (({{((8'hbd) ~^ (8'hb1)), (~&(8'ha7))}, (((8'hb4) ^~ (8'hb5)) || {(8'ha8)})} * (((-(8'ha2)) ? {(8'haa)} : (8'h9f)) ? (((8'ha6) ? (7'h44) : (8'hb2)) + (!(8'ha4))) : (~|((7'h42) - (8'hac))))) ? ((&(((7'h42) ? (8'ha2) : (8'hab)) ? {(8'hb6)} : ((8'hbf) != (8'hb7)))) + {((7'h41) != ((8'hb2) ? (8'hba) : (7'h44)))}) : (~&({(~&(8'hbb))} ? (((8'h9e) >> (7'h40)) ? ((8'hb0) ^ (8'ha5)) : (~&(8'hba))) : ((8'ha4) != ((8'hb5) ? (8'hbb) : (8'ha3)))))), 
parameter param44 = (~&(^~(&((param43 ? param43 : param43) <<< (param43 ? param43 : (8'hab)))))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(3'h7):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire26 = wire23;
  assign wire27 = $signed($unsigned({($unsigned(wire25) << $unsigned(wire24)),
                      wire22[(3'h4):(1'h0)]}));
  assign wire28 = ((($unsigned({wire27, wire26}) ?
                      wire24[(2'h3):(2'h3)] : wire26[(4'hb):(3'h6)]) ^~ $signed((+$signed(wire23)))) <<< $unsigned(wire25[(3'h5):(2'h2)]));
  assign wire29 = wire24[(3'h5):(3'h5)];
  assign wire30 = wire24[(4'hc):(1'h1)];
  assign wire31 = ($signed((wire23[(4'hd):(3'h5)] <<< {{wire30}})) ^~ {wire30,
                      wire27[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg32 <= $unsigned((!(|wire28)));
      reg33 <= wire22;
      if (($unsigned($unsigned((wire22[(2'h3):(1'h1)] ?
          (~|wire29) : $signed(wire26)))) * reg33[(2'h3):(2'h2)]))
        begin
          if (wire28)
            begin
              reg34 <= $signed($unsigned($unsigned(wire29[(3'h7):(3'h7)])));
              reg35 <= $unsigned($unsigned($signed((|{(8'ha7), (8'haa)}))));
              reg36 <= ((($signed($signed((8'hb8))) << reg32) & wire31) ?
                  $signed($signed($signed({wire26}))) : wire27);
            end
          else
            begin
              reg34 <= ($unsigned(wire27) <<< $signed({reg32,
                  $unsigned(wire25[(2'h2):(1'h0)])}));
            end
          reg37 <= ({{((^~reg33) ?
                      $signed(wire26) : $signed((8'h9f)))}} <= wire26);
          reg38 <= $unsigned(reg32);
          reg39 <= reg37;
        end
      else
        begin
          if ((^{wire23}))
            begin
              reg34 <= wire30[(1'h1):(1'h1)];
              reg35 <= wire26;
              reg36 <= $unsigned(wire28);
              reg37 <= (8'hba);
            end
          else
            begin
              reg34 <= (8'hae);
              reg35 <= reg39[(1'h1):(1'h1)];
              reg36 <= (((~$signed(((8'hae) == (7'h42)))) >>> reg32) ?
                  ({reg34[(5'h10):(4'h9)]} ?
                      $unsigned($unsigned((~&reg37))) : (+($signed((8'hba)) ?
                          (wire26 | (8'ha8)) : {wire25}))) : (^$unsigned($signed($signed(wire27)))));
              reg37 <= (~^($signed(reg33[(2'h3):(2'h3)]) ?
                  ({(reg38 ^~ wire23)} <= $unsigned($unsigned(reg37))) : {((|wire22) & wire27),
                      (reg39[(2'h3):(1'h0)] ?
                          wire31[(3'h7):(3'h6)] : (8'hbb))}));
            end
          reg38 <= (~((8'h9c) + $signed(((wire23 ^~ wire29) ?
              (wire29 ? reg36 : wire22) : ((8'hbc) != reg33)))));
          reg39 <= (~^$unsigned(($unsigned((wire23 ? (7'h40) : (7'h40))) ?
              wire31[(3'h5):(2'h2)] : reg35[(1'h0):(1'h0)])));
          reg40 <= (reg37[(3'h5):(2'h3)] ?
              ((~|{$unsigned((8'h9e))}) ?
                  reg34 : $signed(reg36[(4'h9):(1'h1)])) : (((|(~wire30)) ^ (reg36[(3'h7):(2'h3)] << {reg35})) ?
                  wire31[(4'h8):(4'h8)] : wire26[(2'h3):(1'h1)]));
          reg41 <= $signed((reg37[(3'h5):(1'h1)] & reg38));
        end
      reg42 <= (($signed(reg39[(1'h0):(1'h0)]) ?
              $unsigned(((reg36 <<< wire30) ^ wire22)) : (($signed(wire29) ?
                      (reg32 != reg32) : (!wire25)) ?
                  $signed((|(7'h40))) : $signed(wire29))) ?
          $signed({(|wire25[(2'h2):(1'h0)]),
              ({reg37} ?
                  $signed(wire28) : $signed(wire24))}) : {((~&$unsigned((8'hb4))) ?
                  {(reg41 ? reg34 : reg37)} : wire25[(3'h4):(2'h2)]),
              (($unsigned(wire28) ?
                  wire30[(4'hb):(1'h1)] : reg37[(3'h4):(3'h4)]) & wire25)});
    end
endmodule
