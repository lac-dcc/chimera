module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(3'h4):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire signed [(3'h4):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire122;
  wire [(3'h5):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire119;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire117;
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire119,
                 wire12,
                 wire13,
                 wire117,
                 reg120,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned((!wire4[(1'h0):(1'h0)])) ?
          $unsigned(($unsigned(wire0) != {$unsigned(wire0)})) : $unsigned({(&$unsigned(wire3)),
              wire2})))
        begin
          reg5 <= (+$signed(wire0));
          reg6 <= $signed(wire2[(2'h3):(2'h3)]);
          reg7 <= wire4;
          reg8 <= $unsigned(reg7);
        end
      else
        begin
          reg5 <= $unsigned(reg7);
        end
      reg9 <= (wire1[(4'hc):(3'h7)] ~^ (-$unsigned(reg5)));
      reg10 <= wire1[(3'h6):(2'h3)];
      reg11 <= $signed($signed(reg9[(4'hc):(1'h0)]));
    end
  assign wire12 = $signed(wire4[(2'h2):(1'h0)]);
  assign wire13 = reg11[(4'h8):(2'h2)];
  module14 #() modinst118 (wire117, clk, wire12, reg7, wire0, wire4, reg10);
  assign wire119 = (~&({((reg9 < wire1) ?
                               ((8'h9f) ?
                                   wire1 : reg7) : wire13[(2'h3):(1'h0)]),
                           wire13[(2'h3):(1'h0)]} ?
                       ($unsigned({reg7, wire0}) & reg10) : (7'h42)));
  always
    @(posedge clk) begin
      reg120 <= {$unsigned((wire3 ?
              $signed($unsigned(wire3)) : ({wire117,
                  reg10} ~^ $signed((8'hae)))))};
    end
  assign wire121 = (+{reg5[(3'h6):(3'h4)]});
  assign wire122 = $unsigned(wire2[(2'h2):(1'h0)]);
  assign wire123 = (~|{{(+{reg5})}});
  assign wire124 = (+$signed($unsigned(reg8)));
  assign wire125 = reg5[(4'h9):(3'h6)];
  assign wire126 = wire124;
  assign wire127 = (({($signed((8'h9d)) >>> $signed(reg10))} ?
                       $unsigned(($signed(wire2) ?
                           wire117 : {wire4})) : ((~&(^~wire117)) >> $signed((|(8'h9e))))) ~^ wire0[(4'ha):(2'h2)]);
endmodule

module module14
#(parameter param116 = (8'h9d))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire20;
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire25,
                 wire20,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg96,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = ({(($unsigned(wire19) ?
                          wire15[(3'h4):(1'h1)] : (wire16 ?
                              wire19 : wire15)) | wire17[(1'h1):(1'h0)])} ^ ((~|$signed($unsigned(wire15))) << wire19[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg21 <= (8'h9e);
      reg22 <= wire17;
      reg23 <= $unsigned((wire16 == ($unsigned(wire18) ?
          $signed(wire19[(3'h4):(1'h0)]) : $unsigned((wire15 | reg21)))));
      reg24 <= $unsigned((reg23 ?
          wire20[(3'h5):(1'h0)] : (wire18[(3'h4):(3'h4)] <= (reg22[(3'h7):(1'h1)] ?
              (wire19 ? (8'haf) : wire20) : $signed(wire18)))));
    end
  assign wire25 = (|{reg21});
  module26 #() modinst81 (wire80, clk, wire20, wire19, wire18, wire25);
  assign wire82 = wire15;
  assign wire83 = $unsigned(((wire18 < reg22) ? {$signed((+wire80))} : wire25));
  assign wire84 = ((wire82[(3'h5):(3'h4)] ?
                          $unsigned($signed($unsigned(wire82))) : ((+((8'h9f) == wire17)) + (&$signed(reg21)))) ?
                      wire20 : $unsigned(wire15[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg85 <= (~wire82[(2'h2):(1'h1)]);
      reg86 <= ($unsigned((wire15 > wire84)) ^ wire83[(3'h6):(1'h0)]);
      if ($unsigned((($unsigned(reg86[(4'hc):(4'h9)]) ^ (((8'hbe) ?
          wire18 : (8'ha6)) && (wire16 ~^ wire84))) ~^ $unsigned(wire16[(4'hd):(2'h3)]))))
        begin
          reg87 <= {(($unsigned(reg85[(5'h13):(1'h1)]) ?
                      (~|$unsigned(reg21)) : (~(reg21 >> (8'hba)))) ?
                  $unsigned({(-wire20)}) : reg21[(2'h3):(2'h2)]),
              ($unsigned(wire20[(4'hc):(2'h2)]) ? wire82 : reg21)};
          reg88 <= wire16;
        end
      else
        begin
          if (reg21)
            begin
              reg87 <= reg86;
            end
          else
            begin
              reg87 <= $signed(($signed((!$unsigned(reg22))) <= (((!wire83) ?
                  reg88 : wire84) ^~ reg24[(3'h5):(1'h0)])));
              reg88 <= reg86[(4'hc):(4'h9)];
            end
          if ((~|reg86[(3'h6):(2'h3)]))
            begin
              reg89 <= ((wire18[(2'h2):(1'h0)] > ($signed($unsigned(wire83)) << $unsigned((reg21 ~^ reg88)))) != ($signed($unsigned(reg24)) ?
                  wire80 : (($unsigned(wire80) ?
                          (wire25 && wire19) : (reg88 ? wire80 : wire83)) ?
                      $unsigned(wire82[(3'h5):(2'h3)]) : wire18)));
              reg90 <= wire20;
              reg91 <= (^~wire80);
              reg92 <= (((wire19 < {(reg86 ? reg23 : (8'haf))}) ?
                  {(~wire19),
                      wire16} : (^wire80)) != $unsigned((reg24[(3'h5):(3'h4)] ?
                  ($signed(wire20) ?
                      $signed(wire84) : (reg91 ?
                          (8'hbe) : reg89)) : $unsigned((wire25 >= wire15)))));
              reg93 <= ($unsigned((($signed((8'ha4)) + (!wire82)) < ((wire25 ?
                  wire82 : reg21) || (reg88 ?
                  reg90 : (7'h42))))) | ((wire18 == $signed((reg90 + wire18))) >> (((~|reg88) == (^~wire83)) ?
                  {(-reg85)} : ($unsigned(reg89) ?
                      $unsigned(wire82) : $signed((8'haf))))));
            end
          else
            begin
              reg89 <= (-$unsigned((~^$unsigned(reg93))));
              reg90 <= $signed({reg89, $unsigned(reg24[(2'h2):(2'h2)])});
            end
          if ($unsigned((((~^wire17) ?
                  {$signed(reg86), (-(7'h44))} : $signed((wire20 ?
                      reg91 : reg86))) ?
              {(wire80 ? {reg88, reg91} : (reg21 <= (8'ha0))),
                  reg87[(3'h7):(1'h0)]} : reg87[(4'h9):(3'h7)])))
            begin
              reg94 <= {{($unsigned(((8'ha1) ? wire16 : wire19)) ?
                          (+(reg22 > wire17)) : $signed((wire82 < reg21))),
                      ((reg21[(4'ha):(3'h4)] >> reg92[(4'h8):(4'h8)]) ?
                          (+(+wire25)) : ($signed((8'hb8)) || (reg21 ?
                              reg91 : reg86)))}};
              reg95 <= {$signed({((reg94 ? wire83 : (8'h9f)) ?
                          reg94[(1'h1):(1'h0)] : $signed((8'hbf))),
                      $unsigned((reg90 | reg94))}),
                  reg93};
            end
          else
            begin
              reg94 <= wire18[(3'h7):(1'h0)];
            end
        end
      reg96 <= reg91[(5'h10):(4'h8)];
    end
  assign wire97 = reg85[(4'h9):(3'h5)];
  assign wire98 = $signed($unsigned({$unsigned((reg85 == wire25))}));
  assign wire99 = $unsigned(((&$signed($signed(wire97))) >> $unsigned(wire80)));
  assign wire100 = reg90[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if (((^((reg85[(5'h10):(3'h5)] == $signed(wire99)) ?
              (((7'h41) << reg88) >> wire18[(3'h7):(1'h0)]) : reg86)) ?
          ($unsigned(((reg86 * reg89) ?
              {wire82} : (!(8'hb8)))) > ({$unsigned(reg24)} ?
              (^~reg87[(3'h4):(1'h1)]) : $signed($unsigned(reg90)))) : $unsigned($unsigned({reg23,
              (reg85 + (8'haa))}))))
        begin
          reg101 <= ($signed(({(reg88 - reg91)} | wire18)) ?
              (((|reg22) ? reg96[(3'h7):(3'h4)] : reg95[(3'h4):(2'h2)]) ?
                  $unsigned(reg21[(4'h9):(1'h1)]) : (~|$unsigned((~&wire18)))) : {($unsigned((wire15 ?
                      reg92 : reg92)) * $unsigned($unsigned(wire80)))});
        end
      else
        begin
          reg101 <= wire98;
          reg102 <= $unsigned(({($signed(reg86) ?
                      $signed(wire99) : $unsigned(reg101))} ?
              ($unsigned((~reg95)) >> $signed((~^wire25))) : (($signed((8'ha6)) ?
                  {wire80,
                      (8'hae)} : (reg22 & reg86)) <<< $signed(wire17[(3'h6):(2'h3)]))));
        end
      reg103 <= (reg24 - ($signed(wire97[(2'h3):(1'h1)]) + ((~|(wire97 ?
          wire19 : wire19)) || (reg21[(3'h5):(3'h5)] ?
          $signed(wire80) : $unsigned(wire100)))));
      if ((|wire16[(5'h11):(1'h0)]))
        begin
          reg104 <= $signed(reg87[(4'ha):(3'h7)]);
          reg105 <= (((^(~^$unsigned(reg86))) ?
              $signed(((reg91 != wire17) ?
                  (wire82 ?
                      reg92 : wire18) : $signed(wire84))) : reg86) <<< $unsigned(({{(8'ha5)}} | {(wire99 != reg95)})));
          reg106 <= ((8'hb7) ?
              wire98 : ((((^wire25) ?
                  $signed(wire15) : $unsigned(reg21)) <= reg24[(4'ha):(3'h6)]) * ((8'ha1) ?
                  $unsigned(wire84) : reg103)));
        end
      else
        begin
          reg104 <= (-(8'hbf));
          reg105 <= ($signed($signed(((wire15 ? reg22 : reg90) ?
              ((8'hb8) ? wire98 : wire83) : wire16))) ~^ $unsigned(reg92));
          reg106 <= {(($unsigned((+wire25)) >= (~^(reg23 >= reg90))) ~^ {reg106[(3'h4):(2'h2)]}),
              ($signed(({wire25} * $signed(reg22))) ?
                  $signed((wire16 ?
                      (reg88 ?
                          reg90 : reg92) : $unsigned(reg90))) : wire84[(1'h0):(1'h0)])};
          reg107 <= ($unsigned($signed(((reg91 >>> wire16) || (wire99 ?
              reg89 : reg94)))) > (({reg101,
              (wire15 > wire82)} >>> reg92) && ($unsigned((wire84 ?
              wire16 : reg23)) * (-(reg87 + reg92)))));
          if (reg85[(5'h10):(5'h10)])
            begin
              reg108 <= ((^$unsigned({{reg102}})) ?
                  $unsigned($unsigned(((reg87 == wire100) >> (-reg103)))) : reg23);
              reg109 <= $signed($signed($unsigned(((|wire18) ^~ (wire15 ?
                  reg23 : reg23)))));
              reg110 <= reg87[(2'h2):(1'h1)];
            end
          else
            begin
              reg108 <= ((+($signed((8'haa)) ?
                      ((^wire100) ?
                          (!reg91) : $signed((8'ha8))) : ((reg86 && reg22) ?
                          ((8'hb7) - reg92) : (^~reg102)))) ?
                  $signed($unsigned(reg110[(1'h1):(1'h0)])) : ($signed($unsigned($signed((8'ha2)))) ?
                      (!$unsigned(((8'hb5) == wire20))) : wire84));
              reg109 <= $signed((~&$signed(wire17[(3'h6):(3'h4)])));
              reg110 <= $signed($unsigned((reg104 ?
                  ((reg109 + (8'hbb)) > $signed(wire100)) : (^~reg85))));
              reg111 <= $unsigned(((reg106 | $signed($unsigned(reg94))) ?
                  {wire83[(3'h4):(1'h0)]} : $signed({reg88[(4'hc):(4'hc)],
                      wire80[(2'h2):(1'h0)]})));
            end
        end
      reg112 <= {{(reg109[(3'h6):(2'h2)] ?
                  $signed($unsigned(reg108)) : $signed(wire17[(2'h2):(2'h2)]))}};
      reg113 <= $signed((^~reg91[(3'h5):(2'h2)]));
    end
  assign wire114 = (~(!$unsigned($unsigned($signed(reg104)))));
  assign wire115 = $unsigned($unsigned($unsigned((!$unsigned(reg106)))));
endmodule

module module26
#(parameter param78 = (((~|(^~(&(8'ha2)))) >>> (({(8'h9e), (8'hbc)} ? (&(8'hbb)) : {(8'h9c), (7'h42)}) ? (((7'h43) << (8'h9c)) != ((8'haa) == (7'h40))) : (-((8'hb4) & (7'h42))))) ? ((((&(8'hbb)) <<< ((8'hb3) | (8'ha5))) ? ((^(8'hbd)) >>> (+(8'hb3))) : (~&(~&(8'hb5)))) <<< {(((7'h41) ? (7'h41) : (8'hbb)) ? {(8'ha4)} : ((7'h42) ? (8'ha1) : (8'hbb))), ((8'hbc) ? (+(7'h42)) : (~&(8'hb4)))}) : ((!{(8'hab)}) ? ((((8'hba) ? (8'hba) : (8'hbb)) != {(8'hbc), (7'h40)}) ? (~^(+(8'hab))) : ((~^(8'hb2)) & ((8'h9e) << (8'hb2)))) : (((~(8'hb3)) ? ((7'h43) ? (8'hbf) : (8'hb9)) : {(8'hb2)}) > (((8'hbb) << (8'hae)) == ((7'h40) ? (8'hac) : (8'ha5)))))), 
parameter param79 = {((~^param78) | {{param78, (param78 ? param78 : (8'hb1))}}), (~{(param78 ? ((8'ha9) * param78) : (param78 > param78))})})
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire28;
  input wire [(4'he):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  assign y = {wire77,
                 wire68,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire31 = ((wire29[(4'ha):(4'h9)] ?
                      ((8'h9c) ?
                          (wire28 ?
                              (7'h40) : (wire30 && wire29)) : {(^(7'h40))}) : {wire27}) > wire30);
  assign wire32 = $signed(wire29[(4'hb):(3'h7)]);
  always
    @(posedge clk) begin
      reg33 <= (+$signed(wire27));
      reg34 <= (~|$signed($signed($unsigned((wire31 && wire32)))));
      reg35 <= (~(({wire29[(1'h1):(1'h1)], $signed(wire30)} ?
              ({wire30, wire31} == (~&(8'hac))) : wire28[(3'h6):(2'h2)]) ?
          wire32 : (wire29 <= ((|wire27) * $signed(wire32)))));
    end
  assign wire36 = $unsigned(wire28);
  assign wire37 = $unsigned((wire31 <<< reg35[(1'h0):(1'h0)]));
  assign wire38 = {$unsigned(reg34)};
  assign wire39 = reg33;
  assign wire40 = ((~&(7'h40)) ?
                      $unsigned((~^$unsigned((wire27 < reg35)))) : (~&((8'hab) ?
                          $unsigned((reg35 ?
                              wire37 : wire32)) : $signed($signed(reg35)))));
  assign wire41 = ((reg33[(2'h3):(2'h2)] ?
                          {({reg35} ^~ $signed(wire39))} : $unsigned(reg34[(1'h0):(1'h0)])) ?
                      $signed(($unsigned((wire29 ? reg33 : wire30)) ?
                          {{(8'hb0),
                                  wire28}} : $unsigned($unsigned((8'h9c))))) : ((wire32 ?
                          wire38[(2'h3):(2'h2)] : (+$unsigned(wire30))) ~^ ($unsigned($signed(wire39)) ?
                          $signed($signed((8'ha0))) : wire29[(3'h7):(3'h4)])));
  assign wire42 = (wire36 ? $unsigned($signed((!(wire40 > (8'haf))))) : reg33);
  assign wire43 = (~|(&$unsigned(({wire38, wire36} ?
                      reg33[(3'h7):(1'h1)] : (+wire39)))));
  assign wire44 = (~^wire27[(2'h3):(1'h1)]);
  assign wire45 = {wire31[(4'hc):(4'h8)]};
  assign wire46 = wire30[(4'ha):(2'h2)];
  assign wire47 = (8'hb0);
  always
    @(posedge clk) begin
      if (({$unsigned((~&$signed(wire37)))} ? wire27 : reg35[(1'h1):(1'h0)]))
        begin
          reg48 <= $signed((!(+((^wire38) <= wire39))));
          reg49 <= wire46;
          reg50 <= ($unsigned(((wire28 ?
                  $unsigned(wire36) : wire39[(4'h9):(3'h5)]) ?
              (~(wire45 ~^ wire37)) : {$signed(wire28),
                  $signed(wire30)})) || (|($signed((&reg35)) < $unsigned(wire30[(4'he):(3'h4)]))));
          reg51 <= ($signed({((wire40 ? wire27 : reg34) ?
                  $signed(wire36) : wire32)}) || $signed(((~&wire36) ?
              ((wire45 ? reg35 : wire36) != reg35) : wire29)));
        end
      else
        begin
          reg48 <= $unsigned(($unsigned(wire28[(4'hb):(4'h9)]) + $signed(reg34)));
          reg49 <= $unsigned($unsigned((wire38[(4'hd):(3'h4)] ?
              $unsigned(reg51) : $signed((reg34 ? wire37 : reg50)))));
          reg50 <= (^{reg49, wire37[(4'hd):(2'h2)]});
          if ($signed((wire36[(3'h7):(1'h1)] ?
              ($unsigned((-wire36)) >= (8'hb3)) : {(wire29[(2'h3):(1'h1)] || {(8'hbb)})})))
            begin
              reg51 <= $signed((8'hbe));
              reg52 <= ((&(~wire47)) ?
                  (reg48 ?
                      $signed($unsigned($signed(reg49))) : (^(~^(^~wire32)))) : wire47[(4'ha):(3'h4)]);
              reg53 <= {($unsigned({$signed(wire42), $unsigned(wire42)}) ?
                      ($unsigned(reg34[(2'h2):(1'h1)]) < {(7'h44)}) : reg48[(4'h9):(4'h9)])};
              reg54 <= (~reg51[(3'h4):(2'h3)]);
              reg55 <= wire28;
            end
          else
            begin
              reg51 <= reg49;
              reg52 <= $signed(wire28);
              reg53 <= $unsigned(((((wire43 ?
                      reg49 : wire29) && wire40[(5'h10):(4'ha)]) ?
                  ($signed(wire32) ~^ wire32) : $unsigned(reg55)) == ($signed($unsigned(reg54)) ?
                  (8'haa) : reg34)));
            end
        end
      if (({((!wire39[(3'h4):(2'h2)]) ~^ $signed((wire47 * wire37)))} ?
          $signed(wire31) : ((^(wire41 ?
              ((8'ha0) && wire31) : $unsigned(wire30))) | (~&wire31))))
        begin
          reg56 <= reg34[(2'h2):(1'h0)];
          if (reg51)
            begin
              reg57 <= reg55;
              reg58 <= (+$signed(wire43));
              reg59 <= (((($signed(reg53) ?
                          (reg33 <<< reg48) : $unsigned(reg33)) ?
                      (~|(^~wire43)) : ((^wire43) ?
                          $unsigned(wire29) : ((8'hb7) >>> reg33))) != $signed($signed((^reg53)))) ?
                  reg33 : $unsigned(wire31));
              reg60 <= (~^reg57[(3'h7):(3'h7)]);
              reg61 <= $unsigned(((^reg35) ?
                  ((wire39[(2'h3):(1'h1)] - (reg58 || (8'ha3))) ?
                      $signed($unsigned(reg59)) : $signed($signed(reg33))) : reg54));
            end
          else
            begin
              reg57 <= ((($unsigned($signed(reg59)) ~^ (~&(wire42 + wire46))) >>> ((8'haf) ?
                  ((~|(8'h9c)) ? {reg49} : {reg34, wire30}) : $signed((wire28 ?
                      reg55 : reg34)))) >>> $signed(wire46));
              reg58 <= {$signed({$unsigned($signed(wire42)),
                      (&$unsigned(reg50))})};
              reg59 <= $signed((+reg51));
            end
          if ($unsigned((~|$unsigned(reg53))))
            begin
              reg62 <= reg58[(2'h2):(1'h0)];
              reg63 <= {(($signed((wire43 && wire28)) ?
                          $signed(reg33) : ((reg52 ?
                              reg59 : wire38) || $signed(wire30))) ?
                      reg48 : $unsigned($unsigned(wire36)))};
              reg64 <= {wire39, $unsigned((-(+(reg49 || wire29))))};
              reg65 <= ((^~(~&$unsigned(wire42[(4'h9):(1'h0)]))) * ((^~{$signed(wire37)}) ?
                  wire37[(1'h0):(1'h0)] : (reg50[(4'hd):(3'h6)] != wire46[(4'hf):(4'hf)])));
            end
          else
            begin
              reg62 <= $signed({reg33});
              reg63 <= {wire36[(4'h8):(3'h4)]};
            end
          reg66 <= $signed(reg63);
        end
      else
        begin
          reg56 <= $unsigned(((wire45 * ({(8'h9e)} ?
                  (reg63 ? (8'ha3) : (8'hbe)) : $unsigned(reg33))) ?
              (($unsigned(wire47) != (~&wire40)) ?
                  $unsigned((wire36 < wire40)) : reg61[(4'h9):(3'h7)]) : {(reg55 - (wire46 ?
                      reg61 : reg60)),
                  $unsigned(wire39[(4'h9):(3'h4)])}));
          reg57 <= (~^$signed(($unsigned(reg66) ?
              reg64 : (reg56 | $signed(reg58)))));
        end
      reg67 <= {(reg53[(1'h1):(1'h0)] ?
              $signed((wire32[(2'h2):(2'h2)] ^~ reg59)) : reg61),
          $signed(wire40)};
    end
  assign wire68 = $signed((^~($signed($unsigned(reg57)) & wire41)));
  always
    @(posedge clk) begin
      reg69 <= {$signed($unsigned(reg52)),
          ((~^wire44[(4'he):(3'h4)]) | wire44[(4'ha):(2'h3)])};
      reg70 <= (($unsigned(wire31) | {(&(reg56 ?
              reg57 : reg53))}) << (reg33 & (~|((~wire42) ^ (!reg63)))));
      if ({(~&{((wire29 - (8'had)) ? (~|wire44) : (wire37 <= reg35)),
              ($unsigned(wire29) <<< $signed(wire31))})})
        begin
          reg71 <= wire46[(4'h9):(1'h1)];
        end
      else
        begin
          if ($unsigned(({$signed($unsigned((7'h44)))} <<< (wire29[(3'h6):(2'h3)] ^~ ((|wire42) ?
              $unsigned(reg55) : (^~(8'hb7)))))))
            begin
              reg71 <= wire32[(2'h3):(1'h1)];
              reg72 <= wire31;
              reg73 <= wire39;
            end
          else
            begin
              reg71 <= wire39[(3'h4):(1'h0)];
              reg72 <= $unsigned($signed((wire37 ?
                  $unsigned((&wire45)) : wire68)));
              reg73 <= (~|wire44);
            end
          reg74 <= (wire47[(3'h4):(1'h0)] && $signed($unsigned(reg50[(3'h7):(3'h7)])));
          reg75 <= $unsigned(((reg72[(4'ha):(1'h0)] ?
                  ($unsigned(reg64) ?
                      wire42 : reg52[(2'h2):(1'h0)]) : ($unsigned(wire40) ?
                      $signed(reg58) : reg70[(1'h0):(1'h0)])) ?
              reg59[(4'ha):(3'h4)] : (7'h41)));
          reg76 <= reg52;
        end
    end
  assign wire77 = reg48[(3'h6):(3'h4)];
endmodule
