module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h37b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire145;
  wire [(3'h7):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(3'h7):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire signed [(3'h7):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(4'h9):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire90;
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(3'h4):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire112,
                 wire99,
                 wire97,
                 wire96,
                 wire92,
                 wire90,
                 reg162,
                 reg161,
                 reg160,
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
                 reg100,
                 reg98,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  module4 #() modinst91 (.wire5(wire1), .wire6(wire2), .wire8(wire0), .clk(clk), .wire7(wire3), .y(wire90));
  assign wire92 = wire2;
  always
    @(posedge clk) begin
      reg93 <= ((^wire2[(1'h1):(1'h0)]) ?
          (^(-(wire90[(2'h2):(2'h2)] ?
              {wire1} : $signed(wire90)))) : {$unsigned({$unsigned((8'hb1)),
                  ((8'hbd) ^~ wire90)}),
              {wire2[(2'h2):(1'h1)]}});
      reg94 <= wire3[(4'ha):(3'h4)];
      reg95 <= $signed($signed({(~&{(8'hbe), wire1})}));
    end
  assign wire96 = ($signed(($unsigned($signed(wire92)) >>> reg93[(4'h8):(3'h6)])) ?
                      reg94 : (wire0 > $unsigned(reg95)));
  assign wire97 = $unsigned(wire90);
  always
    @(posedge clk) begin
      reg98 <= (8'hab);
    end
  assign wire99 = {($signed($signed($signed(wire2))) ?
                          (((reg98 ? wire3 : wire2) ? wire0 : (|reg98)) ?
                              (~(reg95 ?
                                  reg93 : wire90)) : $unsigned($signed((8'hbd)))) : {{(+wire90),
                                  (7'h43)}}),
                      $signed(wire96[(4'ha):(4'ha)])};
  always
    @(posedge clk) begin
      reg100 <= (!(8'hb9));
      if ((+$unsigned($signed((~|(wire96 ^~ (8'hb3)))))))
        begin
          reg101 <= wire3[(3'h5):(2'h3)];
        end
      else
        begin
          if ($signed((^~(&$signed(((8'hab) * wire92))))))
            begin
              reg101 <= $signed(wire90[(4'hb):(1'h1)]);
              reg102 <= reg101;
              reg103 <= ($unsigned(wire0) ?
                  $unsigned(wire96[(4'hb):(4'h8)]) : ($signed($signed((wire97 ?
                      wire3 : reg98))) <= ((wire2 & ((8'hb0) ?
                      wire1 : (8'hbc))) << {$signed(reg94), $signed(wire0)})));
              reg104 <= (~|((~^($signed(reg94) >= reg103[(4'h9):(4'h9)])) >= reg100[(3'h6):(1'h0)]));
              reg105 <= $unsigned((|reg93));
            end
          else
            begin
              reg101 <= (reg94 ?
                  ({((wire92 ?
                          wire92 : (8'hbb)) << $unsigned(reg95))} ~^ reg100[(1'h1):(1'h0)]) : ({{(wire2 ^~ reg101),
                              (|reg105)}} ?
                      (-$signed($signed(wire96))) : {$unsigned($signed(wire3)),
                          wire0}));
              reg102 <= $unsigned({({(reg103 ? (8'ha6) : reg98), (7'h41)} ?
                      ((reg93 * wire99) ?
                          (reg104 <= wire3) : wire3) : ((+reg100) <= reg105[(2'h3):(2'h2)])),
                  $unsigned(((reg93 ? wire92 : wire2) ?
                      $unsigned((8'h9e)) : reg101[(1'h0):(1'h0)]))});
              reg103 <= ((wire1 ?
                      (~($signed(reg103) + {wire96, reg102})) : wire1) ?
                  $unsigned($signed({(^~reg103)})) : wire1);
              reg104 <= $signed(wire1);
            end
          if (reg105[(3'h4):(1'h1)])
            begin
              reg106 <= (~((~|$unsigned((8'hbe))) * (^~wire2)));
              reg107 <= $unsigned(wire2);
              reg108 <= $unsigned(wire97);
              reg109 <= (((+(~&(wire2 >= reg94))) ?
                      reg101[(2'h3):(1'h0)] : wire96) ?
                  ((|({reg93, (8'hb3)} ? $signed(wire0) : {reg105, wire96})) ?
                      $signed({(reg108 ? reg93 : wire97),
                          (wire99 ?
                              wire90 : reg106)}) : reg103) : (-$signed({(wire2 <<< reg103)})));
              reg110 <= reg93;
            end
          else
            begin
              reg106 <= wire99[(3'h6):(3'h4)];
              reg107 <= ((~&(reg100 && (~&(reg108 ? (8'ha4) : reg106)))) ?
                  ((~|(((8'had) & reg93) && reg106)) && $unsigned($unsigned({reg98,
                      wire3}))) : (({((8'ha5) & reg110),
                              reg100[(4'h8):(3'h6)]} ?
                          ($signed(reg108) || $signed(reg103)) : wire3) ?
                      ((reg101[(4'h9):(1'h1)] ?
                              {reg103, (8'hbc)} : (~|wire90)) ?
                          $signed(((8'hb2) - wire2)) : $unsigned(wire0)) : wire92));
            end
        end
      reg111 <= wire1;
    end
  assign wire112 = (((|$signed((7'h41))) >= (~^(wire1[(4'ha):(3'h5)] ?
                       reg93 : (reg111 ? reg94 : wire3)))) - wire92);
  always
    @(posedge clk) begin
      if (((reg107 >>> (({reg101} + reg94) + $signed(reg101[(4'hc):(4'hb)]))) && (|(&((reg111 == reg98) <= wire0[(4'ha):(3'h6)])))))
        begin
          reg113 <= (reg105[(3'h6):(1'h0)] > (^reg108[(2'h2):(1'h1)]));
          reg114 <= (reg95 ~^ reg111);
          reg115 <= wire96[(1'h0):(1'h0)];
          if (wire97[(3'h5):(1'h1)])
            begin
              reg116 <= $unsigned(($signed(wire97[(3'h7):(2'h2)]) ?
                  reg104[(4'hf):(2'h3)] : ((-$signed(reg106)) - reg113)));
            end
          else
            begin
              reg116 <= reg93[(4'hb):(3'h4)];
              reg117 <= {$unsigned(($signed(((8'hb9) << (8'hb8))) >>> ((reg116 ?
                      wire112 : reg116) * wire112)))};
            end
          reg118 <= reg110;
        end
      else
        begin
          reg113 <= {($signed({$signed(reg109),
                  reg109}) || (+(|$unsigned((8'hb7)))))};
          reg114 <= (8'hb0);
          reg115 <= (^($unsigned(reg117) ?
              $unsigned(reg104[(1'h1):(1'h0)]) : $unsigned(reg108)));
        end
      reg119 <= $unsigned(((reg118[(3'h4):(1'h0)] >>> reg110) ?
          ({$signed(reg114), $unsigned(wire96)} ?
              ({reg93} ?
                  (reg93 < reg94) : (reg114 <= (7'h41))) : $signed((reg116 ?
                  (8'hb3) : reg115))) : (((reg117 * reg117) <<< $signed(reg114)) + $unsigned(wire90[(4'ha):(4'h8)]))));
      if ((wire112[(3'h6):(3'h6)] && ($unsigned($unsigned(((8'haf) ?
              (8'ha2) : reg108))) ?
          $signed(reg101) : $signed($signed($unsigned(wire90))))))
        begin
          reg120 <= (~^(((reg108[(2'h2):(1'h0)] ?
              (wire90 ? reg94 : wire2) : (~^wire112)) && {reg100[(3'h6):(3'h5)],
              reg118}) * (^~reg93)));
          reg121 <= (wire97[(1'h0):(1'h0)] >= ((((^~wire2) != (wire3 + reg118)) ?
              (reg94[(2'h3):(2'h2)] ?
                  (~|reg103) : (reg100 ? wire97 : reg109)) : (reg101 ?
                  (wire0 ? reg103 : reg114) : wire3)) == wire99));
          reg122 <= (reg108 >= $unsigned(wire90));
          if ($signed($signed(wire96)))
            begin
              reg123 <= $unsigned(($unsigned(reg107) ?
                  ($signed($signed(reg108)) ?
                      (|$signed(wire112)) : (-(reg111 * reg108))) : $unsigned($unsigned($signed(reg109)))));
              reg124 <= $unsigned($unsigned($signed(($signed((8'haa)) + wire92))));
            end
          else
            begin
              reg123 <= {wire1};
            end
          reg125 <= $signed($unsigned(($signed(((8'ha1) ? reg114 : reg113)) ?
              $signed(reg116[(4'hb):(3'h7)]) : reg109)));
        end
      else
        begin
          reg120 <= {$unsigned(($signed(reg114) == {{reg113, (8'hb1)}}))};
          reg121 <= reg103;
          reg122 <= {(-((((8'ha8) ~^ reg110) ^ (reg108 >>> wire92)) ?
                  $unsigned($signed(reg108)) : (^(reg114 ? wire3 : reg104)))),
              (wire112 ?
                  reg120[(2'h3):(1'h1)] : (&({(8'h9c)} && {reg116, wire96})))};
          reg123 <= (~^(reg102 ? reg116[(2'h3):(1'h1)] : reg122));
          if ($signed((8'haa)))
            begin
              reg124 <= reg117;
              reg125 <= (((reg121[(3'h5):(2'h3)] ?
                          reg103 : $unsigned($signed(reg118))) ?
                      wire96[(3'h5):(1'h0)] : reg95[(1'h0):(1'h0)]) ?
                  ($unsigned(reg107) ?
                      reg115 : $signed((!(^~wire0)))) : ((~(((8'hb2) ?
                              (7'h44) : reg118) ?
                          (reg117 <= wire3) : reg95[(2'h2):(1'h0)])) ?
                      ($unsigned((~^wire99)) | $signed(reg117)) : (^~$signed((~reg120)))));
            end
          else
            begin
              reg124 <= {(+(~$unsigned((wire99 ? (8'hb9) : reg117))))};
              reg125 <= ((reg95 ?
                      ({wire112[(3'h5):(1'h1)]} > reg125[(4'he):(3'h6)]) : $signed(reg100[(4'hd):(4'hd)])) ?
                  wire3 : ((({reg123} | reg119[(2'h2):(2'h2)]) < reg104) ^~ reg100[(4'hb):(3'h7)]));
              reg126 <= ($unsigned($signed(((reg107 ? reg113 : reg117) ?
                      $unsigned(wire0) : $signed(wire99)))) ?
                  wire2[(4'h8):(1'h0)] : $unsigned(($signed((~^reg124)) == ({reg94} >> $signed(reg102)))));
              reg127 <= (8'h9c);
              reg128 <= ((-wire0) ?
                  {(reg105 ?
                          $signed($unsigned(wire1)) : (~(&reg94)))} : ((~&(~|(reg109 > (8'hb2)))) ?
                      (wire1[(4'hd):(3'h4)] >= (reg122 * $unsigned(reg109))) : (((+reg119) ?
                              (reg124 ?
                                  wire0 : reg123) : reg111[(2'h3):(2'h3)]) ?
                          $unsigned((reg118 > reg106)) : {wire97, (8'had)})));
            end
        end
      if ($signed(reg128[(2'h2):(2'h2)]))
        begin
          reg129 <= reg105;
          if ((^wire92))
            begin
              reg130 <= $unsigned((|{reg107[(1'h1):(1'h1)],
                  $signed(((8'hb9) >= reg100))}));
              reg131 <= (reg121[(3'h7):(3'h4)] < (((reg121[(4'ha):(3'h7)] + reg126) || reg120) * (wire99[(3'h7):(3'h6)] | ({reg122} ?
                  reg129 : reg95[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg130 <= {reg128, wire90[(4'h9):(1'h0)]};
              reg131 <= $unsigned({(+$unsigned($unsigned(reg123)))});
              reg132 <= $signed((^$signed(reg119[(5'h11):(5'h10)])));
            end
        end
      else
        begin
          reg129 <= (~$unsigned($signed($signed(reg111))));
          reg130 <= ($signed(((|(reg125 == (8'hb8))) ^ ((8'h9f) & (reg118 ~^ reg130)))) ?
              ({reg117, (~wire112[(3'h4):(1'h0)])} ?
                  $signed((&((7'h40) <<< reg94))) : (&(reg100 + $signed((8'ha3))))) : ((8'hab) * (!reg101)));
          reg131 <= {reg128,
              $unsigned((reg109 ?
                  reg106 : ((~reg113) ?
                      (reg126 <= reg98) : wire1[(5'h10):(3'h7)])))};
          if (($signed($unsigned(wire92[(5'h12):(3'h7)])) ^~ (~&(~^($signed((8'haa)) == reg98[(4'hb):(3'h6)])))))
            begin
              reg132 <= (!(($signed((|reg104)) ?
                  (~{reg101,
                      reg109}) : ((+wire92) || wire1)) & ((|reg107) && $unsigned((reg129 > reg95)))));
              reg133 <= ((reg101[(4'hf):(3'h7)] ~^ {(~|$signed(reg109))}) ^~ reg113);
            end
          else
            begin
              reg132 <= (reg124 != reg131);
              reg133 <= $signed(reg119);
              reg134 <= $signed(((+$signed($unsigned(reg113))) ?
                  ($unsigned(reg117) ^ reg129[(1'h1):(1'h0)]) : (($signed(reg125) << (^reg104)) && $unsigned($unsigned((8'h9d))))));
              reg135 <= reg133;
              reg136 <= wire3[(3'h4):(1'h0)];
            end
        end
    end
  assign wire137 = $signed($unsigned($unsigned((reg125[(4'hb):(4'h8)] <<< $signed(reg136)))));
  assign wire138 = ((&($signed(reg131) ? (^~$unsigned(reg95)) : (|{wire90}))) ?
                       reg128[(3'h4):(1'h1)] : (reg123 ?
                           {$signed($unsigned(reg135))} : ({$unsigned((7'h44)),
                               reg130[(3'h4):(2'h3)]} + $unsigned((+reg136)))));
  assign wire139 = (((^wire137) >> (~^{(reg117 ? wire112 : reg93), wire3})) ?
                       (~&(~^reg118[(3'h6):(2'h2)])) : reg127[(5'h10):(4'ha)]);
  assign wire140 = ((~|(reg131 <<< reg103)) ?
                       (reg132 ?
                           reg130[(2'h3):(1'h0)] : $unsigned($signed((reg122 <<< reg104)))) : (7'h43));
  assign wire141 = reg124;
  assign wire142 = (((reg111 ?
                       $signed((!reg113)) : (^~$unsigned(reg121))) && $signed((+$unsigned(reg135)))) != ((($unsigned(reg93) >>> (wire96 ?
                       reg134 : reg102)) >>> ((reg104 | reg101) ?
                       $unsigned(wire2) : (reg132 - reg93))) == (+((reg98 ?
                           wire138 : reg105) ?
                       (reg109 >>> reg114) : (~wire140)))));
  assign wire143 = (reg116[(5'h11):(4'h8)] << wire137[(4'h8):(2'h3)]);
  assign wire144 = $unsigned((reg98 >> $unsigned($signed((^wire3)))));
  assign wire145 = wire96;
  assign wire146 = ((wire145[(4'hf):(4'ha)] <<< reg130[(2'h2):(1'h0)]) ?
                       (-(reg116 || {((8'hb7) ? reg136 : wire112),
                           (+reg119)})) : (+$unsigned(((~&reg134) ?
                           wire145[(3'h4):(2'h3)] : reg95))));
  always
    @(posedge clk) begin
      if ($signed((~&$unsigned((~|$unsigned(wire96))))))
        begin
          reg147 <= wire112[(3'h7):(3'h6)];
          reg148 <= {$unsigned(($signed({reg131}) ?
                  reg98[(2'h3):(1'h1)] : ((wire140 ?
                      (7'h40) : reg98) >= (^~(8'hb8))))),
              reg127};
        end
      else
        begin
          if ($unsigned($unsigned($signed(reg93[(4'ha):(4'h9)]))))
            begin
              reg147 <= $unsigned({reg123});
              reg148 <= (7'h44);
            end
          else
            begin
              reg147 <= (^$unsigned({$unsigned($signed(reg108))}));
              reg148 <= reg93[(2'h3):(1'h1)];
              reg149 <= (|reg127);
            end
          if (($signed($signed($signed((wire96 ? reg100 : reg114)))) ?
              {(~&$signed($unsigned(wire144))),
                  (reg131[(1'h0):(1'h0)] >> ($unsigned(reg120) * (reg114 ?
                      reg115 : wire140)))} : ($signed(wire144) ?
                  $unsigned($unsigned(reg113)) : {$unsigned((|reg121)),
                      (&$unsigned((8'haf)))})))
            begin
              reg150 <= reg124;
              reg151 <= reg117[(1'h0):(1'h0)];
            end
          else
            begin
              reg150 <= (({(~wire146[(2'h2):(2'h2)])} ~^ wire140[(3'h4):(2'h2)]) ?
                  (~^(-$unsigned((reg147 ?
                      (7'h42) : wire142)))) : ((!(-(!reg109))) ?
                      (reg95[(3'h4):(3'h4)] | $unsigned($signed(reg114))) : $unsigned(wire97[(3'h4):(3'h4)])));
              reg151 <= $signed(({(|(reg124 ? reg95 : reg124)),
                  reg128} > (8'hbf)));
            end
          if ($unsigned(reg94))
            begin
              reg152 <= wire90[(4'hc):(4'hc)];
              reg153 <= (-wire2[(4'hb):(1'h1)]);
              reg154 <= ((&(~^($unsigned(reg136) ?
                      $unsigned(reg100) : (reg148 ^ reg109)))) ?
                  ((^(reg129[(1'h0):(1'h0)] ?
                      $unsigned(reg101) : (wire0 || reg123))) && (reg109 > $signed({reg125,
                      wire2}))) : wire2);
            end
          else
            begin
              reg152 <= (~^{reg123[(4'he):(2'h2)]});
              reg153 <= (^reg149[(1'h0):(1'h0)]);
              reg154 <= (~(&(~&$signed($signed(reg152)))));
            end
          reg155 <= reg98[(4'hc):(1'h1)];
          if (reg154)
            begin
              reg156 <= {reg127[(4'ha):(3'h5)],
                  $signed($unsigned($unsigned($signed(wire2))))};
              reg157 <= $signed((~|(($unsigned(reg125) || reg131) ?
                  reg108 : ($signed(wire142) || {wire141}))));
              reg158 <= $unsigned($signed(reg103[(4'ha):(4'h8)]));
              reg159 <= (~&(((^~(reg104 <<< wire140)) ?
                      reg149 : (^(+(8'ha3)))) ?
                  ($signed((reg117 ?
                      wire1 : reg94)) >> $unsigned((~(8'hac)))) : $unsigned(($unsigned(reg152) || (reg156 ?
                      reg128 : (8'h9e))))));
            end
          else
            begin
              reg156 <= reg93;
              reg157 <= $unsigned((~$signed($signed((reg155 ?
                  wire145 : (7'h40))))));
              reg158 <= (~(|reg130[(1'h1):(1'h1)]));
              reg159 <= ($signed((~(^(8'hb6)))) ?
                  reg132[(3'h4):(2'h3)] : (^$signed($signed(reg154))));
              reg160 <= reg126;
            end
        end
      reg161 <= $unsigned(reg115[(2'h3):(2'h2)]);
      reg162 <= (7'h40);
    end
endmodule

module module4
#(parameter param88 = (((((8'hba) ? (^~(8'hab)) : (^~(8'ha7))) <<< (((7'h40) + (8'h9e)) | (8'ha6))) && (8'hb2)) ? (~|(({(8'ha7)} * (+(8'hb7))) & ((8'h9c) ? (+(8'hb6)) : {(8'hbc), (8'hb9)}))) : (~&((8'hb1) >> (~&(|(8'hbd)))))), 
parameter param89 = ((7'h43) ? (param88 ? (param88 ? ((^~param88) ? (param88 | param88) : (^param88)) : (~^param88)) : (param88 ^~ ((|(8'ha1)) ? param88 : (7'h42)))) : ((&param88) & ((+param88) ~^ (param88 * (param88 ^~ param88))))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire5;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire86;
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  assign y = {wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire32,
                 wire86,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire9 = $signed($signed((~&($signed(wire5) ?
                     (wire8 | wire5) : wire8))));
  assign wire10 = (~^(+$unsigned(wire7)));
  assign wire11 = wire10[(3'h7):(2'h2)];
  assign wire12 = $unsigned(((($unsigned(wire6) ~^ wire6[(1'h0):(1'h0)]) ?
                      wire11[(1'h1):(1'h1)] : wire6[(3'h6):(3'h6)]) * $signed((!$signed(wire11)))));
  always
    @(posedge clk) begin
      if (wire5[(1'h1):(1'h0)])
        begin
          reg13 <= $unsigned((~^wire7[(3'h4):(3'h4)]));
          reg14 <= wire10;
          reg15 <= $signed(((~^(~$unsigned((8'hab)))) * (^~wire7)));
          reg16 <= wire8;
          reg17 <= (8'hb7);
        end
      else
        begin
          if (wire11[(1'h0):(1'h0)])
            begin
              reg13 <= reg16;
              reg14 <= $signed(((($signed(reg16) <= $unsigned((8'hbc))) >> ((8'ha6) ?
                      (reg13 ? wire10 : reg14) : (~&reg16))) ?
                  (-((+wire12) >> wire12)) : $signed(($unsigned(wire6) == $unsigned(wire8)))));
            end
          else
            begin
              reg13 <= (wire6[(3'h4):(2'h2)] ?
                  $signed((wire12 != ($signed(wire8) >= reg15[(4'he):(2'h2)]))) : $unsigned($unsigned(((+reg13) & (+wire7)))));
              reg14 <= $signed($unsigned({$unsigned($signed(wire10)), wire11}));
              reg15 <= $signed($signed(wire5[(3'h7):(1'h0)]));
              reg16 <= $signed((-wire6[(3'h5):(3'h4)]));
              reg17 <= ((wire7[(3'h7):(3'h7)] ?
                      ({((8'hbe) ? reg14 : wire9),
                          $signed((8'hb6))} <= wire10[(4'h9):(4'h9)]) : wire8) ?
                  reg15[(4'hb):(4'ha)] : ({$unsigned(wire11[(2'h3):(2'h2)]),
                      $signed((~&wire8))} * (({wire9,
                      wire6} ^ {reg14}) - $unsigned((wire12 || wire11)))));
            end
          reg18 <= {$signed(wire11[(1'h0):(1'h0)]),
              (reg16 ? reg13[(2'h3):(2'h2)] : wire12[(1'h1):(1'h0)])};
        end
      reg19 <= {((~|(wire8 ?
              $unsigned(reg15) : wire8[(4'h8):(3'h4)])) <= $unsigned($unsigned($unsigned(reg17)))),
          ($unsigned({(reg16 >= wire9)}) > $unsigned({$unsigned(reg13)}))};
    end
  assign wire20 = $signed(($signed((|(+(8'h9d)))) | ((wire11[(1'h1):(1'h0)] ^ (reg18 ?
                      (8'haa) : wire11)) & $signed((reg15 & reg15)))));
  assign wire21 = {$signed(((((8'hb4) ? wire8 : reg16) ?
                              (+(8'hae)) : (reg17 >= wire7)) ?
                          (reg17 ? (~(8'ha7)) : (-reg17)) : ($unsigned(reg17) ?
                              {reg14, (8'hbc)} : $signed((8'hae))))),
                      $unsigned({wire12[(1'h0):(1'h0)],
                          (wire11 ? (wire8 - wire20) : (^~wire20))})};
  assign wire22 = wire6[(2'h2):(2'h2)];
  assign wire23 = (+(~^$unsigned(reg16[(3'h7):(3'h6)])));
  assign wire24 = wire7[(3'h6):(3'h5)];
  assign wire25 = wire10[(4'he):(4'h8)];
  assign wire26 = (($signed(((reg18 ? wire20 : reg15) ?
                          (+wire8) : {reg19})) - ((-wire25[(2'h3):(2'h2)]) ?
                          ($unsigned(wire5) ?
                              $unsigned((8'hbc)) : $signed((8'hb5))) : $unsigned($signed((8'h9f))))) ?
                      (($unsigned((reg19 > wire11)) ^~ wire24) == $unsigned(wire7)) : $unsigned($unsigned(((reg14 && reg19) & (wire8 ?
                          (8'ha5) : wire8)))));
  always
    @(posedge clk) begin
      reg27 <= $signed((|(!(~&wire10[(1'h1):(1'h1)]))));
      reg28 <= wire5;
      reg29 <= reg16[(2'h3):(1'h0)];
      reg30 <= ((wire20 ?
          wire23[(1'h1):(1'h1)] : $signed((~(wire22 ?
              wire9 : (8'hbd))))) - (((wire11 ?
          (|(8'hbe)) : (wire5 ?
              reg29 : reg17)) | reg13[(2'h2):(1'h0)]) != (8'h9e)));
      reg31 <= (reg15[(2'h2):(1'h0)] && (wire21 << reg16));
    end
  assign wire32 = (~|$signed($unsigned($unsigned((reg31 ? (8'hb1) : wire5)))));
  module33 #() modinst87 (wire86, clk, wire32, reg19, wire24, wire12);
endmodule

module module33
#(parameter param84 = ((~&(~^(+((8'ha1) ? (8'ha7) : (8'had))))) >>> ((~&{((8'hba) ? (8'hb0) : (8'hab)), ((8'h9d) == (8'hb3))}) ^~ (|(~^((8'ha4) >>> (8'ha8)))))), 
parameter param85 = param84)
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire36;
  input wire [(4'hc):(1'h0)] wire35;
  input wire [(5'h13):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire77,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg79,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 (1'h0)};
  assign wire38 = $signed((~{(8'hae), (8'hb0)}));
  assign wire39 = $signed((^~($signed((wire38 + wire35)) ?
                      (~$signed((7'h44))) : wire37)));
  assign wire40 = ((~^(|$signed((~&wire38)))) | wire34[(3'h7):(3'h6)]);
  assign wire41 = wire39;
  assign wire42 = $unsigned({(wire36[(3'h4):(2'h2)] >= $signed(wire36[(1'h0):(1'h0)])),
                      $signed($signed($unsigned(wire35)))});
  assign wire43 = (!$signed(wire37[(4'hf):(4'hb)]));
  always
    @(posedge clk) begin
      if (($unsigned((-wire38[(2'h2):(1'h1)])) ?
          ($unsigned($signed(wire34)) - {{$unsigned(wire41),
                  wire34[(4'hf):(1'h1)]}}) : (8'h9e)))
        begin
          if ($signed(($unsigned((!(wire40 ? wire37 : wire38))) ?
              $unsigned($unsigned($unsigned((8'ha6)))) : wire40)))
            begin
              reg44 <= wire38[(1'h0):(1'h0)];
              reg45 <= ($unsigned(wire39[(2'h3):(1'h0)]) ? wire42 : wire43);
              reg46 <= wire36[(1'h0):(1'h0)];
            end
          else
            begin
              reg44 <= reg44;
              reg45 <= (wire37 ?
                  $unsigned($unsigned(wire35[(4'h9):(2'h3)])) : wire34);
              reg46 <= reg44[(2'h3):(1'h0)];
              reg47 <= ($unsigned($signed({wire34, wire38[(4'he):(4'h9)]})) ?
                  (reg44[(1'h1):(1'h0)] ?
                      wire35[(3'h5):(3'h5)] : (8'hae)) : wire37[(4'hf):(1'h0)]);
              reg48 <= (wire38 * wire35);
            end
          reg49 <= $signed(wire39[(2'h3):(2'h3)]);
          reg50 <= ((reg48[(3'h5):(3'h5)] < (((wire36 != wire40) ?
                  $unsigned(wire42) : (~|(8'hb1))) ?
              (^(^wire35)) : ({wire41,
                  wire36} > $unsigned(wire41)))) ^ $unsigned(wire37));
          reg51 <= (wire39 >> reg50);
        end
      else
        begin
          reg44 <= wire41;
          reg45 <= ((({$unsigned((8'hb8)), (reg47 != wire36)} ?
                  $signed((wire43 ~^ wire34)) : reg48[(3'h7):(3'h7)]) ?
              ((wire39 || wire43[(2'h3):(2'h2)]) >= wire36) : {$unsigned((8'h9c)),
                  reg50}) << $unsigned(($unsigned($signed((8'haa))) ?
              $unsigned((reg51 || (8'h9e))) : ({wire36, wire38} ?
                  $signed(reg49) : $signed(wire36)))));
          reg46 <= reg45[(3'h4):(1'h1)];
          if ($unsigned((reg47 || $signed({$unsigned(reg48)}))))
            begin
              reg47 <= $signed($unsigned($unsigned((wire40 ~^ $unsigned((8'h9d))))));
            end
          else
            begin
              reg47 <= {(($signed({reg51}) ~^ $unsigned({reg47,
                      wire41})) + $signed($unsigned(wire40)))};
              reg48 <= ($signed(((8'hb2) != $signed({wire40}))) ?
                  wire34[(4'hd):(4'hd)] : wire39[(2'h2):(2'h2)]);
              reg49 <= $unsigned(wire43[(4'hd):(4'h8)]);
              reg50 <= ((-(~|wire35)) ?
                  (8'hb8) : ((wire39 ?
                          wire42 : $unsigned(reg46[(1'h1):(1'h0)])) ?
                      $unsigned((reg48[(2'h3):(2'h3)] ?
                          {wire39,
                              wire43} : $unsigned((8'hbf)))) : $unsigned($signed($signed(wire41)))));
            end
        end
      if ((-{(reg46 ^~ ((wire43 ? reg46 : wire35) ?
              (7'h44) : reg48[(3'h5):(2'h2)]))}))
        begin
          reg52 <= wire38;
          reg53 <= (^(&reg46));
          if ((8'h9f))
            begin
              reg54 <= (&(~|wire37[(2'h3):(1'h1)]));
            end
          else
            begin
              reg54 <= (^(((^((8'hb4) & wire35)) >> $signed($unsigned(reg52))) != $signed(reg51[(4'hd):(4'h8)])));
              reg55 <= ((reg45[(4'hb):(3'h5)] & (reg54 ^ reg45[(4'ha):(2'h3)])) * ($signed($signed(wire40)) >> wire37));
              reg56 <= reg55[(4'h9):(2'h3)];
              reg57 <= wire40;
              reg58 <= reg57;
            end
          reg59 <= $signed($signed($signed(((~(8'hbe)) != (-reg58)))));
        end
      else
        begin
          reg52 <= (wire34[(5'h13):(4'hf)] ?
              (^(((wire36 < wire39) ? (^~reg59) : reg53) ?
                  $signed(reg52[(1'h0):(1'h0)]) : wire41)) : (8'hb5));
          reg53 <= ($signed((reg51[(3'h6):(1'h1)] - (8'ha2))) ?
              {($unsigned((reg49 ?
                      reg56 : reg55)) && $unsigned(reg48[(3'h5):(1'h0)])),
                  (-reg55[(3'h5):(3'h4)])} : wire41[(1'h1):(1'h0)]);
          reg54 <= wire41[(1'h0):(1'h0)];
        end
      reg60 <= wire34[(3'h5):(3'h4)];
      reg61 <= reg48;
      reg62 <= ({(~|$signed((reg47 >> (8'haf)))),
          ((&wire41) > $unsigned({reg44,
              reg49}))} <= (~$signed(reg58[(3'h7):(2'h3)])));
    end
  assign wire63 = reg60;
  assign wire64 = ($signed(reg49[(1'h1):(1'h1)]) >= reg46);
  assign wire65 = (~&(+reg59));
  assign wire66 = wire40[(3'h7):(2'h3)];
  assign wire67 = reg50;
  assign wire68 = (({(|((8'haf) ?
                          reg54 : wire64))} | $signed(reg62)) << reg56[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned(reg57[(1'h1):(1'h0)]))
        begin
          reg69 <= (+$unsigned((wire37[(5'h12):(5'h12)] ?
              {{wire66, wire38}, wire37[(2'h3):(2'h2)]} : {{wire43},
                  {wire37}})));
          if ({($signed($signed(reg58)) ?
                  ((~&$signed((8'hb6))) != wire67[(3'h7):(3'h6)]) : ((wire35 || ((8'ha2) ?
                      reg61 : reg49)) <= ((wire64 ? reg45 : wire40) ?
                      $signed(reg46) : (wire34 - reg59)))),
              $signed((~|wire40[(4'hc):(2'h3)]))})
            begin
              reg70 <= (wire42[(3'h5):(2'h2)] < (!$unsigned(wire35[(1'h1):(1'h0)])));
              reg71 <= reg69;
            end
          else
            begin
              reg70 <= ({(!((wire64 + reg46) ?
                          wire37[(5'h10):(3'h6)] : (~^wire37))),
                      (^~$unsigned({reg51, wire38}))} ?
                  (!wire34) : $signed((+wire38)));
              reg71 <= $signed({(~|(wire37[(4'hc):(4'hb)] && wire43[(3'h5):(3'h5)])),
                  $signed(wire64[(1'h1):(1'h0)])});
            end
          if ($signed({($unsigned((-reg46)) >>> $signed($unsigned(reg71)))}))
            begin
              reg72 <= ($signed(reg53[(2'h2):(1'h1)]) ?
                  (reg51[(1'h1):(1'h1)] >> (8'hbd)) : (((~^(reg54 ?
                      reg46 : wire34)) ^ $unsigned($unsigned(wire63))) && wire68));
            end
          else
            begin
              reg72 <= $unsigned((((8'hb1) ?
                      $signed($unsigned((7'h44))) : ((reg70 ?
                          wire36 : wire40) ~^ (&reg60))) ?
                  (((wire66 - (8'haa)) + $signed(wire35)) ?
                      (^~(reg46 ?
                          reg54 : reg46)) : $unsigned((~^(8'ha4)))) : wire36));
            end
        end
      else
        begin
          reg69 <= $unsigned(wire39[(1'h1):(1'h1)]);
          reg70 <= (reg60 + $signed({(^(reg69 || reg48)), reg46}));
          if ((($unsigned($signed(wire39[(2'h3):(2'h3)])) ?
                  (8'hb6) : ($unsigned($signed(reg59)) & reg62[(2'h2):(1'h0)])) ?
              reg52 : $unsigned({wire42[(1'h1):(1'h1)], $signed((|(8'h9d)))})))
            begin
              reg71 <= (~&((reg56[(2'h3):(2'h2)] ?
                  $signed({wire38,
                      (8'h9d)}) : ((!reg44) < (reg51 | wire66))) >= ((8'ha5) != reg60)));
              reg72 <= $unsigned($signed({(+$unsigned(reg53)),
                  {(~^(8'hbb)), $signed(wire65)}}));
              reg73 <= ($unsigned(reg59) ?
                  ((~((&wire37) ?
                      (8'hbd) : reg69)) ~^ $unsigned(((reg69 == reg54) ?
                      reg61[(2'h3):(1'h0)] : wire65))) : $unsigned($signed((wire68[(5'h10):(5'h10)] ?
                      reg45 : reg54[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg71 <= wire42[(1'h0):(1'h0)];
              reg72 <= (($signed(reg55[(2'h2):(1'h0)]) ^ wire36) == (&(reg62 > wire65)));
            end
        end
      if ({$unsigned(reg61[(1'h0):(1'h0)])})
        begin
          reg74 <= {(~(~$unsigned((reg61 ? (7'h41) : reg44))))};
        end
      else
        begin
          reg74 <= reg69;
          reg75 <= {$unsigned((+$signed(reg69))),
              $unsigned($signed($unsigned((wire64 && (8'ha7)))))};
          reg76 <= (^((!{$signed(wire40)}) ?
              reg45[(1'h0):(1'h0)] : (reg74[(3'h4):(3'h4)] ?
                  ($signed(reg71) ?
                      (wire63 >= wire40) : reg74[(1'h1):(1'h1)]) : reg62[(2'h2):(1'h0)])));
        end
    end
  assign wire77 = (^~$signed(wire39[(2'h3):(2'h3)]));
  assign wire78 = $unsigned(((wire34 & $unsigned(reg71)) ~^ wire39[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg79 <= {(^$signed(wire68)), reg71[(3'h5):(2'h2)]};
    end
  assign wire80 = $signed((~|reg53[(1'h1):(1'h1)]));
  assign wire81 = (reg51[(3'h4):(2'h2)] ~^ (&($signed($signed(wire42)) ?
                      (~&(reg70 ? reg71 : wire39)) : wire35[(4'hb):(3'h5)])));
  assign wire82 = $signed(($signed((~^(!reg75))) ?
                      (~|$unsigned(reg51[(4'ha):(4'h8)])) : ((8'haa) != ((~^reg45) & $signed((8'h9d))))));
  assign wire83 = $unsigned($signed(((+(&reg59)) | $unsigned((wire66 ?
                      reg71 : reg72)))));
endmodule
