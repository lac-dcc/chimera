module top
#(parameter param167 = ((-(~&((~^(8'ha4)) != (-(8'hae))))) ? (!{(((8'hae) & (8'hb8)) ? ((8'hb8) ? (8'ha8) : (8'hb6)) : (-(8'ha6))), (~((8'hae) || (8'hb9)))}) : (8'had)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire [(5'h13):(1'h0)] wire164;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire121;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire162;
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(4'hc):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire90,
                 wire29,
                 wire95,
                 wire96,
                 wire113,
                 wire114,
                 wire119,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire162,
                 reg120,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  module5 #() modinst30 (.y(wire29), .clk(clk), .wire9(wire0), .wire6(wire3), .wire7(wire1), .wire8(wire4), .wire10(wire2));
  module31 #() modinst91 (wire90, clk, wire0, wire2, wire1, wire29, wire4);
  always
    @(posedge clk) begin
      reg92 <= (~&$signed(wire1));
      reg93 <= (((~&($unsigned(wire90) - wire1[(3'h7):(3'h5)])) ?
              $unsigned($unsigned((~wire29))) : $unsigned(wire2)) ?
          $unsigned((&({reg92} > wire29))) : (8'hb7));
      reg94 <= (|$unsigned(reg93));
    end
  assign wire95 = (|wire90[(4'h9):(4'h8)]);
  assign wire96 = (!wire3);
  always
    @(posedge clk) begin
      reg97 <= ($signed(wire90[(4'h9):(3'h4)]) > ($unsigned(((wire1 & wire90) > (~wire1))) ?
          (($signed(wire90) == $unsigned(wire96)) << (wire95[(3'h5):(2'h2)] ?
              (wire96 ?
                  wire95 : reg92) : reg94)) : (~|$unsigned($unsigned(wire95)))));
      reg98 <= ($signed($unsigned($unsigned(((8'hab) ^~ (8'h9e))))) ?
          $unsigned((($unsigned(reg94) && $unsigned(wire96)) > $signed((wire29 ?
              wire96 : wire90)))) : $unsigned(wire90));
      reg99 <= reg93;
      reg100 <= wire95[(2'h2):(2'h2)];
      reg101 <= (((~$signed($signed(reg93))) <= wire3[(4'he):(1'h0)]) && ($unsigned({wire4,
          reg94[(1'h0):(1'h0)]}) >= (!(~wire90[(4'hf):(3'h7)]))));
    end
  always
    @(posedge clk) begin
      reg102 <= (((8'hba) ?
          {$signed($unsigned(reg97)), reg92} : (wire95[(4'hd):(4'ha)] ?
              (8'ha9) : ($unsigned(reg93) ?
                  $signed(reg98) : $unsigned((8'had))))) >= reg99);
      if ($unsigned((&$unsigned($unsigned((reg92 * wire2))))))
        begin
          reg103 <= $unsigned((!$signed((~|wire29))));
          reg104 <= $signed((7'h42));
        end
      else
        begin
          if ((((+$unsigned({(8'haf)})) || reg93[(3'h6):(3'h6)]) && {(+wire96[(2'h3):(2'h3)])}))
            begin
              reg103 <= ($signed((reg99 << reg92)) ?
                  reg100[(2'h2):(1'h1)] : {$signed(($signed(reg92) ?
                          (~&reg100) : reg103[(2'h2):(1'h1)]))});
              reg104 <= wire95[(2'h3):(1'h1)];
              reg105 <= {wire4[(2'h2):(2'h2)]};
              reg106 <= $signed(reg97[(3'h5):(3'h4)]);
            end
          else
            begin
              reg103 <= $unsigned(reg93);
              reg104 <= (~|({(reg99[(1'h1):(1'h0)] ?
                          {reg104} : (wire96 ? reg99 : (8'ha6))),
                      ({reg103} ? {wire95} : $signed(reg97))} ?
                  wire96 : $unsigned($unsigned((!reg105)))));
              reg105 <= reg104[(2'h3):(2'h2)];
              reg106 <= (&$signed($signed(((reg106 || wire2) > reg106[(5'h11):(3'h7)]))));
            end
          reg107 <= $signed($unsigned(wire4[(3'h4):(2'h2)]));
        end
      reg108 <= wire29;
      if ($signed($unsigned(wire3[(4'hd):(1'h0)])))
        begin
          reg109 <= $unsigned(wire0[(4'hc):(1'h0)]);
          reg110 <= reg93;
          if (wire1)
            begin
              reg111 <= (~|reg107);
              reg112 <= reg109[(2'h2):(1'h1)];
            end
          else
            begin
              reg111 <= reg111[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg109 <= (reg93 != ((-(+{wire90})) >>> (~^((reg106 - wire3) ?
              $signed(reg99) : $signed(reg112)))));
        end
    end
  assign wire113 = $unsigned(($signed($unsigned(wire96)) != reg102));
  assign wire114 = ((reg110 ?
                           reg108[(3'h6):(1'h0)] : $unsigned((~$signed(reg101)))) ?
                       reg111 : ((~$unsigned(reg106[(4'he):(2'h2)])) ?
                           ({(reg101 <<< reg103), (-reg92)} - {(reg109 ?
                                   wire29 : wire3)}) : (8'ha4)));
  always
    @(posedge clk) begin
      reg115 <= (^~$signed(($unsigned(wire96) ?
          $unsigned((reg94 >>> reg104)) : reg108)));
    end
  always
    @(posedge clk) begin
      reg116 <= {(reg104[(3'h6):(3'h5)] | ($unsigned($signed((7'h43))) && ({(8'ha6),
              reg106} & wire1))),
          ($signed(((wire90 ? wire90 : (8'ha8)) ?
                  $unsigned((8'ha6)) : {reg107, reg106})) ?
              reg107[(1'h0):(1'h0)] : $unsigned({$unsigned(reg98)}))};
      reg117 <= wire96;
      reg118 <= (~|$unsigned({(~(reg92 <<< reg97)), ((8'ha1) && (^~wire113))}));
    end
  assign wire119 = {(($unsigned((reg99 ^~ (8'haf))) ?
                               reg106 : reg93[(4'hc):(4'ha)]) ?
                           {$signed($unsigned(reg115))} : ($unsigned($signed(reg93)) ?
                               (|reg109[(2'h2):(1'h0)]) : $signed((wire96 ?
                                   reg103 : reg109))))};
  always
    @(posedge clk) begin
      reg120 <= (&$signed((8'h9e)));
    end
  assign wire121 = (reg110 - ((wire114 >> wire0[(5'h12):(3'h4)]) ?
                       {(8'hbe), (&(wire1 ? reg112 : (8'hbe)))} : reg106));
  assign wire122 = reg120;
  assign wire123 = $signed(reg111[(2'h2):(2'h2)]);
  assign wire124 = $signed(reg109[(2'h3):(1'h0)]);
  assign wire125 = ($unsigned($unsigned((wire4[(3'h7):(3'h6)] > (wire114 >>> wire114)))) >= $signed($unsigned($signed((reg92 != (8'h9e))))));
  module126 #() modinst163 (wire162, clk, reg107, wire90, reg100, reg99, reg94);
  assign wire164 = ($unsigned($unsigned($signed({wire114,
                       reg115}))) * $unsigned(wire124[(1'h0):(1'h0)]));
  assign wire165 = (8'hb5);
  assign wire166 = (+$signed($unsigned(wire124[(4'hc):(1'h1)])));
endmodule

module module126  (y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire131;
  input wire signed [(4'hf):(1'h0)] wire130;
  input wire signed [(4'h9):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire128;
  input wire [(5'h14):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire158;
  wire [(4'h9):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire141;
  wire [(4'ha):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(5'h14):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire signed [(4'ha):(1'h0)] wire132;
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire134,
                 wire133,
                 wire132,
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
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire132 = (~{wire127[(4'he):(3'h7)]});
  assign wire133 = $signed($unsigned((wire129[(4'h8):(3'h5)] < $signed((wire131 ?
                       wire129 : wire128)))));
  assign wire134 = (wire127 ?
                       ($unsigned($signed($unsigned(wire129))) ?
                           $signed($signed($signed(wire128))) : $unsigned((~&(wire131 ?
                               (7'h43) : wire130)))) : ((~|($signed(wire127) ~^ {wire131})) >> ((-$unsigned(wire128)) && (~&(wire133 - wire128)))));
  always
    @(posedge clk) begin
      reg135 <= wire134[(4'hb):(3'h6)];
      reg136 <= $unsigned({((-$unsigned(wire133)) + wire131[(3'h4):(2'h2)])});
    end
  assign wire137 = $unsigned((~^(^$signed(wire128[(2'h3):(1'h0)]))));
  assign wire138 = wire131;
  assign wire139 = $unsigned(wire130);
  assign wire140 = wire129;
  assign wire141 = (wire132[(3'h7):(1'h1)] ? wire139 : reg136);
  assign wire142 = (wire131[(1'h1):(1'h1)] && ({$signed((wire129 ?
                               wire127 : wire133)),
                           (~|$unsigned((8'ha2)))} ?
                       ($unsigned($unsigned(wire137)) ?
                           ({wire131} || $unsigned(wire132)) : wire130) : reg136[(3'h6):(3'h6)]));
  assign wire143 = (+(wire137 & $signed((~|(reg135 ? (8'hb4) : (8'had))))));
  assign wire144 = wire132[(4'ha):(3'h4)];
  assign wire145 = $unsigned((+(7'h42)));
  always
    @(posedge clk) begin
      if (($signed($signed($signed($unsigned(reg135)))) ?
          ($signed((~&(wire140 ? wire130 : wire128))) ?
              wire129[(3'h7):(3'h5)] : (($unsigned(wire128) >= (wire132 ?
                      (8'hb9) : wire138)) ?
                  wire133[(1'h0):(1'h0)] : $unsigned((wire133 ^ wire140)))) : ($signed($signed((wire128 + wire127))) ?
              (^~{$signed((8'ha2))}) : $unsigned($signed($signed(wire138))))))
        begin
          reg146 <= $unsigned(($signed((|(~&wire139))) ?
              ((wire139[(2'h2):(2'h2)] <<< ((8'hab) <= wire131)) ?
                  $signed((~|wire145)) : {((8'ha3) ?
                          wire128 : wire131)}) : ($unsigned((wire129 ?
                  wire128 : (8'ha0))) < $signed(wire138[(3'h4):(2'h2)]))));
          if ($signed($unsigned(wire131)))
            begin
              reg147 <= (~&(8'ha7));
              reg148 <= $signed((wire132[(4'h8):(3'h6)] + {$unsigned({wire141})}));
              reg149 <= (~((8'ha1) ?
                  (wire141[(3'h5):(2'h2)] < ({reg135, wire127} ?
                      (reg135 ?
                          wire137 : wire145) : $signed(wire131))) : reg148[(4'h9):(2'h3)]));
              reg150 <= ({($unsigned((reg136 ? wire127 : reg135)) ?
                          (reg135[(2'h2):(1'h1)] ?
                              $unsigned(wire129) : $unsigned(wire134)) : $unsigned($unsigned(wire141)))} ?
                  wire140[(2'h2):(1'h1)] : wire143);
            end
          else
            begin
              reg147 <= reg149[(4'hb):(3'h4)];
              reg148 <= wire130;
              reg149 <= ((wire132 ?
                      ((wire141 ? (^reg147) : (8'h9c)) ?
                          $signed({reg136}) : $signed($signed(wire132))) : ({$signed(wire139)} ?
                          ($signed((8'hab)) ?
                              wire130[(3'h4):(3'h4)] : (^~(8'hb4))) : reg149[(2'h3):(1'h1)])) ?
                  $unsigned((&{$unsigned(wire133)})) : (wire137 ?
                      (^~(reg146[(2'h3):(1'h1)] | (reg135 >> wire137))) : $signed(wire134[(4'hd):(3'h4)])));
            end
          reg151 <= (^reg147[(3'h7):(1'h0)]);
          reg152 <= (^~reg135);
          reg153 <= reg149[(4'h9):(2'h3)];
        end
      else
        begin
          reg146 <= (wire129 ^ wire137[(3'h4):(2'h3)]);
          reg147 <= reg146;
        end
    end
  always
    @(posedge clk) begin
      reg154 <= reg146[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg155 <= {(wire131 & ({wire141} ?
              $unsigned((wire133 ? reg150 : reg150)) : {(reg146 + reg147)}))};
      reg156 <= (((~&$signed((wire134 ? (8'ha6) : reg135))) ?
              (($unsigned(wire137) ?
                  $unsigned((7'h44)) : $signed(reg136)) >> ((wire138 * (8'hb5)) ?
                  wire141 : $signed(wire128))) : reg135) ?
          $signed($unsigned({(wire140 >>> reg148),
              {reg146}})) : $unsigned(($signed((wire129 >= wire139)) ?
              (~$signed((8'hb4))) : {$signed(reg148)})));
    end
  assign wire157 = (((((reg154 != reg135) ? {wire133} : (reg155 - reg155)) ?
                       wire131 : $unsigned((wire139 ?
                           reg149 : wire133))) > (($signed(wire132) ?
                           $unsigned(wire129) : {reg135}) ?
                       wire133 : $unsigned((reg147 ?
                           (8'hbe) : (8'hb3))))) < ((|$signed(wire144)) <= $signed(wire139[(1'h0):(1'h0)])));
  assign wire158 = $unsigned(reg149[(3'h5):(3'h4)]);
  assign wire159 = (|{reg149, (8'ha8)});
  assign wire160 = $signed((wire140 >>> (^~wire157)));
  assign wire161 = ((~&(reg147[(2'h2):(2'h2)] ?
                           reg151[(4'hd):(4'hd)] : ($unsigned(reg155) ~^ (~wire143)))) ?
                       (~&{$unsigned(wire127)}) : (&$unsigned({reg151[(2'h2):(1'h0)]})));
endmodule

module module31  (y, clk, wire32, wire33, wire34, wire35, wire36);
  output wire [(32'h237):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(5'h14):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(5'h15):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire61;
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire79,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire37,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire50,
                 wire61,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg49,
                 (1'h0)};
  assign wire37 = (8'ha2);
  always
    @(posedge clk) begin
      reg38 <= wire32[(4'h8):(1'h1)];
      if ((!$unsigned(wire34[(5'h12):(4'hc)])))
        begin
          reg39 <= wire32[(4'ha):(3'h7)];
          reg40 <= (-(-$signed($unsigned((8'hbe)))));
        end
      else
        begin
          reg39 <= (((^(wire36 ?
                  $unsigned((8'hbb)) : $unsigned(wire37))) - $unsigned(wire36)) ?
              wire32 : $signed((~|(reg40 < (reg38 != wire37)))));
        end
      reg41 <= (reg39 | wire33);
      reg42 <= $signed(reg39[(3'h4):(2'h2)]);
      reg43 <= wire35;
    end
  assign wire44 = (($unsigned($unsigned((8'hb2))) ?
                      ({$unsigned(wire36), $unsigned(wire33)} ?
                          $signed((^reg42)) : $signed((wire33 >>> reg38))) : $unsigned((^$signed(wire37)))) << reg42);
  assign wire45 = {wire34[(4'he):(4'h9)]};
  assign wire46 = (reg39 ^ {(~|$signed((wire36 != (8'ha8))))});
  assign wire47 = (|$unsigned((+((8'ha5) ? $unsigned(wire46) : (7'h43)))));
  assign wire48 = ({$signed($signed(wire32)),
                      reg42[(4'h8):(3'h7)]} > ((wire45 - ((wire47 ?
                          wire32 : wire36) ?
                      $unsigned(wire46) : wire44)) >>> wire36));
  always
    @(posedge clk) begin
      reg49 <= (wire34 ? reg38 : $signed(wire47));
    end
  assign wire50 = $unsigned($signed($signed($unsigned(reg38[(2'h2):(1'h0)]))));
  module51 #() modinst62 (.wire52(wire45), .clk(clk), .y(wire61), .wire55(reg49), .wire54(wire47), .wire53(wire33));
  assign wire63 = $signed(((reg40[(3'h4):(2'h2)] || reg38) * reg43[(1'h1):(1'h1)]));
  assign wire64 = reg38;
  assign wire65 = wire34;
  assign wire66 = $signed((&wire63[(1'h0):(1'h0)]));
  assign wire67 = $signed(wire35);
  always
    @(posedge clk) begin
      reg68 <= (!(wire67[(1'h1):(1'h1)] ? wire64 : reg43[(1'h0):(1'h0)]));
      reg69 <= $signed($signed(($unsigned({wire46,
          reg49}) >= ((reg41 < reg40) & {reg42}))));
      reg70 <= $unsigned((~&wire45));
      if ($signed(((-wire67) ~^ (~(8'ha3)))))
        begin
          reg71 <= $unsigned((~^$unsigned($unsigned((~&wire35)))));
          reg72 <= wire33;
          if ((((&((wire66 ? reg40 : (8'h9e)) <<< (wire36 ? reg68 : wire65))) ?
              $signed(wire61) : (reg39[(4'ha):(2'h2)] & reg41[(2'h2):(1'h0)])) || {wire34}))
            begin
              reg73 <= $signed($signed(wire48));
              reg74 <= wire37;
              reg75 <= reg39[(4'he):(3'h7)];
            end
          else
            begin
              reg73 <= $unsigned(reg73);
              reg74 <= $unsigned($signed($signed(wire66)));
              reg75 <= $signed(wire61);
              reg76 <= $unsigned($signed({(8'hb7), reg75[(5'h15):(3'h4)]}));
              reg77 <= {{reg69[(1'h0):(1'h0)]}};
            end
          reg78 <= ({($signed($signed(reg49)) != reg72),
                  $signed({$signed(reg49), $signed(reg77)})} ?
              (((~reg42[(1'h1):(1'h1)]) ?
                  ($unsigned(reg76) ?
                      (reg42 ?
                          reg77 : reg41) : $signed(reg74)) : wire66[(4'hd):(4'h8)]) ^ (8'hb0)) : (^$unsigned((+wire36))));
        end
      else
        begin
          reg71 <= $unsigned($unsigned((wire35 && reg76)));
          reg72 <= wire32;
          reg73 <= $unsigned(reg68[(4'hd):(4'h9)]);
          reg74 <= $signed(reg71);
          reg75 <= ((reg41[(5'h10):(4'hd)] ?
              (~^$signed($signed((8'haf)))) : {((wire63 ?
                      (8'hb1) : wire37) | (wire64 & (8'hbf))),
                  $unsigned({wire50, reg72})}) << ($unsigned(((reg75 ?
                  wire45 : reg68) <= wire67)) ?
              (8'hbb) : $unsigned((~|(+wire37)))));
        end
    end
  assign wire79 = $unsigned((~^((^wire44[(4'hd):(1'h0)]) >>> reg78)));
  always
    @(posedge clk) begin
      if ($unsigned($signed(reg40[(1'h0):(1'h0)])))
        begin
          reg80 <= ((8'ha5) ? (wire47 | wire46) : (8'hbc));
          if ((~reg39[(2'h3):(1'h0)]))
            begin
              reg81 <= $unsigned(reg71[(4'he):(4'h8)]);
              reg82 <= (((~{$signed(wire36), wire46}) <= reg69) ?
                  reg78 : ($unsigned(wire45) & wire63[(3'h6):(2'h3)]));
              reg83 <= $unsigned($unsigned((((reg49 != wire48) ?
                      $signed(reg77) : (wire63 ? reg71 : (8'had))) ?
                  (^~(reg49 > reg80)) : reg76[(4'ha):(2'h3)])));
            end
          else
            begin
              reg81 <= (wire63 + ($unsigned((reg68 && wire79)) ?
                  ((8'h9d) ?
                      (8'hb2) : $signed(reg43)) : $signed(((&reg42) & (!reg76)))));
              reg82 <= $signed($signed((reg39[(1'h1):(1'h1)] ?
                  $signed(((8'hb7) > wire63)) : reg71)));
              reg83 <= $signed({(+$unsigned(wire36)),
                  (^~({wire37, wire48} ? (|wire63) : $unsigned(reg73)))});
              reg84 <= {$signed((+$unsigned((reg39 ? reg82 : wire46))))};
            end
          reg85 <= ((&(8'ha3)) ? $signed($unsigned((8'hb3))) : wire63);
          reg86 <= reg69[(2'h3):(2'h3)];
          reg87 <= ($signed(reg40) | $signed((~&((^~wire45) ?
              reg75[(4'he):(2'h2)] : $unsigned(wire66)))));
        end
      else
        begin
          reg80 <= (-($signed(((reg85 ? reg86 : reg74) ?
              reg75 : {(8'hb4), reg77})) != {$signed(wire44[(4'h8):(3'h7)])}));
        end
    end
  assign wire88 = reg39;
  assign wire89 = wire61;
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  assign y = {wire28,
                 wire27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire8[(3'h5):(3'h5)];
      reg12 <= {(~|(((wire8 << wire10) ?
              wire8[(1'h1):(1'h1)] : $unsigned((8'hb1))) << (8'ha2)))};
      if (($unsigned(({wire7[(4'h9):(1'h0)], reg11} ?
          $signed(wire9) : $unsigned(wire9[(3'h7):(1'h1)]))) >= {((^~$unsigned(wire8)) ?
              wire8 : (reg11 ? (8'ha9) : $signed(wire9))),
          $signed($signed((wire8 >= wire9)))}))
        begin
          reg13 <= (8'hb6);
          reg14 <= reg13[(5'h10):(4'ha)];
          reg15 <= $unsigned($signed(wire8[(3'h4):(2'h3)]));
        end
      else
        begin
          if ((|(~&$unsigned(((wire10 ? reg13 : wire9) ?
              (reg14 ? wire8 : wire9) : (&reg15))))))
            begin
              reg13 <= $signed($unsigned(wire8));
              reg14 <= (($unsigned(reg12) ?
                      (((-reg13) != (wire9 || reg15)) | $signed($unsigned(wire6))) : $signed(($signed(wire8) << (~&reg15)))) ?
                  ((-{{wire6, wire6}, (~|reg13)}) ?
                      (|$signed((wire9 ?
                          wire9 : (8'ha8)))) : (^$signed($unsigned(reg15)))) : (reg14[(2'h2):(1'h1)] - $signed($signed((wire10 ^~ wire6)))));
              reg15 <= ((~^wire8[(3'h6):(3'h4)]) >>> wire6[(3'h4):(1'h0)]);
              reg16 <= (~|$signed(((-(wire9 ?
                  wire8 : reg11)) && ($unsigned((8'hb2)) ?
                  (reg14 ? wire7 : reg12) : $unsigned(reg15)))));
            end
          else
            begin
              reg13 <= (~&reg13[(3'h5):(2'h3)]);
            end
          reg17 <= ((8'h9e) ?
              $signed((((~&reg14) ? wire7[(2'h2):(2'h2)] : (~&wire7)) ?
                  ((reg16 ? (8'hbf) : wire8) ?
                      $signed(wire7) : (reg11 ?
                          (8'ha8) : reg12)) : $unsigned({(8'hbd),
                      (8'hb7)}))) : (~^wire9));
          reg18 <= ($unsigned(((-$signed(wire7)) ?
                  ($unsigned(reg14) ^ (-reg17)) : reg14)) ?
              reg14 : (reg14[(2'h2):(1'h0)] << ($signed((reg13 - wire8)) ?
                  reg11 : ((+reg13) ? $signed(wire10) : (8'haa)))));
        end
      if ({$unsigned((wire8[(3'h4):(2'h2)] ?
              $signed((reg16 - reg16)) : {reg11[(3'h5):(2'h2)],
                  (reg11 ? reg17 : reg17)}))})
        begin
          reg19 <= {(8'ha4)};
        end
      else
        begin
          reg19 <= $unsigned((((((8'ha4) ^~ reg16) >> wire8) <= $unsigned((wire8 ^ reg16))) ?
              $unsigned(wire8[(1'h1):(1'h1)]) : (({(8'had)} >= (wire8 & (8'hbc))) ?
                  reg11[(3'h7):(2'h2)] : ({wire7, reg15} ?
                      $unsigned(wire7) : $signed(wire9)))));
        end
      reg20 <= ($unsigned((($signed((8'hba)) >= $signed((8'ha2))) > ($signed(reg13) <<< ((8'hb9) == reg12)))) ^ {(~|($signed(reg16) ?
              (reg14 + reg18) : (reg14 <= (8'hb5)))),
          (~|reg14)});
    end
  always
    @(posedge clk) begin
      reg21 <= wire7;
      reg22 <= $signed({wire10, reg15[(4'h8):(3'h4)]});
      if ($unsigned(reg21))
        begin
          reg23 <= (((reg22[(2'h2):(1'h0)] ?
                  ({wire7} >>> $signed(reg13)) : wire9[(4'hc):(3'h7)]) ?
              $signed((8'ha0)) : (~|reg14[(2'h2):(1'h1)])) == $unsigned((7'h40)));
          reg24 <= $unsigned((reg16 << reg13[(4'he):(4'ha)]));
        end
      else
        begin
          reg23 <= (reg16[(3'h4):(3'h4)] <<< {reg12[(2'h2):(1'h0)]});
        end
      reg25 <= (($signed($signed(reg21[(4'h8):(3'h4)])) & $signed((^~wire6[(1'h1):(1'h0)]))) ?
          (reg16[(3'h7):(1'h1)] == $unsigned($signed(reg11))) : $unsigned(reg11[(3'h7):(3'h7)]));
      reg26 <= reg25[(4'hc):(4'hc)];
    end
  assign wire27 = (+(-(((^~(8'ha5)) < $signed(wire9)) ?
                      $unsigned(((7'h42) & reg11)) : reg11)));
  assign wire28 = {$unsigned(wire8), reg22[(2'h2):(1'h0)]};
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire55;
  input wire [(2'h3):(1'h0)] wire54;
  input wire signed [(4'h8):(1'h0)] wire53;
  input wire [(2'h3):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  assign y = {wire60, wire58, wire57, wire56, reg59, (1'h0)};
  assign wire56 = wire54[(2'h3):(1'h0)];
  assign wire57 = $signed($unsigned(wire53[(3'h5):(3'h5)]));
  assign wire58 = wire52;
  always
    @(posedge clk) begin
      reg59 <= (^(!$signed((^wire54))));
    end
  assign wire60 = $signed(((reg59 ?
                      (wire52[(2'h3):(2'h3)] ?
                          wire52[(1'h0):(1'h0)] : $signed(wire52)) : (~&$signed(wire58))) != $signed(((wire58 | wire57) ?
                      wire56 : wire57))));
endmodule
