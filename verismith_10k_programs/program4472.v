module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire100;
  reg signed [(3'h5):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(4'hd):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(4'hc):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire100,
                 reg138,
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
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  module5 #() modinst101 (wire100, clk, wire4, wire0, wire3, wire1, wire2);
  always
    @(posedge clk) begin
      if (wire100[(5'h10):(4'hf)])
        begin
          if ($signed(wire2))
            begin
              reg102 <= (wire1[(2'h2):(1'h1)] ? wire3 : wire4);
              reg103 <= (($unsigned($signed((wire2 ? wire4 : wire2))) ?
                  $signed(reg102) : {$signed($signed(wire2))}) & {(&($signed(wire100) ?
                      wire100[(2'h2):(2'h2)] : wire100[(2'h2):(1'h0)]))});
              reg104 <= (~$unsigned($signed($signed(wire100[(5'h10):(4'ha)]))));
              reg105 <= (^wire4[(2'h2):(1'h1)]);
            end
          else
            begin
              reg102 <= wire100[(2'h2):(1'h0)];
              reg103 <= ((~^$unsigned(((wire100 ? wire3 : wire3) ?
                  wire4 : wire3))) && (-(($unsigned(wire2) ?
                      $signed(wire4) : (~|wire4)) ?
                  $signed((^reg104)) : reg102[(3'h6):(1'h0)])));
              reg104 <= ((-wire4[(2'h3):(2'h2)]) >= (reg105 ?
                  reg102[(1'h0):(1'h0)] : (^~$signed(wire100[(4'hb):(3'h5)]))));
            end
          reg106 <= {wire4, wire3[(1'h1):(1'h0)]};
          reg107 <= ($signed(({reg102[(1'h0):(1'h0)], wire3[(2'h3):(1'h0)]} ?
                  {(wire4 ? reg103 : (8'hac))} : ((wire3 ? reg102 : (8'ha4)) ?
                      {reg104, reg104} : $unsigned(wire4)))) ?
              (-(~^(+(reg105 ?
                  reg105 : reg105)))) : ($unsigned((wire100[(2'h3):(1'h1)] ?
                      {wire0} : $unsigned(reg104))) ?
                  {{$unsigned(wire100)},
                      (+{reg104})} : (~|(~&wire100[(3'h7):(2'h3)]))));
          if (reg103[(1'h0):(1'h0)])
            begin
              reg108 <= $unsigned(($unsigned(wire4) ?
                  ((~|$signed(reg105)) ?
                      $unsigned({(7'h41)}) : reg107) : (reg105 ^~ (^~wire4[(4'hb):(2'h2)]))));
              reg109 <= (reg104 ? (!$unsigned((7'h43))) : reg108);
              reg110 <= $signed((7'h42));
              reg111 <= reg109[(2'h3):(1'h0)];
              reg112 <= reg108;
            end
          else
            begin
              reg108 <= ((~&($signed(wire3) > {(reg112 + reg104)})) ^ (8'hbb));
              reg109 <= reg109;
            end
          if ((~&(reg110[(4'h8):(4'h8)] >> (-(reg111 ^ (~^(7'h40)))))))
            begin
              reg113 <= $signed(($unsigned($unsigned({reg110, wire3})) ?
                  $signed((8'hae)) : wire3));
            end
          else
            begin
              reg113 <= reg105[(4'h9):(3'h7)];
              reg114 <= (&$unsigned($unsigned((^$unsigned(reg104)))));
            end
        end
      else
        begin
          if (({(~reg107[(3'h6):(2'h2)])} || $unsigned(reg105[(4'hf):(3'h4)])))
            begin
              reg102 <= (^(wire4 ? reg109 : (!(^~(wire4 ? reg102 : reg105)))));
              reg103 <= reg109;
              reg104 <= reg108;
              reg105 <= $unsigned($unsigned($unsigned({(!wire3)})));
            end
          else
            begin
              reg102 <= $signed(reg104[(5'h12):(1'h0)]);
              reg103 <= (($unsigned({((8'hba) * wire4),
                  (8'had)}) + wire2[(2'h3):(1'h1)]) << wire1[(4'hd):(1'h1)]);
              reg104 <= ({reg103[(1'h1):(1'h1)]} ? (-(~&(8'ha0))) : {(8'hac)});
            end
          if ((!reg103))
            begin
              reg106 <= $signed(reg103[(1'h1):(1'h0)]);
              reg107 <= $unsigned(wire100[(3'h6):(3'h5)]);
            end
          else
            begin
              reg106 <= (reg108 ?
                  ($signed((+$signed(wire2))) ?
                      reg105[(2'h3):(1'h1)] : $unsigned($signed($unsigned(reg104)))) : reg102[(3'h5):(3'h4)]);
              reg107 <= reg107[(3'h5):(2'h3)];
              reg108 <= $unsigned(reg103[(2'h2):(1'h1)]);
              reg109 <= (reg104 + (^~(!$signed(wire1))));
            end
        end
      if ($unsigned(($signed((reg112 ? reg107 : (reg107 ? reg102 : reg104))) ?
          $unsigned({$unsigned(wire100)}) : wire100[(4'h8):(3'h5)])))
        begin
          reg115 <= ($unsigned($unsigned(wire3[(1'h1):(1'h1)])) < ($signed(((wire3 ?
                  reg105 : reg109) ?
              (~&reg110) : (reg107 & wire1))) - $signed(wire4)));
          reg116 <= ((($unsigned((reg106 > reg113)) ?
              (reg113[(3'h6):(3'h5)] ?
                  (reg107 ?
                      wire1 : reg115) : (^~reg104)) : wire0) | ((7'h44) <<< wire100[(3'h6):(3'h4)])) <<< reg115);
        end
      else
        begin
          reg115 <= {((wire100[(2'h3):(1'h1)] ?
                  ($signed(reg111) || {wire0}) : reg102[(2'h3):(1'h0)]) - {reg116[(1'h1):(1'h0)],
                  (wire2 ? $unsigned(reg116) : {reg106})})};
          reg116 <= $unsigned($unsigned(reg111[(4'hd):(2'h3)]));
          reg117 <= ($unsigned($unsigned(({reg106} ?
              wire0[(4'hd):(2'h2)] : wire100[(2'h2):(1'h0)]))) && wire1[(3'h5):(3'h4)]);
        end
      reg118 <= reg112[(4'h9):(3'h6)];
      if (reg118)
        begin
          reg119 <= reg106;
          reg120 <= (~($unsigned({$signed(reg108), reg119[(1'h1):(1'h0)]}) ?
              (8'ha4) : (&reg106[(1'h1):(1'h0)])));
          if ($signed($unsigned((^~(^reg119)))))
            begin
              reg121 <= {wire1[(4'h9):(2'h2)]};
              reg122 <= ($unsigned((&$signed((reg105 * reg114)))) - (~^(^((reg117 ?
                  (8'hac) : wire2) < (reg111 <<< reg105)))));
              reg123 <= (((reg104[(4'hb):(3'h6)] ?
                  (8'ha7) : $unsigned($unsigned(reg108))) >> $signed((reg102 ?
                  {reg111,
                      reg107} : wire100))) == $signed($unsigned(($signed((8'ha7)) >= reg109))));
              reg124 <= $signed($unsigned(reg123[(3'h4):(2'h3)]));
              reg125 <= reg117;
            end
          else
            begin
              reg121 <= ($signed($unsigned($unsigned(((8'h9d) ?
                  reg122 : wire3)))) ~^ (wire4 ?
                  (reg116[(3'h4):(1'h0)] ?
                      $signed($signed(reg110)) : $signed((~reg107))) : $unsigned($unsigned($signed(reg112)))));
              reg122 <= (+{(($unsigned(reg121) * $unsigned(wire100)) ?
                      $unsigned((&reg106)) : reg114)});
            end
        end
      else
        begin
          reg119 <= (({($unsigned(reg116) ? $signed(reg124) : $unsigned(wire0)),
                  ($unsigned(reg121) ?
                      reg120[(5'h11):(4'h8)] : {reg109, reg112})} ?
              ($unsigned($unsigned(reg104)) || (^~((8'hb0) ?
                  reg121 : reg108))) : (^~$signed((~|(8'hbf))))) | $unsigned(({(|wire1),
              reg119[(3'h6):(1'h0)]} && (^$signed(reg106)))));
          reg120 <= {reg117,
              ($unsigned((wire3[(4'h9):(2'h2)] ?
                      $signed((8'hb6)) : (reg103 != reg106))) ?
                  $signed(reg116) : $unsigned($signed((reg104 ?
                      reg104 : wire0))))};
          reg121 <= (reg120[(3'h7):(3'h6)] ?
              (reg115[(1'h1):(1'h1)] >> (wire3[(4'hc):(4'h8)] ?
                  reg125[(3'h7):(1'h1)] : {reg119[(2'h3):(1'h1)]})) : (^~(~|{{reg112}})));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg124[(1'h0):(1'h0)]))
        begin
          reg126 <= $unsigned(reg116[(3'h4):(1'h0)]);
        end
      else
        begin
          reg126 <= $unsigned($signed({$unsigned(((8'hb2) ? reg123 : wire4)),
              $signed(reg122)}));
          reg127 <= {$unsigned($unsigned($signed({reg103})))};
        end
      reg128 <= $signed((~(^~{$signed(reg127)})));
      reg129 <= wire0;
      if ({{(8'ha5)}})
        begin
          reg130 <= $signed($signed((wire4[(4'h9):(3'h4)] + wire1)));
          reg131 <= reg120[(1'h0):(1'h0)];
          reg132 <= reg124[(2'h2):(1'h1)];
          reg133 <= reg111;
        end
      else
        begin
          if (reg133[(1'h1):(1'h0)])
            begin
              reg130 <= (reg130[(2'h2):(1'h1)] >= $signed(reg108[(2'h3):(2'h2)]));
              reg131 <= $unsigned($signed(reg133));
              reg132 <= reg112;
              reg133 <= wire4[(4'ha):(1'h0)];
              reg134 <= {((((^(8'h9f)) ?
                          $unsigned(reg121) : reg107[(2'h3):(2'h3)]) ?
                      reg116[(1'h0):(1'h0)] : $unsigned((reg114 ?
                          reg114 : (8'h9e)))) ^~ (&reg126))};
            end
          else
            begin
              reg130 <= {(~(~^$signed($unsigned(reg106))))};
              reg131 <= ((~|({(reg107 ?
                      wire2 : reg104)} * ((reg129 > reg118) <= (reg127 >> wire100)))) - reg124[(2'h2):(2'h2)]);
              reg132 <= reg112;
            end
          reg135 <= $unsigned((~&$signed($unsigned(reg114))));
        end
    end
  assign wire136 = $signed($unsigned(reg119[(1'h0):(1'h0)]));
  assign wire137 = $signed(((reg130[(3'h6):(2'h3)] ?
                           ((reg117 | wire2) + reg122) : {(~&(8'ha0))}) ?
                       $unsigned((-(reg121 << reg130))) : $unsigned(reg133)));
  always
    @(posedge clk) begin
      reg138 <= (!wire1);
    end
endmodule

module module5
#(parameter param99 = (((+{((8'ha3) ? (8'hb8) : (8'hb4))}) >>> (({(8'haa), (8'ha2)} << (+(8'hb0))) ? ({(8'hb2), (8'hbf)} << (8'hb4)) : (((8'ha4) == (8'ha0)) < ((8'h9d) ? (8'hac) : (8'hbf))))) ? (+{(((7'h44) ? (8'hb0) : (8'haf)) ? (8'haa) : ((8'h9e) ? (8'hb2) : (8'h9d))), {((7'h43) ~^ (8'ha1))}}) : (8'had)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire78;
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire11,
                 wire12,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire78,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg88,
                 reg87,
                 reg86,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire11 = wire9[(4'hd):(1'h0)];
  assign wire12 = (^$unsigned(wire8[(3'h5):(3'h4)]));
  always
    @(posedge clk) begin
      reg13 <= $signed((~&((~$signed(wire8)) ^~ wire6)));
      reg14 <= (-wire8);
      reg15 <= $unsigned(($unsigned($signed($signed(wire9))) ?
          wire11 : ($unsigned($signed(wire12)) != ((reg14 & wire10) != $signed(wire6)))));
      reg16 <= (-(~|$signed(wire7)));
    end
  assign wire17 = (({((+wire12) ? reg13 : reg16),
                              (reg15[(3'h4):(2'h2)] <<< wire8[(4'hc):(1'h1)])} ?
                          (~|wire8[(4'h8):(3'h6)]) : (reg13 ?
                              $unsigned((wire10 - (8'hbc))) : ((wire10 ?
                                  reg13 : (8'h9c)) >> reg14[(4'hc):(1'h0)]))) ?
                      wire10 : reg14[(4'h8):(1'h0)]);
  assign wire18 = {(!$signed(wire10)), $unsigned($signed(wire9))};
  assign wire19 = (wire17[(2'h2):(1'h0)] ?
                      {wire10[(4'h9):(4'h8)]} : ($signed($signed($signed(reg16))) ?
                          wire9[(4'ha):(4'ha)] : reg13));
  assign wire20 = (^{(+(((8'h9e) ^ wire17) <<< wire18)),
                      $unsigned($signed((wire12 && wire11)))});
  assign wire21 = wire17;
  module22 #() modinst79 (.wire25(reg14), .wire26(wire11), .y(wire78), .clk(clk), .wire23(wire7), .wire24(wire8));
  assign wire80 = wire18[(1'h0):(1'h0)];
  assign wire81 = ($signed((^~(~{wire9, wire17}))) ?
                      (+(-$unsigned($unsigned(wire8)))) : (~^$signed(wire7[(3'h6):(3'h4)])));
  assign wire82 = $signed($unsigned($signed((wire78[(4'he):(3'h6)] & (|wire8)))));
  assign wire83 = $signed($signed((&$signed(wire12[(3'h5):(3'h5)]))));
  assign wire84 = reg14;
  assign wire85 = ({$unsigned($unsigned({wire82, (7'h40)})), wire11} ?
                      (wire12 <= $unsigned($signed({(8'h9d),
                          wire8}))) : (((!(wire84 + wire81)) & $unsigned(wire17[(2'h2):(2'h2)])) ?
                          (~|(-(wire17 ~^ wire81))) : (^~$unsigned($unsigned(wire20)))));
  always
    @(posedge clk) begin
      reg86 <= ((|(wire9 <= $signed((reg16 | reg13)))) ?
          wire10 : $signed(wire10));
      reg87 <= {{wire17, reg86}, (+$unsigned($unsigned($unsigned(reg86))))};
      reg88 <= $signed((~|($unsigned(wire78[(3'h6):(2'h3)]) || wire78[(3'h6):(2'h2)])));
    end
  assign wire89 = (($unsigned(((^wire20) ? (wire19 > wire21) : (8'hbe))) ?
                          wire85[(3'h5):(3'h5)] : wire18[(1'h1):(1'h1)]) ?
                      wire83 : ({$unsigned(wire9[(4'he):(3'h6)])} < reg86[(1'h1):(1'h0)]));
  assign wire90 = ($unsigned(($signed($unsigned(reg13)) << wire19[(4'hb):(3'h6)])) ?
                      wire9[(2'h2):(1'h1)] : $unsigned($signed((~$signed((8'hb5))))));
  assign wire91 = wire10[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg92 <= wire7[(1'h0):(1'h0)];
      reg93 <= (~|wire11[(1'h0):(1'h0)]);
      reg94 <= ((reg15 ?
          (wire18[(1'h0):(1'h0)] && $signed(wire82)) : (&((8'hb4) ?
              (+wire81) : {reg87, wire20}))) * wire82);
      if (((|wire21) ?
          $unsigned((($unsigned(wire84) < (8'h9d)) ?
              reg94 : (^(^~reg93)))) : reg93[(4'h8):(3'h4)]))
        begin
          if ($signed($unsigned(wire85)))
            begin
              reg95 <= (~|reg87);
              reg96 <= (wire11[(3'h6):(3'h4)] ?
                  (^~wire85[(3'h7):(3'h4)]) : (&wire84));
            end
          else
            begin
              reg95 <= {$signed(wire10[(3'h6):(3'h6)])};
              reg96 <= {$signed((8'hb8)),
                  {{wire84}, (~(&wire7[(3'h6):(1'h1)]))}};
            end
          reg97 <= (((8'ha9) ?
                  $unsigned((~|$unsigned(wire18))) : $signed(reg94)) ?
              $signed($unsigned((wire7 != (wire11 ?
                  reg15 : reg93)))) : {$unsigned(({reg15} ?
                      (~&wire10) : (wire21 ? wire20 : wire19))),
                  wire21});
        end
      else
        begin
          reg95 <= $unsigned($unsigned($unsigned($signed($signed((8'hbc))))));
          reg96 <= (wire83[(4'h9):(2'h3)] ?
              $unsigned($unsigned((|(reg93 ?
                  wire90 : (8'ha0))))) : (($signed($signed((8'hb3))) ?
                      $unsigned((reg94 ?
                          (8'hab) : reg14)) : (wire89[(4'hc):(4'hb)] >= (&(8'h9e)))) ?
                  $unsigned(wire17) : wire82));
        end
      reg98 <= {$signed((reg97 ?
              $signed(reg92[(4'hb):(3'h7)]) : ((~wire82) ?
                  wire21 : $signed(wire84)))),
          ({wire91, (^~$unsigned(reg92))} == (~wire10))};
    end
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h234):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire [(3'h5):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  assign y = {wire77,
                 wire73,
                 wire72,
                 wire43,
                 wire40,
                 wire39,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg76,
                 reg75,
                 reg74,
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
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg42,
                 reg41,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg31,
                 (1'h0)};
  assign wire27 = (((|((~^wire25) ?
                          (wire24 ? wire26 : wire23) : ((8'h9f) ?
                              wire23 : wire26))) ?
                      wire23 : wire25) >>> $signed((+$signed(wire24))));
  assign wire28 = wire25;
  assign wire29 = $signed({wire23, (-$signed($signed(wire26)))});
  assign wire30 = wire23;
  always
    @(posedge clk) begin
      reg31 <= wire30[(2'h3):(1'h0)];
    end
  assign wire32 = $unsigned($unsigned((&$unsigned((wire30 ?
                      wire27 : wire29)))));
  assign wire33 = (~((($signed(wire32) ?
                          (wire32 ?
                              wire30 : wire25) : (~|wire29)) + ((~|reg31) & {wire30,
                          wire23})) ?
                      reg31[(3'h5):(3'h4)] : $unsigned((8'ha0))));
  always
    @(posedge clk) begin
      reg34 <= $unsigned($unsigned((!(~|(wire30 ? wire33 : wire32)))));
      reg35 <= wire33;
      reg36 <= (($unsigned({reg35[(4'ha):(3'h7)]}) ^ ((^~$signed(reg34)) << $signed({wire25}))) ~^ $unsigned(wire29));
      reg37 <= ((8'h9f) ~^ (8'hbb));
      reg38 <= ((wire23[(1'h0):(1'h0)] ?
              $unsigned($signed($signed(wire27))) : $signed($unsigned($unsigned(wire28)))) ?
          $signed((wire25 ?
              wire27[(4'hb):(1'h1)] : $signed(wire29))) : {wire25[(5'h12):(3'h6)],
              $unsigned((|{(8'had), wire30}))});
    end
  assign wire39 = (((|$signed((~&wire24))) >> $unsigned(reg31[(2'h2):(1'h1)])) < $unsigned((^(7'h43))));
  assign wire40 = wire25[(4'hb):(1'h1)];
  always
    @(posedge clk) begin
      reg41 <= $signed($signed(reg31[(1'h1):(1'h0)]));
      reg42 <= (~|{(((~wire40) << ((8'hb4) >= wire25)) ?
              $unsigned((~^reg36)) : $unsigned(reg35)),
          $unsigned((^reg34))});
    end
  assign wire43 = wire26;
  always
    @(posedge clk) begin
      if ($signed($unsigned(reg36)))
        begin
          reg44 <= (8'hb3);
          reg45 <= (+(({{wire29}, $signed(reg36)} | (8'ha0)) ?
              ((wire28 == (wire28 & wire30)) * ({reg36,
                  reg36} | wire39[(2'h2):(1'h1)])) : wire43));
          if ($unsigned($signed(wire40[(1'h1):(1'h0)])))
            begin
              reg46 <= wire40;
              reg47 <= ($unsigned(wire32) ^ $unsigned((^{reg34[(3'h4):(1'h0)],
                  (reg37 < wire39)})));
              reg48 <= reg45[(2'h2):(1'h0)];
              reg49 <= $signed((wire33 == (&($unsigned(wire23) << reg34))));
              reg50 <= {$signed($signed($unsigned(reg42[(4'hb):(2'h2)])))};
            end
          else
            begin
              reg46 <= (|(((&reg31) << ((reg42 & wire39) ^ $unsigned(reg36))) ?
                  ({(reg34 != wire27),
                      $unsigned((8'h9f))} * reg42[(5'h10):(4'ha)]) : $signed((wire32[(4'hd):(2'h2)] ?
                      $unsigned(wire24) : (wire39 ? wire43 : reg44)))));
              reg47 <= (|wire43[(2'h3):(1'h0)]);
              reg48 <= $unsigned({$signed($unsigned(reg38)), $signed(reg36)});
              reg49 <= ($signed($signed($signed({(8'hbb)}))) << ((~&(^(~|wire28))) ^~ ($signed((wire23 && wire25)) ?
                  $unsigned($signed(wire28)) : {wire32[(3'h7):(2'h2)]})));
              reg50 <= (8'hb4);
            end
        end
      else
        begin
          if (($unsigned(((8'hb9) | ($unsigned((8'hb5)) == $unsigned(wire23)))) ?
              wire28 : reg49[(1'h0):(1'h0)]))
            begin
              reg44 <= (+wire39[(3'h6):(3'h6)]);
              reg45 <= reg44[(4'ha):(1'h1)];
              reg46 <= $unsigned($unsigned((+((wire39 & wire40) >>> (~reg49)))));
              reg47 <= reg49;
              reg48 <= wire30[(3'h6):(3'h6)];
            end
          else
            begin
              reg44 <= reg49;
              reg45 <= (wire39[(4'ha):(2'h2)] ?
                  ($unsigned(wire39) + $unsigned({{wire25},
                      wire27[(2'h2):(1'h0)]})) : $unsigned($unsigned(wire32)));
              reg46 <= ((((8'haa) ?
                  reg44 : $signed((8'ha5))) == $signed(((^~wire40) * (reg50 ?
                  wire25 : wire29)))) ~^ $signed({wire29[(2'h3):(2'h3)],
                  $signed(wire26)}));
              reg47 <= $unsigned(wire27);
              reg48 <= $signed(wire40);
            end
          reg49 <= wire40[(1'h1):(1'h0)];
        end
      reg51 <= ((wire40[(1'h1):(1'h1)] << wire43) << (8'hb7));
      reg52 <= ($signed($signed($signed(((8'haf) ?
          wire30 : wire33)))) | (wire28 ?
          $unsigned($unsigned({reg49})) : ((reg36 > (wire40 ? reg47 : reg31)) ?
              $unsigned(((8'hb6) <<< reg51)) : $unsigned(reg48[(1'h0):(1'h0)]))));
      if (((~$signed(wire29)) ?
          (~($unsigned((wire29 || (8'hb2))) > $signed($signed(reg35)))) : (8'hba)))
        begin
          reg53 <= $unsigned(({reg34[(5'h10):(3'h6)]} * ((^~reg34) & $signed(wire33[(3'h4):(1'h0)]))));
          if ((~^((($signed(reg53) ? (wire26 ? wire23 : wire27) : wire26) ?
              wire23 : $unsigned(reg47[(2'h3):(2'h3)])) + (((reg51 ^~ reg36) ?
              (~|(8'ha8)) : $signed((8'ha9))) & ((wire43 ?
              reg36 : wire25) + {wire25, wire26})))))
            begin
              reg54 <= {$unsigned($signed((^~$signed(wire27)))), wire39};
            end
          else
            begin
              reg54 <= (^~$unsigned($signed(((reg49 ? wire33 : reg53) ?
                  wire40 : (reg36 ? wire40 : reg31)))));
              reg55 <= ($signed($unsigned(reg47[(1'h0):(1'h0)])) < ($unsigned(wire40[(2'h2):(1'h0)]) * $signed((reg45 ?
                  (reg42 <= reg50) : (~^wire24)))));
              reg56 <= reg36[(5'h14):(4'he)];
            end
          reg57 <= (~&$unsigned(($signed(wire24) > $signed($unsigned(reg54)))));
          reg58 <= (|wire40);
          reg59 <= (!(wire29 ?
              $unsigned(reg50[(1'h1):(1'h1)]) : (({wire43,
                      wire43} >>> reg31[(2'h3):(2'h2)]) ?
                  wire27 : $unsigned((reg35 ? wire24 : wire39)))));
        end
      else
        begin
          reg53 <= ($signed((wire23 && reg31)) & ((reg46 ?
                  wire40 : reg41[(5'h15):(5'h15)]) ?
              {$unsigned(reg58[(2'h3):(2'h2)])} : reg58[(1'h1):(1'h0)]));
          reg54 <= {((reg57 * (|reg47)) ?
                  ((+$signed(wire32)) ?
                      $unsigned(reg38[(3'h5):(2'h3)]) : ($unsigned(wire43) == $signed((8'h9c)))) : $signed((~^$signed((8'hb0))))),
              (8'hb7)};
          reg55 <= reg47;
          reg56 <= ((~&$unsigned({wire40[(2'h2):(1'h0)]})) + {reg55});
        end
    end
  always
    @(posedge clk) begin
      reg60 <= wire27[(2'h2):(1'h0)];
      reg61 <= (-(|{{reg49}}));
      reg62 <= reg60[(3'h5):(1'h0)];
      if ($unsigned($signed(reg59)))
        begin
          reg63 <= ($signed(wire32[(4'hb):(4'h9)]) ?
              wire33[(1'h1):(1'h0)] : $unsigned((($signed(reg60) < wire23) ?
                  ((reg37 ? wire25 : (8'haa)) ?
                      reg51[(2'h3):(1'h0)] : $signed(reg46)) : (+$unsigned(reg36)))));
          if ($signed($signed(wire32[(4'h8):(2'h3)])))
            begin
              reg64 <= (reg37[(2'h2):(1'h0)] && (reg35 * reg45));
              reg65 <= $unsigned({(8'ha7), $signed($unsigned({(8'hbb)}))});
              reg66 <= reg47[(3'h4):(3'h4)];
            end
          else
            begin
              reg64 <= $signed((~&(-$signed(reg42[(4'he):(1'h0)]))));
              reg65 <= ((($signed((^wire30)) >= wire32) ?
                      (~$unsigned($unsigned(reg66))) : wire33) ?
                  ({(&wire29[(3'h4):(2'h3)]),
                      (reg38 * $unsigned((8'h9c)))} || $unsigned($signed($signed(reg46)))) : (&(~((reg38 < reg51) <<< (8'h9c)))));
            end
          reg67 <= ((wire33[(2'h2):(2'h2)] ?
                  {$signed(reg36),
                      $unsigned(reg41[(5'h11):(4'hb)])} : {reg62}) ?
              $unsigned(reg62[(3'h4):(1'h1)]) : (&reg58[(2'h2):(2'h2)]));
          if (($signed((+$unsigned((wire29 <= reg57)))) & wire23))
            begin
              reg68 <= reg37[(2'h2):(1'h1)];
            end
          else
            begin
              reg68 <= (8'hb5);
              reg69 <= ((((~&reg68) ?
                      $unsigned($signed(wire40)) : $signed($unsigned(wire43))) ?
                  $unsigned((~|{reg38})) : reg55) ^ $signed((($unsigned((8'hab)) ?
                  $unsigned(reg67) : {(8'hb3)}) == reg53)));
              reg70 <= (&(reg50 ?
                  $unsigned((~(|reg68))) : ((^reg51) != ((|reg44) ?
                      (~^wire24) : (reg56 >>> reg34)))));
            end
        end
      else
        begin
          reg63 <= $signed((+(((~|wire32) && {reg52, reg50}) ?
              ((!reg55) & $signed((8'hb7))) : ($unsigned(wire43) ?
                  ((8'h9d) <= reg70) : (wire32 * (8'hb0))))));
          reg64 <= (+($signed(reg50) ?
              reg56 : ({wire26, $unsigned(wire27)} == ({reg56, (8'hb8)} ?
                  $unsigned((8'hba)) : {reg63, reg61}))));
          reg65 <= reg41;
          reg66 <= (8'hbd);
        end
      reg71 <= $signed((+reg58));
    end
  assign wire72 = $signed(($signed(reg65[(4'ha):(1'h0)]) ?
                      (reg37 ~^ reg31) : (wire25[(5'h13):(4'h8)] || $unsigned(reg48))));
  assign wire73 = (reg34 != reg71);
  always
    @(posedge clk) begin
      reg74 <= (8'hbc);
    end
  always
    @(posedge clk) begin
      reg75 <= wire30;
      reg76 <= $unsigned(reg36[(4'ha):(4'ha)]);
    end
  assign wire77 = ($signed(reg38) <= $signed((reg62[(4'hf):(4'h9)] == $unsigned($signed(reg67)))));
endmodule
