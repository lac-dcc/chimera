module top
#(parameter param163 = ((((((8'ha8) ? (8'hba) : (8'h9c)) != ((7'h40) >> (8'hba))) ? ((~^(8'hb4)) ? ((8'hbe) > (8'hb3)) : (^~(8'hac))) : (^((8'ha4) ? (8'h9c) : (8'h9e)))) ? {(((8'h9f) * (8'had)) ? ((7'h42) ? (8'hb4) : (8'ha5)) : (|(8'had))), {(~(7'h41))}} : {{((8'hb3) <= (8'hbc))}, ((8'hb0) + (-(8'hb7)))}) ? (^~((((7'h40) ? (8'ha6) : (8'hba)) > ((8'hbc) ? (8'hab) : (8'hb6))) ? ({(7'h44), (8'hb9)} ? ((8'hb4) ? (8'hb2) : (8'ha6)) : {(8'hb9)}) : (((8'hbc) & (8'hb6)) && ((8'hb1) ~^ (8'hb0))))) : {(~|((7'h44) - ((8'haf) > (8'ha4)))), (((~^(8'hac)) | (8'hab)) == (^~((8'hab) ^ (8'hae))))}), 
parameter param164 = ((((param163 + (param163 ? (8'hb7) : (8'ha6))) >= param163) ? (-{param163}) : (((+param163) ? (~&param163) : {(8'h9f)}) >>> param163)) & ({(-{param163}), {(param163 != (8'hb5)), (8'h9c)}} << (((!param163) ? param163 : (param163 <<< (8'h9c))) ? (param163 | (~^(8'hac))) : (param163 && {param163, param163})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire160;
  wire [(5'h13):(1'h0)] wire159;
  wire signed [(2'h2):(1'h0)] wire158;
  wire signed [(3'h5):(1'h0)] wire157;
  wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire signed [(4'h8):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  assign y = {wire162,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire93,
                 wire6,
                 wire5,
                 wire4,
                 reg96,
                 (1'h0)};
  assign wire4 = ($signed(({wire2} - wire3)) + wire1);
  assign wire5 = ({(($signed(wire3) ^ (wire3 >>> (8'hae))) ?
                         $signed((wire0 ?
                             wire0 : wire3)) : $signed((wire2 | wire1)))} >> wire2);
  assign wire6 = {$unsigned($unsigned((wire4[(1'h1):(1'h0)] || $signed(wire0))))};
  module7 #() modinst94 (wire93, clk, wire1, wire3, wire5, wire4);
  assign wire95 = (($signed($unsigned(wire93)) ?
                      (wire6[(3'h4):(2'h3)] + $unsigned({wire1})) : ({(wire3 | wire93)} ?
                          wire4[(2'h3):(2'h2)] : wire2[(4'he):(1'h0)])) && wire93[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg96 <= ((((|(wire2 ?
              wire6 : wire2)) >>> ($signed(wire6) + wire6)) >>> {wire2,
              (!(^~wire5))}) ?
          (wire3 - ((^wire0) ?
              ($unsigned(wire6) < $signed(wire0)) : wire93[(2'h3):(1'h0)])) : {(-wire1)});
    end
  assign wire97 = (wire1 - $unsigned($signed(($unsigned(wire2) ?
                      wire1 : $signed(wire4)))));
  assign wire98 = (^~($unsigned({((8'hb0) ? wire97 : wire1), (^~(8'h9e))}) ?
                      $unsigned((^~(wire93 ^ wire1))) : ($signed((wire5 | reg96)) > ((wire2 << reg96) ?
                          (^wire2) : (wire95 == wire5)))));
  assign wire99 = $unsigned(($signed($unsigned((reg96 ? wire6 : wire3))) ?
                      wire4 : {((reg96 >>> wire97) ?
                              $unsigned(wire0) : (+wire4))}));
  assign wire100 = wire98;
  assign wire101 = wire6[(2'h2):(2'h2)];
  assign wire102 = $signed(wire95[(4'ha):(2'h3)]);
  module103 #() modinst151 (wire150, clk, wire6, wire0, wire101, wire5);
  assign wire152 = ((8'haf) ?
                       ($signed(wire99) ?
                           (~&$signed(wire97[(1'h0):(1'h0)])) : $signed((^(!wire93)))) : wire98[(4'h8):(3'h7)]);
  assign wire153 = (wire97 ?
                       wire100[(4'ha):(2'h3)] : $unsigned(($signed($signed(wire98)) ?
                           wire4 : ((|(8'hac)) > wire100[(4'h8):(3'h5)]))));
  assign wire154 = (^~wire99);
  assign wire155 = {($signed(wire102[(3'h4):(1'h1)]) ?
                           wire97[(3'h4):(2'h2)] : $unsigned($unsigned($signed(wire150)))),
                       ((&((wire150 <= wire1) ?
                               $unsigned(wire102) : (~wire95))) ?
                           $unsigned($unsigned((wire100 ?
                               wire4 : wire97))) : (((~^wire3) ?
                               $signed(wire153) : (wire152 ?
                                   wire2 : wire101)) && ((wire1 ?
                               wire102 : (8'hbd)) || (wire4 < wire102))))};
  assign wire156 = $unsigned((wire93 + wire155[(4'hc):(4'h8)]));
  assign wire157 = {(^~$signed((|wire100))),
                       ((wire99[(2'h3):(1'h0)] >>> wire155[(4'hf):(4'h8)]) ?
                           $signed(((|wire101) - ((8'had) >> wire1))) : wire3)};
  assign wire158 = $unsigned(($signed((~&(wire102 ?
                       wire0 : wire93))) >>> ((|{(8'h9c), wire4}) ?
                       (!(wire2 ? wire1 : wire102)) : (^(wire0 != wire154)))));
  assign wire159 = {{$signed(((wire101 >= wire101) == $unsigned(wire3)))}};
  module103 #() modinst161 (.clk(clk), .wire105(wire101), .y(wire160), .wire106(wire4), .wire107(wire97), .wire104(wire99));
  assign wire162 = (wire158[(2'h2):(2'h2)] ? reg96[(4'hb):(4'h8)] : wire2);
endmodule

module module103
#(parameter param149 = ((8'hbb) ? (&{((|(8'ha2)) ? ((8'hae) ? (8'ha7) : (8'hb6)) : ((8'ha3) * (8'hac)))}) : (+((((8'ha5) > (8'had)) ? ((8'hbf) && (8'ha0)) : ((7'h43) && (8'ha0))) + {{(8'hba)}}))))
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire107;
  input wire signed [(3'h5):(1'h0)] wire106;
  input wire signed [(4'hf):(1'h0)] wire105;
  input wire [(2'h3):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(4'hf):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 (1'h0)};
  assign wire108 = ((~^$unsigned($signed(wire106))) <= $signed(wire106[(2'h2):(1'h0)]));
  assign wire109 = $signed($signed({$unsigned($unsigned(wire105)),
                       (wire107 ^ (wire106 ? wire104 : wire105))}));
  assign wire110 = wire108[(3'h7):(2'h3)];
  assign wire111 = $signed(wire108);
  module112 #() modinst144 (.clk(clk), .wire115(wire105), .wire114(wire110), .wire113(wire108), .y(wire143), .wire116(wire109));
  assign wire145 = $unsigned((&wire143[(3'h6):(3'h4)]));
  assign wire146 = ((~^($unsigned(wire110) ?
                       $unsigned((^wire106)) : {wire104[(2'h3):(1'h1)]})) > wire108);
  assign wire147 = wire108;
  assign wire148 = (~^{$unsigned({$unsigned((8'haf)),
                           wire106[(1'h0):(1'h0)]})});
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire84;
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg87 = (1'h0);
  assign y = {wire92,
                 wire86,
                 wire48,
                 wire12,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire84,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  assign wire12 = (((~^(wire8[(3'h7):(1'h0)] ?
                          wire10[(1'h0):(1'h0)] : (~&wire8))) <<< (wire11[(3'h4):(2'h2)] ?
                          wire8 : (~^(^wire11)))) ?
                      ((!(~^(!wire11))) ?
                          {((wire9 <= wire10) ?
                                  (wire11 * wire11) : (wire8 ?
                                      wire10 : wire11))} : $signed(($unsigned(wire8) & (!wire9)))) : $unsigned(((~|wire11[(2'h2):(2'h2)]) ?
                          wire9 : $signed((^~wire8)))));
  module13 #() modinst49 (.clk(clk), .wire17(wire11), .wire15(wire10), .wire16(wire12), .wire14(wire8), .wire18(wire9), .y(wire48));
  assign wire50 = wire8[(2'h3):(1'h0)];
  assign wire51 = ((~&wire12[(4'hb):(2'h2)]) ?
                      $signed({(~&{(8'h9c), wire10}),
                          ((wire48 >= wire50) > $signed(wire8))}) : wire11[(3'h5):(2'h2)]);
  assign wire52 = $signed((wire10 ?
                      $signed($signed($unsigned((8'hb1)))) : (&(~|$unsigned(wire9)))));
  assign wire53 = (wire11 == ((&($signed(wire12) ?
                          $signed(wire8) : (~^wire8))) ?
                      $signed($unsigned($signed(wire12))) : (!wire9[(4'ha):(4'h9)])));
  module54 #() modinst85 (.clk(clk), .y(wire84), .wire55(wire53), .wire59(wire8), .wire57(wire9), .wire56(wire10), .wire58(wire11));
  assign wire86 = wire11;
  always
    @(posedge clk) begin
      reg87 <= {(!$signed(wire11))};
      reg88 <= wire8;
      reg89 <= wire52[(3'h5):(1'h0)];
      reg90 <= (8'hb2);
      reg91 <= ((wire10 ?
          ((wire48[(3'h7):(2'h2)] == (reg87 ?
              wire11 : reg88)) > reg88[(3'h4):(1'h0)]) : (8'hb1)) | {(8'ha0),
          (wire53[(3'h5):(1'h0)] ? reg89 : reg88[(1'h1):(1'h1)])});
    end
  assign wire92 = reg88[(2'h2):(1'h0)];
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  input wire [(4'hb):(1'h0)] wire57;
  input wire signed [(4'hc):(1'h0)] wire56;
  input wire [(4'hf):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire60;
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire62,
                 wire61,
                 wire60,
                 reg81,
                 reg80,
                 reg79,
                 reg72,
                 reg71,
                 reg70,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire60 = (((|(~(8'hb3))) && $unsigned((wire57 ?
                      ((7'h40) ?
                          wire59 : (7'h43)) : $unsigned(wire55)))) ^~ (+$signed(wire58)));
  assign wire61 = $signed($unsigned({(wire56[(4'hb):(1'h0)] ?
                          wire57[(1'h0):(1'h0)] : (wire55 * wire59)),
                      (~&wire57[(2'h2):(1'h1)])}));
  assign wire62 = wire58;
  always
    @(posedge clk) begin
      reg63 <= ($unsigned((wire62 ? wire56 : $unsigned((wire62 && wire59)))) ?
          wire60 : wire62);
      reg64 <= $unsigned((7'h40));
      reg65 <= (reg63[(4'h8):(2'h3)] ?
          $unsigned((|((^reg64) > {wire60}))) : (($unsigned((8'hae)) ?
                  (^$unsigned(reg63)) : wire57) ?
              $signed(({wire59, wire61} + (8'h9f))) : ($signed({reg63,
                  (8'hbf)}) == $signed((wire59 ? wire56 : wire55)))));
      reg66 <= $unsigned($unsigned((!$unsigned($unsigned((7'h40))))));
      reg67 <= ((~^$signed(wire60)) ?
          $signed($unsigned($unsigned((~|wire62)))) : wire59[(2'h2):(2'h2)]);
    end
  assign wire68 = wire59[(2'h3):(2'h3)];
  assign wire69 = $unsigned({(8'ha7), $signed((&$signed(reg63)))});
  always
    @(posedge clk) begin
      reg70 <= ($signed((+$signed((reg67 ? reg66 : reg65)))) ?
          {$unsigned(($unsigned(wire59) ?
                  $unsigned(wire68) : wire69))} : $signed(reg66));
      if ((({((wire59 ?
              wire57 : reg70) && $unsigned(wire57))} <<< (~wire68)) == (&wire60[(2'h2):(2'h2)])))
        begin
          reg71 <= (7'h43);
        end
      else
        begin
          reg71 <= $unsigned((reg63 ?
              reg66 : {$signed((wire55 ? reg67 : reg65)),
                  (wire57[(4'h8):(3'h6)] >> reg70)}));
        end
      reg72 <= wire55;
    end
  assign wire73 = (($unsigned({(~^reg70)}) * $unsigned(reg67)) ?
                      (!wire60) : ({{$signed(wire55)}, $unsigned(wire59)} ?
                          reg65 : (~reg64)));
  assign wire74 = $unsigned($signed({wire68}));
  assign wire75 = (!wire59[(4'hc):(2'h3)]);
  assign wire76 = {(reg71[(4'hc):(4'hb)] < wire69[(4'hc):(4'ha)]),
                      (wire58[(4'hc):(4'hb)] ?
                          ((|(^reg72)) | wire60[(3'h6):(3'h4)]) : {{reg64}})};
  assign wire77 = wire58;
  assign wire78 = reg72;
  always
    @(posedge clk) begin
      reg79 <= {(wire68 ?
              $signed($unsigned((~wire69))) : wire68[(4'h8):(1'h1)]),
          ((wire58[(4'hb):(4'ha)] + ((wire75 ?
                  (8'ha0) : wire75) <<< $signed(wire77))) ?
              wire77[(3'h5):(2'h2)] : ($signed($signed(reg71)) ?
                  $signed($signed(wire61)) : $unsigned({wire58, wire77})))};
      reg80 <= wire62;
      reg81 <= wire68[(4'hc):(4'h8)];
    end
  assign wire82 = $signed(reg64[(4'hd):(4'hd)]);
  assign wire83 = {((8'ha6) ? wire69 : $unsigned((^$signed(reg81)))),
                      (wire82[(4'hb):(4'h8)] ^~ wire55[(4'hf):(4'hc)])};
endmodule

module module13
#(parameter param47 = (~&({(((8'h9c) != (8'had)) + ((8'hb4) ? (8'hb4) : (8'hb7)))} ? ({(~|(8'hb2)), ((8'hab) ? (8'h9c) : (8'haa))} ? (^~((8'ha2) ? (8'hae) : (8'hb0))) : ({(8'hb3)} <= (+(8'hac)))) : (((8'hbb) & (|(8'ha8))) || (|((8'ha3) ? (8'hb5) : (8'ha8)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire28,
                 wire26,
                 wire21,
                 wire20,
                 wire19,
                 reg46,
                 reg45,
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
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = {(~^(wire18[(2'h2):(2'h2)] ?
                          $signed((|wire16)) : $signed($signed(wire17)))),
                      $unsigned(($signed($signed(wire14)) > (wire17 <= $unsigned(wire17))))};
  assign wire20 = ((8'hb0) ? wire17 : wire16[(2'h2):(2'h2)]);
  assign wire21 = wire18;
  always
    @(posedge clk) begin
      reg22 <= $unsigned(wire19);
      reg23 <= $signed((~|$signed(((&(8'haa)) ^ $unsigned((8'ha5))))));
      if ((~|wire21))
        begin
          reg24 <= wire20[(4'h8):(1'h1)];
          reg25 <= wire17;
        end
      else
        begin
          reg24 <= $unsigned(wire20[(2'h2):(1'h0)]);
          reg25 <= wire21[(4'hb):(3'h6)];
        end
    end
  assign wire26 = (|wire16[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg27 <= reg24[(3'h4):(2'h2)];
    end
  assign wire28 = (-$unsigned({((wire20 ? reg23 : wire16) ?
                          $signed(wire14) : (^~wire17))}));
  always
    @(posedge clk) begin
      reg29 <= $unsigned(((&reg23[(4'h9):(3'h4)]) ?
          (($signed(wire18) ?
              (wire15 && wire28) : $signed(reg23)) < $signed((wire17 <<< wire14))) : ($signed({(8'ha8)}) != wire20[(3'h6):(1'h0)])));
      if ($signed($signed(((&(wire20 ? wire14 : reg24)) >>> $unsigned((wire26 ?
          wire18 : wire28))))))
        begin
          reg30 <= $signed(($signed((~|(^wire17))) == $signed((^$signed(wire21)))));
        end
      else
        begin
          if ({$unsigned($signed({(|wire16), (|wire20)})), reg22})
            begin
              reg30 <= $signed({reg22});
              reg31 <= (((~(reg27[(1'h0):(1'h0)] ~^ (|wire16))) >= {$unsigned({wire21}),
                      (~$signed(wire18))}) ?
                  $unsigned((^wire28)) : {({(wire16 ?
                              (8'hac) : reg24)} || $unsigned(wire26[(3'h6):(3'h4)])),
                      reg25[(3'h5):(3'h4)]});
              reg32 <= ((~^($unsigned($unsigned(reg22)) ? wire17 : wire17)) ?
                  $unsigned((&$unsigned($signed(wire20)))) : (8'ha1));
              reg33 <= reg27[(2'h3):(1'h1)];
              reg34 <= reg33[(4'h8):(1'h1)];
            end
          else
            begin
              reg30 <= wire28[(4'ha):(3'h5)];
            end
          reg35 <= reg29[(4'ha):(4'h9)];
          reg36 <= {$unsigned(reg22[(2'h3):(1'h1)]),
              ($signed($signed((^~reg29))) >> (wire17 > {$signed(wire26),
                  (8'ha8)}))};
        end
      reg37 <= reg30;
      if ((8'hae))
        begin
          reg38 <= (reg25 ?
              (($signed($signed((8'hb3))) || ($unsigned(reg35) <= wire17)) ?
                  reg22 : {reg31,
                      $signed(wire20[(4'h8):(2'h2)])}) : $unsigned(($signed(reg30[(3'h5):(2'h2)]) != ((wire21 ?
                  wire26 : wire17) && $unsigned(reg37)))));
          reg39 <= (+{$signed(wire20),
              $signed((wire28[(3'h6):(2'h2)] ?
                  reg32[(2'h2):(1'h1)] : wire19))});
          reg40 <= ($unsigned($signed(reg36[(3'h6):(1'h1)])) ?
              (8'h9e) : (((&{(8'hb0), wire17}) ?
                  wire21 : $unsigned(reg29)) & ({(^~reg24),
                  reg36[(3'h6):(1'h1)]} | (wire21[(1'h1):(1'h1)] ^~ ((8'hb3) ~^ reg32)))));
          reg41 <= $unsigned((!{($unsigned(reg37) ?
                  $unsigned(reg36) : ((8'haa) + (8'ha7)))}));
        end
      else
        begin
          reg38 <= reg27[(3'h4):(1'h1)];
        end
    end
  assign wire42 = wire16[(4'h9):(3'h4)];
  assign wire43 = (wire20 | (+reg32));
  assign wire44 = $signed({reg25});
  always
    @(posedge clk) begin
      reg45 <= (-{$signed(wire18)});
      reg46 <= $signed(($signed((+(reg30 ~^ wire15))) ^~ (~^$unsigned(reg40))));
    end
endmodule

module module112
#(parameter param141 = (~^{((((8'ha8) ? (8'had) : (8'ha2)) ? (~^(8'ha6)) : ((8'hb2) ? (8'hb9) : (8'hb9))) ? ((^~(8'hbf)) ? ((8'hbd) ? (8'hbf) : (8'haa)) : (7'h40)) : ((!(8'hbe)) ? (8'hac) : ((8'hbc) < (8'had))))}), 
parameter param142 = param141)
(y, clk, wire116, wire115, wire114, wire113);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire116;
  input wire signed [(3'h4):(1'h0)] wire115;
  input wire signed [(2'h3):(1'h0)] wire114;
  input wire signed [(2'h2):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire129;
  reg [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  assign y = {wire140,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire129,
                 reg139,
                 reg138,
                 reg131,
                 reg130,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg117 <= $signed(($unsigned((~|$unsigned(wire113))) ?
          wire114[(2'h2):(1'h0)] : {wire115[(1'h1):(1'h1)]}));
      if ((^~(!$unsigned(({(8'hb7), wire116} <<< $signed(wire113))))))
        begin
          reg118 <= $signed($unsigned(wire115));
          reg119 <= $signed(wire113);
          reg120 <= ((7'h43) ?
              $signed(($unsigned(wire115) | $unsigned($unsigned(wire116)))) : (~|{(~|reg119)}));
          reg121 <= wire115[(1'h1):(1'h0)];
        end
      else
        begin
          reg118 <= (wire113 - ({reg120, $unsigned($unsigned(reg120))} ?
              (^~wire114) : (reg119[(1'h1):(1'h0)] ?
                  {wire116[(1'h1):(1'h0)]} : $unsigned(reg118))));
          reg119 <= (($signed((wire115[(2'h3):(1'h0)] ?
                      (reg121 ? reg118 : reg118) : (8'hbd))) ?
                  $unsigned((&(8'hb1))) : (reg121[(3'h7):(3'h4)] ?
                      wire114[(2'h3):(2'h3)] : {(^wire116),
                          reg118[(1'h1):(1'h1)]})) ?
              $unsigned({(8'hbe)}) : $unsigned($unsigned(reg117[(2'h3):(2'h2)])));
          reg120 <= $unsigned(($signed((8'ha4)) ?
              reg117[(2'h2):(2'h2)] : {$unsigned((reg117 ?
                      wire116 : wire116))}));
        end
      reg122 <= (^~$unsigned((wire116 >> {(8'hba)})));
      if ((((+$signed($unsigned(wire115))) || (8'hb4)) ^~ reg121[(3'h7):(3'h5)]))
        begin
          reg123 <= ($signed($signed(($signed((8'hab)) > (!wire113)))) << $signed($unsigned({(wire115 >= reg117),
              (reg121 ? reg119 : wire114)})));
        end
      else
        begin
          reg123 <= (reg119[(3'h4):(3'h4)] ?
              reg118[(2'h2):(2'h2)] : ($unsigned(((!reg121) ?
                      $unsigned((8'hbb)) : $signed(wire116))) ?
                  ((8'h9c) & $unsigned($signed((8'h9f)))) : reg118));
          reg124 <= ((^~{($unsigned(wire116) ?
                      ((8'hab) ? reg121 : (8'hbf)) : (~^wire114))}) ?
              $signed(((!$unsigned(wire115)) ?
                  $unsigned({reg118}) : {{reg117, reg122}})) : (((wire114 ?
                  reg123 : $unsigned(reg118)) & (8'hba)) - wire113[(1'h0):(1'h0)]));
          if (reg118[(3'h4):(2'h3)])
            begin
              reg125 <= $signed((~|(~&reg119)));
              reg126 <= ({(!(((8'hb0) ?
                      wire113 : reg124) - reg122))} != $unsigned(reg121[(1'h0):(1'h0)]));
              reg127 <= reg120;
              reg128 <= (^$unsigned($unsigned(reg124)));
            end
          else
            begin
              reg125 <= reg119;
              reg126 <= (reg124[(2'h3):(1'h1)] >= reg118);
            end
        end
    end
  assign wire129 = (!((|reg127[(3'h4):(3'h4)]) ^ $signed(wire113[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg130 <= $unsigned(reg117);
      reg131 <= reg124[(3'h5):(1'h1)];
    end
  assign wire132 = wire113;
  assign wire133 = ($unsigned(reg122) || $unsigned(($unsigned(reg123) || {wire116[(2'h3):(1'h1)]})));
  assign wire134 = ($signed(reg126) >= reg130);
  assign wire135 = wire134[(4'hb):(3'h5)];
  assign wire136 = wire133;
  assign wire137 = wire135[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg138 <= (8'h9e);
      reg139 <= wire134[(4'hc):(3'h4)];
    end
  assign wire140 = (!(^($unsigned($unsigned(reg127)) ?
                       reg138[(1'h1):(1'h0)] : (wire133 ?
                           (wire133 ? reg128 : wire135) : (wire133 ?
                               (8'hbc) : reg131)))));
endmodule
