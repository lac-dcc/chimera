module top
#(parameter param181 = {{(((&(8'ha0)) ? {(8'h9d)} : (~^(8'hb8))) >> (((8'hb7) ? (8'ha7) : (8'hb3)) < (+(7'h43))))}, (((((8'hb0) ? (8'hb9) : (8'hbd)) ? {(8'hac), (8'hbe)} : (|(8'hab))) ~^ {((8'hb3) && (8'ha0)), {(8'had)}}) ? (|(-{(8'hb6)})) : (!({(8'hb4)} == (~|(8'hab)))))}, 
parameter param182 = (!param181))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire170;
  wire signed [(2'h2):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire172;
  wire [(4'h9):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire174;
  wire signed [(5'h11):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire177;
  wire [(5'h10):(1'h0)] wire178;
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  assign y = {wire180,
                 wire166,
                 wire96,
                 wire95,
                 wire93,
                 wire5,
                 wire170,
                 wire171,
                 wire172,
                 wire173,
                 wire174,
                 wire175,
                 wire176,
                 wire177,
                 wire178,
                 reg168,
                 reg169,
                 (1'h0)};
  assign wire5 = $unsigned((((wire0 ? (8'haf) : $unsigned(wire4)) ?
                         $unsigned($unsigned(wire2)) : wire0[(1'h0):(1'h0)]) ?
                     ((8'hbd) ?
                         ((~wire3) ?
                             $signed(wire3) : $unsigned(wire1)) : (+(8'h9c))) : wire4[(2'h3):(2'h2)]));
  module6 #() modinst94 (.clk(clk), .wire8(wire4), .wire7(wire1), .wire10(wire2), .wire9(wire3), .y(wire93));
  assign wire95 = wire4[(1'h0):(1'h0)];
  assign wire96 = wire5;
  module97 #() modinst167 (.clk(clk), .wire99(wire5), .wire98(wire93), .wire100(wire3), .y(wire166), .wire102(wire0), .wire101(wire1));
  always
    @(posedge clk) begin
      reg168 <= (8'hb4);
      reg169 <= (($signed(wire3[(1'h1):(1'h1)]) ?
          (wire166 ^~ $unsigned((wire3 ?
              wire0 : wire95))) : wire1) <<< (8'hb0));
    end
  assign wire170 = $unsigned(wire3[(5'h11):(4'hf)]);
  assign wire171 = {$signed($unsigned(((wire5 ? wire4 : (8'ha5)) ?
                           ((8'ha2) ? wire5 : wire166) : (reg169 ?
                               wire170 : wire0))))};
  assign wire172 = $signed($signed(({$signed(wire171),
                       $unsigned(wire166)} < {wire93, {wire5, wire170}})));
  assign wire173 = $unsigned({wire93[(2'h2):(1'h1)]});
  assign wire174 = wire173[(4'h8):(3'h4)];
  assign wire175 = ($signed(wire93[(3'h4):(3'h4)]) <<< ((~&($signed(wire170) ?
                           wire3[(4'hf):(4'h8)] : wire4)) ?
                       wire173[(3'h6):(1'h1)] : (reg169 <= ($unsigned(wire174) ?
                           (wire172 ?
                               reg169 : wire1) : wire0[(1'h0):(1'h0)]))));
  assign wire176 = (&($signed((8'hb9)) <<< (&(~^(~|wire5)))));
  assign wire177 = (wire4 ^~ {$unsigned((8'ha1)),
                       (wire1[(4'h9):(3'h7)] >> wire0[(5'h11):(4'he)])});
  module123 #() modinst179 (.wire127(wire4), .wire126(wire172), .wire124(reg169), .clk(clk), .wire125(wire2), .y(wire178));
  assign wire180 = $signed($signed($signed(((wire170 | wire170) ^ wire173[(4'h9):(1'h0)]))));
endmodule

module module97
#(parameter param164 = {{(~&({(7'h43)} ? (+(7'h43)) : ((8'ha4) + (8'h9e)))), (&(!((8'hbb) ? (8'hbf) : (7'h44))))}}, 
parameter param165 = param164)
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire102;
  input wire [(4'hf):(1'h0)] wire101;
  input wire signed [(3'h5):(1'h0)] wire100;
  input wire signed [(5'h10):(1'h0)] wire99;
  input wire [(3'h7):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire162;
  wire signed [(5'h13):(1'h0)] wire161;
  wire signed [(3'h5):(1'h0)] wire160;
  wire signed [(4'h8):(1'h0)] wire144;
  wire signed [(3'h7):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  reg [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg158 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire144,
                 wire143,
                 wire141,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg159,
                 reg158,
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
                 reg122,
                 reg121,
                 reg120,
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
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire103 = $signed(wire99);
  assign wire104 = $unsigned((~&wire101));
  assign wire105 = wire99;
  assign wire106 = ({$signed((~$signed((7'h44)))),
                       wire98} ^~ $signed($signed($unsigned({wire99}))));
  assign wire107 = (((wire99[(3'h7):(3'h6)] >> (!(wire98 | wire106))) ?
                       $unsigned(wire106) : (^~$unsigned((wire105 != wire105)))) ~^ $signed($signed((|{(8'ha4),
                       wire102}))));
  always
    @(posedge clk) begin
      if (wire101[(2'h2):(2'h2)])
        begin
          reg108 <= $unsigned((^(-$unsigned((&wire98)))));
          reg109 <= $signed(wire106[(3'h5):(1'h0)]);
          reg110 <= (wire107[(4'ha):(4'ha)] ? wire102 : wire99[(4'he):(4'hb)]);
          if ($unsigned((wire105[(3'h5):(2'h2)] ~^ $signed((^~reg108)))))
            begin
              reg111 <= ($unsigned((~&reg110)) - ((^~(wire105[(3'h5):(2'h3)] ?
                      wire101 : {(8'ha5), wire99})) ?
                  (+(wire102 ?
                      (!wire103) : wire103)) : $signed($signed((reg110 && wire105)))));
              reg112 <= ($signed((&(~^$unsigned(wire99)))) && (wire100[(1'h1):(1'h1)] ?
                  (wire102 ?
                      ((reg109 ^ (8'ha9)) <= $unsigned(reg110)) : ($signed(wire103) == (wire101 ?
                          wire103 : (8'hae)))) : $signed(((~|wire99) ?
                      $unsigned(reg109) : (+reg110)))));
              reg113 <= wire104;
              reg114 <= wire104;
              reg115 <= (wire107[(1'h0):(1'h0)] <= $unsigned((((reg110 || reg112) ?
                      (-wire103) : (wire98 ? wire107 : wire101)) ?
                  (wire99[(1'h0):(1'h0)] ?
                      reg111 : $unsigned(reg114)) : wire106[(3'h5):(2'h3)])));
            end
          else
            begin
              reg111 <= $unsigned((wire101[(2'h2):(1'h1)] | $signed(reg112)));
            end
        end
      else
        begin
          reg108 <= (reg108[(4'h8):(1'h1)] ? reg110[(4'hb):(1'h0)] : reg111);
          if (wire98[(1'h1):(1'h0)])
            begin
              reg109 <= (|$unsigned({{wire100[(1'h1):(1'h0)], (+wire99)},
                  (8'ha8)}));
              reg110 <= (wire107[(3'h4):(3'h4)] ?
                  wire100[(3'h5):(3'h4)] : ((8'hb8) == wire102));
              reg111 <= $signed(reg108[(2'h3):(1'h0)]);
              reg112 <= (((-(reg108 ?
                      (wire99 ^ reg108) : (reg108 ^~ (8'ha6)))) ?
                  wire107 : (|$signed($signed((7'h43))))) >> $signed(wire103[(3'h4):(2'h2)]));
              reg113 <= (~&(reg113[(2'h3):(2'h2)] ?
                  $signed(($signed(wire100) ^ $signed(wire98))) : wire99));
            end
          else
            begin
              reg109 <= $signed(({wire98[(3'h5):(1'h1)],
                  reg110[(3'h4):(3'h4)]} - ((^~wire102) * $unsigned(wire102[(4'ha):(2'h2)]))));
              reg110 <= (wire102[(4'h9):(3'h4)] ?
                  (~|(^(~&(wire101 ? wire103 : (8'hbc))))) : wire103);
            end
        end
      if (((~|wire102[(4'hf):(4'hf)]) <<< {(~^(|reg111))}))
        begin
          if ((~&$unsigned((wire101 ?
              ((~&wire99) ?
                  reg112[(1'h0):(1'h0)] : wire99) : $signed((8'ha2))))))
            begin
              reg116 <= ((&(~&reg112[(1'h0):(1'h0)])) ?
                  wire100 : $unsigned((+reg108[(3'h5):(3'h5)])));
              reg117 <= wire98;
              reg118 <= wire106;
            end
          else
            begin
              reg116 <= (&$signed($signed($signed($signed(wire100)))));
            end
          reg119 <= (~&wire100[(3'h4):(1'h0)]);
          reg120 <= $signed(((-(^(wire105 ? wire103 : reg118))) ?
              ((~&reg119[(2'h2):(1'h1)]) ?
                  (reg119[(1'h0):(1'h0)] ?
                      $unsigned((8'ha7)) : (reg113 ?
                          reg118 : wire102)) : wire101) : reg112[(1'h1):(1'h0)]));
          reg121 <= (8'hb7);
        end
      else
        begin
          reg116 <= reg112;
          reg117 <= (wire106 ?
              ((reg120 + (|reg114[(4'h9):(3'h7)])) <<< ($unsigned(wire101[(1'h1):(1'h0)]) ?
                  ({wire103, reg119} && (7'h42)) : {{wire99,
                          wire98}})) : reg112[(2'h2):(2'h2)]);
        end
      reg122 <= reg111;
    end
  module123 #() modinst142 (wire141, clk, reg109, wire99, wire101, reg112);
  assign wire143 = (&reg116[(4'hd):(1'h0)]);
  assign wire144 = $unsigned(reg114);
  always
    @(posedge clk) begin
      reg145 <= reg108[(1'h0):(1'h0)];
      reg146 <= ((|((~^$unsigned(wire103)) <<< $signed($signed(reg121)))) ?
          wire98[(3'h6):(3'h4)] : (($signed((reg118 ?
                  wire101 : reg111)) > reg118[(3'h7):(3'h4)]) ?
              $signed({$unsigned(wire107), {(8'hb5)}}) : $signed((~wire141))));
    end
  always
    @(posedge clk) begin
      reg147 <= reg122;
      reg148 <= ((wire100 - (^~$unsigned((~|wire141)))) >= reg114);
      if (reg113)
        begin
          reg149 <= (reg112[(3'h6):(2'h2)] >= (&reg108));
        end
      else
        begin
          reg149 <= ($signed((~(8'haa))) + (~&wire104[(3'h6):(1'h0)]));
          if ((-wire98[(2'h3):(1'h0)]))
            begin
              reg150 <= $signed((((wire103 ?
                      $unsigned(wire100) : wire104) << (^~wire143)) ?
                  reg112 : {(~^(^~reg108)), wire107}));
              reg151 <= (wire102 * wire105);
            end
          else
            begin
              reg150 <= ($unsigned(wire103[(2'h3):(2'h3)]) ?
                  wire104 : wire105[(1'h0):(1'h0)]);
              reg151 <= wire99[(3'h4):(1'h1)];
              reg152 <= ((($unsigned(wire103[(3'h7):(3'h6)]) ?
                      wire102[(5'h12):(2'h3)] : {{wire106, wire103}}) ?
                  ((wire100[(3'h4):(2'h2)] ?
                          $unsigned(wire100) : $signed((8'ha7))) ?
                      reg150 : reg116) : reg109) ^ $unsigned(($signed($signed(wire105)) << $unsigned((^~reg150)))));
              reg153 <= $signed($signed(($signed((|wire106)) > {$signed((8'hab)),
                  (~reg119)})));
              reg154 <= reg151[(3'h6):(3'h5)];
            end
        end
      if (((($signed(wire141) + ((wire99 ?
                  reg154 : (8'hae)) - reg154[(3'h6):(1'h1)])) ?
              ((reg113 ?
                  (reg115 <<< reg122) : wire99[(3'h7):(3'h7)]) ^ $signed($signed(reg146))) : reg147) ?
          ($signed(reg147) ?
              $unsigned(($unsigned(wire99) || $signed(reg120))) : ((reg154[(2'h3):(2'h2)] < (~&wire102)) ?
                  ($unsigned(reg120) >> (^~reg114)) : $signed($unsigned(reg108)))) : (~(8'h9e))))
        begin
          reg155 <= $signed(($unsigned((reg148 ?
                  wire98 : reg120[(4'h9):(2'h3)])) ?
              reg121[(3'h7):(3'h6)] : $unsigned(((8'hab) ?
                  $signed(reg119) : $signed(reg111)))));
        end
      else
        begin
          reg155 <= $signed($signed((8'ha0)));
          reg156 <= $signed(reg146[(2'h2):(1'h1)]);
          reg157 <= (~^($signed(reg122[(4'ha):(3'h5)]) & $unsigned(wire106[(4'h8):(3'h5)])));
          reg158 <= reg112[(1'h1):(1'h0)];
          reg159 <= reg155;
        end
    end
  assign wire160 = $signed($unsigned(reg145[(1'h0):(1'h0)]));
  assign wire161 = (~&(($signed($signed(reg119)) ?
                           (^~(reg150 * reg116)) : $signed($signed(reg155))) ?
                       wire101 : (-$unsigned({reg155, reg148}))));
  assign wire162 = reg157[(5'h13):(1'h1)];
  assign wire163 = reg157[(2'h3):(2'h2)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(5'h11):(1'h0)] wire91;
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire73,
                 wire37,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire18,
                 wire17,
                 wire12,
                 wire11,
                 wire75,
                 wire91,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire11 = wire9;
  assign wire12 = (^wire11);
  always
    @(posedge clk) begin
      reg13 <= {$signed(((8'ha3) ?
              $signed((^(7'h41))) : ((wire9 | wire12) ^ (|wire10))))};
      reg14 <= reg13;
      reg15 <= $unsigned((wire9[(4'he):(4'h8)] + {{(~^wire7), {wire10}},
          ($unsigned(wire12) < (wire7 ^~ (8'h9c)))}));
      reg16 <= wire7;
    end
  assign wire17 = (8'hac);
  assign wire18 = (-wire9);
  always
    @(posedge clk) begin
      reg19 <= $unsigned((wire10 ? $unsigned(((|wire18) && {wire7})) : wire11));
      reg20 <= (reg14 * ({({(8'h9f), reg15} ?
              $unsigned(wire11) : {wire17})} >> wire9[(5'h13):(4'ha)]));
      if ((^$signed(wire11)))
        begin
          if (($signed(wire12[(3'h4):(2'h2)]) ?
              (^~($unsigned($signed(wire17)) >> wire17)) : (8'ha1)))
            begin
              reg21 <= (~^(^~(8'ha3)));
            end
          else
            begin
              reg21 <= (reg21 ?
                  (wire10 ?
                      ($unsigned(wire10[(2'h2):(1'h1)]) ?
                          reg21 : (reg14 ?
                              (~&wire12) : (-reg16))) : $signed((wire17 ?
                          (~(8'hba)) : (^reg16)))) : (+($signed($unsigned(wire12)) ?
                      $unsigned((~|reg15)) : $signed($unsigned(wire17)))));
              reg22 <= (($unsigned(wire11[(3'h6):(3'h4)]) ?
                      (~^$signed((reg14 | wire18))) : ((-wire11) && {(~&reg13),
                          (reg21 ? wire7 : reg15)})) ?
                  $signed($signed($signed({reg13,
                      wire8}))) : ($unsigned(($signed(reg14) ?
                      wire17 : $signed(wire10))) != reg15));
              reg23 <= ((reg15 & ((^~(reg19 != reg14)) ?
                      $unsigned((wire10 ? reg22 : wire18)) : (~wire11))) ?
                  wire12 : (wire7 ?
                      ((-reg15[(3'h4):(3'h4)]) ?
                          reg16 : wire11[(2'h3):(2'h3)]) : reg16[(3'h4):(2'h3)]));
              reg24 <= (((wire7[(1'h0):(1'h0)] ?
                      (-$unsigned(wire7)) : ($signed(reg14) ?
                          $signed(wire11) : (wire17 > reg20))) ?
                  (~^(~^{reg22, (8'ha2)})) : {$signed((reg23 ?
                          wire11 : wire11)),
                      $unsigned({reg21, (7'h41)})}) != (~^reg21));
            end
          reg25 <= ($signed(reg13[(3'h5):(2'h3)]) - {(reg21 ?
                  {reg15} : ((reg23 ? reg15 : reg15) ?
                      (~|wire18) : (^~(8'haf))))});
          reg26 <= (($signed((+(wire8 ? reg25 : wire8))) ?
              (reg13[(4'hb):(2'h2)] < $unsigned(((8'ha5) ?
                  (8'h9d) : reg20))) : wire11[(4'hc):(4'hc)]) != wire7[(1'h1):(1'h1)]);
          reg27 <= reg24[(1'h0):(1'h0)];
        end
      else
        begin
          reg21 <= $unsigned($unsigned((!(~|((8'ha7) ? reg15 : reg24)))));
          reg22 <= ($signed(({wire17[(3'h4):(2'h3)], (reg13 ? reg22 : reg25)} ?
                  {$unsigned(wire8), $signed(wire17)} : $unsigned((reg13 ?
                      wire17 : reg21)))) ?
              $unsigned($signed(((wire18 | (8'hbb)) ?
                  $unsigned(reg26) : ((8'had) ?
                      reg19 : (8'hb8))))) : (wire8 | ($unsigned((~|reg21)) * ((|(8'h9e)) & (|wire17)))));
          reg23 <= (&reg24);
          reg24 <= (reg24 <<< $signed((((wire7 ^~ (8'hb7)) + (reg25 <= reg20)) - (reg22 < (wire9 ?
              wire17 : wire9)))));
        end
    end
  assign wire28 = reg27[(4'h9):(4'h9)];
  assign wire29 = $signed((((wire8 || $signed(reg21)) << wire12) <<< (wire7 || reg13[(4'h8):(3'h7)])));
  assign wire30 = (+$unsigned((reg23 ?
                      (~|reg13) : {(wire18 ^ wire12), wire11[(1'h1):(1'h1)]})));
  assign wire31 = $signed((^~$signed(reg27[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      reg32 <= $signed({($unsigned($signed(reg21)) + ((~|wire10) ?
              reg26[(1'h0):(1'h0)] : (-wire17)))});
      reg33 <= wire28;
      reg34 <= (wire8[(1'h0):(1'h0)] ?
          (wire12 >= (((reg13 < wire8) ? reg21 : $unsigned(wire8)) ?
              {wire11[(1'h0):(1'h0)],
                  (wire7 >= wire29)} : $signed(((8'hab) || reg23)))) : {(wire9 ?
                  (!(&wire28)) : (wire10 ? (~wire12) : $signed(wire11))),
              $signed((-(8'hb2)))});
      reg35 <= wire29;
      reg36 <= $signed(wire7);
    end
  assign wire37 = $unsigned({reg27,
                      $signed(((wire12 >> reg25) << (reg33 == wire12)))});
  module38 #() modinst74 (wire73, clk, reg23, reg32, reg15, wire12);
  assign wire75 = (((wire18[(1'h0):(1'h0)] - reg16) < $signed((wire10 >= wire31[(2'h3):(2'h2)]))) ?
                      (^~$signed(((~^(8'h9d)) ?
                          (wire9 >= reg13) : (reg16 ?
                              reg19 : reg26)))) : $unsigned((~^((reg26 >= reg24) <<< $signed((7'h43))))));
  module76 #() modinst92 (wire91, clk, reg16, reg23, reg36, reg32, wire30);
endmodule

module module76  (y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire81;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire signed [(4'h9):(1'h0)] wire79;
  input wire [(2'h2):(1'h0)] wire78;
  input wire [(5'h11):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 (1'h0)};
  assign wire82 = (wire78[(1'h0):(1'h0)] ^ ((^(wire79 ?
                      (+wire79) : wire78)) << (wire81 ?
                      wire80 : (-(^~wire77)))));
  assign wire83 = (wire80 >> wire80);
  assign wire84 = wire80;
  assign wire85 = $unsigned((~&($unsigned((^~wire84)) ?
                      $signed((wire80 - wire83)) : (wire80[(3'h7):(3'h7)] >> (wire83 ?
                          wire78 : wire84)))));
  assign wire86 = wire77;
  assign wire87 = $unsigned((!$signed((-$signed(wire77)))));
  assign wire88 = (-$unsigned((+(8'hbd))));
  assign wire89 = (!$signed((wire78[(1'h1):(1'h0)] ?
                      (wire79[(1'h0):(1'h0)] >= ((7'h41) & (8'h9d))) : wire86[(2'h2):(1'h1)])));
  assign wire90 = wire78[(1'h1):(1'h0)];
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire42;
  input wire signed [(5'h13):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h15):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire59;
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 reg72,
                 reg71,
                 reg70,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire42[(1'h0):(1'h0)]))
        begin
          reg43 <= wire41;
          if (reg43)
            begin
              reg44 <= $signed(wire42[(2'h2):(1'h1)]);
              reg45 <= $signed((wire41[(3'h5):(1'h1)] ?
                  $unsigned(((~wire42) ~^ (reg43 ?
                      wire42 : (8'hb5)))) : (~&($signed((8'h9f)) ?
                      reg44[(3'h4):(3'h4)] : $signed(wire41)))));
              reg46 <= ((wire40 + (|$signed($signed(reg45)))) ?
                  $unsigned(wire41) : $unsigned(wire41[(4'hc):(4'hb)]));
              reg47 <= wire40;
            end
          else
            begin
              reg44 <= ($unsigned((((-reg45) ?
                      wire40[(2'h3):(1'h1)] : (wire42 ?
                          wire39 : reg44)) << ({reg45} << $unsigned(reg44)))) ?
                  (reg44 ?
                      reg46 : $signed(((reg47 ?
                          (8'hb8) : reg43) - reg43[(4'hc):(1'h0)]))) : $unsigned(($unsigned(reg45) << wire39[(1'h0):(1'h0)])));
              reg45 <= ($signed((8'hb9)) >>> (reg44[(3'h4):(2'h3)] ?
                  $unsigned((reg45 >= $unsigned(wire40))) : ($unsigned($signed(reg43)) <= (-$unsigned(reg45)))));
              reg46 <= reg43;
            end
          reg48 <= ($signed(reg44[(2'h3):(1'h0)]) ^~ wire40[(3'h6):(2'h3)]);
        end
      else
        begin
          reg43 <= (reg47 ?
              (reg47[(4'hb):(3'h4)] ?
                  reg45 : ((wire39[(1'h0):(1'h0)] ?
                          wire39[(3'h4):(1'h1)] : (reg44 ^~ reg45)) ?
                      ((wire40 != reg48) ?
                          reg46[(3'h5):(3'h4)] : (&reg48)) : $signed(reg43))) : $signed((+{$signed(reg48)})));
          reg44 <= wire42[(2'h2):(1'h0)];
          reg45 <= wire40[(4'ha):(2'h2)];
          if ($signed(((^~$signed($unsigned(reg44))) & ({reg43, {wire40}} ?
              $signed((reg45 ? wire40 : reg48)) : (~&(reg43 & reg46))))))
            begin
              reg46 <= ((reg43 ?
                  {({(8'ha0)} >>> (reg46 ? wire42 : reg46)),
                      {$signed(reg44),
                          reg46}} : $signed($signed((wire39 * reg48)))) & (+(|reg44[(1'h0):(1'h0)])));
              reg47 <= $unsigned({(8'hab),
                  {(|reg46), $unsigned({wire41, reg47})}});
              reg48 <= reg44[(2'h3):(2'h2)];
              reg49 <= $signed((-reg43[(3'h7):(3'h5)]));
            end
          else
            begin
              reg46 <= ((wire40[(1'h0):(1'h0)] || (^~(!reg44[(3'h4):(1'h1)]))) ?
                  (|($unsigned(reg47) ?
                      (~^$unsigned(reg47)) : reg43)) : {reg47[(5'h14):(5'h13)],
                      {((reg48 ? (8'ha9) : reg44) == (reg48 ?
                              reg44 : reg45))}});
            end
        end
      reg50 <= (~&(reg45[(1'h1):(1'h0)] ?
          wire41[(5'h12):(3'h6)] : $signed(reg43[(2'h2):(1'h1)])));
      reg51 <= reg46[(2'h3):(1'h0)];
      if (reg48)
        begin
          reg52 <= reg46;
          if ($unsigned({(+$signed((reg48 - reg49)))}))
            begin
              reg53 <= $unsigned(reg47[(2'h2):(1'h0)]);
            end
          else
            begin
              reg53 <= $unsigned((!(wire42 - reg49[(2'h2):(2'h2)])));
              reg54 <= (($signed($unsigned($signed(reg46))) * (+$unsigned(((8'hbb) ?
                  reg52 : wire39)))) <<< ($signed($unsigned({reg52})) ^~ (+(|(+reg50)))));
            end
          reg55 <= $signed((-(reg48 - (-((8'hb5) ? reg50 : reg54)))));
          reg56 <= reg48;
          reg57 <= ($signed($unsigned(($unsigned(reg55) ?
                  $unsigned(reg47) : (wire39 ? (8'ha1) : reg53)))) ?
              (|{$unsigned((reg47 >> reg56))}) : reg52);
        end
      else
        begin
          reg52 <= $unsigned($signed(((8'ha5) ?
              {reg47, (wire39 ? reg51 : reg48)} : {(^reg52)})));
          reg53 <= (($unsigned((wire41 << (^~reg56))) >= (8'hb8)) ?
              (-wire40[(3'h6):(3'h6)]) : $signed({reg43}));
        end
      reg58 <= reg50[(4'h9):(3'h5)];
    end
  assign wire59 = $signed((-((&reg54) ?
                      reg50 : ($unsigned(wire41) + $unsigned(reg57)))));
  assign wire60 = {reg58[(4'h9):(2'h2)]};
  assign wire61 = (&(wire40 ? reg55 : (~|reg49)));
  assign wire62 = (8'hbe);
  assign wire63 = ((&reg45) ?
                      (((+wire39[(3'h4):(3'h4)]) ^~ $unsigned($signed((8'hab)))) - ((wire40 ?
                              reg46[(4'ha):(4'h8)] : $unsigned(reg50)) ?
                          $signed($signed((8'hba))) : reg50)) : {reg46[(1'h0):(1'h0)],
                          $signed((|wire39[(2'h2):(2'h2)]))});
  assign wire64 = (($signed($signed(wire61[(1'h0):(1'h0)])) | ((8'ha2) == ((!wire63) != (reg46 != reg52)))) ?
                      {(!{wire42[(3'h5):(1'h1)]})} : {(|$signed((wire41 ?
                              wire41 : (8'ha9)))),
                          $unsigned($unsigned((wire60 << wire40)))});
  assign wire65 = wire64;
  assign wire66 = $unsigned(((((wire62 << reg44) <= ((8'ha9) ^~ wire65)) >> (-((8'h9c) ?
                          (8'hb2) : (8'ha0)))) ?
                      ($signed((~|wire65)) >> wire61[(3'h5):(2'h3)]) : (($unsigned((8'ha2)) ?
                          reg49 : {reg55, wire39}) << $signed((-reg56)))));
  assign wire67 = ($unsigned({$signed(wire60[(2'h2):(2'h2)]),
                      (&(reg48 + wire40))}) ^ ({(~(wire62 ? (8'hae) : reg43)),
                      wire42[(3'h6):(3'h5)]} <<< wire39[(1'h1):(1'h1)]));
  assign wire68 = wire59;
  assign wire69 = $unsigned(($unsigned((reg55[(1'h1):(1'h1)] * $signed(reg48))) ?
                      $unsigned(wire65) : wire66[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg70 <= $unsigned(((!reg58) ? $unsigned(wire59[(1'h0):(1'h0)]) : reg48));
      reg71 <= reg45;
      reg72 <= wire68;
    end
endmodule

module module123
#(parameter param139 = (!(({{(8'ha2)}, ((8'ha0) ? (8'hbd) : (8'ha1))} - {(!(8'ha8))}) | ({(^(8'had)), (8'hb8)} < (((8'hbf) ? (8'hb6) : (8'had)) ^~ {(8'ha9)})))), 
parameter param140 = ((|(^((param139 + param139) ? (~param139) : {param139, param139}))) ? param139 : {(param139 ? (^~(^param139)) : (param139 ? (param139 ? param139 : param139) : param139)), {((~|param139) * (param139 | (8'ha6))), (param139 - param139)}}))
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire127;
  input wire [(3'h7):(1'h0)] wire126;
  input wire signed [(4'hf):(1'h0)] wire125;
  input wire signed [(4'hb):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire [(3'h7):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire [(3'h4):(1'h0)] wire128;
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire128,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 (1'h0)};
  assign wire128 = $signed(wire127[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      if ((~^wire124))
        begin
          reg129 <= $signed($signed((wire124 >> $unsigned(wire128))));
          reg130 <= wire127[(4'h8):(4'h8)];
          reg131 <= $unsigned((wire127 ? (^~reg130[(1'h0):(1'h0)]) : wire127));
          reg132 <= (^~({(-{wire128, wire124}),
              $unsigned({wire124})} > {(-wire124[(2'h3):(2'h2)]), wire126}));
          reg133 <= wire124[(1'h0):(1'h0)];
        end
      else
        begin
          reg129 <= (8'haa);
          if (($signed(reg129) ?
              reg133 : ((|reg132) ^ ((^reg130) <<< $signed(wire124)))))
            begin
              reg130 <= wire127;
              reg131 <= ($signed($unsigned(($signed(reg129) && (-wire127)))) << ((((reg130 >>> (8'haf)) < reg129) ?
                      $unsigned(reg132) : (~(~^wire126))) ?
                  reg130[(3'h4):(1'h1)] : wire128));
              reg132 <= ($unsigned(reg131) ?
                  wire124 : (+reg131[(3'h7):(3'h5)]));
            end
          else
            begin
              reg130 <= ((((8'hac) >= (^~$signed(reg129))) ?
                  wire124[(3'h6):(2'h2)] : $unsigned($unsigned(wire125[(3'h6):(2'h2)]))) | (reg129[(3'h4):(2'h2)] && wire126));
              reg131 <= ($unsigned($signed(reg130[(1'h1):(1'h0)])) ?
                  (~$signed(($unsigned((8'ha9)) && (~wire127)))) : (wire126 < $signed(((wire126 * (8'hb6)) ?
                      (~&reg133) : $signed(wire125)))));
            end
        end
    end
  assign wire134 = $unsigned(reg133[(4'h9):(1'h0)]);
  assign wire135 = $signed(reg131[(3'h4):(1'h0)]);
  assign wire136 = ($unsigned(wire135) ?
                       (reg132 ?
                           ($unsigned($signed((8'hae))) * (~|((8'h9f) ?
                               reg131 : reg130))) : ((!reg133) * $signed($unsigned((8'hbb))))) : (wire125 << wire135));
  assign wire137 = (wire128[(2'h2):(1'h0)] ?
                       (^~(~|wire135[(2'h3):(2'h3)])) : reg131);
  assign wire138 = ($unsigned(($signed((reg133 ? reg130 : wire137)) ?
                           {$signed(reg131), wire125} : ((wire125 ?
                               reg131 : wire124) << (reg129 ?
                               wire124 : wire136)))) ?
                       ((~&wire134[(4'ha):(2'h3)]) >= wire126) : ($unsigned(reg129[(4'hb):(3'h5)]) ?
                           wire135[(3'h4):(1'h0)] : {$unsigned({wire134})}));
endmodule
