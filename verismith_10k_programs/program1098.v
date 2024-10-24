module top
#(parameter param137 = (&{{(^~{(8'hbf)}), (8'ha0)}, ({(~&(8'hb0))} ? (~&(~&(8'hac))) : (((8'ha9) ? (8'haa) : (7'h43)) ? (^(8'hbc)) : ((8'ha0) && (7'h43))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire [(5'h12):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(4'hf):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire91;
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire91,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire4 = ({($signed((8'h9d)) ? wire3 : wire1[(4'hc):(2'h2)])} ?
                     (!($unsigned((-wire0)) ?
                         (|wire0) : $signed(wire3[(1'h1):(1'h0)]))) : wire1);
  assign wire5 = wire4;
  assign wire6 = $signed(wire3[(3'h4):(1'h0)]);
  assign wire7 = wire4;
  module8 #() modinst92 (wire91, clk, wire1, wire6, wire7, wire5, wire4);
  assign wire93 = (wire3 ?
                      (+(~|wire6[(4'hc):(1'h0)])) : $signed(($unsigned((~|(8'hb0))) == {wire6[(4'h8):(3'h5)]})));
  assign wire94 = wire1[(4'hc):(4'hb)];
  assign wire95 = ({(!(-(8'h9d))),
                      ($unsigned((wire2 ?
                          wire6 : (8'ha3))) <<< ((wire6 ^~ wire5) ?
                          wire3 : {wire1}))} <<< $unsigned($signed((~|wire7[(4'he):(3'h7)]))));
  assign wire96 = (~&($signed(((wire0 ~^ wire6) <= (wire6 ? wire0 : wire94))) ?
                      (((!(8'hbf)) <<< $unsigned((8'haa))) * {{wire93}}) : {(~$signed(wire7)),
                          $signed(wire1)}));
  assign wire97 = ((!wire96) ?
                      ((wire2 + wire1) + $unsigned((^~wire2))) : $unsigned(({$unsigned(wire95),
                              wire95[(3'h5):(2'h3)]} ?
                          (^$signed(wire93)) : $signed(wire3))));
  assign wire98 = wire6[(4'hc):(4'hc)];
  assign wire99 = $signed(wire6);
  assign wire100 = {$unsigned({(!(-wire97))}),
                       $signed((($unsigned(wire7) ^ wire7[(1'h1):(1'h1)]) ?
                           (wire94 <<< (wire7 >> wire6)) : ((^wire93) ?
                               wire96 : wire7)))};
  assign wire101 = ((|{(^~(7'h41)),
                           ($unsigned(wire99) ? (8'hbf) : (wire6 + wire5))}) ?
                       wire0 : ({wire93} ?
                           ($unsigned($signed(wire97)) > $unsigned(wire4[(4'hf):(2'h3)])) : (($unsigned(wire95) ?
                               wire1[(3'h5):(1'h1)] : wire2[(3'h5):(3'h5)]) ^~ $signed($unsigned(wire0)))));
  assign wire102 = wire3;
  assign wire103 = wire1;
  always
    @(posedge clk) begin
      reg104 <= wire7;
      reg105 <= {wire96,
          {$signed((wire99 ? wire102 : (~|wire97))),
              ($signed($signed((8'hae))) & wire7[(1'h0):(1'h0)])}};
    end
  assign wire106 = (!(~|wire97[(1'h0):(1'h0)]));
  assign wire107 = $signed((({$unsigned(wire103),
                       wire7} <<< ($unsigned(wire101) >>> $unsigned(wire103))) < wire97));
  assign wire108 = $unsigned((~^((wire99[(3'h6):(3'h4)] < (8'haa)) + $unsigned(wire91[(4'hd):(4'ha)]))));
  assign wire109 = $signed((~^wire91[(4'he):(2'h2)]));
  always
    @(posedge clk) begin
      if (($signed(($signed((-wire99)) >>> (8'ha4))) + wire7))
        begin
          if (wire99)
            begin
              reg110 <= $signed(wire91[(1'h1):(1'h0)]);
              reg111 <= $unsigned({$signed($unsigned((wire107 && (8'ha7)))),
                  $unsigned(($signed(wire100) ?
                      wire6[(4'hc):(3'h4)] : (wire97 ? wire107 : wire97)))});
              reg112 <= (8'ha0);
              reg113 <= ((+$unsigned(wire4)) ?
                  (wire6 * {$unsigned(wire106[(2'h2):(1'h1)])}) : $signed($signed(wire100[(3'h5):(2'h3)])));
              reg114 <= wire6[(2'h3):(2'h2)];
            end
          else
            begin
              reg110 <= $signed(wire97[(1'h0):(1'h0)]);
              reg111 <= ($unsigned((wire102[(2'h3):(1'h0)] ?
                  $signed((reg112 ?
                      wire4 : wire102)) : $signed(reg104))) != (+(~(wire109 ?
                  (wire98 ? wire106 : reg114) : $unsigned(reg114)))));
              reg112 <= $signed({(reg114 & (~^(8'ha5))), reg110});
              reg113 <= wire108;
              reg114 <= ($signed(wire99[(3'h7):(3'h5)]) ?
                  ((~^$signed(wire94[(3'h7):(2'h2)])) ?
                      (-(~&wire91)) : reg111) : {(reg111 ?
                          wire107[(3'h5):(2'h2)] : (wire98[(3'h5):(3'h4)] <= $signed(wire103)))});
            end
          if ((7'h40))
            begin
              reg115 <= (wire95 & $unsigned(wire100));
              reg116 <= $signed((~^(&$unsigned({wire103}))));
              reg117 <= (((~&$signed($unsigned(wire3))) >= wire98) & $signed($signed($signed(wire6))));
              reg118 <= (~|(-reg115));
              reg119 <= ((^(wire95[(1'h1):(1'h0)] ?
                  ((wire6 || wire93) << (wire96 | wire106)) : wire6[(1'h0):(1'h0)])) >> $signed($signed((8'hb0))));
            end
          else
            begin
              reg115 <= (((+(~&(reg111 ?
                      wire98 : reg119))) || (+reg105[(2'h2):(1'h1)])) ?
                  wire109 : ((~&$signed(wire2)) ^~ (wire95 & (8'ha4))));
            end
        end
      else
        begin
          reg110 <= {reg118};
          reg111 <= $signed($unsigned(reg104[(1'h1):(1'h1)]));
          reg112 <= {({$signed((wire95 <= wire97)),
                  wire100} == $unsigned(({reg119, reg116} >>> wire106))),
              wire107[(4'he):(4'hb)]};
          reg113 <= (&wire94);
          reg114 <= $signed((|$unsigned(wire98)));
        end
      if ({$unsigned(reg104[(4'he):(3'h4)])})
        begin
          reg120 <= ((&$unsigned({wire0[(1'h0):(1'h0)],
                  (wire107 ? wire0 : wire102)})) ?
              {(~^(~$signed(wire101))), $signed(reg119)} : $unsigned(wire95));
          reg121 <= {((~&($unsigned(reg114) ?
                      (wire107 ? wire6 : (8'ha9)) : $unsigned(reg116))) ?
                  wire4 : (-wire3))};
        end
      else
        begin
          reg120 <= wire102[(1'h0):(1'h0)];
          reg121 <= $unsigned($signed($signed({wire107[(4'h8):(3'h5)],
              wire4[(3'h6):(1'h0)]})));
          reg122 <= (~|$unsigned(wire94));
          reg123 <= {((~|wire98) >> wire91)};
          reg124 <= (($unsigned($unsigned($signed((8'ha7)))) ?
              ($unsigned(((8'ha8) + wire106)) | $unsigned((reg116 ?
                  wire99 : reg113))) : ((^~wire99[(2'h2):(1'h1)]) ?
                  reg110 : $signed($signed(reg116)))) ^ (((wire91 >>> reg115[(1'h1):(1'h1)]) && ($signed(wire6) << (8'haf))) ?
              $signed($signed(wire4)) : reg120));
        end
      if ((~^$unsigned($signed($signed((reg121 | wire4))))))
        begin
          if (reg114[(2'h2):(2'h2)])
            begin
              reg125 <= $signed(wire1[(4'hf):(4'hb)]);
              reg126 <= (reg113 ?
                  (wire106 - {{reg122},
                      (8'h9e)}) : $signed($unsigned(wire100)));
              reg127 <= (($unsigned((|$signed(reg120))) ?
                  (|{(reg120 == (8'hb9)), reg110}) : (({wire96} ?
                          (^reg119) : (~^wire91)) ?
                      $unsigned((wire5 ?
                          wire6 : reg117)) : $signed($signed(wire93)))) << reg125);
            end
          else
            begin
              reg125 <= $unsigned({{(~wire5), {(^~reg115)}}, wire98});
            end
          reg128 <= (8'hb1);
        end
      else
        begin
          reg125 <= ((~&$signed((8'haa))) ?
              (7'h43) : ($unsigned($unsigned((wire3 ? (7'h41) : (8'h9c)))) ?
                  (((+reg125) ~^ wire3[(4'hd):(4'hc)]) >>> ((~^reg128) == {reg104,
                      wire91})) : ($unsigned((wire103 ~^ (8'ha6))) ?
                      (~$unsigned(wire0)) : (8'hab))));
        end
      reg129 <= $unsigned((~|(&$signed($signed(reg127)))));
      if ({$signed($unsigned(((reg112 * wire103) < (~|reg129))))})
        begin
          if ((~&$signed(((|(reg104 || reg116)) ^~ ((~|(8'ha5)) ?
              $signed(wire94) : (wire106 ? (8'hb3) : wire91))))))
            begin
              reg130 <= $signed(reg122);
              reg131 <= ((wire96[(3'h6):(3'h4)] ?
                  (~|$unsigned((^~wire0))) : $unsigned(reg115)) * $signed(($unsigned($unsigned(reg120)) ?
                  $unsigned((wire106 <<< wire98)) : ((reg119 ?
                          wire5 : (8'hb2)) ?
                      {(8'hb7), (8'hbd)} : $unsigned(wire91)))));
            end
          else
            begin
              reg130 <= (($signed(((wire106 ? reg105 : wire108) ?
                      $unsigned(reg114) : wire3)) == $unsigned(((~^reg115) <<< wire7))) ?
                  (|(&wire7)) : reg120[(4'h8):(4'h8)]);
              reg131 <= wire95;
              reg132 <= (($unsigned(reg120[(3'h7):(3'h6)]) ?
                  $signed(($unsigned(wire95) >> $signed(wire109))) : ((reg123 + wire2) ?
                      $unsigned(wire96) : (wire93[(1'h0):(1'h0)] + {(8'ha3),
                          wire95}))) && $signed((~|$unsigned((~^reg110)))));
              reg133 <= wire108[(2'h3):(1'h0)];
              reg134 <= wire0[(1'h1):(1'h1)];
            end
          reg135 <= ((wire7 ^ $signed(reg111)) ?
              wire0[(1'h0):(1'h0)] : reg115[(3'h7):(2'h3)]);
          reg136 <= $unsigned(((-(-(reg119 ?
              reg129 : wire93))) || wire100[(5'h13):(5'h12)]));
        end
      else
        begin
          reg130 <= wire100[(4'h8):(2'h3)];
          reg131 <= (+{wire95, (~^wire101[(3'h4):(2'h3)])});
        end
    end
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h25d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire87,
                 wire74,
                 wire58,
                 wire55,
                 wire53,
                 wire51,
                 wire49,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg52,
                 reg54,
                 reg56,
                 reg57,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 (1'h0)};
  assign wire14 = wire13[(4'hd):(3'h6)];
  assign wire15 = (wire12 ?
                      (~&wire14[(2'h3):(1'h0)]) : ((((7'h41) > $unsigned(wire12)) ?
                              {(wire9 && wire14)} : $unsigned(wire14)) ?
                          $unsigned($signed((8'haf))) : $signed(wire12[(1'h0):(1'h0)])));
  assign wire16 = {wire13};
  assign wire17 = $unsigned(wire14[(2'h2):(1'h1)]);
  assign wire18 = ({wire11, (8'h9c)} ?
                      wire11 : ($signed(wire14[(3'h5):(3'h5)]) ?
                          (!((wire15 & wire16) | $signed((8'h9e)))) : (~((wire15 ?
                                  wire9 : (8'hb7)) ?
                              wire15 : (8'hb6)))));
  assign wire19 = (-$unsigned(wire16));
  always
    @(posedge clk) begin
      if ($signed(wire18[(2'h3):(2'h3)]))
        begin
          reg20 <= ((((+(wire10 < wire12)) ?
              wire17[(3'h5):(1'h1)] : (-{wire18})) ~^ wire9[(2'h3):(1'h1)]) ~^ $signed((($signed(wire17) + $unsigned(wire13)) | (&(wire14 > (8'ha7))))));
        end
      else
        begin
          if ({wire14[(1'h0):(1'h0)], $signed({wire19[(3'h4):(2'h2)]})})
            begin
              reg20 <= wire11;
            end
          else
            begin
              reg20 <= wire19;
              reg21 <= wire11[(1'h0):(1'h0)];
            end
          if ($signed(wire16))
            begin
              reg22 <= {reg21};
              reg23 <= $unsigned({$unsigned(wire10[(2'h2):(1'h1)]), wire15});
              reg24 <= (wire17[(4'he):(1'h1)] == $signed(reg20));
              reg25 <= $signed(wire18[(1'h1):(1'h0)]);
              reg26 <= (^~(reg25 ?
                  ({(reg22 == wire11),
                      ((8'hba) <<< wire16)} <= ($unsigned((8'hbd)) <= (reg23 > reg25))) : $unsigned(((reg25 ?
                      reg22 : reg25) + (^wire18)))));
            end
          else
            begin
              reg22 <= wire13;
              reg23 <= ({({wire9} >= $unsigned($signed(reg26))),
                      $signed({reg25[(1'h0):(1'h0)],
                          ((8'ha1) ? reg21 : (8'ha3))})} ?
                  ((+$signed((8'ha1))) >> (({reg20} ?
                      $unsigned(wire11) : {reg23,
                          reg24}) >>> ({reg26} || $signed(wire17)))) : ($unsigned(wire10) ?
                      $unsigned({$signed(wire15)}) : reg20));
              reg24 <= wire11[(3'h4):(1'h0)];
              reg25 <= $unsigned((((^wire19) - $unsigned((~^(8'h9d)))) ?
                  (~|{$unsigned(wire11), reg23}) : reg20));
              reg26 <= (^~(($unsigned((wire19 ? (8'hb5) : wire17)) ~^ (&(reg22 ?
                      wire16 : reg23))) ?
                  {((wire12 ^~ wire16) ?
                          {reg20} : (wire13 << reg23))} : $unsigned((~wire18[(3'h6):(3'h6)]))));
            end
          reg27 <= (reg23[(1'h0):(1'h0)] ?
              ((8'hab) ^~ wire9[(3'h7):(1'h0)]) : (($unsigned((wire13 - reg21)) | ((reg25 ?
                      (7'h43) : wire18) <<< (reg21 & reg23))) ?
                  $signed(((wire10 ^~ reg25) || reg20)) : wire17));
        end
      if ((reg22[(4'h9):(4'h8)] > $signed((8'hb5))))
        begin
          reg28 <= (8'had);
          reg29 <= wire11[(2'h3):(2'h2)];
          if (($unsigned(wire17) || (^~({(reg23 ?
                  wire18 : wire13)} >= (~&(wire10 ~^ wire14))))))
            begin
              reg30 <= $signed(((+(!(reg20 ? (8'hba) : reg20))) ?
                  reg25[(2'h2):(1'h0)] : $signed({{(8'hac), wire14}})));
              reg31 <= (((($unsigned(wire10) ^~ ((8'hb5) ?
                      (8'hae) : wire18)) > (~$unsigned(reg27))) ?
                  (reg21 ?
                      {(8'hbb)} : (~(reg23 ?
                          wire10 : reg29))) : (^(8'ha5))) ^~ wire15);
            end
          else
            begin
              reg30 <= wire12;
              reg31 <= reg20[(3'h7):(3'h5)];
              reg32 <= (~&wire18[(2'h3):(1'h0)]);
              reg33 <= reg21[(4'h8):(2'h2)];
            end
        end
      else
        begin
          reg28 <= reg24;
        end
    end
  module34 #() modinst50 (.wire38(reg20), .clk(clk), .wire35(wire19), .wire36(reg31), .wire37(wire11), .y(wire49));
  assign wire51 = $signed($signed(reg31[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg52 <= $unsigned(reg24[(2'h3):(1'h0)]);
    end
  assign wire53 = (-$unsigned((8'hb6)));
  always
    @(posedge clk) begin
      reg54 <= $signed(reg25);
    end
  assign wire55 = (+reg28[(5'h10):(4'h9)]);
  always
    @(posedge clk) begin
      if (((+(-(reg27 ? (+wire15) : $unsigned(wire12)))) ?
          (8'hac) : ((8'hae) ?
              reg54[(3'h5):(1'h1)] : (($unsigned(reg21) ?
                  reg21[(3'h5):(1'h0)] : (&reg33)) >= ((8'hbd) ?
                  (~^reg52) : wire11[(2'h2):(2'h2)])))))
        begin
          reg56 <= reg23[(3'h4):(2'h2)];
        end
      else
        begin
          reg56 <= wire55;
          reg57 <= wire18[(1'h0):(1'h0)];
        end
    end
  assign wire58 = wire55;
  always
    @(posedge clk) begin
      reg59 <= ({(^~$signed((wire53 ? reg31 : wire19))),
              $signed($unsigned($unsigned(wire58)))} ?
          (reg27 ?
              {reg33[(2'h3):(1'h1)],
                  $unsigned($unsigned(reg26))} : $signed(reg29)) : $unsigned($signed(($signed(reg56) ~^ reg26))));
      reg60 <= $unsigned(wire51[(2'h3):(1'h0)]);
      reg61 <= {{$signed(((wire53 ? wire9 : wire16) && (reg56 << reg52)))}};
      reg62 <= (wire51 > $unsigned({reg29[(1'h1):(1'h1)]}));
      reg63 <= (({{reg52[(2'h2):(1'h0)], (~(8'ha0))}} ?
              reg31 : $unsigned((~&$unsigned((8'hb3))))) ?
          (8'hb7) : reg28[(4'ha):(3'h7)]);
    end
  always
    @(posedge clk) begin
      reg64 <= (($signed((&$unsigned(wire16))) ?
          wire58[(4'he):(4'ha)] : ((+$unsigned(wire51)) ?
              ($signed(wire58) ?
                  reg56 : $signed((8'hb1))) : ($unsigned(wire49) ?
                  $signed((8'hab)) : (~&reg28)))) & reg28[(4'h8):(4'h8)]);
      reg65 <= ((reg31 ?
          $unsigned((|(wire10 ? reg25 : reg28))) : {(-(&(8'h9e)))}) <= (8'hb5));
      if (wire9)
        begin
          reg66 <= (8'hae);
          reg67 <= (((8'ha2) ?
              $unsigned(reg22) : $unsigned(reg57[(1'h0):(1'h0)])) >> reg61);
          reg68 <= {(!reg65[(3'h5):(1'h1)]), reg25[(1'h0):(1'h0)]};
          reg69 <= (($unsigned((^$unsigned(reg63))) ? reg30 : reg27) ?
              ((|(wire10[(1'h0):(1'h0)] * (&reg32))) ^~ wire16) : {$signed($signed($signed(reg62)))});
          reg70 <= ($unsigned($unsigned(wire49[(3'h5):(2'h3)])) != $unsigned((~|{reg22[(3'h5):(1'h1)]})));
        end
      else
        begin
          reg66 <= {$unsigned({wire12, {(~^reg26), (reg70 ? (8'hba) : reg70)}}),
              reg64};
          reg67 <= reg54[(2'h2):(2'h2)];
          if (wire15[(2'h3):(1'h1)])
            begin
              reg68 <= reg60;
              reg69 <= ({wire55[(4'h8):(3'h4)]} <<< $signed(wire16));
              reg70 <= wire53[(2'h3):(2'h2)];
              reg71 <= reg52;
              reg72 <= wire58[(2'h3):(2'h3)];
            end
          else
            begin
              reg68 <= $unsigned(reg59);
            end
        end
      reg73 <= reg32;
    end
  assign wire74 = $signed($unsigned((reg32[(1'h1):(1'h1)] ?
                      ((wire55 != (8'hbe)) ?
                          wire53 : $signed(reg60)) : {(reg66 ? reg69 : wire18),
                          $unsigned(reg52)})));
  module75 #() modinst88 (wire87, clk, reg71, reg67, wire14, wire51, reg25);
  assign wire89 = ({((reg62 >= reg33) ?
                              $signed($signed(reg72)) : ($signed(wire53) ?
                                  $unsigned(wire53) : (~&reg52))),
                          $unsigned(((~|reg24) <= ((8'ha4) ? reg70 : reg22)))} ?
                      ($unsigned(((wire12 ? reg33 : wire58) ?
                          $unsigned(reg63) : (~&reg24))) & wire11[(4'h9):(2'h2)]) : wire11);
  assign wire90 = (8'haf);
endmodule

module module75
#(parameter param86 = (|(((|((8'ha6) ? (8'hb6) : (8'hbb))) ? (-((8'ha5) & (8'hbf))) : (((8'ha6) ~^ (7'h43)) ? ((7'h43) ? (8'h9d) : (8'hbc)) : ((8'ha2) + (8'ha0)))) ? ((~&((8'hbb) << (8'hab))) + (7'h44)) : ((((8'ha8) <= (8'hbb)) || ((8'ha5) ? (8'hb8) : (8'hbd))) ? ((8'ha9) ? (|(8'h9e)) : ((8'hb1) + (7'h41))) : (8'ha1)))))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire80;
  input wire [(3'h5):(1'h0)] wire79;
  input wire signed [(2'h2):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire signed [(5'h10):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire [(4'hc):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire81;
  assign y = {wire85, wire84, wire83, wire82, wire81, (1'h0)};
  assign wire81 = ($unsigned($signed({$unsigned(wire80), ((8'ha6) - wire79)})) ?
                      wire76[(4'h9):(3'h5)] : wire77);
  assign wire82 = wire78[(1'h1):(1'h0)];
  assign wire83 = $unsigned(wire78);
  assign wire84 = wire76;
  assign wire85 = (~^$unsigned(({{wire80, wire76},
                      (~&wire76)} | {$unsigned(wire84), $signed(wire84)})));
endmodule

module module34
#(parameter param48 = {({{(^(8'ha3))}} ? ((-((8'hba) <<< (8'ha7))) ? {(~|(7'h40)), (^~(8'ha3))} : (7'h44)) : ((+{(8'hbe), (8'ha6)}) ? ((+(7'h40)) ? ((8'haf) ? (8'hab) : (8'hb0)) : ((8'had) * (8'h9f))) : (((8'hb1) ? (8'hb8) : (8'hb6)) ? ((8'h9c) ? (7'h43) : (8'h9d)) : (+(8'hbd))))), (((((8'ha5) ? (8'ha4) : (8'hbf)) ? ((8'h9e) ? (7'h41) : (8'hb8)) : ((8'haa) ? (8'hae) : (7'h41))) ? ((~^(8'hbb)) ? {(8'hb5)} : ((8'hbb) <<< (8'hb0))) : (^((8'hbe) ? (8'ha2) : (8'hac)))) ? ((((8'hbb) ? (8'ha8) : (8'haf)) - ((8'hae) && (8'hae))) ? (-{(8'hb4)}) : (((8'hb7) == (8'h9c)) ? (^~(8'hb8)) : ((8'hb8) ? (8'hbf) : (8'hb5)))) : (&((-(8'hac)) >>> ((8'hb4) >= (8'hb1)))))})
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire signed [(2'h3):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  reg signed [(4'he):(1'h0)] reg39 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= $signed(wire36);
    end
  assign wire40 = ($unsigned(reg39[(4'hd):(3'h7)]) ?
                      (($unsigned($signed(wire37)) || $signed((~|wire36))) ?
                          $unsigned({$signed(wire35)}) : wire36) : $unsigned($unsigned((^wire38[(1'h1):(1'h1)]))));
  assign wire41 = reg39;
  assign wire42 = ({$signed($unsigned({reg39})),
                          ((wire35[(3'h4):(1'h0)] ?
                              wire35 : wire38) * $signed(wire35))} ?
                      (wire35[(3'h6):(3'h4)] - $signed($unsigned((~&(8'hbd))))) : (~^((8'ha8) ^~ $signed((~(8'hb4))))));
  assign wire43 = wire42;
  assign wire44 = $signed($signed((~|$unsigned(wire40))));
  assign wire45 = ((|$signed(((-wire44) | $unsigned(wire41)))) <= (reg39[(4'ha):(4'h9)] + $unsigned((wire42 ?
                      $signed((8'hbc)) : {(8'hb2), wire36}))));
  assign wire46 = ((wire41 ?
                      {((wire37 ? reg39 : wire38) ^ wire42)} : (^((wire38 ?
                              wire43 : wire36) ?
                          (wire40 * wire35) : wire45))) >> (wire40 == wire42));
  assign wire47 = wire35[(2'h3):(1'h0)];
endmodule
