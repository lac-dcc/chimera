module top
#(parameter param170 = ((^~(((8'ha2) ? ((8'hb2) != (8'ha5)) : ((7'h44) ? (7'h40) : (8'ha1))) <<< ((-(8'hb2)) ? (!(7'h41)) : (~&(8'hbe))))) ^ (+(&(8'hbb)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h253):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire146;
  wire [(3'h5):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire116;
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(4'h8):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire132,
                 wire120,
                 wire119,
                 wire118,
                 wire116,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
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
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
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
                 (1'h0)};
  module5 #() modinst117 (wire116, clk, wire4, wire1, wire2, wire3, wire0);
  assign wire118 = ((~|(8'had)) ^ (wire2[(4'hf):(2'h2)] ?
                       (~($unsigned(wire0) ?
                           $signed((8'hb2)) : wire1)) : ($signed((wire1 >> wire3)) ?
                           ((wire3 ? wire116 : (8'haa)) ?
                               (wire3 && (8'hbd)) : $unsigned(wire0)) : {wire4})));
  assign wire119 = ($unsigned(wire4[(2'h2):(2'h2)]) > {(8'haf),
                       (wire118 ?
                           $unsigned(wire3[(1'h1):(1'h0)]) : $unsigned({wire3}))});
  assign wire120 = $unsigned(wire116[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire3[(5'h11):(4'h9)])
        begin
          reg121 <= $signed($unsigned($unsigned((!(wire1 || (7'h40))))));
          reg122 <= {wire119[(4'h9):(3'h4)],
              (wire116[(3'h4):(2'h2)] ?
                  (!$signed((^wire116))) : {$unsigned((wire118 ~^ wire116))})};
          reg123 <= wire1[(4'ha):(1'h1)];
          if (reg121)
            begin
              reg124 <= wire118;
            end
          else
            begin
              reg124 <= $signed($signed((|reg124)));
              reg125 <= (8'haf);
              reg126 <= $signed(reg121);
            end
          if (reg123[(2'h3):(2'h2)])
            begin
              reg127 <= reg121[(1'h0):(1'h0)];
              reg128 <= wire120;
              reg129 <= {(8'hac)};
              reg130 <= wire119;
            end
          else
            begin
              reg127 <= $signed($signed({$signed($unsigned((8'hb4))),
                  {(~&reg123)}}));
            end
        end
      else
        begin
          reg121 <= (~|$unsigned((-$unsigned(reg125))));
          reg122 <= $signed(wire2[(2'h3):(1'h0)]);
        end
      reg131 <= $unsigned($signed({($signed(reg121) ?
              $signed(reg124) : (wire4 ~^ (8'hba)))}));
    end
  assign wire132 = (+$unsigned((((reg123 == wire120) ?
                       (^~wire3) : (reg123 ?
                           (8'ha6) : wire118)) <<< reg122[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg133 <= $signed((8'ha1));
      reg134 <= $unsigned($signed(reg126));
      if (wire2)
        begin
          reg135 <= (~^reg121[(1'h0):(1'h0)]);
          reg136 <= reg133[(4'h9):(3'h4)];
          if (reg136[(4'hc):(3'h5)])
            begin
              reg137 <= reg135;
            end
          else
            begin
              reg137 <= (&(+($unsigned(reg124) ?
                  ((wire120 ? reg128 : wire120) <<< {(8'hb9),
                      (8'hb5)}) : ((~&wire3) - reg135))));
            end
        end
      else
        begin
          reg135 <= ({(8'hae),
              $signed(((reg137 * reg133) ^~ reg134[(4'hd):(1'h1)]))} - (reg135[(3'h6):(3'h5)] ?
              ({$unsigned(wire4)} ?
                  ($unsigned(wire119) <<< reg134[(3'h4):(1'h1)]) : $unsigned(reg130[(1'h1):(1'h1)])) : reg125));
        end
      if ($signed($unsigned(reg126)))
        begin
          reg138 <= reg127[(3'h5):(2'h3)];
        end
      else
        begin
          reg138 <= $unsigned(($signed({reg136}) || (8'ha9)));
          reg139 <= {{wire3, (reg136 & ((~^reg133) >>> (7'h43)))},
              $signed(reg124[(4'h9):(1'h0)])};
          reg140 <= reg131[(4'h9):(4'h8)];
          reg141 <= reg131;
        end
      reg142 <= $signed(wire4[(4'hb):(4'h8)]);
    end
  assign wire143 = (wire3 != {wire116[(4'hd):(3'h5)]});
  assign wire144 = wire132[(3'h6):(3'h6)];
  assign wire145 = reg125;
  assign wire146 = reg136[(2'h2):(1'h1)];
  assign wire147 = $signed(wire4[(4'he):(3'h7)]);
  always
    @(posedge clk) begin
      reg148 <= (+(~^(~&({reg124, (8'hbd)} ?
          (~wire146) : ((8'hb6) ^~ reg123)))));
      reg149 <= (($signed(wire2[(5'h12):(4'hd)]) ?
          $unsigned({wire116}) : ($signed(((8'ha9) ?
              wire147 : wire147)) <= ((reg122 || reg124) ?
              reg131[(4'ha):(4'h9)] : {reg130,
                  reg122}))) == {reg123[(2'h2):(1'h0)], reg126});
      if ((reg131 ? reg142 : (reg133 != $unsigned($unsigned((-reg137))))))
        begin
          if (reg135)
            begin
              reg150 <= $unsigned({$signed(reg136),
                  (($signed(reg123) ?
                      (!reg148) : (~^(8'hbe))) && $unsigned((8'hb4)))});
              reg151 <= (&((~|reg142) ^ (!$signed($signed((8'ha4))))));
              reg152 <= reg139;
              reg153 <= reg133;
              reg154 <= $unsigned(({wire2[(1'h0):(1'h0)]} | ((~$unsigned(wire3)) & (~(~reg142)))));
            end
          else
            begin
              reg150 <= reg123[(4'he):(1'h1)];
              reg151 <= $signed($signed(reg133[(2'h2):(1'h1)]));
              reg152 <= wire2[(4'ha):(3'h6)];
              reg153 <= ($unsigned($unsigned($signed(((8'hab) || reg150)))) ?
                  reg129[(1'h1):(1'h0)] : ({reg124[(4'hc):(3'h5)],
                          {(reg123 ? reg123 : reg122), $unsigned(reg126)}} ?
                      wire3[(4'hc):(4'hb)] : wire1));
              reg154 <= ({(reg139[(1'h1):(1'h1)] ?
                          $signed({reg123}) : $signed(reg136))} ?
                  (~|wire144) : ($signed((8'hbb)) <= $signed($signed(((8'hb8) + reg127)))));
            end
          reg155 <= $signed(wire1[(3'h7):(3'h7)]);
        end
      else
        begin
          reg150 <= $signed($unsigned((+$signed($unsigned(reg137)))));
        end
    end
  always
    @(posedge clk) begin
      if ((^reg154))
        begin
          reg156 <= (({(~|$unsigned((8'ha6)))} != (8'hbf)) ^~ wire143);
          reg157 <= $unsigned(((~&(-reg122[(3'h4):(1'h0)])) >> ($signed(reg135[(3'h4):(1'h1)]) == (wire146[(4'hf):(2'h2)] ?
              (reg156 ? wire2 : reg139) : {(8'hb5)}))));
          reg158 <= reg130;
        end
      else
        begin
          if (reg155)
            begin
              reg156 <= {wire119};
              reg157 <= $signed((8'hb5));
              reg158 <= {wire147};
            end
          else
            begin
              reg156 <= (8'hbc);
              reg157 <= ($signed(reg125[(1'h0):(1'h0)]) ?
                  $signed($signed(wire118)) : wire132);
              reg158 <= ({reg138} <= (~&((~((8'hbc) <= reg137)) || ((+(8'hbd)) << $unsigned(reg134)))));
              reg159 <= $signed($signed(reg152[(3'h6):(2'h3)]));
            end
        end
      reg160 <= reg131[(1'h0):(1'h0)];
      reg161 <= reg135[(4'h8):(2'h2)];
      if ((|($signed((~(|reg130))) ?
          (^(((8'h9d) && wire1) <<< (-reg124))) : (wire147[(2'h3):(2'h3)] != $signed(reg125)))))
        begin
          reg162 <= (((~^((7'h42) ?
              wire146[(3'h4):(2'h3)] : (-reg149))) ^~ reg128[(3'h5):(1'h0)]) == $signed(reg135[(2'h3):(1'h1)]));
          reg163 <= (((((reg122 * wire2) ?
                          ((8'ha1) ? reg122 : reg150) : (reg160 >>> reg149)) ?
                      ({reg161} >= reg158) : {$signed((8'ha0))}) ?
                  $unsigned(({reg158, wire132} ?
                      $signed(reg154) : (!reg152))) : (~^wire2[(3'h5):(3'h4)])) ?
              $signed((((wire144 ? reg156 : reg128) << (+(8'haa))) ?
                  (~wire132[(1'h1):(1'h1)]) : {(reg121 ? reg136 : reg130),
                      $unsigned(wire116)})) : (reg159 >> (-((8'ha9) & {reg150}))));
          if ((8'ha0))
            begin
              reg164 <= $signed((~|$unsigned((+(wire0 <= (8'h9c))))));
              reg165 <= $signed($unsigned($unsigned(({(8'hbd)} ?
                  reg149 : (wire118 ^ wire143)))));
              reg166 <= reg142;
              reg167 <= wire145;
              reg168 <= wire3;
            end
          else
            begin
              reg164 <= $signed(((($signed(reg142) ^~ $unsigned(reg148)) ?
                  wire147 : {$signed(reg130),
                      wire119[(1'h0):(1'h0)]}) > ({$signed((8'hb1)),
                  (wire146 ? wire3 : reg152)} ^~ (reg131 ?
                  $unsigned(reg162) : wire144[(4'hb):(4'h8)]))));
              reg165 <= (~&$signed($unsigned((~&reg149[(4'hb):(4'h8)]))));
            end
          reg169 <= (~^(+reg131[(4'h9):(4'h9)]));
        end
      else
        begin
          reg162 <= reg137;
          reg163 <= reg158[(1'h1):(1'h0)];
          if ((8'hb7))
            begin
              reg164 <= $unsigned(reg127[(5'h14):(4'h8)]);
              reg165 <= ($signed(((|(^~wire120)) ?
                      ((wire1 ?
                          wire145 : reg153) && (wire143 ^ reg121)) : {$unsigned(wire1),
                          (reg155 > reg167)})) ?
                  (8'hbc) : reg122);
              reg166 <= (-wire3[(4'hf):(3'h5)]);
            end
          else
            begin
              reg164 <= (8'ha1);
              reg165 <= {$unsigned($signed($unsigned((8'hab)))),
                  $signed(($unsigned($unsigned(reg164)) ?
                      $unsigned($signed(reg127)) : wire4[(4'h8):(3'h4)]))};
              reg166 <= ((reg125 ?
                  $signed((reg142[(1'h0):(1'h0)] ?
                      (reg137 && reg134) : reg138)) : reg124) ~^ ((^$signed($signed(reg159))) <= (^~wire120)));
              reg167 <= $signed({wire144, (~&wire144)});
            end
          reg168 <= reg140[(1'h0):(1'h0)];
        end
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire113;
  reg signed [(4'ha):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  assign y = {wire115,
                 wire28,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire89,
                 wire93,
                 wire94,
                 wire113,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire11 = (wire7[(3'h4):(3'h4)] ^~ wire7);
  assign wire12 = wire8;
  assign wire13 = wire12;
  assign wire14 = (wire12[(2'h2):(1'h1)] ?
                      wire9[(3'h4):(1'h1)] : {($unsigned((wire10 ?
                                  wire6 : wire10)) ?
                              wire12 : $signed((wire13 ? wire13 : wire13))),
                          $signed(wire13)});
  assign wire15 = wire8;
  module16 #() modinst29 (.wire17(wire10), .clk(clk), .y(wire28), .wire19(wire7), .wire18(wire11), .wire21(wire12), .wire20(wire9));
  assign wire30 = $unsigned($signed((|{(+wire6), {wire15}})));
  assign wire31 = wire28;
  assign wire32 = ((wire13[(3'h5):(2'h3)] ?
                          $signed($signed(wire9[(4'hf):(3'h5)])) : {((wire15 ?
                                  wire12 : wire28) & $signed((8'ha6)))}) ?
                      wire12 : $unsigned((wire7 ? wire11 : wire11)));
  assign wire33 = wire8[(4'hd):(3'h4)];
  assign wire34 = $signed(($signed($signed($signed(wire33))) << (((-wire13) ?
                      $unsigned(wire8) : (|wire31)) ^~ ((wire30 >= wire33) ?
                      (wire8 <<< wire28) : $unsigned((8'ha7))))));
  assign wire35 = wire13[(3'h7):(3'h4)];
  assign wire36 = ((8'hb4) <= $signed($signed(((~|wire8) ?
                      (^~wire10) : ((8'h9e) == wire35)))));
  assign wire37 = $unsigned($signed(wire7[(1'h0):(1'h0)]));
  assign wire38 = $unsigned($unsigned(($unsigned((wire8 < wire37)) ?
                      (^~$unsigned(wire13)) : ($unsigned(wire28) ?
                          (!wire30) : wire9[(4'h9):(3'h7)]))));
  module39 #() modinst90 (wire89, clk, wire13, wire10, wire12, wire32);
  always
    @(posedge clk) begin
      reg91 <= $unsigned((~{({wire89, wire30} ?
              (wire36 > wire7) : wire32[(1'h1):(1'h1)]),
          wire35}));
      reg92 <= (($unsigned($signed($unsigned((8'hb3)))) ?
              $signed($unsigned($unsigned(wire6))) : (wire10[(4'hc):(3'h4)] ?
                  $unsigned({wire33, wire34}) : (^~$unsigned(wire38)))) ?
          (wire37[(3'h5):(1'h0)] ?
              wire30[(3'h5):(2'h2)] : $signed($unsigned(wire34))) : wire9);
    end
  assign wire93 = (-((($unsigned(wire28) ?
                          $unsigned(wire34) : wire32[(4'h8):(3'h7)]) ^ wire36[(4'h8):(4'h8)]) ?
                      $unsigned(((wire11 ?
                          wire89 : wire89) != wire11[(3'h5):(2'h2)])) : (+({wire11} ?
                          (-(8'hb3)) : wire15))));
  assign wire94 = {(+wire89[(4'hb):(3'h4)])};
  module95 #() modinst114 (.wire97(wire30), .wire98(wire8), .clk(clk), .wire100(wire31), .y(wire113), .wire99(wire28), .wire96(wire35));
  assign wire115 = $signed((($unsigned($signed(wire33)) <<< $signed(wire28)) && (+(wire37 << (wire36 >= (8'hb1))))));
endmodule

module module95
#(parameter param112 = (((({(8'hab), (8'hac)} >>> ((8'hae) >= (8'had))) == (^{(8'ha7)})) | (~^(&((8'hbd) ? (7'h43) : (8'haf))))) > {({{(8'hb4), (8'hab)}} ? (^~(^~(8'hb3))) : (((8'h9d) ? (8'ha7) : (8'hb4)) ? (&(8'hb8)) : (^(8'hb0))))}))
(y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire [(3'h4):(1'h0)] wire98;
  input wire signed [(5'h10):(1'h0)] wire97;
  input wire [(5'h10):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg101 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire106,
                 wire105,
                 reg108,
                 reg107,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg101 <= wire97[(4'h9):(2'h3)];
      reg102 <= wire96[(2'h2):(1'h1)];
      reg103 <= $signed($signed(wire96[(4'h8):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg104 <= wire99;
    end
  assign wire105 = $unsigned($signed(reg101));
  assign wire106 = (+(((((7'h41) ? wire98 : wire97) ?
                               (8'hb1) : $signed(wire97)) ?
                           (wire96 ?
                               $unsigned(wire99) : (~^wire96)) : {{wire99},
                               (reg103 ? wire100 : reg104)}) ?
                       (~&$unsigned((8'hba))) : wire99));
  always
    @(posedge clk) begin
      reg107 <= $unsigned(wire98[(1'h0):(1'h0)]);
      reg108 <= ({{$unsigned(((8'ha3) ? wire100 : reg103))}} * $signed(wire98));
    end
  assign wire109 = (wire105[(3'h4):(2'h3)] ?
                       ({((reg103 ? (8'hbb) : (8'hb5)) * (wire97 || reg103)),
                           ($unsigned(reg102) >> {(8'hba)})} <= $signed({wire105})) : $unsigned(reg102[(2'h2):(2'h2)]));
  assign wire110 = {(-{$unsigned($unsigned(wire97))})};
  assign wire111 = reg107[(3'h6):(3'h4)];
endmodule

module module39
#(parameter param88 = ((((((8'h9d) ? (8'hbc) : (8'h9f)) <<< {(8'ha9)}) == ((!(7'h43)) || {(8'hb6)})) ? (-(((8'hbf) & (8'hb3)) << ((7'h43) ? (8'hbd) : (8'ha7)))) : (~(((8'hb5) >> (8'ha7)) < (~(8'hb1))))) ? ((8'haa) ^ ((|((8'hbf) ? (8'ha6) : (8'ha4))) & (&((8'hb0) ? (7'h42) : (7'h43))))) : (~&(({(8'hbe)} >>> {(8'hb6), (8'ha2)}) >> (|{(8'hb8), (7'h44)})))))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h228):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire signed [(5'h14):(1'h0)] wire41;
  input wire signed [(4'he):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire64,
                 wire46,
                 wire45,
                 wire44,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 (1'h0)};
  assign wire44 = wire42;
  assign wire45 = {wire41[(5'h11):(3'h5)],
                      $unsigned(($signed((8'hb3)) ?
                          (wire41[(4'hd):(2'h2)] | (wire40 ?
                              wire40 : wire44)) : (|$signed(wire44))))};
  assign wire46 = $unsigned(((($unsigned(wire45) ?
                          {wire45, (8'ha1)} : wire42) && {{wire41}}) ?
                      (|(wire44[(4'he):(3'h4)] | (wire40 >> wire41))) : (^~wire43)));
  always
    @(posedge clk) begin
      if ((|(^~((8'hb4) ? (-(wire46 ? wire46 : wire40)) : {wire43}))))
        begin
          if ((wire40[(4'hc):(3'h4)] >= (({wire45} && $signed(wire42[(4'hb):(1'h1)])) ?
              wire41 : wire46)))
            begin
              reg47 <= wire44;
            end
          else
            begin
              reg47 <= (wire40[(3'h6):(1'h0)] ?
                  {$signed(($signed((8'ha2)) != $signed(wire40))),
                      ($signed(wire40) ?
                          ((^~wire40) ?
                              (wire45 ?
                                  wire45 : wire44) : wire44) : $unsigned((8'hb2)))} : wire42[(3'h5):(3'h4)]);
              reg48 <= {(!$signed(wire42)), $signed((^~{(+wire40)}))};
            end
          reg49 <= wire45[(3'h5):(1'h1)];
          reg50 <= ($unsigned($signed(((wire43 ?
              wire46 : reg47) <= wire44[(3'h7):(2'h3)]))) ^~ $unsigned(wire41[(1'h1):(1'h1)]));
          if ((wire41 & ($signed(wire45) < {wire40})))
            begin
              reg51 <= ($unsigned(wire42) | reg49);
              reg52 <= {{wire45, wire44[(3'h5):(2'h2)]},
                  $unsigned($unsigned(wire45))};
              reg53 <= (reg47[(4'hc):(4'hc)] ? reg50 : wire40);
              reg54 <= ({wire40[(4'ha):(2'h2)]} ?
                  {(((!wire43) ?
                          (^~wire43) : $signed(wire42)) << $unsigned(reg50[(4'h8):(3'h4)])),
                      {({reg53, reg53} ?
                              (reg51 ? wire44 : reg50) : $unsigned(reg52)),
                          wire43[(2'h2):(1'h0)]}} : wire40[(3'h4):(1'h0)]);
            end
          else
            begin
              reg51 <= {(|$unsigned((~|reg53)))};
              reg52 <= $unsigned(({reg54[(2'h2):(1'h0)],
                      ((~reg51) ^ (wire43 == wire41))} ?
                  reg51 : $signed($unsigned((reg50 ^~ wire45)))));
              reg53 <= (!wire45[(2'h2):(1'h1)]);
              reg54 <= reg53[(5'h13):(3'h5)];
              reg55 <= $signed(($signed(wire46[(1'h1):(1'h0)]) ?
                  reg52[(4'ha):(1'h1)] : (~^(^~((8'ha3) < reg52)))));
            end
        end
      else
        begin
          if (((~&wire43) ?
              ($signed((reg52 ?
                  (reg53 >>> reg52) : $unsigned(wire42))) & (~$unsigned($unsigned((8'hb0))))) : $unsigned($unsigned({(wire43 ?
                      wire45 : (8'ha7)),
                  (~|(8'had))}))))
            begin
              reg47 <= {$unsigned(reg51[(4'hf):(4'h8)])};
              reg48 <= $unsigned((reg48 ^~ (((reg47 <= reg52) ?
                      {wire44, (8'hbe)} : (reg52 ? reg54 : wire44)) ?
                  {$signed(reg50)} : (wire46 ?
                      (&wire40) : ((8'ha0) ? wire44 : wire44)))));
              reg49 <= (^(reg48[(3'h7):(3'h7)] >= {$signed(reg49),
                  (~^$signed(reg50))}));
              reg50 <= $signed(wire46[(3'h7):(2'h2)]);
              reg51 <= reg55[(2'h2):(2'h2)];
            end
          else
            begin
              reg47 <= $unsigned({$unsigned(((reg54 != reg51) != reg55[(4'h8):(1'h0)])),
                  reg54[(3'h5):(1'h0)]});
            end
          if ((wire41 ?
              $signed((~|$unsigned({wire43}))) : $unsigned($signed(($signed(wire44) >> wire46[(4'h9):(3'h6)])))))
            begin
              reg52 <= (reg54 ?
                  ((&wire41[(1'h1):(1'h0)]) <<< $signed({(~^wire45)})) : {(^($signed(reg54) ?
                          (reg54 ? (7'h44) : wire43) : (wire45 << reg47))),
                      (!$unsigned(wire42))});
            end
          else
            begin
              reg52 <= (wire40[(3'h7):(2'h3)] > wire42[(4'h9):(1'h1)]);
              reg53 <= (-$signed(wire46[(3'h7):(3'h7)]));
              reg54 <= (wire46 || reg54);
              reg55 <= $unsigned(wire44);
            end
          reg56 <= reg49;
          reg57 <= (+$signed($unsigned($signed(wire45[(5'h10):(3'h7)]))));
          if (reg47)
            begin
              reg58 <= wire41[(4'hb):(3'h7)];
              reg59 <= wire46;
              reg60 <= reg52;
              reg61 <= $signed(reg57);
              reg62 <= $signed((~|(reg50[(1'h0):(1'h0)] * wire40)));
            end
          else
            begin
              reg58 <= ((($signed(wire42) ?
                  $unsigned(reg51) : $signed(reg50)) << $signed(reg59)) <<< ($unsigned((wire45[(4'ha):(1'h0)] ?
                  $unsigned(reg56) : reg50[(5'h11):(5'h11)])) - (!wire43[(2'h3):(1'h0)])));
              reg59 <= reg50[(5'h11):(4'hd)];
              reg60 <= {reg62, reg48};
              reg61 <= ((^~$unsigned($unsigned($signed(reg50)))) >= ($unsigned($unsigned($unsigned((7'h40)))) << $signed($unsigned((reg62 ?
                  reg50 : (8'hbb))))));
            end
        end
      reg63 <= $unsigned((((~^reg48) == (|$signed((8'ha6)))) ?
          (~^reg51) : $unsigned(wire43[(3'h4):(2'h3)])));
    end
  assign wire64 = reg58;
  always
    @(posedge clk) begin
      reg65 <= $signed(wire44);
      if (reg61[(5'h10):(5'h10)])
        begin
          reg66 <= (~|{reg54, (|reg56[(3'h7):(1'h1)])});
          reg67 <= reg57[(4'he):(4'hc)];
          if ((((reg50 ?
                      ($signed(reg60) ^~ (&reg59)) : $unsigned($signed(reg67))) ?
                  reg67[(4'he):(3'h6)] : wire41[(4'h8):(3'h5)]) ?
              ((+reg60) && (((reg48 ? wire44 : reg59) ?
                      {wire46, wire44} : wire43) ?
                  (^(+reg53)) : (^reg52))) : $signed(((8'hb6) ?
                  (&{reg61}) : ((reg47 ? reg51 : reg59) << reg65)))))
            begin
              reg68 <= (~&(^((8'haf) ?
                  ($signed(reg57) <<< $signed((8'hbd))) : ($signed((8'haa)) ?
                      $signed(wire41) : (+(8'h9e))))));
              reg69 <= (reg56 ?
                  (+$signed(wire64[(4'h9):(4'h9)])) : reg68[(4'ha):(4'h9)]);
              reg70 <= (8'hb1);
              reg71 <= reg67;
            end
          else
            begin
              reg68 <= ($unsigned({(!reg68[(4'h9):(3'h5)])}) - {(^~reg53[(4'ha):(1'h0)]),
                  (8'ha7)});
              reg69 <= $unsigned((reg71 <= ((reg60[(1'h1):(1'h0)] ?
                      (8'h9d) : reg59) ?
                  reg49[(5'h10):(4'he)] : reg59[(3'h5):(1'h1)])));
              reg70 <= ($signed(reg60) != (reg56 | $signed(reg59[(4'hf):(1'h1)])));
            end
          reg72 <= reg61[(1'h1):(1'h0)];
          if ((~((reg55[(3'h5):(3'h5)] ^ $unsigned($signed(reg61))) ?
              reg62 : (((^~reg49) ?
                      (reg59 ? reg58 : reg61) : $unsigned(wire44)) ?
                  ((wire46 >= wire44) ?
                      reg51[(4'hc):(1'h1)] : (reg56 == (7'h42))) : $unsigned({wire46})))))
            begin
              reg73 <= (8'hac);
              reg74 <= (!$signed((wire44 && reg59)));
              reg75 <= ($signed((reg67 <= reg52)) ?
                  $signed({(!{reg61, reg47})}) : reg57[(2'h3):(2'h2)]);
              reg76 <= ({(reg53[(4'hf):(4'he)] ?
                          ((+reg63) ?
                              (wire42 > reg70) : reg50) : $signed($signed(reg61)))} ?
                  $signed((|($signed(reg73) ?
                      $signed(wire46) : ((8'hb6) ?
                          reg62 : reg49)))) : $signed((^~{$unsigned(reg60)})));
            end
          else
            begin
              reg73 <= $signed(((~$unsigned(wire40[(1'h1):(1'h1)])) - $unsigned(reg75[(4'ha):(2'h3)])));
              reg74 <= reg73[(4'h8):(2'h2)];
              reg75 <= reg67[(4'ha):(2'h2)];
              reg76 <= (reg56 - (&$unsigned($signed(reg75[(4'h9):(3'h7)]))));
            end
        end
      else
        begin
          reg66 <= (-($unsigned($unsigned(wire45)) != reg58[(4'hd):(2'h2)]));
          if (((&$signed((|((8'haa) < wire46)))) ? reg76 : {reg73}))
            begin
              reg67 <= reg69[(4'h9):(4'h9)];
              reg68 <= reg60[(1'h1):(1'h1)];
            end
          else
            begin
              reg67 <= {(8'hbf)};
              reg68 <= ({$unsigned((reg69 || (reg53 ? reg48 : reg52))), reg75} ?
                  {{reg74}} : reg74);
              reg69 <= reg55;
              reg70 <= (reg65[(3'h5):(1'h0)] ?
                  reg49 : $unsigned(wire40[(4'hd):(4'ha)]));
            end
          reg71 <= wire45[(1'h1):(1'h0)];
          if ((&(~&$signed((wire41 * reg59[(2'h2):(2'h2)])))))
            begin
              reg72 <= reg71;
              reg73 <= wire44;
              reg74 <= reg57;
            end
          else
            begin
              reg72 <= (({{(wire46 ? reg61 : reg58), {(8'hae)}},
                  $signed({reg70, reg56})} > {reg57}) == ($signed(((reg56 ?
                      reg56 : (8'ha1)) ?
                  reg63 : wire43)) && {(8'h9c),
                  ((reg49 > (8'hbc)) ^ ((8'ha6) != wire64))}));
              reg73 <= ($signed(($unsigned((reg50 ? reg59 : reg74)) > (~^{reg62,
                  reg76}))) || $unsigned({reg57[(5'h12):(3'h6)], reg60}));
            end
          reg75 <= reg65[(4'h9):(1'h0)];
        end
      reg77 <= $signed($signed($signed($unsigned($unsigned(reg74)))));
      reg78 <= ((~&($unsigned((reg73 ?
              reg54 : reg47)) >>> ($unsigned(reg56) <<< $signed(reg48)))) ?
          ({reg70, $signed(reg48[(2'h2):(2'h2)])} ?
              $signed(reg54[(1'h1):(1'h1)]) : wire40) : wire44[(4'he):(4'h9)]);
      reg79 <= $unsigned(({$unsigned(wire42[(4'h9):(3'h7)]),
              wire41[(3'h6):(3'h6)]} ?
          wire64[(4'hb):(4'hb)] : $signed(reg47)));
    end
  assign wire80 = (~|$signed((((reg53 ~^ wire40) ^~ wire41) * ((&(8'h9e)) > ((8'haa) ?
                      reg59 : reg72)))));
  assign wire81 = (-reg67);
  assign wire82 = ((~&reg53[(4'hf):(1'h0)]) < ($unsigned({reg70[(1'h0):(1'h0)],
                      (8'ha4)}) <<< reg68));
  assign wire83 = (reg74[(4'h8):(3'h5)] ?
                      (&(~^$signed(wire42[(4'h9):(3'h7)]))) : {((!$signed(reg70)) + $unsigned(((7'h43) ?
                              reg49 : wire81))),
                          {(8'haf)}});
  assign wire84 = {$signed(($unsigned({wire44}) != (reg76 ^~ (wire43 >>> reg68))))};
  assign wire85 = (~$unsigned((~^$unsigned(wire44[(4'ha):(2'h2)]))));
  assign wire86 = ((8'hb0) ^~ $signed($signed(($unsigned(reg60) ?
                      {(8'hb4), wire41} : $unsigned(wire83)))));
  assign wire87 = (~&({(reg59 ?
                          $unsigned(reg72) : $unsigned(reg50))} || reg72[(1'h0):(1'h0)]));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  assign y = {wire27, wire26, wire24, wire23, wire22, reg25, (1'h0)};
  assign wire22 = wire19[(3'h7):(3'h6)];
  assign wire23 = wire21[(4'he):(3'h5)];
  assign wire24 = $unsigned($signed((($signed(wire20) ?
                      (8'hbb) : wire19[(2'h3):(1'h1)]) <<< wire23)));
  always
    @(posedge clk) begin
      reg25 <= (8'ha2);
    end
  assign wire26 = $signed((wire20 && $signed($signed($unsigned(wire18)))));
  assign wire27 = reg25[(1'h1):(1'h0)];
endmodule
