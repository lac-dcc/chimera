module top
#(parameter param167 = (~&({(((7'h40) - (8'hb8)) ? ((8'hb8) ? (7'h40) : (8'ha6)) : (-(8'hb3))), ((~&(7'h40)) ? {(8'ha2)} : {(8'ha7)})} ? ({((8'ha7) ? (8'ha6) : (8'hb3))} + (~&(~(8'hba)))) : ((|(~^(8'h9f))) != {((8'hbd) > (8'hb9)), ((8'h9f) << (8'h9d))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire165;
  wire [(4'hd):(1'h0)] wire164;
  wire [(4'ha):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire160;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire signed [(3'h6):(1'h0)] wire111;
  wire signed [(5'h12):(1'h0)] wire80;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire154;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire160,
                 wire158,
                 wire157,
                 wire156,
                 wire111,
                 wire80,
                 wire5,
                 wire4,
                 wire154,
                 (1'h0)};
  assign wire4 = $signed($unsigned((($signed(wire1) == {wire1}) > wire2)));
  assign wire5 = $signed(wire4[(4'hf):(3'h7)]);
  module6 #() modinst81 (.wire9(wire1), .wire7(wire2), .wire8(wire3), .clk(clk), .y(wire80), .wire10(wire4));
  module82 #() modinst112 (wire111, clk, wire80, wire4, wire0, wire2, wire3);
  module113 #() modinst155 (.clk(clk), .wire115(wire1), .wire114(wire5), .wire117(wire0), .wire116(wire80), .y(wire154), .wire118(wire2));
  assign wire156 = (wire154 ^ $signed(wire2));
  assign wire157 = (7'h41);
  module53 #() modinst159 (.clk(clk), .wire55(wire156), .wire54(wire154), .wire57(wire157), .y(wire158), .wire56(wire80));
  module11 #() modinst161 (wire160, clk, wire154, wire4, wire157, wire111);
  assign wire162 = $signed({wire0[(4'h8):(3'h5)]});
  assign wire163 = $signed($signed({$unsigned($signed(wire160)), wire3}));
  assign wire164 = wire157[(2'h3):(1'h0)];
  assign wire165 = (($signed({$signed(wire5), wire111}) * wire3) ?
                       (wire3[(4'hd):(4'hc)] ?
                           wire160 : wire163[(4'h9):(1'h1)]) : (&(|(^~wire156))));
  assign wire166 = $unsigned({wire3[(4'ha):(4'h9)]});
endmodule

module module113
#(parameter param153 = (!((|{((8'h9c) ? (7'h41) : (8'hbe))}) ^~ {(+((8'hbe) ^~ (7'h40))), (8'hbd)})))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire118;
  input wire [(2'h2):(1'h0)] wire117;
  input wire signed [(5'h12):(1'h0)] wire116;
  input wire signed [(2'h3):(1'h0)] wire115;
  input wire [(3'h4):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire150;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire [(2'h3):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire139,
                 wire138,
                 wire137,
                 wire130,
                 wire129,
                 wire120,
                 wire119,
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
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  assign wire119 = wire115;
  assign wire120 = (wire115 ?
                       ({(~^wire116[(4'hf):(1'h0)])} ?
                           (wire118[(1'h0):(1'h0)] ?
                               wire118 : $signed((wire115 ?
                                   (8'hb3) : wire118))) : {({(7'h44), wire116} ?
                                   (wire115 ?
                                       wire118 : wire115) : (wire117 <<< (8'haa))),
                               $signed(wire115[(1'h0):(1'h0)])}) : {($signed((~wire119)) ?
                               ($unsigned(wire116) & (~^wire116)) : ((8'hb2) ?
                                   $signed(wire115) : (wire118 ?
                                       wire118 : wire119))),
                           $unsigned(wire119[(3'h6):(1'h0)])});
  always
    @(posedge clk) begin
      reg121 <= (~|(({(wire117 ?
              wire116 : wire118)} && wire118[(1'h1):(1'h0)]) >= ((wire115 ?
          (wire117 ? wire114 : wire118) : wire114) <<< $unsigned((wire119 ?
          wire119 : wire116)))));
      if ($unsigned((wire117 <= $signed((7'h42)))))
        begin
          reg122 <= wire117;
          reg123 <= {reg121, wire117};
          if ({wire116,
              (($unsigned((wire115 ?
                  wire120 : (8'hb6))) != $signed((8'ha1))) | $signed(({wire118,
                      wire117} ?
                  wire114[(2'h2):(1'h1)] : ((8'ha0) ^ wire117))))})
            begin
              reg124 <= {reg121};
            end
          else
            begin
              reg124 <= $unsigned({reg121[(1'h0):(1'h0)],
                  (~|($signed(reg123) << reg121[(4'hd):(1'h0)]))});
            end
        end
      else
        begin
          reg122 <= ((8'ha4) || ((^wire118[(2'h2):(1'h0)]) | ($unsigned((wire119 & wire119)) ?
              (-(~reg123)) : (wire117 ^ $unsigned(reg123)))));
          reg123 <= ((^~reg122) ? (8'hb9) : wire116);
          reg124 <= $signed($signed($unsigned($unsigned((wire120 ?
              wire115 : reg121)))));
          reg125 <= $signed($signed({wire118,
              ((wire119 ? (8'ha1) : reg123) ?
                  wire117[(2'h2):(1'h0)] : (reg121 ? (8'hbd) : wire114))}));
          if ((wire114[(1'h1):(1'h1)] ?
              $unsigned((({reg123, wire114} >> (wire117 ~^ reg122)) ?
                  wire117[(1'h1):(1'h0)] : wire118)) : (((8'hb7) - (reg123[(1'h0):(1'h0)] ?
                      reg124 : $unsigned(reg124))) ?
                  reg124 : $signed((reg125[(2'h2):(1'h1)] ?
                      wire118 : {wire117})))))
            begin
              reg126 <= (~&$signed($unsigned($signed($signed(wire117)))));
            end
          else
            begin
              reg126 <= (~^wire119[(3'h4):(2'h3)]);
              reg127 <= reg123[(3'h4):(1'h1)];
            end
        end
      reg128 <= (8'ha8);
    end
  assign wire129 = wire117[(2'h2):(1'h0)];
  assign wire130 = (^~$unsigned($unsigned((!$unsigned((8'h9c))))));
  always
    @(posedge clk) begin
      reg131 <= ($signed($unsigned(((wire130 ? reg122 : (8'hb6)) <<< (reg126 ?
          reg121 : reg123)))) > {reg128});
      reg132 <= {(~|wire120[(1'h0):(1'h0)])};
      if ($unsigned(reg123))
        begin
          reg133 <= reg128[(1'h0):(1'h0)];
          if (((&$unsigned(wire129)) ?
              (~^$signed(reg123)) : (^(reg126[(1'h0):(1'h0)] * $unsigned(wire117[(1'h0):(1'h0)])))))
            begin
              reg134 <= $signed({(|(~&{reg121, wire115})),
                  (wire120[(1'h0):(1'h0)] && {$signed(wire117)})});
              reg135 <= (+(^$signed((~|(wire116 || reg121)))));
            end
          else
            begin
              reg134 <= reg127;
            end
          reg136 <= $signed(wire115);
        end
      else
        begin
          reg133 <= ((reg124[(2'h2):(1'h1)] ? wire119 : (8'hbe)) >= (~|reg127));
          reg134 <= reg132[(1'h1):(1'h0)];
          reg135 <= reg131;
        end
    end
  assign wire137 = (wire130 >>> wire119);
  assign wire138 = $signed(reg134);
  assign wire139 = reg123[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg140 <= wire137[(1'h0):(1'h0)];
      if ({$unsigned(reg140)})
        begin
          if ($unsigned(reg140[(2'h3):(1'h0)]))
            begin
              reg141 <= reg132[(1'h1):(1'h1)];
              reg142 <= {{(~&($unsigned((8'hbd)) ?
                          $unsigned(reg127) : (wire114 ? reg131 : reg133)))},
                  reg123[(1'h0):(1'h0)]};
              reg143 <= ((!$unsigned(reg132)) ?
                  $unsigned((!((reg126 > reg121) ?
                      $signed(wire114) : ((8'hbe) <<< wire118)))) : $unsigned((({(8'had)} ?
                          (-wire119) : {(8'hb6)}) ?
                      $signed($unsigned(reg124)) : ((reg133 != wire139) ?
                          (reg125 ?
                              reg132 : reg142) : wire119[(1'h0):(1'h0)]))));
              reg144 <= (~({(~^reg140[(3'h6):(2'h2)]),
                      {$signed((8'hb4)), reg128}} ?
                  $signed(wire138[(4'h9):(4'h8)]) : $unsigned(wire129)));
              reg145 <= $signed((~&$unsigned($signed((reg136 ?
                  reg140 : wire115)))));
            end
          else
            begin
              reg141 <= $unsigned($unsigned({$signed(reg123),
                  wire129[(2'h2):(1'h1)]}));
              reg142 <= $unsigned(($unsigned(reg122[(1'h1):(1'h1)]) >>> (reg145[(3'h4):(1'h1)] && {((8'haf) ?
                      reg141 : (8'haf)),
                  $signed(reg145)})));
              reg143 <= (~^$unsigned((^~{$unsigned(reg136)})));
              reg144 <= {(-$unsigned((~((8'hbe) >> reg123)))),
                  {{(^(reg122 ? wire117 : wire138)),
                          (~&(wire120 ? reg135 : wire116))}}};
            end
          reg146 <= ((~reg131[(1'h1):(1'h1)]) > (~&((reg140[(2'h3):(1'h1)] + (wire115 ^~ reg145)) <<< $unsigned({wire117}))));
          if ((((wire116[(2'h3):(1'h1)] || $unsigned((~reg136))) ?
              reg136[(4'ha):(3'h6)] : (&reg124)) <<< (-reg126[(3'h4):(2'h3)])))
            begin
              reg147 <= $unsigned(reg140[(2'h2):(2'h2)]);
              reg148 <= $signed((+$unsigned((~|wire118))));
            end
          else
            begin
              reg147 <= ($signed($signed($unsigned((reg126 == reg124)))) ?
                  wire115 : ((wire118 ?
                      wire120 : $signed(wire137)) && $signed(reg123[(1'h0):(1'h0)])));
            end
          reg149 <= ($unsigned((reg136 ?
                  $unsigned(reg127[(5'h11):(3'h5)]) : ($unsigned((8'hbc)) == (wire137 ?
                      reg127 : reg128)))) ?
              (!{{$unsigned(reg134), $signed(wire114)},
                  wire129}) : $unsigned(reg133[(4'hc):(1'h1)]));
        end
      else
        begin
          if ($unsigned($signed(($unsigned(reg147[(3'h6):(3'h4)]) ?
              (((8'hb9) ? reg145 : reg146) ?
                  ((8'hb5) ?
                      (8'ha9) : wire117) : (~^wire139)) : reg121[(5'h11):(4'he)]))))
            begin
              reg141 <= ((|(wire129[(1'h0):(1'h0)] || reg145)) <= ($signed($signed($signed(reg147))) + (~&(~^(-wire114)))));
              reg142 <= (~^$signed($unsigned($unsigned(reg133[(1'h1):(1'h1)]))));
              reg143 <= (~{((~|(~^wire138)) ?
                      $unsigned(reg136[(3'h6):(3'h5)]) : (wire130 >>> $unsigned(wire138))),
                  ({reg127[(1'h1):(1'h0)]} || $signed((^(8'ha1))))});
              reg144 <= $unsigned(((|(-(reg136 || (8'hbc)))) | (reg136[(4'hc):(4'h9)] ?
                  ((wire117 >>> (8'h9e)) ?
                      $signed(reg134) : (^reg143)) : (+(reg141 ?
                      reg142 : wire137)))));
              reg145 <= $unsigned(((^reg124) - (~^$unsigned(reg142))));
            end
          else
            begin
              reg141 <= (8'hb0);
              reg142 <= $unsigned(reg133[(3'h4):(1'h0)]);
            end
          reg146 <= $unsigned(((~$signed($signed(reg146))) - ({(wire114 >> wire117)} ?
              ((-reg131) >>> (wire139 ? reg135 : reg122)) : reg133)));
        end
    end
  assign wire150 = $signed($unsigned({$unsigned(reg144[(4'hb):(3'h6)])}));
  assign wire151 = (((8'hb8) <= $signed(((reg125 ? reg134 : wire130) ?
                       reg140[(2'h3):(2'h2)] : (reg144 << reg123)))) << $signed({reg146[(3'h7):(1'h0)]}));
  assign wire152 = (wire118 | $signed((({reg128, reg122} ^ (reg121 ?
                       wire150 : reg142)) ~^ $unsigned((reg124 > (8'ha1))))));
endmodule

module module82
#(parameter param110 = {(~^(8'hba)), (^(~(^~((8'hbc) ? (7'h40) : (8'h9e)))))})
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire87;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire signed [(4'hc):(1'h0)] wire85;
  input wire [(4'hb):(1'h0)] wire84;
  input wire signed [(4'hd):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire signed [(4'hd):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'ha):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire94,
                 wire90,
                 wire89,
                 wire88,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire88 = {(8'ha6)};
  assign wire89 = ($unsigned(((!$signed(wire85)) ?
                      ({wire84} && $signed(wire84)) : (8'ha4))) & $signed((+$unsigned($signed((8'hbb))))));
  assign wire90 = ((^~(!{wire86})) || (((wire84[(4'h8):(3'h7)] ?
                              ((8'h9d) == wire85) : wire85[(2'h3):(2'h3)]) ?
                          $signed((~wire85)) : $unsigned((+wire84))) ?
                      wire85[(3'h6):(2'h2)] : $signed($unsigned(((8'ha2) || wire85)))));
  always
    @(posedge clk) begin
      reg91 <= $signed($unsigned((8'ha2)));
      reg92 <= (+(~&(wire87 != wire85)));
      reg93 <= (~$unsigned((^~$signed((~(8'ha1))))));
    end
  assign wire94 = wire86;
  always
    @(posedge clk) begin
      if ((wire90 + wire87))
        begin
          reg95 <= $unsigned(((~((+reg92) || $signed(wire94))) > {$unsigned($unsigned(wire87))}));
          reg96 <= ((^$unsigned(((wire94 <= reg93) << (reg91 ?
                  wire89 : wire85)))) ?
              (~&(~|$signed((wire84 <= wire90)))) : wire90[(3'h4):(2'h2)]);
        end
      else
        begin
          reg95 <= $signed(wire83);
        end
      reg97 <= (~^wire90[(2'h3):(1'h0)]);
      reg98 <= ((8'ha1) ?
          $signed(($unsigned($unsigned((8'ha4))) >>> wire89)) : wire87);
    end
  assign wire99 = $unsigned(wire90[(4'hf):(4'he)]);
  assign wire100 = ($signed($unsigned((^reg92))) ?
                       {(wire89 | wire89[(4'h8):(2'h2)])} : (!(+wire85[(2'h2):(2'h2)])));
  assign wire101 = wire89;
  assign wire102 = $unsigned($unsigned((reg98 ?
                       $signed($signed(wire99)) : $unsigned((wire101 | wire101)))));
  assign wire103 = (^~$unsigned($unsigned(((~&wire94) >>> (+wire90)))));
  assign wire104 = $signed(wire85[(2'h3):(1'h1)]);
  assign wire105 = (({$signed($signed(wire102)),
                           {{(8'ha4), wire87}}} <= wire88) ?
                       ($unsigned(wire83) && $signed($signed($signed(wire102)))) : ({{(wire99 & reg97)},
                               (8'ha6)} ?
                           $signed((wire87 || (wire90 ?
                               wire99 : wire99))) : (!$unsigned($signed(reg96)))));
  assign wire106 = wire104;
  assign wire107 = wire87;
  assign wire108 = wire84[(2'h3):(1'h0)];
  assign wire109 = $signed({(|reg92), reg95});
endmodule

module module6
#(parameter param78 = {((((^~(7'h40)) ? (|(8'ha7)) : ((8'ha8) ^ (8'hbc))) ? ((8'hbd) ~^ ((8'hbc) > (8'ha2))) : (~&((8'h9c) >= (8'hb9)))) * ({(&(8'hb4))} ? {((8'hbc) < (8'hb7)), ((8'hbc) ? (8'h9d) : (8'hbd))} : ((^~(8'hb2)) ^~ ((8'hbf) | (8'haa)))))}, 
parameter param79 = (~|(~^(param78 ? param78 : param78))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire76;
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  assign y = {wire38,
                 wire40,
                 wire50,
                 wire51,
                 wire52,
                 wire76,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 (1'h0)};
  module11 #() modinst39 (.y(wire38), .wire13(wire9), .clk(clk), .wire15(wire8), .wire14(wire7), .wire12(wire10));
  assign wire40 = (wire9 ?
                      $unsigned({$signed($unsigned((8'hb7)))}) : ((&(8'haf)) ?
                          {(~^(wire7 ? (8'hb7) : wire8))} : wire7));
  always
    @(posedge clk) begin
      reg41 <= wire7;
      if ($signed(reg41[(3'h7):(2'h3)]))
        begin
          if ($signed(wire7[(3'h6):(2'h3)]))
            begin
              reg42 <= (~&wire40[(3'h4):(2'h3)]);
              reg43 <= ($signed(reg41[(2'h2):(1'h0)]) ?
                  (wire40[(4'hd):(4'h8)] ?
                      wire40[(4'he):(3'h4)] : (~^wire9)) : {((~&$signed(wire10)) ?
                          reg42[(1'h1):(1'h1)] : (wire40[(4'ha):(3'h4)] ?
                              wire10[(3'h6):(3'h4)] : (wire10 < wire10))),
                      reg42});
              reg44 <= $signed((&(!{(~wire9), $signed(reg43)})));
            end
          else
            begin
              reg42 <= (~^$signed(((&$unsigned(reg42)) ?
                  (wire7 ?
                      wire10[(2'h2):(1'h1)] : (&wire10)) : wire9[(4'h9):(3'h5)])));
              reg43 <= reg44;
              reg44 <= ((wire10[(2'h2):(1'h1)] ?
                      (reg42 * $signed($signed(wire38))) : (wire7 ?
                          (^~(~|(7'h40))) : $signed($signed(wire38)))) ?
                  (^$unsigned($unsigned(wire7))) : ($signed($unsigned(reg42[(4'h8):(3'h7)])) ?
                      ($signed($signed(reg41)) ^~ $signed((reg42 ?
                          wire10 : wire40))) : $signed(({wire10} ?
                          (8'h9d) : reg42))));
              reg45 <= ($signed(({wire9[(4'h8):(3'h7)]} ?
                  $signed((~^reg42)) : {wire38[(2'h3):(1'h1)],
                      $signed(wire8)})) - $unsigned(($unsigned((wire7 ?
                      (8'had) : (8'h9c))) ?
                  $signed($signed(reg42)) : wire9[(2'h2):(1'h0)])));
              reg46 <= ((reg42 ?
                  ((~|{(8'h9f)}) ?
                      (((8'hbe) ?
                          wire9 : wire40) ~^ (reg45 ^ wire7)) : ((reg42 ?
                              wire7 : reg42) ?
                          wire8 : (+wire10))) : (($unsigned((8'hb8)) ?
                      wire8[(1'h1):(1'h0)] : (~^reg44)) * ($unsigned(wire38) ?
                      reg44 : reg45))) != wire10);
            end
          reg47 <= $signed($unsigned((wire10 * {(wire38 ? reg45 : reg45),
              reg42[(4'hb):(1'h0)]})));
        end
      else
        begin
          reg42 <= ((!(&wire10[(3'h5):(1'h1)])) < reg47);
          reg43 <= (({{wire38, $unsigned(reg41)}} * wire7) ?
              reg43 : ($signed((!reg47[(2'h2):(1'h1)])) > ((wire7[(3'h6):(3'h5)] > ((8'hba) ~^ wire9)) ^~ (-(reg47 >> reg46)))));
          if ($unsigned(((~^reg45[(3'h6):(3'h6)]) * $unsigned(reg47[(4'hb):(1'h1)]))))
            begin
              reg44 <= (8'hba);
              reg45 <= reg45[(3'h4):(2'h3)];
              reg46 <= {wire40[(3'h6):(1'h0)]};
            end
          else
            begin
              reg44 <= $unsigned(($unsigned(reg45[(3'h5):(3'h4)]) ?
                  reg44 : wire38));
              reg45 <= $unsigned((~$unsigned((wire8 | (~^reg42)))));
              reg46 <= $signed($signed(((&(~|reg43)) | wire38)));
            end
          reg47 <= $signed(reg45);
        end
      reg48 <= ((wire9 ? $unsigned($signed(reg41[(3'h7):(3'h7)])) : reg46) ?
          reg47 : {$unsigned($signed((+wire40))),
              {$unsigned((reg41 ? reg41 : wire38)), {(|wire38)}}});
      reg49 <= $unsigned($unsigned((8'ha3)));
    end
  assign wire50 = {reg45[(3'h5):(3'h5)]};
  assign wire51 = (~(wire38 ?
                      (wire50 ?
                          ({wire40, wire38} ?
                              (wire38 != wire50) : $signed(reg46)) : ((reg48 ?
                                  reg42 : wire40) ?
                              {reg49} : (~^(8'h9c)))) : ((+{reg48,
                          wire40}) >= ({wire7} >>> {(8'h9c)}))));
  assign wire52 = reg49;
  module53 #() modinst77 (wire76, clk, reg49, reg42, wire8, reg46);
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(2'h2):(1'h0)] wire55;
  input wire [(2'h2):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire58;
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg59,
                 (1'h0)};
  assign wire58 = $signed(wire55[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg59 <= {wire54[(1'h0):(1'h0)]};
    end
  assign wire60 = wire54[(2'h2):(2'h2)];
  assign wire61 = $unsigned((^(~|wire55)));
  assign wire62 = $unsigned(wire61);
  assign wire63 = $unsigned(wire57);
  assign wire64 = $unsigned($signed($unsigned(wire63[(3'h7):(2'h2)])));
  assign wire65 = (+(^(($unsigned(wire63) <<< $signed(wire58)) ^~ wire57)));
  assign wire66 = wire55;
  always
    @(posedge clk) begin
      reg67 <= wire61;
      reg68 <= {$signed(($signed((8'hb6)) ~^ reg67)), $signed($signed(wire65))};
      if (((8'hba) ? {{{(reg68 ? reg68 : reg59)}}} : wire64))
        begin
          if ($unsigned(wire61))
            begin
              reg69 <= wire57;
              reg70 <= $unsigned(reg59[(4'hd):(4'h9)]);
            end
          else
            begin
              reg69 <= ((7'h40) <= reg67[(1'h1):(1'h1)]);
              reg70 <= ({wire60, wire58} + wire60);
              reg71 <= $signed((+$unsigned($unsigned(reg69))));
              reg72 <= $unsigned($unsigned(reg59));
              reg73 <= (8'ha2);
            end
          reg74 <= {(&$unsigned({$unsigned(wire58)})), reg71};
        end
      else
        begin
          reg69 <= (wire60[(2'h2):(1'h0)] ?
              {reg70, reg74} : reg67[(3'h4):(3'h4)]);
          reg70 <= (wire62 >= (8'hb5));
          reg71 <= reg70;
        end
      reg75 <= $unsigned((+(($signed(reg69) * $unsigned(reg69)) ?
          (~^wire64[(2'h2):(2'h2)]) : $signed($unsigned(reg71)))));
    end
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire16;
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg35,
                 reg34,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire16 = {wire13};
  assign wire17 = $signed($signed((($unsigned(wire16) ?
                          $signed(wire13) : $signed(wire16)) ?
                      ($unsigned(wire14) ?
                          (wire15 >> wire16) : (8'hbd)) : $unsigned((wire13 ?
                          wire14 : wire15)))));
  assign wire18 = {{(|(~|$signed(wire15)))}};
  assign wire19 = wire17;
  assign wire20 = (wire17[(2'h2):(1'h1)] * (8'hae));
  assign wire21 = (+wire18);
  assign wire22 = ($unsigned($signed((~^wire14[(3'h6):(3'h5)]))) ?
                      wire17[(1'h0):(1'h0)] : (8'ha9));
  assign wire23 = (wire14[(4'ha):(2'h3)] || (~&(wire16[(1'h0):(1'h0)] <= (wire13 ?
                      wire18 : wire15))));
  assign wire24 = $unsigned($signed($signed(wire21)));
  assign wire25 = $signed(wire24);
  assign wire26 = ((^((~|(wire17 <<< wire22)) ?
                          (~&(wire15 && wire23)) : {(|wire14), (8'had)})) ?
                      wire20 : wire13);
  assign wire27 = {$signed($unsigned(($signed((7'h42)) ^~ (wire16 ?
                          wire19 : wire16)))),
                      (-wire18[(1'h0):(1'h0)])};
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire13);
      reg29 <= $signed(wire14);
    end
  assign wire30 = (8'hbf);
  assign wire31 = ((~&wire23) ?
                      $unsigned(wire18[(2'h3):(1'h1)]) : $unsigned((((~wire17) ?
                          (!(8'ha8)) : (wire24 ?
                              reg28 : wire17)) < {wire13[(1'h1):(1'h1)],
                          (wire19 ? (8'hb7) : wire21)})));
  assign wire32 = $unsigned(wire23[(3'h7):(3'h5)]);
  assign wire33 = $signed($unsigned(wire26[(4'ha):(3'h7)]));
  always
    @(posedge clk) begin
      reg34 <= (wire18 + wire12);
      reg35 <= reg29[(3'h6):(3'h6)];
    end
  assign wire36 = $signed($signed($unsigned((!{reg34}))));
  assign wire37 = wire13;
endmodule
